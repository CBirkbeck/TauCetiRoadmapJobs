# Review of YoungIntegrationAndRoughPaths (pull request #2497 at 6fcd7ea)

**Verdict:** accepted

**Summary.** Accepted: this head repairs both findings of the previous review (the three false prose targets of §1.1, §1.2 and §4.1, and the home-directory path), and all five small corrections; the repairs were recomputed and introduce no new problem. The extension constant now has the exponent `(⌊p⌋ + 1)/p`, which answers the earlier question, though the book could still not be read to confirm it. Two format notes remain, neither blocking. The humans who approve have four points to decide, chiefly that none of the three cited books could be read.

## N01 — Three Mathlib pull-request numbers remain in the supplier contract

README lines 140, 142 and 145 still identify the shapes of `rEVariationOn` and `ControlOn`, and the Hopf-algebra prior art, by pull-request number. The shapes are now described in words beside them, so the numbers could go; a reader a year on cannot tell what they held.

## N02 — The last section header of `Suggested.lean` has only `#check` lines under it

Line 790, "Mathlib and Tau Ceti vocabulary used by the README", heads no declaration. A plain comment would do in place of a section header.

## Previous findings

- R01 — repaired: §1.1 now reads "for a Banach space `E` … the continuous paths"; §1.2 "of a continuous path of finite `p`-variation"; §4.1 states the two directions separately, the converse under `ω(s, t) ≤ K (t − s)`, with both counterexamples.
- R02 — repaired: "CKMA, *Core knowledge in mathematical analysis*, a Lean project under the Apache 2.0 licence", with its public repository; the entry numbers are said to index its synopsis of area 09; "the charter" is gone.
- C01 — repaired: `rEVariationOn_one` is proved in place by one `simp`, its docstring calls it a Check of Layer 1, and the README lists it under the Checks.
- C02 — repaired: `tendsto_isYoungSolution` has the binder `hXv : rEVariationOn (ENNReal.ofReal p) X (Icc 0 T) ≠ ⊤`.
- C03 — repaired: "there is `C = C(α, d)`"; the Conventions add "their constants may depend on `d`".
- C04 — repaired: "It is the carrier in which the RDE fixed point of §5.1 is taken."
- C05 — repaired: "a Brownian path has finite `p`-variation for every `p > 2` and infinite `2`-variation".
- N01 — partly repaired: the numbers are gone from the layers and from `Suggested.lean`; three remain in the supplier contract (N01 above).
- N02 — repaired: "replaced … when they land", "is not waited for" and the heading's parenthesis are gone.
- N03 — partly repaired: the docstring of `IsBrownian` names `IsBrownianVector P B`; the section header remains (N02 above).
- Question on `lyonsBeta` — answered by the change: the exponent is now `(⌊p⌋ + 1)/p` in the README and in the definition; see *Not verifiable*.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 The `r`-variation (sampled): Banach space, prose | constant paths; uniform limits; the two norms | `p`-variation convergence gives uniform convergence, limit continuous; `sup|X| ≤ |X a| + V_p`, `|X a| ≤ sup|X|` | true as restated | none |
| 1.1 `rEVariationOn_one` | elaboration of the proof | closes by `simp [rEVariationOn, eVariationOn]`; type unchanged | true, marked as a Check | none |
| 1.2 interpolation, prose, and its new Check | `1_{[1/2,1]}`, `p = 1`; continuous `X` | `V_1 = 1`; jump of `X^D − X` at `1/2` is `1` for every mesh; for continuous `X`: bounded in `p`-variation, uniform convergence | target true; Check true | none |
| 2.3 `tendsto_isYoungSolution` | elaborated type | `rEVariationOn (ENNReal.ofReal p) X (Icc 0 T) ≠ ∞` is an explicit binder, after the two continuity hypotheses | agrees with README | none |
| Layer 2 Check on `p < 2` | Brownian path | finite `p`-variation for `p > 2`, infinite `2`-variation almost surely; excluded range is `p ≥ 2` | true | none |
| 3.2 `lyonsBeta` and its Checks | `p = 1, 2, 2.5` | `7.5797`, `33.5557`; at `2.5`: exponent `1.2` gives `86.538`, exponent `1.4` gives `57.472`; `(⌊p⌋+1)/p > 1` always | Checks true; exponent matches the route's first step `θ = (⌊p⌋+1)/p` | none |
| 3.2 neo-classical inequality, prose | `p = 2`, `n = 1`, `a = b = 1`; `n = 0`; `p = 1` | left `2.2568`, right `6.383` (with `p`: `3.19`); `1 ≤ p²`; equality (binomial theorem) | true; `p²` is Lyons' constant (HaraHino2010 lines 17–25) | none |
| 4.1 Level-2 rough paths (sampled): comparison with §3.3, prose | forward bounds; reversed times; `X ≡ 0`, `XX = (t−s) I`; `X = t^(1/4)` | `ω = c (t−s)`: `ω^(1/p) = c^α (t−s)^α`; `XX t s = −XX s t + ΔX⊗ΔX`, symmetric part `½ΔX⊗ΔX`; `0 ≠ 2(t−s)`; `(a+b)² ≥ a² + b²`, `t^(1/4)` not `O(t^(1/2))` | true both ways as restated | none |
| 4.2 Controlled paths and the rough integral (sampled): `roughIntegral_spec` | `XX = (t−s) I`, `Y' t = √t ⟪·,·⟫`, `α = 1/2` | `(2/3) d ≤ C √d`, so `C ≥ (2/3)√d`; README now `C(α, d)`, Lean chooses `C` after `d` | consistent | none |

