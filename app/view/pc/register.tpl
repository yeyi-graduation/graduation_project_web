{% extends "./template/template.tpl" %}

{% block banner %}
    
{% endblock %}

{% block top %}
    <div class="register-page flex-b-cc" style="background-image: url('/public/images/banner/timg.jpg')">
        <div class="register-div">
            <div class="fl leader-left">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-imagevector"></use>
                </svg>
                <span class="l-title">YY摄影</span>
                <div class="leader-detail">
                    <p class="text1">yy website</p>
                    <p class="text2">定制，一场暖心的摄影之旅</p>
                    <p class="text3">打造美丽宁静的生活,等待您！</p>
                    <p class="text4">从yy摄影开始</p>
                    <p class="text4">来吧</p>
                </div>
            </div>
            <div class="fl register-right register-step1">
                邮箱注册
                <div class="register-form">
                    <div class="layui-form">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" placeholder="请输入邮箱" class="layui-input email-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="text" placeholder="请输入验证码" class="layui-input code-input">
                                <button class="layui-btn send-code-btn">发送验证码</button>
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn code-verify-btn">验&nbsp;&nbsp;&nbsp;证</button>
                        </div>
                        <div class="layui-form-item">
                            <a href="/login" class="login-link">直接登录</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fl register-right register-step2">
                用户注册
                <div class="register-form">
                    <div class="layui-form">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <input type="text" placeholder="请输入密码" class="layui-input psd-input">
                            </div>
                            <div class="layui-input-block">
                                <input type="text" placeholder="请再次输入密码" class="layui-input re-psd-input">
                            </div>
                            <div class="layui-inline">
                                <input type="checkbox" name="" lay-skin="primary" title="记住密码(7天)">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <button class="layui-btn register-btn" lay-submit="" lay-filter="demo2">注册</button>
                            <a href="" class="login-link">直接登录</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
{% endblock %}

{% block middle %}

{% endblock %}

{% block bottom %}

{% endblock %}

{% block footer %}

{% endblock %}

{% block script %}
    <script>
        layui.use(['form'], function(){

        });

        var email = $('.email-input');
        var code = $('.code-input');
        var psd = $('.psd-input');
        var repsd = $('.re-psd-input');
        var reg = new RegExp("^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$");
        var currentCode;
        var emailValue;

        // 发送验证码
        $('.send-code-btn').on('click', function() {
            emailValue = email.val();

            if(!!emailValue) {
                if(!reg.test(emailValue)) {
                    alert('请输入合法的邮箱！');
                } else {
                    $.ajax({
                        type: 'post',
                         url: '/api/send_email',
                         data: {
                             email: emailValue,
                         },
                         success: function(result){
                            currentCode = result;
                         },
                         error: function(err) {
                             if(err.status == 403) {
                                 alert('该用户已存在！');
                             }
                         }
                    })
                }
            } else {
                alert('请输入邮箱！');
            }
        })

        // 点击验证
        $('.code-verify-btn').on('click', function() {
            if(!!code.val()) {
                $.ajax({
                    type: 'post',
                    url: '/api/vertify_code',
                    data: {
                        email: emailValue,
                        code: code.val(),
                    },
                    success: function(result){
                        alert('验证通过');
                        $('.register-step1').hide();
                        $('.register-step2').show();
                    }
                })
            } else {
                alert('请输入验证码！');
            }
        })

        // 点击注册
        $('.register-btn').on('click', function() {
            if(!!psd.val()&&!!repsd.val()) {
                $.ajax({
                    type: 'post',
                    url: '/api/register',
                    data: {
                        email: emailValue,
                        password: psd.val(),
                    },
                    success: function(result){
                        alert('注册成功，请前往登录');
                        location.href = '/login';
                    }
                })
            } else {
                alert('请输入密码！');
            }
        })
    </script>
{% endblock %}