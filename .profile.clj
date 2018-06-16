(require '[clojure [set :as set]
                   [string :as str]]
         '[clojure.java browse
                        javadoc]
         '[dragon [clipboard :as clipboard]
                  [core :refer :all]
                  [maths :as maths]])

(let [uri (str "https://docs.oracle.com/javase/"
               (System/getProperty "java.specification.version")
               "/")
      fix #(str/replace
            %
            #"http://java\.sun\.com/javase/7/"
            uri)]
  (intern 'clojure.java.javadoc
          '*core-java-api*
          (fix clojure.java.javadoc/*core-java-api*))
  (intern 'clojure.java.javadoc
          '*remote-javadocs*
          (ref (into (sorted-map)
                     (map (fn
                           [[k v]]
                           [k (fix v)])
                          @clojure.java.javadoc/*remote-javadocs*)))))
