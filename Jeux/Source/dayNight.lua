dayNight = {}

dayNight.timer = Timer.new()

-- state = dawn, afternoon, sunset, night
dayNight.dawn = {}
dayNight.dawn.time = 5--65 -- delay of "matin"
dayNight.dawn.color = {0.84, 1, 0.72, 0.2}

dayNight.afternoon = {}
dayNight.afternoon.time = 5 --54 -- delay of "midi"
dayNight.afternoon.color = {0.96,1,0.56, 0.1}

dayNight.sunset = {}
dayNight.sunset.time = 5--65 -- delay of "matin"
dayNight.sunset.color = {1,0.62,0.11, 0.2}

dayNight.night = {}
dayNight.night.time = 5--75-- delay of "soir"
dayNight.night.color = {0.03,0.01,0.34, 0.2}

function toDawn()
  music.dawn:play()
  music.afternoon:stop()
  music.sunset:stop()
  music.night:stop()

  dayNight.color = dayNight.dawn.color

  dayNight.timer:after(dayNight.dawn.time,function() dayNight:switch() end)
end

function toAfternoon()
  music.dawn:stop()
  music.afternoon:play()
  music.sunset:stop()
  music.night:stop()

  dayNight.color = dayNight.afternoon.color

  dayNight.timer:after(dayNight.afternoon.time,function() dayNight:switch()end)
end

function toSunset()
  music.dawn:stop()
  music.afternoon:stop()
  music.sunset:play()
  music.night:stop()

  dayNight.color = dayNight.sunset.color

  dayNight.timer:after(dayNight.sunset.time,function() dayNight:switch()end)
end

function toNight()
  music.dawn:stop()
  music.afternoon:stop()
  music.sunset:stop()
  music.night:play()

  dayNight.color = dayNight.night.color

  dayNight.timer:after(dayNight.night.time,function() dayNight:switch()end)
end
-- after each second, check if "timer" is on the right state
function dayNight:switch()
  state = dayNight.state
  if state == "dawn" then
    toAfternoon()
    dayNight.state = "afternoon"

  elseif state == "afternoon" then
    toSunset()
    dayNight.state = "sunset"

  elseif state == "sunset" then
    toNight()
    dayNight.state = "night"

  elseif state == "night" then
    toDawn()
    dayNight.state = "dawn"
  end
end

function dayNight:start()
  toDawn()
  dayNight.state = "dawn"

end

function dayNight:draw()
  love.graphics.setColor(dayNight.color)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getWidth())
end
