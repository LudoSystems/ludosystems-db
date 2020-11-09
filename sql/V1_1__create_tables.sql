-- ludobaum schema setup

CREATE TABLE ludobaum.node(
    id SERIAL UNIQUE,

    PRIMARY KEY(id)
);

CREATE TABLE ludobaum.arrow(
    id SERIAL UNIQUE,
    tail_node_id INT,
    head_node_id INT,

    PRIMARY KEY(id),
    CONSTRAINT fk_tail_node
        FOREIGN KEY(tail_node_id)
            REFERENCES ludobaum.node(id),
    CONSTRAINT fk_head_node
        FOREIGN KEY(head_node_id)
            REFERENCES ludobaum.node(id)
);

CREATE TABLE ludobaum.attribute_list(
    id SERIAL UNIQUE,
    name VARCHAR(255),

    PRIMARY KEY(id)
);

CREATE TABLE ludobaum.attribute_list_element(
    id SERIAL UNIQUE,
    list_id INT,
    text VARCHAR(4095),

    PRIMARY KEY(id),
    CONSTRAINT fk_list_id
        FOREIGN KEY(list_id)
            REFERENCES ludobaum.attribute_list(id)
);

CREATE TABLE ludobaum.node_attribute(
    id SERIAL UNIQUE,
    node_id INT,
    attribute_type VARCHAR(31), 
    name VARCHAR(255),
    text VARCHAR(4095),
    number INT,
    list_id INT,
    list_element_id INT,

    PRIMARY KEY(id),
    CONSTRAINT fk_node_id
        FOREIGN KEY(node_id)
            REFERENCES ludobaum.node(id),
    CONSTRAINT fk_list_id
        FOREIGN KEY(list_id)
            REFERENCES ludobaum.attribute_list(id),
    CONSTRAINT fk_list_element_id
        FOREIGN KEY(list_element_id)
            REFERENCES ludobaum.attribute_list_element(id)
);

ALTER TABLE ludobaum.node OWNER TO ludobaum;
ALTER TABLE ludobaum.arrow OWNER TO ludobaum;
ALTER TABLE ludobaum.attribute_list OWNER TO ludobaum;
ALTER TABLE ludobaum.attribute_list_element OWNER TO ludobaum;
ALTER TABLE ludobaum.node_attribute OWNER TO ludobaum;