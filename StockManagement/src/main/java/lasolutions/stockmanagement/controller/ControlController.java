package lasolutions.stockmanagement.controller;

import lasolutions.stockmanagement.Control.ControlModel;
import lasolutions.stockmanagement.Control.ControlRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ControlController {

    @Autowired
    private ControlRepository controlRepository;

    @Autowired
    public ControlController(ControlRepository controlRepository){
        this.controlRepository = controlRepository;
    }

    @RequestMapping(value = "/controls/get/{control_type_id}", method = RequestMethod.GET)
    public ResponseEntity<ControlModel> getControl(@PathVariable("control_type_id") String control_type_id){
        ControlModel controlModel = controlRepository.getControlById(control_type_id);
        return new ResponseEntity<>(controlModel, HttpStatus.OK);
    }
}
