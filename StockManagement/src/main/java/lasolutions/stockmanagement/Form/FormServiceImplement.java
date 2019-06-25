package lasolutions.stockmanagement.Form;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("FormService")
public class FormServiceImplement implements FormService {

    @Autowired
    private FormRepository formRepository;

    @Override
    public List<FormModel> getForms() {
        return formRepository.getForms();
    }

    @Override
    public FormModel getFormById(String form_id) {
        return formRepository.getFormById(form_id);
    }
}
