class RoundsController < ApplicationController

  def create
    @deck = Deck.find(params[:deck_id])
    @round = @deck.rounds.create(deck_id: @deck.id, user_id: current_user.id)
    session[:round_id] = @round.id
    redirect_to deck_round_path(@deck, @round)
  end

  def show
    @round = Round.find(params[:id])
    if !@round.all_donesies?
      @wrong_answer = @round.supply_answer
      @card = @round.prepare_card
    end
  end


  def new_guess
    @round = Round.find(session[:round_id])
    @card = Card.find(params[:card_id])
    @guess = Guess.create(:round_id => session[:round_id],   :card_id => params[:card_id])

    p "*****"
    p @round
    p "******"
    p card
    p "*****"
    p @guess

    if card.answer.downcase == params[:response].downcase
      @guess.is_correct = true
      @guess.save
    end
    redirect "/rounds/#{session[:round_id]}"
   end

end