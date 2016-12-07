defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic
  # like class inheritance. Imports a ton of stuff from Discuss.Web.ex/controller

  def new(conn, params) do
    # IO.puts "++++"
    # IO.inspect conn #The focus of Phoenix. CONN IS AWESOME
    # IO.puts "++++"
    # IO.inspect params #Help us parse the URL.
    # IO.puts "++++"

    struct = %Topic{}
    params = %{}
    changeset = Topic.changeset(struct, params)
    render conn, "new.html", changeset: changeset
  end
end