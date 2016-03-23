package DemoApi;
use strict;
use warnings;
use base qw(Respite::Base);

sub add__meta {
    return {
        desc => 'Adds value1 and value2',
        args => {
            value1 => {
                desc => 'The first value',
                type => 'NUM',
                required => 1,
            },
            value2 => {
                desc => 'The second value',
                type => 'NUM',
                default => 0,
            },
        },
        resp => {
            sum => 'The sum of value1 + value2',
        },
    };
}

sub add {
    my ($self,$args) = @_;
    $self->validate_args($args);
    return {sum=>$args->{'value1'} + $args->{'value2'}};
}

# /Users/jterry/demo_api_server/bin/demo_api_client add value1 1 value2 2

1;
