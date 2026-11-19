# Review of HeegaardFloer (pull request #2477 at c2fa65e)

**Verdict:** accepted

**Summary.** Accepted: this head repairs both blocking findings of the previous review (the all-pairs theorem and its corollary now assume finitely many critical points, with a band form otherwise; the single-pair theorem now confines the supports to the open slab), and the repairs introduce no new defect. Five small corrections and three format notes remain, none blocking; three of the corrections and two of the notes are earlier minor points left as they were. One question for the author on the single-pair step, and two licence points for the human reviewers, are carried over.

## C01 — The description no longer describes the all-pairs target or the charts consumed

A reader of the description expects an unconditional all-pairs theorem. It lists "the all-pairs theorem, for almost every small parameter", while the head (§1.0c, lines 341–350) proves it for finitely many critical points and proves a band form otherwise. It also lists "the native local stable and unstable charts", while the head consumes the global charts of `Morse/GlobalChart.lean` (line 315). Text that would be right: "the all-pairs theorem for finitely many critical points, and its band form on each sublevel otherwise; the C^∞ corollary for finitely many critical points", and "the native global stable and unstable charts". The description could also say that a References entry (Audin–Damian, French edition) is added.

## C02 — The negative-control Check asserts compact sublevels for a k that is not required to be positive

In the Check on finiteness (§1.0c, lines 367–373), k is only required to equal `|y|²/2` near the boundary of `B(e₁,1/10)`, to be even in the second coordinate and to carry a saddle–saddle trajectory. If k takes a value ≤ 0 inside the ball, then `4²ⁱk(x/4ⁱ) ≤ 0` in every ball and `{f≤0}` is unbounded; and the standing hypotheses need k Morse. Write "for a positive Morse function k equal to …". Such a k exists: the boundary field has degree 0, so two saddles on the axis are balanced by two extrema off it (−1−1+1+1 = 0).

## C03 — `sphereAut_existsUnique_map_triple` is a pinned theorem (carried, unchanged)

`Suggested.lean`, line 151, and §4.6a (README line 2845) still state as a target the case K=ℂ of `OnePoint.existsUnique_psl_smul_zero_one_infty_eq` (`TauCeti/Topology/Compactification/OnePoint/MultipleTransitivity.lean:175`), so it asks an implementer for nothing. Mark it as a sanity check of the carrier, or cite the pinned theorem in §4.6a and under "From Tau Ceti" in its place.

## C04 — Three sentences point at a roadmap HamiltonianSystems that does not exist (carried, unchanged)

Lines 56, 2540 and 4941 name "HamiltonianSystems" (twice "HamiltonianSystems Layer 1") as a consumer; no roadmap of that name is on main or in an open pull request, so the pointer leads nowhere. The three lines are untouched by this pull request. Remove the name at line 56 and the two sentences, or name the roadmap that now holds that layer.

## C05 — §4.1 plans Darboux without citing the flat Darboux theorem at the pin (carried, unchanged)

Line 2578 ("Prove **Darboux** on finite-dimensional boundaryless manifolds using this local Moser lemma") does not mention `TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` (`TauCeti/Geometry/Symplectic/Darboux/Basic.lean:116`), which gives the theorem on an open subset of a finite-dimensional normed space; only the chart transfer remains. Cite it there and under "From Tau Ceti".

## N01 — §3.3 still states the index theorem `ind(∂s−A(s)) = −SF(A)` with no locator (line 2251); Robbin–Salamon, Bull. LMS 27 (1995), with its theorem number, would do.

## N02 — The Layer 4 header still reads "McDuff–Salamon … as spine" (line 2517); the arrangement is the roadmap's own, so a sentence naming what the layer builds, with sources at each target, would say so.

## N03 — §1.0c says the source perturbs in the slab above each critical value and then applies its own step "in a slab just below each of them" (line 347); one clause saying that this is the mirror induction (bottom-up, changing W^u(p) rather than W^s) would spare the reader the comparison.

