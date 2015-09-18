if Meteor.isClient
  Meteor.subscribe("products")
 
  Meteor.startup ->
    # Use Meteor.startup to render the component after the page is ready
    React.render <App />, document.getElementById "render-target"

if (Meteor.isServer)
  Meteor.startup ->
    if not Products.find().count()
      console.log "Adding some sample products to database"
      products = [
        {category: 'Sporting Goods', price: '$49.99', stocked: true, name: 'Football'},
        {category: 'Sporting Goods', price: '$9.99', stocked: true, name: 'Baseball'},
        {category: 'Sporting Goods', price: '$29.99', stocked: false, name: 'Basketball'},
        {category: 'Electronics', price: '$99.99', stocked: true, name: 'iPod Touch'},
        {category: 'Electronics', price: '$399.99', stocked: false, name: 'iPhone 5'},
        {category: 'Electronics', price: '$199.99', stocked: true, name: 'Nexus 7'}
      ];
      for product in products
        Products.insert product

  Meteor.publish "products", ->
    Products.find()


