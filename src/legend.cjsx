React = require 'react'
{array, string, bool, func, number, object} = React.PropTypes


class Legend extends React.Component
    @propTypes:
        style: object

    @defaultProps:
        style: true

    render: ->
        # need to find a way to add default styles to the children
        <div className='rechart-legend' style={@props.style}>
            {@props.children}
        </div>


module.exports = Legend
