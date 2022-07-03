# frozen_string_literal: true

class ImageOptimizer
  def call(source:, destination: source)
    ImageProcessing::Vips
      .source(source)
      .resize_to_limit(1200, 1200)
      .call(destination: destination.to_s)

    ImageOptim
      .new(svgo: false)
      .optimize_image!(destination)
  end
end
