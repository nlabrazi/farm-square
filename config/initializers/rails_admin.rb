RailsAdmin.config do |config|

  ### Popular gems integration
  config.parent_controller = "::ApplicationController"

  ## == Devise ==
  config.authorize_with do |controller|
    unless current_user && current_user.profil_id == 3
      redirect_to(
        main_app.root_path,
        alert: "You are not permitted to view this page"
      )
    end
  end

  # Provide application name
  config.main_app_name = ["Administration", "Farm-Square"]

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    bulk_delete
    show
    edit
    delete
    #export
    #show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
