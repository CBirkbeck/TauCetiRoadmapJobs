<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/96#issuecomment-6310759444 -->
Red team round 2 pass b (claude) of b6ffff2

Verdict: needs_changes

1. **F01** (P2) Layer 1 Lean text applies a subgroup element as a function

   **Location.** `packages/ColemanIntegrationPartII/Suggested.lean:46` ("Multiplicative.toAdd (c ⟨(v, w), h⟩)"), `:76` ("-Multiplicative.toAdd (c ⟨(0, 1), by decide⟩)"), `:86`–87 ("Multiplicative.toAdd (c ⟨(0, 1), by decide⟩) = 1 ∧ Multiplicative.toAdd (c ⟨(1, 0), by decide⟩) = -1").

   **Claim.** `simpleDivergence` is a real-bodied definition and the two Layer 1 examples are proved.

   **Witness.** `c : G.oneCochains (Multiplicative k)` is an element of `Subgroup (G.Dart → A)` (Tau Ceti `Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`), i.e. a subtype, not a function. Neither Mathlib `6b7abb3c` nor the Lean core at the pin has a `CoeFun` instance for subtypes of function types (grep of `instance.*CoeFun`); Tau Ceti itself always writes `(σ : G.Dart → A) d` (`Cohomology/Basic.lean:72`, `Cohomology/Map.lean:77`). Direct application elaborates to "function expected", so the definition and both examples fail, and `simple_laplacian`, `simple_harmonic_exact_decomposition` then fail to elaborate as they mention `simpleDivergence`.

   **Repair.** In `simpleDivergence` replace `Multiplicative.toAdd (c ⟨(v, w), h⟩)` by `Multiplicative.toAdd ((c : G.Dart → Multiplicative k) ⟨(v, w), h⟩)`. In the first example replace `c ⟨(0, 1), by decide⟩` by `(c : (⊤ : SimpleGraph (Fin 2)).Dart → Multiplicative ℚ) ⟨(0, 1), by decide⟩`; in the second example use `(c : (⊤ : SimpleGraph (Fin 3)).Dart → Multiplicative ℚ)` for both darts. Elaborate the file once after the change (the repair job may run Lean); the simp sets of the two examples may also need `toAdd_div`, `ofAdd_neg` and `SimpleGraph.coboundary_apply`.

2. **F02** (P3) §4.0c uniqueness plan does not fix the traced logarithmic forms over K

   **Location.** `packages/ColemanIntegrationPartII/README.md:650` ("For uniqueness over each fixed K, naturality forces the rational-logarithmic second-difference identity on abelian varieties … Apply the descended Albanese quotient and moving of §4.0b to conclude uniqueness on U.").

   **Claim.** Two natural theories over a fixed closed K agree on every closed regular form.

   **Witness.** The quotient of §4.0b (`README.md:591`) is modulo d(K(X)) + LogDesc_K(X). The axioms at `README.md:630` fix exact forms and dlog f for f ∈ K(X)×, and the abelian-variety part is fixed by `singleIntegral_abelianOpenQuotient`; nothing in the paragraph fixes Tr_{L(X)/K(X)}(c dlog f) with c ∈ L∖K, the term that the ℚ₃ Check at `README.md:659` exhibits. The repair report's torus argument (compact norm-one torus) covers that Check but was not written into the plan, and it needs the general form: for L/K finite, Tr(c dlog f) is the pullback of an invariant form on the K-torus R=Res_{L/K}G_m under f : X → R; the difference of two theories is then an additive locally constant map L× → K+KT (group-law naturality, same differential), zero on the compact O_L× and on K× (the restriction to K× is the K-rational form Tr(c) dlog t, fixed by the axiom), hence zero because L×/(O_L× K×) is finite of order the ramification index and the target is torsion-free.

   **Repair.** After "the torsion open-quotient theorem … makes that difference constant over every closed K" insert: "For a descended logarithmic generator Tr_{L(X)/K(X)}(c dlog f), write it as f*η_c with η_c the invariant K-form on the norm-nonzero open R of A^{[L:K]}_K representing Res_{L/K}G_m, whose K-points are L×. Group-law naturality makes the difference of the two theories an additive locally constant map L×→K+KT; it vanishes on the compact O_L×, on K× by the K-rational dlog axiom, and hence on L×, whose quotient by O_L×K× is finite." Add the torus R to the *Needs:* line as an explicit affine open of affine space (no Weil-restriction supplier is needed), and record the ℚ₃ form as the Check of this step.

