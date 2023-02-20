CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr int[]) RETURNS int AS $$
BEGIN
	RETURN (SELECT MIN(arr[i])
	FROM generate_subscripts(arr, 1) g(i)); -- возврат индексов
END;
$$ LANGUAGE plpgsql;

SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);