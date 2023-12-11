CREATE TABLE `package`
(
    `package_seq`  int         NOT NULL AUTO_INCREMENT COMMENT 'Package Sequence Number',
    `package_name` varchar(50) NOT NULL COMMENT 'Package Name',
    `count`        int                  DEFAULT NULL COMMENT 'Number of Passes, Unlimited if NULL',
    `period`       int                  DEFAULT NULL COMMENT 'Duration (Days), Unlimited if NULL',
    `created_at`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at`  timestamp            DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`package_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Package';

CREATE TABLE `pass`
(
    `pass_seq`        int         NOT NULL AUTO_INCREMENT COMMENT 'Pass Sequence Number',
    `package_seq`     int         NOT NULL COMMENT 'Package Sequence Number',
    `user_id`         varchar(20) NOT NULL COMMENT 'User ID',
    `status`          varchar(10) NOT NULL COMMENT 'Status',
    `remaining_count` int                  DEFAULT NULL COMMENT 'Remaining Pass Count, Unlimited if NULL',
    `started_at`      timestamp   NOT NULL COMMENT 'Start Date and Time',
    `ended_at`        timestamp            DEFAULT NULL COMMENT 'End Date and Time, Unlimited if NULL',
    `expired_at`      timestamp            DEFAULT NULL COMMENT 'Expiration Date and Time',
    `created_at`      timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at`     timestamp            DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`pass_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Pass';

CREATE TABLE `bulk_pass`
(
    `bulk_pass_seq`   int         NOT NULL AUTO_INCREMENT COMMENT 'Bulk Pass Sequence Number',
    `package_seq`     int         NOT NULL COMMENT 'Package Sequence Number',
    `user_group_id`   varchar(20) NOT NULL COMMENT 'User Group ID',
    `status`          varchar(10) NOT NULL COMMENT 'Status',
    `count`           int                  DEFAULT NULL COMMENT 'Number of Passes, Unlimited if NULL',
    `started_at`      timestamp   NOT NULL COMMENT 'Start Date and Time',
    `ended_at`        timestamp            DEFAULT NULL COMMENT 'End Date and Time, Unlimited if NULL',
    `created_at`      timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at`     timestamp            DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`bulk_pass_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Bulk Pass, for issuing passes to multiple users';

CREATE TABLE `booking`
(
    `booking_seq`  int         NOT NULL AUTO_INCREMENT COMMENT 'Booking Sequence Number',
    `pass_seq`     int         NOT NULL COMMENT 'Pass Sequence Number',
    `user_id`      varchar(20) NOT NULL COMMENT 'User ID',
    `status`       varchar(10) NOT NULL COMMENT 'Status',
    `used_pass`    tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Pass Usage Status',
    `attended`     tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Attendance Status',
    `started_at`   timestamp   NOT NULL COMMENT 'Start Date and Time',
    `ended_at`     timestamp   NOT NULL COMMENT 'End Date and Time',
    `cancelled_at` timestamp            DEFAULT NULL COMMENT 'Cancellation Date and Time',
    `created_at`   timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at`  timestamp            DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`booking_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Booking';

CREATE TABLE `user`
(
    `user_id`     varchar(20) NOT NULL COMMENT 'User ID',
    `user_name`   varchar(50) NOT NULL COMMENT 'User Name',
    `status`      varchar(10) NOT NULL COMMENT 'Status',
    `phone`       varchar(50)          DEFAULT NULL COMMENT 'Contact Number',
    `meta`        TEXT                 DEFAULT NULL COMMENT 'Meta Information, JSON',
    `created_at`  timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at` timestamp            DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User';

CREATE TABLE `user_group_mapping`
(
    `user_group_id`   varchar(20) NOT NULL COMMENT 'User Group ID',
    `user_id`         varchar(20) NOT NULL COMMENT 'User ID',
    `user_group_name` varchar(50) NOT NULL COMMENT 'User Group Name',
    `description`     varchar(50) NOT NULL COMMENT 'Description',
    `created_at`      timestamp   NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at`     timestamp            DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`user_group_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='User Group Mapping';

CREATE TABLE `notification`
(
    `notification_seq` int           NOT NULL AUTO_INCREMENT COMMENT 'Notification Sequence Number',
    `uuid`             varchar(20)   NOT NULL COMMENT 'User UUID',
    `event`            varchar(10)   NOT NULL COMMENT 'Event',
    `text`             varchar(1000) NOT NULL COMMENT 'Notification Content',
    `sent`             tinyint(1)    NOT NULL DEFAULT '0' COMMENT 'Sent Status',
    `sent_at`          timestamp              DEFAULT NULL COMMENT 'Sent Date and Time',
    `created_at`       timestamp     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Creation Date and Time',
    `modified_at`      timestamp              DEFAULT NULL COMMENT 'Modification Date and Time',
    PRIMARY KEY (`notification_seq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Notification';

CREATE TABLE `statistics`
(
    `statistics_seq`      int       NOT NULL AUTO_INCREMENT COMMENT 'Statistics Sequence Number',
    `statistics_at`       timestamp NOT NULL COMMENT 'Statistics Date and Time',
    `all_count`           int       NOT NULL DEFAULT 0 COMMENT 'Total Count',
    `attended_count`      int       NOT NULL DEFAULT 0 COMMENT 'Attendance Count',
    `cancelled_count`     int       NOT NULL DEFAULT 0 COMMENT 'Cancellation Count',
    PRIMARY KEY (`statistics_seq`),
    INDEX idx_statistics_at (`statistics_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Statistics';
