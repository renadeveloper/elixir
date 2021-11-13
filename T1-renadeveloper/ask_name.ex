resposta = IO.gets "Qual é o seu nome? "

case String.trim(resposta) do
	"Renata" ->
		IO.puts "Bem vinda, Renata! Nós somos xarás"

	_ ->
		IO.puts "Seja bem vindo(a)"
		IO.puts resposta
end