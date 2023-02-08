defmodule FoodcartapiWeb.Api.VendorController do
  use FoodcartapiWeb, :controller
  alias Foodcartapi.Vendors

  def get_by_zipcode(conn, %{"zipcode" => zipcode}) do
    data = Vendors.get_by_zipcode(zipcode)
    conn
      |> put_status(200)
      |> json(data)
  end
end
