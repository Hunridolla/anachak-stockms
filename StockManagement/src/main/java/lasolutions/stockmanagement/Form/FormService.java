package lasolutions.stockmanagement.Form;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface FormService {
    public List<FormModel> getForms();
    public FormModel getFormById(String form_id);
}