3. **F03** (P3) Two statable §1.2 Checks have no Lean mirror

   **Location.** `packages/ColemanIntegrationPartII/README.md:165` ("On a cyclic triangle with unit lengths and cyclic edge values (3,0,0), the harmonic part is (1,1,1) and the exact part is (2,−1,−1)"), `README.md:167` ("In characteristic 3 on a triangle, the constant cyclic cochain (1,1,1) is both exact and harmonic").

   **Claim.** Every README Check statable at the pins has its `example`.

   **Witness.** Both are statable on the pinned carrier: the exact part is the coboundary of the potential (0,2,1) (0→1: 2, 1→2: −1, 2→0: −1) and multiplies with the cyclic cochain to (3,0,0); over `ZMod 3` the cyclic cochain is the coboundary of (0,1,2) since 0−2 = 1, and has zero divergence, so the uniqueness in `simple_harmonic_exact_decomposition` genuinely needs `CharZero`. `Suggested.lean:83`–101 tests only the harmonic cyclic cochain over ℚ.

   **Repair.** Extend the second Layer 1 example (keeping two example blocks for `simpleDivergence`) with the conjuncts: `c * G.coboundary (Multiplicative ℚ) (fun v ↦ Multiplicative.ofAdd (![0, 2, 1] v)) = c₃` where `c₃` is the cochain with value 3 on the dart (0,1), −3 on (1,0) and 0 elsewhere; and, over `ZMod 3`, `∃ f : Fin 3 → ZMod 3, c' = G.coboundary (Multiplicative (ZMod 3)) (fun v ↦ Multiplicative.ofAdd (f v))` together with `∀ v, simpleDivergence G c' v = 0` for the cyclic cochain `c'`, witnessed by `f = ![0, 1, 2]`. Name the characteristic-3 instance in the README Check as the Lean negative control.

## Round-1 findings at this head

Each earlier finding was checked against the head; the quoted passage is the witness.

