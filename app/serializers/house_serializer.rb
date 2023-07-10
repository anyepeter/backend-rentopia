class HouseSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes(*House.attribute_names.map(&:to_sym).merge(video: house.video.attached? ? url_for(house.video) : nil) )   
      
    def video
      if object.video.blob.present?
        url_for(object.video)
      else
        nil
      end
    end
  
    def images 
      object.images.map do |image|
        url_for(image) if image.blob.present?
      end
    end
  end

