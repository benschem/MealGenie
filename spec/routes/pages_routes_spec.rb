require "rails_helper"

RSpec.describe "Routes for Pages", type: :routing do
  it "routes root to the pages controller, home action" do
    expect(get("/")).to route_to("pages#home")
  end
end
