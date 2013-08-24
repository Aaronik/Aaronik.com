module HomePageHelper
	def get_ips
		@client_ip = request.remote_ip
		@remote_ip = request.env["HTTP_X_FORWARDED_FOR"]
		@my_ip = request.env["HTTP_X_FORWARDED_FOR"] || request.remote_addr
		@ip_addr = request.env['REMOTE_ADDR']
	end
end
