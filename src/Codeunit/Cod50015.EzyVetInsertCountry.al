codeunit 50015 "EzyVet Insert Country"
{
    procedure InsertCountry(lJSONText: Text; lRecordType: Option New,Modified; var lCount: Integer)
    var
        lEzyVetCountry: Record "EzyVet Country";
        lJSONObject: JsonObject;
        lJSONObject1: JsonObject;
        lJSONObject2: JsonObject;
        lJSONToken: JsonToken;
        lJSONArray: JsonArray;
        i: Integer;
        j: Integer;
        lCountryEntryNo: Integer;
    begin
        j := 0;
        lCount := 0;
        lEzyVetCountry.Reset();
        if not lEzyVetCountry.FindLast() then
            lCountryEntryNo := 0
        else
            lCountryEntryNo := lEzyVetCountry."Entry No.";

        lJSONToken.ReadFrom(lJSONText);
        lJSONObject := lJSONToken.AsObject();
        lJSONToken.SelectToken('items', lJSONToken);
        lJSONArray := lJSONToken.AsArray();
        //Process JSON response
        for i := 0 to lJSONArray.Count - 1 do begin
            j += 1;
            lCount += 1;
            lJSONArray.Get(i, lJSONToken);
            lJSONToken.SelectToken('country', lJSONToken);
            lJSONObject := lJSONToken.AsObject();
            lEzyVetCountry.Init();
            lEzyVetCountry."Entry No." := lCountryEntryNo + j;
            lEzyVetCountry.Insert();
            lEzyVetCountry.id := GetJSONToken(lJSONObject, 'id').AsValue().AsText();
            lEzyVetCountry.active := GetJSONToken(lJSONObject, 'active').AsValue().AsText();
            lEzyVetCountry.created_at := GetJSONToken(lJSONObject, 'created_at').AsValue().AsText();
            lEzyVetCountry.modified_at := GetJSONToken(lJSONObject, 'modified_at').AsValue().AsText();
            lEzyVetCountry.name := GetJSONToken(lJSONObject, 'name').AsValue().AsText();
            lEzyVetCountry.EzyVet_created_date := EpochConverter.EpochDateTimeToSystemDateTime(GetJSONToken(lJSONObject, 'created_at').AsValue().AsInteger());
            lEzyVetCountry.EzyVet_modified_date := EpochConverter.EpochDateTimeToSystemDateTime(GetJSONToken(lJSONObject, 'modified_at').AsValue().AsInteger());
            lEzyVetCountry.Record_Inserted_Date := WorkDate();
            if lRecordType = lRecordType::New then
                lEzyVetCountry.Is_New_Country := true;
            if lRecordType = lRecordType::Modified then
                lEzyVetCountry.Is_Modified_Country := true;
            lEzyVetCountry.Modify();
        end;
    end;

    local procedure GetJSONToken(JsonObject: JsonObject;
    TokenKey: Text) JsonToken: JsonToken;
    var
    begin
        if not JsonObject.get(TokenKey, JsonToken) then Error('Could not find a token with key %1', TokenKey);
    end;

    var
        gErrorMsgonCountryInsert: Text;
        EpochConverter: Codeunit "EzyVet Epoch Convertor";
}