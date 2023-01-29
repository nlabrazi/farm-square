class RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.create_with_password(sign_up_params)
    if @user.save!
      redirect_to root_path, notice: 'Votre candidature a été envoyée. Merci!'
    else
      flash[:alert] = "Oups! Une erreur est survenue."
      redirect_to root_path
    end
  end

  def update
    @user = current_user
    if @user.update user_params
      redirect_to root_path, notice: 'Votre profil a été modifié. Merci!'
    else
      flash[:alert] = "Oups! Une erreur est survenue."
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :avatar)
  end

  def sign_up_params
    params.require(:user).permit(:name, :message, :email, :password)
  end

end
