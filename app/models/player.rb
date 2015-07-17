class Player < ActiveRecord::Base

	before_save :downcase_players
	before_save :mod_champ_save

	require 'riotapi'

	# returns the player id
	def self.return_id(name)
		api = RiotApi.new
		info = api.get_summoner_id(name)
		info[name]["id"]
	end

	# return a list of champions a given summoner has played in ranked
	def self.return_summoner_champion_list(name)
		id = return_id(name)
		api = RiotApi.new
		full_stat = api.get_full_stats(id)
		full_stat["champions"]

	end

	# get the champion ID given the champion name
	def self.get_champion_id(champ_name)
		api = RiotApi.new
		champs = api.get_champion
		champs["data"][champ_name]["id"]

	end

	# see if a summoner has played with a given champion in ranked
	def self.determine_champion_probability(player_name, champ_name)

		champion_ids = return_summoner_champion_list(player_name).collect{|player| player["id"]}
		desired_champ_id = get_champion_id(champ_name)
		winrate = 0.0

		if champion_ids.include?(desired_champ_id)

			# get the desired champion array location
			hash = Hash[champion_ids.map.with_index.to_a]
			champ_array_location = hash[desired_champ_id]

			# calculate winrate
			player_stat = return_summoner_champion_list(player_name)[champ_array_location]["stats"]
			total_played = player_stat["totalSessionsPlayed"]
			total_won = player_stat["totalSessionsWon"]

			winrate = (total_won.to_f / total_played.to_f)
			winrate.round(2)

		else
			winrate = 0.5
		end

	end



	#downcase the players name before saving
	def downcase_players
		self.p1.downcase!


	end

	#modifies champion name before saving to the databse
	def mod_champ_save
		#downcase all letters
		#split the word first. capitalize each individual word. Join them back with no spaces in between. 
		self.c1 = c1.split.map(&:capitalize).join('')


	end
end
