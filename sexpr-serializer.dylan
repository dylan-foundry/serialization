module: sexpr-serialization
synopsis: Support for serializing to s-expressions.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define class <sexpr-serializer> (<serializer>)
end;

define method write-end-array (serializer :: <sexpr-serializer>)
  write(serializer.stream, ")");
end;

define method write-end-object (serializer :: <sexpr-serializer>)
  write(serializer.stream, ")");
end;

define method write-field-name (serializer :: <sexpr-serializer>, field-name :: <field-name>)
  write-object(serializer, field-name);
end;

define method write-field (serializer :: <sexpr-serializer>, field-name :: <field-name>, object)
  write-start-object(serializer);
  next-method();
  write-end-object(serializer);
end;

define method write-separator-array (serializer :: <sexpr-serializer>)
  write(serializer.stream, " ");
end method write-separator-array;

define method write-separator-field-name (serializer :: <sexpr-serializer>)
  write(serializer.stream, " ");
end method write-separator-field-name;

define method write-separator-object (serializer :: <sexpr-serializer>)
  write(serializer.stream, " ");
end method write-separator-object;

define method write-start-array (serializer :: <sexpr-serializer>)
  write(serializer.stream, "(");
end;

define method write-start-object (serializer :: <sexpr-serializer>)
  write(serializer.stream, "(");
end;

define method write-object (serializer :: <sexpr-serializer>, object :: <integer>)
  format(serializer.stream, "%d", object);
end;

define method write-object (serializer :: <sexpr-serializer>, object :: <float>)
  write(serializer.stream, float-to-string(object));
end;

define method write-object (serializer :: <sexpr-serializer>, object :: <symbol>)
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

define method write-object (serializer :: <sexpr-serializer>, object :: <string>)
  let stream = serializer.stream;
  write(stream, "\"");
  write(stream, escape-characters(object));
  write(stream, "\"");
end;

define method write-object (serializer :: <sexpr-serializer>, object :: singleton(#f))
  write(serializer.stream, "false");
end;

define method write-object (serializer :: <sexpr-serializer>, object :: singleton(#t))
  write(serializer.stream, "true");
end;

define function write-object-to-sexpr-string(object)
  write-object-to-string(<sexpr-serializer>, object);
end;
