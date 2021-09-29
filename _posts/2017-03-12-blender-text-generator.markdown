---
title: "Blender Text Generator"
date: 2017-03-12T00:00:00+02:00
categories: projects software
description: "Transform Text to Blender 3D Objects."
thumbnail: "/assets/img/projects/blender-text-generator.png"
layout: post
---

## Introduction

During the [HHG-Gymnasium BL MINT 2017](/camps/mint)
student exchange, the need for an application to quickly generate text in the
[wavefront .obj](https://en.wikipedia.org/wiki/Wavefront_.obj_file) format for
3D printing has arisen. I have noticed that using
[Blender](https://www.blender.org/) for such a simple task seemed to be quite
overkill, so I decided to write an application over a night.

![BlenderTextGenerator](/assets/img/projects/blender-text-generator.png)

### How It Works

The application is written in _python_ so that it can interface with
_Blender_'s _python_ API.

The application is a set of two scripts:

* _BlenderSup.py_ - Interfaces with _Blender_ to create the _wavefront object_.
* BlenderTextGenerator.py - Runs the [GTK](https://www.gtk.org/) GUI
  application.

### License

This software is licensed with the
[GPL](https://www.gnu.org/licenses/gpl-3.0.en.html) license.

### Download

You can download this project from
[GitHub](https://github.com/markovejnovic/BlenderTextGenerator).

### Future improvements

* The _BlenderSup_ command line interface is quite lackluster. Improvements
  here are required.
* Adding [OpenGL](https://www.opengl.org/) rendering for the _wavefront object_
  in the GTK application would be quite useful.
