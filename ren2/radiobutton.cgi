#!/usr/local/bin/ruby

require "cgi"
$SAFE = 1

cgi = CGI.new

print <<EOF
Content-Type: text/html; charset=utf-8

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>アンケート結果</title>
    <style type="text/css"><!--
        th {
            text-align: right;
        }
    </style>
</head>

<body>
    <table border="1">
        <tr><th>年齢：
            <td>#{cgi["age"].first || "未選択"}
        <tr><th>性別：
            <td>#{cgi["sex"].first || "未選択"}
        <tr><th>モバイル機器：
            <td>#{cgi["portable"].first || "未選択"}
        <tr><th>その他：
            <td>#{CGI.escapeHTML(cgi["other"].first)}
EOF         
