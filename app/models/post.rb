class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :title, :presence => {:message => "must be present"}
  validates :link, :presence => {:message => "must be present"}
end
