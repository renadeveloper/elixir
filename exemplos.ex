#Funcao anonima - Exemplo Multiplicacao

multi = fn (x, y) -> x * y end
IO.puts multi.(2, 2)


# A & taquigrafia - Exemplo Multiplicacao

multi = &(&1 * &2)
IO.puts multi.(2, 2)

#Pattern matching

teste_resultado = 1

exemplo_pattern = fn
	{:ok, resultado} -> IO.puts "Procurando seu resultado \n"
  {:ok, _} -> IO.puts "Essa resposta ja foi dada"
  {:error} -> IO.puts "Ocorreu um erro"
end

# Funções nomeadas - Exemplo Operacoes Soma e Multiplicacao

defmodule Operacoes do

	def soma(x, y), do: x + y

	def multi(x, y), do: x * y

end

IO.puts Operacoes.soma(2, 3)
IO.puts Operacoes.multi(2, 3)

# Nomear Funções e a Aridade - Mensagem de Bem vindo estilo site

defmodule Bem_vindo do
  def welcome(), do: "Seja bem vindo(a), seja la quem for!"
  def welcome(nome), do: "Seja bem vindo(a), " <> nome
  def welcome(nome1, nome2), do: "Oi, #{nome1} e #{nome2}, sejam bem vindos(as)"
end

IO.puts Bem_vindo.welcome()
IO.puts Bem_vindo.welcome("Renata")
IO.puts Bem_vindo.welcome("Renata", "Mateus")

# Guards - Expondo numeros

defmodule Number do
  def expoe_numeros(num) when is_list(num) do
    num
    |> Enum.join(" e ")
    |> expoe_numeros
  end

  def expoe_numeros(num) when is_binary(num) do
    phrase() <> num
  end

  defp phrase, do: "Os numeros sao "
end

IO.puts Number.expoe_numeros ["2", "3"]
