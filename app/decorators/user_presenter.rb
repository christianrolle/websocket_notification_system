class UserPresenter < Presenter
  alias_method :user, :model
  
  def link_to_like project
    return likes_text if likes?(project)
    path = h.project_likes_path(project_like: { project_id: project.id }, 
                              authenticity_token: h.form_authenticity_token)
    h.link_to 'Like', path, remote: true, method: :post
  end

  def link_to_relationship other_user
    return following_text if user.led_by? other_user
    path = h.relationships_path(relationship: { user_id: other_user.id }, 
                              authenticity_token: h.form_authenticity_token)
    h.link_to 'Follow', path, remote: true, method: :post
  end

  def following_text
    'Following'
  end

  def likes_text
    'Likes'
  end

  private

  def likes? project
    user.project_like_ids.include? project.id
  end
end
