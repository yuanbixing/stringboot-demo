/*
Navicat MySQL Data Transfer

Source Server         : blog
Source Server Version : 50716
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2018-07-25 15:53:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bl_attach
-- ----------------------------
DROP TABLE IF EXISTS `bl_attach`;
CREATE TABLE `bl_attach` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) DEFAULT NULL,
  `ftype` varchar(50) DEFAULT NULL,
  `fkey` varchar(100) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_attach
-- ----------------------------
INSERT INTO `bl_attach` VALUES ('10', 'a4.jpg', 'image', 'article/2018/02/7lt38sn21ci3qobfpach5r9cm7.jpg', '3', '1519809459');

-- ----------------------------
-- Table structure for bl_code_task
-- ----------------------------
-- DROP TABLE IF EXISTS `bl_code_task`;
-- CREATE TABLE `bl_code_task` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `msg` varchar(500) DEFAULT NULL,
--   `email` varchar(100) DEFAULT NULL,
--   `status` char(1) DEFAULT '0',
--   `function_name` varchar(100) DEFAULT NULL,
--   `send_time` datetime DEFAULT NULL,
--   `msg_id` varchar(100) DEFAULT NULL,
--   `user_id` decimal(10,0) DEFAULT NULL,
--   `result` varchar(100) DEFAULT '0',
--   `type` varchar(100) DEFAULT NULL,
--   `way` decimal(10,0) DEFAULT NULL,
--   `ip` varchar(100) DEFAULT NULL,
--   `deleted` char(1) DEFAULT '0',
--   `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_code_task
-- ----------------------------

-- ----------------------------
-- Table structure for bl_comments
-- ----------------------------
DROP TABLE IF EXISTS `bl_comments`;
CREATE TABLE `bl_comments` (
  `coid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT '0',
  `created` int(11) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `author_id` int(11) DEFAULT '0',
  `owner_id` int(11) DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `content` longtext,
  `type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `parent` int(11) DEFAULT '0',
  PRIMARY KEY (`coid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for bl_contents
-- ----------------------------
DROP TABLE IF EXISTS `bl_contents`;
CREATE TABLE `bl_contents` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL,
  `thumb_img` varchar(500) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `modified` int(11) DEFAULT NULL,
  `content` longtext,
  `author_id` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `fmt_type` varchar(50) DEFAULT 'markdown',
  `tags` varchar(200) DEFAULT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `hits` int(11) DEFAULT '0',
  `comments_num` int(11) DEFAULT '0',
  `allow_comment` int(11) DEFAULT NULL,
  `allow_ping` int(11) DEFAULT NULL,
  `allow_feed` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_contents
-- ----------------------------
INSERT INTO `bl_contents` VALUES ('1', '关于', 'about', null, '1514428648', '1516342230', '### 目的\r\n  开通本网站目的很简单。\r\n\r\n主要是熟悉整个流程，以及linux的学习。\r\n\r\n另外就是方便整理一些笔记，属实是学习到了很多东西。\r\n\r\n在这条道路上走着，还是给自己留一点东西下来吧~\r\n\r\n:wink::wink::wink::wink:\r\n### 介绍\r\n主修Java\r\n\r\n90后，双子座，中度强迫症吧~~~\r\n\r\n音乐：纯音 电音 偏欧美 日系 粤语\r\n\r\n电影：偏科幻 搞笑\r\n\r\n目前经常出没地上海，老家在遥远的四川遂宁\r\n\r\n### 网站\r\n本网站主语言Java~~\r\n\r\n使用了Spring Boot开发，网页主题采用了漂亮的 Pinghsu\r\n\r\n数据库是比较常规的MySql\r\n', '1', 'page', 'publish', 'markdown', '', '', '399', '0', '1', '1', '1');
INSERT INTO `bl_contents` VALUES ('2', '网站使用技术及更新记录', null, null, '1514428648', '1517623763', '## 前言\r\n本项目修改自开源项目Tale，\r\n\r\n## 使用相关\r\n为了表示感谢原作者以及以后的学习这里放点链接\r\n\r\n- <p><a href=\'https://gitee.com/biezhi/tale\' target=\'_blank\'>Tale</a> 博客系统</p>\r\n- <p><a href=\'https://github.com/chakhsu/pinghsu\' target=\'_blank\'>Pinghsu</a> 主题</p>\r\n- <p><a href=\'https://github.com/lets-blade/blade\' target=\'_blank\'>Blade</a> 轻量级mvc框架</p>\r\n- <p><a href=\'https://github.com/vdurmont/emoji-java\' target=\'_blank\'>Emoji-Java</a> 轻量级的java库</p>\r\n- <p><a href=\'https://github.com/subchen/jetbrick-template-2x\' target=\'_blank\'>Jetbrick-Template</a> 模板引擎</p>\r\n\r\n## 网站更新\r\n\r\n- 添加了独立搜索页\r\n- 修改原系统数据库Sqllite为MySql\r\n## 变迁历史\r\n- 于2017年11月上线\r\n- 于2017年12月买了第一个域名www.yangxs.ink\r\n\r\n## 服务器\r\n- 阿里云 CenterOS\r\n- 域名也是阿里云的', '1', 'post', 'publish', 'markdown', '博客,日志', 'Daily', '377', '0', '1', '1', '1');
INSERT INTO `bl_contents` VALUES ('3', '友情链接', 'links', null, '1514428648', '1515165967', '## 友情链接\r\n\r\n- :lock: <a href=\'http://www.begincode.net\' target=\'blank\'>Java技术论坛</a>\r\n\r\n## 链接须知\r\n> 请确定贵站可以稳定运营\r\n> 原创博客优先，技术类博客优先，设计、视觉类博客优先\r\n> 经常过来访问和评论，眼熟的\r\n\r\n备注：默认申请友情链接均为内页（当前页面）\r\n\r\n## 基本信息\r\n\r\n                网站名称：yangxs博客\r\n                网站地址：www.yangxs.ink\r\n请在当页通过评论来申请友链，其他地方不予回复\r\n\r\n暂时先这样，同时欢迎互换友链，这个页面留言即可。 ^_^\r\n\r\n还有，我会不定时对无法访问的网址进行清理，请保证自己的链接长期有效。', '1', 'page', 'publish', 'markdown', '', '', '416', '0', '1', '1', null);
INSERT INTO `bl_contents` VALUES ('5', '最近听的歌曲', null, null, '1514431277', '1516349439', '### 分享一些歌曲：\r\n---\r\n<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=330 height=86 src=\"//music.163.com/outchain/player?type=2&id=509313150&auto=0&height=66\"></iframe>\r\n\r\n<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=330 height=86 src=\"//music.163.com/outchain/player?type=2&id=436514415&auto=0&height=66\"></iframe>\r\n\r\n<iframe frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" width=330 height=86 src=\"//music.163.com/outchain/player?type=2&id=515143305&auto=0&height=66\"></iframe>', '1', 'post', 'publish', 'markdown', '音乐', 'Music', '309', '0', '1', '1', '1');
-- ----------------------------
-- Table structure for bl_email_task
-- ----------------------------
-- DROP TABLE IF EXISTS `bl_email_task`;
-- CREATE TABLE `bl_email_task` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `cid` int(11) DEFAULT NULL,
--   `author` varchar(100) DEFAULT NULL,
--   `msg` varchar(500) DEFAULT NULL,
--   `email` varchar(100) DEFAULT NULL,
--   `status` char(1) DEFAULT '0',
--   `function_name` varchar(100) DEFAULT NULL,
--   `ip` varchar(100) DEFAULT NULL,
--   `send_time` datetime DEFAULT NULL,
--   `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bl_metas
-- ----------------------------
DROP TABLE IF EXISTS `bl_metas`;
CREATE TABLE `bl_metas` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT '0',
  `parent` int(11) DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_metas
-- ----------------------------
INSERT INTO `bl_metas` VALUES ('4', '音乐', '音乐', 'tag', null, '0', '0');
INSERT INTO `bl_metas` VALUES ('16', '博客', '博客', 'tag', null, '0', '0');
INSERT INTO `bl_metas` VALUES ('17', '日志', '日志', 'tag', null, '0', '0');

-- ----------------------------
-- Table structure for bl_options
-- ----------------------------
DROP TABLE IF EXISTS `bl_options`;
CREATE TABLE `bl_options` (
  `name` varchar(100) NOT NULL,
  `value` longtext NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_options
-- ----------------------------
INSERT INTO `bl_options` VALUES ('allow_install', '0', '是否允许重新安装博客');
INSERT INTO `bl_options` VALUES ('site_description', '', null);
INSERT INTO `bl_options` VALUES ('site_keywords', '', null);
INSERT INTO `bl_options` VALUES ('site_theme', 'default', null);
INSERT INTO `bl_options` VALUES ('site_title', '', null);
INSERT INTO `bl_options` VALUES ('site_url', '', null);
INSERT INTO `bl_options` VALUES ('social_github', 'yangxsa', null);
INSERT INTO `bl_options` VALUES ('social_twitter', 'yangxs3', null);
INSERT INTO `bl_options` VALUES ('social_weibo', '', null);
INSERT INTO `bl_options` VALUES ('social_zhihu', '', null);

-- ----------------------------
-- Table structure for bl_relationships
-- ----------------------------
DROP TABLE IF EXISTS `bl_relationships`;
CREATE TABLE `bl_relationships` (
  `cid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_relationships
-- ----------------------------
INSERT INTO `bl_relationships` VALUES ('2', '14');
INSERT INTO `bl_relationships` VALUES ('2', '16');
INSERT INTO `bl_relationships` VALUES ('2', '17');
INSERT INTO `bl_relationships` VALUES ('5', '4');
INSERT INTO `bl_relationships` VALUES ('5', '14');
INSERT INTO `bl_relationships` VALUES ('5', '15');
INSERT INTO `bl_relationships` VALUES ('7', '6');
INSERT INTO `bl_relationships` VALUES ('7', '13');
INSERT INTO `bl_relationships` VALUES ('8', '9');
INSERT INTO `bl_relationships` VALUES ('8', '10');
INSERT INTO `bl_relationships` VALUES ('8', '13');
INSERT INTO `bl_relationships` VALUES ('10', '10');
INSERT INTO `bl_relationships` VALUES ('10', '12');
INSERT INTO `bl_relationships` VALUES ('10', '18');
INSERT INTO `bl_relationships` VALUES ('11', '12');
INSERT INTO `bl_relationships` VALUES ('11', '19');
INSERT INTO `bl_relationships` VALUES ('11', '20');
INSERT INTO `bl_relationships` VALUES ('12', '12');
INSERT INTO `bl_relationships` VALUES ('12', '20');
INSERT INTO `bl_relationships` VALUES ('12', '21');

-- ----------------------------
-- Table structure for bl_safe_code
-- ----------------------------
-- DROP TABLE IF EXISTS `bl_safe_code`;
-- CREATE TABLE `bl_safe_code` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `user_id` int(11) DEFAULT NULL,
--   `scene_id` varchar(32) DEFAULT NULL,
--   `open_id` varchar(100) DEFAULT NULL,
--   `s_key` varchar(200) DEFAULT NULL,
--   `s_value` varchar(100) DEFAULT NULL,
--   `scangen_key` varchar(100) DEFAULT NULL,
--   `business_type` varchar(32) DEFAULT NULL,
--   `scan_time` datetime DEFAULT NULL,
--   `expiry_time` datetime DEFAULT NULL,
--   `update_time` datetime DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bl_safe_code
-- ----------------------------

-- ----------------------------
-- Table structure for bl_users
-- ----------------------------
DROP TABLE IF EXISTS `bl_users`;
CREATE TABLE `bl_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `home_url` varchar(255) DEFAULT NULL,
  `screen_name` varchar(100) DEFAULT NULL,
  `created` int(11) DEFAULT NULL,
  `activated` int(11) DEFAULT NULL,
  `logged` int(11) DEFAULT NULL,
  `group_name` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `AK_UNQ_BL_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- -- ----------------------------
-- -- Table structure for bl_visited
-- -- ----------------------------
-- DROP TABLE IF EXISTS `bl_visited`;
-- CREATE TABLE `bl_visited` (
--   `id` int(11) NOT NULL AUTO_INCREMENT,
--   `user_id` int(11) DEFAULT NULL,
--   `ip` varchar(50) DEFAULT NULL,
--   `country` varchar(50) DEFAULT NULL,
--   `area` varchar(50) DEFAULT NULL,
--   `region` varchar(50) DEFAULT NULL,
--   `city` varchar(50) DEFAULT NULL,
--   `county` varchar(50) DEFAULT NULL,
--   `visited_num` int(11) DEFAULT '1',
--   `create_time` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=1441 DEFAULT CHARSET=utf8;
--
-- -- ----------------------------
-- -- Records of bl_visited
-- -- ----------------------------
-- INSERT INTO `bl_visited` VALUES ('1', null, '120.79.30.96', '中国', '华南', '广东省', '深圳市', '', '24', '1516244947');
-- INSERT INTO `bl_visited` VALUES ('2', null, '180.169.128.212', '中国', '华东', '上海市', '上海市', '', '192', '1526893002');
