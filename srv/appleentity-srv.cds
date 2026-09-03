using { schema.db as myservice } from '../db/schema';

service srv_AppleProducts{
    @odata.draft.enabled
    entity appleProducts as projection on myservice.appleProducts{
       *,
        case
        when stock=0
        then 'Out of stock'
        when stock <50
        then 'Low Stock'
        else 'In Stock'
        end as Status:String(40),
        case
        when stock=0
        then '1'
        when stock <50
        then '2'
        else '3'
        end as StatusCriticality:Integer
    };  
    
}
service srv_OrderDetails{
     entity order as projection on myservice.order;
    entity OrderItems as projection on myservice.OrderItems;
}