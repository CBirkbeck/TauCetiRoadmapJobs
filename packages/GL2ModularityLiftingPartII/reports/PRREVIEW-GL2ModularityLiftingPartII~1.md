# Review of GL2ModularityLiftingPartII (pull request #2137 at 494737a)

**Verdict:** needs changes

Three P3 findings, none blocking. The gate passes, the dependency check reports no problem, all 15 sampled locators hold, and both Lean headlines survive the adversarial pass. Conditional on the 20 declared gaps, which are listed identically in `design/plan.json` and in the README.

## R01 (P3) — CG18 Lemma 4.14 is re-derived instead of cited from its owner

**Location.** `TauCetiRoadmap/GL2ModularityLiftingPartII/README.md` §4.5, line 715: "Apply the unramified-at-p class-field argument of Lemma 4.14 to show the minimal characteristic-zero deformation ring is reduced: a nontrivial infinitesimal self-extension over a splitting field would define a Z_p-extension …". §6.5 (line 936) reuses it as "global unramified-at-p infinitesimal-rigidity argument".

**Claim.** The routes of §§4.5 and 6.5 re-plan the reducedness argument of CG18 Lemma 4.14, taking ClassFieldTheory Layers 11–12 as their only input. The README cites no ModularityAndLanglandsExtensions section.

**Witness.** `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` line 548 (open head): "### 1.5 Finitely many points with finite image make R[1/p] reduced (Calegari–Geraghty Lemma 4.14 …)". It is merge-order line 196; this roadmap is line 267.

**Repair.**
- Add ModularityAndLanglandsExtensions §1.5 (CG18 Lemma 4.14) to the *Needs:* lines of §§4.5 and 6.5 and to the Layer 4 and Layer 6 Dependencies.
- Add a `### From TauCetiRoadmap.ModularityAndLanglandsExtensions` contract.
- Replace the restated ℤₚ-extension argument with the citation.
- Because §1.5 is stated for the universal ring R, say in one Scope clause that applying it to the fixed-determinant minimal quotient R_min is a kept variant.

Tested: the Lemma 4.14 proof (cg18 lines 2835–2874) uses only two facts. Traces generate the ring, and that also holds for R_min. There is no ℤₚ-extension unramified at p and outside S, which needs nothing about the deformation problem. So §1.5 covers the R_min use.

## R02 (P3) — §6.1 asserts the weight-one oldform identities in every weight n

**Location.** README §6.1, line 867: "the cusp/full comparison and the selected-root auxiliary-level isomorphism hold with ωⁿ⊗L_σ. At a Taylor–Wiles prime x the same normalized oldform/W_x identities hold on these coefficients."

**Claim.** The identities of §1.1 are stated, and computed, on weight-one sections (line 378). Here they are asserted for every n: a U_x matrix of determinant ⟨x⟩ and W_x² = x⟨x⟩. The cited source is weight one only: CG18 Theorem 3.30, steps (1)–(2) (cg18 lines 2195–2213), and Lemma 3.5 (cg18 line 856) concern ω⊗L_σ.

**Witness.** In weight n the Hecke polynomial is X²−T_xX+x^(n−1)⟨x⟩ (cg18 line 1326). Take n = 2, x = 2, T_x = 0, ⟨x⟩ = 1 over ℚ: §1.1's matrix [[0,2],[−1/2,0]] has U² = −I, but the weight-two oldspace needs U² = −2.

**Repair.** State §6.1 for ω⊗L_σ (n = 1). That is the only weight its consumer §6.2 uses, and §§6.3–6.4 do not cite §6.1. If a weight-n form is wanted, give its own matrices (determinant x^(n−1)⟨x⟩) and a locator. Tested: at n = 1 the instance above gives U² = −I = −⟨x⟩I, which is consistent.

## R03 (P3) — Two descriptions of CG18 are inaccurate

