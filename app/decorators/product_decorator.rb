# frozen_string_literal: true

module ProductDecorator
  
  def show_images
    images.map {|i| i.show_image.url}
  end
  
  def index_image
    images[0].index_image.url
  end
end
