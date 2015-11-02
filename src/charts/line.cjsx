Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Line extends Core
    @propTypes:
        scales: object
        stacked: bool

    @defaultProps:
        stacked: false

    draw: =>
        Chart.Line @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()


module.exports = Line