**Location (a).** README line 161: "At any cusp type its residual trace is ψ₁(x)+xⁿ⁻¹ψ₂(x), with the prescribed product and finite-order residual characters (CG18, Remark 3.4 and Lemma 3.7(2), pp. 316, 321–322; cg18 line 794)."

**Location (b).** README line 253: "The p = 3 conclusions assume the named hypothesis H₃(3) stated in the following contract; it is not asserted by CG18."

**Claim.**
- (a) CG18 Remark 3.4 does not state the two-character formula. It also claims that (ℤ/NQℤ)ˣ acts transitively on all cusps, which the README's own Check (line 165) rejects.
- (b) CG18 does assert the 3-primary vanishing. That assertion fails at p = 3, as the README's own negative control at line 251 shows.

**Witness.**
- (a) cg18 lines 797–803 state only the trace 1+χ(x)x^(n−1).
- (b) cg18 line 3246, in the proof of Lemma 5.9(1), states H₃(Y₀(Q),k) = 0 for every p ≥ 3.

**Repair.**
- (a) Attribute the all-cusp-type formula to AlgebraicModularFormsAndSerreWeights §2.16 (its README line 565). Keep CG18 Remark 3.4 only for the diamond orbit of ∞.
- (b) Write: "CG18 Lemma 5.9(1) asserts it, but the unlocalized vanishing H₃(Y₀(Q),k) = 0 used in its proof fails at p = 3 for C₃ stabilizers; it is assumed here as H₃(3)."

Tested on the C₃ point (H₃ of dimension 1 against coarse H₃ = 0) and on the cusp orbits of X₁(ℓ) (above ∞ and above 0, different diamond orbits).

## Verified sound

