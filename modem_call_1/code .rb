third = 1/3.to_f
sixth = 1/6.to_f

use_synth :kalimba

live_loop :bar do
  puts "1"
  sleep 1
  puts "2"
  sleep 1
  puts "3"
  sleep 1
  puts "4"
  sleep 1
end

live_loop :loop1, sync: :bar do
  play (ring :e4, :e4, :e4).tick
  sleep third
end

live_loop :loop2, sync: :bar do
  play (ring :e5, :r, :e4, :g4, :e4, :fs, :e).tick, pan: 0.5
  sleep sixth
end

live_loop :loop3, sync: :bar do
  play (ring :e3, :r, :b2).tick, pan: -0.5
  sleep sixth
end

live_loop :loop4, sync: :bar do
  play (ring :g1, :r, :r).tick
  sleep sixth
end

live_loop :loop5, sync: :bar do
  play (ring :e6, :g6, :a6).tick, release: 6
  sleep sixth
end