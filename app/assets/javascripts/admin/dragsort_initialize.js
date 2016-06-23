var idRecord = [];
var positionRecord = [];
$( "#sortable" ).sortable({
    helper: fixWidthHelper,
    update: function(event, ui){

        var i = 1;
        $('.data').each(function(){
            idRecord[i] = ($(this).data('id'));
            i++;
        });

        jQuery.ajax
        ({
            type: "POST",
            dataType: 'json',
            url: '/admin/backend_menus/ajax_update_position',
            data: 'pid='+JSON.stringify(idRecord)+'&position='+JSON.stringify(positionRecord),
            success: function(r){}
        });
        idRecord = [];
    }
}).disableSelection();

function fixWidthHelper(e, ui) {
    ui.children().each(function() {
        $(this).width($(this).width());
    });
    return ui;
}