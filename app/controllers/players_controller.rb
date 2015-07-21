class PlayersController < ApplicationController

	require 'riotapi'

	def index
		
	end

	def create
		@player = Player.new(players_params)
		@player.save
		redirect_to @player
	end

	def show
		@player = Player.find(params[:id])


	end

	private

	def players_params
		params.require(:player).permit(:p1, :p2, :p3, :p4, :p5, :c1, :c2, :c3, :c4, :c5)
	end

end
