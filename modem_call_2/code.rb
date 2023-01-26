v1 = 1
v2 = 1/2.to_f
v4 = 1/4.to_f
v8 = 1/8.to_f
v16 = 1/16.to_f
v32 = 1/32.to_f

use_synth :sine

live_loop :bar do
  puts "1"
  sleep v1
  puts "2"
  sleep v1
  puts "3"
  sleep v1
  puts "4"
  sleep v1
end

live_loop :loop1, sync: :bar do
  use_synth :sine
  play (ring :d2, :r, :r, :r, :d2, :r, :r, :r, :c2, :r, :r, :e2, :r, :r, :c2, :r).tick, release: 0.5, amp: 1
  sleep v8
end

live_loop :loop2, sync: :bar do
  use_synth :sine
  play :a3, release: 2, amp: 0.2
  sleep v1*2
  play :g3, release: 1, amp: 0.2
  sleep v1
  play :f3, release: 1, amp: 0.2
  sleep v1
  play :d3, release: 2, amp: 0.2
  sleep v1*4
end

live_loop :loop3, sync: :bar do
  use_synth :sine
  play :b4, release: 2, amp: 0.1, pan: -0.5
  sleep v1
  play :c4, release: 1, amp: 0.1, pan: 0.5
  sleep v1
  play :b4, release: 1, amp: 0.1, pan: -0.5
  sleep v1
  play :c4, release: 2, amp: 0.1, pan: 0.5
  sleep v1
end

live_loop :loop4, sync: :bar do
  use_synth :prophet
  play (ring :f2, :f2, :r, :r, :d2, :r, :r, :r, :f2, :f2, :r, :r, :g2, :r, :r, :r).tick, release: 0.5, amp: 0.5, pan: -1
  sleep v8
end

live_loop :loop5, sync: :bar do
  use_synth :prophet
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:f, :c]
  sleep v2
  play [:f, :c]
  sleep v2
  play [:e, :b]
  sleep v2
  play [:e, :b]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
  play [:d, :a]
  sleep v2
end

live_loop :loop6, sync: :bar do
  use_synth :prophet
  play [:d5, :e], amp: 0.5, pan: -1
  sleep v8
  play [:e, :a], amp: 0.3, pan: 1
  sleep v2
  play [:d5, :f], amp: 0.5, pan: -1
  sleep v8
  play [:e, :a], amp: 0.3, pan: 1
  sleep v2
end

live_loop :loop6, sync: :bar do
  use_synth :pulse
  play [:a5, :e],release: 0.1, amp: 0.5, pan: -1
  sleep v16
  play [:a, :a],release: 0.1, amp: 0.3, pan: 1
  sleep v8
  play [:a5, :f],release: 0.1, amp: 0.5, pan: -1
  sleep v16
  play [:a, :a],release: 0.1, amp: 0.3, pan: 1
  sleep v8
  sleep 2
end