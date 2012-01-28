module ApplicationHelper
    def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end

  def per_page
    select_tag :per_page, options_for_select([10,20,30,50], @per_page.to_i), :onchange => "if(this.value){window.location='?per_page='+this.value+'&page=#{@page}'+'&query=#{@query}'}"
  end
end
