package lasolutions.stockmanagement.FormControl;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "sys_form_controls")
public class FormControlModel {

    @NotNull
    @Column(name = "form_id")
    private String form_id;

    @Id
    @NotNull
    @Column(name = "control_id")
    private String control_id;

    @Column(name = "control_name")
    private String control_name;

    @Column(name = "control_type")
    private String control_type;

    @Column(name = "modal_target_id")
    private String modal_target_id;

    @Column(name = "ord")
    private int ord;

    public FormControlModel(){

    }

    public FormControlModel(String form_id, String control_id){
        this.form_id = form_id;
        this.control_id = control_id;

    }



    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public String getControl_id() {
        return control_id;
    }

    public void setControl_id(String control_id) {
        this.control_id = control_id;
    }

    public String getControl_name() {
        return control_name;
    }

    public void setControl_name(String control_name) {
        this.control_name = control_name;
    }

    public String getControl_type() {
        return control_type;
    }

    public void setControl_type(String control_type) {
        this.control_type = control_type;
    }

    public String getModal_target_id() {
        return modal_target_id;
    }

    public void setModal_target_id(String modal_target_id) {
        this.modal_target_id = modal_target_id;
    }

    public int getOrd() {
        return ord;
    }

    public void setOrd(int ord) {
        this.ord = ord;
    }
}
