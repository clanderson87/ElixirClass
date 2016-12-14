defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)
    
    cond do
      # cond statements mush like case, but they return the first line of code that evals to true
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)
      # conn.assigns.user => user struct. Note that 'assign' is the function assign(), and 'assigns' is the prop
      true -> 
        assign(conn, :user, nil)
    end
  end

end