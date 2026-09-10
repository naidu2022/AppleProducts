using { schema.db as myservice } from '../db/schema';

service StoreAnalyticsS {

    entity StoreWiseSales as select from myservice.order {
        key storeName,
       cast( sum(netPrice) as Decimal(9,2)) as totalSales 
    }
    group by storeName;

    entity ProductWiseSales as select from myservice.OrderItems{
         key product.ID as productID,
         product.name as productName,
         cast(sum(totalPrice) as Decimal(9,2)) as totalSales

    }    
    group by product.ID, product.name;

    entity LowSotckWiseSales as select from myservice.appleProducts{
        ID,
        name ,
        stock
    }
    where stock < 10
    order by stock asc;

    entity Top5Orders as select from myservice.order{
        ID,
        storeName,
        cursotmerName,
        netPrice
    }
    order by netPrice desc limit 5;
}