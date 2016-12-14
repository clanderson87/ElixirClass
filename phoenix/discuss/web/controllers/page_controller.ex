defmodule Discuss.PageController do
  use Discuss.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
    # this says whenever a user calls the :index method,
    # send them back our index.html page from the corresponding template directory 
    # the names of our controllers, templates and views matters
  end
end
