class CreateApiInterfaces < ActiveRecord::Migration[5.1]
  def change
    create_table :api_interfaces do |t|

      t.timestamps
    end
  end
end
