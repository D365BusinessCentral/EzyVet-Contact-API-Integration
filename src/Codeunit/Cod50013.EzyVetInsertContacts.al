codeunit 50013 "EzyVet Insert Contacts"
{
    procedure InsertContacts(lJSONText: Text; lRecordType: Option New,Modified; var lCount: Integer)
    var
        lEzyVetContact: Record "EzyVet Contacts";
        EpochConverter: Codeunit "EzyVet Epoch Convertor";
        lJSONObject: JsonObject;
        lJSONToken: JsonToken;
        lJSONArray: JsonArray;
        i: Integer;
        j: Integer;
        lContactEntryNo: Integer;
    begin
        j := 0;
        lCount := 0;
        lEzyVetContact.Reset();
        if not lEzyVetContact.findlast() then
            lContactEntryNo := 0
        else
            lContactEntryNo := lEzyVetContact.entry_no;

        lJSONToken.ReadFrom(lJSONText);
        lJSONObject := lJSONToken.AsObject();
        lJSONToken.SelectToken('items', lJSONToken);
        lJSONArray := lJSONToken.AsArray();
        //Process JSON response
        for i := 0 to lJSONArray.Count - 1 do begin
            j += 1;
            lCount += 1;
            lJSONArray.Get(i, lJSONToken);
            lJSONToken.SelectToken('contact', lJSONToken);
            lJSONObject := lJSONToken.AsObject();
            lEzyVetContact.Init();
            lEzyVetContact.entry_no := lContactEntryNo + j;
            lEzyVetContact.Insert();
            lEzyVetContact.id := GetJSONToken(lJSONObject, 'id').AsValue().AsText();
            lEzyVetContact.active := GetJSONToken(lJSONObject, 'active').AsValue().AsText();
            lEzyVetContact.created_at := GetJSONToken(lJSONObject, 'created_at').AsValue().AsText();
            lEzyVetContact.modified_at := GetJSONToken(lJSONObject, 'modified_at').AsValue().AsText();
            lEzyVetContact.ownership_id := GetJSONToken(lJSONObject, 'ownership_id').AsValue().AsText();
            lEzyVetContact.code := GetJSONToken(lJSONObject, 'code').AsValue().AsText();
            lEzyVetContact.first_name := GetJSONToken(lJSONObject, 'first_name').AsValue().AsText();
            lEzyVetContact.last_name := GetJSONToken(lJSONObject, 'last_name').AsValue().AsText();
            lEzyVetContact.business_name := GetJSONToken(lJSONObject, 'business_name').AsValue().AsText();
            lEzyVetContact.is_business := GetJSONToken(lJSONObject, 'is_business').AsValue().AsText();
            lEzyVetContact.is_customer := GetJSONToken(lJSONObject, 'is_customer').AsValue().AsText();
            lEzyVetContact.is_supplier := GetJSONToken(lJSONObject, 'is_supplier').AsValue().AsText();
            lEzyVetContact.is_vet := GetJSONToken(lJSONObject, 'is_vet').AsValue().AsText();
            lEzyVetContact.is_syndicate := GetJSONToken(lJSONObject, 'is_syndicate').AsValue().AsText();
            lEzyVetContact.is_staff_member := GetJSONToken(lJSONObject, 'is_staff_member').AsValue().AsText();
            lEzyVetContact.address_postal := GetJSONToken(lJSONObject, 'address_postal').AsValue().AsText();
            lEzyVetContact.stop_credit := GetJSONToken(lJSONObject, 'stop_credit').AsValue().AsText();
            lEzyVetContact.EzyVet_created_date := EpochConverter.EpochDateTimeToSystemDateTime(GetJSONToken(lJSONObject, 'created_at').AsValue().AsInteger());
            lEzyVetContact.EzyVet_modified_date := EpochConverter.EpochDateTimeToSystemDateTime(GetJSONToken(lJSONObject, 'modified_at').AsValue().AsInteger());
            lEzyVetContact.Record_Inserted_Date := WorkDate();
            if lRecordType = lRecordType::New then
                lEzyVetContact.Is_New_Contact := true;
            if lRecordType = lRecordType::Modified then
                lEzyVetContact.Is_Modified_Contact := true;
            lEzyVetContact.Modify();

        end;
    end;

    local procedure GetJSONToken(JsonObject: JsonObject;
    TokenKey: Text) JsonToken: JsonToken;
    var
    begin
        if not JsonObject.get(TokenKey, JsonToken) then Error('Could not find a token with key %1', TokenKey);
    end;

    var
        gErrorMsgonAddressInsert: Text;
        ContactIntegrationLog: Codeunit EzyVetContactIntegrationLogs;

}

