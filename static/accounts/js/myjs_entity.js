jQuery(function () {

        $('#creat_Done_btn').click(function () {
            $('#creat_new_entity_input').attr('readonly', true);

            if ($('#creat_new_entity_input').val().replace(/(^\s*)|(\s*$)/g, '').length < 1) {
                $(this).attr('disabled', true);
                $('#creat_new_entity_input').removeAttr('readonly');
                $('#creat_new_entity_input').addClass('is-invalid');
                $('#creat_new_entity_input').val('');
                $('#creat_new_entity_input').focus();
                setTimeout('creat_Done_btn.disabled=false;', 2000);
            } else {
                $('#creat_new_entity_input').removeClass('is-invalid');
                $('#creat_new_entity_input').val($('#creat_new_entity_input').val().replace(/(^\s*)|(\s*$)/g, ''));
                $(this).attr('hidden', true);
                $('#creat_Done_div').append('<button type="submit" class="btn btn-primary" disabled><span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Done</button>');
            }
        });

    });