## Questions for the author

- In the single-pair theorem (lines 325–340), is the set `K₀ = {x∈C : φ_T(x)∈W^s(q)}` meant to be compact? The spanning hypothesis is assumed at s=0 only, and a uniform ε is claimed; when p→q′→q breaks, W^s(q) is not closed and K₀ need not be. Likewise "lies below c₁ after time T" is assumed for connecting trajectories only, while the universal space uses every x∈C. I could not decide whether the statement fails or only its sketch needs the extra step (I have no counterexample); assuming `φ_T(C)⊂{f<c₁}` and K₀ compact, or spanning for all small s, would settle it.

## Previous findings

- R01 — repaired: "If r≥dim E+2 and f has finitely many critical points, there is an admissible C^r family h …"; band form and negative-control Check added; Corollary restricted likewise.
- R02 — repaired: "h a family of C^r admissible functions, each with support in f⁻¹((c₁,c₂)) … span E at every point of φ_T(C)∩W^s(q)"; the two pinned lemmas are cited.
- R03 — not repaired: `sphereAut_existsUnique_map_triple` still stated at `Suggested.lean:151`. Now C03.
- R04 — not repaired: "HamiltonianSystems" at lines 56, 2540, 4941. Now C04.
- R05 — not repaired: "Prove **Darboux** on finite-dimensional boundaryless manifolds using this local Moser lemma". Now C05.
- R06 — repaired: "Audin–Damian, *Théorie de Morse et homologie de Floer*, Théorème 2.2.5, pp. 37–38, and Lemme 2.2.8, p. 38", with a References entry and the vector-field/function clause.
- R07 — repaired: "`Analysis/Calculus/Morse/{CompactSublevel,GlobalChart}.lean` (with `morseIndex`) and `Analysis/Calculus/Sard/`; F0.S's sharp finite-dimensional Sard"; MorseTheory M1 is gone.
- R08 — repaired: "finite families `h : ι → E → ℝ` with `TauCeti.IsAdmissiblePerturbation f (h i)` for each i … jointly C^(r−1) for C^r data".
- R09 — not repaired: "The operator `∂s−A(s)` … is Fredholm with index `−SF(A)`", no locator. Now N01.
- R10 — not repaired: "McDuff–Salamon (…) as spine, with boundary versions from Oh". Now N02.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| M.0c single pair, supports (changed) | x∈C; y with f(y)<c₁ | Backward orbit of x has f≥c₂, forward orbit of y has f<c₁; both miss tsupport ⊂ {c₁<f<c₂}, so the pinned lemmas' hypotheses hold | repaired; question on K₀ |
| M.0c single pair, regularity and fibre | d = ind p−ind q = 2, 0, −1 | r ≥ 4, 2, 2; flow C^(r−1) = C³, C¹, C¹ against Sard's need > max(d−1,0) = 1, 0, 0; fibre N+(ind p−1)−ind q−N = d−1 | sufficient |
| M.0c all pairs, finite (changed) | dim E = 2, saddle to minimum; any pair | ind p−ind q ≤ dim E, so r ≥ dim E+2 ≥ max(d,0)+2; finitely many slabs, compactly supported family | sound |
| M.0c band form (new) | the witness with c fixed | {f≤c} compact, so finitely many critical points and balls in it; the finite argument applies to pairs in the band | sound |
| M.0c Corollary (changed) | witness; finite case | witness excluded by finiteness; finite case from all pairs with r=∞ | sound |
| M.0c finiteness Check (new) | balls i, i+1; scaling; index count | [0.9·4ⁱ,1.1·4ⁱ] against 3.6·4ⁱ: disjoint; 4²ⁱ·\|x/4ⁱ\|²/2 = \|x\|²/2; Hessian = Hess k(x/4ⁱ); span 1 ≠ 2 on the connection | true for positive Morse k: C02 |
| M.0c consumed declarations (changed) | n = r−2 | `contDiff_perturbedFlow_of_contDiff`: C^(n+2) data gives C^(n+1) = C^(r−1); `IsAdmissiblePerturbation` is C², compact support, tsupport off the critical set | README = pin |
| M.0c source route (new) | Théorème 2.2.5, Lemme 2.2.8 | Source: pseudo-gradient changed only in f⁻¹([α_j+ε,α_j+2ε]), W^s(c_j) made transverse to every W^u; compact manifold, distinct critical values | supports the route as described |

