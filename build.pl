#!/usr/bin/perl
use strict;
use warnings;
use File::Path qw(make_path);

# Output directory
my $outdir = "output";
make_path($outdir);

# Generate index.html
open my $fh, '>', "$outdir/index.html" or die $!;
print $fh <<'HTML';
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Perl Generated Site</title>
</head>
<body>
    <h1>Hello from Perl!</h1>
    <p>This HTML page was generated using Perl in GitHub Actions.</p>
</body>
</html>
HTML
close $fh;

print "HTML generated in $outdir/\n";
