namespace schema.db;
using { managed,cuid } from '@sap/cds/common';

entity appleProducts:cuid{
    name:String @mandatory;
    price:Integer @mandatory;
    discount:Integer;
    stock:Integer @mandatory;    
}

entity order: cuid{
    cursotmerName:String(50);
    cusomerMobile:String(10);
    storeName:String(30);
    netPrice:Decimal(9,2);
    itemss:Association to many OrderItems on itemss.order=$self;
}
entity OrderItems:cuid{
    order: Association to order;
    product:Association to appleProducts;
    quantity:Integer;
    unitPrice:Decimal(9,2);
    discount:Integer;
    totalPrice: Decimal(9,2);
}
