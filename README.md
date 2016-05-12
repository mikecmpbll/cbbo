# Cbbo

Cbbo : Crude Black Box Optimiser

The whole point is you throw some input variables into a block box and this
thing will try and improve the variables to find an optimum result (minimum).

Here's a contrived example with one variable in a simple function:

```ruby
black_box = ->(vars){ 3 + (14 * vars[:t]) - (5 * (vars[:t] ** 2)) }
vars = { t: 0 }
mods = 0.1

Cbbo.optimise(black_box, vars, mods, verbose: true)
{:t=>0.1}: 4.3500000000000005
{:t=>0.2}: 5.6000000000000005
{:t=>0.30000000000000004}: 6.750000000000001
# ... truncated
{:t=>1.3999999815142559}: 12.799999999999997
{:t=>1.4000000477032466}: 12.79999999999999
{:t=>1.3999999980615034}: 12.8
{:t=>1.3999999980615034}
```

Obviously this is a super contrived example with a function that isn't
in any way mysterious. This is for black boxes which can't easily be reasoned
about, or you're too lazy to reason about. Also it's useful for black boxes that
are particularly slow, because it's designed as a improvement on brute force,
one of the alternatives in black box optimisation but requiring many magnitudes
fewer tests.

I designed it for prediction algorithms that do a lot of number crunching. You
can move through quite a large 'landscape' of variables with relative efficiency.