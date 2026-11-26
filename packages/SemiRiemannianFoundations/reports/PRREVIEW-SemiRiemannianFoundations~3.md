# Review of SemiRiemannianFoundations (pull request #3176 at fd6bf88)

**Verdict:** accepted

**Summary.** Accepted: no finding. Both small corrections of the previous review are repaired: `Suggested.lean` now states the uniqueness half of the Levi-Civita theorem of §2.4, and that statement is true as written for a metric of any class (including `C⁰` and weak metrics) on any normed model; §2.4 and the Mathlib contract now cite Mathlib's `C¹` Riemannian Levi-Civita connection, with the names, file and hypotheses as they are at the pin. The pull request's title and description agree with this head. Three format notes of the previous review are carried over, none blocking; the three questions for the human reviewers stand.

## N01 — The four-argument curvature `R(X,Y,Y,X)` of §4.1 is still never defined

The Gauss equation (line 776) uses `R(X,Y,Y,X)`; the Conventions define only `R(X,Y)Z` and `K`. The Checks show `R(X,Y,Z,W) = g(R(X,Y)Z, W)` is meant; one clause in the Conventions would pin it.

## N02 — §3.4 still refers to itself

"with agreement with §3.4 for smooth" (line 726) stands inside §3.4; "with the smooth Gauss lemma above" is what is meant.

## N03 — Four definitions of `Suggested.lean` serve no stated theorem

`IsTimelike`, `IsNull`, `IsCausal` and `toSmoothMetric` appear in none of the three sorried statements. They have real bodies and are harmless; the author would keep them as the carriers LorentzianGeometry imports by name, or leave them to the README.

## Previous findings

The previous review had no finding (R); its small corrections and format notes are accounted for here.

