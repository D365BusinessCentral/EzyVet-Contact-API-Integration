codeunit 50014 "EzyVet Insert Address"
{
    procedure InsertAddress(lJSONText: Text; lRecordType: Option New,Modified; var lCount: Integer)
    var
        lEzyVetAddress: Record "EzyVet Address";
        lJSONObject: JsonObject;
        lJSONObject1: JsonObject;
        lJSONObject2: JsonObject;
        lJSONToken: JsonToken;
        lJSONArray: JsonArray;
        i: Integer;
        j: Integer;
        lAddressEntryNo: Integer;
    begin
        j := 0;
        lCount := 0;
        lEzyVetAddress.Reset();
        if not lEzyVetAddress.FindLast() then
            lAddressEntryNo := 0
        else
            lAddressEntryNo := lEzyVetAddress."Entry No.";

        lJSONToken.ReadFrom(lJSONText);
        lJSONObject := lJSONToken.AsObject();
        lJSONToken.SelectToken('items', lJSONToken);
        lJSONArray := lJSONToken.AsArray();
        //Process JSON response
        for i := 0 to lJSONArray.Count - 1 do begin
            j += 1;
            lCount += 1;
            lJSONArray.Get(i, lJSONToken);
            lJSONToken.SelectToken('address', lJSONToken);
            lJSONObject := lJSONToken.AsObject();
            lEzyVetAddress.Init();
            lEzyVetAddress."Entry No." := lAddressEntryNo + j;
            lEzyVetAddress.Insert();
            lEzyVetAddress.id := GetJSONToken(lJSONObject, 'id').AsValue().AsText();
            lEzyVetAddress.active := GetJSONToken(lJSONObject, 'active').AsValue().AsText();
            lEzyVetAddress.created_at := GetJSONToken(lJSONObject, 'created_at').AsValue().AsText();
            lEzyVetAddress.modified_at := GetJSONToken(lJSONObject, 'modified_at').AsValue().AsText();
            lEzyVetAddress.name := GetJSONToken(lJSONObject, 'name').AsValue().AsText();
            lEzyVetAddress.street_1 := GetJSONToken(lJSONObject, 'street_1').AsValue().AsText();
            lEzyVetAddress.street_2 := GetJSONToken(lJSONObject, 'street_2').AsValue().AsText();
            lEzyVetAddress.city := GetJSONToken(lJSONObject, 'city').AsValue().AsText();
            lEzyVetAddress.region := GetJSONToken(lJSONObject, 'region').AsValue().AsText();
            lEzyVetAddress.post_code := GetJSONToken(lJSONObject, 'post_code').AsValue().AsText();
            lEzyVetAddress.state := GetJSONToken(lJSONObject, 'state').AsValue().AsText();
            lEzyVetAddress.country_id := GetJSONToken(lJSONObject, 'country_id').AsValue().AsText();
            lEzyVetAddress.longitude := GetJSONToken(lJSONObject, 'longitude').AsValue().AsText();
            lEzyVetAddress.latitude := GetJSONToken(lJSONObject, 'latitude').AsValue().AsText();
            lEzyVetAddress.Record_Modified_Date := WorkDate();
            lJSONToken.SelectToken('for_resource', lJSONToken);
            lJSONObject1 := lJSONToken.AsObject();
            if lJSONToken.SelectToken('Contact', lJSONToken) then begin
                lJSONObject2 := lJSONToken.AsObject();
                lEzyVetAddress.contact_id := GetJSONToken(lJSONObject2, 'id').AsValue().AsText();
            end;
            //lEzyVetAddress."Country Name" := EzyVetGetCountry.GetCountry(lEzyVetAddress.country_id, gErrorMsgonCountryInsert);
            lEzyVetAddress.Modify();
        end;
    end;

    local procedure GetJSONToken(JsonObject: JsonObject;
    TokenKey: Text) JsonToken: JsonToken;
    var
    begin
        if not JsonObject.get(TokenKey, JsonToken) then Error('Could not find a token with key %1', TokenKey);
    end;

}