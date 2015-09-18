@ProductRow = React.createClass
  render: ->
    if this.props.product.stocked
      name = this.props.product.name 
    else
      name = <span style={{color: 'red'}}>{this.props.product.name}</span>

    <tr>
      <td>{name}</td>
      <td>{this.props.product.price}</td>
    </tr>
  
