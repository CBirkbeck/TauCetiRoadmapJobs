<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1034#issuecomment-6377817475 -->
Review (claude) of 30d52b9

Verdict: needs changes

1. **F01** (P1) Gaps G1, G2 and G3 are unowned and absent from the README

   - **Location.** `packages/ArithmeticKTheoryPartII/design/plan.json`, top-level `gaps` entries `G1`, `G2`, `G3` (no `supplier`, no `section`). `packages/ArithmeticKTheoryPartII/README.md`, `## Exact supplier contracts`, lines 31–157.
   - **Claim.** The plan declares three gaps that no roadmap owns and that the README never states as contracts.
   - **Witness.** The brief lists `gap:G1`–`gap:G3` with supplier `none`. `grep -n "gap:" README.md` returns 15 contracts (lines 57–157), none of them G1, G2 or G3.
   - **Repair.** G1 (coherent ppav realization, Moore smashing at p = 3, coherent or strict action) is exactly the content of `gap:graded-moore-realization` (README line 111, supplier EtaleHomotopyTypes EH.5, EH.6 and G7): give G1 that supplier and section, or fold it into that slug. G2 (Hurewicz endpoint 2p−2) and G3 (the boundary p = max n_j) are prerequisites of no statement: §8.3 stops at 2p−3 (line 937) and §8.6 assumes n_j < p (line 979). Remove both from the gaps list; their mathematical content is recorded under Source issues below. The package stage may only add gaps to plan.json, so this re-assignment and removal needs whoever maintains plan.json. Tested: after the change every gap in plan.json has a named supplier and the same slug in the README.

2. **F02** (P2) Two gaps ask a supplier for what this roadmap's own targets state

   - **Location.** README line 127: "Provide relative chain quotients and long exact sequences, the natural inverse-bar comparison and the finite and compact relative homological Hochschild–Serre edges". Line 129: "Provide completed relative bar homology and its continuous universal-cocycle property".
   - **Claim.** These items are missing from every supplier and must come from ArithmeticGaloisDuality.
   - **Witness.** §5.3 (line 669) makes the comparison a target here: "Supply an explicit natural chain equivalence with Mathlib's inhomogeneous-chain convention". §7.1 (line 782) states as its own law: "Continuous cocycles factor uniquely through completed H₁". That gives two owners for each object.
   - **Repair.** Delete "the natural inverse-bar comparison" from `gap:relative-homology-edges`. Delete "and its continuous universal-cocycle property" from `gap:compact-relative-cocycles`. Make both deletions on README lines 127 and 129 and in the matching plan.json `needs`. In §5.3, replace "through the relative homology contract" (line 678) with the comparison in every degree, [g₁|…|g_n]⊗m ↦ [g_n⁻¹|…|g₁⁻¹]⊗m. This roadmap introduces the left-coefficient convention, so it owns the comparison. Tested: for n = 1, 2 the formula gives the stated T₁ and T₂. For C₃ acting on 𝔽₇ by 2 it sends d_FGV([g]⊗1) = 1 to the native boundary of [g⁻¹]⊗1, which is 2·1 − 1 = 1.

3. **F03** (P2) Two gaps ask for what roadmaps on main already provide

   - **Location.** README line 69 (`gap:topological-symplectic-hodge`): "Provide the contractible compatible-complex-structure comparison Sp(ℝ) ← U, its ku/KU realization, …". Line 117 (`gap:cyclotomic-p-class-fields`): "… with the native Picard p-parts, compatibly in towers, with principal-p-prime splitting …".
   - **Claim.** No supplier on main provides these items.
   - **Witness.** The first is on main in `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md` line 162 (§C2.1): the polar factors of a symplectic matrix are symplectic, and the positive factor contracts to the identity. So U(n) = Sp_ℝ ∩ O_ℝ is a deformation retract of Sp(2n,ℝ), which is the input at FGV line 841. The second is in `TauCetiRoadmap/ClassFieldTheory/README.md` lines 1828–1835 (Layer 13): `hilbertClassField`, `gal_hilbertClassField_equiv_classGroup` and the splitting criteria.
   - **Repair.** Add a "From TauCetiRoadmap.SymplecticGeometry" contract that cites CotangentLagrangian §§C2.0–C2.1 for U(g) ≃ Sp_2g(ℝ). Name the Layer 13 declarations in the ClassFieldTheory contract. Then trim both `needs`, in the README and in plan.json, to what is actually missing. For the first gap that is the ku/KU realization of the unitary model, the tangent-normalized Chern pairing, the integral lifts for m < p and Bockstein compatibility. For the second it is H_q as the fixed field of the prime-to-p part, compatible along the cyclotomic tower, together with the local p-split comparison. Tested at q = 3: Gal(H₃/K₃) ≅ Cl(ℤ[ζ₃]) ⊗ ℤ₃ = 0 follows from the cited isomorphism alone.

