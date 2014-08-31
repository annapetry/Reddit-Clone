class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|

      t.timestamps
    end
  end
end
