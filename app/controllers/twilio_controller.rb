class TwilioController < ApplicationController

    skip_before_action :verify_authenticity_token

    class_variable_set(:@@map, {})
    class_variable_set(:@@links2, [
        "https://drive.google.com/open?id=1RcuhyJomhx-EGqLZ5K6vZKYQz4nW7MKOSYxvPFxWgNU", 
        "https://drive.google.com/open?id=1m3aibbUqSp__eAWl2hHu7EpPXSJ9dF0suGxVTt41WL4", 
        "https://drive.google.com/open?id=1boipwZlFhTkXmZfwFyBzdL6HntBT85U83ATPNHUrlRU", 
        "https://drive.google.com/open?id=1sy4ClesV8jPgIBwGi4i-2FI2CgW_jubxOuWhtoDVRSk", 
        "https://drive.google.com/open?id=1bmEzR6KBN7B5YV8N1uFiHZspWSp49W6R94FQrYQJ_qE", 
        "https://drive.google.com/open?id=1eYTVaf2Jg13iN18z4COUVTQ65RugTyr77kzXO_MI7hU", 
        "https://drive.google.com/open?id=130OnRgz08iDBRmIJ7MZdKISO1PEZY_I8wnUrScRL-10", 
        "https://drive.google.com/open?id=1P7ct1drJjEcktyXSfb8AFSRT870hQ6FMuDJUqLjxNO8", 
        "https://drive.google.com/open?id=1B3dmS03x3rv3TgnmhiW8x41_AIZGEFFd25AclzZWxSI", 
        "https://drive.google.com/open?id=1W3Ec7W7K2P6slyb9S_eIUdXVcGikpSWKi_igVMNInEc", 
        "https://drive.google.com/open?id=1FjnSWBTrLuJlKmtIgdy-BX3dNJtbMtDDB2L9WrG_n_o", 
        "https://drive.google.com/open?id=1oZLhQ7_qfIAhCZRz5G27sjuk-_AjBtDgohdEDlZuJ6g", 
        "https://drive.google.com/open?id=1KsYvD1SgfOZ9225M2Us8Erw0MYz6mMBsi2nEXzpsj8E", 
        "https://drive.google.com/open?id=17aCgdGOlialFDt_SAHyJN4KDg4um2xR99X_ROchCzOM", 
        "https://drive.google.com/open?id=1Ik0MeVmEmveEFNwTxWLwwAVeGgDdcSmEliON_RLXv8I", 
        "https://drive.google.com/open?id=1iXRUSfH7SoSsFwZ3QI4HEeO8CYKbzF_mxa14bwnbGH8", 
        "https://drive.google.com/open?id=1AAUSAJkLV8-6pQhHROBcLE9wZu3p3V0uI_tUZ4uQ5ek", 
        "https://drive.google.com/open?id=1k80_2MHux-MqQfRR1GLjF8KY7gqPH12EuGk16OMmaqg", 
        "https://drive.google.com/open?id=1g5mgS3DC6u2qIN4w_fpzcAGZRybC695oVirNmn1QlTs", 
       " https://drive.google.com/open?id=1m-160UFiv-XwtKooUeYASs09U768kPSQWnurCu-FfqI"])



    # def initialize()
    #     @counter = 0
    #     # @map = {"surina"=> 'fuckyou'}
    #     @links2 = [
    #     "https://drive.google.com/open?id=1RcuhyJomhx-EGqLZ5K6vZKYQz4nW7MKOSYxvPFxWgNU", 
    #     "https://drive.google.com/open?id=1m3aibbUqSp__eAWl2hHu7EpPXSJ9dF0suGxVTt41WL4", 
    #     "https://drive.google.com/open?id=1boipwZlFhTkXmZfwFyBzdL6HntBT85U83ATPNHUrlRU", 
    #     "https://drive.google.com/open?id=1sy4ClesV8jPgIBwGi4i-2FI2CgW_jubxOuWhtoDVRSk", 
    #     "https://drive.google.com/open?id=1bmEzR6KBN7B5YV8N1uFiHZspWSp49W6R94FQrYQJ_qE", 
    #     "https://drive.google.com/open?id=1eYTVaf2Jg13iN18z4COUVTQ65RugTyr77kzXO_MI7hU", 
    #     "https://drive.google.com/open?id=130OnRgz08iDBRmIJ7MZdKISO1PEZY_I8wnUrScRL-10", 
    #     "https://drive.google.com/open?id=1P7ct1drJjEcktyXSfb8AFSRT870hQ6FMuDJUqLjxNO8", 
    #     "https://drive.google.com/open?id=1B3dmS03x3rv3TgnmhiW8x41_AIZGEFFd25AclzZWxSI", 
    #     "https://drive.google.com/open?id=1W3Ec7W7K2P6slyb9S_eIUdXVcGikpSWKi_igVMNInEc", 
    #     "https://drive.google.com/open?id=1FjnSWBTrLuJlKmtIgdy-BX3dNJtbMtDDB2L9WrG_n_o", 
    #     "https://drive.google.com/open?id=1oZLhQ7_qfIAhCZRz5G27sjuk-_AjBtDgohdEDlZuJ6g", 
    #     "https://drive.google.com/open?id=1KsYvD1SgfOZ9225M2Us8Erw0MYz6mMBsi2nEXzpsj8E", 
    #     "https://drive.google.com/open?id=17aCgdGOlialFDt_SAHyJN4KDg4um2xR99X_ROchCzOM", 
    #     "https://drive.google.com/open?id=1Ik0MeVmEmveEFNwTxWLwwAVeGgDdcSmEliON_RLXv8I", 
    #     "https://drive.google.com/open?id=1iXRUSfH7SoSsFwZ3QI4HEeO8CYKbzF_mxa14bwnbGH8", 
    #     "https://drive.google.com/open?id=1AAUSAJkLV8-6pQhHROBcLE9wZu3p3V0uI_tUZ4uQ5ek", 
    #     "https://drive.google.com/open?id=1k80_2MHux-MqQfRR1GLjF8KY7gqPH12EuGk16OMmaqg", 
    #     "https://drive.google.com/open?id=1g5mgS3DC6u2qIN4w_fpzcAGZRybC695oVirNmn1QlTs", 
    #    " https://drive.google.com/open?id=1m-160UFiv-XwtKooUeYASs09U768kPSQWnurCu-FfqI"]
    # end


