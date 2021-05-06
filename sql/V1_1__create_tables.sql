-- ludobaum schema setup

CREATE TABLE ludobaum.ludobaum_user(
    id SERIAL UNIQUE,
    name VARCHAR(64) NOT NULL,
    password VARCHAR(64) NOT NULL,
    email varchar(255) NOT NULL,
    role varchar(64) NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE ludobaum.node(
    id SERIAL UNIQUE,
    pos_x INT NOT NULL,
    pos_y INT NOT NULL,
    user_id INT NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES ludobaum.ludobaum_user(id) ON DELETE CASCADE
);

CREATE TABLE ludobaum.node_connection(
    id SERIAL UNIQUE,
    tail_node_id INT NOT NULL,
    head_node_id INT NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT fk_tail_node
        FOREIGN KEY(tail_node_id)
            REFERENCES ludobaum.node(id) ON DELETE CASCADE,
    CONSTRAINT fk_head_node
        FOREIGN KEY(head_node_id)
            REFERENCES ludobaum.node(id) ON DELETE CASCADE
);

CREATE TABLE ludobaum.attribute_list(
    id SERIAL UNIQUE,
    name VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES ludobaum.ludobaum_user(id) ON DELETE CASCADE
);

CREATE TABLE ludobaum.attribute_list_element(
    id SERIAL UNIQUE,
    list_id INT NOT NULL,
    text VARCHAR(4095),
    sort_order INT NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT fk_list
        FOREIGN KEY(list_id)
            REFERENCES ludobaum.attribute_list(id) ON DELETE CASCADE
);

CREATE TABLE ludobaum.node_attribute(
    id SERIAL UNIQUE,
    node_id INT NOT NULL,
    attribute_type VARCHAR(31) NOT NULL, 
    sort_order INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    text VARCHAR(4095),
    number INT,
    list_id INT,
    list_element_id INT,

    PRIMARY KEY(id),
    CONSTRAINT fk_node
        FOREIGN KEY(node_id)
            REFERENCES ludobaum.node(id) ON DELETE CASCADE,
    CONSTRAINT fk_list
        FOREIGN KEY(list_id)
            REFERENCES ludobaum.attribute_list(id),
    CONSTRAINT fk_list_element
        FOREIGN KEY(list_element_id)
            REFERENCES ludobaum.attribute_list_element(id)
);

ALTER TABLE ludobaum.ludobaum_user OWNER TO ludobaum;
ALTER TABLE ludobaum.node OWNER TO ludobaum;
ALTER TABLE ludobaum.node_connection OWNER TO ludobaum;
ALTER TABLE ludobaum.attribute_list OWNER TO ludobaum;
ALTER TABLE ludobaum.attribute_list_element OWNER TO ludobaum;
ALTER TABLE ludobaum.node_attribute OWNER TO ludobaum;