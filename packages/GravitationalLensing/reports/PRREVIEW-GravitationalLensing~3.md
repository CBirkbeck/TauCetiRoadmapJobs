# Review of GravitationalLensing (pull request #2953 at 3ee6020)

**Verdict:** accepted

**Summary.** Accepted: the one finding of the previous review (the sentence of D.3 on minima, maxima and saddles) is repaired, and the repair, with its new Check on the Einstein ring, was recomputed and holds; the three earlier small corrections are repaired as well. This was an incremental re-review of the 38 changed lines of the README; `Suggested.lean` is unchanged and elaborates with `sorry` as its only warning. There is one small correction and no format note, none blocking; the questions left to a human are the same as before (scope, and 4.1 being stated more generally than any cited source).

## C01 — Of the three ConformalMapping theorems listed in the scope section as using the index of continuous loops, one is stated with the integral winding number

In "Neighbouring roadmaps" (README lines 641–643) the text says "the theorems declared there that use the index (`continuous_jordan_index`, `continuous_boundary_argument_principle`, `jordan_index_of_isPiecewiseC1On`)". In `Completed/ConformalMapping/Suggested.lean` the first two are stated with `continuousIndex` (lines 609–631), but `jordan_index_of_isPiecewiseC1On` (lines 640–648) is stated with `TauCeti.Contour.windingNumber` for a piecewise `C¹` curve, the same winding number Layer 3 uses; only its planned route passes through the index. A reader could take it for a statement about continuous loops. The conclusion of the sentence (all three are about Jordan curves, none is a target of Layer 3) is unaffected. Would read: "the theorems declared there that use the index (`continuous_jordan_index`, `continuous_boundary_argument_principle`) or are derived from it (`jordan_index_of_isPiecewiseC1On`, stated with the integral winding number) are about Jordan curves and holomorphic maps".

## Previous findings

- R01 — repaired: D.3 now reads "the images with nonzero Jacobian are its nondegenerate critical points: there a local minimum or maximum of the time delay has positive Jacobian and a saddle negative Jacobian"; the ring Check gives the degenerate minimum.
- C01 — repaired: 2.4 now cites "equation (46) for `|w| < b` and the sentence after equation (47) for `|w| > b`; the ring of a centred source is §2.1.4, equation (20), p. 9; the case `|w| = b` is computed here"; read at the text.
- C02 — repaired: the scope section names ConformalMapping §5.4 and §5.5 and says Layer 3 "does not depend on that index"; both sections resolved on main; one imprecision in the list of theorems (C01 of this report).
- C03 — repaired: the sentence naming PlanarTopology is gone; "Not treated here" has a bullet on polygonal loops and ray crossings that names no roadmap.

The question of the previous report on 3.2 is answered in the text: the statement keeps one open set `U` because 4.1 applies it to a lens map, and the added sentence says what the route uses.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| D.3 sentence on nondegenerate critical points | unit mass at 0, w=3/2, z=2 and z=−1/2; ψ₀=‖z‖², no mass | Hessians diag(5/4, 3/4), det 15/16, minimum; diag(5, −3), det −15, saddle; −I, det 1, maximum | holds |
| D.3 Check on the ring (added text) | M=4, a=0, source a | r−M/r: −3 at r=1, 0 at r=2, 5/3 at r=3; Jacobian 1−16/r⁴=0 at r=2 | holds; degenerate minimum |
| 2.4 SIS images (locator changed) | b=1; w=1/2, 1, 2, 0 | 3/2−1=1/2, −1/2+1=1/2; candidate 0 excluded, 2−1=1; 3−1=2, candidate 1↦0≠2; z−z=0 on ‖z‖=1 | holds |
| 3.2 with one open set `U` (added sentence) | f=z−1/conj z−3/2, U=ℂ∖{0}, S={0, 2, −1/2}, ε=1/5, R=10; f=conj z, S={0} | discs disjoint (gaps 1/2, 2, 5/2 > 2/5); 1 = 1 (pole) + 1 − 1; −1 = −1 | holds |
| 4.1 against the 3.2 instance | one unit mass, w=3/2 | N₋=1, N₊=1, n=1: 1=1+1−1 | agrees |

The rows of the previous review, of `22655aa`, stand for every statement the change does not touch.

- Source locators checked against the text: 3 of 3 changed (NarayanBartelmann1997 line 816, equation (46), printed page 18; line 822, the sentence after equation (47); lines 357–373, §2.1.4 with equation (20), printed page 9).
- Declarations of another roadmap opened: `continuousIndex`, `continuous_jordan_index`, `continuous_boundary_argument_principle`, `jordan_index_of_isPiecewiseC1On` in `Completed/ConformalMapping/Suggested.lean` (lines 599, 609, 622, 640), and §§5.4–5.7 of its README (lines 822–960); the pinned Tau Ceti has no `continuousIndex`.
- Cross-roadmap citations resolved: ConformalMapping §5.4 and §5.5 on main (as described; the open revision of ConformalMapping drops neither id); DifferentialGeometry and MorseNovikov unchanged.
- Dependency check: `depcheck: 169 roadmaps, 1975 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap declares no roadmap supplier.
- Elaboration: `Suggested.lean` is unchanged since `22655aa`; it elaborates with twelve `sorry` warnings and nothing else; no `set_option`, imports `Mathlib` and one Tau Ceti module. The padding probe of the previous review stands.
- Automatic checks: all passed at this head. No file outside the folder is changed.
- Pull request text read against the head: the description names ConformalMapping §§5.4–5.5 as a neighbour, the polygonal-loop exclusion and equations (20), (46), (47); nothing in it is contradicted by the head.

Overlap check: read ConformalMapping (main and its open revision), ContourIntegration, GlobalHolomorphicFunctions; nothing shared (ConformalMapping owns the index of continuous loops and the Jordan-curve and holomorphic statements built on it, this roadmap the argument principle for `C¹` planar maps on a disc with holes).

Source independence: changed passages only; 3 passages compared with 1 source (NarayanBartelmann1997), none shared; largest share PettersWerner2009, 13 of 25 locators; no layer added, removed or reordered, so the comparison of contents stands as in the previous review: independent.

Research link: Layer 4 states the image-counting results surveyed in Petters–Werner 2009 (Petters 1991, Burke 1981, Witt 1990) and the index count of Luce–Sète–Liesen 2014; Layer 3 is the argument principle used by Sète–Luce–Liesen 2014 and Khavinson–Neumann 2004 for rational harmonic functions. Rests on the README's references and the five texts read.

## Not verifiable

- The primary sources behind the attributions (Burke, Witt, Schneider and Weiss, Petters 1991): not opened; the README cites them only through Petters–Werner.
- Petters–Werner §1.2, p. 3, the locator of the signed magnification in the rewritten sentence of D.3: unchanged since the previous review, which read it; not read again.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is the mathematical theory of thin-lens gravitational lensing; main sources are a review article and lecture notes on arXiv (PettersWerner2009, NarayanBartelmann1997). Layer 2 consists of closed-form computations cited to the lecture notes. The metadata topic is `math.CV`.
- **Scope.** Statement 4.1 is more general than any cited source (no genericity, masses of either sign); it rests on the README's own route, which the previous review checked step by step, not on a refereed proof.
- **Licence.** All five texts were read from arXiv; none of the primary papers the README attributes results to was opened.
