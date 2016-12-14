defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Discuss.Plugs.SetUser
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
    # get "/topics/new", TopicController, :new
    # post "/topics", TopicController, :create
    # get "/topic/:id/edit", TopicController, :edit
    # :id is a wildcard matcher. it needs to match the text passed into the 
    # params map in the corresponding controller method (in this case, :edit)
    # put "/topics/:id", TopicController, :update
    # delete "/topics/:id", TopicController, :delete

    resources "/", TopicController #if restful conventions are followed, this automates all the routes for this controller
    # based upon the type of request and info that has been provided
  end

  #scopes are ways to namespace your urls
  scope "/auth", Discuss do
    pipe_through :browser
    get "/signout", AuthController, :signout # NB: Becuse of pattern matching, hardcoded routes should be above :wildcard routes
    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  # Other scopes may use custom stacks.
  # scope "/api", Discuss do
  #   pipe_through :api
  # end
end
