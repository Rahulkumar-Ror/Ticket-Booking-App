require "rails_helper"

RSpec.describe RefundNotificationMailer, type: :mailer do
  describe "customer_refund_notification" do
    let(:mail) { RefundNotificationMailer.customer_refund_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Customer refund notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

  describe "admin_refund_notification" do
    let(:mail) { RefundNotificationMailer.admin_refund_notification }

    it "renders the headers" do
      expect(mail.subject).to eq("Admin refund notification")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
