/*
MongoDB Query Project - Sample Books Database
Note: This database can be loaded using MongoDB's sample datasets
These queries demonstrate various MongoDB operations on a books collection. 
This project was completed as part of my Advanced Databases module for my Higher Diploma in Data Analytics.
*/

// ===============================
// FIND AND COUNT OPERATIONS
// ===============================

// 1. Find books written by Sara Shepard or Don Freeman
db.books.find({ author: { $in: ["Sara Shepard", "Don Freeman"] } });

// 2. Find books with more than or equal to 150,000 ratings
db.books.find({ ratings: { $gte: 150000 } });

// 3. Find books written before 2005
db.books.find({ year: { $lt: 2005 } });

// 4. Find books by authors whose names begin with 'S'
db.books.find({ author: { $regex: /^S/ } });

// 5. Find books with the word 'Memoir' in the title
db.books.find({ title: { $regex: /Memoir/, $options: "i" } });

// 6. Count books published in 2005
db.books.countDocuments({ year: 2005 });

// 7. Count books written by Stephen King or Harper Lee
db.books.countDocuments({ author: { $in: ["Stephen King", "Harper Lee"] } });

// 8. Count books not published by Penguin Books
db.books.countDocuments({ publisher: { $ne: "Penguin Books" } });

// 9. Count books published between 1990 and 2000
db.books.countDocuments({ year: { $gte: 1990, $lte: 2000 } });

// 10. Count books neither in the non-fiction nor fiction genre
db.books.countDocuments({ genre: { $nin: ["non-fiction", "fiction"] } });

// 11. Find the top 5 books with the highest ratings
db.books.find().sort({ ratings: -1 }).limit(5);

// 12. Find non-fiction books sorted by publishing year in ascending order
db.books.find({ genre: "non-fiction" }).sort({ year: 1 });

// 13. Find books published after 2000 by famous authors, sorted by year
db.books.find({ year: { $gt: 2000 }, author: { $in: ["Famous Author1", "Famous Author2"] } }).sort({ year: 1 });

// 14. Find books with an average rating of no less than 3.5
db.books.find({ avg_rating: { $gte: 3.5 } }).sort({ avg_rating: 1 });

// 15. Find books with even-numbered gross sales, sorted by sale price in descending order
db.books.find({ gross_sales: { $mod: [2, 0] } }).sort({ sale_price: -1 });

// ===============================
// AGGREGATION OPERATIONS
// ===============================

// 1. Group by genre and calculate total gross sales
db.books.aggregate([{ $group: { _id: "$genre", totalSales: { $sum: "$gross_sales" } } }]);

// 2. Calculate the average sale price for each genre
db.books.aggregate([{ $group: { _id: "$genre", avgPrice: { $avg: "$sale_price" } } }]);

// 3. Match books published after 2008, group by genre, and count books
db.books.aggregate([
    { $match: { year: { $gt: 2008 } } },
    { $group: { _id: "$genre", bookCount: { $sum: 1 } } }
]);

// 4. Project book name, author, and average rating
db.books.aggregate([{ $project: { book_name: 1, author: 1, avg_rating: 1 } }]);

// 5. Calculate max sale price per book and group by publisher
db.books.aggregate([{ $group: { _id: "$publisher", maxPrice: { $max: "$sale_price" } } }]);

// 6. Group by author rating and count books
db.books.aggregate([{ $group: { _id: "$author_rating", bookCount: { $sum: 1 } } }]);

// 7. Calculate minimum units sold by each publisher
db.books.aggregate([{ $group: { _id: "$publisher", minUnitsSold: { $min: "$units_sold" } } }]);

// 8. Match books published in/after 2010 with an 'Excellent' author rating
db.books.aggregate([
    { $match: { year: { $gte: 2010 }, author_rating: "Excellent" } }
]);

// 9. Group by publisher and calculate total sales for publishers with over 100,000 gross sales
db.books.aggregate([
    { $group: { _id: "$publisher", totalSales: { $sum: "$gross_sales" } } },
    { $match: { totalSales: { $gt: 100000 } } }
]);

// 10. Group by year and genre, count documents, and sort by year
db.books.aggregate([
    { $group: { _id: { year: "$year", genre: "$genre" }, count: { $sum: 1 } } },
    { $sort: { "_id.year": -1 } }
]);

// ===============================
// CRUD OPERATIONS
// ===============================

// Insert one complete document
db.books.insertOne({ title: "Sample Book", author: "Sample Author", year: 2020, genre: "Fiction", avg_rating: 4.5 });

// Insert partial document
db.books.insertOne({ title: "Partial Book", year: 2021 });

// Insert with a new field
db.books.insertOne({ title: "Book with Pages", pages: 300, author: "Author Name" });

// Insert many documents
db.books.insertMany([{ title: "Book1", author: "Author1" }, { title: "Book2", author: "Author2" }]);

// Update one document
db.books.updateOne({ author: "Breda Oppenheim" }, { $set: { year: 2020, pages: 350 } });

// Update many documents
db.books.updateMany({ year: { $lt: 2000 } }, { $set: { reviewed: true } });

// Delete one document
db.books.deleteOne({ author: "Author Name" });

// Delete many documents
db.books.deleteMany({ author: { $in: ["Author1", "Author2"] } });
