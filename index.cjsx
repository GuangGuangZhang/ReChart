moment = require 'moment'
Chart = require './chart'
invariant = require 'invariant'
React = require 'react'
ReactDOM = require 'react-dom'

{array, string, bool, func, number, object} = React.PropTypes

class Line extends React.Component
    constructor: (props) ->
        super
        children = props.children
        children = [children] unless typeof children is 'Array'
        @state =
            dataSets: @getDataSets(props.children)
            legend: @getLegend(props.children)

    @propTypes:
        hover: object
        labels: array.isRequired
        scales: object
        stacked: bool

    #@defaultProps:

    getDataSets: (children) ->
        dataSets = []
        React.Children.forEach children, (element) ->
            if element.type.createDataFromElement
                dataSets.push(element.type.createDataFromElement(element))
        return dataSets

    getLegend: (children) ->
        children = React.Children.toArray children
        return c for c in children when c.type.displayName is 'Legend' or c.type.name is 'Legend'
        return null

    draw: =>
        console.log 'draw'
        Chart.Line @canvas,
            data:
                labels: @props.labels
                datasets: @state.dataSets
            options: @props

    setContext: (canvas) =>
        @canvas = canvas
        @draw()

    render: =>
        <div>
            <div className='rechart-legend'>
                {@state.legend}
            </div>
            <canvas ref={@setContext} id='cjs-line-chart' width='600' height='400'></canvas>
        </div>


class DataSet extends React.Component
    @propTypes:
        backgroundColor: string
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

    #_checkPropTypes: () ->

    @_createDataSet: (defaults={}, props) ->
        defaults[k] = v for k, v of props
        return defaults

    @createDataFromElement: (el) =>
        type = el.type
        dataSet = @_createDataSet(type.defaultProps, el.props)
        return dataSet

    render: ->
        invariant false, '<DataSet> elements are for passing data to the chart and shoudnt be rendered'


class Legend extends React.Component
    @propTypes:
        defaultStyle: bool

    @defaultProps:
        defaultStyle: true

    render: ->
        # need to find a way to add default styles to the children
        @props.children


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

    render: ->
        invariant false, '<ToolTips> element passes tool tip parameters to the chart object and shouldnt be rendered'


mock_data = [65, 59, 80, 81, 56, 55, 40]
mock_data2 = [43, 25, 87, 48, 75, 99, 18]
Example = React.createClass
    displayName: 'Example'

    render: ->
        <Line labels={["January", "February", "March", "April", "May", "June", "July"]}>
            <Legend>
                <ul className="example-chart-legend">
                    <li>
                        <span style={backgroundColor: 'green'} />
                        First
                    </li>
                    <li>
                        <span style={backgroundColor: 'yellow'} />
                        Second
                    </li>
                </ul>
            </Legend>
            {# <ToolTips /> }
            <DataSet
                label="First"
                fill=false
                borderColor="green"
                data=mock_data
                />
            <DataSet
                label="Second"
                fill=false
                borderColor="yellow"
                data=mock_data2
                />
        </Line>


ReactDOM.render <Example />, document.getElementById('line-graph')
