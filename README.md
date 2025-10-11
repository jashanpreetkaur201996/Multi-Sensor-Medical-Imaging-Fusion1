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
Pre-alligned brain image pairs (e.g., CT–MRI, PET–MRI, SPECT–MRI) in .tif/.png format


---

##  Datasets Used

We used **six publicly available multi-sensor datasets** (CT,MRI,PET,SPECT) for validation.  All images are pre-alligned.

- Dataset 1: Pair of CT (non-contrast) + T1-weighted MRI
- Dataset 2: CT (non-contrast) + T2-weighted MRI
- Dataset 3: T1-weighted MRI + CT (bony structure)
- Dataset 4: Pair of T2-weighted MRI + T1-weighted MRI
- Dataset 5: Pair of T2-weighted MRI + PET (functional)
- Dataset 6: Pair of T2-weighted MRI + SPECT (functional)

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
