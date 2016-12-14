defmodule Discuss.AuthController do
  use Discuss.Web, :controller
  plug Ueberauth
  alias Discuss.User
  
  def signout(conn, _params) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: topic_path(conn, :index))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, provider: "github"}
    # taken from the conn object - use IO.inspect(conn) to see this
    changeset = User.changeset(%User{}, user_params)

    signin(conn, changeset)
  end

  defp signin(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |>redirect(to: topic_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "error signing in")
        |> redirect(to: topic_path(conn, :index))
    end # defined below
  end

  defp insert_or_update_user(changeset) do
    # defp is a private function 
    IO.inspect(changeset)
    case Repo.get_by(User, email: changeset.changes.email) do
      #add a clause for when email is private on Github here for {:error}
      nil ->
        #if this returns nothing
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end

end