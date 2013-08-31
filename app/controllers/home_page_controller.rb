class HomePageController < ApplicationController
	respond_to :json, :html

	def home
		render 'home3.html'
	end

	def finger_print

		$fingerprint = params["json_string"].to_i
		logger.error "Fingerprint not coming in correctly" if ! $fingerprint

		@client_ip = request.remote_ip

		geo_info = request.location # Thank you, geocoder
		@client_location = "#{geo_info.city}, #{geo_info.state} #{geo_info.country_code}"
		
		user = FingerPrint.find_by_finger_print($fingerprint)
		if user # scan this user's ips, if matching, count up one.  If no match, add.
			ip = user.ips.find_by_ip(@client_ip) # Found the finger print, now work with the ips
			if ip # If IP already exists in table, count up, update location
				ip.visit_count += 1
				ip.location = @client_location
				ip.save
			else # If no IP in table already, make one
				user.ips.create(ip: @client_ip, visit_count: 1, location: @client_location)
			end
		else
			# Create new user with this fingerprint, create new ip with this ip.
			new_user = FingerPrint.create(finger_print: $fingerprint)
			new_user.ips.create(ip: @client_ip, visit_count: 1, location: @client_location)
		end
	end

	def comp_info
		@comp_info = params["json_string"].to_s

		user = FingerPrint.find_by_finger_print($fingerprint)
		user.comp_info = @comp_info
		user.save
	end

	def get_from_github
		require 'open-uri'

		respond_to do |format|
    	format.json do
    		selected_program = params["json_string"].gsub('"','')
    		@program = open("https://raw.github.com/Aaronik/netsec/master/#{selected_program}").read
    		render :json => @program
    	end
    end
	end
end
