# E-Commerce Database (MySQL)

A relational database design and SQL practice project for an e-commerce website. It covers schema design (ER/EER diagrams), table creation with constraints, sample data, and a set of practice queries (DDL, DML, joins, aggregates, string functions, etc.).

## 📁 Repository Structure

```
ecommerce-project/
├── README.md
├── schema/
│   └── e_commerce_backup.sql   # Full DB dump: CREATE TABLE statements + sample data + view
├── queries/
│   └── queries.sql             # Practice queries (DDL/DML/SELECT/joins/functions)
└── erd/
    ├── ERD.png                 # Entity Relationship Diagram
    └── EERD.png                # Enhanced ER Diagram (with subtype/category specialization)
```

## 🗂️ Files to Upload

| File | Purpose |
|---|---|
| `schema/e_commerce_backup.sql` | ✅ The main schema file — full `mysqldump` with all `CREATE TABLE` statements, constraints, and sample rows. This is the one to run to recreate the database. |
| `queries/queries.sql` | ✅ Clean, organized SQL practice queries (extracted from the Word doc) covering DDL, DML, and SELECT operations. |
| `erd/ERD.png` | ✅ Entity Relationship Diagram image. |
| `erd/EERD.png` | ✅ Enhanced ER Diagram image (shows the `category` superclass with `clothing`/`electronics`/`food` subclasses). |
| `README.md` | ✅ This file. |

> **Note:** `table_creation.sql` and the `.docx` file were **not included** — `table_creation.sql` was an early draft (mostly commented out) superseded by `e_commerce_backup.sql`, and the `.docx` content has already been extracted into `queries/queries.sql` in a cleaner, plain-text SQL format that's easier to read/run on GitHub.

## 🖼️ Diagrams

**ER Diagram**
![ERD](erd/ERD.png)

**Enhanced ER Diagram**
![EERD](erd/EERD.png)

## 🧱 Database Schema

Database name: `e_commerce`

### Table: `category`
| Column | Type | Key |
|---|---|---|
| category_ID | INT | **PK** |
| category_name | VARCHAR(40) | |

### Table: `clothing` (subtype of category)
| Column | Type | Key |
|---|---|---|
| category_ID | INT | **PK, FK → category(category_ID)** |
| material | VARCHAR(40) DEFAULT 'not specified' | |
| gender | VARCHAR(10) NOT NULL | |

### Table: `electronics` (subtype of category)
| Column | Type | Key |
|---|---|---|
| category_ID | INT | **PK, FK → category(category_ID)** |
| voltage | VARCHAR(10) | |
| warrenty | VARCHAR(10) DEFAULT '1 year' | |

### Table: `food` (subtype of category)
| Column | Type | Key |
|---|---|---|
| category_ID | INT | **PK, FK → category(category_ID)** |
| storage | VARCHAR(10) DEFAULT 'in/out' | |
| expiry_date | DATE | |

### Table: `product`
| Column | Type | Key |
|---|---|---|
| product_ID | INT | **PK** |
| product_name | VARCHAR(40) | |
| product_price | FLOAT NOT NULL | |
| stock_quantity | INT | |
| category_ID | INT | **FK → category(category_ID)** |

### Table: `brand`
| Column | Type | Key |
|---|---|---|
| brand_ID | INT | **PK** |
| location | VARCHAR(50) DEFAULT 'unknown' | |
| brandname | VARCHAR(20) | |
| phoneno | VARCHAR(20) | **UNIQUE** |

### Table: `product_brand` (junction table)
| Column | Type | Key |
|---|---|---|
| product_brand_ID | INT | **PK** |
| product_ID | INT | **FK → product(product_ID)** |
| brand_ID | INT | **FK → brand(brand_ID)** |

### Table: `useraccount`
| Column | Type | Key |
|---|---|---|
| user_ID | INT | **PK** |
| userpassword | VARCHAR(40) | |
| username | VARCHAR(40) | |
| gender | VARCHAR(10) | |
| dateofbirth | DATE | |
| phoneno | VARCHAR(15) DEFAULT '0' | |
| email | VARCHAR(50) | **UNIQUE** |
| shippingaddress | VARCHAR(40) | |
| totalorderplace | INT DEFAULT 0 | |

### Table: `orders`
| Column | Type | Key |
|---|---|---|
| order_ID | INT | **PK** |
| order_date | DATE NOT NULL | |
| status | VARCHAR(20) | |
| total_amount | DECIMAL(10,2) NOT NULL | |
| totalproducts | INT NOT NULL | |
| user_ID | INT | **FK → useraccount(user_ID)** |

### Table: `product_order` (junction table)
| Column | Type | Key |
|---|---|---|
| product_order_ID | INT | **PK** |
| product_ID | INT | **FK → product(product_ID)** |
| order_ID | INT | **FK → orders(order_ID)** |
| productquantity | INT | |

### Table: `payment`
| Column | Type | Key |
|---|---|---|
| payment_ID | INT | **PK** |
| payment_date | DATE NOT NULL | |
| total_amount | DECIMAL(10,2) NOT NULL | |
| status | VARCHAR(20) | |
| order_ID | INT | **FK → orders(order_ID)** |

### Table: `card` (subtype of payment)
| Column | Type | Key |
|---|---|---|
| payment_ID | INT | **PK, FK → payment(payment_ID)** |
| cardno | INT NOT NULL | |
| cardtype | VARCHAR(20) NOT NULL | |

### Table: `cod` (Cash on Delivery — subtype of payment)
| Column | Type | Key |
|---|---|---|
| payment_ID | INT | **PK, FK → payment(payment_ID)** |
| collectedby | VARCHAR(40) | |

### Table: `review`
| Column | Type | Key |
|---|---|---|
| review_ID | INT | **PK** |
| comments | VARCHAR(50) | |
| user_ID | INT | **FK → useraccount(user_ID)** |

### View: `complex`
A view joining `payment` and `cod` to show `payment_ID`, `payment_date`, and `collectedby` for cash-on-delivery payments.

## 🔗 Relationship Summary

- `category` 1—M `product` (a category has many products)
- `category` 1—1 `clothing` / `electronics` / `food` (category specialization/subtype)
- `product` M—M `brand` via `product_brand`
- `useraccount` 1—M `orders` (a user places many orders)
- `orders` M—M `product` via `product_order`
- `orders` 1—1 `payment` (each order has one payment)
- `payment` 1—1 `card` / `cod` (payment specialization/subtype)
- `useraccount` 1—M `review` (a user writes many reviews)

## 🚀 How to Use

1. Clone the repo.
2. Import the schema and sample data:
   ```bash
   mysql -u root -p < schema/e_commerce_backup.sql
   ```
3. Run practice queries:
   ```bash
   mysql -u root -p e_commerce < queries/queries.sql
   ```
   (or open `queries/queries.sql` in MySQL Workbench and run statements individually)

## 🛠️ Tech Stack

- MySQL 8.0
- MySQL Workbench (for ERD/EERD design)

