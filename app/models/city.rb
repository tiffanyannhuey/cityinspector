class City < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
end
