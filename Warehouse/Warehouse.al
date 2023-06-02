table 50100 Warehouse
{
    Caption = 'Warehouse Stock';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Product Code"; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(2; "Product Name"; Text[100])
        {
            DataClassification = CustomerContent;

        }

        field(3; "Stock Level"; Integer)
        {
            DataClassification = CustomerContent;
            InitValue = 0;
        }
    }
    keys
    {
        key(PK; "Product Code")
        {
            Clustered = true;
        }
    }
}