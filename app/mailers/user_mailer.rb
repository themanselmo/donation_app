class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = login_url

    mail(to: @user.email, subject: "Thank you for signing  up!")
  end

  def donation_received(donation)
    @donation = donation

    mail(to: @donation.fundraiser.user.email, subject: "New donation received!")
  end
end
