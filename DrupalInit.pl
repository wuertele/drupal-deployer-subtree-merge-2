#!/usr/bin/perl -w
#	-*- Perl -*-		DrupalInit.pl:	
#
#	(usage)% DrupalInit.pl
#
#	Inputs:		
#			
#	Outputs:		
#
#	David Wuertele	Thu Apr 28 11:34:48 2011	Steal This Program!!!

use strict;
use DrupalConfig;
use Cwd 'abs_path';

my $quiet = undef;
my $dry_run = undef;

my $repository_relpath = shift;
if (! defined ($repository_relpath)) {
    die "usage:  $0 <repository_path>";
}

my $repository_path = abs_path ($repository_relpath);

system_print ("mkdir -p $repository_path");
chdir $repository_path;
system_print ("git init");
system_print ("touch README");
system_print ("git add .");
system_print ("git commit -m 'initial commit'");

foreach my $branchname (keys %branch) {
    system_print ("git branch $branchname");
}

my %added_remote;
my @module_add_order;
@module_add_order = sort { ($a->{objects} || die ("$a->{remote} has no objects!")) <=> ($b->{objects} || die ("$b->{remote} has no objects!")) } @modules;
foreach my $module (@module_add_order) {
    if (! defined $added_remote{$module->{remote}}) {
#	$module->{url} =~ s/^http/git/;
	system_print ("git remote add -f $module->{remote} $module->{url}") == 0 or die "remote add failure: $?\n";
	if (defined $module->{tags}) { system_print ("git fetch --tags $module->{remote}") == 0 or die "remote tags failure: $?\n"; }
	$added_remote{$module->{remote}}++;
    }
}

chdir "$repository_path/.." or die "can't chdir to $repository_path/..: $!";
my $repository_backup = "$repository_path" . ".bak";
system_print ("rm -rf $repository_backup");
system_print ("cp -a $repository_path $repository_backup");
chdir $repository_path or die "can't chdir to $repository_path: $!";

my @module_merge_order = @modules;
foreach my $module (@module_merge_order) {
    system_print ("git merge -s ours --no-commit $module->{commit}");
    if (defined $module->{tree}) {
	system_print ("git read-tree --prefix=$module->{path} -u $module->{tree}");
    } else {
	system_print ("git read-tree --prefix=$module->{path} -u $module->{commit}");
    }
    system_print ("git commit -m 'Merged $module->{path}'");
}

# miscellaneous
system_print ("git checkout patches");
system_print ("git merge drupal");
chdir "$repository_path/drupal-6.x/sites/all/modules/jquery_ui" or die "can't chdir to $repository_path/drupal-6.x/sites/all/modules/jquery_ui: $!";
system_print ("wget http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip");
system_print ("unzip jquery.ui-1.6.zip");
system_print ("mv jquery.ui-1.6 jquery.ui");
system_print ("rm jquery.ui-1.6.zip");
chdir "$repository_path" or die "can't chdir to $repository_path: $!";
system_print ("git add drupal-6.x/sites/all/modules/jquery_ui/jquery.ui");
system_print ("git commit -m 'http://jquery-ui.googlecode.com/files/jquery.ui-1.6.zip'");


