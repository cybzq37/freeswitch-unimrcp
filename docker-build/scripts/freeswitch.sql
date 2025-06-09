/*
 Navicat Premium Data Transfer

 Source Server         : kamoilio
 Source Server Type    : MySQL
 Source Server Version : 50742 (5.7.42)
 Source Host           : 172.16.220.20:3306
 Source Schema         : freeswitch

 Target Server Type    : MySQL
 Target Server Version : 50742 (5.7.42)
 File Encoding         : 65001

 Date: 19/08/2023 16:04:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for aliases
-- ----------------------------
DROP TABLE IF EXISTS `aliases`;
CREATE TABLE `aliases`  (
  `sticky` int(11) NULL DEFAULT NULL,
  `alias` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `command` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `alias1`(`alias`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aliases
-- ----------------------------

-- ----------------------------
-- Table structure for calls
-- ----------------------------
DROP TABLE IF EXISTS `calls`;
CREATE TABLE `calls`  (
  `call_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_created` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_created_epoch` int(11) NULL DEFAULT NULL,
  `caller_uuid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callee_uuid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `callsidx1`(`hostname`) USING BTREE,
  INDEX `eruuindex`(`caller_uuid`, `hostname`) USING BTREE,
  INDEX `eeuuindex`(`callee_uuid`) USING BTREE,
  INDEX `eeuuindex2`(`call_uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calls
-- ----------------------------

-- ----------------------------
-- Table structure for channels
-- ----------------------------
DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels`  (
  `uuid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `direction` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_epoch` int(11) NULL DEFAULT NULL,
  `name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cid_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cid_num` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_addr` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dest` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `application_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `dialplan` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `read_codec` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `read_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `read_bit_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `write_codec` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `write_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `write_bit_rate` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `secure` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presence_id` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presence_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `accountcode` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callstate` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callee_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callee_num` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `callee_direction` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_uuid` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sent_callee_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sent_callee_num` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `initial_cid_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `initial_cid_num` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `initial_ip_addr` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `initial_dest` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `initial_dialplan` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `initial_context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `chidx1`(`hostname`) USING BTREE,
  INDEX `uuindex`(`uuid`, `hostname`) USING BTREE,
  INDEX `uuindex2`(`call_uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of channels
-- ----------------------------

-- ----------------------------
-- Table structure for complete
-- ----------------------------
DROP TABLE IF EXISTS `complete`;
CREATE TABLE `complete`  (
  `sticky` int(11) NULL DEFAULT NULL,
  `a1` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a3` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a4` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a5` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a6` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a7` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a8` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a9` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `a10` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `complete1`(`a1`, `hostname`) USING BTREE,
  INDEX `complete2`(`a2`, `hostname`) USING BTREE,
  INDEX `complete3`(`a3`, `hostname`) USING BTREE,
  INDEX `complete4`(`a4`, `hostname`) USING BTREE,
  INDEX `complete5`(`a5`, `hostname`) USING BTREE,
  INDEX `complete6`(`a6`, `hostname`) USING BTREE,
  INDEX `complete7`(`a7`, `hostname`) USING BTREE,
  INDEX `complete8`(`a8`, `hostname`) USING BTREE,
  INDEX `complete9`(`a9`, `hostname`) USING BTREE,
  INDEX `complete10`(`a10`, `hostname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of complete
-- ----------------------------
INSERT INTO `complete` VALUES (0, 'vpx', 'reload', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'vpx', 'debug', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'vpx', 'debug', 'on', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'vpx', 'debug', 'off', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'help', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'help', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'console', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'alert', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'crit', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'err', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'warning', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'notice', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'info', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'debug', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'help', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'on', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'off', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'toggle', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'uuid', 'on', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'uuid', 'off', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'uuid', 'toggle', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'json', 'on', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'json', 'off', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'console', 'json', 'toggle', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'cdr_csv', 'rotate', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', '::[help:status', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'status', 'profile', '::sofia::list_profiles', '::[reg:user:pres', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'status', 'gateway', '::sofia::list_gateways', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'loglevel', '::[all:default:tport:iptsec:nea:nta:nth_client:nth_server:nua:soa:sresolv:stun', '::[0:1:2:3:4:5:6:7:8:9', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'tracelevel', '::[console:alert:crit:err:warning:notice:info:debug', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'global', '::[siptrace::standby::capture::watchdog', '::[on:off', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'global', 'debug', '::[presence:sla:none', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', 'restart', 'all', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[start:rescan:restart:check_sync', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'stop', 'wait', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'flush_inbound_reg', 'reboot', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[register:unregister', 'all', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[register:unregister:killgw:startgw', '::sofia::list_profile_gateway', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'killgw', '_all_', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'startgw', '_all_', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[siptrace:capture:watchdog', '::[on:off', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'gwlist', '::[up:down', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'recover', 'flush', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'xmlstatus', 'profile', '::sofia::list_profiles', 'reg', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sofia', 'xmlstatus', 'gateway', '::sofia::list_gateways', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'alias', 'add', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'alias', 'stickyadd', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'alias', 'del', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'coalesce', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'complete', 'add', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'complete', 'del', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db_cache', 'status', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'debug_level', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'debug_pool', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'debug_sql', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'last_sps', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'default_dtmf_duration', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'hupall', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'console', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'alert', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'crit', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'err', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'warning', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'notice', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'info', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'debug', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'max_dtmf_duration', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'max_sessions', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'min_dtmf_duration', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause', 'inbound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause', 'outbound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'reclaim_mem', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'resume', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'resume', 'inbound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'resume', 'outbound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'calibrate_clock', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'crash', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'verbose_events', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'save_history', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause_check', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause_check', 'inbound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause_check', 'outbound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'ready_check', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'recover', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown_check', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'asap', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'now', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'asap', 'restart', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'cancel', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'elegant', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'elegant', 'restart', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'reincarnate', 'now', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'restart', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'restart', 'asap', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'restart', 'elegant', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'sps', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'sync_clock', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'flush_db_handles', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'min_idle_cpu', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'send_sighup', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'mdns_resolve', 'disable', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fsctl', 'mdns_resolve', 'enable', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'interface_ip', 'auto', '::console::list_interfaces', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'interface_ip', 'ipv4', '::console::list_interfaces', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'interface_ip', 'ipv6', '::console::list_interfaces', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'load', '::console::list_available_modules', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'nat_map', 'reinit', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'nat_map', 'republish', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'nat_map', 'status', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'reload', '::console::list_loaded_modules', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'reloadacl', 'reloadxml', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'aliases', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'api', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'application', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'calls', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'channels', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'channels', 'count', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'chat', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'codec', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'complete', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'dialplan', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'detailed_calls', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'bridged_calls', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'detailed_bridged_calls', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'endpoint', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'file', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'interfaces', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'interface_types', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'tasks', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'management', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'modules', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'nat_map', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'registrations', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'say', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'status', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'show', 'timer', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'shutdown', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sql_escape', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'unload', '::console::list_loaded_modules', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'ms', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 's', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'm', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'h', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'd', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'microseconds', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'milliseconds', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'seconds', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'minutes', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'hours', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uptime', 'days', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'read', 'mute', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'read', 'level', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'write', 'mute', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'write', 'level', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'stop', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_break', '::console::list_uuid', 'all', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_break', '::console::list_uuid', 'both', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_pause', '::console::list_uuid', 'on', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_pause', '::console::list_uuid', 'off', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_bridge', '::console::list_uuid', '::console::list_uuid', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_broadcast', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_buglist', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_chat', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_send_text', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_capture_text', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_codec_debug', '::console::list_uuid', 'audio', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_codec_debug', '::console::list_uuid', 'video', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'audio', 'read', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'audio', 'write', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'video', 'read', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'video', 'write', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_debug_media', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_deflect', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_displace', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_display', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_media_params', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_drop_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_dump', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_answer', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_ring_ready', '::console::list_uuid', 'queued', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_pre_answer', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_early_ok', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_exists', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_fileman', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_flush_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_getvar', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_hold', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_hold', 'off', '::console::list_uuid', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_hold', 'toggle', '::console::list_uuid', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_send_info', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_jitterbuffer', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_kill', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_outgoing_answer', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_limit', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_limit_release', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'console', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'alert', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'crit', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'err', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'warning', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'notice', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'info', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'debug', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_media', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_media', 'off', '::console::list_uuid', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_media_3p', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_media_3p', 'off', '::console::list_uuid', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_park', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_media_reneg', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_phone_event', '::console::list_uuid', 'talk', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_phone_event', '::console::list_uuid', 'hold', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_preprocess', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_record', '::console::list_uuid', '::[start:stop', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_recovery_refresh', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_recv_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_redirect', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_send_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_session_heartbeat', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_setvar_multi', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_setvar', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_simplify', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_transfer', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_dual_transfer', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_video_refresh', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_video_bitrate', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_video_bandwidth', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_xfer_zombie', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'version', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_warning', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, '...', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'file_exists', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'getcputime', '', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'msrp', 'debug', 'on', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'msrp', 'debug', 'off', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_msrp_send', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'canvas-auto-clear', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'count', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'list', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'xml_list', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'json_list', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'energy', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'auto-energy', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'max-energy', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'agc', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-canvas', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-watching-canvas', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-layer', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'volume_in', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'volume_out', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'position', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'auto-3d-position', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'play', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'moh', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'pause', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'play_status', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'file_seek', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'say', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'saymember', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'cam', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'stop', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'dtmf', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'kick', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-flip', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-border', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'hup', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'hold', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unhold', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'mute', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'tmute', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unmute', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vmute', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'tvmute', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vmute-snap', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unvmute', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vblind', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'tvblind', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unvblind', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'deaf', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'undeaf', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-filter', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'relate', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'getvar', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'setvar', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'lock', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unlock', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'dial', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'bgdial', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'transfer', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'record', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'chkrecord', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'norecord', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'pause', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'resume', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'recording', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'exit_sound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'enter_sound', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'pin', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'nopin', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'get', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'set', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'file-vol', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'floor', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-floor', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-banner', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-mute-img', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-logo-img', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-codec-group', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-res-id', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-role-id', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'get-uuid', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'clear-vid-floor', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-layout', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-write-png', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-fps', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-res', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-fgimg', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-bgimg', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-bandwidth', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-personal', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db', 'insert', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db', 'delete', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db', 'select', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db', 'exists', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db', 'count', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'db', 'list', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'group', 'insert', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'group', 'delete', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'group', 'call', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'list', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'list_verbose', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'count', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'debug', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'status', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'has_outbound', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'importance', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo', 'reparse', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'fifo_check_bridge', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'hash', 'insert', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'hash', 'delete', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'hash', 'select', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'hash_remote', 'list', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'hash_remote', 'kill', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'hash_remote', 'rescan', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'httapi', 'debug_on', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'httapi', 'debug_off', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'spandsp_start_tone_detect', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'spandsp_stop_tone_detect', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_send_tdd', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'opus_debug', 'on', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'opus_debug', 'off', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sndfile_debug', 'on', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'sndfile_debug', 'off', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'uuid_write_png', '::console::list_uuid', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'local_stream', 'show', '::console::list_streams', 'as', 'xml', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'local_stream', 'start', '', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'local_stream', 'reload', '::console::list_streams', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'local_stream', 'stop', '::console::list_streams', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'local_stream', 'hup', '::console::list_streams', '', '', '', '', '', '', '', '11ae8880a881');
INSERT INTO `complete` VALUES (0, 'vpx', 'reload', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'vpx', 'debug', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'vpx', 'debug', 'on', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'vpx', 'debug', 'off', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'help', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'help', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'console', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'alert', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'crit', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'err', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'warning', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'notice', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'info', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'loglevel', 'debug', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'help', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'on', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'off', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'colorize', 'toggle', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'uuid', 'on', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'uuid', 'off', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'uuid', 'toggle', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'json', 'on', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'json', 'off', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'console', 'json', 'toggle', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'cdr_csv', 'rotate', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', '::[help:status', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'status', 'profile', '::sofia::list_profiles', '::[reg:user:pres', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'status', 'gateway', '::sofia::list_gateways', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'loglevel', '::[all:default:tport:iptsec:nea:nta:nth_client:nth_server:nua:soa:sresolv:stun', '::[0:1:2:3:4:5:6:7:8:9', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'tracelevel', '::[console:alert:crit:err:warning:notice:info:debug', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'global', '::[siptrace::standby::capture::watchdog', '::[on:off', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'global', 'debug', '::[presence:sla:none', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', 'restart', 'all', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[start:rescan:restart:check_sync', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'stop', 'wait', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'flush_inbound_reg', 'reboot', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[register:unregister', 'all', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[register:unregister:killgw:startgw', '::sofia::list_profile_gateway', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'killgw', '_all_', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'startgw', '_all_', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', '::[siptrace:capture:watchdog', '::[on:off', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'profile', '::sofia::list_profiles', 'gwlist', '::[up:down', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'recover', 'flush', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'xmlstatus', 'profile', '::sofia::list_profiles', 'reg', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sofia', 'xmlstatus', 'gateway', '::sofia::list_gateways', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'alias', 'add', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'alias', 'stickyadd', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'alias', 'del', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'coalesce', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'complete', 'add', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'complete', 'del', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db_cache', 'status', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'debug_level', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'debug_pool', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'debug_sql', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'last_sps', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'default_dtmf_duration', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'hupall', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'console', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'alert', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'crit', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'err', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'warning', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'notice', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'info', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'loglevel', 'debug', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'max_dtmf_duration', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'max_sessions', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'min_dtmf_duration', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause', 'inbound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause', 'outbound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'reclaim_mem', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'resume', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'resume', 'inbound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'resume', 'outbound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'calibrate_clock', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'crash', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'verbose_events', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'save_history', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause_check', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause_check', 'inbound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'pause_check', 'outbound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'ready_check', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'recover', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown_check', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'asap', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'now', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'asap', 'restart', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'cancel', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'elegant', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'elegant', 'restart', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'reincarnate', 'now', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'restart', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'restart', 'asap', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'shutdown', 'restart', 'elegant', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'sps', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'sync_clock', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'flush_db_handles', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'min_idle_cpu', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'send_sighup', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'mdns_resolve', 'disable', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fsctl', 'mdns_resolve', 'enable', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'interface_ip', 'auto', '::console::list_interfaces', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'interface_ip', 'ipv4', '::console::list_interfaces', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'interface_ip', 'ipv6', '::console::list_interfaces', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'load', '::console::list_available_modules', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'nat_map', 'reinit', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'nat_map', 'republish', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'nat_map', 'status', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'reload', '::console::list_loaded_modules', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'reloadacl', 'reloadxml', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'aliases', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'api', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'application', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'calls', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'channels', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'channels', 'count', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'chat', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'codec', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'complete', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'dialplan', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'detailed_calls', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'bridged_calls', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'detailed_bridged_calls', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'endpoint', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'file', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'interfaces', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'interface_types', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'tasks', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'management', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'modules', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'nat_map', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'registrations', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'say', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'status', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'show', 'timer', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'shutdown', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sql_escape', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'unload', '::console::list_loaded_modules', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'ms', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 's', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'm', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'h', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'd', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'microseconds', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'milliseconds', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'seconds', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'minutes', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'hours', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uptime', 'days', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'read', 'mute', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'read', 'level', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'write', 'mute', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'start', 'write', 'level', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_audio', '::console::list_uuid', 'stop', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_break', '::console::list_uuid', 'all', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_break', '::console::list_uuid', 'both', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_pause', '::console::list_uuid', 'on', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_pause', '::console::list_uuid', 'off', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_bridge', '::console::list_uuid', '::console::list_uuid', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_broadcast', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_buglist', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_chat', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_send_text', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_capture_text', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_codec_debug', '::console::list_uuid', 'audio', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_codec_debug', '::console::list_uuid', 'video', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'audio', 'read', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'audio', 'write', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'video', 'read', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_codec_param', '::console::list_uuid', 'video', 'write', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_debug_media', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_deflect', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_displace', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_display', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_media_params', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_drop_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_dump', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_answer', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_ring_ready', '::console::list_uuid', 'queued', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_pre_answer', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_early_ok', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_exists', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_fileman', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_flush_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_getvar', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_hold', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_hold', 'off', '::console::list_uuid', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_hold', 'toggle', '::console::list_uuid', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_send_info', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_jitterbuffer', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_kill', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_outgoing_answer', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_limit', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_limit_release', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'console', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'alert', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'crit', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'err', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'warning', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'notice', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'info', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_loglevel', '::console::list_uuid', 'debug', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_media', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_media', 'off', '::console::list_uuid', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_media_3p', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_media_3p', 'off', '::console::list_uuid', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_park', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_media_reneg', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_phone_event', '::console::list_uuid', 'talk', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_phone_event', '::console::list_uuid', 'hold', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_preprocess', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_record', '::console::list_uuid', '::[start:stop', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_recovery_refresh', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_recv_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_redirect', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_send_dtmf', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_session_heartbeat', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_setvar_multi', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_setvar', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_simplify', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_transfer', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_dual_transfer', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_video_refresh', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_video_bitrate', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_video_bandwidth', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_xfer_zombie', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'version', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_warning', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, '...', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'file_exists', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'getcputime', '', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'msrp', 'debug', 'on', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'msrp', 'debug', 'off', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_msrp_send', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'canvas-auto-clear', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'count', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'list', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'xml_list', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'json_list', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'energy', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'auto-energy', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'max-energy', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'agc', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-canvas', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-watching-canvas', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-layer', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'volume_in', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'volume_out', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'position', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'auto-3d-position', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'play', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'moh', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'pause', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'play_status', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'file_seek', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'say', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'saymember', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'cam', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'stop', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'dtmf', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'kick', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-flip', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-border', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'hup', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'hold', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unhold', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'mute', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'tmute', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unmute', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vmute', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'tvmute', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vmute-snap', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unvmute', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vblind', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'tvblind', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unvblind', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'deaf', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'undeaf', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-filter', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'relate', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'getvar', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'setvar', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'lock', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'unlock', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'dial', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'bgdial', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'transfer', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'record', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'chkrecord', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'norecord', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'pause', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'resume', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'recording', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'exit_sound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'enter_sound', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'pin', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'nopin', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'get', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'set', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'file-vol', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'floor', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-floor', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-banner', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-mute-img', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-logo-img', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-codec-group', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-res-id', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-role-id', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'get-uuid', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'clear-vid-floor', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-layout', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-write-png', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-fps', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-res', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-fgimg', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-bgimg', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-bandwidth', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'conference', '::conference::conference_list_conferences', 'vid-personal', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db', 'insert', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db', 'delete', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db', 'select', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db', 'exists', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db', 'count', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'db', 'list', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'group', 'insert', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'group', 'delete', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'group', 'call', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'list', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'list_verbose', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'count', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'debug', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'status', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'has_outbound', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'importance', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo', 'reparse', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'fifo_check_bridge', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'hash', 'insert', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'hash', 'delete', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'hash', 'select', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'hash_remote', 'list', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'hash_remote', 'kill', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'hash_remote', 'rescan', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'httapi', 'debug_on', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'httapi', 'debug_off', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'spandsp_start_tone_detect', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'spandsp_stop_tone_detect', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_send_tdd', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'opus_debug', 'on', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'opus_debug', 'off', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sndfile_debug', 'on', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'sndfile_debug', 'off', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'uuid_write_png', '::console::list_uuid', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'local_stream', 'show', '::console::list_streams', 'as', 'xml', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'local_stream', 'start', '', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'local_stream', 'reload', '::console::list_streams', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'local_stream', 'stop', '::console::list_streams', '', '', '', '', '', '', '', '851b6fb10517');
INSERT INTO `complete` VALUES (0, 'local_stream', 'hup', '::console::list_streams', '', '', '', '', '', '', '', '851b6fb10517');

-- ----------------------------
-- Table structure for db_data
-- ----------------------------
DROP TABLE IF EXISTS `db_data`;
CREATE TABLE `db_data`  (
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  UNIQUE INDEX `dd_data_key_realm`(`data_key`, `realm`) USING BTREE,
  INDEX `dd_realm`(`realm`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of db_data
-- ----------------------------

-- ----------------------------
-- Table structure for fifo_bridge
-- ----------------------------
DROP TABLE IF EXISTS `fifo_bridge`;
CREATE TABLE `fifo_bridge`  (
  `fifo_name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caller_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caller_caller_id_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `caller_caller_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `consumer_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `consumer_outgoing_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bridge_start` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fifo_bridge
-- ----------------------------

-- ----------------------------
-- Table structure for fifo_callers
-- ----------------------------
DROP TABLE IF EXISTS `fifo_callers`;
CREATE TABLE `fifo_callers`  (
  `fifo_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `caller_caller_id_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `caller_caller_id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `timestamp` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fifo_callers
-- ----------------------------

-- ----------------------------
-- Table structure for fifo_outbound
-- ----------------------------
DROP TABLE IF EXISTS `fifo_outbound`;
CREATE TABLE `fifo_outbound`  (
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fifo_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `originate_string` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `simo_count` int(11) NULL DEFAULT NULL,
  `use_count` int(11) NULL DEFAULT NULL,
  `timeout` int(11) NULL DEFAULT NULL,
  `lag` int(11) NULL DEFAULT NULL,
  `next_avail` int(11) NOT NULL DEFAULT 0,
  `expires` int(11) NOT NULL DEFAULT 0,
  `static` int(11) NOT NULL DEFAULT 0,
  `outbound_call_count` int(11) NOT NULL DEFAULT 0,
  `outbound_fail_count` int(11) NOT NULL DEFAULT 0,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `taking_calls` int(11) NOT NULL DEFAULT 1,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `outbound_call_total_count` int(11) NOT NULL DEFAULT 0,
  `outbound_fail_total_count` int(11) NOT NULL DEFAULT 0,
  `active_time` int(11) NOT NULL DEFAULT 0,
  `inactive_time` int(11) NOT NULL DEFAULT 0,
  `manual_calls_out_count` int(11) NOT NULL DEFAULT 0,
  `manual_calls_in_count` int(11) NOT NULL DEFAULT 0,
  `manual_calls_out_total_count` int(11) NOT NULL DEFAULT 0,
  `manual_calls_in_total_count` int(11) NOT NULL DEFAULT 0,
  `ring_count` int(11) NOT NULL DEFAULT 0,
  `start_time` int(11) NOT NULL DEFAULT 0,
  `stop_time` int(11) NOT NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fifo_outbound
-- ----------------------------

-- ----------------------------
-- Table structure for group_data
-- ----------------------------
DROP TABLE IF EXISTS `group_data`;
CREATE TABLE `group_data`  (
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `groupname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `gd_groupname`(`groupname`) USING BTREE,
  INDEX `gd_url`(`url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_data
-- ----------------------------

-- ----------------------------
-- Table structure for interfaces
-- ----------------------------
DROP TABLE IF EXISTS `interfaces`;
CREATE TABLE `interfaces`  (
  `type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ikey` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `filename` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `syntax` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interfaces
-- ----------------------------
INSERT INTO `interfaces` VALUES ('codec', 'PROXY PASS-THROUGH', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.711 alaw', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.711 ulaw', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('timer', 'soft', '', 'CORE_SOFTTIMER_MODULE', '/CORE_SOFTTIMER_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'RAW Signed Linear (16 bit)', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('database', 'mariadb', '', 'mod_mariadb', '/usr/local/freeswitch/mod/mod_mariadb.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('database', 'maria', '', 'mod_mariadb', '/usr/local/freeswitch/mod/mod_mariadb.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'PROXY VIDEO PASS-THROUGH', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'Speex', '', 'CORE_SPEEX_MODULE', '/CORE_SPEEX_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('database', 'mysql', '', 'mod_mariadb', '/usr/local/freeswitch/mod/mod_mariadb.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'VP8 Video', '', 'CORE_VPX_MODULE', '/CORE_VPX_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'VP9 Video', '', 'CORE_VPX_MODULE', '/CORE_VPX_MODULE.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vpx', 'VPX API', 'CORE_VPX_MODULE', '/CORE_VPX_MODULE.so', '<reload|debug <on|off>>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'console', 'Console', 'mod_console', '/usr/local/freeswitch/mod/mod_console.so', 'loglevel [level]|colorize [on|toggle|off]|uuid [on|toggle|off]|json [on|toggle|off]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('generic', 'mod_logfile', '', 'mod_logfile', '/usr/local/freeswitch/mod/mod_logfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('dialplan', 'enum', '', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'enum', 'Perform an ENUM lookup', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '[reload | <number> [<root>]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'enum', 'ENUM', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'enum_auto', 'ENUM', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'cdr_csv', 'cdr_csv controls', 'mod_cdr_csv', '/usr/local/freeswitch/mod/mod_cdr_csv.so', 'parameters', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'socket', 'Connect to a socket', 'mod_event_socket', '/usr/local/freeswitch/mod/mod_event_socket.so', '<ip>[:<port>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'event_sink', 'event_sink', 'mod_event_socket', '/usr/local/freeswitch/mod/mod_event_socket.so', '<web data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'sofia', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'rtp', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sofia_sla', 'private sofia sla function', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sofia_stir_shaken_vs', 'Verify SIP Identity header and store result in sip_verstat channel variable', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia', 'Sofia Controls', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<cmd> <args>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia_gateway_data', 'Get data from a sofia gateway', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<gateway_name> [ivar|ovar|var] <name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia_username_of', 'Sofia Username Lookup', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[profile/]<user>@<domain>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia_contact', 'Sofia Contacts', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[profile/]<user>@<domain>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia_count_reg', 'Count Sofia registration', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[profile/]<user>@<domain>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia_dig', 'SIP DIG', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<url>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sofia_presence_data', 'Sofia Presence Data', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[list|status|rpid|user_agent] [profile/]<user>@domain', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'sofia.status', 'sofia status JSON API', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'sofia.status.info', 'sofia status JSON API', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('chat', 'sip', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('management', '1001', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'loopback', '', 'mod_loopback', '/usr/local/freeswitch/mod/mod_loopback.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'null', '', 'mod_loopback', '/usr/local/freeswitch/mod/mod_loopback.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'unloop', 'Tell loopback to unfold', 'mod_loopback', '/usr/local/freeswitch/mod/mod_loopback.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'rtc', '', 'mod_rtc', '/usr/local/freeswitch/mod/mod_rtc.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'msrp_recv_file', 'Recv msrp message to file', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<filename>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'msrp_send_file', 'Send file via msrp', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<filename>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'bg_system', 'Execute a system command in the background', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'system', 'Execute a system command', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'bg_spawn', 'Execute a spawn command in the background', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'spawn', 'Execute a spawn command without capturing it\'s output', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'spawn_stream', 'Execute a spawn command and capture it\'s output', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'acl', 'Compare an ip to an acl list', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<ip> <list_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'alias', 'Alias', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[add|stickyadd] <alias> <command> | del [<alias>|*]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'coalesce', 'Return first nonempty parameter', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[^^<delim>]<value1>,<value2>,...', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'banner', 'Return the system banner', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'bgapi', 'Execute an api command in a thread', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>[ <arg>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'break', 'uuid_break', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [all]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'complete', 'Complete', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'add <word>|del [<word>|*]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'cond', 'Evaluate a conditional', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<expr> ? <true val> : <false val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'console_complete', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<line>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'console_complete_xml', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<line>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'create_uuid', 'Create a uuid', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <other_uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'db_cache', 'Manage db cache', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'status', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'domain_data', 'Find domain data', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<domain> [var|param|attr] <name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'domain_exists', 'Check if a domain exists', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<domain>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'echo', 'Echo', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'event_channel_broadcast', 'Broadcast', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<channel> <json>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'escape', 'Escape a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'eval', 'eval (noop)', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[uuid:<uuid> ]<expression>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'expand', 'Execute an api with variable expansion', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[uuid:<uuid> ]<cmd> <args>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'find_user_xml', 'Find a user', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<key> <user> <domain>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'fsctl', 'FS control messages', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[recover|send_sighup|hupall|pause [inbound|outbound]|resume [inbound|outbound]|shutdown [cancel|elegant|asap|now|restart]|sps|sps_peak_reset|sync_clock|sync_clock_when_idle|reclaim_mem|max_sessions|min_dtmf_duration [num]|max_dtmf_duration [num]|default_dtmf_duration [num]|min_idle_cpu|loglevel [level]|debug_level [level]|mdns_resolve [enable|disable]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', '...', 'Shutdown', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'shutdown', 'Shutdown', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'version', 'Version', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[short]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'global_getvar', 'Get global var', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<var>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'global_setvar', 'Set global var', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<var>=<value> [=<value2>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'group_call', 'Generate a dial string to call a group', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<group>[@<domain>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'help', 'Show help for all the api commands', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'host_lookup', 'Lookup host', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<hostname>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'hostname', 'Return the system hostname', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'interface_ip', 'Return the primary IP of an interface', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[auto|ipv4|ipv6] <ifname>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'switchname', 'Return the switch name', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'gethost', 'gethostbyname', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'getenv', 'getenv', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'hupall', 'hupall', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<cause> [<var> <value>] [<var2> <value2>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'in_group', 'Determine if a user is in a group', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<user>[@<domain>] <group_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'is_lan_addr', 'See if an ip is a lan addr', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<ip>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'limit_usage', 'Get the usage count of a limited resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend> <realm> <id>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'limit_hash_usage', 'Deprecated: gets the usage count of a limited resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<realm> <id>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'limit_status', 'Get the status of a limit backend', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'limit_reset', 'Reset the counters of a limit backend', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'limit_interval_reset', 'Reset the interval counter for a limited resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend> <realm> <resource>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'list_users', 'List Users configured in Directory', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[group <group>] [domain <domain>] [user <user>] [context <context>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'load', 'Load Module', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<mod_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'log', 'Log', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<level> <message>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'md5', 'Return md5 hash', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'module_exists', 'Check if module exists', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<module>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'msleep', 'Sleep N milliseconds', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<milliseconds>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'nat_map', 'Manage NAT', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[status|republish|reinit] | [add|del] <port> [tcp|udp] [static]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'originate', 'Originate a call', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<call url> <exten>|&<application_name>(<app_args>) [<dialplan>] [<context>] [<cid_name>] [<cid_num>] [<timeout_sec>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'pause', 'Pause media on a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'pool_stats', 'Core pool memory usage', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'Core pool memory usage.', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'quote_shell_arg', 'Quote/escape a string for use on shell command line', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'regex', 'Evaluate a regex', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>|<pattern>[|<subst string>][n|b]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'reloadacl', 'Reload XML', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'reload', 'Reload module', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[-f] <mod_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'reloadxml', 'Reload XML', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'replace', 'Replace a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>|<string1>|<string2>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'say_string', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<module_name>[.<ext>] <lang>[.<ext>] <say_type> <say_method> [<say_gender>] <text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sched_api', 'Schedule an api command', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[+@]<time> <group_name> <command_string>[&]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sched_broadcast', 'Schedule a broadcast event to a running call', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[[+]<time>|@time] <uuid> <path> [aleg|bleg|both]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sched_del', 'Delete a scheduled task', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<task_id>|<group_id>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sched_hangup', 'Schedule a running call to hangup', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[+]<time> <uuid> [<cause>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sched_transfer', 'Schedule a transfer for a running call', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[+]<time> <uuid> <extension> [<dialplan>] [<context>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'show', 'Show various reports', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'codec|endpoint|application|api|dialplan|file|timer|calls [count]|channels [count|like <match string>]|calls|detailed_calls|bridged_calls|detailed_bridged_calls|aliases|complete|chat|management|modules|nat_map|say|interfaces|interface_types|tasks|limits|status', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sql_escape', 'Escape a string to prevent sql injection', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'status', 'Show current status', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'strftime_tz', 'Display formatted time of timezone', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<timezone_name> [<epoch>|][format string]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'stun', 'Execute STUN lookup', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<stun_server>[:port] [<source_ip>[:<source_port]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'time_test', 'Show time jitter', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<mss> [count]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'timer_test', 'Exercise FS timer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<10|20|40|60|120> [<1..200>] [<timer_name>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'tone_detect', 'Start tone detection on a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <key> <tone_spec> [<flags> <timeout> <app> <args> <hits>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'unload', 'Unload module', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[-f] <mod_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'unsched_api', 'Unschedule an api command', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<task_id>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uptime', 'Show uptime', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[us|ms|s|m|h|d|microseconds|milliseconds|seconds|minutes|hours|days]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'reg_url', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<user>@<realm>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'url_decode', 'Url decode a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'url_encode', 'Url encode a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'toupper', 'Upper Case a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'tolower', 'Lower Case a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'user_data', 'Find user data', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<user>@<domain> [var|param|attr] <name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_early_ok', 'stop ignoring early media', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'user_exists', 'Find a user', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<key> <user> <domain>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_answer', 'answer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_audio', 'uuid_audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [start [read|write] [mute|level <level>]|stop]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_break', 'Break out of media sent to channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [all]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_bridge', 'Bridge call legs', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_broadcast', 'Execute dialplan application', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <path> [aleg|bleg|holdb|both]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_buglist', 'List media bugs on a session', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_chat', 'Send a chat message', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_text', 'Send text in real-time', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_capture_text', 'start/stop capture_text', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_codec_debug', 'Send codec a debug message', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> audio|video <level>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_codec_param', 'Send codec a param', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> audio|video read|write <param> <val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_debug_media', 'Debug media', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <read|write|both|vread|vwrite|vboth|all> <on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_deflect', 'Send a deflect', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <uri>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_displace', 'Displace audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [start|stop] <path> [<limit>] [mux]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_display', 'Update phone display', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <display>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media_params', 'Update remote vid params', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <json>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_drop_dtmf', 'Drop all DTMF or replace it with a mask', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [on | off ] [ mask_digits <digits> | mask_file <file>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_dump', 'Dump session vars', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [format]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_exists', 'Check if a uuid exists', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_fileman', 'Manage session audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <cmd>:<val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_flush_dtmf', 'Flush dtmf on a given uuid', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_getvar', 'Get a variable from a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <var>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_hold', 'Place call on hold', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[off|toggle] <uuid> [<display>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_kill', 'Kill channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [cause]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_message', 'Send MESSAGE to the endpoint', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <message>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_info', 'Send info to the endpoint', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [<mime_type> <mime_subtype>] <message>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_set_media_stats', 'Set media stats', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_video_bitrate', 'Send video bitrate req.', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <bitrate>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_video_bandwidth', 'Send video bandwidth', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <bitrate>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_video_refresh', 'Send video refresh.', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [auto|manual]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_outgoing_answer', 'Answer outgoing channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_limit', 'Increase limit resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <backend> <realm> <resource> [<max>[/interval]] [number [dialplan [context]]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_limit_release', 'Release limit resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <backend> [realm] [resource]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_loglevel', 'Set loglevel on session', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <level>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media', 'Reinvite FS in or out of media path', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[off] <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media_3p', 'Reinvite FS in or out of media path using 3pcc', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[off] <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media_reneg', 'Media negotiation', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>[ <codec_string>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_park', 'Park channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_pause', 'Pause media on a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_phone_event', 'Send an event to the phone', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_ring_ready', 'Sending ringing to a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [queued]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_pre_answer', 'pre_answer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_preprocess', 'Pre-process Channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_record', 'Record session audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [start|stop|mask|unmask] <path> [<limit>] [<recording_vars>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_recovery_refresh', 'Send a recovery_refresh', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <uri>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_recv_dtmf', 'Receive dtmf digits', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <dtmf_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_redirect', 'Send a redirect', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <uri>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_dtmf', 'Send dtmf digits', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <dtmf_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_session_heartbeat', 'uuid_session_heartbeat', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [sched] [0|<seconds>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_setvar_multi', 'Set multiple variables', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <var>=<value>;<var>=<value>...', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_setvar', 'Set a variable', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <var> [value]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_transfer', 'Transfer a session', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [-bleg|-both] <dest-exten> [<dialplan>] [<context>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_dual_transfer', 'Transfer a session and its partner', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <A-dest-exten>[/<A-dialplan>][/<A-context>] <B-dest-exten>[/<B-dialplan>][/<B-context>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_simplify', 'Try to cut out of a call path / attended xfer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_jitterbuffer', 'uuid_jitterbuffer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [0|<min_msec>[:<max_msec>]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_zombie_exec', 'Set zombie_exec flag on the specified uuid', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_xfer_zombie', 'Allow A leg to hangup and continue originating', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'xml_flush_cache', 'Clear xml cache', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<id> <key> <val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'xml_locate', 'Find some xml', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[root | <section> <tag> <tag_attr_name> <tag_attr_val>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'xml_wrap', 'Wrap another api command in xml', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command> <args>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'file_exists', 'Check if a file exists on server', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<file>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'getcputime', 'Gets CPU time in milliseconds (user,kernel)', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[reset]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'json', 'JSON API', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'JSON', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'memory', 'Memory usage statistics', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'memory', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'msrp', 'MSRP Functions', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'debug <on|off>|restart', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_msrp_send', 'send msrp text', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<msg>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'mediaStats', 'JSON Media Stats', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'status', 'JSON status API', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'fsapi', 'JSON FSAPI Gateway', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'execute', 'JSON session execute application', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('json_api', 'channelData', 'JSON channel data application', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'conference', 'conference', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'conference_set_auto_outcall', 'conference_set_auto_outcall', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'conference', 'Conference module commands', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('chat', 'conf', '', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'db', 'Insert to the db', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete]/<realm>/<key>/<val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'group', 'Manage a group', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete]:<group name>:<val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'db', 'db get/set', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete|select|exists|count|list]/<realm>/<key>/<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'group', 'group [insert|delete|call]', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete|call]:<group name>:<url>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('limit', 'db', '', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'error', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'group', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'user', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'pickup', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('dialplan', 'inline', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'blind_transfer_ack', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[true|false]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'bind_digit_action', 'bind a key sequence or regex to an action', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm>,<digits|~regex>,<string>[,<value>][,<dtmf target leg>][,<event target leg>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'capture', 'capture data into a var', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>|<data>|<regex>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'clear_digit_action', 'clear all digit bindings', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm>|all[,target]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'digit_action_set_realm', 'change binding realm', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm>[,<target>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'privacy', 'Set privacy on calls', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', 'off|on|name|full|number', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_audio_level', 'set volume', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_mute', 'set mute', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'flush_dtmf', 'flush any queued dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'hold', 'Send a hold message', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<display message>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'unhold', 'Send a un-hold message', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'mutex', 'block on a call flow only allowing one at a time', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<keyname>[ on|off]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'page', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<var1=val1,var2=val2><chan1>[:_:<chanN>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'transfer', 'Transfer a channel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<exten> [<dialplan> <context>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'check_acl', 'Check an ip against an ACL list', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<ip> <acl | cidr> [<hangup_cause>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'verbose_events', 'Make ALL Events verbose.', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'novideo', 'Refuse Inbound Video', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'cng_plc', 'Do PLC on CNG frames', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'early_hangup', 'Enable early hangup', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sleep', 'Pause a channel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<pausemilliseconds>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'delay_echo', 'echo audio at a specified delay', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<delay ms>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'strftime', 'strftime', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<epoch>|]<format string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'phrase', 'Say a Phrase', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<macro_name>,<data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'eval', 'Do Nothing', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_media_stats', 'Set Media Stats', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop', 'Do Nothing', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_zombie_exec', 'Enable Zombie Execution', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'pre_answer', 'Pre-Answer the call', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'answer', 'Answer the call', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'wait_for_answer', 'Wait for call to be answered', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'wait_for_video_ready', 'Wait for video stream to be ready', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<ms, 1..10000>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'hangup', 'Hangup the call', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<cause>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_name', 'Name the channel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'presence', 'Send Presence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<rpid> <status> [<id>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'log', 'Logs to the logger', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<log_level> <log_string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'info', 'Display Call Info', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'event', 'Fire an event', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sound_test', 'Analyze Audio', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'export', 'Export a channel variable across a bridge', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'bridge_export', 'Export a channel variable across a bridge', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set', 'Set a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'multiset', 'Set many channel variables', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[^^<delim>]<varname>=<value> <var2>=<val2>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'push', 'Set a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'unshift', 'Set a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_global', 'Set a global variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_profile_var', 'Set a caller profile variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'unset', 'Unset a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'multiunset', 'Unset many channel variables', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[^^<delim>]<varname> <var2> <var3>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'capture_text', 'capture text', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'acknowledge_call', 'Indicate Call Acknowledged', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'ring_ready', 'Indicate Ring_Ready', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'remove_bugs', 'Remove media bugs', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<function>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'break', 'Break', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'detect_speech', 'Detect speech', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<mod_name> <gram_name> <gram_path> [<addr>] OR grammar <gram_name> [<path>] OR nogrammar <gram_name> OR grammaron/grammaroff <gram_name> OR grammarsalloff OR pause OR resume OR start_input_timers OR stop OR param <name> <value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'play_and_detect_speech', 'Play and do speech recognition', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<file> detect:<engine> {param1=val1,param2=val2}<grammar>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'ivr', 'Run an ivr menu', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<menu_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'redirect', 'Send session redirect', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<redirect_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'video_refresh', 'Send video refresh.', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[manual|auto]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'video_decode', 'Set video decode.', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[[on|wait]|off]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'send_info', 'Send info', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<info>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'jitterbuffer', 'Send session jitterbuffer', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<jitterbuffer_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'send_display', 'Send session a new display', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'respond', 'Send session respond', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<respond_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'deflect', 'Send call deflect', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<deflect_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'recovery_refresh', 'Send call recovery_refresh', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'reuse_caller_profile', 'Reuse the caller profile', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'queue_dtmf', 'Queue dtmf to be sent', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<dtmf_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'send_dtmf', 'Send dtmf to be sent', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<dtmf_data>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sched_cancel', 'cancel scheduled tasks', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[group]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sched_hangup', 'Schedule a hangup in the future', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+]<time> [<cause>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sched_broadcast', 'Schedule a broadcast in the future', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+]<time> <path> [aleg|bleg|both]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sched_transfer', 'Schedule a transfer in the future', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+]<time> <extension> <dialplan> <context>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'execute_extension', 'Execute an extension', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<extension> <dialplan> <context>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'sched_heartbeat', 'Enable Scheduled Heartbeat', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[0|<seconds>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'enable_heartbeat', 'Enable Media Heartbeat', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[0|<seconds>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'filter_codecs', 'Filter Codecs', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<codec string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'enable_keepalive', 'Enable Keepalive', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[0|<seconds>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'media_reset', 'Reset all bypass/proxy media flags', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'mkdir', 'Create a directory', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'rename', 'Rename file', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<from_path> <to_path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'transfer_vars', 'Transfer variables', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<~variable_prefix|variable>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'soft_hold', 'Put a bridged channel on hold', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<unhold key> [<moh_a>] [<moh_b>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'bind_meta_app', 'Bind a key to an application', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<key> [a|b|ab] [a|b|o|s|i|1] <app>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'unbind_meta_app', 'Unbind a key from an application', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<key>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'block_dtmf', 'Block DTMF', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'unblock_dtmf', 'Stop blocking DTMF', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'intercept', 'intercept', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[-bleg] <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'eavesdrop', 'eavesdrop on a uuid', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[all | <uuid>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'native_eavesdrop', 'eavesdrop on a uuid', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<uuid> [read|write]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'three_way', 'three way call with a uuid', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'set_user', 'Set a User', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<user>@<domain> [prefix]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop_dtmf', 'stop inband dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'start_dtmf', 'Detect dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop_dtmf_generate', 'stop inband dtmf generation', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[write]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'start_dtmf_generate', 'Generate dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop_tone_detect', 'stop detecting tones', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'fax_detect', 'Detect faxes', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'tone_detect', 'Detect tones', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'echo', 'Echo', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'park', 'Park', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'park_state', 'Park State', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'gentones', 'Generate Tones', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<tgml_script>[|<loops>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'playback', 'Playback File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'broadcast', 'Broadcast File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> <leg>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'endless_playback', 'Playback File Endlessly', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'loop_playback', 'Playback File looply', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+loops] <path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'att_xfer', 'Attended Transfer', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<channel_url>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'read', 'Read Digits', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<min> <max> <file> <var_name> <timeout> <terminators> <digit_timeout>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'play_and_get_digits', 'Play and get Digits', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '\n	<min> <max> <tries> <timeout> <terminators> <file> <invalid_file> <var_name> <regexp> [<digit_timeout>] [\'<failure_ext> [failure_dp [failure_context]]\']', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop_video_write_overlay', 'Stop video write overlay', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'video_write_overlay', 'Video write overlay', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [<pos>] [<alpha>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop_record_session', 'Stop Record Session', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record_session', 'Record Session', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [+<timeout>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record_session_mask', 'Mask audio in recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record_session_unmask', 'Stop masking audio in recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record_session_pause', 'Pause recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record_session_resume', 'Resume paused recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record', 'Record File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [<time_limit_secs>] [<silence_thresh>] [<silence_hits>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'preprocess', 'pre-process', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stop_displace_session', 'Stop Displace File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'displace_session', 'Displace File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [<flags>] [+time_limit_ms]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'speak', 'Speak text', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<engine>|<voice>|<text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'clear_speech_cache', 'Clear Speech Handle Cache', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'bridge', 'Bridge Audio', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<channel_url>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'system', 'Execute a system command', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'bgsystem', 'Execute a system command in the background', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<command>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'say', 'say', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<module_name>[:<lang>] <say_type> <say_method> [<say_gender>] <text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'detect_audio', 'detect_audio', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<threshold> <audio_hits> <timeout_ms> [<file>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'detect_silence', 'detect_silence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<threshold> <silence_hits> <timeout_ms> [<file>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'wait_for_silence', 'wait_for_silence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<silence_thresh> <silence_hits> <listen_hits> <timeout_ms> [<file>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'session_loglevel', 'session_loglevel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<level>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'limit', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<backend> <realm> <id> [<max>[/interval]] [number [dialplan [context]]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'limit_hash', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm> <id> [<max>[/interval]] [number [dialplan [context]]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'limit_execute', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<backend> <realm> <id> <max>[/interval] <application> [application arguments]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'limit_hash_execute', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm> <id> <max>[/interval] <application> [application arguments]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'pickup', 'Pickup', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<key>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'deduplicate_dtmf', 'Prevent duplicate inband + 2833 dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[only_rtp]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'vad_test', 'VAD test', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[mode]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'debug_media', 'Debug Media', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<read|write|both|vread|vwrite|vboth|all> <on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'strepoch', 'Convert a date string into epoch time', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'page', 'Send a file as a page', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '(var1=val1,var2=val2)<var1=val1,var2=val2><chan1>[:_:<chanN>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'strmicroepoch', 'Convert a date string into micoepoch time', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'chat', 'chat', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<proto>|<from>|<to>|<message>|[<content-type>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'strftime', 'strftime', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<format_string>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'presence', 'presence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[in|out] <user> <rpid> <message>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'file_string', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'file', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('chat', 'event', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('chat', 'api', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'expr', 'Eval an expression', 'mod_expr', '/usr/local/freeswitch/mod/mod_expr.so', '<expr>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'fifo', 'Park with FIFO', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<fifo name>[!<importance_number>] [in [<announce file>|undef] [<music file>|undef] [early|noans] | out [wait|nowait] [<announce file>|undef] [<music file>|undef]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'fifo_track_call', 'Count a call as a fifo call in the manual_calls queue', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<fifo_outbound_uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'fifo', 'Return data about a fifo', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', 'list|list_verbose|count|debug|status|has_outbound|importance [<fifo name>]|reparse [del_all]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'fifo_member', 'Add members to a fifo', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '[add <fifo_name> <originate_string> [<simo_count>] [<timeout>] [<lag>] [<expires>] [<taking_calls>] | del <fifo_name> <originate_string>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'fifo_add_outbound', 'Add outbound members to a fifo', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<node> <url> [<priority>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'fifo_check_bridge', 'check if uuid is in a bridge', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<uuid>|<outbound_id>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'hash', 'Insert into the hashtable', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', '[insert|insert_ifempty|delete|delete_ifmatch]/<realm>/<key>/<val>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'hash', 'hash get/set', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', '[insert|delete|select]/<realm>/<key>/<value>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'hash_dump', 'dump hash/limit_hash data (used for synchronization)', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', 'all|limit|db [<realm>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'hash_remote', 'hash remote', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', 'list|kill [name]|rescan', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('limit', 'hash', '', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'voicemail', 'Voicemail', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[check] [auth] <profile_name> <domain_name> [<id>] [uuid]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'voicemail', 'voicemail', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', 'rss [<host> <port> <uri> <user> <domain>] | [load|unload|reload] <profile> [reloadxml]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'voicemail_inject', 'voicemail_inject', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[group=<group>[@domain]|domain=<domain>|<box>[@<domain>]] <sound_file> [<cid_num>] [<cid_name>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_inject', 'vm_inject', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[group=<group>[@domain]|domain=<domain>|<box>[@<domain>]] <sound_file> [<cid_num>] [<cid_name>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_boxcount', 'vm_boxcount', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[profile/]<user>@<domain>[|[new|saved|new-urgent|saved-urgent|all]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_prefs', 'vm_prefs', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[profile/]<user>@<domain>[|[name_path|greeting_path|password]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_delete', 'vm_delete', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<id>@<domain>[/profile] [<uuid>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_read', 'vm_read', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<id>@<domain>[/profile] <read|unread> [<uuid>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_list', 'vm_list', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<id>@<domain>[/profile] [xml]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_auth_login', 'vm_fsdb_auth_login', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <password>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_count', 'vm_fsdb_msg_count', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> <folder>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_list', 'vm_fsdb_msg_list', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> <folder> <filter> [msg-order = ASC | DESC]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_get', 'vm_fsdb_msg_get', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_delete', 'vm_fsdb_msg_delete', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_undelete', 'vm_fsdb_msg_undelete', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_email', 'vm_fsdb_msg_email', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid> <email>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_purge', 'vm_fsdb_msg_purge', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_save', 'vm_fsdb_msg_save', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_forward', 'vm_fsdb_msg_forward', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid> <dst_domain> <dst_user> [prepend_file_location]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_greeting_set', 'vm_fsdb_pref_greeting_set', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <slot> [file-path]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_greeting_get', 'vm_fsdb_pref_greeting_get', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> [slot]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_recname_set', 'vm_fsdb_pref_recname_set', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <file-path>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_password_set', 'vm_fsdb_pref_password_set', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <password>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'esf_page_group', '', 'mod_esf', '/usr/local/freeswitch/mod/mod_esf.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'play_fsv', 'play a fsv file', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '<file>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'record_fsv', 'record an fsv file', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '<file>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'play_yuv', 'play a yvv file', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '<file> [width] [height]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'decode_video', 'decode picture', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '[max_pictures]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'fsv', '', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'valet_park', 'valet_park', 'mod_valet_parking', '/usr/local/freeswitch/mod/mod_valet_parking.so', '<lotname> <extension>|[ask [<min>] [<max>] [<to>] [<prompt>]|auto [in|out] [min] [max]]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'valet_info', 'Valet Parking Info', 'mod_valet_parking', '/usr/local/freeswitch/mod/mod_valet_parking.so', '[<lot name>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'httapi', 'HT-TAPI Hypertext Telephony API', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '{<param1>=<val1>}', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'httapi', 'HT-TAPI Hypertext Telephony API', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '[debug_on|debug_off]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'http', '', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'https', '', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('dialplan', 'XML', '', 'mod_dialplan_xml', '/usr/local/freeswitch/mod/mod_dialplan_xml.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'SIP', '', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'IAX2', '', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('dialplan', 'asterisk', '', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'Dial', 'Dial', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', 'Dial', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'Goto', 'Goto', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', 'Goto', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'AvoidingDeadlock', 'Avoid', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', 'Avoid', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('endpoint', 'modem', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'ADPCM (IMA)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 16k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 16k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 24k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 24k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 32k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 32k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 40k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 40k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.722', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'GSM', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'LPC-10', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 't38_gateway', 'Convert to T38 Gateway if tones are heard', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'rxfax', 'FAX Receive Application', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<filename>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'txfax', 'FAX Transmit Application', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<filename>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'stopfax', 'Stop FAX Application', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_dtmf', 'stop inband dtmf', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_start_dtmf', 'Detect dtmf', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_inject_tdd', 'stop sending tdd', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_inject_tdd', 'Send TDD data', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_detect_tdd', 'stop sending tdd', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_detect_tdd', 'Detect TDD data', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_send_tdd', 'Send TDD data', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_start_fax_detect', 'start fax detect', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<app>[ <arg>][ <timeout>][ <tone_type>]', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_fax_detect', 'stop fax detect', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_start_tone_detect', 'Start background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_tone_detect', 'Stop background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'spandsp_start_tone_detect', 'Start background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid> <name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'spandsp_stop_tone_detect', 'Stop background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'start_tdd_detect', 'Start background tdd detection', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'stop_tdd_detect', 'Stop background tdd detection', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_tdd', 'send tdd data to a uuid', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid> <text>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.723.1 6.3k', '', 'mod_g723_1', '/usr/local/freeswitch/mod/mod_g723_1.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'G.729', '', 'mod_g729', '/usr/local/freeswitch/mod/mod_g729.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'AMR / Octet Aligned', '', 'mod_amr', '/usr/local/freeswitch/mod/mod_amr.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'AMR / Bandwidth Efficient', '', 'mod_amr', '/usr/local/freeswitch/mod/mod_amr.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'B64 (STANDARD)', '', 'mod_b64', '/usr/local/freeswitch/mod/mod_b64.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('codec', 'OPUS (STANDARD)', '', 'mod_opus', '/usr/local/freeswitch/mod/mod_opus.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'opus_debug', 'Set OPUS Debug', 'mod_opus', '/usr/local/freeswitch/mod/mod_opus.so', '<on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'sndfile_debug', 'Set sndfile debug', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '<on|off>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'aiff', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'au', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'avr', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'caf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'flac', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'htk', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'iff', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'mat', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'mpc', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'oga', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'paf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'pvf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'raw', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'rf64', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'sd2', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'sds', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'sf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'voc', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'w64', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'wav', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'wve', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'xi', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'r8', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'r16', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'r24', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'r32', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'gsm', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'ul', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'ulaw', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'al', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'alaw', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'adpcm', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'vox', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'oga', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'ogg', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-32', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'DVI4', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'PCMU', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G722', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-24', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-40', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'L16', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G726-16', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'PCMA', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G726-24', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G729', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-16', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G726-32', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'GSM', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G726-40', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'G723', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'LPC', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'uuid_write_png', 'grab an image from a call', 'mod_png', '/usr/local/freeswitch/mod/mod_png.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'png', '', 'mod_png', '/usr/local/freeswitch/mod/mod_png.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'local_stream', 'manage local streams', 'mod_local_stream', '/usr/local/freeswitch/mod/mod_local_stream.so', '<show|start|reload|stop|hup> <local_stream_name>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'local_stream', '', 'mod_local_stream', '/usr/local/freeswitch/mod/mod_local_stream.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'tone_stream', '', 'mod_tone_stream', '/usr/local/freeswitch/mod/mod_tone_stream.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('file', 'silence_stream', '', 'mod_tone_stream', '/usr/local/freeswitch/mod/mod_tone_stream.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('dialplan', 'LUA', '', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'lua', 'Launch LUA ivr', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('application', 'lua', 'execute a lua script', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'luarun', 'run a script', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('api', 'lua', 'run a script as an api function', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('say', 'en', '', 'mod_say_en', '/usr/local/freeswitch/mod/mod_say_en.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('speech', 'unimrcp', '', 'mod_unimrcp', '/usr/local/freeswitch/mod/mod_unimrcp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('asr', 'unimrcp', '', 'mod_unimrcp', '/usr/local/freeswitch/mod/mod_unimrcp.so', '', '11ae8880a881');
INSERT INTO `interfaces` VALUES ('database', 'mariadb', '', 'mod_mariadb', '/usr/local/freeswitch/mod/mod_mariadb.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('database', 'mysql', '', 'mod_mariadb', '/usr/local/freeswitch/mod/mod_mariadb.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('database', 'maria', '', 'mod_mariadb', '/usr/local/freeswitch/mod/mod_mariadb.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'PROXY VIDEO PASS-THROUGH', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('timer', 'soft', '', 'CORE_SOFTTIMER_MODULE', '/CORE_SOFTTIMER_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'PROXY PASS-THROUGH', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'RAW Signed Linear (16 bit)', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.711 ulaw', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.711 alaw', '', 'CORE_PCM_MODULE', '/CORE_PCM_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'Speex', '', 'CORE_SPEEX_MODULE', '/CORE_SPEEX_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'VP8 Video', '', 'CORE_VPX_MODULE', '/CORE_VPX_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'VP9 Video', '', 'CORE_VPX_MODULE', '/CORE_VPX_MODULE.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vpx', 'VPX API', 'CORE_VPX_MODULE', '/CORE_VPX_MODULE.so', '<reload|debug <on|off>>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'console', 'Console', 'mod_console', '/usr/local/freeswitch/mod/mod_console.so', 'loglevel [level]|colorize [on|toggle|off]|uuid [on|toggle|off]|json [on|toggle|off]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('generic', 'mod_logfile', '', 'mod_logfile', '/usr/local/freeswitch/mod/mod_logfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('dialplan', 'enum', '', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'enum', 'Perform an ENUM lookup', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '[reload | <number> [<root>]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'enum', 'ENUM', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'enum_auto', 'ENUM', 'mod_enum', '/usr/local/freeswitch/mod/mod_enum.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'cdr_csv', 'cdr_csv controls', 'mod_cdr_csv', '/usr/local/freeswitch/mod/mod_cdr_csv.so', 'parameters', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'socket', 'Connect to a socket', 'mod_event_socket', '/usr/local/freeswitch/mod/mod_event_socket.so', '<ip>[:<port>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'event_sink', 'event_sink', 'mod_event_socket', '/usr/local/freeswitch/mod/mod_event_socket.so', '<web data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'sofia', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'rtp', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sofia_sla', 'private sofia sla function', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sofia_stir_shaken_vs', 'Verify SIP Identity header and store result in sip_verstat channel variable', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia', 'Sofia Controls', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<cmd> <args>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia_gateway_data', 'Get data from a sofia gateway', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<gateway_name> [ivar|ovar|var] <name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia_username_of', 'Sofia Username Lookup', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[profile/]<user>@<domain>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia_contact', 'Sofia Contacts', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[profile/]<user>@<domain>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia_count_reg', 'Count Sofia registration', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[profile/]<user>@<domain>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia_dig', 'SIP DIG', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '<url>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sofia_presence_data', 'Sofia Presence Data', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '[list|status|rpid|user_agent] [profile/]<user>@domain', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'sofia.status', 'sofia status JSON API', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'sofia.status.info', 'sofia status JSON API', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('chat', 'sip', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('management', '1001', '', 'mod_sofia', '/usr/local/freeswitch/mod/mod_sofia.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'loopback', '', 'mod_loopback', '/usr/local/freeswitch/mod/mod_loopback.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'null', '', 'mod_loopback', '/usr/local/freeswitch/mod/mod_loopback.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'unloop', 'Tell loopback to unfold', 'mod_loopback', '/usr/local/freeswitch/mod/mod_loopback.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'rtc', '', 'mod_rtc', '/usr/local/freeswitch/mod/mod_rtc.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'msrp_recv_file', 'Recv msrp message to file', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<filename>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'msrp_send_file', 'Send file via msrp', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<filename>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'bg_system', 'Execute a system command in the background', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'system', 'Execute a system command', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'bg_spawn', 'Execute a spawn command in the background', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'spawn', 'Execute a spawn command without capturing it\'s output', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'spawn_stream', 'Execute a spawn command and capture it\'s output', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'acl', 'Compare an ip to an acl list', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<ip> <list_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'alias', 'Alias', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[add|stickyadd] <alias> <command> | del [<alias>|*]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'coalesce', 'Return first nonempty parameter', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[^^<delim>]<value1>,<value2>,...', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'banner', 'Return the system banner', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'bgapi', 'Execute an api command in a thread', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command>[ <arg>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'break', 'uuid_break', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [all]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'complete', 'Complete', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'add <word>|del [<word>|*]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'cond', 'Evaluate a conditional', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<expr> ? <true val> : <false val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'console_complete', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<line>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'console_complete_xml', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<line>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'create_uuid', 'Create a uuid', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <other_uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'db_cache', 'Manage db cache', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'status', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'domain_data', 'Find domain data', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<domain> [var|param|attr] <name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'domain_exists', 'Check if a domain exists', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<domain>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'echo', 'Echo', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'event_channel_broadcast', 'Broadcast', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<channel> <json>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'escape', 'Escape a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'eval', 'eval (noop)', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[uuid:<uuid> ]<expression>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'expand', 'Execute an api with variable expansion', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[uuid:<uuid> ]<cmd> <args>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'find_user_xml', 'Find a user', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<key> <user> <domain>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'fsctl', 'FS control messages', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[recover|send_sighup|hupall|pause [inbound|outbound]|resume [inbound|outbound]|shutdown [cancel|elegant|asap|now|restart]|sps|sps_peak_reset|sync_clock|sync_clock_when_idle|reclaim_mem|max_sessions|min_dtmf_duration [num]|max_dtmf_duration [num]|default_dtmf_duration [num]|min_idle_cpu|loglevel [level]|debug_level [level]|mdns_resolve [enable|disable]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', '...', 'Shutdown', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'shutdown', 'Shutdown', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'version', 'Version', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[short]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'global_getvar', 'Get global var', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<var>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'global_setvar', 'Set global var', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<var>=<value> [=<value2>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'group_call', 'Generate a dial string to call a group', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<group>[@<domain>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'help', 'Show help for all the api commands', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'host_lookup', 'Lookup host', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<hostname>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'hostname', 'Return the system hostname', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'interface_ip', 'Return the primary IP of an interface', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[auto|ipv4|ipv6] <ifname>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'switchname', 'Return the switch name', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'gethost', 'gethostbyname', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'getenv', 'getenv', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'hupall', 'hupall', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<cause> [<var> <value>] [<var2> <value2>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'in_group', 'Determine if a user is in a group', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<user>[@<domain>] <group_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'is_lan_addr', 'See if an ip is a lan addr', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<ip>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'limit_usage', 'Get the usage count of a limited resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend> <realm> <id>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'limit_hash_usage', 'Deprecated: gets the usage count of a limited resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<realm> <id>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'limit_status', 'Get the status of a limit backend', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'limit_reset', 'Reset the counters of a limit backend', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'limit_interval_reset', 'Reset the interval counter for a limited resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<backend> <realm> <resource>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'list_users', 'List Users configured in Directory', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[group <group>] [domain <domain>] [user <user>] [context <context>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'load', 'Load Module', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<mod_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'log', 'Log', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<level> <message>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'md5', 'Return md5 hash', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'module_exists', 'Check if module exists', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<module>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'msleep', 'Sleep N milliseconds', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<milliseconds>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'nat_map', 'Manage NAT', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[status|republish|reinit] | [add|del] <port> [tcp|udp] [static]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'originate', 'Originate a call', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<call url> <exten>|&<application_name>(<app_args>) [<dialplan>] [<context>] [<cid_name>] [<cid_num>] [<timeout_sec>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'pause', 'Pause media on a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'pool_stats', 'Core pool memory usage', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'Core pool memory usage.', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'quote_shell_arg', 'Quote/escape a string for use on shell command line', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'regex', 'Evaluate a regex', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>|<pattern>[|<subst string>][n|b]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'reloadacl', 'Reload XML', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'reload', 'Reload module', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[-f] <mod_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'reloadxml', 'Reload XML', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'replace', 'Replace a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<data>|<string1>|<string2>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'say_string', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<module_name>[.<ext>] <lang>[.<ext>] <say_type> <say_method> [<say_gender>] <text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sched_api', 'Schedule an api command', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[+@]<time> <group_name> <command_string>[&]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sched_broadcast', 'Schedule a broadcast event to a running call', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[[+]<time>|@time] <uuid> <path> [aleg|bleg|both]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sched_del', 'Delete a scheduled task', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<task_id>|<group_id>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sched_hangup', 'Schedule a running call to hangup', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[+]<time> <uuid> [<cause>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sched_transfer', 'Schedule a transfer for a running call', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[+]<time> <uuid> <extension> [<dialplan>] [<context>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'show', 'Show various reports', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'codec|endpoint|application|api|dialplan|file|timer|calls [count]|channels [count|like <match string>]|calls|detailed_calls|bridged_calls|detailed_bridged_calls|aliases|complete|chat|management|modules|nat_map|say|interfaces|interface_types|tasks|limits|status', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sql_escape', 'Escape a string to prevent sql injection', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'status', 'Show current status', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'strftime_tz', 'Display formatted time of timezone', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<timezone_name> [<epoch>|][format string]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'stun', 'Execute STUN lookup', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<stun_server>[:port] [<source_ip>[:<source_port]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'time_test', 'Show time jitter', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<mss> [count]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'timer_test', 'Exercise FS timer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<10|20|40|60|120> [<1..200>] [<timer_name>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'tone_detect', 'Start tone detection on a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <key> <tone_spec> [<flags> <timeout> <app> <args> <hits>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'unload', 'Unload module', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[-f] <mod_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'unsched_api', 'Unschedule an api command', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<task_id>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uptime', 'Show uptime', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[us|ms|s|m|h|d|microseconds|milliseconds|seconds|minutes|hours|days]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'reg_url', '', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<user>@<realm>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'url_decode', 'Url decode a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'url_encode', 'Url encode a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'toupper', 'Upper Case a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'tolower', 'Lower Case a string', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'user_data', 'Find user data', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<user>@<domain> [var|param|attr] <name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_early_ok', 'stop ignoring early media', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'user_exists', 'Find a user', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<key> <user> <domain>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_answer', 'answer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_audio', 'uuid_audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [start [read|write] [mute|level <level>]|stop]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_break', 'Break out of media sent to channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [all]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_bridge', 'Bridge call legs', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_broadcast', 'Execute dialplan application', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <path> [aleg|bleg|holdb|both]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_buglist', 'List media bugs on a session', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_chat', 'Send a chat message', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_text', 'Send text in real-time', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_capture_text', 'start/stop capture_text', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_codec_debug', 'Send codec a debug message', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> audio|video <level>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_codec_param', 'Send codec a param', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> audio|video read|write <param> <val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_debug_media', 'Debug media', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <read|write|both|vread|vwrite|vboth|all> <on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_deflect', 'Send a deflect', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <uri>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_displace', 'Displace audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [start|stop] <path> [<limit>] [mux]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_display', 'Update phone display', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <display>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media_params', 'Update remote vid params', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <json>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_drop_dtmf', 'Drop all DTMF or replace it with a mask', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [on | off ] [ mask_digits <digits> | mask_file <file>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_dump', 'Dump session vars', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [format]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_exists', 'Check if a uuid exists', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_fileman', 'Manage session audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <cmd>:<val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_flush_dtmf', 'Flush dtmf on a given uuid', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_getvar', 'Get a variable from a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <var>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_hold', 'Place call on hold', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[off|toggle] <uuid> [<display>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_kill', 'Kill channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [cause]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_message', 'Send MESSAGE to the endpoint', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <message>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_info', 'Send info to the endpoint', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [<mime_type> <mime_subtype>] <message>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_set_media_stats', 'Set media stats', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_video_bitrate', 'Send video bitrate req.', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <bitrate>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_video_bandwidth', 'Send video bandwidth', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <bitrate>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_video_refresh', 'Send video refresh.', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [auto|manual]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_outgoing_answer', 'Answer outgoing channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_limit', 'Increase limit resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <backend> <realm> <resource> [<max>[/interval]] [number [dialplan [context]]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_limit_release', 'Release limit resource', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <backend> [realm] [resource]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_loglevel', 'Set loglevel on session', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <level>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media', 'Reinvite FS in or out of media path', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[off] <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media_3p', 'Reinvite FS in or out of media path using 3pcc', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[off] <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_media_reneg', 'Media negotiation', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>[ <codec_string>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_park', 'Park channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_pause', 'Pause media on a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_phone_event', 'Send an event to the phone', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_ring_ready', 'Sending ringing to a channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [queued]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_pre_answer', 'pre_answer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_preprocess', 'Pre-process Channel', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_record', 'Record session audio', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [start|stop|mask|unmask] <path> [<limit>] [<recording_vars>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_recovery_refresh', 'Send a recovery_refresh', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <uri>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_recv_dtmf', 'Receive dtmf digits', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <dtmf_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_redirect', 'Send a redirect', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <uri>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_dtmf', 'Send dtmf digits', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <dtmf_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_session_heartbeat', 'uuid_session_heartbeat', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [sched] [0|<seconds>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_setvar_multi', 'Set multiple variables', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <var>=<value>;<var>=<value>...', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_setvar', 'Set a variable', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <var> [value]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_transfer', 'Transfer a session', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [-bleg|-both] <dest-exten> [<dialplan>] [<context>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_dual_transfer', 'Transfer a session and its partner', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> <A-dest-exten>[/<A-dialplan>][/<A-context>] <B-dest-exten>[/<B-dialplan>][/<B-context>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_simplify', 'Try to cut out of a call path / attended xfer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_jitterbuffer', 'uuid_jitterbuffer', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid> [0|<min_msec>[:<max_msec>]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_zombie_exec', 'Set zombie_exec flag on the specified uuid', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_xfer_zombie', 'Allow A leg to hangup and continue originating', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'xml_flush_cache', 'Clear xml cache', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<id> <key> <val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'xml_locate', 'Find some xml', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[root | <section> <tag> <tag_attr_name> <tag_attr_val>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'xml_wrap', 'Wrap another api command in xml', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<command> <args>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'file_exists', 'Check if a file exists on server', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<file>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'getcputime', 'Gets CPU time in milliseconds (user,kernel)', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '[reset]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'json', 'JSON API', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'JSON', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'memory', 'Memory usage statistics', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'memory', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'msrp', 'MSRP Functions', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', 'debug <on|off>|restart', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_msrp_send', 'send msrp text', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '<msg>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'mediaStats', 'JSON Media Stats', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'status', 'JSON status API', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'fsapi', 'JSON FSAPI Gateway', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'execute', 'JSON session execute application', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('json_api', 'channelData', 'JSON channel data application', 'mod_commands', '/usr/local/freeswitch/mod/mod_commands.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'conference', 'conference', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'conference_set_auto_outcall', 'conference_set_auto_outcall', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'conference', 'Conference module commands', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('chat', 'conf', '', 'mod_conference', '/usr/local/freeswitch/mod/mod_conference.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'db', 'Insert to the db', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete]/<realm>/<key>/<val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'group', 'Manage a group', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete]:<group name>:<val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'db', 'db get/set', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete|select|exists|count|list]/<realm>/<key>/<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'group', 'group [insert|delete|call]', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '[insert|delete|call]:<group name>:<url>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('limit', 'db', '', 'mod_db', '/usr/local/freeswitch/mod/mod_db.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'error', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'group', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'user', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'pickup', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('dialplan', 'inline', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'blind_transfer_ack', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[true|false]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'bind_digit_action', 'bind a key sequence or regex to an action', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm>,<digits|~regex>,<string>[,<value>][,<dtmf target leg>][,<event target leg>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'capture', 'capture data into a var', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>|<data>|<regex>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'clear_digit_action', 'clear all digit bindings', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm>|all[,target]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'digit_action_set_realm', 'change binding realm', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm>[,<target>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'privacy', 'Set privacy on calls', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', 'off|on|name|full|number', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_audio_level', 'set volume', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_mute', 'set mute', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'flush_dtmf', 'flush any queued dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'hold', 'Send a hold message', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<display message>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'unhold', 'Send a un-hold message', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'mutex', 'block on a call flow only allowing one at a time', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<keyname>[ on|off]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'page', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<var1=val1,var2=val2><chan1>[:_:<chanN>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'transfer', 'Transfer a channel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<exten> [<dialplan> <context>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'check_acl', 'Check an ip against an ACL list', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<ip> <acl | cidr> [<hangup_cause>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'verbose_events', 'Make ALL Events verbose.', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'novideo', 'Refuse Inbound Video', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'cng_plc', 'Do PLC on CNG frames', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'early_hangup', 'Enable early hangup', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sleep', 'Pause a channel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<pausemilliseconds>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'delay_echo', 'echo audio at a specified delay', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<delay ms>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'strftime', 'strftime', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<epoch>|]<format string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'phrase', 'Say a Phrase', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<macro_name>,<data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'eval', 'Do Nothing', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_media_stats', 'Set Media Stats', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop', 'Do Nothing', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_zombie_exec', 'Enable Zombie Execution', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'pre_answer', 'Pre-Answer the call', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'answer', 'Answer the call', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'wait_for_answer', 'Wait for call to be answered', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'wait_for_video_ready', 'Wait for video stream to be ready', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<ms, 1..10000>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'hangup', 'Hangup the call', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<cause>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_name', 'Name the channel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'presence', 'Send Presence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<rpid> <status> [<id>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'log', 'Logs to the logger', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<log_level> <log_string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'info', 'Display Call Info', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'event', 'Fire an event', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sound_test', 'Analyze Audio', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'export', 'Export a channel variable across a bridge', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'bridge_export', 'Export a channel variable across a bridge', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set', 'Set a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'multiset', 'Set many channel variables', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[^^<delim>]<varname>=<value> <var2>=<val2>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'push', 'Set a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'unshift', 'Set a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_global', 'Set a global variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_profile_var', 'Set a caller profile variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>=<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'unset', 'Unset a channel variable', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<varname>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'multiunset', 'Unset many channel variables', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[^^<delim>]<varname> <var2> <var3>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'capture_text', 'capture text', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'acknowledge_call', 'Indicate Call Acknowledged', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'ring_ready', 'Indicate Ring_Ready', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'remove_bugs', 'Remove media bugs', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<function>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'break', 'Break', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'detect_speech', 'Detect speech', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<mod_name> <gram_name> <gram_path> [<addr>] OR grammar <gram_name> [<path>] OR nogrammar <gram_name> OR grammaron/grammaroff <gram_name> OR grammarsalloff OR pause OR resume OR start_input_timers OR stop OR param <name> <value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'play_and_detect_speech', 'Play and do speech recognition', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<file> detect:<engine> {param1=val1,param2=val2}<grammar>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'ivr', 'Run an ivr menu', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<menu_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'redirect', 'Send session redirect', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<redirect_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'video_refresh', 'Send video refresh.', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[manual|auto]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'video_decode', 'Set video decode.', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[[on|wait]|off]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'send_info', 'Send info', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<info>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'jitterbuffer', 'Send session jitterbuffer', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<jitterbuffer_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'send_display', 'Send session a new display', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'respond', 'Send session respond', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<respond_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'deflect', 'Send call deflect', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<deflect_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'recovery_refresh', 'Send call recovery_refresh', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'reuse_caller_profile', 'Reuse the caller profile', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'queue_dtmf', 'Queue dtmf to be sent', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<dtmf_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'send_dtmf', 'Send dtmf to be sent', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<dtmf_data>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sched_cancel', 'cancel scheduled tasks', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[group]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sched_hangup', 'Schedule a hangup in the future', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+]<time> [<cause>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sched_broadcast', 'Schedule a broadcast in the future', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+]<time> <path> [aleg|bleg|both]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sched_transfer', 'Schedule a transfer in the future', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+]<time> <extension> <dialplan> <context>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'execute_extension', 'Execute an extension', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<extension> <dialplan> <context>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'sched_heartbeat', 'Enable Scheduled Heartbeat', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[0|<seconds>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'enable_heartbeat', 'Enable Media Heartbeat', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[0|<seconds>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'filter_codecs', 'Filter Codecs', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<codec string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'enable_keepalive', 'Enable Keepalive', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[0|<seconds>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'media_reset', 'Reset all bypass/proxy media flags', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'mkdir', 'Create a directory', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'rename', 'Rename file', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<from_path> <to_path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'transfer_vars', 'Transfer variables', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<~variable_prefix|variable>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'soft_hold', 'Put a bridged channel on hold', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<unhold key> [<moh_a>] [<moh_b>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'bind_meta_app', 'Bind a key to an application', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<key> [a|b|ab] [a|b|o|s|i|1] <app>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'unbind_meta_app', 'Unbind a key from an application', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<key>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'block_dtmf', 'Block DTMF', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'unblock_dtmf', 'Stop blocking DTMF', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'intercept', 'intercept', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[-bleg] <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'eavesdrop', 'eavesdrop on a uuid', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[all | <uuid>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'native_eavesdrop', 'eavesdrop on a uuid', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<uuid> [read|write]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'three_way', 'three way call with a uuid', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'set_user', 'Set a User', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<user>@<domain> [prefix]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop_dtmf', 'stop inband dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'start_dtmf', 'Detect dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop_dtmf_generate', 'stop inband dtmf generation', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[write]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'start_dtmf_generate', 'Generate dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop_tone_detect', 'stop detecting tones', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'fax_detect', 'Detect faxes', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'tone_detect', 'Detect tones', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'echo', 'Echo', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'park', 'Park', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'park_state', 'Park State', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'gentones', 'Generate Tones', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<tgml_script>[|<loops>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'playback', 'Playback File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'broadcast', 'Broadcast File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> <leg>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'endless_playback', 'Playback File Endlessly', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'loop_playback', 'Playback File looply', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[+loops] <path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'att_xfer', 'Attended Transfer', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<channel_url>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'read', 'Read Digits', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<min> <max> <file> <var_name> <timeout> <terminators> <digit_timeout>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'play_and_get_digits', 'Play and get Digits', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '\n	<min> <max> <tries> <timeout> <terminators> <file> <invalid_file> <var_name> <regexp> [<digit_timeout>] [\'<failure_ext> [failure_dp [failure_context]]\']', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop_video_write_overlay', 'Stop video write overlay', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'video_write_overlay', 'Video write overlay', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [<pos>] [<alpha>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop_record_session', 'Stop Record Session', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record_session', 'Record Session', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [+<timeout>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record_session_mask', 'Mask audio in recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record_session_unmask', 'Stop masking audio in recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record_session_pause', 'Pause recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record_session_resume', 'Resume paused recording', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record', 'Record File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [<time_limit_secs>] [<silence_thresh>] [<silence_hits>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'preprocess', 'pre-process', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stop_displace_session', 'Stop Displace File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'displace_session', 'Displace File', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<path> [<flags>] [+time_limit_ms]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'speak', 'Speak text', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<engine>|<voice>|<text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'clear_speech_cache', 'Clear Speech Handle Cache', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'bridge', 'Bridge Audio', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<channel_url>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'system', 'Execute a system command', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'bgsystem', 'Execute a system command in the background', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<command>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'say', 'say', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<module_name>[:<lang>] <say_type> <say_method> [<say_gender>] <text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'detect_audio', 'detect_audio', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<threshold> <audio_hits> <timeout_ms> [<file>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'detect_silence', 'detect_silence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<threshold> <silence_hits> <timeout_ms> [<file>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'wait_for_silence', 'wait_for_silence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<silence_thresh> <silence_hits> <listen_hits> <timeout_ms> [<file>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'session_loglevel', 'session_loglevel', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<level>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'limit', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<backend> <realm> <id> [<max>[/interval]] [number [dialplan [context]]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'limit_hash', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm> <id> [<max>[/interval]] [number [dialplan [context]]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'limit_execute', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<backend> <realm> <id> <max>[/interval] <application> [application arguments]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'limit_hash_execute', 'Limit', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<realm> <id> <max>[/interval] <application> [application arguments]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'pickup', 'Pickup', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[<key>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'deduplicate_dtmf', 'Prevent duplicate inband + 2833 dtmf', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[only_rtp]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'vad_test', 'VAD test', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[mode]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'debug_media', 'Debug Media', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<read|write|both|vread|vwrite|vboth|all> <on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'strepoch', 'Convert a date string into epoch time', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'page', 'Send a file as a page', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '(var1=val1,var2=val2)<var1=val1,var2=val2><chan1>[:_:<chanN>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'strmicroepoch', 'Convert a date string into micoepoch time', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'chat', 'chat', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<proto>|<from>|<to>|<message>|[<content-type>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'strftime', 'strftime', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '<format_string>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'presence', 'presence', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '[in|out] <user> <rpid> <message>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'file_string', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'file', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('chat', 'event', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('chat', 'api', '', 'mod_dptools', '/usr/local/freeswitch/mod/mod_dptools.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'expr', 'Eval an expression', 'mod_expr', '/usr/local/freeswitch/mod/mod_expr.so', '<expr>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'fifo', 'Park with FIFO', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<fifo name>[!<importance_number>] [in [<announce file>|undef] [<music file>|undef] [early|noans] | out [wait|nowait] [<announce file>|undef] [<music file>|undef]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'fifo_track_call', 'Count a call as a fifo call in the manual_calls queue', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<fifo_outbound_uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'fifo', 'Return data about a fifo', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', 'list|list_verbose|count|debug|status|has_outbound|importance [<fifo name>]|reparse [del_all]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'fifo_member', 'Add members to a fifo', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '[add <fifo_name> <originate_string> [<simo_count>] [<timeout>] [<lag>] [<expires>] [<taking_calls>] | del <fifo_name> <originate_string>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'fifo_add_outbound', 'Add outbound members to a fifo', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<node> <url> [<priority>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'fifo_check_bridge', 'check if uuid is in a bridge', 'mod_fifo', '/usr/local/freeswitch/mod/mod_fifo.so', '<uuid>|<outbound_id>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'hash', 'Insert into the hashtable', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', '[insert|insert_ifempty|delete|delete_ifmatch]/<realm>/<key>/<val>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'hash', 'hash get/set', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', '[insert|delete|select]/<realm>/<key>/<value>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'hash_dump', 'dump hash/limit_hash data (used for synchronization)', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', 'all|limit|db [<realm>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'hash_remote', 'hash remote', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', 'list|kill [name]|rescan', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('limit', 'hash', '', 'mod_hash', '/usr/local/freeswitch/mod/mod_hash.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'voicemail', 'Voicemail', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[check] [auth] <profile_name> <domain_name> [<id>] [uuid]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'voicemail', 'voicemail', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', 'rss [<host> <port> <uri> <user> <domain>] | [load|unload|reload] <profile> [reloadxml]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'voicemail_inject', 'voicemail_inject', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[group=<group>[@domain]|domain=<domain>|<box>[@<domain>]] <sound_file> [<cid_num>] [<cid_name>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_inject', 'vm_inject', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[group=<group>[@domain]|domain=<domain>|<box>[@<domain>]] <sound_file> [<cid_num>] [<cid_name>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_boxcount', 'vm_boxcount', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[profile/]<user>@<domain>[|[new|saved|new-urgent|saved-urgent|all]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_prefs', 'vm_prefs', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '[profile/]<user>@<domain>[|[name_path|greeting_path|password]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_delete', 'vm_delete', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<id>@<domain>[/profile] [<uuid>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_read', 'vm_read', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<id>@<domain>[/profile] <read|unread> [<uuid>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_list', 'vm_list', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<id>@<domain>[/profile] [xml]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_auth_login', 'vm_fsdb_auth_login', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <password>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_count', 'vm_fsdb_msg_count', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> <folder>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_list', 'vm_fsdb_msg_list', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> <folder> <filter> [msg-order = ASC | DESC]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_get', 'vm_fsdb_msg_get', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_delete', 'vm_fsdb_msg_delete', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_undelete', 'vm_fsdb_msg_undelete', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_email', 'vm_fsdb_msg_email', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid> <email>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_purge', 'vm_fsdb_msg_purge', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_save', 'vm_fsdb_msg_save', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_msg_forward', 'vm_fsdb_msg_forward', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <uuid> <dst_domain> <dst_user> [prepend_file_location]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_greeting_set', 'vm_fsdb_pref_greeting_set', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <slot> [file-path]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_greeting_get', 'vm_fsdb_pref_greeting_get', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<format> <profile> <domain> <user> [slot]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_recname_set', 'vm_fsdb_pref_recname_set', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <file-path>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'vm_fsdb_pref_password_set', 'vm_fsdb_pref_password_set', 'mod_voicemail', '/usr/local/freeswitch/mod/mod_voicemail.so', '<profile> <domain> <user> <password>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'esf_page_group', '', 'mod_esf', '/usr/local/freeswitch/mod/mod_esf.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'play_fsv', 'play a fsv file', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '<file>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'record_fsv', 'record an fsv file', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '<file>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'play_yuv', 'play a yvv file', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '<file> [width] [height]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'decode_video', 'decode picture', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '[max_pictures]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'fsv', '', 'mod_fsv', '/usr/local/freeswitch/mod/mod_fsv.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'valet_park', 'valet_park', 'mod_valet_parking', '/usr/local/freeswitch/mod/mod_valet_parking.so', '<lotname> <extension>|[ask [<min>] [<max>] [<to>] [<prompt>]|auto [in|out] [min] [max]]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'valet_info', 'Valet Parking Info', 'mod_valet_parking', '/usr/local/freeswitch/mod/mod_valet_parking.so', '[<lot name>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'httapi', 'HT-TAPI Hypertext Telephony API', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '{<param1>=<val1>}', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'httapi', 'HT-TAPI Hypertext Telephony API', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '[debug_on|debug_off]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'http', '', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'https', '', 'mod_httapi', '/usr/local/freeswitch/mod/mod_httapi.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('dialplan', 'XML', '', 'mod_dialplan_xml', '/usr/local/freeswitch/mod/mod_dialplan_xml.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'SIP', '', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'IAX2', '', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('dialplan', 'asterisk', '', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'Dial', 'Dial', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', 'Dial', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'Goto', 'Goto', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', 'Goto', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'AvoidingDeadlock', 'Avoid', 'mod_dialplan_asterisk', '/usr/local/freeswitch/mod/mod_dialplan_asterisk.so', 'Avoid', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('endpoint', 'modem', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'ADPCM (IMA)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 16k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 16k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 24k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 24k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 32k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 32k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 40k (AAL2)', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.726 40k', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.722', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'GSM', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'LPC-10', '', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 't38_gateway', 'Convert to T38 Gateway if tones are heard', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'rxfax', 'FAX Receive Application', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<filename>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'txfax', 'FAX Transmit Application', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<filename>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'stopfax', 'Stop FAX Application', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_dtmf', 'stop inband dtmf', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_start_dtmf', 'Detect dtmf', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_inject_tdd', 'stop sending tdd', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_inject_tdd', 'Send TDD data', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_detect_tdd', 'stop sending tdd', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_detect_tdd', 'Detect TDD data', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_send_tdd', 'Send TDD data', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_start_fax_detect', 'start fax detect', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<app>[ <arg>][ <timeout>][ <tone_type>]', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_fax_detect', 'stop fax detect', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_start_tone_detect', 'Start background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'spandsp_stop_tone_detect', 'Stop background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'spandsp_start_tone_detect', 'Start background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid> <name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'spandsp_stop_tone_detect', 'Stop background tone detection with cadence', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'start_tdd_detect', 'Start background tdd detection', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'stop_tdd_detect', 'Stop background tdd detection', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_send_tdd', 'send tdd data to a uuid', 'mod_spandsp', '/usr/local/freeswitch/mod/mod_spandsp.so', '<uuid> <text>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.723.1 6.3k', '', 'mod_g723_1', '/usr/local/freeswitch/mod/mod_g723_1.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'G.729', '', 'mod_g729', '/usr/local/freeswitch/mod/mod_g729.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'AMR / Octet Aligned', '', 'mod_amr', '/usr/local/freeswitch/mod/mod_amr.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'AMR / Bandwidth Efficient', '', 'mod_amr', '/usr/local/freeswitch/mod/mod_amr.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'B64 (STANDARD)', '', 'mod_b64', '/usr/local/freeswitch/mod/mod_b64.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('codec', 'OPUS (STANDARD)', '', 'mod_opus', '/usr/local/freeswitch/mod/mod_opus.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'opus_debug', 'Set OPUS Debug', 'mod_opus', '/usr/local/freeswitch/mod/mod_opus.so', '<on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'sndfile_debug', 'Set sndfile debug', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '<on|off>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'aiff', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'au', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'avr', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'caf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'flac', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'htk', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'iff', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'mat', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'mpc', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'oga', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'paf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'pvf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'raw', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'rf64', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'sd2', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'sds', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'sf', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'voc', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'w64', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'wav', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'wve', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'xi', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'r8', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'r16', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'r24', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'r32', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'gsm', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'ul', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'ulaw', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'al', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'alaw', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'adpcm', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'vox', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'oga', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'ogg', '', 'mod_sndfile', '/usr/local/freeswitch/mod/mod_sndfile.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-32', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'DVI4', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'PCMU', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G722', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-24', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-40', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'L16', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G726-16', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'PCMA', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G726-24', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G729', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'AAL2-G726-16', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G726-32', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'GSM', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G726-40', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'G723', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'LPC', '', 'mod_native_file', '/usr/local/freeswitch/mod/mod_native_file.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'uuid_write_png', 'grab an image from a call', 'mod_png', '/usr/local/freeswitch/mod/mod_png.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'png', '', 'mod_png', '/usr/local/freeswitch/mod/mod_png.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'local_stream', 'manage local streams', 'mod_local_stream', '/usr/local/freeswitch/mod/mod_local_stream.so', '<show|start|reload|stop|hup> <local_stream_name>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'local_stream', '', 'mod_local_stream', '/usr/local/freeswitch/mod/mod_local_stream.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'tone_stream', '', 'mod_tone_stream', '/usr/local/freeswitch/mod/mod_tone_stream.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('file', 'silence_stream', '', 'mod_tone_stream', '/usr/local/freeswitch/mod/mod_tone_stream.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('dialplan', 'LUA', '', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'lua', 'Launch LUA ivr', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('application', 'lua', 'execute a lua script', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'luarun', 'run a script', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('api', 'lua', 'run a script as an api function', 'mod_lua', '/usr/local/freeswitch/mod/mod_lua.so', '<script>', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('say', 'en', '', 'mod_say_en', '/usr/local/freeswitch/mod/mod_say_en.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('speech', 'unimrcp', '', 'mod_unimrcp', '/usr/local/freeswitch/mod/mod_unimrcp.so', '', '851b6fb10517');
INSERT INTO `interfaces` VALUES ('asr', 'unimrcp', '', 'mod_unimrcp', '/usr/local/freeswitch/mod/mod_unimrcp.so', '', '851b6fb10517');

-- ----------------------------
-- Table structure for limit_data
-- ----------------------------
DROP TABLE IF EXISTS `limit_data`;
CREATE TABLE `limit_data`  (
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `ld_hostname`(`hostname`) USING BTREE,
  INDEX `ld_uuid`(`uuid`) USING BTREE,
  INDEX `ld_realm`(`realm`) USING BTREE,
  INDEX `ld_id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of limit_data
-- ----------------------------

-- ----------------------------
-- Table structure for nat
-- ----------------------------
DROP TABLE IF EXISTS `nat`;
CREATE TABLE `nat`  (
  `sticky` int(11) NULL DEFAULT NULL,
  `port` int(11) NULL DEFAULT NULL,
  `proto` int(11) NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `nat_map_port_proto`(`port`, `proto`, `hostname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nat
-- ----------------------------

-- ----------------------------
-- Table structure for recovery
-- ----------------------------
DROP TABLE IF EXISTS `recovery`;
CREATE TABLE `recovery`  (
  `runtime_uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `technology` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `metadata` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  INDEX `recovery1`(`technology`) USING BTREE,
  INDEX `recovery2`(`profile_name`) USING BTREE,
  INDEX `recovery3`(`uuid`) USING BTREE,
  INDEX `recovery4`(`runtime_uuid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recovery
-- ----------------------------

-- ----------------------------
-- Table structure for registrations
-- ----------------------------
DROP TABLE IF EXISTS `registrations`;
CREATE TABLE `registrations`  (
  `reg_user` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `realm` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `expires` int(11) NULL DEFAULT NULL,
  `network_ip` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_port` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_proto` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `metadata` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `regindex1`(`reg_user`, `realm`, `hostname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of registrations
-- ----------------------------

-- ----------------------------
-- Table structure for sip_authentication
-- ----------------------------
DROP TABLE IF EXISTS `sip_authentication`;
CREATE TABLE `sip_authentication`  (
  `nonce` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expires` bigint(20) NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_nc` int(11) NULL DEFAULT NULL,
  `algorithm` int(11) NOT NULL DEFAULT 1,
  INDEX `sa_nonce`(`nonce`) USING BTREE,
  INDEX `sa_hostname`(`hostname`) USING BTREE,
  INDEX `sa_expires`(`expires`) USING BTREE,
  INDEX `sa_last_nc`(`last_nc`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_authentication
-- ----------------------------

-- ----------------------------
-- Table structure for sip_dialogs
-- ----------------------------
DROP TABLE IF EXISTS `sip_dialogs`;
CREATE TABLE `sip_dialogs`  (
  `call_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_to_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_to_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_from_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_from_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `direction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presence_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presence_data` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_info_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `expires` bigint(20) NULL DEFAULT 0,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rpid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_to_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_from_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rcd` int(11) NOT NULL DEFAULT 0,
  INDEX `sd_uuid`(`uuid`) USING BTREE,
  INDEX `sd_hostname`(`hostname`) USING BTREE,
  INDEX `sd_presence_data`(`presence_data`) USING BTREE,
  INDEX `sd_call_info`(`call_info`) USING BTREE,
  INDEX `sd_call_info_state`(`call_info_state`) USING BTREE,
  INDEX `sd_expires`(`expires`) USING BTREE,
  INDEX `sd_rcd`(`rcd`) USING BTREE,
  INDEX `sd_sip_to_tag`(`sip_to_tag`) USING BTREE,
  INDEX `sd_sip_from_user`(`sip_from_user`) USING BTREE,
  INDEX `sd_sip_from_host`(`sip_from_host`) USING BTREE,
  INDEX `sd_sip_to_host`(`sip_to_host`) USING BTREE,
  INDEX `sd_presence_id`(`presence_id`) USING BTREE,
  INDEX `sd_call_id`(`call_id`) USING BTREE,
  INDEX `sd_sip_from_tag`(`sip_from_tag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_dialogs
-- ----------------------------

-- ----------------------------
-- Table structure for sip_presence
-- ----------------------------
DROP TABLE IF EXISTS `sip_presence`;
CREATE TABLE `sip_presence`  (
  `sip_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rpid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expires` bigint(20) NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_port` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `open_closed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `sp_hostname`(`hostname`) USING BTREE,
  INDEX `sp_open_closed`(`open_closed`) USING BTREE,
  INDEX `sp_sip_user`(`sip_user`) USING BTREE,
  INDEX `sp_sip_host`(`sip_host`) USING BTREE,
  INDEX `sp_profile_name`(`profile_name`) USING BTREE,
  INDEX `sp_expires`(`expires`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_presence
-- ----------------------------

-- ----------------------------
-- Table structure for sip_registrations
-- ----------------------------
DROP TABLE IF EXISTS `sip_registrations`;
CREATE TABLE `sip_registrations`  (
  `call_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presence_hosts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ping_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ping_count` int(11) NULL DEFAULT NULL,
  `ping_time` bigint(20) NULL DEFAULT NULL,
  `force_ping` int(11) NULL DEFAULT NULL,
  `rpid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expires` bigint(20) NULL DEFAULT NULL,
  `ping_expires` int(11) NOT NULL DEFAULT 0,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_port` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_realm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mwi_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mwi_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `orig_server_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `orig_hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `sr_call_id`(`call_id`) USING BTREE,
  INDEX `sr_sip_user`(`sip_user`) USING BTREE,
  INDEX `sr_sip_host`(`sip_host`) USING BTREE,
  INDEX `sr_sub_host`(`sub_host`) USING BTREE,
  INDEX `sr_mwi_user`(`mwi_user`) USING BTREE,
  INDEX `sr_mwi_host`(`mwi_host`) USING BTREE,
  INDEX `sr_profile_name`(`profile_name`) USING BTREE,
  INDEX `sr_presence_hosts`(`presence_hosts`) USING BTREE,
  INDEX `sr_expires`(`expires`) USING BTREE,
  INDEX `sr_ping_expires`(`ping_expires`) USING BTREE,
  INDEX `sr_hostname`(`hostname`) USING BTREE,
  INDEX `sr_status`(`status`) USING BTREE,
  INDEX `sr_ping_status`(`ping_status`) USING BTREE,
  INDEX `sr_network_ip`(`network_ip`) USING BTREE,
  INDEX `sr_network_port`(`network_port`) USING BTREE,
  INDEX `sr_sip_username`(`sip_username`) USING BTREE,
  INDEX `sr_sip_realm`(`sip_realm`) USING BTREE,
  INDEX `sr_orig_server_host`(`orig_server_host`) USING BTREE,
  INDEX `sr_orig_hostname`(`orig_hostname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_registrations
-- ----------------------------

-- ----------------------------
-- Table structure for sip_shared_appearance_dialogs
-- ----------------------------
DROP TABLE IF EXISTS `sip_shared_appearance_dialogs`;
CREATE TABLE `sip_shared_appearance_dialogs`  (
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_str` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expires` bigint(20) NULL DEFAULT NULL,
  INDEX `ssd_profile_name`(`profile_name`) USING BTREE,
  INDEX `ssd_hostname`(`hostname`) USING BTREE,
  INDEX `ssd_contact_str`(`contact_str`) USING BTREE,
  INDEX `ssd_call_id`(`call_id`) USING BTREE,
  INDEX `ssd_expires`(`expires`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_shared_appearance_dialogs
-- ----------------------------

-- ----------------------------
-- Table structure for sip_shared_appearance_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `sip_shared_appearance_subscriptions`;
CREATE TABLE `sip_shared_appearance_subscriptions`  (
  `subscriber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `aor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_str` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `ssa_hostname`(`hostname`) USING BTREE,
  INDEX `ssa_network_ip`(`network_ip`) USING BTREE,
  INDEX `ssa_subscriber`(`subscriber`) USING BTREE,
  INDEX `ssa_profile_name`(`profile_name`) USING BTREE,
  INDEX `ssa_aor`(`aor`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_shared_appearance_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for sip_subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `sip_subscriptions`;
CREATE TABLE `sip_subscriptions`  (
  `proto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sip_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_to_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_to_host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `presence_hosts` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `call_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `full_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `full_via` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `expires` bigint(20) NULL DEFAULT NULL,
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `accept` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `profile_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `hostname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_port` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `network_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `version` int(11) NOT NULL DEFAULT 0,
  `orig_proto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `full_to` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `ss_call_id`(`call_id`) USING BTREE,
  INDEX `ss_multi`(`call_id`, `profile_name`, `hostname`) USING BTREE,
  INDEX `ss_hostname`(`hostname`) USING BTREE,
  INDEX `ss_network_ip`(`network_ip`) USING BTREE,
  INDEX `ss_sip_user`(`sip_user`) USING BTREE,
  INDEX `ss_sip_host`(`sip_host`) USING BTREE,
  INDEX `ss_presence_hosts`(`presence_hosts`) USING BTREE,
  INDEX `ss_event`(`event`) USING BTREE,
  INDEX `ss_proto`(`proto`) USING BTREE,
  INDEX `ss_sub_to_user`(`sub_to_user`) USING BTREE,
  INDEX `ss_sub_to_host`(`sub_to_host`) USING BTREE,
  INDEX `ss_expires`(`expires`) USING BTREE,
  INDEX `ss_orig_proto`(`orig_proto`) USING BTREE,
  INDEX `ss_network_port`(`network_port`) USING BTREE,
  INDEX `ss_profile_name`(`profile_name`) USING BTREE,
  INDEX `ss_version`(`version`) USING BTREE,
  INDEX `ss_full_from`(`full_from`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sip_subscriptions
-- ----------------------------

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `task_id` int(11) NULL DEFAULT NULL,
  `task_desc` varchar(4096) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `task_group` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `task_runtime` bigint(20) NULL DEFAULT NULL,
  `task_sql_manager` int(11) NULL DEFAULT NULL,
  `hostname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `tasks1`(`hostname`, `task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (3, 'limit_hash_cleanup', 'mod_hash', 1692461178, 0, '11ae8880a881');
INSERT INTO `tasks` VALUES (3, 'limit_hash_cleanup', 'mod_hash', 1692461548, 0, '851b6fb10517');

-- ----------------------------
-- Table structure for voicemail_msgs
-- ----------------------------
DROP TABLE IF EXISTS `voicemail_msgs`;
CREATE TABLE `voicemail_msgs`  (
  `created_epoch` int(11) NULL DEFAULT NULL,
  `read_epoch` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cid_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cid_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `in_folder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `message_len` int(11) NULL DEFAULT NULL,
  `flags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `read_flags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `forwarded_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `voicemail_msgs_idx1`(`created_epoch`) USING BTREE,
  INDEX `voicemail_msgs_idx2`(`username`) USING BTREE,
  INDEX `voicemail_msgs_idx3`(`domain`) USING BTREE,
  INDEX `voicemail_msgs_idx4`(`uuid`) USING BTREE,
  INDEX `voicemail_msgs_idx5`(`in_folder`) USING BTREE,
  INDEX `voicemail_msgs_idx6`(`read_flags`) USING BTREE,
  INDEX `voicemail_msgs_idx7`(`forwarded_by`) USING BTREE,
  INDEX `voicemail_msgs_idx8`(`read_epoch`) USING BTREE,
  INDEX `voicemail_msgs_idx9`(`flags`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voicemail_msgs
-- ----------------------------

-- ----------------------------
-- Table structure for voicemail_prefs
-- ----------------------------
DROP TABLE IF EXISTS `voicemail_prefs`;
CREATE TABLE `voicemail_prefs`  (
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `greeting_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  INDEX `voicemail_prefs_idx1`(`username`) USING BTREE,
  INDEX `voicemail_prefs_idx2`(`domain`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of voicemail_prefs
-- ----------------------------

-- ----------------------------
-- View structure for basic_calls
-- ----------------------------
DROP VIEW IF EXISTS `basic_calls`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `basic_calls` AS select `a`.`uuid` AS `uuid`,`a`.`direction` AS `direction`,`a`.`created` AS `created`,`a`.`created_epoch` AS `created_epoch`,`a`.`name` AS `name`,`a`.`state` AS `state`,`a`.`cid_name` AS `cid_name`,`a`.`cid_num` AS `cid_num`,`a`.`ip_addr` AS `ip_addr`,`a`.`dest` AS `dest`,`a`.`presence_id` AS `presence_id`,`a`.`presence_data` AS `presence_data`,`a`.`accountcode` AS `accountcode`,`a`.`callstate` AS `callstate`,`a`.`callee_name` AS `callee_name`,`a`.`callee_num` AS `callee_num`,`a`.`callee_direction` AS `callee_direction`,`a`.`call_uuid` AS `call_uuid`,`a`.`hostname` AS `hostname`,`a`.`sent_callee_name` AS `sent_callee_name`,`a`.`sent_callee_num` AS `sent_callee_num`,`b`.`uuid` AS `b_uuid`,`b`.`direction` AS `b_direction`,`b`.`created` AS `b_created`,`b`.`created_epoch` AS `b_created_epoch`,`b`.`name` AS `b_name`,`b`.`state` AS `b_state`,`b`.`cid_name` AS `b_cid_name`,`b`.`cid_num` AS `b_cid_num`,`b`.`ip_addr` AS `b_ip_addr`,`b`.`dest` AS `b_dest`,`b`.`presence_id` AS `b_presence_id`,`b`.`presence_data` AS `b_presence_data`,`b`.`accountcode` AS `b_accountcode`,`b`.`callstate` AS `b_callstate`,`b`.`callee_name` AS `b_callee_name`,`b`.`callee_num` AS `b_callee_num`,`b`.`callee_direction` AS `b_callee_direction`,`b`.`sent_callee_name` AS `b_sent_callee_name`,`b`.`sent_callee_num` AS `b_sent_callee_num`,`c`.`call_created_epoch` AS `call_created_epoch` from ((`channels` `a` left join `calls` `c` on(((`a`.`uuid` = `c`.`caller_uuid`) and (`a`.`hostname` = `c`.`hostname`)))) left join `channels` `b` on(((`b`.`uuid` = `c`.`callee_uuid`) and (`b`.`hostname` = `c`.`hostname`)))) where ((`a`.`uuid` = `c`.`caller_uuid`) or (not(`a`.`uuid` in (select `calls`.`callee_uuid` from `calls`))));

-- ----------------------------
-- View structure for detailed_calls
-- ----------------------------
DROP VIEW IF EXISTS `detailed_calls`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `detailed_calls` AS select `a`.`uuid` AS `uuid`,`a`.`direction` AS `direction`,`a`.`created` AS `created`,`a`.`created_epoch` AS `created_epoch`,`a`.`name` AS `name`,`a`.`state` AS `state`,`a`.`cid_name` AS `cid_name`,`a`.`cid_num` AS `cid_num`,`a`.`ip_addr` AS `ip_addr`,`a`.`dest` AS `dest`,`a`.`application` AS `application`,`a`.`application_data` AS `application_data`,`a`.`dialplan` AS `dialplan`,`a`.`context` AS `context`,`a`.`read_codec` AS `read_codec`,`a`.`read_rate` AS `read_rate`,`a`.`read_bit_rate` AS `read_bit_rate`,`a`.`write_codec` AS `write_codec`,`a`.`write_rate` AS `write_rate`,`a`.`write_bit_rate` AS `write_bit_rate`,`a`.`secure` AS `secure`,`a`.`hostname` AS `hostname`,`a`.`presence_id` AS `presence_id`,`a`.`presence_data` AS `presence_data`,`a`.`accountcode` AS `accountcode`,`a`.`callstate` AS `callstate`,`a`.`callee_name` AS `callee_name`,`a`.`callee_num` AS `callee_num`,`a`.`callee_direction` AS `callee_direction`,`a`.`call_uuid` AS `call_uuid`,`a`.`sent_callee_name` AS `sent_callee_name`,`a`.`sent_callee_num` AS `sent_callee_num`,`b`.`uuid` AS `b_uuid`,`b`.`direction` AS `b_direction`,`b`.`created` AS `b_created`,`b`.`created_epoch` AS `b_created_epoch`,`b`.`name` AS `b_name`,`b`.`state` AS `b_state`,`b`.`cid_name` AS `b_cid_name`,`b`.`cid_num` AS `b_cid_num`,`b`.`ip_addr` AS `b_ip_addr`,`b`.`dest` AS `b_dest`,`b`.`application` AS `b_application`,`b`.`application_data` AS `b_application_data`,`b`.`dialplan` AS `b_dialplan`,`b`.`context` AS `b_context`,`b`.`read_codec` AS `b_read_codec`,`b`.`read_rate` AS `b_read_rate`,`b`.`read_bit_rate` AS `b_read_bit_rate`,`b`.`write_codec` AS `b_write_codec`,`b`.`write_rate` AS `b_write_rate`,`b`.`write_bit_rate` AS `b_write_bit_rate`,`b`.`secure` AS `b_secure`,`b`.`hostname` AS `b_hostname`,`b`.`presence_id` AS `b_presence_id`,`b`.`presence_data` AS `b_presence_data`,`b`.`accountcode` AS `b_accountcode`,`b`.`callstate` AS `b_callstate`,`b`.`callee_name` AS `b_callee_name`,`b`.`callee_num` AS `b_callee_num`,`b`.`callee_direction` AS `b_callee_direction`,`b`.`call_uuid` AS `b_call_uuid`,`b`.`sent_callee_name` AS `b_sent_callee_name`,`b`.`sent_callee_num` AS `b_sent_callee_num`,`c`.`call_created_epoch` AS `call_created_epoch` from ((`channels` `a` left join `calls` `c` on(((`a`.`uuid` = `c`.`caller_uuid`) and (`a`.`hostname` = `c`.`hostname`)))) left join `channels` `b` on(((`b`.`uuid` = `c`.`callee_uuid`) and (`b`.`hostname` = `c`.`hostname`)))) where ((`a`.`uuid` = `c`.`caller_uuid`) or (not(`a`.`uuid` in (select `calls`.`callee_uuid` from `calls`))));

SET FOREIGN_KEY_CHECKS = 1;
