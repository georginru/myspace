#!/usr/bin/perl
use strict;
use warnings;
use File::Path qw(make_path);
use Text::Markdown 'markdown';

# Output directory
my $outdir = "output";
make_path($outdir);

# Read Markdown source
my $md_file = "index.md";   # create this in your repo
open my $mdfh, '<', $md_file or die "Cannot open $md_file: $!";
local $/;
my $markdown_text = <$mdfh>;
close $mdfh;

# Convert Markdown -> HTML
my $html_body = markdown($markdown_text);

# Wrap with HTML boilerplate
my $html = <<"HTML";
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perl Generated Site</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background: #f4f4f9;
            color: #333;
        }
        h1 {
            color: #0066cc;
        }
        p {
            font-size: 18px;
            line-height: 1.5;
        }
        .footer {
            margin-top: 50px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>
$html_body
<div class="footer">Powered by Perl 🚀</div>
</body>
</html>
HTML

# Write to output/index.html
open my $fh, '>', "$outdir/index.html" or die $!;
print $fh $html;
close $fh;

print "Converted $md_file -> $outdir/index.html\n";
