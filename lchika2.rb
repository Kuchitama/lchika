# http://lchikaamazon.hatenablog.com/entry/2013/11/18/191031
require 'wiringpi'
LED = 1
s = WiringPi::GPIO.new
sig = 1024
s.mode(LED, PWM_OUTPUT)
10.times do
	(0..511).each do |x|
		s.pwmWrite(LED, (1023 - 2 * x))
		puts "#{1023- 2 * x}"
		sleep(0.001)
	end
	(0..511).each do |x|
		s.pwmWrite(LED, 2*x)
		puts x
		sleep(0.001)
	end
end
s.pwmWrite(LED, 0)
