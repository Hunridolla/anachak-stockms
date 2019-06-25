
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

        var forms_controls = [
            {
                form_id: "FRM-001",
                control_id: "CTR-001",
                control_name: "Category ID",
                control_type: "txtID",
                modal_target_id: "",
                ord: 1
            },
            {
                form_id: "FRM-001",
                control_id: "CTR-002",
                control_name: "Category Name",
                control_type: "txt",
                modal_target_id: "",
                ord: 2
            },
            {
                form_id: "FRM-001",
                control_id: "CTR-002",
                control_name: "Remark",
                control_type: "txt",
                modal_target_id: "",
                ord: 3
            },
            {
                form_id: "FRM-001",
                control_id: "CTR-003",
                control_name: "Inactive",
                control_type: "bit",
                modal_target_id: "",
                ord: 4
            }
        ];
        var ctrl_list = "";
        $.each(forms_controls, function (index, object) {
            if (index === 0 || index === forms_controls.length - 1) {
                ctrl_list += get_control(object.control_type, object.control_name);
            } else if ((index % 2) > 0 && index > 0) {
                ctrl_list += "<div class=\"row\">" + get_control(object.control_type, object.control_name);
            } else if ((index % 2) == 0 && index > 0) {
                ctrl_list += get_control(object.control_type, object.control_name) + "</div>";
            } else {
                ctrl_list += get_control(object.control_type, object.control_name);
            }
        });
        return ctrl_list;
    }

    function get_control(control_type_id, caption) {
        var href = "/controls/get/" + control_type_id;
        var control_html = null;
        $.ajax({
            async: false,
            type: "GET",
            url: href,
            success: function (data) {
                control_html = data["control_html"];
                control_html = control_html.replace("||caption||",caption);
            },
            error: function (event) {
                alert("no form!");
            }
        });
        return control_html;
    }

    $(document).on("click", "#btn-new-item", function (event) {
        alert(get_control("txtID","Category Name"));
    });
});