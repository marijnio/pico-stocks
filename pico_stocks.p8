pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
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
-->8
--natural log results from 0.1 to 1
log_table = {
 -2.30259, -1.60944, -1.20397,
 -0.916291, -0.693147, -0.510826,
 -0.356675, -0.223144, -0.105361,
 0
}

--crude approximation of natural log
function log(n)
 if (n > 1) return nil
 return log_table[ceil(n*10)]
end

--returns a number that follows a normal (Gaussian) distribution
function gaussian (mean, variance)
 return sqrt(-2 * variance * log(rnd())) * cos(2 * 3.141592 * rnd()) + mean
end

