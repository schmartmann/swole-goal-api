user = User.new(
  email: 'foobar@baz.co.jp',
  password: SecureRandom.hex
)


workout = Workout.create(
  user: user,
  name: 'Morning Warmup'
)

exercise = Exercise.create(
  name: 'Leg stretch',
  quantity: 30,
  unit: 'seconds'
)

WorkoutExercise.create(
  workout: workout,
  exercise: exercise
)
