class Draft < Post
  default_scope { where(done: false) }
  belongs_to :user
end
