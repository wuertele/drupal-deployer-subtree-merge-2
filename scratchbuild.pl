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

push @modules, { path => "drupal-6.x", remote => "drupal.org", url => "http://git.drupal.org/project/drupal.git", objects => 119358, commit => "88146f6d", };
push @modules, { remote => "drupal.org/admin_menu", path => "drupal-6.x/sites/all/modules/admin_menu/", url => "http://git.drupal.org/project/admin_menu.git", objects => 2701, commit => "18eb12b8d83767d3497942475e0290901c1ef008", };
push @modules, { remote => "drupal.org/advanced_help", path => "drupal-6.x/sites/all/modules/advanced_help/", url => "http://git.drupal.org/project/advanced_help.git", objects => 399, commit => "775335f1fa68a4bf05c1ca8d8fd0e544c56383a6", };
push @modules, { remote => "drupal.org/amazon", path => "drupal-6.x/sites/all/modules/amazon/", url => "http://git.drupal.org/project/amazon.git", objects => 1251, commit => "dc8728fbec694fd32697692192996af5200ea3e7", };
push @modules, { remote => "drupal.org/arrange_fields", path => "drupal-6.x/sites/all/modules/arrange_fields/", url => "http://git.drupal.org/project/arrange_fields.git", objects => 305, commit => "da30c2a180372fba7ed821592fbd5e63528c4a67", };
push @modules, { remote => "drupal.org/auto_nodetitle", path => "drupal-6.x/sites/all/modules/auto_nodetitle/", url => "http://git.drupal.org/project/auto_nodetitle.git", objects => 266, commit => "b1db6e6e8124f780c6423c8844a10d9c18174853", };
push @modules, { remote => "drupal.org/autoload", path => "drupal-6.x/sites/all/modules/autoload/", url => "http://git.drupal.org/project/autoload.git", objects => 106, commit => "be75c14defe982ff455fe2ece968927b7502c4e1", };
push @modules, { remote => "drupal.org/cck", path => "drupal-6.x/sites/all/modules/cck/", url => "http://git.drupal.org/project/cck.git", objects => 13079, commit => "5d44332bc62388b17e3f75990aa4bf22c028c6dd", };
push @modules, { remote => "drupal.org/cck_fieldgroup_tabs", path => "drupal-6.x/sites/all/modules/cck_fieldgroup_tabs/", url => "http://git.drupal.org/project/cck_fieldgroup_tabs.git", objects => 136, commit => "e9ffaeb0d9c0e80d079ed26131938e75d58ee405", };
push @modules, { remote => "drupal.org/codefilter", path => "drupal-6.x/sites/all/modules/codefilter/", url => "http://git.drupal.org/project/codefilter.git", objects => 324, commit => "cfdf6e65583127c1694b31b51c482fcb4518f7c7", };
push @modules, { remote => "drupal.org/comment_upload", path => "drupal-6.x/sites/all/modules/comment_upload/", url => "http://git.drupal.org/project/comment_upload.git", objects => 312, commit => "9eb528cc652045ae7253d0863ec88c4a2043dd66", };
push @modules, { remote => "drupal.org/computed_field", path => "drupal-6.x/sites/all/modules/computed_field/", url => "http://git.drupal.org/project/computed_field.git", objects => 302, commit => "a8b5ec3249fc918171704f31ee48558605a929b5", };
push @modules, { remote => "drupal.org/ctools", path => "drupal-6.x/sites/all/modules/ctools/", url => "http://git.drupal.org/project/ctools.git", objects => 8439, commit => "28aba335c4c56ea589110cf1430ddef54f43bc4f", };
push @modules, { remote => "drupal.org/currency", path => "drupal-6.x/sites/all/modules/currency/", url => "http://git.drupal.org/project/currency.git", objects => 483, commit => "f0c443ca4dab3e894b73b58c5ea8e74a95a89cee", };
push @modules, { remote => "drupal.org/devel", path => "drupal-6.x/sites/all/modules/devel/", url => "http://git.drupal.org/project/devel.git", objects => 4984, commit => "ff56ee79f0a66aea1578aedf95447e922333f5bc", tags => 1};
push @modules, { remote => "drupal.org/drupalforfirebug", path => "drupal-6.x/sites/all/modules/drupalforfirebug/", url => "http://git.drupal.org/project/drupalforfirebug.git", objects => 375, commit => "d28193a7500d518a1fe939d17b5df585fcfc743d", };
push @modules, { remote => "drupal.org/elements", path => "drupal-6.x/sites/all/modules/elements/", url => "http://git.drupal.org/project/elements.git", objects => 93, commit => "7a97dfe78bbbff800dbf5eed647c6b9c6fd83a17", };
push @modules, { remote => "drupal.org/faq", path => "drupal-6.x/sites/all/modules/faq/", url => "http://git.drupal.org/project/faq.git", objects => 1806, commit => "e162f8d2d478c6c4b7e05d274ee853f042856c7c", };
push @modules, { remote => "drupal.org/fbconnect", path => "drupal-6.x/sites/all/modules/fbconnect/", url => "http://git.drupal.org/project/fbconnect.git", objects => 508, commit => "a473473f7257628c4428e9e4ffa4de55b91f8adf", };
push @modules, { remote => "drupal.org/fckeditor", path => "drupal-6.x/sites/all/modules/fckeditor/", url => "http://git.drupal.org/project/fckeditor.git", objects => 3516, commit => "65f2f71f6a5223ad7ed00795aff6971cc3926c8e", };
push @modules, { remote => "drupal.org/feedback", path => "drupal-6.x/sites/all/modules/feedback/", url => "http://git.drupal.org/project/feedback.git", objects => 843, commit => "d3fcc8abb75e9223e1a1ae2b50fd484809c8d876", };
push @modules, { remote => "drupal.org/file_aliases", path => "drupal-6.x/sites/all/modules/file_aliases/", url => "http://git.drupal.org/project/file_aliases.git", objects => 151, commit => "1c0d56d3627f5a562ca3d77a6ea1a963f44580b6", };
push @modules, { remote => "drupal.org/filefield", path => "drupal-6.x/sites/all/modules/filefield/", url => "http://git.drupal.org/project/filefield.git", objects => 2146, commit => "317c8ec0d33ce544b8fb0d47443a2b0910423964", };
push @modules, { remote => "drupal.org/filefield_paths", path => "drupal-6.x/sites/all/modules/filefield_paths/", url => "http://git.drupal.org/project/filefield_paths.git", objects => 652, commit => "f3cf8f2e09b76b6c96c1d4c4440b6503e629afe2", };
push @modules, { remote => "drupal.org/flickr", path => "drupal-6.x/sites/all/modules/flickr/", url => "http://git.drupal.org/project/flickr.git", objects => 648, commit => "edd55a13e8b339135118e7aa2cf544db991540c7", };
push @modules, { remote => "drupal.org/format_number", path => "drupal-6.x/sites/all/modules/format_number/", url => "http://git.drupal.org/project/format_number.git", objects => 128, commit => "d1702e3fb6b4d67c387ab60806fe86c35c6a70e6", };
push @modules, { remote => "drupal.org/formatted_number", path => "drupal-6.x/sites/all/modules/formatted_number/", url => "http://git.drupal.org/project/formatted_number.git", objects => 98, commit => "45c3e97be052acbed077ff2bda9e7f72de2a89f6", };
push @modules, { remote => "drupal.org/globalredirect", path => "drupal-6.x/sites/all/modules/globalredirect/", url => "http://git.drupal.org/project/globalredirect.git", objects => 417, commit => "b1d1926fe703f88156b57b477d7c341bf85fd1ac", };
push @modules, { remote => "drupal.org/google_analytics", path => "drupal-6.x/sites/all/modules/google_analytics/", url => "http://git.drupal.org/project/google_analytics.git", objects => 2458, commit => "bfe2bdd3b7b29f83ef278aca48de5712460ad5eb", };
push @modules, { remote => "drupal.org/htmlpurifier", path => "drupal-6.x/sites/all/modules/htmlpurifier/", url => "http://git.drupal.org/project/htmlpurifier.git", objects => 341, commit => "30d9cdac5cd2883f2c64748946cfcc1fa38791b5", tags => 1};
push @modules, { remote => "drupal.org/htmlpurifier", path => "drupal-6.x/sites/all/modules/htmlpurifier/library", url => "http://git.drupal.org/project/htmlpurifier.git", objects => 341, commit => "213dfe955bb7ca84d8874d7fcebdaf5ed2bb5853", tags => 1};
push @modules, { remote => "drupal.org/image", path => "drupal-6.x/sites/all/modules/image/", url => "http://git.drupal.org/project/image.git", objects => 4648, commit => "d900d7f90711c5f00b6d6b0a388559d03c87b28a", };
push @modules, { remote => "drupal.org/imageapi", path => "drupal-6.x/sites/all/modules/imageapi/", url => "http://git.drupal.org/project/imageapi.git", objects => 482, commit => "d92f61af372ee82f6d8077acff34d0edf60b0147", };
push @modules, { remote => "drupal.org/imagefield", path => "drupal-6.x/sites/all/modules/imagefield/", url => "http://git.drupal.org/project/imagefield.git", objects => 1334, commit => "afb9715c2de1e8f7388f0e5cc4123dbe81848685", };
push @modules, { remote => "drupal.org/imagefield_tokens", path => "drupal-6.x/sites/all/modules/imagefield_tokens/", url => "http://git.drupal.org/project/imagefield_tokens.git", objects => 62, commit => "0418532bd9e5c827db312fdca5b1a20fe4b809ab", };
push @modules, { remote => "drupal.org/inputstream", path => "drupal-6.x/sites/all/modules/inputstream/", url => "http://git.drupal.org/project/inputstream.git", objects => 19, commit => "224bb3d5724d677ef81795f851a4f118cc4d8283", };
push @modules, { remote => "drupal.org/jquery_ui", path => "drupal-6.x/sites/all/modules/jquery_ui/", url => "http://git.drupal.org/project/jquery_ui.git", objects => 288, commit => "a51a5ab234e0b0544574c122ef9df9471b5ffe92", };
push @modules, { remote => "drupal.org/json_server", path => "drupal-6.x/sites/all/modules/json_server/", url => "http://git.drupal.org/project/json_server.git", objects => 75, commit => "528210e98290a4d771b4f4bbd8e6191946fcd8cd", };
push @modules, { remote => "drupal.org/link", path => "drupal-6.x/sites/all/modules/link/", url => "http://git.drupal.org/project/link.git", objects => 1021, commit => "bba5c8a52eb3a3f508e1613e0f6fa0d993a3a176", };
push @modules, { remote => "drupal.org/logintoboggan", path => "drupal-6.x/sites/all/modules/logintoboggan/", url => "http://git.drupal.org/project/logintoboggan.git", objects => 1569, commit => "1f32e758b7f7acc015c7b6cfa11cc91544891214", };
push @modules, { remote => "drupal.org/mimedetect", path => "drupal-6.x/sites/all/modules/mimedetect/", url => "http://git.drupal.org/project/mimedetect.git", objects => 127, commit => "ca9db254b785887fee344ad65970b4c1d25e40c2", };
push @modules, { remote => "drupal.org/mollom", path => "drupal-6.x/sites/all/modules/mollom/", url => "http://git.drupal.org/project/mollom.git", objects => 2252, commit => "ef7c9b1860b9a7799ab3df50c9b840ece8c14162", };
push @modules, { remote => "drupal.org/mvf", path => "drupal-6.x/sites/all/modules/mvf/", url => "http://git.drupal.org/project/mvf.git", objects => 58, commit => "361c8de57a69f66216512c65c219e6345bc2571d", };
push @modules, { remote => "drupal.org/node_export", path => "drupal-6.x/sites/all/modules/node_export/", url => "http://git.drupal.org/project/node_export.git", objects => 669, commit => "d3aa52fbfe170d04395283f11758c3d5d2b1ea38", };
push @modules, { remote => "drupal.org/nodereference_views", path => "drupal-6.x/sites/all/modules/nodereference_views/", url => "http://git.drupal.org/project/nodereference_views.git", objects => 26, commit => "0d65a9782d35bd702de80d6fbd345f81d41d8743", };
push @modules, { remote => "drupal.org/nodereference_views_select", path => "drupal-6.x/sites/all/modules/nodereference_views_select/", url => "http://git.drupal.org/project/nodereference_views_select.git", objects => 67, commit => "be9d41a3a0eb6639276d57b83fccbf7f2a1d04ea", };
push @modules, { remote => "drupal.org/page_title", path => "drupal-6.x/sites/all/modules/page_title/", url => "http://git.drupal.org/project/page_title.git", objects => 959, commit => "c8ba5261dbb3ae6237aa036725fca9ad62842e7f", };
push @modules, { remote => "drupal.org/panels", path => "drupal-6.x/sites/all/modules/panels/", url => "http://git.drupal.org/project/panels.git", objects => 9232, commit => "f1064ff1cb4079132ce080ffba43bbba8ea6a324", };
push @modules, { remote => "drupal.org/panels_tabs", path => "drupal-6.x/sites/all/modules/panels_tabs/", url => "http://git.drupal.org/project/panels_tabs.git", objects => 195, commit => "f01db87c0355dc5ea5102043c5b73f3aabfad0b6", };
push @modules, { remote => "drupal.org/path_redirect", path => "drupal-6.x/sites/all/modules/path_redirect/", url => "http://git.drupal.org/project/path_redirect.git", objects => 1113, commit => "66a3c6505d91249ea07254c35d4dd48796119fd2", };
push @modules, { remote => "drupal.org/pathauto", path => "drupal-6.x/sites/all/modules/pathauto/", url => "http://git.drupal.org/project/pathauto.git", objects => 3569, commit => "6395f3187dec5c7fa84d79117518c13449a21a4b", };
push @modules, { remote => "drupal.org/pingback", path => "drupal-6.x/sites/all/modules/pingback/", url => "http://git.drupal.org/project/pingback.git", objects => 84, commit => "03e4cec0dfafedef6ad7b8d0acaa5acb8bb9c669", };
push @modules, { remote => "drupal.org/project", path => "drupal-6.x/sites/all/modules/project/", url => "http://git.drupal.org/project/project.git", objects => 6515, commit => "f1d67eacd064474877e03975fddc26d950af3f52", };
push @modules, { remote => "drupal.org/project_issue", path => "drupal-6.x/sites/all/modules/project_issue/", url => "http://git.drupal.org/project/project_issue.git", objects => 4307, commit => "b474cda1b54fa509d31ae018e638aeafda36b1f6", };
push @modules, { remote => "drupal.org/recipe", path => "drupal-6.x/sites/all/modules/recipe/", url => "http://git.drupal.org/project/recipe.git", objects => 1651, commit => "a67247d0dda6ac0b681052bbb9936985cf7f68cc", };
push @modules, { remote => "drupal.org/rest_server", path => "drupal-6.x/sites/all/modules/rest_server/", url => "http://git.drupal.org/project/rest_server.git", objects => 95, commit => "9a4b882c22fcec93ac5c59147dd3af59e80d4aa9", };
push @modules, { remote => "drupal.org/robotstxt", path => "drupal-6.x/sites/all/modules/robotstxt/", url => "http://git.drupal.org/project/robotstxt.git", objects => 364, commit => "3e2844e33cf58a8bd995cfc85abda26ce54a04dc", };
push @modules, { remote => "drupal.org/search_files", path => "drupal-6.x/sites/all/modules/search_files/", url => "http://git.drupal.org/project/search_files.git", objects => 586, commit => "388afc11147cb7bb84d39e0662fcffd44ac6cfa5", };
push @modules, { remote => "drupal.org/seo_checklist", path => "drupal-6.x/sites/all/modules/seo_checklist/", url => "http://git.drupal.org/project/seo_checklist.git", objects => 245, commit => "85f989c9b20084f0eaa33b863544f04f8ab30d0f", };
push @modules, { remote => "drupal.org/services", path => "drupal-6.x/sites/all/modules/services/", url => "http://git.drupal.org/project/services.git", objects => 3837, commit => "c753db8a408ad82b20cf15b444feabddc0620fc7", };
push @modules, { remote => "drupal.org/site_verify", path => "drupal-6.x/sites/all/modules/site_verify/", url => "http://git.drupal.org/project/site_verify.git", objects => 157, commit => "898124aead6042aed7f829c8fedf32752366696c", };
push @modules, { remote => "drupal.org/tablefield", path => "drupal-6.x/sites/all/modules/tablefield/", url => "http://git.drupal.org/project/tablefield.git", objects => 147, commit => "40c54a58fa46410527a70ac1676e57bab8ed262d", };
push @modules, { remote => "drupal.org/tabs", path => "drupal-6.x/sites/all/modules/cck_fieldgroup_tabs/", url => "http://git.drupal.org/project/tabs.git", objects => 263, commit => "e9ffaeb0d9c0e80d079ed26131938e75d58ee405", tags => 1};
push @modules, { remote => "drupal.org/taxonomy_manager", path => "drupal-6.x/sites/all/modules/taxonomy_manager/", url => "http://git.drupal.org/project/taxonomy_manager.git", objects => 913, commit => "309726cec4112b42b2b3d14f0c292e448491883a", };
push @modules, { remote => "drupal.org/text_noderef", path => "drupal-6.x/sites/all/modules/text_noderef/", url => "http://git.drupal.org/project/text_noderef.git", objects => 11, commit => "5ba1c3930e33ec643095f65973ca4dfddf5b6e5e", };
push @modules, { remote => "drupal.org/textformatter", path => "drupal-6.x/sites/all/modules/textformatter/", url => "http://git.drupal.org/project/textformatter.git", objects => 18, commit => "f68bc4dbcd43e8a0e03976c862bafddd5c5f1bd7", };
push @modules, { remote => "drupal.org/token", path => "drupal-6.x/sites/all/modules/imagefield_tokens/", url => "http://git.drupal.org/project/token.git", objects => 1589, commit => "0418532bd9e5c827db312fdca5b1a20fe4b809ab", tags => 1};
push @modules, { remote => "drupal.org/transliteration", path => "drupal-6.x/sites/all/modules/transliteration/", url => "http://git.drupal.org/project/transliteration.git", objects => 1424, commit => "b43db0347a236dd76550f4444f6dc664d34c671d", };
push @modules, { remote => "drupal.org/units", path => "drupal-6.x/sites/all/modules/units/", url => "http://git.drupal.org/project/units.git", objects => 44, commit => "017d72796de9835974c25ccfbee3e3aa70049a46", };
push @modules, { remote => "drupal.org/unitsapi", path => "drupal-6.x/sites/all/modules/unitsapi/", url => "http://git.drupal.org/project/unitsapi.git", objects => 169, commit => "b8f2874a81e0a173cb76265d033dbabe779f5f07", };
push @modules, { remote => "drupal.org/user_register_notify", path => "drupal-6.x/sites/all/modules/user_register_notify/", url => "http://git.drupal.org/project/user_register_notify.git", objects => 175, commit => "d5ee0092aca9677ec3eeacf9cd8b864668b371b3", tags => 1};
push @modules, { remote => "drupal.org/viewreference", path => "drupal-6.x/sites/all/modules/viewreference/", url => "http://git.drupal.org/project/viewreference.git", objects => 162, commit => "28b4ff175ee69bff2452abb225d247aa3ab3a4fd", };
push @modules, { remote => "drupal.org/views", path => "drupal-6.x/sites/all/modules/nodereference_views/", url => "http://git.drupal.org/project/views.git", objects => 30188, commit => "0d65a9782d35bd702de80d6fbd345f81d41d8743", };
push @modules, { remote => "drupal.org/views_rss", path => "drupal-6.x/sites/all/modules/views_rss/", url => "http://git.drupal.org/project/views_rss.git", objects => 117, commit => "b30b54cb7c9573ce44d306e4fdbc149242f17f0d", };
push @modules, { remote => "drupal.org/viewsdisplaytabs", path => "drupal-6.x/sites/all/modules/viewsdisplaytabs/", url => "http://git.drupal.org/project/viewsdisplaytabs.git", objects => 69, commit => "15d618fbeee1257d0795f5245e03a9c9f96b0b42", };
push @modules, { remote => "drupal.org/webform", path => "drupal-6.x/sites/all/modules/views_rss/", url => "http://git.drupal.org/project/webform.git", objects => 7812, commit => "b30b54cb7c9573ce44d306e4fdbc149242f17f0d", tags => 1};
push @modules, { remote => "drupal.org/xmlsitemap", path => "drupal-6.x/sites/all/modules/xmlsitemap/", url => "http://git.drupal.org/project/xmlsitemap.git", objects => 10850, commit => "70ffd85ffe879daa101d631a858ec7f1cd841d53", };
push @modules, { remote => "facebook-php-sdk", path => "drupal-6.x/sites/all/modules/fbconnect/facebook-php-sdk/", url => "http://github.com/facebook/php-sdk.git", objects => 261, commit => "b14edfa34306e3f112d73fd72e73cf72f473c3d5", };
push @modules, { remote => "htmlpurifier.org", path => "drupal-6.x/sites/all/modules/htmlpurifier/", url => "git://repo.or.cz/htmlpurifier.git", objects => 16998, commit => "30d9cdac5cd2883f2c64748946cfcc1fa38791b5"};
push @modules, { remote => "drupal.org/ifeeldirty", path => "drupal-6.x/sites/all/modules/xmlsitemap/", url => "http://git.drupal.org/project/ifeeldirty.git", objects => 60, commit => "70ffd85ffe879daa101d631a858ec7f1cd841d53", };
push @modules, { remote => "drupal.org/minimalist", path => "drupal-6.x/sites/all/themes/ifeeldirty/", url => "http://git.drupal.org/project/minimalist.git", objects => 59, commit => "20127b2b8250cf7c73f7b6ca8839f3b497f1a269", tags => 1};
push @modules, { remote => "drupal.org/pixture_reloaded", path => "drupal-6.x/sites/all/themes/minimalist/", url => "http://git.drupal.org/project/pixture_reloaded.git", objects => 635, commit => "245ded7dc0c2b24d2e6207efaf6f6e946fa1bd08", };

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
foreach my $module (sort { ($a->{objects} || die ("$a->{remote} has no objects!")) <=> ($b->{objects} || die ("$b->{remote} has no objects!")) } @modules) {
    if (! defined $added_remote{$module->{remote}}) {
	$module->{url} =~ s/^http/git/;
	system_print ("git remote add -f $module->{remote} $module->{url}") == 0 or die "remote add failure: $?\n";
	if (defined $module->{tags}) { system_print ("git fetch --tags $module->{remote}") == 0 or die "remote tags failure: $?\n"; }
	$added_remote{$module->{remote}}++;
    }
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
