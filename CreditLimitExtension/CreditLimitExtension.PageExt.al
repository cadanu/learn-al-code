pageextension 59130 CreditLimitExtension extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("F&unctions")
        {
            action(UpdateCreditLimit)
            {
                CaptionML = ENU = 'Update Credit Limit';
                Image = CalculateCost;
                ApplicationArea = All;


                trigger OnAction()
                begin
                    CallUpdateCreditLimit();

                end;
            }
        }
        // Add changes to page actions here
    }

    local procedure CallUpdateCreditLimit()
    var
        CreditLimitCalculated: Decimal;
        CreditLimitActual: Decimal;
    begin
        CreditLimitCalculated := Rec.CalculateCreditLimit();
        if CreditLimitCalculated = Rec."Credit Limit (LCY)" then begin
            Message(CreditLimitUptoDateTxt);
            exit;
        end;

        if GuiAllowed() then
            if not Confirm(AreYouSureQst, false, Rec.FieldCaption("Credit Limit (LCY)"), CreditLimitCalculated) then
                exit;

        CreditLimitActual := CreditLimitCalculated;
        Rec.UpdateCreditLimit(CreditLimitActual);
        if CreditLimitActual <> CreditLimitCalculated then
            Message(CreditLimitRoundedTxt, CreditLimitActual);
    end;

    var
        AreYouSureQst: Label 'Are you sure that you want to set the %1 to %2?';
        CreditLimitRoundedTxt: Label 'The credit limit was rounded to %1 to comply with company policies';
        CreditLimitUptoDateTxt: Label 'The credit limit is up to date.';
}