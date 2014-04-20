class CardsController < ApplicationController

  before_action :find_deck
  def new
    @card = @deck.cards.new
  end

  def show
    @card = find_card
  end

  def create
    @card = @deck.cards.new(cards_params)
    if @card.save
      redirect_to @deck, notice: "Card successfully created"
    else
      render :new
    end
  end 

  def edit 
    @card = find_card
  end

  def update
    @card = find_card
    if @card.update(cards_params)
      redirect_to @deck, notice: "Card successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @card = find_card
    @card.destroy
    redirect_to @deck, notice: "Card sucessfully destroyed"
  end


  private

  def find_deck
    @deck = Deck.find(params[:deck_id])
  end

  def find_card
    @card = @deck.cards.find(params[:id])
  end

  def cards_params
    params.require(:card).permit(:front, :back)
  end

end