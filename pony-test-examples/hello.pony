actor Main
  new create(env: Env) =>
    env.out.print("Hello, world!")
    var count: U32 = 1

    while count <= 10 do
      env.out.print(count.string())
      count = count + 1
    end

    let act = Aardvark.create(env, "Test")
    act.eat(10)


actor Aardvark
  let name: String
  let _env: Env
  var _hunger_level: U64 = 100

  new create(env: Env, name': String) =>
    name = name'
    _env = env

  be eat(amount: U64) =>
    _hunger_level = _hunger_level - amount.min(_hunger_level)
    _env.out.print("Hunger:" + _hunger_level.string())