**Gate and dependency check.**
- I re-ran the gate at 494737a: every check reports 0, result OK. The worker's `gate.md` also records `build=0`.
- The outside-folder diff against `origin/main` is empty, and the worktree is clean.
- Dependency check output, verbatim: `depcheck: 235 roadmaps, 2132 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- `overlaps.md` reports no dropped id, no conflicting head and no revision-only id. I checked the closest roadmaps by object:
  - SerreWeightAndLevelOptimisation, README line 17, leaves the CG18 Theorem 4.8 upper bound "to a modularity-lifting roadmap in the defect-one direction". That is this roadmap.
  - AutomorphyLiftingBeyondTaylorWiles, README line 15, excludes "the defect-one GL₂ part of CG18 … §§2–5".
  - PotentialModularityAndCompatibleSystems §8.8 owns only O-finiteness of R_φ.
  - A search for CG18 Corollaries 1.5–1.6, Theorems 1.3, 1.4, 3.11, 3.26, 3.30, 5.11 and Conjecture A across main and all 437 open heads finds no second owner, apart from R01.

**Seeded sample: 15 of 15 targets checked against cg18** (printed page = PDF page + 296).

| Target | README locator | What the source shows | Result |
|---|---|---|---|
| 1.5 | Prop. 3.8, pp. 323–325, l. 1065 | l. 1065 is on p. 323; d_S = r − dim Tor₁(M,O)/π (l. 1075); H₁ torsion-free by Lemma 3.7(1) (l. 1106) | holds |
| 2.1 | proof of Thm 3.11, p. 328, l. 1265 | ψ = (φ, φTₚ−Uₚφ) (l. 1260); expansion ⟨p⟩Vₚ (l. 1265); printed matrix (l. 1273) is a misprint, see Source issues; the README matrix is the correct one | holds |
| 2.3 | §§3.4–3.6, pp. 329–333, l. 1295 | T^an, T_n, T̃_n (ll. 1295–1299); the image T_{n,mα} is not injective for α≠β (l. 1313) | holds |
| 3.1 | Lemma 3.17, p. 333, l. 1486 | R local; N, M, L free of rank 2; R-split; L/m indecomposable (ll. 1486–1491). The README's arbitrary group is fine: the proof is group-free | holds |
| 3.3 | Lemma 3.24, Def. 3.25, pp. 337–338, l. 1662 | surjection T_{n,m}⊗R̃†↠T̃ (l. 1662); J ⊂ J_glob (l. 1685). The README's A_n refines the source's T_{n,m} | holds |
| 4.4 | Cor. 1.5, p. 304; §3.9.2, p. 354 | Cor. 1.5 at l. 305 (p. 304); end of the Theorem 3.30 proof on p. 354. The README's hypotheses are deliberately stronger (Source issues) | holds |
| 5.3 | Lemma 3.27(1)–(2), pp. 345–347, l. 2007 | locally free (l. 2012); base change for any O-algebra A (ll. 2013–2016); cusp inertia of prime-to-p order (l. 2045) | holds |
| 6.1 | Thm 3.30 steps (1)–(2), pp. 350–351, l. 2191 | weight one only | R02 |
| 6.3 | Thm 3.30 step (4), pp. 353–354, l. 2286 | the W_σ cut-out and a component per connected component (ll. 2309–2338) | holds |
| 7.1 | Thm 4.8 and proof, pp. 361–363, l. 2586 | N*, Φ, χ_φ = ε⟨ρ̄ε⁻¹⟩φ (ll. 2586–2659) | holds |
| 7.3 | proof of Thm 4.8, pp. 365–366, l. 2772 | twisting isomorphism (ll. 2772–2799); the README's integral generation argument closes a source gap | holds |
| 7.5 | Remark 4.12, p. 366, l. 2807 | p ≠ 3, no induction from ℚ(√−3), Carayol input | holds |
| 8.3 | Defs 5.4–5.5, Rem. 5.7, pp. 374–375; §5.4, pp. 378–379 | ll. 3126, 3140, 3191, 3305 | holds |
| 9.1 | §5.3.1, p. 376, l. 3219 | Shapiro isomorphism (l. 3233) | holds |
| 9.4 | Prop. 5.10, pp. 377–378, l. 3268 | ll. 3268–3304 | holds |

The README flags no locator as unverified. I also checked:
- CG20 Lemma 8.14 (cg20 line 2540): author p. 65, Duke p. 865.
- CG18 Definition 3.1 (cg18 lines 584–595) against `IsMinimalLift`.
- CG18 §3.1 standing hypotheses (cg18 lines 571–578) against `IsWeightOneResidual`.
- CG18 Theorem 1.3(4) (cg18 lines 232–233), §5.1 S/P/M/H (cg18 lines 2904–2943) and Theorem 1.2 (cg18 lines 192–204).

**Adversarial table.**

| Statement | Instance | Values computed | Result | Change |
|---|---|---|---|---|
| `IsUnramifiedAt` | ℓ = 1; trivial ρ at ℓ = 7 | span{1} = ⊤ is not lain over by any prime, so the predicate is vacuously true; trivial ρ: inertia ≤ ker = ⊤. Both proved in a scratch copy | sound | — |
| `twist` | diag(2,3), η = 2, 𝔽₇ | diag(4,6); trace 3 = 2·5; det 3 = 2²·6; with a single η in the determinant, 2·6 = 5 | sound | — |
| `IsAdicallyContinuous` | field k; O[ε]/ε² | for k, m = 0, so the basis is {⊤, ⊥} and the topology is discrete; for O[ε]/ε², m² = (π², πε) | sound | — |
| `IsReducibleOn` | S₃ standard rep over 𝔽₅ | the two eigenlines of the 3-cycle are swapped by a transposition, so there is no invariant line; for H = 1 every line is invariant | sound | — |
| `inertiaInvariants` | ℤ/9, diag(4,1) | (4−1)a = 3a = 0, giving 3Ae₁ ⊕ Ae₂, which is not free of rank 1 | sound | — |
| `IsWeightOneResidual` vs CG18 §3.1 | oddness at p = 3 | det diag(1,−1) = −1 = 2 ≠ 1; c = 1 is impossible since ι(i) is not real; reducibility over k̄ matches CG18 once O is enlarged | sound | — |
| `IsMinimalLift` vs Def. 3.1 | ℤ/9 with k = 𝔽₃; Teich(χ̄)ψ ⊕ 1; Steinberg lift [[1,b],[0,1]] | 4² = 7 ≠ 1 is rejected; det^(|k|−1) = ψ^(|k|−1) ≠ 1; for b a unit the invariants are Ae₁, a summand on every quotient | sound | — |
| `minimal_weight_one_modularity` | p = 3, ρ = ρ₀⊗ψ², η = ψ (cubic, conductor 7) | ηρ = ρ₀ is minimal; (det ρ)² = ψ² ≠ 1 so only the twisted form applies; ℓ = p is allowed since N is prime to p and ρ is unramified at p | sound | — |
| `minimal_lift_finite_image` | A = k; A = O[ε]/ε² | A = k forces ρ = ρ̄, which is finite; {I + aεE₁₂} is infinite but is not the image of a minimal lift once R_min is finite | sound | — |
| §0.1 auxiliary prime | p = 3, class (1,2) | ratio 1 ∉ {2, 2⁻¹ = 2}; r ≡ 2 ≢ 1 | sound | — |
| §0.2 Hecke formula | j = 1, x = 2, n = 1, ⟨x⟩ = 3, a₂ = 4, a₀ = 1 | a₁(T₂f) = 4; ℕ-division junk 1/2 = 0 would give 7 | sound | — |
| §0.4 Ψ scalar | n = 2, x = 2, section eigenvalue 2 | 2⁻¹·2 = 1 | sound | — |
| §1.1 U matrix | x = 2, T = 0, ⟨x⟩ = 3 over ℚ | [[0,6],[−1/2,0]]; charpoly X²+3; det ψ^∨ψ = x⁻¹(α−xβ)(β−xα), checked symbolically (= cg18 l. 990) | sound | — |
| §1.2 / §1.3 | over 𝔽₅: x = 1, roots 1,2; x = 2, roots 1,1 | det[[2,3],[3,4]] = −1 = 4 = −(1−2)²; 2⁻¹·1 = 3; U = [[2,2],[2,0]], (U−1)² = 0, U−1 ≠ 0 | sound | — |
| §1.5 defect | Δ = 1, M = O/π; M = Sʳ | Tor₀ = Tor₁ = k, so d = 0 = 0 − 0; d = r | sound | — |
| §2.1 Uₚ matrix | T = 0, ⟨p⟩ = 3 | Uψ(f,g) = ψ(Tf + ⟨p⟩g, −f), so (0,1) ↦ (3,0); U² = −3I | sound | — |
| §2.4 faithfulness | a + bU | [[a+bT, b⟨p⟩],[−b, a]]: the lower-left entry gives bM = 0, then aM = 0 | sound | — |
| §3.1 Wiese | J = [[1,1],[0,1]]; S₃ over 𝔽₅ | N ≅ M ≅ L; (J−1)² = 0 ≠ J−1 | sound | — |
| §3.3 normalisation | c = 2, U = 6 over 𝔽₇ | 2⁻¹·6 = 4·6 = 3 | sound | — |
| §3.5 square root | ℤ/9; ℤ/4 | roots ≡ 1 mod 3: 1² = 1, 4² = 7, 7² = 4, so 7 is unique; mod 4, 1² = 3² = 1 | sound | — |
| §5.1 x = 5, p = 3 | θ₀ of order 8, λ of order 5 | ⟨Res_T Θ(θ₀), θ₀⟩ = (16 − 20 + 4)/24 = 0; a(θ) = 2; a(θ/θ^σ) = 1; 5 ≡ −1 mod 3 | sound | — |
| §5.4 cusp duality | e = 5, i = 2 | q⁻²O[[q⁵]]·q⁵ = q³O[[q⁵]] | sound | — |
| §6.1 weight n | n = 2, x = 2, T = 0, ⟨x⟩ = 1 | §1.1 matrix gives U² = −1; weight two needs U² = −2 | defect | R02 |
| §7.2 type | A = O·1 + πO⁴; B = O[t]/∏(t−iπ) | A/π = k[x₁,x₂,x₃]/(x)² with socle dim 3; B/π = k[t]/t⁴ with socle dim 1; both have generic fibre K⁴ | sound | — |
| §7.3 generation | Φ = C₃; orders | squares are 1, g², g; O×O ⊋ {a ≡ b mod π}, index \|k\| | sound | — |
| §7.4 count | Gross bounds | {3,4} ∩ 2ℤ = {4}, so multiplicity 2 | sound | — |
| §8.2 type P | a(ψ) = 1, N(v) ≡ 1 mod p | π(Teich(ψ)ξ, ·) has a Γ₀(v²) newvector, so it lies at level Γ_p(v²); this justifies the matched-type design | sound | — |
| §8.5 Hensel | 𝔽₇, α = 2, β = 4 | αβ = 1; trace 6; 2α − 6 = 5; 2β − 6 = 2 | sound | — |
| §9.2 determinants | 𝔽₇, roots 2,4 | (1+1)² − 6² = −32 ≡ 3 = −(2−4)²; α² − 1 = 3 | sound | — |
| §9.3 stabilisers | F imaginary quadratic | ζ + ζ⁻¹ ∈ F ∩ ℝ = ℚ, so orders are 1, 2, 3, 4, 6; diag(i,1) has order 4 over ℚ(i) | sound | — |
| §10.3 complete intersection | q = 1, f₁ = π² | O/π²: dimension 0, length 2 | sound | — |
| §10.4 rank | dims 2, 3 | 1·2·3 = 6 | sound | — |
| §10.5 vs CG18 Thm 1.2 | p = 3 | the source allows p ≥ 3; the README's p ≥ 5 plus H₃(3) matches the Lemma 5.9(1) error | sound | — |
| §10.6 Kummer test | 𝔽₁₉ˣ = ⟨g⟩, α = g³ | α⁶ = g¹⁸ = 1; α² = g⁶ ≠ 1 | sound | — |
| Conventions: reciprocity | φ(Frob) = 2 over 𝔽₇ | Art_geom value 2⁻¹ = 4 | sound | — |
| Conventions: Frobenius | 𝔽₂₇ | t³ = t+1; t⁹ = (t+1)³ = t+2 | sound | — |

**Lean.**
- I appended `#check @` for all 9 declarations to a scratch copy of `Suggested.lean` and elaborated it with `lake env lean`. The only warnings are `sorry` on the two theorems.
- Each elaborated type matches its README statement (Conventions, §§4.4–4.5, §6.5). No binder is dropped.
- The two degenerate probes above elaborate.
- The 7 definitions all have real bodies and are all used by the two headlines. Neither headline closes in one tactic, so there is no padding.
- `hres` is implied by `htwres` together with the η hypotheses. This redundancy is harmless and is not a finding.

