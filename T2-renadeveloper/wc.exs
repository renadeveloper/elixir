filename = IO.gets("Arquivos que contaremos palavras: ") |> String.trim()

words =
	File.read!(filename)
	|> String.split(~r{(\\n|[^\W'])+})
	|> Enum.filter(fn x -> x != "" end)

words |> Enum.count() |> IO.puts()
