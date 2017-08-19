class App < ApplicationRecord
  validates :title, :link, :position, :category,
            :presence => true
end
