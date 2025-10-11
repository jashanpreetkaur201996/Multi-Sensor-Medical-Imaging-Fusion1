# Multi-Sensor Medical Imaging Fusion Using Hybrid Filtering and Multi-Scale Adaptive Decomposition (HF-MSAD)

This repository provides the full implementation of the **HF-MSAD framework** for multi-modal medical image fusion using hybrid spatial filtering and multi-scale adaptive decomposition. The technique is validated on multi-sensor image pairs to enhance structure-preserving, contrast-enhanced fused images.

---

##  Paper Information

**Title:** Multi-Sensor Medical Image Fusion Using Hybrid Filtering and Multi-Scale Adaptive Decomposition Approach  
**Authors:** Jashanpreet Kaur, Shalli Rani, Ayush Dogra, Mohammed Wasim Bhatt  
**Language**: MATLAB (R2018a or higher)
**Affiliation:** Chitkara University, Punjab (India) 


---

##  Overview

This repository provides the MATLAB implementation of the proposed Hybrid Filtering with Multi-Scale Adaptive Decomposition (HF‑MSAD) framework for multi-sensor brain image fusion.
The method integrates bilateral filtering, guided filtering, and a multi-scale adaptive fusion strategy to produce high-quality fused brain images that preserve both structural edges and soft-tissue contrast.

HF‑MSAD aims to address common limitations in existing fusion techniques, such as excessive blurring, edge loss, and artifact amplification, while maintaining computational efficiency and interpretability.

---



---

## Requirements

MATLAB R2018a or later
Image Processing Toolbox
Registered brain image pairs (e.g., CT–MRI, PET–MRI, SPECT–MRI) in .tif/.png format


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



For queries, collaborations, or feedback, please contact:
📧 jashanpreetkaur201996@gmail.com
