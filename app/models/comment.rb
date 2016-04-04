class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
  include ApplicationHelper

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') }

  belongs_to :user

  def human_date
    Kronic.format(self.created_at)
  end
end
