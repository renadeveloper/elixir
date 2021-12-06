defmodule MinimalTodo do

	def start do
		filename = IO.gets("Nome do .csv para carregar: ") |> String.trim
		read(filename)
			|> parse
			|> get_command
	end

	def get_command(data) do
		prompt = """
Escreva a primeira letra do comando que voce deseja utilizar
L)er atv   A(dicionar atv   D)eletar atv  C)arregar um .csv  S)alvar um .csv
"""
		command = IO.gets(prompt)
			|> String.trim
			|> String.downcase

		case command do
			"l"		-> show_todos(data)
			"d"		-> delete_todo(data)
			"q"		-> "Tchauzinho!"
			_			-> get_commands(data)
		end
	end

	def delete_todo(data) do
		todo = IO.gets("Qual atividade gostaria de deletar?\n") |> String.trim
		if Map.has_key? data, todo do
			IO.puts "ok."
			new = Map.drop(data, [todo])
			IO.puts ~s("#{todo}" foi deletada.)
		else
			IO.puts ~s(Nao existe atv com o nome "#{todo}"!)
			show_todos(data, false)
			delete_todo(data)
		end
	end

	def read(filename) do
		case File.read(filename) do
			{:ok, body} -> body
			{:error, reason} -> IO.puts ~s(Nao eh possivel abrir o arquivo "#{filename}"\n.)
				IO.puts ~s("#{:file.format_error reason}"\n)
				start()
		end
	end

	def parse(body) do
		[header | lines] = String.split(body, ~r{(\r\n|\r|\n)})
		titles = t1 String.split(header, ",")
		parse_lines(items, titles)
	end

	def parse_lines(lines, titles) do
		Enum.reduce(lines, %{}, fn line, built ->
			[name | fields] = String.split(line, ",")
			if Enum.count(fields) == ENum.count(titles) do
				line_data = enum.zip(titles, fields) |> Enum.into(%{})
				Map.merge(built, %{name => line_data})
			else
				built
			end
		end)
	end

	def show_todos(data, next_command? \\ true) do
		items = Map.keys data
		IO.puts "Voce possui essas atividades:\n"
		Enum.each items, fn item -> IO.Puts item end
		IO.puts "\n"
		if next_command? do
			get_command(data)
		end
	end


end
