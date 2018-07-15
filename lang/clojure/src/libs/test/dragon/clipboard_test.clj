(ns dragon.clipboard-test
  (:refer-clojure)
  (:require [clojure.test :refer :all]
            [dragon.clipboard :refer :all]))

(deftest clipboard-test
  (let [data "How quickly daft jumping zebras vex."]
    (testing "copy & paste"
      (is (= data (do
                   (copy data)
                   (paste)))))
    (testing "clear"
      (is (empty? (do
                   (clear)
                   (paste)))))))
