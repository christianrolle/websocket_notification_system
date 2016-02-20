class Presenter < SimpleDelegator
  alias_method :model, :__getobj__

  def initialize model, view=nil
    @view = view
    super(model)
  end

  private
  def h
    @view
  end
end
