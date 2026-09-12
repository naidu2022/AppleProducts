using {schema.db as myservice} from '../db/schema';

service srv_OrderDetails {
    @odata.draft.enabled
    @Common.SideEffects:{SourceEntities:['itemss'],TargetProperties:['netPrice']}
    @restrict:[{
         grant:['READ','WRITE'],
         to:'Employee', where : (storeName = $user.storeName)
     }]
    //@requires:'Employee'
    entity order as projection on myservice.order;
    action abc();

    
    @Common.SideEffects:{SourceProperties:['quantity','orderPrice','discount'],TargetProperties:['totalPrice','unitPrice']}
    entity OrderItems as projection on myservice.OrderItems;
    entity appleProducts as projection on myservice.appleProducts;
}

// annotate srv_OrderDetails.OrderItems with @Common.SideEffects #Pricing: {
//     SourceProperties: [
//         quantity,
//         orderPrice,
//         totalPrice,
//         discount
//     ],
//     TargetProperties: [
//         totalPrice,
//         unitPrice,
//     //order/netPrice
//     ],
//     TargetEntities  : [order]
// };