4. **F04** (P2) Quillen's finite-field groups are credited to the wrong supplier, and the sphere-unit gap bundles a supplied comparison

   - **Location.** README line 15: "KTheoryFiniteLocalFields §§1.1–1.2 owns finite-field Bott and unit comparisons". Line 145: "Consume Quillen finite-field K-groups, Bott classes and coefficient comparisons". `gap:sphere-unit-finite-field`, line 147.
   - **Claim.** KTheoryFiniteLocalFields §§1.1–1.2 supply K₂ᵢ₋₁(𝔽_q).
   - **Witness.** At its open head, KTheoryFiniteLocalFields §1.1 covers coefficient groups and products, and §1.2 covers Bott classes. Its own contract says that GeneralAlgebraicKTheory §§13.8a–c supply the finite-field calculation. That calculation is `finiteFieldKGroups` in §13.8c (K₂ᵢ₋₁(𝔽_q) ≃ ℤ/(qⁱ−1)).
   - **Repair.** Cite GeneralAlgebraicKTheory §13.8c `finiteFieldKGroups` (with §13.8b) in the GeneralAlgebraicKTheory contract and in the §7.6 Needs line (line 871). Restrict `gap:sphere-unit-finite-field` to surjectivity of π^s_(4k−1)(S;ℤ_p) → K_(4k−1)(𝔽_ℓ;ℤ_p) for ℓ topologically generating ℤ_p×. The comparison K_(4k−1)(ℤ;ℤ_p) ≅ K_(4k−1)(𝔽_ℓ;ℤ_p) then follows from three pieces. ArithmeticKTheory §6.16 says ordinary and Bott-inverted K-theory agree for i ≥ 2 over ℤ. ArithmeticKTheory §6.15 identifies odd Bott degrees with H¹(ℤ/q(j)). The restriction H¹(ℤ[1/p];ℤ_p(2k)) ≅ H¹(𝔽_ℓ;ℤ_p(2k)) should be stated as a target in §7.6. Tested at p = 3, k = 1, ℓ = 2: both sides are ℤ₃/(2²−1) = ℤ/3 = K₃(ℤ;ℤ₃).

5. **F05** (P3) Locators off by a page or a label

   - **Location and witness.**
     - Line 21, "§1.4, p. 7, FGV line 271": FGV line 271 is on p. 6. Write pp. 6–7.
     - Line 183, "equations (2.3)–(2.4), author copy pp. 10": (2.4) is at FGV line 472, p. 11. Write pp. 10–11.
     - Line 287, "Remark 2.8 and §3.6, author copy pp. 11–12, 22": Remark 2.8 (FGV lines 503–509) lies entirely on p. 11. Write pp. 11, 22.
     - Line 321, "Definitions 4.2–4.4": 4.2 is a Remark (FGV line 1075). Write Definitions 4.3–4.4.
     - Line 466, "Corollary 3.6 and §3.4, author copy pp. 20–21": Theorem 3.5 starts at FGV line 871, p. 19. Write pp. 19–21.
     - Line 737, "§7.3, equations (7.12)–(7.19), author copy pp. 41–42": (7.12) is in §7.2, p. 40 (FGV line 1865). Write §§7.2–7.3, pp. 40–42.
     - Lines 965 and 967, "FGV line 40": that line is the page marker. The formula is at FGV line 43.
   - **Repair.** Make the corrections listed. Every theorem number cited was found at its stated statement.

6. **F06** (P3) §2.4 states a ratio where FGV Proposition 4.7(i) states a product

   - **Location.** Line 385: "whose underlying ideal classes satisfy [B₁][B₂]⁻¹=[L][bar L]⁻¹".
   - **Claim.** The cited Proposition 4.7 gives the ratio form.
   - **Witness.** FGV line 1234 gives the product [B₁][B₂] = [L][L̄]⁻¹, built from O_q and L⊗L̄⁻¹ tensored with X and X⁻¹ (FGV lines 1247–1261). The ratio form is also true (tensor both with the same X), but the locator does not state it. §3.5's four-class difference (line 481) is the device for the product form.
   - **Repair.** Either state the source's product form and keep §3.5 as written, or keep the ratio form, cite it as a variant of the proof of Proposition 4.7, and use the two-class difference in §3.5. Tested with the ratio form: the Betti difference is tr(β^(2k−1)([L]−[L̄])) = 2·tr(β^(2k−1)([L]−1)), the value §3.5 needs.

