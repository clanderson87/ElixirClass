defmodule Discuss.Repo.Migrations.AddTopics do
  use Ecto.Migration

  def change do
    create table(:topics) do
    #create a new table called 'topics'
      add :title, :string
      #inside there, make sure there is a column called 'title' with a type of 'string'
    end
  end
end
