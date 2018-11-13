math.randomseed(os.time() * 2^10)
local random = math.random
local _seed = nil

local function choice(sequence)
  local seq_type = type(sequence)
  if seq_type == "number" then
    return random(sequence)
  elseif seq_type == "string" or seq_type == "table" then
    r_index = random(#sequence)
    return sequence[r_index], r_index
  else
    error "`choice` requires parameter to be an iterable sequence."
  end
end

local function shuffle(sequence)
  local seq_type = type(sequence)
  if seq_type ~= "table" then
    error "Invalid sequence provided to `shuffle`."
  end
  local size = #sequence
  for idx = size, 1, -1 do
    local r_index = random(idx)
    sequence[idx], sequence[r_index] = sequence[r_index], sequence[idx]
  end
  return sequence
end

local function seed(value)
  if value == nil then
    return _seed
  end
  _seed = value
  math.randomseed(_seed)
  return _seed
end

return {
  choice = choice,
  shuffle = shuffle,
  seed = seed
}
