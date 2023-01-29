using Microsoft.AspNetCore.Http;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace Byaf.Helpers
{
    public static class Helper
    {
        public static List<string> UploadImages(List<IFormFile> files)
        {
            long size = files.Sum(f => f.Length);
            List<string> images = new List<string>();
            foreach (var formFile in files)
            {
                if (formFile.Length > 0)
                {
                    var filePath = Path.Combine("C:\\Users\\aedris\\AppData\\Local\\Temp", Path.GetRandomFileName());
                    images.Add(filePath);
                    using (var stream = System.IO.File.Create(filePath))
                    {
                        formFile.CopyTo(stream);
                    }
                }
            }

            return images;
        }
    }
}
