module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    mapping do
      indexes :name, type: 'string'
      indexes :description, type: 'text'
    end

    def self.search(query)
      binding.break
      params = {
        query: {
          multi_match: {
            query: query,
            fields: ['name', 'description'],
            fuzziness: 'AUTO'
          }
        }
      }

      self.__elasticsearch__.search(params).records.to_a
    end
  end
end