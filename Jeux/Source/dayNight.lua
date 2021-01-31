dayNight = {}

dayNight.timer = Timer.new()

-- state = dawn, afternoon, sunset, night
dayNight.dawn = {}
dayNight.dawn.time = 1--150
dayNight.dawn.color = {}
dayNight.dawn.color.r = 0.84
dayNight.dawn.color.g = 1
dayNight.dawn.color.b = 0.72
dayNight.dawn.max_a = 0.2
dayNight.dawn.a = 0

dayNight.afternoon = {}
dayNight.afternoon.time = 1-- 300
dayNight.afternoon.color = {}
dayNight.afternoon.color.r = 0.96
dayNight.afternoon.color.g = 1
dayNight.afternoon.color.b = 0.56
dayNight.afternoon.max_a = 0.2
dayNight.afternoon.a = 0

dayNight.sunset = {}
dayNight.sunset.time =  5--150
dayNight.sunset.color = {}
dayNight.sunset.color.r = 1
dayNight.sunset.color.g = 0.62
dayNight.sunset.color.b = 0.11
dayNight.sunset.max_a = 0.2
dayNight.sunset.a = 0

dayNight.night = {}
dayNight.night.time = 10-- 75
dayNight.night.color = {}
dayNight.night.color.r = 0.03
dayNight.night.color.g = 0.01
dayNight.night.color.b = 0.34
dayNight.night.max_a = 0.3
dayNight.night.a = 0

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
    player:die()
    toDawn()
    dayNight.state = "dawn"
  end
end

function dayNight:start()
  toDawn()
  dayNight.dawn.a = dayNight.dawn.max_a
  dayNight.state = "dawn"

end

function dayNight:draw()
  dayNight:fade()

  love.graphics.setColor(dayNight.dawn.color.r, dayNight.dawn.color.g, dayNight.dawn.color.b,dayNight.dawn.a)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getWidth())

  love.graphics.setColor(dayNight.afternoon.color.r, dayNight.afternoon.color.g, dayNight.afternoon.color.b,dayNight.afternoon.a)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getWidth())

  love.graphics.setColor(dayNight.sunset.color.r, dayNight.sunset.color.g, dayNight.sunset.color.b,dayNight.sunset.a)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getWidth())

  love.graphics.setColor(dayNight.night.color.r, dayNight.night.color.g, dayNight.night.color.b,dayNight.night.a)
  love.graphics.rectangle("fill", 0, 0, love.graphics.getWidth(), love.graphics.getWidth())



end

function dayNight:fade()
  local a_multiplier = 0.001
  state = dayNight.state
  if state == "dawn" then
    if dayNight.dawn.a < dayNight.dawn.max_a then
      dayNight.dawn.a = dayNight.dawn.a + a_multiplier
    end
    if dayNight.afternoon.a > 0 then
      dayNight.afternoon.a = dayNight.afternoon.a - a_multiplier
    end
    if dayNight.sunset.a > 0 then
      dayNight.sunset.a = dayNight.sunset.a - a_multiplier
    end
    if dayNight.night.a > 0 then
      dayNight.night.a = dayNight.night.a - a_multiplier
    end

  elseif state == "afternoon" then
    if dayNight.dawn.a  > 0  then
      dayNight.dawn.a = dayNight.dawn.a - a_multiplier
    end
    if dayNight.afternoon.a < dayNight.afternoon.max_a then
      dayNight.afternoon.a = dayNight.afternoon.a + a_multiplier
    end
    if dayNight.sunset.a > 0 then
      dayNight.sunset.a = dayNight.sunset.a - a_multiplier
    end
    if dayNight.night.a > 0 then
      dayNight.night.a = dayNight.night.a - a_multiplier
    end

  elseif state == "sunset" then
    if dayNight.dawn.a > 0 then
      dayNight.dawn.a = dayNight.dawn.a - a_multiplier
    end
    if dayNight.afternoon.a > 0 then
      dayNight.afternoon.a = dayNight.afternoon.a - a_multiplier
    end
    if dayNight.sunset.a < dayNight.sunset.max_a then
      dayNight.sunset.a = dayNight.sunset.a + a_multiplier
    end
    if dayNight.night.a > 0 then
      dayNight.night.a = dayNight.night.a - a_multiplier
    end

  elseif state == "night" then
    if dayNight.dawn.a > 0 then
      dayNight.dawn.a = dayNight.dawn.a - a_multiplier
    end
    if dayNight.afternoon.a > 0 then
      dayNight.afternoon.a = dayNight.afternoon.a - a_multiplier
    end
    if dayNight.sunset.a > 0 then
      dayNight.sunset.a = dayNight.sunset.a - a_multiplier
    end
    if dayNight.night.a < dayNight.night.max_a then
      dayNight.night.a = dayNight.night.a + a_multiplier
    end

  end
end
