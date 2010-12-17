use strict;
use warnings;
use utf8;

package Pod::Weaver::PluginBundle::RTHOMPSON;
# ABSTRACT: A bundle that implements RTHOMPSON's preferred L<Pod::Weaver> config

use namespace::autoclean;

use Pod::Weaver::Config::Assembler;
sub _exp { Pod::Weaver::Config::Assembler->expand_package($_[0]) }

=for Pod::Coverage mvp_bundle_config

=cut

sub mvp_bundle_config {
  return (
    [ '@RTHOMPSON/CorePrep',     _exp('@CorePrep'),    {} ],
    [ '@RTHOMPSON/Name',         _exp('Name'),         {} ],
    [ '@RTHOMPSON/Version',      _exp('Version'),      {} ],

    [ '@RTHOMPSON/prelude',      _exp('Region'),       { region_name => 'prelude'  } ],
    [ 'SYNOPSIS',                _exp('Generic'),      {} ],
    [ 'OVERVIEW',                _exp('Generic'),      {} ],
    [ 'DESCRIPTION',             _exp('Generic'),      {} ],

    [ 'ATTRIBUTES',              _exp('Collect'),      { command => 'attr'     } ],
    [ 'OPTIONS',                 _exp('Collect'),      { command => 'option'   } ],
    [ 'METHODS',                 _exp('Collect'),      { command => 'method'   } ],
    [ 'FUNCTIONS',               _exp('Collect'),      { command => 'function' } ],

    [ '@RTHOMPSON/Leftovers',    _exp('Leftovers'),    {} ],

    [ '@RTHOMPSON/postlude',     _exp('Region'),       { region_name => 'postlude' } ],

    [ '@RTHOMPSON/Installation', _exp('Installation'), {} ],
    [ '@RTHOMPSON/Authors',      _exp('Authors'),      {} ],
    [ '@RTHOMPSON/Legal',        _exp('Legal'),        {} ],
    [ '@RTHOMPSON/WarrantyDisclaimer', _exp('WarrantyDisclaimer'), {} ],

    [ '@RTHOMPSON/-Transformer', _exp('-Transformer'), { transformer => 'List' } ],
    [ '@RTHOMPSON-EnsureUniqueSections', _exp('-EnsureUniqueSections'), {} ],
 );
}

1; # Magic true value required at end of module
__END__

=head1 SYNOPSIS

In F<weaver.ini>:

    [@RTHOMPSON]

=head1 OVERVIEW

This is the bundle used by RTHOMPSON when using L<Pod::Weaver> to
generate documentation for Perl modules.

It is nearly equivalent to the following:

    [@CorePrep]

    [Name]
    [Version]

    [Region / prelude]

    [Generic / SYNOPSIS]
    [Generic / OVERVIEW]
    [Generic / DESCRIPTION]

    [Collect / ATTRIBUTES]
    command = attr

    [Collect / OPTIONS]
    command = option

    [Collect / METHODS]
    command = method

    [Collect / FUNCTIONS]
    command = function

    [Leftovers]

    [Region / postlude]

    [Installation]

    [Authors]
    [Legal]
    [WarrantyDisclaimer]

    [-Transformer]
    transformer = List

    [-EnsureUniqueSections]

=head1 BUGS AND LIMITATIONS

Please report any bugs or feature requests to
C<rct+perlbug@thompsonclan.org>.

=head1 SEE ALSO

=for :list
* L<Pod::Weaver>
