class Project < ApplicationRecord
  belongs_to :charity
  has_many :story_categories
end
