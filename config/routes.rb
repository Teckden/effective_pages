class EffectivePagesRoutingConstraint
  def self.matches?(request)
    slug = request.path_parameters[:id] || '/'
    Effective::Page.where(:slug => slug).first.present?
  end
end

EffectivePages::Engine.routes.draw do
  scope :module => 'effective' do
    scope '/edit' do
      get '(/*id)' => "pages#edit", :as => :edit_effective_page
      put '(/*id)' => 'pages#update', :as => :effective_page
    end

    get '*id' => "pages#show", :constraints => EffectivePagesRoutingConstraint, :as => :effective_page
  end
end
