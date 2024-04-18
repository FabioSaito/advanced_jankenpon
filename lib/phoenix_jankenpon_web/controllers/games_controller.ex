defmodule PhoenixJankenponWeb.GamesController do
  use PhoenixJankenponWeb, :controller

  alias PhoenixJankenpon.Game

  def index(conn, params) do
    params
    |> Game.play()
    |> handle_response(conn)
  end

  def handle_response({:ok, message}, conn) do
    conn
    |> put_status(:ok)
    |> json(%{message: message})
  end

  def handle_response({:error, reason}, conn) do
    conn
    |> put_status(:bad_request)
    |> json(%{message: reason})
  end
end
