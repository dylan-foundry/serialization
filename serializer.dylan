module: serialization
synopsis: Serialization framework.
author: Bruce Mitchener
copyright: 2012, Data Fueled, LLC.

define class <serializer> (<object>)
  constant slot stream :: <stream>, required-init-keyword: stream:;
end;

define constant <field-name> = type-union(<string>, <symbol>);

define generic write-array-field-start (serializer :: <serializer>, field-name :: <field-name>);

define generic write-end-array (serializer :: <serializer>);

define generic write-end-object (serializer :: <serializer>);

define generic write-field-name (serializer :: <serializer>, field-name :: <field-name>);

define generic write-field (serializer :: <serializer>, field-name :: <field-name>, object);

define generic write-object (serializer :: <serializer>, object);

define generic write-object-field-start (serializer :: <serializer>, field-name :: <field-name>);

define generic write-separator-array (serializer :: <serializer>);

define generic write-separator-field-name (serializer :: <serializer>);

define generic write-separator-object (serializer :: <serializer>);

define generic write-start-array (serializer :: <serializer>);

define generic write-start-object (serializer :: <serializer>);

define method write-array-field-start (serializer :: <serializer>, field-name :: <field-name>)
  write-field-name(serializer, field-name);
  write-separator-field-name(serializer);
  write-start-array(serializer);
end;

define method write-field (serializer :: <serializer>, field-name :: <field-name>, object)
  write-field-name(serializer, field-name);
  write-separator-field-name(serializer);
  write-object(serializer, object);
end;

define method write-object-field-start (serializer :: <serializer>, field-name :: <field-name>)
  write-field-name(serializer, field-name);
  write-separator-field-name(serializer);
  write-start-object(serializer);
end;

define method write-object (serializer :: <serializer>, object :: <collection>)
  write-start-array(serializer);
  for (o in object,
       i :: <integer> from 1)
    write-object(serializer, o);
    unless (i = object.size)
      write-separator-array(serializer);
    end unless;
  end for;
  write-end-array(serializer);
end;

define class <property-list> (<object>)
  constant slot plist-list :: <collection>,
    required-init-keyword: list:;
end;

define method as (class == <property-list>, x :: <collection>)
 => (res :: <property-list>)
  make(<property-list>, list: x)
end;

define method write-object (serializer :: <serializer>, plist :: <property-list>)
  write-start-object(serializer);
  for (k from 0 below plist.plist-list.size by 2,
       v from 1 by 2)
    write-field(serializer, plist.plist-list[k], plist.plist-list[v]);
    unless (v = plist.plist-list.size)
      write-separator-object(serializer);
    end unless;
  end for;
  write-end-object(serializer);
end;


define method write-object (serializer :: <serializer>, object :: <table>)
  write-start-object(serializer);
  for (value keyed-by key in object,
       i :: <integer> from 1)
    write-field(serializer, key, value);
    unless (i = object.size)
      write-separator-object(serializer);
    end unless;
  end for;
  write-end-object(serializer);
end;

define function write-object-to-string (serializer-class :: subclass(<serializer>), object)
  let s :: <byte-string-stream>
    = make(<byte-string-stream>,
     contents: make(<byte-string>, size: 32), direction: #"output");
  let serializer = make(serializer-class, stream: s);
  write-object(serializer, object);
  s.stream-contents
end;
