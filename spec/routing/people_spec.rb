require "rails_helper"

RSpec.describe PeopleController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/").to route_to("people#index")
    end
  end
end
