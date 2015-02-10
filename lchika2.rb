require 'wiringpi'
LED = 6
s = WiringPi::GPIO.new
sig = 1
s.mode(LED, OUTPUT)
10.times do
	s.write(LED, sig)
	sig = (sig == 1) ? 0 : 1
	sleep(1)
end
