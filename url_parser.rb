class UrlParser

  def initialize (new_url)
    @new_url = new_url
  end

  def scheme
    @new_url.split(":")[0]
  end

  def domain
    @new_url.split(":")[1].split("//")[1]
  end

  def port
    @port = @new_url.split(":").last.split("/").first
    if @port == ("") and scheme == "http"
      @port = 80.to_s
    elsif @port == ("") and scheme == "https"
      @port = 443.to_s
    else
      @port
    end
  end

  def path
    tokens = @new_url.split(":") #[2].split("/")[1].split("?")[0]
    if tokens.length == 3
      scheme, domain, the_rest =  tokens
      the_rest.split("/")[1].split("?")[0]
    else
      return nil
    end
  end

  def query_string
    @query_string =  @new_url.split("?").last.split("#").first
    @split = @query_string.split("&")
    @split.map! do |items|
      items.split("=")
    end
    @query_string = @split.to_h
end

  def fragment_id
    @fragment_id = @new_url.split("#").last
  end

end

url = UrlParser.new("http://www.google.com:60/search?q=cat&name=Tim#img=FunnyCat")
p url.fragment_id
