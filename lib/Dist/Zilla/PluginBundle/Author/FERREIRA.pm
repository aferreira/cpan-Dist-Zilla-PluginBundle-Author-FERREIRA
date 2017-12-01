
package Dist::Zilla::PluginBundle::Author::FERREIRA;

# ABSTRACT: Build a distribution like FERREIRA

use Moose;
use Dist::Zilla 6;
with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure {
    my ($self) = @_;

    $self->add_bundle(
        '@Filter',
        {
            '-bundle'  => '@RJBS',
            '-version' => '5.010',
            '-remove'  => [ 'MakeMaker', 'MetaConfig', 'AutoPrereqs' ],
        }
    );

    $self->add_plugins('ModuleBuild');
    $self->add_plugins('MetaProvides::Package');
    $self->add_plugins(
        [ AutoPrereqs => { extra_scanners => [ 'Mojo', 'Jojo', 'Zim' ] } ] );
}

__PACKAGE__->meta->make_immutable;
no Moose;

1;

=encoding utf8

=head1 DESCRIPTION

This is the L<Dist::Zilla> plugin bundle that FERREIRA uses.
It is equivalent to:

    [@Filter]
    -bundle = @RJBS
    -version = 5.010
    -remove = MakeMaker
    -remove = MetaConfig
    -remove = AutoPrereqs

    [ModuleBuild]
    [MetaProvides::Package]
    [AutoPrereqs]
    extra_scanners = Mojo
    extra_scanners = Jojo
    extra_scanners = Zim

=head1 ACKNOWLEDGMENTS

RJBS for L<Dist::Zilla> and L<Dist:Zilla::PluginBundle::RJBS>.

=cut
