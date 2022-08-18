class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end


# rails g model movie title overview poster_url rating:float

# rails g model list name

# rails g model bookmark movie:references list:references comment:text
