package it.service.company.it_services.service.impl;

import it.service.company.it_services.model.Users;
import it.service.company.it_services.repository.UserRepository;
import it.service.company.it_services.response.SaludoResponse;
import it.service.company.it_services.service.SaludoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SaludoImpl implements SaludoService {

    private final UserRepository userRepository;

    @Override
    public SaludoResponse saludar() {
        return SaludoResponse.builder().saludo("hola soy goku").build();
    }

    @Override
    public Optional<Users> getUser(String id) {
        return userRepository.findById(id);
    }

    @Override
    public Optional<Users> getUserByName(String name) {
        return userRepository.findByName(name);
    }

    @Override
    public void imprime() {

    }
}
