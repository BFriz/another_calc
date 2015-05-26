require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do
  erb :home
end

get '/basic_calc' do 
  @operator = params[:operator]
  if @operator
    @first = params[:first].to_f
    @second = params[:second].to_f
    @result = case @operator
    when '+' then @first + @second
    when '-' then @first - @second
    when '*' then @first * @second
    when '/' then @first / @second
    end
  end
  erb :basic_calc  
end
get '/power' do
  @first = params[:first].to_i
  @powerof = params[:powerof].to_i
  if @first
    @results = @first ** @powerof
  end
  erb :power
end
get '/sqrt' do

  erb :sqrt
end
get '/trip_calc' do
  erb :trip_calc
end
get '/mortgage' do
  erb :mortgage
end
get '/bmi' do
  erb :bmi
end
