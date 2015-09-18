@SearchBar = React.createClass
  toggleInStockOnly: ->
    this.props.onUserInput(this.refs.filterTextInput.getDOMNode().value,
      not this.props.inStockOnly)

  handleFilteredTextInput: ->
    this.props.onUserInput(this.refs.filterTextInput.getDOMNode().value,
      this.props.inStockOnly)

  render: ->
    <form>
      <input 
        type="text" 
        placeholder="Search..."
        ref="filterTextInput" 
        onChange={this.handleFilteredTextInput}
        value={this.props.filteredText if this.props.filteredText} />
      <p>
        <input 
          type="checkbox" 
          ref="inStockOnlyInput"
          readOnly={true} 
          checked={this.props.inStockOnly}
          onChange={this.toggleInStockOnly}/>
        {' '}
        Only show products in stock
      </p>
    </form>
    
