class HomePageController < ApplicationController
	respond_to :json, :html

	def home

		### Initial IP stuff, may be outdated
		@client_ip = request.remote_ip

		client = Info.find_by(ip: @client_ip)
		if client
			client.visit_count += 1
			client.save
		else
			Info.create(ip: @client_ip, visit_count: 1)
		end
		### End initial IP stuff

		#finger_print = FingerPrint.find_by()

		render 'home3.html'
		
	end

	def finger_print

		# I have models IP and FingerPrint
		# Ip(id: integer, ip: string, count: integer, notes: text, created_at: datetime, updated_at: datetime) 
		# FingerPrint(id: integer, finger_print: text, notes: text, created_at: datetime, updated_at: datetime) 

		@fingerprint = params["json_string"]
		@client_ip = request.remote_ip

		if ! @fingerprint
			logger.error "Fingerprint not coming in correctly"
		end
		
		user = FingerPrint.where(finger_print: @fingerprint)
		if user.length == 1
			# scan this user's ips, if matching, count up one.  If no match, add.
			user = user.first

			# Found the finger print, now work with the ips
			ip_list = user.Ips.where(ip: @client_ip)
			if ip_list.length == 1
				ip = ip_list.first
				ip.count += 1
				ip.save
			elsif ip_list.length == 0
				user.Ips.create(ip: @client_ip, count: 1)
			elsif ip_list.length > 1
				logger.error "parsed through Fingerprints and found multiple equivalent ips"
			end

		elsif user.length > 1
			# Figure out what to do if there are multiple objects with same fingerprint.  This shouldn't happen.
			logger.error "found multiple objects with same fingerprint.  Ridiculous."
		elsif user.length == 0
			# Create new user with this fingerprint, create new ip with this ip.
			new_user = FingerPrint.create(finger_print: @fingerprint)
			new_user.Ips.create(ip: @client_ip, count: 1)
		end
	end
end
