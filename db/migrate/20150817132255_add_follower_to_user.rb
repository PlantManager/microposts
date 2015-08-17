class AddFollowerToUser < ActiveRecord::Migration
  def change
    add_reference :users, :followers, index: true, foreign_key: true
  end
end
