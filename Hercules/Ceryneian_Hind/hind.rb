# **************************************************************************** #
#                                                           LE - /             #
#                                                               /              #
#    hind.rb                                          .::    .:/ .      .::    #
#                                                  +:+:+   +:    +:  +:+:+     #
#    By: rlossy <marvin@le-101.fr>                  +:+   +:    +:    +:+      #
#                                                  #+#   #+    #+    #+#       #
#    Created: 2018/02/21 12:59:41 by rlossy       #+#   ##    ##    #+#        #
#    Updated: 2018/02/21 15:26:33 by rlossy      ###    #+. /#+    ###.fr      #
#                                                          /                   #
#                                                         /                    #
# **************************************************************************** #

# !/usr/bin/ruby

# Includes
require "oauth2"
require "colorize"
require "colorized_string"

# Credentials
UID = "0a703d2ff1289873a04fffde34b77e33a31ef4b2c5270bf27a25388dbbb53e34"
SECRET = "9bb09210d0325edc20798c63ff97959d925bf3c87b3d6022a4e9973fce72c04d"

# Create the client with your credentials
client = OAuth2::Client.new(UID, SECRET, site: "https://api.intra.42.fr")

# Get an access token
$token = client.client_credentials.get_token

# Try to connect. If it fails, loop until it succeeds.
# Check the username validity and display res.
def find_user(login)
	begin
		res = $token.get("/v2/users/#{login}/locations")
		sleep(0.5);
		until res.status == 200 do
			puts ("Server might be down. Gonna try again in 3...").red.on_yellow.blink
			sleep(1)
			puts ("2...").red.on_yellow.blink
			sleep(1)
			puts ("1...").red.on_yellow.blink
			sleep(1)
		end
		if !res.parsed[0]["end_at"]
			puts (login.ljust(9) + ": " + "available on " + res.parsed[0]["host"]).green
		else
			puts (login.ljust(9) + ": unavailable.").cyan
			puts ("(seen for last time : " + res.parsed[0]["host"] + ")").light_magenta
		end
	rescue
		puts (login.ljust(9) + ": invalid username.").red
	end
end

# Check if file is valid and open it on mode "read only".
# Display usage if file is invalid.

if ARGV[0]
	if File.file?(ARGV[0]) and File.extname(ARGV[0]) == ".txt"
		file = File.open(ARGV[0], "r").each_line do |line|
			line == "\n" ? next : login = line.strip
			find_user(login)
		end
		file.close
	else
		puts "Invalid file."
	end
else
	puts "usage: " + $PROGRAM_NAME + " [file.txt]"
end
