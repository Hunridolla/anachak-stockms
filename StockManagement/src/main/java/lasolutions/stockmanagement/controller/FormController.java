package lasolutions.stockmanagement.controller;

import lasolutions.stockmanagement.Form.FormModel;
import lasolutions.stockmanagement.Form.FormRepository;
import lasolutions.stockmanagement.Form.FormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FormController {


    @Autowired
    private FormService formService;
    private FormRepository formRepository;

    @Autowired
    public FormController(FormService formService, FormRepository formRepository) {
        this.formService = formService;
        this.formRepository = formRepository;
    }

    @RequestMapping(value = "/forms/get/{form_id}", method = RequestMethod.GET)
    public ResponseEntity<FormModel> get(@PathVariable("form_id") String form_id) {
        FormModel formModel = formRepository.getFormById(form_id);
        return new ResponseEntity<>(formModel, HttpStatus.OK);
    }
}
