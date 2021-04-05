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
