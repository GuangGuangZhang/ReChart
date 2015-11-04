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
            mode: 'label'
        maintainAspectRatio: true
        responsive: true
        responsiveAnimationDuration: 0
        defaultColor: 'rgba(0,0,0,0.1)'

    buildOptions: =>
        options = {}
        options[k] = v for k, v of @props
        options.tooltips = @state.toolTips or enabled: false
        return options

    _getOptionsFromElement: (el) ->
        options = el.type.defaultProps or {}
        options[k] = v for k, v of el.props
        return options

    _getChildrenByName: (children, name, onlyFirst=false) ->
        children = React.Children.toArray children
        childOptions = []
        for child in children
            displayName = child.type.displayName or child.type.name
            if displayName is name
                return child if onlyFirst
                childOptions.push(child)
        return childOptions if childOptions.length
        return null

    getDataSets: (children) =>
        return (@_getOptionsFromElement(c) for c in @_getChildrenByName(children, 'DataSet'))

    getToolTips: (children) =>
        toolTips = @_getChildrenByName(children, 'ToolTips', true)
        return if toolTips then @_getOptionsFromElement(toolTips) else null

    getLegend: (children) ->
        return @_getChildrenByName(children, 'Legend', true)

    setContext: (canvas) =>
        @canvas = canvas
        @props.draw.call(@)

    render: =>
        style = @props.style
        style.position = 'relative' unless style.position
        <div style={style}>
            {@state.legend}
            <canvas ref={@setContext} id='cjs-line-chart' />
        </div>


module.exports = Core
