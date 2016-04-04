module ApplicationHelper

  def is_owned_by?(user)
    self.user == user
  end

end
