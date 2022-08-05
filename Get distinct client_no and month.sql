USE PALDBdev;
--[月次テーブル]10倍ダミーデータの重複しない[クライアントＮＯオリジナル],[クライアントＮＯ],[対象月]の組み合わせを抽出する

--[クライアントＮＯ]が2232(富士薬品)と2237(中部薬品)のデータに絞る
WITH monthly_table_fuji_chubu AS(
    SELECT
        [作成日時]
        ,[クライアントＮＯ] as クライアントＮＯオリジナル
        ,cast([クライアントＮＯ] as int) as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM [dbo].[月次テーブル]
    WHERE [クライアントＮＯ] in('2232','2237')
),
--monthly_table_fuji_chubuを10倍にする(クライアントＮＯだけ変える)
monthly_table_fuji_chubu_10_times AS(
    SELECT * FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 1000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 2000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 3000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 4000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 5000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 6000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 7000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 8000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu

    union all

    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,[クライアントＮＯ] + 9000  as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu
),
--monthly_table_fuji_chubu_10_timesのクライアントＮＯのint型をvarchar型に変換する
monthly_table_dummy_data　AS(
    SELECT
        [作成日時]
        ,[クライアントＮＯオリジナル]
        ,cast([クライアントＮＯ] as varchar) as クライアントＮＯ
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM monthly_table_fuji_chubu_10_times
)
--重複しない[クライアントＮＯオリジナル],[クライアントＮＯ],[対象月]の組み合わせを抽出する
SELECT DISTINCT [クライアントＮＯオリジナル],[クライアントＮＯ],[対象月] FROM monthly_table_dummy_data;