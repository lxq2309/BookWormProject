﻿using Microsoft.AspNetCore.Mvc;

namespace BookWormProject.Controllers
{
    public class CommentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }


        public IActionResult Create()
        {
            return View();
        }


        public IActionResult Delete()
        {
            return View();
        }
    }
}