# Review of CstConjectureForDaggerVarieties (pull request #1759 at cb613f0)

**Verdict:** needs changes

Incremental re-review of the 126 lines changed since 3ed5d07 (19 `###` headings turned into bold run-in targets under 9 group headings, 9 new group introductions, one supplier sentence, six docstring bullets), and the first check of the pull request's title and description against the head. Two P3 findings; no P1 or P2.

## R01 (P3) — The description says the Lean file states definitions and theorems; it declares nothing

**Location:** pull request description, prose after the summary block: “the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti; every target is in the README” and “the targeted Lake build succeeds with `sorry` as the only warning”.

**Claim:** At this head `Suggested.lean` has no declaration: its docstring lists 34 headline theorems, each as not statable at the pins. A reader of the description expects stated theorems and a `sorry` warning; there are neither.

**Witness:** `TauCetiRoadmap/CstConjectureForDaggerVarieties/Suggested.lean:56–58` is `namespace … end` with nothing between; `lake env lean` on it exits 0 with no output; the worker's change summary reports “Lean declarations: 0 removed, 0 added”.

**Repair:** Replace the two sentences by: “`Suggested.lean` declares nothing: no headline theorem is statable at the pinned Mathlib and Tau Ceti, and its docstring names the 34 headline theorems with the carrier each lacks; every target is in the README.” and “the targeted Lake build succeeds with no warning (the file has no declaration)”.

## R02 (P3) — Six docstring bullets now carry a group heading instead of the theorem they describe

**Location:** `TauCetiRoadmap/CstConjectureForDaggerVarieties/Suggested.lean:25, 28, 33, 39, 43, 46`, e.g. line 39: “Künneth and R¹lim vanishing for proper times Stein (README §4.4): lacks rigid analytic integral étale cohomology and proper analytic base change.”

**Claim:** The regrouping renamed these six bullets to the README's new group headings, which cover two to four theorems, while each bullet's “lacks” clause is still that of the first theorem only. The theorem named and the carriers listed no longer correspond, and the same theorem is named twice with different carriers.

**Witness:** Line 39 names “R¹lim vanishing for proper times Stein” lacking étale cohomology and base change; line 40 names the same theorem (§4.5) lacking pro-étale cohomology and exhaustion descent. Likewise 25/26 (equivalence of criteria) and 43/45 (arithmetic recovery).

**Repair:** Name the statement at the cited number, as the bullets of the sibling targets do: line 25 “The height formula and its sign (README §2.5)”; 28 “Splitting the crystalline eigenspace complex (README §2.8)”; 33 “Almost proper varieties have nonnegative slopes (README §3.4)”; 39 “Étale Künneth with a proper factor (README §4.4)”; 43 “Vanishing on the differential error term (README §5.1)”; 46 “Geometric pro-étale-to-period-module recovery (README §5.4)”. The “lacks” clauses stay. With these names lines 39/40, 25/26 and 43/45 each name two different theorems again.

## Previous findings

- R01 — not repaired: `packages/CstConjectureForDaggerVarieties/design/plan.json` still lists `galois-period-hom-vanishing` (PadicHodgeTheory) and gives VectorBundlesAndIsocrystals VB3 as supplier of `qbc-pairs` and `natural-period-hom`. Not carried as a finding of this pull request: the file is outside it, the two slugs count as declared, and it is reported to the human reviewers below.
- R02 — repaired: `README.md:82` now reads “§2.7, Primitive comparison and integral finiteness, supplies its Analytic log resolution target: for a reduced proper rigid X/C and a dense smooth Zariski open U …”; `properRigidLogResolution` occurs nowhere in the folder.

## Verified sound

| Statement (cited by a changed passage) | Instances and values computed on each side | Result / change |
|---|---|---|
| §2.4 failure sequence (cited by the §2.1 introduction; consumed by §4.2) | Point, r=i=0: h¹₋₁=0, H=Q_p, X=Q_p, F=B=B_dR⁺; (f,x)↦x−f is onto B_dR⁺ with kernel the diagonal Q_p; h¹₀=H¹(O)=0. Sequence 0→0→Q_p→B_dR⁺⊕Q_p→B_dR⁺→0→0 exact. | Holds; no change. |
| §2.5 height formula (first target of the regrouped §2.5) | Point r=0: 1=1+0+0. Disc r=1: H¹¹=O(D)/C is a torsion Pair, ht 0 = dim H¹_HK(D)=0 +0+0. O(−1): Euler height 0−(−1)=1, so a nonzero h¹ has ht<0. | Holds; no change. |
| §2.7 equivalence (the §2.5 introduction says §§3.1, 3.4, 5.3, 5.4 use it) | Point: square bicartesian; bundle O acyclic; H⁰=Q_p curvature ≤0; ht 1 = dim_C H⁰_dR = 1: all four hold together. §3.1, §5.3, §5.4 `*Needs:*` list §2.7; §3.4 uses it in its route (README line 721). | Introduction agrees with the routes; no change. |
| §3.2 products (the §3.1 introduction says §4.7 uses it) | P¹×P¹, degree 2: E₀⊗E₂⊕E₁⊗E₁⊕E₂⊗E₀ = O⊕0⊕O (H²(P¹): t_H−t_N=1−1=0), rank 2 = rank H²(P¹×P¹); cokernel 0. §4.7 `*Needs:*` lists §3.2. | Holds; no change. |
| §4.5 vanishing (the §4.4 introduction says §4.7 uses it) | Constant tower Q_p: lim¹=0; tail tower ⊕_{k≥n}Q_p: lim¹=(∏Q_p)/(⊕Q_p)≠0, so the vanishing is a real hypothesis of §4.2. §4.7 `*Needs:*` lists §§4.2 and 4.5. | Holds; no change. |
| “No later layer uses it” (§2.8 introduction) | grep of the 20 `*Needs:*` lines of Layers 3–5 for §2.8, §2.9, §2.10: 0 hits; §5.5 needs §§0.6–0.8, not §2.8. | True; no change. |

