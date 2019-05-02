module ApplicationHelper
  def default_meta_tags
    {
        og: {
            title: "札幌学生野球連盟",
            description: "札幌学生野球連盟の公式サイトです。",
            url: "http://satsu6.com"
        }
    }
  end
end