offset_game_object_coords = (game_object) ->
    return new_coords =
        x: game_object.position.x - (game_object.constructor.width / 2)
        y: game_object.position.y - (game_object.constructor.height / 2)

define ["player"], (Player) ->
    class GameController
        constructor: (@$canvas) ->
            @sync_canvas_size()
            @context = @$canvas.getContext("2d")
            @player = new Player()
            return

        start: ->
            @setup_handlers()
            @render()
            return

        setup_handlers: ->
            window.onresize = @sync_canvas_size

            if @$canvas.addEventListener
                @$canvas.addEventListener("click", @handle_clicks, false)
            else
                el.attachEvent('onclick', @handle_clicks)

            return

        sync_canvas_size: =>
            width = document.body.clientWidth
            height = document.body.clientHeight
            @$canvas.width = width
            @$canvas.height = height
            return

        handle_clicks: (e) =>
            {x, y} = e
            @player.move({x, y})
            return

        render: =>
            @context.clearRect(0, 0, @$canvas.width, @$canvas.height)
            player_coords = offset_game_object_coords(@player)
            @context.drawImage(@player.render(), player_coords.x, player_coords.y)
            requestAnimationFrame(@render)
            return

    return GameController
