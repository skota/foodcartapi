# Foodcartapi
Foodcartapi is your goto api for fetchnig information about foodtruck vendors in San Fransisco.


## About the app
We are using a csv file to populate food truck data into the app. In this app we are not using a database, all data is read from csv file and stored iside an Agent.

Inside the Agent start_link we read the csv data and store it as agent state. This approach enables us to start the Phoenixapp with the food truck data loaded in memory and available for use.

Given sufficient time, I could have built this a LiveView app that reads truck data via datasf.org provided public api's and show food truck locations on a map.

Another useful feature i would consider is posting on social media when food truck shows up at a specific location. Push notifications to mobile devices is also a compelling feature.

Regarding storage, i would probably cosider storing data into ETS/Mnesia or Postgres.

Processing data from the csv file or api and storing in a relational database would also make querying easier and more useful.

Currently the api endpoints are publicly acessible. It is recommended some kind of rate limiting be added to the app to prevent DDOS attack. Something like Hammer might fit the bill.

Also to ensure only verified users are accessing the api, i would consider adding an auth mechanism using Guardian in conjunction with Phx gen auth to allow users to access  the api with valid JWT tokens sent as bearer tokens in request headers.

PLugs can be written that enforce this in pipeline.


## To get started
Foodcartapi is an Phoenixframework app. To get started ensure elixir, erlang and phoenix are istalled. Refer to this link https://www.phoenixframework.org/ for instructions.

Once Phoenix is installed

  * Clone the repo
  * Create a folder (csv) inside priv. The folder should be /priv/csv
  * Copy  Mobile_Food_Facility_Permit.csv into priv/csv
  * run "mix deps.get" to install dependencies.
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

## Using the api
Once the app is started by running "mix phx.server" you can use a tool like postman to make calls. For example, to see the list of food trucks in zipcode 28853 make a GET request to this endpoint - http://localhost:4000/api/vendores/28853

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
