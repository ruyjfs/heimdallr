defmodule HeimdallrWeb.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(HeimdallrWeb.Schema.AccountTypes)
  import_types(HeimdallrWeb.Schema.ContentTypes)

  alias HeimdallrWeb.Resolvers
  @desc "Heimdallr Schema"
  query do
    @desc "Get a user"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end

    @desc "Get all users"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Accounts.find_user/3)
    end

    # @desc "Get all posts"
    # field :posts, list_of(:post) do
    #   resolve(&Resolvers.Content.list_posts/3)
    # end
  end

  @desc "Description of Mutation Schema"
  mutation do
    @desc "Create a post"
    field :create_post, :post do
      arg(:title, non_null(:string))
      arg(:body, non_null(:string))
      arg(:published_at, :naive_datetime)

      resolve(&Resolvers.Content.create_post/3)
    end

    @desc "Create a user"
    field :create_user, :user do
      arg(:name, non_null(:string))
      arg(:contact, non_null(:contact_input))
      arg(:password, non_null(:string))

      resolve(&Resolvers.Accounts.create_user/3)
    end
  end
end
