package it.service.company.it_services.controller;

import it.service.company.it_services.model.Users;
import it.service.company.it_services.response.SaludoResponse;
import it.service.company.it_services.service.SaludoService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SaludoController {

    public final SaludoService saludoService;

    @PostMapping(value = "/saludar",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public SaludoResponse saludar(){
        return  saludoService.saludar();
    }

    @GetMapping(value = "/user/{id}",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public Optional<Users> saludar(@PathVariable("id")String id){
        return  saludoService.getUser(id);
    }

    @GetMapping(value = "/userName/{name}",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseStatus(HttpStatus.OK)
    public Optional<Users> getUser(@PathVariable("name")String name){
        return  saludoService.getUserByName(name);
    }

}
