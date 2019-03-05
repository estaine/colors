package com.estaine.colors.service;

import org.springframework.stereotype.Service;

@Service
public class DefaultValidationService implements ValidationService {

    private String CORRECT_COLORS = "EADBC";

    @Override
    public String validate(String colors) {
        return CORRECT_COLORS.equals(colors) ? "Congratulations! [A -> D], [Q -> F]" : "Incorrect, try again";
    }
}
