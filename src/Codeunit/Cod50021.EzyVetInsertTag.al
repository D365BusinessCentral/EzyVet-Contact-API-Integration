codeunit 50021 "EzyVet Insert Tag"
{
    procedure InsertTag(lJSONText: Text; lRecordType: Option New,Modified; var lCount: Integer)
    var
        lEzyVetTag: Record "EzyVet Tag";
        lJSONObject: JsonObject;
        lJSONObject1: JsonObject;
        lJSONObject2: JsonObject;
        lJSONToken: JsonToken;
        lJSONArray: JsonArray;
        i: Integer;
        j: Integer;
    begin
        j := 0;
        lCount := 0;

        lJSONToken.ReadFrom(lJSONText);
        lJSONObject := lJSONToken.AsObject();
        lJSONToken.SelectToken('items', lJSONToken);
        lJSONArray := lJSONToken.AsArray();
        //Process JSON response
        for i := 0 to lJSONArray.Count - 1 do begin
            j += 1;
            lCount += 1;
            lJSONArray.Get(i, lJSONToken);
            lJSONToken.SelectToken('tag', lJSONToken);
            lJSONObject := lJSONToken.AsObject();
            lEzyVetTag.Reset();
            lEzyVetTag.SetRange(id, GetJSONToken(lJSONObject, 'id').AsValue().AsText());
            if not lEzyVetTag.FindFirst() then begin
                lEzyVetTag.Init();
                lEzyVetTag.id := GetJSONToken(lJSONObject, 'id').AsValue().AsText();
                lEzyVetTag.Insert();
            end;
            lEzyVetTag.active := GetJSONToken(lJSONObject, 'active').AsValue().AsText();
            lEzyVetTag.created_at := GetJSONToken(lJSONObject, 'created_at').AsValue().AsText();
            lEzyVetTag.modified_at := GetJSONToken(lJSONObject, 'modified_at').AsValue().AsText();
            lEzyVetTag.name := GetJSONToken(lJSONObject, 'name').AsValue().AsText();
            lEzyVetTag.associated_id := GetJSONToken(lJSONObject, 'associated_id').AsValue().AsText();
            lEzyVetTag.associated_type := GetJSONToken(lJSONObject, 'associated_type').AsValue().AsText();
            lEzyVetTag.category_id := GetJSONToken(lJSONObject, 'category_id').AsValue().AsText();
            lEzyVetTag.created_at_date := EpochConverter.EpochDateTimeToSystemDateTime(GetJSONToken(lJSONObject, 'created_at').AsValue().AsInteger());
            lEzyVetTag.modified_at_date := EpochConverter.EpochDateTimeToSystemDateTime(GetJSONToken(lJSONObject, 'modified_at').AsValue().AsInteger());
            lEzyVetTag.Modify();
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