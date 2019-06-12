

$(document).on("click", ".menu", function(event){
    var form_id = $(this).find('a').attr('data-target');
    $(".jarviswidget header").find('h2').html(get_form_info(form_id));
    $(".widget-body").html("");
    // var controls = "<p>" + form_id + "</p>";
    $(".widget-body").append(get_from_controls(form_id));
});

function get_form_info (form_id) {
    var forms = [
        { form_id: "FRM-001", form_name: "Create Invoices"},
        { form_id: "FRM-002", form_name: "Create Catagories"}
    ];
    return forms.find(x => x.form_id === form_id).form_name;
}

function get_from_controls (form_id) {
    var forms_controls = [
        {form_id: "FRM-001", control_id: "CTR-001", control_name: "Customer:"},
        {form_id: "FRM-001", control_id: "CTR-001", control_name: "Vendor:"},
        {form_id: "FRM-001", control_id: "CTR-002", control_name: "Invoice Date:"}
    ];

    var ctrl_list = "" +
        "<div class=\"col-md-6\">" +
            "<div class=\"row\">" +
                "<div class=\"col-sm-12\"></div>" +
                    "<div id=\"vendor_id\" class=\"input-group\">" +
                        "<div class=\"input-group-btn\">" +
                            "<label class=\"form-control ctl_label cLabel\"> Vendor: " +
                            "</label>" +
                    "</div>" +
                        "<input class=\"form-control ctl_textbox cCode\" type=\"text\" value=\"\">" +
                        "<div class=\"input-group-btn\">" +
                            "<button id=\"btnVendor\" class=\"btn btn-default\"" +
                                "type=\"button\" data-toggle=\"modal\"" +
                                "data-target=\"#find-vendor-modal\">" +
                                "<i class=\"fa fa-fw fa-list\"></i>" +
                            "</button>" +
                        "</div>" +
                        "<div class=\"input-group-btn\">" +
                            "<label class=\"form-control ctl_label cText\"> </label> " +
                        "</div>" +
                    "</div>" +
                "</div>" +
            "</div>" +
        "</div>";
    ctrl_list += "" +
        "<div class=\"col-md-6\">" +
            "<div class=\"row\">" +
                "<div class=\"col-sm-12\"></div>" +
                    "<div id=\"customer_id\" class=\"input-group\">" +
                        "<div class=\"input-group-btn\">" +
                            "<label class=\"form-control ctl_label cLabel\"> Customer: " +
                            "</label>" +
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
                "</div>" +
            "</div>" +
        "</div>";

    return ctrl_list;

}