page 50103 NewProductPage
{
    Caption = 'New Product Page';
    PageType = Card;
    SourceTable = Warehouse;
    ApplicationArea = All;

    layout
    {
        area(content)
        {

            group(General)
            {
                field("Product Code"; NewProductCode)
                {
                    ApplicationArea = All;
                }
                field("Product Name"; NewProductName)
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
            action("Add New Product")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                var
                    WarehouseRec: Record Warehouse;

                begin

                    WarehouseRec."Product Code" := NewProductCode;
                    WarehouseRec."Product Name" := NewProductName;
                    WarehouseRec.Insert();
                    Message('You added new product to list!');

                end;
            }
        }
    }


    protected var
        NewProductCode: Code[20];
        NewProductName: Text[50];


}