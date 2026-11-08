# Review of GL2AutomorphicRepresentationsAndTransfer (pull request #931 at ce17c6f)
**Verdict:** accepted

This is an incremental re-review of the 104 lines that changed in `TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/` since bf2abc9, which the previous review read. No finding remains. All five previous findings are repaired (see below), the gate passes, and the changed passages, their citations and the Lean statements they touch hold up.

## Previous findings

- R01 — repaired: `README.md:87–90` "AutomorphicGaloisRepresentations §§0.2a–0.2f owns … the analytic and overconvergent quaternionic forms, property (Pr) … and small-slope classicality. It builds them on R17.3.8a–R17.3.8d"; `:3434–3444` add the HilbertModularVarietiesAndShimuraCurves and AutomorphicGaloisRepresentations consumers.
  - Every object in the scope paragraph now has one named owner, and both consumers agree at their heads:
    - AutomorphicGaloisRepresentations (head f8d3cf8), README:273–287 and :300–318;
    - HilbertModularVarietiesAndShimuraCurves (head ec03322), §§R18.3.1–R18.3.3, R18.3.6, R18.3.8, R18.5.16a–c and R18.5.17a.
  - The previous repair's steps that named QuaternionicModularForms cannot be applied. That roadmap is on the project's dropped-names list ("other authors' pull requests whose material we own ourselves"), and the gate refuses any mention of a listed name (the `dropped` check). This brief also forbids citing it.
  - Owning the material here, without naming that roadmap, is therefore the settlement the project prescribes. A scratch README carrying the earlier wording passes depcheck, but the `dropped` check would refuse it.
- R02 — repaired: `:2034–2035` "On R17.3.8b's normed model with A ultrametric (Mathlib `IsUltrametricDist`) and U acting isometrically, `‖e_i‖≤‖|H_i|⁻¹‖`". The ℚ₅² counterexample from the previous review is now a Check (`:2069–2072`), and `IsUltrametricDist` is in the *Needs* line (`:2077`).
- R03 — repaired: `gl2IntegralMonoid` and `finrank_algWeight` are gone from both files (grep finds 0 hits). The module docstring reads "five definitions … (`gl2Integral`)" (`Suggested.lean:29–33`). The rank is stated in prose at `README.md:1805–1806`, and `:2122` reads "(`gl2Integral`, `gl2Integral_isHeckeTriple`)".
- R04 — repaired: [gross99] has no hits in the folder, and its reference line is deleted.
  - `:1972–1977` cites "[loeffler11], Definition 3.3.2 and Proposition 3.3.3(1), p. 17", with AutomorphicFormsOnReductiveGroups §7.4 for every algebra and level.
  - `:2079–2082` cites Definition 3.3.2 (p. 17) and Assumption 3.1.3 and Proposition 3.1.4 (p. 15).
- R05 — repaired: `:2107–2110` "`T_v` has the `q_v+1` cosets of AutomorphicLFunctionsAndLocalFactors AL.2.2.1, transported through `j_v` … transposition fixes `GL₂(𝒪_v)` and `diag(ϖ_v,1)`, so it turns this into the decomposition into the right cosets". AL.2.2.1 is added to the *Needs* line at `:2177–2178`.

## Verified sound

**Gate, build and dependency check (run on this head).**
- `tauceti-roadmap … gate … --base origin/main` reports every check at 0, including set_option, sorry-data, latex, imports, dropped, statement-hygiene, readme-ids-missing, depcheck, stray-files and outside-folder: OK.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean Suggested.lean` gives exactly 19 `declaration uses sorry` warnings and 0 errors, in about 7 s. The previous count was 20; `finrank_algWeight` is gone.
- Dependency check:

```text
depcheck: 245 roadmaps, 2483 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The two roadmaps the diff adds are consumers later in the merge order: HilbertModularVarietiesAndShimuraCurves (line 157) and AutomorphicGaloisRepresentations (162), against this roadmap's 94.

