-- PROCEDURE: public.Proc1_$%{}[]()&*^!@"'`\/#(integer)

-- DROP PROCEDURE public."Proc1_$%{}[]()&*^!@""'`\/#"(integer);

CREATE OR REPLACE PROCEDURE public."Proc1_$%{}[]()&*^!@""'`\/#"(
	i1 integer)
    VOLATILE SECURITY DEFINER
    COST 100
    SET application_name='pgadmin'
AS begin
select 1;
end;

COMMENT ON PROCEDURE public."Proc1_$%{}[]()&*^!@""'`\/#"
    IS 'some comment';
