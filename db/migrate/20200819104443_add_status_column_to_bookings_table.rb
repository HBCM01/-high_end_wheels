class AddStatusColumnToBookingsTable < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :boolean, default: false
  end
end
