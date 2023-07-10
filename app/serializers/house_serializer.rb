class HouseSerializer < ActiveModel::Serializer
    include Rails.application.routes.url_helpers
    attributes(*House.attribute_names.map(&:to_sym), :video, :images ) 
    
    belongs_to :user
    belongs_to :category
    belongs_to :security
    belongs_to :location
    has_many :near_by_places
      
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