| Id (pass) | Status | Witness at head |
| --- | --- | --- |
| F01 (a, P2) scalar-extension milestone | repaired | `packages/ColemanIntegrationPartII/Suggested.lean:251`–255 `theorem doubleIndex_scalarExtension … f (doubleIndex F G) = doubleIndex (F.1.map f, f F.2) (G.1.map f, f G.2)`; `README.md:300` "This is the formal coefficient-extension assertion in Suggested.lean, using `HahnSeries.map`". Statement recomputed: coefficient extraction, convolution and `LaurentSeries.derivative_map` commute with a ring homomorphism; true. |
| F02 (a, P2) §6.1→§6.2 cycle | repaired | `tripleIndex_congr` now at `README.md:962` inside §6.2 after `tripleIndex_laws`; §6.1 *Needs:* (`README.md:950`) lists §3.1, §5.2, §3.0b, §3.1a only. |
| F03 (a, P3) residue/orientation examples | repaired (differently) | `Suggested.lean:168`–169 full equality `differential (single 0 2, 3) = single (-1) 3`; `Suggested.lean:263`–264 `B(1,(0,2)) = 2`, `B(1,(0,-1)) = -1`; `Suggested.lean:280`–283 Laurent-second witness with `z + 2L`; universal form is the target `doubleIndex_laurent_second` (`Suggested.lean:230`, `README.md:274`). Values recomputed: −1, −1, 2, −1, 1. |
| F04 (a, P2) finite K in §§7.1–7.2 | repaired | `README.md:1056` "K a closed subfield of ℂ_p with its induced topology"; `README.md:1084` same with "endpoints in a finite extension L/K inside ℂ_p"; transcendental-j Check `README.md:1095`. |
| F01 (b, P1) higher-dimensional Albanese unowned | repaired (differently) | `README.md:589` `properAlbanese_exists` with Serre's maximal-morphism construction (serre1959 lines 83–100, 176–179, 431–449 verified) and pointed descent; `README.md:54` "§4.0b constructs the additional higher-dimensional proper Albanese existence". Pinned `IsAlbanese` takes any `X : Over (Spec K)`, so a non-proper X is admissible. No new error found: the dimension bound by regular one-forms and the Weil-descent step are correct. |
| F02 (b, P2) uniqueness over non-closed K | disputed, dispute upheld | The repair's torus argument is correct: dt/(t²−2) is the pullback of the K-rational invariant form (1/(2α))dlog u on the norm-one torus of ℚ₃(√2)/ℚ₃, whose K-points are compact units, so the axioms force its integral. Not re-raised. The proof plan still omits the general step for traced logarithmic forms: see S02. |
| F03 (b, P3) closure identification | repaired | `README.md:650` "For closed K put F=K∩ℚ̄_p. Characteristic zero makes K/F regular … `spectralNorm_unique_field_norm_ext` … `K <= (Cp)^H_K = closure(F) <= K`"; contract `README.md:45`; *Needs:* `README.md:652`. Argument checked: linear disjointness from regularity, isometry from uniqueness of the extended absolute value (pinned theorem at `Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:770` has `[CompleteSpace K]`), continuity to ℂ_p, closedness of a pointwise stabiliser. Sound. |
| F04 (b, P2) Layer 1 milestone absent | repaired, but see S01 | `Suggested.lean:37`–102: `simpleDivergence`, `simple_laplacian`, `simple_harmonic_exact_decomposition`, two examples; `README.md:124`, `:155`. Mathematics recomputed: divergence of the pinned target-over-source coboundary is −L f; the decomposition is a direct sum over every characteristic-zero field by rank invariance of the integer Laplacian. The Lean text itself does not elaborate as written (S01). |
| F05 (b, P3) Laplacian kernel restated | repaired | `README.md:43` names `lapMatrix_toLinearMap₂'_apply'_eq_zero_iff_forall_reachable` (linearly ordered field) and `lapMatrix_ker_basis`, `card_connectedComponent_eq_finrank_ker_toLin'_lapMatrix` over ℝ, matching the pin (`LapMatrix.lean:209`, `:277`, `:283`); `README.md:153` reduces to the ℝ theorem. |
| F06 (b, P3) sorry'd polynomial restatements | repaired | `specialize_zero`, `specialize_add`, `specialize_tower`, `branchTransport_affinePolynomial` absent from both files (grep); `README.md:1058` cites `Polynomial.eval_C`, `eval_X`, `eval_add`, `eval_map`, `hom_eval₂`; subtraction law is a proved conjunct (`Suggested.lean:321`–329). |
| F07 (b, P3) nonexistent consumers, process narrative | repaired | `README.md:1223` "Regulator, height and effective-method roadmaps consume the index laws … none is a premise here."; no PadicHodgeRegulators, EllipticRegulators, "v1 locators" or "Derived metric" (grep). |
| F08 (b, P3) Proposition 52 unconditional | repaired | `README.md:630` "whose proof uses Conjecture 1 in the rank-two case established by Colmez (line 1810)"; `README.md:1231`; `sources.toml` locator carries the same qualification. vologodsky2001 line 1810 verified. |

No repair introduced a new mathematical error. One repair (F04 of pass b) introduced a Lean elaboration defect, recorded as S01.

## Dependency gate

The prescribed command exited 0 and printed exactly:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every cited supplier is on main (AlgebraicCurves, FormalLaurentPuiseux, RigidAnalyticGeometry, StableReduction, JacobianChallenge, EllipticCurves) or earlier in the merge order (ColemanIntegration, PadicPeriodRings, AnabelianGeometryAndNonabelianChabauty, PadicDifferentialEquationsAndRigidCohomology, ResolutionOfSingularitiesCharacteristicZero). No notion was moved from a later roadmap. Declared gaps: none, and none is needed.

## Verified sound

