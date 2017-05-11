# README

Refer - https://github.com/rails/rails/issues/28654

* Ruby version - 2.4.0p0 (2016-12-24 revision 57164) [x86_64-linux]

* Rails version - 5.0.2

* Apartment gem version - 1.2.0

### Steps

```
git clone https://github.com/Bongs/demo_cross_schema_fk.git
cd demo_cross_schema_fk
bundle install
rake db:create db:migrate db:seed
```

Try the following in rails console:

```
Company.create(name: 'testco', subdomain: 'testco')
Apartment::Tenant.switch!('testco')
Party.create(name: 'test_party', state_id: 1)
```

The above will throw error:

```
2.4.0 :006 > Party.create(name: 'test_party', state_id: 1)
   (0.1ms)  BEGIN
  SQL (1.0ms)  INSERT INTO "parties" ("name", "state_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["name", "test_party"], ["state_id", 1], ["created_at", 2017-05-11 20:58:42 UTC], ["updated_at", 2017-05-11 20:58:42 UTC]]
   (0.1ms)  ROLLBACK
ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation: ERROR:  insert or update on table "parties" violates foreign key constraint "fk_rails_6a79a75ee2"
DETAIL:  Key (state_id)=(1) is not present in table "states".
: INSERT INTO "parties" ("name", "state_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb:598:in `async_exec'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb:598:in `block in exec_no_cache'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/abstract_adapter.rb:589:in `block in log'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activesupport-5.0.2/lib/active_support/notifications/instrumenter.rb:21:in `instrument'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/abstract_adapter.rb:583:in `log'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb:598:in `exec_no_cache'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/postgresql_adapter.rb:587:in `execute_and_clear'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/postgresql/database_statements.rb:103:in `exec_query'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/postgresql/database_statements.rb:137:in `exec_insert'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/abstract/database_statements.rb:124:in `insert'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/abstract/query_cache.rb:17:in `insert'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/relation.rb:65:in `insert'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/persistence.rb:560:in `_create_record'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/counter_cache.rb:128:in `_create_record'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/locking/optimistic.rb:75:in `_create_record'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/attribute_methods/dirty.rb:123:in `_create_record'
... 20 levels...
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/connection_adapters/abstract/database_statements.rb:232:in `transaction'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/transactions.rb:211:in `transaction'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/transactions.rb:392:in `with_transaction_returning_status'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/transactions.rb:319:in `block in save'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/transactions.rb:334:in `rollback_active_record_state!'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/transactions.rb:318:in `save'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/suppressor.rb:41:in `save'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/activerecord-5.0.2/lib/active_record/persistence.rb:34:in `create'
        from (irb):6
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/railties-5.0.2/lib/rails/commands/console.rb:65:in `start'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/railties-5.0.2/lib/rails/commands/console_helper.rb:9:in `start'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/railties-5.0.2/lib/rails/commands/commands_tasks.rb:78:in `console'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/railties-5.0.2/lib/rails/commands/commands_tasks.rb:49:in `run_command!'
        from /home/ubuntu/.rvm/gems/ruby-2.4.0@demo/gems/railties-5.0.2/lib/rails/commands.rb:18:in `<top (required)>'
        from bin/rails:4:in `require'
        from bin/rails:4:in `<main>'
2.4.0 :007 >
```

To fix this make changes in **schema.rb**.

Replace

```
add_foreign_key "companies", "states"
add_foreign_key "parties", "states"
```

with

```
add_foreign_key "companies", "public.states", column: "state_id"
add_foreign_key "parties", "public.states", column: "state_id"
```

The above sequence of commands will run successfully then.

```
Company.create(name: 'testco_2', subdomain: 'testco2')
Apartment::Tenant.switch!('testco2')
Party.create(name: 'test_party', state_id: 1)
```

Below is the console log:

```
2.4.0 :001 > Company.create(name: 'testco_2', subdomain: 'testco2')
   (0.2ms)  BEGIN
  SQL (0.4ms)  INSERT INTO "public"."companies" ("name", "subdomain", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["name", "testco_2"], ["subdomain", "testco2"], ["created_at", 2017-05-11 21:23:23 UTC], ["updated_at", 2017-05-11 21:23:23 UTC]]
   (0.5ms)  CREATE SCHEMA "testco2"
  SQL (0.4ms)  CREATE EXTENSION IF NOT EXISTS "plpgsql"
   (3.7ms)  CREATE TABLE "companies" ("id" serial primary key, "name" character varying, "state_id" integer, "subdomain" character varying, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
   (2.6ms)  CREATE TABLE "parties" ("id" serial primary key, "name" character varying, "state_id" integer, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
   (3.0ms)  CREATE TABLE "states" ("id" serial primary key, "name" character varying, "code" character varying(2), "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
   (1.3ms)  ALTER TABLE "companies" ADD CONSTRAINT "fk_rails_45f67c57ab"
FOREIGN KEY ("state_id")
  REFERENCES "public"."states" ("id")

   (1.4ms)  ALTER TABLE "parties" ADD CONSTRAINT "fk_rails_6a79a75ee2"
FOREIGN KEY ("state_id")
  REFERENCES "public"."states" ("id")

   (2.7ms)  CREATE TABLE "schema_migrations" ("version" character varying PRIMARY KEY)
   (0.6ms)  SELECT version FROM "schema_migrations"
   (0.4ms)  INSERT INTO "schema_migrations" (version) VALUES (20170511202705)
   (0.2ms)  INSERT INTO "schema_migrations" (version) VALUES
(20170511202324),
(20170511202631);


   (3.0ms)  CREATE TABLE "ar_internal_metadata" ("key" character varying PRIMARY KEY, "value" character varying, "created_at" timestamp NOT NULL, "updated_at" timestamp NOT NULL)
  ActiveRecord::InternalMetadata Load (0.3ms)  SELECT  "ar_internal_metadata".* FROM "ar_internal_metadata" WHERE "ar_internal_metadata"."key" = $1 LIMIT $2  [["key", :environment], ["LIMIT", 1]]
  SQL (0.4ms)  INSERT INTO "ar_internal_metadata" ("key", "value", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "key"  [["key", "environment"], ["value", "development"], ["created_at", 2017-05-11 21:23:23 UTC], ["updated_at", 2017-05-11 21:23:23 UTC]]
   (0.9ms)  COMMIT
 => #<Company id: 2, name: "testco_2", state_id: nil, subdomain: "testco2", created_at: "2017-05-11 21:23:23", updated_at: "2017-05-11 21:23:23">
2.4.0 :002 > Apartment::Tenant.switch!('testco2')
 => "\"testco2\""
2.4.0 :003 > Party.create(name: 'test_party', state_id: 1)
   (0.2ms)  BEGIN
  SQL (0.9ms)  INSERT INTO "parties" ("name", "state_id", "created_at", "updated_at") VALUES ($1, $2, $3, $4) RETURNING "id"  [["name", "test_party"], ["state_id", 1], ["created_at", 2017-05-11 21:23:57 UTC], ["updated_at", 2017-05-11 21:23:57 UTC]]
   (0.5ms)  COMMIT
 => #<Party id: 1, name: "test_party", state_id: 1, created_at: "2017-05-11 21:23:57", updated_at: "2017-05-11 21:23:57">
2.4.0 :004 >
```