def report
	puts FingerPrint.all.each {|x| puts "#{x.id}. #{x.finger_print} - #{x.notes}"}
end

def update(finger_print_id, notes)
	working_user = FingerPrint.find(finger_print_id)
	working_user.notes = notes
	working_user.save
end

def show(finger_print_id)
	working_user = FingerPrint.find(finger_print_id)
	working_user.Ips.all
end

def whoelse(ip_address)
	fpid_list = Ip.where(ip: "127.0.0.1").map {|fp| fp.finger_print_id }
	fpid_list.each do |fpid|
		fp = FingerPrint.find(fpid)
		puts "#{fp.id}. #{fp.finger_print} - #{fp.notes}"
	end
end
