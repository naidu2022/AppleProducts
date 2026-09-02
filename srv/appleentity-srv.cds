using { schema.db as myservice } from '../db/schema';

service srv_AppleProducts{
    entity appleProducts as projection on myservice.appleProducts{
        ID,
        name
    };
    
}