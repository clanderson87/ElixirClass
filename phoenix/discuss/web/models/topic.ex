defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    #field, :name_of_field_data, :datatype
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    #struct represents a record in our database
    #params represents how we want to update the struct with
    struct
    |> cast(params, [:title])
    #describes how we want to update the database
    |> validate_required([:title])
    #this will check if the model is valid or not
  end
end