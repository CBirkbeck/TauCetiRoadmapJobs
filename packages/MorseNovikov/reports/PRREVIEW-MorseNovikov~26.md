# Review of MorseNovikov (pull request #1854 at 9288dee)

**Verdict:** accepted

**Summary.** Accepted: the folder has not changed since the previous review of this same head (0 lines), and this round read the pull request's title and description against the head and against the folder's change from `main`. Every statement they make about MorseNovikov agrees with the head, and no change of the folder is left unstated. No finding and no small correction; one format note is carried over, not blocking, and one licence question is left for a human as before.

## N01 — The *In Tau Ceti:* line of Worked examples is detached from the example it realises

In Worked examples (line 1733) the line naming the irrational-period declarations still follows the sentences about `Suggested.lean` and "all other constructions and API targets", so it reads as if it realised those. It would sit better directly after the sentence on the irrational noninjective example that ends "as in Layer 1's Examples".

## Previous findings

- N01 — not repaired: line 1733 is unchanged ("*In Tau Ceti:* for the irrational noninjective example, …" after the `Suggested.lean` sentences); written again above as N01.

The previous report had no finding (R-numbered) and no small correction; its one format note is accounted for above.

## Verified sound

| Statement | Instances | Values computed (left; right) | Result |
|---|---|---|---|
| Self-slide Check of §6.2 (line 1266), cited by the description as "(−2,1)" with "positive Novikov period" | H=ℤ⊕ℤ/2, N(n,e)=−n, h=(−2,1); μ=n mod 3, ν=−n mod 4 | N(h)=2>0; μ(h)=−2≡1; ν(h)=2; ν(nh)=2n mod 4, zero exactly for even n; N(2,1)=−2<0 | holds; description agrees |
| Period-doubling identity of Worked examples (line 1715), Klein-bottle ζ | x=t; coefficients to order 3 | (1+x)/(1−x²)=1+x+x²+x³+⋯; 1/(1−x)=1+x+x²+x³+⋯; (1+t)/(1−t)=1+2t+2t²+⋯ | holds |
| Lefschetz Check of §6.5 (line 1500), under `lefschetz_fixed_point_formula` | a point; the empty manifold | point: index sum 1, trace on H₀(pt;ℚ) is 1; empty: 0 and 0 | holds |
| Description: "18 *In Tau Ceti:* lines name the 129 declarations" | counted in the README at the head | 18 lines carrying names (Layer 1: 6; §§2.1, 2.2, 3.3, 4.1–4.5, 5.2, 5.3, 6.4; Worked examples); 129 distinct backticked names | agrees |

The rows for the untouched statements stand as in the previous review, of `9288dee`.

- Source locators checked against the text: 1 (Gra72 line 545: Theorem (10.1), on PDF page 17 = printed p. 224, the page after the one headed 223 at Gra72 line 510). No seeded target falls in a changed passage, since none changed.
- Library declarations opened at the pin (9): `TauCeti.HurewiczOne.hurewiczHomologyAddEquiv` (AlgebraicTopology/Homotopy/Hurewicz/One/Basic.lean:705), `homologyMap_hurewiczHomologyAddEquiv` (…/One/Naturality.lean:100), `TauCeti.NovikovSeries.continuousDomCongr` (RingTheory/NovikovSeries/Equiv.lean:139), `hahnSeriesEquiv` (RingTheory/NovikovSeries/HahnSeries.lean:376), `TauCeti.flowOf` (Geometry/Manifold/Flow/Basic.lean:62), `TauCeti.globalFlow` (Geometry/Manifold/IntegralCurve/GlobalFlow.lean:60), `AddCircle.timeForm` (Geometry/Manifold/DifferentialForm/AddCircle.lean:92), `TauCeti.SmoothMappingTorus.timeForm` (…/DifferentialForm/MappingTorus.lean:104), `toLaurentSeriesUniformEquiv` (named at README line 289).
- Cross-roadmap citations resolved: DGFloer on `main` cites MorseNovikov N1 and N4 (its README lines 2731–2831), as the description says; the citation resolver reports none missing; the overlap report lists no dropped or revision-only id and no other open pull request changing this roadmap.
- Dependency check: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: every check passed. Elaboration: `lake env lean` on `Suggested.lean` exits with only `declaration uses sorry` at 109:8 and 156:8; the file is unchanged, so the `#check @` comparison and the one-tactic probes of the earlier reviews stand.
- The pull request's text against this head: title (two loops cut; MorseNovikov–DGFloer is one) agrees. Summary block: Laurent topological comparison over a field (§1.4, line 289 region), square-minor formula (§4.1, lines 730–732), self-slide class (−2,1) (§6.2 and Worked examples), integral-one angular form `AddCircle.timeForm` (Conventions, line 104), "N1–N7" (line 65) — each in the diff against `main`. Body: Layers 1–7 and every section number kept; the one heading changed is "From TauCetiRoadmap.AlgebraicTopology"; DGFloer appears only under Downstream consumers; UniversalCovers is named nowhere; MorseTheory contract reads "M1–M2 and M6"; GeometricTopology contract reads Layers 4–5 (§4.4) and 11, with the knot exterior, fillings and longitude from Tau Ceti; flows and the angular form from Tau Ceti in the DifferentialGeometry contract; §6.5 and the Lefschetz docstring cite Granas Theorem 10.1, p. 224; §6.4 cites Hopf, Math. Z. 29 (1929); §6.1 cites rt3 Lemma 2.11(a); Downstream consumers precedes Worked examples and main's build-order paragraph is now in How to read the build; `Suggested.lean` changes docstrings only (15 insertions, 8 deletions), 0 declarations removed, added or restated. Nothing contradicted, nothing unstated.
- The description is cut in the quotation inside the BanachSpaceTheory list of statements whose content differs from main; what follows the cut is outside this check.
- No file outside the pull request's own folders changes (the diff outside them is empty).

Overlap check: read MorseTheory, DGFloer and HeegaardFloer on main, and the open heads of HeegaardFloer, GeometricTopology and AlgebraicTopology, as in the previous review; no passage changed; nothing shared.

Source independence: 0 passages compared (changed passages only: none changed), none shared; largest share rt3, as in the previous review (62 of 99 source mentions); the diff adds, removes or reorders no layer, so the arrangement was not compared.

Research link: The headline equality of Novikov torsion times the zeta function with Reidemeister torsion is Hutchings 2002 (Theorems A and B), extending Hutchings–Lee 1999; TaubesGromov on main consumes Layers 1 and 4–6 for its orbit expansions. Rests on rt3, rt2 and the README's Downstream consumers.

## Not verifiable

- Milnor, *Topology from the Differentiable Viewpoint*, §6, p. 35 (§§7.1 and 7.3 and the `zeroSign` docstring): not in the manifest and no legal copy; the passages are unchanged.
- Hopf 1929 (`Hop29`): settled as uncertified; cited by its locator.
- Milnor, Whitehead torsion, §3, pp. 365–368 (§4.1): not in the cache; unchanged.
- The part of the pull request's description after the cut of the quotation: not read.

## Source issues

- none

## For the human reviewers

- Licence: Scope and ownership names an outside formalisation, Dongryul Kim's lean4-novikov (revision d5e705bd), and asks for coordination before code integration; `Suggested.lean` takes nothing from it. The passage is on `main` with one sentence reworded.
