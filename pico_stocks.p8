pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--pico-stocks

x=64
y=64

function _update()
 if (btn(0)) then x-=1 end
 if (btn(1)) then x+=1 end
 if (btn(2)) then y-=1 end
 if (btn(3)) then y+=1 end
end

function _draw()
 rectfill(0,0,127,127,5)
 circfill(x,y,7,14)
end
-->8
--data

last_time=0

clock = {
 hours=0,
 days=0,
 elapsed=0,
 active=1
}

function clock:tick ()
 self.hours += 1
end

--main functions

function _init()
 _update=gameupdate
 -- _draw=gamedraw
end

function gameupdate()
 update_clock()
end

function update_clock()
 local t = time()
 local dt = t - last_time
 last_time = t

 if clock.active then
  clock.elapsed += dt
  if clock.elapsed > 2 then
   clock:tick()
   clock.elapsed=0
   printh(clock.hours) 
  end
 end
end

function click()

end

function gamedraw()
 cls()

 print("press x to buy",2,2)
end

function drawmenu()

end

