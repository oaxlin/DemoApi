package DemoApi;
use strict;
use warnings;
use base qw(Respite::Base);

sub api_meta {
    return shift->{'api_meta'} ||= { # vtable cached here
        namespaces => {
            math => {
                match => '__',
                package => 'DemoApi::Math',
            },
        },
    };
}

1;
