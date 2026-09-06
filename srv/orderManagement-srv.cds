using { schema.db as myservice } from '../db/schema';

service srv_OrderDetails{
    @odata.draft.enabled
    entity order as projection on myservice.order;    
    entity OrderItems as projection on myservice.OrderItems;
}