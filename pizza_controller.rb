require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('./models/pizza.rb')


get '/pizzas' do
  @pizzas = Pizza.all()
  erb(:index)
end

get '/pizzas/new' do
    erb(:new)
end

get '/pizzas/:id' do
  @pizza = Pizza.find( params[:id] )
  erb(:show)
end

post '/pizzas' do
  @pizza = Pizza.new( params )
  @pizza.save()
  erb(:create)
end

get '/pizzas/:id/delete' do
  @pizza_delete = Pizza.find( params[:id] )
  erb(:delete)
end

post '/pizzas/:id/delete' do
  @pizza = Pizza.find( params[:id] )
  @pizza.delete()
  redirect to('/pizzas')
end

get '/pizzas/:id/edit' do
  @pizza = Pizza.find( params[:id])
  erb(:edit)
end

post '/pizzas/:id/edit' do
  @pizza = Pizza.new(params)
  @pizza.update()
  redirect to('/pizzas/' + "#{@pizza.id}")
end
