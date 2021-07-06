report 50011 EzyVetGetContactInformation
{
    ApplicationArea = All;
    Caption = 'EzyVetGetContacts';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;
    requestpage
    {
        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(gFromDate; gFromDate)
                    {
                        Caption = 'From Date';
                        ApplicationArea = all;
                    }
                    field(gToDate; gToDate)
                    {
                        Caption = 'To Date';
                        ApplicationArea = all;

                    }
                    field(gGetNewRecords; gGetNewRecords)
                    {
                        Caption = 'Get New Records';
                        ApplicationArea = all;
                    }
                    field(gGetModifiedRecords; gGetModifiedRecords)
                    {
                        Caption = 'Get Modified Records';
                        ApplicationArea = all;
                    }

                }
            }
        }
    }
    trigger OnPostReport()
    begin
        if gGetNewRecords or gGetModifiedRecords then begin
            gEpochFromDate := EPOCHConverter.SystemDateTimeToEpochDateTime(gfromDate);
            gEpochToDate := EPOCHConverter.SystemDateTimeToEpochDateTime(gToDate);
            Clear(GetContactInformation);
            GetContactInformation.SetParameters(gEndPoint, gEpochFromDate, gEpochToDate, false, gGetNewRecords, gGetModifiedRecords);
            GetContactInformation.RetrieveContactInforamtion();
        end else
            Error('Choose either "Get New Records" or "Get Modified Records" option to process');

    end;

    procedure Parameters(lEndPoint: Option Contact,Address,Country)
    begin
        gEndPoint := lEndPoint;
    end;

    var
        gFromDate: DateTime;
        gToDate: DateTime;
        gEpochFromDate: Integer;
        gEpochToDate: Integer;
        EPOCHConverter: Codeunit "EzyVet Epoch Convertor";
        gEndPoint: Option Contact,Address,Country;
        GetContactInformation: Codeunit "EzyVet Get Contact Information";
        gGetNewRecords: Boolean;
        gGetModifiedRecords: Boolean;

}
