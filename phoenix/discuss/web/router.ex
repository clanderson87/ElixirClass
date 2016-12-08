defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Discuss do
    pipe_through :browser # Use the default browser stack

    get "/", TopicController, :index
    # this line is broken up into 4 parts.
    #   whenever someone does a 'get' HTTP request
    #   to the "/" route
    #   find to the TopicController module
    #   and run the index method
    get "/topics/new", TopicController, :new
    post "/topics", TopicController, :create
    get "/topis/:id/edit" TopicController :edit
    # :id is a wildcard matcher. it needs to match the text passed into the 
    # params map in the corresponding controller method (in this case, :edit)
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
