---
title: "Pickup Winder"
date: 2017-08-18T00:00:00+02:00
categories: projects electronics
description: "An Arduino-Based Pickup Winder."
layout: post
---

When I was working on building my
[Flying V]({% post_url 2018-07-03-flying-v %}), since I wanted to wind my own
pickups, I realized I needed to make a machine that can wind them.

So, I had to make a pickup winder. And, well, I did!

## Design

So, basically, it was a simple motor controlled by an _Arduino Uno_ and an
_H-bridge_. I added an encoder so that I can count the number of revolutions
made, since I wanted to keep that close for two bobbins of a humbucker.

A small friction driving belt was used to connect to an axis which had a small,
plastic carrier made on a lathe.

## Issues

The thing is, the torque of the motor that I found was very high, so it could
tear up the very thin pickup wire. I resolved this issue by holding the axis
with my fingers, effectively slowing it down.
