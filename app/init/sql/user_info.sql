CREATE TABLE IF NOT EXISTS `user_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(255) DEFAULT '' comment '会员/认证师编号',
  `email` VARCHAR(255) DEFAULT '' comment '会员/认证师email',
  `phone` VARCHAR(255) DEFAULT '' comment '会员/认证师电话',
  `password` VARCHAR(255) DEFAULT '' comment '会员/认证师密码',
  `nickname` VARCHAR(255) DEFAULT '' comment '会员/认证师昵称',
  `sex` INT(2) DEFAULT 0 comment '会员/认证师性别 - 0 男 - 1 女',
  `age` INT(3) DEFAULT 0 comment '会员/认证师年龄',
  `address` VARCHAR(255) DEFAULT '' comment '会员/认证师地址',
  `portrait` VARCHAR(255) DEFAULT '' comment '会员/认证师头像',

  -- 申请认证师字段 Start
  `name` VARCHAR(255) DEFAULT '' comment '会员/认证师真实名字',
  `qq` VARCHAR(255) DEFAULT '' comment '认证师QQ',
  `wechat` VARCHAR(255) DEFAULT '' comment '认证师微信',
  `prize` VARCHAR(255) DEFAULT '' comment '申请认证师获奖作品',
  `certificate` VARCHAR(255) DEFAULT '' comment '申请认证师凭证',
  `personal_describe` VARCHAR(255) DEFAULT '' comment '认证师个人简介',
  `is_apply_certificate` INT(255) DEFAULT '' comment '是否正在申请成为认证师  -1 是 - 0 否',
  -- 申请认证师字段 End

  `personal_statement` VARCHAR(255) DEFAULT '挥一挥衣袖，不留一句宣言' comment '个人宣言',
  `bgcover` VARCHAR(255) DEFAULT '' comment '个人主页背景图',
  `create_time` bigint comment '会员/认证师注册时间',
  `update_time` bigint comment '会员/认证师信息更新时间',
  `lastest_login_time` bigint comment '会员/认证师最后登录时间',
  `integral` INT(11) DEFAULT 0 comment '会员/认证师积分',
  `disabled` INT(2) DEFAULT 0 comment '会员/认证师账号状态 - 0 正常 - 1 禁用',
  `status` INT(2) DEFAULT 0 comment '是否审核通过 - 0 通过 - 1 不通过',
  `sort` INT(2) DEFAULT 0  comment '区分会员/认证师 - 0 会员 - 2 认证师',
  `commentIds` VARCHAR(255) DEFAULT '' comment '留言的所有楼层id集合',
  `collectionIds` VARCHAR(255) DEFAULT '' comment '我的收藏作品id集合',
  `my_attentionIds` VARCHAR(255) DEFAULT '' comment '我关注的id集合',
  `attentionIds` VARCHAR(255) DEFAULT '' comment '关注我的id集合',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
