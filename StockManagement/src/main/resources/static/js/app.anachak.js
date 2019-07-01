
$(document).ready(function () {

    $(document).on("click", ".menu", function (event) {
        var form_id = $(this).find('a').attr('data-target');
        $(".jarviswidget header").find('h2').html(get_form_info(form_id));
        $(".widget-body").html("");
        $(".widget-body").append(get_from_controls(form_id));
    });

    function get_form_info(form_id) {
        var href = "/forms/get/" + form_id;
        var form_name = null;
        $.ajax({
            async: false,
            type: "GET",
            url: href,
            success: function (data) {
                form_name = data["form_name"];
            },
            error: function (event) {
                alert("no form!");
            }
        });
        return form_name;
    }


    function get_from_controls(form_id) {
        var forms_controls = "";
        var ctrl_list = "";
        var href = "/form-controls/get/" + form_id;

        $.ajax({
            async: false,
            type: "GET",
            url: href,
            success: function (data) {
                // control_html = data["control_html"];
                $.each(data, function (index, object) {
                    if (index === 0 || index === data.length - 1) {
                        ctrl_list += get_control(object.control_id, object.control_type, object.control_name, object.modal_target_id);
                    } else if ((index % 2) > 0 && index > 0) {
                        ctrl_list += "<div class=\"row\">" + get_control(object.control_id, object.control_type, object.control_name, object.modal_target_id);
                    } else if ((index % 2) == 0 && index > 0) {
                        ctrl_list += get_control(object.control_id, object.control_type, object.control_name, object.modal_target_id) + "</div>";
                    } else {
                        ctrl_list += get_control(object.control_id, object.control_type, object.control_name, object.modal_target_id);
                    }
                });
            },
            error: function (event) {
                alert("no controls!" + event);
            }
        });

        return ctrl_list;
    }

    function get_control(control_id, control_type_id, caption, modal_target_id) {
        var href = "/controls/get/" + control_type_id;
        var control_html = null;
        $.ajax({
            async: false,
            type: "GET",
            url: href,
            success: function (data) {
                control_html = data["control_html"];
                control_html = control_html.replace("||caption||",caption);
                control_html = control_html.replace("||modal-target-id||", "#" + modal_target_id);
                control_html = control_html.replace("||control-button||", "b" + control_id);
                control_html = control_html.replace("||control-id||", control_id);
            },
            error: function (event) {
                alert("no form!" + event);
            }
        });
        return control_html;
    }

    $(document).on("click", "#btn-new-item", function (event) {
        alert(get_control("txtID","Category Name"));
    });
});