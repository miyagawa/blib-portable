use Config;
use FindBin;
use File::Spec;

my $dir;
BEGIN {
    $dir = File::Spec->catfile($FindBin::Bin, "blib", "arch", $Config{version}, $Config{archname});
    unless (-e $dir) {
        mkpath $dir, 0, 0777 or die $!;
    }
}

use Test::More tests => 1;

my @before = @INC;
require blib::portable;
import blib::portable 't/blib';
my @after  = @INC;

is $#after, $#before + 1;

END { rmdir $dir }
