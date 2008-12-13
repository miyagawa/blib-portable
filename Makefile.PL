use inc::Module::Install;
name 'blib-portable';
all_from 'lib/blib/portable.pm';

build_requires 'Test::More';
use_test_base;
auto_include_deps;
author_tests('xt');
WriteAll;
