module GraphQLType
  def self.included(klazz)
    klazz.extend Macros
  end

  module Macros

    # used to create a GraphQL type from a declarative specification
    # @param name [String] the name of the type, defaults to the class name
    # @param description [String] a docstring for GraphQL
    # @param metadata [Boolean] true if the class can have metadata
    # @param fields [Array<Symbol>] a list of fields to expose with GraphQL
    # @return [GraphQL::ObjectType] a GraphQL object type to declare for the schema
    def graphql_type( name: self.name,
                      description:'',
                      fields: )

      # because of the way GraphQL creates objects
      # we have to reference self outside of the define block
      columns = self.columns_hash

      define_singleton_method(:graphql_type) do
        GraphQL::ObjectType.define do
          name name
          description description

          fields.each do |f|
            field f.to_sym, GraphQLType.convert_type(columns[f.to_s].type)
          end
        end
      end
    end

    # used to create a GraphQL query for the ActiveRecord model
    # @param name [String] the name of the type, defaults to the class name
    # @param description [String] a docstring for GraphQL
    # @param arguments [Array<Hash{Symbol:Boolean}>] a list of maps of argument names to required booleans
    # @param resolver [Proc] a method that will resolve the query
    # @return [GraphQL::Field] a GraphQL field object to use in the schema
    def graphql_query( name: self.name,
                       description: '',
                       arguments: [],
                       resolver: ) # TODO: a default proc that assumes the arguments are the AR find_by
      columns = self.columns_hash

      define_singleton_method(:graphql_query) do
        GraphQL::Field.define do
            name name
            type Types.const_get("#{name}Type")
            description description
            arguments.each do |k, v|
               # TODO: use boolean required argument value to invoke to_non_null_type
              argument k, GraphQLType.convert_type(columns[k.to_s].type)
            end
            resolve resolver
        end
      end
    end

  end

  # convert a database type to a GraphQL type
  # @param db_type [Symbol] the type returned by columns_hash[column_name].type
  # @return [GraphQL::ScalarType] a GraphQL type
  def self.convert_type db_type
    # because we're outside of a GraphQL define block we cannot use the types helper
    # we must refer directly to the built-in GraphQL scalar types
    case db_type
      when :integer
        GraphQL::INT_TYPE
      else
        GraphQL::STRING_TYPE
    end
  end

  # return [Array<Class>] a list of classes that implements this module
  def self.implementations
    Rails.application.eager_load!
    puts "implementations #{self.class}"
    ActiveRecord::Base.descendants.each.select do |clz|
      begin
        clz.included_modules.include? GraphQLType
      rescue
        # it's okay that this is empty - just covering the possibility
      end
    end
  end

end
