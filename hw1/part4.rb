class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	attr_accessor :name, :calories

	def healthy?
		if @calories < 200
			true
		else
			false
		end
	end

	def delicious?
		true
	end
end

class JellyBean < Dessert
	def initialize(name, calories, flavor)
		@name = name
		@calories = calories
		@flavor = flavor
	end

	@@not_good =  "black licorice"
	attr_accessor :flavor
	
	def delicious?
		if @flavor == @@not_good
			false
		else
			super
		end
	end
end
