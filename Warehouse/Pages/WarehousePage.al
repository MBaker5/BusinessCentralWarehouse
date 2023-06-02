page 50100 WarehouseManagementList
{
    Caption = 'Warehouse Stock List';
    PageType = List;
    SourceTable = Warehouse;
    UsageCategory = Lists;
    ApplicationArea = All;
    ModifyAllowed = false;
    DeleteAllowed = true;

    layout
    {
        area(content)
        {

            repeater(General)
            {

                field("Product Code"; Rec."Product Code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Product Name"; Rec."Product Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Stock Level"; Rec."Stock Level")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Order")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Page.Run(50101);
                end;
            }

            action("Release")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Page.Run(50102);
                end;
            }

            action("Add New Product")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Page.Run(50103);
                end;
            }
        }
    }
}