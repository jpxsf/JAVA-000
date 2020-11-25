CREATE DATABASE if not exists `mall`;

USE `mall`;

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '删除标志，0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '用户表' DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `user_address` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `phone` varchar(15) NOT NULL DEFAULT '' COMMENT '手机号',
  `province_id` tinyint(4) NOT NULL COMMENT '省',
  `city_id` tinyint(4) NOT NULL COMMENT '市',
  `district_id` tinyint(4) NOT NULL COMMENT '区',
  `detail` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `tag_id` tinyint(4) NOT NULL DEFAULT '' COMMENT '标签，0-未设置，1-家，2-公司，3-学校',
  `is_default` tinyint(4) DEFAULT '0' COMMENT '默认标志，0-非默认地址，1-是默认地址',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '删除标志，0-未删除，1-已删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '用户收货地址表' DEFAULT CHARSET=utf8mb4;


CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` varchar(255) NOT NULL DEFAULT '' COMMENT '订单id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `shop_id` bigint NOT NULL COMMENT '商铺id',
  `shop_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商铺名',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态，0-待支付，1-已取消，2-待发货，3-待收货，4-已完成，5-已关闭',
  `receiver_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `receiver_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `receiver_addr` varchar(255) NOT NULL DEFAULT '' COMMENT '收件地址',
  `total_price` bigint NOT NULL DEFAULT '0' COMMENT '总金额，乘以100，没有小数位',
  `real_price` bigint NOT NULL DEFAULT '0' COMMENT '实际支付金额',
  `discount_price` bigint NOT NULL DEFAULT '0' COMMENT '优惠金额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `pay_info_id` bigint NOT NULL COMMENT COMMENT '支付详情id',
  `finish_time` int(11) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `express_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `express_number` varchar(255) NOT NULL DEFAULT '' COMMENT '物流号',
  `express_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '删除标志，0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`user_id`),
  KEY `userid_status_idx` (`user_id, status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '订单表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `order_product` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `product_shop_id` bigint NOT NULL COMMENT '商铺id',
  `product_img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片url',,
  `product_spu_id` bigint NOT NULL COMMENT '商品spu id',
  `product_sku_id` bigint NOT NULL COMMENT '商品sku id',
  `product_spu_info` varchar(255) NOT NULL DEFAULT '' COMMENT '商品spu描述',
  `product_sku_info` varchar(255) NOT NULL DEFAULT '' COMMENT '商品sku描述',
  `product_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名',
  `product_price` varchar(255) NOT NULL DEFAULT '' COMMENT '商品原价',
  `product_count` varchar(255) NOT NULL DEFAULT '' COMMENT '商品份数',
  `product_real_price` varchar(255) NOT NULL DEFAULT '' COMMENT '商品实付价',
  `product_discount_price` varchar(255) NOT NULL DEFAULT '' COMMENT '商品优惠',
  `discount_detail_id` bigint NOT NULL COMMENT '优惠信息id',
  `status` tinyint(4) DEFAULT '0' COMMENT '商品状态，0-待发货，1-待收货，2-已收货，3-退款中，4-退款成功',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `orderid_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '订单商品表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `order_discount` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '优惠id',
  `order_id` bigint NOT NULL COMMENT '订单id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `total_price` bigint NOT NULL DEFAULT '0' COMMENT '总金额',
  `real_price` bigint NOT NULL DEFAULT '0' COMMENT '实际支付金额',
  `discount_price` bigint NOT NULL DEFAULT '0' COMMENT '优惠金额',
  `coupon_price` bigint NOT NULL DEFAULT '0'  COMMENT '优惠券抵扣金额',
  `score_price` bigint NOT NULL DEFAULT '0' COMMENT '积分抵扣金额',
  `coupon_id` varchar(255) NOT NULL DEFAULT '' COMMENT '使用的优惠券id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `orderid_idx` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '订单折扣详情表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `pay_info` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '支付id',
  `trade_number` varchar(255) NOT NULL DEFAULT '' COMMENT '交易流水号',
  `price` bigint NOT NULL DEFAULT '0' COMMENT '支付金额，乘以100，没有小数位',
  `channel_id` tinyint(4) DEFAULT '0' COMMENT '支付渠道，0-支付宝，1-微信，2-中国银行……',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tradenumber_idx` (`trade_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '支付详情表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `coupon` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `coupun_id` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券id',
  `price` bigint NOT NULL DEFAULT '0' COMMENT '优惠券金额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `valid_time` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间',
  PRIMARY KEY (`id`),
  KEY `userid_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '优惠券表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `shop` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商铺id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '商铺名',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '商铺地址',
  `score` tinyint(4) DEFAULT '0' COMMENT '商铺评分',
  `fans` bigint NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `owner_id` bigint NOT NULL DEFAULT '0' COMMENT '店主id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '开店时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '商铺表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `shop_spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shop_id` bigint NOT NULL DEFAULT '0' COMMENT '店铺id',
  `spu_id` bigint NOT NULL DEFAULT '0' COMMENT 'spu id',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '删除标志，0-未删除，1-已删除',
  PRIMARY KEY (`id`),
  KEY `shopid_idx` (`shop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '商铺SPU表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `spu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'spu id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `is_delete` tinyint(4) DEFAULT '0' COMMENT '删除标志，0-未删除，1-已删除',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT 'SPU表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `attr` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '属性id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT '属性表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sku_id` bigint NOT NULL DEFAULT '0' COMMENT 'sku id',
  `attr_id` bigint NOT NULL DEFAULT '0' COMMENT '属性id',
  PRIMARY KEY (`id`),
  KEY `skuid_idx` (`sku_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT 'sku属性表' DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `sku` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sku_id` bigint NOT NULL DEFAULT '0' COMMENT 'sku id',
  `spu_id` bigint NOT NULL DEFAULT '0' COMMENT 'spu id',
  PRIMARY KEY (`id`),
  KEY `spuid_idx` (`spu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 COMMENT 'spu与sku关联表' DEFAULT CHARSET=utf8mb4;

