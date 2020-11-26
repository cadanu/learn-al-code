table 59120 "Customer Overview"
{
    DataClassification = CustomerContent;
    Caption = 'Customer Overview';



    fields
    {
        field(59100; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No.';
        }
        field(59101; "Customer No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No.';
        }
        field(59102; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
        }
        field(59103; "Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source Code';
        }
        field(59104; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
        }
        field(59105; LastRunDate; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Run Date';
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

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