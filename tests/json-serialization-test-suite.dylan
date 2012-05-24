module: serialization-test-suite
synopsis: Test suite for the json serialization.

define suite json-serialization-test-suite ()
  test json-boolean-test;
  test json-collection-single-item-test;
  test json-collection-multiple-items-test;
  test json-integer-test;
  test json-string-test;
  test json-string-test-with-escaped-characters;
  test json-symbol-test;
  test json-table-single-item-test;
  test json-table-multiple-items-test;
end;

define test json-boolean-test ()
  check-equal("serialized true",
              write-object-to-json-string(#t),
              "true");
  check-equal("serialized false",
              write-object-to-json-string(#f),
              "false");
end;

define test json-collection-single-item-test ()
  check-equal("serialized collection with single item",
              write-object-to-json-string(#(1)),
              "[1]");
end;

define test json-collection-multiple-items-test ()
  check-equal("serialized collection with multiple items",
              write-object-to-json-string(#(1, 2)),
              "[1,2]");
end;

define test json-integer-test ()
  check-equal("serialized integer",
              write-object-to-json-string(1),
              "1");
end;

define test json-string-test ()
  check-equal("serialized string",
              write-object-to-json-string("test"),
              "\"test\"");
end;

define test json-string-test-with-escaped-characters ()
  check-equal("serialized string with escaped characters",
              write-object-to-json-string("test \\ \n \""),
              "\"test \\\\ \\\n \\\"\"");
end;

define test json-symbol-test ()
  check-equal("serialized symbol",
              write-object-to-json-string(#"test"),
              "\"test\"");
end;

define test json-table-single-item-test ()
  let test-table = table(#"key" => 1);
  check-equal("serialized table with single item",
              write-object-to-json-string(test-table),
              "{\"key\":1}");
end;

define test json-table-multiple-items-test ()
  let test-table = table(#"key" => 1, #"key2" => 2);
  check-equal("serialized table with multiple items",
              write-object-to-json-string(test-table),
              "{\"key\":1,\"key2\":2}");
end;
