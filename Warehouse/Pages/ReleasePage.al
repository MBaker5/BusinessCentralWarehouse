page 50102 ReleasePage
{
    Caption = 'Release Page';
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


                field("Release Quantity"; ReleaseQuantity)
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
            action("Release Product")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()

                begin
                    SelectedWarehouse."Stock Level" -= ReleaseQuantity;

                    if SelectedWarehouse."Stock Level" > 0 then begin
                        SelectedWarehouse.Modify(true);
                        Message('Releasing gone successful.');


                    end else begin
                        Message('You are trying to release more product then you have!');
                    end;

                end;

            }
        }
    }


    protected var
        ReleaseQuantity: Integer;
        SelectedProductName: Text[50];
        SelectedWarehouse: Record Warehouse;

}