defmodule Discuss.TopicController do
  use Discuss.Web, :controller
  alias Discuss.Topic
    # like class inheritance. Imports a ton of stuff from Discuss.Web.ex/controller

  def index(conn, _params) do
    topics = Repo.all(Topic) #note here that were passing in a module - this will return all the data records of this module type
    render conn, "index.html", topics: topics #this makes the @topics property availible to index.html.eex
  end

  def new(conn, _params) do
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

  def create(conn, params) do
    IO.inspect(params)
    # When using the params obj, must use pattern matching to access values within since keys are strings
    %{"topic" => topic} = params # can also put this inplace of params in the method definition
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> 
        IO.inspect(post)
        conn
        |> put_flash(:info, "topic created") #shows single use messages to the user, destroyed upon next user action shown. shown in templates/layout/app.html.eex:26-27
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> 
        IO.inspect(changeset)
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => topic_id}) do
    
  end
end