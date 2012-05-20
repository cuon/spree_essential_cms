Spree::BaseController.class_eval do

  before_filter :get_pages
  helper_method :current_page

  # request.fullpath returns extra '/'
  # Example: //my_path
  # dirty fix: manual gsub for the moment
  def current_page
    @page ||= Spree::Page.find_by_path(request.fullpath.gsub('//', '/'))
  end

  def get_pages
    return if request.path =~ /^\/+admin/
    @pages ||= Spree::Page.visible.order(:position).all
  end

end
