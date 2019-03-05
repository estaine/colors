package com.estaine.colors.controller;

import com.estaine.colors.dto.ValidateRequest;
import com.estaine.colors.dto.ValidateResult;
import com.estaine.colors.service.ValidationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class DataController {

    @Autowired
    private ValidationService validationService;

    @RequestMapping(value = "/validate", method = RequestMethod.POST)
    public ValidateResult validate(@RequestBody ValidateRequest validateRequest) {
        return new ValidateResult(validationService.validate(validateRequest.getColors()));
    }
}
