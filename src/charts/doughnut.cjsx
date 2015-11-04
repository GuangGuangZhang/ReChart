_extend = require 'lodash/object/extend'
Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Doughnut extends React.Component
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
        console.log 'draw'
        console.log @props.percentageInnerCutout
        console.log @buildOptions()
        Chart.Doughnut @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()

    render: =>
        console.log 'render'
        console.log @props
        <Core {...@props} draw={@draw} />


module.exports = Doughnut
