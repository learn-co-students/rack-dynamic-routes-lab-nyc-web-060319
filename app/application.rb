

class Application

	def call (env)
		resp = Rack::Response.new
		req = Rack::Request.new(env)

		if req.path.match(/items/)
			item_name = req.path.split("/items/").last
			item_obj = @@items.map do |i|
				puts "i is: #{i}"
				puts "i.name is: #{i.name}"
				puts "i.price is : #{i.price}"
				puts "item_name is #{item_name}"
				if i.name == item_name 
						resp.write "#{i.price}"
						resp.status = 200
						puts "200?"
				else 
					resp.write "Item not found"
					puts "400 !! "
					resp.status = 400
				end
			end
		else 
			resp.write "Route not found"
			resp.status = 404
		end
	resp.finish
	end


end
