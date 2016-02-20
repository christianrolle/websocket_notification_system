module ApplicationHelper
  def presented_current_user
    @presented_current_user ||= UserPresenter.new(@user, self)
  end
end
