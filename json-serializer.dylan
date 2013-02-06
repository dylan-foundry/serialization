module: json-serialization
synopsis: Support for serializing to JSON.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define class <json-serializer> (<serializer>)
end;

define method write-end-array (serializer :: <json-serializer>)
  write(serializer.stream, "]");
end;

define method write-end-object (serializer :: <json-serializer>)
  write(serializer.stream, "}");
end;

define method write-field-name (serializer :: <json-serializer>, field-name :: <field-name>)
  write-object(serializer, field-name);
end;

define method write-separator-array (serializer :: <json-serializer>)
  write(serializer.stream, ",");
end method write-separator-array;

define method write-start-array (serializer :: <json-serializer>)
  write(serializer.stream, "[");
end;

define method write-start-object (serializer :: <json-serializer>)
  write(serializer.stream, "{");
end;

define method write-object (serializer :: <json-serializer>, object :: <integer>)
  format(serializer.stream, "%d", object);
end;

define method write-object (serializer :: <json-serializer>, object :: <float>)
  write(serializer.stream, float-to-string(object));
end;

define method write-object (serializer :: <json-serializer>, object :: <symbol>)
  write-object(serializer, as(<string>, object));
end;

define function escape-characters (string :: <string>) => (string :: <string>)
  let output = "";
  for (char :: <character> in string)
    select (char)
      '\\', '"', '\b', '\f', '\n', '\r', '\t' =>
        output := add!(output, '\\');
        output := add!(output, char);
      otherwise =>
        output := add!(output, char);
    end;
  end;
  output
end;

define method write-object (serializer :: <json-serializer>, object :: <string>)
  let stream = serializer.stream;
  write(stream, "\"");
  write(stream, escape-characters(object));
  write(stream, "\"");
end;

define method write-object (serializer :: <json-serializer>, object :: singleton(#f))
  write(serializer.stream, "false");
end;

define method write-object (serializer :: <json-serializer>, object :: singleton(#t))
  write(serializer.stream, "true");
end;

define function write-object-to-json-string(object)
  write-object-to-string(<json-serializer>, object);
end;
