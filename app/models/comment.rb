class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  include ApplicationHelper

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  belongs_to :user
  validates :body, presence: true

end
