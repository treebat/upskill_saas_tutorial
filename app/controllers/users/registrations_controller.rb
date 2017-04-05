class Users::RegistrationsController < Devise::RegistrationsController
  # Exend default Devise gem behaviour so that
  # user signing up with the Pro account (plan ID 2)
  # save with a special Stripe subscription function.
  # Otherwise Devis signs up user as usual.
  def create
    super do |resource|
      if params[:plan]
        resource.plan_id = params[:plan]
        if resource.plan_id == 2
          resource.save_with_subscription
        else
          resource.save
        end
      end
    end
  end
end