require 'httparty'
require 'uri'


class RiotApi

	BASE_URL = "https://na.api.pvp.net"
	API_KEY = "?api_key=4ac9d17c-8e89-44d9-99cd-cb806bd078b9"

	def get_summoner_id(name)
		summoner_url = "#{BASE_URL}/api/lol/na/v1.4/summoner/by-name/#{name}#{API_KEY}" 
		parse_json(summoner_url)
	end

	def get_full_stats(id)
		stat_url = "#{BASE_URL}/api/lol/na/v1.3/stats/by-summoner/#{id}/ranked#{API_KEY}" 
		parse_json(stat_url)
	end

	def get_champion
		champion_url = "#{BASE_URL}/api/lol/static-data/na/v1.2/champion#{API_KEY}"
		parse_json(champion_url)
	end

	def parse_json(url)
		response = HTTParty.get(url)
		json = JSON.parse(response.body)
		json
	end
end