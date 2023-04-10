defmodule CanihostWeb.LiveviewTestLive do
  use CanihostWeb, :live_view

  def mount(_session, _params, socket) do
    {:ok, socket |> assign(:greeting, "Hello, world")}
  end

  def handle_event("say_goodbye", _params, socket) do
    {:noreply, socket |> assign(:greeting, "Goodbye, cruel world")}
  end

  def render(assigns) do
    ~H"""
    <h1><%= @greeting %></h1>
    <button phx-click="say_goodbye" class="px-4 py-2 bg-slate-800 text-slate-50 rounded">
      Say goodbye
    </button>
    """
  end
end
