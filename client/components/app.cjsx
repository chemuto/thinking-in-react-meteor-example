# App component - represents the whole app
@App = React.createClass
  # This mixin makes the getMeteorData method work
  mixins: [ReactMeteorData]

  getInitialState: ->
    filteredText: '',
    inStockOnly: true

  handleUserInput: (filteredText, inStockOnly) ->
    this.setState({filteredText:filteredText, inStockOnly: inStockOnly})
 
  # # Loads items from the Tasks collection and puts them on this.data.tasks
  getMeteorData: ->
    query = {} 
    if this.state.filteredText
      filteredText = this.state.filteredText.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$&")
      mongoDbArr = []
      mongoDbArr.push({name: { $regex : filteredText, $options:"i" } })
      mongoDbArr.push({category: { $regex : filteredText, $options:"i" } })
      query = { $or: mongoDbArr }
    if this.state.inStockOnly
      query["stocked"] = true
    products: Products.find(query).fetch(),
 
  # renderTasks: -> 
  #   this.data.tasks.map (task) => 
  #     currentUserId = this.data.currentUser && this.data.currentUser._id;
  #     showPrivateButton = task.owner == currentUserId;
 
  #     <Task
  #       key={task._id}
  #       task={task}
  #       showPrivateButton={showPrivateButton} />;
    
  

  render: ->
    <div><FilterableProductTable 
      products=this.data.products 
      filteredText=this.state.filteredText 
      inStockOnly=this.state.inStockOnly 
      onUserInput={this.handleUserInput}/>

    <p>
      <strong>App Status:</strong><br/> 
      filteredText: {this.state.filteredText}<br/>
    inStockOnly: {if this.state.inStockOnly then "true" else "false"}</p></div>