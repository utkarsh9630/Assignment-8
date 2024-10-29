WITH __dbt__cte__user_session_channel as (
SELECT
userId,
sessionId,
channel
FROM dev.raw_data.user_session_channel
), __dbt__cte__session_timestamp as (
SELECT
sessionId,
ts
FROM dev.raw_data.session_timestamp
), u AS (
SELECT * FROM __dbt__cte__user_session_channel
), st AS (
SELECT * FROM __dbt__cte__session_timestamp
)
SELECT u.userId, u.sessionId, u.channel, st.ts
FROM u
JOIN st ON u.sessionId = st.sessionId