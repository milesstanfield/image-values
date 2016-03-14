require 'rmagick'

class Value
  class << self

    def test
      img = Magick::Image::read("#{image_path}/test.jpg")[0]
      # black and white
      img = img.quantize(256, Magick::GRAYColorspace)

      # img = img.scale(0.5)

      #
      # img("another_filename.jpg").write do |f|
      #    f.quality = 40
      # end




      pixels = []
      img.each_pixel do |pixel, c, r|

        value = (pixel.to_HSL[2] * 9).round
        pixels << pixel

        # lightness = pixel.to_hsla[2]
        # value = (lightness / 255).round
        #
        # value = (lightness.to_f / 255.to_f * 100 / 11).round
        #
        # binding.pry if pixel.to_hsla[2] > 100
        # case value
        # when 0
        #   pixels << pixel_to_rgb(pixel, 0, 0, 0)
        # when 1
        #   pixels << pixel_to_rgb(pixel, 255, 0, 0)
        # when 2
        #   pixels << pixel_to_rgb(pixel, 255, 145, 0)
        # when 3
        #   pixels << pixel_to_rgb(pixel, 255, 155, 0)
        # when 4
        #   pixels << pixel_to_rgb(pixel, 0, 255, 0)
        # when 5
        #   pixels << pixel_to_rgb(pixel, 0, 255, 255)
        # when 6
        #   pixels << pixel_to_rgb(pixel, 0, 0, 255)
        # when 7
        #   pixels << pixel_to_rgb(pixel, 175, 0, 255)
        # when 8
        #   pixels << pixel_to_rgb(pixel, 255, 0, 255)
        # end
      end

      # pixels = img.get_pixels(0, 0, img.columns, img.rows)
      # img.store_pixels(0, 0, img.columns, img.rows, pixels)
      img.store_pixels(0, 0, img.columns, img.rows, pixels)
      # img.display

      img.write('output_image.jpg')
    end

    def test2
      img = Magick::Image::read("red.png")[0]
      # binding.pry
      img.pixel_color(0,0)
    end


    private

    def image_path
      "#{Rails.root}/app/assets/images"
    end

    def pixel_to_rgb(pixel, r, g, b)
      pixel.red, pixel.green, pixel.blue = (r * 257), (g * 257), (b * 257)
      pixel
    end
  end
end
