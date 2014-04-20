class AddDeckRefToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :deck, index: true
  end
end
