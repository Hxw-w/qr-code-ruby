# Write your solution here!
require "rqrcode"

qrcode_url = RQRCode::QRCode.new("https://canvas.uchicago.edu")

qrcode_wifi = RQRCode::QRCode.new("WIFI:T:WPA;S:Verizon_7KJP4L;P:yew6glass4sides")

qrcode_text = RQRCode::QRCode.new("SMSTO:7345100762:Hi Oliver! It is your baby")

puts "What kind of QR code would you like to generate?" 
puts
puts "1. Open a URL"
puts "2. Join a wifi network"
puts "3. Send a text message" 
puts
puts "Press 4 to exit"

input = gets.chomp

if input == "1"
  png = qrcode_url.as_png({ :size => 500 })

  IO.binwrite("url.png", png.to_s)
elsif input == "2"
  png = qrcode_wifi.as_png({ :size => 500 })
  IO.binwrite("wifi.png", png.to_s)
elsif input == "3"
  png = qrcode_text.as_png({ :size => 500 })
  IO.binwrite("text.png", png.to_s)
end
