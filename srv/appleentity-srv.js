const cds = require('@sap/cds');
const { INSERT, SELECT, UPDATE } = require('@sap/cds/lib/ql/cds-ql');
module.exports = class srv_AppleProducts extends cds.ApplicationService {
    init() {
        const { appleProducts } = cds.entities(srv_AppleProducts);

        this.before('CREATE', appleProducts, async req => {
            //console.log("I am inside of creation of products");
            //await INSERT.into(appleProducts).entries(req.data);
            if (req.data.stock === null) {
                req.data.stock = 0;
            }
        });
        // this.on('CREATE',appleProducts, async req=>{
        //     console.log("I am in before create event");
        //     await INSERT.into(appleProducts).entries(req.data); 
        // });
        this.after('READ', appleProducts, async (data, req) => {
            if (!Array.isArray(data)) data = [data];
            data.forEach(record => {
                record.Price_After_Discount =
                    record.price - (record.price * record.discount / 100);
            });
        });
        this.after('PATCH', appleProducts.drafts, async (data, req) => {
            console.log("lskdflj");
            const draftrecordID = data.ID;
            const draftRecord = await SELECT.one.from(appleProducts.drafts).where({ ID: draftrecordID });
            if (draftRecord) {
                const netstock = (draftRecord.stock || 0) - (draftRecord.soldstock || 0);
                //draftRecord.netstock=netstock;
                await UPDATE(appleProducts.drafts).set({ netstock: netstock }).where({ ID: draftrecordID })
            }
        });
       
        this.on("AddStock", async req => {
            //req.info("lskdfj");

            console.log("I am in inside of add stock Button handler");
            var record_Product_ID = req.params[0].ID;
            const IsActiveEntity = req.params[0].IsActiveEntity;
            var NewStock = req.data.Stock;

            try{
             await UPDATE(appleProducts).set({ stock: { '+=': NewStock } }).where({ ID: record_Product_ID });

            console.log(req.params[0].ID);
            console.log(req.params[0]);
            console.log(req.data.Stock);
            req.info("Stock updated successfully");
            return "Stock updated successfully";
        }
        catch(error){
            console.error(error);
            req.error("Failed to update stock");
        }


        })
        return super.init()
    }
}