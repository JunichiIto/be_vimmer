[![Build Status](https://travis-ci.org/JunichiIto/be_vimmer.svg?branch=master)](https://travis-ci.org/JunichiIto/be_vimmer)

## About Be Vimmer

Be Vimmer is an application that tweets Vim commands and their description periodically in Japanese, English and Chinese(cn & tw). This application was created in order to help Vim learners.


Vim documentation has to be stored in database in advance. (See  `db/seeds.rb` or `lib/tasks` )


Tweets are pushed via cron task on server.(See `lib/tasks/cron.rb` ) You need to register Twitter credentials in environment variables (for local `config/settings.local.yml`) before execution.


The Web UI just display the Vim command list and the basic information about this application.


### Cron task and arguments

The following command means "Post 3 tweets every 2 hours in Japanese. EX commands appear every 6 hours." 


    rake 'cron[jp,2,3,6]'


"en" is English, "cn" is Chinese(cn) and "tw" is Chinese(tw).


### How to get OAuth token

Use this => https://github.com/jugyo/get-twitter-oauth-token