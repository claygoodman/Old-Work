SELECT
cfg.name AS [Name],
cfg.configuration_id AS [Number],
cfg.minimum AS [Minimum],
cfg.maximum AS [Maximum],
cfg.is_dynamic AS [Dynamic],
cfg.is_advanced AS [Advanced],
cfg.value AS [ConfigValue],
cfg.value_in_use AS [RunValue],
cfg.description AS [Description]
FROM
sys.configurations AS cfg