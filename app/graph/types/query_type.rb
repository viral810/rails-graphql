QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :viewer do
    type UserType
    description "Current user"
    resolve ->(obj, args, ctx) {
      ctx[:current_user]
    }
  end

  field :subscriber do
    type SubscriberType
    argument :email, !types.String
    resolve -> (root, args, ctx) {
        Subscriber.find_by_email(args[:email])
    }
  end
end
