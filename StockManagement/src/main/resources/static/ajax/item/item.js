$(document).ready(function () {

    $(document).on("click", ".table a.btn-success", function (event) {
        event.preventDefault();
        var href = $(this).attr('href');
        $.ajax({
            type: "GET",
            url: href,
            success: function (data) {
                $('#create-profile-modal #profile_id').val(data.profile_id);
                $('#create-profile-modal #profile_name').val(data.profile_name);
                $('#create-profile-modal #remark').val(data.remark);
                if (data.inactive == true)
                    $('#inactive').prop('checked', true);
                else
                    $('#inactive').prop('checked', false);
            },
            error: function (e) {
                alert('Error: ' + e);
            }
        });
        $('#btn-save-profile').hide();
        $('#create-profile-modal').modal();
    });


    $('#btn-save-item').on('click', function (event) {
        event.preventDefault();
        var item_id = $('#item_id').val();
        var item_name = $('#item_name').val();
        var stock_type = $('#stock_type').val();
        var category_id = $('#category_id').val();
        var um = $('#um').val();
        var cost_method = $('#cost_method').val();
        var cost = $('#cost').val();
        var sale_price = $('#sale_price').val();
        var preferred_supplier = $('#preferred_supplier').val();
        var min_balance = $('#min_balance').val();
        var max_balance = $('#max_balance').val();
        var barcode = $('#barcode').val();
        var remark = $('#remark').val();
        var inactive = false;
        if ($('#inactive').is(":checked")) {
            inactive = $('#inactive').val();
        }

        $.ajax({
            async: false,
            dataType: "json",
            type: "POST",
            url: "/save-item",
            data: {item_id: item_id, item_name: item_name,stock_type: stock_type,category_id: category_id,um: um,cost_method: cost_method,
                cost: cost, sale_price: sale_price,preferred_supplier: preferred_supplier,min_balance: min_balance,max_balance: max_balance,
                barcode: barcode,remark: remark, inactive: inactive},
            success: function (data) {
                alert_message();
                clear_ctrl();
            },
            error: function (e) {
                alert('Error: ' + e);
            }
        });
    });

    function clear_ctrl() {
        $('input:text, input:password, input:file, select, textarea', '#create-item').val('');
        $('input:checkbox, input:radio', '#create-item').removeAttr('checked').removeAttr('selected');
        $('#inactive').prop('checked', false);
    }

    function alert_message() {
        $.smallBox({
            title: "Fiplus Khmer",
            content: "You have committed successfully!",
            color: "#739E73",
            iconSmall: "fa fa-cloud",
            timeout: 5000
        });
    }

});

