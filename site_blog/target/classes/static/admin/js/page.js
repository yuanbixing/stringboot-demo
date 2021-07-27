layui.use('layer', function() {
    //    http://bh-lay.github.io/mditor/
    var mditor =  Mditor.fromTextarea(document.getElementById('md_editor'));
    mditor.height='550px';
});

function subPage(status) {
    var title = $('#pageForm input[name=title]').val();
    var content = $('#md_editor').val();
    if (title == '') {
        layer.msg('请输入页面标题');
        return;
    }
    if (content == '') {
        layer.msg('请输入也页面内容');
        return;
    }
    $("#status").val(status);
    $("#content-editor").val(content);
    var params = $("#pageForm").serialize();
    var url = $('#pageForm #cid').val() != '' ? '/admin/pages/update' : '/admin/pages/publish';
    $.ajax({
        url:url,
        method:"POST",
        data: params,
        success: function (result) {
            layer.msg(result.msg);
        }
    })
}

function returnMenu() {
    history.go(-1)
}

function allowcomment() {
    if($('#comment').is(':checked')) {
        $('#allow_comment').val("1");
    }else{
        $('#allow_comment').val("0");
    }
}

function allowping() {
    if($('#ping').is(':checked')) {
        $('#allow_ping').val("1");
    }else{
        $('#allow_ping').val("0");
    }
}

function allowfeed() {
    if($('#rss').is(':checked')) {
        $('#allow_feed').val("1");
    }else{
        $('#allow_feed').val("0");
    }
}