**Signatures.**
- I elaborated `Suggested.lean` once with `#check @name` appended for all 24 declarations (19 theorems, 5 definitions): 0 errors.
- The only flagged binder loss is unchanged and harmless. `gl2Integral` elaborates as `(L) [Field L] [ValuativeRel L] → Subgroup (GL (Fin 2) L)`: GL₂ of the valuation ring needs only the valuation. The three theorems that use it carry `[TopologicalSpace L] [IsNonarchimedeanLocalField L]`.
- No other type changed. `classicalForms_finrank` and `quaternionLevelForms_finite` keep `[Algebra.IsCentral F D]`, `[IsSimpleRing D]`, `finrank F D = 4`, the module topology and `IsOpen U`.

**One-tactic probe.** On a scratch copy, every `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | norm_num | decide`. All 19 fail with unsolved goals, at lines 87, 100, 144, 170, 193, 223, 229, 234, 261, 305, 333, 354, 370, 390, 408, 429, 448, 463 and 490. No padding was found.

**Headline inventory.** It is unchanged from the previous review apart from the deletion of the non-headline `finrank_algWeight`.
- Stated: Chevalley congruence, full-local prescription, supercuspidal projectivity, the quaternion ramification criterion and local-global isomorphism, and the R17.3.8 slash law and symmetric-power comparison. Also stated: level-form finiteness, the trivial-stabilizer dimension, the good-place relation and inversion, finite projective lifting, odd solvable Artin weight one over ℚ, Fong–Swan, the characteristic-two dihedral classification and characteristic-two solvable weight one.
- Not statable at the pins, and named in the docstring (`Suggested.lean:41–64`): R16.0, R16.2–R16.6; R17.1–R17.3 apart from R17.3.8a–d; R17.4; R17.5 over arbitrary fields; R17.6's exact-level and Katz results.

**Changed passages, checked line by line.**
- Scope (`README.md:87–94`): each item AutomorphicGaloisRepresentations is said to take from R17.3.8a–d exists here:
  - nebentypus monoids `:1847–1853`;
  - restricted-series slash `:1854–1862`;
  - norms `:1939–1948`;
  - stabilizer averaging `:2026–2039`;
  - coset decompositions `:2107–2116`;
  - commutative Hecke algebra `:2140–2147`;
  - norm bounds `:2153–2155`.
- AutomorphicGaloisRepresentations' own supplier contract for this roadmap (its README:300–318) lists the same objects. Its scope (README:273–287) assigns R17.3.8a–d here and §§0.2a–0.2f to itself.
- Downstream consumers (`:3434–3444`): I opened every cited section at its head.
  - HilbertModularVarietiesAndShimuraCurves (ec03322): §R18.5.16a (README:2355), §R18.5.16b (:2391), §R18.5.16c (:2421), §R18.5.17a (:2463), §R18.3.1 (:2793), §R18.3.2 (:2817), §R18.3.3 (:2843), §R18.3.6 (:2893) and §R18.3.8 (:2930) each cite R17.3.8a, b, c or d for the content the bullet names.
  - AutomorphicGaloisRepresentations (f8d3cf8): the *Needs* lines of §0.2a (README:824), §0.2b (:866–867), §0.2c (:961), §0.2d (:1032) and §0.2f (:1263–1264), and §0.3's text (:1277–1278, :1316), cite R17.3.8a–d. §0.2e (:1130) cites none, and the bullet correctly omits it.
- R17.3.8a source (`:1896–1898`): nt26 was fetched this round (arXiv 2212.03595v2). The weight-λ convention, "W^∨ has highest weight λ", is at nt26 lines 349–354, printed p. 8, inside §1.2 Notation (which begins at line 295). This matches the citation.
- R17.3.8b source (`:1972–1977`):
  - loeffler11 line 691 is Assumption 3.1.3, on p. 15 (page marker at line 671).
  - Lines 787–795 are Definition 3.3.2, and lines 800–816 are Proposition 3.3.3(1) with the evaluation map `f↦(f(µ_i))_i` onto `⊕W^{Γ_i}`, both on p. 17 (page markers at lines 767 and 817).
  - Loeffler's setting is narrower than the README's statement: coefficients over a characteristic-zero field E (line 722), levels whose p-component lies in the Iwahori-type G₀ of its Definition 2.4.6 (line 387), and action through `u_p`. The README attributes the general statement to AutomorphicFormsOnReductiveGroups §7.4, so the citation supports what it is cited for.
