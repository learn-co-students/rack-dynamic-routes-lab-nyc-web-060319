require 'pry'
class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.match(/items/)
            name = req.path.split("/items/").last
            item = Item.find(name)
            # binding.pry
            if item != nil
                resp.write item.price.to_s
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end

        resp.finish
    end

end

