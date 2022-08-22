class Employment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :person
  validates_presence_of :employer, :date_started, :date_ended
end
