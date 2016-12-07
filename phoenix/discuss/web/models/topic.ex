defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    #field, :name_of_field_data, :datatype
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    #struct represents a record in our database
    #params represents how we want to update the struct with
    #the \\%{} is a default argument that we're passing to params.
    #if params is blank, it defaults to nil
    struct
    |> cast(params, [:title])
    #returns an Ecto.Changeset datatype - not a 
    # changeset function like the one we're in - which 
    #describes how we want to update the database
    |> validate_required([:title])
    #this will check if the model is valid or not
  end
end