The rows of the previous review for untouched statements stand as in the previous review, of `b4167f5`.

- Source locators checked against the text: 3 (Audin–Damian Theorem 2.2.5 and Lemma 2.2.8 in the April 23, 2013 author draft, lines 1432–1488; Proposition 2.1.5 at its printed p. 28). The seeded sample falls in the changed passages only at §1.0c.
- Library declarations opened at the pin (Tau Ceti 2fd255d9): 8 (`MorseSmale/Perturbation.lean:84, 93, 288, 305, 474`; `GlobalChart.lean:184, 217`; `Morse/Index.lean:162`).
- Cross-roadmap citations: the change adds none and removes one (MorseTheory M1 from the `*Needs:*` line); the resolver lists none unresolved.
- Automatic checks: all pass except the dropped-name rule (3 hits, C04); nothing changed outside the folder.
- Dependency check: `depcheck: 200 roadmaps, 2187 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: seven `declaration uses sorry` warnings (lines 71, 84, 116, 127, 151, 168, 191), nothing else; the file is unchanged since `b4167f5`, so signatures and the one-tactic probe stand (1 of 7 closes: C03).
- Pull request text: title agrees with the head; the description is out of date in two places (C01); "consumes only existing Tau Ceti modules and F0.S" is now true.
- Overlap check: read DGFloer, AnalyticStableMaps, PseudoholomorphicCurveAnalysis, MorseNovikov, FukayaTheory (scopes as in the previous review; a search of all open heads and main for function-perturbation Morse–Smale genericity and `IsAdmissiblePerturbation` finds this roadmap only); nothing shared.

Source independence: changed passages only; 3 passages compared with 1 source (Audin–Damian, English author draft), none shared (longest common run under 6 words, the slab formula being forced); largest share and contents comparison unchanged from the previous review (Ozsváth–Szabó, about 20 of 110 citations; contents compared with os-disks-invariants: independent), the diff adding no layer.

Research link: Layers 6–8 state results of Ozsváth–Szabó (2001–2004), Lipshitz (2006), Lipshitz–Ozsváth–Thurston (2008) and Manolescu–Ozsváth–Sarkar (2006); M.0c supplies the Morse–Smale hypothesis of the trajectory-space theory in the sense of Smale (1961). Rests on the README's References and the sources read.

## Not verifiable

- Audin–Damian, French edition (EDP Sciences, 2010), pp. 37–38: no legal copy found; the theorem and lemma numbers and their content were read in the authors' English draft, where they are on printed pp. 41–42, so the French page numbers are unchecked.
- Smale, Ann. of Math. 74 (1961): not read.
- The items of the previous review (Smale 1965, McDuff–Salamon, Lee, Floer–Hofer–Salamon, Oh, Robbin–Salamon) stand; the change does not touch them.

Automatic checks set aside as false positives: none (the three dropped-name hits are real and are C04).

## Source issues

- none

## For the human reviewers

- Licence: `README.md` §4.1 cites the repository `t4v1/damian_formalizare`, file `MorseFloer/Part2/Darboux.lean`, "as existing work"; its licence was not read, and the Darboux declarations of `Suggested.lean` were not compared with that file.
- Licence: Hutchings' lecture notes (cited in §§1.1–1.9, 3.3) are unpublished notes read from the author's Berkeley page.
