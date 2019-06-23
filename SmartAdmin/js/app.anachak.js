

$(document).on("click", ".menu", function (event) {
    var form_id = $(this).find('a').attr('data-target');
    $(".jarviswidget header").find('h2').html(get_form_info(form_id));
    $(".widget-body").html("");
    $(".widget-body").append(get_from_controls(form_id));
});

function get_form_info(form_id) {
    var forms = [
        { form_id: "FRM-001", form_name: "Catagories" },
        { form_id: "FRM-002", form_name: "Vendor Types"},
        { form_id: "FRM-003", form_name: "Items" },
        { form_id: "FRM-004", form_name: "Vendors" },

    ];
    return forms.find(x => x.form_id === form_id).form_name;
}

function get_from_controls(form_id) {

    // var ctrl_list = "" +
    //     "<div class=\"row\">" +
    //     "<div class=\"col-sm-6\" style=\"margin-top: 10px;\">" +
    //     "<div id=\"vendor_id\" class=\"input-group\">" +
    //     "<div class=\"input-group-btn\">" +
    //     "<label class=\"form-control ctl_label cLabel\"> Vendor: " +
    //     "</label>" +
    //     "</div>" +
    //     "<input class=\"form-control ctl_textbox cCode\" type=\"text\" value=\"\">" +
    //     "<div class=\"input-group-btn\">" +
    //     "<button id=\"btnVendor\" class=\"btn btn-default\"" +
    //     "type=\"button\" data-toggle=\"modal\"" +
    //     "data-target=\"#find-vendor-modal\">" +
    //     "<i class=\"fa fa-fw fa-list\"></i>" +
    //     "</button>" +
    //     "</div>" +
    //     "<div class=\"input-group-btn\">" +
    //     "<label class=\"form-control ctl_label cText\"> </label> " +
    //     "</div>" +
    //     "</div>" +
    //     "</div>";

    var forms_controls = [
        { form_id: "FRM-001", control_id: "CTR-001", control_name: "Category ID", control_type: "txtID", modal_target_id: "", ord: 1 },
        { form_id: "FRM-001", control_id: "CTR-002", control_name: "Category Name", control_type: "txt", modal_target_id: "", ord: 2 },
        { form_id: "FRM-001", control_id: "CTR-002", control_name: "Remark", control_type: "txt", modal_target_id: "", ord: 3 },
        { form_id: "FRM-001", control_id: "CTR-003", control_name: "Inactive", control_type: "bit", modal_target_id: "", ord: 4 }
    ];
    var ctrl_list = "";
    $.each(forms_controls, function (index, object) {
        if (index === 0 || index === forms_controls.length -1) {
            ctrl_list += get_control(object.control_type,object.control_name);
        }else if ((index % 2) > 0 && index > 0) {
            ctrl_list += "<div class=\"row\">" + get_control(object.control_type,object.control_name);
        }else if ((index % 2) == 0 && index > 0)  {
            ctrl_list += get_control(object.control_type,object.control_name) + "</div>";
        }else {
            ctrl_list += get_control(object.control_type,object.control_name);
        }
    });
    return ctrl_list;
}
function get_control(control_id,caption){
    var txtID = "<div class=\"row\">" +
                    "<div class=\"col-sm-4\" style=\"margin-top: 10px\">" +
                        "<div class=\"input-group\">" +
                            "<div class=\"input-group-btn\" style=\"min-width: 120px;\">" +
                                "<label class=\"form-control ctl_label\">" + caption + "\:</label>" +
                            "</div>" +
                            "<input class=\"form-control ctl_textbox\" type=\"text\" value=\"\">" +
                        "</div>" +
                    "</div>" +
                "</div>";

    var txt = "<div class=\"col-sm-6\" style=\"margin-top: 10px\">" +
                    "<div class=\"input-group\">" +
                        "<div class=\"input-group-btn\" style=\"min-width: 120px;\">" +
                            "<label class=\"form-control ctl_label\">" + caption + "\:" +
                            "</label>" +
                        "</div>" +
                        "<input class=\"form-control ctl_textbox\" type=\"text\" value=\"\">" +
                    "</div>" +
                "</div>";

    var bit = "<div class=\"row\">" +
                    "<div class=\"col-sm-4\">" +
                        "<div class=\"input-group\">" +
                            "<div class=\"checkbox\">" +
                                "<label>" +
                                    "<input type=\"checkbox\" class=\"checkbox style-0\">" +
                                    "<span>" + caption + "</span>" +
                                "</label>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</div>";
    var list ="<div class=\"col-sm-6\" style=\"margin-top: 10px;\">" +
                    "<div id=\"customer_id\" class=\"input-group\">" +
                        "<div class=\"input-group-btn\">" +
                            "<label class=\"form-control ctl_label cLabel\"> Customer: " + "</label>" +
                        "</div>" +
                        "<input class=\"form-control ctl_textbox cCode\" type=\"text\" value=\"\">" +
                        "<div class=\"input-group-btn\">" +
                            "<button id=\"btnCustomer\" class=\"btn btn-default\"" +
                            "type=\"button\" data-toggle=\"modal\"" +
                            "data-target=\"#find-customer-modal\">" +
                            "<i class=\"fa fa-fw fa-list\"></i>" +
                            "</button>" +
                        "</div>" +
                        "<div class=\"input-group-btn\">" +
                            "<label class=\"form-control ctl_label cText\"> </label> " +
                        "</div>" +
                    "</div>" +
                "</div>";
    if (control_id === "txtID") {
        return txtID;
    } else if (control_id === "txt"){
        return txt;
    }else if (control_id === "bit"){
        return bit;
    }else if (control_id === "list"){
        return list;
    }
}