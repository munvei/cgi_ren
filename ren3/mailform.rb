#!/usr/local/bin/ruby
# -*- mode:ruby; encoding:utf-8 -*-

require "cgi"
require "nkf"
#require "mailform-conf.rb"

$SAFE = 1
#ENV['PATH'] "/bin"

class CGI
    def get(name)
        !self[name].empty? ? self[name].strip : ""
    end
end

def header_out(title)
    print <<EOF1
Content-Type: text/html

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>#{title}</title>
<style type="text/css"><!--
    body, table, textarea {
        font-size: 10pt;
    }
    body {
        background-color: #fff;
    }
    h1 {
        color: white;
        background-color: #399;
        padding-left: 4px;
        font-family: sans-serif;
    }
    .mailform {
        background-color: #9cc;
    }
    a {
        color: #93f;
    }
    dt {
        margin-top: 5px;
        color: black;
        font-weight: bold;
        text-decoration: underline;
    }
    dd {
        border: 1px solid #9cc;
    }
    pre {
        margin: 0;
    }
    -->
        </style>
</head>
<body>
<h1>#{title}</h1>
EOF1
end

def startScript()
    print <<EOF
Content-Tupe: text/html

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>表示したい</title>
</head>
<body>
<h1>表示したい</h1>
EOF
end

def endScript()
    print <<EOF
</body>
</html>
EOF
end

def get_data(cgi)
    name = cgi.get("name")
    mail = cgi.get("mail")
    body = cgi.get("body")
    return [name, mail, body]
end

def print_comment(data)
    header_out("コメント受付")
    print <<EOF2
        <p>次の内容のコメントをメールとして送信しました。どうも有難うございます。

        <dl>
            <dt>お名前：
            <dd>#{CGI.escapeHTML(data[0])}
            <dt>メールアドレス：
            <dd>#{CGI.escapeHTML(data[1])}
            <dt>コメント：
            <dd><pre>#{CGI.escapeHTML(data[2])}</pre>
        </dl>

        <a href="./">[トップページ]へ戻る</a>

        <hr>
    </body>
    </html>
EOF2
end

def retry()
    header_out("コメント欄が空白です")

    print <<EOF
<p>コメント欄が空白になっています。よろしければ何かコメントをお願いします。
<p><a href="mailform.html">[フィードバック]に戻る</a> &nbsp;
   <a href="./">[トップページ]に戻る</a>

<hr>
</body>
</html>
EOF
end
