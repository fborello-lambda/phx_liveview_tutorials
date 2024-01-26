defmodule CounterComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~H"""
    <div>
      <h1 class="text-4xl font-bold text-center"> Counter: <%= @val %> </h1>
      <p class="text-center">
        <button phx-click="dec" class="text-4xl relative inline-flex items-center justify-center hover:animate-pulse  p-0.5 mb-2 me-2 w-32 h-32 overflow-hidden rounded-lg group bg-gradient-to-br from-green-500 to-blue-500 group-hover:from-green-500 group-hover:to-blue-500 hover:text-white dark:text-black focus:ring-4 focus:outline-none focus:ring-lime-200 dark:focus:ring-lime-800">
          -
        </button>
        <button phx-click="inc" class="text-4xl relative inline-flex items-center justify-center hover:animate-pulse  p-0.5 mb-2 me-2 w-32 h-32 overflow-hidden rounded-lg group bg-gradient-to-br from-red-200 to-red-400 group-hover:from-red-300 group-hover:to-red-200 hover:text-white dark:text-black focus:ring-4 focus:outline-none focus:ring-red-200 dark:focus:ring-red-800">
          +
        </button>
      </p>
    </div>
    """
  end
end
