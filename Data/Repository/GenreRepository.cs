﻿using BookWormProject.Models;
using Microsoft.EntityFrameworkCore;

namespace BookWormProject.Data.Repository
{
    public class GenreRepository : IGenresRepository
    {
        private readonly BookWormDbContext _context;

        public GenreRepository(BookWormDbContext context)
        {
            _context = context;
        }

        public void Add(Genre genre)
        {
            _context.Genres.Add(genre);
            _context.SaveChanges();
        }

        public void Delete(Genre genre)
        {
            genre.IsDeleted = true;
            _context.SaveChanges();
        }

        public IEnumerable<Genre> GetAll()
        {
            return _context.Genres.Where(x => x.IsDeleted == null).ToList();
        }

        public IEnumerable<Article>? GetArticlesForGenre(int id)
        {
            var genre = _context.Genres.Include(x => x.Articles).FirstOrDefault(x => x.IsDeleted == null && x.GenreId == id);
            if (genre != null)
            {
                return genre.Articles;
            }
            return null;
        }

        public Genre GetById(int id)
        {
            return _context.Genres.SingleOrDefault(x => x.IsDeleted == null && x.GenreId == id);
        }

        public void Update(Genre genre)
        {
            _context.Genres.Update(genre);
            _context.SaveChanges();
        }
    }
}