class Application
  @@items = []

  def call(env)
  resp = Rack::Response.new
  req = Rack::Request.new(env)

  if req.path.match("/items/")
    item_requested = req.path.split("/items/").last
    item = find_item(item_requested)
    if item == nil
      resp.write "Item not found"
      resp.status = 400
    else
      resp.write item.price
    end
  else
    resp.write "Route not found"
    resp.status = 404
  end
  resp.finish
end



  def find_item(item_requested)
    item = @@items.find{|item| item.name == item_requested}
  end
end
