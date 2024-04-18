# PhoenixJankenpon

This is a simple project to run a [Rock-Paper-Scissor](https://fagocitandooplaneta.wordpress.com/2010/10/19/pedra-papel-tesoura-versao-nerd/) game

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.


## Endpoint

### GET /api/game
access via query params

eg: `/api/game?player1=scissors&player2=paper`

valid options:
- scissors
- paper
- stone
- lizard
- spock