page 59113 "Armstrong Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Armstrong Card';

    layout
    {
        area(Content)
        {
            // group(GroupName)
            // {
            //     // field(theInt; myInt)
            //     // {
            //     //     ApplicationArea = All;

            // }
        }
    }
    // }

    // actions
    // {
    //     area(Processing)
    //     {
    //         action(ActionName)
    //         {
    //             ApplicationArea = All;

    //             trigger OnAction()
    //             begin

    //             end;
    //         }
    //     }
    // }

    var
        myInt: Integer;

    trigger OnOpenPage()
    var
        ArmstrongList: List of [Integer];
        Counter1: Integer;
        Counter2: Integer;
        CounterText: Text[5];
        Number: Integer;
        PowerNumber: Integer;
        Result: Integer;
        ArmstrongNumbers: Text;
    begin
        for Counter1 := 1 to 10000 do begin
            CounterText := Format(Counter1);
            Evaluate(PowerNumber, CopyStr(CounterText, StrLen(CounterText), 1));

            for Counter2 := 1 to StrLen(CounterText) do begin
                Evaluate(Number, CopyStr(CounterText, Counter2, 1));
                Result := Result + Power(Number, PowerNumber);
            end;

            if Result = Counter1 then
                ArmstrongList.Add(Result);
            Clear(Result);
        end;

        foreach Counter1 in ArmstrongList do
            ArmstrongNumbers := ArmstrongNumbers + Format(Counter1) + '\';

        Message(ArmstrongNumbers);

    end;
}