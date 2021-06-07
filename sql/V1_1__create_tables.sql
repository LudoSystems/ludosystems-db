-- ludosystems schema setup

CREATE TABLE ludosystems.ludosystems_user(
    id SERIAL UNIQUE,
    name VARCHAR(64) NOT NULL UNIQUE,
    password VARCHAR(64) NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    role varchar(64) NOT NULL,

    PRIMARY KEY(id)
);

CREATE TABLE ludosystems.node(
    id SERIAL UNIQUE,
    pos_x INT NOT NULL,
    pos_y INT NOT NULL,
    user_id INT NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES ludosystems.ludosystems_user(id) ON DELETE CASCADE
);

CREATE TABLE ludosystems.node_connection(
    id SERIAL UNIQUE,
    tail_node_id INT NOT NULL,
    head_node_id INT NOT NULL,

    PRIMARY KEY(id),
    UNIQUE(tail_node_id, head_node_id),
    CONSTRAINT fk_tail_node
        FOREIGN KEY(tail_node_id)
            REFERENCES ludosystems.node(id) ON DELETE CASCADE,
    CONSTRAINT fk_head_node
        FOREIGN KEY(head_node_id)
            REFERENCES ludosystems.node(id) ON DELETE CASCADE
);

CREATE TABLE ludosystems.attribute_list(
    id SERIAL UNIQUE,
    title VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,

    PRIMARY KEY(id),
    CONSTRAINT fk_user
        FOREIGN KEY(user_id)
            REFERENCES ludosystems.ludosystems_user(id) ON DELETE CASCADE
);

CREATE TABLE ludosystems.attribute_list_element(
    id SERIAL UNIQUE,
    list_id INT NOT NULL,
    text VARCHAR(4095),
    sort_order INT NOT NULL,
    
    PRIMARY KEY(id),
    UNIQUE(list_id, sort_order),
    CONSTRAINT fk_list
        FOREIGN KEY(list_id)
            REFERENCES ludosystems.attribute_list(id) ON DELETE CASCADE
);

CREATE TABLE ludosystems.node_attribute(
    id SERIAL UNIQUE,
    node_id INT NOT NULL,
    attribute_type VARCHAR(31) NOT NULL, 
    sort_order INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    text VARCHAR(4095),
    number INT,
    list_id INT,
    list_element_id INT,

    PRIMARY KEY(id),
    UNIQUE(node_id, sort_order),
    CONSTRAINT fk_node
        FOREIGN KEY(node_id)
            REFERENCES ludosystems.node(id) ON DELETE CASCADE,
    CONSTRAINT fk_list
        FOREIGN KEY(list_id)
            REFERENCES ludosystems.attribute_list(id),
    CONSTRAINT fk_list_element
        FOREIGN KEY(list_element_id)
            REFERENCES ludosystems.attribute_list_element(id)
);

ALTER TABLE ludosystems.ludosystems_user OWNER TO ludosystems;
ALTER TABLE ludosystems.node OWNER TO ludosystems;
ALTER TABLE ludosystems.node_connection OWNER TO ludosystems;
ALTER TABLE ludosystems.attribute_list OWNER TO ludosystems;
ALTER TABLE ludosystems.attribute_list_element OWNER TO ludosystems;
ALTER TABLE ludosystems.node_attribute OWNER TO ludosystems;