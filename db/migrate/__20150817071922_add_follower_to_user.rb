class AddFollowerToUser < ActiveRecord::Migration
  def change
    add_reference :users, :follower, index: true #, foreign_key: true
  end
end
