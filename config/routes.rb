Rails.application.routes.draw do
  scope module: 'api' do
    namespace :v1 do
      resources :jobs do
        match 'mark_deleted', to: 'jobs#mark_deleted', via: 'put'
        resources :applies
      end
      resources :geeks do
        match 'mark_deleted', to: 'geeks#mark_deleted', via: 'put'
        resources :applies
      end
      resources :companies do
        match 'mark_deleted', to: 'companies#mark_deleted', via: 'put'
        resources :jobs
      end
    end
  end

  match "*path", to: "application#catch_404", via: :all
end
