package Alarm;

use base "Exporter";
our @EXPORT = qw/get_time_left/;
use strict;
use warnings FATAL => 'all';

sub get_time_left {
    my ($end_time, $start_time) = @_;
    $start_time = time()
        unless $start_time;
    return $end_time > $start_time ? $end_time-$start_time : 0
}

package Alarm;

sub new {
    my ($class, %args) = @_;
    return bless(\%args, $class);
}

sub check {
    my $self = shift;
    if (get_time_left($self->{end_time} == 0)) {
        unless ($self->{did_play}) {
            $self->{player}->play();
            $self->{did_play} = 1;
        }
    }
}

1;