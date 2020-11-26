page 59112 "Statements Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Statements Card';

    layout
    {
        area(Content)
        {
            group(Input)
            {
                Caption = 'Input';
                field(Difficulty; Difficulty)
                {
                    Caption = 'Difficulty';
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        GetSuggestion();
                    end;
                }
            }
            group(Output)
            {
                Caption = 'Output';
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Caption = 'Suggestion';
                    Editable = false;
                }
                field(Level; Level)
                {
                    ApplicationArea = All;
                    Caption = 'Level';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        Level: Text[30];
        Suggestion: Text[80];
        Difficulty: Integer;
        MyList: List of [Text];
        MyDictionary: Dictionary of [Code[20], List of [Integer]];

        ThisDate: Date;

    local procedure GetSuggestion()
    begin
        ThisDate := WorkDate();
        Level := '';
        Suggestion := '';

        Case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-learning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study';
                end;
        end;
    end;
}