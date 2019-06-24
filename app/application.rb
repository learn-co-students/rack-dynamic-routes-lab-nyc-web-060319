class Application

    item = Item.new

    def call(env)
        resp = Rack::Response.new 
        req = Rack::Request.new(env)

        if req.path == "/items/item.name"
            resp.write "item.price"
        else
            resp.write "Item not found"
            resp.status = 404
        end

        resp.finish
        
    end

end