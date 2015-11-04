invariant = require 'invariant'
React = require 'react'

{array, string, bool, func, number, object} = React.PropTypes


class ToolTips extends React.Component
    @propTypes:
        backgroundColor: string
        caratSize: number
        cornerRadius: number
        enabled: bool
        fontColor: string
        fontFamily: string
        fontSize: number
        fontStyle: string
        mode: string
        multiKeyBackground: string
        titleFontColor: string
        titleFontFamily: string
        titleFontSize: number
        titleFontStyle: string
        xPadding: number
        xOffset: number
        yPadding: number
        # maybe allow children and pass to callbacks here?
        #callbacks: object

    @defaultProps:
        backgroundColor: '#000'
        caratSize: 8
        cornerRadius: 6
        enabled: true
        fontColor: '#fff'
        fontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
        fontSize: 10
        fontStyle: 'normal'
        mode: 'label'
        multiKeyBackground: '#000'
        titleFontColor: '#fff'
        titleFontFamily: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
        titleFontSize: 12
        titleFontStyle: 'bold'
        xPadding: 6
        yPadding: 6
        xOffset: 10

    render: ->
        invariant false, '<ToolTips> element passes tool tip parameters to the chart object and shouldnt be rendered'


module.exports = ToolTips
