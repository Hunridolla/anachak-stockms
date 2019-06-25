package lasolutions.stockmanagement.Control;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sys_control_types")
public class ControlModel {

    @Id
    @Column(name = "control_type_id", insertable = false, updatable = false)
    private String control_type_id;

    @Column(name = "control_html")
    private String control_html;

    public ControlModel(){

    }

    public String getControl_type_id() {
        return control_type_id;
    }

    public void setControl_type_id(String control_type_id) {
        this.control_type_id = control_type_id;
    }

    public String getControl_html() {
        return control_html;
    }

    public void setControl_html(String control_html) {
        this.control_html = control_html;
    }
}
