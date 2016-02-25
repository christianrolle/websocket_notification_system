module ApplicationHelper
  def presented_current_user
    @presented_current_user ||= UserPresenter.new(@current_user, self)
  end
end
