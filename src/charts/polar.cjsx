_extend = require 'lodash/object/extend'
Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Polar extends React.Component
    @propTypes: _extend({}, Core.propTypes, {
        scaleShowLabelBackdrop: bool
        scaleBackdropColor: string
        scaleBeginAtZero: bool
        scaleBackdropPaddingY: number
        scaleBackdropPaddingX: number
        scaleShowLine: bool
        segmentShowStroke: bool
        segmentStrokeColor: string
        segmentStrokeWidth: number
        animationSteps: number
        animationEasing: string
        animateRotate: bool
        animateScale: bool
    })

    @defaultProps: _extend({}, Core.defaultProps, {
        scaleShowLabelBackdrop: true
        scaleBackdropColor: "rgba(255,255,255,0.75)"
        scaleBeginAtZero: true
        scaleBackdropPaddingY: 2
        scaleBackdropPaddingX: 2
        scaleShowLine: true
        segmentShowStroke: true
        segmentStrokeColor: "#fff"
        segmentStrokeWidth: 2
        animationSteps: 100
        animationEasing: "easeOutBounce"
        animateRotate: true
        animateScale: false
    })

    draw: ->
        Chart.PolarArea @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()

    render: =>
        <Core {...@props} draw={@draw} />


module.exports = Polar
