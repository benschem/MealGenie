require "rails_helper"

RSpec.describe "Routes for Meals", type: :routing do
  it "routes /meals to the meals controller, index action" do
    expect(get("/meals")).to route_to("meals#index")
  end

  it "routes /meals/:id to the meals controller, show action" do
    expect(get("/meals/:id")).to route_to("meals#show")
  end
end