7. **F07** (P3) §4.2 rigidifies only the selected factor, and the notation ℤ(T) collides with ℤ

   - **Location.** Line 544: "Rigidify the selected factor in A(T) by a projective embedding". The same paragraph and line 581 write "ℤ(T)"; line 568 writes "Z_C(T)".
   - **Claim.** This is the FGV atlas.
   - **Witness.** FGV line 2775 embeds the ambient abelian scheme A (O(1) restricts to 3Δ*L on A). If only eA is embedded, the summand A_* is not rigidified, and the functor of tuples (A,L,φ,j) is not represented by a scheme. ℤ(T) also clashes with ℤ^T in §4.1.
   - **Repair.** Embed the ambient A as FGV does, or say that U(T) is built on the equivalent stack ∏_(t≠*)(∐_g A_g) of FGV (A.12). Rename the simplicial scheme with one non-ℤ letter, say 𝒵(T), on lines 544, 568 and 581.

8. **F08** (P3) §8.4 bundles four theorems under one Needs line, and one of its Checks fails for even m

   - **Location.** Line 951 states integral stability for Sp_2g(ℤ) with finite generation, finite generation of KSp_i(ℤ), the equivariant Hurewicz-quotient isomorphism and the Hodge pairing. Line 961 is a single Needs line for all four. The Check on line 958 reads "m<p gives 2m≤2p−4".
   - **Claim.** Every even application degree 2m with m < p lies in 1 ≤ i ≤ 2p−3.
   - **Witness.** At p = 5 and m = 4, 2m = 8 = 2p−2, which is outside the range. The Check holds only for odd m: m ≤ p−2 gives 2m ≤ 2p−4.
   - **Repair.** Split §8.4 into separate targets, each with its own Needs line. Restate the Check as "odd m < p gives m ≤ p−2, hence 2m ≤ 2p−4". If the stability theorem counts as a headline, it is statable at the pins (`Matrix.symplecticGroup`, `groupHomology`, `groupHomology.map` along a block-sum homomorphism): state it in Suggested.lean or name it in the module docstring.

9. **F09** (P3) The Suggested.lean docstring gives the wrong reason for leaving §2.4 unstated

   - **Location.** `Suggested.lean` lines 12–13: "Realization of CM types with prescribed ideal differences lacks the polarized coefficient-line groupoids and their CM realization functor."
   - **Claim.** The statement needs the ST functor.
   - **Witness.** §2.4 never uses ST. A rank-one P⁻ object is a fractional ideal B with δ ∈ K, δ̄ = −δ and δBB̄ = 𝔡⁻¹, of type {τ : Im τ(δ) > 0} (FGV lines 1245–1258). What the pin actually lacks is conjugation of fractional ideals: `FractionalIdeal.map` (Mathlib/RingTheory/FractionalIdeal/Operations.lean:67) needs an 𝓞K-algebra map.
   - **Repair.** State the accurate reason (no conjugate fractional ideals or skew-Hermitian rank-one lines at the pin), or state the theorem on integral ideals through `Ideal.map (IsCMField.ringOfIntegersComplexConj K)`, as `exists_split_prime_with_signs` does.

10. **F10** (P3) The "Λ-projective M" hypothesis in §5.4 is not needed

   - **Location.** Line 695: "For Λ-projective M, if H₀(H;M)=H₁(H;M)=0, forgetting the section is an equivalence".
   - **Claim.** Projectivity is required.
   - **Witness.** FGV Lemma 7.6 (lines 1760–1774) has no such hypothesis. Coinvariants send projective Λ[H]-modules to projective Λ-modules, so the spectral sequence Ext^p_Λ(H_q(H;M),T) ⇒ Ext^(p+q)_Λ[H](M,T) holds for every M, and H₀ = H₁ = 0 kills both Hom and Ext¹.
   - **Repair.** Drop "For Λ-projective M". The next sentence already records that only finite free M are used.

