# FIX-RT-CrystallineCohomologyPartII~2: repair of red-team round 2 (passes a and b)

Nine findings, two pairs overlapping: seven sections below. All were verified against the cached sources, the sibling roadmaps (main and the open heads given in the brief) and the pinned Mathlib and Tau Ceti. Files changed: `packages/CrystallineCohomologyPartII/README.md`, `packages/CrystallineCohomologyPartII/sources.toml`, and the top-level `gaps` list of `packages/CrystallineCohomologyPartII/design/plan.json`. `Suggested.lean` and `metadata.toml` are unchanged: no finding touches a Lean statement.

## RT-CrystallineCohomologyPartII~2a/F01, RT-CrystallineCohomologyPartII~2b/F01 (P2) — applied

Witness confirmed. ArcTopologyAndDescent §1.1 (open head, README line 286) and BS17 Lemma 2.10 (BS17 lines 321–325) need *universal* F-descent of h = (blowup) ∘ (fppf) to cancel. The base change of Bl_0 A² → A² along itself is reducible (component E × E ≅ P¹ × P¹), so not a blowup, and has dimension 2: the old induction did not reach it. BS17 line 353 inducts on the inductive level, which is base-change stable; dimension is not.

Changes. §1.4: sequence over Y → over every qcqs Y-scheme T (`X^{n/Y}` ×_Y T, …); route step 5 added. §1.5 steps 2–4: induction on plain descent → induction on universal F-descent, b_T handled via §1.3 over Y and §1.4 over Y′ with T′ = T ×_Y Y′, induction only for E → Z. Three Checks added (T = Z; T = Bl_0 A²; §1.5 negative control).

## RT-CrystallineCohomologyPartII~2a/F02 (P3) — applied

Witness confirmed. A morphism of first-quadrant spectral sequences that is an isomorphism on columns i ≤ N has a cone with E_1 terms in columns ≥ N + 1 and rows ≥ −1, so the abutments agree only in degrees q < N (at q = N only injectivity); §2.6 itself gives q < N. BBE07 line 1394 prints "q ≤ N".

Changes (§3.6 steps 3–4): "N ≥ 2d" → "N ≥ 2d + 1", with the cone argument; "degrees ≤ N" → "< N", "2d < N"; "the d-dimensional components of X_i" → "the connected components of X_i that meet U_i", with the E × E ⊂ X_0 ×_X̄ X_0 witness.

## RT-CrystallineCohomologyPartII~2a/F03 (P3) — applied differently

Witness confirmed: SchemeAndStackFoundations §1.17 (main, README line 3450) owns `finiteGroupQuotient_projective` (projective over a Noetherian base; quotient projective, q finite, invariant structure sheaf), cited nowhere here.

Changes. §5.2 step 1, *Needs:*, contract: X″/G from §1.17 over Y′. §6.4 (iii) step 3 and *Needs:*: projective X via §1.17; proper X with orbits in affine opens via `gap:admissible-invariant-quotient-gluing` (SchemeAndStackFoundations §1.17) and Tau Ceti `TauCeti.AffineInvariantQuotient.quotient`.

