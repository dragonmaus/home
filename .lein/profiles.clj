{:repl {:dependencies [[dragon/libs "1.0.0-SNAPSHOT"]]
        :repl-options {:init (load-file (str (System/getenv "HOME")
                                             "/.profile.clj"))}}}
