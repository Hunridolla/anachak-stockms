

$(document).on("click", ".menu", function(event){
    var form_id = $(this).find('a').attr('data-target');
    $(".jarviswidget header").find('h2').html(get_form_info(form_id));
});

function get_form_info (form_id) {
    var forms = [
        { form_id: "FRM-001", form_name: "Create Invoices"},
        { form_id: "FRM-002", form_name: "Create Catagories"}
    ];
    return forms.find(x => x.form_id === form_id).form_name;
}