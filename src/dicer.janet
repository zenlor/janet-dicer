(def rng-god
  (math/rng (os/cryptorand 1)))

(def die-lang
  (peg/compile
   '{:dice (some :d)
     :throws (some :d)
     :keep (any (* "k" (<- (* :d))))
     :main (* (<- :throws) "d" (<- :dice) :keep)}))

(defn calc-die
  [args]
  (let [[throws die keep] (map eval-string args)
        results (map (fn [_] (+ (math/rng-int rng-god die) 1))
                     (range throws))]
    (if (not (nil? keep))
      (->> (sort results >)
           (take keep))
      (apply + results))))

(defn parse-die
  [die]
  (peg/match die-lang die))
