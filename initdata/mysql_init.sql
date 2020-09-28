USE mysql;

DROP PROCEDURE IF EXISTS greenradius_init;

delimiter $$

CREATE PROCEDURE greenradius_init()
begin

    -- initdata
    IF NOT EXISTS(SELECT 1 FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = 'greenradius' AND table_name = 'bss_config') THEN
-- ---------------------------------------------------------------------------------------------------------------------
--  create tables
-- ---------------------------------------------------------------------------------------------------------------------
        create table bss_config
        (
            id     bigint auto_increment
                primary key,
            type   varchar(32)   not null,
            name   varchar(128)  not null,
            value  varchar(2048) not null,
            remark varchar(2048) not null
        );

        create table bss_dashboard
        (
            id      bigint auto_increment
                primary key,
            skey    varchar(64)  not null,
            tags    varchar(255) not null,
            title   varchar(128) not null,
            content text         not null
        );

        create table bss_menu_node
        (
            id        bigint auto_increment
                primary key,
            parent_id bigint                null,
            module    varchar(255)          not null,
            cmodule   varchar(64)           not null,
            name      varchar(255)          not null,
            type      enum ('menu', 'perm') not null,
            icon      varchar(64)           not null,
            docsn     varchar(64)           not null,
            levels    varchar(255)          not null,
            sort      int                   not null,
            hidden    enum ('y', 'n')       not null,
            url       varchar(255)          not null,
            constraint bss_menu_node_ibfk_1
                foreign key (parent_id) references bss_menu_node (id)
                    on delete cascade
        );

        create index ix_bss_menu_node_cmodule
            on bss_menu_node (cmodule);

        create index ix_bss_menu_node_module
            on bss_menu_node (module);

        create index parent_id
            on bss_menu_node (parent_id);

        create table bss_metrics
        (
            id          bigint auto_increment
                primary key,
            tags        varchar(64) not null,
            skey        varchar(64) not null,
            name        varchar(64) not null,
            icon        varchar(32) not null,
            value       varchar(16) not null,
            update_time datetime    not null
        );

        create table bss_module
        (
            id           bigint auto_increment
                primary key,
            name         varchar(64)  not null,
            module       varchar(64)  not null,
            api_route    varchar(255) not null,
            api_url      varchar(255) not null,
            index_url    varchar(255) not null,
            index_script varchar(255) not null,
            remark       varchar(255) not null
        );

        create table bss_nav_action
        (
            id     bigint auto_increment
                primary key,
            icon   varchar(64)  not null,
            name   varchar(64)  not null,
            module varchar(64)  not null,
            sort   int          not null,
            url    varchar(255) not null
        );

        create table bss_opr
        (
            id          bigint auto_increment
                primary key,
            head        text                         not null,
            realname    varchar(64)                  not null,
            mobile      varchar(16)                  not null,
            email       varchar(128)                 not null,
            username    varchar(64)                  not null,
            password    varchar(64)                  not null,
            api_secret  varchar(64)                  not null,
            mfa_secret  varchar(32)                  not null,
            level       varchar(16)                  not null,
            status      enum ('enabled', 'disabled') not null,
            remark      varchar(512)                 not null,
            last_login  datetime                     null,
            create_time datetime                     not null,
            constraint username
                unique (username)
        );

        create table bss_opr_log
        (
            id         bigint auto_increment
                primary key,
            opr_id     bigint      not null,
            opr_name   varchar(15) not null,
            opr_ip     varchar(15) not null,
            opt_action varchar(64) not null,
            opt_desc   text        not null,
            opt_time   datetime    not null
        );

        create table bss_tag
        (
            id          bigint auto_increment
                primary key,
            category    enum ('event', 'ticket', 'service', 'assets', 'network', 'knowledge', 'system') not null,
            name        varchar(64)                                                                     not null,
            alias       varchar(64)                                                                     not null,
            owner       varchar(64)                                                                     not null,
            remark      varchar(255)                                                                    not null,
            create_time datetime                                                                        not null,
            update_time datetime                                                                        not null
        );

        create index ix_bss_tag_create_time
            on bss_tag (create_time);

        create table bss_trans
        (
            id     bigint auto_increment
                primary key,
            module varchar(64)   not null,
            name   varchar(1024) not null,
            zh_cn  varchar(1024) not null,
            en_us  varchar(1024) not null,
            ver    varchar(64)   not null,
            constraint ver
                unique (ver)
        );

        create table bss_widget
        (
            id      bigint auto_increment
                primary key,
            name    varchar(64)  not null,
            tags    varchar(255) not null,
            levels  varchar(255) not null,
            title   varchar(128) not null,
            bgcolor varchar(16)  not null,
            icon    varchar(32)  not null,
            dx      int          not null,
            dy      int          not null,
            type    varchar(16)  not null,
            src     varchar(255) not null
        );

        create table net_authlog
        (
            id          bigint auto_increment
                primary key,
            username    varchar(32)                 not null,
            nas_addr    varchar(32)                 not null,
            result      enum ('success', 'failure') not null,
            reason      varchar(255)                not null,
            create_time datetime                    not null
        );

        create index ix_net_authlog_nas_addr
            on net_authlog (nas_addr);

        create index ix_net_authlog_username
            on net_authlog (username);

        create table net_ldap
        (
            id          bigint auto_increment
                primary key,
            tags        varchar(255)                 not null,
            name        varchar(64)                  not null,
            address     varchar(32)                  not null,
            password    varchar(64)                  not null,
            searchdn    varchar(64)                  not null,
            basedn      varchar(64)                  not null,
            user_filter varchar(64)                  not null,
            istls       enum ('enabled', 'disabled') not null,
            status      enum ('enabled', 'disabled') not null,
            remark      varchar(255)                 not null,
            create_time datetime                     not null,
            update_time datetime                     not null
        );

        create index ix_net_ldap_address
            on net_ldap (address);

        create table net_profile
        (
            id                bigint auto_increment
                primary key,
            tags              varchar(255)                                                      not null,
            name              varchar(64)                                                       not null,
            domain            varchar(32)                                                       not null,
            addr_pool         varchar(32)                                                       not null,
            active_num        int                                                               not null,
            up_rate           int                                                               not null,
            down_rate         int                                                               not null,
            limit_policy      varchar(32)                                                       not null,
            up_limit_policy   varchar(32)                                                       not null,
            down_limit_policy varchar(32)                                                       not null,
            bill_times        int                                                               not null,
            bill_timeunit     enum ('second', 'minute', 'hour', 'day', 'week', 'month', 'year') not null,
            status            enum ('enabled', 'disabled')                                      not null,
            remark            varchar(255)                                                      not null,
            create_time       datetime                                                          not null,
            update_time       datetime                                                          not null
        );

        create table net_radius_online
        (
            id                  bigint auto_increment
                primary key,
            username            varchar(32)  not null,
            nas_id              varchar(32)  not null,
            nas_addr            varchar(32)  not null,
            nas_paddr           varchar(32)  not null,
            session_timeout     int          not null,
            framed_ipaddr       varchar(32)  not null,
            framed_netmask      varchar(32)  not null,
            mac_addr            varchar(32)  not null,
            nas_port            bigint       not null,
            nas_class           varchar(253) not null,
            nas_port_id         varchar(255) not null,
            nas_port_type       int          not null,
            service_type        int          not null,
            acct_session_id     varchar(64)  not null,
            acct_session_time   int          not null,
            acct_input_total    bigint       not null,
            acct_output_total   bigint       not null,
            acct_input_packets  int          not null,
            acct_output_packets int          not null,
            acct_start_time     datetime     not null,
            last_update         datetime     not null,
            constraint ix_net_radius_online_acct_session_id
                unique (acct_session_id)
        );

        create index ix_net_radius_online_mac_addr
            on net_radius_online (mac_addr);

        create index ix_net_radius_online_nas_addr
            on net_radius_online (nas_addr);

        create index ix_net_radius_online_nas_id
            on net_radius_online (nas_id);

        create index ix_net_radius_online_nas_paddr
            on net_radius_online (nas_paddr);

        create index ix_net_radius_online_username
            on net_radius_online (username);

        create table net_radiuslog
        (
            id                  bigint auto_increment
                primary key,
            username            varchar(32)  not null,
            nas_id              varchar(32)  not null,
            nas_addr            varchar(32)  not null,
            nas_paddr           varchar(32)  not null,
            session_timeout     int          not null,
            framed_ipaddr       varchar(32)  not null,
            framed_netmask      varchar(32)  not null,
            mac_addr            varchar(32)  not null,
            nas_port            bigint       not null,
            nas_class           varchar(253) not null,
            nas_port_id         varchar(255) not null,
            nas_port_type       int          not null,
            service_type        int          not null,
            acct_session_id     varchar(64)  not null,
            acct_session_time   int          not null,
            acct_input_total    bigint       not null,
            acct_output_total   bigint       not null,
            acct_input_packets  int          not null,
            acct_output_packets int          not null,
            acct_start_time     datetime     not null,
            acct_stop_time      datetime     not null
        );

        create index ix_net_radiuslog_acct_session_id
            on net_radiuslog (acct_session_id);

        create index ix_net_radiuslog_mac_addr
            on net_radiuslog (mac_addr);

        create index ix_net_radiuslog_nas_addr
            on net_radiuslog (nas_addr);

        create index ix_net_radiuslog_nas_id
            on net_radiuslog (nas_id);

        create index ix_net_radiuslog_nas_paddr
            on net_radiuslog (nas_paddr);

        create index ix_net_radiuslog_username
            on net_radiuslog (username);

        create table net_subscribe
        (
            id                bigint auto_increment
                primary key,
            tags              varchar(255)                 not null,
            vpe_ids           varchar(512)                 not null,
            profile_id        bigint                       not null,
            realname          varchar(64)                  not null,
            mobile            varchar(64)                  not null,
            email             varchar(128)                 not null,
            username          varchar(64)                  not null,
            password          varchar(256)                 not null,
            mfa_secret        varchar(32)                  not null,
            mfa_status        enum ('enabled', 'disabled') not null,
            domain            varchar(32)                  not null,
            addr_pool         varchar(128)                 not null,
            mac_addr          varchar(32)                  not null,
            ip_addr           varchar(32)                  not null,
            active_num        int                          not null,
            vlanid1           int                          not null,
            vlanid2           int                          not null,
            limit_policy      varchar(32)                  not null,
            up_limit_policy   varchar(32)                  not null,
            down_limit_policy varchar(32)                  not null,
            up_rate           int                          not null,
            down_rate         int                          not null,
            bind_mac          int                          not null,
            bind_vlan         int                          not null,
            status            enum ('enabled', 'disabled') not null,
            remark            varchar(255)                 not null,
            create_time       datetime                     not null,
            expire_time       datetime                     not null,
            update_time       datetime                     not null,
            constraint ix_net_subscribe_username
                unique (username)
        );

        create index ix_net_subscribe_create_time
            on net_subscribe (create_time);

        create index ix_net_subscribe_expire_time
            on net_subscribe (expire_time);

        create index ix_net_subscribe_profile_id
            on net_subscribe (profile_id);

        create table net_vpe
        (
            id          bigint auto_increment
                primary key,
            identifier  varchar(128)                 not null,
            tags        varchar(255)                 not null,
            name        varchar(64)                  not null,
            ipaddr      varchar(32)                  not null,
            secret      varchar(64)                  not null,
            vendor_code varchar(16)                  not null,
            coa_port    int                          not null,
            status      enum ('enabled', 'disabled') not null,
            ldap_id     bigint                       not null,
            remark      varchar(512)                 not null,
            create_time datetime                     not null,
            update_time datetime                     not null
        );

        create index ix_net_vpe_identifier
            on net_vpe (identifier);

        create index ix_net_vpe_ipaddr
            on net_vpe (ipaddr);