- R17.3.8c source (`:2079–2082`): Proposition 3.1.4 (loeffler11 lines 694–705, p. 15) gives finite index of `K∩Z(G)(F)` in `K∩G(F)`. The README cites it for exactly this.
- R17.3.8c bound (`:2034–2036`): under the ultrametric inequality, `‖Σ_h a|h‖ ≤ ‖a‖` for isometric h, so `‖e_i‖ ≤ ‖|H_i|⁻¹‖`. "Exceeds one exactly when the residue characteristic divides |H_i|" holds for a nonarchimedean field R in which |H_i| is a unit: `|n|<1` iff n lies in the maximal ideal.
- R17.3.8d cosets (`:2107–2110`): AutomorphicLFunctionsAndLocalFactors (head 4ea5784), AL.2.2.1, README:1647, gives `U t_v U=⊔_r ι_v(r)U` with `r_u=[[ϖ_v,u],[0,1]]` and `r_∞=diag(1,ϖ_v)`. Transposition is an anti-automorphism fixing `GL₂(𝒪_v)` and `diag(ϖ_v,1)`, so `(rU)ᵀ=Urᵀ`. The script below confirms this.
- Manifest: `sources.toml` records loeffler11 with "Assumption 3.1.3 and Proposition 3.1.4 (p. 15); Definition 3.3.2 and Proposition 3.3.3(1) (p. 17)". There is no gross99 entry.

