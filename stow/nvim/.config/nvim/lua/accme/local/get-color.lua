-- Shifts each RGB channel of a "#rrggbb" color by the given offsets.
return function(hex, r_offset, g_offset, b_offset)
  local r = tonumber(hex:sub(2, 3), 16)
  local g = tonumber(hex:sub(4, 5), 16)
  local b = tonumber(hex:sub(6, 7), 16)

  r = math.max(0, math.min(255, r + r_offset))
  g = math.max(0, math.min(255, g + g_offset))
  b = math.max(0, math.min(255, b + b_offset))

  return string.format("#%02x%02x%02x", r, g, b)
end
