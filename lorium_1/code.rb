# note values

w = 2
h = 1
q = 1/2.to_f
e = 1/4.to_f
s = 1/8.to_f
t = 2/16.to_f

# bar

use_bpm 120

live_loop :bar do
  sleep 4
end

# synth

use_synth :pluck

# drums

define :pattern do |pattern|
  return pattern.ring.tick == "x"
end

live_loop :drum_loop1, sync: :bar do
  
  part1 = "x-x-" + "x-x-" + "x-x-" + "x-xx" + "x-x-" + "x-x-" + "x-x-" + "xxx-"
  part2 = "x-x-" + "x-x-" + "x-x-" + "x-xx" + "x-x-" + "x-x-" + "x-x-" + "xxx-"
  part3 = ""
  part4 = ""
  
  parts = part1 + part2 + part3 + part4
  
  sample :bd_haus, cutoff: 110 if pattern parts
  
  sleep q
end

live_loop :drum_loop2, sync: :bar do
  
  part1 = "----" + "x---" + "----" + "x---" + "----" + "x---" + "----" + "x---"
  part2 = "----" + "x---" + "----" + "x---" + "----" + "x---" + "--x-" + "x-x-"
  part3 = "----" + "x---" + "----" + "x---" + "----" + "x---" + "----" + "x---"
  part4 = "----" + "x---" + "----" + "x---" + "----" + "x---" + "--x-" + "---x"
  
  
  parts = part1 + part2 + part3 + part4
  
  if 1 == 2
    with_fx :echo, mix: 0.3 do
      
      sample :sn_dolf, amp: 0.7, hpf: 70 if pattern parts
    end
    
  end
  sleep e
end

=begin
live_loop :drum_loop2, sync: :bar do

  part1 = "x---" + "----" + "----" + "----" + "x---" + "----" + "----" + "----"
  part2 = "x---" + "----" + "x---" + "----" + "x---" + "----" + "x---" + "----"
  part3 = "x---" + "x---" + "x---" + "x---" + "x---" + "x---" + "x---" + "x---"
  part4 = "x---" + "x---" + "x---" + "x---" + "x-x-" + "x-x-" + "xxxx" + "xxxx"

  parts = part1 + part2 + part3 + part4

  sample :sn_dolf, amp: 0.7, cutoff: 110 if pattern parts
  sleep e
end
=end

live_loop :drum_loop3, sync: :bar do
  
  part1 = "---x" + "--x-" + "---x" + "---x"
  part2 = "---x" + "--x-" + "---x" + "x--x"
  
  parts = part1 + part2
  
  sample :tabla_ghe3, pan: -0.5, amp: 0.5 if pattern parts
  sleep e
end

live_loop :drum_loop4, sync: :bar do
  
  part1 = "x---" + "--x-" + "x---" + "x---"
  part2 = "x---" + "--x-" + "x---" + "x---"
  
  parts = part1 + part2
  
  sample :tabla_ghe4, pan: 0.5, amp: 0.3 if pattern parts
  sleep e
end

live_loop :l2, sync: :bar do
  use_synth :bass_foundation
  
  play (ring
        :e1, :e1, :e1, :e1,
        :e1, :e1, :e1, :e1,
        :e1, :e1, :e1, :e1,
        :f1, :e1, :e1, :e1,
        ).tick, cutoff: 30, release: 0.5
  
  sleep e
end

live_loop :l1, sync: :bar do
  
  use_synth :supersaw
  
  with_fx :ping_pong, amp: 0.5 do
    play (ring
          :b3, :r, :r, :r,
          :a3, :r, :c4, :r,
          :b3, :r, :r, :e4,
          :r, :r, :r, :r,
          :f4, :r, :r, :r,
          :e4, :r, :ds4, :r,
          :e4, :r, :r, :e3,
          :r, :r, :r, :r
          ).tick, release: 3
  end
  
  sleep h
  
end