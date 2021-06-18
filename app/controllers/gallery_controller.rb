require 'active_merchant'
class GalleryController < ApplicationController

  before_action :authenticate_user!, only: :checkout 

def index
    @shoes = Store.all
end


def checkout
	  	
  if request.post?
        puts session[:price]
        amount_to_charge = session[:price].to_i
      ActiveMerchant::Billing::Base.mode = :test

      gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
        :login => 'TestMerchant',
        :password => 'password',
        :test => 'true')

    # ActiveMerchant accepts all amounts as Integer values in cents
    # $10.00

    # The card verification value is also known as CVV2, CVC2, or CID
    credit_card = ActiveMerchant::Billing::CreditCard.new(
    :first_name         => params[:first_name],
    :last_name          => params[:last_name],
    :number             => params[:credit_no],
    :month              => params[:check][:month],
    :year               => params[:check][:year],
    :verification_value => params[:verification_number])

    # Validating the card automatically detects the card type
    if credit_card.validate.empty?
    #auth = gateway.authorize(amount_to_charge , credit_card)
    # Capture $10 from the credit card

      response = gateway.purchase(amount_to_charge, credit_card)
      puts response.inspect
      if response.success?
        flash[:notice]="Thank You for using Pink Flowers. The oreder details are sent to your mail"
        session[:cart_id]=nil
        redirect_to :action=>:purchase_complete
        #puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
        else
          flash[:notice] = "Gateway failure.Please try again"
          render :action=>"checkout"
        end
        else
          flash[:notice]= "Invalid card details"
          redirect_to :action=>"checkout"
          #UserNotifier.purchase_complete(session[:user],current_cart).deliver
        end

      end

    end

    def search
      @shoes = Store.find_by_sql("select * from stores WHERE name like '%#{params[:query]}%' or color like '%#{params[:query]}%'")
    end

end


#   def checkout
#     amount_to_charge = session[:price].to_i
#     if request.post?
#     ActiveMerchant::Billing::Base.mode = :test
#     # ActiveMerchant accepts all amounts as Integer values in cents
#     #amount = 100
#     credit_card = ActiveMerchant::Billing::CreditCard.new(
#     :first_name         => params[:first_name],
#     :last_name          => params[:last_name],
#     :number             => params[:credit_no].to_i,
#     :month              => params[:check][:month].to_i,
#     :year               => params[:check][:year].to_i,
#     :verification_value => params[:verification_number].to_i)

#     # Validating the card automatically detects the card type
#       if credit_card.valid?
#         gateway =ActiveMerchant::Billing::TrustCommerceGateway.new(
#         :login => 'TestMerchant',
#         :password =>'password',
#         :test => 'true' )
#         response = gateway.authorize(amount_to_charge , credit_card)
#         #response = gateway.purchase(amount_to_charge, credit_card)
#           if response.success?
#             gateway.capture(amount_to_charge, response.authorization)
#             flash[:notice] = "Authorized #{response.inspect}"
#             else
#             render :text => 'Fail:' + response.message.to_s and return
#             end
#           else
#           render :text =>'Credit card not valid: ' + credit_card.validate.to_s and return
#           end

#         #UserNotifier.purchase_complete(session[:user],current_cart).deliver
#         flash[:notice]="Thank You for using Amaron Beats. The oreder details are sent to your mail"
#         session[:cart_id]=nil
#         redirect_to :action=>:purchase_complete
#       end

#   end

# end



