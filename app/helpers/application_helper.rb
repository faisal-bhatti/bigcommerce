module ApplicationHelper
  def user_json user
    {
      :status => "OK",
      :user_id => user.id
    }
  end
end