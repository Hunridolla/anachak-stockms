package lasolutions.stockmanagement.FormControl;

import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface FormControlService {
    public List<FormControlModel> getFormControlById(String form_id);
}
