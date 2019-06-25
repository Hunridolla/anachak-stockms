package lasolutions.stockmanagement.Control;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ControlService {
    public List<ControlModel> getControls();
    public ControlModel getControlById(String control_type_id);
}
