package DemoApi::Math;
use strict;
use warnings;
use base qw(Respite::Base);

sub __add__meta {
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
                required => 1,
            },
        },
        resp => {
            sum => 'The sum of value1 + value2',
        },
    };
}

sub __add {
    my ($self,$args) = @_;
    $self->validate_args($args);
    return {sum=>$args->{'value1'} + $args->{'value2'}};
}

sub __sub__meta {
    return {
        desc => 'Subtracts two numbers (value1 - value2)',
        args => {
            value1 => {
                desc => 'The first value',
                type => 'NUM',
                required => 1,
            },
            value2 => {
                desc => 'The second value',
                type => 'NUM',
                required => 1,
            },
        },
        resp => {
            sum => 'The sum of value1 + value2',
        },
    };
}

sub __sub {
    my ($self,$args) = @_;
    $self->validate_args($args);
    return {sum=>$args->{'value1'} - $args->{'value2'}};
}

sub not_an_api_method {
    return 1;
}

sub _private_method {
    return 1;
}

# /Users/jterry/demo_api_server/bin/demo_api_client add value1 1 value2 2

1;
