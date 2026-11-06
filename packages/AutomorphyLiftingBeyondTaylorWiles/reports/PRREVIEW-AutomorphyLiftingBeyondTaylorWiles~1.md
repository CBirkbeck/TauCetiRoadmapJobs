# Review of AutomorphyLiftingBeyondTaylorWiles (pull request #1824 at 1583602)

**Verdict:** accepted

No finding. The gate passes, the dependency check reports no problem, every cross-roadmap citation and every library declaration named in the supplier contracts resolves at the cited head or pin, the seeded source sample verifies against CG18, CGH20 and KT17 at the cited lines and printed pages, and the adversarial pass (table below) refuted nothing. `Suggested.lean` declares nothing, and I agree that none of the nine headline theorems its docstring lists is statable at the pins; the file elaborates with no output (empty, so the `#check @name` pass has nothing to compare).

## Verified sound

### Gate and dependency direction

Re-run on the head:

```text
gate AutomorphyLiftingBeyondTaylorWiles: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 240 roadmaps, 2309 edges, 0 problem(s)
```

The diff outside `TauCetiRoadmap/AutomorphyLiftingBeyondTaylorWiles` against `origin/main` is empty. `lake env lean` on `Suggested.lean` exits 0 with no output. Policy scan of the README (process words, LaTeX delimiters, pull-request numbers): nothing found.

### Declared gaps

The eleven `gap:` slugs in the README's `## Exact supplier contracts` are exactly the eleven entries of `design/plan.json` (same slug, same supplier, same section): localized-orbifold-range-duality (ALS ALS.5a.6), localized-orbifold-perfect-models (ALS ALS.1.6), congruence-character-localized-h1 (ALS ALS.4.9–4.12), simultaneous-orbifold-hecke-finiteness (IHGD 2.1), big-image-rank-n-taylor-wiles (GGD 5.6–5.8), cht-big-image (AGR 7.7–7.12), character-ring-completed-products (DDPA 4.6, 6.7–6.8), paired-cohomology-action-patching (DDPA 8.6), proper-support-boundary-or-residual (AST 5.12–5.14), nonsemisimple-two-scalar-taylor-wiles (LGDR 2.16), tame-place-fixed-exponent-descent (CCPII 6.2). Each `needs` sentence is a single statement with its hypotheses. Minimality checked against the supplier: AGR §7.9 defines adequacy (any eigenvalue projector), not the CHT big condition (simple root), so cht-big-image asks for something not provided; LGDR §2.16 assumes semisimple residual Frobenius, so the nonsemisimple gap is new; CCPII §3.8 assumes neat tame levels and pro-order invertible in O, and §6.2 is the p-level case, so the tame-place gap is new; ALS.1.6 requires trivial cell stabilizers (neat levels), ALS.5a.6 requires |K/K′| invertible, so the two localized orbifold gaps are new; AST §5.13 says the isobaric realization may be Eisenstein and does not place proper-support eigensystems on the boundary; DDPA §8.6 is a single-datum construction; DDPA §4.6 handles pointed O-flat domains, not the literal p-torsion quotients of LGDR §2.15; GGD §5.6–5.8 do not state the rank-n big-image selection with the simple Frobenius line; IHGD §2.1 gives finiteness of one derived Hecke image, not the simultaneous image over a finite family of orbifold levels and all finite coefficients.

### Cross-roadmap citations resolved (heads given by the brief)

Every cited section heading exists at the cited head or on main, and its content matches what is consumed:

