module DateHelper

  def human_date
    Kronic.format(self.created_at)
  end

end
