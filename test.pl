# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 1 };
use Linux::Svgalib ':all';
ok(1); # If we made it this far, we're ok.

eval 
{
   my $mode = G640x480x16;
};
if ( $@ )
{
  ok(0);
}
else
{
  ok(1);
}

my $vga = Linux::Svgalib->new();

$vga->disabledriverreport();

if($vga->init())
{
  ok(2);
}
else
{
  ok(0);
}
if($vga->setmode(4))
{
  ok(0);
}

for ( 0 ... 10000 )
{
  $vga->setcolor(int (rand 17));
  $vga->drawpixel(int( rand 640), int(rand 480));
}

my $line = [];
$vga->setmode(8);

for ( 1 .. 480 )
{
  @{$line} = ( 1 .. 255 );
  $vga->drawscanline($_,$line);
}

$vga->getch();
$vga->setmode(TEXT);
