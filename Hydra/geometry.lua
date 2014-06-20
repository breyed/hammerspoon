-- rotates counter-clockwise, n times (default 1)
function api.geometry.rotate(point, aroundpoint, ntimes)
  local p = {x = point.x, y = point.y}
  for i = 1, ntimes or 1 do
    local px = p.x
    p.x = (aroundpoint.x - (p.y - aroundpoint.y))
    p.y = (aroundpoint.y + (px - aroundpoint.x))
  end
  return p
end

function api.geometry.hypot(p)
  return math.sqrt(p.x * p.x + p.y * p.y)
end

function api.geometry.rect(x, y, w, h)
  return {x = x, y = y, w = w, h = h}
end

function api.geometry.point(x, y)
  return {x = x, y = y}
end

function api.geometry.size(w, h)
  return {w = w, h = h}
end
