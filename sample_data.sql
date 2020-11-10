-- Inserts a very basic graph into the database. 
WITH node_1 AS (
    INSERT INTO ludobaum.node(pos_x, pos_y)
        VALUES (25, 25)
    RETURNING id AS id
), node_2 AS (
    INSERT INTO ludobaum.node(pos_x, pos_y)
        VALUES (50, 10)
    RETURNING id AS id
), node_3 AS (
    INSERT INTO ludobaum.node(pos_x, pos_y)
        VALUES(50, 40)
    RETURNING id AS id
), node_4 AS (
    INSERT INTO ludobaum.node(pos_x, pos_y)
        VALUES (75, 10)
    RETURNING id AS id
), arrow_1 AS (
    INSERT INTO ludobaum.arrow(tail_node_id, head_node_id)
        SELECT node_1.id, node_2.id 
        FROM node_1, node_2
    RETURNING id AS id
), arrow_2 AS (
    INSERT INTO ludobaum.arrow(tail_node_id, head_node_id)
        SELECT node_1.id, node_3.id 
        FROM node_1, node_3
    RETURNING id AS id
), arrow_3 AS (
    INSERT INTO ludobaum.arrow(tail_node_id, head_node_id)
        SELECT node_2.id, node_4.id 
        FROM node_2, node_4
    RETURNING id AS id
), arrow_4 AS (
    INSERT INTO ludobaum.arrow(tail_node_id, head_node_id)
        SELECT node_4.id, node_3.id 
        FROM node_4, node_3
    RETURNING id AS id
), character_list AS (
    INSERT INTO ludobaum.attribute_list (name)
        VALUES('Character')
    RETURNING id AS id
), npc AS (
    INSERT INTO ludobaum.attribute_list_element(list_id, text)
        SELECT character_list.id, 'Player'
        FROM character_list 
    RETURNING id AS id
), pc AS (
    INSERT INTO ludobaum.attribute_list_element(list_id, text)
        SELECT character_list.id, 'NPC'
        FROM character_list
    RETURNING id AS id
), node_1_attribute_1 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, list_id, list_element_id) 
        SELECT node_1.id, 'LIST', 0, 'Character', character_list.id, npc.id
        FROM node_1, character_list, npc
), node_1_attribute_2 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, text) 
        SELECT node_1.id, 'TEXT', 1, 'Text', 'Hello'
        FROM node_1
), node_2_attribute_1 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, list_id, list_element_id) 
        SELECT node_2.id, 'LIST', 0, 'Character', character_list.id, pc.id
        FROM node_2, character_list, pc
), node_2_attribute_2 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, text) 
        SELECT node_2.id, 'TEXT', 1, 'Text', 'Hi!'
        FROM node_2
), node_2_attribute_3 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, number) 
        SELECT node_2.id, 'NUMBER', 2, 'Priority', 1
        FROM node_2
), node_3_attribute_1 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, list_id, list_element_id) 
        SELECT node_3.id, 'LIST', 0, 'Character', character_list.id, pc.id
        FROM node_3, character_list, pc
), node_3_attribute_2 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, text) 
       SELECT node_3.id, 'TEXT', 1, 'Text', 'Goodbye!'
       FROM node_3
), node_3_attribute_3 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, number) 
        SELECT node_3.id, 'NUMBER', 2, 'Priority', 2
        FROM node_3
), node_4_attribute_1 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, list_id, list_element_id)
        SELECT node_4.id, 'LIST', 0, 'Character', character_list.id, npc.id
        FROM node_4, character_list, npc
), node_4_attribute_2 AS (
    INSERT INTO ludobaum.node_attribute(node_id, attribute_type, sort_order, name, text)
        SELECT node_4.id, 'TEXT', 1, 'Text', 'Bye'
        FROM node_4   
)
SELECT * FROM ludobaum.node;