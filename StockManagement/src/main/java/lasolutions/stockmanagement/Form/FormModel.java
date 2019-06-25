package lasolutions.stockmanagement.Form;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sys_forms")
public class FormModel {

    @Id
    @Column(name = "form_id", insertable = false, updatable = false)
    private String form_id;

    @Column(name = "form_name")
    private String form_name;

    @Column(name = "form_url")
    private String form_url;

    public FormModel() {

    }

    public String getForm_id() {
        return form_id;
    }

    public void setForm_id(String form_id) {
        this.form_id = form_id;
    }

    public String getForm_name() {
        return form_name;
    }

    public void setForm_name(String form_name) {
        this.form_name = form_name;
    }

    public String getForm_url() {
        return form_url;
    }

    public void setForm_url(String form_url) {
        this.form_url = form_url;
    }
}

