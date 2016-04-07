module ApplicationHelper

  def is_owned_by?(user)
    self.user == user
  end

  def bootstrap_alert(flash_type)
    case flash_type.to_sym
    when :error
      "alert-danger"
    when :notice
      "alert-success"
    when :alert
      "alert-warning"
    else
      "alert-info"
    end
  end

  def human_date
    Kronic.format(self.created_at)
  end

  def resource_name
    resource_class.name.downcase.to_sym
  end

  def resource
    @resource ||= resource_class.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
