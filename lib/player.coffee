define ["game_object"], (GameObject) ->
    class Player extends GameObject
        @speed: 10
        @height: 40
        @width: 40

        constructor: ->
            super()
            @inventory = {}
            return

        render_moving_north: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#e51c23"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_moving_south: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#9c27b0"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_moving_east: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#5677fc"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_moving_west: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#ffeb3b"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_stationary_north: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#f9bdbb"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_stationary_south: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#e1bee7"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_stationary_east: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#d0d9ff"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

        render_stationary_west: ->
            temp_canvas = document.createElement("canvas")
            temp_canvas.height = @constructor.height
            temp_canvas.width = @constructor.width
            temp_context = temp_canvas.getContext("2d")
            temp_context.fillStyle = "#fff9c4"
            temp_context.beginPath()
            temp_context.arc(@constructor.height / 2, @constructor.width / 2, @constructor.width / 2, 0, 2*Math.PI, true)
            temp_context.fill()
            return temp_canvas

    return Player