**Headlines.**
- Stated: minimal weight-one modularity (Corollary 1.5, in twist-minimal form) and finite image (Corollary 1.6).
- Correctly named as not statable in the docstring: weight-one torsion local–global compatibility; R = T with and without types; type bundles; scalar type-three; J₁(N*)[m] multiplicity, since there is no modular-curve Jacobian at the Tau Ceti pin (only `TauCeti.ModularSymbols.heckeTAlgebra` in `ModularForms/ModularSymbols/Hecke/Finite.lean`); Bianchi amplitude; Bianchi R = T, complete intersection and rank; Bianchi lifting.

**Library declarations opened at the pins.**

Mathlib:
- `Ideal.inertia`: `RingTheory/Ideal/Defs.lean:154`, unfolding to `AddSubgroup.inertia` (`Algebra/Group/Subgroup/Basic.lean:1183`).
- `IsArithFrobAt` (`RingTheory/Frobenius.lean:184`), `mem_stabilizer` (:195), `mul_inv_mem_inertia` (:201).
- `Representation.invariants` and `mem_invariants`: `RepresentationTheory/Invariants.lean:73,80`.
- `Matrix.GeneralLinearGroup.scalar` and `scalar_commute`: `GeneralLinearGroup/Defs.lean:55,88`.
- `Matrix.charpoly` and `aeval_self_charpoly`: `Charpoly/Basic.lean:140,222`.
- `Matrix.det_fin_two`: `Determinant/Basic.lean:815`.
- `groupHomology.indIso`: `GroupHomology/Shapiro.lean:65`.
- `ModularForm` and `CuspForm`: `ModularForms/Basic.lean:78,86`.
- Krull topology instance: `FieldTheory/KrullTopology.lean:134`.

