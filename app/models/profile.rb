class Profile < ApplicationRecord

  with_options presence: true do
    validates :customer_last_name
    validates :customer_first_name
    validates :customer_occupation
    validates :position
  end

  belongs_to :schedule

end
