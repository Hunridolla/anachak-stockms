package lasolutions.stockmanagement.FormControl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface FormControlRepository extends CrudRepository<FormControlModel, String> {

    String getFormControlById = "{CALL GBL_GET_FormControls(:form_id)}";
    @Query(value = getFormControlById, nativeQuery = true)
    List<FormControlModel> getFormControlById(@Param("form_id") String form_id);

}
