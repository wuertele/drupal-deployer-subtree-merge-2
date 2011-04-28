#!/usr/bin/perl -w
#	-*- Perl -*-		DrupalConfig.pm:	
#
#	Usage:
#		use DrupalConfig;
#
#	David Wuertele	Thu Apr 28 11:35:06 2011	Steal This Program!!!

package DrupalConfig;
use Exporter;
@ISA = ('Exporter');
@EXPORT = ('drupal_modules', 'branch');

my %branch;

$branch{drupal}{parent} = 'master';
$branch{patches}{parent} = 'drupal';
$branch{devel}{parent} = 'patches';
$branch{deploy}{parent} = 'devel';

my @drupal_modules;

# some shortcuts
my $drupal_project = "http://git.drupal.org/project";
my $drupal_modules_path = "drupal-6.x/sites/all/modules";

require ModuleData.pl;

sub system_print {
    my @cmd = @_;

    my $started_at = time;
    print STDERR "Current time is $started_at\n";
    print STDERR join (" ", @cmd), "\n" if (! defined ($quiet));
    my $retval = system (@cmd) if (! defined ($dry_run));
    my $ended_at = time;
    my $duration = $ended_at - $started_at;
    print STDERR "Command took $duration seconds\n";
    return $retval;
}

1;
