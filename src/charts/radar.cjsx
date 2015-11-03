_extend = require 'lodash/object/extend'
Chart = require '../chart'
React = require 'react'

Core = require './core'
{array, string, bool, func, number, object} = React.PropTypes


class Radar extends React.Component
    @propTypes: _extend({}, Core.propTypes, {
        angleLineColor: string
        angleLineWidth: number
        angleShowLineOut: bool
        datasetFill: bool
        dataStroke: bool
        dataStrokeWidth: number
        pointLabelFontColor: string
        pointDot: bool
        pointDotRadius: number
        pointDotStrokeWidth: number
        pointHitDetectionRadius: number
        pointLabelFontFamily: string
        pointLabelFontSize: number
        pointLabelFontStyle: string
        scaleBeginAtZero: bool
        scaleShowLabels: bool
        scaleShowLine: bool
    })

    @defaultProps: _extend({}, Core.defaultProps, {
        angleLineColor: "rgba(0,0,0,.1)"
        angleLineWidth: 1
        angleShowLineOut: true
        datasetFill: true
        dataStroke: true
        dataStrokeWidth: 2
        pointLabelFontColor: '#666'
        pointDot: true
        pointDotRadius: 3
        pointDotStrokeWidth: 1
        pointHitDetectionRadius: 20
        pointLabelFontFamily: "'Arial'"
        pointLabelFontSize: 10
        pointLabelFontStyle: 'normal'
        scaleBeginAtZero: true
        scaleShowLabels: false
        scaleShowLine: true
    })

    draw: ->
        Chart.Radar @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @buildOptions()

    render: =>
        <Core {...@props} draw={@draw} />


module.exports = Radar

