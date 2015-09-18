@FilterableProductTable = React.createClass
  render: ->
    <div>
      <SearchBar 
        filteredText=this.props.filteredText
        inStockOnly=this.props.inStockOnly
        onUserInput={this.props.onUserInput}/>
      <ProductTable 
        products={this.props.products} 
        filteredText=this.props.filteredText 
        inStockOnly=this.props.inStockOnly />
    </div>
