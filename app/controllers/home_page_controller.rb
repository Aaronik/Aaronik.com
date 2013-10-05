class HomePageController < ApplicationController
	respond_to :json, :html

	def home
		render 'home3.html', stream: true
	end

	def finger_print

		@fingerprint = params["json_string"].to_i
		
		client_ip = request.remote_ip

		geo_info = request.location # Thank you, geocoder
		client_location = "#{geo_info.city}, #{geo_info.state} #{geo_info.country_code}"

		user = FingerPrint.where(finger_print: @fingerprint)

		if user && ip
			ip = Ip.where(ip: client_ip)

			ip.visit_count += 1
			ip.location = client_location
			ip.save
		elsif user && !ip
			user.ips.create(ip: client_ip, visit_count: 1, location: client_location)
		elsif !user
			new_user = FingerPrint.create(finger_print: @fingerprint)
			new_user.ips.create(ip: client_ip, visit_count: 1, location: client_location)
		end
	end

	def comp_info
		@comp_info = params["json_string"].to_s

		user = FingerPrint.find_by_finger_print(@fingerprint)
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

	def download_resume
		send_file(
			"public/AaronSullivanResume.doc",
			type: "application/msword",
			filename: "AaronSullivanResume.doc",
			stream: true
			)
	end
end
