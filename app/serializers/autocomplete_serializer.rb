class AutocompleteSerializer < ActiveModel::Serializer
  attributes :id, :label, :value

  def label
    object.title
  end

  def value
    object.title
  end
end
