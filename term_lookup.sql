-- modifications
CREATE TABLE TermToNumber
(
    term       VARCHAR(45) NOT NULL,
    term_order INT(1)      NOT NULL,
    CONSTRAINT TermToNumber_pk
        PRIMARY KEY (term)
);

INSERT INTO TermToNumber
VALUES ('summer', 0),
       ('fall', 1),
       ('fall/winter', 2),
       ('winter', 3);

ALTER TABLE Section
    ADD CONSTRAINT term_name_fk FOREIGN KEY (term) REFERENCES TermToNumber (term);