#!/usr/bin/perl -w
#	-*- Perl -*-		scratchbuild.pl:	
#
#	(usage)% scratchbuild.pl
#
#	Inputs:		
#			
#	Outputs:		
#
#	David Wuertele	Tue Apr 26 11:21:23 2011	Steal This Program!!!

use strict;

my $quiet = undef;
my $dry_run = undef;

my $repository_path = shift;

if (! defined ($repository_path)) {
    die "usage:  $0 <repository_path>";
}

my %branch;

$branch{drupal}{parent} = 'master';
$branch{patches}{parent} = 'drupal';
$branch{devel}{parent} = 'patches';
$branch{deploy}{parent} = 'devel';

my @modules;

# some shortcuts
my $drupal_project = "http://git.drupal.org/project";
my $modules_path = "drupal-6.x/sites/all/modules";

push @modules, { path => "drupal-6.x", remote => "drupal.org", url => "$drupal_project/drupal.git", objects => 119358, commit => "88146f6d", };
push @modules, { remote => "drupal.org/admin_menu", path => "$modules_path/admin_menu/", url => "$drupal_project/admin_menu.git", objects => 2701, commit => "18eb12b8d", };
push @modules, { remote => "drupal.org/advanced_help", path => "$modules_path/advanced_help/", url => "$drupal_project/advanced_help.git", objects => 399, commit => "775335f1f", };
push @modules, { remote => "drupal.org/amazon", path => "$modules_path/amazon/", url => "$drupal_project/amazon.git", objects => 1251, commit => "dc8728fbe", };
push @modules, { remote => "drupal.org/arrange_fields", path => "$modules_path/arrange_fields/", url => "$drupal_project/arrange_fields.git", objects => 305, commit => "da30c2a18", };
push @modules, { remote => "drupal.org/auto_nodetitle", path => "$modules_path/auto_nodetitle/", url => "$drupal_project/auto_nodetitle.git", objects => 266, commit => "b1db6e6e8", };
push @modules, { remote => "drupal.org/autoload", path => "$modules_path/autoload/", url => "$drupal_project/autoload.git", objects => 106, commit => "be75c14de", };
push @modules, { remote => "drupal.org/cck", path => "$modules_path/cck/", url => "$drupal_project/cck.git", objects => 13079, commit => "5d44332bc", };
push @modules, { remote => "drupal.org/cck_fieldgroup_tabs", path => "$modules_path/cck_fieldgroup_tabs/", url => "$drupal_project/cck_fieldgroup_tabs.git", objects => 136, commit => "e9ffaeb0d", };
push @modules, { remote => "drupal.org/codefilter", path => "$modules_path/codefilter/", url => "$drupal_project/codefilter.git", objects => 324, commit => "cfdf6e655", };
push @modules, { remote => "drupal.org/comment_upload", path => "$modules_path/comment_upload/", url => "$drupal_project/comment_upload.git", objects => 312, commit => "9eb528cc6", };
push @modules, { remote => "drupal.org/computed_field", path => "$modules_path/computed_field/", url => "$drupal_project/computed_field.git", objects => 302, commit => "a8b5ec324", };
push @modules, { remote => "drupal.org/ctools", path => "$modules_path/ctools/", url => "$drupal_project/ctools.git", objects => 8439, commit => "28aba335c", };
push @modules, { remote => "drupal.org/currency", path => "$modules_path/currency/", url => "$drupal_project/currency.git", objects => 483, commit => "f0c443ca4", };
push @modules, { remote => "drupal.org/devel", path => "$modules_path/devel/", url => "$drupal_project/devel.git", objects => (4977+725), commit => "ff56ee79f", tags => 1};
push @modules, { remote => "drupal.org/drupalforfirebug", path => "$modules_path/drupalforfirebug/", url => "$drupal_project/drupalforfirebug.git", objects => 375, commit => "d28193a75", };
push @modules, { remote => "drupal.org/elements", path => "$modules_path/elements/", url => "$drupal_project/elements.git", objects => 93, commit => "7a97dfe78", };
push @modules, { remote => "drupal.org/faq", path => "$modules_path/faq/", url => "$drupal_project/faq.git", objects => 1806, commit => "e162f8d2d", };
push @modules, { remote => "drupal.org/fbconnect", path => "$modules_path/fbconnect/", url => "$drupal_project/fbconnect.git", objects => 508, commit => "a473473f7", };
push @modules, { remote => "drupal.org/fckeditor", path => "$modules_path/fckeditor/", url => "$drupal_project/fckeditor.git", objects => 3516, commit => "65f2f71f6", };
push @modules, { remote => "drupal.org/feedback", path => "$modules_path/feedback/", url => "$drupal_project/feedback.git", objects => 843, commit => "d3fcc8abb", };
push @modules, { remote => "drupal.org/file_aliases", path => "$modules_path/file_aliases/", url => "$drupal_project/file_aliases.git", objects => 151, commit => "1c0d56d36", };
push @modules, { remote => "drupal.org/filefield", path => "$modules_path/filefield/", url => "$drupal_project/filefield.git", objects => 2146, commit => "317c8ec0d", };
push @modules, { remote => "drupal.org/filefield_paths", path => "$modules_path/filefield_paths/", url => "$drupal_project/filefield_paths.git", objects => 652, commit => "f3cf8f2e0", };
push @modules, { remote => "drupal.org/flickr", path => "$modules_path/flickr/", url => "$drupal_project/flickr.git", objects => 648, commit => "edd55a13e", };
push @modules, { remote => "drupal.org/format_number", path => "$modules_path/format_number/", url => "$drupal_project/format_number.git", objects => 128, commit => "d1702e3fb", };
push @modules, { remote => "drupal.org/formatted_number", path => "$modules_path/formatted_number/", url => "$drupal_project/formatted_number.git", objects => 98, commit => "45c3e97be", };
push @modules, { remote => "drupal.org/globalredirect", path => "$modules_path/globalredirect/", url => "$drupal_project/globalredirect.git", objects => 417, commit => "b1d1926fe", };
push @modules, { remote => "drupal.org/google_analytics", path => "$modules_path/google_analytics/", url => "$drupal_project/google_analytics.git", objects => 2458, commit => "bfe2bdd3b", };
push @modules, { remote => "drupal.org/htmlpurifier", path => "$modules_path/htmlpurifier/", url => "$drupal_project/htmlpurifier.git", objects => (341+9), commit => "30d9cdac5", tags => 1};
#push @modules, { remote => "drupal.org/htmlpurifier", path => "$modules_path/htmlpurifier/library", url => "$drupal_project/htmlpurifier.git", objects => 341, commit => "18e538317", tree => "213dfe955bb7ca84d8874d7fcebdaf5ed2bb5853"};
push @modules, { remote => "htmlpurifier.org", path => "$modules_path/htmlpurifier/library", url => "git://repo.or.cz/htmlpurifier.git", objects => 16998, commit => "18e538317", tree => "213dfe955bb7ca84d8874d7fcebdaf5ed2bb5853"};
push @modules, { remote => "drupal.org/image", path => "$modules_path/image/", url => "$drupal_project/image.git", objects => 4648, commit => "d900d7f90", };
push @modules, { remote => "drupal.org/imageapi", path => "$modules_path/imageapi/", url => "$drupal_project/imageapi.git", objects => 482, commit => "d92f61af3", };
push @modules, { remote => "drupal.org/imagefield", path => "$modules_path/imagefield/", url => "$drupal_project/imagefield.git", objects => 1334, commit => "afb9715c2", };
push @modules, { remote => "drupal.org/imagefield_tokens", path => "$modules_path/imagefield_tokens/", url => "$drupal_project/imagefield_tokens.git", objects => 62, commit => "0418532bd", };
push @modules, { remote => "drupal.org/inputstream", path => "$modules_path/inputstream/", url => "$drupal_project/inputstream.git", objects => 19, commit => "224bb3d57", };
push @modules, { remote => "drupal.org/jquery_ui", path => "$modules_path/jquery_ui/", url => "$drupal_project/jquery_ui.git", objects => 288, commit => "a51a5ab23", };
push @modules, { remote => "drupal.org/json_server", path => "$modules_path/json_server/", url => "$drupal_project/json_server.git", objects => 75, commit => "528210e98", };
push @modules, { remote => "drupal.org/link", path => "$modules_path/link/", url => "$drupal_project/link.git", objects => 1021, commit => "bba5c8a52", };
push @modules, { remote => "drupal.org/logintoboggan", path => "$modules_path/logintoboggan/", url => "$drupal_project/logintoboggan.git", objects => 1569, commit => "1f32e758b", };
push @modules, { remote => "drupal.org/mimedetect", path => "$modules_path/mimedetect/", url => "$drupal_project/mimedetect.git", objects => 127, commit => "ca9db254b", };
push @modules, { remote => "drupal.org/mollom", path => "$modules_path/mollom/", url => "$drupal_project/mollom.git", objects => 2252, commit => "ef7c9b186", };
push @modules, { remote => "drupal.org/mvf", path => "$modules_path/mvf/", url => "$drupal_project/mvf.git", objects => 58, commit => "361c8de57", };
push @modules, { remote => "drupal.org/node_export", path => "$modules_path/node_export/", url => "$drupal_project/node_export.git", objects => 669, commit => "d3aa52fbf", };
push @modules, { remote => "drupal.org/nodereference_views", path => "$modules_path/nodereference_views/", url => "$drupal_project/nodereference_views.git", objects => 26, commit => "0d65a9782", };
push @modules, { remote => "drupal.org/nodereference_views_select", path => "$modules_path/nodereference_views_select/", url => "$drupal_project/nodereference_views_select.git", objects => 67, commit => "be9d41a3a", };
push @modules, { remote => "drupal.org/page_title", path => "$modules_path/page_title/", url => "$drupal_project/page_title.git", objects => 959, commit => "c8ba5261d", };
push @modules, { remote => "drupal.org/panels", path => "$modules_path/panels/", url => "$drupal_project/panels.git", objects => 9232, commit => "f1064ff1c", };
push @modules, { remote => "drupal.org/panels_tabs", path => "$modules_path/panels_tabs/", url => "$drupal_project/panels_tabs.git", objects => 195, commit => "f01db87c0", };
push @modules, { remote => "drupal.org/path_redirect", path => "$modules_path/path_redirect/", url => "$drupal_project/path_redirect.git", objects => 1113, commit => "66a3c6505", };
push @modules, { remote => "drupal.org/pathauto", path => "$modules_path/pathauto/", url => "$drupal_project/pathauto.git", objects => 3569, commit => "6395f3187", };
push @modules, { remote => "drupal.org/pingback", path => "$modules_path/pingback/", url => "$drupal_project/pingback.git", objects => 84, commit => "03e4cec0d", };
push @modules, { remote => "drupal.org/project", path => "$modules_path/project/", url => "$drupal_project/project.git", objects => 6515, commit => "f1d67eacd", };
push @modules, { remote => "drupal.org/project_issue", path => "$modules_path/project_issue/", url => "$drupal_project/project_issue.git", objects => 4307, commit => "b474cda1b", };
push @modules, { remote => "drupal.org/recipe", path => "$modules_path/recipe/", url => "$drupal_project/recipe.git", objects => 1651, commit => "a67247d0d", };
push @modules, { remote => "drupal.org/rest_server", path => "$modules_path/rest_server/", url => "$drupal_project/rest_server.git", objects => 95, commit => "9a4b882c2", };
push @modules, { remote => "drupal.org/robotstxt", path => "$modules_path/robotstxt/", url => "$drupal_project/robotstxt.git", objects => 364, commit => "3e2844e33", };
push @modules, { remote => "drupal.org/search_files", path => "$modules_path/search_files/", url => "$drupal_project/search_files.git", objects => 586, commit => "388afc111", };
push @modules, { remote => "drupal.org/seo_checklist", path => "$modules_path/seo_checklist/", url => "$drupal_project/seo_checklist.git", objects => 245, commit => "85f989c9b", };
push @modules, { remote => "drupal.org/services", path => "$modules_path/services/", url => "$drupal_project/services.git", objects => 3837, commit => "c753db8a4", };
push @modules, { remote => "drupal.org/site_verify", path => "$modules_path/site_verify/", url => "$drupal_project/site_verify.git", objects => 157, commit => "898124aea", };
push @modules, { remote => "drupal.org/tablefield", path => "$modules_path/tablefield/", url => "$drupal_project/tablefield.git", objects => 147, commit => "40c54a58f", };
push @modules, { remote => "drupal.org/tabs", path => "$modules_path/tabs/", url => "$drupal_project/tabs.git", objects => (255+12), commit => "e9ffaeb0d", tags => 1};
push @modules, { remote => "drupal.org/taxonomy_manager", path => "$modules_path/taxonomy_manager/", url => "$drupal_project/taxonomy_manager.git", objects => 913, commit => "309726cec", };
push @modules, { remote => "drupal.org/text_noderef", path => "$modules_path/text_noderef/", url => "$drupal_project/text_noderef.git", objects => 11, commit => "5ba1c3930", };
push @modules, { remote => "drupal.org/textformatter", path => "$modules_path/textformatter/", url => "$drupal_project/textformatter.git", objects => 18, commit => "f68bc4dbc", };
push @modules, { remote => "drupal.org/token", path => "$modules_path/token/", url => "$drupal_project/token.git", objects => (1578+22), commit => "0418532bd", tags => 1};
push @modules, { remote => "drupal.org/transliteration", path => "$modules_path/transliteration/", url => "$drupal_project/transliteration.git", objects => 1424, commit => "b43db0347", };
push @modules, { remote => "drupal.org/units", path => "$modules_path/units/", url => "$drupal_project/units.git", objects => 44, commit => "017d72796", };
push @modules, { remote => "drupal.org/unitsapi", path => "$modules_path/unitsapi/", url => "$drupal_project/unitsapi.git", objects => 169, commit => "b8f2874a8", };
push @modules, { remote => "drupal.org/user_register_notify", path => "$modules_path/user_register_notify/", url => "$drupal_project/user_register_notify.git", objects => (154+24), commit => "d5ee0092a", tags => 1};
push @modules, { remote => "drupal.org/viewreference", path => "$modules_path/viewreference/", url => "$drupal_project/viewreference.git", objects => 162, commit => "28b4ff175", };
push @modules, { remote => "drupal.org/views", path => "$modules_path/views/", url => "$drupal_project/views.git", objects => 30188, commit => "42fe4029c", };
push @modules, { remote => "drupal.org/views_rss", path => "$modules_path/views_rss/", url => "$drupal_project/views_rss.git", objects => 117, commit => "b30b54cb7"};
push @modules, { remote => "drupal.org/viewsdisplaytabs", path => "$modules_path/viewsdisplaytabs/", url => "$drupal_project/viewsdisplaytabs.git", objects => 69, commit => "15d618fbe", };
push @modules, { remote => "drupal.org/webform", path => "$modules_path/webform/", url => "$drupal_project/webform.git", objects => (7786+3666), commit => "157eb01f8", tags => 1};
push @modules, { remote => "drupal.org/xmlsitemap", path => "$modules_path/xmlsitemap/", url => "$drupal_project/xmlsitemap.git", objects => 10850, commit => "70ffd85ff", };
push @modules, { remote => "facebook-php-sdk", path => "$modules_path/fbconnect/facebook-php-sdk/", url => "http://github.com/facebook/php-sdk.git", objects => 261, commit => "b14edfa34", };
push @modules, { remote => "drupal.org/ifeeldirty", path => "drupal-6.x/sites/all/themes/ifeeldirty/", url => "$drupal_project/ifeeldirty.git", objects => 60, commit => "20127b2b8", };
push @modules, { remote => "drupal.org/minimalist", path => "drupal-6.x/sites/all/themes/minimalist/", url => "$drupal_project/minimalist.git", objects => (57+13), commit => "245ded7dc", tags => 1};
push @modules, { remote => "drupal.org/pixture_reloaded", path => "drupal-6.x/sites/all/themes/pixture_reloaded/", url => "$drupal_project/pixture_reloaded.git", objects => 635, commit => "ce6fa1f68", };

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

chdir "$repository_path/..";
my $repository_backup = "$repository_path" . ".bak";
system_print ("rm -rf $repository_backup");
system_print ("cp -a $repository_path $repository_backup");
chdir $repository_path;

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
