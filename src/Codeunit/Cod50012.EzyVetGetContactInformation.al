codeunit 50012 "EzyVet Get Contact Information"
{
    procedure RetrieveContactInforamtion()
    begin
        //Check Setups
        gConnectionThershold := 75;
        ContactIntegrationLog.InsertLogs(StrSubstNo('%1 API Setups check started', FORMAT(gEndPoint)), 'SUCCESS');
        ContactAPIIntegration.CheckSetup(gErrorMsgonSetups);
        if gErrorMsgonSetups = '' then
            ContactIntegrationLog.InsertLogs(StrSubstNo('%1  API Setups check finished', FORMAT(gEndPoint)), 'SUCCESS')
        else begin
            ContactIntegrationLog.InsertLogs(gErrorMsgonSetups, 'ERROR');
            exit;
        end;

        //Get Access Token
        ContactIntegrationLog.InsertLogs('Retrieve API Access Token is initiated', 'SUCCESS');
        ContactAPIIntegration.GetAccessToken(gAccessToken, gErrorMsgonAccessTokenRetrieval);
        if gErrorMsgonAccessTokenRetrieval = '' then
            ContactIntegrationLog.InsertLogs('Retrieve API Access Token is completed', 'SUCCESS')
        else begin
            ContactIntegrationLog.InsertLogs(gErrorMsgonAccessTokenRetrieval, 'ERROR');
            exit;
        end;

        //Assign Filters
        If gIsAuto then begin
            APIConfiguration.Get();
            if gEndPoint = gEndPoint::Contact then begin
                gURL := APIConfiguration.contact_endpoint_url;
                if APIConfiguration.last_contact_retrieval_date = 0 then
                    gFromDate := 0
                else
                    gFromDate := APIConfiguration.last_contact_retrieval_date;
            end;

            if gEndPoint = gEndPoint::Address then begin
                gURL := APIConfiguration.address_endpoint_url;
                if APIConfiguration.last_address_retrieval_date = 0 then
                    gFromDate := 0
                else
                    gFromDate := APIConfiguration.last_address_retrieval_date;
            end;

            if gEndPoint = gEndPoint::Country then begin
                gURL := APIConfiguration.country_endpoint_url;
                if APIConfiguration.last_country_retrieval_date = 0 then
                    gFromDate := 0
                else
                    gFromDate := APIConfiguration.last_country_retrieval_date;
            end;

            if gEndPoint = gEndPoint::Tag then begin
                gURL := APIConfiguration.tag_endpoint_url;
                if APIConfiguration.last_tag_retrieval_date = 0 then
                    gFromDate := 0
                else
                    gFromDate := APIConfiguration.last_tag_retrieval_date;
            end;
            gToDate := EpochConverter.SystemDateTimeToEpochDateTime(CurrentDateTime);
        end;

        gfilters := StrSubstNo('{">=":%1,"<=":%2}', gFromDate, gToDate);

        //Retrieve New Records
        if gGetNewRecords then begin
            Clear(gRecordsCount);
            ContactIntegrationLog.InsertLogs(StrSubstNo('Checking for new %1 is initiated', Format(gEndPoint)), 'SUCCESS');
            ContactAPIIntegration.GetPageList(gAccessToken, gRecordType::New, gFilters, gTotalPageCount, gURL, gErrorMsgonPagesCount);
            if gErrorMsgonPagesCount = '' then
                ContactIntegrationLog.InsertLogs(StrSubstNo('%1 pages retrieved for new %2', gTotalPageCount, gEndPoint), 'SUCCESS')
            else begin
                ContactIntegrationLog.InsertLogs(gErrorMsgonPagesCount, 'ERROR');
                exit;
            end;

            if gTotalPageCount >= 1 then begin
                ContactIntegrationLog.InsertLogs(StrSubstNo('New %1 Retrieval started', Format(gEndPoint)), 'SUCCESS');
                GetRecordList(gRecordType::New, gFromDate, gToDate, gURL, gErrorMsgonContactInsert);
                if gErrorMsgonContactInsert = '' then
                    ContactIntegrationLog.InsertLogs(StrSubstNo('%1 new %2 retrieved', gRecordsCount, gEndPoint), 'SUCCESS')
                else begin
                    ContactIntegrationLog.InsertLogs(gErrorMsgonContactInsert, 'ERROR');
                    exit;
                end;
            end;
        end;

        //Retrieve Modified Records
        if gGetModifiedRecords then begin
            Clear(gRecordsCount);
            Clear(gTotalPageCount);
            Clear(gErrorMsgonPagesCount);
            if gFromDate <> 0 then begin
                ContactIntegrationLog.InsertLogs('Checking for modified Contacts is initiated ', 'SUCCESS');
                ContactAPIIntegration.GetPageList(gAccessToken, gRecordType::Modified, gFilters, gTotalPageCount, gURL, gErrorMsgonPagesCount);
                if gErrorMsgonPagesCount = '' then
                    ContactIntegrationLog.InsertLogs(StrSubstNo('%1 pages retrieved for modified %2', gTotalPageCount, Format(gEndPoint)), 'SUCCESS')
                else begin
                    ContactIntegrationLog.InsertLogs(gErrorMsgonPagesCount, 'ERROR');
                    exit;
                end;

                if gTotalPageCount >= 1 then begin
                    ContactIntegrationLog.InsertLogs(StrSubstNo('Modified %1 Retrieval started', Format(gEndPoint)), 'SUCCESS');
                    GetRecordList(gRecordType::Modified, gFromDate, gToDate, gurl, gErrorMsgonContactInsert);
                    if gErrorMsgonContactInsert = '' then
                        ContactIntegrationLog.InsertLogs(StrSubstNo('%1 modified %2 retrieved', gRecordsCount, Format(gEndPoint)), 'SUCCESS')
                    else begin
                        ContactIntegrationLog.InsertLogs(gErrorMsgonContactInsert, 'ERROR');
                        exit;
                    end;
                end;
            end;
        end;

        if gIsAuto then begin
            if gEndPoint = gEndPoint::Contact then
                APIConfiguration.last_contact_retrieval_date := gToDate;
            if gEndPoint = gEndPoint::Address then
                APIConfiguration.last_Address_retrieval_date := gToDate;
            if gEndPoint = gEndPoint::Country then
                APIConfiguration.last_Country_retrieval_date := gToDate;
            if gEndPoint = gEndPoint::Tag then
                APIConfiguration.last_tag_retrieval_date := gToDate;

            APIConfiguration.Modify();
        end;

    end;

    local procedure GetRecordList(lRecordType: Option New,Modified; lFromDate: Integer; lToDate: integer; lURL: text; var lErrorMsgonContactInsert: Text)
    var
        lhttpClient: HttpClient;
        lhttpContent: HttpContent;
        lhttpHeaders: HttpHeaders;
        lhttpResponseMessage: HttpResponseMessage;
        lresponseText: Text;
        lFilters: Text;
        APIConfiguration: Record "EzyVet API Configuration";
        i: Integer;
        j: Integer;
        lRecordsCount: Integer;

    begin
        APIConfiguration.Get();
        i := 0;
        gPageCount := 0;
        lRecordsCount := 0;
        gStopLoop := false;
        if gTotalPageCount > gConnectionThershold then
            gTimesofCalls := Round(gTotalPageCount / gConnectionThershold, 1, '>')
        else
            gTimesofCalls := 1;
        repeat
            j += 1;
            gPageCount += gConnectionThershold;
            repeat
                i += 1;
                if lRecordType = lRecordType::New then
                    lFilters := 'limit=200&' + StrSubstNo('page=%1&', i) + 'created_at=' + gfilters;
                if lRecordType = lRecordType::Modified then
                    lFilters := 'limit=200&' + StrSubstNo('page=%1&', i) + 'modified_at=' + gfilters;

                Clear(lhttpContent);
                Clear(lhttpClient);
                Clear(lhttpResponseMessage);
                Clear(lresponseText);
                lhttpClient.DefaultRequestHeaders.Add('Authorization', 'Bearer ' + FORMAT(gAccessToken));
                if lhttpClient.Get(lURL + lFilters, lhttpResponseMessage) then begin
                    lhttpResponseMessage.Content.ReadAs(lresponseText);
                    if gEndPoint = gEndPoint::Contact then
                        InsertContacts.InsertContacts(lresponseText, lRecordType, lRecordsCount);
                    if gEndPoint = gEndPoint::Address then
                        InsertAddress.InsertAddress(lresponseText, lRecordType, lRecordsCount);
                    if gEndPoint = gEndPoint::Country then
                        InsertCountry.InsertCountry(lresponseText, lRecordType, lRecordsCount);
                    if gEndPoint = gEndPoint::Tag then
                        InsertTag.InsertTag(lresponseText, lRecordType, lRecordsCount);

                end else
                    lErrorMsgonContactInsert := FORMAT(lhttpResponseMessage.Content);
                gStopLoop := (i = gPageCount) or (i = gtotalPageCount);
                gRecordsCount += lRecordsCount;
            until gStopLoop = true;

            if not (j = gTimesofCalls) then
                Sleep(60000);
        until j = gTimesofCalls;
    end;

    procedure SetParameters(lEndPoint: Option Contact,Address,Country; lFromDate: Integer; lToDate: Integer; lIsAuto: Boolean; lGetNewRecords: Boolean; lGetModifiedRecords: Boolean)
    begin
        gEndPoint := lEndPoint;
        gFromDate := lFromDate;
        gToDate := lToDate;
        gIsAuto := lIsAuto;
        gGetNewRecords := lGetNewRecords;
        gGetModifiedRecords := lGetModifiedRecords;

    end;

    var
        APIConfiguration: Record "EzyVet API Configuration";
        ContactAPIIntegration: Codeunit "EzyVet Contact API Integration";
        EpochConverter: Codeunit "EzyVet Epoch Convertor";
        InsertContacts: Codeunit "EzyVet Insert Contacts";
        InsertAddress: Codeunit "EzyVet Insert Address";
        InsertCountry: Codeunit "EzyVet Insert Country";
        InsertTag: Codeunit "EzyVet Insert Tag";
        ContactIntegrationLog: Codeunit EzyVetContactIntegrationLogs;
        gFilters: Text;
        gFromDate: Integer;
        gToDate: Integer;
        gTotalPageCount: Integer;
        gPageCount: Integer;
        gStopLoop: Boolean;
        gConnectionThershold: Integer;
        gTimesofCalls: Integer;
        gAccessToken: Text;
        gErrorMsgonAccessTokenRetrieval: text;
        gErrorMsgonContactInsert: Text;
        gErrorMsgonPagesCount: text;
        gErrorMsgonSetups: Text;
        gRecordsCount: Integer;
        gEndPoint: Option Contact,Address,Country,Tag;
        gRecordType: Option New,Modified;
        gURL: Text;
        gIsAuto: Boolean;
        gGetNewRecords: Boolean;
        gGetModifiedRecords: Boolean;
}

