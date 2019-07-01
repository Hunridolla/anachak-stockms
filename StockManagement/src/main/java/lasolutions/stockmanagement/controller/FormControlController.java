package lasolutions.stockmanagement.controller;


import lasolutions.stockmanagement.FormControl.FormControlModel;
import lasolutions.stockmanagement.FormControl.FormControlRepository;
import lasolutions.stockmanagement.FormControl.FormControlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class FormControlController {

    @Autowired
    private FormControlRepository formControlRepository;
    private FormControlService formControlService;

    @Autowired
    public FormControlController(FormControlRepository formControlRepository, FormControlService formControlService){
        this.formControlRepository = formControlRepository;
        this.formControlService = formControlService;
    }

    @RequestMapping(value = "/form-controls/get/{form_id}", method = RequestMethod.GET)
    @ResponseBody
    public List<FormControlModel> getFormControls(@PathVariable("form_id") String form_id){
        System.out.print(form_id);
        List<FormControlModel> formControlModels = formControlRepository.getFormControlById(form_id);
        return formControlModels;
    }
}
