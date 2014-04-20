class DecksController < ApplicationController
  def index
    @decks = Deck.all
  end

  def new
    @deck = Deck.new
  end

  def create
    @deck = Deck.new(deck_params)
    if @deck.save
      redirect_to decks_url, notice: "Deck successfully Created"
    else
      render :new
    end
  end

  def show
    @deck = set_deck
    @cards = @deck.cards
  end

  def edit
    @deck = set_deck
  end

  def update
    @deck = set_deck
    @deck.update(deck_params)
    redirect_to @deck, notice: "Deck successfully updated"
  end

  def destroy
    @deck = set_deck
    if @deck.destroy
      redirect_to decks_url, notice: "Deck successfully destroyed"
    else
      render @deck
    end
  end
 
  private

  def deck_params
    params.require(:deck).permit(:name)
  end

  def set_deck
    @deck = Deck.find(params[:id])
  end

end
