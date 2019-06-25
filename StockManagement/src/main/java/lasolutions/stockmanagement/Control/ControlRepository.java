package lasolutions.stockmanagement.Control;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ControlRepository extends JpaRepository<ControlModel, String> {

    String getControls = "CALL GBL_CALL_Controls;";
    @Query(value = getControls, nativeQuery = true)
    List<ControlModel> getControls();

    String getControlById = "SELECT * FROM sys_control_types WHERE control_type_id= :control_type_id";
    @Query(value = getControlById, nativeQuery = true)
    ControlModel getControlById(@Param("control_type_id") String control_type_id);

}
