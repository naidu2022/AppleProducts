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
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'name',
        },
        {
            $Type : 'UI.DataField',
            Value : price,
            Label : 'price',
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'stock',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'discount',
        },
        {
            $Type : 'UI.DataField',
            Value : Status,
            Label : 'Status',
        },
        {
            $Type : 'UI.DataField',
            Value : StatusCriticality,
            Label : 'StatusCriticality',
        },
    ],
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

