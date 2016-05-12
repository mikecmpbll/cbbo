# Cbbo

Cbbo : Crude Black Box Optimiser

I think this is what they call parameter optimisation. The whole point is
you throw some input variables into a block box and this thing will try and
improve the variables to find optimum inputs (by minimising the output).

Here's a contrived example with one variable in a simple function:

```ruby
black_box = ->(v){ (v[:x] ** 2) + 10 }
vars = { x: 10 }
mods = 0.1

Cbbo.optimise(black_box, vars, mods, verbose: true)
{:x=>10.1}: 112.00999999999999
{:x=>10.2}: 114.03999999999999
{:x=>10.0}: 110.0
{:x=>9.875}: 107.515625
{:x=>9.71875}: 104.4541015625
{:x=>9.5234375}: 100.69586181640625
{:x=>9.279296875}: 96.10535049438477
{:x=>8.97412109375}: 90.5348494052887
{:x=>8.5926513671875}: 83.83365751802921
{:x=>8.115814208984375}: 75.86644027475268
{:x=>7.519767761230469}: 66.5469071828411
{:x=>6.774709701538086}: 55.89669154011426
{:x=>5.843387126922607}: 44.145173115084845
{:x=>4.679233908653259}: 31.89522997189046
{:x=>3.224042385816574}: 20.394449305541826
{:x=>1.4050529822707176}: 11.974173882987838
{:x=>-0.868683772161603}: 10.754611496016912
{:x=>-3.7108547152020037}: 23.770442717336945
{:x=>1.2629444351186976}: 11.595028646197287
# ... truncated ...
{:x=>1.1511038300340162e-07}: 10.000000000000012
{:x=>-2.5272720011043385e-07}: 10.000000000000064
{:x=>2.3150987224942754e-08}: 10.0
{:x=>2.3150987224942754e-08}
```

Obviously this is a super contrived example with a function that isn't
in any way mysterious. The point of this is for black boxes which can't easily
be reasoned about, or you're too lazy to reason about. Also it's useful for
black boxes that are particularly slow, because it's designed as a improvement
on 'grid search' (trying every potential combination of variables) one of the
alternatives in black box optimisation but requiring many magnitudes fewer tests.

I designed it for prediction algorithms that do a lot of number crunching. You
can move through quite a large 'landscape' of variables with relative efficiency.

I'll probably do some visualisations of this at some point.