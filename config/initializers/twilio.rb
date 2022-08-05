require 'rubygems' 
require 'twilio-ruby'

module TwilioSms
  def self.send_text( phone, content) 
    # phone :- phone number to which you want to send sms 
    # content :- Message text which you want to send
    twilio_sid = "ACe32122e9f5f89b0a90089fcdb8b0ef33" # paste twilio sid
    twilio_token = "d0d1f386c5b4f3ec16f01255268f0515" # paste twilio token
    twilio_phone_number = "+18597106329" # paste twilio number
    # twilio_user = current_view.contact_number;
    begin
      @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

      @twilio_client.api.account.messages.create(
      :from => twilio_phone_number,
      :to => phone, 
      :body=> content

      )
   
    
    rescue Twilio::REST::TwilioError => e
       return e.message
    end
    return "send"
  end
end
