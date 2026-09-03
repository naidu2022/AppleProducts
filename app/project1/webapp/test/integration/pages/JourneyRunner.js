sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"project1/test/integration/pages/appleProductsList.gen",
	"project1/test/integration/pages/appleProductsObjectPage.gen"
], function (JourneyRunner, appleProductsListGenerated, appleProductsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('project1') + '/test/flp.html#app-preview',
        pages: {
			onTheappleProductsListGenerated: appleProductsListGenerated,
			onTheappleProductsObjectPageGenerated: appleProductsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

