﻿using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using TempProject.Models;

namespace TempProject.DTO.ResponseDTO
{
    public class EmployeeCompetencyEvaluationResponseDTO
    {
        public int id { get; set; }
        public int Rig { get; set; }
        [Column(TypeName = "date")]
        public DateTime Date { get; set; }


        [ForeignKey("Subjectlist")]
        public int SubjectId { get; set; }

        public virtual SubjectList Subjectlist { get; set; }

        public int QHSEEmpCode { get; set; }
        public string QHSEPositionName { get; set; }
        public string QHSEEmpName { get; set; }

        public int EmployeeCode { get; set; }
        public string EmployeePositionName { get; set; }
        public string EmployeeName { get; set; }

        public string Description { get; set; }

        public string userID { get; set; }


        [DefaultValue(false)]
        public bool IsDeleted { get; set; }
    }
}
