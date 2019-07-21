# FizzbuzzPhoenix

A simple application that implements the FizzBuzz Challenge

The app runs on Phoenix v1.4.9

Pre-requisites

- Elixir 1.9
- Compatible Erlang/OTP version (20 - 22)
- Bootstrap v4
- a PostGreSQL server running



To start your the server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Check your dabatase login information by editing config/config.exs
  * Prepare the dabase with `mix ecto.create` and   `mix ecto.migrate`
  * Start the app with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## FizzbuzzPhoenix API Java test client


A simple Java program is also featured in the fizzbuzz-api folder.
You can either rebuild it yourself or use the pre compiled jar file in the target subfolder.

To use it, simply run `java -jar fizzbuzz-api-0.0.1-SNAPSHOT-shaded.jar --[options]`

The available options are as follow : 

- "--get_page $value" : to get a specific page from the FizzBuzz app
- "--get_page $value --page_size $value" : to get a specific page from the FizzBuzz app with a specific size
- "--favourite $value" : to set a number as favourite
- "--unset_favourite $value" : to unset a number as favourite

Please note that all http requests are done to http://localhost:4000