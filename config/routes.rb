Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      get "/retrieve", to: "retrieves#retrieve"
    end
  end
end
