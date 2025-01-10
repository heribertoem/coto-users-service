package it.service.company.it_services.controller;

import it.service.company.it_services.request.SaludoRequest;
import it.service.company.it_services.response.SaludoResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CepNotificationTransactionController {

    /*private final CepNotificationTransactionService cepNotificationTransactionService;


    private final SpeiCoreLog log;

    @Autowired
    public CepNotificationTransactionController(CepNotificationTransactionService cepNotificationTransactionService,
                                                SpeiCoreLog log) {
        this.cepNotificationTransactionService = cepNotificationTransactionService;
        this.log = log;
    }


    @PostMapping(value = "/saludar",
            consumes = MediaType.APPLICATION_JSON_VALUE,
            produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<SaludoResponse> saludar(@RequestBody SaludoRequest saludoRequest){

        SaludoResponse saludoResponse = cepNotificationTransactionService.procesaTransaccion(ServiceModel.builder()
                                                                .model(saludoRequest)
                                                                .processNumber(CepNotificationTransactionService.PROCESS.SALUDO.name())
                                                                .build()).map(t-> t.getDetail("saludoResponse", SaludoResponse.class))
                .orElseThrow(() ->new SpeiPagoPopConflictException("Not its possible to register the spei transaction."));

        return new ResponseEntity<>(saludoResponse, HttpStatus.OK);
    }*/

}