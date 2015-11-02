Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Bar extends Core
    @propTypes:
        barShowStroke: bool
        scales: object

    @defaultProps:
        barShowStroke: true

    draw: =>
        Chart.Bar @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()


module.exports = Bar
