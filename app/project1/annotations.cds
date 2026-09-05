using srv_AppleProducts as service from '../../srv/appleentity-srv';
annotate service.appleProducts with @(
    UI.SelectionFields : [
        ID,
        name,
        price,
        stock,
        discount,
        Status,
        StatusCriticality,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
        },
        {
            $Type : 'UI.DataField',
            Value : Price_After_Discount,
            Label : 'Price_After_Discount',
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
        },
        {
            $Type : 'UI.DataField',
            Value : netstock,
            Label : 'netstock',
        },
        {
            $Type : 'UI.DataField',
            Value : soldstock,
            Label : 'soldstock',
        },
        {
            $Type : 'UI.DataField',
            Value : StatusCriticality,
        },
    ],
    UI.HeaderInfo : {
        TypeName : 'Apple Product details',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : ID,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : 'This is the Apple product details',
        },
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Product Details',
            ID : 'ProductDetails',
            Target : '@UI.FieldGroup#ProductDetails',
        },
    ],
    UI.FieldGroup #ProductDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Value : discount,
            },
            {
                $Type : 'UI.DataField',
                Value : soldstock,
                Label : 'soldstock',
            },
            {
                $Type : 'UI.DataField',
                Value : Price_After_Discount,
                Label : 'Price_After_Discount',
            },
            {
                $Type : 'UI.DataField',
                Value : netstock,
                Label : 'netstock',
            },
        ],
    },
);

annotate service.appleProducts with {
    ID @Common.Label : 'ID'
};

annotate service.appleProducts with {
    name @Common.Label : 'name'
};

annotate service.appleProducts with {
    price @Common.Label : 'price'
};

annotate service.appleProducts with {
    stock @Common.Label : 'stock'
};

annotate service.appleProducts with {
    discount @Common.Label : 'discount'
};

annotate service.appleProducts with {
    Status @Common.Label : 'Status'
};

annotate service.appleProducts with {
    StatusCriticality @Common.Label : 'StatusCriticality'
};

