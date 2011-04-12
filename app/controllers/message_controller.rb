class MessageController < ApplicationController
  def message
  end

  def send_message
    device = C2dm::Device.find_by_registration_id(params[:registration_id])
    device ||= C2dm::Device.create(:registration_id => params[:registration_id])

    notification = C2dm::Notification.new
    notification.device = device
    notification.collapse_key = "private_message"
    notification.delay_while_idle = true
    notification.data = {"sender_id" => "js.sobeit@gmail.com", "message" => "This is a first message from c2dm_server!!"}
    # render :text => device.registration_id, :layout => false
    notification.save
    C2dm::Notification.send_notifications
  end

end
