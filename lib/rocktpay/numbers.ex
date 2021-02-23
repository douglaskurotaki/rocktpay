defmodule Rocktpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv" # pipe operator -> Pega o retorno desse elemento e insere nos parametros das funcoes abaixo
    |> File.read()
    |> handle_file()
    # file = File.read("#{filename}.csv") ---> Caso normal de se escrever
    # handle_file(file)
  end

  # defp handle_file({:ok, file}), do: file # pattern match -> é uma comparação entre o valor do lado direito com o do lado esquerdo a = b
  defp handle_file({:ok, result}) do
    result =      # pipe operator para atribuicao e parametros
      result
      |> String.split(",")
      # |> Enum.map(fn number -> String.to_integer(number) end) # esse executa varias vezes passando o valor para o parametro
      |> Stream.map(fn number -> String.to_integer(number) end) # eh mais perfomatico nessa situacao pois ele vai executar somente uma vez
      |> Enum.sum()

    {:ok, %{result: result}}

    # result = String.split(result, ",") ------> Caso normal
    # result = Enum.map(result, fn number -> String.to_integer(number) end)
    # result = Enum.sum(result)
    # result
  end
  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid File!"}}
end
