-- Returns the x, y position that is in front of Link
-- "dist" number of pixels away
function frontInteraction(dist)

    local px, py = player.collider:getPosition()

    if player.dir == "right" then
        px = px + dist
    elseif player.dir == "left" then
        px = px - dist
    elseif player.dir == "up" then
        py = py - dist
    elseif player.dir == "down" then
        py = py + dist
    end

    return px, py

end


-- return a new array containing the concatenation of all of its
-- parameters. Scaler parameters are included in place, and array
-- parameters have their values shallow-copied to the final array.
-- Note that userdata and function values are treated as scalar.
function tableMerge(...) 
    local t = {}
    for n = 1,select("#",...) do
        local arg = select(n,...)
        if type(arg)=="table" then
            for _,v in ipairs(arg) do
                t[#t+1] = v
            end
        else
            t[#t+1] = arg
        end
    end
    return t
end
