defmodule PhoenixJankenponWeb.GamesControllerTest do
  use PhoenixJankenponWeb.ConnCase

  test "returns a message when player 1 wins", %{conn: conn} do
    player1_choice = "scissors"
    player2_choice = "paper"
    params = "player1=#{player1_choice}&player2=#{player2_choice}"

    response =
      conn
      |> get("/api/game?#{params}")

    assert response.status == 200
    assert response.resp_body == ~s({"message":"Player 1 wins!"})
  end

  test "returns a message when player 2 wins", %{conn: conn} do
    player1_choice = "scissors"
    player2_choice = "stone"
    params = "player1=#{player1_choice}&player2=#{player2_choice}"

    response =
      conn
      |> get("/api/game?#{params}")

    assert response.status == 200
    assert response.resp_body == ~s({"message":"Player 2 wins!"})
  end

  test "returns a message when it's a draw", %{conn: conn} do
    player1_choice = "stone"
    player2_choice = "stone"
    params = "player1=#{player1_choice}&player2=#{player2_choice}"

    response =
      conn
      |> get("/api/game?#{params}")

    assert response.status == 200
    assert response.resp_body == ~s({"message":"It's a draw!"})
  end

  test "returns an error message when the choices are invalid", %{conn: conn} do
    player1_choice = "invalid"
    player2_choice = "invalid"
    params = "player1=#{player1_choice}&player2=#{player2_choice}"

    response =
      conn
      |> get("/api/game?#{params}")

    assert response.status == 400
    assert response.resp_body == ~s({"message":"Invalid choice"})
  end
end
