# markovejnovic.com

This repository is a Jekyll website hosting the website at
[markovejnovic.com](https://markovejnovic.com).

## Building

This website requires a valid [Spotify
Token](https://developer.spotify.com/console/get-current-user-top-artists-and-tracks)
in `_config.yml`.

If this value is `env`, then you can specify the token via environment
variables.

After the token is correctly set, you can use:

```bash
SPOTIFY_TOKEN='my-token' jekyll build
```
