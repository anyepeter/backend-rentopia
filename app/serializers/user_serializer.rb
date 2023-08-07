class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :email, :password, :occupation, :phone_number, :avatar

  def avatar
    if object.avatar.attached?
      url_for(object.avatar)
    else
      nil
    end
  end
end
