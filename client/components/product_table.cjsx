@ProductTable = React.createClass
  render: ->
    rows = []
    lastCategory = null
    for product in this.props.products
      if (product.category != lastCategory)
        rows.push(<ProductCategoryRow category={product.category} key={product.category} />)
      rows.push(<ProductRow product={product} key={product.name} />)
      lastCategory = product.category
    
    <table>
      <thead>
        <tr>
          <th>Name</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>{rows}</tbody>
    </table>
    
