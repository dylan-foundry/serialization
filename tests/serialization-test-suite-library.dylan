module: dylan-user

define library serialization-test-suite
  use common-dylan;
  use collections;
  use io;
  use serialization;
  use testworks;

  export serialization-test-suite;
end library;

define module serialization-test-suite
  use common-dylan, exclude: { format-to-string };
  use table-extensions, import: { table };
  use format;
  use json-serialization;
  use sexpr-serialization;
  use testworks;

  export serialization-test-suite;
end module;
