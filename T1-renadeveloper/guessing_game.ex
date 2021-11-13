defmodule jogo do

	def adivinhar(a, b) when a > b, do: adivinhar(b, a)

	def adivinhar(menor, maior) do
		resposta = IO.gets("Hummm talvez você esteja pensando em #{metade(menor, maior)}?\n")

		case String.trim(resposta) do
			"maior" ->
				maior_que(menor, maior)
			
			"menor" ->
				menor_que(menor, maior)

			"sim" ->
				"Aha!! Eu já sabia!!"

			_ ->
				IO.puts(~s{Escreva "maior", "menor" ou "sim"})
				adivinhar(menor, maior)
		end
	end

	def metade(menor, maior) do
		div(menor, maior, 2)
	end

	def maior_que(menor, maior) do
		novo_menor = min(maior, metade(menor, maior) + 1)
		jogo(novo_menor, maior)
	end

	def menor_que(menor, maior) do
		novo_maior = max(menor, metade(menor, maior) - 1)
		jogo(menor, novo_maior)
	end
	
end