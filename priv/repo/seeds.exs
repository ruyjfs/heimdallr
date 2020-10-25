# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Heimdallr.Repo.insert!(%Heimdallr.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Heimdallr.Repo
alias Heimdallr.Schemas.User

Repo.insert!(%User{
  name: "ruyjfs",
  email: "ruyjfs@gmail.com",
  first_name: "Ruy",
  last_name: "Ferreira",
  bio: "May we leave a better word than the one we found!",
  gender: 1,
  password: Argon2.hash_pwd_salt("123456")
})
