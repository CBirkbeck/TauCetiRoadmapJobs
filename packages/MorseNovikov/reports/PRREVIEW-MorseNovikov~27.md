# Review of MorseNovikov (pull request #1854 at 9288dee)

**Verdict:** accepted

**Summary.** Accepted: the folder is unchanged since the previous review of this head (0 lines), and this round read the pull request's title and description against the head and against the folder's change from `main`. Every sentence they make about MorseNovikov agrees with the head, and no change of the folder a reader must know of is left unstated. No finding and no small correction; one format note is carried over, not blocking, and one licence question is left for a human as before.

## N01 — The *In Tau Ceti:* line of Worked examples is detached from the example it realises

In Worked examples (line 1733) the line naming the irrational-period declarations follows the sentences about `Suggested.lean` and the other constructions and API targets, so it reads as if it realised those. It would sit better directly after the sentence on the irrational noninjective example.

## Previous findings

- N01 — not repaired: line 1733 is unchanged ("*In Tau Ceti:* for the irrational noninjective example, …", after the `Suggested.lean` sentences); written again above as N01.

The previous report had no finding (R-numbered) and no small correction; its one format note is accounted for above.

## Verified sound

| Statement | Instances | Values computed (left; right) | Result |
|---|---|---|---|
| Self-slide Check of §6.2 (line 1266); the description's "(−2,1)" with "positive Novikov period" | H=ℤ⊕ℤ/2, N(n,e)=−n, h=(−2,1); μ=n mod 3; ν=−n mod 4 | N(h)=2>0; μ(h)=−2≡1 mod 3; ν(h)=2; ν(nh)=2n mod 4, zero iff n even; N(2,1)=−2<0 | holds; description agrees |
| Square-minor and basis-change formulas of §4.1 (lines 726–734); the description's "equally sized coordinate subspaces" | two-term complex R→R, d=a a unit, D₁=C₁, E₀=C₀; A₀=b, A₁=c | τ=a^(−1) (a 1×1 minor); τ(b⁻¹ac)=a⁻¹bc⁻¹; τ(d)·b^(+1)·c^(−1)=a⁻¹bc⁻¹ | holds; D₁ and E₀ have equal rank |
| Lefschetz formula of §6.5, `lefschetz_fixed_point_formula` | a point; the empty manifold | point: index sum 1, trace on H₀(pt;ℚ) 1; empty: 0 and 0 | holds |
| Description: "18 *In Tau Ceti:* lines name the 129 declarations" | counted in the README at the head | 18 lines that begin an item's realisation (3 further mentions are prose); 129 distinct backticked names in their paragraphs | agrees |
| Description: suppliers dropped and kept | roadmap names in the README at the merge base and at the head | DGFloer: 4 mentions → 1 (Downstream consumers, line 1699); UniversalCovers: 0 at head; no roadmap name added | agrees |

The rows for the untouched statements stand as in the previous review, of `9288dee`.

- Source locators checked against the text: 0 new (no passage changed; no seeded target falls in a changed passage); the locators the description repeats (Granas Theorem 10.1, p. 224; Hopf, Math. Z. 29 (1929); rt3 Lemma 2.11(a)) are at README lines 1493–1494, 1351 and 1162 as it says.
- Library declarations opened at the pin (7): `TauCeti.HurewiczOne.homologyMap_hurewiczHomologyAddEquiv` (AlgebraicTopology/Homotopy/Hurewicz/One/Naturality.lean:100), `TauCeti.NovikovSeries.continuousDomCongr` (RingTheory/NovikovSeries/Equiv.lean:139), `TauCeti.NovikovSeries.hahnSeriesEquiv` (RingTheory/NovikovSeries/HahnSeries.lean:376), `TauCeti.flowOf` (Geometry/Manifold/Flow/Basic.lean:62), `TauCeti.globalFlow` (Geometry/Manifold/IntegralCurve/GlobalFlow.lean:60), `AddCircle.timeForm` (Geometry/Manifold/DifferentialForm/AddCircle.lean:92), `TauCeti.SmoothMappingTorus.timeForm` (Geometry/Manifold/DifferentialForm/MappingTorus.lean:104).
- Cross-roadmap citations resolved: DGFloer on `main` cites MorseNovikov N1 (its README lines 1979–2641), so it is a consumer, as the description says; the overlap report lists no dropped or revision-only id and no other open pull request changing this roadmap.
- Dependency check: `depcheck: 129 roadmaps, 1437 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Automatic checks: every check passed. Elaboration: `lake env lean` on `Suggested.lean` gives only `declaration uses sorry` at 109:8 and 156:8; the file is unchanged, so the `#check @` comparison and the one-tactic probes of the earlier reviews stand.
- The pull request's text against this head. Title: two loops cut, MorseNovikov–DGFloer one of them: agrees. Summary block: Laurent topological comparison over a field (§1.4, added lines "over a field it is a uniform equivalence for the period and X-adic topologies"); square minors (§4.1); self-slide class (−2,1) (§6.2, Worked examples line 1717); integral-one angular form `AddCircle.timeForm` (Conventions, lines 104–105, replacing the division by 2π); Layers 1–7 kept. Body: the only heading changed is "From TauCetiRoadmap.AlgebraicTopology"; the Hurewicz declarations are in §2.2's *Needs:* (line 428) and the Tau Ceti contract (lines 1855–1859); Scope keeps "constructions of this roadmap" and adds the *In Tau Ceti:* sentence (lines 1783–1785); MorseTheory's contract reads "M1–M2 and M6" (line 2109); GeometricTopology Layers 4–5 and 11 (line 1469); flows and the angular form from Tau Ceti (line 2137); Downstream consumers precedes Worked examples; `Suggested.lean` changes its module docstring and the Lefschetz docstring only (Granas for Dold), 0 declarations removed, added or restated. Nothing contradicted, nothing unstated.
- The description is cut in the quotation inside the BanachSpaceTheory list of statements whose content differs from main; what follows the cut is outside this check.
- No file outside the pull request's own folders changes (that diff is empty).

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
