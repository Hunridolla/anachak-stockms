package lasolutions.stockmanagement.Control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("ControlService")
public class ControlServiceImplement implements ControlService {

    @Autowired
    private ControlRepository controlRepository;

    @Override
    public List<ControlModel> getControls() {
        return controlRepository.getControls();
    }

    @Override
    public ControlModel getControlById(String control_type_id) {
        return controlRepository.getControlById(control_type_id);
    }
}
