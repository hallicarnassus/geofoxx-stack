-- POLICY: test

-- DROP POLICY test ON public.test_rls_policy;

CREATE POLICY test
    ON public.test_rls_policy
    AS PERMISSIVE
    FOR ALL
    TO public;
