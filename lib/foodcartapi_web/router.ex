defmodule FoodcartapiWeb.Router do
  use FoodcartapiWeb, :router

  # we should probably protect against DDOS by utilizing a rate limiting plugin
  # we should also consider checking for an api key in headers to ensure verified users are accessing
  # api

  pipeline :api do
    plug :accepts, ["json"]
  end



  scope "/api", FoodcartapiWeb do
    pipe_through :api

    get "/vendors/:zipcode", Api.VendorController, :get_by_zipcode

  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:foodcartapi, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: FoodcartapiWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
