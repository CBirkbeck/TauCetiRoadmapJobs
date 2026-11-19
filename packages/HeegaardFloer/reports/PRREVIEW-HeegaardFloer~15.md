# Review of HeegaardFloer (pull request #2477 at 935a631)

**Verdict:** needs changes

**Summary.** Needs changes, for one reason that is not mathematical: this head commits a Finder metadata file, `TauCetiRoadmap/.DS_Store`, outside the roadmap folder. The mathematics of the 90 changed lines is sound: the single-pair theorem of M.0c, now stated with a submersion hypothesis along `{0}×C`, answers the open question of the previous review, and every carried correction is repaired. One small correction and two format notes remain, none blocking; two licence points for the human reviewers are carried over.

## R01 (P2) — The pull request adds `TauCetiRoadmap/.DS_Store`, a binary file outside the roadmap folder

A pull request for one roadmap may change only that roadmap's folder; this one would put a 90 kB macOS Finder metadata file at the top of `TauCetiRoadmap/`, which belongs to no roadmap and records a directory listing of the author's machine (its strings are folder names: BelyiMaps, Orbifolds, RicciFlow, Varifolds, …). `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/HeegaardFloer'` shows `TauCetiRoadmap/.DS_Store | Bin 0 -> 90116 bytes`; the file is absent on main and was added by the last commit, 935a631, whose message and the description do not mention it. Remove it from the branch (`git rm --cached TauCetiRoadmap/.DS_Store` and commit); nothing else in the pull request needs to change for this.

## C01 — The module docstring of `Suggested.lean` still lists a statement the file no longer contains

Line 15 says the native statements "cover sharp finite-dimensional Sard, Banach-manifold Sard–Smale, Darboux normal forms, sphere triple normalization, nonsqueezing and …". This head removes `sphereAut_existsUnique_map_triple` (rightly: it is the pinned `OnePoint.existsUnique_psl_smul_zero_one_infty_eq` at K=ℂ), so a reader looks for a sphere statement that is not there. Drop "sphere triple normalization" from the sentence.

## N01 — The README now carries a pull-request number in three places ("proposed in TauCetiRoadmap#480", lines 56, 2560, 4964). A roadmap is cited by name and section, also while it is still a pull request; "HamiltonianSystems Layer 1" alone resolves (that roadmap's Layer 1 has the contraction inverse and names F2.1 as its builder) and stays true after the merge.

## N02 — Two imports of `Suggested.lean` are no longer used after the removal: `TauCeti.Topology.Compactification.OnePoint.ProjectiveLine` and `TauCeti.Topology.Algebra.Matrix.ProjectiveSpecialLinearGroup` (lines 6–7). The file elaborates without them, with the same six `sorry` warnings.

## Previous findings

The previous review, of c2fa65e, had no finding; its small corrections, format notes and question are accounted for here.

- C01 (description out of date) — repaired: "the all-pairs theorem … when `f` has finitely many critical points, and a band form on each `{f ≤ c}` otherwise"; "the global stable and unstable charts (`GlobalChart.lean`)".
- C02 (k not positive) — repaired: "for a Morse function k>0 on B(e₁,1/10), equal to |y|²/2 near its boundary".
- C03 (`sphereAut_existsUnique_map_triple` is pinned) — repaired: the declaration is removed; §4.6a reads "Sharp triple transitivity is Tau Ceti's `OnePoint.existsUnique_psl_smul_zero_one_infty_eq` at K=ℂ"; cited under "From Tau Ceti". The docstring was not updated: C01 above.
- C04 (HamiltonianSystems leads nowhere) — repaired: a roadmap of that name is open and its Layer 1 holds the contraction inverse, so the pointer resolves; the added pull-request number is N01 above.
- C05 (flat Darboux not cited) — repaired: "Tau Ceti's `TauCeti.exists_diffeomorph_eventually_compContinuousLinearMap_fderiv_eq` … is Darboux on an open subset of a finite-dimensional normed space; transfer it through charts".
- N01 (no locator in §3.3) — repaired: "(Robbin–Salamon, *The spectral flow and the Maslov index*, Theorem 4.21, with `D_A=d/dt−A(t)`)"; the theorem number could not be read (below).
- N02 ("as spine") — repaired: "The arrangement is this roadmap's own; each target cites its source".
- N03 (mirror induction unstated) — repaired: "This mirrors the source's induction: it works in the slabs below the critical values and moves W^u(p)".
- Question on the single-pair step — settled: the hypothesis is now "f<c₁ on φ_T(C)" and spanning at every x∈C, and "No compactness of {x∈C : φ_T(x)∈W^s(q)} is needed"; see the first row of the table.

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| M.0c single pair (changed) | S = W^u(p)∩{f=c₂}, N parameters; d = ind p−ind q = 2, 0, −1 | Submersion open, C compact: holds on B_ε×U with values in {f<c₁}; W^s(q) has codimension ind q; dim Z = N+(ind p−1)−ind q, fibre d−1; flow C^(r−1), r−1 ≥ max(d,1) > max(d−1,0) | sound; no closedness of W^s(q) used |
| M.0c single pair, invariance under perturbation | x∈C; y with f(y)<c₁ | Backward f-orbit of x has f≥c₂, forward orbit of y has f<c₁; both miss supports in f⁻¹((c₁,c₂)); pinned lemmas at `Perturbation.lean:288, 305` have exactly these hypotheses | sound |
| M.0c single pair, hypothesis satisfiable | C the sphere just below f(p) | {c₁≤f≤c₂} compact without critical points, so \|∇f\| ≥ δ>0 and T = (c₂−c₁)/δ² + 1 gives f<c₁ on φ_T(C) | not vacuous |
| M.0c all pairs, induction order (changed sentence) | pairs (p_i,q) below p_j; slab below p_j | W^u(p_i) and W^u(p_i)∩W^s(q) lie in {f≤f(p_i)}, below the slab: unchanged; W^u(p_j) is the manifold moved | bottom-up order consistent with the new sentence |
| M.0c finiteness Check (changed) | ball i; m = min k > 0 | f ≥ 4²ⁱm on ball i, so {f≤c} meets finitely many balls; index sum −1−1+1+1 = 0 matches boundary degree 0 | true |
| §4.6a sharp triple transitivity (changed) | K=ℂ | Pinned statement: `[IsAlgClosed K]`, x,y,z pairwise distinct, `∃! g : PSL(2,K)` sending 0,1,∞ to x,y,z; ℂ is algebraically closed | citation exact |
| §4.1 Darboux (changed) | pinned theorem | `[FiniteDimensional ℝ V]`, W open, ω C^r (r≥1), closed on W, nondegenerate at x₀; ψ fixes x₀, ψ^*ω = ω(x₀) near x₀ | README description = pin; chart transfer remains a target |
| §3.3 index sign (changed locator) | A(s)=tanh s | u′=tanh·u gives cosh ∉ L², kernel 0; adjoint u′=−tanh·u gives sech, cokernel 1; index −1; SF from −1 to +1 is +1 | −SF(A) consistent with the README's Check |

