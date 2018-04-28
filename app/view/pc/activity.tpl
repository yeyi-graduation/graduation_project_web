{% extends "./template/template.tpl" %}

{% block top %}
    
{% endblock %}

{% block middle %}
    <div class="activity-ing-hot">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">热门进行中活动</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in activityData %}
                    <div class="list-item" style="background-image:url({{ item.cover }})">
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>

    <div class="activity-ing">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">全部进行中活动</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in activityAllData %}
                    <div class="list-item" href="activity_detail?activityId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                        </div>
                        <div class="item-text">
                            <h3 class="t-title">{{ item.name }}</h3>
                            <p class="t-describe">{{ item.describe }}</p>
                            <div class="t-type">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-zuixinlianzai"></use>
                                </svg>
                                {{ item.author }}
                            </div>
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
{% endblock %}

{% block bottom %}
    <div class="activity-ed">
        <div class="container clear-f">
            <div class="title">
                /<span class="title-sm">YY摄影</span>
                <span class="title-bg">结束活动回顾</span>/
            </div>
            <div class="activity-list flex-b-sbc fw-wr">
                {% for item in activityEndData %}
                    <div class="list-item" href="activity_detail?activityId={{ item.id }}">
                        <div class="list-img-div">
                            <div class="item-img" style="background-image:url({{ item.cover }})"></div>
                        </div>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>
    <a class="publish-activity-btn" href="javascript:;">发布活动</a>
{% endblock %}