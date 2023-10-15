﻿using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using TempProject.Repository;

namespace TempProject.Models
{
	public class HazardImages : ISoftDeleteRepository
	{
			public int Id { get; set; }
			public string FileName { get; set; }
			//public byte[] Data { get; set; } 
			[ForeignKey("PotentialHazard")]
			public int PotentialHazardId { get; set; } 
			public virtual PotentialHazard PotentialHazard { get; set; }
		    [DefaultValue(false)]
		    public bool IsDeleted { get; set; }

	}
}
