[![Build Status](https://travis-ci.org/JunichiIto/be_vimmer.svg?branch=master)](https://travis-ci.org/JunichiIto/be_vimmer)

## 關於 Be Vimmer

Be Vimmer 是一個可定期在 Twitter 上發佈 Vim 指令及相關敘述 (日文、英文、簡體中文及繁體中文) 的應用程式，以於幫助 Vim 初學者。


Vim 文件必須先儲存在資料庫中。(詳見 `db/seeds.rb` 或 `lib/tasks`)


推文將會在 server 上以 cron 任務的方式進行發佈。 (詳見 `lib/tasks/cron.rb`) 在執行此應用程式前，使用者需先將註冊的推特 (Twitter) 資訊設定在環境變數中。


網路介面將會顯示 Vim 指令清單及此應用程式相關訊息。


### Cron 任務與參數設定

下列指令說明：每隔兩小時以日文發佈三則推文。EX 指令每六小時出現一次。


    rake cron["jp","2","3","6"]


「en」即英文，「cn」表示簡體中文，而「tw」表示繁體中文。


### 如何取得 OAuth token

請參考 => https://github.com/jugyo/get-twitter-oauth-token
