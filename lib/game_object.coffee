# based on http://arcturo.github.io/library/coffeescript/03_classes.html

moduleKeywords = ['initialize_with', 'mixable_inits']

calculate_new_position = ({current_position, destination_position, speed}={}) ->
    delta_multiplier = if destination_position < current_position then -1 else 1
    new_pos = current_position + (delta_multiplier * speed)
    if destination_position < current_position
        return clamp(new_pos, destination_position, current_position)
    else
        return clamp(new_pos, current_position, destination_position)

travelling_north_or_south = (current_position, destination_position) ->
    x_diff = Math.abs(current_position.x - destination_position.x)
    y_diff = Math.abs(current_position.y - destination_position.y)
    return y_diff > x_diff

define ->
    class GameObject
        @include: (obj) ->
            for key, value of obj when key not in moduleKeywords
                # Assign properties to the prototype
                @::[key] = value
            if obj.initialize_with?
                @::mixable_inits ?= []
                @::mixable_inits.push(obj.initialize_with)
            return @

        @speed: 0
        @height: 0
        @width: 0

        constructor: ->
            if @mixable_inits?
                for fn in @mixable_inits
                    fn.apply(@)

            @_moving = false
            @_direction = "west"
            @position = {x:0, y:0}
            @destination = {x:0, y:0}
            return

        render: ->
            if @_moving
                return @render_moving()
            else
                return @render_stationary()

        render_moving: -> return @["render_moving_#{@_direction}"]()
        render_stationary: -> return @["render_stationary_#{@_direction}"]()
        render_moving_north: -> throw "NotImplemented"
        render_moving_south: -> throw "NotImplemented"
        render_moving_east: -> throw "NotImplemented"
        render_moving_west: -> throw "NotImplemented"
        render_stationary_north: -> throw "NotImplemented"
        render_stationary_south: -> throw "NotImplemented"
        render_stationary_east: -> throw "NotImplemented"
        render_stationary_west: -> throw "NotImplemented"

        set_position: ({x, y}) ->
            @position.x = x if x?
            @position.y = y if y?
            return

        _move: (destination={}) =>
            if _.isEqual(@destination, @position)
                @_moving = false
                return

            if travelling_north_or_south(@position, @destination)
                if @destination.y < @position.y # travelling north
                    @_direction = "north"
                else                            # travelling south
                    @_direction = "south"
            else
                if @destination.x < @position.x # travelling west
                    @_direction = "west"
                else                            # travelling east
                    @_direction = "east"

            @position.x = calculate_new_position
                current_position:       @position.x
                destination_position:   @destination.x,
                speed:                  @constructor.speed

            @position.y = calculate_new_position
                current_position:       @position.y
                destination_position:   @destination.y
                speed:                  @constructor.speed

            requestAnimationFrame =>
                @_move(@destination)
                return
            return

        move: (destination={}) =>
            if not _.isEqual(@destination, destination)
                @destination = destination

            return if @_moving
            @_moving = true
            @_move(@destination)
            return

        set_direction: ->

            return

    return GameObject
