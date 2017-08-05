defmodule Identicon do
  def main (input) do
    input
    |> hash_input
    |> pickcolor
    |> build_grid
  end

  # Chunk organiza a lista em sublistas com 3 indices cada
  def build_grid(%Identicon.Image{hex: hex} = image) do
    hex
    |> Enum.chunk(3)

  end

  # 3 primeiros indices definem a cor
  # atribui ao atributo color
  # e Hex recebe a image
  def pickcolor(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  # transforma a string em um Hash md5
  def hash_input (input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %Identicon.Image{hex: hex}
  end
end
