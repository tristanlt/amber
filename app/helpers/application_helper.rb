module ApplicationHelper
    def title(page_title)
      content_for(:title) { Amber::Application.config.shorttitle.to_s+" | "+page_title.to_s }
    end
end
