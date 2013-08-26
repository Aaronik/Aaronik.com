def report
	puts FingerPrint.all.each {|x| puts "#{x.id}. #{x.finger_print} - #{x.notes}"}
end

def update(finger_print_id, notes)
	working_user = FingerPrint.find(finger_print_id)
	working_user.notes = notes
end