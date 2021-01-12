# ┌─────────────────────────────────────────────────────────────────┐
# │ Inspired by the course "Elixir for Programmers" by Dave Thomas. │
# └─────────────────────────────────────────────────────────────────┘
defmodule Islands.Client.Mover do
  @moduledoc """
  Makes a move in the _Game of Islands_.

  ##### Inspired by the course [Elixir for Programmers](https://codestool.coding-gnome.com/courses/elixir-for-programmers) by Dave Thomas.
  """

  alias Islands.Client.{IslandType, State}
  alias Islands.Engine

  @coord_range 1..10
  @island_type_codes ["a", "d", "l", "s", "q"]

  @spec make_move(State.t()) :: State.t()
  def make_move(%State{move: [code, row, col]} = state)
      when code in @island_type_codes and row in @coord_range and
             col in @coord_range do
    %State{game_name: game_name, player_id: player_id} = state
    island_type = IslandType.new(code)
    tally = Engine.position_island(game_name, player_id, island_type, row, col)
    put_in(state.tally, tally)
  end

  def make_move(%State{move: ["all"]} = state) do
    %State{game_name: game_name, player_id: player_id} = state
    tally = Engine.position_all_islands(game_name, player_id)
    put_in(state.tally, tally)
  end

  def make_move(%State{move: [row, col]} = state)
      when row in @coord_range and col in @coord_range do
    %State{game_name: game_name, player_id: player_id} = state
    put_in(state.tally, Engine.guess_coord(game_name, player_id, row, col))
  end

  def make_move(%State{move: ["set"]} = state) do
    %State{game_name: game_name, player_id: player_id} = state
    put_in(state.tally, Engine.set_islands(game_name, player_id))
  end

  def make_move(%State{move: ["stop"]} = state) do
    %State{game_name: game_name, player_id: player_id} = state
    put_in(state.tally, Engine.stop_game(game_name, player_id))
  end
end
