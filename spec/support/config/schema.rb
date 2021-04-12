# frozen_string_literal: true

ActiveRecord::Base.time_zone_aware_attributes = true
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:',
  encoding: 'utf8',
  pool: 5,
  timeout: 5000,
  verbosity: 'quiet'
)

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define(version: 1) do
  create_table :credit_cards, force: true do |t|
    t.string :encrypted_name
    t.string :encrypted_number
    t.timestamps null: false
  end
end