**Adversarial pass.** Rows marked (script) were computed this round by a Python script in the scratch directory. Rows marked "carried (r7)" are for statements the diff leaves untouched; their values were computed in the previous report.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| R17.3.8c averaging bound, revised (`:2034–2036`) | A=ℚ₅², H=C₂ swap; A=ℚ₂² sup; A=ℚ₃³ sup with C₃ and C₂ (script) | ℚ₅ sup: ‖e(1,0)‖=1 ≤ \|1/2\|₅=1. ℚ₅ ℓ¹: 2 > 1, but ℓ¹ is not ultrametric, so it is excluded. ℚ₂: 2 = \|1/2\|₂, attained. ℚ₃, C₃: 3 = \|1/3\|₃ > 1, and 3∣3. ℚ₃, C₂: 1 = \|1/2\|₃, and 3∤2 | True |
| R17.3.8c new Check (`:2069–2072`) | the same vectors (script) | (1/2,1/2): sup norm 1 over ℚ₅, `\|x\|₅+\|y\|₅` = 2, sup norm 2 over ℚ₂; ‖(1,0)+(0,1)‖₁=2 > max(1,1) | True |
| R17.3.8d T_v cosets via AL.2.2.1 (`:2107–2110`) | q=2, 3, 5; 300 random k₁diag(p,1)k₂ per q (script) | q+1 = 3, 4, 6 representatives; rU pairwise distinct; rᵀ integral with det valuation 1 and a unit entry; Urᵀ pairwise distinct; each sample lies in exactly one Urᵀ (300/300 for each q) | True |
| R17.3.8a rank, now prose (`:1805–1806`) | ι={1,2}, n=(1,2); the zero ring | Monomials z₁^a z₂^b with a≤1, b≤2: 6 = 2·3. Over the zero ring finrank is 0 ≠ 6, so "when K is nonzero" is needed | True |
| `gl2Integral_isHeckeTriple`, docstring only | Δ = integral invertible matrices; Δ = GL₂(L) | Both contain GL₂(𝒪) and are monoids; the statement is unchanged, and the probe fails | True |
| `algWeightSlash`, `_mem`, `_mul`, `_one` | carried (r7): γ=(1 1;0 1), δ=(1 0;1 1); 183 random cases | (1\|γ)\|δ=z+1=1\|(γδ); 1\|(δγ)=z+2; law held 183/183 | True |
| `algWeight_equiv_symPowerRep` | carried (r7): 94 random g; diag(2,1) | matrix identity 94/94; eigenvalues 1, 1/2 | True |
| R17.3.8a scalars, units, normalization, nebentypus, analytic | carried (r7) | −1 on L₁,₀, L₂,₋₁: −1, +1; σ₂(7+4√3)≈0.0718 against N(u)²=1; s=−1 gives σ(ϖ)⁻¹∉𝒪_K; ε(2)=−1 when c∉3ℤ₃ | True |
| `quaternionLevelForms`, `_finite` | carried (r7): M₂(ℚ) at GL₂(ℤ̂); open noncompact U | one class, `A^{GL₂(ℤ)}`; compact open subgroup with surjective class map | True |
| `classicalForms_finrank` | carried (r7): ι=∅; Hurwitz (2ℓ,−ℓ); M₂(ℚ) (10,−5) | #Cl(U); dimensions 1, 0, 0, 1 against dim S_k(Γ₀(2)) = 0, 0, 1 at k=4, 6, 8; htriv excludes SL₂(ℤ) | True |
| `gl2_hecke_T_sq` | carried (r7): q=2, 3, 4, 5 | (q+1)² = 9, 16, 25, 36 = (q²+q)+(q+1) | True |
| `gl2_hecke_inv` | carried (r7): z′=diag(ϖ⁻¹,ϖ⁻¹) | z′t=diag(1,ϖ⁻¹) is Weyl-conjugate to diag(ϖ⁻¹,1); z′z=1 | True |
| R17.3.8d K₀(𝔭^t) cosets | carried (r7): p=3, t=2 | 3(α−α′)∈9ℤ₃ iff α≡α′ mod 3, giving q cosets | True |
| R17.3.8b norms and trace; R17.3.8c splittings | carried (r7) | bounds C_U and ‖·‖≤C_U; ι(x)h⁻¹=h⁻¹ι′(x) | True |
| R17.3.9 Pan adapter (sample) | carried (r7): k=2, ℓ=3 | supplied S_ℓ=1/9 against Pan's 9; `u^{n+2s}=u^{−k}` | True |
| `chevalley_power_congruence` | carried (r7): E=⟨2⟩, n=2, 3 | 2^j mod 3 = 1,2,…; 2^j mod 7 = 1,2,4,… | True |
| `finite_hecke_full_local_prescription` | carried (r7): ℚ, S={2} | character of ℚ(√5): Ψ₂(2)=−1, trivial on ℤ₂× and at ∞ | True |
| `supercuspidalProjective` | carried (r7): trivial π; non-scalar centre | support G/Z not compact; ϖI acts by ω(ϖ)(1 2;0 1) | True |
| `existsQuaternionRamification_iff`, `nonempty_quaternionAlgEquiv_of_localSplitting` | carried (r7) | (∅,∅): M₂ with even 0; ({2},{∞}): even 2; odd sets false; (−1,−3)₂=+1 against (−1,−1)₂=−1 | True |
| `finite_projective_lift`, `odd_solvable_artin_weight_one` | carried (r7): x³−2, p=5, 7, 31 | tr = 0, −1, 2; det = (−3/p) = −1, 1, 1 | True |
| `solvable_finite_image_integral_lift`, `solvable_characteristicTwo_projective_dihedral`, `characteristicTwo_solvable_weight_one` | carried (r7) | S₃≅GL₂(𝔽₂); A₄ reducible; 5∣4+1; a_p = 0, −1, 2 reduce to 0, 1, 0 | True |
| R16.2.7, R17.2.5, Quaternion proof, R17.4.17, R17.5.13/15/16, R17.6.4 (sample) | carried (r7) | X²−5X+6; ∫_N f(k⁻¹ank)dn; (−1)^{\|S\|}=1; Gram det −27; 3·2≥2·3; −24·2⁻⁵=−0.75 | True |

