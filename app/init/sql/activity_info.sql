CREATE TABLE IF NOT EXISTS `activity_info` (
  `id` int(64) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(255) DEFAULT '' comment '活动编号',
  `name` VARCHAR(255) DEFAULT '' comment '活动标题',
  `initiator` VARCHAR(255) DEFAULT '' comment '活动发起者',
  `topic` VARCHAR(255) DEFAULT '' comment '活动主题',
  `describe` LONGTEXT comment '活动简介',
  `content` LONGTEXT comment '活动内容',
  `rule` LONGTEXT comment '活动规则',
  `cover` VARCHAR(255) comment '活动封面',
  `banner` VARCHAR(255) comment '活动banner',
  `create_time` bigint comment '活动创建申请时间',
  `update_time` bigint comment '活动信息编辑时间',
  `start_time` bigint comment '活动开始时间',
  `end_time` bigint comment '活动结束时间',
  `disabled` INT(2) DEFAULT 0 comment '是否禁用该活动 - 0 不禁用 - 1 禁用',
  `status` INT(2) DEFAULT 0 comment '是否审核通过 - 0 通过 - 1 不通过',
  `auditor` VARCHAR(255) DEFAULT '' comment '审核通过管理员编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
