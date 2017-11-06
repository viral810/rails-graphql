SubscriberType = GraphQL::ObjectType.define do
  name 'Subscriber'
  description '...'

  field :id, !types.String
  field :email, !types.String
  field :user_id, !types.String
  field :display_name, !types.String
  field :status, !types.String
  field :phone_support_pin, !types.String
  field :earned_data_limit, !types.Int
  field :email_confirmed, !types.Boolean
  field :failed_login_count, !types.Int
  field :origin_country, !types.String
  field :locale, !types.String
  field :affiliate_name, !types.String
  field :earned_one_time_data_limit, !types.Int
  field :one_time_data_used, !types.Int
  field :reward_group_id, !types.Int
  field :affiliate_id, !types.Int
  field :subscriber_plans, SubscriberPlansType
end