The rows of the previous review for untouched statements stand as in the previous review, of `c2fa65e`.

- Source locators checked against the text: 0 this round (the seeded sample does not fall in the changed passages; the one new locator, Robbin–Salamon Theorem 4.21, could not be read).
- Library declarations opened at the pin: 4 (`Topology/Compactification/OnePoint/MultipleTransitivity.lean:175`; `Geometry/Symplectic/Darboux/Basic.lean:116` with its `variable` line 56; `Analysis/Calculus/Morse/MorseSmale/Perturbation.lean:288, 305`).
- Cross-roadmap citations resolved: 1 (HamiltonianSystems Layer 1, at its open head: the contraction inverse is there, lines 208–220, and it names F2.1 as builder; a consumer, not a supplier).
- Dependency check: `depcheck: 200 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: six `declaration uses sorry` warnings (lines 71, 84, 116, 127, 151, 174), nothing else. The six signatures are those of the previous review; none closes in one tactic (the one that did is removed).
- Automatic checks: three fail. The file outside the folder is real (R01); the pull-request numbers are real (N01); the name rule is set aside (below).
- Pull request text: title and description agree with the head, including the removed declaration and each carried fix; the only change they leave unstated is the stray file of R01.
- Overlap check: read DGFloer, AnalyticStableMaps, FukayaTheory, PseudoholomorphicCurveAnalysis (scopes as in the previous review; the change adds no object and hands two to Tau Ceti by citation); nothing shared.

Source independence: changed passages only; 2 added sentences on the Audin–Damian induction and the rewritten Layer 4 header read for wording, 0 compared against a source text this round (no source text for them is held; the sentences describe the opposite induction from the source's, in the roadmap's terms); largest share and contents comparison unchanged from the previous review (Ozsváth–Szabó, about 20 of 110 citations; contents compared with os-disks-invariants: independent), the diff adding no layer.

Research link: Layers 6–8 state results of Ozsváth–Szabó (2001–2004), Lipshitz (2006), Lipshitz–Ozsváth–Thurston (2008) and Manolescu–Ozsváth–Sarkar (2006); M.0c supplies the Morse–Smale hypothesis of the trajectory-space theory in the sense of Smale (1961). Rests on the README's References and the sources read.

## Not verifiable

- Robbin–Salamon, Bull. LMS 27 (1995), Theorem 4.21: the publisher's page and the author's page both refused the request, so the theorem number is unchecked; the sign `index = −SF(A)` was recomputed on A(s)=tanh s.
- Audin–Damian, Lemme 2.2.8: not reopened this round; the two added sentences agree with what the previous review read there (the source perturbs above a critical value and moves the stable manifold).
- The items of the previous review (Audin–Damian French page numbers, Smale 1961 and 1965, McDuff–Salamon, Lee, Floer–Hofer–Salamon, Oh) stand; the change does not touch them.

Automatic checks set aside as false positives: the three hits for a name on the project's list of dropped roadmap names (HamiltonianSystems, lines 56, 2559, 4964): the README names it only as a downstream consumer that supplies nothing, and a roadmap of that name is open with the layer described.

## Source issues

- none

## For the human reviewers

- Licence: `README.md` §4.1 cites the repository `t4v1/damian_formalizare`, file `MorseFloer/Part2/Darboux.lean`, "as existing work"; its licence was not read, and the Darboux declarations of `Suggested.lean` were not compared with that file.
- Licence: Hutchings' lecture notes (cited in §§1.1–1.9, 3.3) are unpublished notes read from the author's Berkeley page.
