class HomePageController < ApplicationController
	def home

		@client_ip = request.remote_ip

		Info.create(ip: @client_ip)
		#@remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
		#@my_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
		#@ip_addr = request.env['REMOTE_ADDR']

		render 'home3.html'
	end
end
