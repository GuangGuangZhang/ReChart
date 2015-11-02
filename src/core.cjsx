React = require 'react'
{array, string, bool, func, number, object} = React.PropTypes


class Core extends React.Component
    constructor: (props) ->
        super
        children = props.children
        children = [children] unless typeof children is 'Array'
        @state =
            dataSets: @getDataSets(children)
            legend: @getLegend(children)
            toolTips: @getToolTips(children)

    @propTypes:
        events: array
        responsive: bool
        responsiveAnimationDuration: number
        maintainAspectRatio: bool
        hover: object
        labels: array.isRequired
        onClick: func
        defaultColor: string

    @defaultProps:
        events: ["mousemove", "mouseout", "click", "touchstart", "touchmove", "touchend"]
        hover:
            onHover: null
            mode: 'single'
            animationDuration: 0
        maintainAspectRatio: true
        responsive: true
        responsiveAnimationDuration: 0
        defaultColor: 'rgba(0,0,0,0.1)'

    buildOptions: =>
        options = {k: v for k, v of @props}
        options.tooltips = @state.toolTips or enabled: false
        return options

    _getOptionsFromElement: (el) ->
        options = el.type.defaultProps or {}
        options[k] = v for k, v of el.props
        return options

    getDataSets: (children) =>
        dataSets = []
        React.Children.forEach children, (element) =>
            if element.type.displayName is 'DataSet' or element.type.name is 'DataSet'
                dataSets.push(@_getOptionsFromElement(element))
        return dataSets

    getToolTips: (children) =>
        children = React.Children.toArray children
        return @_getOptionsFromElement(c) for c in children when c.type.displayName is 'ToolTips' or c.type.name is 'ToolTips'
        return null

    getLegend: (children) ->
        children = React.Children.toArray children
        return c for c in children when c.type.displayName is 'Legend' or c.type.name is 'Legend'
        return null

    getToolTips: (children) ->
        children = React.Children.toArray children
        return c for c in children when c.type.displayName is 'ToolTips' or c.type.name is 'ToolTips'
        return enabled: false

    setContext: (canvas) =>
        @canvas = canvas
        @draw()

    render: =>
        <div style={position: 'relative', width: @props.width, height: @props.height}>
            {@state.legend}
            <canvas ref={@setContext} id='cjs-line-chart' />
        </div>


module.exports = Core
