use strict;
use warnings FATAL => 'all';

use Alarm qw/get_time_left/;
use Test::Spec;
use Test::MockObject;

describe "get_time_left()" => sub {

    it("returns difference with current time" => sub {
        is(get_time_left(2, 1), 1);
    });

    it("returns zero when time is over" => sub {
        is(get_time_left(0, 1), 0);
    });
};

describe "Alarm->check()" => sub {
    it("calls 'play_sound()' when time is over" => sub{
        my $player = Test::MockObject->new();
        $player->set_true('play');
        my $alarm = Alarm->new(end_time => 0, player => $player);

        $alarm->check();

        $player->called_ok('play');
    });
};

runtests unless caller;