/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50719
Source Host           : 127.0.0.1:3306
Source Database       : guns

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-08-12 11:12:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('24', '1', '0', '[0],', '总公司', '总公司', '', null);
INSERT INTO `sys_dept` VALUES ('25', '2', '24', '[0],[24],', '开发部', '开发部', '', null);
INSERT INTO `sys_dept` VALUES ('26', '3', '24', '[0],[24],', '运营部', '运营部', '', null);
INSERT INTO `sys_dept` VALUES ('27', '4', '24', '[0],[24],', '战略部', '战略部', '', null);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父级字典',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `code` varchar(255) DEFAULT NULL COMMENT '值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('50', '0', '0', '性别', null, 'sys_sex');
INSERT INTO `sys_dict` VALUES ('51', '1', '50', '男', null, '1');
INSERT INTO `sys_dict` VALUES ('52', '2', '50', '女', null, '2');
INSERT INTO `sys_dict` VALUES ('53', '0', '0', '状态', null, 'sys_state');
INSERT INTO `sys_dict` VALUES ('54', '1', '53', '启用', null, '1');
INSERT INTO `sys_dict` VALUES ('55', '2', '53', '禁用', null, '2');
INSERT INTO `sys_dict` VALUES ('56', '0', '0', '账号状态', null, 'account_state');
INSERT INTO `sys_dict` VALUES ('57', '1', '56', '启用', null, '1');
INSERT INTO `sys_dict` VALUES ('58', '2', '56', '冻结', null, '2');
INSERT INTO `sys_dict` VALUES ('59', '3', '56', '已删除', null, '3');

