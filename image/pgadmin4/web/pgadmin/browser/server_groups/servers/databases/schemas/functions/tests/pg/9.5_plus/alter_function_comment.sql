-- FUNCTION: public.Function1_$%{}[]()&*^!@"'`\/#(character varying)

-- DROP FUNCTION public."Function1_$%{}[]()&*^!@""'`\/#"(character varying);

CREATE OR REPLACE FUNCTION public."Function1_$%{}[]()&*^!@""'`\/#"(
	param character varying DEFAULT '1'::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE LEAKPROOF STRICT SECURITY DEFINER WINDOW
    SET enable_sort='true'
AS $BODY$
begin
select '1';
end
$BODY$;

ALTER FUNCTION public."Function1_$%{}[]()&*^!@""'`\/#"(character varying)
    OWNER TO postgres;

COMMENT ON FUNCTION public."Function1_$%{}[]()&*^!@""'`\/#"(character varying)
    IS 'Some comment';
