<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13862#issuecomment-6849193422 -->
Red team round 1 pass a (claude) of d334997

Verdict: needs_changes

1. **F01** (P3) §4.4 Check "properness is used in every case" is false for cases (a) and (d)

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:528`: "For the closed unit disc (not proper) and `ℓ = p`, `char K = 0`, finiteness fails in degree one; properness is used in every case."

   **Claim.** Finiteness needs properness in each of the cases (a)–(d).

   **Witness.** The instance given (`ℓ = p`) tests case (b) only. For `ℓ` invertible in `𝒪_K` the same disc has `H⁰ = ℤ/ℓ` and nothing above (README:451), and README:521 itself says huber2007 Corollary 5.6 (huber2007 line 963) holds for every qcqs `X`.

   **Repair.** Replace the Check by:

   > For the closed unit disc (smooth, not proper), `char K = 0` and `ℓ = p` the residue characteristic, finiteness fails in degree one (§4.3, Checks): properness cannot be dropped from (b). For `ℓ` invertible in `𝒪_K` it can be dropped: the disc has `H⁰(X_C, ℤ/ℓ) = ℤ/ℓ` and no higher cohomology (Layer 3, Examples), and huber2007, Corollary 5.6, line 963, gives finiteness for every quasi-compact quasi-separated `X`; cases (a) and (d) are stated for proper `X` because their suppliers (ClassicalAdicEtaleCohomology §§8.4, 9.7 and `gap:proper-rigid-finiteness`) are.

   Tested on the refuting instance: disc, `ℓ ≠` residue characteristic, groups `ℤ/ℓ, 0, 0, …`, finite; the new text asserts exactly that.

2. **F02** (P3) the non-proper algebraic comparison is neither planned nor disclaimed

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:36–40` (the list "Statements of the target scope that this roadmap does not plan, by owner") and README:484 ("Berkovich's Corollary 7.5.4 … is not used").

   **Claim.** The list names every neighbouring statement the roadmap leaves to another owner.

   **Witness.** ClassicalAdicEtaleCohomology §11.1 (heading "Nonproper algebraic comparison and finiteness") supplies `φ_Y^* R^q f_* F ≅ R^q f^rig_* φ_X^* F` for finite-type `f` and constructible `ℤ/n`-sheaves, `n` invertible in `k`, "properness of `f` is unnecessary". Its `G_K`-equivariance for `Y → Spec K` is stated nowhere, here or there; §2.3 does not give it, because `Y^an` is not quasi-compact (for `Y = 𝔸¹`).

   **Repair.** Add to the list at README:36–40:

   > - The `G_K`-equivariance of the comparison `H^i(Y_{K^sep}, M) ≅ H^i((Y^an)_C, M^an)` for a `K`-scheme `Y` of finite type that is not proper (ClassicalAdicEtaleCohomology §11.1, constructible `M` with torsion orders invertible in `K`) is not planned here: `Y^an` is not quasi-compact, so the dictionary of §2.3 does not identify the stalk of `R^i f^an_* M^an` at `ξ_C` with `H^i((Y^an)_C, M^an)`, and §4.2 treats proper `Y` only.

   (If the authors prefer to plan it: a §4.2 second statement with route "naturality of the §11.1 comparison in the adic space over `Spec K`, applied to `Spa(σ̂)`, plus the §11.1 isomorphism over `C` in place of §2.3" — but then §11.1's naturality in the base must be confirmed at the supplier first.)

3. **F03** (P3) an open later roadmap asks a supplier for what §4.2 proves; name it as a consumer

   **Location.** `packages/GaloisActionOnEtaleCohomology/README.md:540–548` (Downstream consumers).

   **Claim.** The consumers of §4.2 are listed.

   **Witness.** DeligneWeightsAndPurityPartII (merge order line 375; this roadmap is line 121) declares, at its head, `gap:analytic-comparison-automorphisms` on ClassicalAdicEtaleCohomology: the comparison `H^i(V_{K̄}, ℤ/n) → H^i(V_C^ad, ℤ/n)` for proper `V` "commutes with every continuous K-automorphism of C". That is §4.2 with §0.2. Two owners for one object once both merge.

   **Repair.** Add a consumer line (a consumer, not a supplier, so no upward edge):

   > - DeligneWeightsAndPurityPartII: the compatibility of the proper algebraic–adic comparison with the continuous `K`-automorphisms of `C` (§§0.2, 4.2), and its compatibility with cup products (§1.3 (d)).

   The duplicate itself is repaired in that roadmap (it is later: it cites §4.2 and withdraws the automorphism clause of its gap); nothing else changes here. Ownership stays with this roadmap because it is earlier in the order and §4.2 is derived from ClassicalAdicEtaleCohomology §8.2's naturality, which the supplier already states.

Three P3 findings. No P1 or P2 was found: every Check and worked example was recomputed (table below), every pinned declaration, supplier section and legally readable locator was resolved, and the dependency check is clean.

## Verified sound

**Dependency check** (command of the brief, run on the head):

```
depcheck: 206 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. All named suppliers are on main (AdicEtaleGeometry, AdicSpacesPartII, AdicSpacesPartIV, SchemeAndStackFoundations, EtaleCohomologyFoundations, ProfiniteCohomology, EnhancedDerivedSheaves, DerivedModuleAlgebra) or earlier in the order (ClassicalAdicEtaleCohomology, AInfCohomology, ArithmeticGaloisRepresentations, PadicPeriodRings, DiamondsAndVStacks, PadicDifferentialEquationsAndRigidCohomology). None of the forbidden suppliers is cited. PadicHodgeTheory, WeightsInEtaleCohomology, ClassicalAdicEtaleCohomologyPartII and the rest of README:540–548 appear as consumers only.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/GaloisActionOnEtaleCohomology/` (README, Suggested.lean, metadata, sources.toml, reports, and the `gaps[0].detail` string of `design/plan.json`, inside the top-level `gaps` list). No pull-request number, process word, `lemma` declaration or `set_option` in README or Suggested.lean ("lemma" occurs only in "Nakayama lemma" prose). Single `import Mathlib`. No sorry'd data, no `True`, no `#eval`.

**Declared gap.** `gap:proper-rigid-finiteness`: same slug in `design/plan.json` (`gaps[0]`, supplier ClassicalAdicEtaleCohomology, §9.7) and README:100; `needs` is a single sentence with its hypotheses; README:100 says what §§9.7 and 11.1 already cover. The source statement was read: huber2007 lines 951–965 (`k` algebraically closed, `X` quasi-separated of finite type, class `C(X, L)` containing constructible modules by line 719, no characteristic hypothesis by lines 948–950), printed page 996. Not raised.

**Suggested.lean: 3 declarations (plus 5 instances) read.**

| Declaration | Context | README side | Lean side | Result |
|---|---|---|---|---|
| `SpectralAlgClosure` (def, l.66) | `(K) [Field K]` | `AlgebraicClosure K` with `spectralNorm.normedField`, `spectralNorm.normedAlgebra` (README:47, 124) | synonym; instances `Field`, `Algebra K`, `Algebra.IsAlgebraic K` via `inferInstanceAs`; `NormedField`, `NormedAlgebra K` under `[NontriviallyNormedField K] [CompleteSpace K] [IsUltrametricDist K]`, the hypotheses of `spectralNorm.normedField` at the pin (SpectralNorm.lean:755, 809) | agree; real body; needed by the headline |
| `CompletedAlgClosure` (abbrev, l.99) | same three instance binders, all in the elaborated type (`scratch/signatures.md`) | `UniformSpace.Completion K̄` (README:47) | `UniformSpace.Completion (SpectralAlgClosure K)` | agree. `K = ℚ_p`: `PadicAlgCl p := AlgebraicClosure ℚ_[p]` (abbrev, Complex.lean:54) with `spectralNorm.normedField ℚ_[p] _` (l.67); same completion |
| `exists_galois_continuousAut_equiv` (theorem, l.119) | all binders explicit in the signature; none lost | README:145: bijection `G_K → Aut_cont(C/K)`, compatible with composition, jointly continuous | `∃ e : G_K → (C ≃A[K] C)`, extends `σ` on `K̄`, `e (σ*τ) x = e σ (e τ x)`, `Function.Bijective e`, `Continuous fun p => e p.1 p.2` | agree; true as typed (see row 0.2 below). `ContinuousAlgEquiv` has no `Group`/`Mul` instance at the pin (grep of Mathlib and Tau Ceti for instances on `≃A[`: none), so composition form is forced |

Padding probe: none of the three follows from one tactic or one library lemma; the instances are what make `CompletedAlgClosure` typecheck. Headlines: the five end theorems of README:5–9; the first is stated; the module docstring names the other four groups (nine bullets) with the missing carrier of each. Statability re-checked at the pins: no étale site on `TauCeti.AdicSpace` (Adic.lean:249 defines the carrier only; no `smallEtale` under `TauCeti/AlgebraicGeometry/AdicSpace`); no `IsContinuous` instance for the base-change functor on `Scheme.smallEtaleTopology` in `Mathlib/AlgebraicGeometry/Sites/` or in Tau Ceti. No absent statable headline. (The density of `K^sep` in `C`, §0.1, is statable but is a Layer 0 step, not one of the end theorems of README:5–9; algebraic closedness of `C` is owned by PadicDifferentialEquationsAndRigidCohomology §RD.0.33 and is correctly not stated.) No Lean name collides with a declaration of any roadmap on main or at an open head (`roadmaps grep`, no match).

**Adversarial pass: 20 targets read, values computed.**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 density of `K^sep` | `K = 𝔽_p((t))`, `a = t^{1/p}` | `b_s^p − s b_s − t = 0 ⇒ (b_s − t^{1/p})^p = s b_s`, `|b_s − t^{1/p}| = |s b_s|^{1/p} → 0`; derivative `−s ≠ 0` so separable | sound |
| 0.1 uniqueness Check | `ℚ_p(√p)`, `max(|a|,|b|)` | submultiplicative; `|√p| = 1`, `|(√p)²| = |p| < 1`: not power-multiplicative | sound |
| 0.2 end theorem | `σ = 1`; `ℚ_3(√3)`; `S₃` over `ℚ_2` (`T³−2`, `ζ_3` unramified); `𝔽_p((t))`; non-continuous swap of `t₁,t₂` | `σ_jτ(α) = ζ^{j+2}α ≠ ζ^{j+1}α = τσ_j(α)` for all three order-two `σ_j`; joint continuity: `max(|y−a|, 0, |a−x|) < ε`; `|t₁| = 1 ≠ p⁻¹ = |t₂|` | sound; homomorphism, not anti-homomorphism |
| 0.3 anti-isomorphism, stalk colimit | `K=ℚ_3`, `μ_4`; `V = pt ⊔ pt`; purely inseparable `𝔽_2((t))(t^{1/2})` | `μ_4(ℚ_3)` order 2 vs `μ_4(K^sep)` order 4; `σ·(τ·v̄) = v̄∘Spa(τ̂)∘Spa(σ̂) = v̄∘Spa((στ)^)`: left action, as stacks03N1 line 3969 | sound |
| 1.1 composition, degree zero | `μ_n = h_V`; swap on `X ⊔ X`; `S₃` | `a^♮(ζ) = σ(ζ)`; `δ_1 ↦ δ_s ↦ δ_{rs}` for `b^♮∘a^♮`, `δ_{sr}` for the wrong order | sound |
| 1.1 Tor and noncommutative Checks | `Λ=ℤ/4`, `M=N=ℤ/2`; `M_2(𝔽_2)` | `Tor_n = ℤ/2` all `n`; `E_{21}E_{12}e_1 = 0`, `E_{12}E_{21}e_1 = e_1` | sound |
| 1.2 rigid action | `X = Spa(L)`, non-Galois cubic | component `τ ↦ σ⁻¹τ`, indicator `τ ↦ στ`; rank 3, trace 1 at a transposition vs 6, 0 | sound |
| 1.3 (a)–(f) | (f) with `τ ∈ G_K`; Kummer | `Spa(σ̂τ̂⁻¹)` on both sides; `ρ(τ)⁻¹ρ(τστ⁻¹)ρ(τ) = ρ(σ)`; wrong form gives `ρ(τ²στ⁻²)` | sound |
| 1.4 scheme action | `ℝ`, `μ_4`; `𝔽_q`; `𝔽_p(u)(u^{1/p})` | `i ↦ −i`; `ζ ↦ ζ^q`; `k̄[T]/(T−u^{1/p})^p` one point | sound |
| 2.1 / 2.2 discreteness | `⊔_m` with `μ_{ℓ^m}`; `ℚ(2^{1/3})` | stabiliser `ker χ_ℓ` not open; `H⁰(X_L,ℤ) = ℤ, ℤ², ℤ³` for `L = ℚ, ℚ(2^{1/3})`, Galois closure | sound; qc needed |
| 2.3 / 2.4 dictionary | `⊔_m Spa(L_m)`; `ℝ ⊂ ℂ`, `μ_4` | orders of 2 mod 3, 9, 27 are 2, 6, 18; `(ℤ/3)² = 9`; `(a,b) ↦ (b̄, ā)`, `(i,1) ↦ (1,−i)` | sound |
| 2.5 Galois comparison, Hochschild–Serre | `K = C`; `ℚ_3, μ_4`; `ℚ_2, μ_5` | `H²(μ_5) = ℤ/5`; `H²(ℤ/5(−1)) = H⁰(ℤ/5(2))^∨ = 0` since `2² ≢ 1 (5)` | sound |
| 2.6 Frobenius | `𝔽_2`, `ℓ = 7`; `ℙ¹` | `F_{X/k}×id = F_abs ∘ φ_X⁻¹`; `2·4 = 8 ≡ 1 (7)`; `q⁻¹` vs `q` on `ℤ/ℓ^n(−1)` | sound; matches EtaleCohomologyFoundations §F.10.2 Checks (`q`, `q⁻¹`) |
| 3.1 groups, Milnor, derived reduction | mult-by-`ℓ` tower; `⊔_m pt` | `lim = 0`, `lim¹ = ℤ_ℓ/ℤ`; pro-system `ℤ/ℓ^n[ℓ^m]` has transition `ℓ·`, pro-zero, so `Rlim(− ⊗^L ℤ/ℓ^m)` is level `m`; `ℓ∏ℤ_ℓ` not product-open | sound |
| 3.2 continuity | `ℤ_ℓ/ℓ`; `ℤ_ℓ^×` on discrete `ℚ_ℓ` | argument order `ContinuousRep Γ A M` at the pin (ContinuousRep.lean:82) matches `ContinuousRep G_K ℤ_ℓ H` | sound |
| 3.3 rational topology | `A = ℤ_ℓ/ℓ`, `ℤ_ℓ(1)`, `∏ℤ_ℓ`, indiscrete `ℚ_ℓ` | basic family closed under `∩` and `ℓ⁻¹·`; `e_m ∈ ℓΩ` for large `m` so `ℓ⁻¹e_m ∈ Ω ∖ j(A)`; `⋂_σ σΩ` absorbing by compact orbits | sound |
| 4.1 twisting | `ℙ¹`, `n=7`, `ℚ_2`; elliptic curve | `1 = 4·2`; `χ·χ⁻² = χ⁻¹`, values `4` and `2³ ≡ 1` | sound |
| 4.2 proper comparison | `Spec L`; `ℙ¹`; `∅` | `Spa(σ̂)` over `Spec K`; three `H² = ℤ/n(−1)`, `q⁻¹` | sound (see R02, R03) |
| 4.3 (a)–(d) | Enriques; disc over `𝔽_2((t))`; disc with `ℓ = p` | `a_{2r} = a_r²`, `a_{2^k(2m+1)} = c_m`; `|ph|,|h^p| ≤ |p|^{p/(p−1)} < |a|`; `H/ℓH` finite via `H_cont/ℓ ↪ H^i(ℤ/ℓ)`; (d): `H^N(n+1) → H^N(n) → H^{N+1}(ℤ/ℓ) = 0` | sound |
| 4.4 instances | `ℙ^d`; disc | hypotheses of each supplier compared (below); Check at README:528 | R01 |

Checks tested: all 87 Check bullets of the 20 targets, plus the five Examples blocks and the Worked examples; 1 false clause (R01). Every definition has at least three discriminating Checks.

**Pinned declarations: all those the contracts cite (about 45) resolved at the pins** with file and line as cited: `Field.absoluteGaloisGroup` (42), `absoluteGaloisGroup.mapOfAlgebra` (59), `IntermediateField.fixingSubgroup_isOpen` (170), `spectralNorm` (381), `spectralNorm_eq_of_equiv` (451), `spectralNorm_extends` (573), `spectralNorm_unique` (699), `spectralNorm.normedField` (755), `.normedAlgebra` (809), `Completion.ext` (414), `.map` (477), `.map_unique` (491), `.map_id` (496), `.map_comp` (506), `instField` (148), Completion.lean instances (82, 86), `NormedField.instCompletableTopField` (24), `IsAlgClosed.of_denseRange` (46, with `CharZero`), `exists_roots_norm_sub_lt_of_norm_coeff_sub_lt` (52), `ContinuousAlgEquiv` (45), `SeparableClosure` (348), `TopRep` (31), `TopRepEquivActionTop` (212), `continuousSMul_iff_stabilizer_isOpen` (299), `smallEtaleTopology` (50), `Sheaf.H` (57), `H.map` (112), `PadicAlgCl`, `PadicComplex`, `Scheme.EllAdicCohomology`; Tau Ceti `absoluteGaloisGroupRestrictEquiv` (340), `CompactSpace (Field.absoluteGaloisGroup K)` (374), `Sheaf.H.pullback` (69) with `pullback_naturality`, `pullback_id`, `pullback_comp_apply`, `pullback_δ`, `continuousLocalCyclotomicCharacter` (54), `IsArithFrobeniusLift.coe_localCyclotomicCharacter` (61, hypothesis `p.Coprime (ringChar 𝓀[K])`), `PadicTateTwist` (88), `Module.Finite.of_quotient_smul_top` (164; `[CommRing R] [CompactSpace R] [CompactSpace M] [T2Space M]`, `I.FG`, topologically nilpotent), `ContinuousRep` (82), `toContRepresentation` (150), `isMittagLeffler_of_surjective` (104), `subsingleton_limOne_of_isMittagLeffler` (191). The 15 leads of `scratch/citations.md` are supplier-roadmap names, each found in its roadmap.

**Sibling citations: every cited section and name (about 45 sections, 40 slugs or names) checked** against main or the supplier's open head: every cited section heading and every cited slug or declaration name exists where cited (AdicEtaleGeometry A1.1, A1.6, A1.7, A1.14 with their six slugs and five `AdicSpace.*` names; AdicSpacesPartII R0.6, R0.7, R1.1, R1.2, R1.7 with slugs; AdicSpacesPartIV *proetale-site-functoriality*; ClassicalAdicEtaleCohomology §§1.1, 1.3, 1.4, 1.5, 7.1, 8.2, 8.4, 9.7, 11.1; SchemeAndStackFoundations §§0.23a, 1.10, 2.1, 2.2, 2.15, 2.16 with twelve names; EtaleCohomologyFoundations §§F.0.3, F.0.4, F.1, F.2.1, F.3.0, F.3, F.4.0, F.4.1, F.4.6, F.10.2, F.10.2b with eight names; ProfiniteCohomology Layers 0, 1, 10, §§10.3, 10.4; EnhancedDerivedSheaves §§0.1–0.4 with five names; DerivedModuleAlgebra §1.T.1; ArithmeticGaloisRepresentations §§1.1, 1.2, *TateTwist.zlOne* (`ζ ↦ ζ^{χ_ℓ(σ)}`, same convention); AInfCohomology §AI.3.1 `AInf.primitive_mod_p_comparison`; PadicDifferentialEquationsAndRigidCohomology §RD.0.33; PadicPeriodRings §1.1 `completedGaloisAction`, §2 PadicFieldCompletion; DiamondsAndVStacks §D6.7; PadicHodgeTheory §2.7). Hypotheses compared where the README restates them: §9.7 (smooth proper over algebraically closed `C`, `n` invertible in `𝒪_C`; trace for `n` invertible in `K`), §8.4 (proper, every `ℤ/n`-module, no invertibility), A1.14 (qcqs, separable algebraic `L/K`), §1.3 (`Ẑ_p` over `Spa(ℚ_p, ℤ_p)`), §AI.3.1 (finite, vanishing above `2 dim X`), §RD.0.33 (every characteristic), §F.3.0 (orders invertible in `k`). ClassicalAdicEtaleCohomology §1.1 lists `H^n(Spa(K,𝒪_K), F) ≅ H^n_cont` among its Checks and in a closing remark, with no proof route, as README:20 says.

**Locators verified: every line locator into the nine cached texts (about 40)**: dejongvanderput1996 lines 1159 (p. 28), 1201 (p. 29), 1477, 1479, 1481–1488, 1571, 1594–1606; stacks03N1 lines 3733, 3745, 3746, 3963, 3966, 3969, 4216, 4229, 4241; stacks01FQ lines 1451 (page 33), 1515, 1525 (page 35); milneLEC lines 3237 (p. 81), 3834–3866 (pp. 96–97), 3940 (p. 99), 4133 (p. 105), 4534 (p. 116), 4783 (p. 123), 4860 (p. 125); zavyalov2025 lines 3798, 3800 (p. 78); hansenzavyalov2023 lines 1684, 1706, 1708 (p. 39); huber2007 lines 953, 963 (printed p. 996); berkovich1993 lines 4584 (printed p. 128), 5110 (p. 143), 5339 (p. 150); scholze2013 line 1279 (p. 28). Each supports the statement it is cited for at the README's hypotheses.

**Ownership against open work.** Searched by object (`Aut_cont(C/K)`, completed algebraic closure with Galois action, completion of `AlgebraicClosure`) on main and at the 440 open heads: PadicPeriodRings §1.1 (`ℚ_p`-automorphisms of `PadicAlgCl p`) and §2 are the narrower cases README:17 names; no other owner of the general identification, of `ρ`, or of §§2–3. The one overlap found is R03. `scratch/overlaps.md`: no second copy, no dropped id.

## Not verifiable

- huber1996 (Proposition 2.3.10, Corollary 2.4.6, Corollary 2.8.3, Theorem 3.7.2, Proposition 6.1.1), huber1994 §§1–3, sga4half, serreGC1997: recorded as uncertified; cited by locator only. Corollary 2.8.3 and Proposition 2.3.10 are attested second-hand by hansenzavyalov2023 line 1708 and zavyalov2025 line 3799.
- §2.6: that the finite level of EtaleCohomologyFoundations §F.4.6's action is `ρ` cannot be checked against §F.4.6, which describes its action only as "semilinear arithmetic descent"; the Frobenius normalisation was checked against §F.10.2's Checks.
- §2.5: agreement "from `E_2` on" with ClassicalAdicEtaleCohomology §1.3 (b) depends on that section's hypothesis (★), read only through the README's restatement.
- No Lean was elaborated in this pass (read-only); signatures were compared with `scratch/signatures.md`.

## Source issues

- **Gap** in dejongvanderput1996 at Corollary 3.7.5, page 39: the source says the spectral sequence holds for every abelian sheaf, but its proof identifies the Galois module with the stalk of the direct image only for overconvergent sheaves; it should treat arbitrary sheaves or restrict the statement; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d3349976f751079728304bbd7b02bbc98c4a89ea", "job": "RT-GaloisActionOnEtaleCohomology~1a", "model": "fable", "worker": "chris-x19"} -->