-- ----------------------------
-- Table structure for sys_expense
-- ----------------------------
DROP TABLE IF EXISTS `sys_expense`;
CREATE TABLE `sys_expense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(20,2) DEFAULT NULL COMMENT '报销金额',
  `desc` varchar(255) DEFAULT '' COMMENT '描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `state` int(11) DEFAULT NULL COMMENT '状态: 1.待提交  2:待审核   3.审核通过 4:驳回',
  `userid` int(11) DEFAULT NULL COMMENT '用户id',
  `processId` varchar(255) DEFAULT NULL COMMENT '流程定义id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销表';

-- ----------------------------
-- Records of sys_expense
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '管理员id',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `message` text COMMENT '具体消息',
  `ip` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8 COMMENT='登录记录';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES ('354', '退出日志', '1', '2018-08-01 18:46:09', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('355', '登录日志', '1', '2018-08-03 11:25:10', '成功', null, '0:0:0:0:0:0:0:1');
INSERT INTO `sys_login_log` VALUES ('356', '登录日志', '1', '2018-08-05 13:46:05', '成功', null, '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `code` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `pcode` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `pcodes` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `num` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `levels` int(65) DEFAULT NULL COMMENT '菜单层级',
  `ismenu` int(11) DEFAULT NULL COMMENT '是否是菜单（1：是  0：不是）',
  `tips` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(65) DEFAULT NULL COMMENT '菜单状态 :  1:启用   0:不启用',
  `isopen` int(11) DEFAULT NULL COMMENT '是否打开:    1:打开   0:不打开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024880191614980104 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('105', 'system', '0', '[0],', '系统管理', 'fa-user', '#', '4', '1', '1', null, '1', '1');
INSERT INTO `sys_menu` VALUES ('106', 'mgr', 'system', '[0],[system],', '用户管理', '', '/mgr', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('107', 'mgr_add', 'mgr', '[0],[system],[mgr],', '添加用户', null, '/mgr/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('108', 'mgr_edit', 'mgr', '[0],[system],[mgr],', '修改用户', null, '/mgr/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('109', 'mgr_delete', 'mgr', '[0],[system],[mgr],', '删除用户', null, '/mgr/delete', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('110', 'mgr_reset', 'mgr', '[0],[system],[mgr],', '重置密码', null, '/mgr/reset', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('111', 'mgr_freeze', 'mgr', '[0],[system],[mgr],', '冻结用户', null, '/mgr/freeze', '5', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('112', 'mgr_unfreeze', 'mgr', '[0],[system],[mgr],', '解除冻结用户', null, '/mgr/unfreeze', '6', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('113', 'mgr_setRole', 'mgr', '[0],[system],[mgr],', '分配角色', null, '/mgr/setRole', '7', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('114', 'role', 'system', '[0],[system],', '角色管理', null, '/role', '2', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('115', 'role_add', 'role', '[0],[system],[role],', '添加角色', null, '/role/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('116', 'role_edit', 'role', '[0],[system],[role],', '修改角色', null, '/role/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('117', 'role_remove', 'role', '[0],[system],[role],', '删除角色', null, '/role/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('118', 'role_setAuthority', 'role', '[0],[system],[role],', '配置权限', null, '/role/setAuthority', '4', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('119', 'menu', 'system', '[0],[system],', '菜单管理', null, '/menu', '4', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('120', 'menu_add', 'menu', '[0],[system],[menu],', '添加菜单', null, '/menu/add', '1', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('121', 'menu_edit', 'menu', '[0],[system],[menu],', '修改菜单', null, '/menu/edit', '2', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('122', 'menu_remove', 'menu', '[0],[system],[menu],', '删除菜单', null, '/menu/remove', '3', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('128', 'log', 'system', '[0],[system],', '业务日志', null, '/log', '6', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('130', 'druid', 'system', '[0],[system],', '监控管理', null, '/druid', '7', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('131', 'dept', 'system', '[0],[system],', '部门管理', null, '/dept', '3', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('132', 'dict', 'system', '[0],[system],', '字典管理', null, '/dict', '4', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('133', 'loginLog', 'system', '[0],[system],', '登录日志', null, '/loginLog', '6', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('134', 'log_clean', 'log', '[0],[system],[log],', '清空日志', null, '/log/delLog', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('135', 'dept_add', 'dept', '[0],[system],[dept],', '添加部门', null, '/dept/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('136', 'dept_update', 'dept', '[0],[system],[dept],', '修改部门', null, '/dept/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('137', 'dept_delete', 'dept', '[0],[system],[dept],', '删除部门', null, '/dept/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('138', 'dict_add', 'dict', '[0],[system],[dict],', '添加字典', null, '/dict/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('139', 'dict_update', 'dict', '[0],[system],[dict],', '修改字典', null, '/dict/update', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('140', 'dict_delete', 'dict', '[0],[system],[dict],', '删除字典', null, '/dict/delete', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('141', 'notice', 'system', '[0],[system],', '通知管理', null, '/notice', '9', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('142', 'notice_add', 'notice', '[0],[system],[notice],', '添加通知', null, '/notice/add', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('143', 'notice_update', 'notice', '[0],[system],[notice],', '修改通知', null, '/notice/update', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('144', 'notice_delete', 'notice', '[0],[system],[notice],', '删除通知', null, '/notice/delete', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('145', 'hello', '0', '[0],', '通知', 'fa-rocket', '/notice/hello', '1', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('148', 'code', '0', '[0],', '代码生成', 'fa-code', '/code', '3', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('149', 'api_mgr', '0', '[0],', '接口文档', 'fa-leaf', '/swagger-ui.html', '2', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('150', 'to_menu_edit', 'menu', '[0],[system],[menu],', '菜单编辑跳转', '', '/menu/menu_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('151', 'menu_list', 'menu', '[0],[system],[menu],', '菜单列表', '', '/menu/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('152', 'to_dept_update', 'dept', '[0],[system],[dept],', '修改部门跳转', '', '/dept/dept_update', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('153', 'dept_list', 'dept', '[0],[system],[dept],', '部门列表', '', '/dept/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('154', 'dept_detail', 'dept', '[0],[system],[dept],', '部门详情', '', '/dept/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('155', 'to_dict_edit', 'dict', '[0],[system],[dict],', '修改菜单跳转', '', '/dict/dict_edit', '4', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('156', 'dict_list', 'dict', '[0],[system],[dict],', '字典列表', '', '/dict/list', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('157', 'dict_detail', 'dict', '[0],[system],[dict],', '字典详情', '', '/dict/detail', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('158', 'log_list', 'log', '[0],[system],[log],', '日志列表', '', '/log/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('159', 'log_detail', 'log', '[0],[system],[log],', '日志详情', '', '/log/detail', '3', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('160', 'del_login_log', 'loginLog', '[0],[system],[loginLog],', '清空登录日志', '', '/loginLog/delLoginLog', '1', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('161', 'login_log_list', 'loginLog', '[0],[system],[loginLog],', '登录日志列表', '', '/loginLog/list', '2', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('162', 'to_role_edit', 'role', '[0],[system],[role],', '修改角色跳转', '', '/role/role_edit', '5', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('163', 'to_role_assign', 'role', '[0],[system],[role],', '角色分配跳转', '', '/role/role_assign', '6', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('164', 'role_list', 'role', '[0],[system],[role],', '角色列表', '', '/role/list', '7', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('165', 'to_assign_role', 'mgr', '[0],[system],[mgr],', '分配角色跳转', '', '/mgr/role_assign', '8', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('166', 'to_user_edit', 'mgr', '[0],[system],[mgr],', '编辑用户跳转', '', '/mgr/user_edit', '9', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('167', 'mgr_list', 'mgr', '[0],[system],[mgr],', '用户列表', '', '/mgr/list', '10', '3', '0', null, '1', null);
INSERT INTO `sys_menu` VALUES ('171', 'base_data_config', '0', '[0],', '基础数据配置', 'fa fa-cogs', '#', '5', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('1020213853372297218', 'plcConfig', 'base_data_config', '[0],[base_data_config],', 'PLC信息配置', '', '/plcConfig', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020213853372297219', 'plcConfig_list', 'plcConfig', '[0],[base_data_config],[plcConfig],', 'PLC信息配置列表', '', '/plcConfig/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020213853372297220', 'plcConfig_add', 'plcConfig', '[0],[base_data_config],[plcConfig],', 'PLC信息配置添加', '', '/plcConfig/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020213853372297221', 'plcConfig_update', 'plcConfig', '[0],[base_data_config],[plcConfig],', 'PLC信息配置更新', '', '/plcConfig/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020213853372297222', 'plcConfig_delete', 'plcConfig', '[0],[base_data_config],[plcConfig],', 'PLC信息配置删除', '', '/plcConfig/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020213853372297223', 'plcConfig_detail', 'plcConfig', '[0],[base_data_config],[plcConfig],', 'PLC信息配置详情', '', '/plcConfig/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020241259135094785', 'billCodeDefinition', 'base_data_config', '[0],[base_data_config],', '格口配置信息', '', '/billCodeDefinition', '2', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020241259143483393', 'billCodeDefinition_list', 'billCodeDefinition', '[0],[base_data_config],[billCodeDefinition],', '格口配置信息列表', '', '/billCodeDefinition/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020241259143483394', 'billCodeDefinition_add', 'billCodeDefinition', '[0],[base_data_config],[billCodeDefinition],', '格口配置信息添加', '', '/billCodeDefinition/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020241259143483395', 'billCodeDefinition_update', 'billCodeDefinition', '[0],[base_data_config],[billCodeDefinition],', '格口配置信息更新', '', '/billCodeDefinition/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020241259143483396', 'billCodeDefinition_delete', 'billCodeDefinition', '[0],[base_data_config],[billCodeDefinition],', '格口配置信息删除', '', '/billCodeDefinition/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020241259143483397', 'billCodeDefinition_detail', 'billCodeDefinition', '[0],[base_data_config],[billCodeDefinition],', '格口配置信息详情', '', '/billCodeDefinition/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237250', 'paramConfig', 'base_data_config', '[0],[base_data_config],', '参数配置', '', '/paramConfig', '3', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237251', 'paramConfig_list', 'paramConfig', '[0],[base_data_config],[paramConfig],', '参数配置列表', '', '/paramConfig/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237252', 'paramConfig_add', 'paramConfig', '[0],[base_data_config],[paramConfig],', '参数配置添加', '', '/paramConfig/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237253', 'paramConfig_update', 'paramConfig', '[0],[base_data_config],[paramConfig],', '参数配置更新', '', '/paramConfig/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237254', 'paramConfig_delete', 'paramConfig', '[0],[base_data_config],[paramConfig],', '参数配置删除', '', '/paramConfig/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237255', 'paramConfig_detail', 'paramConfig', '[0],[base_data_config],[paramConfig],', '参数配置详情', '', '/paramConfig/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020275178077237256', 'data_query', '0', '[0],', '数据查询', 'fa fa-search', '#', '6', '1', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('1020732959441424386', 'scanDetail', 'data_query', '[0],[data_query],', '扫描详情查询', '', '/scanDetail', '1', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020732959441424387', 'scanDetail_list', 'scanDetail', '[0],[data_query],[scanDetail],', '扫描详情查询列表', '', '/scanDetail/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020732959441424388', 'scanDetail_add', 'scanDetail', '[0],[data_query],[scanDetail],', '扫描详情查询添加', '', '/scanDetail/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020732959441424389', 'scanDetail_update', 'scanDetail', '[0],[data_query],[scanDetail],', '扫描详情查询更新', '', '/scanDetail/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020732959441424390', 'scanDetail_delete', 'scanDetail', '[0],[data_query],[scanDetail],', '扫描详情查询删除', '', '/scanDetail/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020732959441424391', 'scanDetail_detail', 'scanDetail', '[0],[data_query],[scanDetail],', '扫描详情查询详情', '', '/scanDetail/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317569', 'yddSealmail', 'data_query', '[0],[data_query],', '下件信息查询', '', '/yddSealmail', '2', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317570', 'yddSealmail_list', 'yddSealmail', '[0],[data_query],[yddSealmail],', '下件信息查询列表', '', '/yddSealmail/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317571', 'yddSealmail_add', 'yddSealmail', '[0],[data_query],[yddSealmail],', '下件信息查询添加', '', '/yddSealmail/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317572', 'yddSealmail_update', 'yddSealmail', '[0],[data_query],[yddSealmail],', '下件信息查询更新', '', '/yddSealmail/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317573', 'yddSealmail_delete', 'yddSealmail', '[0],[data_query],[yddSealmail],', '下件信息查询删除', '', '/yddSealmail/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317574', 'yddSealmail_detail', 'yddSealmail', '[0],[data_query],[yddSealmail],', '下件信息查询详情', '', '/yddSealmail/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1020737584366317575', 'throughput', 'data_query', '[0],[data_query],', '格口吞吐量', '', '/throughput', '3', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('1020737584366317576', 'sortCounts', 'data_query', '[0],[data_query],', '分拣总量', '', '/sortCounts', '4', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('1020737584366317577', 'supply_efficiency', 'data_query', '[0],[data_query],', '供件台效率统计', '', '/supplyEfficiency', '5', '2', '1', null, '1', null);
INSERT INTO `sys_menu` VALUES ('1024880191614980097', 'portSync', 'base_data_config', '[0],[base_data_config],', '端口同步配置', '', '/portSync', '4', '2', '1', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1024880191614980098', 'portSync_list', 'portSync', '[0],[base_data_config],[portSync],', '端口同步配置列表', '', '/portSync/list', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1024880191614980099', 'portSync_add', 'portSync', '[0],[base_data_config],[portSync],', '端口同步配置添加', '', '/portSync/add', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1024880191614980100', 'portSync_update', 'portSync', '[0],[base_data_config],[portSync],', '端口同步配置更新', '', '/portSync/update', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1024880191614980101', 'portSync_delete', 'portSync', '[0],[base_data_config],[portSync],', '端口同步配置删除', '', '/portSync/delete', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1024880191614980102', 'portSync_detail', 'portSync', '[0],[base_data_config],[portSync],', '端口同步配置详情', '', '/portSync/detail', '99', '3', '0', null, '1', '0');
INSERT INTO `sys_menu` VALUES ('1024880191614980103', 'sorting_efficiency', 'data_query', '[0],[data_query],', '分拣效率趋势图', '', '/sortingEfficiency', '6', '2', '1', null, '1', null);

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `content` text COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `creater` int(11) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='通知表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('6', '世界', '10', '欢迎使用分拣机信息管理系统<p><br></p>', '2017-01-11 08:53:20', '1');
INSERT INTO `sys_notice` VALUES ('8', '你好', null, '你好', '2017-05-10 19:28:57', '1');

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` int(65) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logtype` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `logname` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `userid` int(65) DEFAULT NULL COMMENT '用户id',
  `classname` varchar(255) DEFAULT NULL COMMENT '类名称',
  `method` text COMMENT '方法名称',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `succeed` varchar(255) DEFAULT NULL COMMENT '是否成功',
  `message` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8 COMMENT='操作日志';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------
INSERT INTO `sys_operation_log` VALUES ('631', '业务日志', '清空业务日志', '1', 'com.stylefeng.guns.modular.system.controller.LogController', 'delLog', '2018-08-01 18:46:04', '成功', '主键id=null');
INSERT INTO `sys_operation_log` VALUES ('632', '业务日志', '修改菜单', '1', 'com.stylefeng.guns.modular.system.controller.MenuController', 'edit', '2018-08-02 12:51:37', '成功', '菜单名称=端口同步配置;;;字段名称:菜单排序号,旧值:99,新值:4');
INSERT INTO `sys_operation_log` VALUES ('633', '业务日志', '配置权限', '1', 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-08-02 12:51:47', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,基础数据配置');
INSERT INTO `sys_operation_log` VALUES ('634', '异常日志', '', '1', null, null, '2018-08-05 15:26:55', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'offset\' not found. Available parameters are [offect, param5, param6, chute, limit, beginTime, endTime, param3, barcode, param4, param1, param2]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy90.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:230)\r\n	at org.apache.ibatis.binding.MapperMethod.executeForMany(MapperMethod.java:139)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:76)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy117.getYddSealmails(Unknown Source)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getYddSealmails(YddSealmailServiceImpl.java:55)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTT8d2a852c.getYddSealmails(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailController.list(YddSealmailController.java:74)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailControllerTTFastClassBySpringCGLIBTTc67e3498.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailControllerTTEnhancerBySpringCGLIBTT2115e42d.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'offset\' not found. Available parameters are [offect, param5, param6, chute, limit, beginTime, endTime, param3, barcode, param4, param1, param2]\r\n	at org.apache.ibatis.binding.MapperMethodTParamMap.get(MapperMethod.java:204)\r\n	at org.apache.ibatis.reflection.wrapper.MapWrapper.get(MapWrapper.java:45)\r\n	at org.apache.ibatis.reflection.MetaObject.getValue(MetaObject.java:122)\r\n	at org.apache.ibatis.executor.BaseExecutor.createCacheKey(BaseExecutor.java:219)\r\n	at org.apache.ibatis.executor.CachingExecutor.createCacheKey(CachingExecutor.java:146)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:82)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy96.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 108 more\r\n');
INSERT INTO `sys_operation_log` VALUES ('635', '异常日志', '', '1', null, null, '2018-08-05 15:28:52', '失败', 'org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException: Parameter \'offset\' not found. Available parameters are [offect, param5, param6, chute, limit, beginTime, endTime, param3, barcode, param4, param1, param2]\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:77)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy90.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:230)\r\n	at org.apache.ibatis.binding.MapperMethod.executeForMany(MapperMethod.java:139)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:76)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy117.getYddSealmails(Unknown Source)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getYddSealmails(YddSealmailServiceImpl.java:55)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTT8d2a852c.getYddSealmails(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailController.list(YddSealmailController.java:74)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailControllerTTFastClassBySpringCGLIBTTc67e3498.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailControllerTTEnhancerBySpringCGLIBTT2115e42d.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: org.apache.ibatis.binding.BindingException: Parameter \'offset\' not found. Available parameters are [offect, param5, param6, chute, limit, beginTime, endTime, param3, barcode, param4, param1, param2]\r\n	at org.apache.ibatis.binding.MapperMethodTParamMap.get(MapperMethod.java:204)\r\n	at org.apache.ibatis.reflection.wrapper.MapWrapper.get(MapWrapper.java:45)\r\n	at org.apache.ibatis.reflection.MetaObject.getValue(MetaObject.java:122)\r\n	at org.apache.ibatis.executor.BaseExecutor.createCacheKey(BaseExecutor.java:219)\r\n	at org.apache.ibatis.executor.CachingExecutor.createCacheKey(CachingExecutor.java:146)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:82)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy96.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 108 more\r\n');
INSERT INTO `sys_operation_log` VALUES ('636', '异常日志', '', '1', null, null, '2018-08-05 15:29:42', '失败', 'org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ORDER BY sorttime\' at line 47\r\n### The error may exist in file [D:\\ideaproj\\guns\\guns-admin\\target\\classes\\com\\stylefeng\\guns\\modular\\system\\dao\\mapping\\YddSealmailMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT         id,         bagid,         barcode,         mailid,         lchute,         chute,         sorttime,         inductionid,         weight,         length,         width,         height,         volume,         dropflag,         checkflag,         succesydlag,         overflowid,         printflag,         printtime,         indtime,         indmode,         obrid,         scantime,         trayid,         delflag,         ocrflag,         rejectflag,         sendflag,         sendtime,         CASE devicecode         WHEN \'1\' THEN         \'暴力分拣\'         WHEN \'2\' THEN         \'人工补码\'         ELSE         \'超时下架\'         END \'devicecode\',         lchute AS \'lchute\'         FROM         tbl_ydd_sealmail where 1 = 1                                                 LIMIT ?,?         ORDER BY sorttime\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ORDER BY sorttime\' at line 47\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ORDER BY sorttime\' at line 47\r\n	at org.springframework.jdbc.support.SQLErrorCodeSQLExceptionTranslator.doTranslate(SQLErrorCodeSQLExceptionTranslator.java:234)\r\n	at org.springframework.jdbc.support.AbstractFallbackSQLExceptionTranslator.translate(AbstractFallbackSQLExceptionTranslator.java:72)\r\n	at org.mybatis.spring.MyBatisExceptionTranslator.translateExceptionIfPossible(MyBatisExceptionTranslator.java:73)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:446)\r\n	at com.sun.proxy.TProxy90.selectList(Unknown Source)\r\n	at org.mybatis.spring.SqlSessionTemplate.selectList(SqlSessionTemplate.java:230)\r\n	at org.apache.ibatis.binding.MapperMethod.executeForMany(MapperMethod.java:139)\r\n	at org.apache.ibatis.binding.MapperMethod.execute(MapperMethod.java:76)\r\n	at org.apache.ibatis.binding.MapperProxy.invoke(MapperProxy.java:59)\r\n	at com.sun.proxy.TProxy117.getYddSealmails(Unknown Source)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getYddSealmails(YddSealmailServiceImpl.java:55)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTT4ce4ee1f.getYddSealmails(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailController.list(YddSealmailController.java:74)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailControllerTTFastClassBySpringCGLIBTTc67e3498.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.YddSealmailControllerTTEnhancerBySpringCGLIBTT38920880.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\nCaused by: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'ORDER BY sorttime\' at line 47\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:118)\r\n	at com.mysql.cj.jdbc.exceptions.SQLError.createSQLException(SQLError.java:95)\r\n	at com.mysql.cj.jdbc.exceptions.SQLExceptionsMapping.translateException(SQLExceptionsMapping.java:122)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.executeInternal(ClientPreparedStatement.java:960)\r\n	at com.mysql.cj.jdbc.ClientPreparedStatement.execute(ClientPreparedStatement.java:388)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3409)\r\n	at com.alibaba.druid.filter.FilterEventAdapter.preparedStatement_execute(FilterEventAdapter.java:440)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3407)\r\n	at com.alibaba.druid.wall.WallFilter.preparedStatement_execute(WallFilter.java:619)\r\n	at com.alibaba.druid.filter.FilterChainImpl.preparedStatement_execute(FilterChainImpl.java:3407)\r\n	at com.alibaba.druid.proxy.jdbc.PreparedStatementProxyImpl.execute(PreparedStatementProxyImpl.java:167)\r\n	at com.alibaba.druid.pool.DruidPooledPreparedStatement.execute(DruidPooledPreparedStatement.java:498)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.logging.jdbc.PreparedStatementLogger.invoke(PreparedStatementLogger.java:59)\r\n	at com.sun.proxy.TProxy99.execute(Unknown Source)\r\n	at org.apache.ibatis.executor.statement.PreparedStatementHandler.query(PreparedStatementHandler.java:63)\r\n	at org.apache.ibatis.executor.statement.RoutingStatementHandler.query(RoutingStatementHandler.java:79)\r\n	at sun.reflect.GeneratedMethodAccessor109.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy97.query(Unknown Source)\r\n	at sun.reflect.GeneratedMethodAccessor109.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy97.query(Unknown Source)\r\n	at org.apache.ibatis.executor.SimpleExecutor.doQuery(SimpleExecutor.java:63)\r\n	at org.apache.ibatis.executor.BaseExecutor.queryFromDatabase(BaseExecutor.java:326)\r\n	at org.apache.ibatis.executor.BaseExecutor.query(BaseExecutor.java:156)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:109)\r\n	at org.apache.ibatis.executor.CachingExecutor.query(CachingExecutor.java:83)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.apache.ibatis.plugin.Plugin.invoke(Plugin.java:63)\r\n	at com.sun.proxy.TProxy96.query(Unknown Source)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:148)\r\n	at org.apache.ibatis.session.defaults.DefaultSqlSession.selectList(DefaultSqlSession.java:141)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.mybatis.spring.SqlSessionTemplateTSqlSessionInterceptor.invoke(SqlSessionTemplate.java:433)\r\n	... 108 more\r\n');
INSERT INTO `sys_operation_log` VALUES ('637', '业务日志', '菜单新增', '1', 'com.stylefeng.guns.modular.system.controller.MenuController', 'add', '2018-08-06 12:45:32', '成功', '菜单名称=分拣效率趋势图');
INSERT INTO `sys_operation_log` VALUES ('638', '业务日志', '配置权限', '1', 'com.stylefeng.guns.modular.system.controller.RoleController', 'setAuthority', '2018-08-06 12:45:42', '成功', '角色名称=超级管理员,资源名称=系统管理,用户管理,添加用户,修改用户,删除用户,重置密码,冻结用户,解除冻结用户,分配角色,分配角色跳转,编辑用户跳转,用户列表,角色管理,添加角色,修改角色,删除角色,配置权限,修改角色跳转,角色分配跳转,角色列表,菜单管理,添加菜单,修改菜单,删除菜单,菜单编辑跳转,菜单列表,业务日志,清空日志,日志列表,日志详情,监控管理,部门管理,添加部门,修改部门,删除部门,修改部门跳转,部门列表,部门详情,字典管理,添加字典,修改字典,删除字典,修改菜单跳转,字典列表,字典详情,登录日志,清空登录日志,登录日志列表,通知管理,添加通知,修改通知,删除通知,通知,代码生成,接口文档,基础数据配置');
INSERT INTO `sys_operation_log` VALUES ('639', '异常日志', '', '1', null, null, '2018-08-06 12:48:39', '失败', 'java.lang.IllegalArgumentException: Date and Patterns must not be null\r\n	at org.apache.commons.lang3.time.DateUtils.parseDateWithLeniency(DateUtils.java:367)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:302)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:279)\r\n	at com.stylefeng.guns.core.util.DateUtil.parse(DateUtil.java:149)\r\n	at com.stylefeng.guns.core.util.DateUtil.parseTime(DateUtil.java:141)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getSortingEfficiency(YddSealmailServiceImpl.java:276)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTTbdd7ce47.getSortingEfficiency(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyController.list(SortingEfficiencyController.java:42)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTFastClassBySpringCGLIBTTc5455558.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTEnhancerBySpringCGLIBTT665bc6b3.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('640', '异常日志', '', '1', null, null, '2018-08-06 12:50:47', '失败', 'java.lang.IllegalArgumentException: Date and Patterns must not be null\r\n	at org.apache.commons.lang3.time.DateUtils.parseDateWithLeniency(DateUtils.java:367)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:302)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:279)\r\n	at com.stylefeng.guns.core.util.DateUtil.parse(DateUtil.java:149)\r\n	at com.stylefeng.guns.core.util.DateUtil.parseTime(DateUtil.java:141)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getSortingEfficiency(YddSealmailServiceImpl.java:276)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTTbdd7ce47.getSortingEfficiency(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyController.list(SortingEfficiencyController.java:42)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTFastClassBySpringCGLIBTTc5455558.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTEnhancerBySpringCGLIBTT665bc6b3.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('641', '异常日志', '', '1', null, null, '2018-08-06 12:52:02', '失败', 'java.lang.IllegalArgumentException: Date and Patterns must not be null\r\n	at org.apache.commons.lang3.time.DateUtils.parseDateWithLeniency(DateUtils.java:367)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:302)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:279)\r\n	at com.stylefeng.guns.core.util.DateUtil.parse(DateUtil.java:149)\r\n	at com.stylefeng.guns.core.util.DateUtil.parseTime(DateUtil.java:141)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getSortingEfficiency(YddSealmailServiceImpl.java:276)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTTb3581b6f.getSortingEfficiency(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyController.list(SortingEfficiencyController.java:42)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTFastClassBySpringCGLIBTTc5455558.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTEnhancerBySpringCGLIBTT5ee4d6ac.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('642', '异常日志', '', '1', null, null, '2018-08-06 13:00:35', '失败', 'java.lang.IllegalArgumentException: Date and Patterns must not be null\r\n	at org.apache.commons.lang3.time.DateUtils.parseDateWithLeniency(DateUtils.java:367)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:302)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:279)\r\n	at com.stylefeng.guns.core.util.DateUtil.parse(DateUtil.java:149)\r\n	at com.stylefeng.guns.core.util.DateUtil.parseTime(DateUtil.java:141)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getSortingEfficiency(YddSealmailServiceImpl.java:276)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTTa407dd43.getSortingEfficiency(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyController.list(SortingEfficiencyController.java:42)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTFastClassBySpringCGLIBTTc5455558.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTEnhancerBySpringCGLIBTTfc1740ec.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('643', '异常日志', '', '1', null, null, '2018-08-06 13:18:37', '失败', 'java.lang.IllegalArgumentException: Date and Patterns must not be null\r\n	at org.apache.commons.lang3.time.DateUtils.parseDateWithLeniency(DateUtils.java:367)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:302)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:279)\r\n	at com.stylefeng.guns.core.util.DateUtil.parse(DateUtil.java:149)\r\n	at com.stylefeng.guns.core.util.DateUtil.parseTime(DateUtil.java:141)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getSortingEfficiency(YddSealmailServiceImpl.java:276)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTT4a5b0863.getSortingEfficiency(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyController.list(SortingEfficiencyController.java:42)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTFastClassBySpringCGLIBTTc5455558.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTEnhancerBySpringCGLIBTT70b62f5f.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');
INSERT INTO `sys_operation_log` VALUES ('644', '异常日志', '', '1', null, null, '2018-08-06 13:19:14', '失败', 'java.lang.IllegalArgumentException: Date and Patterns must not be null\r\n	at org.apache.commons.lang3.time.DateUtils.parseDateWithLeniency(DateUtils.java:367)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:302)\r\n	at org.apache.commons.lang3.time.DateUtils.parseDate(DateUtils.java:279)\r\n	at com.stylefeng.guns.core.util.DateUtil.parse(DateUtil.java:149)\r\n	at com.stylefeng.guns.core.util.DateUtil.parseTime(DateUtil.java:141)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImpl.getSortingEfficiency(YddSealmailServiceImpl.java:276)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTFastClassBySpringCGLIBTT496a527c.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.service.impl.YddSealmailServiceImplTTEnhancerBySpringCGLIBTT4a5b0863.getSortingEfficiency(<generated>)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyController.list(SortingEfficiencyController.java:42)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTFastClassBySpringCGLIBTTc5455558.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:204)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:89)\r\n	at com.stylefeng.guns.core.intercept.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:29)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:92)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:185)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.stylefeng.guns.modular.business.controller.SortingEfficiencyControllerTTEnhancerBySpringCGLIBTT70b62f5f.list(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:209)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:136)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:102)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:877)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:783)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:991)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:925)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:974)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:877)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:661)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:851)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:742)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:52)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.stylefeng.guns.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:99)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HttpPutFormContentFilter.doFilterInternal(HttpPutFormContentFilter.java:109)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.HiddenHttpMethodFilter.doFilterInternal(HiddenHttpMethodFilter.java:81)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:200)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:107)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:198)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:496)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:140)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:81)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:87)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:342)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:803)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:790)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1459)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n');

-- ----------------------------
-- Table structure for sys_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_relation`;
CREATE TABLE `sys_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `menuid` bigint(11) DEFAULT NULL COMMENT '菜单id',
  `roleid` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4786 DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_relation
-- ----------------------------
INSERT INTO `sys_relation` VALUES ('4577', '1020275178077237256', '5');
INSERT INTO `sys_relation` VALUES ('4578', '1020732959441424386', '5');
INSERT INTO `sys_relation` VALUES ('4579', '1020732959441424387', '5');
INSERT INTO `sys_relation` VALUES ('4580', '1020732959441424388', '5');
INSERT INTO `sys_relation` VALUES ('4581', '1020732959441424389', '5');
INSERT INTO `sys_relation` VALUES ('4582', '1020732959441424390', '5');
INSERT INTO `sys_relation` VALUES ('4583', '1020732959441424391', '5');
INSERT INTO `sys_relation` VALUES ('4584', '1020737584366317569', '5');
INSERT INTO `sys_relation` VALUES ('4585', '1020737584366317570', '5');
INSERT INTO `sys_relation` VALUES ('4586', '1020737584366317571', '5');
INSERT INTO `sys_relation` VALUES ('4587', '1020737584366317572', '5');
INSERT INTO `sys_relation` VALUES ('4588', '1020737584366317573', '5');
INSERT INTO `sys_relation` VALUES ('4589', '1020737584366317574', '5');
INSERT INTO `sys_relation` VALUES ('4590', '1020737584366317575', '5');
INSERT INTO `sys_relation` VALUES ('4591', '1020737584366317576', '5');
INSERT INTO `sys_relation` VALUES ('4592', '1020737584366317577', '5');
INSERT INTO `sys_relation` VALUES ('4689', '105', '1');
INSERT INTO `sys_relation` VALUES ('4690', '106', '1');
INSERT INTO `sys_relation` VALUES ('4691', '107', '1');
INSERT INTO `sys_relation` VALUES ('4692', '108', '1');
INSERT INTO `sys_relation` VALUES ('4693', '109', '1');
INSERT INTO `sys_relation` VALUES ('4694', '110', '1');
INSERT INTO `sys_relation` VALUES ('4695', '111', '1');
INSERT INTO `sys_relation` VALUES ('4696', '112', '1');
INSERT INTO `sys_relation` VALUES ('4697', '113', '1');
INSERT INTO `sys_relation` VALUES ('4698', '165', '1');
INSERT INTO `sys_relation` VALUES ('4699', '166', '1');
INSERT INTO `sys_relation` VALUES ('4700', '167', '1');
INSERT INTO `sys_relation` VALUES ('4701', '114', '1');
INSERT INTO `sys_relation` VALUES ('4702', '115', '1');
INSERT INTO `sys_relation` VALUES ('4703', '116', '1');
INSERT INTO `sys_relation` VALUES ('4704', '117', '1');
INSERT INTO `sys_relation` VALUES ('4705', '118', '1');
INSERT INTO `sys_relation` VALUES ('4706', '162', '1');
INSERT INTO `sys_relation` VALUES ('4707', '163', '1');
INSERT INTO `sys_relation` VALUES ('4708', '164', '1');
INSERT INTO `sys_relation` VALUES ('4709', '119', '1');
INSERT INTO `sys_relation` VALUES ('4710', '120', '1');
INSERT INTO `sys_relation` VALUES ('4711', '121', '1');
INSERT INTO `sys_relation` VALUES ('4712', '122', '1');
INSERT INTO `sys_relation` VALUES ('4713', '150', '1');
INSERT INTO `sys_relation` VALUES ('4714', '151', '1');
INSERT INTO `sys_relation` VALUES ('4715', '128', '1');
INSERT INTO `sys_relation` VALUES ('4716', '134', '1');
INSERT INTO `sys_relation` VALUES ('4717', '158', '1');
INSERT INTO `sys_relation` VALUES ('4718', '159', '1');
INSERT INTO `sys_relation` VALUES ('4719', '130', '1');
INSERT INTO `sys_relation` VALUES ('4720', '131', '1');
INSERT INTO `sys_relation` VALUES ('4721', '135', '1');
INSERT INTO `sys_relation` VALUES ('4722', '136', '1');
INSERT INTO `sys_relation` VALUES ('4723', '137', '1');
INSERT INTO `sys_relation` VALUES ('4724', '152', '1');
INSERT INTO `sys_relation` VALUES ('4725', '153', '1');
INSERT INTO `sys_relation` VALUES ('4726', '154', '1');
INSERT INTO `sys_relation` VALUES ('4727', '132', '1');
INSERT INTO `sys_relation` VALUES ('4728', '138', '1');
INSERT INTO `sys_relation` VALUES ('4729', '139', '1');
INSERT INTO `sys_relation` VALUES ('4730', '140', '1');
INSERT INTO `sys_relation` VALUES ('4731', '155', '1');
INSERT INTO `sys_relation` VALUES ('4732', '156', '1');
INSERT INTO `sys_relation` VALUES ('4733', '157', '1');
INSERT INTO `sys_relation` VALUES ('4734', '133', '1');
INSERT INTO `sys_relation` VALUES ('4735', '160', '1');
INSERT INTO `sys_relation` VALUES ('4736', '161', '1');
INSERT INTO `sys_relation` VALUES ('4737', '141', '1');
INSERT INTO `sys_relation` VALUES ('4738', '142', '1');
INSERT INTO `sys_relation` VALUES ('4739', '143', '1');
INSERT INTO `sys_relation` VALUES ('4740', '144', '1');
INSERT INTO `sys_relation` VALUES ('4741', '145', '1');
INSERT INTO `sys_relation` VALUES ('4742', '148', '1');
INSERT INTO `sys_relation` VALUES ('4743', '149', '1');
INSERT INTO `sys_relation` VALUES ('4744', '171', '1');
INSERT INTO `sys_relation` VALUES ('4745', '1020213853372297218', '1');
INSERT INTO `sys_relation` VALUES ('4746', '1020213853372297219', '1');
INSERT INTO `sys_relation` VALUES ('4747', '1020213853372297220', '1');
INSERT INTO `sys_relation` VALUES ('4748', '1020213853372297221', '1');
INSERT INTO `sys_relation` VALUES ('4749', '1020213853372297222', '1');
INSERT INTO `sys_relation` VALUES ('4750', '1020213853372297223', '1');
INSERT INTO `sys_relation` VALUES ('4751', '1020241259135094785', '1');
INSERT INTO `sys_relation` VALUES ('4752', '1020241259143483393', '1');
INSERT INTO `sys_relation` VALUES ('4753', '1020241259143483394', '1');
INSERT INTO `sys_relation` VALUES ('4754', '1020241259143483395', '1');
INSERT INTO `sys_relation` VALUES ('4755', '1020241259143483396', '1');
INSERT INTO `sys_relation` VALUES ('4756', '1020241259143483397', '1');
INSERT INTO `sys_relation` VALUES ('4757', '1020275178077237250', '1');
INSERT INTO `sys_relation` VALUES ('4758', '1020275178077237251', '1');
INSERT INTO `sys_relation` VALUES ('4759', '1020275178077237252', '1');
INSERT INTO `sys_relation` VALUES ('4760', '1020275178077237253', '1');
INSERT INTO `sys_relation` VALUES ('4761', '1020275178077237254', '1');
INSERT INTO `sys_relation` VALUES ('4762', '1020275178077237255', '1');
INSERT INTO `sys_relation` VALUES ('4763', '1024880191614980097', '1');
INSERT INTO `sys_relation` VALUES ('4764', '1024880191614980098', '1');
INSERT INTO `sys_relation` VALUES ('4765', '1024880191614980099', '1');
INSERT INTO `sys_relation` VALUES ('4766', '1024880191614980100', '1');
INSERT INTO `sys_relation` VALUES ('4767', '1024880191614980101', '1');
INSERT INTO `sys_relation` VALUES ('4768', '1024880191614980102', '1');
INSERT INTO `sys_relation` VALUES ('4769', '1020275178077237256', '1');
INSERT INTO `sys_relation` VALUES ('4770', '1020732959441424386', '1');
INSERT INTO `sys_relation` VALUES ('4771', '1020732959441424387', '1');
INSERT INTO `sys_relation` VALUES ('4772', '1020732959441424388', '1');
INSERT INTO `sys_relation` VALUES ('4773', '1020732959441424389', '1');
INSERT INTO `sys_relation` VALUES ('4774', '1020732959441424390', '1');
INSERT INTO `sys_relation` VALUES ('4775', '1020732959441424391', '1');
INSERT INTO `sys_relation` VALUES ('4776', '1020737584366317569', '1');
INSERT INTO `sys_relation` VALUES ('4777', '1020737584366317570', '1');
INSERT INTO `sys_relation` VALUES ('4778', '1020737584366317571', '1');
INSERT INTO `sys_relation` VALUES ('4779', '1020737584366317572', '1');
INSERT INTO `sys_relation` VALUES ('4780', '1020737584366317573', '1');
INSERT INTO `sys_relation` VALUES ('4781', '1020737584366317574', '1');
INSERT INTO `sys_relation` VALUES ('4782', '1020737584366317575', '1');
INSERT INTO `sys_relation` VALUES ('4783', '1020737584366317576', '1');
INSERT INTO `sys_relation` VALUES ('4784', '1020737584366317577', '1');
INSERT INTO `sys_relation` VALUES ('4785', '1024880191614980103', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '0', '超级管理员', '24', 'administrator', '1');
INSERT INTO `sys_role` VALUES ('5', '2', '1', '临时', '26', 'temp', null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'girl.gif', 'admin', 'ecfadcde9305f8891bcfe5a1e28c253e', '8pgby', '张三', '2017-05-05 00:00:00', '2', 'sn93@qq.com', '18200000000', '1', '27', '1', '2016-01-29 08:49:53', '25');
INSERT INTO `sys_user` VALUES ('44', null, 'test', '45abb7879f6a8268f1ef600e6038ac73', 'ssts3', 'test', '2017-05-01 00:00:00', '1', 'abc@123.com', '', '5', '26', '3', '2017-05-16 20:33:37', null);
INSERT INTO `sys_user` VALUES ('45', null, 'boss', '71887a5ad666a18f709e1d4e693d5a35', '1f7bf', '老板', '2017-12-04 00:00:00', '1', '', '', '1', '24', '1', '2017-12-04 22:24:02', null);
INSERT INTO `sys_user` VALUES ('46', '4a46371a-41e2-4a12-8a2d-cff64364da99.gif', 'manager', 'b53cac62e7175637d4beb3b16b2f7915', 'j3cs9', '经理', '2017-12-04 00:00:00', '1', '', '', '5', '24', '1', '2017-12-04 22:24:24', null);

-- ----------------------------
-- Table structure for tbl_bill_code_definition
-- ----------------------------
DROP TABLE IF EXISTS `tbl_bill_code_definition`;
CREATE TABLE `tbl_bill_code_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT '' COMMENT '面单种类编码',
  `name` varchar(255) DEFAULT NULL COMMENT '面单种类名称',
  `isList` varchar(20) DEFAULT NULL COMMENT '是否有明细',
  `unitNumber` varchar(20) DEFAULT NULL COMMENT '单位数目',
  `startChars` varchar(255) DEFAULT NULL COMMENT '开始字符',
  `afterLength` double DEFAULT NULL COMMENT '开始字符之后的字长度',
  `totalLength` double DEFAULT NULL COMMENT '面单字符总长度',
  `billTypeId` varchar(255) DEFAULT NULL COMMENT '面单类型 id',
  `syncVersion` varchar(255) DEFAULT NULL COMMENT '版本号',
  `billTypeName` varchar(255) DEFAULT NULL COMMENT '面单类型名称',
  `isEBill` varchar(255) DEFAULT NULL COMMENT '是否是电子面单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='分拣口信息表';

