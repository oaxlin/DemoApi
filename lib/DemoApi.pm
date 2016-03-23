package DemoApi;
use strict;
use warnings;
use base qw(Respite::Base);

sub api_meta {
    return shift->{'api_meta'} ||= {
        namespaces => {
            math => {
                match => '__',
                package => 'DemoApi::Math',
            },
            system => {
                match => '__',
                package => 'DemoApi::System',
            },
        },
    };
}

1;
