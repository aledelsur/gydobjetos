if defined?(WillPaginate)
  module WillPaginate
    module ActiveRecord
      module RelationMethods
        def per(value = nil) per_page(value) end
        def total_count() count end
      end
    end
    module CollectionMethods
      alias_method :num_pages, :total_pages
    end
  end
end

# module Enumerable
#   def sum(identity = 0, &block)
#     if block_given?
#       map(&block).sum(identity)
#     else
#       inject(:+) || identity
#     end
#   end
# end