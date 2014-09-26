window.set_interval = (time, fn) ->
    return setInterval(fn, time)

window.clamp = (num, lower_bounds, upper_bounds) ->
    return Math.min(Math.max(num, lower_bounds), upper_bounds)

requirejs.config
    baseUrl: "/static/bin"

require ["game_controller"], (GameController) ->
    $canvas = document.getElementById("canvas")
    game = new GameController($canvas)
    game.start()
    return