**Seeded sample.**
- No sampled target falls in the changed passages. Fixed-space comparison is at `:830`, Ramification realization `:1521`, Stronger variant `:1646`, Quaternion proof `:1683`, Pan adapter `:2190`, Whittaker-type bridge `:2582`, Cubic monomial input `:2742`, All-place comparison `:2746`, Oddness API `:2969`, Domain test `:2993`, Order test `:3002`, Construction and local finiteness `:3020` and Parabolic comparison `:3164`.
- The previous review verified each against cg20, casselman73, cdn23, jl70-ubc, pan26-global, gj78, jpss79, henniart02, deligne73, bcgp21, tunnell78, patrikis, carayol86, varshavsky05 and ddt. That verification stands.
- The Pan adapter depends on R17.3.8a–d. I reread it (`:2190–2200`): its uses of R17.3.8a's symmetric-power comparison at n=k, s=−k and of R17.3.8c's splitting datum are unaffected by the diff.

**Pinned declarations opened this round.**
- Mathlib:
  - `IsUltrametricDist` (`Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`);
  - `Representation.averageMap` and `isProj_averageMap` (`Mathlib/RepresentationTheory/Invariants.lean:126, 141`), under `[Fintype G] [Invertible (Fintype.card G : k)]`, matching "if |H_i| is a unit in R";
  - `MvPolynomial.basisRestrictSupport` (`Mathlib/RingTheory/MvPolynomial/Basic.lean:95`).

**Ownership and overlaps.**
- `overlaps.md` lists no open pull request that changes this roadmap, no dropped id and no id defined only by an open revision.
- The diff drops no section id. It drops two Lean names (`gl2IntegralMonoid`, `finrank_algWeight`); `roadmaps grep` finds them on neither main nor any open head.
- Other heads cite R17.3.8 without a suffix (WeightsInEtaleCohomology, RankOneConverse). That heading is still at `:1776`, and R17.3.8a–d are at `:1784`, `:1900`, `:1979` and `:2084`.
- No `Suggested.lean` name collides with a declaration in a roadmap I could read.

**Outside this folder (not part of this verdict).**
- AutomorphicFormsOnReductiveGroups (head 753cac0), README:11, still says that QuaternionicModularForms specializes §7.4 to quaternion algebras and owns their overconvergent forms. That sentence contradicts R17.3.8a–d and AutomorphicGaloisRepresentations §§0.2a–0.2f, and it belongs to that roadmap's own review.
- The pull request description says "PadicLocalLanglandsForGL2Qp are consumers, not prerequisites". Its depends-on list and merge-order paragraph correctly place #1312 before this pull request. This README cites §§4.4 and 6.9 as a supplier (`:359`, `:861`), and PadicLocalLanglandsForGL2Qp (head 84416ad), README:2435–2441, lists this roadmap as its consumer. The worker may want to correct the description.

## Not verifiable

- **shimura71** (book; Proposition 3.3 and Theorem 3.24, cited at `:2182–2184`): not read. The locators agree with the Tau Ceti docstrings at `HeckeRing/Degree.lean:97` and `GL2/MultiplicationTable.lean:549`, as recorded last round.
- **prr23** (Theorem 1.33): a Cambridge book with no legal copy. The input was checked last round through GlobalQuadraticForms §4.4 and ClassFieldTheory Layer 10.
- **jl70** (IAS retypeset) and **jl70-global** paginations: only jl70-ubc is cached.
- **bh06**, **webb16**, **artin-tate**, **tate-global** and **clozel90**: books, not read.
- Texts outside the changed passages were not reread this round. Their status is as in the previous review.

## Source issues

- none
