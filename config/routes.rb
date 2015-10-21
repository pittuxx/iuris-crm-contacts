Iuris::Core::Engine.routes.draw do
	scope module: 'contacts' do
		resources :contacts	
	end
	
	namespace :admin do
		resources :contacts, only: :index
	end
end