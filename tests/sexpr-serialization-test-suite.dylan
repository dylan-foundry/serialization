module: serialization-test-suite
synopsis: Test suite for the sexpr serialization.

define suite sexpr-serialization-test-suite ()
  test sexpr-boolean-test;
  test sexpr-collection-single-item-test;
  test sexpr-collection-multiple-items-test;
  test sexpr-integer-test;
  test sexpr-string-test;
  test sexpr-string-test-with-escaped-characters;
  test sexpr-symbol-test;
  test sexpr-table-single-item-test;
  test sexpr-table-multiple-items-test;
end;

define test sexpr-boolean-test ()
  check-equal("serialized true",
              write-object-to-sexpr-string(#t),
              "true");
  check-equal("serialized false",
              write-object-to-sexpr-string(#f),
              "false");
end;

define test sexpr-collection-single-item-test ()
  check-equal("serialized collection with single item",
              write-object-to-sexpr-string(#(1)),
              "(1)");
end;

define test sexpr-collection-multiple-items-test ()
  check-equal("serialized collection with multiple items",
              write-object-to-sexpr-string(#(1, 2)),
              "(1 2)");
end;

define test sexpr-integer-test ()
  check-equal("serialized integer",
              write-object-to-sexpr-string(1),
              "1");
end;

define test sexpr-string-test ()
  check-equal("serialized string",
              write-object-to-sexpr-string("test"),
              "\"test\"");
end;

define test sexpr-string-test-with-escaped-characters ()
  check-equal("serialized string with escaped characters",
              write-object-to-sexpr-string("test \\ \n \""),
              "\"test \\\\ \\\n \\\"\"");
end;

define test sexpr-symbol-test ()
  check-equal("serialized symbol",
              write-object-to-sexpr-string(#"test"),
              "\"test\"");
end;

define test sexpr-table-single-item-test ()
  let test-table = table(#"key" => 1);
  check-equal("serialized table with single item",
              write-object-to-sexpr-string(test-table),
              "((\"key\" 1))");
end;

define test sexpr-table-multiple-items-test ()
  let test-table = table(#"key" => 1, #"key2" => 2);
  check-equal("serialized table with multiple items",
              write-object-to-sexpr-string(test-table),
              "((\"key\" 1) (\"key2\" 2))");
end;