-- ---------------------------------------------------------------------------------------------------------------------
--  insert init data
-- ---------------------------------------------------------------------------------------------------------------------

        SET foreign_key_checks = 0;

-- config table
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (1, 'system', 'SYSTEM_TZ', 'Asia/Shanghai', 'TimeZone');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (2, 'system', 'SystemLang', 'en_US', 'System Lang');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (3, 'system', 'SystemDevMode', 'enabled', 'Develop Mode');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (4, 'system', 'SystemOprMfaStatus', 'disabled', 'Operator Login Enable Mfa');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (5, 'system', 'SystemPortalTitle', 'GreenRADIUS Authentication system', 'System Portal Title');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (6, 'system', 'SystemTitle', 'GreenRADIUS Authentication system', 'System Title');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (7, 'system', 'SystemNavMainTitle', 'GreenRADIUS Authentication system', 'Nav Main title');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (8, 'system', 'SystemNavSecondTitle', 'Build: V1.0.1_b2020090101', 'Nav Second Title');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (9, 'system', 'SystemLoginSubtitle', 'AAA Authentication system', 'Login Page sub title');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (10, 'system', 'SystemLoginRemark', 'Recommended:   Chrome/Edge', 'Login Page remark');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (11, 'system', 'SystemSidebarTitle', 'GreenRADIUS', 'System Sidebar Title');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (12, 'system', 'SystemBaseUrl', 'http://www.greenradius.net', 'System url');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (13, 'system', 'SystemDashboardWidth', '5', 'SystemDashboardWidth');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (14, 'system', 'SystemDashboardHeight', '10', 'SystemDashboardHeight');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (15, 'system', 'SystemApiAccess', 'enabled', 'SystemApiAccess');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (16, 'system', 'SystemApiTokenTimes', '60', 'SystemApiTokenTimes');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (17, 'ui', 'UiLoginLogo', '/static/default/login-logo.png', 'Login Page logo');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (18, 'ui', 'UiLoginBg', '/static/default/login-bg.jpg', 'Login Page bg image');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (19, 'ui', 'UiToggleLogo', '/static/default/toggle.png', 'Manage Page toggle');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (20, 'ui', 'UiNavLogo', '/static/default/nav-logo.png', 'Manage Page nav logo');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (21, 'ui', 'UiNavBg', '/static/default/nav-bg.png', 'Manage Page nav bg image');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (22, 'qcloudsms', 'QcloudSmsAppid', '', 'Qcloud sms Appid');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (23, 'qcloudsms', 'QcloudSmsSecretid', '', 'Qcloud sms SecretId');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (24, 'qcloudsms', 'QcloudSmsSecretkey', '', 'Qcloud sms SecretKey');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (25, 'qcloudsms', 'QcloudSmsSign', '', 'Qcloud sms sign');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (26, 'qcloudsms', 'QcloudSmsVcodeTpl', '', 'Qcloud sms vcode template');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (27, 'radius', 'AcctInterimInterval', '120', 'AcctInterimInterval');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (28, 'radius', 'RadiuslogHistoryDays', '180', 'RadiuslogHistoryDays');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (29, 'radius', 'RadiusIgnorePwd', 'disabled', 'RadiusIgnorePwd');
        INSERT INTO bss_config (id, type, name, value, remark) VALUES (30, 'radius', 'RadiusMfaStatus', 'disabled', 'Enable Mfa validation');


