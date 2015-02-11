# http://lchikaamazon.hatenablog.com/entry/2013/11/24/203802
require 'wiringpi'

LED = 1
s = WiringPi::GPIO.new
bright = 1023
s.mode(LED, PWM_OUTPUT)

SWC = 5
s.mode(SWC, INPUT)

swc_flg = false
finish_flg = false

t1 = Thread.start {
	print ">"
	input = gets.to_i
	# change finish_flg = true if inputted any.
	finish_flg = TRUE if (input.size > 0)
}

loop do
	break if (finish_flg)

	# input value
	ivalue = s.read(SWC)
	puts ivalue

	if (ivalue == 1) then
		puts "on"
		s.pwmWrite(LED, bright)
	else
		puts "off"
		s.pwmWrite(LED, 0)
	end

	sleep(0.5)
end
s.pwmWrite(LED, 0)

puts "Good bye"
