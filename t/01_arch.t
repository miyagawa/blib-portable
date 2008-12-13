use Config;
use FindBin;
use File::Spec;

my $dir;
BEGIN {
    $dir = File::Spec->catfile($FindBin::Bin, "blib", "arch", $Config{archname});
    unless (-e $dir) {
        mkdir $dir, 0777 or die $!;
    }
}

use Test::More tests => 1;

my @before = @INC;
require blib::portable;
import blib::portable 't/blib';
my @after  = @INC;

is $#after, $#before + 2;

END { rmdir $dir }