-- menudata table
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (105, null, 'menunode_monitor', 'N/A', 'Monitor Center', 'menu', 'view-dashboard', '', 'all', 200, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (107, null, 'menunode_network', 'N/A', 'Network Manage', 'menu', 'network', '', 'all', 300, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (110, null, 'menunode_report', 'N/A', 'Report Center', 'menu', 'file-chart', '', 'all', 400, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (300, null, 'menunode_opt', 'N/A', 'system maintenance', 'menu', 'cogs', '', 'master', 500, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10503, 105, 'online', 'N/A', 'Onlines', 'menu', 'account', '', 'all', 204, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10504, 105, 'radiuslog', 'N/A', 'Radius Logging', 'menu', 'file-outline', '', 'all', 205, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10505, 105, 'authlog', 'N/A', 'Authlog', 'menu', 'file-outline', '', 'all', 206, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10700, 107, 'radius_config', 'N/A', 'Radius Settings', 'menu', 'cogs', '', 'master', 302, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10701, 107, 'vpe', 'N/A', 'Nas Devices', 'menu', 'switch', '', 'master', 302, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10703, 107, 'profile', 'N/A', 'Radius Profile', 'menu', 'apps', '', 'master,opr', 304, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10704, 107, 'subscribe', 'N/A', 'Subscribe', 'menu', 'account', '', 'master,opr', 305, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (10705, 107, 'ldap', 'N/A', 'Ldap Nodes', 'menu', 'switch', '', 'master', 306, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (11000, 110, 'radlog_report', 'N/A', 'Accounting Report', 'menu', 'file-chart', '', 'master,opr', 401, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30001, 300, 'perms', 'N/A', 'Permissions', 'menu', 'menu', '', 'master', 501, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30002, 300, 'uiconfig', 'N/A', 'Ui Settings', 'menu', 'cogs', '', 'master', 502, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30003, 300, 'config', 'N/A', 'System Settings', 'menu', 'cogs', '', 'master', 503, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30006, 300, 'tag', 'N/A', 'Tags', 'menu', 'tag', '', 'master', 506, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30007, 300, 'oprlog', 'N/A', 'Operational audits', 'menu', 'file-outline', '', 'master', 507, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30008, 300, 'opr', 'N/A', 'Operator', 'menu', 'account', '', 'master', 508, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30009, 300, 'translate', 'N/A', 'Translate', 'menu', 'account', '', 'master', 509, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (30099, 300, 'filemanager', 'N/A', 'File Manage', 'menu', 'file-document', '', 'master', 599, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1050301, 10503, 'online_disconnect', 'N/A', 'Online Disconnect', 'perm', 'arrow-right-drop-circle-outline', '', 'master,ops', 20401, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1050302, 10503, 'online_clear', 'N/A', 'Online Clear', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 20402, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1050501, 10505, 'authlog_clear', 'N/A', 'Authlog Clear', 'perm', 'arrow-right-drop-circle-outline', '', 'super', 204601, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070101, 10701, 'vpe_create', 'N/A', 'Nas Create', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30201, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070102, 10701, 'vpe_modify', 'N/A', 'Nas Modify', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30202, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070103, 10701, 'vpe_delete', 'N/A', 'Nas Delete', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30203, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070104, 10701, 'vpe_import', 'N/A', 'Nas Import', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30204, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070105, 10701, 'vpe_export', 'N/A', 'Nas Export', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30205, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070301, 10703, 'profile_create', 'N/A', 'Profile Create', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30401, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070302, 10703, 'profile_modify', 'N/A', 'Profile Modify', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30402, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070303, 10703, 'profile_delete', 'N/A', 'Profile Delete', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30403, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070304, 10703, 'profile_import', 'N/A', 'Profile Import', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30404, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070305, 10703, 'profile_export', 'N/A', 'Profile Export', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30405, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070401, 10704, 'subscribe_create', 'N/A', 'Subscribe Create', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30501, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070402, 10704, 'subscribe_modify', 'N/A', 'Subscribe Modify', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30502, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070403, 10704, 'subscribe_delete', 'N/A', 'Subscribe Delete', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30503, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070404, 10704, 'subscribe_import', 'N/A', 'Subscribe Import', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30504, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070405, 10704, 'subscribe_export', 'N/A', 'Subscribe Export', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30505, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070501, 10705, 'ldap_create', 'N/A', 'Ldap Create', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30601, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070502, 10705, 'ldap_modify', 'N/A', 'Ldap Modify', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30602, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070503, 10705, 'ldap_delete', 'N/A', 'Ldap Delete', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30603, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070504, 10705, 'ldap_import', 'N/A', 'Ldap Import', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30604, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (1070505, 10705, 'ldap_export', 'N/A', 'Ldap Export', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 30605, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (3009901, 30099, 'filemanager_write', 'N/A', 'File Write', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 59901, 'n', '');
        INSERT INTO bss_menu_node (id, parent_id, module, cmodule, name, type, icon, docsn, levels, sort, hidden, url)
        VALUES (3009902, 30099, 'filemanager_delete', 'N/A', 'File Delete', 'perm', 'arrow-right-drop-circle-outline', '', 'master', 59902, 'n', '');


-- opr table
        INSERT INTO bss_opr (id, head, realname, mobile, email, username, password, api_secret, mfa_secret, level, status, remark, last_login, create_time)
        VALUES (1, '', 'System super admin', '', 'N/A', 'super', '6b60fe1feda26aeac49742b97e14aa46d70441a022ed8377ebd7a554fe735835', 'N/A', 'N/A', 'super', 'enabled', '', null, '2020-09-09 22:34:27');
        INSERT INTO bss_opr (id, head, realname, mobile, email, username, password, api_secret, mfa_secret, level, status, remark, last_login, create_time)
        VALUES (2, '', 'Admin', '', 'N/A', 'admin', 'ba4788b226aa8dc2e6dc74248bb9f618cfa8c959e0c26c147be48f6839a0b088', 'N/A', 'N/A', 'master', 'enabled', '', null, '2020-09-09 22:34:27');
        INSERT INTO bss_opr (id, head, realname, mobile, email, username, password, api_secret, mfa_secret, level, status, remark, last_login, create_time)
        VALUES (3, '', 'Service operator', '', 'N/A', 'opr', 'ba4788b226aa8dc2e6dc74248bb9f618cfa8c959e0c26c147be48f6839a0b088', 'N/A', 'N/A', 'opr', 'enabled', '', null, '2020-09-09 22:34:27');
        INSERT INTO bss_opr (id, head, realname, mobile, email, username, password, api_secret, mfa_secret, level, status, remark, last_login, create_time)
        VALUES (4, '', 'Operations Manager', '', 'N/A', 'ops', 'ba4788b226aa8dc2e6dc74248bb9f618cfa8c959e0c26c147be48f6839a0b088', 'N/A', 'N/A', 'ops', 'enabled', '', null, '2020-09-09 22:34:27');
        INSERT INTO bss_opr (id, head, realname, mobile, email, username, password, api_secret, mfa_secret, level, status, remark, last_login, create_time)
        VALUES (5, '', 'Audit Operator', '', 'N/A', 'audit', '95789472ecb2b12c00b81272c1a551b93a0be8e38b8e068fa5714ad6cb6e7441', 'N/A', 'N/A', 'audit', 'enabled', '', null, '2020-09-09 22:34:27');


-- tags table
        INSERT INTO bss_tag (id, category, name, alias, owner, remark, create_time, update_time) VALUES (1, 'system', 'N/A', 'default', 'admin', 'N/A', '2020-09-04 16:13:56', '2020-09-04 16:13:56');
        INSERT INTO bss_tag (id, category, name, alias, owner, remark, create_time, update_time)
        VALUES (2, 'system', 'Monitor', 'default', 'admin', 'N/A', '2020-09-04 16:13:56', '2020-09-04 16:13:56');


-- ui widget
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100000, 'system_memuse', 'Monitor', 'all', 'Memary Use', '#004d40', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/system_memuse');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100001, 'system_cpuuse', 'Monitor', 'all', 'CPU Use', '#004d40', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/system_cpuuse');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100002, 'user_total', 'Monitor', 'all', 'Normal User', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/user_total');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100003, 'user_expire', 'Monitor', 'all', 'Expire User', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/user_expire');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100004, 'user_disabled', 'Monitor', 'all', 'Disabled User', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/user_disabled');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100005, 'radius_online', 'Monitor', 'all', 'Online User', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/radius_online');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100006, 'profile_count', 'Monitor', 'all', 'Profile Count', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/profile_count');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100007, 'nas_count', 'Monitor', 'all', 'NAS Count', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/nas_count');
        INSERT INTO bss_widget (id, name, tags, levels, title, bgcolor, icon, dx, dy, type, src)
        VALUES (100008, 'ldap_count', 'Monitor', 'all', 'Ldap Nodes', '#263238', 'mdi mdi-gauge', 1, 2, 'metrics', '/bss/metrics/value/ldap_count');

-- metrics
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100000, 'Monitor', 'system_memuse', 'Memary Use', 'mdi mdi-gauge', '60.00%', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100001, 'Monitor', 'system_cpuuse', 'CPU Use', 'mdi mdi-gauge', '39.67%', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100002, 'Monitor', 'user_total', 'Normal User', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100003, 'Monitor', 'user_expire', 'Expire User', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100004, 'Monitor', 'user_disabled', 'Disabled User', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100005, 'Monitor', 'radius_online', 'Online User', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100006, 'Monitor', 'profile_count', 'Profile Count', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100007, 'Monitor', 'nas_count', 'NAS Count', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');
        INSERT INTO bss_metrics (id, tags, skey, name, icon, value, update_time) VALUES (100008, 'Monitor', 'ldap_count', 'Ldap Nodes', 'mdi mdi-gauge', '0', '2020-09-01 00:00:00');

-- dashboard
        INSERT INTO bss_dashboard (id, skey, tags, title, content)
        VALUES (1, 'dashboard-state-default', 'N/A', 'N/A', '[
  {"id": "user_total:1599202297036", "name": "user_total", "x": 2, "y": 0, "dx": 1, "dy": 2},
  {"id": "user_expire:1599202297045", "name": "user_expire", "x": 5, "y": 0, "dx": 0, "dy": 2},
  {"id": "user_disabled:1599202297053", "name": "user_disabled", "x": 3, "y": 0, "dx": 1, "dy": 2},
  {"id": "profile_count:1599202297061", "name": "profile_count", "x": 2, "y": 2, "dx": 1, "dy": 2},
  {"id": "nas_count:1599202297069", "name": "nas_count", "x": 3, "y": 2, "dx": 1, "dy": 2},
  {"id": "ldap_count:1599202297077", "name": "ldap_count", "x": 5, "y": 2, "dx": 0, "dy": 2},
  {"id": "system_memuse:1599202348621", "name": "system_memuse", "x": 0, "y": 0, "dx": 2, "dy": 2},
  {"id": "system_cpuuse:1599202348633", "name": "system_cpuuse", "x": 0, "y": 2, "dx": 2, "dy": 2},
  {"id": "user_expire:1599202577374", "name": "user_expire", "x": 4, "y": 0, "dx": 1, "dy": 2},
  {"id": "ldap_count:1599202577392", "name": "ldap_count", "x": 4, "y": 2, "dx": 1, "dy": 2}
]');


-- vpe
        INSERT INTO net_vpe (id, identifier, tags, name, ipaddr, secret, vendor_code, coa_port, status, ldap_id, remark, create_time, update_time)
        VALUES (1, 'default', 'N/A', 'default', '127.0.0.1', 'secret', '0', 3799, 'enabled', 0, 'default test nas', '2020-09-01 00:00:00', '2020-09-01 00:00:00');


-- profile
        INSERT INTO net_profile (id, tags, name, domain, addr_pool, active_num, up_rate, down_rate, limit_policy, up_limit_policy, down_limit_policy, bill_times, bill_timeunit, status, remark,
                                 create_time, update_time)
        VALUES (1, 'N/A', 'default', 'N/A', 'N/A', 1, 10240, 10240, 'N/A', 'N/A', 'N/A', 86400, 'second', 'enabled', 'default', '2020-09-01 00:00:00', '2020-09-01 00:00:00');


-- subscribe
        INSERT INTO net_subscribe (id, tags, vpe_ids, profile_id, realname, mobile, email, username, password, mfa_secret, mfa_status, domain, addr_pool, mac_addr, ip_addr, active_num, vlanid1,
                                   vlanid2, limit_policy, up_limit_policy, down_limit_policy, up_rate, down_rate, bind_mac, bind_vlan, status, remark, create_time, expire_time, update_time)
        VALUES (1, 'N/A', '', 1, 'testuser', 'N/A', 'test@greenradius.com', 'test01', '6eBulgLp6dvevOzf3/DmSA==', 'N/A', 'disabled', 'N/A', 'N/A', 'N/A', 'N/A', 10, 0, 0, 'N/A', 'N/A', 'N/A', 102400,
                102400, 0, 0, 'enabled', 'test user', '2020-09-01 00:00:00', '2040-09-01 00:00:00', '2020-09-01 00:00:00');

-- ldap
        INSERT INTO net_ldap (tags, name, address, password, searchdn, basedn, user_filter, istls, status, remark, create_time, update_time)
        VALUES ('N/A', 'default', 'ldap://127.0.0.1:389', 'j0Cfgskw+WCHENB4XqDMrA==', 'dc=example,dc=com', 'cn=readadmin,dc=example,dc=com', '(&(objectClass=organizationalPerson)(uid=%s))', 'enabled',
                'enabled', 'default ldap node', '2020-09-01 00:00:00', '2020-09-01 00:00:00');

        SET foreign_key_checks = 1;

-- ---------------------------------------------------------------------------------------------------------------------
    END IF;

END$$
delimiter ;

call greenradius_init();

DROP PROCEDURE IF EXISTS greenradius_init;