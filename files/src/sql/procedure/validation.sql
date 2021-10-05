CREATE OR REPLACE FUNCTION validation_script(script TEXT) RETURNS INT
AS
$$
DECLARE
    count_val INT;
    stat TEXT;
BEGIN
    stat := format('SELECT COUNT(*) FROM (%s) result', script);
    EXECUTE stat INTO count_val;
    RETURN count_val;
END;
$$ LANGUAGE plpgsql;
