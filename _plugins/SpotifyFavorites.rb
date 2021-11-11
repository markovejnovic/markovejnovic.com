require 'uri'
require 'net/http'
require 'json'

module SpotifyFavorites
  class SpotifyFavoritesGenerator < Jekyll::Generator
    def auth(token)
      Jekyll.logger.info "SpotifyFavorites:", "Authorizing with Spotify."

      if token == 'env'
        token = ENV['SPOTIFY_TOKEN']
      end

      return token # TODO: Remove

      auth_url = URI.parse("https://accounts.spotify.com/api/token")

      http = Net::HTTP.new(auth_url.host, auth_url.port)
      http.use_ssl = true
      req = Net::HTTP::Post.new(auth_url.path)
      req['Authorization'] = "Basic #{token}"
      req['Content-Type'] = 'application/x-www-form-urlencoded'
      req.set_form_data({ 'grant_type' => 'client_credentials' })
      res = http.request(req)

      if not res.is_a?(Net::HTTPSuccess)
        Jekyll.logger.error 'SpotifyFavorites:' \
          "Could Not Authenticate: #{res.code}.\nResponse: #{res.message}"
        exit
      end

      return JSON.parse(res.body)['access_token']
    end

    def generate(site)
      Jekyll.logger.info "SpotifyFavorites:", "Fetching Favorites"

      spotify_token = Jekyll.configuration({})['spotify-favorites']['token']
      auth_token = auth(spotify_token)

      count = Jekyll.configuration({})['spotify-favorites']['count']
      time_range = Jekyll.configuration({})['spotify-favorites']['time_range']
      uri = URI("https://api.spotify.com/v1/me/top/artists?limit=#{count}&time_range=#{time_range}")
      req = Net::HTTP::Get.new(uri)
      req['Accept'] = 'application/json'
      req['Content-Type'] = 'application/json'
      req['Authorization'] = "Bearer #{auth_token}"

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) {|http|
        http.request(req)
      }

      if not res.is_a?(Net::HTTPSuccess)
        Jekyll.logger.error "SpotifyFavorites:" \
          "Invalid Status Received #{res.code}. \nResponse: #{res.message}" 
        exit
      end
      
      site.data['spotify_favorites'] = JSON.parse(res.body)
      site.data['spotify_favorites']['items'] = \
        site.data['spotify_favorites']['items'].sort_by {
          |artist| artist['popularity'].to_i
        }.reverse
      Jekyll.logger.info "SpotifyFavorites:" "Successfully Fetched Favorites." 
    end
  end
end
