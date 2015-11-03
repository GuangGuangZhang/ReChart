_extend = require 'lodash/object/extend'
Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Line extends React.Component
    @propTypes: _extend({}, Core.propTypes, {
        scales: object
        stacked: bool
    })

    @defaultProps: _extend({}, Core.defautlProps, {
        stacked: false
    })

    draw: ->
        # `@` is set via .call()
        # from Core chart component
        @chart = new Chart(@canvas, {
            type: 'line'
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()
        })

    render: =>
        <Core {...@props} draw={@draw} />


module.exports = Line
