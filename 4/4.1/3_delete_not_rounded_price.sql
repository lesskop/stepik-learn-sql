DELETE FROM
	book
WHERE
	price LIKE "%.99";

DELETE FROM
	supply
WHERE
	price LIKE "%.99";

SELECT
	*
FROM
	book;

SELECT
	*
FROM
	supply;