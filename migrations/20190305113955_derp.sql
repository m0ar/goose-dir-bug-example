-- +goose Up
CREATE TABLE hello();

-- +goose Down
DROP TABLE hello;
