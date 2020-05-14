# frozen_string_literal: true

module ProductDecorator
  
  def show_images
    product_image.map {|i| i.show_image.url}
  end
  
  def index_image
    product_image[0].index_image.url
  end
end
