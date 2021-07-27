layui.use('layer', function() {
    login();
    keyLogin();
});
function login() {
    $('#login').on('click', function () {
        $.ajax({
            url:"/admin/login",
            method:"post",
            data:{
                username:$("#username").val(),
                password:$("#password").val(),
            },
            success:function (data) {
                if(!data.success){
                    layer.msg(data.msg);
                }else{
                    window.location.href="/admin/index";
                }
            }
        })
    });
}
function keyLogin() {
    $(document).keyup(function(event){
        if(event.keyCode ==13){
            $.ajax({
                url:"/admin/login",
                method:"post",
                data:{
                    username:$("#username").val(),
                    password:$("#password").val(),
                },
                success:function (data) {
                    if(!data.success){
                        layer.msg(data.msg);
                    }else{
                        window.location.href="/admin/index";
                    }
                }
            })
        }
    });
}