Tau Ceti:
- `TauCeti.MonoidAlgebra.augmentation` and `augmentation_single`: `Algebra/MonoidAlgebra/Augmentation.lean:50,55`.
- `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet` and `infinite_frobeniusPrimeSet`: `Chebotarev/Density/Chebotarev.lean:51,74`.
- `HeckeRing.GL2.Newform`: `Newforms/Newform.lean:104`, with `dirichletLift` at :134.
- `HeckeRing.GL2.IsEigenformAwayFromLevel`: `ModularForms/Eigenform.lean:65`.
- `HeckeRing.GL2.Newform.eq_of_forall_prime_eigenvalue_eq`: `Newforms/StrongMultiplicityOne.lean:163`.

**Cross-roadmap citations resolved at their heads.**
- AlgebraicModularFormsAndSerreWeights: R15.x mapping at README line 17; §§2.1, 2.5, 2.12, 2.16, 3.1–3.4, 3.8, 3.12, 6.4.
- SerreWeightAndLevelOptimisation §§3.4, 3.10–3.14.
- ClassicalSerreModularity: `R27.5/hypothesis-H-and-theorem-9-1`, "Arithmetic interfaces for the theorem statements", and the `GQ`, `IntBar`, `IsFrobAt`, `IsUnramifiedAt` declarations in its `Suggested.lean`.
- IntegralHeckeAndGaloisDeterminants §§1.3, 1.6 (the isotypic recognition target), 2.1–2.2.
- LocalGaloisDeformationRings §§2.1–2.5, 2.19, 4.1, 6.7, 6.18, 7.5.
- GlobalGaloisDeformations §§3.3–3.7, 5.1–5.8, 6.2–6.8 and R04.6. Its §5.7 covers only totally real settings, so gap:taylor-wiles-sets is not already provided.
- DeformationAndDerivedPatchingAlgebra §§3.1, 3.4–3.5, 3.9, 5.1, 5.5.
- GL2AutomorphicRepresentationsAndTransfer R16.2.7, R16.2.11, R16.3.9, R16.4, R16.6.5–6.
- AutomorphicGaloisRepresentations §§2.10, 3.7, 4.1–4.6, 5.1, 6.8–6.12.
- ArithmeticLocallySymmetricSpaces ALS.0.10(ii)/(iv), ALS.3.14, ALS.4.10 (CG18 Eisenstein variant), ALS.4.12(b) (needs ♠ and neatness, hence gap:non-neat-bianchi-boundary), ALS.5a.6, ALS.5b.5–8, ALS.6.1–6.3.
- AutomorphyLiftingBeyondTaylorWiles §3.5 (B^gal clauses (i)/(ii) at its §2.1).
- PotentialModularityAndCompatibleSystems §8.8.
- GL2ModularityLifting §§3.7, 4.1–4.2.
- ModularCurvesPartII §17.2.
- ClassFieldTheory Layers 7, 11, 12 (on main).

