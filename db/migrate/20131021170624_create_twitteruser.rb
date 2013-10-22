class CreateTwitteruser < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :username
    end
  end
end
