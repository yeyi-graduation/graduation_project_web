<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <script src="//at.alicdn.com/t/font_631371_r19lvcrx9hf72e29.js"></script>
    <script src="/public/jquery-3.2.1.min.js"></script>
    <script src="/public/scripts/jquery.flexText.js"></script>
    <script src="/public/tool.js"></script>
    <link rel="stylesheet" href="/public/layui/css/layui.css">
    <link rel="stylesheet" href="/public/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="/public/pc/app.css">
    <link rel="stylesheet" href="/public/timeline.css">
    <link rel="stylesheet" href="/public/verify.css">

    <title>yy摄影平台，成就你的美</title>
</head>
<body class="body">
    {% block tip %}
    
    {% endblock %}

    {% block header %}
        <header class="header zx310">
            <div class="container clear-f">
                <a href="/" class="logo-img fl">
                    <img class="img" src="/public/images/photo1.png" alt="">
                </a>
                <ul class="header-nav-right flex-b-sc fl">
                    <a href="/" class="nav-li">首页</a>
                    <a href="/activity" class="nav-li">活动</a>
                    <a href="javascript:;" class="nav-li certified-architect-link">认证师</a>
                </ul>
                <ul class="header-login flex-b-sc fr">
                </ul>
            </div>
        </header>
    {% endblock %}

    {% block banner %}
        <div class="banner">
            <div class="container swiper-container">
                <div class="swiper-wrapper">
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/3.png');">
                    </div>
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/7.png');">
                    </div>
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/6.jpg');">
                    </div>
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/5.jpg');">
                    </div>
                    <div class="swiper-slide" style="background-image: url('/public/images/banner/4.png');">
                    </div>
                </div>
                <div class ="swiper-pagination"></div>
            </div>
        </div>
    {% endblock %}

    {% block top %}
       
    {% endblock %}

    {% block middle %}
       
    {% endblock %}

    {% block bottom %}
        
    {% endblock %}

    {% block footer %}
        <footer class="footer">
            <div class="footer-top" style="background-image:url('/public/images/banner/13.png')">
            </div>
            <div class="footer-bottom">
                <p class="text">2018 YI&YI Photo Web</p>
                <p class="text">YY摄影网，大型摄影交流网站</p>
                <a href="/public/dist/index.html">管理后台</a>
            </div>
        </footer>
    {% endblock %}

    {% block slide %}
        <div class="slider-sort-div zx310">
            <div class="trangle"></div>
            <div class="sort-show-list flex-b-sc fw-wr">
            </div>
        </div>
    {% endblock %}
    <script src="/public/swiper-3.4.2.min.js"></script>
    <script src="/public/layui/layui.js"></script>
    <script src="/public/modernizr.js"></script>
    <script src="/public/scripts/comment.js"></script>
    <script src="/public/scripts/login.js"></script>
    <script src="/public/verify.js"></script>

    {% block script %}
        
    {% endblock %}

    <script>
        // 处理pcRouter用户id
        $('.certified-architect-link').on('click', function() {
            var userId = cacheGet('userLoginInfo').id || 0;
            location.href = '/certified_architect?userId='+userId;
        })



        // 缓存所有分类及显示
        var sortData = cacheGet('sortData');
        if(!!sortData) {
            var sortHtml = '';
            for (let i = 0; i < sortData.length; i++) {
                sortHtml +=
                `
                <a class="list-item" href="sort?sortId=${sortData[i].id}">
                    <div class="item-text zx310">
                        <h3 class="t-title">${sortData[i].name}</h3>
                    </div>
                    <div class="list-img-div">
                        <div class="item-img" style="background-image:url(${sortData[i].cover})"></div>
                        <div class="item-cover"></div>
                    </div>
                </a>
                `;
                $('.sort-show-list').html(sortHtml);
            }
        } else {
            $.get({
                url: '/operation/sort',
                success: function(result){
                    cacheSet('sortData', result);
                },
                error: function(err) {
                    alert('网络中断，请稍候再刷新！');
                }
            })
        }

        // 禁用右键
        document.oncontextmenu = function (event) {
            if (window.event) {
                event = window.event;
            } try {
                var the = event.srcElement;
                if (!((the.tagName == "INPUT" && the.type.toLowerCase() == "text") || the.tagName == "TEXTAREA")) {
                    return false;
                }
                return true;
            } catch (e) {
                return false;
            }
        };

        // 固定块
        layui.use(['util', 'layer'], function(){
            var util = layui.util,
                layer = layui.layer;

            //固定块
            util.fixbar({
                bar2: ' ',
                css: {right: 10, bottom: 30},
                bgcolor: '#393D49',
                click: function(type){
                    if(type === 'bar2'){
                        if($('.slider-sort-div').css('display') == 'block'){
                            $('.slider-sort-div').fadeOut();
                        } else {
                            $('.slider-sort-div').fadeIn();
                        }
                    }
                }
            });
        });
    </script>
</body>
</html>