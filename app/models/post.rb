class Post < ApplicationRecord
  belongs_to :user
  validates :title, :text, :user, presence: true
  has_many :comments

  def self.all_visible
    where(done: true)
  end
end
