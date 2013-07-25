# Given two collections (of possibly different lengths),
# get the Cartesian product of the sequences. 

require 'forwardable'

class CartesianProduct
  include Enumerable
  extend Forwardable
  @product
  attr_accessor :product

  def initialize (xCollection, yCollection)
  	@product = Array.new
  	xCollection.each {|x| yCollection.each {|y| @product << [x,y]}}
  end

	def each &block
		@product.each { |elem| yield elem}
	end
end
