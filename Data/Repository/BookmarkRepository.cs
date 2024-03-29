﻿using BookWormProject.Models;
using Microsoft.EntityFrameworkCore;

namespace BookWormProject.Data.Repository
{
    public class BookmarkRepository : IBookmarkRepository
    {
        private readonly BookWormDbContext _context;

        public BookmarkRepository(BookWormDbContext context)
        {
            _context = context;
        }

        public void Add(Bookmark bookmark)
        {
            _context.Bookmarks.Add(bookmark);
            _context.SaveChanges();
        }

        public void Delete(Bookmark bookmark)
        {
            _context.Bookmarks.Remove(bookmark);
            _context.SaveChanges();
        }

        public IEnumerable<Bookmark> GetAll()
        {
            return _context.Bookmarks.ToList();
        }

        public Article? GetArticleForBookmark(int bookmarkId)
        {
            var bookmark = _context.Bookmarks.Include(x => x.Article).FirstOrDefault(x => x.BookmarkId == bookmarkId);
            if (bookmark != null)
            {
                return bookmark.Article;
            }

            return null;
        }

        public Bookmark GetById(int id)
        {
            return _context.Bookmarks.SingleOrDefault(x => x.BookmarkId == id);
        }

        public void Update(Bookmark bookmark)
        {
            _context.Bookmarks.Update(bookmark);
            _context.SaveChanges();
        }
    }
}