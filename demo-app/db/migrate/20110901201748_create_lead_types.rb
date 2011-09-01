class CreateLeadTypes < ActiveRecord::Migration
  def change
    create_table :lead_types do |t|

      t.timestamps
    end
  end
end
