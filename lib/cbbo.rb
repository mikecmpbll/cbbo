# crude black-box optimiser
class Cbbo
  VERSION = "0.1.0"
  DEFAULT_OPTIONS = {
    mod_adjuster: 0.25,
    domain: nil,
    precision: 4,
    verbose: false,
    max_iterations: 1_000_000,
    noise: 0
  }

  def self.optimise(black_box, variables, mods, options = {})
    options = DEFAULT_OPTIONS.merge(options)
    directions = Hash[variables.each_key.map{ |k| [k, :+] }]
    mods = Hash[variables.each_key.map{ |k| [k, mods] }] if mods.is_a?(Numeric)
    
    if variables.keys != mods.keys
      raise ArgumentError, "mods keys not same as starting vars keys"
    end

    best = 1.0/0
    last = 0
    num_cons = 0
    i = 0

    while num_cons < variables.size
      counter = i % variables.size
      key = variables.keys[counter]

      var_before = variables[key]
      # force to conform to DOMAIN and PRECISION options?
      mod = mods[key].send([:+, :-].sample, rand * (mods[key] * options[:noise]).fdiv(2))
      variables[key] = variables[key].send(directions[key], mod)

      res = black_box.call(variables)
      puts "#{variables.inspect}: #{res}" if options[:verbose]

      if res < best
        best = res
        pm = :+
      else
        directions[key] = directions[key] == :+ ? :- : :+
        variables[key] = var_before
        pm = :-
      end

      # except on first two passes while it settles down
      if i / variables.size > 1
        mods[key] = mods[key] * 1.send(pm, options[:mod_adjuster])
      end

      if res == last
        num_cons += 1
      else
        num_cons = 0
      end

      last = res.round(4)

      i += 1
    end

    puts variables.inspect
  end
end