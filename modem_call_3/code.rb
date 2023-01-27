# note values

v1 = 4
v2 = 2
v4 = 1
v8 = 1/2.to_f
v16 = 1/4.to_f
v32 = 1/8.to_f
v64 = 1/16.to_f

# bar counter

live_loop :bar_counter do
  bar = 0
  beat = 1
  loop do
    if beat == 5
      beat = 1
    end
    if beat == 1
      puts "bar " + (bar + 1).to_s
      bar+= 1
    end
    puts beat
    sleep v4
    beat += 1
  end
end

live_loop :bar do
  sleep 4
end

# synth

use_synth :pluck

live_loop :l1, sync: :bar do
  with_fx :reverb, room: 1 do
    
    play (ring
          :e, :r, :r, :r,
          :e, :r, :r, :r,
          :e, :r, :r, :e,
          :r, :r, :e, :r,
          :e, :r, :r, :r,
          :e, :r, :r, :r,
          :d, :r, :r, :f,
          :r, :r, :d, :r,
          ).tick
    
    sleep v32
  end
  
end

live_loop :l2, sync: :bar do
  use_synth :bass_foundation
  
  play (ring
        :e1, :r, :r, :r,
        :e1, :r, :r, :r,
        :e1, :e1, :e1, :e1,
        :f1, :e1, :r, :r
        ).tick, cutoff: 30, release: 0.5
  
  sleep v32
end

live_loop :l3, sync: :bar do
  use_synth :bass_foundation
  
  play (ring
        :b, :r, :b, :r,
        :r, :b, :r, :r
        ).tick, cutoff: 100, release: 0.05, amp: 0.5, pan: -0.5
  sleep v32
end


live_loop :l4, sync: :bar do
  use_synth :bass_foundation
  
  play (ring
        :d, :r, :d, :r,
        :r, :d, :r, :r,
        :f, :r, :f, :r,
        :r, :f, :fs, :g
        ).tick, cutoff: 100, release: 0.05, amp: 0.5, pan: 0.5
  sleep v32
end

live_loop :l4, sync: :bar do
  use_synth :fm
  
  play (ring
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :g6, :r, :g6, :r
        ).tick, cutoff: 100, release: 0.5, amp: 0.5, pan: 0.5
  sleep v32
end

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :l5, sync: :bar do
  
  with_fx :reverb, room: 1 do
    
    sample :bd_haus if pattern "x-x-x-x-x-x-xxx-"
    
    sleep v16
  end
end


live_loop :l6, sync: :bar do
  
  if 1 == 1
    part1 = "----x--x--x-x---"
    part2 = "----x-------x---"
    part3 = "----x--x--x-x-x-"
    part4 = "x---x-------x---"
  end
  
  if 1 == 2
    part1 = "----x-------x---"
    part2 = "----x-------x---"
    part3 = "----x-------x---"
    part4 = "x-x-x-x-x-x-xxxx"
  end
  
  parts = part1 + part2 + part3 + part4
  
  sample :sn_dolf if pattern parts
  
  sleep v32
end

