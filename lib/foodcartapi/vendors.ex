defmodule Foodcartapi.Vendors do
  alias Foodcartapi.Agents.VendorData
  # since we are not using a database, we store the data from the csv inside an Agent
  # and read from it whenever we need to

  def get_by_zipcode(zipcode) do
    VendorData.value()
    |> Enum.reject(fn x ->
      if x["zipcode"] != zipcode do
        x
      end
    end)
  end

  # add functions to fetch data based on other parameters lke cusine type, cart type etc

end