- ArithmeticLocallySymmetricSpaces (open head): ALS.0.4 (connected variant `K_∞°` in its Conventions), ALS.0.7, ALS.0.10 (its (iii) is the line-stabilizer `K_0(v)` normalized as `(1 ∗; 0 GL_{n−1})`, as in CG18 line 4599), ALS.1.1, 1.2, 1.5, 1.6, 1.7, 1.8, 2.2, 2.4, 3.3, 3.5, 3.6, 3.8, 3.9, 3.14 (Gram matrix `(N(x)+1, T_x; T_x, N(x)+1)`, determinant `(N(x)+1)² − T_x²`, and `U_x` with polynomial `X² − T_xX + N(x)`, as the README says), 4.1, 4.9, 4.12, 5a.2, 5a.4 (`𝔪 ↦ 𝔪^∨ = ι(𝔪)`, as cited in §0.5), 5a.6, 5b.4, 5b.5, 5b.6, 5b.8 (stated for imaginary CM fields only, as the Scope says), 6.1, 6.2, 6.3.
- IntegralHeckeAndGaloisDeterminants: §§1.2, 1.3, 2.1, 2.2 (finite local factors and specified idempotent summands), 2.3 (factorial powers converge to the local-factor idempotent; the telescope is a separate construction), 3a.1 (`P(X) = Σ (−1)^i q^{i(i−1)/2} T_i X^{n−i}`), 3b.1, 3b.2.
- LocalGaloisDeformationRings: F.1, F.2.6, F.2.7, F.2.9, F.3.1, 1.6 (jump `i` has weight `−i`: its own Check reads `O ⊕ O(ε⁻¹)` has jumps {0,1}), 1.10, 1.13, 2.8, 2.10, 2.15 (literal equation quotient `Rχ`, `Rχ/ϖ = R₁/ϖ`, components of char-0 generic points, unique generic generalisation; the reduced flat closure is a separate ring), 2.16 (semisimple, two scalars, `dim L − h⁰ = 1`), 2.21, 2.23 (unramified complement), 2.26.
- GlobalGaloisDeformations: 3.3–3.7, 4.3, 4.4, 5.1, 5.5 (`deltaAlgebraMap` sends a group element to its selected inertia character), 5.6–5.8, 7.2 (`n²|T| − 1` frame variables for nonempty `T`), 7.3, 7.4.
- DeformationAndDerivedPatchingAlgebra: 1.12, 3.1–3.4, 3.10, 4.6, 6.1 (near faithfulness = full support for finite modules), 6.2, 6.4, 6.5, 6.7 (lifting of near faithfulness from `M/πM` under catenarity, equidimensionality, π avoiding generic primes and the unique-component condition; checked that generic reducedness of `A/π` is not among the hypotheses of that sentence, and the argument via height-one primes does not need it), 6.8, 7.3 (minimal representatives with `rank C^i = dim H^i(C ⊗ k)`), 7.6, 8.6 (cohomology-action variant with `n ≤ M` at cutoff, matching the README's `1 ≤ s ≤ M`), 9.1, 9.2.
- ArithmeticGaloisDuality: R02.5.1, R02.5.2 (`−(r₁ + r₂ − 1)` with unramified conditions at every finite place including `p`), R02.6.1 (its "Archimedean adjoint dimensions" paragraph is rank `n` over a number field: `Σ_{v|∞} h⁰(G_v, ad⁰) = [F:ℚ]n(n−1)/2 + l₀` under balancedness), R02.6.2.
- ArithmeticGaloisRepresentations: 7.2, 7.4 (`GaloisRep.IsBalancedAt`, with the trace criterion failing exactly for `ℓ = n + 1`, `n` even, as the README's (f) says), 7.7–7.12.
- SmoothRepresentationsOfLocalGroups SR.5.3 (items "The distinct-eigenvalue local block" and "Derived hyperspecial–parahoric comparison" exist by name); KTheoryLowDegrees §11.6; PadicHodgeTheory §§6.1–6.2 (jump `i` ↔ weight `−i` covariantly, `+i` contravariantly); AdelicAlgebraicGroups §4.2 and §5.1 (logarithmic torus of dimension `r₁ + r₂ − 1`, `K_∞ ≅ (S¹)^{r₂}`); AutomorphicFormsOnReductiveGroups §5.3 (the two displayed PGLₙ formulas) and §5.5; AutomorphicSpectralTheory §§4.14a, 5.12–5.14; CompletedCohomologyPartII §§0.1, 0.3, 1.1, 3.8, 6.2; ModularCurvesPartII §§15.2, 15.4, 15.8; ModularityAndLanglandsExtensions §§2.7–2.8; PotentialAutomorphyInfrastructure Layers 3–5; GL2ModularityLifting §5.8; AlgebraicModularFormsAndSerreWeights §2.12; PotentialModularityAndCompatibleSystems §8.8; AutomorphicBundlesPartII §1.4 and Layer 2.
- On main: ReductiveGroupsPartII RG2.2.4 (the item "Ihara's theorem: `SL_2` as an amalgam" is inside RG2.2.4, lines 3698–3714 of that README, with `BTTree.ihara`); FreeGroupsAndLimitGroups §4.5 (segment graph of groups = `Monoid.PushoutI`) and §4.8; DerivedModuleAlgebra §1.E.0 (perfect complexes, retracts, shifts, derived scalar change); ClassFieldTheory (Layers 7 and 11 are named in its build plan); Completed/Chebotarev Layer 10.

Ownership against open work: `roadmaps grep` for Lemma 9.6, Theorem 9.19, the numerical coincidence, Ihara avoidance and the paper title finds only ModularityAndLanglandsExtensions §§2.7–2.8 (the GLₙ Conjecture B and the conditional endpoint, which this roadmap imports and varies as declared in its Scope: Res PGLₙ, the simultaneous image over all intermediate covers and finite coefficients, and the inertia–diamond clause (6)) and ModularCurvesPartII §15.8 (the F = ℚ specialization). The Scope's claim that MLE §2.8 names Theorem 9.19 in its proof route without a separate target is correct (its §2.8 says the arithmetic verifications are owned there, but states no target for them). I accept the kept-variant reading because the variant adds a hypothesis that the CG18 proof route actually uses: Definition 9.1 puts the diamond operators (`T_{α,1}` with `α` a unit at `Q`) inside `T^an_{Q,ψ}`, and the surjection `R_{S_Q} ↠ T^an` asserted after Conjecture B(5) needs the diamond–inertia identification that clause (6) supplies (see Source issues). No open pull request builds Lemma 9.6 over a general number field, the corrected Lemma 8.2, Proposition 8.5, or the two-datum verification.

One cross-roadmap remark that is not a finding here: ModularCurvesPartII §15.8 states that the normalized operator for `diag(p, p⁻¹)` acts as the identity on the amalgam terms, following CG18 p. 418, whereas §§3.3–3.4 here compute the unnormalized value 1 and the normalized value `q⁻²`. The computation here is the correct one (see the table and Source issues); both values are ≡ 1 mod `p`, so both roadmaps reach the same localized isomorphism. The README does not cite §15.8 for the value and its §3.3 Check pins the correct one, so the discrepancy belongs to ModularCurvesPartII.

### Library declarations at the pins (Mathlib f6090c7, Tau Ceti 358314d)

- `Field.absoluteGaloisGroup`, `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42`.
- `Representation`, `Mathlib/RepresentationTheory/Basic.lean` (algebraic, no continuity).
- `IsHeckeTriple` (`Mathlib/NumberTheory/HeckeRing/Defs.lean:75`), `HeckeCoset` (`:157`), `HeckeRing` (named at `:42`).
- `Module.support_eq_zeroLocus`, `Mathlib/RingTheory/Support.lean:216` (finite module hypothesis).
- `Monoid.PushoutI`, `Mathlib/GroupTheory/PushoutI.lean:60`.
- `groupCohomology.coindIso`, `Mathlib/RepresentationTheory/Homological/GroupCohomology/Shapiro.lean:58`: `groupCohomology (coind S.subtype A) n ≅ groupCohomology A n`, no index or finiteness hypothesis, as the README says.
- `TauCeti.MonoidAlgebra.augmentation`, `TauCeti/Algebra/MonoidAlgebra/Exactness.lean` (named in its module docstring at line 35).

### Source sample (every target of the seeded sample, plus the headline locators)

All three sources were readable from the cache (CG18 author's published-layout copy, CGH20 arXiv v1, KT17 arXiv v2). CG18 printed page = marker page + 296; every published page the README gives was recomputed from the marker and agrees (Thm 5.16 p. 383, §8.5 p. 406, §8.5.1 and Lemma 8.2 p. 407, Lemma 8.3 p. 409, Prop 8.4 and 8.5 p. 410, §9.1 p. 411, §9.2 p. 412, Def 9.1 p. 413, Conj B p. 414, Remark 9.3 p. 415, Remark 9.5 and Lemma 9.6 p. 416, its proof pp. 417–418, §9.4 p. 419, Thm 9.16 p. 422, §9.5 pp. 424–425, Thm 9.19 p. 426, its proof pp. 426–428, §§6.1 and 7.1 pp. 386–391 and 391–395, §8.2 p. 401, §8.4 p. 405).

| Target | Source locator | Found |
|---|---|---|
| 0.1 local systems O(ψ) | CG18 §9.1 lines 4588–4627, p. 411–412 | Y(K) = G(ℚ)\G(𝔸)/K⁰_∞K; ψ_v : Iw(v)/Iw₁(v) ≅ (k_v^×)^n/k_v^× → 1+𝔪_O; sections f(γu) = ψ(γ)f(u) on the Iw₁ cover; as restated |
| 0.3 T^an and T_{Q,ψ} | Def 9.1, Remark 9.2, lines 4650–4672, p. 413 | T^an on ⊕_{k,n} H^k_ψ(Y₁(Q), O/ϖⁿ) generated by T_{α,k}, α units at S_Q; T_{Q,ψ} adds α nontrivial at Q; Remark 9.2 is the reason for finite coefficients. The README's extension to all intermediate levels is declared as a kept variant and is what §9.5 line 5211 uses |
| 1.2 R^1_loc, R^χ_loc | §8.5.1 lines 4422–4439, p. 407 | R_v framed Fontaine–Laffaille with det ξ, dim n²−1+[F_v:ℚ_p]n(n−1)/2; R^1_v and R^χ_v are the literal character-polynomial quotients; completed tensor products as restated |
| 1.7 lifts of type S | Thm 5.16(1),(2),(6),(7), lines 3497–3515, p. 383; §9.5 line 5105 | crystalline, weights 0..n−1 each once, unipotent inertia at ramified x, det ε^{n(n−1)/2}; as restated with the Fontaine–Laffaille lattice argument |
| 2.3 B(4) | Conj B(4)(a)–(b), lines 4706–4709, p. 414 | vanishing outside [q₀, q₀+l₀] and boundary vanishing for all i; restated at every intermediate level (declared variant) |
| 2.5 hypothesis bundle | Conj B lines 4684–4728, pp. 414–415; CGH20 lines 84–93 | the four clause groups; CGH20 Thm 1.2 assumes "all of Conjecture B except (4)", as the README says of its B^van-free conjunction |
| 2.7 R_{S_Q} ↠ T^an as O[Δ_Q]-algebras | line 4722–4728, p. 415 | source asserts the surjection from (1)–(3) and determinant; the README adds clause (6) for Δ_Q-linearity (see Source issues) |
| 3.3 squared operator | lines 4843–4874, p. 418; Remark 9.7 line 4875 | U_{x²} = N(x)⁻² times the double coset of diag(π²,1) ~ diag(π,π⁻¹); the value on the amalgam term is corrected here (table row and Source issues) |
| 3.5 Lemma 9.6 | lines 4782–4874, pp. 416–418 | statement n = 2, condition (5) for all Taylor–Wiles primes; proof via φ^∨∘φ, Γ¹, Lyndon sequence, localization at m̃ = (m, U_x − α_x) and the two projectors; as restated, with the determinant-kernel repair and the all-component extension declared |
| 3.6 §9.4 | lines 4897–5104, pp. 419–424; Thm 9.16 line 5027, p. 422; CGH20 Thm 3.2 line 210 | GLₙ, enormous image, distinct eigenvalues; two spectral sequences and ι_* an isomorphism by Thm 9.16; the README states it conditionally on the block hypothesis, as the source's "informal approach" (line 4898) |
| 5.4 Thm 9.19 | lines 5111–5228, pp. 425–428 | statement at 5166: H^{q₀}(Y, K/O)^∨_m nearly faithful over R_S; the proof data at 5168–5224 are the README's §§4.1–4.4, 5.1 |
| 5.6 cuspidal recognition | Thm 5.16 line 3526, p. 384; B(4)(b) line 4706; CGH20 Lemma 3.1 proof lines 191–207 | conclusion "regular algebraic cusp form with L(r,s) = L(π,s)"; the isobaric realization and non-temperedness argument of CGH20 is the route restated, with the residual case excluded by bigness instead of strong multiplicity one |
| 5.7 m from (8) | Thm 5.16(8)(a)–(b), lines 3516–3525, pp. 383–384; §9.5 line 5111 | (a) cuspidal π₀ with r_p(π₀) ≡ r̄; (b) Serre modular of minimal level; the README replaces the existence of r_p(π₀) by the eigenvalue congruence (its Check notes this) |
| 5.8 support-to-eigenclass | Thm 5.16 line 3497, p. 383 and §9.5 lines 5166–5228 | the source deduces 5.16 from 9.19 "immediately" (line 3528); the README spells out the fibre argument and restricts to R_triv ⊔ R_reg, narrower than 5.16(6), as it says |
| 5.10 defect zero | §8.1 line 4167, p. 401; §8.4 line 4339, p. 405 | l₀ = r₁(rank SLₙ(ℝ) − rank SOₙ) + r₂(n−1) gives 0 for totally real F and n = 2 |
| 1.1, 1.3, 1.6 (headlines) | §8.5 line 4395 p. 406; Lemma 8.2 line 4440 p. 407; Prop 8.5 line 4543 p. 410 | CGH20 lines 76–80 (single unipotent block, no norm congruence) and 287–300 (R^1_v at bad places) support the R_reg conventions |
| 0.2, 0.4, 0.5, 0.6, 1.4, 1.5, 1.8, 2.1, 2.2, 2.4, 2.6, 2.8, 4.1–4.4, 5.1–5.3, 5.5, 5.9 | lines 4628, 3926–3962, 4764, 3497, 4461–4489, 4494–4539, 4197–4330, 4684, 3156, 4710, 4741–4743, 4744–4754, 3819–3925 and 5125–5154, 5168–5224, 3607–3778, 3728, 192–225 and 3324 | each statement found at the cited line and page; KT17 Lemma 6.25(4) at line 1904 (p. 41) and its proof at lines 1931–1935 (p. 42) are as cited in §3.7 |

### Adversarial pass

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions (d, q₀, ℓ₀) | F = ℚ, n=2; imaginary quadratic; real quadratic; n=3, F=ℚ; CM quartic, n=2 | (2,1,0); (3,1,1); d = 2(3−1) = 4, ℓ₀ = 0, q₀ = 2; d = 5, ℓ₀ = 1, q₀ = 2; d = 6, ℓ₀ = 2, q₀ = 2 | all agree with the README Checks and §2.8 |
| Conventions: Hecke polynomial direction | n=2, N(v)=7, trace 3 | X² − 3X + 7; geometric Frobenius would give trace 3/7, det 1/7 | agrees |
| Conventions: balanced oddness vs trace | identity in char 3, n = 2; general n even, p = n+1 | eigenspaces (2,0), trace 2 ≡ −1; |a−b| ≥ 2 with a−b ≡ 0,±1 mod p and p > n forces (a,b) = (n,0), trace n ≡ −1 iff p = n+1 | the stated exception "n even and p = n+1" is exactly right; AGR §7.4 states the same exception |
| 0.2 deck coordinate det(B)a^{1−n} | n=3, scaling by c; diag(u,1,1), diag(u,u,1), diag(u,u,u); u of order 5 | c²c⁻² = 1; u⁻², u⁻¹, 1 = (u³, u⁴, 1); det(B) alone gives (1,u,u²); det(g) gives (u,u²,u³) | matches the Check; L_{Q,v} = (1 ∗; 0 SL_{n−1}) at CG18 line 4603 is exactly det(B)a^{1−n} ≡ 1 |
| 0.2 T_{α,k} = ⟨α^{k−n}⟩ | general k; k = n−1 | a = α, det B = α^{k−1}, class α^{k−1}α^{1−n} = α^{k−n}; ⟨α⁻¹⟩ | agrees |
| 0.2 PGL₃ direction check | p=5, q=2, Satake roots (2,3,1/6) | T₁ = 2·31/6 = 31/3, T₂ = 2·41/6 = 41/3; e₁(4,6,1/3) = 31/3, e₂ = 82/3, e₃ = 8; inverse cosets: 41/3, 62/3; mod 25 with 3⁻¹ = 17: (1,23,19,17) vs (1,3,4,17); mod 5 both (1,3,4,2) | all values as stated |
| 0.2 C₃ model | r_g(i) = i+1, f = δ₀ | r_g^*f = (0,0,1); (r_g)_*f = (0,1,0) | agrees; §0.5 pairing ⟨r_g^*f, e₂⟩ = 1 = ⟨f, (r_g)_*e₂⟩ and standard action gives 0 |
| 0.3 m^abs maximal; m^Q maximal or unit; p-power diamonds | T^an = O[C₅], p = 5; T^an = O × O, d = (1,−1) | k[u]/(u⁵) not a field; m^Q = (ϖ, d−1); (⟨δ⟩−1)^{p^N} = 0 in char p; for O × O both maximal ideals contract to (ϖ), and (ϖ, d−1) ∋ (0,−2)·(0,−2)⁻¹ = (0,1) so m^Q = (ϖ) × O | agrees |
| 0.3 level one over ℚ | n=2, R=Q=∅, p>3 | H¹(C₂ ∗ C₃, O/ϖᵃ) = 0 by Mayer–Vietoris (M⊕M → M, (a,b) ↦ a−b surjective); T_{λ,1} = 1 + λ | agrees; §2.3 Check: with p = 3, Hⁱ(C₂ ∗ C₃, 𝔽₃) = Hⁱ(C₃, 𝔽₃) = 𝔽₃ for all i ≥ 1 |
| 0.3 complex O --ϖ→ O | coefficient O/ϖᵃ | H⁰ = ϖ^{a−1}O/ϖᵃ ≅ k for every a ≥ 1 | agrees |
| 0.4 projector | n=2, p=7, roots 2,4; V = 1 on a third line | 2·4 = 8 ≡ 1; (2−4)^{k!} → 1, 0^{k!} = 0; (1−4)^{k!} = (−3)^{k!} → 1 | agrees with the Layer 0 Example; double root kills the α-part |
| 0.5 (1) residual triviality | O = ℤ₃[ζ₃], χ(g) = ζ₃; C₂ with −1 over 𝔽₃ | ζ₃ ∈ 1 + (ζ₃ − 1); H⁰(C₂, 𝔽₃(−1)) = {x : −x = x} = 0 ≠ 𝔽₃ | agrees |
| 0.5 (3) duality without boundary vanishing | O/ϖᵃ self-injective | Hom(P ⊗_Γ M, O/ϖᵃ) ≅ Hom_Γ(P, Hom(M, O/ϖᵃ)); exactness of Hom(−, O/ϖᵃ) commutes with cohomology | sound; the transpose of pullback–translate–trace is transfer–translate⁻¹–pushforward, i.e. T_H(g⁻¹) |
| 1.1 (f) exception; (b)/(c)/(d) | E[p] with multiplicative reduction, p ∤ v(Δ); unramified nonscalar Frobenius | r̄(σ_v) ~ (1 1; 0 1), in R_reg with no norm condition; neither in R_triv nor R_reg | agrees |
| 1.2 Check: p-torsion in R^1_v (n=2, v ∈ R_triv) | A = O⟦X⟧[α]/(α², (q−1)α), Φ = diag(1+X, q/(1+X)), Σ = diag(1+α, 1−α) | det Φ = q = ξ(φ_v), det Σ = 1 − α² = 1, tr Σ = 2, (1+α)^q = 1 + qα = 1 + α; so an A-point. Cayley–Hamilton gives Σ^q = 1 + q(Σ−1), hence (q−1)·tr(Φ(Σ−1)) = 0 in R^1_v; image in A is α((1+X) − q(1+X)⁻¹) ≡ α(2X + X²)/(1+X) mod (q−1), nonzero | the Check is right: R^1_v has nonzero p-power torsion; CG18 Lemma 8.2(1) is false as stated (Source issues) |
| 1.2 Check: q = 7, O = ℤ₃ | A = O⟦X⟧[a]/(a², 6a) | Σ⁷ = diag(1+7a, 1−7a) = diag(1+a, 1−a); 6·tr = 0; mod 3: a(2X+X²)/(1+X) ≠ 0 | agrees |
| 1.2 Check: weights and duality | n=2, F_v = ℚ₅, O ⊕ O(ε) | weights {0,1}, det ε = ξ; dual O ⊕ O(ε⁻¹) has jumps {0,1} in LGDR §1.6 (its own Check); ε⁻¹ mod 5 = ω³ | agrees with LGDR §1.6 and PHT §6.1 |
| 1.3 (1) dimension | general | Σ_{v|p}(n²−1+[F_v:ℚ_p]n(n−1)/2) + |R|(n²−1) + 1 = 1 + |T|(n²−1) + [F:ℚ]n(n−1)/2 | agrees with CG18 line 4442 |
| 1.4 Δ_Q-structure | n=3, p=5, Δ = C₅; n = 2 | 1−n = −2 ≡ 3, inverse 2; deck class of diag(d,1,1) is d³ ↦ θ(d⁶) = θ(d); direct θ(d³) wrong; n = 2: b_x = −1, diag(u,1) has class u⁻¹ ↦ θ(u) | agrees; consistent with clause (6) (T_{α,1} = ⟨α^{1−n}⟩ ↦ θ(α)) and with GGD §5.5 |
| 1.4 η determined by θ | θη^{n−1} = 1 in 1+𝔪_O | p ∤ n−1 since p > n, unique (n−1)-th roots in a pro-p group | sound |
| 1.4 local Checks | 𝔽₇, Φ = diag(4, J₂(3)); rank 2, p=5, N(x)=11 | det 4·9 = 36 ≡ 1; centralizer dim 3, h⁰(ad⁰) = 2, unramified tangent 2 + 1 scalar = dim L = 3, so dim L − h⁰ = 1; diag(1+ε, 1−ε) det 1 | agrees with gap:nonsemisimple-two-scalar-taylor-wiles and LGDR §2.16 |
| 1.5 (1), (3) | |T| = 1, 2; T = ∅; n = 1 | 3, 7; −1 excluded; ad⁰ = 0 gives 0 = 0 | agrees |
| 1.6 count g and dim R_∞ | imaginary quadratic n=2; totally real n=2; |T|=1, q=3; q=0 | g = q+|T|−4; g = q+|T|−1−[F:ℚ]; g = 0, j = 3, dim = 1+3+3−1 = 6 = dim R_loc = 1+3+2; g = −3 | agrees; archimedean sum: complex place n²−1 = 2·n(n−1)/2 + (n−1); real balanced place a²+b²−1 = n(n−1)/2 + ⌊(n−1)/2⌋ for n even and odd (both checked) |
| 1.8 GL₁ | F = ℚ(i); real quadratic with fundamental unit of norm −1 | ℂ^×/(S¹ℝ⁺μ₄) a point; without S¹ a circle; (ℝ^×)²/ℝ⁺ identity component {(x,x⁻¹)}, ε² acts by shift 2 log ε since ε′² = ε⁻²; Greenberg–Wiles: 1 − 0 + 0 − (r₁+r₂) = −(r₁+r₂−1) | agrees with R02.5.2 and AAG §5.1 |
| 2.1 Check: rescaled operators | n=2, norm 2, char 7 | det would be N^{n(n−3)/2} = N⁻¹ ≡ 4 instead of 2 | agrees |
| 2.3 orbifold degrees | p = 3, PSL₂(ℤ) ≅ C₂ ∗ C₃; imaginary quadratic with a C₃ stabilizer | Hⁱ = 𝔽₃ for every i ≥ 1; H⁴(C₃, 𝔽₃) = 𝔽₃ | agrees; the range gap is genuinely needed above dim Y |
| 2.6 dévissage | C = [O --ϖ²→ O] | length of H⁰(C ⊗ O/ϖᵃ) = min(a,2) ≤ a·1 | agrees |
| 2.8 excluded degrees; orientability | PGL₃/ℚ; CM quartic PGL₂ | {0,1,4,5}; {0,1,5,6}; PGL₃(ℝ) ≅ SL₃(ℝ) connected, PGL₂(ℂ) connected | agrees |
| 3.1 determinant kernel vs CG18's Γ ∩ PSL₂(O_F) | Γ = hPSL₂(ℤ)h⁻¹, h = diag(2,1), A = (1,2;0,1), γ = (1,0;1/2,1); F = ℚ(√3), u = 2+√3 | γAγ⁻¹ = (0,2;−1/2,2) ∉ PSL₂(ℤ), index 3, not normal; (1+√3)² = 2u, 2 not a square in ℚ(√3), u totally positive, so Φ ≠ 1 | the repair is needed and right (Source issues); H²(PSL₂(ℤ),𝔽₃) = 𝔽₃ with inversion acting by −1 on H²(C₃), invariants 0 |
| 3.2 nonprincipal example | ℚ(√−5), x = (7, 3+√−5), p = 3 | N(3+√−5) = 14, (7) splits since 3² ≡ 2 ≡ −5 mod 7; a² + 5b² = 7 impossible; roots ±i in 𝔽₉, product 1, squares 2; index q+1 = 8 | agrees |
| 3.2 transitivity | H_a¹ ⊂ PSL₂(F), edge stabilizer open | strong approximation (AAG §4.2) gives density in SL₂(F_x); PSL₂(F_x)·N(Iw) = PGL₂(F_x) since N(Iw) contains (0,1;ϖ,0) | one-edge quotient sound |
| 3.3/3.4 amalgam value of U_{x²} | tree of valence q+1, e: v₁ → v₀, degree-0 trivial coefficients | q² forward terminal edges; Σw₂ = A₂(v₀) − A₁(v₁) + v₀, Σw₁ = q(A₁(v₀) − v₁); ∂F(e) = F(v₀) − F(v₁) with F(v₁) = A₁(v₁) − qv₁, F(v₀) = A₂(v₀) − qA₁(v₀) + v₀; augmentations q+1−q = 1 and q(q+1) − q(q+1) + 1 = 1; on M ⊕ M the induced map is ((q²+q+1)m₀ − (q²+q)m₁, (q+1)m₀ − qm₁), whose difference is q²(m₀ − m₁) and whose diagonal value is (m,m); F_v is unique given F_e since C₀ has no nonzero G-invariant finite chains | the unnormalized operator on H^*(H_a¹, M) is 1, the normalized one q⁻²; q = 7 mod 9: q² = 4, q⁻² = 7, 4·7 = 1. CG18 p. 418 states N(x)² and 1 instead (Source issues); harmless since q² ≡ 1 mod p |
| 3.3 Check | q = 7, ℤ/9; roots ±i at p = 3 | q⁻² = 7 ≠ 1; α² − 1 = 1 | agrees |
| 3.5 Gram determinant and roots | p=7, N(x)=29, roots 2,4; roots 1,1 | 2·4 = 8 ≡ 1, trace 6, 4 − 36 ≡ 3 = −(2−4)²; α² − 1 = 3; roots 1,1: 0 and 0 | agrees |
| 3.5 other maximal ideals above m^abs | m′ ≠ m with the same m^abs | T = T_{∅,ψ} contains T_x, so m′ differs only in T_x mod m′; old roots γ, γ⁻¹ with γ + γ⁻¹ ≠ α + α⁻¹, so neither is α; the m̃-part of W is killed | sound |
| 3.7 Check | Q = {x,y}; n=3, p=7, roots 1,2,4 | four block conditions; 1·2·4 = 8 ≡ 1, distinct; Q(1) = 0 for 1,1,1 | agrees |
| 4.1 telescope vs idempotent | C = O[0], t = ϖ; C = O²[0], t = diag(1,ϖ) | colim = E, not finite; e = 0; colim = O ⊕ E, e = diag(1,0) | CG18 Lemma 7.3 is wrong as stated (Source issues); the README's route via IHGD §2.3 is right |
| 4.1 Ext¹ ghost | C = k[0] ⊕ k[1] over O | Ext¹_O(k,k) = k, t² = 0, H^*(t) = 0, t ≠ 0 | agrees |
| 4.2 reflection T^c = H^{q₀+l₀−c} | q₀ = l₀ = 1 | T⁰ = H²^∨, T¹ = H¹^∨; H^{l₀}(D) = H_{q₀}(D̃) = H^{q₀}(Y)^∨_m, which is the H of Theorem 6.3(c) | agrees; CG18 line 5186 prints H^{i−l₀} (Source issues) |
| 4.2 dim R^i_∞ | general | 1 + |T|(n²−1) + [F:ℚ]n(n−1)/2 + g = |T|n² + q − l₀ = 1 + q + j − l₀ | agrees |
| 4.3 (2) | exact sequence from 0 → k → E/O → E/O → 0 | H^{q₀−1}(Y,E/O)_m/ϖ → H^{q₀}(Y,k)_m → H^{q₀}(Y,E/O)_m[ϖ]; B^van(a) at degree q₀−1 for all a kills the first term | sound |
| 4.4 nonzero seed | minimal nonzero P_∞, dim Supp ≤ dim R_∞ = d − l₀ | concentration (DDPA §9.2) in degree l₀, H^{l₀}(P_∞) ≠ 0; /𝔞 ≠ 0 by Nakayama; so H ≠ 0 and H/ϖ ≅ H^{q₀}(Y,k)^∨_m ≠ 0 | sound |
| 5.1 (iii) | general | dim S^□_∞ = q + 1 + j; dim S^□_∞ − l₀ = dim R_∞ | agrees |
| 5.2, 5.3 near faithfulness | depth = dim; irreducible Spec; lifting mod ϖ | associated primes have dim R/P ≥ dim R, so minimal; unique minimal prime gives full support; for lifting: P′ minimal over ann M, P′ ⊆ Q minimal over ϖ, ϖ ∉ P′ (ϖ regular on M), ht Q = 1, so P′ minimal in R^1_∞ and P′ = P by uniqueness | sound; the §5.3 hypotheses suffice without generic reducedness of the special fibre |
| 5.2 Check | A = k[ε]/ε², M = k; A = O⟦x,y⟧/(xy), M = A/(x) | ann = (ε), nilpotent, not faithful; M/ϖ supported on V(x) only, ϖ injective on M | agrees |
| 5.5 | R_triv = ∅ | R^1_loc formally smooth; depth = dim gives freeness (Auslander–Buchsbaum); faithful flatness gives ker φ_∞ = 𝔞R_∞ | sound |
| 5.6 residual exclusion | Π = Speh(σ,k), k ≥ 2, N(λ) ≡ 1 mod p | the k roots s_i N^{(k−1)/2−j} have pairwise ratios powers of N ≡ 1, so every eigenvalue of r̄_m(Frob_λ) has multiplicity ≥ 2; Chebotarev: these Frob_λ exhaust r̄_m(G_{F(ζ_p)}); bigness supplies a simple eigenvalue | sound; n = 4 Check (a,a,b,b) agrees |
| 5.7 (a) | π₀ eigenline in H^{q₀}(Y,O) | H_m ≠ 0 finite over O, H_m/ϖ ≠ 0, and H^{q₀}(Y,O)/ϖ ↪ H^{q₀}(Y,k) | sound |
| 5.8 fibre argument | 𝔭 = ker x_r, H nearly faithful | ker(R_S → T_m) ⊆ ann H ⊆ √0, killed by x_r into reduced O′; H_𝔭 ≠ 0, H_𝔭/𝔭 ≠ 0 by Nakayama; dual of the fibre is an eigenclass in H^{q₀}(Y,Q̄_p)_m | sound |
| 5.8 character choices | n=2, p=5, N(x)=11, exponents (0,1); n=3, p=5, (0,1,2) | s = 1, 2⁻¹ = 3, (2,3), sum 5; wrong (3,4) gives χ²; s = 3, 3⁻¹ = 2, n⁻¹s = 1, (4,0,1), sum 5; wrong (1,2,3) sum 6 | agrees |
| 5.9 Check | F = ℚ(i), R = ∅, p = 5 split, p = 7 inert, q = 3 | |T| = 2, g = q−2 = 1; |T| = 1, g = q−3 = 0 | agrees |
| 5.10 Check | real quadratic, n=2, |T|=1, q=3 | g = q−2; dim R_∞ = 4+q = 7 = dim S_∞^□ = q + 1 + 3; dim S_∞ = 4 | agrees |

### Shape

Every target has a `*Needs:*` line and a locator; every definition has its API list and at least three Checks (counted: 0.1 six, 0.2 eight, 0.3 six, 0.4 five, 0.5 four, 0.6 six, 1.1 six, 1.2 seven, 1.3 three, 1.4 five plus three local and the coordinate check, 1.5 three, 1.6 four, 1.7 four, 1.8 four, 2.1 five, 2.2 six, 2.3 seven, 2.4 five, 2.5 five, 2.6 three, 2.7 three, 2.8 three, 3.1 four, 3.2 five, 3.3 four, 3.4 six, 3.5 four, 3.6 four, 3.7 four, 4.1 eight, 4.2 three, 4.3 three, 4.4 four, 5.1 three, 5.2 three, 5.3 four, 5.4 three, 5.5 four, 5.6 three, 5.7 four, 5.8 seven, 5.9 three, 5.10 three); every layer ends with `### Examples` and `### Dependencies`. Headline list, Scope, Conventions, supplier contracts, build order, Downstream consumers and References are present. `Suggested.lean`: single `import Mathlib`, one module docstring naming each unstatable headline and the carrier it lacks, empty namespace; no padding possible.

## Not verifiable

- none. All three cited texts are in the cache and were read at the cited lines.

## Source issues

- **Error** in CG18 at Lemma 8.2(1), printed p. 407 (line 4441): the source says the literal character-polynomial quotients R^1_loc are p-torsion free; it should drop p-torsion-freeness (for n = 2, v ∈ R with N(v) = q ≡ 1 mod p, tr(Φ(Σ−1)) is a nonzero element killed by q−1), keeping equidimensionality and characteristic-zero minimal primes; affects the proof of Theorem 9.19 where p-torsion-freeness of R^i_∞ is invoked at p. 426 (line 5180) and Theorem 6.4's hypothesis; the conclusion survives via depth = dimension.
- **Error** in CG18 at Lemma 7.3, printed p. 394 (lines 3896–3903): the source says the direct limit of a finite module along powers of a Hecke operator over a complete local ring is a direct summand; it should use the idempotent given by factorial powers (for M = O and T = ϖ the direct limit is the fraction field, not a summand); affects the proof (the perfect-complex construction of §7.1), repaired by the idempotent.
- **Gap** in CG18 at the proof of Lemma 9.6, printed p. 417 (lines 4822–4826): the source takes Γ¹ = Γ ∩ PSL₂(O_F) for each component group Γ and uses the quotient Γ/Γ¹; for a component group not contained in PGL₂(O_F) this subgroup need not be normal; it should be the kernel of the determinant modulo squares in Γ; affects the proof.
- **Error** in CG18 at the proof of Lemma 9.6, printed p. 418 (lines 4862–4864): the source says the operator induced on the amalgam cohomology is multiplication by the degree N(x)², hence 1 after normalization; the chain-level extension of the edge operator has augmentation 1, so the value is 1 before and N(x)⁻² after normalization; affects nothing, since both values are ≡ 1 mod p and the localization at U_{x²} − 1 kills the amalgam terms either way.
- **Gap** in CG18 at Conjecture B, printed p. 415 (lines 4722–4728): the source says that under (1)–(3) the Galois representation gives a surjection R_{S_Q} ↠ T^an_{Q,ψ,m}; T^an contains the diamond operators (T_{α,1} with α a unit at Q, Definition 9.1), whose identification with the inertial characters is not among (1)–(5); it should add an inertia–diamond compatibility clause, the GLₙ analogue of Conjecture A(3); affects the proof of Theorem 9.19 (condition (d) of Theorem 6.3, line 5218).
- **Misprint** in CG18 at the proof of Theorem 9.19, printed p. 426 (line 5186): the source says the residual complex has T^i = H^{i−l₀}(Y, O/ϖ)^∨_m; it should be H^{q₀+l₀−i}(Y, O/ϖ)^∨_m (the reflection that makes H^{l₀} the dual of H^{q₀}); affects nothing.