- **Package scope.** `git diff --stat origin/main...HEAD` touches only `packages/ColemanIntegrationPartII/` (README.md, Suggested.lean, metadata.toml, sources.toml, four reports).
- **Lean (21 named declarations and 8 example blocks read, every line).** One `import Mathlib` plus the one Tau Ceti module actually used (exists at `a91d3aaf`); `theorem` only; no `set_option`, no sorry'd data, no `True` placeholder, no hypothesis containing its conclusion; every Lean name occurs in the README (grep, 21/21); generality matches the README (`[Field k] [CharZero k]` for the formal kernel, primitive and index laws; `[Field k]` for `toPolynomial_injective`; `[AddCommGroup k]` for `simpleDivergence`; `[CommRing k]` for `specialize`). Truth as typed recomputed by hand: `doubleIndex F G = Res(f dg) + b f₀ − a g₀`; `doubleIndex_self` (Res(f df)=0), `doubleIndex_add_left`, `doubleIndex_laurent_first`, `doubleIndex_laurent_second` (integration by parts), `doubleIndex_ext` (expansion with B(L,L)=0 and antisymmetry), `doubleIndex_add_constants` (a G.2 − b F.2), `doubleIndex_scalarExtension`, `formal_primitive`, `differential_eq_zero_iff` (needs CharZero, has it), `differential_residue`, `residue_zero_iff`, `toPolynomial_injective`, `simple_laplacian` (−L f), `simple_harmonic_exact_decomposition` (direct sum by rank invariance) all true; example values 1, −1, 0, 2, −1, 0, −1, −1, −1, 1, 3, −3, 0, 1, −1, 2, 1 recomputed. Pinned carriers used: `LaurentSeries.derivative R` (explicit ring, `LaurentSeries.lean:176`), `derivative_map` (`:184`), `HahnSeries.map` (`HahnSeries/Basic.lean:142`), `coeff_single_same`/`coeff_single_of_ne` (`:202`, `:206`), `SimpleGraph.lapMatrix` (`LapMatrix.lean:80`), `lapMatrix_mulVec_apply'` (`:125`), `oneCochains`/`coboundary`/`FirstCohomology` (`Cohomology/Basic.lean:54`, `:79`, `:99`), `IsAlbanese` on any `Over (Spec K)` (`Albanese.lean`).
- **README (189 targets in 45 subsections, 167 Check bullets, all read).** Build order: every internal *Needs:* points backwards (checked for all 45 subsections; the §6.1 mention of §6.2 is prose, not a dependency). Signs recomputed from the sources: d f = tail − head and d* = outgoing sum (besser2017 lines 528–549), c = F_head − F_tail (besser2017 line 693, besser-zerbes2017 line 81), annulus oriented as the end of the tail component (besser2017 line 574), the correction c Res η − d Res ω (besser2017 lines 700–735), χ and N (lines 646, 654), Nφ = qN, χφ = χ, χN = N, N² = 0 (lines 779–782), Frobenius scaling q and skew N (lines 756–757), the value F_tail + c·ν_π(x) (besser-zerbes2017 line 112) and the Tate jump −log(q)/n (lines 265–277). Numerical Checks recomputed: −3/+3, 12, ±4, (1,1,1)+(2,−1,−1), −11, 4 both ways, 2/e, a−b at infinity, π for the divisor, traced 2 against −2, T-values 1, −2, 1, 0, −1, 6, 2, −1, the 𝔽₃ eigenvalue −3 and the 𝔽₄ Frobenius lift. Degenerate cases: dimension-zero abelian variety, ℙ¹, G_m negative control, q = 1 excluded, n = 1, 2 loops/parallel edges, p = 2 and 3, the zero ring for `specialize`, ZMod 2 and characteristic 3 negative controls; all consistent.
- **Sources (64 locators verified against the cache).** colmez1998 lines 225–258, 602, 1938, 2083–2110, 2957–2997, 3079–3121, 3145–3159, 3169–3214, 3372–3431, 3950; besser2017 lines 402–430, 435–461, 492–520, 528–558, 562–575, 586–658, 671, 693, 700–735, 738–785, 796–809; besser-zerbes2017 lines 49–67, 81, 88, 95–113, 130–150, 151–167, 212, 218, 245–278; besser-dejeu2012 lines 250, 2232–2249, 2251–2275, 2277–2296, 2299–2322, 2327, 2413–2429, 2430–2444, 2524–2532, 2533–2558, 2576, 2591–2617, 2766, 2769–2789; besser2005 lines 355–380; vologodsky2001 lines 51, 195, 1806–1810; serre1959 lines 83–100, 176–179, 431–481. Each supports the statement cited for it. Colmez Definition II.1.3 (lines 2986–2995) uses only intrinsic axioms over K and Theorem II.1.4 (line 2996) asserts uniqueness for each closed K, as the README states.
- **Supplier citations (34 checked).** ColemanIntegration L0.A1–A2, L0.11–L0.12, L0.15–L0.19, L0.20–L0.23, L1.2–L1.3, L1.17, L1.17a, L1.18–L1.19, L1.43 and all 19 declaration names; PadicPeriodRings §§1.1–1.2 and the four names; AnabelianGeometryAndNonabelianChabauty §5.8 and its seven names; PadicDifferentialEquationsAndRigidCohomology RD.4.31–RD.4.33, RD.5.76, RD.6.1 (`linearFrobenius_eq_pow`, `_natural`, `_baseChange`), RD.6.86, RD.6.88, RD.6.92; ResolutionOfSingularitiesCharacteristicZero §6.2 `sncCompactification`; RigidAnalyticGeometry §§1.3, 2.3, 6.2, 8.1; StableReduction Layers 0–2, 4–5, 7, 9; JacobianChallenge Layers D–F (`isAlbanese_abelJacobi`); EllipticCurves Layer 4 (Tate curve over a complete rank-one valued field); AlgebraicCurves Layers 5, 9 (Remark 4.3.7(d)); FormalLaurentPuiseux L1–L3. All exist with the cited content. Siblings ArithmeticDynamics and ErdosProgressionPowers are neither cited nor citing.
- **Duplication by object.** Tau Ceti at the pin has no divergence, harmonic cochain, logarithmic function space, double or triple index, Coleman function or Vologodsky object (grep); its `AdditiveFunction.lean` Cartan matrix is not the Laplacian. Mathlib has no signed divergence on dart cochains.
- **Policy.** No pull-request numbers, process narrative, `lemma`, `set_option` or machine path in README, Lean or `sources.toml`; every target has a locator; `sources.toml` parses with seven certified open-archive entries.

### Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §1.1 `LengthCochains`, `simpleDivergence`, `simple_laplacian` | one edge (2,5); isolated vertex; loop; length ½; same-sign cochain | d f = −3 vs coboundary +3; divergence ±3; loop two flags cancel; identity needs only a ring | S01 (elaboration) |
| §1.2 `harmonic_exact_decomposition`, `simple_harmonic_exact_decomposition`, `rationalLaplacian_rank` | triangle (3,0,0); tree; two isolated vertices; ℤ-Laplacian over ℚ(i), ℂ, ℚ₃; characteristic 3 | kernel = component constants by rank invariance; direct sum; char 3 fails | S03 |
| §1.3 subdivision | 6 → (2,4); m = 1; attached tree | increments ∝ lengths; energy preserved | none |
| §2.0 `residueTransport` | z = t², t⁻¹, identity, constant map, infinite negative tail | 2, −1, 1; constant map and non-Laurent family excluded | none |
| §2.1 `LogarithmicFunctions` API | 0, constants, L, 2+3L, L², z² over ZMod 2 | kernel scalars in char 0 only; residue = a | none |
| §2.1a general coefficients | ℂ((t)) trivial restriction to ℚ; ℚ₂ with L²/2; closed boundary | inverse integers bounded by a power of n; open annulus absorbs growth | none |
| §2.2 `doubleIndex` laws | (1,L), (L,1), (L,L), (z,z⁻¹), (z+2L,z⁻¹), constant shifts | 1, −1, 0, −1, −1, +1 | none |
| §2.3 pullback, scalar extension, shrink | z = t² on (1,L), (L,1), (z,z⁻¹); reversal | n, −n, −n; sign flips | none |
| §3.0a–3.0c covers, full coefficients, comparison | smooth model; self-node; (1−αz)⁻¹; diag(1,q); 𝔽₄ | χ = N = 0 with H¹ ≠ 0; q = 2 over 𝔽₄ excluded | none |
| §3.1–3.1a pairing, reciprocity | ℙ¹ minus discs; cup = 1; dlog of a unit; degree-two boundary over 𝔽₃ | 0, 1, q-eigenclass radical, eigenvalue −3 | none |
| §3.2–3.5 normalization, correction, pairing, φ/N | bridge jump 2; cyclic (1,1,1); (2,3,5,7); N = 0; symplectic test | −11 both orientations; q-scaling; skew N | none |
| §4.0 `abelianLogCp` | dimension 0; torsion x; small v; transcendental j | zero on torsion; local inverse; no finite model needed | none |
| §4.0a `abelianPrimitive` | invariant ω; df; dimension 0; quadratic descent | normalized trace, not raw trace | none |
| §4.0b Albanese, `descendedLogForms` | Spec k; ℙ²; ℙ¹; E×E; A¹; G_m; dt/(t²−2) over ℚ₃; transcendental pole over ℂ | Vandermonde spanning over k̄; strict inclusion over E | none |
| §4.0c natural integration | K = ℚ_p, ℂ_p, closure of ℚ_p^nr; ℚ̄_p (not closed); traced ℚ₃ form | fixed-field adapter correct; traced form forced by torus argument but step absent from plan | S02 |
| §4.0d reciprocity | constant f; (t−a)/(t−b) with dt; z = t²; a = 0 | a−b, b−a at ∞, factor 2, alternation | none |
| §4.0e Jacobian bridge | ℙ¹; split multiplicative E; valuation on K× | compact H open by g-point Jacobian matrix; noncompact control | none |
| §4.1–4.4 residues, identification, annulus, point-sum | f = x at xy = π; tree; cycle; Tate q = p³ at ν = 1/3, 2/3 | Res = ord_head − ord_tail = 1; corrections −1/3, −2/3; value 4 both ways | none |
| §5.1–5.5 triple data and index | three L slots; (1,1;L); (z,z;z⁻²); (L,0;L) with (1,−1); (2+L,3;L); degree 2 | 0, 1, −2, −1, 6, 2 | none |
| §6.0–6.4 symbols, end-sum, laws, vanishing, pairing | B_U(F,H) = 1 with G = 1 or G+2; local shift at one end; q = 2 eigenvalue 1/2 | T = 1, +2, −1; reciprocal excluded | none |
| §7.0–7.7 Tate charts, branch, trace, divisor, traced index, descent | q = p³; e = 2; Tr of degree n; α² = π; quadratic constant field | 2/e; n·I; Tr(α²) = 2π ≠ Tr(α)²; π; 2 vs −2; cancellation at p = 2 | none |

## Not verifiable

- Lean elaboration was not run (no Lean command is permitted by the brief); S01 rests on the absence of a `CoeFun` instance at the pins and on Tau Ceti's own ascriptions, and the example tactic scripts (`norm_num` with `Fin.sum_univ_succ`, `HahnSeries.coeff_mul_single`, `ofAdd_neg`) were checked by reading only.
- Supplier roadmaps still in pull requests (ColemanIntegration, PadicPeriodRings, AnabelianGeometryAndNonabelianChabauty, PadicDifferentialEquationsAndRigidCohomology, ResolutionOfSingularitiesCharacteristicZero) were read from the copies the round-1 pass fetched at their pull-request heads on 2026-10-21; this brief names no location for them, so later movement of those heads is not excluded.
- Besser 2000 (Corollary 4.11, Proposition 4.10, Lemma 4.6), Besser 2002 Corollary 6.2, Coleman–Iovita and Colmez Appendix B.3.3 are not in the cache; the claims routed through them (§3.1a reciprocity and projection, §6.0 kernel containment, §4.0 deformation for varieties without a finite model) were checked only against the citing passages.
- The constructions that are targets rather than pinned objects (semistable Čech comparison with geometric monodromy at a valuation scale, full-analytic-coefficient Coleman algebra, agreement of the natural theory with Coleman integration in good reduction, which colmez1998 lines 229–236 only sketch) were checked for internal consistency, hypotheses and ownership, not for truth of their future proofs.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b6ffff293680a8d5725ef7ab22f2ff107233892f", "job": "RT-ColemanIntegrationPartII~2b", "model": "fable", "worker": "chris-f"} -->