The diff changes no statement; the rows of the untouched statements stand as in the previous review, of `3ed5d07`.

- Group introductions: 14 consumer claims in the 9 new introductions checked against the 45 `*Needs:*` lines; 13 match a `*Needs:*` line directly, 1 (§3.4 uses §2.7) matches §3.4's proof route. Remark on untouched text: §3.4's `*Needs:*` reaches §2.7 only through §3.1.
- Numbering: all 45 target numbers 0.1–5.6 survive (15 `###` headings in Layers 0–1 unchanged, 9 group headings each holding its first target, 19 bold run-ins, §4.7 and §5.6 unchanged); the only citations of this roadmap elsewhere are of §1.5 (ProetaleCohomologyOfPAdicCurvesAndTowers README lines 30, 120, 542), whose heading is unchanged.
- Source locators rechecked in the regrouped sample sections (2.1, 2.5, 3.1, 5.1, 5.4 and their run-ins), 10 against the cached text: CN25 lines 2335 (Lemma 7.7, p.47), 2350, 2354 (Corollary 7.9, p.47), 2367 (Proposition 7.10, p.48), 2462 (§8.1, p.50), 2466, 2489, 2501 (Theorem 8.1, pp.50–51), 2735 (Theorem 9.3, p.55), 2772 (Lemma 9.6, p.56), 2821 (Theorem 9.8, p.57): all support the statements. The other seeded targets lie outside the diff.
- Library declarations opened at the pin for the description's summary: `BDeRhamPlus` (`Mathlib/RingTheory/Perfectoid/BDeRham.lean:75`), `WittVector.Isocrystal` (`Mathlib/RingTheory/WittVector/Isocrystal.lean`), `CategoryTheory.BicartesianSq` (`Mathlib/CategoryTheory/Limits/Shapes/Pullback/IsPullback/BicartesianSq.lean:56`): present.
- Cross-roadmap citations resolved: the 12 VectorBundlesAndIsocrystalsPartII sections (§§0.8, 0.9, 2.3, 2.7, 2.8, 4.2, 4.3, 5.1, 5.2, 5.3, 6.6, 6.7) now at its open head d2f7530, same titles as at the design read in the previous review (README lines 250–1198); it names this roadmap only as a consumer (line 1222). AdicSpacesPartII–IV are on main. The resolver lists nothing missing.
- Description otherwise checked against the head: title, summary block, supplier list (the 7 open suppliers of the dependency block are the README's suppliers not on main), validation counts, and the review-round counts against the board reports (3 package reviews, 2 red-team rounds): consistent apart from R01.
- Gate rerun at cb613f0: `set_option=0 … statement-hygiene=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Outside-folder diff: empty.
- Elaboration: `lake env lean` on `TauCetiRoadmap/CstConjectureForDaggerVarieties/Suggested.lean` exits 0 with no output; zero declarations, so the signature, padding and duplicate-name probes have no case. No headline became statable: the diff touches only bullet titles.

Overlap check: read VectorBundlesAndIsocrystalsPartII, ProetaleCohomologyOfPAdicCurvesAndTowers, VectorBundlesAndIsocrystals, PadicHodgeTheory, CohomologyComparisons, AdicSpacesPartIV; qBC, reasonable Pairs and period Hom are owned by VectorBundlesAndIsocrystalsPartII and cited here; the model-free Stein and affinoid diagram (§1.5) is owned here and cited by ProetaleCohomologyOfPAdicCurvesAndTowers; nothing has two owners.

Source independence: changed passages only; 10 passages (the 9 group introductions and the supplier sentence) compared with 1 source (CN25, at the openings of its §§7.2, 7.3, 8.1, 8.2, 9.1, 9.2), none shared; largest share CN25, as in the previous review; no layer added, removed or reordered, so the contents were not compared again (the 9 group headings do not map one to one onto CN25's subsections: Layer 2 splits §7.2 in two, Layers 3 and 4 each split one subsection in two or three).

## Not verifiable

- The supplier sections of VectorBundlesAndIsocrystalsPartII, PadicHodgeTheory, CohomologyComparisons and the other open suppliers are statements of open pull requests, and the 23 README gaps are contracts; none is a proved library theorem.

## Source issues

- none

## For the human reviewers

- The board plan (`packages/CstConjectureForDaggerVarieties/design/plan.json`) still lists `gap:galois-period-hom-vanishing`, which the README no longer states, and names VectorBundlesAndIsocrystals, not its Part II, as supplier of `gap:qbc-pairs` and `gap:natural-period-hom` (README lines 110, 112).
