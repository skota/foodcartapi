defmodule FoodcartapiWeb.Api.VendorTest do
  use FoodcartapiWeb.ConnCase

  test "calling api with valid zipcode returns list of vendors",%{conn: conn} do
    zipcode = "28853"
    conn = get(conn, "/api/vendors/#{zipcode}")

    assert json_response(conn, 200) != []
  end

  test "calling api with invalid zip returns empty list", %{conn: conn} do
    zipcode = "12"
    conn = get(conn, "/api/vendors/#{zipcode}")
    assert json_response(conn, 200) == []
  end

end
