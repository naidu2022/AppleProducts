sap.ui.define([
    "sap/ui/core/mvc/Controller"
], (Controller) => {
    "use strict";

    return Controller.extend("com.demo.storedashboard.controller.View1", {
        onInit() {
            this.oVizFrame1=this.byId("oVizFrame1");
                this.oVizFrame1.setVizProperties({
                    plotArea:{
                        dataLabel:{
                            visible:true,
                            type:"value"
                        }
                    },
                    title:{
                        visible:true,
                        text:"Store Wise Sales"
                    }

                });
                 this.oVizFrame1=this.byId("oVizFrame2");
                this.oVizFrame1.setVizProperties({
                    plotArea:{
                        dataLabel:{
                            visible:true,
                            type:"value"
                        }
                    },
                    title:{
                        visible:true,
                        text:"Product Wise Sales"
                    }

                });

        }
    });
});