activate :autoprefixer

helpers do
  def remarks
    Dir.glob('source/remarks/*.remark')
  end
  def remark_link(file)
    filename = File.basename(file, '.remark')
    title = filename.gsub("_", " ").titleize
    url = "/remarks/#{filename}.remark"

    link_to title, url
  end
  def show_remark(name)
    File.read(name)
  end
end

remarks.each do |remark|
  remark_name = File.basename(remark)
  proxy "/remarks/#{remark_name}", "/remark.html", :layout => "remark", :locals => { :remark => remark }
end

configure :development do
  activate :livereload
end
