require 'zbar'
require 'RMagick'

# load the image via rmagick
input = Magick::Image.read('test.jpg').first

# convert to PGM
input.format = 'PGM'

# load the image from a string
image = ZBar::Image.from_pgm(input.to_blob)

image.process.each do |result|
  puts "Code: #{result.data} - Type: #{result.symbology} - Quality: #{result.quality}"
end