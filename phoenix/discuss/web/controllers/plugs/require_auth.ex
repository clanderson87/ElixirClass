defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias Discuss.Router.Helpers
  
  def init(_params) do
    #required to define this function by the Plugs contract. can be blank.
    #called once per lifetime of app, on startup.
  end

  def call(conn, _params) do
    # called everytime the plug is called.
    # _params is whatever comes from init. if init is blank, params needs to be _params
    if conn.assigns[:user] do
      #if statements are good IFF you need to see if something is nil or !nil, but the pattern matching would be outrageous.
      conn
    else
      conn
      |> put_flash(:error, "you must be logged in to do that!")
      |> redirect(to: Helpers.topic_path(conn, :index)) # 
      |> halt() # force stops in the pipeline instead of passes this down elsewhere.
    end
  end
end 