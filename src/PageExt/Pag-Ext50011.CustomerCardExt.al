pageextension 50011 CustomerCardExt extends "Customer Card"
{
    actions
    {
        addlast(navigation)
        {
            action(EzyVetTags)
            {
                ApplicationArea = all;
                RunObject = page "EzyVet Customer Tag";
                RunPageLink = "Customer No." = field("No.");
                Image = Register;
            }
        }
    }

}
