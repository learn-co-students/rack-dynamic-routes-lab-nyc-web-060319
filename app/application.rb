class Application
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
    if req.path.match(/items/)
      resp.write(print_item(req.path.split("/items/")[1], resp))
    else
      resp.write("Route not found")
      resp.status = 404
    end

    resp.finish
  end

  def print_item(item_string, resp)
    price_hash = {}
    @@items.each do |item|
      price_hash[item.name] = item.price
    end
    if price_hash[item_string] != nil
      return price_hash[item_string]
    else
      resp.status = 400
      return "Item not found"
    end
  end
end
