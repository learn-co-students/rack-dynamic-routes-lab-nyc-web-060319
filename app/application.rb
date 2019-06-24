class Application

    @@item = [Item.new("Melon", 6), Item.new("Watermelon", 8)]

    def call(env)
        resp = Rack::Response.new 
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            product_name = req.path.split("/items/").last 
            if item = @@items.find {|p| p.name == product_name}
                resp.write item.price 
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
            resp.status = 404
            resp.write "Route not found"
        end
            resp.finish

    end

end