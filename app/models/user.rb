class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:admin, :customer]    

  def admin?
    self.roles.include?(:admin)
  end

  has_settings do |s|
    s.key :charity_settings, :defaults => {viewable_users: [], all_users: [], all: false, viewable: true}
    s.key :project_settings, :defaults => {viewable_users: [], all_users: [], all: false, viewable: true}
    s.key :story_category_settings, :defaults => {viewable_users: [], all_users: [], all: false, viewable: true}
    s.key :story_settings, :defaults => {viewable_users: [], all_users: [], all: false, viewable: true}
  end
end

