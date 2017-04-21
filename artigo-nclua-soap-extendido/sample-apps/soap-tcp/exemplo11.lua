--Nestes exemplos não está sendo utilizado o LuaProfiler pois
--como a requisição já deve ser enviada formatada, não é gasto
--tempo na geração da mesma. Assim, não há o que ser
--comparado em relação ao NCLua SOAP no quesito tempo de execução,
--apenas na questão de consumo de memória

---[[
os.execute("clear")
io.write("\n\nPressione ENTER para enviar a requisição SOAP")
io.read()
--]]

package.path = package.path .. ';lib/?.lua'
require "tcp"
--require "profiler"
--profiler.start("profiler.log")
 
local request = [[POST http://www.maniezo.com.br/webservice/soap-server.php HTTP/1.0
User-Agent: ncluasoap/0.5.6.6
Content-Type: text/xml; charset=utf-8
SOAPAction: "http://www.maniezo.com.br/traz_cep"
Host: www.maniezo.com.br
Content-Length: 353

<?xml version="1.0"?>
<soap:Envelope 
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
 xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
 xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/" 
>
  <soap:Body>
    <traz_cep xmlns="http://www.maniezo.com.br">
      <cep>77021682#labtvdi#labtvdi#</cep>
    </traz_cep>
  </soap:Body>
</soap:Envelope>

]]

local function sendRequest()
  tcp.execute(
        function ()
            local host, port = "www.maniezo.com.br", 80
            tcp.connect(host, port)
            print("Conectado a "..host.." pela porta " .. port)
            tcp.send(request)
            local response = tcp.receive("*a")
            tcp.disconnect()
      	    print(response)        
      	    
      	    --profiler.stop()
      	    --event.post {class="ncl", type="presentation", action="stop"}
      	    
      	    local kb = collectgarbage("count")
      	    print("Bytes em uso: ", kb*1024)
      	    print("Valor em KB: ", kb) --66.28 KB de uso de RAM
      	    --pico de CPU: 0.3%
        end
  )    
end

sendRequest()
