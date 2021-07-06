codeunit 50019 EzyVetGetConatactsJobQueue
{
    trigger OnRun()
    begin
        //Get Contact Records
        Clear(GetContactInformation);
        GetContactInformation.SetParameters(lEndPoint::Contact, 0, 0, true, true, true);
        GetContactInformation.RetrieveContactInforamtion();

        //Get Address Records
        Clear(GetContactInformation);
        GetContactInformation.SetParameters(lEndPoint::Address, 0, 0, true, true, true);
        GetContactInformation.RetrieveContactInforamtion();

        //Get Country Records
        Clear(GetContactInformation);
        GetContactInformation.SetParameters(lEndPoint::Country, 0, 0, true, true, true);
        GetContactInformation.RetrieveContactInforamtion();
    end;

    var
        GetContactInformation: Codeunit "EzyVet Get Contact Information";
        lEndPoint: Option Contact,Address,Country;

}