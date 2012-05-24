module: dylan-user

define library serialization
  use common-dylan;
  use io;

  export serialization;
  export json-serialization;
  export sexpr-serialization;
end library;

define module serialization
  use common-dylan;
  use streams;

  export <serializer>, write-array-field-start,
    write-end-array, write-end-object,
    write-field-name, write-field,
    write-object, write-object-field-start,
    write-start-array, write-start-object,
    write-object-to-string;

  // This is only for use by the other modules in this
  // library.
  export <field-name>, stream;
end module;

define module json-serialization
  use common-dylan, exclude: { format-to-string };
  use format;
  use serialization, export: all;
  use streams;

  export <json-serializer>,
    write-object-to-json-string;
end module;

define module sexpr-serialization
  use common-dylan, exclude: { format-to-string };
  use format;
  use serialization, export: all;
  use streams;

  export <sexpr-serializer>,
    write-object-to-sexpr-string;
end module;