# Lol: <%= TwilioController.class_variable_get(:@@map).inspect %>

    
#     <%= form_for(:linktest, :url => give_link_path, :method => :post) do |f| %>
#     Email: <%= text_field_tag :email %>
#     <%= f.button :submit %>
# <% end %>
    

    def index
    end

    def voice
        response = Twilio::TwiML::Response.new do |r|
            r.Say "Yay! You're on Rails!", voice: "alice"
            r.Sms "Well done building your first Twilio on Rails 5 app!"
            r.Play "http://linode.rabasa.com/cantina.mp3"
        end
        render :xml => response.to_xml
    end


    def reply
    message_body = params["Body"]
    from_number = params["From"]
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: from_number,
      body: "Hello there, thanks for texting me. Your number is #{from_number}."
    )
    end


    def give_link
        @user_email = params[:email]
        # @links2 = 
        # @cat = @@links2
        # if @user_email == "3"
        #     @cat = "surina"
        # end
        if @@map.key?(@user_email)
            @cat = @@map[@user_email]
        else
            @@map[@user_email] = @@links2[0]
            # @cat = "nope"
            @@links2.delete_at(0)
            @cat = @@map[@user_email]
        end
        render "twilio/give_link"
        #puts

    end


    def send_text_message
        number_to_send_to = params[:number_to_send_to]
        boot_twilio
        # number_to_send_to = '+15106100222'
        sms = @client.account.sms.messages.create(
          :from => Rails.application.secrets.twilio_number,
          :to => number_to_send_to,
          :body => "Twilio Rails 171 test to #{number_to_send_to}"
        )

        # render :template => "visitors/index"
        # render "visitors/index"
        redirect_to :back
    end



  private

  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    print(account_sid)
    @client = Twilio::REST::Client.new account_sid, auth_token
  end



end



# note to self: simple form requires an model/object to work
# <%= simple_form_for(@user, :url => send_text_path, :method => :post) do |f| %>
#     <%= f.input :number_to_send_to , placeholder: "Phone number"%>
#     <%= f.button :submit %>
# <% end %>
