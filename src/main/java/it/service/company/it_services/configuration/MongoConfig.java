package it.service.company.it_services.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.MongoDatabaseFactory;
import org.springframework.data.mongodb.core.SimpleMongoClientDatabaseFactory;

//@Configuration
public class MongoConfig {

   /* @Bean
    public MongoClient mongoClient() {
        return MongoClients.create("mongodb+srv://heribertoem19:-6PS234n2nTeLcH@mycluster.ei0r1.mongodb.net/?retryWrites=true&w=majority");
    }

    @Bean
    public MongoTemplate mongoTemplate() {
        MongoDatabaseFactory factory = new SimpleMongoClientDatabaseFactory(mongoClient(), "sample_mflix");
        return new MongoTemplate(factory);
    }*/
}
