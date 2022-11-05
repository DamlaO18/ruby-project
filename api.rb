require 'open-uri'
require 'net/http'
require 'json'


loop_var = true

while loop_var do

    puts "Welcome to Random Shade Colour Generator"
    puts "Search a colour: "

    colour = gets.chomp

    uri = URI.parse("https://x-colors.herokuapp.com/api/random/#{colour}")
    response = Net::HTTP.get_response(uri)


    if response.code == "200"
        json = JSON.parse(response.body)

        puts "Try hex shade of #{colour},  #{json["hex"]}"
        puts "Try rbg shade of #{colour}, #{json["rgb"]}"
        puts "Try hsl shade of #{colour}, #{json["hsl"]}"
    else
        puts "No colour found"
    end

    puts "Press Y to search again, or press any key to exit"

    if (gets.chomp.downcase != 'y')
        loop_var = false
    end
end