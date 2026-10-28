# GATE-GrossZagierAndArithmeticHeights~8: answers to human review

There is one review, by rwst, at head `660084d`. Points are numbered in order of appearance: first the residual points the status table raises and does not repeat later (H01–H02), then N01–N11 split into their separate points (H03–H23), then the P3 list (H24–H50). The repairs are in commit `b8e5989b` on the pull-request branch, which has not been pushed. Section numbers refer to `TauCetiRoadmap/GrossZagierAndArithmeticHeights/README.md` after that commit. `Suggested.lean` is unchanged.

## H01 (rwst) — answered
The review records a P3 notation issue in R04(c) without saying what it is, and the §4.7 notation (W₀, W^♮, δ, ψ_v) was not changed. The only change near it is that the local measures moved out of §4.7 (see H16). If the reviewer names the symbol, it will be fixed.

## H02 (rwst) — disputed
§9.1 has a consumer: §9.18 cites it (its *Needs*, and the supplier row of NeronModelsAndSemistableAbelianVarieties). Its mixed-characteristic DVR generality (e = v_R(p) < p−1) is the generality of its source argument. A roadmap develops a general library, so the statement is not narrowed to the case the consumer uses.

## H03 (rwst) — applied
§7.46a has a new item 4, "Supersingular charts at 𝔅-split, E-nonsplit places":
- (a) CM points by E reduce into the supersingular locus at every place nonsplit in E. The reason given is that the endomorphism ring of an ordinary divisible group is O_(F_v)×O_(F_v), which contains no quadratic field.
- (b) For small tame level, the completion of 𝒳_U ⊗ O_(F̆_v) along the supersingular locus is B(v)^× \ (𝓜̂_(U_v) × 𝔅_f^(v,×)/U^v). Here 𝓜̂_(U_v) is the normalized Drinfeld-level cover of ⊔_ℤ Spf O_(F̆_v)⟦t⟧ (LubinTateFormalModulesAndQuasiCanonicalLifts LT.3). The supersingular locus itself is B(v)^× \ (ℤ × 𝔅_f^(v,×)/U^v).
- (c) For general U, take invariants.

The route is stated case by case:
- [F:ℚ]>1: Carayol §§6.6 and 11.2, through R18.2.6 (yuan-modular line 2239).
- The modular case: SerreWeightAndLevelOptimisation §2.6 (Deuring–Eichler), ModularCurves 7F and ModularCurvesPartII §5.1.
- F=ℚ with N⁻>1: false elliptic curves (PELModuli M2.9), split by an idempotent.

§7.47 item 2 now reads m off these charts, with the γ-sum as the B(v)^×-quotient at every nonsplit v. A new Check covers p=5, which is inert in ℚ(√−7): the mass is 1/3 = (5−1)/12, and j=−3375 ≡ 0 mod 5 is supersingular. As the negative control, at the split prime 11, −3375 ≡ 2 is ordinary.

## H04 (rwst) — disputed
LubinTateFormalModulesAndQuasiCanonicalLifts is line 52 of the board merge order, and this roadmap is line 332, so it is an earlier supplier under the supply rules this roadmap is held to. Its design document defines LT.3 (marked and universal deformations at finite height) and LT.6 (canonical and quasi-canonical lifts). Whether it must be published as a pull request before this one merges is a sequencing decision for the maintainers. It is not a defect in the citation.

