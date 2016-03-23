package DemoApi::System;
use strict;
use warnings;
use base qw(Respite::Base);

sub __df__meta {
    return {
        desc => 'Disk usage utility (df)',
        args => {
            human => {
                desc    => 'Boolean, get human readable output',
                default => 0,
                alias   => 'h',
            },
            device => {
                desc => 'Optional device name (/dev/sda1)',
            },
        },
        resp => {
            df => [ {
                 "Available"  => 'man df for details',
                 "Capacity"   => 'man df for details',
                 "Filesystem" => 'man df for details',
                 "Mounted"    => 'man df for details',
                 "Used"       => 'man df for details',
                 # actual resp may vary by OS
            } ],
        },
    };
}

sub __df {
    my ($self, $args) = @_;
    my @opts;
    push @opts, '-h' if $args->{'human'};
    push @opts, $args->{'device'} if $args->{'device'};

    open my $fh, '-|', 'df', @opts or die "Failed to read df: $!";
    my @lines = <$fh>;
    chomp @lines;

    my @key = split(' ', shift @lines, -1); # Includes "Mounted" and "on". Real name is "Mounted on"
    pop @key if $key[-1] eq 'on';           # Strip off the useless 'on' field caused by splitting on space.

    my @result;
    for my $line(@lines) {
        my @val = split ' ', $line, -1;

        push(@result, +{ map {$key[$_] => $val[$_]} 0 .. $#key });
    }
    return {
        df => \@result,
    };
}

sub __ip__meta {
    return {
        desc => 'Get a box IP info',
        args => {}, #none
        resp => {
            local_ips => ['local ip'],
            remote_ip => 'remote ip',
        },
    }
}

sub __ip {
    my ($self, $args) = @_;

    # cheesy way to get local ips
    my $ips = `ifconfig | grep -E 'inet \\d+\\.'`;
    my @ips = ();
    foreach (split /\n/, $ips) {
        push @ips, $1 if /inet (\d+\.\d+\.\d+\.\d+)/;
    }

    require HTTP::Tiny;
    my $response = HTTP::Tiny->new->get('http://www.bluehost.com/ip');
    my ($remote) = $response->{'content'} =~ /Your current IP address is: <b>(\d+\.\d+\.\d+\.\d+)/;

    return {
        local_ips => \@ips,
        remote_ip => $remote,
    };
}

1;