11. **F11** (P3) The proof route of §0.4 re-proves ArithmeticKTheory §6.11

   - **Location.** Line 226: "Use Poitou–Tate to dualize the transfer into restriction on compactly supported H¹. Apply the compact-support Hochschild–Serre edge". Line 224 itself says "Use the supplied top-degree corestriction descent".
   - **Claim.** The route needs its own Poitou–Tate argument.
   - **Witness.** ArithmeticKTheory §6.11 (`cyclotomicH2Descent`, at its open head) already proves that corestriction gives H²(O_(E,T),μ_m^(⊗(i+1)))_G ≃ H²(O_(F,S),μ_m^(⊗(i+1))) for odd ℓ. This is the same argument.
   - **Repair.** Route instead through `cyclotomicH2Descent` with E = K_q, F = ℚ, m = q, i+1 = 2k, then the §6.15 edge and `gap:duality-transfer`. Drop the ArithmeticGaloisDuality §R02.4.3 and R02.2 items from line 233.

12. **F12** (P3) Leftover catalogue fragments, a garbled sentence, and a manifest nit

   - **Location.** Line 863: "Invoke the precise sphere-unit/finite-field contract the sphere-unit contract and the norm-residue comparison." Lines 203, 283, 307, 341, 429, 540, 564, 601, 665, 691, 797 and 919 are fragments left over from catalogue fields ("This interface …", "Its downstream uses are: …"). In `sources.toml`, `charney1987` has `authors` as a string where the other entries use arrays, and its locator "pp. 107–125" is the article's page range.
   - **Repair.** Rewrite line 863 as one sentence. Turn the fragments into full sentences or delete them. Give `authors` as an array and write the locator as "Corollary 4.5".

## Verified sound

**Elaboration.** `lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the content checkout, exits 0. Its only message is "declaration uses `sorry`" at line 49. A scratch `#check @exists_split_prime_with_signs` shows every binder explicit (p, n, primality, p ≠ 2, 0 < n, K with `NumberField`, `IsCyclotomicExtension {p^n} ℚ K`, `IsCMField K`, ε), matching README §2.3; nothing changed. `[IsCMField K]` is needed for elaboration: `IsCyclotomicExtension.Rat.isCMField` (Mathlib/NumberTheory/NumberField/CMField.lean:563) is a theorem, not an instance. Form checks: one `import Mathlib`; no `set_option`, `lemma`, `#eval` or sorry'd data; the namespace, layer comment and docstrings are correct.

**Padding probe.** On a scratch copy, `simp`, `rfl`, `infer_instance`, `aesop` and `norm_num` all fail on the one theorem, so it is not padding.

**Headline inventory.** End theorems: finite universality (§6.3), p-adic universality (§7.2), locally split universality (§7.4), Bott-inverted universality (§7.5), triviality in degree 4k−1 (§7.6) and Bernoulli divisibility (§8.6). Deep intermediate results: §§2.3, 2.4, 3.4, 3.5, 4.4, 4.5, 5.1, 5.4, 7.7, 8.2–8.5. Only §2.3 is stated. All the others lack KSp, ppav moduli, Chern classes, relative group homology or Hilbert class fields at the pins and are named in the docstring (see R09 and R08 for two caveats). The dimension-only form of §8.5 would be a weakened substitute, so leaving it out is correct.

