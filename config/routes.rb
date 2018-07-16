Rails.application.routes.draw do
  resources :mappings
  resources :iacontrols do
  	collection do 
  		get 'convertToNIST'
  	end
  end
  resources :nistcontrols do
  	collection do 
  		get 'convertToIA'
  		get 'convertNumberToID'
  	end
  end
  resources :controls
  resources :dashboards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'dashboards#index', as: :home
end
