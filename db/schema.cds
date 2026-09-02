namespace schema.db;
using { managed,cuid } from '@sap/cds/common';

entity appleProducts:cuid{
    name:String;
    price:Integer;
    discount:Integer;
    stock:Integer;    
}
