class Page < ActiveRecord::Base
  attr_accessible :body, :position, :slug, :title
end
