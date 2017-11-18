json.extract! guest, :id, :name, :email_id, :mobile_no, :in_time, :out_time, :created_at, :updated_at
json.url guest_url(guest, format: :json)
