_extend = require 'lodash/object/extend'
Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Pie extends React.Component
    @propTypes: _extend({}, Core.propTypes, {
        segmentShowStroke: bool
        segmentStrokeColor: string
        segmentStrokeWidth: number
        percentageInnerCutout: number
        animationSteps: number
        animationEasing: string
        animateRotate: bool
        animateScale: bool
    })

    @defaultProps: _extend({}, Core.defautlProps, {
        segmentShowStroke: true
        segmentStrokeColor: "#fff"
        segmentStrokeWidth: 2
        percentageInnerCutout: 50
        animationSteps: 100
        animationEasing: "easeOutBounce"
        animateRotate: true
        animateScale: false
    })

    draw: ->
        @chart = new Chart(@canvas, {
            type: 'pie'
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()
        })

    render: =>
        <Core {...@props} draw={@draw} />


module.exports = Pie

