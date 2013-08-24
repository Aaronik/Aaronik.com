class HomePageController < ApplicationController
	def home

		@client_ip = request.remote_ip

		client = Info.find_by(ip: @client_ip)
		if client
			client.visit_count += 1
			client.save
		else
			Info.create(ip: @client_ip, visit_count: 1)
		end

		render 'home3.html'
	end
end
