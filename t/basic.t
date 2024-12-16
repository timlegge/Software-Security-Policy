#!perl
use strict;
use warnings;

use Test::More tests => 11;

my $class = 'Software::Security::Policy::Individual';
require_ok($class);

my $policy = $class->new({
        maintainer  => 'X. Ample <x.example@example.com>',
        program     => 'Foo::Bar',
        timeframe   => '6 days',
        url         => 'https://www.example.com/INDIVIDUAL-SECURITY-POLICY',
        support_years   => '8',
    });

is($policy->maintainer, 'X. Ample <x.example@example.com>', 'maintainer');
like($policy->name, qr/individual/i, "Individual Security Policy");
like($policy->fulltext, qr/6 days/i, 'timeframe updated in policy');
like($policy->fulltext, qr/8 years/i, 'timeframe updated in policy');
like($policy->fulltext, qr/maintained by a single person/i, 'policy text');

$policy = $class->new({
        maintainer  => 'X. Ample <x.example@example.com>',
    });

is($policy->maintainer, 'X. Ample <x.example@example.com>', 'maintainer');
like($policy->name, qr/individual/i, "Individual Security Policy");
like($policy->fulltext, qr/5 days/i, 'timeframe updated in policy');
like($policy->fulltext, qr/10 years/i, 'timeframe updated in policy');
like($policy->fulltext, qr/maintained by a single person/i, 'policy text');