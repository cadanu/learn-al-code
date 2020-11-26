page 59120 "Customer Overview List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Customer Overview";
    Caption = 'Customer Overview List';
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(EntryNo; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field(CustomerNo; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }
                field(CustomerName; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }
                field(SourceCode; Rec."Source Code")
                {
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Import Records")
            {
                Caption = 'Import Records';
                Image = "Import";
                ApplicationArea = All;

                trigger OnAction()
                var
                    UpdateCustomerOverview: Codeunit "Customer Overview Management";
                begin
                    UpdateCustomerOverview.Run();


                end;
            }
        }
    }

    var
        myInt: Integer;
}