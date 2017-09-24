MovieType = GraphQL::ObjectType.define do
  name "Movie"
    description "A Movie"
    field :id, types.ID
    field :title, types.String
    field :summary, types.String
    field :year, types.Int
    field :actors do
      type types[ActorType]
      argument :size, typesInt, default_Value: 10
      resolve -> (movie, args, ctx) {
        movie.actors.limit(args[:size])
      }

    end

end