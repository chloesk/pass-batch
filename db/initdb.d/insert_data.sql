INSERT INTO package (package_name, count, period, created_at)
VALUES ('Starter PT 10 Sessions', 10, 60, '2023-12-01 00:00:00'),
       ('Starter PT 20 Sessions', 20, 120, '2023-12-01 00:00:00'),
       ('Starter PT 30 Sessions', 30, 180, '2023-12-01 00:00:00'),
       ('Free Event Pilates 1 Session', 1, NULL, '2023-12-01 00:00:00'),
       ('Body Challenge PT 4 Weeks', NULL, 28, '2023-12-01 00:00:00'),
       ('Body Challenge PT 8 Weeks', NULL, 48, '2023-12-01 00:00:00'),
       ('InBody Consultation', NULL, NULL, '2023-12-01 00:00:00');

INSERT INTO `user` (user_id, user_name, status, phone, meta, created_at)
VALUES ('A1000000', 'David Wilson', 'ACTIVE', '41611112222', NULL, '2023-12-01 00:00:00'),
       ('A1000001', 'Sarah Davis', 'ACTIVE', '41633334444', NULL, '2023-12-01 00:00:00'),
       ('A1000002', 'Emily Johnson', 'INACTIVE', '64755556666', NULL, '2023-12-01 00:00:00'),
       ('B1000010', 'Daniel Miller', 'ACTIVE', '64777778888', NULL, '2023-12-01 00:00:00'),
       ('B1000011', 'Emma Rodriguez', 'INACTIVE', '64788889999', NULL, '2023-12-01 00:00:00'),
       ('B2000000', 'James Smith', 'ACTIVE', '43799990000', NULL, '2023-12-01 00:00:00'),
       ('B2000001', 'Rachel Williams', 'ACTIVE', '43700001111', NULL, '2023-12-01 00:00:00');

INSERT INTO user_group_mapping (user_group_id, user_id, user_group_name, description, created_at)
VALUES ('GLOBAL', 'A1000000', 'Global Tech', 'Global Tech Employee Group', '2023-12-01 00:00:00'),
       ('GLOBAL', 'A1000001', 'Global Tech', 'Global Tech Employee Group', '2023-12-01 00:00:00'),
       ('GLOBAL', 'A1000002', 'Global Tech', 'Global Tech Employee Group', '2023-12-01 00:00:00'),
       ('GLOBAL', 'B1000010', 'Global Tech', 'Global Tech Employee Group', '2023-12-01 00:00:00'),
       ('GLOBAL', 'B2000000', 'Global Tech', 'Global Tech Employee Group', '2023-12-01 00:00:00'),
       ('Skyline ', 'B2000001', 'Skyline Solutions', 'Skyline Solutions Employee Group', '2023-12-01 00:00:00');