--data

last_time=0

clock = {
 hours=0,
 days=0,
 elapsed=0,
 active=1
}

stock = {
 price=100,
 mu=.1, --drift
 sigma=.07 --volatility
}

function step_stock()
 dt=.01
 local drift = stock.mu * dt * stock.price
 local uncertainty = gaussian(0,1) * sqrt(dt) * stock.sigma * stock.price
 local change = drift + uncertainty
 stock.price += change
 printh("The new price is "..stock.price)
end

function clock:tick ()
 self.hours += 1
end

--main functions

function _init()
 srand(1)
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
   printh("The hour is "..clock.hours)
   step_stock()
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
