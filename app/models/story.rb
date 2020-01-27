class Story < ApplicationRecord
  belongs_to :project
  belongs_to :story_category
end