Why differently: the review proposed owning the gluing here as an API bullet. The quotient is a generic scheme construction whose owner is SchemeAndStackFoundations §1.17, and the package SheafTheoreticSmithTheory already declares the same gap slug for the same need, so it is declared as a supplier gap (BBE07's generality, BBE07 lines 1642–1658, is kept).

## RT-CrystallineCohomologyPartII~2a/F04, RT-CrystallineCohomologyPartII~2b/F02 (P3) — applied

Witnesses confirmed on main: SchemeAndStackFoundations §2.5 `noetherianSpace_vanishing` (line 4290), §2.6 `proper_fibreDimension_vanishing` (line 4400), §2.6 sending proper finiteness and coherence to JacobianChallenge Layer C (line 4396); JacobianChallenge Layer C (its README lines 143–163) states them; §5.9 step 1 uses §2.21 duality without a *Needs:* edge.

Changes. Contract: SchemeAndStackFoundations §2.5, §2.6 entries; new "From TauCetiRoadmap.JacobianChallenge" (Layer C). *Needs:* §0.7 (§2.5, §2.6); §0.1, §0.8, §1.3, §2.1, §2.6 (Layer C); §5.9 (§2.21). Route citations in §0.7, §0.8, §1.3, §2.1 ("§2.6 … with properness" → Layer C) and §6.8's Check. Layer 0, 1, 2, 5 Dependencies.

## RT-CrystallineCohomologyPartII~2b/F03 (P3) — applied

Witness confirmed: the cached HW23 text is arXiv v2 (the last arXiv version; v3 and v4 return 404); its introduction has Theorems 1.1–1.5 (HW23 lines 30, 60, 82, 103, 146), no Corollary 1.3 and no rational-point statement; pp. 19–20 (HW23 lines 836–932) prove Theorem 1.1. The published version was not read, so no locator of it is kept.

Changes. "HW23, Corollary 1.3 …" deleted in §3.6, §5.5, §6.5, §6.11 (twice), §6.13, §6.14; §5.5 keeps "HW23, Corollary 4.6 and proof, p. 21 (arXiv v2)". Same pattern: "(Corollary 4.7 in the published version)" dropped (four places); "§2, p. 5" → "p. 6" (two). Summary, References, manifest `version_note` and `cited_for` updated.

Evidence for p. 6: the definition is at HW23 lines 244–250, after the page-6 marker at line 239; Corollary 4.6 is at line 953, after the page-21 marker at line 933.

## RT-CrystallineCohomologyPartII~2b/F04 (P3) — applied

"Uncertified publisher text; cited by locator." → "Cited by its locator without the text." in Ser58, Ax64, BS83, Tsu04. Same pattern: "paywalled; cited by its locator without the text" → "Cited by its locator without the text." in Eke84, Kol96, EkeII, Tsu03, so all eight entries read alike.

## RT-CrystallineCohomologyPartII~2b/F05 (P3) — applied

Witness confirmed: DerivedModuleAlgebra on main has no §1.T.1 heading; its README (lines 28–40) says the citations resolve to Tau Ceti. At the pin: `TauCeti.ModuleTower.subsingleton_limOne_of_isMittagLeffler` (`TauCeti/Algebra/Category/ModuleCat/Tower/MittagLeffler.lean:191`), `isMittagLeffler_of_surjective` (`:104`), `isMittagLeffler_of_isArtinian` (`:113`).

Changes: subsection "From TauCetiRoadmap.DerivedModuleAlgebra" deleted; the three declarations added to "From Tau Ceti"; all six citations (§0.1 *Needs:* and route step 5 twice, §0.7 *Needs:* and step 1, Layer 0 Dependencies) replaced. The surjective tower uses `isMittagLeffler_of_surjective`; the finite-length (Artinian over W(k)) tower uses `isMittagLeffler_of_isArtinian`.

## Checks run

**Elaboration** (`lake env lean` on `packages/CrystallineCohomologyPartII/Suggested.lean` from the content checkout): exit 0, 33 s; output is five warnings "declaration uses `sorry`" at lines 91, 107, 119, 141, 174 (the five theorems), nothing else.

**Signatures.** A scratch copy of `Suggested.lean` with `#check @name` for all eight declarations was elaborated once. Each elaborated type matches its README statement and the job's signatures file: `card_rationalPoints_modEq_of_cohomologyPullback_bijective` (finite field K, πX, πY proper, f ≫ πY = πX, bijectivity for all i), `card_projectiveZeroLocus_modEq_one` (`1 ≤ d j`, `∑ d j ≤ n`), `card_dvd_card_solutions_of_sum_lt` (`[Finite σ]`), `IsThetaDivisor`, `card_thetaDivisor_modEq`, `zeroCycleDegree`, `UniversallyCH0Trivial` (`[IsProper π]`), `card_rationalPoints_modEq_one_of_universallyCH0Trivial` (`X.Over`, `IsProjectiveOver`, `Smooth`, `GeometricallyConnected`). No binder lost; nothing changed.

**Dependency check:**

```
depcheck: 208 roadmaps, 1907 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The new supplier JacobianChallenge is on main and earlier in the merge order; DerivedModuleAlgebra is no longer named.

**Citation resolver** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."

**Gate repair (tex=7).** The gate found seven TeX-style subscripts `_{…}` outside code spans in §1.5, proof sketch steps 3 and 4 (README lines 473–474). Each is now inside a code span: `Bl_{J^m} Y`, `Y_1 ×_{Y′} T′` (twice), `Y_1^{n/Y′} ×_{Y′} T′` → `Y_1^{n/Y} ×_Y T` (one span per side, replacing a span that held only the exponent), `Z ×_{Y′} T′` and `F(Z ×_{Y′} T′)` (twice). The wording and the mathematics are unchanged. A scan of the whole README now finds no `_{`, `^{`, backslash command or `$` outside code spans. The checks were run again after this repair: elaboration exit 0 in 24 s, with the same five `sorry` warnings at lines 91, 107, 119, 141 and 174; depcheck `depcheck: 208 roadmaps, 1907 edges, 0 problem(s)`; and the resolver still reports None for both lists. `Suggested.lean` is unchanged.

## Adversarial pass (changed and added statements)

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §1.4, base change to T | T = Y | the BS17 sequence | recovers Lemma 11.45 |
| §1.4 | T = Z | F(Z) → F(E^n) ⊕ F(Z) → F(E^n), second component id | fibre sequence for every square |
| §1.4 | T = ∅ | 0 → 0 ⊕ 0 → 0 | holds |
| §1.4 | Y = A², X = Bl_0 A², T = X, n = 1, K-coefficients | X ×_Y T = ΔX ∪ (P¹ × P¹) along Δ_E (chart k[x, v_1, v_2]/(x(v_1 − v_2))); RΓ = fib(RΓ(X) ⊕ K → K) ≅ RΓ(X) = W(k[x,y])_K; sequence RΓ(X) → RΓ(X) ⊕ K → K | fibre sequence; Check added |
| §1.4 | same, T = Y, n = 2 | W(k[x,y])_K → W(k[x,y])_K ⊕ K → K | fibre sequence |
| §1.5 route | d = 0 | Y_red a finite union of points, X → Y fppf | universal by §1.1 |
| §1.5 route | Bl_0 A² → A², T = Bl_0 A² | dim T = 2 = d; induction used for E → Z only, dim Z = 0 | closes |
| §1.5 step 3 (Y′) | cusp k[t², t³], J = m | Bl = A¹, E = Spec k[t]/(t²), B′ = k + t²k[t] = k[t², t³] | Y′ = Y, universal homeomorphism |
| §1.5 step 3 (Y′) | node k[x,y]/(xy), J = m | B′ = {(f, g) : f(0) = g(0)} = k[x,y]/(xy) | Y′ = Y |
| §1.5 step 3, nilimmersion | X^{2/Y′} → X^{2/Y} | base change of the diagonal of the radicial separated Y′ → Y | surjective closed immersion |
| §3.6 truncation | d = 1, N = 3; d = 2, N = 5; N = 2d | degrees 0–2, resp. 0–4, covered; with N = 2d degree 2d is only injective | N ≥ 2d + 1 needed and sufficient |
| §3.6 cone argument | columns ≥ N + 1, rows ≥ −1 | total degree ≥ N | H^q(cone) = 0 for q ≤ N − 1 |
| §3.6 components | X_0 = Bl_x S, d = 2 | X_0 ×_S X_0 ⊃ E × E, dim 2, over S ∖ U | "components meeting U_i" is the correct carrier |
| §6.4 (iii) quotient | Igusa: E_1 × E_2 projective, G = ℤ/2 free | §1.17 applies | covered without the gap |
| §6.4 (iii) | G = 1 | X/G = X | trivial |
| gap:admissible-invariant-quotient-gluing | X affine; P¹ with x ↦ −x (p odd); line with doubled origin, G swapping origins | Spec A^G (Tau Ceti); quotient P¹, q of degree 2, finite; orbit of the two origins in no affine open | true; the orbit hypothesis excludes the non-separated case |
| §5.2 quotient | cusp, X″ = A¹, G = 1 | X″/G = A¹ → Y′ = A¹ birational | holds |
| §5.2, G acts over Y′ | g ∈ G on X″, k(Y′) = k(X″)^G | uniqueness of the factorisation through the normalisation | G acts by Y′-automorphisms |
| §0.1 finite length (Layer C) | P¹, I = O; A¹ | H^0(P¹, W_nO) = W_n(k), length n, H¹ = 0; H^0(A¹, W_nO) = W_n(k[t]), infinite | properness needed, stated |
| §0.1 Mittag-Leffler | ℤ/p^n; (p^nℤ)_n with inclusions | surjective, lim¹ = 0; neither surjective nor Artinian, lim¹ = ℤ_p/ℤ ≠ 0 | the two Tau Ceti criteria cover exactly the two towers used |
| §0.7 (3), §2.5 / §2.6 | A² ∖ 0 (dim 2); P¹ → Spec k (m = 1); identity (m = 0) | H^{>2} = 0; R² = 0; R^{>0} = 0 | holds |
| HW23 locators | v2 lines 239 (page 6), 244–250, 933 (page 21), 953 | definition on p. 6; Corollary 4.6 on p. 21 | corrected p. 5 → p. 6 |

## Ownership and overlap

- Base change of excision (§1.4) and the universal-descent induction (§1.5): owned here, as before; they are this roadmap's version of BS17 Lemma 11.45 and Proposition 11.41.
- Finite-group quotients: SchemeAndStackFoundations §1.17 (projective case, on main) and the gap `gap:admissible-invariant-quotient-gluing` to the same section. `roadmaps grep` for affine invariant quotients and admissible actions finds the same slug in the package SheafTheoreticSmithTheory (supplier SchemeAndStackFoundations), and no roadmap on main or open head owning the proper case.
- Proper coherence: JacobianChallenge Layer C (on main). Tower algebra: Tau Ceti at the pin.
- No declaration of `Suggested.lean` changed or was added.

## Notes for the maintainer

- `design/plan.json` `gaps`: the first entry (`qcqs-frobenius-factorization`) gained the `slug` field equal to its `id` (it had only `id`); a fourth entry `admissible-invariant-quotient-gluing` (supplier SchemeAndStackFoundations, section 1.17, `neededBy` the §6.4 node) was added, with the same sentence under the README's "Exact supplier contracts".
- Suppliers: DerivedModuleAlgebra is no longer cited; JacobianChallenge is new.
- No section, layer or target id of this roadmap changed, so citing roadmaps are unaffected.
- The source issues the reviewers list (BS17's induction proving plain rather than universal descent; BBE07 line 1394 printing "q ≤ N"; the published HW23 numbering) are repaired in the README; `plan.json`'s `sourceIssues` is outside this job's editable scope and was not changed.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps resolve` at the heads indexed on 2026-11-13.
- No suspicious instructions were found in the reviews or fetched texts. A trial `sources fetch` of the HW23 DOI against a scratch copy of the manifest returned only the arXiv v2 text already cached (the publisher landing page is in no licence class); the package manifest was edited by hand only for the HW23 `version_note` and `cited_for`, and `needs-references.toml` was not created.
