require "soap.http"
local ns, meth, ent = soap.http.call (
   "http://www.deeptraining.com/webservices/weather.asmx", 
   "http://litwinconsulting.com/webservices/", 
   "GetWeather",  
    {
      {  tag = "City", "Brasília"  },  
    }
  )
  
print("KB de RAM: ", collectgarbage("count"))
 
--[[
if ent ~= nil then
  for i, elem in ipairs (ent[1]) do 
      print (elem)
  end
end
]]--
