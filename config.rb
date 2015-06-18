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
  def extract_content(name)
    file = File.read(name)
    file.sub(stylesheet_regex, '')
  end
  def extract_stylesheet(name)
    file = File.read(name)
    stylesheet_regex.match(file) { |m| m[1] } || 'default'
  end
  def stylesheet_regex
    /\A!!! (\S*)$/
  end
end

remarks.each do |r|
  remark_name = File.basename(r)
  stylesheet = extract_stylesheet(r)
  proxy "/remarks/#{remark_name}", "/remark.html", :layout => "remark", :locals => { :remark => r, :stylesheet => stylesheet }
end

proxy "/remarks/", "/index.html"
proxy "/remarks", "/index.html"

configure :development do
  activate :livereload
end
