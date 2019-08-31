user =
  Toltec.Accounts.User.registration_changeset(%Toltec.Accounts.User{}, %{
    name: "ryan",
    email: "ryan@toltext.com",
    password: "foobarasd"
  })

Toltec.Repo.insert!(user)
