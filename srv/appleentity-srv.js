const cds=require('@sap/cds');

module.exports=class srv_AppleProducts extends cds.ApplicationService{
    init(){
        const {appleProducts} = this.entities(srv_AppleProducts);
        this.on('CREATE',appleProducts,req=>{
            console.log("I am inside of creation of products");
        });

        return super.init()
    }
}