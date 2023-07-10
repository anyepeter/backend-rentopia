class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes(*User.attribute_names.map(&:to_sym), :avatar)   
  
  def avatar
    if object.avatar.blob.present?
      url_for(object.avatar)
    else
      nil
    end
  end
end
