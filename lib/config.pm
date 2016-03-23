package config;
use strict;
use warnings;
our %config;
our $config = \%config;

sub new {
    my $class = shift;
    my $self = bless ref($_[0]) ? shift : {@_}, $class;
    return $self;
}

sub load {
    # not used in the demo, just here to demonstrate how you would use this
    $config->{'sql_db'} = 'some db name';
    $config->{'sql_user'} = 'some user';
    $config->{'sql_pass'} = 'some password';

    $config->{'demo_api_service'} = {
        remote => 0, # 1 = Respite::Client ... 0 = local client
        host   => 'localhost',
        service_name => 'demo_api',
        brand  => 'test',
        pass   => '-',  # no password is required
        port   => 50080,
        no_ssl => 1,
        user   => 'jterry',
        group  => 'everyone',
        access_log_file => '/Users/jterry/demo_api_server/log/demo_api.access_log', # default works normally
        log_file => '/Users/jterry/demo_api_server/log/demo_api.access_log',        # default works normally
        pid_file => '/Users/jterry/demo_api_server/log/demo_api.pid',               # default works normally
    };
    return $config;
}

sub config { return $config; }
config::load();
1;
