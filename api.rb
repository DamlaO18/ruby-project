require 'open-uri'
require 'net/http'
require 'json'

puts "Input: "

phrase = gets.chomp

uri = URI.parse("https://api.funtranslations.com/translate/doge.json?text=#{phrase}")
response = Net::HTTP.get_response(uri)


if response.code == "200"
    json = JSON.parse(response.body)

    puts "Output: #{json["contents"]["translated"]}"
else
    puts "No translation found"
end