package App::LevenshteinUtils;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

our @algos = (
    'editdist',
    'Text::Fuzzy',
           PERLANCAR::Text::Levenshtein 0.02

       Text::Fuzzy 0.25

       Text::Levenshtein 0.13

       Text::Levenshtein::Flexible 0.09

       Text::Levenshtein::XS 0.503

       Text::LevenshteinXS 0.03
);

$SPEC{editdist} = {
    v => 1.1,
    summary => 'Calculate edit distance using one of several algorithm',
    args => {
        str1 => {
            schema => 'str*',
            req => 1,
            pos => 0,
        },
        str2 => {
            schema => 'str*',
            req => 1,
            pos => 1,
        },
        algo => {
            schema => ['str*', in=>\@algos, default=>'editdist'],
        },
    },
};
sub editdist {
    my %args = @_;

    my $str1 = $args{str1};
    my $str2 = $args{str2};
    my $algo = $args{algo} // 'editdist';

    if ($algo eq 'editdist') {
        require PERLANCAR::Text::Levenshtein;
        return [200,"OK",PERLANCAR::Text::Levenshtein::editdist($str1, $str2)];
    } else {
        return [400, "Unknown algorithm '$algo'"];
    }
}

1;
#ABSTRACT: CLI utilities related to Levenshtein algorithm

=head1 DESCRIPTION

This distributions provides the following command-line utilities related to
levenshtein algorithm:

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<Bencher::Scenario::LevenshteinModules>
