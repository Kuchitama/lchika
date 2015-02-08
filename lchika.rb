# turn on and off LED
# 
# http://lchikaamazon.hatenablog.com/entry/2013/11/18/180435
io = open("/sys/class/gpio/export", "w")
io.write(25)
io.close

dir = open("/sys/class/gpio/gpio25/direction", "w")
dir.write("out")
dir.close


out = 1
10.times do
  v = open("/sys/class/gpio/gpio25/value", "w")
  v.write(out)
  v.close
  out = out == 1 ? 0 : 1
  sleep 0.5
end

unexport = open("/sys/class/gpio/unexport", "w")
unexport.write(25)
unexport.close
