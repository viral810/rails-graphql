require 'graphql_type'

class Subscriber < ApplicationRecord
  include GraphQLType

  graphql_type description: 'An ActiveRecord model object',
               fields: [:id, :email]

  # for simple queries like this, the find_by Proc can probably be created dynamically in the macro
  graphql_query description: 'Return information about this ActiveRecord model object',
                arguments: { myarg: true },
                resolver: ->(_, args, _) { Subscriber.find_by(myarg: args[myarg]) }
end
