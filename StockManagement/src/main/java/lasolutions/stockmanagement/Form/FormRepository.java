package lasolutions.stockmanagement.Form;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FormRepository extends JpaRepository<FormModel, String> {

    String getForms = "CALL GBL_CALL_Forms;";
    @Query(value = getForms, nativeQuery = true)
    List<FormModel> getForms();

    String getFormById = "SELECT * FROM sys_forms WHERE form_id= :form_id";
    @Query(value = getFormById, nativeQuery = true)
    FormModel getFormById(@Param("form_id") String form_id);
}
