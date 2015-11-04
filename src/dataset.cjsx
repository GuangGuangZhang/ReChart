React = require 'react'
invariant = require 'invariant'
{array, string, bool, func, number, oneOfType} = React.PropTypes


class DataSet extends React.Component
    @propTypes:
        backgroundColor: oneOfType [string, array]
        borderColor: string
        borderCapStyle: string
        borderDash: array
        borderDashOffset: number
        borderJoinStyle: string
        data: array.isRequired
        fill: bool
        fillColor: string
        label: string
        pointBackgroundColor: string
        pointBorderColor: string
        pointBorderWidth: number
        pointHighlightFill: string
        pointHighlightStroke: string
        pointHoverBackgroundColor: string
        pointHoverBorderColor: string
        pointHoverBorderWidth: number
        pointHoverRadius: number
        pointStrokeColor: string
        yAxisID: string

    #@defaultProps:

    render: ->
        invariant false, '<DataSet> elements are for passing data to the chart and shoudnt be rendered'


module.exports = DataSet
