require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!

  # Create a dynamic route at get '/reversename/:name' that accepts a name and renders the name backwards.
  get '/reversename/:name' do
    @name = params[:name]
    @name.reverse
  end

  # Create a dynamic route at get '/square/:number' that accepts a number and returns the 
  # square of that number. Note: Remember that values in params always come in as strings, 
  # and your return value for the route should also be a string (use .to_i and .to_s).
  get '/square/:number' do
    @number = params[:number]
    ((@number.to_i)**2).to_s
  end

  # Create a dynamic route at get '/say/:number/:phrase' that accepts a number and a phrase and 
  # returns that phrase in a string the number of times given.
  get '/say/:number/:phrase' do
    @number = params[:number]
    @phrase = params[:phrase]
    @phrase * @number.to_i
  end

  # Create a dynamic route at get '/say/:word1/:word2/:word3/:word4/:word5' that accepts five words and 
  # returns a string containing all five words (i.e. word1 word2 word3 word4 word5).
  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @word1 = params[:word1]
    @word2 = params[:word2]
    @word3 = params[:word3]
    @word4 = params[:word4]
    @word5 = params[:word5]
    @word1 + " " + @word2 + " " + @word3 + " " + @word4 + " " + @word5 + "."
  end

  # Create a dynamic route at get '/:operation/:number1/:number2' that accepts an operation 
  # (add, subtract, multiply or divide) and performs the operation on the two numbers provided. 
  # For example, going to /add/1/2 should render 3.
  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @number1 = params[:number1]
    @number2 = params[:number2]
    
    if @operation == "add"
      @op = "+"
    elsif @operation == "subtract"
      @op = "-"
    elsif @operation == "multiply"
      @op = "*"
    elsif @operation == "divide"
      @op = "/"
    end

    @number1.to_i.send(@op, @number2.to_i).to_s
      
  end
end