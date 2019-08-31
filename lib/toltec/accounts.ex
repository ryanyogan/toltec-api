defmodule Toltec.Accounts do
  import Ecto.Query, warn: false
  alias Toltec.Repo

  alias Toltec.Accounts.User

  @spec list_users :: any
  def list_users do
    Repo.all(User)
  end

  @spec get_user!(any) :: any
  def get_user!(id), do: Repo.get!(User, id)

  @spec create_user(:invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          any
  def create_user(attrs \\ %{}) do
    result =
      %User{}
      |> User.registration_changeset(attrs)
      |> Repo.insert()

    case result do
      {:ok, user} ->
        {:ok, %User{user | password: nil}}

      _ ->
        result
    end
  end

  @spec update_user(
          Toltec.Accounts.User.t(),
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: any
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @spec delete_user(Toltec.Accounts.User.t()) :: any
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @spec change_user(Toltec.Accounts.User.t()) :: Ecto.Changeset.t()
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end
end
