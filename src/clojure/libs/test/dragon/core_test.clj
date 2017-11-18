(ns dragon.core-test
  (:refer-clojure)
  (:require [clojure.test :refer :all]
            [dragon [core :refer :all]
                    [maths :refer [τ]]]))

(deftest env-test
  (testing "environment map"
    (is (= (System/getenv "PATH") (env :path)))
    (is (= (System/getProperty "user.home") (env :user-home))))
  (testing "getenv"
    (is (= (System/getenv) (getenv)))
    (is (= (System/getenv "PATH") (getenv "PATH")))
    (is (= "jumping zebras vex."
           (getenv "How quickly daft" "jumping zebras vex."))))
  (testing "getprop"
    (is (= (System/getProperties) (getprop)))
    (is (= (System/getProperty "user.home") (getprop "user.home")))
    (is (= "jumping zebras vex."
           (getprop "How quickly daft" "jumping zebras vex.")))))

(deftest kebab-test
  (testing "kebab"
    (is (= :- (kebab nil)))
    (is (= :- (kebab "")))
    (is (= :foo-bar (kebab "FOO  _baR")))
    (is (= :dragon-core-test (kebab 'dragon.core-test)))
    (is (= :6-283185307179586 (kebab τ)))))

(deftest latin-test
  (testing "pig latin converter"
    (testing "properly handles basic consonants"
      (is (= "igpay atinlay" (latin "pig latin"))))
    (testing "properly handles qu"
      (is (= "ickquay eaksquay ababqay" (latin "quick squeak qabab"))))
    (testing "properly handles y"
      (is (= "ouryay ypetay isway yperiteway" (latin "your type is yperite"))))
    (testing "properly handles basic vowels"
      (is (= "eatway anway omeletteway" (latin "eat an omelette"))))
    (testing "properly handles mixed capitalisation"
      (is (= "ellohay Ellohay ELLOHAY" (latin "hello Hello HELLO"))))
    (testing "properly handles full sentences with punctuation"
      (is (= "Ethay ickquay ownbray oxfay umpsjay overway ethay azylay ogday."
             (latin "The quick brown fox jumps over the lazy dog."))))
    (testing "property handles apostrophes"
      (is (= "Atthay's ymay eesechay!" (latin "That's my cheese!"))))))

(deftest ppmap-test
  (testing "partitioned parallel map"
    (let [given (range 100000)
          expected (map inc given)]
      (is (= expected (ppmap 100 inc given))))
    (let [given "How quickly daft jumping zebras vex."
          inc-char (comp char inc int)
          expected (apply str (map inc-char given))]
      (is (= expected (apply str (ppmap 5 inc-char given)))))))

(deftest queue-test
  (testing "queue syntactic sugar"
    (is (= "<<" (with-out-str (pr clojure.lang.PersistentQueue/EMPTY))))
    (let [q (conj << 'a 'b 'c 'd)]
      (is (= "<(a b c d)<" (with-out-str (pr q))))
      (is (= 'a (peek q)))
      (is (= (conj << 'b 'c 'd) (pop q))))))

(deftest rot13-test
  (testing "rot13 rotational cipher"
    (let [decoded "How quickly daft jumping zebras vex."
          encoded "Ubj dhvpxyl qnsg whzcvat mroenf irk."]
      (is (= encoded (rot13 decoded)))
      (is (= decoded (rot13 encoded))))))