## H05 (rwst) — applied
t_K is now defined once, in block (A), as w_K/([O_K^×:ℤ^×]·#Cl_K^ram) (burungale line 1080). Because w_K/[O_K^×:ℤ^×] = 2 and #Cl_K^ram = #Cl_K[2] = 2^(t−1), this equals 2^(2−t). Examples: ℚ(√−3) gives 2 and ℚ(√−5) gives 1, where the old product gave 18 and 4. This agrees with Burungale's Remark (1) and with JSW (5.1.a) ("a power of 2"). §9.15 now cites block (A), and the clause "9 times a power of 2 … prime to p because p splits" is gone.

## H06 (rwst) — applied differently
The D₁ sum is kept, as Burungale's measure, rather than recomputing the constant for the full sum. §9.11 now says three things:
- its linear root sums over D₁ ⊂ Cl(O_K)/Cl_K^ram, as in (5.8);
- the interpolation of that root carries t_K, which Burungale's proof attributes to the D₁ sum relative to Brooks's full class-group sum (burungale line 1082);
- Brooks's full-sum identity (Prop. 8.9) is the value identity at each χ and carries no t_K.

The outline, the API line and a new Check (ℚ(√−5): D₁ has 1 element, the full sum has 2 terms, t_K = 1) now say "over D₁".

## H07 (rwst) — applied differently
The sentence in Downstream consumers that called EffectiveClassNumbers §2.8 a consumer is deleted, because EffectiveClassNumbers is line 182 of the merge order. Scope now says that EffectiveClassNumbers §2.8 states the formulas without a kernel route and is not a supplier of §§8.15/8.19. The double statement can only be removed in EffectiveClassNumbers itself (citing §§8.15/8.19 and moving after this roadmap). That is a change to another pull request and to the merge order, and the decision belongs to the maintainers.

## H08 (rwst) — answered
The pull-request body is outside the files this repair may edit. The worker updates its supplier list (ArithmeticGaloisRepresentations, SmoothRepresentationsOfLocalGroups, LubinTateFormalModulesAndQuasiCanonicalLifts, and EffectiveClassNumbers as a non-supplier) when it submits.

## H09 (rwst) — answered
The ArithmeticGaloisRepresentations ↔ HilbertModularVarietiesAndShimuraCurves cycle is between two other roadmaps. depcheck reports 0 problems for this roadmap, whose edges into both point to earlier merge-order entries (lines 47 and 158). The cycle has to be broken in those pull requests.

## H10 (rwst) — answered
HeegnerPointEulerSystems (merge-order line 337) is later than this roadmap. A consumer's gap contract does not create an obligation on its supplier. Downstream consumers still says that the integral family logarithm and explicit reciprocity law is a Perrin-Riou regulator statement, with its inputs in PadicHodgeRegulators §§8.17–8.22 (they exist at its head: 8.17 Regulator naturality … 8.22 Ordinary and multiplicative Coleman map). The contract therefore moves to HeegnerPointEulerSystems or PadicHodgeRegulators, not here.

## H11 (rwst) — applied differently
Downstream consumers now names the ModularIwasawaMainConjectures contract explicitly: the parabolic lattice of an X₀(N)-optimal quotient against the full cusp-divisor symbol lattice of ModularSymbolsPadicLFunctions §§0.4, 1.1, together with r_E^± and X₁(N)→X₀(N). It records this as a modular-symbol period comparison and not a target here, while §§0.4, 3.1, 3.5, 3.7 and 3.10 (Manin constants with isogeny transfer) are supplied. The contract text itself assigns "the additional full-symbol comparison" to "that period owner" (ModularIwasawaMainConjectures README line 140).

## H12 (rwst) — applied
§0.7 now owns three things:
- the definition λ := ε_F(Ind 1, ψ)/ε_K(1, ψ∘Tr);
- the proof that λ² = η_v(−1), from ε(μ,ψ)ε(μ⁻¹,ψ) = μ(−1) applied to 1_F, 1_K and η_v, including dyadic places;
- the Steinberg monodromy step, comparing det(−Frob) on V^I/(ker N)^I in the unramified and the ramified case.

ArithmeticGaloisRepresentations §2.7 is now cited only for ε-factors with their monodromy factor and inductivity for Weil representations. GL2AutomorphicRepresentationsAndTransfer R16.0.1 is no longer cited. The AL supplier row was corrected to match. New Checks cover ℂ/ℝ (λ = ±i, λ² = −1) and the unramified case (λ = 1 = η(−1)).

## H13 (rwst) — applied
The clause "For Γ=Γ₁(N) the stronger cφ | deg φ always holds" is deleted from §3.8. CNS Corollary 7.3 rests on regularity of X₁(N)_(ℤ(p)), the Papadopoulos bound and the Cremona/Agashe–Ribet–Stein low-conductor computation (cns lines 2333–2343), and none of these is planned here. The bounds 6·deg φ and deg φ (for cube-free N) still hold for every Γ₁(N)⊆Γ⊆Γ₀(N).

## H14 (rwst) — applied
§7.46a item 5 now defines j_w through the ξ̂-admissible extension of 2.9. The sum i_w + j_w for two CM points is called the finite part of the ξ̂-admissible pairing of degree-one divisors. It reduces to the 2.5 symbol only on degree-zero combinations. 2.9 is added to the *Needs*. A Check on the fibre C₁+C₂ (C₁·C₂=1, C₁²=C₂²=−1) shows that a single point has no orthogonal extension: (1,0) has nonzero sum.

## H15 (rwst) — applied
§7.46a item 5 introduces 𝒳_(U,w), the canonical resolution of the normalization of 𝒳_U ⊗ O_(H_w): repeated blow-up of the whole singular locus followed by normalization (StableReduction Layer 4). Being canonical, it commutes with completion and is equivariant. For small U^v it lifts the charts of items 3–4 over O_(H̆_w). It is named as "the principal-level uniformizing model used in 7.47", and m, i_w and Ṽ are read on it. §7.47 items 2–3 now cite "the resolved uniformizing model of 7.46a, item 5".

## H16 (rwst) — applied
The Cai–Shu–Tian local measures moved from §4.7 to Conventions (Characters, signs and measures), together with the unramified check vol(O_K^×/O_F^×) = 1. §4.7 now refers to them. They are now cited by:
- §4.3: "the quotient measure on K_v^×/F_v^× of the local measures fixed in Conventions";
- §4.5: dt_v is that quotient measure, of volume one when δ and D are units;
- §5.6, in both of its "Layer 0" places.

§5.3's *Needs* now include §§4.3 and 4.7 and the Conventions measures.

## H17 (rwst) — applied
Within each layer the sections are now in a topological order of their *Needs*, and section numbers are kept so that every anchor still resolves:
- Layer 6: 6.57–6.61 before 6.56.
- Layer 7: 7.59, 7.24, 7.42, 7.58, 7.39, 7.44 after 7.62, and 7.68 after 7.79.
- Layer 8: 8.10 before 8.9, and 8.1 after 8.12.

The scratch check now finds no forward *Needs*. In §7.25, the false parenthetical "depends only on §§7.1–7.4" and the forward reference to §7.47 are replaced by the maximal-level multiplicities of 7.12(i), and "the finite set of 7.47" became "the finite set of places that are not good".

## H18 (rwst) — applied
t_K is defined in block (A) (H05), so §9.11 no longer refers forward to §9.15 for it.

## H19 (rwst) — applied
The sentence h𝒫 = Σ_v⟨,⟩_v is deleted from §2.11 and restated in §2.12 as the height over L, [L:F]·h𝒫(a,b), proved from 2.9 and 2.11's compatibility with 2.1. §2.12's *Needs* gain 2.1, 2.5 and 2.11, and §2.11's gain 2.1.

## H20 (rwst) — applied
Classical setting 8 no longer cites §6.19. Invertibility of C_N is cited to Gross–Zagier IV (6.2), where the system is stated to be non-singular (gz86 line 2726).

## H21 (rwst) — applied
The theorem-of-the-square step is deleted from the §1.1 Outline, which now says that the full-polarization identity is HeightsRationalPointsAndObstructions §0.21 and is not reproved. §0.21 is added to the *Needs* of §1.1, of §0.1 and of the Layer 0 Dependencies.

## H22 (rwst) — applied
§7.46a item 2 is now "Hecke correspondences on regular models". It takes regular models, common resolutions and semistable models from StableReduction Layers 4–5 and 7. The only thing it proves is that Hecke and level maps extend, with the projection formula.

## H23 (rwst) — applied
The modular case (F=ℚ, 𝔅 ramified only at ∞) is now a definition in the opening paragraph: 𝒳_U is the coarse curve X_U of ModularCurvesPartII §5.2. The R18.2.9 construction is used only "otherwise". The source note now records that R18.2.9 excludes B=M₂(ℚ) and that R18.2.6 needs [F:ℚ]>1.

## H24 (rwst) — applied
In item 3, Σ̂_(U_v) is now the normalization of (Ω̂⊗O_(F̆_v)) × ℤ, with ℤ = 𝔅_v^×/O_(𝔅_v)^× via the reduced norm, on which B(v)^× acts by translation by ord_v of the reduced norm.

## H25 (rwst) — applied
Item 3 first takes U^v ⊆ (1+N·Ô_𝔅^v)^× with N ≥ 3 prime to v and to the ramified places, then reaches general U by invariants under U/U′, which commute with completion. Items 4–5 use the same reduction.

## H26 (rwst) — applied
Item 1 now restricts the R18.2.6 comparison to [F:ℚ]>1. The Outline of item 4 gives the F=ℚ, N⁻>1 route (§8.17 Case II): the false-elliptic moduli of PELModuli M2.9, with an idempotent of O_𝔅⊗ℤ_p ≅ M₂(ℤ_p) splitting the p-divisible group. PELModuli M2.9 is added to the *Needs*.

## H27 (rwst) — applied
The new item 6, "Cusps in the modular case", says that the Hodge class enters through its ξ̂-admissible extension of 2.9, with the logarithmically singular Petersson metric fixed by 3.2. CM-to-CM local pairings involve no cusp.

## H28 (rwst) — applied
The clause "omitted diagonal … in 7.47" is replaced by "The self-intersection of a CM point is excluded from the pairing".

## H29 (rwst) — applied
The §7.46a *Needs* gain R18.2.10, StableReduction Layer 7 and §2.9, as well as LT.3, SerreWeightAndLevelOptimisation §2.6 and PELModuli M2.9. The R18 supplier row now lists R18.5.3 and the scope of R18.2.6 ([F:ℚ]>1). The Layer 7 Dependencies were updated to match.

## H30 (rwst) — applied
The item 1 Outline now says that the extension is unique because 𝒳_U′ is separated and 𝒳_U is reduced with dense generic fibre.

## H31 (rwst) — disputed
`yzz-book` is settled as waived, and its text is not available legally here. A page number cannot be checked, and an unchecked one would be invented, so the section-level locator stays.

## H32 (rwst) — applied
§3.13 now defines ‖ω‖² = ∫_(E(ℂ))|ω∧ω̄| for a Néron differential (gz86 line 3325). It includes a witness: 2·Im τ for ℂ/(ℤ+ℤτ) with dz.

## H33 (rwst) — applied
§5.3 now writes L(2,1_F) = Γ_ℝ(2)^[F:ℚ]·ζ_F^fin(2), with a separate symbol for the finite zeta function. It notes that all archimedean factors are Γ_ℝ because F is totally real, and that Γ_ℝ^(r₁)Γ_ℂ^(r₂) would be needed otherwise.

## H34 (rwst) — applied
Classical setting 8: O(y^(−1)log y) → O(y^(−ε)) for some ε>0, as in GZ IV (6.1) (gz86 line 2726).

## H35 (rwst) — applied
§7.47 item 4 used "both conditions", which was ambiguous. It now says: S² at the two places of S₂ alone, without S¹. The Check cites Disegni Prop. 8.1.1(1)–(2) (disegni line 2735; S² is YZZ Assumption 5.4), and Yuan Remark 4.4 for the E* term (yuan-modular line 2812). The §7.65 outline wording was aligned.

## H36 (rwst) — applied
§7.11 now defines κ_U° as the degree of L_U on a geometric connected component of X_U, with ξ̂ = L_U/κ_U° (yuan-modular lines 2166 and 2583).

## H37 (rwst) — applied
In block (A), the JSW hypothesis is renamed (JSW-H), and all four JSW uses in §§8.3, 8.17 and 9.15 were renamed.

## H38 (rwst) — applied
"R18.1.3, Layer 5" → "R18.1.3, this roadmap's Layer 5". Only one occurrence remained.

## H39 (rwst) — applied
Each slug was replaced by a section that exists at the supplier's head:
- AS.2.23–AS.2.25 → AutomorphicSpectralTheory §§2.23–2.25.
- AS.4 → AutomorphicSpectralTheory Layer 4.
- MP.7 → MetaplecticAutomorphicForms §§7.28–7.34 / §7.34.
- MP.6 → §6.16 (`normTheta_integralRange`).
- AF.2, AF.2–AF.3 → AutomorphicFormsOnReductiveGroups §§4.2, 7.2, plus Mathlib `SlashAction`.
- ED.4/… → EffectiveDiophantineMethods §§4.2, 4.3, 4.6.
- `R07.1/raynaud-uniqueness` → FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.30, with NeronModelsAndSemistableAbelianVarieties §6.4d added to the Layer 3 Dependencies.
- PadicHodgeRegulators L0–L1 → §§0.1, 1.1–1.3.

## H40 (rwst) — applied
The supplier rows now include:
- MetaplecticAutomorphicForms §6.22 (`toricTheta_pairingComparison`);
- AutomorphicFormsOnReductiveGroups §2.7 and AutomorphicSpectralTheory §§0.48–0.49 (Casselman–Wallach), in the local-representation row;
- TropicalAndBerkovichArithmetic §2.7, also in the Layer 2 Dependencies.

GL2AutomorphicRepresentationsAndTransfer R16.0.1 is no longer cited anywhere (H12).

## H41 (rwst) — applied
The §0.1 source line now cites Müller–Stoll and LMFDB 37.a1 once each, with merged locators.

## H42 (rwst) — applied differently
Two of the six pairs were real restatements:
- §7.30 now takes m_ν̄1 and m_ν̄2 from 7.12(ii) instead of restating their support and values.
- §7.55 now names G^m := G|T_m as the operator of 7.36 and proves only its matrix form.

The other four pairs are definition and consequence, not duplicates:
- §6.50 uses the series of 6.23 to define k_φ.
- §7.23 is the half-count specialization of the Hom sets of 7.3.
- §7.37 is the tangent-dependence law of the symbol of 7.19.
- §7.80 is a counting statement about the sums of 7.70.

## H43 (rwst) — answered
Classical settings 1–8 fix the notation of the classical arguments, and the standing blocks fix hypotheses. Merging them would renumber every target that cites them. The undefined symbols of R10 are not listed in this review. The symbols this round could check (‖ω‖², κ_U°, t_K and the (H) label collision) are now defined (H32, H36, H05, H37).

## H44 (rwst) — applied
- In the 66 lines that begin with "Assume", 113 "…; Capital" fragments became sentences.
- 15 "Assume also Off-diagonal …" and 11 "Assume also N>1 …" became "Assume also that …".
- In 6 places "Assume also The/Use" lost the stray "Assume also".

## H45 (rwst) — applied
§7.77: "Lemmas7.4/7.6/8.7" → "Yuan–Zhang's Lemmas 7.4, 7.6 and 8.7".

## H46 (rwst) — applied differently
sources.toml is the worker-maintained manifest and is outside the two files this repair may edit. To make every `<id> line N` locator resolvable from the README itself, each References entry now starts with its key ("Key gz86: …", 35 entries), and the References preamble says so.

## H47 (rwst) — applied
§9.5 now states the target "p-new root interpolation and Abel–Jacobi formula in weight two" for a_p = ε ∈ {±1}. It displays (i) the squared interpolation with the multiplier (1 − εχ⁻¹(p̄))² and (ii) the Abel–Jacobi sum formula, citing Castella Theorems 2.10–2.11 at k=2, r=j=0 (castella-exceptional lines 737 and 748). It adds a negative control: ε fixed at +1 gives 1−χ⁻¹(p̄) instead of 1+χ⁻¹(p̄).

## H48 (rwst) — applied
The §8.2 Check now says that the probability average is undefined over 𝔽₃ (3 = 0), while the finite character sum is defined and equals 3·1 = 0. This agrees with the statement.

## H49 (rwst) — applied
§0.2 is now scalar-first throughout: ℚ ⊗_ℤ E(K) with h_ℚ(q⊗P) = q²h_x(P), matching the Lean carrier. Later layers' E(K)⊗ℚ is identified with it by `TensorProduct.comm`, and the Consequence gives both orders.

## H50 (rwst) — applied
The §8.17 *Needs* now include ArithmeticStatisticsPartVI, "Heegner logarithm and low rank".

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| t_K = w_K/([O_K^×:ℤ^×]#Cl^ram) = 2^(2−t) | ℚ(√−3), ℚ(i), ℚ(√−7), ℚ(√−5), ℚ(√−15) | 6/3=2 (t=1); 4/2=2 (t=1); 2/1=2 (t=1); 2/(1·2)=1 (t=2); 2/(1·2)=1 (t=2); product reading 18 at ℚ(√−3) | quotient is a power of 2 in all cases, as Burungale Remark (1) and JSW require | block (A), §9.15 |
| λ² = η_v(−1) | split; unramified with ψ of conductor O; ℂ/ℝ | 1=1; λ=1, η(−1)=1; λ=±i, λ²=−1=sgn(−1) | holds | §0.7 Checks |
| Degree-zero inductivity gives λ² | ρ = σ|_K⊗χ − 2·1 | ε_F(Ind ρ_1)/ε_F(Ind 1)² = ε_K(ρ_1)/ε_K(1)² ⇒ factor λ² | holds | §0.7 Outline |
| CM points reduce supersingularly at E-nonsplit v (7.46a 4a) | ℚ(√−7): p=5 inert, p=11 split | −3375 ≡ 0 mod 5 (supersingular j in char 5 is only 0); −3375 ≡ 2 mod 11, supersingular set {0, 1728≡1} | inert: supersingular; split: ordinary (negative control) | Check added |
| Supersingular locus = B(v)^×\(ℤ × 𝔅_f^(v,×)/U^v) | U=GL₂(Ẑ), p=5 and p=11 | mass 1/3 = (5−1)/12; at 11: 1/3+1/2 = 5/6 = 10/12 | Eichler mass formula agrees | Check added (p=5) |
| Single point has no orthogonal extension (7.46a 5) | fibre C₁+C₂, C₁·C₂=1, C_i²=−1 | V=aC₁+bC₂: −a+b=−1 and a−b=0 inconsistent; for (x)−(y) on C₁ the vector is (0,0) | degree one needs ξ̂ | Check added |
| Small-level reduction via invariants | U′ ⊲ U, finite U/U′ | invariants commute with flat base change to the completion | holds | items 3–5 |
| ‖ω‖² = ∫|ω∧ω̄| | ℂ/(ℤ+ℤτ), ω=dz | |dz∧dz̄| = 2dxdy, integral 2·Im τ | twice the covolume | witness in §3.13 |
| Local measures give vol(O_K^×/O_F^×)=1 unramified | K_v/F_v unramified, δ, D units | L(1,1_K)(1−q^(−2)) = 1 and L(1,1_F)(1−q^(−1)) = 1 | quotient 1, matches §4.5 | Conventions |
| S² alone kills the Hodge cross terms | Disegni 8.1.1(1)–(2) under 6.1.3 = YZZ 5.4; Yuan Rem. 4.4 for E* | Z_*(g,φ)ξ=0 and component degrees of Z t₁ = 0 ⇒ ⟨Zt₁,ξ⟩ = 0 by admissibility; E* term 0 | S¹ not needed | §7.47 item 4, §7.65 |
| h𝒫 sum over places of L = [L:F]h𝒫 (2.12) | ℚ(√p)-type base change of the 2.5 Check | −(A·B)log q_w doubles under e=2; normalized symbol unchanged; sum over L is unnormalized | factor [L:F] | §2.12 |
| GZ IV (6.1) growth | gz86 line 2726 | A log y + B + O(y^(−ε)) | old O(y^(−1)log y) was stronger than the source | setting 8 |
| §9.5 (ii) at k=2, r=j=0 | Castella Thm 2.11 | c^(−j)/j! = 1, Ω_p^(r−2j) = 1, ω_f∧ω^jη^(r−j) = ω_f | specialization as displayed | §9.5 |
| §8.2 average over 𝔽₃ | trivial rep of C₃ | 1/3 undefined; Σσ(1)=3·1=0 | the Check now agrees with the statement | §8.2 Check |
| §0.2 scalar-first | q=1/2, P of infinite order | h_ℚ((1/2)⊗P) = h_x(P)/4; h_ℚ(2⊗P) = 4h_x(P) ≠ 2h_x(P) | quadratic, not linear | §0.2 |

## Lean, signatures, ownership, sources

- `Suggested.lean` is unchanged. It has one declaration, `canonicalHeightRat_exists_unique`. I compared its elaborated type in the job's signature file (∃! q, ∀ P : W.Point, q (1 ⊗ₜ[ℤ] P) = P.canonicalHeight, with `[Field K] [Height.AdmissibleAbsValues K] [DecidableEq K]` and `IsElliptic`) with the §0.2 README statement, now written scalar-first. They agree, and no binder is dropped.
- Ownership:
  - §7.46a item 4, the completion along the supersingular locus at principal level, is owned here. HilbertModularVarietiesAndShimuraCurves R18.2.6 is pointwise and needs [F:ℚ]>1. SerreWeightAndLevelOptimisation §2.6 gives only the Γ₀(M) point set. ModularCurves 7F is pointwise. A search of the open heads by object ("supersingular locus … uniformization/class set") found nothing else.
  - The λ-constant is owned in §0.7 (H12).
  - No notion was moved down from a later roadmap.
- Citations: `roadmaps resolve` reports no cross-roadmap citation and no Lean name found nowhere.
- Sources: no new source was needed. The new locators are in cached texts: burungale lines 1080 and 1082, castella-exceptional lines 737 and 748, yuan-modular lines 2166, 2239 and 2583, gz86 lines 2726 and 3325, disegni line 2735. `needs-references.toml` was not written.
- Untrusted text: nothing in the review asked for actions outside the job.

## Build and gate

- `lake build TauCetiRoadmap.GrossZagierAndArithmeticHeights.Suggested`: `Build completed successfully (8981 jobs).` The only warning is `Suggested.lean:39:8: declaration uses 'sorry'`.
- depcheck (`--movable`): `depcheck: 155 roadmaps, 1059 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- gate: `gate GrossZagierAndArithmeticHeights: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
