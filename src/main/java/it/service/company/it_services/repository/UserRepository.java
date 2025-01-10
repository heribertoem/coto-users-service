package it.service.company.it_services.repository;

import it.service.company.it_services.model.Users;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;

public interface UserRepository extends MongoRepository <Users, String> {
    Optional<Users> findByName(String name);
}
