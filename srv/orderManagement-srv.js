const cds = require('@sap/cds');
const { data } = require('@sap/cds/lib/dbs/cds-deploy');
const { INSERT, SELECT } = require('@sap/cds/lib/ql/cds-ql');

module.exports = class srv_OrderDetails extends cds.ApplicationService {
    init() {
        const { order } = cds.entities(srv_OrderDetails);
        const { OrderItems } = cds.entities(srv_OrderDetails);
        // /// this method is for only show in UI
        // this.after('READ', OrderItems, async (data, req) => {

        //     // Check if data exists and contains records
        //     if (data && Array.isArray(data) && data.length > 0) {
        //         //const producttotalprice;
        //         data.forEach(item => {
        //             console.log(item.ID);
        //             console.log(item.orderPrice);
        //             console.log(item.discount);
        //             item.totalPrice = item.quantity * item.orderPrice;
        //         });

        //     } else {
        //         console.log("No records found");
        //     }

        // });
        // this.before('CREATE', OrderItems, async (req) => {
        //     req.data.totalPrice =
        //         req.data.quantity * req.data.orderPrice;
        // });
        // this.before('UPDATE', OrderItems, async (req) => {
        //     req.data.totalPrice =
        //         req.data.quantity * req.data.orderPrice;
        // });
        this.after('PATCH', OrderItems.drafts, async (data, req) => {

            const orderitemID = data.ID;

            const recOrderItem = await SELECT.one
                .from(OrderItems.drafts)
                .where({ ID: orderitemID });

            if (!recOrderItem) return;

            const quantity = Number(recOrderItem.quantity || 0);
            const orderPrice = Number(recOrderItem.orderPrice || 0);
            const discount = Number(recOrderItem.discount || 0);

            const totalPriceValue = quantity * orderPrice;

            const afterDiscountPrice =
                orderPrice - ((orderPrice * discount) / 100);

            await UPDATE(OrderItems.drafts)
                .set({
                    totalPrice: totalPriceValue,
                    unitPrice: afterDiscountPrice
                })
                .where({ ID: orderitemID });

            const allOrderitemsDraftitems = await SELECT
                .from(OrderItems.drafts)
                .where({ order_ID: recOrderItem.order_ID });

            let totalOrderPrice = 0;

            for (const item of allOrderitemsDraftitems) {
                totalOrderPrice += Number(item.totalPrice || 0);
            }

            await UPDATE(order.drafts)
                .set({ netPrice: totalOrderPrice })
                .where({ ID: recOrderItem.order_ID });

        });

        return super.init()
    }
}