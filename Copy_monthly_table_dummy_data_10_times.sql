USE PALDBdev;
--[月次テーブル]ダミーデータ作成

DECLARE @クライアントＮＯオリジナル Int = CONVERT(INT,@{item().クライアントＮＯオリジナル});
DECLARE @クライアントＮＯ Int = CONVERT(INT,@{item().クライアントＮＯ});
DECLARE @対象月 INT = CONVERT(INT, @{item().対象月});

--[クライアントＮＯ],[対象月]を指定する
--[クライアントＮＯ]は2232(富士薬品)か2237(中部薬品)のデータを使う
WITH monthly_table_fuji_chubu AS(
    SELECT
        [作成日時]
        ,[クライアントＮＯ]
        ,[ユーザＩＤ]
        ,[sub優先順位]
        ,[クーポン配布期間終了]
        ,[クーポンＩＤ]
        ,[対象月]
        ,[クーポン配布期間開始]
        ,[優先順位]
    FROM [dbo].[月次テーブル]
    WHERE [クライアントＮＯ] = @クライアントＮＯオリジナル AND [対象月] = @対象月
)
--[クライアントＮＯ]を変更する
SELECT
    [作成日時]
    ,cast(@クライアントＮＯ as varchar) as クライアントＮＯ
    ,[ユーザＩＤ]
    ,[sub優先順位]
    ,[クーポン配布期間終了]
    ,[クーポンＩＤ]
    ,[対象月]
    ,[クーポン配布期間開始]
    ,[優先順位]
FROM monthly_table_fuji_chubu