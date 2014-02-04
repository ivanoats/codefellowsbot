# A bot used for classroom channels

The bot logs the channel, and responds to 'hello' and 'help'.

## Running the bot

At present, you will need two terminal windows to get the bot running. One for running the bot:

    export CF_AWS_SECRET=your S3 access secret
    export CF_AWS_KEY=your S3 access key
    ruby -Ilib ./bin/codefellowsbot

And another for running the log uploader

    you may need to set up your secrets here, too
    bundle exec bin/cfb_uploader

I use a tmux session on a server to keep the bot alive.

## Contributing

Obviously, this is a work in progress. Please contribute pull requests via Github.

## License

Copyright 2013 Code Fellows, LLC. Open sourced with [MIT license](http://opensource.org/licenses/MIT)

