module: serialization-test-suite
synopsis: Test suite for the json library.

define suite serialization-test-suite ()
  suite json-serialization-test-suite;
  suite sexpr-serialization-test-suite;
end;
