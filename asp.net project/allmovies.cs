using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Linq.Mapping;
using System.Collections;


namespace asp.net_project
{
    [Table]
    public class allmovies
    {
        [Column(IsPrimaryKey = true, IsDbGenerated = false)]
        public int id { get; set; }

        [Column]
        public string title { get; set; }

        [Column]
        public string company { get; set; }

        [Column]
        public string director { get; set; }

        [Column]
        public string editor { get; set; }


    }

}