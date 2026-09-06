using srv_OrderDetails as service from '../../srv/orderManagement-srv';
annotate service.order with @(
    UI.SelectionFields : [
        ID,
        cursotmerName,
        storeName,
        cusomerMobile,
        netPrice,
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Value : cursotmerName,
        },
        {
            $Type : 'UI.DataField',
            Value : storeName,
        },
        {
            $Type : 'UI.DataField',
            Value : netPrice,
        },
    ],
    UI.DataPoint #ID : {
        $Type : 'UI.DataPointType',
        Value : ID,
        Title : 'ID',
    },
    UI.DataPoint #cursotmerName : {
        $Type : 'UI.DataPointType',
        Value : cursotmerName,
        Title : 'cursotmerName',
    },
    UI.DataPoint #storeName : {
        $Type : 'UI.DataPointType',
        Value : storeName,
        Title : 'storeName',
    },
    UI.DataPoint #netPrice : {
        $Type : 'UI.DataPointType',
        Value : netPrice,
        Title : 'netPrice',
    },
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'ID',
            Target : '@UI.DataPoint#ID',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'cursotmerName',
            Target : '@UI.DataPoint#cursotmerName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'storeName',
            Target : '@UI.DataPoint#storeName',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'netPrice',
            Target : '@UI.DataPoint#netPrice',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Details',
            ID : 'OrderDetails',
            Target : '@UI.FieldGroup#OrderDetails',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Items',
            ID : 'OrderItems',
            Target : 'itemss/@UI.LineItem#OrderItems',
        },
    ],
    UI.FieldGroup #OrderDetails : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Value : cursotmerName,
            },
            {
                $Type : 'UI.DataField',
                Value : cusomerMobile,
            },
            {
                $Type : 'UI.DataField',
                Value : storeName,
            },
            {
                $Type : 'UI.DataField',
                Value : netPrice,
            },
        ],
    },
);

annotate service.order with {
    ID @Common.Label : 'ID'
};

annotate service.order with {
    cursotmerName @Common.Label : 'cursotmerName'
};

annotate service.order with {
    storeName @Common.Label : 'storeName'
};

annotate service.order with {
    cusomerMobile @Common.Label : 'cusomerMobile'
};

annotate service.order with {
    netPrice @Common.Label : 'netPrice'
};

annotate service.OrderItems with @(
    UI.LineItem #OrderItems : [
        {
            $Type : 'UI.DataField',
            Value : ID,
            Label : 'ID',
        },
        {
            $Type : 'UI.DataField',
            Value : order_ID,
            Label : 'order_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : product_ID,
            Label : 'product_ID',
        },
        {
            $Type : 'UI.DataField',
            Value : quantity,
            Label : 'quantity',
        },
        {
            $Type : 'UI.DataField',
            Value : totalPrice,
            Label : 'totalPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : discount,
            Label : 'discount',
        },
        {
            $Type : 'UI.DataField',
            Value : orderPrice,
            Label : 'orderPrice',
        },
        {
            $Type : 'UI.DataField',
            Value : unitPrice,
            Label : 'unitPrice',
        },
    ]
);

