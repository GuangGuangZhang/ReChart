_extend = require 'lodash/object/extend'
Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Bar extends React.Component
    @propTypes: _extend({}, Core.propTypes, {
        barShowStroke: bool
        scales: object
        staked: bool
    })

    @defaultProps: _extend({}, Core.defaultProps, {
        barShowStroke: true
        stacked: false
    })

    draw: ->
        # .call()'d from core
        Chart.Bar @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()

    render: =>
        <Core {...@props} draw={@draw} />


module.exports = Bar
