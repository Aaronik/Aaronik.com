AaronikCom::Application.routes.draw do

  root 'home_page#home'
  post '/finger_print', to: 'home_page#finger_print'
  post '/comp_info', to: 'home_page#comp_info'
  post '/get_from_github', to: 'home_page#get_from_github'
  get '/resume', to: 'home_page#download_resume'

end
