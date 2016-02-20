class UserPresenter < Presenter
  alias_method :user, :model

  def link_to_relationship other_user
    return 'Following' if user.led_by? other_user
    path = h.relationships_path(relationship: { user_id: user.id }, 
                              authenticity_token: h.form_authenticity_token)
    h.link_to 'Follow', path, remote: true, method: :post
  end
end
