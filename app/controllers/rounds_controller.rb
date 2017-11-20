class RoundsController < ApplicationController

  def create
    @deck = Deck.find(params[:deck_id])
    @round = @deck.rounds.create(deck_id: @deck.id, user_id: current_user.id)
    redirect_to deck_round_path(@deck, @round)
  end

  def show
    @round = Round.find(params[:id])
  end


end