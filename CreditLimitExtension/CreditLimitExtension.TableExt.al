tableextension 59130 CreditLimitExtension extends Customer
{
    fields
    {
        // field(1; MyField; Integer)
        // {
        //     DataClassification = ToBeClassified;
        // }
    }

    keys
    {
        // key(PK; MyField)
        // {
        // }
    }

    procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    begin
        NewCreditLimit := Round(NewCreditLimit, 10000);
        Rec.Validate("Credit Limit (LCY)", NewCreditLimit);
        Rec.Modify();
    end;

    procedure CalculateCreditLimit() returnValue: Decimal
    var
        Cust: Record Customer;
    begin
        Cust := Rec;
        Cust.SetRange("Date Filter", CalcDate('<-12M>', WorkDate()), WorkDate());
        Cust.CalcFields("Sales (LCY)", "Balance (LCY)");
        exit(Round(Cust."Sales (LCY)" * 0.5));
    end;


    var
        myInt: Integer;

    trigger OnInsert()
    begin
    end;

    trigger OnModify()
    begin
    end;

    trigger OnDelete()
    begin
    end;

    trigger OnRename()
    begin
    end;

}