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
 

local request = [[POST http://www.deeptraining.com/webservices/weather.asmx HTTP/1.0
User-Agent: ncluasoap/0.5.6.6
Content-Type: application/soap+xml; charset="utf-8"
Host: www.deeptraining.com
Content-Length: 366

<?xml version="1.0"?>
<soap12:Envelope 
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
 xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
 xmlns:soap12="http://www.w3.org/2003/05/soap-envelope" 
>
  <soap12:Body>
    <GetWeather xmlns="http://litwinconsulting.com/webservices/">
      <City>Brasília</City>
    </GetWeather>
  </soap12:Body>
</soap12:Envelope>

]]

local function sendRequest()
  tcp.execute(
        function ()
            local host, port = "www.deeptraining.com", 80
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
      	    print("Valor em KB: ", kb) --76.02 KB de uso de RAM
      	    --pico de CPU: 0.3%
        end
  )    
end


sendRequest()
