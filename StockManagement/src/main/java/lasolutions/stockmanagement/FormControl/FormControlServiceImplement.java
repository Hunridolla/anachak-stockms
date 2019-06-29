package lasolutions.stockmanagement.FormControl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("FormControlService")
public class FormControlServiceImplement implements FormControlService {

    @Autowired
    private FormControlRepository formControlRepository;

    @Override
    public List<FormControlModel> getFormControlById(String form_id) {
        return formControlRepository.getFormControlById(form_id);
    }
}
