/*
Navicat MySQL Data Transfer

Source Server         : www
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : weijiaoyi

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-28 16:55:16
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `codepay_order`
-- ----------------------------
DROP TABLE IF EXISTS `codepay_order`;
CREATE TABLE `codepay_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pay_id` varchar(50) NOT NULL COMMENT '用户ID或订单ID',
  `money` decimal(6,2) unsigned NOT NULL COMMENT '实际金额',
  `price` decimal(6,2) unsigned NOT NULL COMMENT '原价',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '支付方式',
  `pay_no` varchar(100) NOT NULL COMMENT '流水号',
  `param` varchar(200) DEFAULT NULL COMMENT '自定义参数',
  `pay_time` bigint(11) NOT NULL DEFAULT '0' COMMENT '付款时间',
  `pay_tag` varchar(100) NOT NULL DEFAULT '0' COMMENT '金额的备注',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '订单状态',
  `creat_time` bigint(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `up_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `main` (`pay_id`,`pay_time`,`money`,`type`,`pay_tag`),
  UNIQUE KEY `pay_no` (`pay_no`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='用于区分是否已经处理';

-- ----------------------------
-- Records of codepay_order
-- ----------------------------
INSERT INTO codepay_order VALUES ('1', '10000014', '101.00', '101.00', '1', '2018030121001004210508493241', null, '1519869557', '0', '2', '1519870026', '2018-03-01 10:07:07');
INSERT INTO codepay_order VALUES ('2', '10000014', '101.00', '101.00', '1', '2018030121001004210508453330', null, '1519870445', '0', '2', '1519870452', '2018-03-01 10:14:13');
INSERT INTO codepay_order VALUES ('4', '命运', '100.00', '100.00', '1', '2018030121001004810293040212', null, '1519879174', '0', '2', '1519880428', '2018-03-01 13:00:29');
INSERT INTO codepay_order VALUES ('5', '命运', '50.00', '50.00', '1', '2018030121001004810292621051', null, '1519879475', '0', '2', '1519880428', '2018-03-01 13:00:29');
INSERT INTO codepay_order VALUES ('6', '命运', '100.00', '100.00', '1', '2018030121001004810292500876', null, '1519882063', '0', '2', '1519882073', '2018-03-01 13:27:54');
INSERT INTO codepay_order VALUES ('8', '10000015', '100.51', '100.51', '1', '2018030121001004810294890735', null, '1519895531', '0', '2', '1519895544', '2018-03-01 17:12:25');
INSERT INTO codepay_order VALUES ('11', '命运', '50.00', '50.00', '1', '2018030721001004810208716096', null, '1520388932', '0', '2', '1520388941', '2018-03-07 10:15:42');

-- ----------------------------
-- Table structure for `codepay_user`
-- ----------------------------
DROP TABLE IF EXISTS `codepay_user`;
CREATE TABLE `codepay_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user` varchar(100) NOT NULL DEFAULT '' COMMENT '用户名',
  `money` decimal(6,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `vip` int(1) NOT NULL DEFAULT '0' COMMENT '会员开通',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '会员状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of codepay_user
-- ----------------------------
INSERT INTO codepay_user VALUES ('1', 'admin', '0.00', '0', '0');

-- ----------------------------
-- Table structure for `wp_allot`
-- ----------------------------
DROP TABLE IF EXISTS `wp_allot`;
CREATE TABLE `wp_allot` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(18) NOT NULL,
  `order_id` mediumint(18) NOT NULL,
  `time` varchar(18) DEFAULT NULL,
  `my_fee` varchar(18) DEFAULT NULL COMMENT '变化的资金',
  `is_win` tinyint(1) DEFAULT NULL COMMENT '是否盈利1盈利2亏损3无效',
  `nowmoney` varchar(255) DEFAULT NULL COMMENT '此刻余额',
  `type` tinyint(1) DEFAULT '1' COMMENT '1红利结算2手续费结算',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=52443 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_allot
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_area`
-- ----------------------------
DROP TABLE IF EXISTS `wp_area`;
CREATE TABLE `wp_area` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) NOT NULL DEFAULT '0',
  `code` char(6) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=3513 DEFAULT CHARSET=utf8 COMMENT='地址表(省/市/县/区)';

-- ----------------------------
-- Records of wp_area
-- ----------------------------
INSERT INTO wp_area VALUES ('1', '0', '110000', '北京市');
INSERT INTO wp_area VALUES ('2', '1', '110100', '市辖区');
INSERT INTO wp_area VALUES ('3', '2', '110101', '东城区');
INSERT INTO wp_area VALUES ('4', '2', '110102', '西城区');
INSERT INTO wp_area VALUES ('5', '2', '110105', '朝阳区');
INSERT INTO wp_area VALUES ('6', '2', '110106', '丰台区');
INSERT INTO wp_area VALUES ('7', '2', '110107', '石景山区');
INSERT INTO wp_area VALUES ('8', '2', '110108', '海淀区');
INSERT INTO wp_area VALUES ('9', '2', '110109', '门头沟区');
INSERT INTO wp_area VALUES ('10', '2', '110111', '房山区');
INSERT INTO wp_area VALUES ('11', '2', '110112', '通州区');
INSERT INTO wp_area VALUES ('12', '2', '110113', '顺义区');
INSERT INTO wp_area VALUES ('13', '2', '110114', '昌平区');
INSERT INTO wp_area VALUES ('14', '2', '110115', '大兴区');
INSERT INTO wp_area VALUES ('15', '2', '110116', '怀柔区');
INSERT INTO wp_area VALUES ('16', '2', '110117', '平谷区');
INSERT INTO wp_area VALUES ('17', '1', '110200', '县');
INSERT INTO wp_area VALUES ('18', '17', '110228', '密云县');
INSERT INTO wp_area VALUES ('19', '17', '110229', '延庆县');
INSERT INTO wp_area VALUES ('20', '0', '120000', '天津市');
INSERT INTO wp_area VALUES ('21', '20', '120100', '市辖区');
INSERT INTO wp_area VALUES ('22', '21', '120101', '和平区');
INSERT INTO wp_area VALUES ('23', '21', '120102', '河东区');
INSERT INTO wp_area VALUES ('24', '21', '120103', '河西区');
INSERT INTO wp_area VALUES ('25', '21', '120104', '南开区');
INSERT INTO wp_area VALUES ('26', '21', '120105', '河北区');
INSERT INTO wp_area VALUES ('27', '21', '120106', '红桥区');
INSERT INTO wp_area VALUES ('28', '21', '120110', '东丽区');
INSERT INTO wp_area VALUES ('29', '21', '120111', '西青区');
INSERT INTO wp_area VALUES ('30', '21', '120112', '津南区');
INSERT INTO wp_area VALUES ('31', '21', '120113', '北辰区');
INSERT INTO wp_area VALUES ('32', '21', '120114', '武清区');
INSERT INTO wp_area VALUES ('33', '21', '120115', '宝坻区');
INSERT INTO wp_area VALUES ('34', '21', '120116', '滨海新区');
INSERT INTO wp_area VALUES ('35', '20', '120200', '县');
INSERT INTO wp_area VALUES ('36', '35', '120221', '宁河县');
INSERT INTO wp_area VALUES ('37', '35', '120223', '静海县');
INSERT INTO wp_area VALUES ('38', '35', '120225', '蓟县');
INSERT INTO wp_area VALUES ('39', '0', '130000', '河北省');
INSERT INTO wp_area VALUES ('40', '39', '130100', '石家庄市');
INSERT INTO wp_area VALUES ('41', '40', '130101', '市辖区');
INSERT INTO wp_area VALUES ('42', '40', '130102', '长安区');
INSERT INTO wp_area VALUES ('43', '40', '130104', '桥西区');
INSERT INTO wp_area VALUES ('44', '40', '130105', '新华区');
INSERT INTO wp_area VALUES ('45', '40', '130107', '井陉矿区');
INSERT INTO wp_area VALUES ('46', '40', '130108', '裕华区');
INSERT INTO wp_area VALUES ('47', '40', '130109', '藁城区');
INSERT INTO wp_area VALUES ('48', '40', '130110', '鹿泉区');
INSERT INTO wp_area VALUES ('49', '40', '130111', '栾城区');
INSERT INTO wp_area VALUES ('50', '40', '130121', '井陉县');
INSERT INTO wp_area VALUES ('51', '40', '130123', '正定县');
INSERT INTO wp_area VALUES ('52', '40', '130125', '行唐县');
INSERT INTO wp_area VALUES ('53', '40', '130126', '灵寿县');
INSERT INTO wp_area VALUES ('54', '40', '130127', '高邑县');
INSERT INTO wp_area VALUES ('55', '40', '130128', '深泽县');
INSERT INTO wp_area VALUES ('56', '40', '130129', '赞皇县');
INSERT INTO wp_area VALUES ('57', '40', '130130', '无极县');
INSERT INTO wp_area VALUES ('58', '40', '130131', '平山县');
INSERT INTO wp_area VALUES ('59', '40', '130132', '元氏县');
INSERT INTO wp_area VALUES ('60', '40', '130133', '赵县');
INSERT INTO wp_area VALUES ('61', '40', '130181', '辛集市');
INSERT INTO wp_area VALUES ('62', '40', '130183', '晋州市');
INSERT INTO wp_area VALUES ('63', '40', '130184', '新乐市');
INSERT INTO wp_area VALUES ('64', '39', '130200', '唐山市');
INSERT INTO wp_area VALUES ('65', '64', '130201', '市辖区');
INSERT INTO wp_area VALUES ('66', '64', '130202', '路南区');
INSERT INTO wp_area VALUES ('67', '64', '130203', '路北区');
INSERT INTO wp_area VALUES ('68', '64', '130204', '古冶区');
INSERT INTO wp_area VALUES ('69', '64', '130205', '开平区');
INSERT INTO wp_area VALUES ('70', '64', '130207', '丰南区');
INSERT INTO wp_area VALUES ('71', '64', '130208', '丰润区');
INSERT INTO wp_area VALUES ('72', '64', '130209', '曹妃甸区');
INSERT INTO wp_area VALUES ('73', '64', '130223', '滦县');
INSERT INTO wp_area VALUES ('74', '64', '130224', '滦南县');
INSERT INTO wp_area VALUES ('75', '64', '130225', '乐亭县');
INSERT INTO wp_area VALUES ('76', '64', '130227', '迁西县');
INSERT INTO wp_area VALUES ('77', '64', '130229', '玉田县');
INSERT INTO wp_area VALUES ('78', '64', '130281', '遵化市');
INSERT INTO wp_area VALUES ('79', '64', '130283', '迁安市');
INSERT INTO wp_area VALUES ('80', '39', '130300', '秦皇岛市');
INSERT INTO wp_area VALUES ('81', '80', '130301', '市辖区');
INSERT INTO wp_area VALUES ('82', '80', '130302', '海港区');
INSERT INTO wp_area VALUES ('83', '80', '130303', '山海关区');
INSERT INTO wp_area VALUES ('84', '80', '130304', '北戴河区');
INSERT INTO wp_area VALUES ('85', '80', '130321', '青龙满族自治县');
INSERT INTO wp_area VALUES ('86', '80', '130322', '昌黎县');
INSERT INTO wp_area VALUES ('87', '80', '130323', '抚宁县');
INSERT INTO wp_area VALUES ('88', '80', '130324', '卢龙县');
INSERT INTO wp_area VALUES ('89', '39', '130400', '邯郸市');
INSERT INTO wp_area VALUES ('90', '89', '130401', '市辖区');
INSERT INTO wp_area VALUES ('91', '89', '130402', '邯山区');
INSERT INTO wp_area VALUES ('92', '89', '130403', '丛台区');
INSERT INTO wp_area VALUES ('93', '89', '130404', '复兴区');
INSERT INTO wp_area VALUES ('94', '89', '130406', '峰峰矿区');
INSERT INTO wp_area VALUES ('95', '89', '130421', '邯郸县');
INSERT INTO wp_area VALUES ('96', '89', '130423', '临漳县');
INSERT INTO wp_area VALUES ('97', '89', '130424', '成安县');
INSERT INTO wp_area VALUES ('98', '89', '130425', '大名县');
INSERT INTO wp_area VALUES ('99', '89', '130426', '涉县');
INSERT INTO wp_area VALUES ('100', '89', '130427', '磁县');
INSERT INTO wp_area VALUES ('101', '89', '130428', '肥乡县');
INSERT INTO wp_area VALUES ('102', '89', '130429', '永年县');
INSERT INTO wp_area VALUES ('103', '89', '130430', '邱县');
INSERT INTO wp_area VALUES ('104', '89', '130431', '鸡泽县');
INSERT INTO wp_area VALUES ('105', '89', '130432', '广平县');
INSERT INTO wp_area VALUES ('106', '89', '130433', '馆陶县');
INSERT INTO wp_area VALUES ('107', '89', '130434', '魏县');
INSERT INTO wp_area VALUES ('108', '89', '130435', '曲周县');
INSERT INTO wp_area VALUES ('109', '89', '130481', '武安市');
INSERT INTO wp_area VALUES ('110', '39', '130500', '邢台市');
INSERT INTO wp_area VALUES ('111', '110', '130501', '市辖区');
INSERT INTO wp_area VALUES ('112', '110', '130502', '桥东区');
INSERT INTO wp_area VALUES ('113', '110', '130503', '桥西区');
INSERT INTO wp_area VALUES ('114', '110', '130521', '邢台县');
INSERT INTO wp_area VALUES ('115', '110', '130522', '临城县');
INSERT INTO wp_area VALUES ('116', '110', '130523', '内丘县');
INSERT INTO wp_area VALUES ('117', '110', '130524', '柏乡县');
INSERT INTO wp_area VALUES ('118', '110', '130525', '隆尧县');
INSERT INTO wp_area VALUES ('119', '110', '130526', '任县');
INSERT INTO wp_area VALUES ('120', '110', '130527', '南和县');
INSERT INTO wp_area VALUES ('121', '110', '130528', '宁晋县');
INSERT INTO wp_area VALUES ('122', '110', '130529', '巨鹿县');
INSERT INTO wp_area VALUES ('123', '110', '130530', '新河县');
INSERT INTO wp_area VALUES ('124', '110', '130531', '广宗县');
INSERT INTO wp_area VALUES ('125', '110', '130532', '平乡县');
INSERT INTO wp_area VALUES ('126', '110', '130533', '威县');
INSERT INTO wp_area VALUES ('127', '110', '130534', '清河县');
INSERT INTO wp_area VALUES ('128', '110', '130535', '临西县');
INSERT INTO wp_area VALUES ('129', '110', '130581', '南宫市');
INSERT INTO wp_area VALUES ('130', '110', '130582', '沙河市');
INSERT INTO wp_area VALUES ('131', '39', '130600', '保定市');
INSERT INTO wp_area VALUES ('132', '131', '130601', '市辖区');
INSERT INTO wp_area VALUES ('133', '131', '130602', '新市区');
INSERT INTO wp_area VALUES ('134', '131', '130603', '北市区');
INSERT INTO wp_area VALUES ('135', '131', '130604', '南市区');
INSERT INTO wp_area VALUES ('136', '131', '130621', '满城县');
INSERT INTO wp_area VALUES ('137', '131', '130622', '清苑县');
INSERT INTO wp_area VALUES ('138', '131', '130623', '涞水县');
INSERT INTO wp_area VALUES ('139', '131', '130624', '阜平县');
INSERT INTO wp_area VALUES ('140', '131', '130625', '徐水县');
INSERT INTO wp_area VALUES ('141', '131', '130626', '定兴县');
INSERT INTO wp_area VALUES ('142', '131', '130627', '唐县');
INSERT INTO wp_area VALUES ('143', '131', '130628', '高阳县');
INSERT INTO wp_area VALUES ('144', '131', '130629', '容城县');
INSERT INTO wp_area VALUES ('145', '131', '130630', '涞源县');
INSERT INTO wp_area VALUES ('146', '131', '130631', '望都县');
INSERT INTO wp_area VALUES ('147', '131', '130632', '安新县');
INSERT INTO wp_area VALUES ('148', '131', '130633', '易县');
INSERT INTO wp_area VALUES ('149', '131', '130634', '曲阳县');
INSERT INTO wp_area VALUES ('150', '131', '130635', '蠡县');
INSERT INTO wp_area VALUES ('151', '131', '130636', '顺平县');
INSERT INTO wp_area VALUES ('152', '131', '130637', '博野县');
INSERT INTO wp_area VALUES ('153', '131', '130638', '雄县');
INSERT INTO wp_area VALUES ('154', '131', '130681', '涿州市');
INSERT INTO wp_area VALUES ('155', '131', '130682', '定州市');
INSERT INTO wp_area VALUES ('156', '131', '130683', '安国市');
INSERT INTO wp_area VALUES ('157', '131', '130684', '高碑店市');
INSERT INTO wp_area VALUES ('158', '39', '130700', '张家口市');
INSERT INTO wp_area VALUES ('159', '158', '130701', '市辖区');
INSERT INTO wp_area VALUES ('160', '158', '130702', '桥东区');
INSERT INTO wp_area VALUES ('161', '158', '130703', '桥西区');
INSERT INTO wp_area VALUES ('162', '158', '130705', '宣化区');
INSERT INTO wp_area VALUES ('163', '158', '130706', '下花园区');
INSERT INTO wp_area VALUES ('164', '158', '130721', '宣化县');
INSERT INTO wp_area VALUES ('165', '158', '130722', '张北县');
INSERT INTO wp_area VALUES ('166', '158', '130723', '康保县');
INSERT INTO wp_area VALUES ('167', '158', '130724', '沽源县');
INSERT INTO wp_area VALUES ('168', '158', '130725', '尚义县');
INSERT INTO wp_area VALUES ('169', '158', '130726', '蔚县');
INSERT INTO wp_area VALUES ('170', '158', '130727', '阳原县');
INSERT INTO wp_area VALUES ('171', '158', '130728', '怀安县');
INSERT INTO wp_area VALUES ('172', '158', '130729', '万全县');
INSERT INTO wp_area VALUES ('173', '158', '130730', '怀来县');
INSERT INTO wp_area VALUES ('174', '158', '130731', '涿鹿县');
INSERT INTO wp_area VALUES ('175', '158', '130732', '赤城县');
INSERT INTO wp_area VALUES ('176', '158', '130733', '崇礼县');
INSERT INTO wp_area VALUES ('177', '39', '130800', '承德市');
INSERT INTO wp_area VALUES ('178', '177', '130801', '市辖区');
INSERT INTO wp_area VALUES ('179', '177', '130802', '双桥区');
INSERT INTO wp_area VALUES ('180', '177', '130803', '双滦区');
INSERT INTO wp_area VALUES ('181', '177', '130804', '鹰手营子矿区');
INSERT INTO wp_area VALUES ('182', '177', '130821', '承德县');
INSERT INTO wp_area VALUES ('183', '177', '130822', '兴隆县');
INSERT INTO wp_area VALUES ('184', '177', '130823', '平泉县');
INSERT INTO wp_area VALUES ('185', '177', '130824', '滦平县');
INSERT INTO wp_area VALUES ('186', '177', '130825', '隆化县');
INSERT INTO wp_area VALUES ('187', '177', '130826', '丰宁满族自治县');
INSERT INTO wp_area VALUES ('188', '177', '130827', '宽城满族自治县');
INSERT INTO wp_area VALUES ('189', '177', '130828', '围场满族蒙古族自治县');
INSERT INTO wp_area VALUES ('190', '39', '130900', '沧州市');
INSERT INTO wp_area VALUES ('191', '190', '130901', '市辖区');
INSERT INTO wp_area VALUES ('192', '190', '130902', '新华区');
INSERT INTO wp_area VALUES ('193', '190', '130903', '运河区');
INSERT INTO wp_area VALUES ('194', '190', '130921', '沧县');
INSERT INTO wp_area VALUES ('195', '190', '130922', '青县');
INSERT INTO wp_area VALUES ('196', '190', '130923', '东光县');
INSERT INTO wp_area VALUES ('197', '190', '130924', '海兴县');
INSERT INTO wp_area VALUES ('198', '190', '130925', '盐山县');
INSERT INTO wp_area VALUES ('199', '190', '130926', '肃宁县');
INSERT INTO wp_area VALUES ('200', '190', '130927', '南皮县');
INSERT INTO wp_area VALUES ('201', '190', '130928', '吴桥县');
INSERT INTO wp_area VALUES ('202', '190', '130929', '献县');
INSERT INTO wp_area VALUES ('203', '190', '130930', '孟村回族自治县');
INSERT INTO wp_area VALUES ('204', '190', '130981', '泊头市');
INSERT INTO wp_area VALUES ('205', '190', '130982', '任丘市');
INSERT INTO wp_area VALUES ('206', '190', '130983', '黄骅市');
INSERT INTO wp_area VALUES ('207', '190', '130984', '河间市');
INSERT INTO wp_area VALUES ('208', '39', '131000', '廊坊市');
INSERT INTO wp_area VALUES ('209', '208', '131001', '市辖区');
INSERT INTO wp_area VALUES ('210', '208', '131002', '安次区');
INSERT INTO wp_area VALUES ('211', '208', '131003', '广阳区');
INSERT INTO wp_area VALUES ('212', '208', '131022', '固安县');
INSERT INTO wp_area VALUES ('213', '208', '131023', '永清县');
INSERT INTO wp_area VALUES ('214', '208', '131024', '香河县');
INSERT INTO wp_area VALUES ('215', '208', '131025', '大城县');
INSERT INTO wp_area VALUES ('216', '208', '131026', '文安县');
INSERT INTO wp_area VALUES ('217', '208', '131028', '大厂回族自治县');
INSERT INTO wp_area VALUES ('218', '208', '131081', '霸州市');
INSERT INTO wp_area VALUES ('219', '208', '131082', '三河市');
INSERT INTO wp_area VALUES ('220', '39', '131100', '衡水市');
INSERT INTO wp_area VALUES ('221', '220', '131101', '市辖区');
INSERT INTO wp_area VALUES ('222', '220', '131102', '桃城区');
INSERT INTO wp_area VALUES ('223', '220', '131121', '枣强县');
INSERT INTO wp_area VALUES ('224', '220', '131122', '武邑县');
INSERT INTO wp_area VALUES ('225', '220', '131123', '武强县');
INSERT INTO wp_area VALUES ('226', '220', '131124', '饶阳县');
INSERT INTO wp_area VALUES ('227', '220', '131125', '安平县');
INSERT INTO wp_area VALUES ('228', '220', '131126', '故城县');
INSERT INTO wp_area VALUES ('229', '220', '131127', '景县');
INSERT INTO wp_area VALUES ('230', '220', '131128', '阜城县');
INSERT INTO wp_area VALUES ('231', '220', '131181', '冀州市');
INSERT INTO wp_area VALUES ('232', '220', '131182', '深州市');
INSERT INTO wp_area VALUES ('233', '0', '140000', '山西省');
INSERT INTO wp_area VALUES ('234', '233', '140100', '太原市');
INSERT INTO wp_area VALUES ('235', '234', '140101', '市辖区');
INSERT INTO wp_area VALUES ('236', '234', '140105', '小店区');
INSERT INTO wp_area VALUES ('237', '234', '140106', '迎泽区');
INSERT INTO wp_area VALUES ('238', '234', '140107', '杏花岭区');
INSERT INTO wp_area VALUES ('239', '234', '140108', '尖草坪区');
INSERT INTO wp_area VALUES ('240', '234', '140109', '万柏林区');
INSERT INTO wp_area VALUES ('241', '234', '140110', '晋源区');
INSERT INTO wp_area VALUES ('242', '234', '140121', '清徐县');
INSERT INTO wp_area VALUES ('243', '234', '140122', '阳曲县');
INSERT INTO wp_area VALUES ('244', '234', '140123', '娄烦县');
INSERT INTO wp_area VALUES ('245', '234', '140181', '古交市');
INSERT INTO wp_area VALUES ('246', '233', '140200', '大同市');
INSERT INTO wp_area VALUES ('247', '246', '140201', '市辖区');
INSERT INTO wp_area VALUES ('248', '246', '140202', '城区');
INSERT INTO wp_area VALUES ('249', '246', '140203', '矿区');
INSERT INTO wp_area VALUES ('250', '246', '140211', '南郊区');
INSERT INTO wp_area VALUES ('251', '246', '140212', '新荣区');
INSERT INTO wp_area VALUES ('252', '246', '140221', '阳高县');
INSERT INTO wp_area VALUES ('253', '246', '140222', '天镇县');
INSERT INTO wp_area VALUES ('254', '246', '140223', '广灵县');
INSERT INTO wp_area VALUES ('255', '246', '140224', '灵丘县');
INSERT INTO wp_area VALUES ('256', '246', '140225', '浑源县');
INSERT INTO wp_area VALUES ('257', '246', '140226', '左云县');
INSERT INTO wp_area VALUES ('258', '246', '140227', '大同县');
INSERT INTO wp_area VALUES ('259', '233', '140300', '阳泉市');
INSERT INTO wp_area VALUES ('260', '259', '140301', '市辖区');
INSERT INTO wp_area VALUES ('261', '259', '140302', '城区');
INSERT INTO wp_area VALUES ('262', '259', '140303', '矿区');
INSERT INTO wp_area VALUES ('263', '259', '140311', '郊区');
INSERT INTO wp_area VALUES ('264', '259', '140321', '平定县');
INSERT INTO wp_area VALUES ('265', '259', '140322', '盂县');
INSERT INTO wp_area VALUES ('266', '233', '140400', '长治市');
INSERT INTO wp_area VALUES ('267', '266', '140401', '市辖区');
INSERT INTO wp_area VALUES ('268', '266', '140402', '城区');
INSERT INTO wp_area VALUES ('269', '266', '140411', '郊区');
INSERT INTO wp_area VALUES ('270', '266', '140421', '长治县');
INSERT INTO wp_area VALUES ('271', '266', '140423', '襄垣县');
INSERT INTO wp_area VALUES ('272', '266', '140424', '屯留县');
INSERT INTO wp_area VALUES ('273', '266', '140425', '平顺县');
INSERT INTO wp_area VALUES ('274', '266', '140426', '黎城县');
INSERT INTO wp_area VALUES ('275', '266', '140427', '壶关县');
INSERT INTO wp_area VALUES ('276', '266', '140428', '长子县');
INSERT INTO wp_area VALUES ('277', '266', '140429', '武乡县');
INSERT INTO wp_area VALUES ('278', '266', '140430', '沁县');
INSERT INTO wp_area VALUES ('279', '266', '140431', '沁源县');
INSERT INTO wp_area VALUES ('280', '266', '140481', '潞城市');
INSERT INTO wp_area VALUES ('281', '233', '140500', '晋城市');
INSERT INTO wp_area VALUES ('282', '281', '140501', '市辖区');
INSERT INTO wp_area VALUES ('283', '281', '140502', '城区');
INSERT INTO wp_area VALUES ('284', '281', '140521', '沁水县');
INSERT INTO wp_area VALUES ('285', '281', '140522', '阳城县');
INSERT INTO wp_area VALUES ('286', '281', '140524', '陵川县');
INSERT INTO wp_area VALUES ('287', '281', '140525', '泽州县');
INSERT INTO wp_area VALUES ('288', '281', '140581', '高平市');
INSERT INTO wp_area VALUES ('289', '233', '140600', '朔州市');
INSERT INTO wp_area VALUES ('290', '289', '140601', '市辖区');
INSERT INTO wp_area VALUES ('291', '289', '140602', '朔城区');
INSERT INTO wp_area VALUES ('292', '289', '140603', '平鲁区');
INSERT INTO wp_area VALUES ('293', '289', '140621', '山阴县');
INSERT INTO wp_area VALUES ('294', '289', '140622', '应县');
INSERT INTO wp_area VALUES ('295', '289', '140623', '右玉县');
INSERT INTO wp_area VALUES ('296', '289', '140624', '怀仁县');
INSERT INTO wp_area VALUES ('297', '233', '140700', '晋中市');
INSERT INTO wp_area VALUES ('298', '297', '140701', '市辖区');
INSERT INTO wp_area VALUES ('299', '297', '140702', '榆次区');
INSERT INTO wp_area VALUES ('300', '297', '140721', '榆社县');
INSERT INTO wp_area VALUES ('301', '297', '140722', '左权县');
INSERT INTO wp_area VALUES ('302', '297', '140723', '和顺县');
INSERT INTO wp_area VALUES ('303', '297', '140724', '昔阳县');
INSERT INTO wp_area VALUES ('304', '297', '140725', '寿阳县');
INSERT INTO wp_area VALUES ('305', '297', '140726', '太谷县');
INSERT INTO wp_area VALUES ('306', '297', '140727', '祁县');
INSERT INTO wp_area VALUES ('307', '297', '140728', '平遥县');
INSERT INTO wp_area VALUES ('308', '297', '140729', '灵石县');
INSERT INTO wp_area VALUES ('309', '297', '140781', '介休市');
INSERT INTO wp_area VALUES ('310', '233', '140800', '运城市');
INSERT INTO wp_area VALUES ('311', '310', '140801', '市辖区');
INSERT INTO wp_area VALUES ('312', '310', '140802', '盐湖区');
INSERT INTO wp_area VALUES ('313', '310', '140821', '临猗县');
INSERT INTO wp_area VALUES ('314', '310', '140822', '万荣县');
INSERT INTO wp_area VALUES ('315', '310', '140823', '闻喜县');
INSERT INTO wp_area VALUES ('316', '310', '140824', '稷山县');
INSERT INTO wp_area VALUES ('317', '310', '140825', '新绛县');
INSERT INTO wp_area VALUES ('318', '310', '140826', '绛县');
INSERT INTO wp_area VALUES ('319', '310', '140827', '垣曲县');
INSERT INTO wp_area VALUES ('320', '310', '140828', '夏县');
INSERT INTO wp_area VALUES ('321', '310', '140829', '平陆县');
INSERT INTO wp_area VALUES ('322', '310', '140830', '芮城县');
INSERT INTO wp_area VALUES ('323', '310', '140881', '永济市');
INSERT INTO wp_area VALUES ('324', '310', '140882', '河津市');
INSERT INTO wp_area VALUES ('325', '233', '140900', '忻州市');
INSERT INTO wp_area VALUES ('326', '325', '140901', '市辖区');
INSERT INTO wp_area VALUES ('327', '325', '140902', '忻府区');
INSERT INTO wp_area VALUES ('328', '325', '140921', '定襄县');
INSERT INTO wp_area VALUES ('329', '325', '140922', '五台县');
INSERT INTO wp_area VALUES ('330', '325', '140923', '代县');
INSERT INTO wp_area VALUES ('331', '325', '140924', '繁峙县');
INSERT INTO wp_area VALUES ('332', '325', '140925', '宁武县');
INSERT INTO wp_area VALUES ('333', '325', '140926', '静乐县');
INSERT INTO wp_area VALUES ('334', '325', '140927', '神池县');
INSERT INTO wp_area VALUES ('335', '325', '140928', '五寨县');
INSERT INTO wp_area VALUES ('336', '325', '140929', '岢岚县');
INSERT INTO wp_area VALUES ('337', '325', '140930', '河曲县');
INSERT INTO wp_area VALUES ('338', '325', '140931', '保德县');
INSERT INTO wp_area VALUES ('339', '325', '140932', '偏关县');
INSERT INTO wp_area VALUES ('340', '325', '140981', '原平市');
INSERT INTO wp_area VALUES ('341', '233', '141000', '临汾市');
INSERT INTO wp_area VALUES ('342', '341', '141001', '市辖区');
INSERT INTO wp_area VALUES ('343', '341', '141002', '尧都区');
INSERT INTO wp_area VALUES ('344', '341', '141021', '曲沃县');
INSERT INTO wp_area VALUES ('345', '341', '141022', '翼城县');
INSERT INTO wp_area VALUES ('346', '341', '141023', '襄汾县');
INSERT INTO wp_area VALUES ('347', '341', '141024', '洪洞县');
INSERT INTO wp_area VALUES ('348', '341', '141025', '古县');
INSERT INTO wp_area VALUES ('349', '341', '141026', '安泽县');
INSERT INTO wp_area VALUES ('350', '341', '141027', '浮山县');
INSERT INTO wp_area VALUES ('351', '341', '141028', '吉县');
INSERT INTO wp_area VALUES ('352', '341', '141029', '乡宁县');
INSERT INTO wp_area VALUES ('353', '341', '141030', '大宁县');
INSERT INTO wp_area VALUES ('354', '341', '141031', '隰县');
INSERT INTO wp_area VALUES ('355', '341', '141032', '永和县');
INSERT INTO wp_area VALUES ('356', '341', '141033', '蒲县');
INSERT INTO wp_area VALUES ('357', '341', '141034', '汾西县');
INSERT INTO wp_area VALUES ('358', '341', '141081', '侯马市');
INSERT INTO wp_area VALUES ('359', '341', '141082', '霍州市');
INSERT INTO wp_area VALUES ('360', '233', '141100', '吕梁市');
INSERT INTO wp_area VALUES ('361', '360', '141101', '市辖区');
INSERT INTO wp_area VALUES ('362', '360', '141102', '离石区');
INSERT INTO wp_area VALUES ('363', '360', '141121', '文水县');
INSERT INTO wp_area VALUES ('364', '360', '141122', '交城县');
INSERT INTO wp_area VALUES ('365', '360', '141123', '兴县');
INSERT INTO wp_area VALUES ('366', '360', '141124', '临县');
INSERT INTO wp_area VALUES ('367', '360', '141125', '柳林县');
INSERT INTO wp_area VALUES ('368', '360', '141126', '石楼县');
INSERT INTO wp_area VALUES ('369', '360', '141127', '岚县');
INSERT INTO wp_area VALUES ('370', '360', '141128', '方山县');
INSERT INTO wp_area VALUES ('371', '360', '141129', '中阳县');
INSERT INTO wp_area VALUES ('372', '360', '141130', '交口县');
INSERT INTO wp_area VALUES ('373', '360', '141181', '孝义市');
INSERT INTO wp_area VALUES ('374', '360', '141182', '汾阳市');
INSERT INTO wp_area VALUES ('375', '0', '150000', '内蒙古自治区');
INSERT INTO wp_area VALUES ('376', '375', '150100', '呼和浩特市');
INSERT INTO wp_area VALUES ('377', '376', '150101', '市辖区');
INSERT INTO wp_area VALUES ('378', '376', '150102', '新城区');
INSERT INTO wp_area VALUES ('379', '376', '150103', '回民区');
INSERT INTO wp_area VALUES ('380', '376', '150104', '玉泉区');
INSERT INTO wp_area VALUES ('381', '376', '150105', '赛罕区');
INSERT INTO wp_area VALUES ('382', '376', '150121', '土默特左旗');
INSERT INTO wp_area VALUES ('383', '376', '150122', '托克托县');
INSERT INTO wp_area VALUES ('384', '376', '150123', '和林格尔县');
INSERT INTO wp_area VALUES ('385', '376', '150124', '清水河县');
INSERT INTO wp_area VALUES ('386', '376', '150125', '武川县');
INSERT INTO wp_area VALUES ('387', '375', '150200', '包头市');
INSERT INTO wp_area VALUES ('388', '387', '150201', '市辖区');
INSERT INTO wp_area VALUES ('389', '387', '150202', '东河区');
INSERT INTO wp_area VALUES ('390', '387', '150203', '昆都仑区');
INSERT INTO wp_area VALUES ('391', '387', '150204', '青山区');
INSERT INTO wp_area VALUES ('392', '387', '150205', '石拐区');
INSERT INTO wp_area VALUES ('393', '387', '150206', '白云鄂博矿区');
INSERT INTO wp_area VALUES ('394', '387', '150207', '九原区');
INSERT INTO wp_area VALUES ('395', '387', '150221', '土默特右旗');
INSERT INTO wp_area VALUES ('396', '387', '150222', '固阳县');
INSERT INTO wp_area VALUES ('397', '387', '150223', '达尔罕茂明安联合旗');
INSERT INTO wp_area VALUES ('398', '375', '150300', '乌海市');
INSERT INTO wp_area VALUES ('399', '398', '150301', '市辖区');
INSERT INTO wp_area VALUES ('400', '398', '150302', '海勃湾区');
INSERT INTO wp_area VALUES ('401', '398', '150303', '海南区');
INSERT INTO wp_area VALUES ('402', '398', '150304', '乌达区');
INSERT INTO wp_area VALUES ('403', '375', '150400', '赤峰市');
INSERT INTO wp_area VALUES ('404', '403', '150401', '市辖区');
INSERT INTO wp_area VALUES ('405', '403', '150402', '红山区');
INSERT INTO wp_area VALUES ('406', '403', '150403', '元宝山区');
INSERT INTO wp_area VALUES ('407', '403', '150404', '松山区');
INSERT INTO wp_area VALUES ('408', '403', '150421', '阿鲁科尔沁旗');
INSERT INTO wp_area VALUES ('409', '403', '150422', '巴林左旗');
INSERT INTO wp_area VALUES ('410', '403', '150423', '巴林右旗');
INSERT INTO wp_area VALUES ('411', '403', '150424', '林西县');
INSERT INTO wp_area VALUES ('412', '403', '150425', '克什克腾旗');
INSERT INTO wp_area VALUES ('413', '403', '150426', '翁牛特旗');
INSERT INTO wp_area VALUES ('414', '403', '150428', '喀喇沁旗');
INSERT INTO wp_area VALUES ('415', '403', '150429', '宁城县');
INSERT INTO wp_area VALUES ('416', '403', '150430', '敖汉旗');
INSERT INTO wp_area VALUES ('417', '375', '150500', '通辽市');
INSERT INTO wp_area VALUES ('418', '417', '150501', '市辖区');
INSERT INTO wp_area VALUES ('419', '417', '150502', '科尔沁区');
INSERT INTO wp_area VALUES ('420', '417', '150521', '科尔沁左翼中旗');
INSERT INTO wp_area VALUES ('421', '417', '150522', '科尔沁左翼后旗');
INSERT INTO wp_area VALUES ('422', '417', '150523', '开鲁县');
INSERT INTO wp_area VALUES ('423', '417', '150524', '库伦旗');
INSERT INTO wp_area VALUES ('424', '417', '150525', '奈曼旗');
INSERT INTO wp_area VALUES ('425', '417', '150526', '扎鲁特旗');
INSERT INTO wp_area VALUES ('426', '417', '150581', '霍林郭勒市');
INSERT INTO wp_area VALUES ('427', '375', '150600', '鄂尔多斯市');
INSERT INTO wp_area VALUES ('428', '427', '150601', '市辖区');
INSERT INTO wp_area VALUES ('429', '427', '150602', '东胜区');
INSERT INTO wp_area VALUES ('430', '427', '150621', '达拉特旗');
INSERT INTO wp_area VALUES ('431', '427', '150622', '准格尔旗');
INSERT INTO wp_area VALUES ('432', '427', '150623', '鄂托克前旗');
INSERT INTO wp_area VALUES ('433', '427', '150624', '鄂托克旗');
INSERT INTO wp_area VALUES ('434', '427', '150625', '杭锦旗');
INSERT INTO wp_area VALUES ('435', '427', '150626', '乌审旗');
INSERT INTO wp_area VALUES ('436', '427', '150627', '伊金霍洛旗');
INSERT INTO wp_area VALUES ('437', '375', '150700', '呼伦贝尔市');
INSERT INTO wp_area VALUES ('438', '437', '150701', '市辖区');
INSERT INTO wp_area VALUES ('439', '437', '150702', '海拉尔区');
INSERT INTO wp_area VALUES ('440', '437', '150703', '扎赉诺尔区');
INSERT INTO wp_area VALUES ('441', '437', '150721', '阿荣旗');
INSERT INTO wp_area VALUES ('442', '437', '150722', '莫力达瓦达斡尔族自治旗');
INSERT INTO wp_area VALUES ('443', '437', '150723', '鄂伦春自治旗');
INSERT INTO wp_area VALUES ('444', '437', '150724', '鄂温克族自治旗');
INSERT INTO wp_area VALUES ('445', '437', '150725', '陈巴尔虎旗');
INSERT INTO wp_area VALUES ('446', '437', '150726', '新巴尔虎左旗');
INSERT INTO wp_area VALUES ('447', '437', '150727', '新巴尔虎右旗');
INSERT INTO wp_area VALUES ('448', '437', '150781', '满洲里市');
INSERT INTO wp_area VALUES ('449', '437', '150782', '牙克石市');
INSERT INTO wp_area VALUES ('450', '437', '150783', '扎兰屯市');
INSERT INTO wp_area VALUES ('451', '437', '150784', '额尔古纳市');
INSERT INTO wp_area VALUES ('452', '437', '150785', '根河市');
INSERT INTO wp_area VALUES ('453', '375', '150800', '巴彦淖尔市');
INSERT INTO wp_area VALUES ('454', '453', '150801', '市辖区');
INSERT INTO wp_area VALUES ('455', '453', '150802', '临河区');
INSERT INTO wp_area VALUES ('456', '453', '150821', '五原县');
INSERT INTO wp_area VALUES ('457', '453', '150822', '磴口县');
INSERT INTO wp_area VALUES ('458', '453', '150823', '乌拉特前旗');
INSERT INTO wp_area VALUES ('459', '453', '150824', '乌拉特中旗');
INSERT INTO wp_area VALUES ('460', '453', '150825', '乌拉特后旗');
INSERT INTO wp_area VALUES ('461', '453', '150826', '杭锦后旗');
INSERT INTO wp_area VALUES ('462', '375', '150900', '乌兰察布市');
INSERT INTO wp_area VALUES ('463', '462', '150901', '市辖区');
INSERT INTO wp_area VALUES ('464', '462', '150902', '集宁区');
INSERT INTO wp_area VALUES ('465', '462', '150921', '卓资县');
INSERT INTO wp_area VALUES ('466', '462', '150922', '化德县');
INSERT INTO wp_area VALUES ('467', '462', '150923', '商都县');
INSERT INTO wp_area VALUES ('468', '462', '150924', '兴和县');
INSERT INTO wp_area VALUES ('469', '462', '150925', '凉城县');
INSERT INTO wp_area VALUES ('470', '462', '150926', '察哈尔右翼前旗');
INSERT INTO wp_area VALUES ('471', '462', '150927', '察哈尔右翼中旗');
INSERT INTO wp_area VALUES ('472', '462', '150928', '察哈尔右翼后旗');
INSERT INTO wp_area VALUES ('473', '462', '150929', '四子王旗');
INSERT INTO wp_area VALUES ('474', '462', '150981', '丰镇市');
INSERT INTO wp_area VALUES ('475', '375', '152200', '兴安盟');
INSERT INTO wp_area VALUES ('476', '475', '152201', '乌兰浩特市');
INSERT INTO wp_area VALUES ('477', '475', '152202', '阿尔山市');
INSERT INTO wp_area VALUES ('478', '475', '152221', '科尔沁右翼前旗');
INSERT INTO wp_area VALUES ('479', '475', '152222', '科尔沁右翼中旗');
INSERT INTO wp_area VALUES ('480', '475', '152223', '扎赉特旗');
INSERT INTO wp_area VALUES ('481', '475', '152224', '突泉县');
INSERT INTO wp_area VALUES ('482', '375', '152500', '锡林郭勒盟');
INSERT INTO wp_area VALUES ('483', '482', '152501', '二连浩特市');
INSERT INTO wp_area VALUES ('484', '482', '152502', '锡林浩特市');
INSERT INTO wp_area VALUES ('485', '482', '152522', '阿巴嘎旗');
INSERT INTO wp_area VALUES ('486', '482', '152523', '苏尼特左旗');
INSERT INTO wp_area VALUES ('487', '482', '152524', '苏尼特右旗');
INSERT INTO wp_area VALUES ('488', '482', '152525', '东乌珠穆沁旗');
INSERT INTO wp_area VALUES ('489', '482', '152526', '西乌珠穆沁旗');
INSERT INTO wp_area VALUES ('490', '482', '152527', '太仆寺旗');
INSERT INTO wp_area VALUES ('491', '482', '152528', '镶黄旗');
INSERT INTO wp_area VALUES ('492', '482', '152529', '正镶白旗');
INSERT INTO wp_area VALUES ('493', '482', '152530', '正蓝旗');
INSERT INTO wp_area VALUES ('494', '482', '152531', '多伦县');
INSERT INTO wp_area VALUES ('495', '375', '152900', '阿拉善盟');
INSERT INTO wp_area VALUES ('496', '495', '152921', '阿拉善左旗');
INSERT INTO wp_area VALUES ('497', '495', '152922', '阿拉善右旗');
INSERT INTO wp_area VALUES ('498', '495', '152923', '额济纳旗');
INSERT INTO wp_area VALUES ('499', '0', '210000', '辽宁省');
INSERT INTO wp_area VALUES ('500', '499', '210100', '沈阳市');
INSERT INTO wp_area VALUES ('501', '500', '210101', '市辖区');
INSERT INTO wp_area VALUES ('502', '500', '210102', '和平区');
INSERT INTO wp_area VALUES ('503', '500', '210103', '沈河区');
INSERT INTO wp_area VALUES ('504', '500', '210104', '大东区');
INSERT INTO wp_area VALUES ('505', '500', '210105', '皇姑区');
INSERT INTO wp_area VALUES ('506', '500', '210106', '铁西区');
INSERT INTO wp_area VALUES ('507', '500', '210111', '苏家屯区');
INSERT INTO wp_area VALUES ('508', '500', '210112', '浑南区');
INSERT INTO wp_area VALUES ('509', '500', '210113', '沈北新区');
INSERT INTO wp_area VALUES ('510', '500', '210114', '于洪区');
INSERT INTO wp_area VALUES ('511', '500', '210122', '辽中县');
INSERT INTO wp_area VALUES ('512', '500', '210123', '康平县');
INSERT INTO wp_area VALUES ('513', '500', '210124', '法库县');
INSERT INTO wp_area VALUES ('514', '500', '210181', '新民市');
INSERT INTO wp_area VALUES ('515', '499', '210200', '大连市');
INSERT INTO wp_area VALUES ('516', '515', '210201', '市辖区');
INSERT INTO wp_area VALUES ('517', '515', '210202', '中山区');
INSERT INTO wp_area VALUES ('518', '515', '210203', '西岗区');
INSERT INTO wp_area VALUES ('519', '515', '210204', '沙河口区');
INSERT INTO wp_area VALUES ('520', '515', '210211', '甘井子区');
INSERT INTO wp_area VALUES ('521', '515', '210212', '旅顺口区');
INSERT INTO wp_area VALUES ('522', '515', '210213', '金州区');
INSERT INTO wp_area VALUES ('523', '515', '210224', '长海县');
INSERT INTO wp_area VALUES ('524', '515', '210281', '瓦房店市');
INSERT INTO wp_area VALUES ('525', '515', '210282', '普兰店市');
INSERT INTO wp_area VALUES ('526', '515', '210283', '庄河市');
INSERT INTO wp_area VALUES ('527', '499', '210300', '鞍山市');
INSERT INTO wp_area VALUES ('528', '527', '210301', '市辖区');
INSERT INTO wp_area VALUES ('529', '527', '210302', '铁东区');
INSERT INTO wp_area VALUES ('530', '527', '210303', '铁西区');
INSERT INTO wp_area VALUES ('531', '527', '210304', '立山区');
INSERT INTO wp_area VALUES ('532', '527', '210311', '千山区');
INSERT INTO wp_area VALUES ('533', '527', '210321', '台安县');
INSERT INTO wp_area VALUES ('534', '527', '210323', '岫岩满族自治县');
INSERT INTO wp_area VALUES ('535', '527', '210381', '海城市');
INSERT INTO wp_area VALUES ('536', '499', '210400', '抚顺市');
INSERT INTO wp_area VALUES ('537', '536', '210401', '市辖区');
INSERT INTO wp_area VALUES ('538', '536', '210402', '新抚区');
INSERT INTO wp_area VALUES ('539', '536', '210403', '东洲区');
INSERT INTO wp_area VALUES ('540', '536', '210404', '望花区');
INSERT INTO wp_area VALUES ('541', '536', '210411', '顺城区');
INSERT INTO wp_area VALUES ('542', '536', '210421', '抚顺县');
INSERT INTO wp_area VALUES ('543', '536', '210422', '新宾满族自治县');
INSERT INTO wp_area VALUES ('544', '536', '210423', '清原满族自治县');
INSERT INTO wp_area VALUES ('545', '499', '210500', '本溪市');
INSERT INTO wp_area VALUES ('546', '545', '210501', '市辖区');
INSERT INTO wp_area VALUES ('547', '545', '210502', '平山区');
INSERT INTO wp_area VALUES ('548', '545', '210503', '溪湖区');
INSERT INTO wp_area VALUES ('549', '545', '210504', '明山区');
INSERT INTO wp_area VALUES ('550', '545', '210505', '南芬区');
INSERT INTO wp_area VALUES ('551', '545', '210521', '本溪满族自治县');
INSERT INTO wp_area VALUES ('552', '545', '210522', '桓仁满族自治县');
INSERT INTO wp_area VALUES ('553', '499', '210600', '丹东市');
INSERT INTO wp_area VALUES ('554', '553', '210601', '市辖区');
INSERT INTO wp_area VALUES ('555', '553', '210602', '元宝区');
INSERT INTO wp_area VALUES ('556', '553', '210603', '振兴区');
INSERT INTO wp_area VALUES ('557', '553', '210604', '振安区');
INSERT INTO wp_area VALUES ('558', '553', '210624', '宽甸满族自治县');
INSERT INTO wp_area VALUES ('559', '553', '210681', '东港市');
INSERT INTO wp_area VALUES ('560', '553', '210682', '凤城市');
INSERT INTO wp_area VALUES ('561', '499', '210700', '锦州市');
INSERT INTO wp_area VALUES ('562', '561', '210701', '市辖区');
INSERT INTO wp_area VALUES ('563', '561', '210702', '古塔区');
INSERT INTO wp_area VALUES ('564', '561', '210703', '凌河区');
INSERT INTO wp_area VALUES ('565', '561', '210711', '太和区');
INSERT INTO wp_area VALUES ('566', '561', '210726', '黑山县');
INSERT INTO wp_area VALUES ('567', '561', '210727', '义县');
INSERT INTO wp_area VALUES ('568', '561', '210781', '凌海市');
INSERT INTO wp_area VALUES ('569', '561', '210782', '北镇市');
INSERT INTO wp_area VALUES ('570', '499', '210800', '营口市');
INSERT INTO wp_area VALUES ('571', '570', '210801', '市辖区');
INSERT INTO wp_area VALUES ('572', '570', '210802', '站前区');
INSERT INTO wp_area VALUES ('573', '570', '210803', '西市区');
INSERT INTO wp_area VALUES ('574', '570', '210804', '鲅鱼圈区');
INSERT INTO wp_area VALUES ('575', '570', '210811', '老边区');
INSERT INTO wp_area VALUES ('576', '570', '210881', '盖州市');
INSERT INTO wp_area VALUES ('577', '570', '210882', '大石桥市');
INSERT INTO wp_area VALUES ('578', '499', '210900', '阜新市');
INSERT INTO wp_area VALUES ('579', '578', '210901', '市辖区');
INSERT INTO wp_area VALUES ('580', '578', '210902', '海州区');
INSERT INTO wp_area VALUES ('581', '578', '210903', '新邱区');
INSERT INTO wp_area VALUES ('582', '578', '210904', '太平区');
INSERT INTO wp_area VALUES ('583', '578', '210905', '清河门区');
INSERT INTO wp_area VALUES ('584', '578', '210911', '细河区');
INSERT INTO wp_area VALUES ('585', '578', '210921', '阜新蒙古族自治县');
INSERT INTO wp_area VALUES ('586', '578', '210922', '彰武县');
INSERT INTO wp_area VALUES ('587', '499', '211000', '辽阳市');
INSERT INTO wp_area VALUES ('588', '587', '211001', '市辖区');
INSERT INTO wp_area VALUES ('589', '587', '211002', '白塔区');
INSERT INTO wp_area VALUES ('590', '587', '211003', '文圣区');
INSERT INTO wp_area VALUES ('591', '587', '211004', '宏伟区');
INSERT INTO wp_area VALUES ('592', '587', '211005', '弓长岭区');
INSERT INTO wp_area VALUES ('593', '587', '211011', '太子河区');
INSERT INTO wp_area VALUES ('594', '587', '211021', '辽阳县');
INSERT INTO wp_area VALUES ('595', '587', '211081', '灯塔市');
INSERT INTO wp_area VALUES ('596', '499', '211100', '盘锦市');
INSERT INTO wp_area VALUES ('597', '596', '211101', '市辖区');
INSERT INTO wp_area VALUES ('598', '596', '211102', '双台子区');
INSERT INTO wp_area VALUES ('599', '596', '211103', '兴隆台区');
INSERT INTO wp_area VALUES ('600', '596', '211121', '大洼县');
INSERT INTO wp_area VALUES ('601', '596', '211122', '盘山县');
INSERT INTO wp_area VALUES ('602', '499', '211200', '铁岭市');
INSERT INTO wp_area VALUES ('603', '602', '211201', '市辖区');
INSERT INTO wp_area VALUES ('604', '602', '211202', '银州区');
INSERT INTO wp_area VALUES ('605', '602', '211204', '清河区');
INSERT INTO wp_area VALUES ('606', '602', '211221', '铁岭县');
INSERT INTO wp_area VALUES ('607', '602', '211223', '西丰县');
INSERT INTO wp_area VALUES ('608', '602', '211224', '昌图县');
INSERT INTO wp_area VALUES ('609', '602', '211281', '调兵山市');
INSERT INTO wp_area VALUES ('610', '602', '211282', '开原市');
INSERT INTO wp_area VALUES ('611', '499', '211300', '朝阳市');
INSERT INTO wp_area VALUES ('612', '611', '211301', '市辖区');
INSERT INTO wp_area VALUES ('613', '611', '211302', '双塔区');
INSERT INTO wp_area VALUES ('614', '611', '211303', '龙城区');
INSERT INTO wp_area VALUES ('615', '611', '211321', '朝阳县');
INSERT INTO wp_area VALUES ('616', '611', '211322', '建平县');
INSERT INTO wp_area VALUES ('617', '611', '211324', '喀喇沁左翼蒙古族自治县');
INSERT INTO wp_area VALUES ('618', '611', '211381', '北票市');
INSERT INTO wp_area VALUES ('619', '611', '211382', '凌源市');
INSERT INTO wp_area VALUES ('620', '499', '211400', '葫芦岛市');
INSERT INTO wp_area VALUES ('621', '620', '211401', '市辖区');
INSERT INTO wp_area VALUES ('622', '620', '211402', '连山区');
INSERT INTO wp_area VALUES ('623', '620', '211403', '龙港区');
INSERT INTO wp_area VALUES ('624', '620', '211404', '南票区');
INSERT INTO wp_area VALUES ('625', '620', '211421', '绥中县');
INSERT INTO wp_area VALUES ('626', '620', '211422', '建昌县');
INSERT INTO wp_area VALUES ('627', '620', '211481', '兴城市');
INSERT INTO wp_area VALUES ('628', '0', '220000', '吉林省');
INSERT INTO wp_area VALUES ('629', '628', '220100', '长春市');
INSERT INTO wp_area VALUES ('630', '629', '220101', '市辖区');
INSERT INTO wp_area VALUES ('631', '629', '220102', '南关区');
INSERT INTO wp_area VALUES ('632', '629', '220103', '宽城区');
INSERT INTO wp_area VALUES ('633', '629', '220104', '朝阳区');
INSERT INTO wp_area VALUES ('634', '629', '220105', '二道区');
INSERT INTO wp_area VALUES ('635', '629', '220106', '绿园区');
INSERT INTO wp_area VALUES ('636', '629', '220112', '双阳区');
INSERT INTO wp_area VALUES ('637', '629', '220113', '九台区');
INSERT INTO wp_area VALUES ('638', '629', '220122', '农安县');
INSERT INTO wp_area VALUES ('639', '629', '220182', '榆树市');
INSERT INTO wp_area VALUES ('640', '629', '220183', '德惠市');
INSERT INTO wp_area VALUES ('641', '628', '220200', '吉林市');
INSERT INTO wp_area VALUES ('642', '641', '220201', '市辖区');
INSERT INTO wp_area VALUES ('643', '641', '220202', '昌邑区');
INSERT INTO wp_area VALUES ('644', '641', '220203', '龙潭区');
INSERT INTO wp_area VALUES ('645', '641', '220204', '船营区');
INSERT INTO wp_area VALUES ('646', '641', '220211', '丰满区');
INSERT INTO wp_area VALUES ('647', '641', '220221', '永吉县');
INSERT INTO wp_area VALUES ('648', '641', '220281', '蛟河市');
INSERT INTO wp_area VALUES ('649', '641', '220282', '桦甸市');
INSERT INTO wp_area VALUES ('650', '641', '220283', '舒兰市');
INSERT INTO wp_area VALUES ('651', '641', '220284', '磐石市');
INSERT INTO wp_area VALUES ('652', '628', '220300', '四平市');
INSERT INTO wp_area VALUES ('653', '652', '220301', '市辖区');
INSERT INTO wp_area VALUES ('654', '652', '220302', '铁西区');
INSERT INTO wp_area VALUES ('655', '652', '220303', '铁东区');
INSERT INTO wp_area VALUES ('656', '652', '220322', '梨树县');
INSERT INTO wp_area VALUES ('657', '652', '220323', '伊通满族自治县');
INSERT INTO wp_area VALUES ('658', '652', '220381', '公主岭市');
INSERT INTO wp_area VALUES ('659', '652', '220382', '双辽市');
INSERT INTO wp_area VALUES ('660', '628', '220400', '辽源市');
INSERT INTO wp_area VALUES ('661', '660', '220401', '市辖区');
INSERT INTO wp_area VALUES ('662', '660', '220402', '龙山区');
INSERT INTO wp_area VALUES ('663', '660', '220403', '西安区');
INSERT INTO wp_area VALUES ('664', '660', '220421', '东丰县');
INSERT INTO wp_area VALUES ('665', '660', '220422', '东辽县');
INSERT INTO wp_area VALUES ('666', '628', '220500', '通化市');
INSERT INTO wp_area VALUES ('667', '666', '220501', '市辖区');
INSERT INTO wp_area VALUES ('668', '666', '220502', '东昌区');
INSERT INTO wp_area VALUES ('669', '666', '220503', '二道江区');
INSERT INTO wp_area VALUES ('670', '666', '220521', '通化县');
INSERT INTO wp_area VALUES ('671', '666', '220523', '辉南县');
INSERT INTO wp_area VALUES ('672', '666', '220524', '柳河县');
INSERT INTO wp_area VALUES ('673', '666', '220581', '梅河口市');
INSERT INTO wp_area VALUES ('674', '666', '220582', '集安市');
INSERT INTO wp_area VALUES ('675', '628', '220600', '白山市');
INSERT INTO wp_area VALUES ('676', '675', '220601', '市辖区');
INSERT INTO wp_area VALUES ('677', '675', '220602', '浑江区');
INSERT INTO wp_area VALUES ('678', '675', '220605', '江源区');
INSERT INTO wp_area VALUES ('679', '675', '220621', '抚松县');
INSERT INTO wp_area VALUES ('680', '675', '220622', '靖宇县');
INSERT INTO wp_area VALUES ('681', '675', '220623', '长白朝鲜族自治县');
INSERT INTO wp_area VALUES ('682', '675', '220681', '临江市');
INSERT INTO wp_area VALUES ('683', '628', '220700', '松原市');
INSERT INTO wp_area VALUES ('684', '683', '220701', '市辖区');
INSERT INTO wp_area VALUES ('685', '683', '220702', '宁江区');
INSERT INTO wp_area VALUES ('686', '683', '220721', '前郭尔罗斯蒙古族自治县');
INSERT INTO wp_area VALUES ('687', '683', '220722', '长岭县');
INSERT INTO wp_area VALUES ('688', '683', '220723', '乾安县');
INSERT INTO wp_area VALUES ('689', '683', '220781', '扶余市');
INSERT INTO wp_area VALUES ('690', '628', '220800', '白城市');
INSERT INTO wp_area VALUES ('691', '690', '220801', '市辖区');
INSERT INTO wp_area VALUES ('692', '690', '220802', '洮北区');
INSERT INTO wp_area VALUES ('693', '690', '220821', '镇赉县');
INSERT INTO wp_area VALUES ('694', '690', '220822', '通榆县');
INSERT INTO wp_area VALUES ('695', '690', '220881', '洮南市');
INSERT INTO wp_area VALUES ('696', '690', '220882', '大安市');
INSERT INTO wp_area VALUES ('697', '628', '222400', '延边朝鲜族自治州');
INSERT INTO wp_area VALUES ('698', '697', '222401', '延吉市');
INSERT INTO wp_area VALUES ('699', '697', '222402', '图们市');
INSERT INTO wp_area VALUES ('700', '697', '222403', '敦化市');
INSERT INTO wp_area VALUES ('701', '697', '222404', '珲春市');
INSERT INTO wp_area VALUES ('702', '697', '222405', '龙井市');
INSERT INTO wp_area VALUES ('703', '697', '222406', '和龙市');
INSERT INTO wp_area VALUES ('704', '697', '222424', '汪清县');
INSERT INTO wp_area VALUES ('705', '697', '222426', '安图县');
INSERT INTO wp_area VALUES ('706', '0', '230000', '黑龙江省');
INSERT INTO wp_area VALUES ('707', '706', '230100', '哈尔滨市');
INSERT INTO wp_area VALUES ('708', '707', '230101', '市辖区');
INSERT INTO wp_area VALUES ('709', '707', '230102', '道里区');
INSERT INTO wp_area VALUES ('710', '707', '230103', '南岗区');
INSERT INTO wp_area VALUES ('711', '707', '230104', '道外区');
INSERT INTO wp_area VALUES ('712', '707', '230108', '平房区');
INSERT INTO wp_area VALUES ('713', '707', '230109', '松北区');
INSERT INTO wp_area VALUES ('714', '707', '230110', '香坊区');
INSERT INTO wp_area VALUES ('715', '707', '230111', '呼兰区');
INSERT INTO wp_area VALUES ('716', '707', '230112', '阿城区');
INSERT INTO wp_area VALUES ('717', '707', '230123', '依兰县');
INSERT INTO wp_area VALUES ('718', '707', '230124', '方正县');
INSERT INTO wp_area VALUES ('719', '707', '230125', '宾县');
INSERT INTO wp_area VALUES ('720', '707', '230126', '巴彦县');
INSERT INTO wp_area VALUES ('721', '707', '230127', '木兰县');
INSERT INTO wp_area VALUES ('722', '707', '230128', '通河县');
INSERT INTO wp_area VALUES ('723', '707', '230129', '延寿县');
INSERT INTO wp_area VALUES ('724', '707', '230182', '双城市');
INSERT INTO wp_area VALUES ('725', '707', '230183', '尚志市');
INSERT INTO wp_area VALUES ('726', '707', '230184', '五常市');
INSERT INTO wp_area VALUES ('727', '706', '230200', '齐齐哈尔市');
INSERT INTO wp_area VALUES ('728', '727', '230201', '市辖区');
INSERT INTO wp_area VALUES ('729', '727', '230202', '龙沙区');
INSERT INTO wp_area VALUES ('730', '727', '230203', '建华区');
INSERT INTO wp_area VALUES ('731', '727', '230204', '铁锋区');
INSERT INTO wp_area VALUES ('732', '727', '230205', '昂昂溪区');
INSERT INTO wp_area VALUES ('733', '727', '230206', '富拉尔基区');
INSERT INTO wp_area VALUES ('734', '727', '230207', '碾子山区');
INSERT INTO wp_area VALUES ('735', '727', '230208', '梅里斯达斡尔族区');
INSERT INTO wp_area VALUES ('736', '727', '230221', '龙江县');
INSERT INTO wp_area VALUES ('737', '727', '230223', '依安县');
INSERT INTO wp_area VALUES ('738', '727', '230224', '泰来县');
INSERT INTO wp_area VALUES ('739', '727', '230225', '甘南县');
INSERT INTO wp_area VALUES ('740', '727', '230227', '富裕县');
INSERT INTO wp_area VALUES ('741', '727', '230229', '克山县');
INSERT INTO wp_area VALUES ('742', '727', '230230', '克东县');
INSERT INTO wp_area VALUES ('743', '727', '230231', '拜泉县');
INSERT INTO wp_area VALUES ('744', '727', '230281', '讷河市');
INSERT INTO wp_area VALUES ('745', '706', '230300', '鸡西市');
INSERT INTO wp_area VALUES ('746', '745', '230301', '市辖区');
INSERT INTO wp_area VALUES ('747', '745', '230302', '鸡冠区');
INSERT INTO wp_area VALUES ('748', '745', '230303', '恒山区');
INSERT INTO wp_area VALUES ('749', '745', '230304', '滴道区');
INSERT INTO wp_area VALUES ('750', '745', '230305', '梨树区');
INSERT INTO wp_area VALUES ('751', '745', '230306', '城子河区');
INSERT INTO wp_area VALUES ('752', '745', '230307', '麻山区');
INSERT INTO wp_area VALUES ('753', '745', '230321', '鸡东县');
INSERT INTO wp_area VALUES ('754', '745', '230381', '虎林市');
INSERT INTO wp_area VALUES ('755', '745', '230382', '密山市');
INSERT INTO wp_area VALUES ('756', '706', '230400', '鹤岗市');
INSERT INTO wp_area VALUES ('757', '756', '230401', '市辖区');
INSERT INTO wp_area VALUES ('758', '756', '230402', '向阳区');
INSERT INTO wp_area VALUES ('759', '756', '230403', '工农区');
INSERT INTO wp_area VALUES ('760', '756', '230404', '南山区');
INSERT INTO wp_area VALUES ('761', '756', '230405', '兴安区');
INSERT INTO wp_area VALUES ('762', '756', '230406', '东山区');
INSERT INTO wp_area VALUES ('763', '756', '230407', '兴山区');
INSERT INTO wp_area VALUES ('764', '756', '230421', '萝北县');
INSERT INTO wp_area VALUES ('765', '756', '230422', '绥滨县');
INSERT INTO wp_area VALUES ('766', '706', '230500', '双鸭山市');
INSERT INTO wp_area VALUES ('767', '766', '230501', '市辖区');
INSERT INTO wp_area VALUES ('768', '766', '230502', '尖山区');
INSERT INTO wp_area VALUES ('769', '766', '230503', '岭东区');
INSERT INTO wp_area VALUES ('770', '766', '230505', '四方台区');
INSERT INTO wp_area VALUES ('771', '766', '230506', '宝山区');
INSERT INTO wp_area VALUES ('772', '766', '230521', '集贤县');
INSERT INTO wp_area VALUES ('773', '766', '230522', '友谊县');
INSERT INTO wp_area VALUES ('774', '766', '230523', '宝清县');
INSERT INTO wp_area VALUES ('775', '766', '230524', '饶河县');
INSERT INTO wp_area VALUES ('776', '706', '230600', '大庆市');
INSERT INTO wp_area VALUES ('777', '776', '230601', '市辖区');
INSERT INTO wp_area VALUES ('778', '776', '230602', '萨尔图区');
INSERT INTO wp_area VALUES ('779', '776', '230603', '龙凤区');
INSERT INTO wp_area VALUES ('780', '776', '230604', '让胡路区');
INSERT INTO wp_area VALUES ('781', '776', '230605', '红岗区');
INSERT INTO wp_area VALUES ('782', '776', '230606', '大同区');
INSERT INTO wp_area VALUES ('783', '776', '230621', '肇州县');
INSERT INTO wp_area VALUES ('784', '776', '230622', '肇源县');
INSERT INTO wp_area VALUES ('785', '776', '230623', '林甸县');
INSERT INTO wp_area VALUES ('786', '776', '230624', '杜尔伯特蒙古族自治县');
INSERT INTO wp_area VALUES ('787', '706', '230700', '伊春市');
INSERT INTO wp_area VALUES ('788', '787', '230701', '市辖区');
INSERT INTO wp_area VALUES ('789', '787', '230702', '伊春区');
INSERT INTO wp_area VALUES ('790', '787', '230703', '南岔区');
INSERT INTO wp_area VALUES ('791', '787', '230704', '友好区');
INSERT INTO wp_area VALUES ('792', '787', '230705', '西林区');
INSERT INTO wp_area VALUES ('793', '787', '230706', '翠峦区');
INSERT INTO wp_area VALUES ('794', '787', '230707', '新青区');
INSERT INTO wp_area VALUES ('795', '787', '230708', '美溪区');
INSERT INTO wp_area VALUES ('796', '787', '230709', '金山屯区');
INSERT INTO wp_area VALUES ('797', '787', '230710', '五营区');
INSERT INTO wp_area VALUES ('798', '787', '230711', '乌马河区');
INSERT INTO wp_area VALUES ('799', '787', '230712', '汤旺河区');
INSERT INTO wp_area VALUES ('800', '787', '230713', '带岭区');
INSERT INTO wp_area VALUES ('801', '787', '230714', '乌伊岭区');
INSERT INTO wp_area VALUES ('802', '787', '230715', '红星区');
INSERT INTO wp_area VALUES ('803', '787', '230716', '上甘岭区');
INSERT INTO wp_area VALUES ('804', '787', '230722', '嘉荫县');
INSERT INTO wp_area VALUES ('805', '787', '230781', '铁力市');
INSERT INTO wp_area VALUES ('806', '706', '230800', '佳木斯市');
INSERT INTO wp_area VALUES ('807', '806', '230801', '市辖区');
INSERT INTO wp_area VALUES ('808', '806', '230803', '向阳区');
INSERT INTO wp_area VALUES ('809', '806', '230804', '前进区');
INSERT INTO wp_area VALUES ('810', '806', '230805', '东风区');
INSERT INTO wp_area VALUES ('811', '806', '230811', '郊区');
INSERT INTO wp_area VALUES ('812', '806', '230822', '桦南县');
INSERT INTO wp_area VALUES ('813', '806', '230826', '桦川县');
INSERT INTO wp_area VALUES ('814', '806', '230828', '汤原县');
INSERT INTO wp_area VALUES ('815', '806', '230833', '抚远县');
INSERT INTO wp_area VALUES ('816', '806', '230881', '同江市');
INSERT INTO wp_area VALUES ('817', '806', '230882', '富锦市');
INSERT INTO wp_area VALUES ('818', '706', '230900', '七台河市');
INSERT INTO wp_area VALUES ('819', '818', '230901', '市辖区');
INSERT INTO wp_area VALUES ('820', '818', '230902', '新兴区');
INSERT INTO wp_area VALUES ('821', '818', '230903', '桃山区');
INSERT INTO wp_area VALUES ('822', '818', '230904', '茄子河区');
INSERT INTO wp_area VALUES ('823', '818', '230921', '勃利县');
INSERT INTO wp_area VALUES ('824', '706', '231000', '牡丹江市');
INSERT INTO wp_area VALUES ('825', '824', '231001', '市辖区');
INSERT INTO wp_area VALUES ('826', '824', '231002', '东安区');
INSERT INTO wp_area VALUES ('827', '824', '231003', '阳明区');
INSERT INTO wp_area VALUES ('828', '824', '231004', '爱民区');
INSERT INTO wp_area VALUES ('829', '824', '231005', '西安区');
INSERT INTO wp_area VALUES ('830', '824', '231024', '东宁县');
INSERT INTO wp_area VALUES ('831', '824', '231025', '林口县');
INSERT INTO wp_area VALUES ('832', '824', '231081', '绥芬河市');
INSERT INTO wp_area VALUES ('833', '824', '231083', '海林市');
INSERT INTO wp_area VALUES ('834', '824', '231084', '宁安市');
INSERT INTO wp_area VALUES ('835', '824', '231085', '穆棱市');
INSERT INTO wp_area VALUES ('836', '706', '231100', '黑河市');
INSERT INTO wp_area VALUES ('837', '836', '231101', '市辖区');
INSERT INTO wp_area VALUES ('838', '836', '231102', '爱辉区');
INSERT INTO wp_area VALUES ('839', '836', '231121', '嫩江县');
INSERT INTO wp_area VALUES ('840', '836', '231123', '逊克县');
INSERT INTO wp_area VALUES ('841', '836', '231124', '孙吴县');
INSERT INTO wp_area VALUES ('842', '836', '231181', '北安市');
INSERT INTO wp_area VALUES ('843', '836', '231182', '五大连池市');
INSERT INTO wp_area VALUES ('844', '706', '231200', '绥化市');
INSERT INTO wp_area VALUES ('845', '844', '231201', '市辖区');
INSERT INTO wp_area VALUES ('846', '844', '231202', '北林区');
INSERT INTO wp_area VALUES ('847', '844', '231221', '望奎县');
INSERT INTO wp_area VALUES ('848', '844', '231222', '兰西县');
INSERT INTO wp_area VALUES ('849', '844', '231223', '青冈县');
INSERT INTO wp_area VALUES ('850', '844', '231224', '庆安县');
INSERT INTO wp_area VALUES ('851', '844', '231225', '明水县');
INSERT INTO wp_area VALUES ('852', '844', '231226', '绥棱县');
INSERT INTO wp_area VALUES ('853', '844', '231281', '安达市');
INSERT INTO wp_area VALUES ('854', '844', '231282', '肇东市');
INSERT INTO wp_area VALUES ('855', '844', '231283', '海伦市');
INSERT INTO wp_area VALUES ('856', '706', '232700', '大兴安岭地区');
INSERT INTO wp_area VALUES ('857', '856', '232721', '呼玛县');
INSERT INTO wp_area VALUES ('858', '856', '232722', '塔河县');
INSERT INTO wp_area VALUES ('859', '856', '232723', '漠河县');
INSERT INTO wp_area VALUES ('860', '0', '310000', '上海市');
INSERT INTO wp_area VALUES ('861', '860', '310100', '市辖区');
INSERT INTO wp_area VALUES ('862', '861', '310101', '黄浦区');
INSERT INTO wp_area VALUES ('863', '861', '310104', '徐汇区');
INSERT INTO wp_area VALUES ('864', '861', '310105', '长宁区');
INSERT INTO wp_area VALUES ('865', '861', '310106', '静安区');
INSERT INTO wp_area VALUES ('866', '861', '310107', '普陀区');
INSERT INTO wp_area VALUES ('867', '861', '310108', '闸北区');
INSERT INTO wp_area VALUES ('868', '861', '310109', '虹口区');
INSERT INTO wp_area VALUES ('869', '861', '310110', '杨浦区');
INSERT INTO wp_area VALUES ('870', '861', '310112', '闵行区');
INSERT INTO wp_area VALUES ('871', '861', '310113', '宝山区');
INSERT INTO wp_area VALUES ('872', '861', '310114', '嘉定区');
INSERT INTO wp_area VALUES ('873', '861', '310115', '浦东新区');
INSERT INTO wp_area VALUES ('874', '861', '310116', '金山区');
INSERT INTO wp_area VALUES ('875', '861', '310117', '松江区');
INSERT INTO wp_area VALUES ('876', '861', '310118', '青浦区');
INSERT INTO wp_area VALUES ('877', '861', '310120', '奉贤区');
INSERT INTO wp_area VALUES ('878', '860', '310200', '县');
INSERT INTO wp_area VALUES ('879', '878', '310230', '崇明县');
INSERT INTO wp_area VALUES ('880', '0', '320000', '江苏省');
INSERT INTO wp_area VALUES ('881', '880', '320100', '南京市');
INSERT INTO wp_area VALUES ('882', '881', '320101', '市辖区');
INSERT INTO wp_area VALUES ('883', '881', '320102', '玄武区');
INSERT INTO wp_area VALUES ('884', '881', '320104', '秦淮区');
INSERT INTO wp_area VALUES ('885', '881', '320105', '建邺区');
INSERT INTO wp_area VALUES ('886', '881', '320106', '鼓楼区');
INSERT INTO wp_area VALUES ('887', '881', '320111', '浦口区');
INSERT INTO wp_area VALUES ('888', '881', '320113', '栖霞区');
INSERT INTO wp_area VALUES ('889', '881', '320114', '雨花台区');
INSERT INTO wp_area VALUES ('890', '881', '320115', '江宁区');
INSERT INTO wp_area VALUES ('891', '881', '320116', '六合区');
INSERT INTO wp_area VALUES ('892', '881', '320117', '溧水区');
INSERT INTO wp_area VALUES ('893', '881', '320118', '高淳区');
INSERT INTO wp_area VALUES ('894', '880', '320200', '无锡市');
INSERT INTO wp_area VALUES ('895', '894', '320201', '市辖区');
INSERT INTO wp_area VALUES ('896', '894', '320202', '崇安区');
INSERT INTO wp_area VALUES ('897', '894', '320203', '南长区');
INSERT INTO wp_area VALUES ('898', '894', '320204', '北塘区');
INSERT INTO wp_area VALUES ('899', '894', '320205', '锡山区');
INSERT INTO wp_area VALUES ('900', '894', '320206', '惠山区');
INSERT INTO wp_area VALUES ('901', '894', '320211', '滨湖区');
INSERT INTO wp_area VALUES ('902', '894', '320281', '江阴市');
INSERT INTO wp_area VALUES ('903', '894', '320282', '宜兴市');
INSERT INTO wp_area VALUES ('904', '880', '320300', '徐州市');
INSERT INTO wp_area VALUES ('905', '904', '320301', '市辖区');
INSERT INTO wp_area VALUES ('906', '904', '320302', '鼓楼区');
INSERT INTO wp_area VALUES ('907', '904', '320303', '云龙区');
INSERT INTO wp_area VALUES ('908', '904', '320305', '贾汪区');
INSERT INTO wp_area VALUES ('909', '904', '320311', '泉山区');
INSERT INTO wp_area VALUES ('910', '904', '320312', '铜山区');
INSERT INTO wp_area VALUES ('911', '904', '320321', '丰县');
INSERT INTO wp_area VALUES ('912', '904', '320322', '沛县');
INSERT INTO wp_area VALUES ('913', '904', '320324', '睢宁县');
INSERT INTO wp_area VALUES ('914', '904', '320381', '新沂市');
INSERT INTO wp_area VALUES ('915', '904', '320382', '邳州市');
INSERT INTO wp_area VALUES ('916', '880', '320400', '常州市');
INSERT INTO wp_area VALUES ('917', '916', '320401', '市辖区');
INSERT INTO wp_area VALUES ('918', '916', '320402', '天宁区');
INSERT INTO wp_area VALUES ('919', '916', '320404', '钟楼区');
INSERT INTO wp_area VALUES ('920', '916', '320405', '戚墅堰区');
INSERT INTO wp_area VALUES ('921', '916', '320411', '新北区');
INSERT INTO wp_area VALUES ('922', '916', '320412', '武进区');
INSERT INTO wp_area VALUES ('923', '916', '320481', '溧阳市');
INSERT INTO wp_area VALUES ('924', '916', '320482', '金坛市');
INSERT INTO wp_area VALUES ('925', '880', '320500', '苏州市');
INSERT INTO wp_area VALUES ('926', '925', '320501', '市辖区');
INSERT INTO wp_area VALUES ('927', '925', '320505', '虎丘区');
INSERT INTO wp_area VALUES ('928', '925', '320506', '吴中区');
INSERT INTO wp_area VALUES ('929', '925', '320507', '相城区');
INSERT INTO wp_area VALUES ('930', '925', '320508', '姑苏区');
INSERT INTO wp_area VALUES ('931', '925', '320509', '吴江区');
INSERT INTO wp_area VALUES ('932', '925', '320581', '常熟市');
INSERT INTO wp_area VALUES ('933', '925', '320582', '张家港市');
INSERT INTO wp_area VALUES ('934', '925', '320583', '昆山市');
INSERT INTO wp_area VALUES ('935', '925', '320585', '太仓市');
INSERT INTO wp_area VALUES ('936', '880', '320600', '南通市');
INSERT INTO wp_area VALUES ('937', '936', '320601', '市辖区');
INSERT INTO wp_area VALUES ('938', '936', '320602', '崇川区');
INSERT INTO wp_area VALUES ('939', '936', '320611', '港闸区');
INSERT INTO wp_area VALUES ('940', '936', '320612', '通州区');
INSERT INTO wp_area VALUES ('941', '936', '320621', '海安县');
INSERT INTO wp_area VALUES ('942', '936', '320623', '如东县');
INSERT INTO wp_area VALUES ('943', '936', '320681', '启东市');
INSERT INTO wp_area VALUES ('944', '936', '320682', '如皋市');
INSERT INTO wp_area VALUES ('945', '936', '320684', '海门市');
INSERT INTO wp_area VALUES ('946', '880', '320700', '连云港市');
INSERT INTO wp_area VALUES ('947', '946', '320701', '市辖区');
INSERT INTO wp_area VALUES ('948', '946', '320703', '连云区');
INSERT INTO wp_area VALUES ('949', '946', '320706', '海州区');
INSERT INTO wp_area VALUES ('950', '946', '320707', '赣榆区');
INSERT INTO wp_area VALUES ('951', '946', '320722', '东海县');
INSERT INTO wp_area VALUES ('952', '946', '320723', '灌云县');
INSERT INTO wp_area VALUES ('953', '946', '320724', '灌南县');
INSERT INTO wp_area VALUES ('954', '880', '320800', '淮安市');
INSERT INTO wp_area VALUES ('955', '954', '320801', '市辖区');
INSERT INTO wp_area VALUES ('956', '954', '320802', '清河区');
INSERT INTO wp_area VALUES ('957', '954', '320803', '淮安区');
INSERT INTO wp_area VALUES ('958', '954', '320804', '淮阴区');
INSERT INTO wp_area VALUES ('959', '954', '320811', '清浦区');
INSERT INTO wp_area VALUES ('960', '954', '320826', '涟水县');
INSERT INTO wp_area VALUES ('961', '954', '320829', '洪泽县');
INSERT INTO wp_area VALUES ('962', '954', '320830', '盱眙县');
INSERT INTO wp_area VALUES ('963', '954', '320831', '金湖县');
INSERT INTO wp_area VALUES ('964', '880', '320900', '盐城市');
INSERT INTO wp_area VALUES ('965', '964', '320901', '市辖区');
INSERT INTO wp_area VALUES ('966', '964', '320902', '亭湖区');
INSERT INTO wp_area VALUES ('967', '964', '320903', '盐都区');
INSERT INTO wp_area VALUES ('968', '964', '320921', '响水县');
INSERT INTO wp_area VALUES ('969', '964', '320922', '滨海县');
INSERT INTO wp_area VALUES ('970', '964', '320923', '阜宁县');
INSERT INTO wp_area VALUES ('971', '964', '320924', '射阳县');
INSERT INTO wp_area VALUES ('972', '964', '320925', '建湖县');
INSERT INTO wp_area VALUES ('973', '964', '320981', '东台市');
INSERT INTO wp_area VALUES ('974', '964', '320982', '大丰市');
INSERT INTO wp_area VALUES ('975', '880', '321000', '扬州市');
INSERT INTO wp_area VALUES ('976', '975', '321001', '市辖区');
INSERT INTO wp_area VALUES ('977', '975', '321002', '广陵区');
INSERT INTO wp_area VALUES ('978', '975', '321003', '邗江区');
INSERT INTO wp_area VALUES ('979', '975', '321012', '江都区');
INSERT INTO wp_area VALUES ('980', '975', '321023', '宝应县');
INSERT INTO wp_area VALUES ('981', '975', '321081', '仪征市');
INSERT INTO wp_area VALUES ('982', '975', '321084', '高邮市');
INSERT INTO wp_area VALUES ('983', '880', '321100', '镇江市');
INSERT INTO wp_area VALUES ('984', '983', '321101', '市辖区');
INSERT INTO wp_area VALUES ('985', '983', '321102', '京口区');
INSERT INTO wp_area VALUES ('986', '983', '321111', '润州区');
INSERT INTO wp_area VALUES ('987', '983', '321112', '丹徒区');
INSERT INTO wp_area VALUES ('988', '983', '321181', '丹阳市');
INSERT INTO wp_area VALUES ('989', '983', '321182', '扬中市');
INSERT INTO wp_area VALUES ('990', '983', '321183', '句容市');
INSERT INTO wp_area VALUES ('991', '880', '321200', '泰州市');
INSERT INTO wp_area VALUES ('992', '991', '321201', '市辖区');
INSERT INTO wp_area VALUES ('993', '991', '321202', '海陵区');
INSERT INTO wp_area VALUES ('994', '991', '321203', '高港区');
INSERT INTO wp_area VALUES ('995', '991', '321204', '姜堰区');
INSERT INTO wp_area VALUES ('996', '991', '321281', '兴化市');
INSERT INTO wp_area VALUES ('997', '991', '321282', '靖江市');
INSERT INTO wp_area VALUES ('998', '991', '321283', '泰兴市');
INSERT INTO wp_area VALUES ('999', '880', '321300', '宿迁市');
INSERT INTO wp_area VALUES ('1000', '999', '321301', '市辖区');
INSERT INTO wp_area VALUES ('1001', '999', '321302', '宿城区');
INSERT INTO wp_area VALUES ('1002', '999', '321311', '宿豫区');
INSERT INTO wp_area VALUES ('1003', '999', '321322', '沭阳县');
INSERT INTO wp_area VALUES ('1004', '999', '321323', '泗阳县');
INSERT INTO wp_area VALUES ('1005', '999', '321324', '泗洪县');
INSERT INTO wp_area VALUES ('1006', '0', '330000', '浙江省');
INSERT INTO wp_area VALUES ('1007', '1006', '330100', '杭州市');
INSERT INTO wp_area VALUES ('1008', '1007', '330101', '市辖区');
INSERT INTO wp_area VALUES ('1009', '1007', '330102', '上城区');
INSERT INTO wp_area VALUES ('1010', '1007', '330103', '下城区');
INSERT INTO wp_area VALUES ('1011', '1007', '330104', '江干区');
INSERT INTO wp_area VALUES ('1012', '1007', '330105', '拱墅区');
INSERT INTO wp_area VALUES ('1013', '1007', '330106', '西湖区');
INSERT INTO wp_area VALUES ('1014', '1007', '330108', '滨江区');
INSERT INTO wp_area VALUES ('1015', '1007', '330109', '萧山区');
INSERT INTO wp_area VALUES ('1016', '1007', '330110', '余杭区');
INSERT INTO wp_area VALUES ('1017', '1007', '330122', '桐庐县');
INSERT INTO wp_area VALUES ('1018', '1007', '330127', '淳安县');
INSERT INTO wp_area VALUES ('1019', '1007', '330182', '建德市');
INSERT INTO wp_area VALUES ('1020', '1007', '330183', '富阳市');
INSERT INTO wp_area VALUES ('1021', '1007', '330185', '临安市');
INSERT INTO wp_area VALUES ('1022', '1006', '330200', '宁波市');
INSERT INTO wp_area VALUES ('1023', '1022', '330201', '市辖区');
INSERT INTO wp_area VALUES ('1024', '1022', '330203', '海曙区');
INSERT INTO wp_area VALUES ('1025', '1022', '330204', '江东区');
INSERT INTO wp_area VALUES ('1026', '1022', '330205', '江北区');
INSERT INTO wp_area VALUES ('1027', '1022', '330206', '北仑区');
INSERT INTO wp_area VALUES ('1028', '1022', '330211', '镇海区');
INSERT INTO wp_area VALUES ('1029', '1022', '330212', '鄞州区');
INSERT INTO wp_area VALUES ('1030', '1022', '330225', '象山县');
INSERT INTO wp_area VALUES ('1031', '1022', '330226', '宁海县');
INSERT INTO wp_area VALUES ('1032', '1022', '330281', '余姚市');
INSERT INTO wp_area VALUES ('1033', '1022', '330282', '慈溪市');
INSERT INTO wp_area VALUES ('1034', '1022', '330283', '奉化市');
INSERT INTO wp_area VALUES ('1035', '1006', '330300', '温州市');
INSERT INTO wp_area VALUES ('1036', '1035', '330301', '市辖区');
INSERT INTO wp_area VALUES ('1037', '1035', '330302', '鹿城区');
INSERT INTO wp_area VALUES ('1038', '1035', '330303', '龙湾区');
INSERT INTO wp_area VALUES ('1039', '1035', '330304', '瓯海区');
INSERT INTO wp_area VALUES ('1040', '1035', '330322', '洞头县');
INSERT INTO wp_area VALUES ('1041', '1035', '330324', '永嘉县');
INSERT INTO wp_area VALUES ('1042', '1035', '330326', '平阳县');
INSERT INTO wp_area VALUES ('1043', '1035', '330327', '苍南县');
INSERT INTO wp_area VALUES ('1044', '1035', '330328', '文成县');
INSERT INTO wp_area VALUES ('1045', '1035', '330329', '泰顺县');
INSERT INTO wp_area VALUES ('1046', '1035', '330381', '瑞安市');
INSERT INTO wp_area VALUES ('1047', '1035', '330382', '乐清市');
INSERT INTO wp_area VALUES ('1048', '1006', '330400', '嘉兴市');
INSERT INTO wp_area VALUES ('1049', '1048', '330401', '市辖区');
INSERT INTO wp_area VALUES ('1050', '1048', '330402', '南湖区');
INSERT INTO wp_area VALUES ('1051', '1048', '330411', '秀洲区');
INSERT INTO wp_area VALUES ('1052', '1048', '330421', '嘉善县');
INSERT INTO wp_area VALUES ('1053', '1048', '330424', '海盐县');
INSERT INTO wp_area VALUES ('1054', '1048', '330481', '海宁市');
INSERT INTO wp_area VALUES ('1055', '1048', '330482', '平湖市');
INSERT INTO wp_area VALUES ('1056', '1048', '330483', '桐乡市');
INSERT INTO wp_area VALUES ('1057', '1006', '330500', '湖州市');
INSERT INTO wp_area VALUES ('1058', '1057', '330501', '市辖区');
INSERT INTO wp_area VALUES ('1059', '1057', '330502', '吴兴区');
INSERT INTO wp_area VALUES ('1060', '1057', '330503', '南浔区');
INSERT INTO wp_area VALUES ('1061', '1057', '330521', '德清县');
INSERT INTO wp_area VALUES ('1062', '1057', '330522', '长兴县');
INSERT INTO wp_area VALUES ('1063', '1057', '330523', '安吉县');
INSERT INTO wp_area VALUES ('1064', '1006', '330600', '绍兴市');
INSERT INTO wp_area VALUES ('1065', '1064', '330601', '市辖区');
INSERT INTO wp_area VALUES ('1066', '1064', '330602', '越城区');
INSERT INTO wp_area VALUES ('1067', '1064', '330603', '柯桥区');
INSERT INTO wp_area VALUES ('1068', '1064', '330604', '上虞区');
INSERT INTO wp_area VALUES ('1069', '1064', '330624', '新昌县');
INSERT INTO wp_area VALUES ('1070', '1064', '330681', '诸暨市');
INSERT INTO wp_area VALUES ('1071', '1064', '330683', '嵊州市');
INSERT INTO wp_area VALUES ('1072', '1006', '330700', '金华市');
INSERT INTO wp_area VALUES ('1073', '1072', '330701', '市辖区');
INSERT INTO wp_area VALUES ('1074', '1072', '330702', '婺城区');
INSERT INTO wp_area VALUES ('1075', '1072', '330703', '金东区');
INSERT INTO wp_area VALUES ('1076', '1072', '330723', '武义县');
INSERT INTO wp_area VALUES ('1077', '1072', '330726', '浦江县');
INSERT INTO wp_area VALUES ('1078', '1072', '330727', '磐安县');
INSERT INTO wp_area VALUES ('1079', '1072', '330781', '兰溪市');
INSERT INTO wp_area VALUES ('1080', '1072', '330782', '义乌市');
INSERT INTO wp_area VALUES ('1081', '1072', '330783', '东阳市');
INSERT INTO wp_area VALUES ('1082', '1072', '330784', '永康市');
INSERT INTO wp_area VALUES ('1083', '1006', '330800', '衢州市');
INSERT INTO wp_area VALUES ('1084', '1083', '330801', '市辖区');
INSERT INTO wp_area VALUES ('1085', '1083', '330802', '柯城区');
INSERT INTO wp_area VALUES ('1086', '1083', '330803', '衢江区');
INSERT INTO wp_area VALUES ('1087', '1083', '330822', '常山县');
INSERT INTO wp_area VALUES ('1088', '1083', '330824', '开化县');
INSERT INTO wp_area VALUES ('1089', '1083', '330825', '龙游县');
INSERT INTO wp_area VALUES ('1090', '1083', '330881', '江山市');
INSERT INTO wp_area VALUES ('1091', '1006', '330900', '舟山市');
INSERT INTO wp_area VALUES ('1092', '1091', '330901', '市辖区');
INSERT INTO wp_area VALUES ('1093', '1091', '330902', '定海区');
INSERT INTO wp_area VALUES ('1094', '1091', '330903', '普陀区');
INSERT INTO wp_area VALUES ('1095', '1091', '330921', '岱山县');
INSERT INTO wp_area VALUES ('1096', '1091', '330922', '嵊泗县');
INSERT INTO wp_area VALUES ('1097', '1006', '331000', '台州市');
INSERT INTO wp_area VALUES ('1098', '1097', '331001', '市辖区');
INSERT INTO wp_area VALUES ('1099', '1097', '331002', '椒江区');
INSERT INTO wp_area VALUES ('1100', '1097', '331003', '黄岩区');
INSERT INTO wp_area VALUES ('1101', '1097', '331004', '路桥区');
INSERT INTO wp_area VALUES ('1102', '1097', '331021', '玉环县');
INSERT INTO wp_area VALUES ('1103', '1097', '331022', '三门县');
INSERT INTO wp_area VALUES ('1104', '1097', '331023', '天台县');
INSERT INTO wp_area VALUES ('1105', '1097', '331024', '仙居县');
INSERT INTO wp_area VALUES ('1106', '1097', '331081', '温岭市');
INSERT INTO wp_area VALUES ('1107', '1097', '331082', '临海市');
INSERT INTO wp_area VALUES ('1108', '1006', '331100', '丽水市');
INSERT INTO wp_area VALUES ('1109', '1108', '331101', '市辖区');
INSERT INTO wp_area VALUES ('1110', '1108', '331102', '莲都区');
INSERT INTO wp_area VALUES ('1111', '1108', '331121', '青田县');
INSERT INTO wp_area VALUES ('1112', '1108', '331122', '缙云县');
INSERT INTO wp_area VALUES ('1113', '1108', '331123', '遂昌县');
INSERT INTO wp_area VALUES ('1114', '1108', '331124', '松阳县');
INSERT INTO wp_area VALUES ('1115', '1108', '331125', '云和县');
INSERT INTO wp_area VALUES ('1116', '1108', '331126', '庆元县');
INSERT INTO wp_area VALUES ('1117', '1108', '331127', '景宁畲族自治县');
INSERT INTO wp_area VALUES ('1118', '1108', '331181', '龙泉市');
INSERT INTO wp_area VALUES ('1119', '0', '340000', '安徽省');
INSERT INTO wp_area VALUES ('1120', '1119', '340100', '合肥市');
INSERT INTO wp_area VALUES ('1121', '1120', '340101', '市辖区');
INSERT INTO wp_area VALUES ('1122', '1120', '340102', '瑶海区');
INSERT INTO wp_area VALUES ('1123', '1120', '340103', '庐阳区');
INSERT INTO wp_area VALUES ('1124', '1120', '340104', '蜀山区');
INSERT INTO wp_area VALUES ('1125', '1120', '340111', '包河区');
INSERT INTO wp_area VALUES ('1126', '1120', '340121', '长丰县');
INSERT INTO wp_area VALUES ('1127', '1120', '340122', '肥东县');
INSERT INTO wp_area VALUES ('1128', '1120', '340123', '肥西县');
INSERT INTO wp_area VALUES ('1129', '1120', '340124', '庐江县');
INSERT INTO wp_area VALUES ('1130', '1120', '340181', '巢湖市');
INSERT INTO wp_area VALUES ('1131', '1119', '340200', '芜湖市');
INSERT INTO wp_area VALUES ('1132', '1131', '340201', '市辖区');
INSERT INTO wp_area VALUES ('1133', '1131', '340202', '镜湖区');
INSERT INTO wp_area VALUES ('1134', '1131', '340203', '弋江区');
INSERT INTO wp_area VALUES ('1135', '1131', '340207', '鸠江区');
INSERT INTO wp_area VALUES ('1136', '1131', '340208', '三山区');
INSERT INTO wp_area VALUES ('1137', '1131', '340221', '芜湖县');
INSERT INTO wp_area VALUES ('1138', '1131', '340222', '繁昌县');
INSERT INTO wp_area VALUES ('1139', '1131', '340223', '南陵县');
INSERT INTO wp_area VALUES ('1140', '1131', '340225', '无为县');
INSERT INTO wp_area VALUES ('1141', '1119', '340300', '蚌埠市');
INSERT INTO wp_area VALUES ('1142', '1141', '340301', '市辖区');
INSERT INTO wp_area VALUES ('1143', '1141', '340302', '龙子湖区');
INSERT INTO wp_area VALUES ('1144', '1141', '340303', '蚌山区');
INSERT INTO wp_area VALUES ('1145', '1141', '340304', '禹会区');
INSERT INTO wp_area VALUES ('1146', '1141', '340311', '淮上区');
INSERT INTO wp_area VALUES ('1147', '1141', '340321', '怀远县');
INSERT INTO wp_area VALUES ('1148', '1141', '340322', '五河县');
INSERT INTO wp_area VALUES ('1149', '1141', '340323', '固镇县');
INSERT INTO wp_area VALUES ('1150', '1119', '340400', '淮南市');
INSERT INTO wp_area VALUES ('1151', '1150', '340401', '市辖区');
INSERT INTO wp_area VALUES ('1152', '1150', '340402', '大通区');
INSERT INTO wp_area VALUES ('1153', '1150', '340403', '田家庵区');
INSERT INTO wp_area VALUES ('1154', '1150', '340404', '谢家集区');
INSERT INTO wp_area VALUES ('1155', '1150', '340405', '八公山区');
INSERT INTO wp_area VALUES ('1156', '1150', '340406', '潘集区');
INSERT INTO wp_area VALUES ('1157', '1150', '340421', '凤台县');
INSERT INTO wp_area VALUES ('1158', '1119', '340500', '马鞍山市');
INSERT INTO wp_area VALUES ('1159', '1158', '340501', '市辖区');
INSERT INTO wp_area VALUES ('1160', '1158', '340503', '花山区');
INSERT INTO wp_area VALUES ('1161', '1158', '340504', '雨山区');
INSERT INTO wp_area VALUES ('1162', '1158', '340506', '博望区');
INSERT INTO wp_area VALUES ('1163', '1158', '340521', '当涂县');
INSERT INTO wp_area VALUES ('1164', '1158', '340522', '含山县');
INSERT INTO wp_area VALUES ('1165', '1158', '340523', '和县');
INSERT INTO wp_area VALUES ('1166', '1119', '340600', '淮北市');
INSERT INTO wp_area VALUES ('1167', '1166', '340601', '市辖区');
INSERT INTO wp_area VALUES ('1168', '1166', '340602', '杜集区');
INSERT INTO wp_area VALUES ('1169', '1166', '340603', '相山区');
INSERT INTO wp_area VALUES ('1170', '1166', '340604', '烈山区');
INSERT INTO wp_area VALUES ('1171', '1166', '340621', '濉溪县');
INSERT INTO wp_area VALUES ('1172', '1119', '340700', '铜陵市');
INSERT INTO wp_area VALUES ('1173', '1172', '340701', '市辖区');
INSERT INTO wp_area VALUES ('1174', '1172', '340702', '铜官山区');
INSERT INTO wp_area VALUES ('1175', '1172', '340703', '狮子山区');
INSERT INTO wp_area VALUES ('1176', '1172', '340711', '郊区');
INSERT INTO wp_area VALUES ('1177', '1172', '340721', '铜陵县');
INSERT INTO wp_area VALUES ('1178', '1119', '340800', '安庆市');
INSERT INTO wp_area VALUES ('1179', '1178', '340801', '市辖区');
INSERT INTO wp_area VALUES ('1180', '1178', '340802', '迎江区');
INSERT INTO wp_area VALUES ('1181', '1178', '340803', '大观区');
INSERT INTO wp_area VALUES ('1182', '1178', '340811', '宜秀区');
INSERT INTO wp_area VALUES ('1183', '1178', '340822', '怀宁县');
INSERT INTO wp_area VALUES ('1184', '1178', '340823', '枞阳县');
INSERT INTO wp_area VALUES ('1185', '1178', '340824', '潜山县');
INSERT INTO wp_area VALUES ('1186', '1178', '340825', '太湖县');
INSERT INTO wp_area VALUES ('1187', '1178', '340826', '宿松县');
INSERT INTO wp_area VALUES ('1188', '1178', '340827', '望江县');
INSERT INTO wp_area VALUES ('1189', '1178', '340828', '岳西县');
INSERT INTO wp_area VALUES ('1190', '1178', '340881', '桐城市');
INSERT INTO wp_area VALUES ('1191', '1119', '341000', '黄山市');
INSERT INTO wp_area VALUES ('1192', '1191', '341001', '市辖区');
INSERT INTO wp_area VALUES ('1193', '1191', '341002', '屯溪区');
INSERT INTO wp_area VALUES ('1194', '1191', '341003', '黄山区');
INSERT INTO wp_area VALUES ('1195', '1191', '341004', '徽州区');
INSERT INTO wp_area VALUES ('1196', '1191', '341021', '歙县');
INSERT INTO wp_area VALUES ('1197', '1191', '341022', '休宁县');
INSERT INTO wp_area VALUES ('1198', '1191', '341023', '黟县');
INSERT INTO wp_area VALUES ('1199', '1191', '341024', '祁门县');
INSERT INTO wp_area VALUES ('1200', '1119', '341100', '滁州市');
INSERT INTO wp_area VALUES ('1201', '1200', '341101', '市辖区');
INSERT INTO wp_area VALUES ('1202', '1200', '341102', '琅琊区');
INSERT INTO wp_area VALUES ('1203', '1200', '341103', '南谯区');
INSERT INTO wp_area VALUES ('1204', '1200', '341122', '来安县');
INSERT INTO wp_area VALUES ('1205', '1200', '341124', '全椒县');
INSERT INTO wp_area VALUES ('1206', '1200', '341125', '定远县');
INSERT INTO wp_area VALUES ('1207', '1200', '341126', '凤阳县');
INSERT INTO wp_area VALUES ('1208', '1200', '341181', '天长市');
INSERT INTO wp_area VALUES ('1209', '1200', '341182', '明光市');
INSERT INTO wp_area VALUES ('1210', '1119', '341200', '阜阳市');
INSERT INTO wp_area VALUES ('1211', '1210', '341201', '市辖区');
INSERT INTO wp_area VALUES ('1212', '1210', '341202', '颍州区');
INSERT INTO wp_area VALUES ('1213', '1210', '341203', '颍东区');
INSERT INTO wp_area VALUES ('1214', '1210', '341204', '颍泉区');
INSERT INTO wp_area VALUES ('1215', '1210', '341221', '临泉县');
INSERT INTO wp_area VALUES ('1216', '1210', '341222', '太和县');
INSERT INTO wp_area VALUES ('1217', '1210', '341225', '阜南县');
INSERT INTO wp_area VALUES ('1218', '1210', '341226', '颍上县');
INSERT INTO wp_area VALUES ('1219', '1210', '341282', '界首市');
INSERT INTO wp_area VALUES ('1220', '1119', '341300', '宿州市');
INSERT INTO wp_area VALUES ('1221', '1220', '341301', '市辖区');
INSERT INTO wp_area VALUES ('1222', '1220', '341302', '埇桥区');
INSERT INTO wp_area VALUES ('1223', '1220', '341321', '砀山县');
INSERT INTO wp_area VALUES ('1224', '1220', '341322', '萧县');
INSERT INTO wp_area VALUES ('1225', '1220', '341323', '灵璧县');
INSERT INTO wp_area VALUES ('1226', '1220', '341324', '泗县');
INSERT INTO wp_area VALUES ('1227', '1119', '341500', '六安市');
INSERT INTO wp_area VALUES ('1228', '1227', '341501', '市辖区');
INSERT INTO wp_area VALUES ('1229', '1227', '341502', '金安区');
INSERT INTO wp_area VALUES ('1230', '1227', '341503', '裕安区');
INSERT INTO wp_area VALUES ('1231', '1227', '341521', '寿县');
INSERT INTO wp_area VALUES ('1232', '1227', '341522', '霍邱县');
INSERT INTO wp_area VALUES ('1233', '1227', '341523', '舒城县');
INSERT INTO wp_area VALUES ('1234', '1227', '341524', '金寨县');
INSERT INTO wp_area VALUES ('1235', '1227', '341525', '霍山县');
INSERT INTO wp_area VALUES ('1236', '1119', '341600', '亳州市');
INSERT INTO wp_area VALUES ('1237', '1236', '341601', '市辖区');
INSERT INTO wp_area VALUES ('1238', '1236', '341602', '谯城区');
INSERT INTO wp_area VALUES ('1239', '1236', '341621', '涡阳县');
INSERT INTO wp_area VALUES ('1240', '1236', '341622', '蒙城县');
INSERT INTO wp_area VALUES ('1241', '1236', '341623', '利辛县');
INSERT INTO wp_area VALUES ('1242', '1119', '341700', '池州市');
INSERT INTO wp_area VALUES ('1243', '1242', '341701', '市辖区');
INSERT INTO wp_area VALUES ('1244', '1242', '341702', '贵池区');
INSERT INTO wp_area VALUES ('1245', '1242', '341721', '东至县');
INSERT INTO wp_area VALUES ('1246', '1242', '341722', '石台县');
INSERT INTO wp_area VALUES ('1247', '1242', '341723', '青阳县');
INSERT INTO wp_area VALUES ('1248', '1119', '341800', '宣城市');
INSERT INTO wp_area VALUES ('1249', '1248', '341801', '市辖区');
INSERT INTO wp_area VALUES ('1250', '1248', '341802', '宣州区');
INSERT INTO wp_area VALUES ('1251', '1248', '341821', '郎溪县');
INSERT INTO wp_area VALUES ('1252', '1248', '341822', '广德县');
INSERT INTO wp_area VALUES ('1253', '1248', '341823', '泾县');
INSERT INTO wp_area VALUES ('1254', '1248', '341824', '绩溪县');
INSERT INTO wp_area VALUES ('1255', '1248', '341825', '旌德县');
INSERT INTO wp_area VALUES ('1256', '1248', '341881', '宁国市');
INSERT INTO wp_area VALUES ('1257', '0', '350000', '福建省');
INSERT INTO wp_area VALUES ('1258', '1257', '350100', '福州市');
INSERT INTO wp_area VALUES ('1259', '1258', '350101', '市辖区');
INSERT INTO wp_area VALUES ('1260', '1258', '350102', '鼓楼区');
INSERT INTO wp_area VALUES ('1261', '1258', '350103', '台江区');
INSERT INTO wp_area VALUES ('1262', '1258', '350104', '仓山区');
INSERT INTO wp_area VALUES ('1263', '1258', '350105', '马尾区');
INSERT INTO wp_area VALUES ('1264', '1258', '350111', '晋安区');
INSERT INTO wp_area VALUES ('1265', '1258', '350121', '闽侯县');
INSERT INTO wp_area VALUES ('1266', '1258', '350122', '连江县');
INSERT INTO wp_area VALUES ('1267', '1258', '350123', '罗源县');
INSERT INTO wp_area VALUES ('1268', '1258', '350124', '闽清县');
INSERT INTO wp_area VALUES ('1269', '1258', '350125', '永泰县');
INSERT INTO wp_area VALUES ('1270', '1258', '350128', '平潭县');
INSERT INTO wp_area VALUES ('1271', '1258', '350181', '福清市');
INSERT INTO wp_area VALUES ('1272', '1258', '350182', '长乐市');
INSERT INTO wp_area VALUES ('1273', '1257', '350200', '厦门市');
INSERT INTO wp_area VALUES ('1274', '1273', '350201', '市辖区');
INSERT INTO wp_area VALUES ('1275', '1273', '350203', '思明区');
INSERT INTO wp_area VALUES ('1276', '1273', '350205', '海沧区');
INSERT INTO wp_area VALUES ('1277', '1273', '350206', '湖里区');
INSERT INTO wp_area VALUES ('1278', '1273', '350211', '集美区');
INSERT INTO wp_area VALUES ('1279', '1273', '350212', '同安区');
INSERT INTO wp_area VALUES ('1280', '1273', '350213', '翔安区');
INSERT INTO wp_area VALUES ('1281', '1257', '350300', '莆田市');
INSERT INTO wp_area VALUES ('1282', '1281', '350301', '市辖区');
INSERT INTO wp_area VALUES ('1283', '1281', '350302', '城厢区');
INSERT INTO wp_area VALUES ('1284', '1281', '350303', '涵江区');
INSERT INTO wp_area VALUES ('1285', '1281', '350304', '荔城区');
INSERT INTO wp_area VALUES ('1286', '1281', '350305', '秀屿区');
INSERT INTO wp_area VALUES ('1287', '1281', '350322', '仙游县');
INSERT INTO wp_area VALUES ('1288', '1257', '350400', '三明市');
INSERT INTO wp_area VALUES ('1289', '1288', '350401', '市辖区');
INSERT INTO wp_area VALUES ('1290', '1288', '350402', '梅列区');
INSERT INTO wp_area VALUES ('1291', '1288', '350403', '三元区');
INSERT INTO wp_area VALUES ('1292', '1288', '350421', '明溪县');
INSERT INTO wp_area VALUES ('1293', '1288', '350423', '清流县');
INSERT INTO wp_area VALUES ('1294', '1288', '350424', '宁化县');
INSERT INTO wp_area VALUES ('1295', '1288', '350425', '大田县');
INSERT INTO wp_area VALUES ('1296', '1288', '350426', '尤溪县');
INSERT INTO wp_area VALUES ('1297', '1288', '350427', '沙县');
INSERT INTO wp_area VALUES ('1298', '1288', '350428', '将乐县');
INSERT INTO wp_area VALUES ('1299', '1288', '350429', '泰宁县');
INSERT INTO wp_area VALUES ('1300', '1288', '350430', '建宁县');
INSERT INTO wp_area VALUES ('1301', '1288', '350481', '永安市');
INSERT INTO wp_area VALUES ('1302', '1257', '350500', '泉州市');
INSERT INTO wp_area VALUES ('1303', '1302', '350501', '市辖区');
INSERT INTO wp_area VALUES ('1304', '1302', '350502', '鲤城区');
INSERT INTO wp_area VALUES ('1305', '1302', '350503', '丰泽区');
INSERT INTO wp_area VALUES ('1306', '1302', '350504', '洛江区');
INSERT INTO wp_area VALUES ('1307', '1302', '350505', '泉港区');
INSERT INTO wp_area VALUES ('1308', '1302', '350521', '惠安县');
INSERT INTO wp_area VALUES ('1309', '1302', '350524', '安溪县');
INSERT INTO wp_area VALUES ('1310', '1302', '350525', '永春县');
INSERT INTO wp_area VALUES ('1311', '1302', '350526', '德化县');
INSERT INTO wp_area VALUES ('1312', '1302', '350527', '金门县');
INSERT INTO wp_area VALUES ('1313', '1302', '350581', '石狮市');
INSERT INTO wp_area VALUES ('1314', '1302', '350582', '晋江市');
INSERT INTO wp_area VALUES ('1315', '1302', '350583', '南安市');
INSERT INTO wp_area VALUES ('1316', '1257', '350600', '漳州市');
INSERT INTO wp_area VALUES ('1317', '1316', '350601', '市辖区');
INSERT INTO wp_area VALUES ('1318', '1316', '350602', '芗城区');
INSERT INTO wp_area VALUES ('1319', '1316', '350603', '龙文区');
INSERT INTO wp_area VALUES ('1320', '1316', '350622', '云霄县');
INSERT INTO wp_area VALUES ('1321', '1316', '350623', '漳浦县');
INSERT INTO wp_area VALUES ('1322', '1316', '350624', '诏安县');
INSERT INTO wp_area VALUES ('1323', '1316', '350625', '长泰县');
INSERT INTO wp_area VALUES ('1324', '1316', '350626', '东山县');
INSERT INTO wp_area VALUES ('1325', '1316', '350627', '南靖县');
INSERT INTO wp_area VALUES ('1326', '1316', '350628', '平和县');
INSERT INTO wp_area VALUES ('1327', '1316', '350629', '华安县');
INSERT INTO wp_area VALUES ('1328', '1316', '350681', '龙海市');
INSERT INTO wp_area VALUES ('1329', '1257', '350700', '南平市');
INSERT INTO wp_area VALUES ('1330', '1329', '350701', '市辖区');
INSERT INTO wp_area VALUES ('1331', '1329', '350702', '延平区');
INSERT INTO wp_area VALUES ('1332', '1329', '350721', '顺昌县');
INSERT INTO wp_area VALUES ('1333', '1329', '350722', '浦城县');
INSERT INTO wp_area VALUES ('1334', '1329', '350723', '光泽县');
INSERT INTO wp_area VALUES ('1335', '1329', '350724', '松溪县');
INSERT INTO wp_area VALUES ('1336', '1329', '350725', '政和县');
INSERT INTO wp_area VALUES ('1337', '1329', '350781', '邵武市');
INSERT INTO wp_area VALUES ('1338', '1329', '350782', '武夷山市');
INSERT INTO wp_area VALUES ('1339', '1329', '350783', '建瓯市');
INSERT INTO wp_area VALUES ('1340', '1329', '350784', '建阳市');
INSERT INTO wp_area VALUES ('1341', '1257', '350800', '龙岩市');
INSERT INTO wp_area VALUES ('1342', '1341', '350801', '市辖区');
INSERT INTO wp_area VALUES ('1343', '1341', '350802', '新罗区');
INSERT INTO wp_area VALUES ('1344', '1341', '350821', '长汀县');
INSERT INTO wp_area VALUES ('1345', '1341', '350822', '永定县');
INSERT INTO wp_area VALUES ('1346', '1341', '350823', '上杭县');
INSERT INTO wp_area VALUES ('1347', '1341', '350824', '武平县');
INSERT INTO wp_area VALUES ('1348', '1341', '350825', '连城县');
INSERT INTO wp_area VALUES ('1349', '1341', '350881', '漳平市');
INSERT INTO wp_area VALUES ('1350', '1257', '350900', '宁德市');
INSERT INTO wp_area VALUES ('1351', '1350', '350901', '市辖区');
INSERT INTO wp_area VALUES ('1352', '1350', '350902', '蕉城区');
INSERT INTO wp_area VALUES ('1353', '1350', '350921', '霞浦县');
INSERT INTO wp_area VALUES ('1354', '1350', '350922', '古田县');
INSERT INTO wp_area VALUES ('1355', '1350', '350923', '屏南县');
INSERT INTO wp_area VALUES ('1356', '1350', '350924', '寿宁县');
INSERT INTO wp_area VALUES ('1357', '1350', '350925', '周宁县');
INSERT INTO wp_area VALUES ('1358', '1350', '350926', '柘荣县');
INSERT INTO wp_area VALUES ('1359', '1350', '350981', '福安市');
INSERT INTO wp_area VALUES ('1360', '1350', '350982', '福鼎市');
INSERT INTO wp_area VALUES ('1361', '0', '360000', '江西省');
INSERT INTO wp_area VALUES ('1362', '1361', '360100', '南昌市');
INSERT INTO wp_area VALUES ('1363', '1362', '360101', '市辖区');
INSERT INTO wp_area VALUES ('1364', '1362', '360102', '东湖区');
INSERT INTO wp_area VALUES ('1365', '1362', '360103', '西湖区');
INSERT INTO wp_area VALUES ('1366', '1362', '360104', '青云谱区');
INSERT INTO wp_area VALUES ('1367', '1362', '360105', '湾里区');
INSERT INTO wp_area VALUES ('1368', '1362', '360111', '青山湖区');
INSERT INTO wp_area VALUES ('1369', '1362', '360121', '南昌县');
INSERT INTO wp_area VALUES ('1370', '1362', '360122', '新建县');
INSERT INTO wp_area VALUES ('1371', '1362', '360123', '安义县');
INSERT INTO wp_area VALUES ('1372', '1362', '360124', '进贤县');
INSERT INTO wp_area VALUES ('1373', '1361', '360200', '景德镇市');
INSERT INTO wp_area VALUES ('1374', '1373', '360201', '市辖区');
INSERT INTO wp_area VALUES ('1375', '1373', '360202', '昌江区');
INSERT INTO wp_area VALUES ('1376', '1373', '360203', '珠山区');
INSERT INTO wp_area VALUES ('1377', '1373', '360222', '浮梁县');
INSERT INTO wp_area VALUES ('1378', '1373', '360281', '乐平市');
INSERT INTO wp_area VALUES ('1379', '1361', '360300', '萍乡市');
INSERT INTO wp_area VALUES ('1380', '1379', '360301', '市辖区');
INSERT INTO wp_area VALUES ('1381', '1379', '360302', '安源区');
INSERT INTO wp_area VALUES ('1382', '1379', '360313', '湘东区');
INSERT INTO wp_area VALUES ('1383', '1379', '360321', '莲花县');
INSERT INTO wp_area VALUES ('1384', '1379', '360322', '上栗县');
INSERT INTO wp_area VALUES ('1385', '1379', '360323', '芦溪县');
INSERT INTO wp_area VALUES ('1386', '1361', '360400', '九江市');
INSERT INTO wp_area VALUES ('1387', '1386', '360401', '市辖区');
INSERT INTO wp_area VALUES ('1388', '1386', '360402', '庐山区');
INSERT INTO wp_area VALUES ('1389', '1386', '360403', '浔阳区');
INSERT INTO wp_area VALUES ('1390', '1386', '360421', '九江县');
INSERT INTO wp_area VALUES ('1391', '1386', '360423', '武宁县');
INSERT INTO wp_area VALUES ('1392', '1386', '360424', '修水县');
INSERT INTO wp_area VALUES ('1393', '1386', '360425', '永修县');
INSERT INTO wp_area VALUES ('1394', '1386', '360426', '德安县');
INSERT INTO wp_area VALUES ('1395', '1386', '360427', '星子县');
INSERT INTO wp_area VALUES ('1396', '1386', '360428', '都昌县');
INSERT INTO wp_area VALUES ('1397', '1386', '360429', '湖口县');
INSERT INTO wp_area VALUES ('1398', '1386', '360430', '彭泽县');
INSERT INTO wp_area VALUES ('1399', '1386', '360481', '瑞昌市');
INSERT INTO wp_area VALUES ('1400', '1386', '360482', '共青城市');
INSERT INTO wp_area VALUES ('1401', '1361', '360500', '新余市');
INSERT INTO wp_area VALUES ('1402', '1401', '360501', '市辖区');
INSERT INTO wp_area VALUES ('1403', '1401', '360502', '渝水区');
INSERT INTO wp_area VALUES ('1404', '1401', '360521', '分宜县');
INSERT INTO wp_area VALUES ('1405', '1361', '360600', '鹰潭市');
INSERT INTO wp_area VALUES ('1406', '1405', '360601', '市辖区');
INSERT INTO wp_area VALUES ('1407', '1405', '360602', '月湖区');
INSERT INTO wp_area VALUES ('1408', '1405', '360622', '余江县');
INSERT INTO wp_area VALUES ('1409', '1405', '360681', '贵溪市');
INSERT INTO wp_area VALUES ('1410', '1361', '360700', '赣州市');
INSERT INTO wp_area VALUES ('1411', '1410', '360701', '市辖区');
INSERT INTO wp_area VALUES ('1412', '1410', '360702', '章贡区');
INSERT INTO wp_area VALUES ('1413', '1410', '360703', '南康区');
INSERT INTO wp_area VALUES ('1414', '1410', '360721', '赣县');
INSERT INTO wp_area VALUES ('1415', '1410', '360722', '信丰县');
INSERT INTO wp_area VALUES ('1416', '1410', '360723', '大余县');
INSERT INTO wp_area VALUES ('1417', '1410', '360724', '上犹县');
INSERT INTO wp_area VALUES ('1418', '1410', '360725', '崇义县');
INSERT INTO wp_area VALUES ('1419', '1410', '360726', '安远县');
INSERT INTO wp_area VALUES ('1420', '1410', '360727', '龙南县');
INSERT INTO wp_area VALUES ('1421', '1410', '360728', '定南县');
INSERT INTO wp_area VALUES ('1422', '1410', '360729', '全南县');
INSERT INTO wp_area VALUES ('1423', '1410', '360730', '宁都县');
INSERT INTO wp_area VALUES ('1424', '1410', '360731', '于都县');
INSERT INTO wp_area VALUES ('1425', '1410', '360732', '兴国县');
INSERT INTO wp_area VALUES ('1426', '1410', '360733', '会昌县');
INSERT INTO wp_area VALUES ('1427', '1410', '360734', '寻乌县');
INSERT INTO wp_area VALUES ('1428', '1410', '360735', '石城县');
INSERT INTO wp_area VALUES ('1429', '1410', '360781', '瑞金市');
INSERT INTO wp_area VALUES ('1430', '1361', '360800', '吉安市');
INSERT INTO wp_area VALUES ('1431', '1430', '360801', '市辖区');
INSERT INTO wp_area VALUES ('1432', '1430', '360802', '吉州区');
INSERT INTO wp_area VALUES ('1433', '1430', '360803', '青原区');
INSERT INTO wp_area VALUES ('1434', '1430', '360821', '吉安县');
INSERT INTO wp_area VALUES ('1435', '1430', '360822', '吉水县');
INSERT INTO wp_area VALUES ('1436', '1430', '360823', '峡江县');
INSERT INTO wp_area VALUES ('1437', '1430', '360824', '新干县');
INSERT INTO wp_area VALUES ('1438', '1430', '360825', '永丰县');
INSERT INTO wp_area VALUES ('1439', '1430', '360826', '泰和县');
INSERT INTO wp_area VALUES ('1440', '1430', '360827', '遂川县');
INSERT INTO wp_area VALUES ('1441', '1430', '360828', '万安县');
INSERT INTO wp_area VALUES ('1442', '1430', '360829', '安福县');
INSERT INTO wp_area VALUES ('1443', '1430', '360830', '永新县');
INSERT INTO wp_area VALUES ('1444', '1430', '360881', '井冈山市');
INSERT INTO wp_area VALUES ('1445', '1361', '360900', '宜春市');
INSERT INTO wp_area VALUES ('1446', '1445', '360901', '市辖区');
INSERT INTO wp_area VALUES ('1447', '1445', '360902', '袁州区');
INSERT INTO wp_area VALUES ('1448', '1445', '360921', '奉新县');
INSERT INTO wp_area VALUES ('1449', '1445', '360922', '万载县');
INSERT INTO wp_area VALUES ('1450', '1445', '360923', '上高县');
INSERT INTO wp_area VALUES ('1451', '1445', '360924', '宜丰县');
INSERT INTO wp_area VALUES ('1452', '1445', '360925', '靖安县');
INSERT INTO wp_area VALUES ('1453', '1445', '360926', '铜鼓县');
INSERT INTO wp_area VALUES ('1454', '1445', '360981', '丰城市');
INSERT INTO wp_area VALUES ('1455', '1445', '360982', '樟树市');
INSERT INTO wp_area VALUES ('1456', '1445', '360983', '高安市');
INSERT INTO wp_area VALUES ('1457', '1361', '361000', '抚州市');
INSERT INTO wp_area VALUES ('1458', '1457', '361001', '市辖区');
INSERT INTO wp_area VALUES ('1459', '1457', '361002', '临川区');
INSERT INTO wp_area VALUES ('1460', '1457', '361021', '南城县');
INSERT INTO wp_area VALUES ('1461', '1457', '361022', '黎川县');
INSERT INTO wp_area VALUES ('1462', '1457', '361023', '南丰县');
INSERT INTO wp_area VALUES ('1463', '1457', '361024', '崇仁县');
INSERT INTO wp_area VALUES ('1464', '1457', '361025', '乐安县');
INSERT INTO wp_area VALUES ('1465', '1457', '361026', '宜黄县');
INSERT INTO wp_area VALUES ('1466', '1457', '361027', '金溪县');
INSERT INTO wp_area VALUES ('1467', '1457', '361028', '资溪县');
INSERT INTO wp_area VALUES ('1468', '1457', '361029', '东乡县');
INSERT INTO wp_area VALUES ('1469', '1457', '361030', '广昌县');
INSERT INTO wp_area VALUES ('1470', '1361', '361100', '上饶市');
INSERT INTO wp_area VALUES ('1471', '1470', '361101', '市辖区');
INSERT INTO wp_area VALUES ('1472', '1470', '361102', '信州区');
INSERT INTO wp_area VALUES ('1473', '1470', '361121', '上饶县');
INSERT INTO wp_area VALUES ('1474', '1470', '361122', '广丰县');
INSERT INTO wp_area VALUES ('1475', '1470', '361123', '玉山县');
INSERT INTO wp_area VALUES ('1476', '1470', '361124', '铅山县');
INSERT INTO wp_area VALUES ('1477', '1470', '361125', '横峰县');
INSERT INTO wp_area VALUES ('1478', '1470', '361126', '弋阳县');
INSERT INTO wp_area VALUES ('1479', '1470', '361127', '余干县');
INSERT INTO wp_area VALUES ('1480', '1470', '361128', '鄱阳县');
INSERT INTO wp_area VALUES ('1481', '1470', '361129', '万年县');
INSERT INTO wp_area VALUES ('1482', '1470', '361130', '婺源县');
INSERT INTO wp_area VALUES ('1483', '1470', '361181', '德兴市');
INSERT INTO wp_area VALUES ('1484', '0', '370000', '山东省');
INSERT INTO wp_area VALUES ('1485', '1484', '370100', '济南市');
INSERT INTO wp_area VALUES ('1486', '1485', '370101', '市辖区');
INSERT INTO wp_area VALUES ('1487', '1485', '370102', '历下区');
INSERT INTO wp_area VALUES ('1488', '1485', '370103', '市中区');
INSERT INTO wp_area VALUES ('1489', '1485', '370104', '槐荫区');
INSERT INTO wp_area VALUES ('1490', '1485', '370105', '天桥区');
INSERT INTO wp_area VALUES ('1491', '1485', '370112', '历城区');
INSERT INTO wp_area VALUES ('1492', '1485', '370113', '长清区');
INSERT INTO wp_area VALUES ('1493', '1485', '370124', '平阴县');
INSERT INTO wp_area VALUES ('1494', '1485', '370125', '济阳县');
INSERT INTO wp_area VALUES ('1495', '1485', '370126', '商河县');
INSERT INTO wp_area VALUES ('1496', '1485', '370181', '章丘市');
INSERT INTO wp_area VALUES ('1497', '1484', '370200', '青岛市');
INSERT INTO wp_area VALUES ('1498', '1497', '370201', '市辖区');
INSERT INTO wp_area VALUES ('1499', '1497', '370202', '市南区');
INSERT INTO wp_area VALUES ('1500', '1497', '370203', '市北区');
INSERT INTO wp_area VALUES ('1501', '1497', '370211', '黄岛区');
INSERT INTO wp_area VALUES ('1502', '1497', '370212', '崂山区');
INSERT INTO wp_area VALUES ('1503', '1497', '370213', '李沧区');
INSERT INTO wp_area VALUES ('1504', '1497', '370214', '城阳区');
INSERT INTO wp_area VALUES ('1505', '1497', '370281', '胶州市');
INSERT INTO wp_area VALUES ('1506', '1497', '370282', '即墨市');
INSERT INTO wp_area VALUES ('1507', '1497', '370283', '平度市');
INSERT INTO wp_area VALUES ('1508', '1497', '370285', '莱西市');
INSERT INTO wp_area VALUES ('1509', '1484', '370300', '淄博市');
INSERT INTO wp_area VALUES ('1510', '1509', '370301', '市辖区');
INSERT INTO wp_area VALUES ('1511', '1509', '370302', '淄川区');
INSERT INTO wp_area VALUES ('1512', '1509', '370303', '张店区');
INSERT INTO wp_area VALUES ('1513', '1509', '370304', '博山区');
INSERT INTO wp_area VALUES ('1514', '1509', '370305', '临淄区');
INSERT INTO wp_area VALUES ('1515', '1509', '370306', '周村区');
INSERT INTO wp_area VALUES ('1516', '1509', '370321', '桓台县');
INSERT INTO wp_area VALUES ('1517', '1509', '370322', '高青县');
INSERT INTO wp_area VALUES ('1518', '1509', '370323', '沂源县');
INSERT INTO wp_area VALUES ('1519', '1484', '370400', '枣庄市');
INSERT INTO wp_area VALUES ('1520', '1519', '370401', '市辖区');
INSERT INTO wp_area VALUES ('1521', '1519', '370402', '市中区');
INSERT INTO wp_area VALUES ('1522', '1519', '370403', '薛城区');
INSERT INTO wp_area VALUES ('1523', '1519', '370404', '峄城区');
INSERT INTO wp_area VALUES ('1524', '1519', '370405', '台儿庄区');
INSERT INTO wp_area VALUES ('1525', '1519', '370406', '山亭区');
INSERT INTO wp_area VALUES ('1526', '1519', '370481', '滕州市');
INSERT INTO wp_area VALUES ('1527', '1484', '370500', '东营市');
INSERT INTO wp_area VALUES ('1528', '1527', '370501', '市辖区');
INSERT INTO wp_area VALUES ('1529', '1527', '370502', '东营区');
INSERT INTO wp_area VALUES ('1530', '1527', '370503', '河口区');
INSERT INTO wp_area VALUES ('1531', '1527', '370521', '垦利县');
INSERT INTO wp_area VALUES ('1532', '1527', '370522', '利津县');
INSERT INTO wp_area VALUES ('1533', '1527', '370523', '广饶县');
INSERT INTO wp_area VALUES ('1534', '1484', '370600', '烟台市');
INSERT INTO wp_area VALUES ('1535', '1534', '370601', '市辖区');
INSERT INTO wp_area VALUES ('1536', '1534', '370602', '芝罘区');
INSERT INTO wp_area VALUES ('1537', '1534', '370611', '福山区');
INSERT INTO wp_area VALUES ('1538', '1534', '370612', '牟平区');
INSERT INTO wp_area VALUES ('1539', '1534', '370613', '莱山区');
INSERT INTO wp_area VALUES ('1540', '1534', '370634', '长岛县');
INSERT INTO wp_area VALUES ('1541', '1534', '370681', '龙口市');
INSERT INTO wp_area VALUES ('1542', '1534', '370682', '莱阳市');
INSERT INTO wp_area VALUES ('1543', '1534', '370683', '莱州市');
INSERT INTO wp_area VALUES ('1544', '1534', '370684', '蓬莱市');
INSERT INTO wp_area VALUES ('1545', '1534', '370685', '招远市');
INSERT INTO wp_area VALUES ('1546', '1534', '370686', '栖霞市');
INSERT INTO wp_area VALUES ('1547', '1534', '370687', '海阳市');
INSERT INTO wp_area VALUES ('1548', '1484', '370700', '潍坊市');
INSERT INTO wp_area VALUES ('1549', '1548', '370701', '市辖区');
INSERT INTO wp_area VALUES ('1550', '1548', '370702', '潍城区');
INSERT INTO wp_area VALUES ('1551', '1548', '370703', '寒亭区');
INSERT INTO wp_area VALUES ('1552', '1548', '370704', '坊子区');
INSERT INTO wp_area VALUES ('1553', '1548', '370705', '奎文区');
INSERT INTO wp_area VALUES ('1554', '1548', '370724', '临朐县');
INSERT INTO wp_area VALUES ('1555', '1548', '370725', '昌乐县');
INSERT INTO wp_area VALUES ('1556', '1548', '370781', '青州市');
INSERT INTO wp_area VALUES ('1557', '1548', '370782', '诸城市');
INSERT INTO wp_area VALUES ('1558', '1548', '370783', '寿光市');
INSERT INTO wp_area VALUES ('1559', '1548', '370784', '安丘市');
INSERT INTO wp_area VALUES ('1560', '1548', '370785', '高密市');
INSERT INTO wp_area VALUES ('1561', '1548', '370786', '昌邑市');
INSERT INTO wp_area VALUES ('1562', '1484', '370800', '济宁市');
INSERT INTO wp_area VALUES ('1563', '1562', '370801', '市辖区');
INSERT INTO wp_area VALUES ('1564', '1562', '370811', '任城区');
INSERT INTO wp_area VALUES ('1565', '1562', '370812', '兖州区');
INSERT INTO wp_area VALUES ('1566', '1562', '370826', '微山县');
INSERT INTO wp_area VALUES ('1567', '1562', '370827', '鱼台县');
INSERT INTO wp_area VALUES ('1568', '1562', '370828', '金乡县');
INSERT INTO wp_area VALUES ('1569', '1562', '370829', '嘉祥县');
INSERT INTO wp_area VALUES ('1570', '1562', '370830', '汶上县');
INSERT INTO wp_area VALUES ('1571', '1562', '370831', '泗水县');
INSERT INTO wp_area VALUES ('1572', '1562', '370832', '梁山县');
INSERT INTO wp_area VALUES ('1573', '1562', '370881', '曲阜市');
INSERT INTO wp_area VALUES ('1574', '1562', '370883', '邹城市');
INSERT INTO wp_area VALUES ('1575', '1484', '370900', '泰安市');
INSERT INTO wp_area VALUES ('1576', '1575', '370901', '市辖区');
INSERT INTO wp_area VALUES ('1577', '1575', '370902', '泰山区');
INSERT INTO wp_area VALUES ('1578', '1575', '370911', '岱岳区');
INSERT INTO wp_area VALUES ('1579', '1575', '370921', '宁阳县');
INSERT INTO wp_area VALUES ('1580', '1575', '370923', '东平县');
INSERT INTO wp_area VALUES ('1581', '1575', '370982', '新泰市');
INSERT INTO wp_area VALUES ('1582', '1575', '370983', '肥城市');
INSERT INTO wp_area VALUES ('1583', '1484', '371000', '威海市');
INSERT INTO wp_area VALUES ('1584', '1583', '371001', '市辖区');
INSERT INTO wp_area VALUES ('1585', '1583', '371002', '环翠区');
INSERT INTO wp_area VALUES ('1586', '1583', '371003', '文登区');
INSERT INTO wp_area VALUES ('1587', '1583', '371082', '荣成市');
INSERT INTO wp_area VALUES ('1588', '1583', '371083', '乳山市');
INSERT INTO wp_area VALUES ('1589', '1484', '371100', '日照市');
INSERT INTO wp_area VALUES ('1590', '1589', '371101', '市辖区');
INSERT INTO wp_area VALUES ('1591', '1589', '371102', '东港区');
INSERT INTO wp_area VALUES ('1592', '1589', '371103', '岚山区');
INSERT INTO wp_area VALUES ('1593', '1589', '371121', '五莲县');
INSERT INTO wp_area VALUES ('1594', '1589', '371122', '莒县');
INSERT INTO wp_area VALUES ('1595', '1484', '371200', '莱芜市');
INSERT INTO wp_area VALUES ('1596', '1595', '371201', '市辖区');
INSERT INTO wp_area VALUES ('1597', '1595', '371202', '莱城区');
INSERT INTO wp_area VALUES ('1598', '1595', '371203', '钢城区');
INSERT INTO wp_area VALUES ('1599', '1484', '371300', '临沂市');
INSERT INTO wp_area VALUES ('1600', '1599', '371301', '市辖区');
INSERT INTO wp_area VALUES ('1601', '1599', '371302', '兰山区');
INSERT INTO wp_area VALUES ('1602', '1599', '371311', '罗庄区');
INSERT INTO wp_area VALUES ('1603', '1599', '371312', '河东区');
INSERT INTO wp_area VALUES ('1604', '1599', '371321', '沂南县');
INSERT INTO wp_area VALUES ('1605', '1599', '371322', '郯城县');
INSERT INTO wp_area VALUES ('1606', '1599', '371323', '沂水县');
INSERT INTO wp_area VALUES ('1607', '1599', '371324', '兰陵县');
INSERT INTO wp_area VALUES ('1608', '1599', '371325', '费县');
INSERT INTO wp_area VALUES ('1609', '1599', '371326', '平邑县');
INSERT INTO wp_area VALUES ('1610', '1599', '371327', '莒南县');
INSERT INTO wp_area VALUES ('1611', '1599', '371328', '蒙阴县');
INSERT INTO wp_area VALUES ('1612', '1599', '371329', '临沭县');
INSERT INTO wp_area VALUES ('1613', '1484', '371400', '德州市');
INSERT INTO wp_area VALUES ('1614', '1613', '371401', '市辖区');
INSERT INTO wp_area VALUES ('1615', '1613', '371402', '德城区');
INSERT INTO wp_area VALUES ('1616', '1613', '371403', '陵城区');
INSERT INTO wp_area VALUES ('1617', '1613', '371422', '宁津县');
INSERT INTO wp_area VALUES ('1618', '1613', '371423', '庆云县');
INSERT INTO wp_area VALUES ('1619', '1613', '371424', '临邑县');
INSERT INTO wp_area VALUES ('1620', '1613', '371425', '齐河县');
INSERT INTO wp_area VALUES ('1621', '1613', '371426', '平原县');
INSERT INTO wp_area VALUES ('1622', '1613', '371427', '夏津县');
INSERT INTO wp_area VALUES ('1623', '1613', '371428', '武城县');
INSERT INTO wp_area VALUES ('1624', '1613', '371481', '乐陵市');
INSERT INTO wp_area VALUES ('1625', '1613', '371482', '禹城市');
INSERT INTO wp_area VALUES ('1626', '1484', '371500', '聊城市');
INSERT INTO wp_area VALUES ('1627', '1626', '371501', '市辖区');
INSERT INTO wp_area VALUES ('1628', '1626', '371502', '东昌府区');
INSERT INTO wp_area VALUES ('1629', '1626', '371521', '阳谷县');
INSERT INTO wp_area VALUES ('1630', '1626', '371522', '莘县');
INSERT INTO wp_area VALUES ('1631', '1626', '371523', '茌平县');
INSERT INTO wp_area VALUES ('1632', '1626', '371524', '东阿县');
INSERT INTO wp_area VALUES ('1633', '1626', '371525', '冠县');
INSERT INTO wp_area VALUES ('1634', '1626', '371526', '高唐县');
INSERT INTO wp_area VALUES ('1635', '1626', '371581', '临清市');
INSERT INTO wp_area VALUES ('1636', '1484', '371600', '滨州市');
INSERT INTO wp_area VALUES ('1637', '1636', '371601', '市辖区');
INSERT INTO wp_area VALUES ('1638', '1636', '371602', '滨城区');
INSERT INTO wp_area VALUES ('1639', '1636', '371603', '沾化区');
INSERT INTO wp_area VALUES ('1640', '1636', '371621', '惠民县');
INSERT INTO wp_area VALUES ('1641', '1636', '371622', '阳信县');
INSERT INTO wp_area VALUES ('1642', '1636', '371623', '无棣县');
INSERT INTO wp_area VALUES ('1643', '1636', '371625', '博兴县');
INSERT INTO wp_area VALUES ('1644', '1636', '371626', '邹平县');
INSERT INTO wp_area VALUES ('1645', '1484', '371700', '菏泽市');
INSERT INTO wp_area VALUES ('1646', '1645', '371701', '市辖区');
INSERT INTO wp_area VALUES ('1647', '1645', '371702', '牡丹区');
INSERT INTO wp_area VALUES ('1648', '1645', '371721', '曹县');
INSERT INTO wp_area VALUES ('1649', '1645', '371722', '单县');
INSERT INTO wp_area VALUES ('1650', '1645', '371723', '成武县');
INSERT INTO wp_area VALUES ('1651', '1645', '371724', '巨野县');
INSERT INTO wp_area VALUES ('1652', '1645', '371725', '郓城县');
INSERT INTO wp_area VALUES ('1653', '1645', '371726', '鄄城县');
INSERT INTO wp_area VALUES ('1654', '1645', '371727', '定陶县');
INSERT INTO wp_area VALUES ('1655', '1645', '371728', '东明县');
INSERT INTO wp_area VALUES ('1656', '0', '410000', '河南省');
INSERT INTO wp_area VALUES ('1657', '1656', '410100', '郑州市');
INSERT INTO wp_area VALUES ('1658', '1657', '410101', '市辖区');
INSERT INTO wp_area VALUES ('1659', '1657', '410102', '中原区');
INSERT INTO wp_area VALUES ('1660', '1657', '410103', '二七区');
INSERT INTO wp_area VALUES ('1661', '1657', '410104', '管城回族区');
INSERT INTO wp_area VALUES ('1662', '1657', '410105', '金水区');
INSERT INTO wp_area VALUES ('1663', '1657', '410106', '上街区');
INSERT INTO wp_area VALUES ('1664', '1657', '410108', '惠济区');
INSERT INTO wp_area VALUES ('1665', '1657', '410122', '中牟县');
INSERT INTO wp_area VALUES ('1666', '1657', '410181', '巩义市');
INSERT INTO wp_area VALUES ('1667', '1657', '410182', '荥阳市');
INSERT INTO wp_area VALUES ('1668', '1657', '410183', '新密市');
INSERT INTO wp_area VALUES ('1669', '1657', '410184', '新郑市');
INSERT INTO wp_area VALUES ('1670', '1657', '410185', '登封市');
INSERT INTO wp_area VALUES ('1671', '1656', '410200', '开封市');
INSERT INTO wp_area VALUES ('1672', '1671', '410201', '市辖区');
INSERT INTO wp_area VALUES ('1673', '1671', '410202', '龙亭区');
INSERT INTO wp_area VALUES ('1674', '1671', '410203', '顺河回族区');
INSERT INTO wp_area VALUES ('1675', '1671', '410204', '鼓楼区');
INSERT INTO wp_area VALUES ('1676', '1671', '410205', '禹王台区');
INSERT INTO wp_area VALUES ('1677', '1671', '410211', '金明区');
INSERT INTO wp_area VALUES ('1678', '1671', '410221', '杞县');
INSERT INTO wp_area VALUES ('1679', '1671', '410222', '通许县');
INSERT INTO wp_area VALUES ('1680', '1671', '410223', '尉氏县');
INSERT INTO wp_area VALUES ('1681', '1671', '410224', '开封县');
INSERT INTO wp_area VALUES ('1682', '1671', '410225', '兰考县');
INSERT INTO wp_area VALUES ('1683', '1656', '410300', '洛阳市');
INSERT INTO wp_area VALUES ('1684', '1683', '410301', '市辖区');
INSERT INTO wp_area VALUES ('1685', '1683', '410302', '老城区');
INSERT INTO wp_area VALUES ('1686', '1683', '410303', '西工区');
INSERT INTO wp_area VALUES ('1687', '1683', '410304', '瀍河回族区');
INSERT INTO wp_area VALUES ('1688', '1683', '410305', '涧西区');
INSERT INTO wp_area VALUES ('1689', '1683', '410306', '吉利区');
INSERT INTO wp_area VALUES ('1690', '1683', '410311', '洛龙区');
INSERT INTO wp_area VALUES ('1691', '1683', '410322', '孟津县');
INSERT INTO wp_area VALUES ('1692', '1683', '410323', '新安县');
INSERT INTO wp_area VALUES ('1693', '1683', '410324', '栾川县');
INSERT INTO wp_area VALUES ('1694', '1683', '410325', '嵩县');
INSERT INTO wp_area VALUES ('1695', '1683', '410326', '汝阳县');
INSERT INTO wp_area VALUES ('1696', '1683', '410327', '宜阳县');
INSERT INTO wp_area VALUES ('1697', '1683', '410328', '洛宁县');
INSERT INTO wp_area VALUES ('1698', '1683', '410329', '伊川县');
INSERT INTO wp_area VALUES ('1699', '1683', '410381', '偃师市');
INSERT INTO wp_area VALUES ('1700', '1656', '410400', '平顶山市');
INSERT INTO wp_area VALUES ('1701', '1700', '410401', '市辖区');
INSERT INTO wp_area VALUES ('1702', '1700', '410402', '新华区');
INSERT INTO wp_area VALUES ('1703', '1700', '410403', '卫东区');
INSERT INTO wp_area VALUES ('1704', '1700', '410404', '石龙区');
INSERT INTO wp_area VALUES ('1705', '1700', '410411', '湛河区');
INSERT INTO wp_area VALUES ('1706', '1700', '410421', '宝丰县');
INSERT INTO wp_area VALUES ('1707', '1700', '410422', '叶县');
INSERT INTO wp_area VALUES ('1708', '1700', '410423', '鲁山县');
INSERT INTO wp_area VALUES ('1709', '1700', '410425', '郏县');
INSERT INTO wp_area VALUES ('1710', '1700', '410481', '舞钢市');
INSERT INTO wp_area VALUES ('1711', '1700', '410482', '汝州市');
INSERT INTO wp_area VALUES ('1712', '1656', '410500', '安阳市');
INSERT INTO wp_area VALUES ('1713', '1712', '410501', '市辖区');
INSERT INTO wp_area VALUES ('1714', '1712', '410502', '文峰区');
INSERT INTO wp_area VALUES ('1715', '1712', '410503', '北关区');
INSERT INTO wp_area VALUES ('1716', '1712', '410505', '殷都区');
INSERT INTO wp_area VALUES ('1717', '1712', '410506', '龙安区');
INSERT INTO wp_area VALUES ('1718', '1712', '410522', '安阳县');
INSERT INTO wp_area VALUES ('1719', '1712', '410523', '汤阴县');
INSERT INTO wp_area VALUES ('1720', '1712', '410526', '滑县');
INSERT INTO wp_area VALUES ('1721', '1712', '410527', '内黄县');
INSERT INTO wp_area VALUES ('1722', '1712', '410581', '林州市');
INSERT INTO wp_area VALUES ('1723', '1656', '410600', '鹤壁市');
INSERT INTO wp_area VALUES ('1724', '1723', '410601', '市辖区');
INSERT INTO wp_area VALUES ('1725', '1723', '410602', '鹤山区');
INSERT INTO wp_area VALUES ('1726', '1723', '410603', '山城区');
INSERT INTO wp_area VALUES ('1727', '1723', '410611', '淇滨区');
INSERT INTO wp_area VALUES ('1728', '1723', '410621', '浚县');
INSERT INTO wp_area VALUES ('1729', '1723', '410622', '淇县');
INSERT INTO wp_area VALUES ('1730', '1656', '410700', '新乡市');
INSERT INTO wp_area VALUES ('1731', '1730', '410701', '市辖区');
INSERT INTO wp_area VALUES ('1732', '1730', '410702', '红旗区');
INSERT INTO wp_area VALUES ('1733', '1730', '410703', '卫滨区');
INSERT INTO wp_area VALUES ('1734', '1730', '410704', '凤泉区');
INSERT INTO wp_area VALUES ('1735', '1730', '410711', '牧野区');
INSERT INTO wp_area VALUES ('1736', '1730', '410721', '新乡县');
INSERT INTO wp_area VALUES ('1737', '1730', '410724', '获嘉县');
INSERT INTO wp_area VALUES ('1738', '1730', '410725', '原阳县');
INSERT INTO wp_area VALUES ('1739', '1730', '410726', '延津县');
INSERT INTO wp_area VALUES ('1740', '1730', '410727', '封丘县');
INSERT INTO wp_area VALUES ('1741', '1730', '410728', '长垣县');
INSERT INTO wp_area VALUES ('1742', '1730', '410781', '卫辉市');
INSERT INTO wp_area VALUES ('1743', '1730', '410782', '辉县市');
INSERT INTO wp_area VALUES ('1744', '1656', '410800', '焦作市');
INSERT INTO wp_area VALUES ('1745', '1744', '410801', '市辖区');
INSERT INTO wp_area VALUES ('1746', '1744', '410802', '解放区');
INSERT INTO wp_area VALUES ('1747', '1744', '410803', '中站区');
INSERT INTO wp_area VALUES ('1748', '1744', '410804', '马村区');
INSERT INTO wp_area VALUES ('1749', '1744', '410811', '山阳区');
INSERT INTO wp_area VALUES ('1750', '1744', '410821', '修武县');
INSERT INTO wp_area VALUES ('1751', '1744', '410822', '博爱县');
INSERT INTO wp_area VALUES ('1752', '1744', '410823', '武陟县');
INSERT INTO wp_area VALUES ('1753', '1744', '410825', '温县');
INSERT INTO wp_area VALUES ('1754', '1744', '410882', '沁阳市');
INSERT INTO wp_area VALUES ('1755', '1744', '410883', '孟州市');
INSERT INTO wp_area VALUES ('1756', '1656', '410900', '濮阳市');
INSERT INTO wp_area VALUES ('1757', '1756', '410901', '市辖区');
INSERT INTO wp_area VALUES ('1758', '1756', '410902', '华龙区');
INSERT INTO wp_area VALUES ('1759', '1756', '410922', '清丰县');
INSERT INTO wp_area VALUES ('1760', '1756', '410923', '南乐县');
INSERT INTO wp_area VALUES ('1761', '1756', '410926', '范县');
INSERT INTO wp_area VALUES ('1762', '1756', '410927', '台前县');
INSERT INTO wp_area VALUES ('1763', '1756', '410928', '濮阳县');
INSERT INTO wp_area VALUES ('1764', '1656', '411000', '许昌市');
INSERT INTO wp_area VALUES ('1765', '1764', '411001', '市辖区');
INSERT INTO wp_area VALUES ('1766', '1764', '411002', '魏都区');
INSERT INTO wp_area VALUES ('1767', '1764', '411023', '许昌县');
INSERT INTO wp_area VALUES ('1768', '1764', '411024', '鄢陵县');
INSERT INTO wp_area VALUES ('1769', '1764', '411025', '襄城县');
INSERT INTO wp_area VALUES ('1770', '1764', '411081', '禹州市');
INSERT INTO wp_area VALUES ('1771', '1764', '411082', '长葛市');
INSERT INTO wp_area VALUES ('1772', '1656', '411100', '漯河市');
INSERT INTO wp_area VALUES ('1773', '1772', '411101', '市辖区');
INSERT INTO wp_area VALUES ('1774', '1772', '411102', '源汇区');
INSERT INTO wp_area VALUES ('1775', '1772', '411103', '郾城区');
INSERT INTO wp_area VALUES ('1776', '1772', '411104', '召陵区');
INSERT INTO wp_area VALUES ('1777', '1772', '411121', '舞阳县');
INSERT INTO wp_area VALUES ('1778', '1772', '411122', '临颍县');
INSERT INTO wp_area VALUES ('1779', '1656', '411200', '三门峡市');
INSERT INTO wp_area VALUES ('1780', '1779', '411201', '市辖区');
INSERT INTO wp_area VALUES ('1781', '1779', '411202', '湖滨区');
INSERT INTO wp_area VALUES ('1782', '1779', '411221', '渑池县');
INSERT INTO wp_area VALUES ('1783', '1779', '411222', '陕县');
INSERT INTO wp_area VALUES ('1784', '1779', '411224', '卢氏县');
INSERT INTO wp_area VALUES ('1785', '1779', '411281', '义马市');
INSERT INTO wp_area VALUES ('1786', '1779', '411282', '灵宝市');
INSERT INTO wp_area VALUES ('1787', '1656', '411300', '南阳市');
INSERT INTO wp_area VALUES ('1788', '1787', '411301', '市辖区');
INSERT INTO wp_area VALUES ('1789', '1787', '411302', '宛城区');
INSERT INTO wp_area VALUES ('1790', '1787', '411303', '卧龙区');
INSERT INTO wp_area VALUES ('1791', '1787', '411321', '南召县');
INSERT INTO wp_area VALUES ('1792', '1787', '411322', '方城县');
INSERT INTO wp_area VALUES ('1793', '1787', '411323', '西峡县');
INSERT INTO wp_area VALUES ('1794', '1787', '411324', '镇平县');
INSERT INTO wp_area VALUES ('1795', '1787', '411325', '内乡县');
INSERT INTO wp_area VALUES ('1796', '1787', '411326', '淅川县');
INSERT INTO wp_area VALUES ('1797', '1787', '411327', '社旗县');
INSERT INTO wp_area VALUES ('1798', '1787', '411328', '唐河县');
INSERT INTO wp_area VALUES ('1799', '1787', '411329', '新野县');
INSERT INTO wp_area VALUES ('1800', '1787', '411330', '桐柏县');
INSERT INTO wp_area VALUES ('1801', '1787', '411381', '邓州市');
INSERT INTO wp_area VALUES ('1802', '1656', '411400', '商丘市');
INSERT INTO wp_area VALUES ('1803', '1802', '411401', '市辖区');
INSERT INTO wp_area VALUES ('1804', '1802', '411402', '梁园区');
INSERT INTO wp_area VALUES ('1805', '1802', '411403', '睢阳区');
INSERT INTO wp_area VALUES ('1806', '1802', '411421', '民权县');
INSERT INTO wp_area VALUES ('1807', '1802', '411422', '睢县');
INSERT INTO wp_area VALUES ('1808', '1802', '411423', '宁陵县');
INSERT INTO wp_area VALUES ('1809', '1802', '411424', '柘城县');
INSERT INTO wp_area VALUES ('1810', '1802', '411425', '虞城县');
INSERT INTO wp_area VALUES ('1811', '1802', '411426', '夏邑县');
INSERT INTO wp_area VALUES ('1812', '1802', '411481', '永城市');
INSERT INTO wp_area VALUES ('1813', '1656', '411500', '信阳市');
INSERT INTO wp_area VALUES ('1814', '1813', '411501', '市辖区');
INSERT INTO wp_area VALUES ('1815', '1813', '411502', '浉河区');
INSERT INTO wp_area VALUES ('1816', '1813', '411503', '平桥区');
INSERT INTO wp_area VALUES ('1817', '1813', '411521', '罗山县');
INSERT INTO wp_area VALUES ('1818', '1813', '411522', '光山县');
INSERT INTO wp_area VALUES ('1819', '1813', '411523', '新县');
INSERT INTO wp_area VALUES ('1820', '1813', '411524', '商城县');
INSERT INTO wp_area VALUES ('1821', '1813', '411525', '固始县');
INSERT INTO wp_area VALUES ('1822', '1813', '411526', '潢川县');
INSERT INTO wp_area VALUES ('1823', '1813', '411527', '淮滨县');
INSERT INTO wp_area VALUES ('1824', '1813', '411528', '息县');
INSERT INTO wp_area VALUES ('1825', '1656', '411600', '周口市');
INSERT INTO wp_area VALUES ('1826', '1825', '411601', '市辖区');
INSERT INTO wp_area VALUES ('1827', '1825', '411602', '川汇区');
INSERT INTO wp_area VALUES ('1828', '1825', '411621', '扶沟县');
INSERT INTO wp_area VALUES ('1829', '1825', '411622', '西华县');
INSERT INTO wp_area VALUES ('1830', '1825', '411623', '商水县');
INSERT INTO wp_area VALUES ('1831', '1825', '411624', '沈丘县');
INSERT INTO wp_area VALUES ('1832', '1825', '411625', '郸城县');
INSERT INTO wp_area VALUES ('1833', '1825', '411626', '淮阳县');
INSERT INTO wp_area VALUES ('1834', '1825', '411627', '太康县');
INSERT INTO wp_area VALUES ('1835', '1825', '411628', '鹿邑县');
INSERT INTO wp_area VALUES ('1836', '1825', '411681', '项城市');
INSERT INTO wp_area VALUES ('1837', '1656', '411700', '驻马店市');
INSERT INTO wp_area VALUES ('1838', '1837', '411701', '市辖区');
INSERT INTO wp_area VALUES ('1839', '1837', '411702', '驿城区');
INSERT INTO wp_area VALUES ('1840', '1837', '411721', '西平县');
INSERT INTO wp_area VALUES ('1841', '1837', '411722', '上蔡县');
INSERT INTO wp_area VALUES ('1842', '1837', '411723', '平舆县');
INSERT INTO wp_area VALUES ('1843', '1837', '411724', '正阳县');
INSERT INTO wp_area VALUES ('1844', '1837', '411725', '确山县');
INSERT INTO wp_area VALUES ('1845', '1837', '411726', '泌阳县');
INSERT INTO wp_area VALUES ('1846', '1837', '411727', '汝南县');
INSERT INTO wp_area VALUES ('1847', '1837', '411728', '遂平县');
INSERT INTO wp_area VALUES ('1848', '1837', '411729', '新蔡县');
INSERT INTO wp_area VALUES ('1849', '1656', '419000', '省直辖县级行政区划');
INSERT INTO wp_area VALUES ('1850', '1849', '419001', '济源市');
INSERT INTO wp_area VALUES ('1851', '0', '420000', '湖北省');
INSERT INTO wp_area VALUES ('1852', '1851', '420100', '武汉市');
INSERT INTO wp_area VALUES ('1853', '1852', '420101', '市辖区');
INSERT INTO wp_area VALUES ('1854', '1852', '420102', '江岸区');
INSERT INTO wp_area VALUES ('1855', '1852', '420103', '江汉区');
INSERT INTO wp_area VALUES ('1856', '1852', '420104', '硚口区');
INSERT INTO wp_area VALUES ('1857', '1852', '420105', '汉阳区');
INSERT INTO wp_area VALUES ('1858', '1852', '420106', '武昌区');
INSERT INTO wp_area VALUES ('1859', '1852', '420107', '青山区');
INSERT INTO wp_area VALUES ('1860', '1852', '420111', '洪山区');
INSERT INTO wp_area VALUES ('1861', '1852', '420112', '东西湖区');
INSERT INTO wp_area VALUES ('1862', '1852', '420113', '汉南区');
INSERT INTO wp_area VALUES ('1863', '1852', '420114', '蔡甸区');
INSERT INTO wp_area VALUES ('1864', '1852', '420115', '江夏区');
INSERT INTO wp_area VALUES ('1865', '1852', '420116', '黄陂区');
INSERT INTO wp_area VALUES ('1866', '1852', '420117', '新洲区');
INSERT INTO wp_area VALUES ('1867', '1851', '420200', '黄石市');
INSERT INTO wp_area VALUES ('1868', '1867', '420201', '市辖区');
INSERT INTO wp_area VALUES ('1869', '1867', '420202', '黄石港区');
INSERT INTO wp_area VALUES ('1870', '1867', '420203', '西塞山区');
INSERT INTO wp_area VALUES ('1871', '1867', '420204', '下陆区');
INSERT INTO wp_area VALUES ('1872', '1867', '420205', '铁山区');
INSERT INTO wp_area VALUES ('1873', '1867', '420222', '阳新县');
INSERT INTO wp_area VALUES ('1874', '1867', '420281', '大冶市');
INSERT INTO wp_area VALUES ('1875', '1851', '420300', '十堰市');
INSERT INTO wp_area VALUES ('1876', '1875', '420301', '市辖区');
INSERT INTO wp_area VALUES ('1877', '1875', '420302', '茅箭区');
INSERT INTO wp_area VALUES ('1878', '1875', '420303', '张湾区');
INSERT INTO wp_area VALUES ('1879', '1875', '420304', '郧阳区');
INSERT INTO wp_area VALUES ('1880', '1875', '420322', '郧西县');
INSERT INTO wp_area VALUES ('1881', '1875', '420323', '竹山县');
INSERT INTO wp_area VALUES ('1882', '1875', '420324', '竹溪县');
INSERT INTO wp_area VALUES ('1883', '1875', '420325', '房县');
INSERT INTO wp_area VALUES ('1884', '1875', '420381', '丹江口市');
INSERT INTO wp_area VALUES ('1885', '1851', '420500', '宜昌市');
INSERT INTO wp_area VALUES ('1886', '1885', '420501', '市辖区');
INSERT INTO wp_area VALUES ('1887', '1885', '420502', '西陵区');
INSERT INTO wp_area VALUES ('1888', '1885', '420503', '伍家岗区');
INSERT INTO wp_area VALUES ('1889', '1885', '420504', '点军区');
INSERT INTO wp_area VALUES ('1890', '1885', '420505', '猇亭区');
INSERT INTO wp_area VALUES ('1891', '1885', '420506', '夷陵区');
INSERT INTO wp_area VALUES ('1892', '1885', '420525', '远安县');
INSERT INTO wp_area VALUES ('1893', '1885', '420526', '兴山县');
INSERT INTO wp_area VALUES ('1894', '1885', '420527', '秭归县');
INSERT INTO wp_area VALUES ('1895', '1885', '420528', '长阳土家族自治县');
INSERT INTO wp_area VALUES ('1896', '1885', '420529', '五峰土家族自治县');
INSERT INTO wp_area VALUES ('1897', '1885', '420581', '宜都市');
INSERT INTO wp_area VALUES ('1898', '1885', '420582', '当阳市');
INSERT INTO wp_area VALUES ('1899', '1885', '420583', '枝江市');
INSERT INTO wp_area VALUES ('1900', '1851', '420600', '襄阳市');
INSERT INTO wp_area VALUES ('1901', '1900', '420601', '市辖区');
INSERT INTO wp_area VALUES ('1902', '1900', '420602', '襄城区');
INSERT INTO wp_area VALUES ('1903', '1900', '420606', '樊城区');
INSERT INTO wp_area VALUES ('1904', '1900', '420607', '襄州区');
INSERT INTO wp_area VALUES ('1905', '1900', '420624', '南漳县');
INSERT INTO wp_area VALUES ('1906', '1900', '420625', '谷城县');
INSERT INTO wp_area VALUES ('1907', '1900', '420626', '保康县');
INSERT INTO wp_area VALUES ('1908', '1900', '420682', '老河口市');
INSERT INTO wp_area VALUES ('1909', '1900', '420683', '枣阳市');
INSERT INTO wp_area VALUES ('1910', '1900', '420684', '宜城市');
INSERT INTO wp_area VALUES ('1911', '1851', '420700', '鄂州市');
INSERT INTO wp_area VALUES ('1912', '1911', '420701', '市辖区');
INSERT INTO wp_area VALUES ('1913', '1911', '420702', '梁子湖区');
INSERT INTO wp_area VALUES ('1914', '1911', '420703', '华容区');
INSERT INTO wp_area VALUES ('1915', '1911', '420704', '鄂城区');
INSERT INTO wp_area VALUES ('1916', '1851', '420800', '荆门市');
INSERT INTO wp_area VALUES ('1917', '1916', '420801', '市辖区');
INSERT INTO wp_area VALUES ('1918', '1916', '420802', '东宝区');
INSERT INTO wp_area VALUES ('1919', '1916', '420804', '掇刀区');
INSERT INTO wp_area VALUES ('1920', '1916', '420821', '京山县');
INSERT INTO wp_area VALUES ('1921', '1916', '420822', '沙洋县');
INSERT INTO wp_area VALUES ('1922', '1916', '420881', '钟祥市');
INSERT INTO wp_area VALUES ('1923', '1851', '420900', '孝感市');
INSERT INTO wp_area VALUES ('1924', '1923', '420901', '市辖区');
INSERT INTO wp_area VALUES ('1925', '1923', '420902', '孝南区');
INSERT INTO wp_area VALUES ('1926', '1923', '420921', '孝昌县');
INSERT INTO wp_area VALUES ('1927', '1923', '420922', '大悟县');
INSERT INTO wp_area VALUES ('1928', '1923', '420923', '云梦县');
INSERT INTO wp_area VALUES ('1929', '1923', '420981', '应城市');
INSERT INTO wp_area VALUES ('1930', '1923', '420982', '安陆市');
INSERT INTO wp_area VALUES ('1931', '1923', '420984', '汉川市');
INSERT INTO wp_area VALUES ('1932', '1851', '421000', '荆州市');
INSERT INTO wp_area VALUES ('1933', '1932', '421001', '市辖区');
INSERT INTO wp_area VALUES ('1934', '1932', '421002', '沙市区');
INSERT INTO wp_area VALUES ('1935', '1932', '421003', '荆州区');
INSERT INTO wp_area VALUES ('1936', '1932', '421022', '公安县');
INSERT INTO wp_area VALUES ('1937', '1932', '421023', '监利县');
INSERT INTO wp_area VALUES ('1938', '1932', '421024', '江陵县');
INSERT INTO wp_area VALUES ('1939', '1932', '421081', '石首市');
INSERT INTO wp_area VALUES ('1940', '1932', '421083', '洪湖市');
INSERT INTO wp_area VALUES ('1941', '1932', '421087', '松滋市');
INSERT INTO wp_area VALUES ('1942', '1851', '421100', '黄冈市');
INSERT INTO wp_area VALUES ('1943', '1942', '421101', '市辖区');
INSERT INTO wp_area VALUES ('1944', '1942', '421102', '黄州区');
INSERT INTO wp_area VALUES ('1945', '1942', '421121', '团风县');
INSERT INTO wp_area VALUES ('1946', '1942', '421122', '红安县');
INSERT INTO wp_area VALUES ('1947', '1942', '421123', '罗田县');
INSERT INTO wp_area VALUES ('1948', '1942', '421124', '英山县');
INSERT INTO wp_area VALUES ('1949', '1942', '421125', '浠水县');
INSERT INTO wp_area VALUES ('1950', '1942', '421126', '蕲春县');
INSERT INTO wp_area VALUES ('1951', '1942', '421127', '黄梅县');
INSERT INTO wp_area VALUES ('1952', '1942', '421181', '麻城市');
INSERT INTO wp_area VALUES ('1953', '1942', '421182', '武穴市');
INSERT INTO wp_area VALUES ('1954', '1851', '421200', '咸宁市');
INSERT INTO wp_area VALUES ('1955', '1954', '421201', '市辖区');
INSERT INTO wp_area VALUES ('1956', '1954', '421202', '咸安区');
INSERT INTO wp_area VALUES ('1957', '1954', '421221', '嘉鱼县');
INSERT INTO wp_area VALUES ('1958', '1954', '421222', '通城县');
INSERT INTO wp_area VALUES ('1959', '1954', '421223', '崇阳县');
INSERT INTO wp_area VALUES ('1960', '1954', '421224', '通山县');
INSERT INTO wp_area VALUES ('1961', '1954', '421281', '赤壁市');
INSERT INTO wp_area VALUES ('1962', '1851', '421300', '随州市');
INSERT INTO wp_area VALUES ('1963', '1962', '421301', '市辖区');
INSERT INTO wp_area VALUES ('1964', '1962', '421303', '曾都区');
INSERT INTO wp_area VALUES ('1965', '1962', '421321', '随县');
INSERT INTO wp_area VALUES ('1966', '1962', '421381', '广水市');
INSERT INTO wp_area VALUES ('1967', '1851', '422800', '恩施土家族苗族自治州');
INSERT INTO wp_area VALUES ('1968', '1967', '422801', '恩施市');
INSERT INTO wp_area VALUES ('1969', '1967', '422802', '利川市');
INSERT INTO wp_area VALUES ('1970', '1967', '422822', '建始县');
INSERT INTO wp_area VALUES ('1971', '1967', '422823', '巴东县');
INSERT INTO wp_area VALUES ('1972', '1967', '422825', '宣恩县');
INSERT INTO wp_area VALUES ('1973', '1967', '422826', '咸丰县');
INSERT INTO wp_area VALUES ('1974', '1967', '422827', '来凤县');
INSERT INTO wp_area VALUES ('1975', '1967', '422828', '鹤峰县');
INSERT INTO wp_area VALUES ('1976', '1851', '429000', '省直辖县级行政区划');
INSERT INTO wp_area VALUES ('1977', '1976', '429004', '仙桃市');
INSERT INTO wp_area VALUES ('1978', '1976', '429005', '潜江市');
INSERT INTO wp_area VALUES ('1979', '1976', '429006', '天门市');
INSERT INTO wp_area VALUES ('1980', '1976', '429021', '神农架林区');
INSERT INTO wp_area VALUES ('1981', '0', '430000', '湖南省');
INSERT INTO wp_area VALUES ('1982', '1981', '430100', '长沙市');
INSERT INTO wp_area VALUES ('1983', '1982', '430101', '市辖区');
INSERT INTO wp_area VALUES ('1984', '1982', '430102', '芙蓉区');
INSERT INTO wp_area VALUES ('1985', '1982', '430103', '天心区');
INSERT INTO wp_area VALUES ('1986', '1982', '430104', '岳麓区');
INSERT INTO wp_area VALUES ('1987', '1982', '430105', '开福区');
INSERT INTO wp_area VALUES ('1988', '1982', '430111', '雨花区');
INSERT INTO wp_area VALUES ('1989', '1982', '430112', '望城区');
INSERT INTO wp_area VALUES ('1990', '1982', '430121', '长沙县');
INSERT INTO wp_area VALUES ('1991', '1982', '430124', '宁乡县');
INSERT INTO wp_area VALUES ('1992', '1982', '430181', '浏阳市');
INSERT INTO wp_area VALUES ('1993', '1981', '430200', '株洲市');
INSERT INTO wp_area VALUES ('1994', '1993', '430201', '市辖区');
INSERT INTO wp_area VALUES ('1995', '1993', '430202', '荷塘区');
INSERT INTO wp_area VALUES ('1996', '1993', '430203', '芦淞区');
INSERT INTO wp_area VALUES ('1997', '1993', '430204', '石峰区');
INSERT INTO wp_area VALUES ('1998', '1993', '430211', '天元区');
INSERT INTO wp_area VALUES ('1999', '1993', '430221', '株洲县');
INSERT INTO wp_area VALUES ('2000', '1993', '430223', '攸县');
INSERT INTO wp_area VALUES ('2001', '1993', '430224', '茶陵县');
INSERT INTO wp_area VALUES ('2002', '1993', '430225', '炎陵县');
INSERT INTO wp_area VALUES ('2003', '1993', '430281', '醴陵市');
INSERT INTO wp_area VALUES ('2004', '1981', '430300', '湘潭市');
INSERT INTO wp_area VALUES ('2005', '2004', '430301', '市辖区');
INSERT INTO wp_area VALUES ('2006', '2004', '430302', '雨湖区');
INSERT INTO wp_area VALUES ('2007', '2004', '430304', '岳塘区');
INSERT INTO wp_area VALUES ('2008', '2004', '430321', '湘潭县');
INSERT INTO wp_area VALUES ('2009', '2004', '430381', '湘乡市');
INSERT INTO wp_area VALUES ('2010', '2004', '430382', '韶山市');
INSERT INTO wp_area VALUES ('2011', '1981', '430400', '衡阳市');
INSERT INTO wp_area VALUES ('2012', '2011', '430401', '市辖区');
INSERT INTO wp_area VALUES ('2013', '2011', '430405', '珠晖区');
INSERT INTO wp_area VALUES ('2014', '2011', '430406', '雁峰区');
INSERT INTO wp_area VALUES ('2015', '2011', '430407', '石鼓区');
INSERT INTO wp_area VALUES ('2016', '2011', '430408', '蒸湘区');
INSERT INTO wp_area VALUES ('2017', '2011', '430412', '南岳区');
INSERT INTO wp_area VALUES ('2018', '2011', '430421', '衡阳县');
INSERT INTO wp_area VALUES ('2019', '2011', '430422', '衡南县');
INSERT INTO wp_area VALUES ('2020', '2011', '430423', '衡山县');
INSERT INTO wp_area VALUES ('2021', '2011', '430424', '衡东县');
INSERT INTO wp_area VALUES ('2022', '2011', '430426', '祁东县');
INSERT INTO wp_area VALUES ('2023', '2011', '430481', '耒阳市');
INSERT INTO wp_area VALUES ('2024', '2011', '430482', '常宁市');
INSERT INTO wp_area VALUES ('2025', '1981', '430500', '邵阳市');
INSERT INTO wp_area VALUES ('2026', '2025', '430501', '市辖区');
INSERT INTO wp_area VALUES ('2027', '2025', '430502', '双清区');
INSERT INTO wp_area VALUES ('2028', '2025', '430503', '大祥区');
INSERT INTO wp_area VALUES ('2029', '2025', '430511', '北塔区');
INSERT INTO wp_area VALUES ('2030', '2025', '430521', '邵东县');
INSERT INTO wp_area VALUES ('2031', '2025', '430522', '新邵县');
INSERT INTO wp_area VALUES ('2032', '2025', '430523', '邵阳县');
INSERT INTO wp_area VALUES ('2033', '2025', '430524', '隆回县');
INSERT INTO wp_area VALUES ('2034', '2025', '430525', '洞口县');
INSERT INTO wp_area VALUES ('2035', '2025', '430527', '绥宁县');
INSERT INTO wp_area VALUES ('2036', '2025', '430528', '新宁县');
INSERT INTO wp_area VALUES ('2037', '2025', '430529', '城步苗族自治县');
INSERT INTO wp_area VALUES ('2038', '2025', '430581', '武冈市');
INSERT INTO wp_area VALUES ('2039', '1981', '430600', '岳阳市');
INSERT INTO wp_area VALUES ('2040', '2039', '430601', '市辖区');
INSERT INTO wp_area VALUES ('2041', '2039', '430602', '岳阳楼区');
INSERT INTO wp_area VALUES ('2042', '2039', '430603', '云溪区');
INSERT INTO wp_area VALUES ('2043', '2039', '430611', '君山区');
INSERT INTO wp_area VALUES ('2044', '2039', '430621', '岳阳县');
INSERT INTO wp_area VALUES ('2045', '2039', '430623', '华容县');
INSERT INTO wp_area VALUES ('2046', '2039', '430624', '湘阴县');
INSERT INTO wp_area VALUES ('2047', '2039', '430626', '平江县');
INSERT INTO wp_area VALUES ('2048', '2039', '430681', '汨罗市');
INSERT INTO wp_area VALUES ('2049', '2039', '430682', '临湘市');
INSERT INTO wp_area VALUES ('2050', '1981', '430700', '常德市');
INSERT INTO wp_area VALUES ('2051', '2050', '430701', '市辖区');
INSERT INTO wp_area VALUES ('2052', '2050', '430702', '武陵区');
INSERT INTO wp_area VALUES ('2053', '2050', '430703', '鼎城区');
INSERT INTO wp_area VALUES ('2054', '2050', '430721', '安乡县');
INSERT INTO wp_area VALUES ('2055', '2050', '430722', '汉寿县');
INSERT INTO wp_area VALUES ('2056', '2050', '430723', '澧县');
INSERT INTO wp_area VALUES ('2057', '2050', '430724', '临澧县');
INSERT INTO wp_area VALUES ('2058', '2050', '430725', '桃源县');
INSERT INTO wp_area VALUES ('2059', '2050', '430726', '石门县');
INSERT INTO wp_area VALUES ('2060', '2050', '430781', '津市市');
INSERT INTO wp_area VALUES ('2061', '1981', '430800', '张家界市');
INSERT INTO wp_area VALUES ('2062', '2061', '430801', '市辖区');
INSERT INTO wp_area VALUES ('2063', '2061', '430802', '永定区');
INSERT INTO wp_area VALUES ('2064', '2061', '430811', '武陵源区');
INSERT INTO wp_area VALUES ('2065', '2061', '430821', '慈利县');
INSERT INTO wp_area VALUES ('2066', '2061', '430822', '桑植县');
INSERT INTO wp_area VALUES ('2067', '1981', '430900', '益阳市');
INSERT INTO wp_area VALUES ('2068', '2067', '430901', '市辖区');
INSERT INTO wp_area VALUES ('2069', '2067', '430902', '资阳区');
INSERT INTO wp_area VALUES ('2070', '2067', '430903', '赫山区');
INSERT INTO wp_area VALUES ('2071', '2067', '430921', '南县');
INSERT INTO wp_area VALUES ('2072', '2067', '430922', '桃江县');
INSERT INTO wp_area VALUES ('2073', '2067', '430923', '安化县');
INSERT INTO wp_area VALUES ('2074', '2067', '430981', '沅江市');
INSERT INTO wp_area VALUES ('2075', '1981', '431000', '郴州市');
INSERT INTO wp_area VALUES ('2076', '2075', '431001', '市辖区');
INSERT INTO wp_area VALUES ('2077', '2075', '431002', '北湖区');
INSERT INTO wp_area VALUES ('2078', '2075', '431003', '苏仙区');
INSERT INTO wp_area VALUES ('2079', '2075', '431021', '桂阳县');
INSERT INTO wp_area VALUES ('2080', '2075', '431022', '宜章县');
INSERT INTO wp_area VALUES ('2081', '2075', '431023', '永兴县');
INSERT INTO wp_area VALUES ('2082', '2075', '431024', '嘉禾县');
INSERT INTO wp_area VALUES ('2083', '2075', '431025', '临武县');
INSERT INTO wp_area VALUES ('2084', '2075', '431026', '汝城县');
INSERT INTO wp_area VALUES ('2085', '2075', '431027', '桂东县');
INSERT INTO wp_area VALUES ('2086', '2075', '431028', '安仁县');
INSERT INTO wp_area VALUES ('2087', '2075', '431081', '资兴市');
INSERT INTO wp_area VALUES ('2088', '1981', '431100', '永州市');
INSERT INTO wp_area VALUES ('2089', '2088', '431101', '市辖区');
INSERT INTO wp_area VALUES ('2090', '2088', '431102', '零陵区');
INSERT INTO wp_area VALUES ('2091', '2088', '431103', '冷水滩区');
INSERT INTO wp_area VALUES ('2092', '2088', '431121', '祁阳县');
INSERT INTO wp_area VALUES ('2093', '2088', '431122', '东安县');
INSERT INTO wp_area VALUES ('2094', '2088', '431123', '双牌县');
INSERT INTO wp_area VALUES ('2095', '2088', '431124', '道县');
INSERT INTO wp_area VALUES ('2096', '2088', '431125', '江永县');
INSERT INTO wp_area VALUES ('2097', '2088', '431126', '宁远县');
INSERT INTO wp_area VALUES ('2098', '2088', '431127', '蓝山县');
INSERT INTO wp_area VALUES ('2099', '2088', '431128', '新田县');
INSERT INTO wp_area VALUES ('2100', '2088', '431129', '江华瑶族自治县');
INSERT INTO wp_area VALUES ('2101', '1981', '431200', '怀化市');
INSERT INTO wp_area VALUES ('2102', '2101', '431201', '市辖区');
INSERT INTO wp_area VALUES ('2103', '2101', '431202', '鹤城区');
INSERT INTO wp_area VALUES ('2104', '2101', '431221', '中方县');
INSERT INTO wp_area VALUES ('2105', '2101', '431222', '沅陵县');
INSERT INTO wp_area VALUES ('2106', '2101', '431223', '辰溪县');
INSERT INTO wp_area VALUES ('2107', '2101', '431224', '溆浦县');
INSERT INTO wp_area VALUES ('2108', '2101', '431225', '会同县');
INSERT INTO wp_area VALUES ('2109', '2101', '431226', '麻阳苗族自治县');
INSERT INTO wp_area VALUES ('2110', '2101', '431227', '新晃侗族自治县');
INSERT INTO wp_area VALUES ('2111', '2101', '431228', '芷江侗族自治县');
INSERT INTO wp_area VALUES ('2112', '2101', '431229', '靖州苗族侗族自治县');
INSERT INTO wp_area VALUES ('2113', '2101', '431230', '通道侗族自治县');
INSERT INTO wp_area VALUES ('2114', '2101', '431281', '洪江市');
INSERT INTO wp_area VALUES ('2115', '1981', '431300', '娄底市');
INSERT INTO wp_area VALUES ('2116', '2115', '431301', '市辖区');
INSERT INTO wp_area VALUES ('2117', '2115', '431302', '娄星区');
INSERT INTO wp_area VALUES ('2118', '2115', '431321', '双峰县');
INSERT INTO wp_area VALUES ('2119', '2115', '431322', '新化县');
INSERT INTO wp_area VALUES ('2120', '2115', '431381', '冷水江市');
INSERT INTO wp_area VALUES ('2121', '2115', '431382', '涟源市');
INSERT INTO wp_area VALUES ('2122', '1981', '433100', '湘西土家族苗族自治州');
INSERT INTO wp_area VALUES ('2123', '2122', '433101', '吉首市');
INSERT INTO wp_area VALUES ('2124', '2122', '433122', '泸溪县');
INSERT INTO wp_area VALUES ('2125', '2122', '433123', '凤凰县');
INSERT INTO wp_area VALUES ('2126', '2122', '433124', '花垣县');
INSERT INTO wp_area VALUES ('2127', '2122', '433125', '保靖县');
INSERT INTO wp_area VALUES ('2128', '2122', '433126', '古丈县');
INSERT INTO wp_area VALUES ('2129', '2122', '433127', '永顺县');
INSERT INTO wp_area VALUES ('2130', '2122', '433130', '龙山县');
INSERT INTO wp_area VALUES ('2131', '0', '440000', '广东省');
INSERT INTO wp_area VALUES ('2132', '2131', '440100', '广州市');
INSERT INTO wp_area VALUES ('2133', '2132', '440101', '市辖区');
INSERT INTO wp_area VALUES ('2134', '2132', '440103', '荔湾区');
INSERT INTO wp_area VALUES ('2135', '2132', '440104', '越秀区');
INSERT INTO wp_area VALUES ('2136', '2132', '440105', '海珠区');
INSERT INTO wp_area VALUES ('2137', '2132', '440106', '天河区');
INSERT INTO wp_area VALUES ('2138', '2132', '440111', '白云区');
INSERT INTO wp_area VALUES ('2139', '2132', '440112', '黄埔区');
INSERT INTO wp_area VALUES ('2140', '2132', '440113', '番禺区');
INSERT INTO wp_area VALUES ('2141', '2132', '440114', '花都区');
INSERT INTO wp_area VALUES ('2142', '2132', '440115', '南沙区');
INSERT INTO wp_area VALUES ('2143', '2132', '440116', '萝岗区');
INSERT INTO wp_area VALUES ('2144', '2132', '440117', '从化区');
INSERT INTO wp_area VALUES ('2145', '2132', '440118', '增城区');
INSERT INTO wp_area VALUES ('2146', '2131', '440200', '韶关市');
INSERT INTO wp_area VALUES ('2147', '2146', '440201', '市辖区');
INSERT INTO wp_area VALUES ('2148', '2146', '440203', '武江区');
INSERT INTO wp_area VALUES ('2149', '2146', '440204', '浈江区');
INSERT INTO wp_area VALUES ('2150', '2146', '440205', '曲江区');
INSERT INTO wp_area VALUES ('2151', '2146', '440222', '始兴县');
INSERT INTO wp_area VALUES ('2152', '2146', '440224', '仁化县');
INSERT INTO wp_area VALUES ('2153', '2146', '440229', '翁源县');
INSERT INTO wp_area VALUES ('2154', '2146', '440232', '乳源瑶族自治县');
INSERT INTO wp_area VALUES ('2155', '2146', '440233', '新丰县');
INSERT INTO wp_area VALUES ('2156', '2146', '440281', '乐昌市');
INSERT INTO wp_area VALUES ('2157', '2146', '440282', '南雄市');
INSERT INTO wp_area VALUES ('2158', '2131', '440300', '深圳市');
INSERT INTO wp_area VALUES ('2159', '2158', '440301', '市辖区');
INSERT INTO wp_area VALUES ('2160', '2158', '440303', '罗湖区');
INSERT INTO wp_area VALUES ('2161', '2158', '440304', '福田区');
INSERT INTO wp_area VALUES ('2162', '2158', '440305', '南山区');
INSERT INTO wp_area VALUES ('2163', '2158', '440306', '宝安区');
INSERT INTO wp_area VALUES ('2164', '2158', '440307', '龙岗区');
INSERT INTO wp_area VALUES ('2165', '2158', '440308', '盐田区');
INSERT INTO wp_area VALUES ('2166', '2131', '440400', '珠海市');
INSERT INTO wp_area VALUES ('2167', '2166', '440401', '市辖区');
INSERT INTO wp_area VALUES ('2168', '2166', '440402', '香洲区');
INSERT INTO wp_area VALUES ('2169', '2166', '440403', '斗门区');
INSERT INTO wp_area VALUES ('2170', '2166', '440404', '金湾区');
INSERT INTO wp_area VALUES ('2171', '2131', '440500', '汕头市');
INSERT INTO wp_area VALUES ('2172', '2171', '440501', '市辖区');
INSERT INTO wp_area VALUES ('2173', '2171', '440507', '龙湖区');
INSERT INTO wp_area VALUES ('2174', '2171', '440511', '金平区');
INSERT INTO wp_area VALUES ('2175', '2171', '440512', '濠江区');
INSERT INTO wp_area VALUES ('2176', '2171', '440513', '潮阳区');
INSERT INTO wp_area VALUES ('2177', '2171', '440514', '潮南区');
INSERT INTO wp_area VALUES ('2178', '2171', '440515', '澄海区');
INSERT INTO wp_area VALUES ('2179', '2171', '440523', '南澳县');
INSERT INTO wp_area VALUES ('2180', '2131', '440600', '佛山市');
INSERT INTO wp_area VALUES ('2181', '2180', '440601', '市辖区');
INSERT INTO wp_area VALUES ('2182', '2180', '440604', '禅城区');
INSERT INTO wp_area VALUES ('2183', '2180', '440605', '南海区');
INSERT INTO wp_area VALUES ('2184', '2180', '440606', '顺德区');
INSERT INTO wp_area VALUES ('2185', '2180', '440607', '三水区');
INSERT INTO wp_area VALUES ('2186', '2180', '440608', '高明区');
INSERT INTO wp_area VALUES ('2187', '2131', '440700', '江门市');
INSERT INTO wp_area VALUES ('2188', '2187', '440701', '市辖区');
INSERT INTO wp_area VALUES ('2189', '2187', '440703', '蓬江区');
INSERT INTO wp_area VALUES ('2190', '2187', '440704', '江海区');
INSERT INTO wp_area VALUES ('2191', '2187', '440705', '新会区');
INSERT INTO wp_area VALUES ('2192', '2187', '440781', '台山市');
INSERT INTO wp_area VALUES ('2193', '2187', '440783', '开平市');
INSERT INTO wp_area VALUES ('2194', '2187', '440784', '鹤山市');
INSERT INTO wp_area VALUES ('2195', '2187', '440785', '恩平市');
INSERT INTO wp_area VALUES ('2196', '2131', '440800', '湛江市');
INSERT INTO wp_area VALUES ('2197', '2196', '440801', '市辖区');
INSERT INTO wp_area VALUES ('2198', '2196', '440802', '赤坎区');
INSERT INTO wp_area VALUES ('2199', '2196', '440803', '霞山区');
INSERT INTO wp_area VALUES ('2200', '2196', '440804', '坡头区');
INSERT INTO wp_area VALUES ('2201', '2196', '440811', '麻章区');
INSERT INTO wp_area VALUES ('2202', '2196', '440823', '遂溪县');
INSERT INTO wp_area VALUES ('2203', '2196', '440825', '徐闻县');
INSERT INTO wp_area VALUES ('2204', '2196', '440881', '廉江市');
INSERT INTO wp_area VALUES ('2205', '2196', '440882', '雷州市');
INSERT INTO wp_area VALUES ('2206', '2196', '440883', '吴川市');
INSERT INTO wp_area VALUES ('2207', '2131', '440900', '茂名市');
INSERT INTO wp_area VALUES ('2208', '2207', '440901', '市辖区');
INSERT INTO wp_area VALUES ('2209', '2207', '440902', '茂南区');
INSERT INTO wp_area VALUES ('2210', '2207', '440904', '电白区');
INSERT INTO wp_area VALUES ('2211', '2207', '440981', '高州市');
INSERT INTO wp_area VALUES ('2212', '2207', '440982', '化州市');
INSERT INTO wp_area VALUES ('2213', '2207', '440983', '信宜市');
INSERT INTO wp_area VALUES ('2214', '2131', '441200', '肇庆市');
INSERT INTO wp_area VALUES ('2215', '2214', '441201', '市辖区');
INSERT INTO wp_area VALUES ('2216', '2214', '441202', '端州区');
INSERT INTO wp_area VALUES ('2217', '2214', '441203', '鼎湖区');
INSERT INTO wp_area VALUES ('2218', '2214', '441223', '广宁县');
INSERT INTO wp_area VALUES ('2219', '2214', '441224', '怀集县');
INSERT INTO wp_area VALUES ('2220', '2214', '441225', '封开县');
INSERT INTO wp_area VALUES ('2221', '2214', '441226', '德庆县');
INSERT INTO wp_area VALUES ('2222', '2214', '441283', '高要市');
INSERT INTO wp_area VALUES ('2223', '2214', '441284', '四会市');
INSERT INTO wp_area VALUES ('2224', '2131', '441300', '惠州市');
INSERT INTO wp_area VALUES ('2225', '2224', '441301', '市辖区');
INSERT INTO wp_area VALUES ('2226', '2224', '441302', '惠城区');
INSERT INTO wp_area VALUES ('2227', '2224', '441303', '惠阳区');
INSERT INTO wp_area VALUES ('2228', '2224', '441322', '博罗县');
INSERT INTO wp_area VALUES ('2229', '2224', '441323', '惠东县');
INSERT INTO wp_area VALUES ('2230', '2224', '441324', '龙门县');
INSERT INTO wp_area VALUES ('2231', '2131', '441400', '梅州市');
INSERT INTO wp_area VALUES ('2232', '2231', '441401', '市辖区');
INSERT INTO wp_area VALUES ('2233', '2231', '441402', '梅江区');
INSERT INTO wp_area VALUES ('2234', '2231', '441403', '梅县区');
INSERT INTO wp_area VALUES ('2235', '2231', '441422', '大埔县');
INSERT INTO wp_area VALUES ('2236', '2231', '441423', '丰顺县');
INSERT INTO wp_area VALUES ('2237', '2231', '441424', '五华县');
INSERT INTO wp_area VALUES ('2238', '2231', '441426', '平远县');
INSERT INTO wp_area VALUES ('2239', '2231', '441427', '蕉岭县');
INSERT INTO wp_area VALUES ('2240', '2231', '441481', '兴宁市');
INSERT INTO wp_area VALUES ('2241', '2131', '441500', '汕尾市');
INSERT INTO wp_area VALUES ('2242', '2241', '441501', '市辖区');
INSERT INTO wp_area VALUES ('2243', '2241', '441502', '城区');
INSERT INTO wp_area VALUES ('2244', '2241', '441521', '海丰县');
INSERT INTO wp_area VALUES ('2245', '2241', '441523', '陆河县');
INSERT INTO wp_area VALUES ('2246', '2241', '441581', '陆丰市');
INSERT INTO wp_area VALUES ('2247', '2131', '441600', '河源市');
INSERT INTO wp_area VALUES ('2248', '2247', '441601', '市辖区');
INSERT INTO wp_area VALUES ('2249', '2247', '441602', '源城区');
INSERT INTO wp_area VALUES ('2250', '2247', '441621', '紫金县');
INSERT INTO wp_area VALUES ('2251', '2247', '441622', '龙川县');
INSERT INTO wp_area VALUES ('2252', '2247', '441623', '连平县');
INSERT INTO wp_area VALUES ('2253', '2247', '441624', '和平县');
INSERT INTO wp_area VALUES ('2254', '2247', '441625', '东源县');
INSERT INTO wp_area VALUES ('2255', '2131', '441700', '阳江市');
INSERT INTO wp_area VALUES ('2256', '2255', '441701', '市辖区');
INSERT INTO wp_area VALUES ('2257', '2255', '441702', '江城区');
INSERT INTO wp_area VALUES ('2258', '2255', '441721', '阳西县');
INSERT INTO wp_area VALUES ('2259', '2255', '441723', '阳东县');
INSERT INTO wp_area VALUES ('2260', '2255', '441781', '阳春市');
INSERT INTO wp_area VALUES ('2261', '2131', '441800', '清远市');
INSERT INTO wp_area VALUES ('2262', '2261', '441801', '市辖区');
INSERT INTO wp_area VALUES ('2263', '2261', '441802', '清城区');
INSERT INTO wp_area VALUES ('2264', '2261', '441803', '清新区');
INSERT INTO wp_area VALUES ('2265', '2261', '441821', '佛冈县');
INSERT INTO wp_area VALUES ('2266', '2261', '441823', '阳山县');
INSERT INTO wp_area VALUES ('2267', '2261', '441825', '连山壮族瑶族自治县');
INSERT INTO wp_area VALUES ('2268', '2261', '441826', '连南瑶族自治县');
INSERT INTO wp_area VALUES ('2269', '2261', '441881', '英德市');
INSERT INTO wp_area VALUES ('2270', '2261', '441882', '连州市');
INSERT INTO wp_area VALUES ('2271', '2131', '441900', '东莞市');
INSERT INTO wp_area VALUES ('2272', '2131', '442000', '中山市');
INSERT INTO wp_area VALUES ('2273', '2131', '445100', '潮州市');
INSERT INTO wp_area VALUES ('2274', '2273', '445101', '市辖区');
INSERT INTO wp_area VALUES ('2275', '2273', '445102', '湘桥区');
INSERT INTO wp_area VALUES ('2276', '2273', '445103', '潮安区');
INSERT INTO wp_area VALUES ('2277', '2273', '445122', '饶平县');
INSERT INTO wp_area VALUES ('2278', '2131', '445200', '揭阳市');
INSERT INTO wp_area VALUES ('2279', '2278', '445201', '市辖区');
INSERT INTO wp_area VALUES ('2280', '2278', '445202', '榕城区');
INSERT INTO wp_area VALUES ('2281', '2278', '445203', '揭东区');
INSERT INTO wp_area VALUES ('2282', '2278', '445222', '揭西县');
INSERT INTO wp_area VALUES ('2283', '2278', '445224', '惠来县');
INSERT INTO wp_area VALUES ('2284', '2278', '445281', '普宁市');
INSERT INTO wp_area VALUES ('2285', '2131', '445300', '云浮市');
INSERT INTO wp_area VALUES ('2286', '2285', '445301', '市辖区');
INSERT INTO wp_area VALUES ('2287', '2285', '445302', '云城区');
INSERT INTO wp_area VALUES ('2288', '2285', '445303', '云安区');
INSERT INTO wp_area VALUES ('2289', '2285', '445321', '新兴县');
INSERT INTO wp_area VALUES ('2290', '2285', '445322', '郁南县');
INSERT INTO wp_area VALUES ('2291', '2285', '445381', '罗定市');
INSERT INTO wp_area VALUES ('2292', '0', '450000', '广西壮族自治区');
INSERT INTO wp_area VALUES ('2293', '2292', '450100', '南宁市');
INSERT INTO wp_area VALUES ('2294', '2293', '450101', '市辖区');
INSERT INTO wp_area VALUES ('2295', '2293', '450102', '兴宁区');
INSERT INTO wp_area VALUES ('2296', '2293', '450103', '青秀区');
INSERT INTO wp_area VALUES ('2297', '2293', '450105', '江南区');
INSERT INTO wp_area VALUES ('2298', '2293', '450107', '西乡塘区');
INSERT INTO wp_area VALUES ('2299', '2293', '450108', '良庆区');
INSERT INTO wp_area VALUES ('2300', '2293', '450109', '邕宁区');
INSERT INTO wp_area VALUES ('2301', '2293', '450122', '武鸣县');
INSERT INTO wp_area VALUES ('2302', '2293', '450123', '隆安县');
INSERT INTO wp_area VALUES ('2303', '2293', '450124', '马山县');
INSERT INTO wp_area VALUES ('2304', '2293', '450125', '上林县');
INSERT INTO wp_area VALUES ('2305', '2293', '450126', '宾阳县');
INSERT INTO wp_area VALUES ('2306', '2293', '450127', '横县');
INSERT INTO wp_area VALUES ('2307', '2292', '450200', '柳州市');
INSERT INTO wp_area VALUES ('2308', '2307', '450201', '市辖区');
INSERT INTO wp_area VALUES ('2309', '2307', '450202', '城中区');
INSERT INTO wp_area VALUES ('2310', '2307', '450203', '鱼峰区');
INSERT INTO wp_area VALUES ('2311', '2307', '450204', '柳南区');
INSERT INTO wp_area VALUES ('2312', '2307', '450205', '柳北区');
INSERT INTO wp_area VALUES ('2313', '2307', '450221', '柳江县');
INSERT INTO wp_area VALUES ('2314', '2307', '450222', '柳城县');
INSERT INTO wp_area VALUES ('2315', '2307', '450223', '鹿寨县');
INSERT INTO wp_area VALUES ('2316', '2307', '450224', '融安县');
INSERT INTO wp_area VALUES ('2317', '2307', '450225', '融水苗族自治县');
INSERT INTO wp_area VALUES ('2318', '2307', '450226', '三江侗族自治县');
INSERT INTO wp_area VALUES ('2319', '2292', '450300', '桂林市');
INSERT INTO wp_area VALUES ('2320', '2319', '450301', '市辖区');
INSERT INTO wp_area VALUES ('2321', '2319', '450302', '秀峰区');
INSERT INTO wp_area VALUES ('2322', '2319', '450303', '叠彩区');
INSERT INTO wp_area VALUES ('2323', '2319', '450304', '象山区');
INSERT INTO wp_area VALUES ('2324', '2319', '450305', '七星区');
INSERT INTO wp_area VALUES ('2325', '2319', '450311', '雁山区');
INSERT INTO wp_area VALUES ('2326', '2319', '450312', '临桂区');
INSERT INTO wp_area VALUES ('2327', '2319', '450321', '阳朔县');
INSERT INTO wp_area VALUES ('2328', '2319', '450323', '灵川县');
INSERT INTO wp_area VALUES ('2329', '2319', '450324', '全州县');
INSERT INTO wp_area VALUES ('2330', '2319', '450325', '兴安县');
INSERT INTO wp_area VALUES ('2331', '2319', '450326', '永福县');
INSERT INTO wp_area VALUES ('2332', '2319', '450327', '灌阳县');
INSERT INTO wp_area VALUES ('2333', '2319', '450328', '龙胜各族自治县');
INSERT INTO wp_area VALUES ('2334', '2319', '450329', '资源县');
INSERT INTO wp_area VALUES ('2335', '2319', '450330', '平乐县');
INSERT INTO wp_area VALUES ('2336', '2319', '450331', '荔浦县');
INSERT INTO wp_area VALUES ('2337', '2319', '450332', '恭城瑶族自治县');
INSERT INTO wp_area VALUES ('2338', '2292', '450400', '梧州市');
INSERT INTO wp_area VALUES ('2339', '2338', '450401', '市辖区');
INSERT INTO wp_area VALUES ('2340', '2338', '450403', '万秀区');
INSERT INTO wp_area VALUES ('2341', '2338', '450405', '长洲区');
INSERT INTO wp_area VALUES ('2342', '2338', '450406', '龙圩区');
INSERT INTO wp_area VALUES ('2343', '2338', '450421', '苍梧县');
INSERT INTO wp_area VALUES ('2344', '2338', '450422', '藤县');
INSERT INTO wp_area VALUES ('2345', '2338', '450423', '蒙山县');
INSERT INTO wp_area VALUES ('2346', '2338', '450481', '岑溪市');
INSERT INTO wp_area VALUES ('2347', '2292', '450500', '北海市');
INSERT INTO wp_area VALUES ('2348', '2347', '450501', '市辖区');
INSERT INTO wp_area VALUES ('2349', '2347', '450502', '海城区');
INSERT INTO wp_area VALUES ('2350', '2347', '450503', '银海区');
INSERT INTO wp_area VALUES ('2351', '2347', '450512', '铁山港区');
INSERT INTO wp_area VALUES ('2352', '2347', '450521', '合浦县');
INSERT INTO wp_area VALUES ('2353', '2292', '450600', '防城港市');
INSERT INTO wp_area VALUES ('2354', '2353', '450601', '市辖区');
INSERT INTO wp_area VALUES ('2355', '2353', '450602', '港口区');
INSERT INTO wp_area VALUES ('2356', '2353', '450603', '防城区');
INSERT INTO wp_area VALUES ('2357', '2353', '450621', '上思县');
INSERT INTO wp_area VALUES ('2358', '2353', '450681', '东兴市');
INSERT INTO wp_area VALUES ('2359', '2292', '450700', '钦州市');
INSERT INTO wp_area VALUES ('2360', '2359', '450701', '市辖区');
INSERT INTO wp_area VALUES ('2361', '2359', '450702', '钦南区');
INSERT INTO wp_area VALUES ('2362', '2359', '450703', '钦北区');
INSERT INTO wp_area VALUES ('2363', '2359', '450721', '灵山县');
INSERT INTO wp_area VALUES ('2364', '2359', '450722', '浦北县');
INSERT INTO wp_area VALUES ('2365', '2292', '450800', '贵港市');
INSERT INTO wp_area VALUES ('2366', '2365', '450801', '市辖区');
INSERT INTO wp_area VALUES ('2367', '2365', '450802', '港北区');
INSERT INTO wp_area VALUES ('2368', '2365', '450803', '港南区');
INSERT INTO wp_area VALUES ('2369', '2365', '450804', '覃塘区');
INSERT INTO wp_area VALUES ('2370', '2365', '450821', '平南县');
INSERT INTO wp_area VALUES ('2371', '2365', '450881', '桂平市');
INSERT INTO wp_area VALUES ('2372', '2292', '450900', '玉林市');
INSERT INTO wp_area VALUES ('2373', '2372', '450901', '市辖区');
INSERT INTO wp_area VALUES ('2374', '2372', '450902', '玉州区');
INSERT INTO wp_area VALUES ('2375', '2372', '450903', '福绵区');
INSERT INTO wp_area VALUES ('2376', '2372', '450921', '容县');
INSERT INTO wp_area VALUES ('2377', '2372', '450922', '陆川县');
INSERT INTO wp_area VALUES ('2378', '2372', '450923', '博白县');
INSERT INTO wp_area VALUES ('2379', '2372', '450924', '兴业县');
INSERT INTO wp_area VALUES ('2380', '2372', '450981', '北流市');
INSERT INTO wp_area VALUES ('2381', '2292', '451000', '百色市');
INSERT INTO wp_area VALUES ('2382', '2381', '451001', '市辖区');
INSERT INTO wp_area VALUES ('2383', '2381', '451002', '右江区');
INSERT INTO wp_area VALUES ('2384', '2381', '451021', '田阳县');
INSERT INTO wp_area VALUES ('2385', '2381', '451022', '田东县');
INSERT INTO wp_area VALUES ('2386', '2381', '451023', '平果县');
INSERT INTO wp_area VALUES ('2387', '2381', '451024', '德保县');
INSERT INTO wp_area VALUES ('2388', '2381', '451025', '靖西县');
INSERT INTO wp_area VALUES ('2389', '2381', '451026', '那坡县');
INSERT INTO wp_area VALUES ('2390', '2381', '451027', '凌云县');
INSERT INTO wp_area VALUES ('2391', '2381', '451028', '乐业县');
INSERT INTO wp_area VALUES ('2392', '2381', '451029', '田林县');
INSERT INTO wp_area VALUES ('2393', '2381', '451030', '西林县');
INSERT INTO wp_area VALUES ('2394', '2381', '451031', '隆林各族自治县');
INSERT INTO wp_area VALUES ('2395', '2292', '451100', '贺州市');
INSERT INTO wp_area VALUES ('2396', '2395', '451101', '市辖区');
INSERT INTO wp_area VALUES ('2397', '2395', '451102', '八步区');
INSERT INTO wp_area VALUES ('2398', '2395', '451121', '昭平县');
INSERT INTO wp_area VALUES ('2399', '2395', '451122', '钟山县');
INSERT INTO wp_area VALUES ('2400', '2395', '451123', '富川瑶族自治县');
INSERT INTO wp_area VALUES ('2401', '2292', '451200', '河池市');
INSERT INTO wp_area VALUES ('2402', '2401', '451201', '市辖区');
INSERT INTO wp_area VALUES ('2403', '2401', '451202', '金城江区');
INSERT INTO wp_area VALUES ('2404', '2401', '451221', '南丹县');
INSERT INTO wp_area VALUES ('2405', '2401', '451222', '天峨县');
INSERT INTO wp_area VALUES ('2406', '2401', '451223', '凤山县');
INSERT INTO wp_area VALUES ('2407', '2401', '451224', '东兰县');
INSERT INTO wp_area VALUES ('2408', '2401', '451225', '罗城仫佬族自治县');
INSERT INTO wp_area VALUES ('2409', '2401', '451226', '环江毛南族自治县');
INSERT INTO wp_area VALUES ('2410', '2401', '451227', '巴马瑶族自治县');
INSERT INTO wp_area VALUES ('2411', '2401', '451228', '都安瑶族自治县');
INSERT INTO wp_area VALUES ('2412', '2401', '451229', '大化瑶族自治县');
INSERT INTO wp_area VALUES ('2413', '2401', '451281', '宜州市');
INSERT INTO wp_area VALUES ('2414', '2292', '451300', '来宾市');
INSERT INTO wp_area VALUES ('2415', '2414', '451301', '市辖区');
INSERT INTO wp_area VALUES ('2416', '2414', '451302', '兴宾区');
INSERT INTO wp_area VALUES ('2417', '2414', '451321', '忻城县');
INSERT INTO wp_area VALUES ('2418', '2414', '451322', '象州县');
INSERT INTO wp_area VALUES ('2419', '2414', '451323', '武宣县');
INSERT INTO wp_area VALUES ('2420', '2414', '451324', '金秀瑶族自治县');
INSERT INTO wp_area VALUES ('2421', '2414', '451381', '合山市');
INSERT INTO wp_area VALUES ('2422', '2292', '451400', '崇左市');
INSERT INTO wp_area VALUES ('2423', '2422', '451401', '市辖区');
INSERT INTO wp_area VALUES ('2424', '2422', '451402', '江州区');
INSERT INTO wp_area VALUES ('2425', '2422', '451421', '扶绥县');
INSERT INTO wp_area VALUES ('2426', '2422', '451422', '宁明县');
INSERT INTO wp_area VALUES ('2427', '2422', '451423', '龙州县');
INSERT INTO wp_area VALUES ('2428', '2422', '451424', '大新县');
INSERT INTO wp_area VALUES ('2429', '2422', '451425', '天等县');
INSERT INTO wp_area VALUES ('2430', '2422', '451481', '凭祥市');
INSERT INTO wp_area VALUES ('2431', '0', '460000', '海南省');
INSERT INTO wp_area VALUES ('2432', '2431', '460100', '海口市');
INSERT INTO wp_area VALUES ('2433', '2432', '460101', '市辖区');
INSERT INTO wp_area VALUES ('2434', '2432', '460105', '秀英区');
INSERT INTO wp_area VALUES ('2435', '2432', '460106', '龙华区');
INSERT INTO wp_area VALUES ('2436', '2432', '460107', '琼山区');
INSERT INTO wp_area VALUES ('2437', '2432', '460108', '美兰区');
INSERT INTO wp_area VALUES ('2438', '2431', '460200', '三亚市');
INSERT INTO wp_area VALUES ('2439', '2438', '460201', '市辖区');
INSERT INTO wp_area VALUES ('2440', '2438', '460202', '海棠区');
INSERT INTO wp_area VALUES ('2441', '2438', '460203', '吉阳区');
INSERT INTO wp_area VALUES ('2442', '2438', '460204', '天涯区');
INSERT INTO wp_area VALUES ('2443', '2438', '460205', '崖州区');
INSERT INTO wp_area VALUES ('2444', '2431', '460300', '三沙市');
INSERT INTO wp_area VALUES ('2445', '2431', '469000', '省直辖县级行政区划');
INSERT INTO wp_area VALUES ('2446', '2445', '469001', '五指山市');
INSERT INTO wp_area VALUES ('2447', '2445', '469002', '琼海市');
INSERT INTO wp_area VALUES ('2448', '2445', '469003', '儋州市');
INSERT INTO wp_area VALUES ('2449', '2445', '469005', '文昌市');
INSERT INTO wp_area VALUES ('2450', '2445', '469006', '万宁市');
INSERT INTO wp_area VALUES ('2451', '2445', '469007', '东方市');
INSERT INTO wp_area VALUES ('2452', '2445', '469021', '定安县');
INSERT INTO wp_area VALUES ('2453', '2445', '469022', '屯昌县');
INSERT INTO wp_area VALUES ('2454', '2445', '469023', '澄迈县');
INSERT INTO wp_area VALUES ('2455', '2445', '469024', '临高县');
INSERT INTO wp_area VALUES ('2456', '2445', '469025', '白沙黎族自治县');
INSERT INTO wp_area VALUES ('2457', '2445', '469026', '昌江黎族自治县');
INSERT INTO wp_area VALUES ('2458', '2445', '469027', '乐东黎族自治县');
INSERT INTO wp_area VALUES ('2459', '2445', '469028', '陵水黎族自治县');
INSERT INTO wp_area VALUES ('2460', '2445', '469029', '保亭黎族苗族自治县');
INSERT INTO wp_area VALUES ('2461', '2445', '469030', '琼中黎族苗族自治县');
INSERT INTO wp_area VALUES ('2462', '0', '500000', '重庆市');
INSERT INTO wp_area VALUES ('2463', '2462', '500100', '市辖区');
INSERT INTO wp_area VALUES ('2464', '2463', '500101', '万州区');
INSERT INTO wp_area VALUES ('2465', '2463', '500102', '涪陵区');
INSERT INTO wp_area VALUES ('2466', '2463', '500103', '渝中区');
INSERT INTO wp_area VALUES ('2467', '2463', '500104', '大渡口区');
INSERT INTO wp_area VALUES ('2468', '2463', '500105', '江北区');
INSERT INTO wp_area VALUES ('2469', '2463', '500106', '沙坪坝区');
INSERT INTO wp_area VALUES ('2470', '2463', '500107', '九龙坡区');
INSERT INTO wp_area VALUES ('2471', '2463', '500108', '南岸区');
INSERT INTO wp_area VALUES ('2472', '2463', '500109', '北碚区');
INSERT INTO wp_area VALUES ('2473', '2463', '500110', '綦江区');
INSERT INTO wp_area VALUES ('2474', '2463', '500111', '大足区');
INSERT INTO wp_area VALUES ('2475', '2463', '500112', '渝北区');
INSERT INTO wp_area VALUES ('2476', '2463', '500113', '巴南区');
INSERT INTO wp_area VALUES ('2477', '2463', '500114', '黔江区');
INSERT INTO wp_area VALUES ('2478', '2463', '500115', '长寿区');
INSERT INTO wp_area VALUES ('2479', '2463', '500116', '江津区');
INSERT INTO wp_area VALUES ('2480', '2463', '500117', '合川区');
INSERT INTO wp_area VALUES ('2481', '2463', '500118', '永川区');
INSERT INTO wp_area VALUES ('2482', '2463', '500119', '南川区');
INSERT INTO wp_area VALUES ('2483', '2463', '500120', '璧山区');
INSERT INTO wp_area VALUES ('2484', '2463', '500151', '铜梁区');
INSERT INTO wp_area VALUES ('2485', '2462', '500200', '县');
INSERT INTO wp_area VALUES ('2486', '2485', '500223', '潼南县');
INSERT INTO wp_area VALUES ('2487', '2485', '500226', '荣昌县');
INSERT INTO wp_area VALUES ('2488', '2485', '500228', '梁平县');
INSERT INTO wp_area VALUES ('2489', '2485', '500229', '城口县');
INSERT INTO wp_area VALUES ('2490', '2485', '500230', '丰都县');
INSERT INTO wp_area VALUES ('2491', '2485', '500231', '垫江县');
INSERT INTO wp_area VALUES ('2492', '2485', '500232', '武隆县');
INSERT INTO wp_area VALUES ('2493', '2485', '500233', '忠县');
INSERT INTO wp_area VALUES ('2494', '2485', '500234', '开县');
INSERT INTO wp_area VALUES ('2495', '2485', '500235', '云阳县');
INSERT INTO wp_area VALUES ('2496', '2485', '500236', '奉节县');
INSERT INTO wp_area VALUES ('2497', '2485', '500237', '巫山县');
INSERT INTO wp_area VALUES ('2498', '2485', '500238', '巫溪县');
INSERT INTO wp_area VALUES ('2499', '2485', '500240', '石柱土家族自治县');
INSERT INTO wp_area VALUES ('2500', '2485', '500241', '秀山土家族苗族自治县');
INSERT INTO wp_area VALUES ('2501', '2485', '500242', '酉阳土家族苗族自治县');
INSERT INTO wp_area VALUES ('2502', '2485', '500243', '彭水苗族土家族自治县');
INSERT INTO wp_area VALUES ('2503', '0', '510000', '四川省');
INSERT INTO wp_area VALUES ('2504', '2503', '510100', '成都市');
INSERT INTO wp_area VALUES ('2505', '2504', '510101', '市辖区');
INSERT INTO wp_area VALUES ('2506', '2504', '510104', '锦江区');
INSERT INTO wp_area VALUES ('2507', '2504', '510105', '青羊区');
INSERT INTO wp_area VALUES ('2508', '2504', '510106', '金牛区');
INSERT INTO wp_area VALUES ('2509', '2504', '510107', '武侯区');
INSERT INTO wp_area VALUES ('2510', '2504', '510108', '成华区');
INSERT INTO wp_area VALUES ('2511', '2504', '510112', '龙泉驿区');
INSERT INTO wp_area VALUES ('2512', '2504', '510113', '青白江区');
INSERT INTO wp_area VALUES ('2513', '2504', '510114', '新都区');
INSERT INTO wp_area VALUES ('2514', '2504', '510115', '温江区');
INSERT INTO wp_area VALUES ('2515', '2504', '510121', '金堂县');
INSERT INTO wp_area VALUES ('2516', '2504', '510122', '双流县');
INSERT INTO wp_area VALUES ('2517', '2504', '510124', '郫县');
INSERT INTO wp_area VALUES ('2518', '2504', '510129', '大邑县');
INSERT INTO wp_area VALUES ('2519', '2504', '510131', '蒲江县');
INSERT INTO wp_area VALUES ('2520', '2504', '510132', '新津县');
INSERT INTO wp_area VALUES ('2521', '2504', '510181', '都江堰市');
INSERT INTO wp_area VALUES ('2522', '2504', '510182', '彭州市');
INSERT INTO wp_area VALUES ('2523', '2504', '510183', '邛崃市');
INSERT INTO wp_area VALUES ('2524', '2504', '510184', '崇州市');
INSERT INTO wp_area VALUES ('2525', '2503', '510300', '自贡市');
INSERT INTO wp_area VALUES ('2526', '2525', '510301', '市辖区');
INSERT INTO wp_area VALUES ('2527', '2525', '510302', '自流井区');
INSERT INTO wp_area VALUES ('2528', '2525', '510303', '贡井区');
INSERT INTO wp_area VALUES ('2529', '2525', '510304', '大安区');
INSERT INTO wp_area VALUES ('2530', '2525', '510311', '沿滩区');
INSERT INTO wp_area VALUES ('2531', '2525', '510321', '荣县');
INSERT INTO wp_area VALUES ('2532', '2525', '510322', '富顺县');
INSERT INTO wp_area VALUES ('2533', '2503', '510400', '攀枝花市');
INSERT INTO wp_area VALUES ('2534', '2533', '510401', '市辖区');
INSERT INTO wp_area VALUES ('2535', '2533', '510402', '东区');
INSERT INTO wp_area VALUES ('2536', '2533', '510403', '西区');
INSERT INTO wp_area VALUES ('2537', '2533', '510411', '仁和区');
INSERT INTO wp_area VALUES ('2538', '2533', '510421', '米易县');
INSERT INTO wp_area VALUES ('2539', '2533', '510422', '盐边县');
INSERT INTO wp_area VALUES ('2540', '2503', '510500', '泸州市');
INSERT INTO wp_area VALUES ('2541', '2540', '510501', '市辖区');
INSERT INTO wp_area VALUES ('2542', '2540', '510502', '江阳区');
INSERT INTO wp_area VALUES ('2543', '2540', '510503', '纳溪区');
INSERT INTO wp_area VALUES ('2544', '2540', '510504', '龙马潭区');
INSERT INTO wp_area VALUES ('2545', '2540', '510521', '泸县');
INSERT INTO wp_area VALUES ('2546', '2540', '510522', '合江县');
INSERT INTO wp_area VALUES ('2547', '2540', '510524', '叙永县');
INSERT INTO wp_area VALUES ('2548', '2540', '510525', '古蔺县');
INSERT INTO wp_area VALUES ('2549', '2503', '510600', '德阳市');
INSERT INTO wp_area VALUES ('2550', '2549', '510601', '市辖区');
INSERT INTO wp_area VALUES ('2551', '2549', '510603', '旌阳区');
INSERT INTO wp_area VALUES ('2552', '2549', '510623', '中江县');
INSERT INTO wp_area VALUES ('2553', '2549', '510626', '罗江县');
INSERT INTO wp_area VALUES ('2554', '2549', '510681', '广汉市');
INSERT INTO wp_area VALUES ('2555', '2549', '510682', '什邡市');
INSERT INTO wp_area VALUES ('2556', '2549', '510683', '绵竹市');
INSERT INTO wp_area VALUES ('2557', '2503', '510700', '绵阳市');
INSERT INTO wp_area VALUES ('2558', '2557', '510701', '市辖区');
INSERT INTO wp_area VALUES ('2559', '2557', '510703', '涪城区');
INSERT INTO wp_area VALUES ('2560', '2557', '510704', '游仙区');
INSERT INTO wp_area VALUES ('2561', '2557', '510722', '三台县');
INSERT INTO wp_area VALUES ('2562', '2557', '510723', '盐亭县');
INSERT INTO wp_area VALUES ('2563', '2557', '510724', '安县');
INSERT INTO wp_area VALUES ('2564', '2557', '510725', '梓潼县');
INSERT INTO wp_area VALUES ('2565', '2557', '510726', '北川羌族自治县');
INSERT INTO wp_area VALUES ('2566', '2557', '510727', '平武县');
INSERT INTO wp_area VALUES ('2567', '2557', '510781', '江油市');
INSERT INTO wp_area VALUES ('2568', '2503', '510800', '广元市');
INSERT INTO wp_area VALUES ('2569', '2568', '510801', '市辖区');
INSERT INTO wp_area VALUES ('2570', '2568', '510802', '利州区');
INSERT INTO wp_area VALUES ('2571', '2568', '510811', '昭化区');
INSERT INTO wp_area VALUES ('2572', '2568', '510812', '朝天区');
INSERT INTO wp_area VALUES ('2573', '2568', '510821', '旺苍县');
INSERT INTO wp_area VALUES ('2574', '2568', '510822', '青川县');
INSERT INTO wp_area VALUES ('2575', '2568', '510823', '剑阁县');
INSERT INTO wp_area VALUES ('2576', '2568', '510824', '苍溪县');
INSERT INTO wp_area VALUES ('2577', '2503', '510900', '遂宁市');
INSERT INTO wp_area VALUES ('2578', '2577', '510901', '市辖区');
INSERT INTO wp_area VALUES ('2579', '2577', '510903', '船山区');
INSERT INTO wp_area VALUES ('2580', '2577', '510904', '安居区');
INSERT INTO wp_area VALUES ('2581', '2577', '510921', '蓬溪县');
INSERT INTO wp_area VALUES ('2582', '2577', '510922', '射洪县');
INSERT INTO wp_area VALUES ('2583', '2577', '510923', '大英县');
INSERT INTO wp_area VALUES ('2584', '2503', '511000', '内江市');
INSERT INTO wp_area VALUES ('2585', '2584', '511001', '市辖区');
INSERT INTO wp_area VALUES ('2586', '2584', '511002', '市中区');
INSERT INTO wp_area VALUES ('2587', '2584', '511011', '东兴区');
INSERT INTO wp_area VALUES ('2588', '2584', '511024', '威远县');
INSERT INTO wp_area VALUES ('2589', '2584', '511025', '资中县');
INSERT INTO wp_area VALUES ('2590', '2584', '511028', '隆昌县');
INSERT INTO wp_area VALUES ('2591', '2503', '511100', '乐山市');
INSERT INTO wp_area VALUES ('2592', '2591', '511101', '市辖区');
INSERT INTO wp_area VALUES ('2593', '2591', '511102', '市中区');
INSERT INTO wp_area VALUES ('2594', '2591', '511111', '沙湾区');
INSERT INTO wp_area VALUES ('2595', '2591', '511112', '五通桥区');
INSERT INTO wp_area VALUES ('2596', '2591', '511113', '金口河区');
INSERT INTO wp_area VALUES ('2597', '2591', '511123', '犍为县');
INSERT INTO wp_area VALUES ('2598', '2591', '511124', '井研县');
INSERT INTO wp_area VALUES ('2599', '2591', '511126', '夹江县');
INSERT INTO wp_area VALUES ('2600', '2591', '511129', '沐川县');
INSERT INTO wp_area VALUES ('2601', '2591', '511132', '峨边彝族自治县');
INSERT INTO wp_area VALUES ('2602', '2591', '511133', '马边彝族自治县');
INSERT INTO wp_area VALUES ('2603', '2591', '511181', '峨眉山市');
INSERT INTO wp_area VALUES ('2604', '2503', '511300', '南充市');
INSERT INTO wp_area VALUES ('2605', '2604', '511301', '市辖区');
INSERT INTO wp_area VALUES ('2606', '2604', '511302', '顺庆区');
INSERT INTO wp_area VALUES ('2607', '2604', '511303', '高坪区');
INSERT INTO wp_area VALUES ('2608', '2604', '511304', '嘉陵区');
INSERT INTO wp_area VALUES ('2609', '2604', '511321', '南部县');
INSERT INTO wp_area VALUES ('2610', '2604', '511322', '营山县');
INSERT INTO wp_area VALUES ('2611', '2604', '511323', '蓬安县');
INSERT INTO wp_area VALUES ('2612', '2604', '511324', '仪陇县');
INSERT INTO wp_area VALUES ('2613', '2604', '511325', '西充县');
INSERT INTO wp_area VALUES ('2614', '2604', '511381', '阆中市');
INSERT INTO wp_area VALUES ('2615', '2503', '511400', '眉山市');
INSERT INTO wp_area VALUES ('2616', '2615', '511401', '市辖区');
INSERT INTO wp_area VALUES ('2617', '2615', '511402', '东坡区');
INSERT INTO wp_area VALUES ('2618', '2615', '511421', '仁寿县');
INSERT INTO wp_area VALUES ('2619', '2615', '511422', '彭山县');
INSERT INTO wp_area VALUES ('2620', '2615', '511423', '洪雅县');
INSERT INTO wp_area VALUES ('2621', '2615', '511424', '丹棱县');
INSERT INTO wp_area VALUES ('2622', '2615', '511425', '青神县');
INSERT INTO wp_area VALUES ('2623', '2503', '511500', '宜宾市');
INSERT INTO wp_area VALUES ('2624', '2623', '511501', '市辖区');
INSERT INTO wp_area VALUES ('2625', '2623', '511502', '翠屏区');
INSERT INTO wp_area VALUES ('2626', '2623', '511503', '南溪区');
INSERT INTO wp_area VALUES ('2627', '2623', '511521', '宜宾县');
INSERT INTO wp_area VALUES ('2628', '2623', '511523', '江安县');
INSERT INTO wp_area VALUES ('2629', '2623', '511524', '长宁县');
INSERT INTO wp_area VALUES ('2630', '2623', '511525', '高县');
INSERT INTO wp_area VALUES ('2631', '2623', '511526', '珙县');
INSERT INTO wp_area VALUES ('2632', '2623', '511527', '筠连县');
INSERT INTO wp_area VALUES ('2633', '2623', '511528', '兴文县');
INSERT INTO wp_area VALUES ('2634', '2623', '511529', '屏山县');
INSERT INTO wp_area VALUES ('2635', '2503', '511600', '广安市');
INSERT INTO wp_area VALUES ('2636', '2635', '511601', '市辖区');
INSERT INTO wp_area VALUES ('2637', '2635', '511602', '广安区');
INSERT INTO wp_area VALUES ('2638', '2635', '511603', '前锋区');
INSERT INTO wp_area VALUES ('2639', '2635', '511621', '岳池县');
INSERT INTO wp_area VALUES ('2640', '2635', '511622', '武胜县');
INSERT INTO wp_area VALUES ('2641', '2635', '511623', '邻水县');
INSERT INTO wp_area VALUES ('2642', '2635', '511681', '华蓥市');
INSERT INTO wp_area VALUES ('2643', '2503', '511700', '达州市');
INSERT INTO wp_area VALUES ('2644', '2643', '511701', '市辖区');
INSERT INTO wp_area VALUES ('2645', '2643', '511702', '通川区');
INSERT INTO wp_area VALUES ('2646', '2643', '511703', '达川区');
INSERT INTO wp_area VALUES ('2647', '2643', '511722', '宣汉县');
INSERT INTO wp_area VALUES ('2648', '2643', '511723', '开江县');
INSERT INTO wp_area VALUES ('2649', '2643', '511724', '大竹县');
INSERT INTO wp_area VALUES ('2650', '2643', '511725', '渠县');
INSERT INTO wp_area VALUES ('2651', '2643', '511781', '万源市');
INSERT INTO wp_area VALUES ('2652', '2503', '511800', '雅安市');
INSERT INTO wp_area VALUES ('2653', '2652', '511801', '市辖区');
INSERT INTO wp_area VALUES ('2654', '2652', '511802', '雨城区');
INSERT INTO wp_area VALUES ('2655', '2652', '511803', '名山区');
INSERT INTO wp_area VALUES ('2656', '2652', '511822', '荥经县');
INSERT INTO wp_area VALUES ('2657', '2652', '511823', '汉源县');
INSERT INTO wp_area VALUES ('2658', '2652', '511824', '石棉县');
INSERT INTO wp_area VALUES ('2659', '2652', '511825', '天全县');
INSERT INTO wp_area VALUES ('2660', '2652', '511826', '芦山县');
INSERT INTO wp_area VALUES ('2661', '2652', '511827', '宝兴县');
INSERT INTO wp_area VALUES ('2662', '2503', '511900', '巴中市');
INSERT INTO wp_area VALUES ('2663', '2662', '511901', '市辖区');
INSERT INTO wp_area VALUES ('2664', '2662', '511902', '巴州区');
INSERT INTO wp_area VALUES ('2665', '2662', '511903', '恩阳区');
INSERT INTO wp_area VALUES ('2666', '2662', '511921', '通江县');
INSERT INTO wp_area VALUES ('2667', '2662', '511922', '南江县');
INSERT INTO wp_area VALUES ('2668', '2662', '511923', '平昌县');
INSERT INTO wp_area VALUES ('2669', '2503', '512000', '资阳市');
INSERT INTO wp_area VALUES ('2670', '2669', '512001', '市辖区');
INSERT INTO wp_area VALUES ('2671', '2669', '512002', '雁江区');
INSERT INTO wp_area VALUES ('2672', '2669', '512021', '安岳县');
INSERT INTO wp_area VALUES ('2673', '2669', '512022', '乐至县');
INSERT INTO wp_area VALUES ('2674', '2669', '512081', '简阳市');
INSERT INTO wp_area VALUES ('2675', '2503', '513200', '阿坝藏族羌族自治州');
INSERT INTO wp_area VALUES ('2676', '2675', '513221', '汶川县');
INSERT INTO wp_area VALUES ('2677', '2675', '513222', '理县');
INSERT INTO wp_area VALUES ('2678', '2675', '513223', '茂县');
INSERT INTO wp_area VALUES ('2679', '2675', '513224', '松潘县');
INSERT INTO wp_area VALUES ('2680', '2675', '513225', '九寨沟县');
INSERT INTO wp_area VALUES ('2681', '2675', '513226', '金川县');
INSERT INTO wp_area VALUES ('2682', '2675', '513227', '小金县');
INSERT INTO wp_area VALUES ('2683', '2675', '513228', '黑水县');
INSERT INTO wp_area VALUES ('2684', '2675', '513229', '马尔康县');
INSERT INTO wp_area VALUES ('2685', '2675', '513230', '壤塘县');
INSERT INTO wp_area VALUES ('2686', '2675', '513231', '阿坝县');
INSERT INTO wp_area VALUES ('2687', '2675', '513232', '若尔盖县');
INSERT INTO wp_area VALUES ('2688', '2675', '513233', '红原县');
INSERT INTO wp_area VALUES ('2689', '2503', '513300', '甘孜藏族自治州');
INSERT INTO wp_area VALUES ('2690', '2689', '513321', '康定县');
INSERT INTO wp_area VALUES ('2691', '2689', '513322', '泸定县');
INSERT INTO wp_area VALUES ('2692', '2689', '513323', '丹巴县');
INSERT INTO wp_area VALUES ('2693', '2689', '513324', '九龙县');
INSERT INTO wp_area VALUES ('2694', '2689', '513325', '雅江县');
INSERT INTO wp_area VALUES ('2695', '2689', '513326', '道孚县');
INSERT INTO wp_area VALUES ('2696', '2689', '513327', '炉霍县');
INSERT INTO wp_area VALUES ('2697', '2689', '513328', '甘孜县');
INSERT INTO wp_area VALUES ('2698', '2689', '513329', '新龙县');
INSERT INTO wp_area VALUES ('2699', '2689', '513330', '德格县');
INSERT INTO wp_area VALUES ('2700', '2689', '513331', '白玉县');
INSERT INTO wp_area VALUES ('2701', '2689', '513332', '石渠县');
INSERT INTO wp_area VALUES ('2702', '2689', '513333', '色达县');
INSERT INTO wp_area VALUES ('2703', '2689', '513334', '理塘县');
INSERT INTO wp_area VALUES ('2704', '2689', '513335', '巴塘县');
INSERT INTO wp_area VALUES ('2705', '2689', '513336', '乡城县');
INSERT INTO wp_area VALUES ('2706', '2689', '513337', '稻城县');
INSERT INTO wp_area VALUES ('2707', '2689', '513338', '得荣县');
INSERT INTO wp_area VALUES ('2708', '2503', '513400', '凉山彝族自治州');
INSERT INTO wp_area VALUES ('2709', '2708', '513401', '西昌市');
INSERT INTO wp_area VALUES ('2710', '2708', '513422', '木里藏族自治县');
INSERT INTO wp_area VALUES ('2711', '2708', '513423', '盐源县');
INSERT INTO wp_area VALUES ('2712', '2708', '513424', '德昌县');
INSERT INTO wp_area VALUES ('2713', '2708', '513425', '会理县');
INSERT INTO wp_area VALUES ('2714', '2708', '513426', '会东县');
INSERT INTO wp_area VALUES ('2715', '2708', '513427', '宁南县');
INSERT INTO wp_area VALUES ('2716', '2708', '513428', '普格县');
INSERT INTO wp_area VALUES ('2717', '2708', '513429', '布拖县');
INSERT INTO wp_area VALUES ('2718', '2708', '513430', '金阳县');
INSERT INTO wp_area VALUES ('2719', '2708', '513431', '昭觉县');
INSERT INTO wp_area VALUES ('2720', '2708', '513432', '喜德县');
INSERT INTO wp_area VALUES ('2721', '2708', '513433', '冕宁县');
INSERT INTO wp_area VALUES ('2722', '2708', '513434', '越西县');
INSERT INTO wp_area VALUES ('2723', '2708', '513435', '甘洛县');
INSERT INTO wp_area VALUES ('2724', '2708', '513436', '美姑县');
INSERT INTO wp_area VALUES ('2725', '2708', '513437', '雷波县');
INSERT INTO wp_area VALUES ('2726', '0', '520000', '贵州省');
INSERT INTO wp_area VALUES ('2727', '2726', '520100', '贵阳市');
INSERT INTO wp_area VALUES ('2728', '2727', '520101', '市辖区');
INSERT INTO wp_area VALUES ('2729', '2727', '520102', '南明区');
INSERT INTO wp_area VALUES ('2730', '2727', '520103', '云岩区');
INSERT INTO wp_area VALUES ('2731', '2727', '520111', '花溪区');
INSERT INTO wp_area VALUES ('2732', '2727', '520112', '乌当区');
INSERT INTO wp_area VALUES ('2733', '2727', '520113', '白云区');
INSERT INTO wp_area VALUES ('2734', '2727', '520115', '观山湖区');
INSERT INTO wp_area VALUES ('2735', '2727', '520121', '开阳县');
INSERT INTO wp_area VALUES ('2736', '2727', '520122', '息烽县');
INSERT INTO wp_area VALUES ('2737', '2727', '520123', '修文县');
INSERT INTO wp_area VALUES ('2738', '2727', '520181', '清镇市');
INSERT INTO wp_area VALUES ('2739', '2726', '520200', '六盘水市');
INSERT INTO wp_area VALUES ('2740', '2739', '520201', '钟山区');
INSERT INTO wp_area VALUES ('2741', '2739', '520203', '六枝特区');
INSERT INTO wp_area VALUES ('2742', '2739', '520221', '水城县');
INSERT INTO wp_area VALUES ('2743', '2739', '520222', '盘县');
INSERT INTO wp_area VALUES ('2744', '2726', '520300', '遵义市');
INSERT INTO wp_area VALUES ('2745', '2744', '520301', '市辖区');
INSERT INTO wp_area VALUES ('2746', '2744', '520302', '红花岗区');
INSERT INTO wp_area VALUES ('2747', '2744', '520303', '汇川区');
INSERT INTO wp_area VALUES ('2748', '2744', '520321', '遵义县');
INSERT INTO wp_area VALUES ('2749', '2744', '520322', '桐梓县');
INSERT INTO wp_area VALUES ('2750', '2744', '520323', '绥阳县');
INSERT INTO wp_area VALUES ('2751', '2744', '520324', '正安县');
INSERT INTO wp_area VALUES ('2752', '2744', '520325', '道真仡佬族苗族自治县');
INSERT INTO wp_area VALUES ('2753', '2744', '520326', '务川仡佬族苗族自治县');
INSERT INTO wp_area VALUES ('2754', '2744', '520327', '凤冈县');
INSERT INTO wp_area VALUES ('2755', '2744', '520328', '湄潭县');
INSERT INTO wp_area VALUES ('2756', '2744', '520329', '余庆县');
INSERT INTO wp_area VALUES ('2757', '2744', '520330', '习水县');
INSERT INTO wp_area VALUES ('2758', '2744', '520381', '赤水市');
INSERT INTO wp_area VALUES ('2759', '2744', '520382', '仁怀市');
INSERT INTO wp_area VALUES ('2760', '2726', '520400', '安顺市');
INSERT INTO wp_area VALUES ('2761', '2760', '520401', '市辖区');
INSERT INTO wp_area VALUES ('2762', '2760', '520402', '西秀区');
INSERT INTO wp_area VALUES ('2763', '2760', '520421', '平坝县');
INSERT INTO wp_area VALUES ('2764', '2760', '520422', '普定县');
INSERT INTO wp_area VALUES ('2765', '2760', '520423', '镇宁布依族苗族自治县');
INSERT INTO wp_area VALUES ('2766', '2760', '520424', '关岭布依族苗族自治县');
INSERT INTO wp_area VALUES ('2767', '2760', '520425', '紫云苗族布依族自治县');
INSERT INTO wp_area VALUES ('2768', '2726', '520500', '毕节市');
INSERT INTO wp_area VALUES ('2769', '2768', '520501', '市辖区');
INSERT INTO wp_area VALUES ('2770', '2768', '520502', '七星关区');
INSERT INTO wp_area VALUES ('2771', '2768', '520521', '大方县');
INSERT INTO wp_area VALUES ('2772', '2768', '520522', '黔西县');
INSERT INTO wp_area VALUES ('2773', '2768', '520523', '金沙县');
INSERT INTO wp_area VALUES ('2774', '2768', '520524', '织金县');
INSERT INTO wp_area VALUES ('2775', '2768', '520525', '纳雍县');
INSERT INTO wp_area VALUES ('2776', '2768', '520526', '威宁彝族回族苗族自治县');
INSERT INTO wp_area VALUES ('2777', '2768', '520527', '赫章县');
INSERT INTO wp_area VALUES ('2778', '2726', '520600', '铜仁市');
INSERT INTO wp_area VALUES ('2779', '2778', '520601', '市辖区');
INSERT INTO wp_area VALUES ('2780', '2778', '520602', '碧江区');
INSERT INTO wp_area VALUES ('2781', '2778', '520603', '万山区');
INSERT INTO wp_area VALUES ('2782', '2778', '520621', '江口县');
INSERT INTO wp_area VALUES ('2783', '2778', '520622', '玉屏侗族自治县');
INSERT INTO wp_area VALUES ('2784', '2778', '520623', '石阡县');
INSERT INTO wp_area VALUES ('2785', '2778', '520624', '思南县');
INSERT INTO wp_area VALUES ('2786', '2778', '520625', '印江土家族苗族自治县');
INSERT INTO wp_area VALUES ('2787', '2778', '520626', '德江县');
INSERT INTO wp_area VALUES ('2788', '2778', '520627', '沿河土家族自治县');
INSERT INTO wp_area VALUES ('2789', '2778', '520628', '松桃苗族自治县');
INSERT INTO wp_area VALUES ('2790', '2726', '522300', '黔西南布依族苗族自治州');
INSERT INTO wp_area VALUES ('2791', '2790', '522301', '兴义市');
INSERT INTO wp_area VALUES ('2792', '2790', '522322', '兴仁县');
INSERT INTO wp_area VALUES ('2793', '2790', '522323', '普安县');
INSERT INTO wp_area VALUES ('2794', '2790', '522324', '晴隆县');
INSERT INTO wp_area VALUES ('2795', '2790', '522325', '贞丰县');
INSERT INTO wp_area VALUES ('2796', '2790', '522326', '望谟县');
INSERT INTO wp_area VALUES ('2797', '2790', '522327', '册亨县');
INSERT INTO wp_area VALUES ('2798', '2790', '522328', '安龙县');
INSERT INTO wp_area VALUES ('2799', '2726', '522600', '黔东南苗族侗族自治州');
INSERT INTO wp_area VALUES ('2800', '2799', '522601', '凯里市');
INSERT INTO wp_area VALUES ('2801', '2799', '522622', '黄平县');
INSERT INTO wp_area VALUES ('2802', '2799', '522623', '施秉县');
INSERT INTO wp_area VALUES ('2803', '2799', '522624', '三穗县');
INSERT INTO wp_area VALUES ('2804', '2799', '522625', '镇远县');
INSERT INTO wp_area VALUES ('2805', '2799', '522626', '岑巩县');
INSERT INTO wp_area VALUES ('2806', '2799', '522627', '天柱县');
INSERT INTO wp_area VALUES ('2807', '2799', '522628', '锦屏县');
INSERT INTO wp_area VALUES ('2808', '2799', '522629', '剑河县');
INSERT INTO wp_area VALUES ('2809', '2799', '522630', '台江县');
INSERT INTO wp_area VALUES ('2810', '2799', '522631', '黎平县');
INSERT INTO wp_area VALUES ('2811', '2799', '522632', '榕江县');
INSERT INTO wp_area VALUES ('2812', '2799', '522633', '从江县');
INSERT INTO wp_area VALUES ('2813', '2799', '522634', '雷山县');
INSERT INTO wp_area VALUES ('2814', '2799', '522635', '麻江县');
INSERT INTO wp_area VALUES ('2815', '2799', '522636', '丹寨县');
INSERT INTO wp_area VALUES ('2816', '2726', '522700', '黔南布依族苗族自治州');
INSERT INTO wp_area VALUES ('2817', '2816', '522701', '都匀市');
INSERT INTO wp_area VALUES ('2818', '2816', '522702', '福泉市');
INSERT INTO wp_area VALUES ('2819', '2816', '522722', '荔波县');
INSERT INTO wp_area VALUES ('2820', '2816', '522723', '贵定县');
INSERT INTO wp_area VALUES ('2821', '2816', '522725', '瓮安县');
INSERT INTO wp_area VALUES ('2822', '2816', '522726', '独山县');
INSERT INTO wp_area VALUES ('2823', '2816', '522727', '平塘县');
INSERT INTO wp_area VALUES ('2824', '2816', '522728', '罗甸县');
INSERT INTO wp_area VALUES ('2825', '2816', '522729', '长顺县');
INSERT INTO wp_area VALUES ('2826', '2816', '522730', '龙里县');
INSERT INTO wp_area VALUES ('2827', '2816', '522731', '惠水县');
INSERT INTO wp_area VALUES ('2828', '2816', '522732', '三都水族自治县');
INSERT INTO wp_area VALUES ('2829', '0', '530000', '云南省');
INSERT INTO wp_area VALUES ('2830', '2829', '530100', '昆明市');
INSERT INTO wp_area VALUES ('2831', '2830', '530101', '市辖区');
INSERT INTO wp_area VALUES ('2832', '2830', '530102', '五华区');
INSERT INTO wp_area VALUES ('2833', '2830', '530103', '盘龙区');
INSERT INTO wp_area VALUES ('2834', '2830', '530111', '官渡区');
INSERT INTO wp_area VALUES ('2835', '2830', '530112', '西山区');
INSERT INTO wp_area VALUES ('2836', '2830', '530113', '东川区');
INSERT INTO wp_area VALUES ('2837', '2830', '530114', '呈贡区');
INSERT INTO wp_area VALUES ('2838', '2830', '530122', '晋宁县');
INSERT INTO wp_area VALUES ('2839', '2830', '530124', '富民县');
INSERT INTO wp_area VALUES ('2840', '2830', '530125', '宜良县');
INSERT INTO wp_area VALUES ('2841', '2830', '530126', '石林彝族自治县');
INSERT INTO wp_area VALUES ('2842', '2830', '530127', '嵩明县');
INSERT INTO wp_area VALUES ('2843', '2830', '530128', '禄劝彝族苗族自治县');
INSERT INTO wp_area VALUES ('2844', '2830', '530129', '寻甸回族彝族自治县');
INSERT INTO wp_area VALUES ('2845', '2830', '530181', '安宁市');
INSERT INTO wp_area VALUES ('2846', '2829', '530300', '曲靖市');
INSERT INTO wp_area VALUES ('2847', '2846', '530301', '市辖区');
INSERT INTO wp_area VALUES ('2848', '2846', '530302', '麒麟区');
INSERT INTO wp_area VALUES ('2849', '2846', '530321', '马龙县');
INSERT INTO wp_area VALUES ('2850', '2846', '530322', '陆良县');
INSERT INTO wp_area VALUES ('2851', '2846', '530323', '师宗县');
INSERT INTO wp_area VALUES ('2852', '2846', '530324', '罗平县');
INSERT INTO wp_area VALUES ('2853', '2846', '530325', '富源县');
INSERT INTO wp_area VALUES ('2854', '2846', '530326', '会泽县');
INSERT INTO wp_area VALUES ('2855', '2846', '530328', '沾益县');
INSERT INTO wp_area VALUES ('2856', '2846', '530381', '宣威市');
INSERT INTO wp_area VALUES ('2857', '2829', '530400', '玉溪市');
INSERT INTO wp_area VALUES ('2858', '2857', '530401', '市辖区');
INSERT INTO wp_area VALUES ('2859', '2857', '530402', '红塔区');
INSERT INTO wp_area VALUES ('2860', '2857', '530421', '江川县');
INSERT INTO wp_area VALUES ('2861', '2857', '530422', '澄江县');
INSERT INTO wp_area VALUES ('2862', '2857', '530423', '通海县');
INSERT INTO wp_area VALUES ('2863', '2857', '530424', '华宁县');
INSERT INTO wp_area VALUES ('2864', '2857', '530425', '易门县');
INSERT INTO wp_area VALUES ('2865', '2857', '530426', '峨山彝族自治县');
INSERT INTO wp_area VALUES ('2866', '2857', '530427', '新平彝族傣族自治县');
INSERT INTO wp_area VALUES ('2867', '2857', '530428', '元江哈尼族彝族傣族自治县');
INSERT INTO wp_area VALUES ('2868', '2829', '530500', '保山市');
INSERT INTO wp_area VALUES ('2869', '2868', '530501', '市辖区');
INSERT INTO wp_area VALUES ('2870', '2868', '530502', '隆阳区');
INSERT INTO wp_area VALUES ('2871', '2868', '530521', '施甸县');
INSERT INTO wp_area VALUES ('2872', '2868', '530522', '腾冲县');
INSERT INTO wp_area VALUES ('2873', '2868', '530523', '龙陵县');
INSERT INTO wp_area VALUES ('2874', '2868', '530524', '昌宁县');
INSERT INTO wp_area VALUES ('2875', '2829', '530600', '昭通市');
INSERT INTO wp_area VALUES ('2876', '2875', '530601', '市辖区');
INSERT INTO wp_area VALUES ('2877', '2875', '530602', '昭阳区');
INSERT INTO wp_area VALUES ('2878', '2875', '530621', '鲁甸县');
INSERT INTO wp_area VALUES ('2879', '2875', '530622', '巧家县');
INSERT INTO wp_area VALUES ('2880', '2875', '530623', '盐津县');
INSERT INTO wp_area VALUES ('2881', '2875', '530624', '大关县');
INSERT INTO wp_area VALUES ('2882', '2875', '530625', '永善县');
INSERT INTO wp_area VALUES ('2883', '2875', '530626', '绥江县');
INSERT INTO wp_area VALUES ('2884', '2875', '530627', '镇雄县');
INSERT INTO wp_area VALUES ('2885', '2875', '530628', '彝良县');
INSERT INTO wp_area VALUES ('2886', '2875', '530629', '威信县');
INSERT INTO wp_area VALUES ('2887', '2875', '530630', '水富县');
INSERT INTO wp_area VALUES ('2888', '2829', '530700', '丽江市');
INSERT INTO wp_area VALUES ('2889', '2888', '530701', '市辖区');
INSERT INTO wp_area VALUES ('2890', '2888', '530702', '古城区');
INSERT INTO wp_area VALUES ('2891', '2888', '530721', '玉龙纳西族自治县');
INSERT INTO wp_area VALUES ('2892', '2888', '530722', '永胜县');
INSERT INTO wp_area VALUES ('2893', '2888', '530723', '华坪县');
INSERT INTO wp_area VALUES ('2894', '2888', '530724', '宁蒗彝族自治县');
INSERT INTO wp_area VALUES ('2895', '2829', '530800', '普洱市');
INSERT INTO wp_area VALUES ('2896', '2895', '530801', '市辖区');
INSERT INTO wp_area VALUES ('2897', '2895', '530802', '思茅区');
INSERT INTO wp_area VALUES ('2898', '2895', '530821', '宁洱哈尼族彝族自治县');
INSERT INTO wp_area VALUES ('2899', '2895', '530822', '墨江哈尼族自治县');
INSERT INTO wp_area VALUES ('2900', '2895', '530823', '景东彝族自治县');
INSERT INTO wp_area VALUES ('2901', '2895', '530824', '景谷傣族彝族自治县');
INSERT INTO wp_area VALUES ('2902', '2895', '530825', '镇沅彝族哈尼族拉祜族自治县');
INSERT INTO wp_area VALUES ('2903', '2895', '530826', '江城哈尼族彝族自治县');
INSERT INTO wp_area VALUES ('2904', '2895', '530827', '孟连傣族拉祜族佤族自治县');
INSERT INTO wp_area VALUES ('2905', '2895', '530828', '澜沧拉祜族自治县');
INSERT INTO wp_area VALUES ('2906', '2895', '530829', '西盟佤族自治县');
INSERT INTO wp_area VALUES ('2907', '2829', '530900', '临沧市');
INSERT INTO wp_area VALUES ('2908', '2907', '530901', '市辖区');
INSERT INTO wp_area VALUES ('2909', '2907', '530902', '临翔区');
INSERT INTO wp_area VALUES ('2910', '2907', '530921', '凤庆县');
INSERT INTO wp_area VALUES ('2911', '2907', '530922', '云县');
INSERT INTO wp_area VALUES ('2912', '2907', '530923', '永德县');
INSERT INTO wp_area VALUES ('2913', '2907', '530924', '镇康县');
INSERT INTO wp_area VALUES ('2914', '2907', '530925', '双江拉祜族佤族布朗族傣族自治县');
INSERT INTO wp_area VALUES ('2915', '2907', '530926', '耿马傣族佤族自治县');
INSERT INTO wp_area VALUES ('2916', '2907', '530927', '沧源佤族自治县');
INSERT INTO wp_area VALUES ('2917', '2829', '532300', '楚雄彝族自治州');
INSERT INTO wp_area VALUES ('2918', '2917', '532301', '楚雄市');
INSERT INTO wp_area VALUES ('2919', '2917', '532322', '双柏县');
INSERT INTO wp_area VALUES ('2920', '2917', '532323', '牟定县');
INSERT INTO wp_area VALUES ('2921', '2917', '532324', '南华县');
INSERT INTO wp_area VALUES ('2922', '2917', '532325', '姚安县');
INSERT INTO wp_area VALUES ('2923', '2917', '532326', '大姚县');
INSERT INTO wp_area VALUES ('2924', '2917', '532327', '永仁县');
INSERT INTO wp_area VALUES ('2925', '2917', '532328', '元谋县');
INSERT INTO wp_area VALUES ('2926', '2917', '532329', '武定县');
INSERT INTO wp_area VALUES ('2927', '2917', '532331', '禄丰县');
INSERT INTO wp_area VALUES ('2928', '2829', '532500', '红河哈尼族彝族自治州');
INSERT INTO wp_area VALUES ('2929', '2928', '532501', '个旧市');
INSERT INTO wp_area VALUES ('2930', '2928', '532502', '开远市');
INSERT INTO wp_area VALUES ('2931', '2928', '532503', '蒙自市');
INSERT INTO wp_area VALUES ('2932', '2928', '532504', '弥勒市');
INSERT INTO wp_area VALUES ('2933', '2928', '532523', '屏边苗族自治县');
INSERT INTO wp_area VALUES ('2934', '2928', '532524', '建水县');
INSERT INTO wp_area VALUES ('2935', '2928', '532525', '石屏县');
INSERT INTO wp_area VALUES ('2936', '2928', '532527', '泸西县');
INSERT INTO wp_area VALUES ('2937', '2928', '532528', '元阳县');
INSERT INTO wp_area VALUES ('2938', '2928', '532529', '红河县');
INSERT INTO wp_area VALUES ('2939', '2928', '532530', '金平苗族瑶族傣族自治县');
INSERT INTO wp_area VALUES ('2940', '2928', '532531', '绿春县');
INSERT INTO wp_area VALUES ('2941', '2928', '532532', '河口瑶族自治县');
INSERT INTO wp_area VALUES ('2942', '2829', '532600', '文山壮族苗族自治州');
INSERT INTO wp_area VALUES ('2943', '2942', '532601', '文山市');
INSERT INTO wp_area VALUES ('2944', '2942', '532622', '砚山县');
INSERT INTO wp_area VALUES ('2945', '2942', '532623', '西畴县');
INSERT INTO wp_area VALUES ('2946', '2942', '532624', '麻栗坡县');
INSERT INTO wp_area VALUES ('2947', '2942', '532625', '马关县');
INSERT INTO wp_area VALUES ('2948', '2942', '532626', '丘北县');
INSERT INTO wp_area VALUES ('2949', '2942', '532627', '广南县');
INSERT INTO wp_area VALUES ('2950', '2942', '532628', '富宁县');
INSERT INTO wp_area VALUES ('2951', '2829', '532800', '西双版纳傣族自治州');
INSERT INTO wp_area VALUES ('2952', '2951', '532801', '景洪市');
INSERT INTO wp_area VALUES ('2953', '2951', '532822', '勐海县');
INSERT INTO wp_area VALUES ('2954', '2951', '532823', '勐腊县');
INSERT INTO wp_area VALUES ('2955', '2829', '532900', '大理白族自治州');
INSERT INTO wp_area VALUES ('2956', '2955', '532901', '大理市');
INSERT INTO wp_area VALUES ('2957', '2955', '532922', '漾濞彝族自治县');
INSERT INTO wp_area VALUES ('2958', '2955', '532923', '祥云县');
INSERT INTO wp_area VALUES ('2959', '2955', '532924', '宾川县');
INSERT INTO wp_area VALUES ('2960', '2955', '532925', '弥渡县');
INSERT INTO wp_area VALUES ('2961', '2955', '532926', '南涧彝族自治县');
INSERT INTO wp_area VALUES ('2962', '2955', '532927', '巍山彝族回族自治县');
INSERT INTO wp_area VALUES ('2963', '2955', '532928', '永平县');
INSERT INTO wp_area VALUES ('2964', '2955', '532929', '云龙县');
INSERT INTO wp_area VALUES ('2965', '2955', '532930', '洱源县');
INSERT INTO wp_area VALUES ('2966', '2955', '532931', '剑川县');
INSERT INTO wp_area VALUES ('2967', '2955', '532932', '鹤庆县');
INSERT INTO wp_area VALUES ('2968', '2829', '533100', '德宏傣族景颇族自治州');
INSERT INTO wp_area VALUES ('2969', '2968', '533102', '瑞丽市');
INSERT INTO wp_area VALUES ('2970', '2968', '533103', '芒市');
INSERT INTO wp_area VALUES ('2971', '2968', '533122', '梁河县');
INSERT INTO wp_area VALUES ('2972', '2968', '533123', '盈江县');
INSERT INTO wp_area VALUES ('2973', '2968', '533124', '陇川县');
INSERT INTO wp_area VALUES ('2974', '2829', '533300', '怒江傈僳族自治州');
INSERT INTO wp_area VALUES ('2975', '2974', '533321', '泸水县');
INSERT INTO wp_area VALUES ('2976', '2974', '533323', '福贡县');
INSERT INTO wp_area VALUES ('2977', '2974', '533324', '贡山独龙族怒族自治县');
INSERT INTO wp_area VALUES ('2978', '2974', '533325', '兰坪白族普米族自治县');
INSERT INTO wp_area VALUES ('2979', '2829', '533400', '迪庆藏族自治州');
INSERT INTO wp_area VALUES ('2980', '2979', '533421', '香格里拉县');
INSERT INTO wp_area VALUES ('2981', '2979', '533422', '德钦县');
INSERT INTO wp_area VALUES ('2982', '2979', '533423', '维西傈僳族自治县');
INSERT INTO wp_area VALUES ('2983', '0', '540000', '西藏自治区');
INSERT INTO wp_area VALUES ('2984', '2983', '540100', '拉萨市');
INSERT INTO wp_area VALUES ('2985', '2984', '540101', '市辖区');
INSERT INTO wp_area VALUES ('2986', '2984', '540102', '城关区');
INSERT INTO wp_area VALUES ('2987', '2984', '540121', '林周县');
INSERT INTO wp_area VALUES ('2988', '2984', '540122', '当雄县');
INSERT INTO wp_area VALUES ('2989', '2984', '540123', '尼木县');
INSERT INTO wp_area VALUES ('2990', '2984', '540124', '曲水县');
INSERT INTO wp_area VALUES ('2991', '2984', '540125', '堆龙德庆县');
INSERT INTO wp_area VALUES ('2992', '2984', '540126', '达孜县');
INSERT INTO wp_area VALUES ('2993', '2984', '540127', '墨竹工卡县');
INSERT INTO wp_area VALUES ('2994', '2983', '540200', '日喀则市');
INSERT INTO wp_area VALUES ('2995', '2994', '540202', '桑珠孜区');
INSERT INTO wp_area VALUES ('2996', '2994', '540221', '南木林县');
INSERT INTO wp_area VALUES ('2997', '2994', '540222', '江孜县');
INSERT INTO wp_area VALUES ('2998', '2994', '540223', '定日县');
INSERT INTO wp_area VALUES ('2999', '2994', '540224', '萨迦县');
INSERT INTO wp_area VALUES ('3000', '2994', '540225', '拉孜县');
INSERT INTO wp_area VALUES ('3001', '2994', '540226', '昂仁县');
INSERT INTO wp_area VALUES ('3002', '2994', '540227', '谢通门县');
INSERT INTO wp_area VALUES ('3003', '2994', '540228', '白朗县');
INSERT INTO wp_area VALUES ('3004', '2994', '540229', '仁布县');
INSERT INTO wp_area VALUES ('3005', '2994', '540230', '康马县');
INSERT INTO wp_area VALUES ('3006', '2994', '540231', '定结县');
INSERT INTO wp_area VALUES ('3007', '2994', '540232', '仲巴县');
INSERT INTO wp_area VALUES ('3008', '2994', '540233', '亚东县');
INSERT INTO wp_area VALUES ('3009', '2994', '540234', '吉隆县');
INSERT INTO wp_area VALUES ('3010', '2994', '540235', '聂拉木县');
INSERT INTO wp_area VALUES ('3011', '2994', '540236', '萨嘎县');
INSERT INTO wp_area VALUES ('3012', '2994', '540237', '岗巴县');
INSERT INTO wp_area VALUES ('3013', '2983', '542100', '昌都地区');
INSERT INTO wp_area VALUES ('3014', '3013', '542121', '昌都县');
INSERT INTO wp_area VALUES ('3015', '3013', '542122', '江达县');
INSERT INTO wp_area VALUES ('3016', '3013', '542123', '贡觉县');
INSERT INTO wp_area VALUES ('3017', '3013', '542124', '类乌齐县');
INSERT INTO wp_area VALUES ('3018', '3013', '542125', '丁青县');
INSERT INTO wp_area VALUES ('3019', '3013', '542126', '察雅县');
INSERT INTO wp_area VALUES ('3020', '3013', '542127', '八宿县');
INSERT INTO wp_area VALUES ('3021', '3013', '542128', '左贡县');
INSERT INTO wp_area VALUES ('3022', '3013', '542129', '芒康县');
INSERT INTO wp_area VALUES ('3023', '3013', '542132', '洛隆县');
INSERT INTO wp_area VALUES ('3024', '3013', '542133', '边坝县');
INSERT INTO wp_area VALUES ('3025', '2983', '542200', '山南地区');
INSERT INTO wp_area VALUES ('3026', '3025', '542221', '乃东县');
INSERT INTO wp_area VALUES ('3027', '3025', '542222', '扎囊县');
INSERT INTO wp_area VALUES ('3028', '3025', '542223', '贡嘎县');
INSERT INTO wp_area VALUES ('3029', '3025', '542224', '桑日县');
INSERT INTO wp_area VALUES ('3030', '3025', '542225', '琼结县');
INSERT INTO wp_area VALUES ('3031', '3025', '542226', '曲松县');
INSERT INTO wp_area VALUES ('3032', '3025', '542227', '措美县');
INSERT INTO wp_area VALUES ('3033', '3025', '542228', '洛扎县');
INSERT INTO wp_area VALUES ('3034', '3025', '542229', '加查县');
INSERT INTO wp_area VALUES ('3035', '3025', '542231', '隆子县');
INSERT INTO wp_area VALUES ('3036', '3025', '542232', '错那县');
INSERT INTO wp_area VALUES ('3037', '3025', '542233', '浪卡子县');
INSERT INTO wp_area VALUES ('3038', '2983', '542400', '那曲地区');
INSERT INTO wp_area VALUES ('3039', '3038', '542421', '那曲县');
INSERT INTO wp_area VALUES ('3040', '3038', '542422', '嘉黎县');
INSERT INTO wp_area VALUES ('3041', '3038', '542423', '比如县');
INSERT INTO wp_area VALUES ('3042', '3038', '542424', '聂荣县');
INSERT INTO wp_area VALUES ('3043', '3038', '542425', '安多县');
INSERT INTO wp_area VALUES ('3044', '3038', '542426', '申扎县');
INSERT INTO wp_area VALUES ('3045', '3038', '542427', '索县');
INSERT INTO wp_area VALUES ('3046', '3038', '542428', '班戈县');
INSERT INTO wp_area VALUES ('3047', '3038', '542429', '巴青县');
INSERT INTO wp_area VALUES ('3048', '3038', '542430', '尼玛县');
INSERT INTO wp_area VALUES ('3049', '3038', '542431', '双湖县');
INSERT INTO wp_area VALUES ('3050', '2983', '542500', '阿里地区');
INSERT INTO wp_area VALUES ('3051', '3050', '542521', '普兰县');
INSERT INTO wp_area VALUES ('3052', '3050', '542522', '札达县');
INSERT INTO wp_area VALUES ('3053', '3050', '542523', '噶尔县');
INSERT INTO wp_area VALUES ('3054', '3050', '542524', '日土县');
INSERT INTO wp_area VALUES ('3055', '3050', '542525', '革吉县');
INSERT INTO wp_area VALUES ('3056', '3050', '542526', '改则县');
INSERT INTO wp_area VALUES ('3057', '3050', '542527', '措勤县');
INSERT INTO wp_area VALUES ('3058', '2983', '542600', '林芝地区');
INSERT INTO wp_area VALUES ('3059', '3058', '542621', '林芝县');
INSERT INTO wp_area VALUES ('3060', '3058', '542622', '工布江达县');
INSERT INTO wp_area VALUES ('3061', '3058', '542623', '米林县');
INSERT INTO wp_area VALUES ('3062', '3058', '542624', '墨脱县');
INSERT INTO wp_area VALUES ('3063', '3058', '542625', '波密县');
INSERT INTO wp_area VALUES ('3064', '3058', '542626', '察隅县');
INSERT INTO wp_area VALUES ('3065', '3058', '542627', '朗县');
INSERT INTO wp_area VALUES ('3066', '0', '610000', '陕西省');
INSERT INTO wp_area VALUES ('3067', '3066', '610100', '西安市');
INSERT INTO wp_area VALUES ('3068', '3067', '610101', '市辖区');
INSERT INTO wp_area VALUES ('3069', '3067', '610102', '新城区');
INSERT INTO wp_area VALUES ('3070', '3067', '610103', '碑林区');
INSERT INTO wp_area VALUES ('3071', '3067', '610104', '莲湖区');
INSERT INTO wp_area VALUES ('3072', '3067', '610111', '灞桥区');
INSERT INTO wp_area VALUES ('3073', '3067', '610112', '未央区');
INSERT INTO wp_area VALUES ('3074', '3067', '610113', '雁塔区');
INSERT INTO wp_area VALUES ('3075', '3067', '610114', '阎良区');
INSERT INTO wp_area VALUES ('3076', '3067', '610115', '临潼区');
INSERT INTO wp_area VALUES ('3077', '3067', '610116', '长安区');
INSERT INTO wp_area VALUES ('3078', '3067', '610122', '蓝田县');
INSERT INTO wp_area VALUES ('3079', '3067', '610124', '周至县');
INSERT INTO wp_area VALUES ('3080', '3067', '610125', '户县');
INSERT INTO wp_area VALUES ('3081', '3067', '610126', '高陵县');
INSERT INTO wp_area VALUES ('3082', '3066', '610200', '铜川市');
INSERT INTO wp_area VALUES ('3083', '3082', '610201', '市辖区');
INSERT INTO wp_area VALUES ('3084', '3082', '610202', '王益区');
INSERT INTO wp_area VALUES ('3085', '3082', '610203', '印台区');
INSERT INTO wp_area VALUES ('3086', '3082', '610204', '耀州区');
INSERT INTO wp_area VALUES ('3087', '3082', '610222', '宜君县');
INSERT INTO wp_area VALUES ('3088', '3066', '610300', '宝鸡市');
INSERT INTO wp_area VALUES ('3089', '3088', '610301', '市辖区');
INSERT INTO wp_area VALUES ('3090', '3088', '610302', '渭滨区');
INSERT INTO wp_area VALUES ('3091', '3088', '610303', '金台区');
INSERT INTO wp_area VALUES ('3092', '3088', '610304', '陈仓区');
INSERT INTO wp_area VALUES ('3093', '3088', '610322', '凤翔县');
INSERT INTO wp_area VALUES ('3094', '3088', '610323', '岐山县');
INSERT INTO wp_area VALUES ('3095', '3088', '610324', '扶风县');
INSERT INTO wp_area VALUES ('3096', '3088', '610326', '眉县');
INSERT INTO wp_area VALUES ('3097', '3088', '610327', '陇县');
INSERT INTO wp_area VALUES ('3098', '3088', '610328', '千阳县');
INSERT INTO wp_area VALUES ('3099', '3088', '610329', '麟游县');
INSERT INTO wp_area VALUES ('3100', '3088', '610330', '凤县');
INSERT INTO wp_area VALUES ('3101', '3088', '610331', '太白县');
INSERT INTO wp_area VALUES ('3102', '3066', '610400', '咸阳市');
INSERT INTO wp_area VALUES ('3103', '3102', '610401', '市辖区');
INSERT INTO wp_area VALUES ('3104', '3102', '610402', '秦都区');
INSERT INTO wp_area VALUES ('3105', '3102', '610403', '杨陵区');
INSERT INTO wp_area VALUES ('3106', '3102', '610404', '渭城区');
INSERT INTO wp_area VALUES ('3107', '3102', '610422', '三原县');
INSERT INTO wp_area VALUES ('3108', '3102', '610423', '泾阳县');
INSERT INTO wp_area VALUES ('3109', '3102', '610424', '乾县');
INSERT INTO wp_area VALUES ('3110', '3102', '610425', '礼泉县');
INSERT INTO wp_area VALUES ('3111', '3102', '610426', '永寿县');
INSERT INTO wp_area VALUES ('3112', '3102', '610427', '彬县');
INSERT INTO wp_area VALUES ('3113', '3102', '610428', '长武县');
INSERT INTO wp_area VALUES ('3114', '3102', '610429', '旬邑县');
INSERT INTO wp_area VALUES ('3115', '3102', '610430', '淳化县');
INSERT INTO wp_area VALUES ('3116', '3102', '610431', '武功县');
INSERT INTO wp_area VALUES ('3117', '3102', '610481', '兴平市');
INSERT INTO wp_area VALUES ('3118', '3066', '610500', '渭南市');
INSERT INTO wp_area VALUES ('3119', '3118', '610501', '市辖区');
INSERT INTO wp_area VALUES ('3120', '3118', '610502', '临渭区');
INSERT INTO wp_area VALUES ('3121', '3118', '610521', '华县');
INSERT INTO wp_area VALUES ('3122', '3118', '610522', '潼关县');
INSERT INTO wp_area VALUES ('3123', '3118', '610523', '大荔县');
INSERT INTO wp_area VALUES ('3124', '3118', '610524', '合阳县');
INSERT INTO wp_area VALUES ('3125', '3118', '610525', '澄城县');
INSERT INTO wp_area VALUES ('3126', '3118', '610526', '蒲城县');
INSERT INTO wp_area VALUES ('3127', '3118', '610527', '白水县');
INSERT INTO wp_area VALUES ('3128', '3118', '610528', '富平县');
INSERT INTO wp_area VALUES ('3129', '3118', '610581', '韩城市');
INSERT INTO wp_area VALUES ('3130', '3118', '610582', '华阴市');
INSERT INTO wp_area VALUES ('3131', '3066', '610600', '延安市');
INSERT INTO wp_area VALUES ('3132', '3131', '610601', '市辖区');
INSERT INTO wp_area VALUES ('3133', '3131', '610602', '宝塔区');
INSERT INTO wp_area VALUES ('3134', '3131', '610621', '延长县');
INSERT INTO wp_area VALUES ('3135', '3131', '610622', '延川县');
INSERT INTO wp_area VALUES ('3136', '3131', '610623', '子长县');
INSERT INTO wp_area VALUES ('3137', '3131', '610624', '安塞县');
INSERT INTO wp_area VALUES ('3138', '3131', '610625', '志丹县');
INSERT INTO wp_area VALUES ('3139', '3131', '610626', '吴起县');
INSERT INTO wp_area VALUES ('3140', '3131', '610627', '甘泉县');
INSERT INTO wp_area VALUES ('3141', '3131', '610628', '富县');
INSERT INTO wp_area VALUES ('3142', '3131', '610629', '洛川县');
INSERT INTO wp_area VALUES ('3143', '3131', '610630', '宜川县');
INSERT INTO wp_area VALUES ('3144', '3131', '610631', '黄龙县');
INSERT INTO wp_area VALUES ('3145', '3131', '610632', '黄陵县');
INSERT INTO wp_area VALUES ('3146', '3066', '610700', '汉中市');
INSERT INTO wp_area VALUES ('3147', '3146', '610701', '市辖区');
INSERT INTO wp_area VALUES ('3148', '3146', '610702', '汉台区');
INSERT INTO wp_area VALUES ('3149', '3146', '610721', '南郑县');
INSERT INTO wp_area VALUES ('3150', '3146', '610722', '城固县');
INSERT INTO wp_area VALUES ('3151', '3146', '610723', '洋县');
INSERT INTO wp_area VALUES ('3152', '3146', '610724', '西乡县');
INSERT INTO wp_area VALUES ('3153', '3146', '610725', '勉县');
INSERT INTO wp_area VALUES ('3154', '3146', '610726', '宁强县');
INSERT INTO wp_area VALUES ('3155', '3146', '610727', '略阳县');
INSERT INTO wp_area VALUES ('3156', '3146', '610728', '镇巴县');
INSERT INTO wp_area VALUES ('3157', '3146', '610729', '留坝县');
INSERT INTO wp_area VALUES ('3158', '3146', '610730', '佛坪县');
INSERT INTO wp_area VALUES ('3159', '3066', '610800', '榆林市');
INSERT INTO wp_area VALUES ('3160', '3159', '610801', '市辖区');
INSERT INTO wp_area VALUES ('3161', '3159', '610802', '榆阳区');
INSERT INTO wp_area VALUES ('3162', '3159', '610821', '神木县');
INSERT INTO wp_area VALUES ('3163', '3159', '610822', '府谷县');
INSERT INTO wp_area VALUES ('3164', '3159', '610823', '横山县');
INSERT INTO wp_area VALUES ('3165', '3159', '610824', '靖边县');
INSERT INTO wp_area VALUES ('3166', '3159', '610825', '定边县');
INSERT INTO wp_area VALUES ('3167', '3159', '610826', '绥德县');
INSERT INTO wp_area VALUES ('3168', '3159', '610827', '米脂县');
INSERT INTO wp_area VALUES ('3169', '3159', '610828', '佳县');
INSERT INTO wp_area VALUES ('3170', '3159', '610829', '吴堡县');
INSERT INTO wp_area VALUES ('3171', '3159', '610830', '清涧县');
INSERT INTO wp_area VALUES ('3172', '3159', '610831', '子洲县');
INSERT INTO wp_area VALUES ('3173', '3066', '610900', '安康市');
INSERT INTO wp_area VALUES ('3174', '3173', '610901', '市辖区');
INSERT INTO wp_area VALUES ('3175', '3173', '610902', '汉滨区');
INSERT INTO wp_area VALUES ('3176', '3173', '610921', '汉阴县');
INSERT INTO wp_area VALUES ('3177', '3173', '610922', '石泉县');
INSERT INTO wp_area VALUES ('3178', '3173', '610923', '宁陕县');
INSERT INTO wp_area VALUES ('3179', '3173', '610924', '紫阳县');
INSERT INTO wp_area VALUES ('3180', '3173', '610925', '岚皋县');
INSERT INTO wp_area VALUES ('3181', '3173', '610926', '平利县');
INSERT INTO wp_area VALUES ('3182', '3173', '610927', '镇坪县');
INSERT INTO wp_area VALUES ('3183', '3173', '610928', '旬阳县');
INSERT INTO wp_area VALUES ('3184', '3173', '610929', '白河县');
INSERT INTO wp_area VALUES ('3185', '3066', '611000', '商洛市');
INSERT INTO wp_area VALUES ('3186', '3185', '611001', '市辖区');
INSERT INTO wp_area VALUES ('3187', '3185', '611002', '商州区');
INSERT INTO wp_area VALUES ('3188', '3185', '611021', '洛南县');
INSERT INTO wp_area VALUES ('3189', '3185', '611022', '丹凤县');
INSERT INTO wp_area VALUES ('3190', '3185', '611023', '商南县');
INSERT INTO wp_area VALUES ('3191', '3185', '611024', '山阳县');
INSERT INTO wp_area VALUES ('3192', '3185', '611025', '镇安县');
INSERT INTO wp_area VALUES ('3193', '3185', '611026', '柞水县');
INSERT INTO wp_area VALUES ('3194', '0', '620000', '甘肃省');
INSERT INTO wp_area VALUES ('3195', '3194', '620100', '兰州市');
INSERT INTO wp_area VALUES ('3196', '3195', '620101', '市辖区');
INSERT INTO wp_area VALUES ('3197', '3195', '620102', '城关区');
INSERT INTO wp_area VALUES ('3198', '3195', '620103', '七里河区');
INSERT INTO wp_area VALUES ('3199', '3195', '620104', '西固区');
INSERT INTO wp_area VALUES ('3200', '3195', '620105', '安宁区');
INSERT INTO wp_area VALUES ('3201', '3195', '620111', '红古区');
INSERT INTO wp_area VALUES ('3202', '3195', '620121', '永登县');
INSERT INTO wp_area VALUES ('3203', '3195', '620122', '皋兰县');
INSERT INTO wp_area VALUES ('3204', '3195', '620123', '榆中县');
INSERT INTO wp_area VALUES ('3205', '3194', '620200', '嘉峪关市');
INSERT INTO wp_area VALUES ('3206', '3205', '620201', '市辖区');
INSERT INTO wp_area VALUES ('3207', '3194', '620300', '金昌市');
INSERT INTO wp_area VALUES ('3208', '3207', '620301', '市辖区');
INSERT INTO wp_area VALUES ('3209', '3207', '620302', '金川区');
INSERT INTO wp_area VALUES ('3210', '3207', '620321', '永昌县');
INSERT INTO wp_area VALUES ('3211', '3194', '620400', '白银市');
INSERT INTO wp_area VALUES ('3212', '3211', '620401', '市辖区');
INSERT INTO wp_area VALUES ('3213', '3211', '620402', '白银区');
INSERT INTO wp_area VALUES ('3214', '3211', '620403', '平川区');
INSERT INTO wp_area VALUES ('3215', '3211', '620421', '靖远县');
INSERT INTO wp_area VALUES ('3216', '3211', '620422', '会宁县');
INSERT INTO wp_area VALUES ('3217', '3211', '620423', '景泰县');
INSERT INTO wp_area VALUES ('3218', '3194', '620500', '天水市');
INSERT INTO wp_area VALUES ('3219', '3218', '620501', '市辖区');
INSERT INTO wp_area VALUES ('3220', '3218', '620502', '秦州区');
INSERT INTO wp_area VALUES ('3221', '3218', '620503', '麦积区');
INSERT INTO wp_area VALUES ('3222', '3218', '620521', '清水县');
INSERT INTO wp_area VALUES ('3223', '3218', '620522', '秦安县');
INSERT INTO wp_area VALUES ('3224', '3218', '620523', '甘谷县');
INSERT INTO wp_area VALUES ('3225', '3218', '620524', '武山县');
INSERT INTO wp_area VALUES ('3226', '3218', '620525', '张家川回族自治县');
INSERT INTO wp_area VALUES ('3227', '3194', '620600', '武威市');
INSERT INTO wp_area VALUES ('3228', '3227', '620601', '市辖区');
INSERT INTO wp_area VALUES ('3229', '3227', '620602', '凉州区');
INSERT INTO wp_area VALUES ('3230', '3227', '620621', '民勤县');
INSERT INTO wp_area VALUES ('3231', '3227', '620622', '古浪县');
INSERT INTO wp_area VALUES ('3232', '3227', '620623', '天祝藏族自治县');
INSERT INTO wp_area VALUES ('3233', '3194', '620700', '张掖市');
INSERT INTO wp_area VALUES ('3234', '3233', '620701', '市辖区');
INSERT INTO wp_area VALUES ('3235', '3233', '620702', '甘州区');
INSERT INTO wp_area VALUES ('3236', '3233', '620721', '肃南裕固族自治县');
INSERT INTO wp_area VALUES ('3237', '3233', '620722', '民乐县');
INSERT INTO wp_area VALUES ('3238', '3233', '620723', '临泽县');
INSERT INTO wp_area VALUES ('3239', '3233', '620724', '高台县');
INSERT INTO wp_area VALUES ('3240', '3233', '620725', '山丹县');
INSERT INTO wp_area VALUES ('3241', '3194', '620800', '平凉市');
INSERT INTO wp_area VALUES ('3242', '3241', '620801', '市辖区');
INSERT INTO wp_area VALUES ('3243', '3241', '620802', '崆峒区');
INSERT INTO wp_area VALUES ('3244', '3241', '620821', '泾川县');
INSERT INTO wp_area VALUES ('3245', '3241', '620822', '灵台县');
INSERT INTO wp_area VALUES ('3246', '3241', '620823', '崇信县');
INSERT INTO wp_area VALUES ('3247', '3241', '620824', '华亭县');
INSERT INTO wp_area VALUES ('3248', '3241', '620825', '庄浪县');
INSERT INTO wp_area VALUES ('3249', '3241', '620826', '静宁县');
INSERT INTO wp_area VALUES ('3250', '3194', '620900', '酒泉市');
INSERT INTO wp_area VALUES ('3251', '3250', '620901', '市辖区');
INSERT INTO wp_area VALUES ('3252', '3250', '620902', '肃州区');
INSERT INTO wp_area VALUES ('3253', '3250', '620921', '金塔县');
INSERT INTO wp_area VALUES ('3254', '3250', '620922', '瓜州县');
INSERT INTO wp_area VALUES ('3255', '3250', '620923', '肃北蒙古族自治县');
INSERT INTO wp_area VALUES ('3256', '3250', '620924', '阿克塞哈萨克族自治县');
INSERT INTO wp_area VALUES ('3257', '3250', '620981', '玉门市');
INSERT INTO wp_area VALUES ('3258', '3250', '620982', '敦煌市');
INSERT INTO wp_area VALUES ('3259', '3194', '621000', '庆阳市');
INSERT INTO wp_area VALUES ('3260', '3259', '621001', '市辖区');
INSERT INTO wp_area VALUES ('3261', '3259', '621002', '西峰区');
INSERT INTO wp_area VALUES ('3262', '3259', '621021', '庆城县');
INSERT INTO wp_area VALUES ('3263', '3259', '621022', '环县');
INSERT INTO wp_area VALUES ('3264', '3259', '621023', '华池县');
INSERT INTO wp_area VALUES ('3265', '3259', '621024', '合水县');
INSERT INTO wp_area VALUES ('3266', '3259', '621025', '正宁县');
INSERT INTO wp_area VALUES ('3267', '3259', '621026', '宁县');
INSERT INTO wp_area VALUES ('3268', '3259', '621027', '镇原县');
INSERT INTO wp_area VALUES ('3269', '3194', '621100', '定西市');
INSERT INTO wp_area VALUES ('3270', '3269', '621101', '市辖区');
INSERT INTO wp_area VALUES ('3271', '3269', '621102', '安定区');
INSERT INTO wp_area VALUES ('3272', '3269', '621121', '通渭县');
INSERT INTO wp_area VALUES ('3273', '3269', '621122', '陇西县');
INSERT INTO wp_area VALUES ('3274', '3269', '621123', '渭源县');
INSERT INTO wp_area VALUES ('3275', '3269', '621124', '临洮县');
INSERT INTO wp_area VALUES ('3276', '3269', '621125', '漳县');
INSERT INTO wp_area VALUES ('3277', '3269', '621126', '岷县');
INSERT INTO wp_area VALUES ('3278', '3194', '621200', '陇南市');
INSERT INTO wp_area VALUES ('3279', '3278', '621201', '市辖区');
INSERT INTO wp_area VALUES ('3280', '3278', '621202', '武都区');
INSERT INTO wp_area VALUES ('3281', '3278', '621221', '成县');
INSERT INTO wp_area VALUES ('3282', '3278', '621222', '文县');
INSERT INTO wp_area VALUES ('3283', '3278', '621223', '宕昌县');
INSERT INTO wp_area VALUES ('3284', '3278', '621224', '康县');
INSERT INTO wp_area VALUES ('3285', '3278', '621225', '西和县');
INSERT INTO wp_area VALUES ('3286', '3278', '621226', '礼县');
INSERT INTO wp_area VALUES ('3287', '3278', '621227', '徽县');
INSERT INTO wp_area VALUES ('3288', '3278', '621228', '两当县');
INSERT INTO wp_area VALUES ('3289', '3194', '622900', '临夏回族自治州');
INSERT INTO wp_area VALUES ('3290', '3289', '622901', '临夏市');
INSERT INTO wp_area VALUES ('3291', '3289', '622921', '临夏县');
INSERT INTO wp_area VALUES ('3292', '3289', '622922', '康乐县');
INSERT INTO wp_area VALUES ('3293', '3289', '622923', '永靖县');
INSERT INTO wp_area VALUES ('3294', '3289', '622924', '广河县');
INSERT INTO wp_area VALUES ('3295', '3289', '622925', '和政县');
INSERT INTO wp_area VALUES ('3296', '3289', '622926', '东乡族自治县');
INSERT INTO wp_area VALUES ('3297', '3289', '622927', '积石山保安族东乡族撒拉族自治县');
INSERT INTO wp_area VALUES ('3298', '3194', '623000', '甘南藏族自治州');
INSERT INTO wp_area VALUES ('3299', '3298', '623001', '合作市');
INSERT INTO wp_area VALUES ('3300', '3298', '623021', '临潭县');
INSERT INTO wp_area VALUES ('3301', '3298', '623022', '卓尼县');
INSERT INTO wp_area VALUES ('3302', '3298', '623023', '舟曲县');
INSERT INTO wp_area VALUES ('3303', '3298', '623024', '迭部县');
INSERT INTO wp_area VALUES ('3304', '3298', '623025', '玛曲县');
INSERT INTO wp_area VALUES ('3305', '3298', '623026', '碌曲县');
INSERT INTO wp_area VALUES ('3306', '3298', '623027', '夏河县');
INSERT INTO wp_area VALUES ('3307', '0', '630000', '青海省');
INSERT INTO wp_area VALUES ('3308', '3307', '630100', '西宁市');
INSERT INTO wp_area VALUES ('3309', '3308', '630101', '市辖区');
INSERT INTO wp_area VALUES ('3310', '3308', '630102', '城东区');
INSERT INTO wp_area VALUES ('3311', '3308', '630103', '城中区');
INSERT INTO wp_area VALUES ('3312', '3308', '630104', '城西区');
INSERT INTO wp_area VALUES ('3313', '3308', '630105', '城北区');
INSERT INTO wp_area VALUES ('3314', '3308', '630121', '大通回族土族自治县');
INSERT INTO wp_area VALUES ('3315', '3308', '630122', '湟中县');
INSERT INTO wp_area VALUES ('3316', '3308', '630123', '湟源县');
INSERT INTO wp_area VALUES ('3317', '3307', '630200', '海东市');
INSERT INTO wp_area VALUES ('3318', '3317', '630202', '乐都区');
INSERT INTO wp_area VALUES ('3319', '3317', '630221', '平安县');
INSERT INTO wp_area VALUES ('3320', '3317', '630222', '民和回族土族自治县');
INSERT INTO wp_area VALUES ('3321', '3317', '630223', '互助土族自治县');
INSERT INTO wp_area VALUES ('3322', '3317', '630224', '化隆回族自治县');
INSERT INTO wp_area VALUES ('3323', '3317', '630225', '循化撒拉族自治县');
INSERT INTO wp_area VALUES ('3324', '3307', '632200', '海北藏族自治州');
INSERT INTO wp_area VALUES ('3325', '3324', '632221', '门源回族自治县');
INSERT INTO wp_area VALUES ('3326', '3324', '632222', '祁连县');
INSERT INTO wp_area VALUES ('3327', '3324', '632223', '海晏县');
INSERT INTO wp_area VALUES ('3328', '3324', '632224', '刚察县');
INSERT INTO wp_area VALUES ('3329', '3307', '632300', '黄南藏族自治州');
INSERT INTO wp_area VALUES ('3330', '3329', '632321', '同仁县');
INSERT INTO wp_area VALUES ('3331', '3329', '632322', '尖扎县');
INSERT INTO wp_area VALUES ('3332', '3329', '632323', '泽库县');
INSERT INTO wp_area VALUES ('3333', '3329', '632324', '河南蒙古族自治县');
INSERT INTO wp_area VALUES ('3334', '3307', '632500', '海南藏族自治州');
INSERT INTO wp_area VALUES ('3335', '3334', '632521', '共和县');
INSERT INTO wp_area VALUES ('3336', '3334', '632522', '同德县');
INSERT INTO wp_area VALUES ('3337', '3334', '632523', '贵德县');
INSERT INTO wp_area VALUES ('3338', '3334', '632524', '兴海县');
INSERT INTO wp_area VALUES ('3339', '3334', '632525', '贵南县');
INSERT INTO wp_area VALUES ('3340', '3307', '632600', '果洛藏族自治州');
INSERT INTO wp_area VALUES ('3341', '3340', '632621', '玛沁县');
INSERT INTO wp_area VALUES ('3342', '3340', '632622', '班玛县');
INSERT INTO wp_area VALUES ('3343', '3340', '632623', '甘德县');
INSERT INTO wp_area VALUES ('3344', '3340', '632624', '达日县');
INSERT INTO wp_area VALUES ('3345', '3340', '632625', '久治县');
INSERT INTO wp_area VALUES ('3346', '3340', '632626', '玛多县');
INSERT INTO wp_area VALUES ('3347', '3307', '632700', '玉树藏族自治州');
INSERT INTO wp_area VALUES ('3348', '3347', '632701', '玉树市');
INSERT INTO wp_area VALUES ('3349', '3347', '632722', '杂多县');
INSERT INTO wp_area VALUES ('3350', '3347', '632723', '称多县');
INSERT INTO wp_area VALUES ('3351', '3347', '632724', '治多县');
INSERT INTO wp_area VALUES ('3352', '3347', '632725', '囊谦县');
INSERT INTO wp_area VALUES ('3353', '3347', '632726', '曲麻莱县');
INSERT INTO wp_area VALUES ('3354', '3307', '632800', '海西蒙古族藏族自治州');
INSERT INTO wp_area VALUES ('3355', '3354', '632801', '格尔木市');
INSERT INTO wp_area VALUES ('3356', '3354', '632802', '德令哈市');
INSERT INTO wp_area VALUES ('3357', '3354', '632821', '乌兰县');
INSERT INTO wp_area VALUES ('3358', '3354', '632822', '都兰县');
INSERT INTO wp_area VALUES ('3359', '3354', '632823', '天峻县');
INSERT INTO wp_area VALUES ('3360', '0', '640000', '宁夏回族自治区');
INSERT INTO wp_area VALUES ('3361', '3360', '640100', '银川市');
INSERT INTO wp_area VALUES ('3362', '3361', '640101', '市辖区');
INSERT INTO wp_area VALUES ('3363', '3361', '640104', '兴庆区');
INSERT INTO wp_area VALUES ('3364', '3361', '640105', '西夏区');
INSERT INTO wp_area VALUES ('3365', '3361', '640106', '金凤区');
INSERT INTO wp_area VALUES ('3366', '3361', '640121', '永宁县');
INSERT INTO wp_area VALUES ('3367', '3361', '640122', '贺兰县');
INSERT INTO wp_area VALUES ('3368', '3361', '640181', '灵武市');
INSERT INTO wp_area VALUES ('3369', '3360', '640200', '石嘴山市');
INSERT INTO wp_area VALUES ('3370', '3369', '640201', '市辖区');
INSERT INTO wp_area VALUES ('3371', '3369', '640202', '大武口区');
INSERT INTO wp_area VALUES ('3372', '3369', '640205', '惠农区');
INSERT INTO wp_area VALUES ('3373', '3369', '640221', '平罗县');
INSERT INTO wp_area VALUES ('3374', '3360', '640300', '吴忠市');
INSERT INTO wp_area VALUES ('3375', '3374', '640301', '市辖区');
INSERT INTO wp_area VALUES ('3376', '3374', '640302', '利通区');
INSERT INTO wp_area VALUES ('3377', '3374', '640303', '红寺堡区');
INSERT INTO wp_area VALUES ('3378', '3374', '640323', '盐池县');
INSERT INTO wp_area VALUES ('3379', '3374', '640324', '同心县');
INSERT INTO wp_area VALUES ('3380', '3374', '640381', '青铜峡市');
INSERT INTO wp_area VALUES ('3381', '3360', '640400', '固原市');
INSERT INTO wp_area VALUES ('3382', '3381', '640401', '市辖区');
INSERT INTO wp_area VALUES ('3383', '3381', '640402', '原州区');
INSERT INTO wp_area VALUES ('3384', '3381', '640422', '西吉县');
INSERT INTO wp_area VALUES ('3385', '3381', '640423', '隆德县');
INSERT INTO wp_area VALUES ('3386', '3381', '640424', '泾源县');
INSERT INTO wp_area VALUES ('3387', '3381', '640425', '彭阳县');
INSERT INTO wp_area VALUES ('3388', '3360', '640500', '中卫市');
INSERT INTO wp_area VALUES ('3389', '3388', '640501', '市辖区');
INSERT INTO wp_area VALUES ('3390', '3388', '640502', '沙坡头区');
INSERT INTO wp_area VALUES ('3391', '3388', '640521', '中宁县');
INSERT INTO wp_area VALUES ('3392', '3388', '640522', '海原县');
INSERT INTO wp_area VALUES ('3393', '0', '650000', '新疆维吾尔自治区');
INSERT INTO wp_area VALUES ('3394', '3393', '650100', '乌鲁木齐市');
INSERT INTO wp_area VALUES ('3395', '3394', '650101', '市辖区');
INSERT INTO wp_area VALUES ('3396', '3394', '650102', '天山区');
INSERT INTO wp_area VALUES ('3397', '3394', '650103', '沙依巴克区');
INSERT INTO wp_area VALUES ('3398', '3394', '650104', '新市区');
INSERT INTO wp_area VALUES ('3399', '3394', '650105', '水磨沟区');
INSERT INTO wp_area VALUES ('3400', '3394', '650106', '头屯河区');
INSERT INTO wp_area VALUES ('3401', '3394', '650107', '达坂城区');
INSERT INTO wp_area VALUES ('3402', '3394', '650109', '米东区');
INSERT INTO wp_area VALUES ('3403', '3394', '650121', '乌鲁木齐县');
INSERT INTO wp_area VALUES ('3404', '3393', '650200', '克拉玛依市');
INSERT INTO wp_area VALUES ('3405', '3404', '650201', '市辖区');
INSERT INTO wp_area VALUES ('3406', '3404', '650202', '独山子区');
INSERT INTO wp_area VALUES ('3407', '3404', '650203', '克拉玛依区');
INSERT INTO wp_area VALUES ('3408', '3404', '650204', '白碱滩区');
INSERT INTO wp_area VALUES ('3409', '3404', '650205', '乌尔禾区');
INSERT INTO wp_area VALUES ('3410', '3393', '652100', '吐鲁番地区');
INSERT INTO wp_area VALUES ('3411', '3410', '652101', '吐鲁番市');
INSERT INTO wp_area VALUES ('3412', '3410', '652122', '鄯善县');
INSERT INTO wp_area VALUES ('3413', '3410', '652123', '托克逊县');
INSERT INTO wp_area VALUES ('3414', '3393', '652200', '哈密地区');
INSERT INTO wp_area VALUES ('3415', '3414', '652201', '哈密市');
INSERT INTO wp_area VALUES ('3416', '3414', '652222', '巴里坤哈萨克自治县');
INSERT INTO wp_area VALUES ('3417', '3414', '652223', '伊吾县');
INSERT INTO wp_area VALUES ('3418', '3393', '652300', '昌吉回族自治州');
INSERT INTO wp_area VALUES ('3419', '3418', '652301', '昌吉市');
INSERT INTO wp_area VALUES ('3420', '3418', '652302', '阜康市');
INSERT INTO wp_area VALUES ('3421', '3418', '652323', '呼图壁县');
INSERT INTO wp_area VALUES ('3422', '3418', '652324', '玛纳斯县');
INSERT INTO wp_area VALUES ('3423', '3418', '652325', '奇台县');
INSERT INTO wp_area VALUES ('3424', '3418', '652327', '吉木萨尔县');
INSERT INTO wp_area VALUES ('3425', '3418', '652328', '木垒哈萨克自治县');
INSERT INTO wp_area VALUES ('3426', '3393', '652700', '博尔塔拉蒙古自治州');
INSERT INTO wp_area VALUES ('3427', '3426', '652701', '博乐市');
INSERT INTO wp_area VALUES ('3428', '3426', '652702', '阿拉山口市');
INSERT INTO wp_area VALUES ('3429', '3426', '652722', '精河县');
INSERT INTO wp_area VALUES ('3430', '3426', '652723', '温泉县');
INSERT INTO wp_area VALUES ('3431', '3393', '652800', '巴音郭楞蒙古自治州');
INSERT INTO wp_area VALUES ('3432', '3431', '652801', '库尔勒市');
INSERT INTO wp_area VALUES ('3433', '3431', '652822', '轮台县');
INSERT INTO wp_area VALUES ('3434', '3431', '652823', '尉犁县');
INSERT INTO wp_area VALUES ('3435', '3431', '652824', '若羌县');
INSERT INTO wp_area VALUES ('3436', '3431', '652825', '且末县');
INSERT INTO wp_area VALUES ('3437', '3431', '652826', '焉耆回族自治县');
INSERT INTO wp_area VALUES ('3438', '3431', '652827', '和静县');
INSERT INTO wp_area VALUES ('3439', '3431', '652828', '和硕县');
INSERT INTO wp_area VALUES ('3440', '3431', '652829', '博湖县');
INSERT INTO wp_area VALUES ('3441', '3393', '652900', '阿克苏地区');
INSERT INTO wp_area VALUES ('3442', '3441', '652901', '阿克苏市');
INSERT INTO wp_area VALUES ('3443', '3441', '652922', '温宿县');
INSERT INTO wp_area VALUES ('3444', '3441', '652923', '库车县');
INSERT INTO wp_area VALUES ('3445', '3441', '652924', '沙雅县');
INSERT INTO wp_area VALUES ('3446', '3441', '652925', '新和县');
INSERT INTO wp_area VALUES ('3447', '3441', '652926', '拜城县');
INSERT INTO wp_area VALUES ('3448', '3441', '652927', '乌什县');
INSERT INTO wp_area VALUES ('3449', '3441', '652928', '阿瓦提县');
INSERT INTO wp_area VALUES ('3450', '3441', '652929', '柯坪县');
INSERT INTO wp_area VALUES ('3451', '3393', '653000', '克孜勒苏柯尔克孜自治州');
INSERT INTO wp_area VALUES ('3452', '3451', '653001', '阿图什市');
INSERT INTO wp_area VALUES ('3453', '3451', '653022', '阿克陶县');
INSERT INTO wp_area VALUES ('3454', '3451', '653023', '阿合奇县');
INSERT INTO wp_area VALUES ('3455', '3451', '653024', '乌恰县');
INSERT INTO wp_area VALUES ('3456', '3393', '653100', '喀什地区');
INSERT INTO wp_area VALUES ('3457', '3456', '653101', '喀什市');
INSERT INTO wp_area VALUES ('3458', '3456', '653121', '疏附县');
INSERT INTO wp_area VALUES ('3459', '3456', '653122', '疏勒县');
INSERT INTO wp_area VALUES ('3460', '3456', '653123', '英吉沙县');
INSERT INTO wp_area VALUES ('3461', '3456', '653124', '泽普县');
INSERT INTO wp_area VALUES ('3462', '3456', '653125', '莎车县');
INSERT INTO wp_area VALUES ('3463', '3456', '653126', '叶城县');
INSERT INTO wp_area VALUES ('3464', '3456', '653127', '麦盖提县');
INSERT INTO wp_area VALUES ('3465', '3456', '653128', '岳普湖县');
INSERT INTO wp_area VALUES ('3466', '3456', '653129', '伽师县');
INSERT INTO wp_area VALUES ('3467', '3456', '653130', '巴楚县');
INSERT INTO wp_area VALUES ('3468', '3456', '653131', '塔什库尔干塔吉克自治县');
INSERT INTO wp_area VALUES ('3469', '3393', '653200', '和田地区');
INSERT INTO wp_area VALUES ('3470', '3469', '653201', '和田市');
INSERT INTO wp_area VALUES ('3471', '3469', '653221', '和田县');
INSERT INTO wp_area VALUES ('3472', '3469', '653222', '墨玉县');
INSERT INTO wp_area VALUES ('3473', '3469', '653223', '皮山县');
INSERT INTO wp_area VALUES ('3474', '3469', '653224', '洛浦县');
INSERT INTO wp_area VALUES ('3475', '3469', '653225', '策勒县');
INSERT INTO wp_area VALUES ('3476', '3469', '653226', '于田县');
INSERT INTO wp_area VALUES ('3477', '3469', '653227', '民丰县');
INSERT INTO wp_area VALUES ('3478', '3393', '654000', '伊犁哈萨克自治州');
INSERT INTO wp_area VALUES ('3479', '3478', '654002', '伊宁市');
INSERT INTO wp_area VALUES ('3480', '3478', '654003', '奎屯市');
INSERT INTO wp_area VALUES ('3481', '3478', '654021', '伊宁县');
INSERT INTO wp_area VALUES ('3482', '3478', '654022', '察布查尔锡伯自治县');
INSERT INTO wp_area VALUES ('3483', '3478', '654023', '霍城县');
INSERT INTO wp_area VALUES ('3484', '3478', '654024', '巩留县');
INSERT INTO wp_area VALUES ('3485', '3478', '654025', '新源县');
INSERT INTO wp_area VALUES ('3486', '3478', '654026', '昭苏县');
INSERT INTO wp_area VALUES ('3487', '3478', '654027', '特克斯县');
INSERT INTO wp_area VALUES ('3488', '3478', '654028', '尼勒克县');
INSERT INTO wp_area VALUES ('3489', '3393', '654200', '塔城地区');
INSERT INTO wp_area VALUES ('3490', '3489', '654201', '塔城市');
INSERT INTO wp_area VALUES ('3491', '3489', '654202', '乌苏市');
INSERT INTO wp_area VALUES ('3492', '3489', '654221', '额敏县');
INSERT INTO wp_area VALUES ('3493', '3489', '654223', '沙湾县');
INSERT INTO wp_area VALUES ('3494', '3489', '654224', '托里县');
INSERT INTO wp_area VALUES ('3495', '3489', '654225', '裕民县');
INSERT INTO wp_area VALUES ('3496', '3489', '654226', '和布克赛尔蒙古自治县');
INSERT INTO wp_area VALUES ('3497', '3393', '654300', '阿勒泰地区');
INSERT INTO wp_area VALUES ('3498', '3497', '654301', '阿勒泰市');
INSERT INTO wp_area VALUES ('3499', '3497', '654321', '布尔津县');
INSERT INTO wp_area VALUES ('3500', '3497', '654322', '富蕴县');
INSERT INTO wp_area VALUES ('3501', '3497', '654323', '福海县');
INSERT INTO wp_area VALUES ('3502', '3497', '654324', '哈巴河县');
INSERT INTO wp_area VALUES ('3503', '3497', '654325', '青河县');
INSERT INTO wp_area VALUES ('3504', '3497', '654326', '吉木乃县');
INSERT INTO wp_area VALUES ('3505', '3393', '659000', '自治区直辖县级行政区划');
INSERT INTO wp_area VALUES ('3506', '3505', '659001', '石河子市');
INSERT INTO wp_area VALUES ('3507', '3505', '659002', '阿拉尔市');
INSERT INTO wp_area VALUES ('3508', '3505', '659003', '图木舒克市');
INSERT INTO wp_area VALUES ('3509', '3505', '659004', '五家渠市');
INSERT INTO wp_area VALUES ('3510', '0', '710000', '台湾省');
INSERT INTO wp_area VALUES ('3511', '0', '810000', '香港特别行政区');
INSERT INTO wp_area VALUES ('3512', '0', '820000', '澳门特别行政区');

-- ----------------------------
-- Table structure for `wp_balance`
-- ----------------------------
DROP TABLE IF EXISTS `wp_balance`;
CREATE TABLE `wp_balance` (
  `bpid` int(11) NOT NULL AUTO_INCREMENT,
  `bptype` varchar(255) DEFAULT NULL COMMENT '收支类型,1充值成功,3正在充值,0提现,2后台改动4quxiao',
  `bptime` int(20) DEFAULT NULL COMMENT '操作时间',
  `bpprice` double DEFAULT NULL COMMENT '收支金额',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `isverified` int(11) DEFAULT NULL COMMENT '判断申请是否通过，0未通过，1通过',
  `cltime` int(20) DEFAULT NULL COMMENT '审核时间',
  `bankid` int(8) DEFAULT NULL COMMENT '银行卡id,对应wp_bankinfo',
  `bpbalance` varchar(28) DEFAULT NULL COMMENT '充值/提现后的余额',
  `btime` varchar(18) DEFAULT NULL COMMENT '提交时间',
  `reg_par` varchar(10) DEFAULT NULL COMMENT '手续费',
  `balance_sn` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `pay_type` varchar(255) DEFAULT NULL COMMENT '支付方式',
  PRIMARY KEY (`bpid`)
) ENGINE=MyISAM AUTO_INCREMENT=420 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_balance
-- ----------------------------
INSERT INTO wp_balance VALUES ('413', '3', '1535236731', '100', '支付宝充值', '22', null, null, null, null, '1535236731', null, '20180826063851', 'huiqingpay');
INSERT INTO wp_balance VALUES ('414', '3', '1535236783', '100', '支付宝充值', '22', null, null, null, null, '1535236783', null, '20180826063943', 'huiqingpay');
INSERT INTO wp_balance VALUES ('415', '3', '1535236929', '100', '支付宝充值', '22', null, null, null, null, '1535236929', null, '20180826064209', 'huiqingpay');
INSERT INTO wp_balance VALUES ('416', '3', '1535237785', '100', '支付宝充值', '22', null, null, null, null, '1535237785', null, '20180826065625', 'huiqingpay');
INSERT INTO wp_balance VALUES ('417', '3', '1535237806', '100', '支付宝充值', '22', null, null, null, null, '1535237806', null, '20180826065646', 'huiqingpay');
INSERT INTO wp_balance VALUES ('418', '3', '1535237864', '100', '支付宝充值', '22', null, null, null, null, '1535237864', null, '20180826065744', 'huiqingpay');
INSERT INTO wp_balance VALUES ('419', '3', '1535237922', '100', '支付宝充值', '22', null, null, null, null, '1535237922', null, '20180826065842', 'huiqingpay');

-- ----------------------------
-- Table structure for `wp_bankcard`
-- ----------------------------
DROP TABLE IF EXISTS `wp_bankcard`;
CREATE TABLE `wp_bankcard` (
  `id` mediumint(28) NOT NULL AUTO_INCREMENT,
  `bankno` mediumint(28) DEFAULT NULL COMMENT '总行代码',
  `accntnm` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '持卡人姓名',
  `cityno` mediumint(18) DEFAULT NULL COMMENT '城市代码',
  `address` varchar(288) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址',
  `uid` mediumint(18) DEFAULT NULL COMMENT '用户id',
  `accntno` varchar(38) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `isdelete` tinyint(8) DEFAULT '0',
  `content` varchar(488) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `scard` varchar(38) CHARACTER SET utf8 DEFAULT NULL COMMENT '身份证号码',
  `provinceid` mediumint(18) DEFAULT NULL COMMENT '省份id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_bankcard
-- ----------------------------
INSERT INTO wp_bankcard VALUES ('1', '4', '我们的', '641', '我们的生活方式是', '12', '6777777', '0', null, '111', '111111', '628');
INSERT INTO wp_bankcard VALUES ('2', '8', '张浩杰', '1764', '禹州市府东路支行', '11', '6226227000780035', '0', null, '13838557319', '411081198705118351', '1656');
INSERT INTO wp_bankcard VALUES ('3', '17', '李荣亮', '999', '泗洪县支行', '13', '6217993000283303637', '0', null, '15050960781', '321324198608125215', '880');
INSERT INTO wp_bankcard VALUES ('4', '3', '啊打算', '21', '哇哇 的安慰', '13', '6228480040578719321', '0', null, '13998862281', '211224199212225512', '20');
INSERT INTO wp_bankcard VALUES ('5', '4', '党鹏飞', '925', '苏州市支行', '21', '6217002000037983105', '0', null, '18792754668', '610528199502106672', '880');
INSERT INTO wp_bankcard VALUES ('6', '3', 'sdads', '398', 'nhihjhu', '15', '1651611', '0', null, '651156165', '156651651', '375');
INSERT INTO wp_bankcard VALUES ('7', '1', '12312', '21', '123123', '22', '31231', '0', null, '123', '23123', '20');

-- ----------------------------
-- Table structure for `wp_bankinfo`
-- ----------------------------
DROP TABLE IF EXISTS `wp_bankinfo`;
CREATE TABLE `wp_bankinfo` (
  `bid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '绑定',
  `bankname` varchar(20) NOT NULL COMMENT '所属银行',
  `province` varchar(20) NOT NULL COMMENT '省份',
  `city` varchar(20) NOT NULL COMMENT '城市',
  `branch` varchar(20) NOT NULL COMMENT '支行名',
  `banknumber` varchar(20) NOT NULL COMMENT '银行卡号',
  `busername` varchar(20) NOT NULL COMMENT '姓名',
  `sfzcard` varchar(28) DEFAULT NULL,
  `sfzimg` varchar(88) DEFAULT NULL,
  `is_audit` int(1) DEFAULT '0',
  `bankid` int(8) DEFAULT NULL,
  `wxhao` varchar(28) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_bankinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_banks`
-- ----------------------------
DROP TABLE IF EXISTS `wp_banks`;
CREATE TABLE `wp_banks` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `bank_no` int(18) DEFAULT NULL,
  `bank_nm` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_banks
-- ----------------------------
INSERT INTO wp_banks VALUES ('1', '102', '中国工商银行');
INSERT INTO wp_banks VALUES ('2', '103', '中国农业银行');
INSERT INTO wp_banks VALUES ('3', '104', '中国银行');
INSERT INTO wp_banks VALUES ('4', '105', '中国建设银行');
INSERT INTO wp_banks VALUES ('5', '301', '交通银行');
INSERT INTO wp_banks VALUES ('6', '308', '招商银行');
INSERT INTO wp_banks VALUES ('7', '309', '兴业银行');
INSERT INTO wp_banks VALUES ('8', '305', '中国民生银行');
INSERT INTO wp_banks VALUES ('9', '306', '广东发展银行');
INSERT INTO wp_banks VALUES ('10', '307', '平安银行股份有限');
INSERT INTO wp_banks VALUES ('11', '310', '上海浦东发展银行');
INSERT INTO wp_banks VALUES ('12', '304', '华夏银行');
INSERT INTO wp_banks VALUES ('13', '313', '其他城市商业银行');
INSERT INTO wp_banks VALUES ('14', '1401', '邯郸市城市信用社');
INSERT INTO wp_banks VALUES ('15', '314', '其他农村商业银行');
INSERT INTO wp_banks VALUES ('16', '315', '恒丰银行');
INSERT INTO wp_banks VALUES ('17', '403', '中国邮政储蓄银行');
INSERT INTO wp_banks VALUES ('18', '303', '中国光大银行');
INSERT INTO wp_banks VALUES ('19', '302', '中信银行');
INSERT INTO wp_banks VALUES ('20', '316', '浙商银行股份有限');
INSERT INTO wp_banks VALUES ('21', '318', '渤海银行股份有限');
INSERT INTO wp_banks VALUES ('22', '423', '杭州市商业银行');
INSERT INTO wp_banks VALUES ('23', '412', '温州市商业银行');
INSERT INTO wp_banks VALUES ('24', '424', '南京市商业银行');
INSERT INTO wp_banks VALUES ('25', '461', '长沙市商业银行');
INSERT INTO wp_banks VALUES ('26', '409', '济南市商业银行');
INSERT INTO wp_banks VALUES ('27', '422', '石家庄市商业银行');
INSERT INTO wp_banks VALUES ('28', '458', '西宁市商业银行');
INSERT INTO wp_banks VALUES ('29', '404', '烟台市商业银行');
INSERT INTO wp_banks VALUES ('30', '462', '潍坊市商业银行');
INSERT INTO wp_banks VALUES ('31', '515', '德州市商业银行');
INSERT INTO wp_banks VALUES ('32', '431', '临沂市商业银行');
INSERT INTO wp_banks VALUES ('33', '481', '威海商业银行');
INSERT INTO wp_banks VALUES ('34', '497', '莱芜市商业银行');
INSERT INTO wp_banks VALUES ('35', '450', '青岛市商业银行');
INSERT INTO wp_banks VALUES ('36', '319', '徽商银行');
INSERT INTO wp_banks VALUES ('37', '322', '上海农村商业银行');

-- ----------------------------
-- Table structure for `wp_cardinfo`
-- ----------------------------
DROP TABLE IF EXISTS `wp_cardinfo`;
CREATE TABLE `wp_cardinfo` (
  `cid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) NOT NULL COMMENT '用户id',
  `cardname` varchar(18) DEFAULT NULL COMMENT '身份证名字',
  `cardnum` varchar(28) DEFAULT NULL COMMENT '身份证号',
  `cardpic` varchar(288) DEFAULT NULL COMMENT '身份证照片',
  `wxnumber` varchar(88) DEFAULT NULL,
  `ctime` varchar(18) DEFAULT NULL,
  `is_check` int(1) DEFAULT '0' COMMENT '0未审核1审核通过2不通过',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_cardinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_catproduct`
-- ----------------------------
DROP TABLE IF EXISTS `wp_catproduct`;
CREATE TABLE `wp_catproduct` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `myat` double(11,1) DEFAULT '10.0' COMMENT '点差*',
  `myatjia` double(11,2) DEFAULT '0.00' COMMENT '点差+',
  `ask` double(11,2) DEFAULT '0.00' COMMENT '现在的价格',
  `high` double(11,2) DEFAULT '0.00' COMMENT '最高',
  `low` double(11,2) DEFAULT '0.00' COMMENT '最低',
  `open` double(11,2) DEFAULT '0.00' COMMENT '今开',
  `close` double(11,2) DEFAULT '0.00' COMMENT '昨收',
  `eidtime` int(20) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_catproduct
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_conf`
-- ----------------------------
DROP TABLE IF EXISTS `wp_conf`;
CREATE TABLE `wp_conf` (
  `id` mediumint(2) NOT NULL AUTO_INCREMENT,
  `webname` varchar(88) NOT NULL DEFAULT '软盟微交易系统' COMMENT '站点名称',
  `onelive` double(3,2) DEFAULT NULL COMMENT '一级分销',
  `twolive` double(3,2) DEFAULT NULL COMMENT '二级分销',
  `threelive` double(3,2) DEFAULT NULL COMMENT '三级分销',
  `pagenum` int(8) NOT NULL DEFAULT '20' COMMENT '后台分页',
  `closswebcon` text COMMENT '关闭网站说明',
  `webisopen` int(1) DEFAULT '1' COMMENT '是否关闭网站',
  `daygiveint` int(20) NOT NULL DEFAULT '0' COMMENT '每日签到赠送积分',
  `inttomoney` varchar(20) NOT NULL DEFAULT '1:1' COMMENT '积分与现金比例',
  `ordermin` decimal(20,2) NOT NULL DEFAULT '20.00' COMMENT '微交易单笔交易金额最小值限制',
  `ordermax` decimal(20,2) NOT NULL DEFAULT '5000.00' COMMENT '微交易单笔交易金额最大值限制',
  `cashmin` decimal(20,2) NOT NULL DEFAULT '100.00' COMMENT '单笔提现限制最小值',
  `cashmax` decimal(20,2) NOT NULL DEFAULT '1000.00' COMMENT '单笔提现限制最大值',
  `rechargemin` decimal(20,2) NOT NULL DEFAULT '20.00' COMMENT '单笔充值限制最小值',
  `rechargemax` decimal(20,2) NOT NULL DEFAULT '1000.00' COMMENT '单笔充值限制最大值',
  `usermaxrecharge` decimal(20,2) NOT NULL DEFAULT '1000.00' COMMENT '用户当天最大提现申请金额',
  `festivalisrec` tinyint(2) NOT NULL DEFAULT '0' COMMENT '非工作日是否支持提现',
  `userallhold` decimal(20,2) NOT NULL DEFAULT '2000.00' COMMENT '用户最大持仓金额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_conf
-- ----------------------------
INSERT INTO wp_conf VALUES ('1', '软盟微交易系统V2.0演示版', '3.00', '2.00', '1.00', '20', '网站升级维护中……', '1', '100', '100:1', '20.00', '1000.00', '100.00', '1000.00', '20.00', '1000.00', '1000.00', '0', '2000.00');

-- ----------------------------
-- Table structure for `wp_config`
-- ----------------------------
DROP TABLE IF EXISTS `wp_config`;
CREATE TABLE `wp_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL DEFAULT '' COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_config
-- ----------------------------
INSERT INTO wp_config VALUES ('1', 'web_name', '1', '网站名称', '1', '', '', '1509027150', '1509027150', '1', '芒果网络', '1');
INSERT INTO wp_config VALUES ('2', 'is_close', '1', '网站是否关闭', '1', '0关闭，1开启', '', '1498580751', '1498580751', '1', '1', '2');
INSERT INTO wp_config VALUES ('3', 'is_reg', '1', '是否开放用户注册', '2', '1开启注册0关闭注册', '', '1498580857', '1498580857', '1', '1', '1');
INSERT INTO wp_config VALUES ('4', 'web_poundage', '1', '每笔平台收取手续费', '2', '如：2%，就填写2即可', '', '1498580887', '1498580887', '1', '0', '2');
INSERT INTO wp_config VALUES ('5', 'day_cash', '1', '每日最多提现次数', '2', '', '', '1499137504', '1499137504', '1', '2', '12');
INSERT INTO wp_config VALUES ('6', 'live_num', '1', '平台分销级数', '2', '', '', '1498580962', '1498580962', '0', '5', '4');
INSERT INTO wp_config VALUES ('7', 'pay_choose', '1', '投资金额', '2', '以 | 符号隔开', '', '1498581030', '1498581030', '1', '100|200|500|1000|5000', '5');
INSERT INTO wp_config VALUES ('8', 'order_min_price', '1', '单笔最低下单金额', '2', '', '', '1504767331', '1504767331', '1', '100', '6');
INSERT INTO wp_config VALUES ('9', 'order_max_price', '1', '单笔最高下单金额', '2', '', '', '1504767338', '1504767338', '1', '5000', '7');
INSERT INTO wp_config VALUES ('10', 'reg_par', '1', '每笔提现手续费', '2', '输入百分比，如2%就输入2', '', '1499132509', '1499132509', '1', '30', '8');
INSERT INTO wp_config VALUES ('11', 'cash_min', '1', '最低提现金额', '2', '', '', '1499132653', '1499132653', '1', '100', '9');
INSERT INTO wp_config VALUES ('12', 'cash_max', '1', '单笔提现最大金额', '2', '', '', '1499132757', '1499132757', '1', '20000', '10');
INSERT INTO wp_config VALUES ('13', 'cash_day_max', '1', '当日累计最高提现金额', '2', '', '', '1499138112', '1499138112', '1', '50000', '11');
INSERT INTO wp_config VALUES ('14', 'is_cash', '1', '是否开启提现', '2', '1开启0关闭', '', '1499138225', '1499138225', '1', '1', '15');
INSERT INTO wp_config VALUES ('15', 'msm_SignName', '1', '短信签名', '1', '', '', '1499259617', '1499259617', '1', '芒果网络', '3');
INSERT INTO wp_config VALUES ('16', 'msm_appkey', '1', '短信key', '1', '', '', '1499259639', '1499259639', '1', 'a249406646', '4');
INSERT INTO wp_config VALUES ('17', 'msm_secretkey', '1', '短信秘钥', '1', '', '', '1499259659', '1499259659', '1', 'zhang130', '6');
INSERT INTO wp_config VALUES ('18', 'msm_TCode', '1', '短信模板', '1', '', '', '1499259682', '1499259682', '1', '', '7');
INSERT INTO wp_config VALUES ('19', 'allot_point', '1', '代理红利分配比例', '2', '百分比，80%输入80。平仓后按照下单价格乘以此比例进行对冲 ', '', '1500304738', '1500304738', '0', '100', '16');
INSERT INTO wp_config VALUES ('20', 'yongjin_point', '1', '代理佣金分配比例', '2', '百分比，10%输入10。平仓后按照下单价格乘以此比例为手续费奖励给代理团队', '', '1500304746', '1500304746', '0', '10', '17');
INSERT INTO wp_config VALUES ('21', 'reg_type', '1', '注册是否需要激活', '2', '1不需激活2需要激活', '', '1502335131', '1502335131', '1', '1', '21');
INSERT INTO wp_config VALUES ('22', 'kong_end', '1', '订单受风控时间', '2', '输入10-15，则订单在平仓之前10-15秒开始受到风控影响。', '', '1503718796', '1503718796', '1', '5-15', '28');
INSERT INTO wp_config VALUES ('23', 'userpay_max', '1', '单笔最大入金', '2', '', '', '1504678164', '1504678164', '1', '10000', '28');
INSERT INTO wp_config VALUES ('24', 'userpay_min', '1', '单笔最小入金', '2', '', '', '1504678193', '1504678193', '1', '0', '29');
INSERT INTO wp_config VALUES ('25', 'max_order_count', '1', '最大持仓单数', '2', '', '', '1504770831', '1504770831', '1', '10', '7');
INSERT INTO wp_config VALUES ('26', 'web_logo', '3', 'LOGO', '1', '', '', '1506779011', '1506779011', '1', '/public\\uploads/20180729\\996e0e549d2994b2b8b327f5f6dfdbd3.png', '10');
INSERT INTO wp_config VALUES ('27', 'index_img1', '3', '首页广告', '1', '', '', '1506779458', '1506779458', '0', '/public\\uploads/20170930\\4328c346cd51cb8a9340195893f16d28.png', '11');
INSERT INTO wp_config VALUES ('28', 'reg_push', '1', '充值金额', '2', '用|隔开', '', '1506779553', '1506779553', '1', '100|500|1000|2000|5000|10000', '30');
INSERT INTO wp_config VALUES ('29', 'can_kong', '1', '可单控用户', '2', '除管理员外的代理商ID，多个用英文逗号隔开如： 8888,9999', '', '1510218878', '1510218878', '1', '', '40');
INSERT INTO wp_config VALUES ('30', 'gonggao', '2', '公告', '1', '公告', '', '1520838051', '1520838051', '1', '系统搭建联系', '0');
INSERT INTO wp_config VALUES ('31', 'zcxy', '2', '注册协议', '1', '', '', '1520865455', '1520865455', '1', '<p>	本协议是您与芒果网络所有者之间就芒果网络网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击“同意并继续”按钮后，本协议即构成对双方有约束力的法律文件。<br/>第一条芒果网络服务条款的确认和接纳<br/>1.1芒果网络的各项电子服务的所有权和运作权归芒果网络所有。用户同意所有注册协议条款并完成注册程序，才能成为芒果网络的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。<br/>1.2用户点击同意本协议的，即视为用户确认自己具有享受芒果网络服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。<br/>1.3如果您在18周岁以下，您则不能注册芒果网络用户。<br/>1.4芒果网络保留在中华人民共和国大陆地区施行之法律允许的范围内独自决定拒绝服务、关闭用户账户、清除或编辑内容或取消订单的权利。<br/>第二条芒果网络服务<br/>芒果网络通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及芒果网络规定的情况下，方有权使用芒果网络的相关服务。<br/>第三条用户信息及隐私保护<br/>3.1用户应自行诚信向芒果网络提供注册资料，用户确保其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽、或变更信息不及时的，用户需承担因此引起的相应责任及后果，并且芒果网络保留终止用户使用芒果网络各项服务的权利。<br/>3.2用户同意，芒果网络拥有通过邮件、短信电话等形式，向在芒果网络注册、购物用户、收货人发送订单信息、促销活动等告知信息的权利。<br/>3.3一旦注册成功成为用户，用户将得到一个密码和帐号，用户需要对自己在帐户中的所有活动和事件负责。如果由于自身的过失导致帐号和密码脱离控制，由此导致的针对您、或任何第三方造成的损害，用户将承担全部责任。<br/>3.4保护用户隐私是芒果网络的一项基本政策，芒果网络保证不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在芒果网络的非公开内容，但下列情况除外：（1）事先获得用户的明确授权或同意；（2）根据有关的法律法规要求；（3）按照相关政府主管部门的要求；（4）为维护社会公众的利益；（5）为维护芒果网络的合法权益。<br/>3.5在不透露单个用户隐私资料的前提下，芒果网络有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。<br/>第四条用户依法言行义务<br/>本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：<br/>4.1遵守中国有关的法律和法规；<br/>4.2遵守所有与网络服务有关的网络协议、规定和程序；<br/>4.3不得为任何非法目的而使用芒果网络网络服务系统；<br/>4.4不得利用芒果网络网络服务系统进行任何可能对互联网或移动网正常运转造成不利影响的行为；<br/>4.5不得利用芒果网络提供的网络服务上传、展示或传播任何虚假的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、庸俗淫秽的或其他任何非法的信息资料；<br/>4.6不得侵犯芒果网络的专利权、著作权、商标权、名誉权或其他任何合法权益；<br/>4.7如发现任何非法使用用户帐号或帐号出现安全漏洞的情况，应立即通知芒果网络。<br/>用户应及时关注并遵守芒果网络不时公布或修改的各类合法规则规定。<br/>芒果网络保有删除站内各类不符合法律政策或不真实的信息内容而无须通知用户的权利。<br/>用户须对自己在网上的言论和行为承担法律责任。<br/>第五条商品信息<br/>芒果网络上的商品价格、数量、是否有货等商品信息随时都有可能发生变动，芒果网络不作特别通知。由于商城上商品信息的数量庞大，虽然芒果网络会尽最大努力保证您所浏览商品信息的准确性，但由于众所周知的互联网技术因素等客观原因存在，商城显示的信息可能会有一定的滞后性或差错，对此情形您知悉并理解，同意免除芒果网络商城的责任。<br/>第六条订单<br/>6.1在您下订单时，请您仔细确认所购商品的名称、价格、数量、型号、规格、尺寸、联系地址、电话、收货人等信息。收货人与用户本人不一致的，收货人的行为和意思表示视为用户的行为和意思表示，用户应对收货人的行为及意思表示的法律后果承担连带责任。<br/>6.2由于市场变化及各种以合理商业努力难以控制的因素的影响，芒果网络无法保证您提交的订单信息中希望购买的商品都会有货；如您拟购买的商品，发生缺货，您有权取消订单。<br/>6.3作弊订单是指影响平台交易秩序的订单（包括但不限于未发生实际交易、多个帐户多次使用同一收货地址、多个帐户多次使用同一支付账号等行为且未通过平台反作弊技术审核的；），芒果网络可根据运营需要，修订作弊订单的判定和技术审核规则；对作弊订单，芒果网络保留取消订单、取消优惠券、删除相关用户帐户的权利，并有权追究相关方的法律责任。<br/>第七条配送<br/>因如下情况造成订单延迟或无法配送等，销售方不承担延迟配送的责任：<br/>（1）用户提供的信息错误、地址不详细等原因导致的；<br/>（2）货物送达后无人签收，导致无法配送或延迟配送的；<br/>（3）国家政策法规等因素导致的；<br/>（4）不可抗力因素导致的，例如：自然灾害、交通戒严、突发战争等。<br/>第八条所有权及知识产权条款<br/>8.1提供的网络服务中包含的任何文本、图片、图形、音频和/或视频资料均受版权、商标和/或其它财产所有权法律的保护，未经相关权利人同意，上述资料均不得用于任何商业目的。<br/>8.2为提供网络服务而使用的任何软件（包括但不限于软件中所含的任何图象、照片、动画、录像、录音、音乐、文字和附加程序、随附的帮助材料）的一切权利均属于该软件的著作权人，未经该软件的著作权人许可，用户不得对该软件进行反向工程、反向编译或反汇编。<br/>第九条责任限制及不承诺担保<br/>9.1芒果网络不担保网络服务一定能满足用户的要求，也不担保网络服务不会中断，对网络服务的及时性、安全性、准确性也都不作担保。<br/>9.2对于因电信系统或互联网网络故障、计算机故障或病毒、信息损坏或丢失、计算机系统问题或其它任何不可抗力原因而产生损失，芒果网络不承担任何责任，但将尽力减少因此而给用户造成的损失和影响。<br/>第十条协议更新及用户关注义务<br/>根据国家法律法规变化及网站运营需要，芒果网络有权对本协议条款不时地进行修改，修改后的协议一旦被张贴在芒果网络上即生效，并代替原来的协议。用户可随时登录查阅最新协议；用户有义务不时关注并阅读最新版的协议及公告。如用户不同意更新后的协议，可以且应立即停止接受芒果网络依据本协议提供的服务；如用户继续使用本网站提供的服务的，即视为同意更新后的协议。建议您在使用芒果网络之前阅读本协议及公告。如果本协议中任何一条被视为废止、无效或因任何理由不可执行，该条应视为可分的且并不影响任何其余条款的有效性和可执行性。<br/>第十一条法律管辖和适用<br/>本协议的订立、执行和解释及争议的解决均应适用在中华人民共和国大陆地区适用之有效法律（但不包括其冲突法规则）。如发生本协议与适用之法律相抵触时，则这些条款将完全按法律规定重新解释，而其它有效条款继续有效。如缔约方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决；协商不成时，任何一方均可青岛有管辖权的法院提起诉讼。<br/>第十二条其他<br/>12.1芒果网络尊重用户和消费者的合法权利，本协议及本网站上发布的各类规则、声明等其他内容，均是为了更好地、更加便利地为用户和消费者提供服务。芒果网络欢迎用户和社会各界提出意见和建议，芒果网络将虚心接受并适时修改本协议及芒果网络上的各类规则。<br/>12.2您点击本协议下方的“同意并继续”按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</p>', '0');
INSERT INTO wp_config VALUES ('32', 'jjtouzi', '1', '奖金投资翻倍', '2', '奖金投资翻倍', '', '1534957397', '1534957397', '1', '5', '0');
INSERT INTO wp_config VALUES ('33', 'jjdaishu', '1', '奖金代数奖', '2', '用英文逗号分开，例如：1,2,3', '', '1535003836', '1535003836', '1', '2,1', '0');
INSERT INTO wp_config VALUES ('34', 'tzdaishu', '1', '投资代数奖', '2', '用英文逗号分开，例如：1,2,3', '', '1535003891', '1535003891', '1', '10,5', '0');
INSERT INTO wp_config VALUES ('35', 'dongjietime', '1', '订单冻结时间', '2', '单位天', '', '1535004191', '1535004191', '1', '90', '6');
INSERT INTO wp_config VALUES ('36', 'dailitouzi', '1', '代理商总投资', '2', '成为代理商总投资', '', '1535004403', '1535004403', '1', '10000', '5');
INSERT INTO wp_config VALUES ('37', 'wuxiandaishu', '1', '无限奖', '2', '代理商无限奖', '', '1535004438', '1535004438', '1', '5', '5');
INSERT INTO wp_config VALUES ('38', 'winprice', '1', '盈比例', '2', '盈比例', '', '1535012423', '1535012423', '1', '5', '5');
INSERT INTO wp_config VALUES ('39', 'lossprice', '1', '亏比例', '2', '亏比例', '', '1535012439', '1535012439', '1', '2', '5');
INSERT INTO wp_config VALUES ('40', 'reg_money', '1', '注册送', '2', '注册送多少金额', '', '1535233324', '1535233324', '1', '10', '5');

-- ----------------------------
-- Table structure for `wp_integral`
-- ----------------------------
DROP TABLE IF EXISTS `wp_integral`;
CREATE TABLE `wp_integral` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `type` int(1) DEFAULT '0' COMMENT '0购买1签到2注册',
  `amount` int(8) DEFAULT '0' COMMENT '数量',
  `time` int(18) DEFAULT NULL COMMENT '时间',
  `uid` mediumint(8) DEFAULT NULL COMMENT '用户id',
  `oid` mediumint(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_integral
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_klinedata`
-- ----------------------------
DROP TABLE IF EXISTS `wp_klinedata`;
CREATE TABLE `wp_klinedata` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `ktime` varchar(18) NOT NULL COMMENT 'k线时间',
  `updata` varchar(18) DEFAULT NULL COMMENT '最高值',
  `downdata` varchar(18) DEFAULT NULL COMMENT '最低值',
  `pid` mediumint(18) NOT NULL COMMENT '产品id',
  `opendata` varchar(18) DEFAULT NULL COMMENT '开盘价格',
  `closdata` varchar(18) DEFAULT NULL COMMENT '关盘价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_klinedata
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_newsclass`
-- ----------------------------
DROP TABLE IF EXISTS `wp_newsclass`;
CREATE TABLE `wp_newsclass` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fclass` varchar(255) DEFAULT NULL,
  `isdelete` int(1) DEFAULT '0',
  PRIMARY KEY (`fid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_newsclass
-- ----------------------------
INSERT INTO wp_newsclass VALUES ('1', '最新资讯', '0');
INSERT INTO wp_newsclass VALUES ('2', '财经要闻', '0');
INSERT INTO wp_newsclass VALUES ('3', '系统公告', '1');
INSERT INTO wp_newsclass VALUES ('4', '时政新闻', '1');

-- ----------------------------
-- Table structure for `wp_newsinfo`
-- ----------------------------
DROP TABLE IF EXISTS `wp_newsinfo`;
CREATE TABLE `wp_newsinfo` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `ntitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `ncontent` text COMMENT '内容',
  `ncover` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `fid` int(11) DEFAULT NULL COMMENT '新闻分类id',
  `ntime` int(20) DEFAULT NULL COMMENT '发布时间',
  `nauthor` varchar(18) DEFAULT NULL,
  `isdelete` int(1) DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_newsinfo
-- ----------------------------
INSERT INTO wp_newsinfo VALUES ('1', '第一篇测试', '<p>会就爱上空间划分来看的手机了看打发时间的镂空更好的发生了空间该路段发生<img src=\"http://nww.cc/static/public/umeditor/php/upload/20170215/14871283125352.jpg\"/></p>', null, '2', '1487128315', 'lukui', '0');
INSERT INTO wp_newsinfo VALUES ('2', '第二篇哦', '<p>阿斯顿撒旦萨达阿萨德</p>', null, '3', '1487128421', 'admin', '0');
INSERT INTO wp_newsinfo VALUES ('3', '第三票哦哦哦 哦 ', '<p>萨达萨达萨达</p>', null, '2', '1487128433', '撒旦撒', '0');
INSERT INTO wp_newsinfo VALUES ('4', '阿萨德撒', '<p>阿萨德撒倒萨大</p>', null, '1', '1487130009', '阿萨德', '1');
INSERT INTO wp_newsinfo VALUES ('5', '撒旦撒', '<p>国际化过几个</p>', null, '2', '1487139415', '阿萨德', '0');
INSERT INTO wp_newsinfo VALUES ('6', '萨达', '<p>阿萨德撒</p>', null, '1', '1487139591', '萨达', '0');
INSERT INTO wp_newsinfo VALUES ('7', '的顶顶顶顶顶', '<p>阿萨德阿萨德萨达</p>', null, '2', '1487139655', '阿萨德', '0');

-- ----------------------------
-- Table structure for `wp_opentime`
-- ----------------------------
DROP TABLE IF EXISTS `wp_opentime`;
CREATE TABLE `wp_opentime` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `pid` mediumint(18) NOT NULL,
  `opentime` varchar(888) DEFAULT NULL COMMENT '开市时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_opentime
-- ----------------------------
INSERT INTO wp_opentime VALUES ('6', '11', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('7', '12', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('8', '10', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('9', '9', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('10', '8', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('11', '6', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('12', '7', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('13', '0', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('14', '13', '00:00~03:00|08:00~24:00-00:00~03:00|08:00~24:00-00:00~03:00|08:00~24:00-00:00~03:00|08:00~24:00-00:00~03:00|08:00~24:00---');
INSERT INTO wp_opentime VALUES ('15', '14', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00---');
INSERT INTO wp_opentime VALUES ('16', '16', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('17', '17', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('18', '20', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('19', '21', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('20', '18', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('21', '19', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');
INSERT INTO wp_opentime VALUES ('22', '22', '09:15~11:30|13:00~15:15-09:15~11:30|13:00~15:15-09:15~11:30|13:00~15:15-09:15~11:30|13:00~15:15-09:15~11:30|13:00~15:15---');
INSERT INTO wp_opentime VALUES ('23', '23', '00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-00:00~24:00-');

-- ----------------------------
-- Table structure for `wp_order`
-- ----------------------------
DROP TABLE IF EXISTS `wp_order`;
CREATE TABLE `wp_order` (
  `oid` int(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '商品编号',
  `pid` int(11) NOT NULL COMMENT '产品ID',
  `ostyle` int(12) NOT NULL DEFAULT '0' COMMENT '0涨 1跌，',
  `buytime` int(20) DEFAULT NULL COMMENT '建仓',
  `onumber` int(20) DEFAULT NULL COMMENT '手数',
  `selltime` int(20) DEFAULT '0' COMMENT '平仓',
  `ostaus` int(11) DEFAULT NULL COMMENT '0交易，1平仓',
  `buyprice` double(20,6) DEFAULT NULL COMMENT '入仓价',
  `sellprice` varchar(20) DEFAULT '0.000000' COMMENT '平仓价',
  `endprofit` varchar(20) DEFAULT '0.00' COMMENT '点数/分钟数',
  `endloss` int(11) DEFAULT '0' COMMENT '盈亏比例',
  `fee` double(11,1) DEFAULT NULL COMMENT '总费用',
  `eid` float(11,2) NOT NULL COMMENT '1点位、2时间',
  `orderno` varchar(40) DEFAULT NULL COMMENT '订单编号',
  `ptitle` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `commission` double(255,1) DEFAULT '0.0' COMMENT '佣金',
  `ploss` double(255,2) DEFAULT '0.00' COMMENT '盈亏',
  `display` int(11) DEFAULT '0' COMMENT '0,可查询，1不可查询',
  `isshow` int(1) DEFAULT '0',
  `is_win` tinyint(1) DEFAULT NULL COMMENT '是否盈利1盈利2亏损3无效',
  `kong_type` tinyint(1) DEFAULT '0' COMMENT '0不空1盈利2亏损',
  `sx_fee` varchar(18) DEFAULT NULL COMMENT '手续费',
  `ptype` smallint(2) DEFAULT '0' COMMENT '0 余额 1 奖金',
  `isjiedong` tinyint(1) DEFAULT '0' COMMENT '0冻结 1解冻',
  PRIMARY KEY (`oid`),
  KEY `uidd` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=811 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_order
-- ----------------------------
INSERT INTO wp_order VALUES ('809', '13', '23', '0', '1535009044', null, '1535032800', '0', '6431.090000', '0.000000', '23756', '5', '100.0', '2.00', '201808231524046897', '比特币', '1072027.4', '0.00', '0', '0', null, '0', '0', '0', '0');
INSERT INTO wp_order VALUES ('810', '13', '23', '0', '1535009086', null, '1535032800', '0', '6432.130000', '0.000000', '23714', '5', '100.0', '2.00', '201808231524464647', '比特币', '1071927.4', '0.00', '0', '0', null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `wp_order_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_order_log`;
CREATE TABLE `wp_order_log` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(8) DEFAULT NULL,
  `oid` mediumint(8) DEFAULT NULL,
  `addprice` decimal(10,2) DEFAULT NULL,
  `addpoint` decimal(10,2) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `user_money` decimal(20,2) DEFAULT NULL,
  `is_delete` int(2) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=809 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_order_log
-- ----------------------------
INSERT INTO wp_order_log VALUES ('1', '2', '1', '188.00', '0.00', '1510911699', '100086.00', '0');
INSERT INTO wp_order_log VALUES ('2', '2', '2', '376.00', '0.00', '1510911772', '99340.00', '0');
INSERT INTO wp_order_log VALUES ('3', '2', '3', '188.00', '0.00', '1510911774', '99528.00', '0');
INSERT INTO wp_order_log VALUES ('4', '2', '4', '188.00', '0.00', '1510911776', '99716.00', '0');
INSERT INTO wp_order_log VALUES ('5', '2', '5', '188.00', '0.00', '1510911777', '99904.00', '0');
INSERT INTO wp_order_log VALUES ('6', '2', '6', '376.00', '0.00', '1510911780', '100280.00', '0');
INSERT INTO wp_order_log VALUES ('7', '2', '7', '376.00', '0.00', '1510911782', '100656.00', '0');
INSERT INTO wp_order_log VALUES ('8', '2', '8', '200.00', '0.00', '1510911783', '100856.00', '0');
INSERT INTO wp_order_log VALUES ('9', '2', '9', '0.00', '0.00', '1510911919', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('10', '2', '10', '0.00', '0.00', '1510911921', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('11', '2', '11', '0.00', '0.00', '1510911922', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('12', '2', '12', '0.00', '0.00', '1510911924', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('13', '2', '13', '0.00', '0.00', '1510911924', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('14', '2', '14', '0.00', '0.00', '1510911925', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('15', '2', '15', '0.00', '0.00', '1510911925', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('16', '2', '16', '0.00', '0.00', '1510911927', '100040.00', '0');
INSERT INTO wp_order_log VALUES ('17', '2', '17', '188.00', '0.00', '1510912013', '99718.00', '0');
INSERT INTO wp_order_log VALUES ('18', '2', '18', '188.00', '0.00', '1510912017', '99906.00', '0');
INSERT INTO wp_order_log VALUES ('19', '2', '19', '188.00', '0.00', '1510912017', '100094.00', '0');
INSERT INTO wp_order_log VALUES ('20', '2', '20', '188.00', '0.00', '1510912017', '100282.00', '0');
INSERT INTO wp_order_log VALUES ('21', '2', '21', '0.00', '0.00', '1510912018', '100282.00', '0');
INSERT INTO wp_order_log VALUES ('22', '2', '22', '188.00', '0.00', '1510912212', '100062.00', '0');
INSERT INTO wp_order_log VALUES ('23', '2', '23', '188.00', '0.00', '1510912215', '100250.00', '0');
INSERT INTO wp_order_log VALUES ('24', '2', '24', '188.00', '0.00', '1510912215', '100438.00', '0');
INSERT INTO wp_order_log VALUES ('25', '2', '25', '188.00', '0.00', '1510912218', '100626.00', '0');
INSERT INTO wp_order_log VALUES ('26', '2', '26', '0.00', '0.00', '1510913327', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('27', '2', '27', '0.00', '0.00', '1510913328', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('28', '2', '28', '0.00', '0.00', '1510913328', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('29', '2', '29', '0.00', '0.00', '1510913328', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('30', '2', '30', '0.00', '0.00', '1510913328', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('31', '2', '31', '0.00', '0.00', '1510913329', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('32', '2', '32', '0.00', '0.00', '1510913330', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('33', '2', '33', '0.00', '0.00', '1510913331', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('34', '2', '34', '0.00', '0.00', '1510913331', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('35', '2', '35', '0.00', '0.00', '1510913332', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('36', '2', '36', '0.00', '0.00', '1510913333', '99504.00', '0');
INSERT INTO wp_order_log VALUES ('37', '2', '37', '0.00', '0.00', '1510913793', '97464.00', '0');
INSERT INTO wp_order_log VALUES ('38', '2', '38', '0.00', '0.00', '1510913794', '97464.00', '0');
INSERT INTO wp_order_log VALUES ('39', '2', '39', '0.00', '0.00', '1510913795', '97464.00', '0');
INSERT INTO wp_order_log VALUES ('40', '2', '40', '376.00', '0.00', '1510913797', '97840.00', '0');
INSERT INTO wp_order_log VALUES ('41', '2', '41', '376.00', '0.00', '1510913801', '98216.00', '0');
INSERT INTO wp_order_log VALUES ('42', '2', '42', '376.00', '0.00', '1510913801', '98592.00', '0');
INSERT INTO wp_order_log VALUES ('43', '2', '43', '0.00', '0.00', '1510913803', '98592.00', '0');
INSERT INTO wp_order_log VALUES ('44', '2', '44', '376.00', '0.00', '1510913805', '98968.00', '0');
INSERT INTO wp_order_log VALUES ('45', '2', '45', '376.00', '0.00', '1510913806', '99344.00', '0');
INSERT INTO wp_order_log VALUES ('46', '2', '46', '0.00', '0.00', '1510913807', '99344.00', '0');
INSERT INTO wp_order_log VALUES ('47', '2', '47', '188.00', '0.00', '1510913889', '98512.00', '0');
INSERT INTO wp_order_log VALUES ('48', '2', '48', '188.00', '0.00', '1510913890', '98700.00', '0');
INSERT INTO wp_order_log VALUES ('49', '2', '49', '188.00', '0.00', '1510913893', '98888.00', '0');
INSERT INTO wp_order_log VALUES ('50', '2', '50', '188.00', '0.00', '1510913893', '99076.00', '0');
INSERT INTO wp_order_log VALUES ('51', '2', '51', '188.00', '0.00', '1510913895', '99264.00', '0');
INSERT INTO wp_order_log VALUES ('52', '2', '52', '188.00', '0.00', '1510913895', '99452.00', '0');
INSERT INTO wp_order_log VALUES ('53', '2', '53', '188.00', '0.00', '1510913899', '99640.00', '0');
INSERT INTO wp_order_log VALUES ('54', '2', '54', '188.00', '0.00', '1510913899', '99828.00', '0');
INSERT INTO wp_order_log VALUES ('55', '2', '55', '188.00', '0.00', '1510913901', '100016.00', '0');
INSERT INTO wp_order_log VALUES ('56', '2', '56', '188.00', '0.00', '1510913902', '100204.00', '0');
INSERT INTO wp_order_log VALUES ('57', '2', '57', '0.00', '0.00', '1510913968', '98164.00', '0');
INSERT INTO wp_order_log VALUES ('58', '2', '58', '0.00', '0.00', '1510913971', '98164.00', '0');
INSERT INTO wp_order_log VALUES ('59', '2', '59', '0.00', '0.00', '1510913971', '98164.00', '0');
INSERT INTO wp_order_log VALUES ('60', '2', '60', '0.00', '0.00', '1510913971', '98164.00', '0');
INSERT INTO wp_order_log VALUES ('61', '2', '61', '0.00', '0.00', '1510913972', '98164.00', '0');
INSERT INTO wp_order_log VALUES ('62', '2', '62', '376.00', '0.00', '1510913976', '98540.00', '0');
INSERT INTO wp_order_log VALUES ('63', '2', '63', '376.00', '0.00', '1510913976', '98916.00', '0');
INSERT INTO wp_order_log VALUES ('64', '2', '64', '376.00', '0.00', '1510913976', '99292.00', '0');
INSERT INTO wp_order_log VALUES ('65', '2', '65', '376.00', '0.00', '1510913976', '99668.00', '0');
INSERT INTO wp_order_log VALUES ('66', '2', '66', '0.00', '0.00', '1510913978', '99668.00', '0');
INSERT INTO wp_order_log VALUES ('67', '2', '67', '0.00', '0.00', '1510914056', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('68', '2', '68', '0.00', '0.00', '1510914056', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('69', '2', '69', '0.00', '0.00', '1510914058', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('70', '2', '70', '0.00', '0.00', '1510914058', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('71', '2', '71', '0.00', '0.00', '1510914059', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('72', '2', '72', '0.00', '0.00', '1510914061', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('73', '2', '73', '0.00', '0.00', '1510914062', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('74', '2', '74', '0.00', '0.00', '1510914065', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('75', '2', '75', '0.00', '0.00', '1510914065', '94568.00', '0');
INSERT INTO wp_order_log VALUES ('77', '2', '76', '940.00', '0.00', '1510914070', '95508.00', '0');
INSERT INTO wp_order_log VALUES ('78', '2', '77', '0.00', '0.00', '1510914112', '94488.00', '0');
INSERT INTO wp_order_log VALUES ('79', '2', '78', '0.00', '0.00', '1510914113', '94488.00', '0');
INSERT INTO wp_order_log VALUES ('80', '2', '79', '188.00', '0.00', '1510914115', '94676.00', '0');
INSERT INTO wp_order_log VALUES ('81', '2', '80', '188.00', '0.00', '1510914115', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('82', '2', '81', '0.00', '0.00', '1510914116', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('83', '2', '82', '0.00', '0.00', '1510914116', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('84', '2', '83', '0.00', '0.00', '1510914118', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('85', '2', '84', '0.00', '0.00', '1510914118', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('86', '2', '85', '0.00', '0.00', '1510914119', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('87', '2', '86', '0.00', '0.00', '1510914119', '94864.00', '0');
INSERT INTO wp_order_log VALUES ('88', '2', '87', '0.00', '0.00', '1510914200', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('89', '2', '88', '0.00', '0.00', '1510914203', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('90', '2', '89', '0.00', '0.00', '1510914203', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('91', '2', '90', '0.00', '0.00', '1510914205', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('92', '2', '91', '0.00', '0.00', '1510914205', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('93', '2', '92', '0.00', '0.00', '1510914206', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('94', '2', '93', '0.00', '0.00', '1510914206', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('95', '2', '94', '0.00', '0.00', '1510914208', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('96', '2', '95', '0.00', '0.00', '1510914209', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('97', '2', '96', '0.00', '0.00', '1510914211', '92824.00', '0');
INSERT INTO wp_order_log VALUES ('98', '2', '97', '0.00', '0.00', '1510914355', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('99', '2', '98', '0.00', '0.00', '1510914359', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('100', '2', '99', '0.00', '0.00', '1510914359', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('101', '2', '100', '0.00', '0.00', '1510914359', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('102', '2', '101', '0.00', '0.00', '1510914359', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('103', '2', '102', '0.00', '0.00', '1510914360', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('104', '2', '103', '0.00', '0.00', '1510914362', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('105', '2', '104', '0.00', '0.00', '1510914362', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('106', '2', '105', '0.00', '0.00', '1510914364', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('107', '2', '106', '0.00', '0.00', '1510914364', '87724.00', '0');
INSERT INTO wp_order_log VALUES ('109', '2', '107', '188.00', '0.00', '1510914537', '87810.00', '0');
INSERT INTO wp_order_log VALUES ('110', '4', '108', '0.00', '0.00', '1510990209', '3980.00', '0');
INSERT INTO wp_order_log VALUES ('112', '2', '109', '188.00', '0.00', '1511072407', '87896.00', '0');
INSERT INTO wp_order_log VALUES ('113', '2', '110', '1880.00', '0.00', '1511101006', '88756.00', '0');
INSERT INTO wp_order_log VALUES ('114', '4', '111', '188.00', '0.00', '1511107474', '4066.00', '0');
INSERT INTO wp_order_log VALUES ('115', '6', '112', '0.00', '0.00', '1511109275', '99796.00', '0');
INSERT INTO wp_order_log VALUES ('116', '6', '113', '0.00', '0.00', '1511109465', '99082.00', '0');
INSERT INTO wp_order_log VALUES ('117', '6', '113', '0.00', '0.00', '1511109465', '99082.00', '0');
INSERT INTO wp_order_log VALUES ('118', '6', '115', '0.00', '0.00', '1511109517', '98878.00', '0');
INSERT INTO wp_order_log VALUES ('119', '6', '116', '0.00', '0.00', '1511109525', '98878.00', '0');
INSERT INTO wp_order_log VALUES ('120', '6', '114', '0.00', '0.00', '1511109615', '98878.00', '0');
INSERT INTO wp_order_log VALUES ('121', '2', '117', '0.00', '0.00', '1511162072', '88450.00', '0');
INSERT INTO wp_order_log VALUES ('122', '2', '118', '0.00', '0.00', '1511162074', '88450.00', '0');
INSERT INTO wp_order_log VALUES ('123', '2', '119', '0.00', '0.00', '1511162077', '88450.00', '0');
INSERT INTO wp_order_log VALUES ('124', '7', '120', '0.00', '0.00', '1511416464', '999894.00', '0');
INSERT INTO wp_order_log VALUES ('125', '4', '121', '0.00', '0.00', '1511418372', '3658.00', '0');
INSERT INTO wp_order_log VALUES ('126', '4', '122', '0.00', '0.00', '1511418395', '3658.00', '0');
INSERT INTO wp_order_log VALUES ('128', '7', '123', '18800.00', '0.00', '1511425643', '1008495.50', '0');
INSERT INTO wp_order_log VALUES ('129', '7', '124', '9400.00', '0.00', '1511425727', '1012795.50', '0');
INSERT INTO wp_order_log VALUES ('130', '7', '125', '0.00', '0.00', '1511425802', '1007695.50', '0');
INSERT INTO wp_order_log VALUES ('131', '7', '126', '0.00', '0.00', '1511425870', '997495.50', '0');
INSERT INTO wp_order_log VALUES ('132', '7', '127', '0.00', '0.00', '1511425943', '992395.50', '0');
INSERT INTO wp_order_log VALUES ('133', '7', '128', '18800.00', '0.00', '1511426039', '1000995.50', '0');
INSERT INTO wp_order_log VALUES ('134', '7', '129', '0.00', '0.00', '1511426391', '990795.50', '0');
INSERT INTO wp_order_log VALUES ('135', '7', '130', '18800.00', '0.00', '1511426430', '999395.50', '0');
INSERT INTO wp_order_log VALUES ('137', '7', '131', '0.00', '0.00', '1511426466', '989195.50', '0');
INSERT INTO wp_order_log VALUES ('138', '7', '132', '0.00', '0.00', '1511426501', '978995.50', '0');
INSERT INTO wp_order_log VALUES ('140', '7', '133', '0.00', '0.00', '1511426535', '968795.50', '0');
INSERT INTO wp_order_log VALUES ('141', '7', '134', '18800.00', '0.00', '1511426569', '977395.50', '0');
INSERT INTO wp_order_log VALUES ('142', '4', '135', '0.00', '0.00', '1512071571', '123454.00', '0');
INSERT INTO wp_order_log VALUES ('143', '4', '136', '0.00', '0.00', '1512071582', '123454.00', '0');
INSERT INTO wp_order_log VALUES ('144', '4', '137', '0.00', '0.00', '1512071716', '123352.00', '0');
INSERT INTO wp_order_log VALUES ('145', '4', '138', '0.00', '0.00', '1512072135', '123250.00', '0');
INSERT INTO wp_order_log VALUES ('146', '12', '139', '0.00', '0.00', '1512126188', '99490.00', '0');
INSERT INTO wp_order_log VALUES ('147', '12', '140', '0.00', '0.00', '1512126371', '98470.00', '0');
INSERT INTO wp_order_log VALUES ('148', '12', '141', '0.00', '0.00', '1512126585', '97960.00', '0');
INSERT INTO wp_order_log VALUES ('149', '11', '142', '0.00', '0.00', '1512127790', '9999998980.00', '0');
INSERT INTO wp_order_log VALUES ('150', '11', '143', '0.00', '0.00', '1512128147', '9999997960.00', '0');
INSERT INTO wp_order_log VALUES ('151', '11', '144', '0.00', '0.00', '1512128226', '9999995920.00', '0');
INSERT INTO wp_order_log VALUES ('152', '11', '145', '0.00', '0.00', '1512128245', '9999995920.00', '0');
INSERT INTO wp_order_log VALUES ('153', '12', '146', '0.00', '0.00', '1512128553', '87760.00', '0');
INSERT INTO wp_order_log VALUES ('154', '12', '147', '0.00', '0.00', '1512128607', '77560.00', '0');
INSERT INTO wp_order_log VALUES ('155', '12', '148', '0.00', '0.00', '1512128628', '77560.00', '0');
INSERT INTO wp_order_log VALUES ('156', '12', '149', '1880.00', '0.00', '1512128750', '78420.00', '0');
INSERT INTO wp_order_log VALUES ('157', '12', '150', '9400.00', '0.00', '1512128787', '72520.00', '0');
INSERT INTO wp_order_log VALUES ('158', '12', '151', '18800.00', '0.00', '1512128790', '91320.00', '0');
INSERT INTO wp_order_log VALUES ('159', '12', '154', '188.00', '0.00', '1512129006', '90794.00', '0');
INSERT INTO wp_order_log VALUES ('160', '12', '152', '940.00', '0.00', '1512129012', '91734.00', '0');
INSERT INTO wp_order_log VALUES ('161', '12', '153', '188.00', '0.00', '1512129029', '91922.00', '0');
INSERT INTO wp_order_log VALUES ('162', '12', '155', '188.00', '0.00', '1512129102', '91600.00', '0');
INSERT INTO wp_order_log VALUES ('163', '12', '156', '188.00', '0.00', '1512129104', '91788.00', '0');
INSERT INTO wp_order_log VALUES ('164', '12', '157', '188.00', '0.00', '1512129105', '91976.00', '0');
INSERT INTO wp_order_log VALUES ('165', '12', '158', '188.00', '0.00', '1512129107', '92164.00', '0');
INSERT INTO wp_order_log VALUES ('166', '12', '159', '188.00', '0.00', '1512129107', '92352.00', '0');
INSERT INTO wp_order_log VALUES ('167', '12', '160', '188.00', '0.00', '1512129667', '92336.00', '0');
INSERT INTO wp_order_log VALUES ('168', '11', '161', '18800.00', '0.00', '1512129675', '9999994320.00', '0');
INSERT INTO wp_order_log VALUES ('169', '12', '162', '188.00', '0.00', '1512129675', '92524.00', '0');
INSERT INTO wp_order_log VALUES ('170', '11', '163', '18800.00', '0.00', '1512129691', '10000013120.00', '0');
INSERT INTO wp_order_log VALUES ('171', '11', '164', '18800.00', '0.00', '1512129737', '10000021720.00', '0');
INSERT INTO wp_order_log VALUES ('172', '11', '165', '9400.00', '0.00', '1512131195', '10000026020.00', '0');
INSERT INTO wp_order_log VALUES ('173', '11', '166', '18800.00', '0.00', '1512131248', '10000034620.00', '0');
INSERT INTO wp_order_log VALUES ('174', '11', '167', '940.00', '0.00', '1512131960', '10000034540.00', '0');
INSERT INTO wp_order_log VALUES ('175', '11', '168', '940.00', '0.00', '1512131978', '10000035480.00', '0');
INSERT INTO wp_order_log VALUES ('176', '12', '169', '188.00', '0.00', '1512148443', '92610.00', '0');
INSERT INTO wp_order_log VALUES ('177', '12', '170', '188.00', '0.00', '1512148558', '92696.00', '0');
INSERT INTO wp_order_log VALUES ('178', '12', '171', '940.00', '0.00', '1512148597', '93126.00', '0');
INSERT INTO wp_order_log VALUES ('179', '12', '172', '188.00', '0.00', '1512149324', '93212.00', '0');
INSERT INTO wp_order_log VALUES ('180', '11', '173', '1880.00', '0.00', '1512175379', '10000035320.00', '0');
INSERT INTO wp_order_log VALUES ('181', '11', '174', '1880.00', '0.00', '1512175389', '10000037200.00', '0');
INSERT INTO wp_order_log VALUES ('182', '11', '175', '1880.00', '0.00', '1512199450', '10000038060.00', '0');
INSERT INTO wp_order_log VALUES ('183', '11', '176', '1880.00', '0.00', '1512199533', '10000028720.00', '0');
INSERT INTO wp_order_log VALUES ('184', '11', '177', '1880.00', '0.00', '1512199533', '10000030600.00', '0');
INSERT INTO wp_order_log VALUES ('185', '11', '178', '1880.00', '0.00', '1512199535', '10000032480.00', '0');
INSERT INTO wp_order_log VALUES ('186', '11', '179', '1880.00', '0.00', '1512199545', '10000034360.00', '0');
INSERT INTO wp_order_log VALUES ('187', '11', '180', '1880.00', '0.00', '1512199545', '10000036240.00', '0');
INSERT INTO wp_order_log VALUES ('188', '11', '181', '1880.00', '0.00', '1512199545', '10000038120.00', '0');
INSERT INTO wp_order_log VALUES ('189', '11', '182', '1880.00', '0.00', '1512199545', '10000040000.00', '0');
INSERT INTO wp_order_log VALUES ('190', '11', '183', '1880.00', '0.00', '1512199545', '10000041880.00', '0');
INSERT INTO wp_order_log VALUES ('191', '11', '184', '1880.00', '0.00', '1512199545', '10000043760.00', '0');
INSERT INTO wp_order_log VALUES ('192', '11', '185', '1880.00', '0.00', '1512199545', '10000045640.00', '0');
INSERT INTO wp_order_log VALUES ('193', '11', '186', '1880.00', '0.00', '1512199545', '10000047520.00', '0');
INSERT INTO wp_order_log VALUES ('194', '11', '187', '18800.00', '0.00', '1512199617', '9999954120.00', '0');
INSERT INTO wp_order_log VALUES ('195', '11', '188', '18800.00', '0.00', '1512199617', '9999972920.00', '0');
INSERT INTO wp_order_log VALUES ('196', '11', '189', '18800.00', '0.00', '1512199618', '9999991720.00', '0');
INSERT INTO wp_order_log VALUES ('197', '11', '190', '18800.00', '0.00', '1512199618', '10000010520.00', '0');
INSERT INTO wp_order_log VALUES ('198', '11', '191', '18800.00', '0.00', '1512199618', '10000029320.00', '0');
INSERT INTO wp_order_log VALUES ('199', '11', '192', '18800.00', '0.00', '1512199629', '10000048120.00', '0');
INSERT INTO wp_order_log VALUES ('200', '11', '193', '18800.00', '0.00', '1512199629', '10000066920.00', '0');
INSERT INTO wp_order_log VALUES ('201', '11', '194', '18800.00', '0.00', '1512199629', '10000085720.00', '0');
INSERT INTO wp_order_log VALUES ('202', '11', '195', '18800.00', '0.00', '1512199629', '10000104520.00', '0');
INSERT INTO wp_order_log VALUES ('203', '11', '196', '18800.00', '0.00', '1512199629', '10000123320.00', '0');
INSERT INTO wp_order_log VALUES ('204', '11', '197', '18800.00', '0.00', '1512199629', '10000142120.00', '0');
INSERT INTO wp_order_log VALUES ('205', '11', '198', '18800.00', '0.00', '1512199869', '10000150720.00', '0');
INSERT INTO wp_order_log VALUES ('206', '11', '199', '1880.00', '0.00', '1512199977', '10000143420.00', '0');
INSERT INTO wp_order_log VALUES ('207', '11', '200', '1880.00', '0.00', '1512199989', '10000143260.00', '0');
INSERT INTO wp_order_log VALUES ('208', '11', '201', '1880.00', '0.00', '1512199990', '10000145140.00', '0');
INSERT INTO wp_order_log VALUES ('209', '11', '202', '1880.00', '0.00', '1512199990', '10000147020.00', '0');
INSERT INTO wp_order_log VALUES ('210', '11', '203', '1880.00', '0.00', '1512199990', '10000148900.00', '0');
INSERT INTO wp_order_log VALUES ('211', '11', '204', '1880.00', '0.00', '1512199990', '10000150780.00', '0');
INSERT INTO wp_order_log VALUES ('212', '11', '205', '1880.00', '0.00', '1512200001', '10000146540.00', '0');
INSERT INTO wp_order_log VALUES ('213', '11', '206', '1880.00', '0.00', '1512200001', '10000148420.00', '0');
INSERT INTO wp_order_log VALUES ('214', '11', '207', '1880.00', '0.00', '1512200001', '10000150300.00', '0');
INSERT INTO wp_order_log VALUES ('215', '11', '208', '1880.00', '0.00', '1512200015', '10000149120.00', '0');
INSERT INTO wp_order_log VALUES ('216', '11', '209', '1880.00', '0.00', '1512200026', '10000149980.00', '0');
INSERT INTO wp_order_log VALUES ('217', '11', '210', '1880.00', '0.00', '1512200026', '10000151860.00', '0');
INSERT INTO wp_order_log VALUES ('218', '11', '211', '1880.00', '0.00', '1512200026', '10000153740.00', '0');
INSERT INTO wp_order_log VALUES ('219', '11', '212', '1880.00', '0.00', '1512200026', '10000155620.00', '0');
INSERT INTO wp_order_log VALUES ('220', '11', '213', '1880.00', '0.00', '1512200038', '10000157500.00', '0');
INSERT INTO wp_order_log VALUES ('221', '11', '214', '1880.00', '0.00', '1512200038', '10000159380.00', '0');
INSERT INTO wp_order_log VALUES ('222', '11', '215', '1880.00', '0.00', '1512200038', '10000161260.00', '0');
INSERT INTO wp_order_log VALUES ('223', '11', '216', '1880.00', '0.00', '1512200038', '10000163140.00', '0');
INSERT INTO wp_order_log VALUES ('224', '11', '217', '1880.00', '0.00', '1512200038', '10000165020.00', '0');
INSERT INTO wp_order_log VALUES ('225', '11', '218', '1880.00', '0.00', '1512200038', '10000166900.00', '0');
INSERT INTO wp_order_log VALUES ('226', '11', '219', '1880.00', '0.00', '1512200049', '10000168780.00', '0');
INSERT INTO wp_order_log VALUES ('227', '12', '220', '188.00', '0.00', '1512203874', '93298.00', '0');
INSERT INTO wp_order_log VALUES ('228', '12', '221', '188.00', '0.00', '1512204048', '93384.00', '0');
INSERT INTO wp_order_log VALUES ('229', '12', '222', '188.00', '0.00', '1512204111', '93470.00', '0');
INSERT INTO wp_order_log VALUES ('230', '12', '223', '1880.00', '0.00', '1512204160', '94330.00', '0');
INSERT INTO wp_order_log VALUES ('231', '12', '224', '18800.00', '0.00', '1512204210', '102930.00', '0');
INSERT INTO wp_order_log VALUES ('232', '11', '225', '1880.00', '0.00', '1512371201', '10000169640.00', '0');
INSERT INTO wp_order_log VALUES ('233', '11', '226', '188.00', '0.00', '1512371251', '10000169726.00', '0');
INSERT INTO wp_order_log VALUES ('234', '11', '227', '188.00', '0.00', '1512371326', '10000169710.00', '0');
INSERT INTO wp_order_log VALUES ('235', '11', '228', '188.00', '0.00', '1512371342', '10000169898.00', '0');
INSERT INTO wp_order_log VALUES ('236', '11', '229', '188.00', '0.00', '1512617342', '10000066984.00', '0');
INSERT INTO wp_order_log VALUES ('237', '11', '230', '18800.00', '0.00', '1512617350', '10000075584.00', '0');
INSERT INTO wp_order_log VALUES ('238', '11', '231', '18800.00', '0.00', '1512617352', '10000094384.00', '0');
INSERT INTO wp_order_log VALUES ('239', '11', '232', '18800.00', '0.00', '1512617355', '10000113184.00', '0');
INSERT INTO wp_order_log VALUES ('240', '11', '233', '18800.00', '0.00', '1512617355', '10000131984.00', '0');
INSERT INTO wp_order_log VALUES ('241', '11', '234', '18800.00', '0.00', '1512617359', '10000150784.00', '0');
INSERT INTO wp_order_log VALUES ('242', '11', '235', '18800.00', '0.00', '1512617359', '10000169584.00', '0');
INSERT INTO wp_order_log VALUES ('243', '11', '236', '18800.00', '0.00', '1512617359', '10000188384.00', '0');
INSERT INTO wp_order_log VALUES ('244', '11', '237', '18800.00', '0.00', '1512617360', '10000207184.00', '0');
INSERT INTO wp_order_log VALUES ('245', '11', '238', '18800.00', '0.00', '1512617361', '10000225984.00', '0');
INSERT INTO wp_order_log VALUES ('246', '11', '239', '18800.00', '0.00', '1512617366', '10000244784.00', '0');
INSERT INTO wp_order_log VALUES ('247', '11', '240', '18800.00', '0.00', '1512617379', '10000263584.00', '0');
INSERT INTO wp_order_log VALUES ('248', '11', '241', '18800.00', '0.00', '1512617636', '10000272184.00', '0');
INSERT INTO wp_order_log VALUES ('249', '11', '242', '0.00', '0.00', '1512619340', '10000272082.00', '0');
INSERT INTO wp_order_log VALUES ('250', '11', '243', '0.00', '0.00', '1512619419', '10000271980.00', '0');
INSERT INTO wp_order_log VALUES ('251', '13', '244', '0.00', '0.00', '1519868149', '901.51', '0');
INSERT INTO wp_order_log VALUES ('252', '14', '245', '0.00', '0.00', '1519871794', '123556.00', '0');
INSERT INTO wp_order_log VALUES ('253', '13', '246', '0.00', '0.00', '1519875307', '799.51', '0');
INSERT INTO wp_order_log VALUES ('254', '13', '247', '0.00', '0.00', '1519878611', '697.51', '0');
INSERT INTO wp_order_log VALUES ('255', '15', '249', '0.00', '0.00', '1519895742', '192.51', '0');
INSERT INTO wp_order_log VALUES ('256', '15', '248', '0.00', '0.00', '1519895783', '90.51', '0');
INSERT INTO wp_order_log VALUES ('257', '15', '250', '0.00', '0.00', '1519895799', '90.51', '0');
INSERT INTO wp_order_log VALUES ('258', '15', '251', '0.00', '0.00', '1519895805', '90.51', '0');
INSERT INTO wp_order_log VALUES ('259', '13', '252', '177.00', '0.00', '1519907772', '1124.51', '0');
INSERT INTO wp_order_log VALUES ('260', '13', '253', '175.00', '0.00', '1520347336', '1095.51', '0');
INSERT INTO wp_order_log VALUES ('261', '13', '254', '175.00', '0.00', '1520347339', '1270.51', '0');
INSERT INTO wp_order_log VALUES ('262', '13', '255', '100.00', '0.00', '1520779041', '1318.51', '0');
INSERT INTO wp_order_log VALUES ('263', '13', '256', '100.00', '0.00', '1521010959', '1316.51', '0');
INSERT INTO wp_order_log VALUES ('264', '13', '257', '0.00', '0.00', '1521011493', '1214.51', '0');
INSERT INTO wp_order_log VALUES ('265', '13', '258', '0.00', '0.00', '1521012387', '1112.51', '0');
INSERT INTO wp_order_log VALUES ('266', '13', '259', '0.00', '0.00', '1521013876', '546.41', '0');
INSERT INTO wp_order_log VALUES ('267', '13', '260', '0.00', '0.00', '1521015385', '36.41', '0');
INSERT INTO wp_order_log VALUES ('268', '13', '261', '0.00', '0.00', '1521015513', '999220.41', '0');
INSERT INTO wp_order_log VALUES ('269', '13', '262', '0.00', '0.00', '1521015517', '999220.41', '0');
INSERT INTO wp_order_log VALUES ('270', '13', '263', '175.00', '0.00', '1521015518', '999395.41', '0');
INSERT INTO wp_order_log VALUES ('271', '13', '264', '175.00', '0.00', '1521015518', '999570.41', '0');
INSERT INTO wp_order_log VALUES ('272', '13', '265', '175.00', '0.00', '1521015528', '999745.41', '0');
INSERT INTO wp_order_log VALUES ('273', '13', '266', '0.00', '0.00', '1521015530', '999745.41', '0');
INSERT INTO wp_order_log VALUES ('274', '13', '267', '0.00', '0.00', '1521015533', '999745.41', '0');
INSERT INTO wp_order_log VALUES ('275', '13', '268', '0.00', '0.00', '1521015533', '999745.41', '0');
INSERT INTO wp_order_log VALUES ('276', '13', '269', '0.00', '0.00', '1521021016', '999643.41', '0');
INSERT INTO wp_order_log VALUES ('277', '13', '270', '175.00', '0.00', '1521039388', '999716.41', '0');
INSERT INTO wp_order_log VALUES ('278', '13', '271', '175.00', '0.00', '1521094315', '999789.41', '0');
INSERT INTO wp_order_log VALUES ('279', '13', '272', '17500.00', '0.00', '1521099820', '1007089.41', '0');
INSERT INTO wp_order_log VALUES ('280', '13', '273', '17500.00', '0.00', '1521099938', '1014389.41', '0');
INSERT INTO wp_order_log VALUES ('281', '13', '274', '177.00', '0.00', '1521183751', '1014464.41', '0');
INSERT INTO wp_order_log VALUES ('282', '21', '275', '0.00', '0.00', '1521186633', '96950.00', '0');
INSERT INTO wp_order_log VALUES ('283', '21', '276', '940.00', '0.00', '1521186642', '97890.00', '0');
INSERT INTO wp_order_log VALUES ('284', '21', '277', '1880.00', '0.00', '1521186646', '99770.00', '0');
INSERT INTO wp_order_log VALUES ('285', '13', '279', '175.00', '0.00', '1521195486', '1014381.41', '0');
INSERT INTO wp_order_log VALUES ('286', '13', '278', '0.00', '0.00', '1521195571', '1014381.41', '0');
INSERT INTO wp_order_log VALUES ('287', '13', '280', '175.00', '0.00', '1521213386', '1014352.41', '0');
INSERT INTO wp_order_log VALUES ('288', '13', '281', '175.00', '0.00', '1521213390', '1014527.41', '0');
INSERT INTO wp_order_log VALUES ('289', '13', '282', '175.00', '0.00', '1521225878', '1014498.41', '0');
INSERT INTO wp_order_log VALUES ('290', '13', '283', '180.00', '0.00', '1521226092', '1014678.41', '0');
INSERT INTO wp_order_log VALUES ('291', '13', '284', '175.00', '0.00', '1521226662', '1014343.41', '0');
INSERT INTO wp_order_log VALUES ('292', '13', '285', '100.00', '0.00', '1521226666', '1014443.41', '0');
INSERT INTO wp_order_log VALUES ('293', '13', '286', '0.00', '0.00', '1521226908', '1014443.41', '0');
INSERT INTO wp_order_log VALUES ('294', '13', '287', '185.00', '0.00', '1521227219', '1014628.41', '0');
INSERT INTO wp_order_log VALUES ('295', '13', '288', '185.00', '0.00', '1521227219', '1014813.41', '0');
INSERT INTO wp_order_log VALUES ('296', '13', '290', '0.00', '0.00', '1521265853', '1008693.41', '0');
INSERT INTO wp_order_log VALUES ('297', '13', '289', '0.00', '0.00', '1521266213', '1008693.41', '0');
INSERT INTO wp_order_log VALUES ('298', '13', '291', '0.00', '0.00', '1521286970', '1008591.41', '0');
INSERT INTO wp_order_log VALUES ('299', '13', '292', '175.00', '0.00', '1521297229', '1008664.41', '0');
INSERT INTO wp_order_log VALUES ('300', '13', '293', '17500.00', '0.00', '1521297324', '1015964.41', '0');
INSERT INTO wp_order_log VALUES ('301', '13', '294', '17500.00', '0.00', '1521297440', '1023264.41', '0');
INSERT INTO wp_order_log VALUES ('302', '13', '295', '0.00', '0.00', '1521297509', '992664.41', '0');
INSERT INTO wp_order_log VALUES ('303', '13', '296', '0.00', '0.00', '1521297538', '992664.41', '0');
INSERT INTO wp_order_log VALUES ('304', '13', '297', '0.00', '0.00', '1521297545', '992664.41', '0');
INSERT INTO wp_order_log VALUES ('305', '13', '298', '0.00', '0.00', '1521297654', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('306', '13', '299', '0.00', '0.00', '1521297654', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('307', '13', '300', '0.00', '0.00', '1521297655', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('308', '13', '301', '0.00', '0.00', '1521297658', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('309', '13', '302', '0.00', '0.00', '1521297658', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('310', '13', '303', '0.00', '0.00', '1521297660', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('311', '13', '304', '0.00', '0.00', '1521297660', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('312', '13', '305', '0.00', '0.00', '1521297664', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('313', '13', '306', '0.00', '0.00', '1521297664', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('314', '13', '307', '0.00', '0.00', '1521297665', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('315', '13', '308', '0.00', '0.00', '1521297666', '880464.41', '0');
INSERT INTO wp_order_log VALUES ('316', '13', '309', '0.00', '0.00', '1521297741', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('317', '13', '310', '0.00', '0.00', '1521297742', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('318', '13', '311', '0.00', '0.00', '1521297744', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('319', '13', '312', '0.00', '0.00', '1521297744', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('320', '13', '313', '0.00', '0.00', '1521297745', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('321', '13', '314', '0.00', '0.00', '1521297750', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('322', '13', '315', '0.00', '0.00', '1521297750', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('323', '13', '316', '0.00', '0.00', '1521297750', '798864.41', '0');
INSERT INTO wp_order_log VALUES ('324', '13', '317', '175.00', '0.00', '1521297827', '696937.41', '0');
INSERT INTO wp_order_log VALUES ('325', '13', '318', '17500.00', '0.00', '1521297827', '714437.41', '0');
INSERT INTO wp_order_log VALUES ('326', '13', '319', '17500.00', '0.00', '1521297828', '731937.41', '0');
INSERT INTO wp_order_log VALUES ('327', '13', '320', '17500.00', '0.00', '1521297832', '749437.41', '0');
INSERT INTO wp_order_log VALUES ('328', '13', '321', '17500.00', '0.00', '1521297832', '766937.41', '0');
INSERT INTO wp_order_log VALUES ('329', '13', '322', '17500.00', '0.00', '1521297832', '784437.41', '0');
INSERT INTO wp_order_log VALUES ('330', '13', '323', '17500.00', '0.00', '1521297834', '801937.41', '0');
INSERT INTO wp_order_log VALUES ('331', '13', '324', '17500.00', '0.00', '1521297834', '819437.41', '0');
INSERT INTO wp_order_log VALUES ('332', '13', '325', '17500.00', '0.00', '1521297835', '836937.41', '0');
INSERT INTO wp_order_log VALUES ('333', '13', '326', '17500.00', '0.00', '1521297837', '854437.41', '0');
INSERT INTO wp_order_log VALUES ('334', '13', '327', '17500.00', '0.00', '1521297838', '871937.41', '0');
INSERT INTO wp_order_log VALUES ('335', '13', '328', '17500.00', '0.00', '1521297913', '777237.41', '0');
INSERT INTO wp_order_log VALUES ('336', '13', '329', '17500.00', '0.00', '1521297913', '794737.41', '0');
INSERT INTO wp_order_log VALUES ('337', '13', '330', '17500.00', '0.00', '1521297916', '812237.41', '0');
INSERT INTO wp_order_log VALUES ('338', '13', '331', '17500.00', '0.00', '1521297916', '829737.41', '0');
INSERT INTO wp_order_log VALUES ('339', '13', '332', '17500.00', '0.00', '1521297916', '847237.41', '0');
INSERT INTO wp_order_log VALUES ('340', '13', '333', '17500.00', '0.00', '1521297919', '864737.41', '0');
INSERT INTO wp_order_log VALUES ('341', '13', '334', '17500.00', '0.00', '1521297919', '882237.41', '0');
INSERT INTO wp_order_log VALUES ('342', '13', '335', '17500.00', '0.00', '1521297919', '899737.41', '0');
INSERT INTO wp_order_log VALUES ('343', '13', '336', '0.00', '0.00', '1521297922', '899737.41', '0');
INSERT INTO wp_order_log VALUES ('344', '13', '337', '0.00', '0.00', '1521297922', '899737.41', '0');
INSERT INTO wp_order_log VALUES ('345', '13', '338', '17500.00', '0.00', '1521297924', '917237.41', '0');
INSERT INTO wp_order_log VALUES ('346', '13', '339', '0.00', '0.00', '1521298003', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('347', '13', '340', '0.00', '0.00', '1521298005', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('348', '13', '341', '0.00', '0.00', '1521298005', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('349', '13', '342', '0.00', '0.00', '1521298008', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('350', '13', '343', '0.00', '0.00', '1521298012', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('351', '13', '344', '0.00', '0.00', '1521298012', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('352', '13', '345', '0.00', '0.00', '1521298012', '805037.41', '0');
INSERT INTO wp_order_log VALUES ('353', '13', '346', '0.00', '0.00', '1521298016', '774437.41', '0');
INSERT INTO wp_order_log VALUES ('354', '13', '347', '0.00', '0.00', '1521298016', '774437.41', '0');
INSERT INTO wp_order_log VALUES ('355', '13', '348', '0.00', '0.00', '1521298016', '774437.41', '0');
INSERT INTO wp_order_log VALUES ('356', '13', '349', '0.00', '0.00', '1521298016', '774437.41', '0');
INSERT INTO wp_order_log VALUES ('357', '13', '350', '17500.00', '0.00', '1521298075', '710337.41', '0');
INSERT INTO wp_order_log VALUES ('358', '13', '351', '17500.00', '0.00', '1521298075', '727837.41', '0');
INSERT INTO wp_order_log VALUES ('359', '13', '352', '17500.00', '0.00', '1521298075', '745337.41', '0');
INSERT INTO wp_order_log VALUES ('360', '13', '353', '17500.00', '0.00', '1521298078', '762837.41', '0');
INSERT INTO wp_order_log VALUES ('361', '13', '354', '17500.00', '0.00', '1521298078', '780337.41', '0');
INSERT INTO wp_order_log VALUES ('362', '13', '355', '17500.00', '0.00', '1521298080', '797837.41', '0');
INSERT INTO wp_order_log VALUES ('363', '13', '356', '17500.00', '0.00', '1521298080', '815337.41', '0');
INSERT INTO wp_order_log VALUES ('364', '13', '357', '17500.00', '0.00', '1521298081', '832837.41', '0');
INSERT INTO wp_order_log VALUES ('365', '13', '358', '17500.00', '0.00', '1521298083', '850337.41', '0');
INSERT INTO wp_order_log VALUES ('366', '13', '359', '17500.00', '0.00', '1521298084', '867837.41', '0');
INSERT INTO wp_order_log VALUES ('367', '13', '360', '0.00', '0.00', '1521298086', '867837.41', '0');
INSERT INTO wp_order_log VALUES ('368', '13', '361', '0.00', '0.00', '1521298158', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('369', '13', '362', '0.00', '0.00', '1521298161', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('370', '13', '363', '0.00', '0.00', '1521298161', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('371', '13', '364', '0.00', '0.00', '1521298162', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('372', '13', '365', '0.00', '0.00', '1521298164', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('373', '13', '366', '0.00', '0.00', '1521298164', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('374', '13', '367', '0.00', '0.00', '1521298165', '755637.41', '0');
INSERT INTO wp_order_log VALUES ('375', '13', '368', '0.00', '0.00', '1521298171', '745437.41', '0');
INSERT INTO wp_order_log VALUES ('376', '13', '369', '0.00', '0.00', '1521298171', '745437.41', '0');
INSERT INTO wp_order_log VALUES ('377', '13', '370', '0.00', '0.00', '1521298171', '745437.41', '0');
INSERT INTO wp_order_log VALUES ('378', '13', '371', '0.00', '0.00', '1521298171', '745437.41', '0');
INSERT INTO wp_order_log VALUES ('379', '13', '372', '17500.00', '0.00', '1521298232', '660937.41', '0');
INSERT INTO wp_order_log VALUES ('380', '13', '373', '17500.00', '0.00', '1521298232', '678437.41', '0');
INSERT INTO wp_order_log VALUES ('381', '13', '374', '17500.00', '0.00', '1521298233', '695937.41', '0');
INSERT INTO wp_order_log VALUES ('382', '13', '375', '17500.00', '0.00', '1521298236', '713437.41', '0');
INSERT INTO wp_order_log VALUES ('383', '13', '376', '17500.00', '0.00', '1521298236', '730937.41', '0');
INSERT INTO wp_order_log VALUES ('384', '13', '377', '17500.00', '0.00', '1521298236', '748437.41', '0');
INSERT INTO wp_order_log VALUES ('385', '13', '378', '17500.00', '0.00', '1521298242', '765937.41', '0');
INSERT INTO wp_order_log VALUES ('386', '13', '379', '17500.00', '0.00', '1521298242', '783437.41', '0');
INSERT INTO wp_order_log VALUES ('387', '13', '380', '17500.00', '0.00', '1521298242', '800937.41', '0');
INSERT INTO wp_order_log VALUES ('388', '13', '381', '17500.00', '0.00', '1521298242', '818437.41', '0');
INSERT INTO wp_order_log VALUES ('389', '13', '382', '17500.00', '0.00', '1521298242', '835937.41', '0');
INSERT INTO wp_order_log VALUES ('390', '13', '383', '1750.00', '0.00', '1521299934', '834627.41', '0');
INSERT INTO wp_order_log VALUES ('391', '13', '384', '1770.00', '0.00', '1521300057', '836397.41', '0');
INSERT INTO wp_order_log VALUES ('392', '13', '385', '1770.00', '0.00', '1521300060', '838167.41', '0');
INSERT INTO wp_order_log VALUES ('393', '13', '386', '175.00', '0.00', '1521300196', '838240.41', '0');
INSERT INTO wp_order_log VALUES ('394', '13', '387', '0.00', '0.00', '1521383677', '838138.41', '0');
INSERT INTO wp_order_log VALUES ('395', '13', '388', '175.00', '0.00', '1521386169', '838211.41', '0');
INSERT INTO wp_order_log VALUES ('396', '13', '389', '0.00', '0.00', '1521421823', '837701.41', '0');
INSERT INTO wp_order_log VALUES ('397', '13', '390', '175.00', '0.00', '1521424745', '836754.41', '0');
INSERT INTO wp_order_log VALUES ('398', '13', '391', '175.00', '0.00', '1521424745', '836929.41', '0');
INSERT INTO wp_order_log VALUES ('399', '13', '392', '175.00', '0.00', '1521424745', '837104.41', '0');
INSERT INTO wp_order_log VALUES ('400', '13', '393', '175.00', '0.00', '1521424745', '837279.41', '0');
INSERT INTO wp_order_log VALUES ('401', '13', '394', '175.00', '0.00', '1521424745', '837454.41', '0');
INSERT INTO wp_order_log VALUES ('402', '13', '395', '175.00', '0.00', '1521424745', '837629.41', '0');
INSERT INTO wp_order_log VALUES ('403', '13', '396', '175.00', '0.00', '1521424745', '837804.41', '0');
INSERT INTO wp_order_log VALUES ('404', '13', '397', '175.00', '0.00', '1521424745', '837979.41', '0');
INSERT INTO wp_order_log VALUES ('405', '13', '398', '175.00', '0.00', '1521424745', '838154.41', '0');
INSERT INTO wp_order_log VALUES ('406', '13', '399', '175.00', '0.00', '1521424745', '838329.41', '0');
INSERT INTO wp_order_log VALUES ('407', '13', '400', '175.00', '0.00', '1521424745', '838504.41', '0');
INSERT INTO wp_order_log VALUES ('408', '13', '401', '175.00', '0.00', '1521424857', '837761.41', '0');
INSERT INTO wp_order_log VALUES ('409', '13', '402', '0.00', '0.00', '1521424860', '837761.41', '0');
INSERT INTO wp_order_log VALUES ('410', '13', '403', '175.00', '0.00', '1521424861', '837936.41', '0');
INSERT INTO wp_order_log VALUES ('411', '13', '404', '175.00', '0.00', '1521424863', '838111.41', '0');
INSERT INTO wp_order_log VALUES ('412', '13', '405', '175.00', '0.00', '1521424863', '838286.41', '0');
INSERT INTO wp_order_log VALUES ('413', '13', '406', '175.00', '0.00', '1521424866', '838461.41', '0');
INSERT INTO wp_order_log VALUES ('414', '13', '407', '0.00', '0.00', '1521424872', '838461.41', '0');
INSERT INTO wp_order_log VALUES ('415', '13', '408', '0.00', '0.00', '1521424875', '838461.41', '0');
INSERT INTO wp_order_log VALUES ('416', '13', '409', '175.00', '0.00', '1521424878', '838636.41', '0');
INSERT INTO wp_order_log VALUES ('417', '13', '410', '188.00', '0.00', '1521425325', '838722.41', '0');
INSERT INTO wp_order_log VALUES ('418', '13', '411', '0.00', '0.00', '1521429625', '833622.41', '0');
INSERT INTO wp_order_log VALUES ('419', '13', '412', '175.00', '0.00', '1521429757', '833491.41', '0');
INSERT INTO wp_order_log VALUES ('420', '13', '413', '180.00', '0.00', '1521430000', '833671.41', '0');
INSERT INTO wp_order_log VALUES ('421', '13', '414', '180.00', '0.00', '1521430007', '833851.41', '0');
INSERT INTO wp_order_log VALUES ('422', '13', '415', '17500.00', '0.00', '1521433176', '841151.41', '0');
INSERT INTO wp_order_log VALUES ('423', '13', '416', '175.00', '0.00', '1521441659', '841224.41', '0');
INSERT INTO wp_order_log VALUES ('424', '13', '417', '0.00', '0.00', '1521449696', '840122.41', '0');
INSERT INTO wp_order_log VALUES ('425', '13', '423', '175.00', '0.00', '1521460272', '834993.41', '0');
INSERT INTO wp_order_log VALUES ('426', '13', '424', '175.00', '0.00', '1521460314', '835168.41', '0');
INSERT INTO wp_order_log VALUES ('427', '13', '425', '175.00', '0.00', '1521460577', '835241.41', '0');
INSERT INTO wp_order_log VALUES ('428', '13', '418', '0.00', '0.00', '1521460650', '835241.41', '0');
INSERT INTO wp_order_log VALUES ('429', '13', '419', '0.00', '0.00', '1521460659', '835241.41', '0');
INSERT INTO wp_order_log VALUES ('430', '13', '420', '0.00', '0.00', '1521460662', '835241.41', '0');
INSERT INTO wp_order_log VALUES ('431', '13', '421', '0.00', '0.00', '1521460664', '835241.41', '0');
INSERT INTO wp_order_log VALUES ('432', '13', '422', '0.00', '0.00', '1521460665', '835241.41', '0');
INSERT INTO wp_order_log VALUES ('433', '13', '426', '0.00', '0.00', '1521461362', '835139.41', '0');
INSERT INTO wp_order_log VALUES ('434', '13', '427', '0.00', '0.00', '1521461568', '835037.41', '0');
INSERT INTO wp_order_log VALUES ('435', '14', '428', '175.00', '0.00', '1521470619', '123629.00', '0');
INSERT INTO wp_order_log VALUES ('436', '14', '429', '0.00', '0.00', '1521470688', '123527.00', '0');
INSERT INTO wp_order_log VALUES ('437', '14', '430', '0.00', '0.00', '1521471577', '123425.00', '0');
INSERT INTO wp_order_log VALUES ('438', '14', '431', '188.00', '0.00', '1521471876', '123205.00', '0');
INSERT INTO wp_order_log VALUES ('439', '14', '432', '188.00', '0.00', '1521471905', '123393.00', '0');
INSERT INTO wp_order_log VALUES ('440', '14', '433', '188.00', '0.00', '1521471911', '123581.00', '0');
INSERT INTO wp_order_log VALUES ('441', '14', '434', '188.00', '0.00', '1521471923', '123769.00', '0');
INSERT INTO wp_order_log VALUES ('442', '14', '435', '0.00', '0.00', '1521472021', '123361.00', '0');
INSERT INTO wp_order_log VALUES ('443', '14', '436', '0.00', '0.00', '1521472025', '123361.00', '0');
INSERT INTO wp_order_log VALUES ('444', '14', '437', '188.00', '0.00', '1521472031', '123549.00', '0');
INSERT INTO wp_order_log VALUES ('445', '14', '438', '0.00', '0.00', '1521472037', '123549.00', '0');
INSERT INTO wp_order_log VALUES ('446', '14', '439', '0.00', '0.00', '1521472143', '122019.00', '0');
INSERT INTO wp_order_log VALUES ('447', '14', '440', '0.00', '0.00', '1521472147', '122019.00', '0');
INSERT INTO wp_order_log VALUES ('448', '14', '441', '0.00', '0.00', '1521472151', '122019.00', '0');
INSERT INTO wp_order_log VALUES ('449', '14', '442', '0.00', '0.00', '1521472156', '122019.00', '0');
INSERT INTO wp_order_log VALUES ('450', '14', '443', '1000.00', '0.00', '1521473309', '119959.00', '0');
INSERT INTO wp_order_log VALUES ('451', '14', '444', '1000.00', '0.00', '1521473311', '120959.00', '0');
INSERT INTO wp_order_log VALUES ('452', '14', '445', '1000.00', '0.00', '1521473313', '121959.00', '0');
INSERT INTO wp_order_log VALUES ('453', '14', '446', '1000.00', '0.00', '1521473412', '119899.00', '0');
INSERT INTO wp_order_log VALUES ('454', '14', '447', '1000.00', '0.00', '1521473414', '120899.00', '0');
INSERT INTO wp_order_log VALUES ('455', '14', '448', '1000.00', '0.00', '1521473417', '121899.00', '0');
INSERT INTO wp_order_log VALUES ('456', '14', '449', '1000.00', '0.00', '1521473505', '120859.00', '0');
INSERT INTO wp_order_log VALUES ('457', '14', '450', '1000.00', '0.00', '1521473508', '121859.00', '0');
INSERT INTO wp_order_log VALUES ('458', '14', '451', '1000.00', '0.00', '1521473584', '121839.00', '0');
INSERT INTO wp_order_log VALUES ('459', '14', '452', '0.00', '0.00', '1521473686', '119799.00', '0');
INSERT INTO wp_order_log VALUES ('460', '14', '453', '1750.00', '0.00', '1521473693', '121549.00', '0');
INSERT INTO wp_order_log VALUES ('461', '14', '454', '1000.00', '0.00', '1521473789', '120509.00', '0');
INSERT INTO wp_order_log VALUES ('462', '14', '455', '1000.00', '0.00', '1521473792', '121509.00', '0');
INSERT INTO wp_order_log VALUES ('463', '14', '456', '1000.00', '0.00', '1521473862', '118429.00', '0');
INSERT INTO wp_order_log VALUES ('464', '14', '457', '1000.00', '0.00', '1521473865', '119429.00', '0');
INSERT INTO wp_order_log VALUES ('465', '14', '458', '1000.00', '0.00', '1521473867', '120429.00', '0');
INSERT INTO wp_order_log VALUES ('466', '14', '459', '1000.00', '0.00', '1521473869', '121429.00', '0');
INSERT INTO wp_order_log VALUES ('467', '14', '460', '175.00', '0.00', '1521473955', '121298.00', '0');
INSERT INTO wp_order_log VALUES ('468', '14', '461', '175.00', '0.00', '1521473957', '121473.00', '0');
INSERT INTO wp_order_log VALUES ('469', '14', '462', '175.00', '0.00', '1521473958', '121648.00', '0');
INSERT INTO wp_order_log VALUES ('470', '14', '463', '175.00', '0.00', '1521475722', '121721.00', '0');
INSERT INTO wp_order_log VALUES ('471', '14', '464', '0.00', '0.00', '1521476271', '121619.00', '0');
INSERT INTO wp_order_log VALUES ('472', '13', '465', '1750.00', '0.00', '1521509890', '834747.41', '0');
INSERT INTO wp_order_log VALUES ('473', '13', '468', '0.00', '0.00', '1521509990', '834645.41', '0');
INSERT INTO wp_order_log VALUES ('474', '13', '466', '0.00', '0.00', '1521510051', '834645.41', '0');
INSERT INTO wp_order_log VALUES ('475', '13', '467', '0.00', '0.00', '1521510055', '834645.41', '0');
INSERT INTO wp_order_log VALUES ('476', '13', '469', '1750.00', '0.00', '1521517660', '835375.41', '0');
INSERT INTO wp_order_log VALUES ('477', '13', '470', '0.00', '0.00', '1521517793', '834355.41', '0');
INSERT INTO wp_order_log VALUES ('478', '13', '471', '17500.00', '0.00', '1521517991', '841655.41', '0');
INSERT INTO wp_order_log VALUES ('479', '13', '472', '17500.00', '0.00', '1521518100', '848955.41', '0');
INSERT INTO wp_order_log VALUES ('480', '13', '473', '0.00', '0.00', '1521518587', '838755.41', '0');
INSERT INTO wp_order_log VALUES ('481', '13', '474', '0.00', '0.00', '1521526967', '838347.41', '0');
INSERT INTO wp_order_log VALUES ('482', '13', '475', '0.00', '0.00', '1521526972', '838347.41', '0');
INSERT INTO wp_order_log VALUES ('483', '13', '476', '175.00', '0.00', '1521526976', '838522.41', '0');
INSERT INTO wp_order_log VALUES ('484', '13', '477', '175.00', '0.00', '1521526979', '838697.41', '0');
INSERT INTO wp_order_log VALUES ('485', '13', '478', '0.00', '0.00', '1521529997', '828497.41', '0');
INSERT INTO wp_order_log VALUES ('486', '13', '479', '8750.00', '0.00', '1521540636', '821947.41', '0');
INSERT INTO wp_order_log VALUES ('487', '13', '480', '8750.00', '0.00', '1521540641', '830697.41', '0');
INSERT INTO wp_order_log VALUES ('488', '13', '481', '8750.00', '0.00', '1521540650', '839447.41', '0');
INSERT INTO wp_order_log VALUES ('489', '13', '482', '0.00', '0.00', '1521544376', '818945.41', '0');
INSERT INTO wp_order_log VALUES ('490', '13', '484', '17500.00', '0.00', '1521544429', '836445.41', '0');
INSERT INTO wp_order_log VALUES ('491', '13', '485', '17500.00', '0.00', '1521544511', '843745.41', '0');
INSERT INTO wp_order_log VALUES ('492', '13', '486', '0.00', '0.00', '1521544682', '843643.41', '0');
INSERT INTO wp_order_log VALUES ('493', '13', '483', '18500.00', '0.00', '1521544957', '862041.41', '0');
INSERT INTO wp_order_log VALUES ('494', '13', '487', '188.00', '0.00', '1521544998', '862229.41', '0');
INSERT INTO wp_order_log VALUES ('495', '13', '488', '188.00', '0.00', '1521545064', '862315.41', '0');
INSERT INTO wp_order_log VALUES ('496', '13', '489', '0.00', '0.00', '1521551165', '862213.41', '0');
INSERT INTO wp_order_log VALUES ('497', '13', '491', '175.00', '0.00', '1521551420', '862184.41', '0');
INSERT INTO wp_order_log VALUES ('498', '13', '490', '0.00', '0.00', '1521551955', '862184.41', '0');
INSERT INTO wp_order_log VALUES ('499', '13', '492', '0.00', '0.00', '1521556626', '861164.41', '0');
INSERT INTO wp_order_log VALUES ('500', '13', '493', '0.00', '0.00', '1521556878', '861062.41', '0');
INSERT INTO wp_order_log VALUES ('501', '13', '494', '175.00', '0.00', '1521564396', '861135.41', '0');
INSERT INTO wp_order_log VALUES ('502', '13', '495', '185.00', '0.00', '1521575071', '861218.41', '0');
INSERT INTO wp_order_log VALUES ('503', '13', '496', '0.00', '0.00', '1521584245', '851018.41', '0');
INSERT INTO wp_order_log VALUES ('504', '13', '497', '0.00', '0.00', '1521616031', '849998.41', '0');
INSERT INTO wp_order_log VALUES ('505', '13', '498', '17500.00', '0.00', '1521616113', '857298.41', '0');
INSERT INTO wp_order_log VALUES ('506', '13', '499', '0.00', '0.00', '1521616483', '836898.41', '0');
INSERT INTO wp_order_log VALUES ('507', '13', '500', '17500.00', '0.00', '1521616500', '854398.41', '0');
INSERT INTO wp_order_log VALUES ('509', '13', '501', '17500.00', '0.00', '1521617198', '851698.41', '0');
INSERT INTO wp_order_log VALUES ('510', '13', '502', '17500.00', '0.00', '1521617593', '858998.41', '0');
INSERT INTO wp_order_log VALUES ('511', '13', '503', '0.00', '0.00', '1521617704', '848798.41', '0');
INSERT INTO wp_order_log VALUES ('512', '13', '504', '0.00', '0.00', '1522068721', '848696.41', '0');
INSERT INTO wp_order_log VALUES ('513', '13', '505', '180.00', '0.00', '1522069032', '848774.41', '0');
INSERT INTO wp_order_log VALUES ('514', '13', '506', '0.00', '0.00', '1522082233', '848570.41', '0');
INSERT INTO wp_order_log VALUES ('515', '13', '507', '0.00', '0.00', '1522082269', '848570.41', '0');
INSERT INTO wp_order_log VALUES ('516', '13', '508', '1880.00', '0.00', '1522091315', '849430.41', '0');
INSERT INTO wp_order_log VALUES ('517', '13', '509', '9400.00', '0.00', '1522091392', '853730.41', '0');
INSERT INTO wp_order_log VALUES ('518', '13', '510', '18800.00', '0.00', '1522091490', '862330.41', '0');
INSERT INTO wp_order_log VALUES ('519', '13', '511', '0.00', '0.00', '1522092193', '862228.41', '0');
INSERT INTO wp_order_log VALUES ('520', '13', '512', '1880.00', '0.00', '1522092673', '863088.41', '0');
INSERT INTO wp_order_log VALUES ('521', '13', '513', '1880.00', '0.00', '1522148365', '847628.41', '0');
INSERT INTO wp_order_log VALUES ('522', '13', '514', '1880.00', '0.00', '1522148368', '849508.41', '0');
INSERT INTO wp_order_log VALUES ('523', '13', '515', '9500.00', '0.00', '1522148493', '859008.41', '0');
INSERT INTO wp_order_log VALUES ('524', '13', '516', '0.00', '0.00', '1522148813', '859008.41', '0');
INSERT INTO wp_order_log VALUES ('525', '13', '517', '17500.00', '0.00', '1522157604', '764308.41', '0');
INSERT INTO wp_order_log VALUES ('526', '13', '518', '17500.00', '0.00', '1522157604', '781808.41', '0');
INSERT INTO wp_order_log VALUES ('527', '13', '519', '17500.00', '0.00', '1522157604', '799308.41', '0');
INSERT INTO wp_order_log VALUES ('528', '13', '520', '17500.00', '0.00', '1522157604', '816808.41', '0');
INSERT INTO wp_order_log VALUES ('529', '13', '521', '17500.00', '0.00', '1522157604', '834308.41', '0');
INSERT INTO wp_order_log VALUES ('530', '13', '522', '17500.00', '0.00', '1522157605', '841608.41', '0');
INSERT INTO wp_order_log VALUES ('531', '13', '523', '17500.00', '0.00', '1522157613', '818308.41', '0');
INSERT INTO wp_order_log VALUES ('532', '13', '524', '17500.00', '0.00', '1522157613', '835808.41', '0');
INSERT INTO wp_order_log VALUES ('533', '13', '525', '17500.00', '0.00', '1522157613', '853308.41', '0');
INSERT INTO wp_order_log VALUES ('534', '13', '526', '17500.00', '0.00', '1522157613', '870808.41', '0');
INSERT INTO wp_order_log VALUES ('535', '13', '527', '17500.00', '0.00', '1522157613', '888308.41', '0');
INSERT INTO wp_order_log VALUES ('536', '13', '528', '0.00', '0.00', '1522157667', '827108.41', '0');
INSERT INTO wp_order_log VALUES ('537', '13', '529', '0.00', '0.00', '1522157667', '827108.41', '0');
INSERT INTO wp_order_log VALUES ('538', '13', '530', '0.00', '0.00', '1522157669', '827108.41', '0');
INSERT INTO wp_order_log VALUES ('539', '13', '531', '0.00', '0.00', '1522157676', '796508.41', '0');
INSERT INTO wp_order_log VALUES ('540', '13', '532', '0.00', '0.00', '1522157676', '796508.41', '0');
INSERT INTO wp_order_log VALUES ('541', '13', '533', '0.00', '0.00', '1522157676', '796508.41', '0');
INSERT INTO wp_order_log VALUES ('542', '13', '534', '0.00', '0.00', '1522157676', '796508.41', '0');
INSERT INTO wp_order_log VALUES ('543', '13', '535', '0.00', '0.00', '1522157677', '796508.41', '0');
INSERT INTO wp_order_log VALUES ('544', '13', '536', '0.00', '0.00', '1522157685', '745508.41', '0');
INSERT INTO wp_order_log VALUES ('545', '13', '537', '0.00', '0.00', '1522157685', '745508.41', '0');
INSERT INTO wp_order_log VALUES ('546', '13', '538', '0.00', '0.00', '1522157685', '745508.41', '0');
INSERT INTO wp_order_log VALUES ('547', '13', '539', '17500.00', '0.00', '1522157734', '732408.41', '0');
INSERT INTO wp_order_log VALUES ('548', '13', '540', '17500.00', '0.00', '1522157736', '749908.41', '0');
INSERT INTO wp_order_log VALUES ('549', '13', '541', '17500.00', '0.00', '1522157737', '767408.41', '0');
INSERT INTO wp_order_log VALUES ('550', '13', '542', '17500.00', '0.00', '1522157737', '784908.41', '0');
INSERT INTO wp_order_log VALUES ('551', '13', '543', '17500.00', '0.00', '1522157740', '802408.41', '0');
INSERT INTO wp_order_log VALUES ('552', '13', '544', '17500.00', '0.00', '1522157743', '819908.41', '0');
INSERT INTO wp_order_log VALUES ('553', '13', '545', '17500.00', '0.00', '1522157743', '837408.41', '0');
INSERT INTO wp_order_log VALUES ('554', '13', '546', '17500.00', '0.00', '1522157746', '844708.41', '0');
INSERT INTO wp_order_log VALUES ('555', '13', '547', '17500.00', '0.00', '1522157746', '862208.41', '0');
INSERT INTO wp_order_log VALUES ('556', '13', '548', '17500.00', '0.00', '1522157749', '869508.41', '0');
INSERT INTO wp_order_log VALUES ('557', '13', '549', '17500.00', '0.00', '1522157749', '887008.41', '0');
INSERT INTO wp_order_log VALUES ('558', '13', '550', '17500.00', '0.00', '1522157806', '812708.41', '0');
INSERT INTO wp_order_log VALUES ('559', '13', '551', '17500.00', '0.00', '1522157809', '830208.41', '0');
INSERT INTO wp_order_log VALUES ('560', '13', '552', '17500.00', '0.00', '1522157812', '837508.41', '0');
INSERT INTO wp_order_log VALUES ('561', '13', '553', '17500.00', '0.00', '1522157812', '855008.41', '0');
INSERT INTO wp_order_log VALUES ('562', '13', '554', '0.00', '0.00', '1522157815', '855008.41', '0');
INSERT INTO wp_order_log VALUES ('563', '13', '555', '0.00', '0.00', '1522157818', '855008.41', '0');
INSERT INTO wp_order_log VALUES ('564', '13', '556', '0.00', '0.00', '1522157818', '855008.41', '0');
INSERT INTO wp_order_log VALUES ('565', '13', '557', '17500.00', '0.00', '1522157821', '872508.41', '0');
INSERT INTO wp_order_log VALUES ('566', '13', '558', '17500.00', '0.00', '1522157824', '869608.41', '0');
INSERT INTO wp_order_log VALUES ('567', '13', '559', '17500.00', '0.00', '1522157827', '887108.41', '0');
INSERT INTO wp_order_log VALUES ('568', '13', '560', '17500.00', '0.00', '1522157828', '904608.41', '0');
INSERT INTO wp_order_log VALUES ('569', '13', '561', '17500.00', '0.00', '1522157869', '840508.41', '0');
INSERT INTO wp_order_log VALUES ('570', '13', '562', '17500.00', '0.00', '1522157881', '858008.41', '0');
INSERT INTO wp_order_log VALUES ('571', '13', '563', '17500.00', '0.00', '1522157884', '875508.41', '0');
INSERT INTO wp_order_log VALUES ('572', '13', '564', '17500.00', '0.00', '1522157893', '893008.41', '0');
INSERT INTO wp_order_log VALUES ('573', '13', '565', '17500.00', '0.00', '1522157896', '910508.41', '0');
INSERT INTO wp_order_log VALUES ('574', '13', '566', '17500.00', '0.00', '1522157905', '928008.41', '0');
INSERT INTO wp_order_log VALUES ('575', '13', '567', '17500.00', '0.00', '1522157908', '945508.41', '0');
INSERT INTO wp_order_log VALUES ('576', '13', '568', '17500.00', '0.00', '1522157909', '963008.41', '0');
INSERT INTO wp_order_log VALUES ('577', '13', '569', '0.00', '0.00', '1522157911', '963008.41', '0');
INSERT INTO wp_order_log VALUES ('578', '13', '570', '0.00', '0.00', '1522157914', '963008.41', '0');
INSERT INTO wp_order_log VALUES ('579', '13', '571', '0.00', '0.00', '1522157916', '963008.41', '0');
INSERT INTO wp_order_log VALUES ('580', '13', '572', '190.00', '0.00', '1522161009', '962994.41', '0');
INSERT INTO wp_order_log VALUES ('581', '13', '573', '0.00', '0.00', '1522161032', '962994.41', '0');
INSERT INTO wp_order_log VALUES ('582', '13', '574', '1750.00', '0.00', '1522172661', '861724.41', '0');
INSERT INTO wp_order_log VALUES ('583', '13', '575', '17500.00', '0.00', '1522172673', '879224.41', '0');
INSERT INTO wp_order_log VALUES ('584', '13', '576', '17500.00', '0.00', '1522172673', '896724.41', '0');
INSERT INTO wp_order_log VALUES ('585', '13', '577', '17500.00', '0.00', '1522172674', '914224.41', '0');
INSERT INTO wp_order_log VALUES ('586', '13', '578', '17500.00', '0.00', '1522172676', '931724.41', '0');
INSERT INTO wp_order_log VALUES ('587', '13', '579', '17500.00', '0.00', '1522172677', '949224.41', '0');
INSERT INTO wp_order_log VALUES ('588', '13', '580', '17500.00', '0.00', '1522172679', '966724.41', '0');
INSERT INTO wp_order_log VALUES ('589', '13', '581', '17500.00', '0.00', '1522172686', '984224.41', '0');
INSERT INTO wp_order_log VALUES ('590', '13', '582', '17500.00', '0.00', '1522172686', '1001724.41', '0');
INSERT INTO wp_order_log VALUES ('591', '13', '583', '17500.00', '0.00', '1522172688', '1019224.41', '0');
INSERT INTO wp_order_log VALUES ('592', '13', '584', '17500.00', '0.00', '1522172688', '1036724.41', '0');
INSERT INTO wp_order_log VALUES ('593', '13', '585', '175.00', '0.00', '1522205058', '1036797.41', '0');
INSERT INTO wp_order_log VALUES ('594', '13', '586', '0.00', '0.00', '1522241611', '1036695.41', '0');
INSERT INTO wp_order_log VALUES ('595', '13', '587', '1750.00', '0.00', '1522242241', '1037425.41', '0');
INSERT INTO wp_order_log VALUES ('596', '13', '588', '0.00', '0.00', '1522243336', '1037323.41', '0');
INSERT INTO wp_order_log VALUES ('597', '13', '589', '175.00', '0.00', '1522243795', '1037396.41', '0');
INSERT INTO wp_order_log VALUES ('598', '13', '590', '188.00', '0.00', '1522244019', '1037482.41', '0');
INSERT INTO wp_order_log VALUES ('599', '13', '591', '0.00', '0.00', '1522246126', '1037176.41', '0');
INSERT INTO wp_order_log VALUES ('600', '13', '592', '0.00', '0.00', '1522246127', '1037176.41', '0');
INSERT INTO wp_order_log VALUES ('601', '13', '593', '0.00', '0.00', '1522246127', '1037176.41', '0');
INSERT INTO wp_order_log VALUES ('602', '13', '594', '0.00', '0.00', '1522248174', '1037074.41', '0');
INSERT INTO wp_order_log VALUES ('603', '13', '595', '0.00', '0.00', '1522248237', '1036972.41', '0');
INSERT INTO wp_order_log VALUES ('604', '13', '596', '0.00', '0.00', '1522248344', '1036870.41', '0');
INSERT INTO wp_order_log VALUES ('605', '13', '597', '0.00', '0.00', '1522248407', '1036768.41', '0');
INSERT INTO wp_order_log VALUES ('607', '13', '598', '175.00', '0.00', '1522248585', '1036841.41', '0');
INSERT INTO wp_order_log VALUES ('608', '13', '599', '0.00', '0.00', '1522248873', '1036739.41', '0');
INSERT INTO wp_order_log VALUES ('609', '13', '600', '0.00', '0.00', '1522248945', '1036637.41', '0');
INSERT INTO wp_order_log VALUES ('610', '13', '601', '0.00', '0.00', '1522249011', '1036535.41', '0');
INSERT INTO wp_order_log VALUES ('611', '13', '602', '1750.00', '0.00', '1522293619', '1034205.41', '0');
INSERT INTO wp_order_log VALUES ('612', '13', '603', '1750.00', '0.00', '1522293622', '1035955.41', '0');
INSERT INTO wp_order_log VALUES ('613', '13', '604', '1750.00', '0.00', '1522293622', '1037705.41', '0');
INSERT INTO wp_order_log VALUES ('614', '13', '605', '1750.00', '0.00', '1522293623', '1039455.41', '0');
INSERT INTO wp_order_log VALUES ('615', '13', '606', '0.00', '0.00', '1522305425', '1037415.41', '0');
INSERT INTO wp_order_log VALUES ('616', '13', '607', '0.00', '0.00', '1522305428', '1037415.41', '0');
INSERT INTO wp_order_log VALUES ('617', '13', '608', '376.00', '0.00', '1522309432', '1037587.41', '0');
INSERT INTO wp_order_log VALUES ('618', '13', '609', '17500.00', '0.00', '1522310105', '1044887.41', '0');
INSERT INTO wp_order_log VALUES ('619', '13', '611', '188.00', '0.00', '1522320373', '1044871.41', '0');
INSERT INTO wp_order_log VALUES ('620', '13', '610', '0.00', '0.00', '1522320441', '1044871.41', '0');
INSERT INTO wp_order_log VALUES ('621', '13', '612', '0.00', '0.00', '1522331426', '1044769.41', '0');
INSERT INTO wp_order_log VALUES ('623', '13', '613', '0.00', '0.00', '1522331523', '1044667.41', '0');
INSERT INTO wp_order_log VALUES ('624', '13', '614', '0.00', '0.00', '1522331601', '1044157.41', '0');
INSERT INTO wp_order_log VALUES ('625', '13', '615', '0.00', '0.00', '1522331726', '1043137.41', '0');
INSERT INTO wp_order_log VALUES ('626', '13', '616', '0.00', '0.00', '1522331778', '1043137.41', '0');
INSERT INTO wp_order_log VALUES ('627', '13', '617', '0.00', '0.00', '1522332280', '1043035.41', '0');
INSERT INTO wp_order_log VALUES ('628', '13', '618', '188.00', '0.00', '1522332440', '1043121.41', '0');
INSERT INTO wp_order_log VALUES ('629', '13', '619', '0.00', '0.00', '1522332479', '1043019.41', '0');
INSERT INTO wp_order_log VALUES ('630', '13', '620', '0.00', '0.00', '1522332515', '1042917.41', '0');
INSERT INTO wp_order_log VALUES ('631', '13', '621', '0.00', '0.00', '1522332548', '1042815.41', '0');
INSERT INTO wp_order_log VALUES ('633', '13', '622', '0.00', '0.00', '1522332593', '1042713.41', '0');
INSERT INTO wp_order_log VALUES ('634', '13', '623', '0.00', '0.00', '1522332655', '1042611.41', '0');
INSERT INTO wp_order_log VALUES ('635', '13', '624', '100.00', '0.00', '1522332692', '1042609.41', '0');
INSERT INTO wp_order_log VALUES ('636', '13', '625', '175.00', '0.00', '1522332812', '1042682.41', '0');
INSERT INTO wp_order_log VALUES ('637', '13', '626', '1750.00', '0.00', '1522333170', '1043412.41', '0');
INSERT INTO wp_order_log VALUES ('638', '13', '627', '177.00', '0.00', '1522375320', '1043487.41', '0');
INSERT INTO wp_order_log VALUES ('639', '13', '628', '100.00', '0.00', '1522390247', '1043485.41', '0');
INSERT INTO wp_order_log VALUES ('640', '13', '629', '175.00', '0.00', '1522400612', '1043456.41', '0');
INSERT INTO wp_order_log VALUES ('641', '13', '630', '0.00', '0.00', '1522400648', '1043456.41', '0');
INSERT INTO wp_order_log VALUES ('643', '13', '631', '175.00', '0.00', '1522414650', '1043529.41', '0');
INSERT INTO wp_order_log VALUES ('644', '13', '632', '188.00', '0.00', '1522418203', '1043615.41', '0');
INSERT INTO wp_order_log VALUES ('645', '13', '633', '18800.00', '0.00', '1522418510', '1052215.41', '0');
INSERT INTO wp_order_log VALUES ('646', '13', '634', '0.00', '0.00', '1522424393', '1052011.41', '0');
INSERT INTO wp_order_log VALUES ('647', '13', '635', '175.00', '0.00', '1522424399', '1052186.41', '0');
INSERT INTO wp_order_log VALUES ('648', '13', '636', '18500.00', '0.00', '1522464932', '1040086.41', '0');
INSERT INTO wp_order_log VALUES ('649', '13', '637', '18500.00', '0.00', '1522464941', '1058586.41', '0');
INSERT INTO wp_order_log VALUES ('650', '13', '638', '0.00', '0.00', '1522464955', '1058586.41', '0');
INSERT INTO wp_order_log VALUES ('651', '13', '639', '0.00', '0.00', '1522473754', '1058280.41', '0');
INSERT INTO wp_order_log VALUES ('652', '13', '640', '0.00', '0.00', '1522473754', '1058280.41', '0');
INSERT INTO wp_order_log VALUES ('653', '13', '641', '0.00', '0.00', '1522473754', '1058280.41', '0');
INSERT INTO wp_order_log VALUES ('654', '13', '642', '175.00', '0.00', '1522505377', '1058251.41', '0');
INSERT INTO wp_order_log VALUES ('655', '13', '643', '0.00', '0.00', '1522505377', '1058251.41', '0');
INSERT INTO wp_order_log VALUES ('656', '13', '644', '0.00', '0.00', '1522510820', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('657', '13', '645', '0.00', '0.00', '1522510823', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('658', '13', '646', '0.00', '0.00', '1522510823', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('659', '13', '647', '0.00', '0.00', '1522510824', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('660', '13', '648', '0.00', '0.00', '1522510828', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('661', '13', '649', '0.00', '0.00', '1522510828', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('662', '13', '650', '0.00', '0.00', '1522510828', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('663', '13', '651', '0.00', '0.00', '1522510828', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('664', '13', '652', '0.00', '0.00', '1522510828', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('665', '13', '653', '0.00', '0.00', '1522510829', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('666', '13', '654', '0.00', '0.00', '1522510832', '1057129.41', '0');
INSERT INTO wp_order_log VALUES ('667', '13', '655', '17500.00', '0.00', '1522515637', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('668', '13', '656', '0.00', '0.00', '1522515640', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('669', '13', '657', '0.00', '0.00', '1522515640', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('670', '13', '658', '0.00', '0.00', '1522515641', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('671', '13', '659', '0.00', '0.00', '1522515643', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('672', '13', '660', '0.00', '0.00', '1522515644', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('673', '13', '661', '0.00', '0.00', '1522515644', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('674', '13', '662', '0.00', '0.00', '1522515646', '993029.41', '0');
INSERT INTO wp_order_log VALUES ('675', '13', '663', '17500.00', '0.00', '1522518302', '979929.41', '0');
INSERT INTO wp_order_log VALUES ('676', '13', '664', '17500.00', '0.00', '1522518305', '997429.41', '0');
INSERT INTO wp_order_log VALUES ('677', '13', '665', '17500.00', '0.00', '1522518326', '1014929.41', '0');
INSERT INTO wp_order_log VALUES ('678', '13', '666', '17500.00', '0.00', '1522521555', '920229.41', '0');
INSERT INTO wp_order_log VALUES ('679', '13', '667', '17500.00', '0.00', '1522521555', '937729.41', '0');
INSERT INTO wp_order_log VALUES ('680', '13', '668', '17500.00', '0.00', '1522521558', '955229.41', '0');
INSERT INTO wp_order_log VALUES ('681', '13', '669', '17500.00', '0.00', '1522521558', '972729.41', '0');
INSERT INTO wp_order_log VALUES ('682', '13', '670', '17500.00', '0.00', '1522521558', '990229.41', '0');
INSERT INTO wp_order_log VALUES ('683', '13', '671', '17500.00', '0.00', '1522521559', '1007729.41', '0');
INSERT INTO wp_order_log VALUES ('684', '13', '672', '17500.00', '0.00', '1522521561', '1025229.41', '0');
INSERT INTO wp_order_log VALUES ('685', '13', '673', '17500.00', '0.00', '1522521561', '1042729.41', '0');
INSERT INTO wp_order_log VALUES ('686', '13', '674', '17500.00', '0.00', '1522521562', '1060229.41', '0');
INSERT INTO wp_order_log VALUES ('687', '13', '675', '17500.00', '0.00', '1522521564', '1077729.41', '0');
INSERT INTO wp_order_log VALUES ('688', '13', '676', '17500.00', '0.00', '1522521564', '1095229.41', '0');
INSERT INTO wp_order_log VALUES ('689', '13', '677', '0.00', '0.00', '1522521640', '983029.41', '0');
INSERT INTO wp_order_log VALUES ('690', '13', '678', '0.00', '0.00', '1522521642', '983029.41', '0');
INSERT INTO wp_order_log VALUES ('691', '13', '679', '17500.00', '0.00', '1522521642', '1000529.41', '0');
INSERT INTO wp_order_log VALUES ('692', '13', '680', '17500.00', '0.00', '1522521645', '1018029.41', '0');
INSERT INTO wp_order_log VALUES ('693', '13', '681', '17500.00', '0.00', '1522521645', '1035529.41', '0');
INSERT INTO wp_order_log VALUES ('694', '13', '682', '17500.00', '0.00', '1522521645', '1053029.41', '0');
INSERT INTO wp_order_log VALUES ('695', '13', '683', '17500.00', '0.00', '1522521646', '1070529.41', '0');
INSERT INTO wp_order_log VALUES ('696', '13', '684', '17500.00', '0.00', '1522521648', '1088029.41', '0');
INSERT INTO wp_order_log VALUES ('697', '13', '685', '17500.00', '0.00', '1522521648', '1105529.41', '0');
INSERT INTO wp_order_log VALUES ('698', '13', '686', '17500.00', '0.00', '1522521649', '1123029.41', '0');
INSERT INTO wp_order_log VALUES ('699', '13', '687', '17500.00', '0.00', '1522521651', '1140529.41', '0');
INSERT INTO wp_order_log VALUES ('700', '13', '688', '0.00', '0.00', '1522523683', '1140121.41', '0');
INSERT INTO wp_order_log VALUES ('701', '13', '689', '0.00', '0.00', '1522523698', '1140121.41', '0');
INSERT INTO wp_order_log VALUES ('702', '13', '690', '0.00', '0.00', '1522523698', '1140121.41', '0');
INSERT INTO wp_order_log VALUES ('703', '13', '691', '0.00', '0.00', '1522523699', '1140121.41', '0');
INSERT INTO wp_order_log VALUES ('704', '13', '692', '0.00', '0.00', '1522523809', '1068721.41', '0');
INSERT INTO wp_order_log VALUES ('705', '13', '693', '0.00', '0.00', '1522523812', '1068721.41', '0');
INSERT INTO wp_order_log VALUES ('706', '13', '694', '0.00', '0.00', '1522523812', '1068721.41', '0');
INSERT INTO wp_order_log VALUES ('707', '13', '695', '0.00', '0.00', '1522523812', '1068721.41', '0');
INSERT INTO wp_order_log VALUES ('708', '13', '696', '17500.00', '0.00', '1522523815', '1086221.41', '0');
INSERT INTO wp_order_log VALUES ('709', '13', '697', '17500.00', '0.00', '1522523815', '1103721.41', '0');
INSERT INTO wp_order_log VALUES ('710', '13', '698', '17500.00', '0.00', '1522523815', '1121221.41', '0');
INSERT INTO wp_order_log VALUES ('711', '13', '699', '18000.00', '0.00', '1522524130', '1129021.41', '0');
INSERT INTO wp_order_log VALUES ('712', '13', '700', '0.00', '0.00', '1522544566', '1118821.41', '0');
INSERT INTO wp_order_log VALUES ('713', '13', '701', '17500.00', '0.00', '1522544868', '1126121.41', '0');
INSERT INTO wp_order_log VALUES ('714', '13', '702', '0.00', '0.00', '1522544961', '1115921.41', '0');
INSERT INTO wp_order_log VALUES ('715', '13', '703', '17500.00', '0.00', '1522545030', '1123221.41', '0');
INSERT INTO wp_order_log VALUES ('716', '13', '704', '17500.00', '0.00', '1522545115', '1130521.41', '0');
INSERT INTO wp_order_log VALUES ('717', '13', '705', '17500.00', '0.00', '1522545184', '1137821.41', '0');
INSERT INTO wp_order_log VALUES ('718', '13', '706', '0.00', '0.00', '1522545261', '1127621.41', '0');
INSERT INTO wp_order_log VALUES ('719', '13', '707', '0.00', '0.00', '1522545333', '1117421.41', '0');
INSERT INTO wp_order_log VALUES ('720', '13', '708', '0.00', '0.00', '1522572420', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('721', '13', '709', '0.00', '0.00', '1522572424', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('722', '13', '710', '0.00', '0.00', '1522572427', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('723', '13', '711', '0.00', '0.00', '1522572431', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('724', '13', '712', '0.00', '0.00', '1522572431', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('725', '13', '713', '0.00', '0.00', '1522572434', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('726', '13', '714', '0.00', '0.00', '1522572435', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('727', '13', '715', '0.00', '0.00', '1522572436', '1116605.41', '0');
INSERT INTO wp_order_log VALUES ('728', '13', '716', '175.00', '0.00', '1522584504', '1116678.41', '0');
INSERT INTO wp_order_log VALUES ('729', '13', '717', '0.00', '0.00', '1522664923', '1116474.41', '0');
INSERT INTO wp_order_log VALUES ('730', '13', '718', '185.00', '0.00', '1522664939', '1116659.41', '0');
INSERT INTO wp_order_log VALUES ('731', '13', '719', '17500.00', '0.00', '1522672843', '1123959.41', '0');
INSERT INTO wp_order_log VALUES ('732', '13', '720', '0.00', '0.00', '1522672932', '1113759.41', '0');
INSERT INTO wp_order_log VALUES ('733', '13', '721', '0.00', '0.00', '1522673003', '1103559.41', '0');
INSERT INTO wp_order_log VALUES ('734', '13', '722', '0.00', '0.00', '1522673079', '1093359.41', '0');
INSERT INTO wp_order_log VALUES ('735', '13', '723', '17500.00', '0.00', '1522673172', '1100659.41', '0');
INSERT INTO wp_order_log VALUES ('736', '13', '724', '17500.00', '0.00', '1522673260', '1107959.41', '0');
INSERT INTO wp_order_log VALUES ('737', '13', '725', '0.00', '0.00', '1522673345', '1097759.41', '0');
INSERT INTO wp_order_log VALUES ('738', '13', '726', '175.00', '0.00', '1522724091', '1097832.41', '0');
INSERT INTO wp_order_log VALUES ('739', '13', '727', '175.00', '0.00', '1522727354', '1097905.41', '0');
INSERT INTO wp_order_log VALUES ('740', '13', '728', '0.00', '0.00', '1522727568', '1093825.41', '0');
INSERT INTO wp_order_log VALUES ('741', '13', '729', '1770.00', '0.00', '1522727687', '1095595.41', '0');
INSERT INTO wp_order_log VALUES ('742', '13', '730', '1770.00', '0.00', '1522727696', '1097365.41', '0');
INSERT INTO wp_order_log VALUES ('743', '13', '731', '0.00', '0.00', '1522727714', '1097365.41', '0');
INSERT INTO wp_order_log VALUES ('744', '13', '735', '0.00', '0.00', '1522733532', '1091245.41', '0');
INSERT INTO wp_order_log VALUES ('745', '13', '732', '0.00', '0.00', '1522733613', '1091245.41', '0');
INSERT INTO wp_order_log VALUES ('746', '13', '733', '0.00', '0.00', '1522733619', '1091245.41', '0');
INSERT INTO wp_order_log VALUES ('747', '13', '734', '0.00', '0.00', '1522733629', '1091245.41', '0');
INSERT INTO wp_order_log VALUES ('748', '13', '736', '175.00', '0.00', '1522745716', '1091318.41', '0');
INSERT INTO wp_order_log VALUES ('749', '13', '737', '9250.00', '0.00', '1522753163', '1095468.41', '0');
INSERT INTO wp_order_log VALUES ('750', '13', '738', '0.00', '0.00', '1522756050', '1085268.41', '0');
INSERT INTO wp_order_log VALUES ('751', '13', '739', '0.00', '0.00', '1522756301', '1085166.41', '0');
INSERT INTO wp_order_log VALUES ('752', '13', '740', '350.00', '0.00', '1522756390', '1085312.41', '0');
INSERT INTO wp_order_log VALUES ('753', '13', '741', '0.00', '0.00', '1522756490', '1084802.41', '0');
INSERT INTO wp_order_log VALUES ('754', '13', '742', '0.00', '0.00', '1522756558', '1083782.41', '0');
INSERT INTO wp_order_log VALUES ('755', '13', '743', '0.00', '0.00', '1522762513', '1083680.41', '0');
INSERT INTO wp_order_log VALUES ('756', '13', '745', '0.00', '0.00', '1522762616', '1083374.41', '0');
INSERT INTO wp_order_log VALUES ('757', '13', '746', '0.00', '0.00', '1522762619', '1083374.41', '0');
INSERT INTO wp_order_log VALUES ('758', '13', '744', '0.00', '0.00', '1522762727', '1083374.41', '0');
INSERT INTO wp_order_log VALUES ('759', '13', '747', '0.00', '0.00', '1522765813', '1082252.41', '0');
INSERT INTO wp_order_log VALUES ('760', '13', '748', '0.00', '0.00', '1522765816', '1082252.41', '0');
INSERT INTO wp_order_log VALUES ('761', '13', '749', '0.00', '0.00', '1522774256', '1082150.41', '0');
INSERT INTO wp_order_log VALUES ('762', '13', '750', '0.00', '0.00', '1522899408', '1060018.41', '0');
INSERT INTO wp_order_log VALUES ('763', '13', '751', '0.00', '0.00', '1522899408', '1060018.41', '0');
INSERT INTO wp_order_log VALUES ('764', '13', '752', '0.00', '0.00', '1522899408', '1060018.41', '0');
INSERT INTO wp_order_log VALUES ('765', '13', '753', '0.00', '0.00', '1522899408', '1060018.41', '0');
INSERT INTO wp_order_log VALUES ('766', '13', '754', '175.00', '0.00', '1522899408', '1060193.41', '0');
INSERT INTO wp_order_log VALUES ('767', '13', '755', '1770.00', '0.00', '1522899408', '1061963.41', '0');
INSERT INTO wp_order_log VALUES ('768', '13', '756', '0.00', '0.00', '1522899408', '1061963.41', '0');
INSERT INTO wp_order_log VALUES ('769', '13', '757', '0.00', '0.00', '1522899408', '1061963.41', '0');
INSERT INTO wp_order_log VALUES ('770', '13', '758', '0.00', '0.00', '1522899408', '1061963.41', '0');
INSERT INTO wp_order_log VALUES ('771', '13', '759', '0.00', '0.00', '1522899408', '1061963.41', '0');
INSERT INTO wp_order_log VALUES ('772', '13', '760', '0.00', '0.00', '1522899408', '1061963.41', '0');
INSERT INTO wp_order_log VALUES ('773', '13', '761', '0.00', '0.00', '1522901112', '1061861.41', '0');
INSERT INTO wp_order_log VALUES ('774', '13', '762', '0.00', '0.00', '1522901411', '1061759.41', '0');
INSERT INTO wp_order_log VALUES ('775', '13', '763', '175.00', '0.00', '1522902083', '1061832.41', '0');
INSERT INTO wp_order_log VALUES ('776', '13', '764', '0.00', '0.00', '1522913304', '1041432.41', '0');
INSERT INTO wp_order_log VALUES ('777', '13', '765', '0.00', '0.00', '1522913309', '1041432.41', '0');
INSERT INTO wp_order_log VALUES ('778', '13', '766', '175.00', '0.00', '1522917770', '990403.41', '0');
INSERT INTO wp_order_log VALUES ('779', '13', '767', '175.00', '0.00', '1522917775', '990578.41', '0');
INSERT INTO wp_order_log VALUES ('780', '13', '768', '17500.00', '0.00', '1522917782', '1008078.41', '0');
INSERT INTO wp_order_log VALUES ('781', '13', '769', '17500.00', '0.00', '1522917786', '1025578.41', '0');
INSERT INTO wp_order_log VALUES ('782', '13', '770', '17500.00', '0.00', '1522917793', '1043078.41', '0');
INSERT INTO wp_order_log VALUES ('783', '13', '771', '17500.00', '0.00', '1522917793', '1060578.41', '0');
INSERT INTO wp_order_log VALUES ('784', '13', '772', '17500.00', '0.00', '1522917795', '1078078.41', '0');
INSERT INTO wp_order_log VALUES ('785', '13', '773', '0.00', '0.00', '1522981102', '1077976.41', '0');
INSERT INTO wp_order_log VALUES ('786', '13', '774', '0.00', '0.00', '1522981186', '1077874.41', '0');
INSERT INTO wp_order_log VALUES ('787', '13', '775', '0.00', '0.00', '1522981268', '1077772.41', '0');
INSERT INTO wp_order_log VALUES ('788', '13', '776', '188.00', '0.00', '1522981346', '1077858.41', '0');
INSERT INTO wp_order_log VALUES ('789', '13', '777', '0.00', '0.00', '1522981466', '1077756.41', '0');
INSERT INTO wp_order_log VALUES ('790', '13', '778', '0.00', '0.00', '1522981596', '1077654.41', '0');
INSERT INTO wp_order_log VALUES ('791', '13', '779', '188.00', '0.00', '1522981867', '1077740.41', '0');
INSERT INTO wp_order_log VALUES ('792', '13', '780', '0.00', '0.00', '1522993686', '1077638.41', '0');
INSERT INTO wp_order_log VALUES ('793', '13', '781', '0.00', '0.00', '1522994685', '1077536.41', '0');
INSERT INTO wp_order_log VALUES ('794', '13', '782', '100.00', '0.00', '1522997430', '1077534.41', '0');
INSERT INTO wp_order_log VALUES ('795', '13', '783', '100.00', '0.00', '1522997861', '1077532.41', '0');
INSERT INTO wp_order_log VALUES ('796', '13', '784', '188.00', '0.00', '1523011609', '1077618.41', '0');
INSERT INTO wp_order_log VALUES ('797', '13', '785', '1880.00', '0.00', '1523011722', '1078478.41', '0');
INSERT INTO wp_order_log VALUES ('798', '13', '786', '175.00', '0.00', '1523037581', '1078551.41', '0');
INSERT INTO wp_order_log VALUES ('799', '13', '787', '0.00', '0.00', '1523081157', '1078449.41', '0');
INSERT INTO wp_order_log VALUES ('800', '13', '788', '175.00', '0.00', '1523081233', '1078318.41', '0');
INSERT INTO wp_order_log VALUES ('801', '13', '789', '175.00', '0.00', '1523081235', '1078493.41', '0');
INSERT INTO wp_order_log VALUES ('802', '13', '790', '175.00', '0.00', '1523081235', '1078668.41', '0');
INSERT INTO wp_order_log VALUES ('803', '13', '791', '0.00', '0.00', '1523086849', '1078566.41', '0');
INSERT INTO wp_order_log VALUES ('804', '13', '792', '0.00', '0.00', '1523094134', '1078056.41', '0');
INSERT INTO wp_order_log VALUES ('805', '13', '793', '0.00', '0.00', '1523094137', '1078056.41', '0');
INSERT INTO wp_order_log VALUES ('806', '13', '794', '175.00', '0.00', '1523094152', '1078231.41', '0');
INSERT INTO wp_order_log VALUES ('807', '13', '796', '0.00', '0.00', '1523094173', '1078231.41', '0');
INSERT INTO wp_order_log VALUES ('808', '13', '795', '0.00', '0.00', '1523094706', '1078231.41', '0');

-- ----------------------------
-- Table structure for `wp_payment`
-- ----------------------------
DROP TABLE IF EXISTS `wp_payment`;
CREATE TABLE `wp_payment` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(288) NOT NULL COMMENT '支付名称',
  `is_use` tinyint(1) NOT NULL COMMENT '是否使用1使用0不使用',
  `pay_point` varchar(8) NOT NULL COMMENT '手续费',
  `pay_conf` text NOT NULL COMMENT '配置信息',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '是否删除1删除0未删除',
  `dotime` varchar(18) NOT NULL COMMENT '操作时间',
  `pay_order` int(8) DEFAULT NULL COMMENT '排序，数组越大越靠前显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_payment
-- ----------------------------
INSERT INTO wp_payment VALUES ('1', '支付宝', '0', '0', 'name:alipay', '1', '1502814659', '2');
INSERT INTO wp_payment VALUES ('2', '微信支付', '0', '0', 'name:wxpay|\r\nweb:qweqwe', '1', '1502154692', '1');
INSERT INTO wp_payment VALUES ('3', '银联支付', '0', '0', 'name:ylpay', '1', '1502154682', '3');
INSERT INTO wp_payment VALUES ('4', '微信支付1', '1', '0', '{\"web\":\"qweqwe\",\"webw2\":\"qweqwessssss\"}', '1', '1499224807', '0');
INSERT INTO wp_payment VALUES ('5', 'QQ支付', '1', '0', 'name:qd_qqpay', '1', '1512386076', '0');
INSERT INTO wp_payment VALUES ('6', '微信扫码支付', '1', '0', 'name:qtb_pay_wxpay_code', '1', '1504666527', '0');
INSERT INTO wp_payment VALUES ('7', '支付宝支付', '1', '0', 'name:qtb_alipay', '1', '1503296316', '0');
INSERT INTO wp_payment VALUES ('8', '快捷支付', '1', '0', 'name:qtb_yinlian', '1', '1504666930', '0');
INSERT INTO wp_payment VALUES ('9', '扫码支付', '1', '0', 'name:izpay_wx', '1', '1502817647', '0');
INSERT INTO wp_payment VALUES ('10', '支付宝支付', '1', '0', 'name:izpay_alipay', '1', '1502819394', '0');
INSERT INTO wp_payment VALUES ('11', '微信扫码支付', '1', '0', 'name:Weixin', '1', '1502972933', '0');
INSERT INTO wp_payment VALUES ('12', '支付宝扫码支付', '1', '0', 'name:AlipayPAZH', '1', '1502975443', '0');
INSERT INTO wp_payment VALUES ('13', '微信wap', '1', '0', 'name:qtb_wx_wap', '1', '1504279466', '0');
INSERT INTO wp_payment VALUES ('14', '钱通扫码支付', '1', '0', 'name:qt_wx_code', '1', '1504752558', '0');
INSERT INTO wp_payment VALUES ('15', '钱通快捷支付', '1', '0', 'name:qt_kuaijie', '1', '1504842796', '0');
INSERT INTO wp_payment VALUES ('16', '微信wap2', '1', '0', 'name:wx_wap_2', '1', '1504866773', '0');
INSERT INTO wp_payment VALUES ('17', '浦发微信h5支付', '1', '0', 'name:wxPub', '1', '1505205353', '0');
INSERT INTO wp_payment VALUES ('18', '浦发微信扫码支付', '1', '0', 'name:wxPubQR', '1', '1505207126', '0');
INSERT INTO wp_payment VALUES ('19', '秒冲宝', '1', '0', 'name:mcpay', '1', '1505670460', '0');
INSERT INTO wp_payment VALUES ('20', '一卡支付-微信扫码', '1', '2', 'name:yika_WEIXIN', '1', '1508065185', '0');
INSERT INTO wp_payment VALUES ('21', '一卡支付-快捷支付', '1', '0', 'name:yika_KUAIJIE', '1', '1507859458', '0');
INSERT INTO wp_payment VALUES ('22', '在线支付', '1', '0', 'name:keguan', '1', '1507863096', '0');
INSERT INTO wp_payment VALUES ('23', '微信支付', '1', '0', 'name:qd_wxpay', '1', '1512386116', '0');
INSERT INTO wp_payment VALUES ('24', 'QQ扫码', '1', '0', 'name:qd_qqpay2', '1', '1512386126', '0');
INSERT INTO wp_payment VALUES ('25', '钱通宝-支付宝支付', '1', '2', 'name:qtb_alipay', '0', '1520403457', '0');
INSERT INTO wp_payment VALUES ('26', '微信扫码', '1', '0', 'name:qtb_pay_wxpay_code', '0', '1520401107', '0');
INSERT INTO wp_payment VALUES ('27', '微信h5', '1', '0', 'name:qd_wxpay', '1', '1512386033', '0');
INSERT INTO wp_payment VALUES ('28', 'zhifubao', '1', '0', 'name:mfpay', '0', '1521089430', '0');

-- ----------------------------
-- Table structure for `wp_payment2`
-- ----------------------------
DROP TABLE IF EXISTS `wp_payment2`;
CREATE TABLE `wp_payment2` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `pay_name` varchar(288) NOT NULL COMMENT '支付名称',
  `is_use` tinyint(1) NOT NULL COMMENT '是否使用1使用0不使用',
  `pay_point` varchar(8) NOT NULL COMMENT '手续费',
  `pay_conf` text NOT NULL COMMENT '配置信息',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '是否删除1删除0未删除',
  `dotime` varchar(18) NOT NULL COMMENT '操作时间',
  `pay_order` int(8) DEFAULT NULL COMMENT '排序，数组越大越靠前显示',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_payment2
-- ----------------------------
INSERT INTO wp_payment2 VALUES ('1', '支付宝', '0', '0', 'name:alipay', '1', '1502814659', '2');
INSERT INTO wp_payment2 VALUES ('2', '微信支付', '0', '0', 'name:wxpay|\r\nweb:qweqwe', '1', '1502154692', '1');
INSERT INTO wp_payment2 VALUES ('3', '银联支付', '0', '0', 'name:ylpay', '1', '1502154682', '3');
INSERT INTO wp_payment2 VALUES ('4', '微信支付1', '1', '0', '{\"web\":\"qweqwe\",\"webw2\":\"qweqwessssss\"}', '1', '1499224807', '0');
INSERT INTO wp_payment2 VALUES ('5', '微信扫码', '0', '0', 'name:zypay_wx', '0', '1510825223', '0');
INSERT INTO wp_payment2 VALUES ('6', '微信扫码支付', '1', '0', 'name:qtb_pay_wxpay_code', '1', '1504666527', '0');
INSERT INTO wp_payment2 VALUES ('7', '支付宝支付', '1', '0', 'name:qtb_alipay', '1', '1503296316', '0');
INSERT INTO wp_payment2 VALUES ('8', '快捷支付', '1', '0', 'name:qtb_yinlian', '1', '1504666930', '0');
INSERT INTO wp_payment2 VALUES ('9', '扫码支付', '1', '0', 'name:izpay_wx', '1', '1502817647', '0');
INSERT INTO wp_payment2 VALUES ('10', '支付宝支付', '1', '0', 'name:izpay_alipay', '1', '1502819394', '0');
INSERT INTO wp_payment2 VALUES ('11', '微信扫码支付', '1', '0', 'name:Weixin', '1', '1502972933', '0');
INSERT INTO wp_payment2 VALUES ('12', '支付宝扫码支付', '1', '0', 'name:AlipayPAZH', '1', '1502975443', '0');
INSERT INTO wp_payment2 VALUES ('13', '微信wap', '1', '0', 'name:qtb_wx_wap', '1', '1504279466', '0');
INSERT INTO wp_payment2 VALUES ('14', '钱通扫码支付', '1', '0', 'name:qt_wx_code', '1', '1504752558', '0');
INSERT INTO wp_payment2 VALUES ('15', '钱通快捷支付', '1', '0', 'name:qt_kuaijie', '1', '1504842796', '0');
INSERT INTO wp_payment2 VALUES ('16', '微信wap2', '1', '0', 'name:wx_wap_2', '1', '1504866773', '0');
INSERT INTO wp_payment2 VALUES ('17', '浦发微信h5支付', '1', '0', 'name:wxPub', '1', '1505205353', '0');
INSERT INTO wp_payment2 VALUES ('18', '浦发微信扫码支付', '1', '0', 'name:wxPubQR', '1', '1505207126', '0');
INSERT INTO wp_payment2 VALUES ('19', '秒冲宝', '1', '0', 'name:mcpay', '1', '1505670460', '0');
INSERT INTO wp_payment2 VALUES ('20', '一卡支付-微信扫码', '1', '2', 'name:yika_WEIXIN', '1', '1508065185', '0');
INSERT INTO wp_payment2 VALUES ('21', '一卡支付-快捷支付', '1', '0', 'name:yika_KUAIJIE', '1', '1507859458', '0');
INSERT INTO wp_payment2 VALUES ('22', '在线支付', '1', '0', 'name:keguan', '1', '1507863096', '0');
INSERT INTO wp_payment2 VALUES ('23', '微信支付', '0', '0', 'name:ysy_wxwap', '0', '1510825237', '0');
INSERT INTO wp_payment2 VALUES ('24', 'qq扫码（暂停使用）', '0', '0', 'name:zypay_qq', '0', '1510825246', '0');
INSERT INTO wp_payment2 VALUES ('25', '支付宝扫码（暂停使用）', '0', '0', 'name:ysy_alwap', '0', '1510825254', '0');
INSERT INTO wp_payment2 VALUES ('26', '微信扫码（暂停使用）', '0', '0', 'name:ysy_wxcode', '0', '1510825260', '0');
INSERT INTO wp_payment2 VALUES ('27', '微信h5', '1', '0', 'name:zx_wxzf', '0', '1510815205', '0');

-- ----------------------------
-- Table structure for `wp_price_log`
-- ----------------------------
DROP TABLE IF EXISTS `wp_price_log`;
CREATE TABLE `wp_price_log` (
  `id` mediumint(18) NOT NULL AUTO_INCREMENT,
  `uid` mediumint(18) DEFAULT NULL,
  `oid` mediumint(18) DEFAULT NULL COMMENT '订单id',
  `type` tinyint(1) DEFAULT NULL COMMENT '1增加2减少',
  `account` varchar(18) DEFAULT NULL COMMENT '变动金额',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '说明',
  `time` varchar(18) DEFAULT NULL COMMENT '时间',
  `nowmoney` varchar(18) DEFAULT NULL COMMENT '此刻余额',
  `ptype` tinyint(1) DEFAULT '0' COMMENT '0 余额 1奖金',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1649 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_price_log
-- ----------------------------
INSERT INTO wp_price_log VALUES ('1634', '13', '798', '2', '102', '下单', '下单成功', '1534948012', '1078027.41', '0');
INSERT INTO wp_price_log VALUES ('1635', '13', '799', '2', '5000', '下单', '下单成功', '1534953198', '1073027.41', '0');
INSERT INTO wp_price_log VALUES ('1636', '13', '800', '2', '100', '下单', '下单成功', '1534953303', '1072927.41', '0');
INSERT INTO wp_price_log VALUES ('1637', '13', '801', '2', '100', '下单', '下单成功', '1534954231', '1072827.41', '0');
INSERT INTO wp_price_log VALUES ('1638', '13', '802', '2', '100', '下单', '下单成功', '1534954276', '1072727.41', '0');
INSERT INTO wp_price_log VALUES ('1639', '13', '803', '2', '100', '下单', '下单成功', '1534954371', '1072627.41', '0');
INSERT INTO wp_price_log VALUES ('1640', '13', '804', '2', '100', '下单', '下单成功', '1534954474', '1072527.41', '0');
INSERT INTO wp_price_log VALUES ('1641', '13', '805', '2', '100', '下单', '下单成功', '1534954513', '1072427.41', '0');
INSERT INTO wp_price_log VALUES ('1642', '13', '806', '2', '100', '下单', '下单成功', '1534954540', '1072327.41', '0');
INSERT INTO wp_price_log VALUES ('1643', '13', '807', '2', '100', '下单', '下单成功', '1534954586', '1072227.41', '0');
INSERT INTO wp_price_log VALUES ('1644', '13', '808', '2', '100', '下单', '下单成功', '1534955979', '1072127.41', '0');
INSERT INTO wp_price_log VALUES ('1645', '13', '809', '2', '100', '下单', '下单成功', '1535009044', '1072027.41', '0');
INSERT INTO wp_price_log VALUES ('1646', '1', '809', '0', '10', '代数奖', '来自第[1]代[命运]', '1535009044', '0.00', '1');
INSERT INTO wp_price_log VALUES ('1647', '13', '810', '2', '100', '下单', '下单成功', '1535009086', '1071927.41', '0');
INSERT INTO wp_price_log VALUES ('1648', '1', '810', '0', '10', '代数奖', '来自第[1]代[命运]', '1535009086', '10.00', '1');

-- ----------------------------
-- Table structure for `wp_productclass`
-- ----------------------------
DROP TABLE IF EXISTS `wp_productclass`;
CREATE TABLE `wp_productclass` (
  `pcid` mediumint(8) NOT NULL AUTO_INCREMENT,
  `pcname` varchar(8) DEFAULT NULL,
  `isdelete` int(1) DEFAULT '0',
  PRIMARY KEY (`pcid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_productclass
-- ----------------------------
INSERT INTO wp_productclass VALUES ('1', '油', '1');
INSERT INTO wp_productclass VALUES ('2', '金属', '1');
INSERT INTO wp_productclass VALUES ('3', '啥的萨达是123', '1');
INSERT INTO wp_productclass VALUES ('4', '指数', '1');
INSERT INTO wp_productclass VALUES ('5', '外汇', '0');

-- ----------------------------
-- Table structure for `wp_productdata`
-- ----------------------------
DROP TABLE IF EXISTS `wp_productdata`;
CREATE TABLE `wp_productdata` (
  `id` int(28) NOT NULL AUTO_INCREMENT,
  `pid` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `Name` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `Price` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `Open` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `Close` varchar(18) CHARACTER SET utf8 DEFAULT NULL,
  `High` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '最高',
  `Low` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '最低',
  `Diff` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '振幅',
  `DiffRate` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '波幅',
  `UpdateTime` varchar(18) DEFAULT NULL,
  `rands` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `point` varchar(8) CHARACTER SET utf8 DEFAULT NULL,
  `isdelete` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_productdata
-- ----------------------------
INSERT INTO wp_productdata VALUES ('1', '3', '3', '27359.9', '27718.97', '27359.89', '27734.39', '27271.78', '0', '0', '1498470185', '0.01', null, '1');
INSERT INTO wp_productdata VALUES ('2', '4', '4', '3622.08', '3674.39', '3621.52', '3683.2', '3574.16', '0', '0', '1498470184', '0.56', null, '1');
INSERT INTO wp_productdata VALUES ('3', '5', '5', '39732.69', '39651.04', '39734.12', '39975.8', '39303.62', '0', '0', '1498470185', '-1.43', null, '1');
INSERT INTO wp_productdata VALUES ('4', '6', '美元/欧元', '142.812', '142.727', '142.724', '142.92', '142.46', '0.003223', '0.46', '1535010082', null, null, '0');
INSERT INTO wp_productdata VALUES ('5', '7', '英镑/美元', '1.28826', '1.29118', '1.29118', '1.29169', '1.2854', '0.004872', '0.00629', '1535010082', null, null, '0');
INSERT INTO wp_productdata VALUES ('6', '8', '澳元/加元', '0.99256', '0.99578', '0.9957', '0.99655', '0.99063', '0.005945', '0.00592', '1519875196', null, null, '1');
INSERT INTO wp_productdata VALUES ('7', '9', '欧元英镑', '0.88575', '0.88621', '0.88608', '0.88761', '0.8853', '0.002607', '0.00231', '1519897481', null, null, '1');
INSERT INTO wp_productdata VALUES ('8', '10', '英镑/澳元', '1.77842', '1.77247', '1.77257', '1.78132', '1.7706', '0.006048', '0.01072', '1519875226', null, null, '1');
INSERT INTO wp_productdata VALUES ('9', '11', '英镑/加元', '1.71797', '1.71094', '1.71112', '1.72025', '1.71049', '0.005704', '0.00976', '1512645555', null, null, '1');
INSERT INTO wp_productdata VALUES ('10', '12', '比特币：系统搭建联系QQ280701', '6830.3904', '6827.68', '20.912134302481', '6830.42', '6813.04', '1428.0', '1.428', '1523099806', null, null, '0');
INSERT INTO wp_productdata VALUES ('11', '13', '美元/日元', '110.867', '110.552', '110.551', '110.93', '110.48', '0.00407', '0.45', '1535010082', null, null, '0');
INSERT INTO wp_productdata VALUES ('12', '14', '国际黄金', '1187.901', '1196.49', '1195.95', '1196.94', '1186.59', '0', '0', '1535010082', null, null, '0');
INSERT INTO wp_productdata VALUES ('13', '15', '伦敦银', '17.026', '17.066', '17.057', '17.342', '16.946', '0', '0', '1503111771', null, null, '1');
INSERT INTO wp_productdata VALUES ('14', '16', '莱特币', '59.86', '55.45', '55.41', '57.99', '53.89', '0', '0', '1535010082', null, null, '0');
INSERT INTO wp_productdata VALUES ('15', '17', '以太币', '1962.9', '1950.0', '1950.0', '1963.88', '1950.0', '193.754', '0.193754', '1507535040', null, null, '1');
INSERT INTO wp_productdata VALUES ('16', '18', '美元/日元', '112.34', '112.5', '112.50', '112.52', '112.32', '0', '0', '1507785396', null, null, '1');
INSERT INTO wp_productdata VALUES ('17', '19', '英镑/日元', '148.95', '148.771', '148.77', '149.07', '148.62', '0', '0', '1507785402', null, null, '1');
INSERT INTO wp_productdata VALUES ('18', '20', '欧元/美元', '1.1875', '1.1859', '1.1859', '1.1878', '1.1858', '0', '0', '1507785405', null, null, '1');
INSERT INTO wp_productdata VALUES ('19', '21', '英镑/美元', '1.3258', '1.3223', '1.3223', '1.3265', '1.3218', '0', '0', '1507785405', null, null, '1');
INSERT INTO wp_productdata VALUES ('20', '22', '泸深300', '3854.86', '3862.48', '3873.63', '3898.61', '3852.50', '0', '0', '1523099806', null, null, '0');
INSERT INTO wp_productdata VALUES ('21', '23', '比特币', '6428.26', '6428.3', '6423.02', '6704.29', '6260.48', '0', '0', '1535010082', null, null, '0');

-- ----------------------------
-- Table structure for `wp_productinfo`
-- ----------------------------
DROP TABLE IF EXISTS `wp_productinfo`;
CREATE TABLE `wp_productinfo` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `ptitle` varchar(255) DEFAULT NULL COMMENT '标题',
  `cid` int(11) DEFAULT NULL COMMENT '产品分类id',
  `otid` int(11) DEFAULT NULL COMMENT '开市方案id',
  `isopen` int(1) DEFAULT '1',
  `point_low` varchar(18) DEFAULT '0.00000' COMMENT '波动最小值',
  `point_top` varchar(18) DEFAULT '0.00000' COMMENT '波动最大值',
  `rands` varchar(18) DEFAULT '0.00000' COMMENT '随机波动范围',
  `content` text COMMENT '备注',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `isdelete` int(1) DEFAULT NULL COMMENT '0',
  `procode` varchar(18) DEFAULT NULL COMMENT ' 产品代码',
  `add_data` double(18,4) DEFAULT '0.0000' COMMENT '除汇率以外的算法',
  `protime` varchar(288) DEFAULT NULL COMMENT '时间玩法间隔',
  `propoint` varchar(288) DEFAULT NULL COMMENT '点位玩法间隔',
  `proscale` varchar(288) DEFAULT NULL COMMENT '盈亏比例',
  `proorder` int(18) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_productinfo
-- ----------------------------
INSERT INTO wp_productinfo VALUES ('6', '美元/欧元', '5', '1', '1', '0.001', '0.005', '0.0003', '', '1530555914', '0', 'fx_sgbpjpy', '0.0000', '1,3,5,8', '', '88,90,92,93', '7');
INSERT INTO wp_productinfo VALUES ('7', '英镑/美元', '5', '1', '1', '0.00001', '0.00020', '0.00010', '', '1511416554', '0', 'fx_sgbpusd', '0.0000', '0.5,1,3,5', null, '88,90,92,93', '4');
INSERT INTO wp_productinfo VALUES ('8', '澳元/加元', '5', '1', '1', '0.00001', '0.00015', '0.00015', '', '1512645217', '0', 'fx_saudcad', '0.0000', '1,3,5,8', null, '88,90,92,93', '8');
INSERT INTO wp_productinfo VALUES ('9', '欧元英镑', '5', '1', '1', '0.00001', '0.00015', '0.00012', '', '1511080273', '0', 'fx_seurgbp', '0.0000', '1,3,5,8', null, '88,90,92,93', '6');
INSERT INTO wp_productinfo VALUES ('10', '英镑/澳元', '5', '1', '1', '0.00001', '0.00010', '0.00005', '', '1512645448', '0', 'fx_sgbpaud', '0.0000', '0.5,1,3,5', null, '88,90,92,93', '5');
INSERT INTO wp_productinfo VALUES ('11', '英镑/加元', '5', '1', '1', '0.00001', '0.00015', '0.00015', '', '1534945877', '0', 'fx_sgbpcad', '0.0000', '1,3,5,8', null, '5,5,5,5', '4');
INSERT INTO wp_productinfo VALUES ('12', '比特币', '5', '1', '0', '0.0100', '0.0300', '0.0200', '', '1514098582', '1', 'btc', '0.0000', '0.5,1,3,5', null, '88,90,92,93', '1');
INSERT INTO wp_productinfo VALUES ('13', '美元/日元', '5', null, '1', '0.005', '0.015', '0.005', '', '1512645169', '0', 'fx_susdjpy', '0.0000', '0.5,1,3,5', null, '88,90,92,93', '5');
INSERT INTO wp_productinfo VALUES ('14', '国际黄金', '5', null, '1', '0.001', '0.010', '0.004', '', '1512645422', '0', 'llg', '0.0000', '1,3,5,8', null, '88,90,92,93', '3');
INSERT INTO wp_productinfo VALUES ('16', '莱特币', '5', null, '0', '0.01', '6.9', '0.08', '', '1524452626', '0', 'ltc', '0.0000', '1,2,3,5', null, '95,96,98,100', '2');
INSERT INTO wp_productinfo VALUES ('17', '以太币', '5', null, '1', '0.01', '0.1', '0.05', '', '1507371501', '1', 'eth', '0.0000', '0.1,3,5,8', null, '75,77,80,85', '5');
INSERT INTO wp_productinfo VALUES ('22', '泸深300', '5', null, '1', '', '', '0.15', '', '1512645620', '1', 'sz399300', '0.0000', '0.5,1,3,5', null, '85,88,90,92', '0');
INSERT INTO wp_productinfo VALUES ('23', '比特币', '5', null, '1', '0.001', '0.08', '0.004', '', '1535197489', '0', 'btc', '0.0000', '1320', null, '5', '0');

-- ----------------------------
-- Table structure for `wp_refundlog`
-- ----------------------------
DROP TABLE IF EXISTS `wp_refundlog`;
CREATE TABLE `wp_refundlog` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `mch_appid` varchar(28) DEFAULT NULL,
  `mchid` varchar(18) DEFAULT NULL,
  `device_info` varchar(288) DEFAULT NULL,
  `nonce_str` varchar(28) DEFAULT NULL,
  `payment_no` varchar(18) DEFAULT NULL,
  `partner_trade_no` varchar(18) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL,
  `result_code` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_refundlog
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_risk`
-- ----------------------------
DROP TABLE IF EXISTS `wp_risk`;
CREATE TABLE `wp_risk` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `to_win` text CHARACTER SET utf8 COMMENT '指定客户赢利',
  `to_loss` text CHARACTER SET utf8 COMMENT '指定客户亏损',
  `chance` text CHARACTER SET utf8 COMMENT '风控概率',
  `min_price` varchar(18) CHARACTER SET utf8 DEFAULT NULL COMMENT '最小风控值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_risk
-- ----------------------------
INSERT INTO wp_risk VALUES ('8', '', '', '', '');

-- ----------------------------
-- Table structure for `wp_usercode`
-- ----------------------------
DROP TABLE IF EXISTS `wp_usercode`;
CREATE TABLE `wp_usercode` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `uid` int(8) NOT NULL COMMENT '所属用户id',
  `usercode` varchar(28) CHARACTER SET utf8 NOT NULL COMMENT '邀请码',
  `mannerid` int(28) DEFAULT NULL COMMENT '渠道ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of wp_usercode
-- ----------------------------
INSERT INTO wp_usercode VALUES ('13', '2132', '123456', '2133');

-- ----------------------------
-- Table structure for `wp_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `wp_userinfo`;
CREATE TABLE `wp_userinfo` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `upwd` varchar(50) DEFAULT NULL,
  `utel` varchar(50) DEFAULT NULL,
  `utime` int(20) DEFAULT NULL COMMENT '注册时间',
  `agenttype` int(20) DEFAULT '0' COMMENT '0普通客户，1申请经纪人中，2经纪人',
  `otype` int(11) NOT NULL DEFAULT '0' COMMENT '0普通会员，2会员单位，1经纪人,3超级管理员,1和2已废弃，101为代理商',
  `ustatus` int(11) NOT NULL DEFAULT '0' COMMENT '0正常状态，1冻结状态，',
  `oid` varchar(28) DEFAULT NULL COMMENT '上线字段',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `portrait` varchar(255) DEFAULT NULL COMMENT '头像',
  `lastlog` int(20) DEFAULT NULL COMMENT '最后登录时间',
  `managername` varchar(255) DEFAULT NULL COMMENT '上线用户名',
  `comname` varchar(120) DEFAULT NULL COMMENT '公司名称',
  `comqua` varchar(50) DEFAULT NULL COMMENT '公司资质',
  `rebate` varchar(11) DEFAULT NULL COMMENT '返点',
  `feerebate` varchar(11) DEFAULT '0' COMMENT '手续费返点',
  `usertype` int(11) DEFAULT '0' COMMENT '0不是微信用户。1是微信用户',
  `wxtype` int(11) DEFAULT '0' COMMENT '1表示微信还没注册，0微信已注册成会员。',
  `openid` varchar(50) DEFAULT NULL COMMENT '存微信用户的id',
  `nickname` varchar(255) DEFAULT NULL COMMENT '用户昵称',
  `logintime` varchar(18) DEFAULT NULL,
  `usermoney` decimal(18,2) DEFAULT '0.00',
  `userpoint` int(18) DEFAULT NULL COMMENT '积分',
  `minprice` decimal(10,2) DEFAULT NULL,
  `jjprice` decimal(18,2) DEFAULT '0.00',
  `rank` tinyint(1) DEFAULT '0' COMMENT '0普通会员 1代理',
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_userinfo
-- ----------------------------
INSERT INTO wp_userinfo VALUES ('1', 'admin', 'ba4c59fe634a98dbe4fd47620998db47', '15769272583', '1480061674', '2', '3', '0', null, null, null, null, null, null, null, null, '0', '0', '0', null, 'admin', null, '0.00', null, null, '20.00', '0', '123123');
INSERT INTO wp_userinfo VALUES ('22', '10000022', 'b76e1af77f4a7a7f65702cf36ec276eb', '13600000000', '1535048316', '0', '0', '0', '1', null, null, '1535197822', null, null, null, null, '0', '0', '0', null, 'baidu', '1535197822', '10600.00', null, null, '9600.00', '0', '1Ni8P2');

-- ----------------------------
-- Table structure for `wp_webconfig`
-- ----------------------------
DROP TABLE IF EXISTS `wp_webconfig`;
CREATE TABLE `wp_webconfig` (
  `id` int(11) NOT NULL,
  `isopen` int(11) NOT NULL DEFAULT '0' COMMENT '0开启，1关闭',
  `webname` varchar(20) DEFAULT NULL COMMENT '网站名称',
  `onelevel` varchar(20) NOT NULL,
  `twolevel` varchar(20) NOT NULL,
  `Pscale` varchar(20) NOT NULL,
  `begintime` int(20) DEFAULT NULL COMMENT '休市开始时间',
  `endtime` int(20) DEFAULT NULL COMMENT '休市结束时间',
  `notice` varchar(100) DEFAULT NULL COMMENT '公告',
  `isnotice` int(10) DEFAULT '0' COMMENT '0开启，1关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_webconfig
-- ----------------------------

-- ----------------------------
-- Table structure for `wp_wechat`
-- ----------------------------
DROP TABLE IF EXISTS `wp_wechat`;
CREATE TABLE `wp_wechat` (
  `wcid` int(11) NOT NULL AUTO_INCREMENT,
  `appid` varchar(255) DEFAULT NULL COMMENT 'AppID(应用ID)',
  `appsecret` varchar(255) DEFAULT NULL COMMENT 'AppSecret(应用密钥)',
  `wxname` varchar(255) DEFAULT NULL COMMENT '公众号名称',
  `wxlogin` varchar(255) DEFAULT NULL COMMENT '微信原始账号',
  `wxurl` varchar(255) DEFAULT NULL COMMENT 'url服务器地址',
  `token` varchar(255) DEFAULT NULL COMMENT '令牌',
  `encodingaeskey` varchar(255) DEFAULT NULL COMMENT '消息加密解密秘钥',
  `parterid` int(11) DEFAULT NULL COMMENT '微信商户账号',
  `parterkey` varchar(255) DEFAULT NULL COMMENT '32位密码',
  PRIMARY KEY (`wcid`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wp_wechat
-- ----------------------------
INSERT INTO wp_wechat VALUES ('3', '', '', '玩客go', '', '', '', '', '0', '');
