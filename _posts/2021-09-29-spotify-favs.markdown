---
title: "Jekyll Spotify Favorites"
date: 2021-09-29T00:00:00-05:00
categories: projects software
description: "Automatically Fetch Your Spotify Favorites into Jekyll."
layout: post
---

On the [about](/about) page of this website you can find a showcase of music I
am currently listening to. Due to the fact that I want to keep this website lean
and fast, no JavaScript is used, so this is evaluated at compile-time.

In order to achieve this I wrote a dumb simple 36-line plugin for Jekyll. The
generator will automatically fetch data from Spotify's API and store it in
`site.data.spotify_favorites`. These will be sorted by popularity (highest
first).

## Configuration

To get this to work you need to do the following configuration in `_config.yml`:

```yaml
spotify-favorites:
  count: 3
  time_range: 'short_term'
  token: 'your-token'
```

See [Spotify's Official Docs](https://developer.spotify.com/console/get-current-user-top-artists-and-tracks) for what these refer to.

## Usage

You now need to restart the server. This will expose
`site.data.spotify_favorites`. You can iterate through it with something like:
{% raw %}
```liquid
{% for artist in
  site.data.spotify_favorites.items
%}
<h1>{{ artist.name }}</h1>
<h2>{{ artist.genres[0] }}</h2>

{% endfor %}
```
{% endraw %}

For available fields, refer to [Spotify's Official
Docs](https://developer.spotify.com/console/get-current-user-top-artists-and-tracks).

## Source Code

Currently, this isn't a Gem, so it exists as a small single-file plugin in [my
website](https://www.github.com/markovejnovic/markovejnovic.com) licensed under
[APGPLv3](https://www.github.com/markovejnovic/markovejnovic.com/blob/main/LICENSE).
