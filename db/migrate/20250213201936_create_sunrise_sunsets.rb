class CreateSunriseSunsets < ActiveRecord::Migration[8.0]
  def change
    create_table :sunrise_sunsets do |t|
      t.string :location
      t.date :date
      t.string :sunrise
      t.string :sunset
      t.string :golden_hour

      t.timestamps
    end
  end
end
