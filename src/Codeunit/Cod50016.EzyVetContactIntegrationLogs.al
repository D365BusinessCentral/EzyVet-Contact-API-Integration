codeunit 50016 EzyVetContactIntegrationLogs
{
    procedure InsertLogs(lDescription: Text[500]; lStatus: text)
    var
        lContactsIntegrationLog: Record EzyvetContactsIntegrationLog;
        lEntryNo: Integer;
    begin
        Clear(lEntryNo);
        lContactsIntegrationLog.Reset();
        if lContactsIntegrationLog.FindLast() then
            lEntryNo := lContactsIntegrationLog."Entry No.";

        lContactsIntegrationLog.Init();
        lContactsIntegrationLog."Entry No." := lEntryNo + 1;
        lContactsIntegrationLog.Description := lDescription;
        lContactsIntegrationLog.LogDateTime := CurrentDateTime;
        if lStatus = 'SUCCESS' then
            lContactsIntegrationLog.Status := lContactsIntegrationLog.Status::Success;
        if lStatus = 'ERROR' then
            lContactsIntegrationLog.Status := lContactsIntegrationLog.Status::Error;
        lContactsIntegrationLog.Insert();
    end;
}
