package DemoApi;
use strict;
use warnings;
use base qw(Respite::Base);

sub add {
    my ($self,$args) = @_;
    return {sum=>$args->{'value1'} + $args->{'value2'}};
}

# /Users/jterry/demo_api_server/bin/demo_api_client add value1 1 value2 2

1;
