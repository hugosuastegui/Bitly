get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  erb :index
end

get '/correcto' do
  @all_urls = Url.all
  erb :words
end


post '/urls' do
  user_input = params[:user_input]
  Url.create(url_long: user_input)
  redirect to '/correcto'
end

# e.g., /q6bda
get '/:short_url' do
  user_input = params[:short_url]
  # redirige a la URL original
  puts "*" * 50
  p u = Url.find_by(url_short: user_input)
  u.click_count += 1
  u.save
  redirect to ("#{u.url_long}")
end

# VALIDATE USING FORMAT(2.5)