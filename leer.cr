require "file"
require "http/server"

# File.open("chomin.txt", "w")
texto = File.read("index.html")
# File.write("chomin.txt", texto)

server = HTTP::Server.new(3000) do |context|
  context.response.content_type = "text/html"
  puts context.request.path
  # puts context.request.para
  if context.request.path == "/"
    chomin = "benjamin de la cruz"
    ht = texto.gsub("{{chomin}}") { chomin }
    # puts ht
    context.response.print ht
  end
  if context.request.path == "/chomin"
    context.response.print "<h1>Chomin!!</h1>"
  end
end

puts "Ejecutandose en el puerto 3000"

server.listen
