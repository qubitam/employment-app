class Employment < ApplicationRecord
  belongs_to :person
  validates_presence_of :employer, :date_started, :date_ended
end
