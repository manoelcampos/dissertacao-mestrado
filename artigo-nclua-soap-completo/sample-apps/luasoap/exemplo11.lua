require "soap/http"

io.write("Pressione ENTER para continuar"); io.read()

local cep = "70845550"
local login = "labtvdi"
local senha = "labtvdi"


local ns, meth, ent = soap.http.call(
      "http://www.maniezo.com.br/webservice/soap-server.php", 
      "http://www.maniezo.com.br/", 
      "traz_cep",
       {
          { tag = "dados_cep", cep.."#"..login.."#"..senha.."#" }
       }
  )
    
print("KB de RAM: ", collectgarbage("count")) --139.20 KB
  
--[[  
if ent ~= nil then
  for i, elem in ipairs (ent[1]) do 
      print ("\nEndereco: "..elem, "\n")
  end
end
]]--

