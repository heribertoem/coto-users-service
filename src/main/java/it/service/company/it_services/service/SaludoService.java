package it.service.company.it_services.service;

import it.service.company.it_services.model.Users;
import it.service.company.it_services.response.SaludoResponse;

import java.util.Optional;

public interface SaludoService {

    SaludoResponse saludar();

    Optional<Users> getUser(String id);

    Optional<Users> getUserByName(String name);
    void imprime();
}