**Dependency check.** Output: `depcheck: 29 roadmaps, 266 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

**Supplier sections.** All 22 roadmaps cited resolve, and every cited section exists:
- On main: GeneralizedCohomology G2.1–G2.8, G5.4–G5.6; ClassFieldTheory Layers 11–13 (`globalArtinMap_ideal` compares with `artinHomAway`); Chebotarev Layer 10; EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6; AlgebraicTopology Stage 6.
- At open heads: ArithmeticKTheory §§3.1–3.5, 5.2, 6.11, 6.15, 6.16, 7.1–7.5 (§7.1 fixes B₁ = −1/2); GeneralAlgebraicKTheory §§7.1–7.7; SchemeKTheoryOperations §§6.1, 6.9–6.11; StableHomotopyKTheory §§3.20, 3.34–3.37, 4.21–4.27, 5.1–5.19, 7.1–7.17, 7.28; GeometryOfNumbersAndQuadraticArithmetic §§6.5–6.8a, 6.10a, 6.11; HermitianKTheoryOfPoincareCategories Layers 4–6; ComplexMultiplicationAndExplicitReciprocity §§1.3, 2.1, 2.2; AbelianSchemesAndArithmeticModuli §§A5.5, A5.8; PELModuli §§M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9; ArithmeticGaloisDuality R02.1, R02.2, R02.4.3; IntegralIwasawaTheory §§3.1, 7.4, 12.3; KTheoryFiniteLocalFields §§1.1, 1.2 (content mismatch in R04); ArithmeticLocallySymmetricSpaces §§ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4.
- TopologicalKTheory T4, T5, T7: an open pull request by another author that adds a new folder, which the brief allows as a supplier.
- Board designs: ChromaticHomotopyTheory CH.2, CH.3; EtaleHomotopyTypes EH.5, EH.6, G7.
- The resolver lead "BorelRegulators §2.1" is a board design at merge-order position 166. Its §2.1 is the Chern-normalized GL_b(ℂ) regulator class, and the README uses it only as a scope boundary, which is correct.

**Merge order.** Every supplier is on main or earlier in ORDER.txt than this roadmap (position 224), except TopologicalKTheory, which is allowed as above.

**Gaps.** The 15 slugged gaps match between README and plan.json. Precise and minimal, apart from R02–R04: duality-transfer, skew-integer-splitting, compatible-v1-towers, ppav-embedding-atlases, cm-arbitrary-automorphism, low-postnikov-finite-type, bernoulli-weight-nonvanishing, pontryagin-bockstein-cap, graded-moore-realization, lisse-integral-extension. On the last: EtaleCohomologyFoundations F.4.5 has only a rational Check on representations, not the integral equivalence.

**Ownership.** Searched by object across main, the open pull requests and the board packages: homological stability for Sp_2g(ℤ) (Charney), Borel's stable symplectic cohomology, integral indecomposables, skew-Hermitian CM line groupoids, and contractibility of compatible complex structures. The only prior owner found is SymplecticGeometry (R03). The EtaleHomotopyTypes design leaves the A_g-specific identification to its owner, so this roadmap owns the KSp action and symplectic stability.

**Pinned declarations opened.**
- Mathlib/RingTheory/PicardGroup.lean:77 `Module.Invertible` (bijective contraction) and :429 `CommRing.Pic`.
- Mathlib/RepresentationTheory/Basic.lean:48 `Representation` (no topology).
- Mathlib/Algebra/Module/LinearMap/Defs.lean:84 `LinearMap`.
- Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:125 `inhomogeneousChains.d` (uses ρ(g₀)⁻¹), :154 `inhomogeneousChains`, :228 `groupHomology`.
- Mathlib/CategoryTheory/Comma/Over/Basic.lean:631 `Under`.
- Mathlib/NumberTheory/NumberField/CMField.lean:69 `IsCMField` and :236 `ringOfIntegersComplexConj`.
- Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:125 `maximalRealSubfield`.
- TauCeti/Geometry/Symplectic/ExistsCompatible.lean:188 `exists_compatible`; its docstring at :185 requires ω(v,Jv) > 0, which confirms the −J_H adapter.
- TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean:181 `artinHomAway` and :218 `artinHomAway_apply_prime`.

**Definitions.** Each of the 14 definitions and constructions (§§0.1, 0.2, 1.1, 1.2, 2.1, 2.2, 3.1, 4.1, 4.2, 4.4, 5.2, 5.3, 7.1, 8.1) has an API and at least three computed Checks. Every layer ends with Examples and Dependencies. There are no LaTeX delimiters, process words or pull-request numbers.

**Locator sample.** All 15 sampled targets and §2.3 were checked against the FGV author copy:

| Target | FGV locator checked | Outcome |
| --- | --- | --- |
| 0.2 | Def. 2.6, (2.3)–(2.4), lines 446–472 | supports; README fixes the R× misprint; page R05 |
| 1.2 | Rem. 2.8 line 503; §3.6 line 964 | supports (m = 2pⁿ⁻¹(p−1)); page R05 |
| 3.5 | Prop. 5.1 line 1306; §5.3 lines 1447–1483 | supports |
| 3.6 | Cor. 3.10 line 989; Rem. 3.11; Rem. 7.15 | supports |
| 4.2 | App. A.4 lines 2773–2785 | supports, except rigidification (R07) |
| 4.3 | Ex. A.11, Prop. A.13 lines 2678–2789 | supports |
| 5.1 | Thm 6.6 lines 1613–1656 | supports (w_(cτ) = c w_τ as at line 1617) |
| 6.1 | Lemma 7.7 lines 1805–1871 | supports |
| 6.2 | (7.12)–(7.19) lines 1865–1965 | supports; page R05 |
| 7.4 | Thm 7.10, Rem. 7.11 lines 2044–2061 | supports |
| 7.5 | Thm 7.14, Rem. 7.15 lines 2133–2151 | supports |
| 7.6 | §7.7, Rem. 7.16 lines 2154–2187 | supports |
| 7.7 | Rem. 7.9 line 2036 | supports; README fixes ℘(q) to ℘(q)^c |
| 8.3 | Thm 8.4 line 2295 | supports the restricted range |
| 8.6 | Thm 8.1 line 2217 | supports with strict p > n_j |
| 2.3 (Lean) | Lemma 4.8 lines 1263–1293 | supports; the Lean form is stronger, but the proof gives the split condition |

borel1974 lines 1154, 1194 and 1246–1249 support §8.5 (Sp_2n at a real place: P({x_i, 4i−2}), pp. 265–266).

### Adversarial table

| Statement | Instances | Values computed (source / roadmap) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: Frobenius | Frob₂ on μ₅, twist 3 | arithmetic 2³ = 8 ≡ 3; geometric 2⁻³ ≡ 3³ ≡ 2 | matches line 23 | none |
| Conv.: hyperbolic H | q = 5, rank one | c_B H = 1+ψ⁻¹ = 2; 1/2 = 3; 3·2 ≡ 1 | correct | none |
| Conv.: Gaussian sign | b(1,1) = i/2, Φ = id | h(1,1) = 1; b(1,i) = 1/2, Tr = 1, ω(1,i) = −1; h(1,i) = −i; ω(v,J_H v) = −1 < 0, so J = −J_H | correct | none |
| 0.1 | q = 5, a = 2; q = 3 | β ↦ 2β; Lemma 2.3 needs q > 4 (line 356) | correct | none |
| 0.2 | ℤ: 2ℤ→3ℤ; field F | 3/2 ∉ ℤ×, (3/2)·2ℤ = 3ℤ; π₀ = 1, π₁ = F× | correct (FGV misprint) | none |
| 0.3 | q = 3, k = 1 | Pic(ℤ[ζ₃]) = 1 ⇒ (+) = 0; H²(ℤ[ζ₃,1/3],μ₃) = Pic/3 ⊕ Br[3] = 0 | consistent | none |
| 0.4 | q = 3, k = 1 | K₂(ℤ;ℤ/3) = K₂(ℤ)/3 ⊕ K₁(ℤ)[3] = 0 = coinvariants of 0 | consistent | R11 |
| 0.5 | q = 3 (regular) | H₃ = K₃; H₁(C₂;ℤ/3(1)) = 0 since c = −1 | consistent | none |
| 1.1 | plane; rank-one H | c_B = 2, c_H = 1; ψ⁻¹ on π_(4k−2)ku is (−1)^(2k−1) = −1 | correct | none |
| 1.2 | q = 3, 5, 25 | m = 4, 8, 40 | correct | none |
| 2.1 | ℚ(i); K₅ | U₁(ℤ[i]) = μ₄; U₁(O₅) = μ₁₀ ≠ μ₅; (−ι)⊗(−ι) = ι | correct | none |
| 2.2 | ℚ(i) | g = 1, lattice rank 2; ×2 has det 4 and scales the form by 4 | correct | none |
| 2.3 / Lean | q = 3 (K⁺ = ℚ); q = 5 | 7 = (3+ζ₃)(3+ζ̄₃) = 9−3+1; ±7 give both signs; 2 inert; t = ±3 gives P = P̄, excluded; q = 5: 11 = (4+√5)(4−√5), times the unit φ gives signs (+,−) | true | none |
| 2.4 | q = 5, Φ = {1,2}, {4,2} | product form and ratio form both realizable | true; locator | R06 |
| 3.1 | q = 5, k = 1 | {1,2}: 3; {4,2}: 6 ≡ 1 | correct | none |
| 3.2 | q = 5, i = 1, 2 | i = 1: 3 vs 1, difference 2; i = 2: 5 ≡ 0, 20 ≡ 0 | correct | none |
| 3.3 | q = 5 unit term | Σa = 10 ≡ 0, Σa³ = 100 ≡ 0; Σa⁴ = 4 ≢ 0 | oddness essential | none |
| 3.4 | p = 3 | KSp₃(ℤ;ℤ₃) = K₃(ℤ;ℤ₃) = ℤ/3; KSp₂ = 0 ⊕ ℤ₃; i ≡ 0, 1 mod 4 give 0 | matches Cor. 3.6 | none |
| 3.5 | q = 5 | transfer 1 → Betti 2 → ×3 → 1 | correct | R06 |
| 3.6 | i = −2, −4, 1 | ψ⁻¹ on π_(2j)KU: j = −1 gives −1, j = −2 gives +1; at i = 1 both (+) parts are 0 | correct | none |
| 4.1 | T = {*,a,b}; {*} | (1,2) folds to 3; b ↦ * selects 1; at {*}, eA = 0 and the nerve is contractible | correct | none |
| 4.2 | r = 0, 1 | Z₀ = U(T); Z₁ has 2 embeddings and 1 isomorphism | correct | R07 |
| 4.3 | g = 0, 1 | A₀ = point; π₁ = SL₂(ℤ), H₁ = ℤ/12 | correct | none |
| 4.4 | σ, τ; p = 3, 5 | σ(τX) = (στ)X; H₁(SL₂ℤ;𝔽₃) = 𝔽₃, with 𝔽₅ it is 0; H₁(Sp₄ℤ) = ℤ/2 | correct | none |
| 4.5 | q = 3, 5 | φ(q) = 2, 4; CM genus 1, 2 | correct | none |
| 5.1 | σ = c; minus class a of order 3 | X = (O,−1), Φ ↦ Φ̄; aca⁻¹ = a²c ≠ c | correct | none |
| 5.2 | H = G; G = 1, M = T = Λ | M→M is initial and terminal; πs = id_M, sπ ≠ id_V | correct | none |
| 5.3 | C₃ on 𝔽₇ by 2; C₂ sign on ℤ/5; S₃ | d_FGV = 1, d_native = 4−1 = 3; after T₁: 2−1 = 1; H₁(C₂,1) = ℤ/5 by the long exact sequence; a(sr,1) = 1 = 1+0 | correct | R02 |
| 5.4 | C₂, H = 1, ℤ/5 sign | c(m,t) = (−m,t+m), c² = id; c(m,2m) = (−m,3m) = (−m,2(−m)) | correct | R10 |
| 6.1 | q = 5 | c is +1 on T_q, −1 on M_q | correct | none |
| 6.2 | χ = 2, k = 2 | 2³ ≡ 3 versus 2² = 4 | correct | none |
| 6.3 | q = 5 | c_B(3Hx) = 6x ≡ x | correct | none |
| 7.1 | Γ = ℤ_p; C₂ sign | relative H₁ = ℤ_p in both, by the long exact sequence | correct | R02 |
| 7.2 | p = 3, k = 1; p = 691, k = 6 | K₂(ℤ;ℤ₃) = 0; 691 divides the numerator of B₁₂ ⇒ kernel ≠ 0 | correct | none |
| 7.3 | q = 3 | H₃ = K₃, D = ⟨c⟩ = C₂, both relative H₁ = 0 | correct | none |
| 7.4 | p = 3, k = 1 | zero kernel; H₀(G_𝔭;ℤ_p(2k−1)) = 0 via χ = −1 | correct | none |
| 7.5 | q = 5, k = 0 vs 2 | twist −1 ≡ 3 mod 4; degrees −2 and 6 differ by 8 | correct | none |
| 7.6 | p = 3, 5, k = 1 | K₃(ℤ) = ℤ/48; H⁰(ℤ′,ℚ₃/ℤ₃(2)) = ℤ/3; with χ¹ it would be 0 | correct | R04, R12 |
| 7.7 | torsor ℤ/3 | minus: one fixed point; plus: three fixed points | correct | none |
| 8.1 | point; T²; RP∞ at p = 2 | 0; ℤ_p² with the product dead; ℤ/2 exactly in degrees 2^a−1 | correct | none |
| 8.2 | K(ℤ/p,1)² | Tor(H₁,H₁) = ℤ/p in degree 3, equal to β₁(xy) | correct | none |
| 8.3 | K(ℤ/3,1), p = 3 | Q₁ = ℤ/3; Q₃ = 0 because γ₂y = y²/2; at degree 5 = 2p−1, β(γ₃y) survives while π₅ = 0 | range is needed | none |
| 8.4 | p = 5, m = 3, 4 | 2·3 = 6 ≤ 6; 2·4 = 8 = 2p−2 | Check false for even m | R08 |
| 8.5 | degrees 2, 4, 6; χ = 2 over ℚ₅ | bases {x₂}, {x₂²}, {x₂³, x₆}; weights 1/2, 1/4 | correct | none |
| 8.6 | (11), p = 691; d = 0; p = n = 3 | B₁₂ = −691/2730; antecedent false at d = 0; ch₃(L) = c₁³/6; B_(p+1)/(p+1) ≡ 1/12 mod p | correct | none |

## Not verifiable

- **charney1987, Corollary 4.5.** It is paywalled and settled as uncertified, so I could not confirm that it holds with integral coefficients or check its exact range. FGV restates it twice, with ranges that differ by one (see Source issues). The README uses the stricter g > 2i+5.
- **The FGV journal version.** Only the Berkeley author copy was read. The manifest's claim that the journal numbering agrees with it was not checked.
- **Open pull requests.** The brief gave no paths for sibling checkouts, so open-PR roadmaps were read at the heads of the 2026-10-24 index with `roadmaps show`. BorelRegulators is listed in the brief as an open pull request but is not in that index; its board design was read instead.

## Source issues

- **Misprint** in FGV at Definition 2.6, p. 10: the source says morphisms I→I′ of fractional ideals are units x of R with xI = I′; it should be x ∈ Frac(R)×, since units of R force I = I′; affects nothing.
- **Error** in FGV at §5.1.2, p. 30, and the proof of Theorem 6.6(ii), p. 36: the source says Aut(L,b) = U₁(O_q) is μ_q (≅ ℤ/q); for odd q it is μ_(2q), which contains −1; affects nothing.
- **Misprint** in FGV at Definition 7.3, p. 37: the source says s∘π = id_M; it should be π∘s = id_M; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44: the source says Vandiver is equivalent to ℘(q) being a singleton; it should be the c-fixed set ℘(q)^c, as the argument shows; affects nothing.
- **Misprint** in FGV at §7.7, footnote 13, p. 47: the source says ℤ_p× acts on ℚ_p/ℤ_p(2k) via χ^(2k−1); it should be χ^(2k), since otherwise H⁰ would be 0 at p = 3, k = 1; affects nothing.
- **Misprint** in FGV at §7.7, p. 47: the source credits injectivity of c_B to Theorem 3.3; it should be Theorem 3.5; affects nothing.
- **Misprint** in FGV at §7.3, p. 41: the source writes β^(k−1)[(X,q)]; it should be β^(2k−1); affects nothing.
- **Misprint** in FGV at §6.3 and Theorem 6.6, pp. 35–36: the source places the lift differences in Gal(H/K)^ab; it should be Gal(H/E) for the CM field E, which is already abelian; affects nothing.
- **Misprint** in FGV at the proof of Proposition 6.1, p. 34: the source reduces to g = φ(q), but CM varieties from P⁻ have genus φ(q)/2; it should also stabilize by a rational ppav from φ(q)/2 up; affects nothing.
- **Misprint** in FGV at §1.1, p. 1, versus §8, p. 48: the source states Charney's range as g ≥ 2i+5 and as i < (g−5)/2; it should state one range consistently, as fixed by Charney's Corollary 4.5; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 59: the source says the Rosati involution is defined by φ; it should be the involution defined by the polarization L; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 60: the source calls U(T) quasi-projective over ℚ; ranging over all genera and embedding dimensions, it should be a disjoint union of quasi-projective schemes; affects nothing.
- **Gap** in FGV at Theorem 8.1 and its proof, p. 48: the source allows p ≥ max n_j, claiming that ch_(n_i) is then ℤ_(p)-integral; it should assume p > max n_j, since at p = n_j, n_j! contains p (ch₃(L) = c₁³/6); affects a stated result.
- **Gap** in FGV at the proof of Theorem 8.4, p. 50: the source says τ_(≤2p−2)X splits as a loop space; the P¹ k-invariant of the delooping links π₁ to π_(2p−2), so it should only claim the splitting through 2p−3; affects the proof.
- **Error** in FGV at Theorem 8.4 and §8.1, pp. 49–50: the source states it for any p-complete connected E with ℤ_p-homology; for ΣHℤ_p, H₁(K(ℤ_p,1);ℤ_p) = ℤ_p⊗ℤ_p ≠ ℤ_p, so it should assume finite-type integral E or completed homology; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "30d52b9", "job": "REV-PKG-ArithmeticKTheoryPartII", "model": "opus", "worker": "fable-rev43"} -->
