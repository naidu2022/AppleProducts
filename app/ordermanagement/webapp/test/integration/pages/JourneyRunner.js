sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"ordermanagement/test/integration/pages/orderList.gen",
	"ordermanagement/test/integration/pages/orderObjectPage.gen",
	"ordermanagement/test/integration/pages/OrderItemsObjectPage.gen"
], function (JourneyRunner, orderListGenerated, orderObjectPageGenerated, OrderItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('ordermanagement') + '/test/flp.html#app-preview',
        pages: {
			onTheorderListGenerated: orderListGenerated,
			onTheorderObjectPageGenerated: orderObjectPageGenerated,
			onTheOrderItemsObjectPageGenerated: OrderItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

