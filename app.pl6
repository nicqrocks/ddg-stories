
use Hiker;

my $app = Hiker.new(
  hikes     => ['controllers', 'models'],
  templates => 'templates',
);

$app.listen(:block);
  