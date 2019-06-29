package lasolutions.stockmanagement.FormControl;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface FormControlRepository extends JpaRepository<FormControlModel, String>{

    String getFormControlById = "select * from sys_form_controls where form_id= :form_id order by ord;";
    @Query(value = getFormControlById, nativeQuery = true)
    List<FormControlModel> getFormControlById(@Param("form_id") String form_id);

}
