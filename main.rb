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
  @pfirst = params[:pfirst]
  @powerof = params[:powerof]
  if @pfirst
    @results = @pfirst.to_i ** @powerof.to_i
  end
  erb :power
end
get '/sqrt' do
  @first = params[:first]
  if @first
    @answer = Math.sqrt(@first.to_i)
  end
  erb :sqrt
end
get '/trip_calc' do
  @distance = params[:distance].to_f
  @mpg = params[:mpg].to_f
  @fppg = params[:fppg].to_f
  @speed = params[:speed]
  if @speed
    @hours = @distance / @speed.to_f
    @price = (@distance/@mpg)*@fppg
  end
  erb :trip_calc
end



get '/mortgage' do
  @p = params[:p].to_f
  @ir = params[:ir].to_f
  @n = params[:n]

  if @n
    @mir = (@ir/100)/12
    @x = (1+@mir)**@n.to_f
    @mort = @p*@mir*@x/(@x -1)
end
  erb :mortgage
end




get '/bmi' do
  @m_or_i = params[:m_or_i]
  @weight = params[:weight]
  @height = params[:height]
  if @m_or_i == "Imperial"
    @bmi = ((@weight.to_f*703) / (@height.to_f*@height.to_f)).ceil
  elsif @m_or_i == "Metric"
    @bmi = (@weight.to_f / (@height.to_f*@height.to_f)).ceil
  else 
  end
    
  erb :bmi
end


