require 'open-uri'
require 'net/http'
require 'json'
require_relative './colour'

loop_var = true

puts "Welcome to Random Shade Generator!"

while loop_var do
    puts "Search a colour: "

    search_colour = gets.chomp.downcase

    uri = URI.parse("https://x-colors.yurace.pro/api/random/#{search_colour}")
    response = Net::HTTP.get_response(uri)


    if response.code == "200"
        json = JSON.parse(response.body)

        colour = Colour.new(json["hex"], json["rgb"], json["hsl"])
        colour.print_shades
    else
        puts "No colour found"
    end

    puts "Press Y to search again, or press any key to exit"

    if (gets.chomp.downcase != 'y')
        loop_var = false
        puts "Thank you for using Random Shade Generator."
    end
end