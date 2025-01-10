package it.service.company.it_services;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;

@SpringBootTest
@TestPropertySource(properties = {
		"spring.data.mongodb.uri=mongodb://localhost:27017/testdb"
})
class ItServicesApplicationTests {

	@Test
	void contextLoads() {
	}

}