None of these is on the never-cite list.

**Gaps.** All 20 slugs appear both in `plan.json` and in `What … must provide (gap:…)` lines under the named supplier's subsection. None has supplier `none`. None asks for what its supplier already states: GlobalGaloisDeformations §5.7, AutomorphyLiftingBeyondTaylorWiles §3.5 (which assumes B^gal(ii)), ALS.4.12(b) (neat, ♠) and GL2AutomorphicRepresentationsAndTransfer R16.3.9 (conductor-equality branch) each stop short of the request.

## Not verifiable

- CG22 (correction, Invent. Math. 227, pp. 855–856) is uncertified and cited by locator only. Its "formal-bracket" content was not checked.
- The CDT input behind GL2AutomorphicRepresentationsAndTransfer R16.3.9 and the §5.1 x = 5 depth-zero example was not checked against Conrad–Diamond–Taylor. I computed the character pairing myself (row above).
- The σ ↔ σ* swap asserted in §6.4 against CG18 Theorem 3.30 was not adjudicated. The cg18 extraction does not reliably distinguish H₀ from H⁰ at cg18 lines 1066 and 2192.

## Source issues

- **Misprint** in cg18 at proof of Theorem 3.11, p. 328: the source says Uₚ acts through ψ⁻¹ by [[Tₚ,1],[−⟨p⟩,0]], which is the matrix for the basis (φ,V); it should be [[Tₚ,⟨p⟩],[−1,0]] for ψ = (φ, φTₚ−Uₚφ) = (φ,⟨p⟩V); affects nothing.
- **Error** in cg18 at Remark 3.4, p. 316: the source says (ℤ/NQℤ)ˣ acts transitively on the cusps of X_Δ(Q), so every boundary trace is 1+χ(x)x^(n−1); it should allow ψ₁(x)+ψ₂(x)x^(n−1) per cusp orbit, since the cusps above ∞ and 0 of X₁(ℓ) are distinct orbits; affects the proof.
- **Gap** in cg18 at Corollary 1.5, p. 304: the source says hypothesis (1) suffices, but it allows new p-power inertial determinant at x ≡ 1 mod p (Teich(χ̄)ψ ⊕ 1); it should require twist-minimality in Definition 3.1, since no twist of such a lift is minimal; affects a stated result.
- **Gap** in cg18 at proof of Theorem 4.8, p. 363: the source says twisting by ψ^(−1/2) gives R_φ[1/p] ≅ T^an_φ[1/p]; it should treat eigenforms f and f⊗ψ_v⁻¹ separately, because at a ramified unramified-character self-extension prime v ≡ 1 mod p they become equal; affects the proof.
- **Gap** in cg18 at proof of Theorem 4.8, p. 366: the source says an injection that is an isomorphism after ⊗K between torsion-free modules gives T_m ≅ T_{1,m}⊗O[Φ]; it should prove surjectivity, by twisted Hecke operators and squared diamonds; affects the proof.
- **Gap** in cg18 at proof of Theorem 4.8, p. 366: the source says dim G[m] = dim G⁰[m] + dim Gᵉ[m]; it should say only 3 ≤ dim G[m] ≤ 4, because m-torsion is left exact, with evenness forcing 4; affects the proof.
- **Error** in cg18 at proof of Lemma 5.9(1), p. 377: the source says H₃(Y₀(Q),k) = 0 for all p ≥ 3; it should exclude p = 3, where orbifold homology at a C₃ stabilizer has H₃(C₃,𝔽₃) ≠ 0; affects a stated result.
- **Error** in cg18 at §5.2.1(5)(b), p. 373: the source says to use level Γ_p(v^c) at type-P primes; for N(v) ≡ 1 mod p that level also carries newvectors of π(Teich(ψ)ξ, ·) with ξ of p-power order, so Conjecture A(2)(b) fails there; it should use the matched type; affects a stated result.
