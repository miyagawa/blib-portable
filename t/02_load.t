use Config;
use FindBin;
use File::Spec;
use File::Path;

my $dir;
BEGIN {
    $dir = File::Spec->catfile($FindBin::Bin, "blib", "arch", $Config{version}, $Config{archname});
    unless (-e $dir) {
        mkpath $dir, 0, 0777 or die $!;
        open my $out, ">", "$dir/Foo.pm";
        print $out "package Foo; \$VERSION = '1.0';\n1;\n";
    }
}

use Test::More tests => 1;
use blib::portable 't/blib';
use Foo;

is $Foo::VERSION, '1.0';

END { rmdir $dir }