- C01 — repaired: `leviCivitaConnection_unique` states "two covariant derivatives … torsion free and compatible with a symmetric nondegenerate metric `g` of any class, strong or weak, … agree on every vector field differentiable at the base point"; §2.4 names it.
- C02 — repaired: §2.4 says it "agrees on differentiable fields with Mathlib's `CovariantDerivative.leviCivitaConnection`, the Levi-Civita connection of a `C¹` Riemannian metric on a `C²` manifold"; the Mathlib contract lists the three declarations.
- N01 — not repaired: `R^Σ(X,Y,Y,X) = R(X,Y,Y,X) + ε(…)` at line 776, no definition in the Conventions. Written again as N01.
- N02 — not repaired: "with agreement with §3.4 for smooth" at line 726. Written again as N02.
- N03 — not repaired (the author's choice): the three vector characters and `toSmoothMetric` are still used by no theorem. Written again as N03.

## Verified sound

| Statement | Instances tried | Values computed (roadmap side / independent side) | Result | Change |
| --- | --- | --- | --- | --- |
| §2.4 `leviCivitaConnection_unique` | `k = 0` (junk `mfderiv`); weak metric; non-complete `E`; `E = 0`; corners | Cyclic sum of three compatibility identities minus torsion: `2g(∇_X Y,Z) = Xg(Y,Z)+Yg(Z,X)−Zg(X,Y)+g([X,Y],Z)−g(Y,[X,Z])−g(X,[Y,Z])`, same for both; pointwise algebra, no derivative of `g` needed | true | none |
| same, extension step | `v`, `w` arbitrary at `x` | chart-constant fields are differentiable at `x` and take every value (Tau Ceti `injective_apply_mdifferentiableAt_vectorField`, no completeness); `g x` injective gives equality | true | none |
| same, one-tactic probe | `simp`, `rfl`, `aesop`, `simp_all`, `linarith` with the four hypotheses at `Y` | all fail; Tau Ceti's `IsLeviCivitaConnection.uniqueness` is for its smooth carrier and Mathlib's torsion tensor | not padding | none |
| same, elaborated signature | `#check @…leviCivitaConnection_unique` | binders `E` normed (no `CompleteSpace`, no `FiniteDimensional`), `k` free, no strongness: equals README "any class, strong or weak, any normed space" | agrees | none |
| §2.4 agreement with Mathlib's connection | positive definite, finite-dimensional, `g` of class `C¹` | Mathlib: `IsManifold I 2`, `IsContMDiffRiemannianBundle I 1`, `FiniteDimensional`; torsion `0` equals bracket identity; uniqueness on differentiable fields on both sides | true | none |
| §2.4 Tau Ceti clause for smooth metrics | `isLeviCivitaConnection_ofRiemannianBundle_leviCivitaConnection` | hypothesis `IsContMDiffRiemannianBundle I ∞`; conclusion: Mathlib's connection is a Levi-Civita connection of `ofRiemannianBundle I M` | as cited | none |
| Pull request description | every sentence against the head | 11 declarations, three sorried theorems, four headlines named not statable, five suppliers (one completed, four on main), no change outside the folder | agrees | none |

Rows for the untouched statements stand as in the previous review, of `f9c2742`.

- Source locators checked against the text: 1 in 1 source, the locator of the changed section, Bruveris2018 lines 381–399 (§2.3, formula (1), pp. 8–9, with the remark on weak metrics); the other sampled sections are unchanged since `f9c2742`.
- Mathlib declarations opened at the pin: `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:153, 173, 202, 256, 360, 409` (and its header, which says the regularity is left to later work).
- Tau Ceti declarations opened at the pin: `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Nondegenerate/Basic.lean:91, 280, 313`; `TauCeti/Topology/Algebra/Module/BilinearForm.lean:149`.
- Cross-roadmap citations resolved: the changed passages add none; the five supplier roadmaps the description names are on main (HopfRinow under `Completed/`), and the supplier subsections of the README name the same sections as the description.
- Dependency check output: `depcheck: 95 roadmaps, 1063 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all passed. Nothing changes outside the roadmap folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 129, 147, 187) and nothing else. `#check @name` on the new theorem: the elaborated type matches §2.4; nothing changed.
- Overlap check: read LorentzianGeometry, CompressibleEulerEquations, CompressibleEulerEquationsPartII, ManifoldOptimization, HolderMapsBetweenManifolds, RiemannianGeometry, HopfRinow, RiemannianManifoldsWithConvexBoundary, as in the previous review; the change adds no object and the owners stand: Lorentzian specialisations LorentzianGeometry; Riemannian warped-product, Jacobi, index and immersion objects RiemannianGeometry; the flow of a locally Lipschitz connection and the Banach Hölder chart change this roadmap. Nothing else shared.

Source independence: changed passages only; 4 passages compared with 2 texts (the two new sentences of §2.4, the new contract bullet and the new docstring, against Bruveris2018 §2.3 and the header of Mathlib's Levi-Civita file), none shared; largest share Minguzzi 2019, 7 of 18 locators, as before; the change adds, removes or reorders no layer, so the arrangement was not compared again. O'Neill's text and contents could not be read.

Research link: §3.4 states the bi-Lipschitz exponential map and low-regularity Gauss lemma of Kunzinger–Steinbauer–Stojković (2014) and Minguzzi (2015), inputs of low-regularity causality theory, consumed by LorentzianGeometry; §2.2–§2.4 use the strong and weak metrics of Bruveris (2018) and Michor–Mumford. Rests on the README and the texts read.

## Not verifiable

- O'Neill 1983, Ch. 7, Propositions 35 and 42 and Corollary 43 (§2.6): a book with no legal open copy (unchanged text).
- Kobayashi–Nomizu 1963, Vol. I, §III.8 (§3.4): a book with no legal open copy (unchanged text).
- "It is that PR's Part I (Layers 1–5), with the same layer and section numbers" in the description: the earlier state of the other pull request was not read; its head cites §§1.1–5.2 of this roadmap, which is consistent.

Automatic checks set aside as false positives: the citation lead list reported five names of §2.2, §2.4 and §2.7 (`IsStrong`, `exists_leviCivitaConnection`, `leviCivitaConnection_unique`, `isInextendible_iff_forall_secondCountable`, `toSmoothMetric`) as found nowhere; all five are declared in this roadmap's own `Suggested.lean`.

## Source issues

- **Error** in BarzenLeymann2026 at Lemma 35 (iii)–(v), pp. 61–62: the source says the warping terms carry O'Neill's signs, for instance (iv) gives `R(V,X)Y = +f⁻¹ Hess f(X,Y) V`, under its own curvature (53); it should be `−f⁻¹ Hess f(X,Y) V`, with (iii) and (v) reversed likewise; affects a stated result.

## For the human reviewers

- Licence: Minguzzi 2019 (Living Rev. Relativ. 22:3, open access) was read from a cached copy fetched from inspirehep.net, a host outside the project's list of open repositories.
- Scope: Barzen–Leymann (arXiv:2606.02616v1, 2026) is an expository "guided tour"; it is the only located source for §2.1's coordinate curvature formula and §2.5's constant-curvature identities.
- Not tested: O'Neill 1983 is named for five chapters in the References and located once; its text and table of contents could not be read, so wording and arrangement were not compared with it.
