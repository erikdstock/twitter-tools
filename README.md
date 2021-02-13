# Twitter Tools

This is a set of scripts copied from other repositories and adjusted to use a standard interface (basically api tokens in your ENV). The rest of this README is copied from both of them:

- [TwitterDelete](https://github.com/MikeMcQuaid/TwitterDelete) - delete your old tweets
- [Twitter-Unfollow](https://github.com/KrauseFx/twitter-unfollow) - unfollow everyone and move them into a list

### Disclaimer

This repo contains tools I've cobbled together for personal use. Following these directions correctly will permanently change your twitter account and requires creating and handling sensitive twitter developer credentials. Probably best to not use this if you don't know what you are doing.

### Usage:

To set up locally:

1. Clone this repository and run `bundle install`
2. Create a `.env` file: `cp .env.example .env`
3. Create a personal twitter app from https://apps.twitter.com and fill in the values in your new `.env` file:

```bash
TWITTER_CONSUMER_KEY=...
TWITTER_CONSUMER_SECRET=...
TWITTER_ACCESS_TOKEN=...
TWITTER_ACCESS_TOKEN_SECRET=...
```

#### delete tweets:

This repo is a personal tool so I won't be responding to support requests. These scripts assume some confidence or knowledge of ruby programming. Use at your own risk. For more details see the respository this code is drawn from at [MikeMcQuaid/TwitterDelete](https://github.com/MikeMcQuaid/TwitterDelete).

```
$ bundle exec twitter_delete.rb --help
Options:
  -f, --force          Actually delete/unlike/unretweet tweets
  -u, --user=<s>       The Twitter username to purge (default: erikdstock)
  -a, --archive=<s>    Twitter archive tweet.js file
  -d, --days=<i>       Keep tweets/likes under this many days old (default: 28)
  -o, --olds=<i>       Keep tweets/likes more than this many days old (default: 9999)
  -r, --rts=<i>        Keep tweet with this many retweets (default: 5)
  -v, --favs=<i>       Keep tweets with this many likes (default: 5)
  -t, --test           Load TwitterDelete and immediately exit
  -h, --help           Show this message
```

#### Unfollow everyone:

Again, see [KraseFx/twitter-unfollow](https://github.com/KrauseFx/twitter-unfollow) for more details.

- Make sure to have DMs open to still be able to chat with your friends.
- Use a list to follow a small subset of people. This way you follow 0 people and nobody feels left out. The list can be private.
- Make sure to create a list called "Old Follows"

```bash
bundle install
bundle exec unfollow.rb
```

If you fork this PR you can also used the [GitHub Actions scheduled workflow](https://github.com/MikeMcQuaid/TwitterDelete/blob/master/.github/workflows/scheduled.yml) combined with secrets on your fork to run this automatically.

### Licenses

- TwitterDelete is licensed under the [AGPLv3 License](https://en.wikipedia.org/wiki/Affero_General_Public_License). The full license text is available in [LICENSE.txt](https://github.com/mikemcquaid/TwitterDelete/blob/master/LICENSE.txt).
- twitter-unfollow is licensed under the [MIT License](https://github.com/KrauseFx/twitter-unfollow/blob/3cd59ba88a3484a5a1247ca5202197d654db3c55/LICENSE)
