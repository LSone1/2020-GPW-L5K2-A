/*
 Navicat MySQL Data Transfer

 Source Server         : 本地
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : ccl

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 07/03/2020 09:57:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
INSERT INTO `fa_admin` VALUES (1, 'admin', 'Admin', '5fc49cec61663ccf7ce9c33d26a45d4b', 'defc27', '/assets/img/avatar.png', 'admin@admin.com', 0, 1583543204, '127.0.0.1', 1492186163, 1583543204, 'd4679159-eb6b-46d7-9cda-4f6f0aa02fca', 'normal');
INSERT INTO `fa_admin` VALUES (7, 'test1', 'test1', '364734d005909aa64d43dd4048786a77', 'KOxJUo', '/assets/img/avatar.png', '', 0, 1583540859, '127.0.0.1', 1583540827, 1583541534, '', 'normal');
INSERT INTO `fa_admin` VALUES (8, 'test2', 'test2', 'f8ee50c38a962c66bd0580820872bffc', '3mVKYz', '/assets/img/avatar.png', '', 0, 1583541540, '127.0.0.1', 1583540892, 1583541540, '7841de12-2203-47a1-9606-8a6c0f8d1f3a', 'normal');
INSERT INTO `fa_admin` VALUES (10, 'test3', 'test3', '9835e24b37b2f72b9f8cf3e739f4e5ab', 's23Etu', '/assets/img/avatar.png', '', 0, 1583543842, '127.0.0.1', 1583543627, 1583543842, '3fd9cc2f-be71-4147-82be-80424eb2eb71', 'normal');

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 220 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
INSERT INTO `fa_admin_log` VALUES (1, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Findex%2Findex', '登录', '{\"url\":\"\\/admin\\/index\\/index\",\"__token__\":\"b3ec6c86cfeb2fb7f08df129644897cf\",\"username\":\"admin\",\"captcha\":\"la5l\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583087447);
INSERT INTO `fa_admin_log` VALUES (2, 1, 'admin', '/admin/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"1417\",\"token\":\"0acf97dd-b439-4cdc-9934-05bfa81eeb15\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253774);
INSERT INTO `fa_admin_log` VALUES (3, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253775);
INSERT INTO `fa_admin_log` VALUES (4, 1, 'admin', '/admin/command/get_field_list', '在线命令管理', '{\"table\":\"ccl_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253795);
INSERT INTO `fa_admin_log` VALUES (5, 1, 'admin', '/admin/command/get_field_list', '在线命令管理', '{\"table\":\"ccl_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253802);
INSERT INTO `fa_admin_log` VALUES (6, 1, 'admin', '/admin/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253835);
INSERT INTO `fa_admin_log` VALUES (7, 1, 'admin', '/admin/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253838);
INSERT INTO `fa_admin_log` VALUES (8, 1, 'admin', '/admin/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"1\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253844);
INSERT INTO `fa_admin_log` VALUES (9, 1, 'admin', '/admin/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"1\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Category.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253888);
INSERT INTO `fa_admin_log` VALUES (10, 1, 'admin', '/admin/command/get_field_list', '在线命令管理', '{\"table\":\"ccl_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253889);
INSERT INTO `fa_admin_log` VALUES (11, 1, 'admin', '/admin/command/execute/ids/1', '在线命令管理 运行', '{\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583253952);
INSERT INTO `fa_admin_log` VALUES (12, 1, 'admin', '/admin/command/del/ids/1', '在线命令管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254062);
INSERT INTO `fa_admin_log` VALUES (13, 1, 'admin', '/admin/command/del/ids/2', '在线命令管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254064);
INSERT INTO `fa_admin_log` VALUES (14, 1, 'admin', '/admin/command/get_field_list', '在线命令管理', '{\"table\":\"ccl_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254066);
INSERT INTO `fa_admin_log` VALUES (15, 1, 'admin', '/admin/command/get_field_list', '在线命令管理', '{\"table\":\"fa_category\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254077);
INSERT INTO `fa_admin_log` VALUES (16, 1, 'admin', '/admin/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"0\",\"table\":\"fa_category\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254083);
INSERT INTO `fa_admin_log` VALUES (17, 1, 'admin', '/admin/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"1\",\"delete\":\"1\",\"force\":\"0\",\"table\":\"fa_category\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254127);
INSERT INTO `fa_admin_log` VALUES (18, 1, 'admin', '/admin/auth/rule/del/ids/3', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254188);
INSERT INTO `fa_admin_log` VALUES (19, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254189);
INSERT INTO `fa_admin_log` VALUES (20, 1, 'admin', '/admin/command/del/ids/3', '在线命令管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254217);
INSERT INTO `fa_admin_log` VALUES (21, 1, 'admin', '/admin/auth/rule/del/ids/85', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"85\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254253);
INSERT INTO `fa_admin_log` VALUES (22, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254253);
INSERT INTO `fa_admin_log` VALUES (23, 1, 'admin', '/admin/addon/state', '插件管理 禁用启用', '{\"name\":\"command\",\"action\":\"disable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254267);
INSERT INTO `fa_admin_log` VALUES (24, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254268);
INSERT INTO `fa_admin_log` VALUES (25, 1, 'admin', '/admin/addon/uninstall', '插件管理', '{\"name\":\"command\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254270);
INSERT INTO `fa_admin_log` VALUES (26, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254270);
INSERT INTO `fa_admin_log` VALUES (27, 1, 'admin', '/admin/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"1417\",\"token\":\"0acf97dd-b439-4cdc-9934-05bfa81eeb15\",\"version\":\"1.0.5\",\"faversion\":\"1.0.0.20200228_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254277);
INSERT INTO `fa_admin_log` VALUES (28, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254278);
INSERT INTO `fa_admin_log` VALUES (29, 1, 'admin', '/admin/auth/rule/multi/ids/undefined', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"undefined\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254371);
INSERT INTO `fa_admin_log` VALUES (30, 1, 'admin', '/admin/auth/rule/edit/ids/73?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"3439efeb5f830ae96a80d0c8c1523d07\",\"row\":{\"ismenu\":\"0\",\"pid\":\"66\",\"name\":\"user\\/group\",\"title\":\"\\u4f1a\\u5458\\u5206\\u7ec4\",\"icon\":\"fa fa-users\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"73\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254380);
INSERT INTO `fa_admin_log` VALUES (31, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254381);
INSERT INTO `fa_admin_log` VALUES (32, 1, 'admin', '/admin/auth/rule/edit/ids/79?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"94162ddbdf74ed437782f4ec03a24512\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/rule\",\"title\":\"\\u4f1a\\u5458\\u89c4\\u5219\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"79\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254396);
INSERT INTO `fa_admin_log` VALUES (33, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254397);
INSERT INTO `fa_admin_log` VALUES (34, 1, 'admin', '/admin/user/user/multi/ids/2', '会员管理 会员管理 批量更新', '{\"ids\":\"2\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583254633);
INSERT INTO `fa_admin_log` VALUES (35, 1, 'admin', '/admin/user/user/edit/ids/2?dialog=1', '会员管理 会员管理 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"lijianyun\",\"nickname\":\"\\u554a\\u554a\\u554a\\u554a\\u554a\",\"password\":\"\",\"email\":\"1979226175@qq.com\",\"mobile\":\"13556609714\",\"avatar\":\"\\/uploads\\/20200302\\/062317a94b8be7fa256aee35bb654a9f.jpg\",\"gender\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583256008);
INSERT INTO `fa_admin_log` VALUES (36, 1, 'admin', '/admin/user/user/del/ids/3', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583256039);
INSERT INTO `fa_admin_log` VALUES (37, 1, 'admin', '/admin/auth/rule/edit/ids/114?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"6f592e310dc18c0a067bd307215a4c48\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user_case\",\"title\":\"\\u5ba2\\u6237\\u63d0\\u4ea4\\u6cd5\\u5f8b\\u4e8b\\u4ef6\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"114\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583256440);
INSERT INTO `fa_admin_log` VALUES (38, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583256441);
INSERT INTO `fa_admin_log` VALUES (39, 1, 'admin', '/admin/auth/rule/edit/ids/114?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"ee756956c67e48d4ba23241798a99ebb\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user_case\",\"title\":\"\\u4f1a\\u5458\\u6848\\u4ef6\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"114\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583256464);
INSERT INTO `fa_admin_log` VALUES (40, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583256464);
INSERT INTO `fa_admin_log` VALUES (41, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"9b724bf569ffdb4ba99342d08ac8a018\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"staff\\/staff\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258180);
INSERT INTO `fa_admin_log` VALUES (42, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258180);
INSERT INTO `fa_admin_log` VALUES (43, 1, 'admin', '/admin/auth/rule/edit/ids/120?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"229af620ddc476e56748c7e2f47f34a1\",\"row\":{\"ismenu\":\"1\",\"pid\":\"120\",\"name\":\"staff\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"120\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258208);
INSERT INTO `fa_admin_log` VALUES (44, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258208);
INSERT INTO `fa_admin_log` VALUES (45, 1, 'admin', '/admin/auth/rule/edit/ids/108?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"75c78920473d4f34e4a7308fd00ff395\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user_group\",\"title\":\"\\u4f1a\\u5458\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"108\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258318);
INSERT INTO `fa_admin_log` VALUES (46, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258318);
INSERT INTO `fa_admin_log` VALUES (47, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"27b923faab16487799a0676cf91e359c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"staff\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258378);
INSERT INTO `fa_admin_log` VALUES (48, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"ba285783d0932678be56df3103667628\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"staff2\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258384);
INSERT INTO `fa_admin_log` VALUES (49, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258384);
INSERT INTO `fa_admin_log` VALUES (50, 1, 'admin', '/admin/auth/rule/edit/ids/127?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d63fbfddbafc6b1eb2dddee6c378b977\",\"row\":{\"ismenu\":\"1\",\"pid\":\"133\",\"name\":\"staff\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"127\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258402);
INSERT INTO `fa_admin_log` VALUES (51, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258402);
INSERT INTO `fa_admin_log` VALUES (52, 1, 'admin', '/admin/auth/rule/edit/ids/133?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d77d582303ddba542b15768a98b0ecb2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"staff2\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"133\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258429);
INSERT INTO `fa_admin_log` VALUES (53, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258429);
INSERT INTO `fa_admin_log` VALUES (54, 1, 'admin', '/admin/auth/rule/edit/ids/127?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"3d1fd027ec8290e6a9b6e1424cd1a848\",\"row\":{\"ismenu\":\"1\",\"pid\":\"133\",\"name\":\"staff\",\"title\":\"\\u5458\\u5de5\\u5217\\u8868\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"127\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258443);
INSERT INTO `fa_admin_log` VALUES (55, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258444);
INSERT INTO `fa_admin_log` VALUES (56, 1, 'admin', '/admin/staff/add?dialog=1', '员工列表 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"25\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"15000\",\"create_time\":\"2020-03-04 02:01:07\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258491);
INSERT INTO `fa_admin_log` VALUES (57, 1, 'admin', '/admin/staff/add?dialog=1', '员工列表 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"111\",\"password\":\"111\",\"age\":\"1\",\"job\":\"111\",\"belongs\":\"0.00\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258649);
INSERT INTO `fa_admin_log` VALUES (58, 1, 'admin', '/admin/staff/edit/ids/3?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"111\",\"password\":\"123456\",\"age\":\"1\",\"job\":\"111\",\"belongs\":\"0.00\",\"create_time\":\"2020-03-07 02:05:38\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258740);
INSERT INTO `fa_admin_log` VALUES (59, 1, 'admin', '/admin/staff/edit/ids/3?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"111\",\"password\":\"\",\"age\":\"1\",\"job\":\"111\",\"belongs\":\"0.00\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258876);
INSERT INTO `fa_admin_log` VALUES (60, 1, 'admin', '/admin/staff/del/ids/3', '员工列表 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583258956);
INSERT INTO `fa_admin_log` VALUES (61, 1, 'admin', '/admin/staff/edit/ids/2?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"25\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"15000.00\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583259106);
INSERT INTO `fa_admin_log` VALUES (62, 1, 'admin', '/admin/staff/edit/ids/1?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"45\",\"job\":\"\\u9ad8\\u7ea7\\u5f8b\\u5e08\",\"belongs\":\"5000.00\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583259111);
INSERT INTO `fa_admin_log` VALUES (63, 1, 'admin', '/admin/staff/edit/ids/2?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u5f8b\\u5e08\",\"password\":\"\",\"age\":\"25\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"15000.00\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583259119);
INSERT INTO `fa_admin_log` VALUES (64, 1, 'admin', '/admin/staff/index', '员工列表 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583259140);
INSERT INTO `fa_admin_log` VALUES (65, 1, 'admin', '/admin/staff/index', '员工列表 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"0\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"0\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583259178);
INSERT INTO `fa_admin_log` VALUES (66, 1, 'admin', '/admin/user_case/edit/ids/1?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u611f\\u60c5\\u6848\\u4ef6\",\"week\":\"1\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"1500.00\",\"start_time\":\"2020-03-02 12:20:56\",\"end_time\":\"2020-03-04 02:39:13\",\"contents\":\"1111\",\"reason\":\"\",\"evidence\":\"\\u4ee5\\u4e3a\\u6740\\u5c0f\\u4e09\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260765);
INSERT INTO `fa_admin_log` VALUES (67, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"week\":\"0\",\"push_status\":\"0\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"-0.01\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u662fcvbcvbcbc\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260795);
INSERT INTO `fa_admin_log` VALUES (68, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"week\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"28000\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u8fd9\\u4e2a\\u4eba\\u88ab\\u5f3a\\u66b4\\u4e86\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260825);
INSERT INTO `fa_admin_log` VALUES (69, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"week\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"28000.00\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u8fd9\\u4e2a\\u4eba\\u88ab\\u5f3a\\u66b4\\u4e86\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260833);
INSERT INTO `fa_admin_log` VALUES (70, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"week\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"28000.00\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u8fd9\\u4e2a\\u4eba\\u88ab\\u5f3a\\u66b4\\u4e86\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260849);
INSERT INTO `fa_admin_log` VALUES (71, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"28000.00\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u8fd9\\u4e2a\\u4eba\\u88ab\\u5f3a\\u66b4\\u4e86\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260880);
INSERT INTO `fa_admin_log` VALUES (72, 1, 'admin', '/admin/user_case/edit/ids/7?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u884c\\u653f\\u6848\\u4ef6\",\"staff_id\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"0.00\",\"start_time\":\"2020-03-04 02:41:44\",\"end_time\":\"\",\"contents\":\"111111111111111111\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260912);
INSERT INTO `fa_admin_log` VALUES (73, 1, 'admin', '/admin/user_case/edit/ids/6?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"2500\",\"start_time\":\"2020-03-04 02:42:08\",\"end_time\":\"\",\"contents\":\"111111111111111\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583260930);
INSERT INTO `fa_admin_log` VALUES (74, 1, 'admin', '/admin/auth/rule/edit/ids/134?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"eacb3255d21c3feb11c7857c04f00fe2\",\"row\":{\"ismenu\":\"0\",\"pid\":\"0\",\"name\":\"case_schedule\",\"title\":\"\\u5458\\u5de5\\u5de5\\u4f5c\\u65f6\\u95f4\\u5b89\\u6392\\u8868\\u9488\\u5bf9\\u4e8e\\u6bcf\\u4e2a\\u4e8b\\u4ef6\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"134\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583261814);
INSERT INTO `fa_admin_log` VALUES (75, 1, 'admin', '/admin/auth/rule/edit/ids/134?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"c86d7793337055e84d8eb446a51cd1be\",\"row\":{\"ismenu\":\"0\",\"pid\":\"114\",\"name\":\"case_schedule\",\"title\":\"\\u5458\\u5de5\\u5de5\\u4f5c\\u65f6\\u95f4\\u5b89\\u6392\\u8868\\u9488\\u5bf9\\u4e8e\\u6bcf\\u4e2a\\u4e8b\\u4ef6\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"134\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583261827);
INSERT INTO `fa_admin_log` VALUES (76, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583261828);
INSERT INTO `fa_admin_log` VALUES (77, 1, 'admin', '/admin/user_case/del/ids/10', '会员案件 删除', '{\"action\":\"del\",\"ids\":\"10\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583263259);
INSERT INTO `fa_admin_log` VALUES (78, 1, 'admin', '/admin/auth/rule/edit/ids/108?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"4ede6c26fa9ab4201214da4772745a7a\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user_group\",\"title\":\"\\u4f1a\\u5458\\u7ec4\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"108\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583266058);
INSERT INTO `fa_admin_log` VALUES (79, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583266059);
INSERT INTO `fa_admin_log` VALUES (80, 1, 'admin', '/admin/auth/rule/edit/ids/92?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"8f5169b2a9f4713b5698603eca1d3747\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"command\",\"title\":\"\\u5728\\u7ebf\\u547d\\u4ee4\\u7ba1\\u7406\",\"icon\":\"fa fa-terminal\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583266074);
INSERT INTO `fa_admin_log` VALUES (81, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583266075);
INSERT INTO `fa_admin_log` VALUES (82, 0, 'Unknown', '/staff/index/login?url=%2Fstaff', '', '{\"url\":\"\\/staff\",\"__token__\":\"096f77a77d8f9239d7375342e5fde064\",\"username\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583268359);
INSERT INTO `fa_admin_log` VALUES (83, 0, 'Unknown', '/staff/index/login?url=%2Fstaff', '', '{\"url\":\"\\/staff\",\"__token__\":\"c031b9174f4dcfd2595e1c7a9de390bb\",\"username\":\"\\u5f20\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583268381);
INSERT INTO `fa_admin_log` VALUES (84, 1, 'admin', '/staff/index/login?url=%2Fstaff%2Fdashboard', '', '{\"url\":\"\\/staff\\/dashboard\",\"__token__\":\"90f9a3eb4455f900133e52476f021417\",\"username\":\"\\u5f20\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583270174);
INSERT INTO `fa_admin_log` VALUES (85, 1, 'admin', '/staff/index/login?url=%2Fstaff%2Fdashboard', '', '{\"url\":\"\\/staff\\/dashboard\",\"__token__\":\"90f9a3eb4455f900133e52476f021417\",\"username\":\"\\u5f20\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583270183);
INSERT INTO `fa_admin_log` VALUES (86, 1, 'admin', '/staff/index/login?url=%2Fstaff%2Fdashboard', '', '{\"url\":\"\\/staff\\/dashboard\",\"__token__\":\"90f9a3eb4455f900133e52476f021417\",\"username\":\"\\u5f20\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583270243);
INSERT INTO `fa_admin_log` VALUES (87, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"4f2b0a684b68e34288004749decb25b1\",\"username\":\"admin\",\"captcha\":\"7uuy\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583270495);
INSERT INTO `fa_admin_log` VALUES (88, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583272583);
INSERT INTO `fa_admin_log` VALUES (89, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fauth%2Fgroup%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin\\/auth\\/group?ref=addtabs\",\"__token__\":\"7c98626d84ab3ff95bded56bccacbd9a\",\"username\":\"admin\",\"captcha\":\"xd4u\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583334626);
INSERT INTO `fa_admin_log` VALUES (90, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fauth%2Fgroup%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/auth\\/group?ref=addtabs\",\"__token__\":\"488071345228a8ba06f9a2f9e037fb3b\",\"username\":\"admin\",\"captcha\":\"ulwz\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583334635);
INSERT INTO `fa_admin_log` VALUES (91, 1, 'admin', '/admin/user_case/edit/ids/11?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"2\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"3500\",\"start_time\":\"2020-03-04 23:14:31\",\"end_time\":\"\",\"contents\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583334878);
INSERT INTO `fa_admin_log` VALUES (92, 1, 'admin', '/admin/staff/edit/ids/2?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u5f8b\\u5e08\",\"password\":\"\",\"age\":\"25\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"15000.00\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335286);
INSERT INTO `fa_admin_log` VALUES (93, 1, 'admin', '/admin/auth/group/del/ids/4', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335348);
INSERT INTO `fa_admin_log` VALUES (94, 1, 'admin', '/admin/auth/group/del/ids/2', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335351);
INSERT INTO `fa_admin_log` VALUES (95, 1, 'admin', '/admin/auth/group/del/ids/5', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335355);
INSERT INTO `fa_admin_log` VALUES (96, 1, 'admin', '/admin/auth/group/del/ids/3', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335357);
INSERT INTO `fa_admin_log` VALUES (97, 1, 'admin', '/admin/auth/group/del/ids/2', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335360);
INSERT INTO `fa_admin_log` VALUES (98, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335365);
INSERT INTO `fa_admin_log` VALUES (99, 1, 'admin', '/admin/auth/group/add?dialog=1', '权限管理 角色组 添加', '{\"dialog\":\"1\",\"__token__\":\"7a00d02ea576d3afda188702b455ebdc\",\"row\":{\"rules\":\"114,115,116,117,118,119,134,135,136,137,138,139,66\",\"pid\":\"1\",\"name\":\"\\u4f01\\u4e1a\\u5458\\u5de5\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335407);
INSERT INTO `fa_admin_log` VALUES (100, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"__token__\":\"8233b99ab466278e9562c77795b787c8\",\"group\":[\"6\"],\"row\":{\"username\":\"111\",\"email\":\"1979226175@qq.com\",\"nickname\":\"sfdff\",\"password\":\"11111111111111\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583335493);
INSERT INTO `fa_admin_log` VALUES (101, 1, 'admin', '/admin/staff/add?dialog=1', '员工列表 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"111111111111111111\",\"password\":\"123456\",\"age\":\"25\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"25000\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583337026);
INSERT INTO `fa_admin_log` VALUES (102, 1, 'admin', '/admin/staff/add?dialog=1', '员工列表 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"111111111111111111\",\"password\":\"123456\",\"age\":\"25\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"25000\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583337092);
INSERT INTO `fa_admin_log` VALUES (103, 1, 'admin', '/admin/staff/add?dialog=1', '员工列表 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u674e\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583337332);
INSERT INTO `fa_admin_log` VALUES (104, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"7db876a5d4dd930d910c5674c3972703\",\"username\":\"\\u674e\\u5f8b\\u5e08\",\"captcha\":\"fra3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583337538);
INSERT INTO `fa_admin_log` VALUES (105, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"a70affb5e656d722f46e592ecf2a9e2a\",\"username\":\"admin\",\"captcha\":\"kg38\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583337596);
INSERT INTO `fa_admin_log` VALUES (106, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u674e\\u5f8b\\u5e08\",\"password\":\"\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583338795);
INSERT INTO `fa_admin_log` VALUES (107, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u674e\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583338814);
INSERT INTO `fa_admin_log` VALUES (108, 0, 'Unknown', '/admin/index/login', '', '{\"__token__\":\"8750f26a4673c1b2d15239190bfafc36\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583338992);
INSERT INTO `fa_admin_log` VALUES (109, 0, 'Unknown', '/admin/index/login', '', '{\"__token__\":\"e8edc93bcede6b571f685cbb1e46398d\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583338997);
INSERT INTO `fa_admin_log` VALUES (110, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"ce4a47cf4389657a235a0d6b569e2ff8\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583339039);
INSERT INTO `fa_admin_log` VALUES (111, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"d49d0391ae9f01af39976e215a550e2f\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583339044);
INSERT INTO `fa_admin_log` VALUES (112, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"56fda5a659b62fc06632002106fc867b\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583339087);
INSERT INTO `fa_admin_log` VALUES (113, 0, 'Unknown', '/admin/index/login', '', '{\"__token__\":\"46fc013f7cc3dc678ff26a5f93d02c6f\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583341624);
INSERT INTO `fa_admin_log` VALUES (114, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"e3d3c97b1a8dd0e1f489af5dea186107\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583341634);
INSERT INTO `fa_admin_log` VALUES (115, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"4eb123361c794c7bb40c64b4ec23207d\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583341669);
INSERT INTO `fa_admin_log` VALUES (116, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u674e\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583341746);
INSERT INTO `fa_admin_log` VALUES (117, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u674e\\u5f8b\\u5e08\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583341909);
INSERT INTO `fa_admin_log` VALUES (118, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fstaff%3Fref%3Daddtabshttps%3A%2F%2Fhao.360.com%2F%3Fsrc%3Dlm%26ls%3Dn2b2986f18b', '登录', '{\"url\":\"\\/admin\\/staff?ref=addtabshttps:\\/\\/hao.360.com\\/?src=lm&amp;ls=n2b2986f18b\",\"__token__\":\"05568a6c5be0d93d03bb223483cb4552\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583341942);
INSERT INTO `fa_admin_log` VALUES (119, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fstaff%3Fref%3Daddtabshttps%3A%2F%2Fhao.360.com%2F%3Fsrc%3Dlm%26ls%3Dn2b2986f18b', '登录', '{\"url\":\"\\/admin\\/staff?ref=addtabshttps:\\/\\/hao.360.com\\/?src=lm&amp;ls=n2b2986f18b\",\"__token__\":\"7e8384f0cc19a4d750219f76a0620925\",\"username\":\"\\u674e\\u5f8b\\u5e08\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583341948);
INSERT INTO `fa_admin_log` VALUES (120, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583341964);
INSERT INTO `fa_admin_log` VALUES (121, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342140);
INSERT INTO `fa_admin_log` VALUES (122, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c11111\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342299);
INSERT INTO `fa_admin_log` VALUES (123, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c111111111111111\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342352);
INSERT INTO `fa_admin_log` VALUES (124, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c123\",\"password\":\"\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342365);
INSERT INTO `fa_admin_log` VALUES (125, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c123\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342497);
INSERT INTO `fa_admin_log` VALUES (126, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u738b\\u4e8c123\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342628);
INSERT INTO `fa_admin_log` VALUES (127, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u4e09\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342648);
INSERT INTO `fa_admin_log` VALUES (128, 1, 'admin', '/admin/staff/edit/ids/22?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u674e\\u56db\",\"password\":\"123456\",\"age\":\"12\",\"job\":\"\\u6cd5\\u5f8b\\u987e\\u95ee\",\"belongs\":\"5200.00\"},\"ids\":\"22\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342656);
INSERT INTO `fa_admin_log` VALUES (129, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"48326b714caf468edd641f7039ecdb53\",\"username\":\"\\u674e\\u56db\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583342682);
INSERT INTO `fa_admin_log` VALUES (130, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '', '{\"url\":\"\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"c43d2cf207b337c7fb81fe1fd563a150\",\"username\":\"\\u674e\\u56db\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583342698);
INSERT INTO `fa_admin_log` VALUES (131, 5, '李四', '/admin/index/login?url=%2Fadmin%2Fauth%2Fadmin%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/auth\\/admin?ref=addtabs\",\"__token__\":\"6cb1395526b781db04b37cb949919540\",\"username\":\"\\u674e\\u56db\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583342720);
INSERT INTO `fa_admin_log` VALUES (132, 1, 'admin', '/admin/staff/add?dialog=1', '员工列表 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u4e09\",\"password\":\"123456\",\"age\":\"100\",\"job\":\"\\u5de5\\u7a0b\\u5e08\",\"belongs\":\"9000\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583342792);
INSERT INTO `fa_admin_log` VALUES (133, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fstaff%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/staff?ref=addtabs\",\"__token__\":\"8ac78c2e8951174cd3da843ec6ac7e8e\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583342825);
INSERT INTO `fa_admin_log` VALUES (134, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fstaff%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/staff?ref=addtabs\",\"__token__\":\"4e7ee5623f19960f6dba715aa0c13bf3\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583428832);
INSERT INTO `fa_admin_log` VALUES (135, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fuser_case%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/user_case?ref=addtabs\",\"__token__\":\"cd84df5cfea32651889745e7450a0942\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583430774);
INSERT INTO `fa_admin_log` VALUES (136, 1, 'admin', '/admin/user_case/edit/ids/11?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"23\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"3500.00\",\"start_time\":\"2020-03-04 23:14:31\",\"end_time\":\"\",\"contents\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583431075);
INSERT INTO `fa_admin_log` VALUES (137, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u7801\\u4e91\\u79bb\\u5a5a\\u6848\",\"tag\":\"\\u6c11\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"23\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"15\",\"money\":\"28000.00\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u8fd9\\u4e2a\\u4eba\\u88ab\\u5f3a\\u66b4\\u4e86\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583431084);
INSERT INTO `fa_admin_log` VALUES (138, 1, 'admin', '/admin/user_case/edit/ids/7?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u7b97\\u5f97\\u4e0a\\u662f\\u8d39\",\"tag\":\"\\u884c\\u653f\\u6848\\u4ef6\",\"staff_id\":\"23\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"0.00\",\"start_time\":\"2020-03-04 02:41:44\",\"end_time\":\"\",\"contents\":\"111111111111111111\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583431092);
INSERT INTO `fa_admin_log` VALUES (139, 0, 'Unknown', '/admin/index/login?url=%2Fadmin%2Fuser_case%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/user_case?ref=addtabs\",\"__token__\":\"cba24abc9a8ee29fafdd255a15de3b5b\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583431203);
INSERT INTO `fa_admin_log` VALUES (140, 1, 'admin', '/admin/staff/edit/ids/23?dialog=1', '员工列表 编辑', '{\"dialog\":\"1\",\"row\":{\"username\":\"\\u5f20\\u4e09\",\"password\":\"123456\",\"age\":\"100\",\"job\":\"\\u5de5\\u7a0b\\u5e08\",\"belongs\":\"9000.00\"},\"ids\":\"23\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583431217);
INSERT INTO `fa_admin_log` VALUES (141, 6, '张三', '/admin/index/login?url=%2Fadmin%2Fuser_case%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/user_case?ref=addtabs\",\"__token__\":\"ace729acd289f8acf2948ac0ef622d2b\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583431222);
INSERT INTO `fa_admin_log` VALUES (142, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"ecb291fcc01a001d3b3f9d289f4b5758\",\"username\":\"admin111\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583432870);
INSERT INTO `fa_admin_log` VALUES (143, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"dc57f9856c2ec8b3414c3aee309668a6\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583433150);
INSERT INTO `fa_admin_log` VALUES (144, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"bf0c4df1e602e911e1b6d0c2553b060a\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583433165);
INSERT INTO `fa_admin_log` VALUES (145, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"947909546d82e0be2bfedba4463b5291\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583433174);
INSERT INTO `fa_admin_log` VALUES (146, 0, 'Unknown', '/admin/index/login', '', '{\"__token__\":\"8ff6413aa68a5ef09206005f8a35b106\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583433203);
INSERT INTO `fa_admin_log` VALUES (147, 6, '张三', '/admin/index/login', '登录', '{\"__token__\":\"a7deddd0ba972dbef8d6cc6657315282\",\"username\":\"\\u5f20\\u4e09\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583433209);
INSERT INTO `fa_admin_log` VALUES (148, 1, 'admin', '/admin/user_case/edit/ids/11?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"23\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"3500.00\",\"start_time\":\"2020-03-04 23:14:31\",\"end_time\":\"\",\"contents\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434614);
INSERT INTO `fa_admin_log` VALUES (149, 6, '张三', '/admin/user_case/edit/ids/11?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"handle_status\":\"0\",\"end_time\":\"2020-03-06 02:56:19\",\"contents\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583434618);
INSERT INTO `fa_admin_log` VALUES (150, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434694);
INSERT INTO `fa_admin_log` VALUES (151, 1, 'admin', '/admin/auth/group/edit/ids/6?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"af5f10fc0f09f54bcae1b7822f59f9d1\",\"row\":{\"rules\":\"115,116,117,118,119,135,136,137,138,139,134,114,66\",\"pid\":\"1\",\"name\":\"\\u4f01\\u4e1a\\u5458\\u5de5\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434705);
INSERT INTO `fa_admin_log` VALUES (152, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434854);
INSERT INTO `fa_admin_log` VALUES (153, 1, 'admin', '/admin/auth/group/edit/ids/6?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"53d118e69f3d4e3d0b13d8aa4286b442\",\"row\":{\"rules\":\"115,116,117,118,119,135,136,137,139,114,66,134\",\"pid\":\"1\",\"name\":\"\\u4f01\\u4e1a\\u5458\\u5de5\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434858);
INSERT INTO `fa_admin_log` VALUES (154, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434867);
INSERT INTO `fa_admin_log` VALUES (155, 1, 'admin', '/admin/auth/group/edit/ids/6?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"68425f917bbcf9c3df3b0fc66d754cc3\",\"row\":{\"rules\":\"114,115,116,117,118,119,134,135,136,137,138,139,66\",\"pid\":\"1\",\"name\":\"\\u4f01\\u4e1a\\u5458\\u5de5\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434869);
INSERT INTO `fa_admin_log` VALUES (156, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434886);
INSERT INTO `fa_admin_log` VALUES (157, 1, 'admin', '/admin/auth/group/edit/ids/6?dialog=1', '权限管理 角色组 编辑', '{\"dialog\":\"1\",\"__token__\":\"56db3e0a13e6ea4cd23359f058cb615e\",\"row\":{\"rules\":\"115,116,117,119,135,136,137,138,139,134,114,66\",\"pid\":\"1\",\"name\":\"\\u4f01\\u4e1a\\u5458\\u5de5\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583434889);
INSERT INTO `fa_admin_log` VALUES (158, 1, 'admin', '/admin/case_schedule/add?dialog=1', '员工工作时间安排表针对于每个事件 添加', '{\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-06 03:03:46\",\"woker_end_time\":\"2020-03-06 03:03:46\",\"woker_contents\":\"s\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583435047);
INSERT INTO `fa_admin_log` VALUES (160, 1, 'admin', '/admin/case_schedule/add?case_id=9&dialog=1&dialog=1', '员工工作时间安排表针对于每个事件 添加', '{\"case_id\":\"9\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-06 03:07:30\",\"woker_end_time\":\"2020-03-07 03:07:30\",\"woker_contents\":\"d\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583436020);
INSERT INTO `fa_admin_log` VALUES (161, 1, 'admin', '/admin/case_schedule/add?case_id=9&dialog=1&dialog=1', '员工工作时间安排表针对于每个事件 添加', '{\"case_id\":\"9\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-06 03:25:37\",\"woker_end_time\":\"2020-03-06 03:27:37\",\"woker_contents\":\"1111\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583436427);
INSERT INTO `fa_admin_log` VALUES (162, 6, '张三', '/admin/case_schedule/edit/ids/8?dialog=1', '员工工作时间安排表针对于每个事件 编辑', '{\"dialog\":\"1\",\"row\":{\"woker_contents\":\"1111\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583436545);
INSERT INTO `fa_admin_log` VALUES (163, 6, '张三', '/admin/user_case/edit/ids/11?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"tag\":\"\\u5211\\u4e8b\\u6848\\u4ef6\",\"handle_status\":\"1\",\"end_time\":\"2020-04-06 02:56:19\",\"contents\":\"\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\\u5218\\u534e\\u5f3a\\u5f3a\\u5978\\u6848\",\"reason\":\"\\u5218\\u534e\\u5f3a\\u8d8b\\u52bf\\u88ab\",\"evidence\":\"232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323\"},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583436872);
INSERT INTO `fa_admin_log` VALUES (164, 1, 'admin', '/admin/user_case/edit/ids/9?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u7801\\u4e91\\u79bb\\u5a5a\\u6848\",\"tag\":\"\\u6c11\\u4e8b\\u6848\\u4ef6\",\"staff_id\":\"23\",\"push_status\":\"1\",\"handle_status\":\"1\",\"woker_hourse\":\"39\",\"money\":\"28000.00\",\"start_time\":\"2020-03-04 02:39:48\",\"end_time\":\"\",\"contents\":\"\\u8fd9\\u4e2a\\u4eba\\u88ab\\u5f3a\\u66b4\\u4e86\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583436891);
INSERT INTO `fa_admin_log` VALUES (165, 1, 'admin', '/admin/user_case/edit/ids/7?dialog=1', '会员案件 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"\\u7b97\\u5f97\\u4e0a\\u662f\\u8d39\",\"tag\":\"\\u884c\\u653f\\u6848\\u4ef6\",\"staff_id\":\"23\",\"push_status\":\"1\",\"handle_status\":\"2\",\"woker_hourse\":\"0\",\"money\":\"0.00\",\"start_time\":\"2020-03-04 02:41:44\",\"end_time\":\"\",\"contents\":\"111111111111111111\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"7\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583436908);
INSERT INTO `fa_admin_log` VALUES (166, 1, 'admin', '/admin/index/login?url=%2Fadmin%2Fdashboard%3Fref%3Daddtabs', '登录', '{\"url\":\"\\/admin\\/dashboard?ref=addtabs\",\"__token__\":\"f6bfae2075bdce4af5f78983236b7e4a\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583507752);
INSERT INTO `fa_admin_log` VALUES (167, 1, 'admin', '/admin/auth/rule/multi/ids/undefined', '权限管理 菜单规则', '{\"action\":\"\",\"ids\":\"undefined\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583528668);
INSERT INTO `fa_admin_log` VALUES (168, 1, 'admin', '/admin/auth/rule/edit/ids/99?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"f225d4a1fb5698dc53b3e4c2cf9958e6\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"test\",\"title\":\"\\u6d4b\\u8bd5\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"99\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583528675);
INSERT INTO `fa_admin_log` VALUES (169, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583528676);
INSERT INTO `fa_admin_log` VALUES (170, 1, 'admin', '/admin/auth/group/roletree', 'Auth Group', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529053);
INSERT INTO `fa_admin_log` VALUES (171, 1, 'admin', '/admin/auth/group/edit/ids/6?dialog=1', 'Auth Group Edit', '{\"dialog\":\"1\",\"__token__\":\"c3e3d5fc616eb8cde720b7b3a2e3732e\",\"row\":{\"rules\":\"115,116,117,119,135,136,137,138,139,134,114,66\",\"pid\":\"1\",\"name\":\"Company staff\",\"status\":\"normal\"},\"ids\":\"6\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529063);
INSERT INTO `fa_admin_log` VALUES (172, 1, 'admin', '/admin/auth/group/roletree', 'Auth Group', '{\"id\":\"6\",\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529069);
INSERT INTO `fa_admin_log` VALUES (173, 1, 'admin', '/admin/auth/rule/edit/ids/67?dialog=1', 'Auth Rule Edit', '{\"dialog\":\"1\",\"__token__\":\"ecd714633fa5c0148a62ddab3856d9bd\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user\\/user\",\"title\":\"User lists\",\"icon\":\"fa fa-user\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"67\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529167);
INSERT INTO `fa_admin_log` VALUES (174, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529168);
INSERT INTO `fa_admin_log` VALUES (175, 1, 'admin', '/admin/auth/rule/edit/ids/114?dialog=1', 'Auth Rule Edit', '{\"dialog\":\"1\",\"__token__\":\"60ba3ce23ef8e81d60e77c9d17279cd2\",\"row\":{\"ismenu\":\"1\",\"pid\":\"66\",\"name\":\"user_case\",\"title\":\"User Cases\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"114\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529188);
INSERT INTO `fa_admin_log` VALUES (176, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529188);
INSERT INTO `fa_admin_log` VALUES (177, 1, 'admin', '/admin/auth/rule/edit/ids/134?dialog=1', 'Auth Rule Edit', '{\"dialog\":\"1\",\"__token__\":\"707870b3ddf31645bf5ddf34411446ed\",\"row\":{\"ismenu\":\"0\",\"pid\":\"114\",\"name\":\"case_schedule\",\"title\":\"Case schedule\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"134\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529287);
INSERT INTO `fa_admin_log` VALUES (178, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529288);
INSERT INTO `fa_admin_log` VALUES (179, 1, 'admin', '/admin/auth/rule/edit/ids/133?dialog=1', 'Auth Rule Edit', '{\"dialog\":\"1\",\"__token__\":\"3dd47d67c97d91b65e781c6835716dcc\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"staff2\",\"title\":\"Staff lists\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"133\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529308);
INSERT INTO `fa_admin_log` VALUES (180, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529308);
INSERT INTO `fa_admin_log` VALUES (181, 1, 'admin', '/admin/auth/rule/edit/ids/133?dialog=1', 'Auth Rule Edit', '{\"dialog\":\"1\",\"__token__\":\"761647c76a0d75aec32efbe64a4da242\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"staff2\",\"title\":\"Staff\",\"icon\":\"fa fa-blind\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"133\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529324);
INSERT INTO `fa_admin_log` VALUES (182, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529325);
INSERT INTO `fa_admin_log` VALUES (183, 1, 'admin', '/admin/auth/rule/edit/ids/127?dialog=1', 'Auth Rule Edit', '{\"dialog\":\"1\",\"__token__\":\"36284da258953aed1f655886034ee511\",\"row\":{\"ismenu\":\"1\",\"pid\":\"133\",\"name\":\"staff\",\"title\":\"Staff lists\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"127\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529344);
INSERT INTO `fa_admin_log` VALUES (184, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583529345);
INSERT INTO `fa_admin_log` VALUES (185, 1, 'admin', '/admin/index/login', 'Login', '{\"__token__\":\"7aef91196f2b82f31bab26c248ec990e\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583539897);
INSERT INTO `fa_admin_log` VALUES (186, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"21f83c3c836d450b9d188d5b0eeb570a\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583540430);
INSERT INTO `fa_admin_log` VALUES (187, 1, 'admin', '/admin/user/user/edit/ids/4?dialog=1', 'User User lists Edit', '{\"dialog\":\"1\",\"row\":{\"username\":\"lijianyun\",\"nickname\":\"lijianyun\",\"password\":\"\",\"email\":\"1979226175@qq.com\",\"mobile\":\"13556609714\",\"avatar\":\"\\/uploads\\/20200307\\/d3b7adfcc747a4b2d252375542116b11.png\",\"gender\":\"0\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583540703);
INSERT INTO `fa_admin_log` VALUES (188, 1, 'admin', '/admin/staff/add?dialog=1', 'Staff lists 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"test1\",\"password\":\"123456\",\"age\":\"25\",\"job\":\"legal adviser\",\"belongs\":\"2500\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583540827);
INSERT INTO `fa_admin_log` VALUES (189, 7, 'test1', '/admin/index/login?url=%2Fadmin', 'Login', '{\"url\":\"\\/admin\",\"__token__\":\"244f4f9f5c229e072c6cb31e2f53b092\",\"username\":\"test1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583540859);
INSERT INTO `fa_admin_log` VALUES (190, 1, 'admin', '/admin/staff/add?dialog=1', 'Staff lists 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"test2\",\"password\":\"123456\",\"age\":\"25\",\"job\":\"legal adviser\",\"belongs\":\"5600\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583540892);
INSERT INTO `fa_admin_log` VALUES (191, 1, 'admin', '/admin/user_case/edit/ids/12?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"mayun  fuck girl\",\"tag\":\"Criminal case\",\"staff_id\":\"25\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"20000\",\"start_time\":\"2020-03-07 08:37:42\",\"end_time\":\"\",\"contents\":\"mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,\",\"reason\":\"mayun  fuck  a  girl   in a ligit\",\"evidence\":\"\"},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583541496);
INSERT INTO `fa_admin_log` VALUES (192, 8, 'test2', '/admin/index/login', '登录', '{\"__token__\":\"b77c352f391d0181d7f34ac78da1aa0b\",\"username\":\"test2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583541540);
INSERT INTO `fa_admin_log` VALUES (193, 8, 'test2', '/admin/case_schedule/add?case_id=12&dialog=1&dialog=1', 'Case schedule 添加', '{\"case_id\":\"12\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-07 08:39:06\",\"woker_end_time\":\"2020-03-07 18:39:06\",\"woker_contents\":\"go to mayun home to fuck a girl\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583541570);
INSERT INTO `fa_admin_log` VALUES (194, 8, 'test2', '/admin/case_schedule/add?case_id=12&dialog=1&dialog=1', 'Case schedule 添加', '{\"case_id\":\"12\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-07 09:50:00\",\"woker_end_time\":\"2020-03-10 08:39:50\",\"woker_contents\":\"what a fuck\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583541615);
INSERT INTO `fa_admin_log` VALUES (195, 8, 'test2', '/admin/user_case/edit/ids/12?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"mayun  fuck girl\",\"tag\":\"Criminal case\",\"handle_status\":\"1\",\"end_time\":\"2020-03-20 08:40:29\",\"contents\":\"mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,\",\"reason\":\"mayun  fuck  a  girl   in a ligit\",\"evidence\":\"mayun sure   fuck agirl\"},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583541648);
INSERT INTO `fa_admin_log` VALUES (196, 1, 'admin', '/admin/user_case/edit/ids/13?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"Divorce\",\"tag\":\"Civil case\",\"staff_id\":\"24\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"5000\",\"start_time\":\"2020-03-07 08:42:48\",\"end_time\":\"\",\"contents\":\"liuqiangdong Divorce i  with  naicha meimei\",\"reason\":\"liuqiangdong Divorce i  with  naicha meimei\",\"evidence\":\"\"},\"ids\":\"13\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583541778);
INSERT INTO `fa_admin_log` VALUES (197, 1, 'admin', '/admin/user_case/edit/ids/14?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"chendu\",\"tag\":\"Civil case\",\"staff_id\":\"0\",\"push_status\":\"2\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"0.00\",\"start_time\":\"2020-03-07 08:44:06\",\"end_time\":\"\",\"contents\":\"chendu chendu chendu chendu\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583541852);
INSERT INTO `fa_admin_log` VALUES (198, 1, 'admin', '/admin/user_case/edit/ids/14?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"chendu\",\"tag\":\"Civil case\",\"staff_id\":\"24\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"0.00\",\"start_time\":\"2020-03-07 08:44:06\",\"end_time\":\"\",\"contents\":\"chendu chendu chendu chendu\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583541969);
INSERT INTO `fa_admin_log` VALUES (199, 1, 'admin', '/admin/auth/group/roletree', '权限管理 角色组', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542011);
INSERT INTO `fa_admin_log` VALUES (200, 1, 'admin', '/admin/auth/group/add?dialog=1', '权限管理 角色组 添加', '{\"dialog\":\"1\",\"__token__\":\"e032d48ec872814e42a93847287c0af5\",\"row\":{\"rules\":\"1,13,14,16,15,17,2,6,18,19,20,21,22,7,23,24,25,26,27,28,8,29,30,31,32,33,34,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,108,109,110,111,112,113,114,115,116,117,118,119,134,135,136,137,138,139,133,127,128,129,130,131,132\",\"pid\":\"1\",\"name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\\u5458\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542031);
INSERT INTO `fa_admin_log` VALUES (201, 1, 'admin', '/admin/auth/admin/add?dialog=1', '权限管理 管理员管理 添加', '{\"dialog\":\"1\",\"__token__\":\"83c834fc7fee81388e632b2bd6816377\",\"group\":[\"7\"],\"row\":{\"username\":\"admin888\",\"email\":\"1979226175@qq.com\",\"nickname\":\"admin888\",\"password\":\"123456\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542059);
INSERT INTO `fa_admin_log` VALUES (202, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"32b0be055a80f2169cb45bb7ae2904b2\",\"username\":\"admin888\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542071);
INSERT INTO `fa_admin_log` VALUES (203, 0, 'Unknown', '/admin/index/login', '登录', '{\"__token__\":\"b9a0b7adb88f12d3b527a429e57a663b\",\"username\":\"admin888\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542087);
INSERT INTO `fa_admin_log` VALUES (204, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"72dc43ae8cf6c9063b2caa08e60a803f\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542100);
INSERT INTO `fa_admin_log` VALUES (205, 1, 'admin', '/admin/auth/group/del/ids/7', '权限管理 角色组 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542107);
INSERT INTO `fa_admin_log` VALUES (206, 1, 'admin', '/admin/auth/admin/del/ids/9', '权限管理 管理员管理 删除', '{\"action\":\"del\",\"ids\":\"9\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542113);
INSERT INTO `fa_admin_log` VALUES (207, 1, 'admin', '/admin/auth/rule/edit/ids/5?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"7ebca03712dfdbd1e26dbbf70b0beb79\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"auth\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa fa-group\",\"weigh\":\"99\",\"condition\":\"\",\"remark\":\"\",\"status\":\"hidden\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542129);
INSERT INTO `fa_admin_log` VALUES (208, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542130);
INSERT INTO `fa_admin_log` VALUES (209, 1, 'admin', '/admin/auth/rule/edit/ids/4?dialog=1', '菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e227c460bb7b675d9f45eda6dcd74920\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"addon\",\"title\":\"\\u63d2\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa fa-rocket\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"Addon tips\",\"status\":\"hidden\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542149);
INSERT INTO `fa_admin_log` VALUES (210, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583542150);
INSERT INTO `fa_admin_log` VALUES (211, 1, 'admin', '/admin/index/login', '登录', '{\"__token__\":\"d097b52968604d76e567b29ab6afb63a\",\"username\":\"admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583543204);
INSERT INTO `fa_admin_log` VALUES (212, 1, 'admin', '/admin/staff/add?dialog=1', 'Staff lists 添加', '{\"dialog\":\"1\",\"row\":{\"username\":\"test3\",\"password\":\"123456\",\"age\":\"50\",\"job\":\"legal adviser\",\"belongs\":\"10000\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583543627);
INSERT INTO `fa_admin_log` VALUES (213, 1, 'admin', '/admin/user_case/edit/ids/15?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"liuhuaqaing kill person case\",\"tag\":\"Criminal case\",\"staff_id\":\"26\",\"push_status\":\"1\",\"handle_status\":\"0\",\"woker_hourse\":\"0\",\"money\":\"10000\",\"start_time\":\"2020-03-07 09:15:17\",\"end_time\":\"\",\"contents\":\"liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,\",\"reason\":\"\",\"evidence\":\"\"},\"ids\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.120 Safari/537.36', 1583543725);
INSERT INTO `fa_admin_log` VALUES (214, 10, 'test3', '/admin/index/login?url=%2Fadmin', 'Login', '{\"url\":\"\\/admin\",\"__token__\":\"796c90a865bda29a3d90b8189b8a93ba\",\"username\":\"test3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583543842);
INSERT INTO `fa_admin_log` VALUES (215, 10, 'test3', '/admin/user_case/edit/ids/15?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"liuhuaqaing kill person case\",\"tag\":\"Criminal case\",\"handle_status\":\"0\",\"end_time\":\"\",\"contents\":\"liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,\",\"reason\":\"fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck\",\"evidence\":\"\"},\"ids\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583543963);
INSERT INTO `fa_admin_log` VALUES (216, 10, 'test3', '/admin/case_schedule/add?case_id=15&dialog=1&dialog=1', 'Case schedule 添加', '{\"case_id\":\"15\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-07 09:19:35\",\"woker_end_time\":\"2020-03-20 09:19:35\",\"woker_contents\":\"find evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidence\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583544000);
INSERT INTO `fa_admin_log` VALUES (217, 10, 'test3', '/admin/case_schedule/add?case_id=15&dialog=1&dialog=1', 'Case schedule 添加', '{\"case_id\":\"15\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-03-08 09:20:49\",\"woker_end_time\":\"2020-03-08 19:20:49\",\"woker_contents\":\"testfind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidence\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583544078);
INSERT INTO `fa_admin_log` VALUES (218, 10, 'test3', '/admin/case_schedule/add?case_id=15&dialog=1&dialog=1', 'Case schedule 添加', '{\"case_id\":\"15\",\"dialog\":\"1\",\"row\":{\"woker_start_time\":\"2020-04-07 09:21:32\",\"woker_end_time\":\"2020-04-08 09:21:32\",\"woker_contents\":\"daguansifind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidence\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583544123);
INSERT INTO `fa_admin_log` VALUES (219, 10, 'test3', '/admin/user_case/edit/ids/15?dialog=1', 'User Cases 编辑', '{\"dialog\":\"1\",\"row\":{\"case_name\":\"liuhuaqaing kill person case\",\"tag\":\"Criminal case\",\"handle_status\":\"1\",\"end_time\":\"\",\"contents\":\"liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,\",\"reason\":\"fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck\",\"evidence\":\"its a  real cafind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencese ture\"},\"ids\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36', 1583544152);

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
INSERT INTO `fa_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES (2, 0, 2, '/uploads/20200229/db9d42a5598a35512bbca950ef586051.png', '95', '92', 'png', 0, 7875, 'image/png', '', 1582946419, 1582946419, 1582946419, 'local', '3e5c5683fdf94a8c95f63326e70af3479d350244');
INSERT INTO `fa_attachment` VALUES (3, 0, 2, '/uploads/20200229/e418a8b7350db30ccaefdf191a612317.jpg', '658', '398', 'jpg', 0, 33286, 'image/jpeg', '', 1582946447, 1582946447, 1582946447, 'local', '1135d40cf9bf4bb451518e756f8a92013f3dfdb2');
INSERT INTO `fa_attachment` VALUES (4, 0, 2, '/uploads/20200229/d8fb7d091bb500636b2f82e044c00269.jpg', '640', '870', 'jpg', 0, 72137, 'image/jpeg', '', 1582946690, 1582946690, 1582946690, 'local', '4a4e2ffe42e3d7597d17bf9f1be426bc6d4016df');
INSERT INTO `fa_attachment` VALUES (5, 0, 2, '/uploads/20200301/d8fb7d091bb500636b2f82e044c00269.jpg', '640', '870', 'jpg', 0, 72137, 'image/jpeg', '', 1583077682, 1583077682, 1583077682, 'local', '4a4e2ffe42e3d7597d17bf9f1be426bc6d4016df');
INSERT INTO `fa_attachment` VALUES (6, 0, 2, '/uploads/20200302/e418a8b7350db30ccaefdf191a612317.jpg', '658', '398', 'jpg', 0, 33286, 'image/jpeg', '', 1583083441, 1583083441, 1583083441, 'local', '1135d40cf9bf4bb451518e756f8a92013f3dfdb2');
INSERT INTO `fa_attachment` VALUES (7, 0, 2, '/uploads/20200302/d8fb7d091bb500636b2f82e044c00269.jpg', '640', '870', 'jpg', 0, 72137, 'image/jpeg', '', 1583083854, 1583083854, 1583083854, 'local', '4a4e2ffe42e3d7597d17bf9f1be426bc6d4016df');
INSERT INTO `fa_attachment` VALUES (8, 0, 2, '/uploads/20200302/db9d42a5598a35512bbca950ef586051.png', '95', '92', 'png', 0, 7875, 'image/png', '', 1583084329, 1583084329, 1583084329, 'local', '3e5c5683fdf94a8c95f63326e70af3479d350244');
INSERT INTO `fa_attachment` VALUES (9, 0, 2, '/uploads/20200302/062317a94b8be7fa256aee35bb654a9f.jpg', '658', '987', 'jpg', 0, 50121, 'image/jpeg', '', 1583119457, 1583119457, 1583119457, 'local', '56528c9b823f1954ba2773e2bb151844dc6438a3');
INSERT INTO `fa_attachment` VALUES (10, 0, 2, '/uploads/20200302/7acb638322b2708719a10f8dfbbc0778.jpg', '800', '600', 'jpg', 0, 51693, 'image/jpeg', '', 1583121905, 1583121905, 1583121905, 'local', 'db14b13f628820b927601817f3b5a03ce79b5869');
INSERT INTO `fa_attachment` VALUES (11, 0, 2, '/uploads/20200302/65bb015716d112eab321863d2b05364c.jpg', '960', '1440', 'jpg', 0, 98861, 'image/jpeg', '', 1583122440, 1583122440, 1583122440, 'local', '1dc028303f1f9ed44f1fbc00d14f8c98757ca8e3');
INSERT INTO `fa_attachment` VALUES (12, 0, 2, '/uploads/20200304/e9c263f44c5813c286c5937f3290ef18.png', '1118', '1534', 'png', 0, 113418, 'image/png', '', 1583253291, 1583253291, 1583253291, 'local', '1b97a8fcf51e53d93dcfbd07dcdf59f6825212f5');
INSERT INTO `fa_attachment` VALUES (13, 0, 4, '/uploads/20200307/c15e304431995a55c237ed5c17efbe2e.jpg', '1920', '1280', 'jpg', 0, 313128, 'image/jpeg', '', 1583528906, 1583528906, 1583528906, 'local', '03999e679c4eff8efde8f537c1147476ff7b5df0');
INSERT INTO `fa_attachment` VALUES (14, 0, 4, '/uploads/20200307/a4b81b7f895930d0adbae3a6dad54603.png', '680', '445', 'png', 0, 175597, 'image/png', '', 1583528939, 1583528939, 1583528939, 'local', '3774b67f6792fe0517a6c95b056909ba830e78b4');
INSERT INTO `fa_attachment` VALUES (15, 0, 4, '/uploads/20200307/d3b7adfcc747a4b2d252375542116b11.png', '490', '90', 'png', 0, 20068, 'image/png', '', 1583529388, 1583529388, 1583529388, 'local', '777eb76aabd6624c585acdf5c793d3cfb8a6fbc9');
INSERT INTO `fa_attachment` VALUES (16, 0, 5, '/uploads/20200307/932da9929c8f63d60c86553b5334af42.jpg', '488', '250', 'jpg', 0, 69662, 'image/jpeg', '', 1583540724, 1583540724, 1583540724, 'local', '236ae2cb0912a415219609d10d15f86eb8d89754');
INSERT INTO `fa_attachment` VALUES (17, 0, 6, '/uploads/20200307/16b731900e3b3b5f2aebecdfe4ec3234.jpg', '140', '140', 'jpg', 0, 6763, 'image/jpeg', '', 1583543377, 1583543377, 1583543377, 'local', '5aa1b5b6f22d4b00db1be145e3797b9ef43e8015');

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `fa_auth_group` VALUES (6, 1, 'Company staff', '115,116,117,119,135,136,137,138,139,134,114,66', 1583335407, 1583529063, 'normal');
INSERT INTO `fa_auth_group` VALUES (7, 1, '系统管理员', '1,13,14,16,15,17,2,6,18,19,20,21,22,7,23,24,25,26,27,28,8,29,30,31,32,33,34,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,108,109,110,111,112,113,114,115,116,117,118,119,134,135,136,137,138,139,133,127,128,129,130,131,132', 1583542031, 1583542031, 'normal');

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
INSERT INTO `fa_auth_group_access` VALUES (1, 1);
INSERT INTO `fa_auth_group_access` VALUES (7, 6);
INSERT INTO `fa_auth_group_access` VALUES (8, 6);
INSERT INTO `fa_auth_group_access` VALUES (10, 6);

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', '插件管理', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1583542149, 0, 'hidden');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', '权限管理', 'fa fa-group', '', '', 1, 1497429920, 1583542129, 99, 'hidden');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User lists', 'fa fa-user', '', '', 1, 1516374729, 1583529167, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', '会员分组', 'fa fa-users', '', '', 0, 1516374729, 1583254380, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', '会员规则', 'fa fa-circle-o', '', '', 1, 1516374729, 1583254396, 0, 'hidden');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (99, 'file', 0, 'test', '测试管理', 'fa fa-circle-o', '', '', 1, 1583254447, 1583528675, 0, 'hidden');
INSERT INTO `fa_auth_rule` VALUES (100, 'file', 99, 'test/index', '查看', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (101, 'file', 99, 'test/recyclebin', '回收站', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (102, 'file', 99, 'test/add', '添加', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (103, 'file', 99, 'test/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (104, 'file', 99, 'test/del', '删除', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (105, 'file', 99, 'test/destroy', '真实删除', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (106, 'file', 99, 'test/restore', '还原', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (107, 'file', 99, 'test/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1583254447, 1583254447, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (108, 'file', 66, 'user_group', '会员组管理', 'fa fa-circle-o', '', '', 1, 1583254457, 1583266058, 0, 'hidden');
INSERT INTO `fa_auth_rule` VALUES (109, 'file', 108, 'user_group/index', '查看', 'fa fa-circle-o', '', '', 0, 1583254457, 1583254457, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (110, 'file', 108, 'user_group/add', '添加', 'fa fa-circle-o', '', '', 0, 1583254457, 1583254457, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (111, 'file', 108, 'user_group/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1583254457, 1583254457, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (112, 'file', 108, 'user_group/del', '删除', 'fa fa-circle-o', '', '', 0, 1583254457, 1583254457, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (113, 'file', 108, 'user_group/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1583254457, 1583254457, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (114, 'file', 66, 'user_case', 'User Cases', 'fa fa-circle-o', '', '', 1, 1583256188, 1583529188, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (115, 'file', 114, 'user_case/index', '查看', 'fa fa-circle-o', '', '', 0, 1583256188, 1583256188, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (116, 'file', 114, 'user_case/add', '添加', 'fa fa-circle-o', '', '', 0, 1583256188, 1583256188, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (117, 'file', 114, 'user_case/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1583256188, 1583256188, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (118, 'file', 114, 'user_case/del', '删除', 'fa fa-circle-o', '', '', 0, 1583256188, 1583256188, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (119, 'file', 114, 'user_case/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1583256188, 1583256188, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (127, 'file', 133, 'staff', 'Staff lists', 'fa fa-circle-o', '', '', 1, 1583258331, 1583529344, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (128, 'file', 127, 'staff/index', '查看', 'fa fa-circle-o', '', '', 0, 1583258331, 1583258331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (129, 'file', 127, 'staff/add', '添加', 'fa fa-circle-o', '', '', 0, 1583258331, 1583258331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (130, 'file', 127, 'staff/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1583258331, 1583258331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (131, 'file', 127, 'staff/del', '删除', 'fa fa-circle-o', '', '', 0, 1583258331, 1583258331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (132, 'file', 127, 'staff/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1583258331, 1583258331, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (133, 'file', 0, 'staff2', 'Staff', 'fa fa-blind', '', '', 1, 1583258384, 1583529324, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (134, 'file', 114, 'case_schedule', 'Case schedule', 'fa fa-circle-o', '', '', 0, 1583261782, 1583529287, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (135, 'file', 134, 'case_schedule/index', '查看', 'fa fa-circle-o', '', '', 0, 1583261782, 1583261782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (136, 'file', 134, 'case_schedule/add', '添加', 'fa fa-circle-o', '', '', 0, 1583261782, 1583261782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (137, 'file', 134, 'case_schedule/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1583261782, 1583261782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (138, 'file', 134, 'case_schedule/del', '删除', 'fa fa-circle-o', '', '', 0, 1583261782, 1583261782, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (139, 'file', 134, 'case_schedule/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1583261782, 1583261782, 0, 'normal');

-- ----------------------------
-- Table structure for fa_case_schedule
-- ----------------------------
DROP TABLE IF EXISTS `fa_case_schedule`;
CREATE TABLE `fa_case_schedule`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `case_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '事件id',
  `staff_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '员工id',
  `woker_start_time` int(11) NOT NULL DEFAULT 0 COMMENT '事件处理开始时间',
  `woker_end_time` int(11) NOT NULL DEFAULT 0 COMMENT '事件处理结束时间',
  `woker_hours` smallint(6) NOT NULL DEFAULT 0 COMMENT '工作日常 冗余一个字段',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '添加时间',
  `woker_contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工工作时间安排表针对于每个事件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_case_schedule
-- ----------------------------
INSERT INTO `fa_case_schedule` VALUES (9, 12, 25, 1583541546, 1583577546, 10, 1583541570, 'go to mayun home to fuck a girl');
INSERT INTO `fa_case_schedule` VALUES (10, 12, 25, 1583545800, 1583800790, 71, 1583541615, 'what a fuck');
INSERT INTO `fa_case_schedule` VALUES (11, 15, 26, 1583543975, 1584667175, 312, 1583543999, 'find evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidence');
INSERT INTO `fa_case_schedule` VALUES (12, 15, 26, 1583630449, 1583666449, 10, 1583544078, 'testfind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidence');
INSERT INTO `fa_case_schedule` VALUES (13, 15, 26, 1586222492, 1586308892, 24, 1583544123, 'daguansifind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidence');

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_config
-- ----------------------------
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'CCL', '', 'required', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- ----------------------------
-- Table structure for fa_staff
-- ----------------------------
DROP TABLE IF EXISTS `fa_staff`;
CREATE TABLE `fa_staff`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '员工主键ID',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '员工姓名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '员工登录密码',
  `age` tinyint(1) NOT NULL DEFAULT 1 COMMENT '员工年龄',
  `job` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '员工职位',
  `belongs` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '员工工资',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '员工表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_staff
-- ----------------------------
INSERT INTO `fa_staff` VALUES (24, 'test1', 'e10adc3949ba59abbe56e057f20f883e', 25, 'legal adviser', 2500.00, 1583540827);
INSERT INTO `fa_staff` VALUES (25, 'test2', 'e10adc3949ba59abbe56e057f20f883e', 25, 'legal adviser', 5600.00, 1583540892);
INSERT INTO `fa_staff` VALUES (26, 'test3', 'e10adc3949ba59abbe56e057f20f883e', 50, 'legal adviser', 10000.00, 1583543627);

-- ----------------------------
-- Table structure for fa_test
-- ----------------------------
DROP TABLE IF EXISTS `fa_test`;
CREATE TABLE `fa_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `price` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '点击',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime(0) NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time(0) NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) NULL DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_test
-- ----------------------------
INSERT INTO `fa_test` VALUES (1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, NULL, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '验证',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user
-- ----------------------------
INSERT INTO `fa_user` VALUES (4, 0, 'lijianyun', 'lijianyun', 'e574ccedbe4d057df4983879082c3e27', 'Sxt0jq', '1979226175@qq.com', '13556609714', '/uploads/20200307/d3b7adfcc747a4b2d252375542116b11.png', 1, 0, NULL, '', 0.00, 0, 1, 1, 1583528842, 1583528868, '127.0.0.1', 0, '127.0.0.1', 1583528842, 1583528842, 1583540703, '', 'normal', '');
INSERT INTO `fa_user` VALUES (5, 0, 'zhangsan', 'zhangsan', '1ab3f060730d7613985992e5fbad5ad5', 'WPlBLq', '7725827743@qq.com', '13556600000', '/uploads/20200307/932da9929c8f63d60c86553b5334af42.jpg', 1, 0, NULL, 'i am a good boy', 0.00, 0, 1, 1, 1583540626, 1583540626, '127.0.0.1', 0, '127.0.0.1', 1583540626, 1583540626, 1583540740, '', 'normal', '');
INSERT INTO `fa_user` VALUES (6, 0, 'liuqiangdong', 'liuqiangdong', '5a690c5ee84dad1c0fb67845e9d85ce5', 'EgLCo1', '1979226111@qq.com', '13556609715', '', 1, 0, NULL, '', 0.00, 0, 1, 1, 1583543102, 1583543102, '127.0.0.1', 0, '127.0.0.1', 1583543102, 1583543102, 1583543102, '', 'normal', '');

-- ----------------------------
-- Table structure for fa_user_case
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_case`;
CREATE TABLE `fa_user_case`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` smallint(6) NOT NULL DEFAULT 0 COMMENT '发布客户id',
  `tag` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '事件标签 逗号拼接',
  `staff_id` smallint(6) NOT NULL DEFAULT 0 COMMENT '分配给某个员工的ID',
  `woker_hourse` int(11) NOT NULL DEFAULT 0 COMMENT '案件总计工作时长 以小时为单位',
  `push_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '案件分配状态 0待分配  1已分配 2拒绝受理',
  `handle_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '案件处理状态 0进行中  1已胜诉 2已败诉',
  `money` decimal(11, 2) NOT NULL DEFAULT 0.00 COMMENT '案件受理金额管理员人工填写',
  `start_time` int(11) NOT NULL DEFAULT 0 COMMENT '案件进行开始时间',
  `end_time` int(11) NOT NULL DEFAULT 0 COMMENT '案件完成结束时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '新增时间',
  `contents` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事件内容',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原因',
  `evidence` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证据',
  `case_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '案件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户提交法律事件表  ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_case
-- ----------------------------
INSERT INTO `fa_user_case` VALUES (12, 5, 'Criminal case', 25, 81, 1, 1, 20000.00, 1583541462, 1584664829, 1583541328, 'mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,mayun  fuck girl once aggin,', 'mayun  fuck  a  girl   in a ligit', 'mayun sure   fuck agirl', 'mayun  fuck girl');
INSERT INTO `fa_user_case` VALUES (13, 5, 'Civil case', 24, 0, 1, 0, 5000.00, 1583541768, 0, 1583541740, 'liuqiangdong Divorce i  with  naicha meimei', 'liuqiangdong Divorce i  with  naicha meimei', '', 'Divorce');
INSERT INTO `fa_user_case` VALUES (14, 5, 'Civil case', 24, 0, 1, 0, 0.00, 1583541846, 0, 1583541806, 'chendu chendu chendu chendu', '', '', 'chendu');
INSERT INTO `fa_user_case` VALUES (15, 6, 'Criminal case', 26, 346, 1, 1, 10000.00, 1583543717, 0, 1583543516, 'liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,liuhuaqaing kill person case,kill a boy,', 'fuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuckfuck', 'its a  real cafind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencefind evidencese ture', 'liuhuaqaing kill person case');

-- ----------------------------
-- Table structure for fa_user_extend
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_extend`;
CREATE TABLE `fa_user_extend`  (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '客户主键ID',
  `uid` smallint(6) NOT NULL DEFAULT 0 COMMENT '客户ID',
  `legal_person` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户法人姓名',
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户地址',
  `business_license` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '客户营业执照',
  `license_register_time` int(11) NOT NULL DEFAULT 0 COMMENT '客户营业执照注册日期',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '注册时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户基础信息扩展表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_extend
-- ----------------------------
INSERT INTO `fa_user_extend` VALUES (5, 4, 'kebe', 'US', '/uploads/20200307/a4b81b7f895930d0adbae3a6dad54603.png', 1577808000, 1583528975);
INSERT INTO `fa_user_extend` VALUES (6, 6, 'james', 'england', '/uploads/20200307/16b731900e3b3b5f2aebecdfe4ec3234.jpg', 1577808000, 1583543405);

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token`  (
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
INSERT INTO `fa_user_token` VALUES ('8d702bcb04325675e268696badb7bffef7202c0f', 6, 1583543102, 1586135102);

SET FOREIGN_KEY_CHECKS = 1;