-- ----------------------------
-- Records of tbl_bill_code_definition
-- ----------------------------
INSERT INTO `tbl_bill_code_definition` VALUES ('1', '001', '四联单', 'true', '1', '0000', '9', '13', '117', '5000000011001', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('2', '002', '五联单', 'true', '1', '000', '10', '13', '117', '5000000011002', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('3', '003', '三联单', 'true', '1', 'C0000', '8', '13', '117', '5000000011003', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('4', '004', '代收', 'true', '1', 'D000', '9', '13', '144', '5000000011004', '代收货款', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('5', '006', '到付面单', 'true', '1', 'B000', '9', '13', '143', '5000000016383', '到付', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('6', '007', '物料部发货面单', 'true', '1', '0000000', '6', '13', '117', '5000000015111', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('7', '010', '广东五联单2', 'true', '1', '02', '11', '13', '117', '5000000011007', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('8', '011', '广东五联单1', 'true', '1', '02000', '8', '13', '117', '5000000011008', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('9', '012', '广东代收', 'true', '1', 'D90000', '7', '13', '144', '5000000011009', '代收货款', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('10', '013', '发货标签', 'true', '1', '10', '10', '12', '117', '5000000016691', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('11', '014', 'VIP面单', 'true', '1', 'A000', '9', '13', '117', '5000000016362', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('12', '015', '特种面单', 'true', '1', 'BXA0', '9', '13', '117', '5000000017525', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('13', '016', '广东子母单', 'true', '1', 'Z0000', '8', '13', '117', '5000000011013', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('14', '017', '广东回单', 'true', '1', 'HD00000', '6', '13', '304', '5000000011014', '回单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('15', '018', '淘宝面单', 'true', '1', 'E000', '9', '13', '117', '5000000016384', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('16', '019', '回单专用', 'true', '1', 'HD', '11', '13', '304', '5000000011016', '回单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('17', '020', '中心发车单', 'true', '1', 'FC', '11', '13', '117', '5000000011017', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('18', '046', '大包单', 'true', '1', '40', '10', '12', '8500', '5000000011018', '大包单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('19', '022', '班车封扣', 'true', '1', 'Q', '8', '9', '117', '5000000011019', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('20', '023', '四联单(128码)', 'true', '1', '21', '10', '12', '117', '5000000017945', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('21', '024', '五联单(128码)', 'true', '1', '22', '10', '12', '117', '5000000011021', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('22', '025', '三联单(128码)', 'true', '1', '23', '10', '12', '117', '5000000011022', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('23', '026', '代收(128码)', 'true', '1', '24', '10', '12', '144', '5000000011023', '代收货款', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('24', '027', '到付面单(128码)', 'true', '1', '25', '10', '12', '143', '5000000011024', '到付', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('25', '028', '物料部发货面单(128码)', 'true', '1', '26', '10', '12', '117', '5000000015109', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('26', '029', '广东五联单2(128码)', 'true', '1', '27', '10', '12', '117', '5000000011026', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('27', '030', '广东五联单1(128码)', 'true', '1', '28', '10', '12', '117', '5000000011027', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('28', '031', '广东代收(128码)', 'true', '1', '29', '10', '12', '144', '5000000011028', '代收货款', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('29', '032', '发货标签(128码)', 'true', '1', '30', '10', '12', '117', '5000000011029', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('30', '033', 'VIP(128码)', 'true', '1', '31', '10', '12', '117', '5000000011030', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('31', '034', '特种面单(128码)', 'true', '1', '32', '10', '12', '117', '5000000011031', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('32', '035', '广东子母单(128码)', 'true', '1', '33', '10', '12', '117', '5000000011032', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('33', '036', '广东回单(128码)', 'true', '1', '34', '10', '12', '304', '5000000011033', '回单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('34', '037', '淘宝专用(128码)', 'true', '1', '35', '10', '12', '117', '5000000011034', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('35', '038', '回单专用(128码)', 'true', '1', '360', '9', '12', '304', '5000000011035', '回单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('36', '039', '中心发车单(128码)', 'true', '1', '37', '10', '12', '117', '5000000011036', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('37', '040', '内件信封(128码)', 'true', '1', '41', '10', '12', '117', '5000000011037', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('38', '041', '班车封口(128码)', 'true', '1', '39', '10', '12', '117', '5000000011038', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('39', '042', '内件', 'true', '1', 'HTKY', '9', '13', '117', '5000000011039', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('40', '043', '广东回单2', 'true', '1', 'GDHD', '9', '13', '304', '5000000011040', '回单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('41', '045', '物料发放面单', 'true', '13', 'HTWL', '9', '13', '117', '5000000011041', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('42', '044', '北京代收货款', 'true', '1', 'K8', '11', '13', '144', '5000000011042', '代收货款', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('43', '047', '分拨包签', 'true', '1', '42', '10', '12', '8500', '5000000011043', '大包单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('44', '639', '供应链回单专用(主单)', 'true', '1', '639', '9', '12', '117', '5000000011044', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('45', '050', '电子面单(50)', 'true', '1', '50', '12', '14', '117', '5000000031251', '普通', 'true');
INSERT INTO `tbl_bill_code_definition` VALUES ('46', '060', '特大包', 'true', '1', '43', '10', '12', '8500', '5000000011046', '大包单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('47', '369', '供应链回单专用(返单)', 'true', '1', '369', '9', '12', '304', '5000000011047', '回单', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('48', '649', '供应链专用面单', 'true', '1', '649', '9', '12', '117', '5000000011048', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('49', '116', '时效测试件', 'true', '1', '16', '10', '12', '117', '5000000016701', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('50', '666', '优洗封签', 'true', '1', '66', '10', '12', '117', '5000000016877', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('51', '051', '电子面单(51)', 'true', null, '51', '12', '14', '117', '5000000011049', '普通', 'true');
INSERT INTO `tbl_bill_code_definition` VALUES ('52', '067', 'TEST', 'true', null, 'TEST', '9', '13', '117', '5000000011050', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('53', '063', '回单专用(主单)', 'true', '1', '630', '9', '12', '117', '5000000011051', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('54', '066', 'ECBOSS面单', 'false', null, '51', '12', '14', '117', '5000000011053', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('55', '070', '菜鸟电子面单', 'true', '1', '7', '13', '14', '117', '5000000011054', '普通', 'true');
INSERT INTO `tbl_bill_code_definition` VALUES ('56', '080', '电子面单(56)', 'true', '1', '56', '14', '16', '117', '5000000036256', '普通', 'true');
INSERT INTO `tbl_bill_code_definition` VALUES ('57', '078', '电子面单（58）', 'true', '1', '58', '14', '16', '117', '5000000026057', '普通', 'true');
INSERT INTO `tbl_bill_code_definition` VALUES ('58', '077', '京东电子面单', 'true', '1', '6', '13', '14', '117', '5000000024052', '普通', 'true');
INSERT INTO `tbl_bill_code_definition` VALUES ('59', '073', '封箱条码', 'true', '1', '11', '10', '12', '117', '5000000017526', '普通', 'false');
INSERT INTO `tbl_bill_code_definition` VALUES ('60', '', null, 'false', null, null, '0', '0', null, null, null, 'false');

-- ----------------------------
-- Table structure for tbl_param_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_param_config`;
CREATE TABLE `tbl_param_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键<seq>',
  `keyy` varchar(200) DEFAULT NULL COMMENT '关键字',
  `value` varchar(200) DEFAULT NULL COMMENT '值',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `T_PARAM_CONFIG_INDEX1` (`keyy`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of tbl_param_config
-- ----------------------------
INSERT INTO `tbl_param_config` VALUES ('3', 'lineno', '1', '线号');
INSERT INTO `tbl_param_config` VALUES ('4', 'pipeline', '030050-002', '分拣线编码');
INSERT INTO `tbl_param_config` VALUES ('5', 'exceptionChute', '195,260', '异常口');

-- ----------------------------
-- Table structure for tbl_plc_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_plc_config`;
CREATE TABLE `tbl_plc_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键<seq>',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP',
  `port` int(11) DEFAULT NULL COMMENT '端口',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `type` varchar(20) DEFAULT NULL COMMENT '类型',
  `type_name` varchar(200) DEFAULT NULL COMMENT '类型名称',
  `is_used` varchar(20) DEFAULT NULL COMMENT '是否启用',
  `save_datetime` datetime DEFAULT NULL COMMENT '保存时间',
  `save_user` varchar(50) DEFAULT NULL COMMENT '修改人员',
  PRIMARY KEY (`id`),
  KEY `T_PLC_CONFIG_INDEX1` (`ip`) USING BTREE,
  KEY `T_PLC_CONFIG_INDEX2` (`port`) USING BTREE,
  KEY `T_PLC_CONFIG_INDEX3` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='PLC信息配置表';

-- ----------------------------
-- Records of tbl_plc_config
-- ----------------------------
INSERT INTO `tbl_plc_config` VALUES ('1', '192.168.17.77', '8501', '', '', '1', '暴力分拣', '1', '2018-07-20 08:41:17', '张三');
INSERT INTO `tbl_plc_config` VALUES ('2', '192.168.17.77', '8501', null, null, '2', '人工补码', '1', '2018-07-22 01:54:18', '张三');

-- ----------------------------
-- Table structure for tbl_port_sync
-- ----------------------------
DROP TABLE IF EXISTS `tbl_port_sync`;
CREATE TABLE `tbl_port_sync` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `belongSiteName` varchar(100) DEFAULT NULL COMMENT '所属分拨',
  `pipeline` varchar(20) DEFAULT NULL COMMENT '流水线号',
  `destSiteName` varchar(100) DEFAULT NULL COMMENT '目的站点',
  `destSiteCode` varchar(20) DEFAULT NULL COMMENT '目的站点编码',
  `destSortingCode` varchar(20) DEFAULT NULL COMMENT '站点分拣编码',
  `sortPortCode` varchar(20) DEFAULT NULL COMMENT '分拣口编号',
  `sortMode` varchar(20) DEFAULT NULL COMMENT '分拣模式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8 COMMENT='端口同步配置表';

-- ----------------------------
-- Records of tbl_port_sync
-- ----------------------------
INSERT INTO `tbl_port_sync` VALUES ('1', '太原转运中心', '030050-002', '太原人民路分部', '030085', 'A28', '030050-002145', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('2', '太原转运中心', '030050-002', '太原小店镇分部', '030086', 'A29', '030050-002144', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('3', '太原转运中心', '030050-002', '太原大学分部', '030083', 'A32', '030050-002143', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('4', '太原转运中心', '030050-002', '太原科大分部', '030093', 'A33', '030050-002139', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('5', '太原转运中心', '030050-002', '太原万柏林区四部', '030148', 'A42', '030050-002116', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('6', '太原转运中心', '030050-002', '清徐县', '030400', 'A38', '030050-002127', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('7', '太原转运中心', '030050-002', '清徐徐沟镇', '030401', 'A39', '030050-002126', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('8', '太原转运中心', '030050-002', '古交市', '030200', 'A40', '030050-002125', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('9', '太原转运中心', '030050-002', '娄烦县', '030300', 'A41', '030050-002124', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('10', '太原转运中心', '030050-002', '太钢路分部', '030005', 'A08', '030050-002131', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('11', '太原转运中心', '030050-002', '太原尖草坪一部', '030054', 'A06', '030050-002135', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('12', '太原转运中心', '030050-002', '太原中北大学分部', '030035', 'A05', '030050-002129', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('13', '太原转运中心', '030050-002', '长风西街分部', '030023', 'A02', '030050-002133', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('14', '太原转运中心', '030050-002', '西山分部', '030030', 'A03', '030050-002130', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('15', '太原转运中心', '030050-002', '山西高新区分部', '030021', 'A21', '030050-002154', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('16', '太原转运中心', '030050-002', '太原经济技术开发区分部', '030039', 'A19', '030050-002155', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('17', '太原转运中心', '030050-002', '学府街分部', '030028', 'A22', '030050-002150', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('18', '太原转运中心', '030050-002', '太原机场分部', '030031', 'A17', '030050-002147', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('19', '太原转运中心', '030050-002', '太原建设南路分部', '030037', 'A18', '030050-002146', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('20', '太原转运中心', '030050-002', '太原府西分部', '030112', 'A23', '030050-002152', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('21', '太原转运中心', '030050-002', '五一路分部', '030011', 'A25', '030050-002148', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('22', '太原转运中心', '030050-002', '桃园北路分部', '030040', 'A24', '030050-002153', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('23', '太原转运中心', '030050-002', '太原北城分部', '030026', 'A10', '030050-002149', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('24', '太原转运中心', '030050-002', '太原建设北路分部', '030036', 'A09', '030050-002132', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('25', '太原转运中心', '030050-002', '新建南路分部', '030013', 'A14', '030050-002151', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('26', '太原转运中心', '030050-002', '太原晋源', '030055', 'A01', '030050-002134', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('27', '太原转运中心', '030050-002', '忻州忻府区一部', '034018', 'H13', '030050-002160', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('28', '太原转运中心', '030050-002', '忻州忻府区三部', '034020', 'H15', '030050-002158', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('29', '太原转运中心', '030050-002', '乡宁县', '042100', 'L20', '030050-002069', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('30', '太原转运中心', '030050-002', '翼城', '041009', 'L21', '030050-002068', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('31', '太原转运中心', '030050-002', '霍州', '031400', 'L22', '030050-002067', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('32', '太原转运中心', '030050-002', '襄汾县', '041010', 'L23', '030050-002066', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('33', '太原转运中心', '030050-002', '洪洞县', '041600', 'L24', '030050-002065', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('34', '太原转运中心', '030050-002', '临汾浮山县分部', '042600', 'L25', '030050-002064', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('35', '太原转运中心', '030050-002', '汾西县', '030141', 'L26', '030050-002062', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('36', '太原转运中心', '030050-002', '曲沃县', '043400', 'L27', '030050-002063', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('37', '太原转运中心', '030050-002', '侯马', '043000', 'V28', '030050-002061', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('38', '太原转运中心', '030050-002', '运城新绛县', '044002', 'M30', '030050-002221', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('39', '太原转运中心', '030050-002', '运城新绛县', '044002', 'M30', '030050-002181', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('40', '太原转运中心', '030050-002', '运城闻喜县', '044037', 'M01', '030050-002241', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('41', '太原转运中心', '030050-002', '运城闻喜县', '044037', 'M01', '030050-002201', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('42', '太原转运中心', '030050-002', '运城永济市', '044031', 'M02', '030050-002239', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('43', '太原转运中心', '030050-002', '运城永济市', '044031', 'M02', '030050-002199', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('44', '太原转运中心', '030050-002', '运城绛县', '044035', 'M03', '030050-002240', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('45', '太原转运中心', '030050-002', '运城绛县', '044035', 'M03', '030050-002200', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('46', '太原转运中心', '030050-002', '运城垣曲县', '044029', 'M04', '030050-002238', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('47', '太原转运中心', '030050-002', '运城垣曲县', '044029', 'M04', '030050-002198', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('48', '太原转运中心', '030050-002', '运城平陆县', '044032', 'M06', '030050-002236', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('49', '太原转运中心', '030050-002', '运城平陆县', '044032', 'M06', '030050-002196', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('50', '太原转运中心', '030050-002', '末端异常站点', '66666699', '99', '030050-002195', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('51', '太原转运中心', '030050-002', '运城万荣县', '044034', 'M05', '030050-002237', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('52', '太原转运中心', '030050-002', '运城万荣县', '044034', 'M05', '030050-002197', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('53', '太原转运中心', '030050-002', '运城稷山县', '044038', 'M07', '030050-002235', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('54', '太原转运中心', '030050-002', '运城河津市', '044036', 'M08', '030050-002234', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('55', '太原转运中心', '030050-002', '运城河津市', '044036', 'M08', '030050-002194', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('56', '太原转运中心', '030050-002', '运城夏县', '044030', 'M09', '030050-002233', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('57', '太原转运中心', '030050-002', '运城夏县', '044030', 'M09', '030050-002193', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('58', '太原转运中心', '030050-002', '运城临猗县', '044033', 'M10', '030050-002232', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('59', '太原转运中心', '030050-002', '运城临猗县', '044033', 'M10', '030050-002192', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('60', '太原转运中心', '030050-002', '运城芮城县', '044028', 'M11', '030050-002231', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('61', '太原转运中心', '030050-002', '运城芮城县', '044028', 'M11', '030050-002191', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('62', '太原转运中心', '030050-002', '芮城风陵渡镇', '044027', 'M12', '030050-002230', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('63', '太原转运中心', '030050-002', '芮城风陵渡镇', '044027', 'M12', '030050-002190', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('64', '太原转运中心', '030050-002', '运城解州镇', '044023', 'M13', '030050-002229', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('65', '太原转运中心', '030050-002', '运城解州镇', '044023', 'M13', '030050-002189', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('66', '太原转运中心', '030050-002', '运城空港分部', '044005', 'M14', '030050-002228', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('67', '太原转运中心', '030050-002', '运城空港分部', '044005', 'M14', '030050-002188', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('68', '太原转运中心', '030050-002', '运城南风分部', '044020', 'M15', '030050-002227', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('69', '太原转运中心', '030050-002', '运城南风分部', '044020', 'M15', '030050-002187', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('70', '太原转运中心', '030050-002', '运城中城分部', '044007', 'M16', '030050-002226', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('71', '太原转运中心', '030050-002', '运城中城分部', '044007', 'M16', '030050-002186', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('72', '太原转运中心', '030050-002', '运城禹都分部', '044026', 'M17', '030050-002225', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('73', '太原转运中心', '030050-002', '运城禹都分部', '044026', 'M17', '030050-002185', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('74', '太原转运中心', '030050-002', '运城北城分部', '044004', 'M18', '030050-002224', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('75', '太原转运中心', '030050-002', '运城北城分部', '044004', 'M18', '030050-002184', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('76', '太原转运中心', '030050-002', '沁县', '046400', 'Q01', '030050-002243', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('77', '太原转运中心', '030050-002', '沁县', '046400', 'Q01', '030050-002203', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('78', '太原转运中心', '030050-002', '武乡县', '046300', 'W01', '030050-002242', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('79', '太原转运中心', '030050-002', '武乡县', '046300', 'W01', '030050-002202', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('80', '太原转运中心', '030050-002', '运城锦绣分部', '044039', 'M19', '030050-002223', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('81', '太原转运中心', '030050-002', '运城锦绣分部', '044039', 'M19', '030050-002183', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('82', '太原转运中心', '030050-002', '运城西城分部', '044006', 'M20', '030050-002222', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('83', '太原转运中心', '030050-002', '运城西城分部', '044006', 'M20', '030050-002182', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('84', '太原转运中心', '030050-002', '漪汾街分部', '030025', 'A07', '030050-002119', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('85', '太原转运中心', '030050-002', '太原财大南校分部', '030091', 'A30', '030050-002142', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('86', '太原转运中心', '030050-002', '阳曲', '030102', 'A26', '030050-002140', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('87', '太原转运中心', '030050-002', '太原市聚宝盆分部', '030094', 'A35', '030050-002138', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('88', '太原转运中心', '030050-002', '太原北格镇分部', '030068', 'A27', '030050-002141', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('89', '太原转运中心', '030050-002', '太原朝阳分部', '030095', 'A36', '030050-002137', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('90', '太原转运中心', '030050-002', '太原义井分部', '030096', 'A37', '030050-002136', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('91', '太原转运中心', '030050-002', '忻州', '034000', 'H16', '030050-002156', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('92', '太原转运中心', '030050-002', '太原迎泽区二部', '030147', 'A46', '030050-002118', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('93', '太原转运中心', '030050-002', '太原山大分部', '030081', 'A20', '030050-002128', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('94', '太原转运中心', '030050-002', '太原南中环分部', '030084', 'A31', '030050-002121', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('95', '太原转运中心', '030050-002', '晋城泽州路分部', '048003', 'E06', '030050-002037', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('96', '太原转运中心', '030050-002', '晋城北石店镇', '048006', 'E07', '030050-002036', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('97', '太原转运中心', '030050-002', '阳城县', '048100', 'E08', '030050-002035', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('98', '太原转运中心', '030050-002', '晋城北留镇分部', '048101', 'E09', '030050-002034', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('99', '太原转运中心', '030050-002', '阳城八甲口镇', '048102', 'E10', '030050-002033', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('100', '太原转运中心', '030050-002', '高平市', '048400', 'E11', '030050-002032', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('101', '太原转运中心', '030050-002', '沁水县', '048200', 'E12', '030050-002031', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('102', '太原转运中心', '030050-002', '晋城端氏镇', '048203', 'E13', '030050-002030', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('103', '太原转运中心', '030050-002', '陵川县', '048001', 'E14', '030050-002029', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('104', '太原转运中心', '030050-002', '晋城下村镇分部', '048013', 'E15', '030050-002028', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('105', '太原转运中心', '030050-002', '晋城周村镇分部', '048014', 'E16', '030050-002027', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('106', '太原转运中心', '030050-002', '泽州巴公镇', '048017', 'E17', '030050-002026', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('107', '太原转运中心', '030050-002', '山阴县', '036900', 'F01', '030050-002112', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('108', '太原转运中心', '030050-002', '朔州城区二部', '036013', 'F02', '030050-002111', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('109', '太原转运中心', '030050-002', '应县', '037600', 'F03', '030050-002110', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('110', '太原转运中心', '030050-002', '朔州城区四部', '036015', 'F04', '030050-002109', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('111', '太原转运中心', '030050-002', '朔州城区七部', '036018', 'F05', '030050-002108', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('112', '太原转运中心', '030050-002', '朔州城区一部', '036012', 'F06', '030050-002107', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('113', '太原转运中心', '030050-002', '朔州城区六部', '036017', 'F07', '030050-002106', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('114', '太原转运中心', '030050-002', '朔州城区五部', '036016', 'F08', '030050-002105', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('115', '太原转运中心', '030050-002', '朔州城区三部', '036014', 'F09', '030050-002104', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('116', '太原转运中心', '030050-002', '朔州平鲁区一部', '036019', 'F10', '030050-002103', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('117', '太原转运中心', '030050-002', '朔州', '036000', 'F11', '030050-002102', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('118', '太原转运中心', '030050-002', '宁武县', '036701', 'F12', '030050-002173', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('119', '太原转运中心', '030050-002', '神池县', '036100', 'F13', '030050-002172', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('120', '太原转运中心', '030050-002', '定襄县', '035400', 'H02', '030050-002171', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('121', '太原转运中心', '030050-002', '代县', '034001', 'H03', '030050-002170', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('122', '太原转运中心', '030050-002', '繁峙', '034002', 'H04', '030050-002169', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('123', '太原转运中心', '030050-002', '岢岚县', '036301', 'H05', '030050-002168', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('124', '太原转运中心', '030050-002', '静乐县', '035100', 'H06', '030050-002167', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('125', '太原转运中心', '030050-002', '河曲县', '036500', 'H07', '030050-002166', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('126', '太原转运中心', '030050-002', '保德县', '030143', 'H08', '030050-002165', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('127', '太原转运中心', '030050-002', '偏关县', '036400', 'H09', '030050-002164', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('128', '太原转运中心', '030050-002', '五寨县', '036200', 'H10', '030050-002163', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('129', '太原转运中心', '030050-002', '五台县', '034003', 'H11', '030050-002162', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('130', '太原转运中心', '030050-002', '山西原平市', '030027', 'H12', '030050-002161', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('131', '太原转运中心', '030050-002', '临县', '033400', 'J01', '030050-002101', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('132', '太原转运中心', '030050-002', '汾阳', '032200', 'J02', '030050-002100', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('133', '太原转运中心', '030050-002', '交城', '033500', 'J03', '030050-002099', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('134', '太原转运中心', '030050-002', '柳林', '033300', 'J04', '030050-002098', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('135', '太原转运中心', '030050-002', '太原尖草坪区二部', '030097', 'A04', '030050-002123', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('136', '太原转运中心', '030050-002', '太原尖草坪区三部', '030098', 'A45', '030050-002122', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('137', '太原转运中心', '030050-002', '石楼县', '032501', 'J05', '030050-002097', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('138', '太原转运中心', '030050-002', '方山县', '030139', 'J06', '030050-002096', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('139', '太原转运中心', '030050-002', '中阳县', '038303', 'J07', '030050-002095', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('140', '太原转运中心', '030050-002', '兴县', '030145', 'J08', '030050-002094', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('141', '太原转运中心', '030050-002', '孝义', '032300', 'J09', '030050-002093', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('142', '太原转运中心', '030050-002', '文水', '032100', 'J10', '030050-002092', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('143', '太原转运中心', '030050-002', '吕梁离石区', '033000', 'J11', '030050-002091', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('144', '太原转运中心', '030050-002', '岚县', '035200', 'J12', '030050-002090', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('145', '太原转运中心', '030050-002', '交口县', '032400', 'J13', '030050-002089', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('146', '太原转运中心', '030050-002', '灵石', '031300', 'K10', '030050-002060', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('147', '太原转运中心', '030050-002', '祁县', '030900', 'K11', '030050-002059', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('148', '太原转运中心', '030050-002', '介休', '031200', 'K12', '030050-002058', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('149', '太原转运中心', '030050-002', '平遥', '031100', 'K13', '030050-002057', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('150', '太原转运中心', '030050-002', '左权', '032600', 'K14', '030050-002056', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('151', '太原转运中心', '030050-002', '榆社县', '140721', 'K15', '030050-002055', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('152', '太原转运中心', '030050-002', '太谷', '030800', 'K16', '030050-002054', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('153', '太原转运中心', '030050-002', '晋中寿阳', '032500', 'K17', '030050-002053', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('154', '太原转运中心', '030050-002', '晋中城南分部', '030617', 'K01', '030050-002052', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('155', '太原转运中心', '030050-002', '晋中北城分部', '030612', 'K02', '030050-002047', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('156', '太原转运中心', '030050-002', '晋中经济开发区分部', '030616', 'K03', '030050-002051', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('157', '太原转运中心', '030050-002', '晋中高新区分部', '030614', 'K04', '030050-002046', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('158', '太原转运中心', '030050-002', '晋中城东分部', '030618', 'K05', '030050-002050', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('159', '太原转运中心', '030050-002', '晋中迎安分部', '030613', 'K06', '030050-002045', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('160', '太原转运中心', '030050-002', '晋中西城分部', '030615', 'K07', '030050-002049', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('161', '太原转运中心', '030050-002', '晋中', '038300', 'K08', '030050-002044', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('162', '太原转运中心', '030050-002', '和顺县', '032700', 'K09', '030050-002048', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('163', '太原转运中心', '030050-002', '临汾东城分部', '041004', 'L01', '030050-002088', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('164', '太原转运中心', '030050-002', '临汾市南外环分部', '041022', 'L02', '030050-002087', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('165', '太原转运中心', '030050-002', '临汾北城分部', '041002', 'L03', '030050-002086', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('166', '太原转运中心', '030050-002', '临汾福利巷分部', '041016', 'L04', '030050-002085', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('167', '太原转运中心', '030050-002', '临汾世纪百悦分部', '041012', 'L05', '030050-002084', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('168', '太原转运中心', '030050-002', '临汾市迎春南街分部', '041021', 'L06', '030050-002083', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('169', '太原转运中心', '030050-002', '临汾向阳路分部', '041018', 'L07', '030050-002082', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('170', '太原转运中心', '030050-002', '临汾市鼓楼分部', '041023', 'L08', '030050-002081', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('171', '太原转运中心', '030050-002', '临汾广场分部', '041001', 'L09', '030050-002080', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('172', '太原转运中心', '030050-002', '临汾师范大学分部', '041013', 'L10', '030050-002079', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('173', '太原转运中心', '030050-002', '临汾尧庙分部', '041003', 'L11', '030050-002078', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('174', '太原转运中心', '030050-002', '临汾河西分部', '042400', 'L12', '030050-002077', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('175', '太原转运中心', '030050-002', '大同棚户区分部', '037027', 'B02', '030050-002024', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('176', '太原转运中心', '030050-002', '大同矿务局分部', '037026', 'B01', '030050-002025', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('177', '太原转运中心', '030050-002', '大同文瀛湖分部', '037029', 'B03', '030050-002023', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('178', '太原转运中心', '030050-002', '大同御东分部', '037034', 'B04', '030050-002022', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('179', '太原转运中心', '030050-002', '大同东关分部', '037015', 'B05', '030050-002021', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('180', '太原转运中心', '030050-002', '大同口泉分部', '037028', 'B06', '030050-002020', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('181', '太原转运中心', '030050-002', '大同金牛分部', '037023', 'B07', '030050-002019', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('182', '太原转运中心', '030050-002', '大同北城分部', '037012', 'B09', '030050-002018', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('183', '太原转运中心', '030050-002', '大同花园里分部', '037032', 'B10', '030050-002017', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('184', '太原转运中心', '030050-002', '大同新华街分部', '037019', 'B11', '030050-002016', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('185', '太原转运中心', '030050-002', '大同迎宾西路分部', '037030', 'B12', '030050-002015', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('186', '太原转运中心', '030050-002', '大同向阳街分部', '037031', 'B13', '030050-002014', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('187', '太原转运中心', '030050-002', '大同振华街分部', '037018', 'B15', '030050-002013', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('188', '太原转运中心', '030050-002', '大同云冈路分部', '037009', 'B17', '030050-002012', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('189', '太原转运中心', '030050-002', '大同振兴街分部', '037022', 'B18', '030050-002011', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('190', '太原转运中心', '030050-002', '大同西花园分部', '037035', 'B19', '030050-002010', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('191', '太原转运中心', '030050-002', '大同南城分部', '037033', 'B20', '030050-002009', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('192', '太原转运中心', '030050-002', '浑源', '037400', 'B22', '030050-002008', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('193', '太原转运中心', '030050-002', '灵丘', '034400', 'B23', '030050-002007', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('194', '太原转运中心', '030050-002', '广灵县', '037501', 'B24', '030050-002006', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('195', '太原转运中心', '030050-002', '大同县', '037300', 'B25', '030050-002005', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('196', '太原转运中心', '030050-002', '阳高县', '038101', 'B26', '030050-002004', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('197', '太原转运中心', '030050-002', '天镇县', '037010', 'B27', '030050-002003', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('198', '太原转运中心', '030050-002', '左云县', '037100', 'B28', '030050-002002', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('199', '太原转运中心', '030050-002', '右玉县', '037200', 'B29', '030050-002114', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('200', '太原转运中心', '030050-002', '大同新荣区', '037013', 'B30', '030050-002001', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('201', '太原转运中心', '030050-002', '怀仁县', '038304', 'B31', '030050-002113', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('202', '太原转运中心', '030050-002', '阳泉市盂县', '045100', 'C01', '030050-002180', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('203', '太原转运中心', '030050-002', '平定县分部', '045002', 'C02', '030050-002179', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('204', '太原转运中心', '030050-002', '阳泉郊区新城分部', '045013', 'C03', '030050-002178', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('205', '太原转运中心', '030050-002', '阳泉城区分部', '045015', 'C04', '030050-002177', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('206', '太原转运中心', '030050-002', '阳泉桃北矿区分部', '045012', 'C05', '030050-002175', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('207', '太原转运中心', '030050-002', '阳泉天桥分部', '045016', 'C06', '030050-002176', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('208', '太原转运中心', '030050-002', '阳泉经济开发区分部', '045014', 'C07', '030050-002174', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('209', '太原转运中心', '030050-002', '昔阳县', '140724', 'K18', '030050-002043', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('210', '太原转运中心', '030050-002', '长治城南一部', '046025', 'D01', '030050-002260', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('211', '太原转运中心', '030050-002', '长治城南一部', '046025', 'D01', '030050-002220', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('212', '太原转运中心', '030050-002', '长治城南二部', '046028', 'D02', '030050-002259', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('213', '太原转运中心', '030050-002', '长治城南二部', '046028', 'D02', '030050-002219', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('214', '太原转运中心', '030050-002', '长治高新区分部', '046016', 'D03', '030050-002258', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('215', '太原转运中心', '030050-002', '长治高新区分部', '046016', 'D03', '030050-002218', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('216', '太原转运中心', '030050-002', '长治解放东街分部', '047602', 'D04', '030050-002257', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('217', '太原转运中心', '030050-002', '长治解放东街分部', '047602', 'D04', '030050-002217', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('218', '太原转运中心', '030050-002', '长治城中二部', '046029', 'D05', '030050-002256', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('219', '太原转运中心', '030050-002', '长治城中二部', '046029', 'D05', '030050-002216', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('220', '太原转运中心', '030050-002', '襄垣县', '046202', 'D06', '030050-002255', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('221', '太原转运中心', '030050-002', '襄垣县', '046202', 'D06', '030050-002215', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('222', '太原转运中心', '030050-002', '潞城市', '047501', 'D07', '030050-002254', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('223', '太原转运中心', '030050-002', '潞城市', '047501', 'D07', '030050-002214', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('224', '太原转运中心', '030050-002', '屯留县', '046102', 'D08', '030050-002253', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('225', '太原转运中心', '030050-002', '屯留县', '046102', 'D08', '030050-002213', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('226', '太原转运中心', '030050-002', '平顺', '047401', 'D09', '030050-002252', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('227', '太原转运中心', '030050-002', '平顺', '047401', 'D09', '030050-002212', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('228', '太原转运中心', '030050-002', '长治县', '046002', 'D10', '030050-002251', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('229', '太原转运中心', '030050-002', '长治县', '046002', 'D10', '030050-002211', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('230', '太原转运中心', '030050-002', '壶关县', '047300', 'D11', '030050-002250', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('231', '太原转运中心', '030050-002', '壶关县', '047300', 'D11', '030050-002210', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('232', '太原转运中心', '030050-002', '长子县', '046601', 'D12', '030050-002249', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('233', '太原转运中心', '030050-002', '长子县', '046601', 'D12', '030050-002209', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('234', '太原转运中心', '030050-002', '沁源县', '046500', 'D13', '030050-002248', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('235', '太原转运中心', '030050-002', '沁源县', '046500', 'D13', '030050-002208', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('236', '太原转运中心', '030050-002', '长治郊区一部', '046032', 'D14', '030050-002247', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('237', '太原转运中心', '030050-002', '长治郊区一部', '046032', 'D14', '030050-002207', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('238', '太原转运中心', '030050-002', '黎城县', '047600', 'D15', '030050-002246', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('239', '太原转运中心', '030050-002', '黎城县', '047600', 'D15', '030050-002206', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('240', '太原转运中心', '030050-002', '长治城北一部', '046027', 'D16', '030050-002245', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('241', '太原转运中心', '030050-002', '长治城北一部', '046027', 'D16', '030050-002205', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('242', '太原转运中心', '030050-002', '长治城北二部', '046030', 'D17', '030050-002244', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('243', '太原转运中心', '030050-002', '长治城北二部', '046030', 'D17', '030050-002204', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('244', '太原转运中心', '030050-002', '晋城古矿分部', '048005', 'E01', '030050-002042', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('245', '太原转运中心', '030050-002', '晋城新市街分部', '048007', 'E02', '030050-002041', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('246', '太原转运中心', '030050-002', '晋城黄花街分部', '048002', 'E03', '030050-002040', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('247', '太原转运中心', '030050-002', '晋城南村镇分部', '048015', 'E04', '030050-002039', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('248', '太原转运中心', '030050-002', '晋城开发区分部', '048004', 'E05', '030050-002038', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('249', '太原转运中心', '030050-002', '永和县', '041400', 'L13', '030050-002076', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('250', '太原转运中心', '030050-002', '大宁县', '042300', 'L14', '030050-002075', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('251', '太原转运中心', '030050-002', '临汾蒲县分部', '041008', 'L15', '030050-002074', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('252', '太原转运中心', '030050-002', '隰县', '041300', 'L16', '030050-002073', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('253', '太原转运中心', '030050-002', '安泽县', '041110', 'L17', '030050-002072', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('254', '太原转运中心', '030050-002', '吉县', '030142', 'L18', '030050-002071', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('255', '太原转运中心', '030050-002', '临汾市古县', '042401', 'L19', '030050-002070', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('256', '太原转运中心', '030050-002', '忻州忻府区四部', '034021', 'H01', '030050-002157', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('257', '太原转运中心', '030050-002', '太原小店区二部', '030149', 'A12', '030050-002115', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('258', '太原转运中心', '030050-002', '太原迎泽区一部', '030099', 'A11', '030050-002120', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('259', '太原转运中心', '030050-002', '忻州忻府区二部', '034019', 'H14', '030050-002159', 'sorting');
INSERT INTO `tbl_port_sync` VALUES ('260', '太原转运中心', '030050-002', '太原小店区一部', '030122', 'A13', '030050-002117', 'sorting');

-- ----------------------------
-- Table structure for tbl_scan_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_scan_detail`;
CREATE TABLE `tbl_scan_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键<seq>',
  `sort_id` varchar(20) NOT NULL COMMENT '唯一分拣id',
  `tray_code` varchar(20) DEFAULT NULL COMMENT '小车编号',
  `scan_datetime` datetime DEFAULT NULL COMMENT '扫描时间',
  `img_id` varchar(500) DEFAULT NULL COMMENT '图片ID',
  `barcode` varchar(255) DEFAULT NULL COMMENT '条码',
  `send_datetime` datetime DEFAULT NULL COMMENT '发送时间',
  `scan_no` varchar(20) DEFAULT NULL COMMENT '扫描仪编号',
  `scan_name` varchar(100) DEFAULT NULL COMMENT '扫描仪名称',
  `conn_detail_id` varchar(20) DEFAULT NULL COMMENT '通讯详情ID',
  `lchute` varchar(200) DEFAULT NULL COMMENT '逻辑格口',
  `weight` varchar(20) DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`),
  KEY `T_SCAN_DETAIL_INDEX1` (`scan_datetime`) USING BTREE,
  KEY `T_SCAN_DETAIL_INDEX2` (`barcode`) USING BTREE,
  KEY `T_SCAN_DETAIL_INDEX3` (`send_datetime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扫描详情表';

-- ----------------------------
-- Records of tbl_scan_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_vsc_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_vsc_detail`;
CREATE TABLE `tbl_vsc_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_id` varchar(32) NOT NULL COMMENT '分拣id',
  `barcode` varchar(50) NOT NULL COMMENT '条码',
  `img_url` varchar(255) NOT NULL COMMENT '图片路径',
  `begin_datetime` datetime NOT NULL COMMENT '开始时间',
  `end_datetime` datetime NOT NULL COMMENT '结束时间',
  `status` int(2) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='补码详情表';

-- ----------------------------
-- Records of tbl_vsc_detail
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_ydd_sealmail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ydd_sealmail`;
CREATE TABLE `tbl_ydd_sealmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动ID<seq>',
  `bagid` varchar(30) DEFAULT NULL COMMENT '清单ID',
  `barcode` varchar(30) DEFAULT NULL COMMENT '快件号码',
  `mailid` int(11) DEFAULT NULL COMMENT '快件ID',
  `lchute` varchar(32) DEFAULT NULL COMMENT '逻辑格口代码',
  `chute` varchar(32) DEFAULT NULL COMMENT '物理格口代码',
  `sorttime` datetime DEFAULT NULL COMMENT '落格时间',
  `inductionid` int(11) DEFAULT NULL COMMENT '供件台号',
  `weight` float DEFAULT NULL COMMENT '称重重量',
  `length` float DEFAULT NULL COMMENT '长度',
  `width` float DEFAULT NULL COMMENT '宽度',
  `height` float DEFAULT NULL COMMENT '高度',
  `volume` float DEFAULT NULL COMMENT '体积',
  `dropflag` varchar(10) DEFAULT NULL COMMENT '落格标志',
  `checkflag` varchar(10) DEFAULT NULL COMMENT '留盘检测确认标志',
  `succesydlag` varchar(10) DEFAULT NULL COMMENT '分拣成功与否标志',
  `overflowid` varchar(40) DEFAULT NULL COMMENT '异常原因代码',
  `devicecode` varchar(30) DEFAULT NULL COMMENT '设备编码',
  `printflag` varchar(10) DEFAULT NULL COMMENT '打印标志',
  `printtime` datetime DEFAULT NULL COMMENT '请封时间',
  `indtime` datetime DEFAULT NULL COMMENT '供件时间',
  `indmode` varchar(20) DEFAULT NULL COMMENT '供件模式',
  `obrid` varchar(10) DEFAULT NULL COMMENT 'OBR编号',
  `scantime` datetime DEFAULT NULL COMMENT '扫描时间',
  `trayid` int(11) DEFAULT NULL COMMENT '托盘号',
  `delflag` varchar(10) DEFAULT NULL COMMENT '删除标志',
  `ocrflag` int(11) DEFAULT NULL COMMENT 'ADM处理标志',
  `rejectflag` varchar(10) DEFAULT NULL COMMENT 'OBR拒识标志',
  `sendflag` varchar(10) DEFAULT NULL COMMENT '发送标志',
  `sendtime` datetime DEFAULT NULL COMMENT '数据上传时间',
  PRIMARY KEY (`id`),
  KEY `T_YDD_SEALMAIL_INDEX1` (`bagid`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX2` (`barcode`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX3` (`sorttime`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX4` (`overflowid`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX5` (`printtime`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX6` (`indtime`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX7` (`scantime`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX8` (`chute`,`dropflag`,`checkflag`,`succesydlag`,`printflag`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX9` (`chute`) USING BTREE,
  KEY `T_YDD_SEALMAIL_INDEX10` (`sendtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下件信息表';

-- ----------------------------
-- Records of tbl_ydd_sealmail
-- ----------------------------

-- ----------------------------
-- Procedure structure for delete_timeout_data
-- ----------------------------
DROP PROCEDURE IF EXISTS `delete_timeout_data`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_timeout_data`()
    COMMENT '定期清理超过31天的数据'
BEGIN
SET @time = NOW();
#
DELETE
FROM
	tbl_scan_detail
WHERE
	DATE(scan_datetime) <= DATE(
		DATE_SUB(@time, INTERVAL 7 DAY)
	);
#
DELETE
FROM
	tbl_ydd_sealmail
WHERE
	DATE(sorttime) <= DATE(
		DATE_SUB(@time, INTERVAL 7 DAY)
	);


END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for delete
-- ----------------------------
DROP EVENT IF EXISTS `delete`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `delete` ON SCHEDULE EVERY 1 HOUR STARTS '2018-07-25 17:14:07' ON COMPLETION NOT PRESERVE ENABLE DO CALL delete_timeout_data
;;
DELIMITER ;
