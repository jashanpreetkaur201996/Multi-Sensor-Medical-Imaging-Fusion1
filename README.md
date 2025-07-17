# Multi-Sensor Medical Imaging Fusion Using Hybrid Filtering and Multi-Scale Adaptive Decomposition (HF-MSAD)

This repository provides the full implementation of the **HF-MSAD framework** for multi-modal medical image fusion using hybrid spatial filtering and multi-scale adaptive decomposition. The technique is validated on CT–MRI image pairs to enhance clinical diagnosis through structure-preserving, contrast-enhanced fused images.

---

##  Paper Information

**Title:** Multi-Sensor Medical Image Fusion Using Hybrid Filtering and Multi-Scale Adaptive Decomposition Approach  
**Authors:** Jashanpreet Kaur, Shalli Rani, Ayush Dogra, Mohammed Wasim Bhatt  
**Affiliation:** Chitkara University, Punjab (India) 


---

##  Abstract

The proposed HF-MSAD framework fuses multi-modal medical images (e.g., CT and MRI) using a combination of **bilateral filtering**, **guided filtering**, **Gaussian high-pass filtering**, and **multi-scale adaptive fusion**. It addresses key challenges such as noise, edge blurring, and fine detail loss by decomposing input images into base and detail layers. The adaptive fusion pipeline enhances both low-frequency structures and high-frequency textures, resulting in superior fused outputs for clinical interpretation.

---

## Features

- Hybrid spatial filtering: Bilateral + Guided + GHPF
- Adaptive weight-based fusion for base and detail layers
- Maximum selection for high-frequency fusion
- Final contrast enhancement using histogram stretching
- Supports grayscale CT and MRI images
- Ablation study and quantitative results provided
- Evaluated using 8 performance metrics: API, AG, SD, SF, En, FS, CC, MI

---

## 🗂️ Repository Structure
📁 Multi-Sensor-Medical-Imaging-Fusion1/
├── main.m # Entry point: full fusion pipeline
├── bilateral_filter.m # Bilateral filter implementation
├── guided_filter.m # Guided filter implementation
├── high_pass_filter.m # Gaussian HPF
├── fusion_functions.m # Fusion strategies (base, detail, HP)
├── contrast_enhancement.m # Final enhancement step
├── evaluation_metrics.m # Metric calculation (API, SF, etc.)
├── sample_data/
│ ├── CT_MRI_Dataset1/
│ ├── CT_MRI_Dataset2/
│ └── CT_MRI_Dataset3/
├── results/ # Stores fused outputs
└── README.md # Project documentation


---

##  Datasets Used

We used **three publicly available multimodal datasets** (CT and MRI) for validation. These are included as sample pairs in `sample_data/`. All images are grayscale and pre-registered.

- Dataset 1: T1-weighted MRI + non-contrast CT
- Dataset 2: T2-weighted MRI + CT
- Dataset 3: T1-weighted MRI + CT with calcifications

---

## Requirements

- MATLAB R2018b (tested offline)
- Image Processing Toolbox
- Recommended: 16GB RAM, Windows/Linux system



## How to Run

1. **Clone this repository**
   ```bash
   git clone https://github.com/jashanpreetkaur201996/Multi-Sensor-Medical-Imaging-Fusion1.git
   cd Multi-Sensor-Medical-Imaging-Fusion1
