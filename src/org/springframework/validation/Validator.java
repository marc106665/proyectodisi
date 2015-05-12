package org.springframework.validation;

import org.springframework.validation.Errors;

public interface Validator {
	public boolean supports(Class<?> clazz);
    public void validate(Object target, Errors errors); 
}