The rows for the untouched statements stand as in the previous review, of `1826128`.

- Source locators checked against the text: 0 of the README's (the three books remain unreadable); one supporting text read, HaraHino2010 lines 17–25, for the constant of the neo-classical inequality.
- Library declarations opened at the pin: `eVariationOn` (elaborated in the proof of `rEVariationOn_one`); StochasticCalculus on main declares `IsBrownianVector P B` with `B : Fin d → ℝ≥0 → Ω → ℝ` (`TauCetiRoadmap/StochasticCalculus/Suggested.lean` line 464), as the new docstring says.
- Cross-roadmap citations: none added or changed; no id cited here is dropped by an open pull request, and no open pull request changes this roadmap.
- Dependency check: `depcheck: 200 roadmaps, 2184 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: exit 0, 36 `sorry` warnings and nothing else (37 theorems, one now proved); no `set_option`, one `import Mathlib`; `#check @name` run on a copy for the four declarations the change touches, every hypothesis a binder of its own.
- Automatic checks: two hits, both of form (pull-request numbers in the README; a section header with no declaration), written as N01 and N02.
- Pull-request text against the head: seven layers, 37 theorems, `sorry` the only warning, suppliers and sources all still hold; no correction. Nothing changed outside the folder.
- The cited CKMA repository was opened: public, Apache-2.0, with numbered synopsis files per area.

Overlap check: read StochasticCalculus, DysonBrownianMotion, PDE; Brownian motion and Kolmogorov–Chentsov are owned by StochasticCalculus Layer 1 and cited; the dyadic Besov scale and paraproducts are owned by PDE Layer 7 and cited; nothing else shared.

Source independence: changed passages only; 1 passage compared with 1 source (the neo-classical inequality with HaraHino2010 lines 17–25, a formula, nothing shared); largest share Friz–Hairer, 63 of 125 locators, not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layers 4–5 are the controlled rough path theory and Layer 6 the reconstruction theorem as given in Friz–Hairer (2020); Layer 3 is the extension theorem of Lyons–Caruana–Lévy (2007); Layer 7's Gaussian lifts are those of Friz–Victoir (2010). Rests on the README's references and its closing section on singular SPDE.

## Not verifiable

- Lyons–Caruana–Lévy 2007, Theorem 3.7, pp. 45–46: the exponent `(⌊p⌋ + 1)/p` of the extension constant agrees with the proof route and with my recollection of the theorem, but the book could not be read.
- Lyons–Caruana–Lévy 2007, Lemma 3.8, p. 46, and Proposition 1.7, p. 5 (the equivalent norm): locators not read; the inequality itself with `p²` is confirmed as Lyons' in HaraHino2010 lines 17–25.
- Friz–Hairer 2020, Friz–Victoir 2010, Lyons–Caruana–Lévy 2007: no legal copy found, as in the previous review; every locator of the sampled sections stays unchecked.
- The stability estimates of §4.3 and §5.2: not recomputed, their source unread (unchanged).

## Source issues

- none

## For the human reviewers

- Not tested: Friz–Hairer 2020 (63 of 125 locators), Friz–Victoir 2010 and Lyons–Caruana–Lévy 2007 could not be read; wording, arrangement and every locator are unchecked against them.
- Licence: the README (*Prior formalization*) says §2.1–§2.2 start from the CKMA formalisation, now cited as a public repository of the pull request's author under Apache 2.0.
- Licence: `rEVariationOn` and `ControlOn` in `Suggested.lean` are said to follow the definitions of two open Mathlib pull requests (#38055, #38053; both open, the second a draft).
- Scope: the identifications rough integral = Itô or Stratonovich integral and RDE = SDE solution are listed under *Beyond this roadmap* with no owning roadmap named, although StochasticCalculus is on main.
