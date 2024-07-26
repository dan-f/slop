(def start (now))

(~viewport.clear)

(def img (load-img (nth files)))

(def w ~img.w)
(def h ~img.h)
(print (join (nth files) " " w " x " h))

(defn swap-red-green (col)
  ((g col) (r col) (b col) (a col)))

(def luma (fnjs ((r g b a))
  (def n (/ 1 255))
  (def lum (+ (* r n 0.2126) (* g n 0.7152) (* b n 0.0722)))
  (def lum255 (floor (* lum 255)))
  (lum255 lum255 lum255 a)))

(defn thresh (level)
  (fnjs ((r g b a))
    (def avg (/ (+ r g b) 3))
    (def val (if (> avg level) 255 0))
    (val val val a)))

(def inv (fnjs ((r g b a))
  ((- 255 r) (- 255 g) (- 255 b) a)))

(~img.blur 4)
(~img.pixFn (thresh 200))


(view img)
(~viewport.draw)

(join "elapsed: " (- (now) start) " ms")