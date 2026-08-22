---
name: warisskill-ui-ux-motion-design
description: >
  Use when adding, reviewing, or fixing any UI animation or transition on
  web — button feedback, modal/panel enter-exit, page transitions,
  scroll-linked reveals, loading/skeleton states, hover/drag interactions.
  Trigger on animation jank/stutter reports, "make this feel more alive,"
  or when a component change introduces new motion. Depends on
  warisskill-ui-ux-visual-design-taste for how expressive the motion
  should be — pick that mode first.
---

# Motion/Animation Design

## Step 1: does this need to exist?

Motion must do at least one of the following, or it gets cut:

- Guide attention
- Communicate a state change
- Preserve spatial continuity (where did this element come from/go to)

Decoration with no functional job is the first thing to remove, not the
last. This applies regardless of expressiveness mode below — even bold
mode's "delightful touches" need a job, they just get more license in how
loud that job can be.

## Step 2: how much motion — inherit from visual-taste mode

No fixed personal expressiveness level — it follows whichever mode
`warisskill-ui-ux-visual-design-taste` picked for the surface:

| Mode | Motion default |
|---|---|
| Dense (admin/dashboard) | Minimal — fast functional feedback only (button press, toggle, tooltip). No hero entrances, no scroll-linked flourish. |
| Minimal | Restrained — subtle enter/exit on modals and key state changes, short durations, no bounce. |
| Bold (consumer/marketing) | More license for expressive/delightful motion — but still spent deliberately on one or two moments (hero entrance, key CTA), not spread evenly across every element. |

## Step 3: pick the mechanism

No fixed library preference — decide per project, but bias toward the
lightest tool that does the job:

- **CSS transitions/keyframes** for simple state feedback (hover, focus,
  toggle, simple fade/slide) — no JS dependency, cheapest to maintain.
- **A JS animation library** (Motion for React, GSAP, etc.) only when the
  interaction genuinely needs spring physics, gesture handling, or
  orchestrated sequences CSS can't express cleanly. Don't default to a JS
  library out of habit when CSS covers it.

## Step 4: performance and accessibility — strong default, name the exception

Treat these as the default, not case-by-case guesswork:

- **Animate `transform` and `opacity` only.** These are composite-only
  properties — animating `width`, `height`, `top`, `left`, `margin`, or
  `padding` forces layout recalculation and causes jank.
- **Respect `prefers-reduced-motion`.** When it's set, disable transform
  animation; an opacity-only fade at ≤0.2s is the acceptable fallback, not
  silently doing nothing.
- **Don't block input.** A smooth 60fps animation that delays a user's next
  action is worse than no animation — responsiveness outranks smoothness.

If a specific effect genuinely requires animating a layout property (rare —
e.g. an accordion height that can't be faked with `max-height` cleanly),
that's an allowed exception, but make it a deliberate, named decision in
the code (a comment saying why), not a default reached for out of
convenience.

## Anti-patterns to reject

- Animating `height`/`width`/`top`/`left` directly when `transform` would
  do the job.
- Motion with no `prefers-reduced-motion` handling.
- Scroll-linked or hover animations that fire on every element instead of
  the one or two that matter.
- Bounce/spring easing applied to functional UI feedback (buttons, toggles)
  in dense/minimal mode — save playful physics for bold-mode moments.

## Limitations

- This covers web UI motion. Native platform animation (SwiftUI, Compose,
  Three.js/WebGL scenes) has different performance models and isn't
  covered here.
