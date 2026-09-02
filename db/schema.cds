namespace schema.db;
using { managed,cuid } from '@sap/cds/common';

entity appleProducts:cuid{
    name:String @mandatory;
    price:Integer;
    discount:Integer;
    stock:Integer;    
}
