
use Hiker;
use Config::From;

my $host is from-config;
my $port is from-config;

my $app = Hiker.new(
  hikes     => ['controllers', 'models'],
  templates => 'templates',
  :$host,
  :$port
);

$app.listen(:block);
  