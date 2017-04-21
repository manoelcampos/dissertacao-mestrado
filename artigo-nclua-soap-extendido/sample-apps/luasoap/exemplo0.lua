require "soap.http"
local ns, meth, ent = soap.http.call (
   "http://www.webservicex.net/CurrencyConvertor.asmx", 
   "http://www.webserviceX.NET/",
   "ConversionRate",  
    {
      {  tag = "FromCurrency", "USD"  },
      {  tag = "ToCurrency", "BRL"  },          
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
