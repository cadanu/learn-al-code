codeunit 59114 "Validations"
{
    trigger OnRun()
    begin
        Message('Hello World');

    end;

    var

    local procedure CheckForPlusSign(TextToVerify: Text)
    var
        IndexPos: Integer;
    // IntToText: Text;
    begin
        // IntToText := Format(IndexPos);
        IndexPos := StrPos(TextToVerify, '+');


        if IndexPos > 0 then
            If Confirm('Are you sure you want to add a new address.') then
                Message('OK')
            else
                Message('Cancel')
        else
            Message('Just checking');

    end;

    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnBeforeValidateEvent', 'Address', false, false)]
    local procedure OnBeforeValidateAddress(Rec: Record Customer; xRec: Record Customer)
    begin
        if xRec."No." <> Rec."No." then
            CheckForPlusSign(Rec.Address);

    end;
}