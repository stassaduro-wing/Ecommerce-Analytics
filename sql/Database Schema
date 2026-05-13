-- eCommerce Database Schema Reconstruction
-- Database Engine: PostgreSQL

-- 1. Distribution Centers Table
CREATE TABLE distribution_centers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    CONSTRAINT distribution_centers_latitude_check CHECK (latitude >= -90 AND latitude <= 90),
    CONSTRAINT distribution_centers_longitude_check CHECK (longitude >= -180 AND longitude <= 180)
);

-- 2. Users Table
CREATE TABLE users (
    id BIGINT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    age INT,
    gender VARCHAR(100),
    state VARCHAR(100),
    street_address VARCHAR(255),
    postal_code VARCHAR(255),
    city VARCHAR(255),
    country VARCHAR(255),
    latitude DOUBLE PRECISION,
    longitude DOUBLE PRECISION,
    traffic_source VARCHAR(100),
    created_at TIMESTAMPTZ,
    CONSTRAINT users_latitude_check CHECK (latitude >= -90 AND latitude <= 90),
    CONSTRAINT users_longitude_check CHECK (longitude >= -180 AND longitude <= 180)
);

-- 3. Products Table
CREATE TABLE products (
    id BIGINT PRIMARY KEY,
    cost DOUBLE PRECISION,
    category VARCHAR(50),
    name TEXT,
    brand VARCHAR(50),
    retail_price DOUBLE PRECISION,
    department VARCHAR(50),
    sku VARCHAR(50),
    distribution_center_id INT,
    CONSTRAINT fk_distribution_center FOREIGN KEY (distribution_center_id) REFERENCES distribution_centers(id)
);

-- 4. Inventory Items Table
CREATE TABLE inventory_items (
    id BIGINT PRIMARY KEY,
    product_id BIGINT,
    created_at TIMESTAMPTZ,
    sold_at TIMESTAMPTZ,
    cost DOUBLE PRECISION,
    product_category VARCHAR(100),
    product_name VARCHAR(255),
    product_brand VARCHAR(100),
    product_retail_price DOUBLE PRECISION,
    product_department VARCHAR(100),
    product_sku VARCHAR(100),
    product_distribution_center_id INT,
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(id)
    CONSTRAINT fk_distribution_center_id FOREIGN KEY (product_distribution_center_id) REFERENCES distribution_centers(id)
);

-- 5. Orders Table
CREATE TABLE orders (
    order_id BIGINT PRIMARY KEY,
    user_id BIGINT,
    status VARCHAR(50),
    gender VARCHAR(50),
    created_at TIMESTAMPTZ,
    returned_at TIMESTAMPTZ,
    shipped_at TIMESTAMPTZ,
    delivered_at TIMESTAMPTZ,
    num_of_item INT,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
);

-- 6. Order Items Table
CREATE TABLE order_items (
    id BINGINT PRIMARY KEY,
    order_id BIGINT,
    user_id BIGINT,
    product_id BIGINT,
    inventory_item_id BIGINT,
    status VARCHAR(50),
    created_at TIMESTAMPTZ,
    shipped_at TIMESTAMPTZ,
    delivered_at TIMESTAMPTZ,
    returned_at TIMESTAMPTZ,
    sale_price DOUBLE PRECISION,
    CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id),
    CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES products(id),
    CONSTRAINT fk_inventory_items_id FOREIGN KEY (inventory_item_id) REFERENCES inventory_items(id)
);

-- 7. Events Table (Web Analytics)
CREATE TABLE events (
    id BIGINT PRIMARY KEY,
    user_id BIGINT,
    sequence_number INT,
    session_id VARCHAR(255),
    created_at TIMESTAMPTZ,
    ip_address VARCHAR(45),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(100),
    browser VARCHAR(100),
    traffic_source VARCHAR(100),
    uri VARCHAR(100),
    event_type VARCHAR(100),
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id)
);
