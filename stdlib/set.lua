local set_instance = object:new()
set_instance:squish(enumerable)

local set = object:new()
set._prototype = set_instance

function set:new (...)
  local args = {...}
  if #args == 1 and type(args[1]) == "table" and args[1]._lua_array ~= nil then
    args = args[1]._lua_array
  end

  local new_set = new_brat(self)
  new_set._internal_hash = hash:new()

  for k,v in pairs(args) do
    new_set._internal_hash:set(v, true)
  end

  return new_set
end

function set_instance:_less_less (item)
  self._internal_hash:set(item, true)
  return self
end

function set_instance:merge (items)
  if type(items) == "table" then
    local block = function(s, item)
      self._internal_hash:set(item, true)
    end

    if items._internal_hash then
      items._internal_hash:each_underkey(block)
    elseif items.each then
      items:each(block)
    else
      error()
    end
  else
    error()
  end

  return self
end

set_instance.add = set_instance._less_less

function set_instance:clear ()
  self._internal_hash = hash:new()

  return self
end

function set_instance:each (block)
  local f = function (ignore, item)
    block(self, item)
  end

  self._internal_hash:each_underkey(f)

  return self
end

function set_instance:map (block)
  local s = set:new()
  local f = function (ignore, item)
    s:add(block(self, item))
  end

  self._internal_hash:each_underkey(f)

  return s
end

function set_instance:empty_question ()
  if self._internal_hash:length() == 0 then
    return object.__true
  else
    return object.__false
  end
end

function set_instance:delete (item)
  self._internal_hash:delete(item)

  return item
end

function set_instance:include_question (item)
  if self._internal_hash:get(item) == true then
    return object.__true
  else
    return object.__false
  end
end

function set_instance:length ()
  return self._internal_hash:length()
end

function set_instance:_equal_equal (rhs)
  if type(rhs) ~= "table" or rhs._internal_hash == nil then
    return object.__false
  end
    
  rhs = rhs._internal_hash
  lhs = self._internal_hash

  if lhs:length() ~= rhs:length() then
    return object.__false
  end

  for k,v in pairs(lhs._lua_hash) do
    if rhs:get(k) ~= true then
      return object.__false
    end
  end

  return object.__true
end

function set_instance:join (separator, final)
  return self:to_underarray():join(separator, final)
end

function set_instance:to_unders ()
  return base_string:new("Set:" .. tostring(self._internal_hash:keys():to_unders()))
end

function set_instance:to_underarray ()
  return self._internal_hash:keys()
end

object:export(set, "set")
