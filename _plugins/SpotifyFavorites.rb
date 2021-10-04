require 'uri'
require 'net/http'
require 'json'

module SpotifyFavorites
  class SpotifyFavoritesGenerator < Jekyll::Generator
    def generate(site)
      Jekyll.logger.info "SpotifyFavorites:", "Fetching Favorites"

      count = Jekyll.configuration({})['spotify-favorites']['count']
      time_range = Jekyll.configuration({})['spotify-favorites']['time_range']
      uri = URI("https://api.spotify.com/v1/me/top/artists?limit=#{count}&time_range=#{time_range}")
      req = Net::HTTP::Get.new(uri)
      req['Accept'] = 'application/json'
      req['Content-Type'] = 'application/json'
      token = Jekyll.configuration({})['spotify-favorites']['token']
      if token == 'env'
        token = ENV['SPOTIFY_TOKEN']
      end
      req['Authorization'] = "Bearer #{token}"

      res = Net::HTTP.start(uri.hostname, uri.port, :use_ssl => true) {|http|
        http.request(req)
      }

      if not res.is_a?(Net::HTTPSuccess)
        Jekyll.logger.error "SpotifyFavorites:" \
          "Invalid Status Received #{res.code}. \nResponse: #{res}" 
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
