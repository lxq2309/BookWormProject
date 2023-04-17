﻿using BookWormProject.Models;
using Microsoft.AspNetCore.Mvc;
using BookWormProject.ViewModels;
using BookWormProject.Data.Services;

[ViewComponent(Name = "MenuGenres")]
public class MenuGenresComponent : ViewComponent
{
    private readonly IGenreService _genreService;

    public MenuGenresComponent(IGenreService genreService)
    {
        _genreService = genreService;
    }

    public async Task<IViewComponentResult> InvokeAsync()
    {
        var genres = _genreService.GetAllGenres().OrderBy(x => x.Name).ToList();
        return View(genres);
    }
}