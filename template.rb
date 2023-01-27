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

# drums

define :pattern do |pattern|
  
  return pattern.ring.tick == "x"
  
end

live_loop :drum_loop1, sync: :bar do
  
  part1 = "----" + "----" + "----" + "----" + "----" + "----" + "----" + "----"
  part2 = ""
  part3 = ""
  part4 = ""
  
  parts = part1 + part2 + part3 + part4
  
  sample :bd_haus, cutoff: 110 if pattern parts
  
  sleep q
  
end

live_loop :drum_loop2, sync: :bar do
  
  part1 = "----" + "----" + "----" + "----" + "----" + "----" + "----" + "----"
  part2 = ""
  part3 = ""
  part4 = ""
  
  parts = part1 + part2 + part3 + part4
  
  if 1 == 2
    with_fx :echo, mix: 0.3 do
      
      sample :sn_dolf, amp: 0.7, hpf: 70 if pattern parts
    end
    
  end
  
  sleep e
  
end

# bass

live_loop :bass_loop, sync: :bar do
  
  use_synth :bass_foundation
  
  play (ring
        
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        
        ).tick, cutoff: 30, release: 0.5
  
  sleep e
  
end

# synth

live_loop :synth_loop, sync: :bar do
  
  use_synth :supersaw
  
  play (ring
        
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        :r, :r, :r, :r,
        
        ).tick, release: 3
  
  sleep h
  
end