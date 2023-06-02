page 50101 OrderPage
{
    Caption = 'Order Page';
    PageType = Card;
    SourceTable = Warehouse;
    ApplicationArea = All;

    layout
    {
        area(content)
        {

            group(General)
            {
                field("Product Name"; SelectedProductName)
                {
                    ApplicationArea = All;
                    TableRelation = Warehouse."Product Code";

                    trigger OnValidate()
                    var
                        WarehouseRec: Record Warehouse;
                    begin
                        if WarehouseRec.Get(SelectedProductName) then
                            SelectedProductName := WarehouseRec."Product Name";
                        SelectedWarehouse := WarehouseRec;
                    end;
                }


                field("Order Quantity"; OrderQuantity)
                {
                    Editable = true;
                }
            }
        }
    }



    actions
    {
        area(Processing)
        {
            action("Order Product")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()

                begin
                    SelectedWarehouse."Stock Level" += OrderQuantity;
                    SelectedWarehouse.Modify(true);
                    Message('Order was send!');
                end;

            }
        }
    }


    protected var
        OrderQuantity: Integer;
        SelectedProductName: Text[50];
        SelectedWarehouse: Record Warehouse;

}