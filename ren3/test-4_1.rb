#!/usr/local/bin/ruby

require "./mailform.rb"
$SAFE = 1

def error_out()
    print "Content-Type:text/html\n\n"
    print "<p>#{CGI.escapeHTML($!.inspect)}<br>\n"
    $@.each {|x| print CGI.escapeHTML(x), "<br>\n"}
end

if __FILE__ == $0
    begin
        cgi = CGI.new
        data = get_data(cgi)

        if data[2] == ""
            retry()
        else
            print_comment(data)
        end
        
    rescue StandardError
        error_out()
    rescue ScriptError
        error_out()
    end
end
