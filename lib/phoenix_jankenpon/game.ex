defmodule PhoenixJankenpon.Game do
  @rules %{
    "scissors" => ["paper", "lizard"],
    "paper" => ["stone", "spock"],
    "stone" => ["lizard", "scissors"],
    "lizard" => ["spock", "paper"],
    "spock" => ["scissors", "stone"]
  }

  def play(choices) do
    player1_choice = choices["player1"]
    player2_choice = choices["player2"]

    if validate_choices(player1_choice, player2_choice) do
      determine_winner(player1_choice, player2_choice)
    else
      {:error, "Invalid choice"}
    end
  end

  defp validate_choices(player1_choice, player2_choice) do
    valid_choice?(player1_choice) and valid_choice?(player2_choice)
  end

  defp valid_choice?(choice) do
    Map.has_key?(@rules, choice)
  end

  defp determine_winner(player1_choice, player2_choice) when player1_choice == player2_choice do
    {:ok, result_message(:draw)}
  end

  defp determine_winner(player1_choice, player2_choice) do
    options = Map.get(@rules, player1_choice)
    if Enum.member?(options, player2_choice) do
      {:ok, result_message(:player1)}
    else
      {:ok, result_message(:player2)}
    end
  end

  defp result_message(result) do
    case result do
      :player1 -> "Player 1 wins!"
      :player2 -> "Player 2 wins!"
      :draw -> "It's a draw!"
    end
  end
end
