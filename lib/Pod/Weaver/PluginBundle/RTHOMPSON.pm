use strict;
use warnings;
use feature 'switch';
use utf8;

package Pod::Weaver::PluginBundle::RTHOMPSON;
# ABSTRACT: (DEPRECATED) A bundle that implements RTHOMPSON's preferred L<Pod::Weaver> config

use Moose;
extends "Pod::Weaver::PluginBundle::Author::RTHOMPSON";
use namespace::autoclean;

before mvp_bundle_config => sub {
  warn "!!! [\@RTHOMPSON] is deprecated and may be removed in the future; replace it with [\@Author::RTHOMPSON]\n";
};

1; # Magic true value required at end of module
__END__

=head1 SYNOPSIS

DEPRECATED, use Pod::Weaver::PluginBundle::Author::RTHOMPSON instead.
