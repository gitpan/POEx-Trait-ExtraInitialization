
use strict;
use warnings;



use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'Provides a initialization behaviors for POEx::Role::SessionInstantiation objects',
  'AUTHOR' => 'Nicholas Perez <nperez@cpan.org>',
  'BUILD_REQUIRES' => {
    'POE' => '0',
    'POEx::Role::SessionInstantiation' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'POEx-Trait-ExtraInitialization',
  'EXE_FILES' => [],
  'LICENSE' => 'gpl',
  'NAME' => 'POEx::Trait::ExtraInitialization',
  'PREREQ_PM' => {
    'MooseX::Declare' => '0',
    'MooseX::Types::Moose' => '0',
    'POEx::Role::SessionInstantiation::Meta::Session::Events' => '0'
  },
  'VERSION' => '1.102770',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



