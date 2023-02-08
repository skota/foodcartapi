defmodule Foodcartapi.Agents.VendorData do
  use Agent

  def start_link([]) do
    # initialize agent with data from csv
    data = parse_csv()
    Agent.start_link(fn -> data end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def parse_csv() do
    Path.join([:code.priv_dir(:foodcartapi),"csv","Mobile_Food_Facility_Permit.csv"])
      |> File.read!()
      |> String.split("\n")
      |> Enum.with_index(fn line, index ->
          if index > 0 do
            IO.inspect line
            items = String.split(line, ",")
            %{
                "location" => Enum.at(items,0),
                "applicant" => Enum.at(items, 1),
                "facility_type" => Enum.at(items,2),
                "location_description" => Enum.at(items,4),
                "address" => Enum.at(items,5),
                "permit_number" => Enum.at(items, 9),
                "status" => Enum.at(items, 10),
                "food_items" => Enum.at(items, 11),
                "zipcode" =>Enum.at(items, 28)
            }
          end
      end)
      |> Enum.reject(fn x -> is_nil(x) end)
  end
end
