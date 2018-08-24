# Create a simple prober
#
# Query user for input, check to see if the site is up

require 'net/http'
require 'url'

# check http response
def main(user_input)
  while true
    uri = URI.parse(user_input)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      puts "Response OK!"
    else
      puts "Received #{response.code} code. Probing again in 15s..."
    end
    sleep(15)
  end
end

# Ask user for a url
puts "\n\nWhat website would you like to check?\n\n"
userinput = gets.chomp


# Exit on CTRL-C SIGINT
Signal.trap("INT") {
  puts "\nUser exited."
  exit
}
main(userinput)
