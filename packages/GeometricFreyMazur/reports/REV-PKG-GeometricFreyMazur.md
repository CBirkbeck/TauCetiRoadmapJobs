<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1184#issuecomment-6386829051 -->
Review (claude) of 15a9232

Verdict: needs changes

1. **F01** (P2) The title headline (function-field geometric Frey–Mazur) is statable at the pins but absent

   - **Location.** `packages/GeometricFreyMazur/Suggested.lean` lines 27–30 say that the function-field form "also lacks intrinsic gonality of the proper model and the compatible geometric torsion/isogeny interface". README §9.8, line 1255, states the theorem (BT16 Theorem 2).
   - **Claim.** These carriers are missing, so the headline cannot be stated.
   - **Witness.** Every carrier exists at the pins:
     - Mathlib `FunctionField` (`Mathlib/NumberTheory/FunctionField.lean:58`), `AddSubgroup.torsionBy` (`Mathlib/Algebra/Module/Torsion/Basic.lean:972`) and `WeierstrassCurve.Affine.Point.map` (`Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:823`).
     - Tau Ceti `TauCeti.Isogeny` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean:139`).
     - Gonality of `K/k` takes a one-line definition with a real body.

     The reviewer's statement below elaborates with only the `sorry` warning.
   - **Repair.**
     - Delete the sentence on lines 27–30 that claims the function-field form is not statable. Keep the original-base form (§9.7) as not statable, because there are no elliptic schemes over `U` at the pins.
     - Add the import `TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Basic`, a `gonality` definition, and the theorem below. This is the tested text; the full file shape is in the scratch probe, elaborated with `lake env lean`.
     - In README §9.8, name `geometric_frey_mazur`. In Conventions, define function-field gonality with at least three Checks (`k(t)` has gonality 1; a genus-one field has gonality 2; a hyperelliptic field of genus g≥2 has gonality 2), and say that AlgebraicCurves Layer 12 (gap:gonality-norm-and-base-change) owns the general notion and its comparison.

   ```lean
   noncomputable def gonality (k K : Type*) [Field k] [Field K] [Algebra k K] : ℕ :=
     sInf {n : ℕ | ∃ f : K, Transcendental k f ∧
       FiniteDimensional (IntermediateField.adjoin k {f}) K ∧
       Module.finrank (IntermediateField.adjoin k {f}) K = n}

   open scoped Classical in
   theorem geometric_frey_mazur (N : ℕ) :
       ∃ M : ℕ, ∀ (k K : Type u) [Field k] [IsAlgClosed k] [CharZero k] [Field K] [Algebra k K]
         [Algebra (RatFunc k) K] [IsScalarTower k (RatFunc k) K] [FunctionField k K],
         gonality k K < N →
         ∀ (W W' : WeierstrassCurve K) [W.IsElliptic] [W'.IsElliptic],
           W.j ∉ Set.range (algebraMap k K) → W'.j ∉ Set.range (algebraMap k K) →
         ∀ p : ℕ, p.Prime → M < p →
         ∀ e : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ) ≃+
               AddSubgroup.torsionBy (W'⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ),
           (∀ (σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K)
               (P Q : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ)),
               (Q : (W⁄(AlgebraicClosure K)).toAffine.Point) =
                 WeierstrassCurve.Affine.Point.map (W' := W) σ.toAlgHom P →
               (e Q : (W'⁄(AlgebraicClosure K)).toAffine.Point) =
                 WeierstrassCurve.Affine.Point.map (W' := W') σ.toAlgHom (e P)) →
         Nonempty (TauCeti.Isogeny W.toAffine W'.toAffine) := by
     sorry
   ```

2. **F02** (P2) The full-monodromy headline is statable at the pins but absent

   - **Location.** `Suggested.lean` lines 21–23 say that full torsion monodromy "lacks relative nonisotrivial elliptic schemes, their finite frame torsors and the gonality carrier". README §§8.3 and 9.6 (lines 1101 and 1227) state it.
   - **Claim.** The monodromy headline is not statable.
   - **Witness.** `E[p]` is finite étale over `U`, so the monodromy image of `π₁(U)` equals the image of `Gal(K̄/K)` on `E_K[p](K̄)`, where `K=k(U)`. That image is statable with the same native carriers as R01, plus `AddSubgroup.torsionBy.zmodModule` (`Basic.lean:1010`) and `AddMonoidHom.toZModLinearMap` (`Mathlib/Algebra/Module/ZMod.lean:81`). The reviewer's statement elaborates with only the `sorry` warning.
   - **Repair.**
     - Delete lines 21–23.
     - Add the theorem below, which states that every determinant-one automorphism of `E[p]` comes from Galois. Its hypotheses use README §9.6's threshold `p>max(5,800N/7)` in the integer form `5<p`, `800N<7p`.
     - Name the theorem in README §9.6.

   ```lean
   open scoped Classical in
   theorem full_monodromy (N : ℕ) (k K : Type u) [Field k] [IsAlgClosed k] [CharZero k] [Field K]
       [Algebra k K] [Algebra (RatFunc k) K] [IsScalarTower k (RatFunc k) K] [FunctionField k K]
       (hK : gonality k K < N) (W : WeierstrassCurve K) [W.IsElliptic]
       (hW : W.j ∉ Set.range (algebraMap k K)) (p : ℕ) (hp : p.Prime) (hp5 : 5 < p)
       (hpN : 800 * N < 7 * p) :
       letI := AddSubgroup.torsionBy.zmodModule
         (A := (W⁄(AlgebraicClosure K)).toAffine.Point) (n := p)
       ∀ g : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ) ≃+
             AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ),
         LinearMap.det (g.toAddMonoidHom.toZModLinearMap p) = 1 →
         ∃ σ : AlgebraicClosure K ≃ₐ[K] AlgebraicClosure K,
           ∀ P : AddSubgroup.torsionBy (W⁄(AlgebraicClosure K)).toAffine.Point (p : ℤ),
             (g P : (W⁄(AlgebraicClosure K)).toAffine.Point) =
               WeierstrassCurve.Affine.Point.map (W' := W) σ.toAlgHom P := by
     sorry
   ```

3. **F03** (P2) `Suggested.lean` declares three non-headline lemmas (padding)

   This is graded blocking because the project rule makes any non-headline declaration in `Suggested.lean` blocking padding.

   - **Location.** `Suggested.lean` lines 42–68 (`sl2_proper_subgroup_index`, `psl2_proper_subgroup_index`, `no_quadratic_self_twist`). README line 15 calls them "the statable subgroup-index and self-twist headlines"; see also lines 1087 and 1117.
   - **Claim.** These are headline theorems of the roadmap.
   - **Witness.**
     - §8.2 is an input to §8.3 (line 1103 uses D≥p). It is classical group theory, not a BT16 theorem; see R07.
     - `no_quadratic_self_twist` quantifies over an arbitrary group Γ, and its conclusion is algebra on its hypotheses: perfectness of SL₂(𝔽_p) (pinned `Matrix.SL2.commutator_eq_top`, `Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, which Mathlib itself turns into `Group.IsPerfect` inside the proof at `Mathlib/LinearAlgebra/Projectivization/PSL/PSL2.lean:104`). It names none of the roadmap's objects.
     - Generality is also off. The hypothesis `hχ` is unused, because perfectness kills every character. `5 ≤ p` is unused: the transvection argument works for every prime, and brute force gives minimal proper indices 2, 3, 5 for SL₂ and PSL₂ over 𝔽₂, 𝔽₃, 𝔽₅.
     - The one-tactic probe (`simp`, `rfl`, `infer_instance`, `decide`, `omega`, isolated `exact?`) closes none of them, so the defect is that they are not headlines, not that they are trivial.
   - **Repair.**
     - Delete all three declarations and `open scoped MatrixGroups` from `Suggested.lean`, and replace them with R01 and R02.
     - Delete README lines 1087 and 1117, and rewrite line 15 without "headlines".
     - Keep §§8.2 and 8.4 as README targets. In §8.2, state the bound for every prime p (Checks: p=2 and p=3 give indices 2 and 3) and drop "p≥5". In §8.4, drop χ²=1, or keep it as a remark.

4. **F04** (P2) The CM⁺/CM⁻ definition does not determine the strata over j=1728

   - **Location.** README §0.3, line 171: "Choose corresponding nontrivial automorphisms … with matching characteristic polynomial, choosing the lift signs so their characteristic polynomials match". Also the API at line 177 ("ratio of the compatible tangent characters") and the route at line 187 ("faithful derivative character of the effective cyclic stabilizer").
   - **Claim.** These choices fix CM⁺ versus CM⁻, and "CM⁺ and CM⁻ are disjoint" (line 179).
   - **Witness.**
     - Take x over j=1728 and h_x=[i]. Both h_y=[i] and h_y=−[i] on E_y=E_x have characteristic polynomial t²+1. So (x,x) meets the CM⁺ clause and the CM⁻ clause, which falsifies line 179 and the Check at line 191.
     - BT16 line 301 normalizes the GL₂ lifts to be equal (g_x=g_y). That excludes h_y=−[i], since it forces g_y=−g_x.
     - The derivative of the order-2 stabilizer on T_xX(p) is −1 at both coordinates, so line 187's character cannot separate the strata. The eigenvalues live on T₀E (BT16 line 303).
   - **Repair.**
     - Line 171: require lifts h_x, h_y whose frame matrices are equal in GL₂(𝔽_p) (h_x∘φ_x=φ_x∘g̃⁻¹ and h_y∘φ_y=φ_y∘g̃⁻¹ for one g̃), and compare their eigenvalues on T₀E_x and T₀E_y.
     - Lines 177 and 187: replace "derivative character of the stabilizer" with "action of Aut(E) on Lie(E)". Note that over j=1728 the stabilizer acts by (−1,−1) on T_xX(p)×T_yX(p) in both strata.
     - Add a negative-control Check: for (x,x) at j=1728, the choice h_y=−h_x gives g_y=−g_x≠g_x and is excluded.

5. **F05** (P2) The declared gap:curve-extension-and-normalization is never cited, and its consumers cite AlgebraicCurves Layer 12 as if it supplied the content

   - **Location.** The contract is at line 71. The consumers' *Needs:* lines are 901 (§6.2), 967 (§6.4), 1265 (§9.8), 1301 (§10.2) and 1345 (§10.4). §9.1 (line 1139: "It extends uniquely from U to its smooth proper model because Z(p) is proper") has *Needs:* line 1167 with no supplier for the extension.
   - **Claim.** AlgebraicCurves Layer 12 supplies extension across missing points and factorization through the normalization of the image.
   - **Witness.**
     - AlgebraicCurves Layer 12 on main (12A–12E) normalizes ℙ¹ in a function field and gives the curve/function-field anti-equivalence, divisors and cohomology. It contains no extension of maps into an arbitrary proper target and no normalization of the image of a map into a surface.
     - The slug occurs once in the README, at the contract. Its normalization clause is already owned by SchemeAndStackFoundations §4.13 `resolution_of_curves` on main, together with Mathlib `Scheme.Hom.normalization`.
   - **Repair.**
     - Append "gap:curve-extension-and-normalization" to *Needs:* lines 901, 967, 1167, 1265, 1301 and 1345.
     - Cite SchemeAndStackFoundations §4.13 for the normalization of an integral curve.
     - Trim the gap's `needs` in both README and plan.json to the parts not supplied: extension across the missing points into a proper target, factorization of a nonconstant map through that normalization, and birational invariance of the normalization genus.

6. **F06** (P3) Supplier drift at SchemeAndStackFoundations §1.7, and pinned Tau Ceti isogeny API not cited

   - **Location.** Line 57 ("§1.7 for descent") and *Needs:* line 1209 (§9.4); "From Tau Ceti", line 49.
   - **Witness.**
     - SchemeAndStackFoundations §1.7 on main is "Points of an algebraic space". Galois descent of morphisms is §0.11, and §9.4 also cites ModularCurves §0E.
     - Tau Ceti at the pin already proves the field-level steps that §§9.2 and 9.4 use:
       - `TauCeti.Isogeny.existsUnique_map_eq_iff_galoisFixed` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Descent.lean:117`): a Galois-fixed isogeny descends uniquely.
       - `TauCeti.Isogeny.Hom.degree_zsmul` (`TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/Hom.lean:63`): deg(a·f)=a²·deg f.
   - **Repair.**
     - Replace "§1.7" with "§0.11" on lines 57 and 1209.
     - Add both Tau Ceti declarations to "From Tau Ceti", with file and line, and to the *Needs:* lines of §9.2 (line 1181) and §9.4 (line 1209) for the function-field steps.

7. **F07** (P3) Locators of §§8.2, 8.3 and 8.4 do not contain their statements

   - **Location.** Line 1085 (§8.2: "BT16 Remark after Theorem 2 and footnote 3, p. 710; BT16 line 76"), line 1101 (§8.3: "BT16 line 70") and line 1115 (§8.4: "BT16 Theorem 1, p. 710 … BT16 line 58").
   - **Witness.**
     - BT16 lines 71–74 and the footnote at lines 81–82 say only that large gonality forces surjectivity onto SL₂; nothing about subgroup indices. BT16 line 76 is Theorem 3, and line 70 ends Theorem 2.
     - Theorem 1 (lines 58–64) says nothing about self-twists.
   - **Repair.**
     - §8.3: cite BT16 lines 71–74 and 81–82.
     - §8.2: cite a source verified through the sources service that states the index bound. Otherwise cite the pinned transvection theorem as the whole input to the argument given there, and drop the BT16 locator.
     - §8.4: cite `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`) in place of BT16 Theorem 1.

8. **F08** (P3) Duplicate and procedural Checks

   - **Location.**
     - Duplicate pairs: line 191 with 195, line 587 with 589, and line 925 with 929.
     - Line 245 says "Test all nine pairs … including ordinary points with trivial inertia". Four inertia types give 16 ordered or 10 unordered pairs, and the bullet computes nothing.
     - Procedural bullets that compute nothing: lines 395, 409, 605, 617, 691, 981 and 1079.
   - **Repair.**
     - Delete one bullet of each duplicate pair.
     - Replace line 245 with the computed table: (1728, 0) and (cusp, elliptic) have coprime stabilizer orders, so no common inertia; the ordinary factor has trivial inertia; the equal-type pairs give orders 2, 3 and p.
     - Turn each procedural bullet into a computed instance. For example, at line 409, p=101 and y=1/2 give q-disc radius 0.9694 inside B_X(c, 4.164).

Eight findings: five blocking (R01–R05, all P2) and three P3 notes (R06–R08). The mathematics of Layers 0–10 survived the computed pass except for one ill-posed definition (R04). The blocking problems are concentrated in `Suggested.lean`, which states three auxiliary lemmas and omits two headline theorems that are statable at the pins, and in supplier traceability.

## Verified sound

### Elaboration and binders

- `lake env lean packages/GeometricFreyMazur/Suggested.lean`, run from the content checkout at the pins (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`), exits 0. The only warnings are three `declaration uses sorry` (lines 43, 49 and 56).
- `#check @` was run on all three declarations in one scratch file. The elaborated types equal README §§8.2 and 8.4: prime p, `5 ≤ p`, `H ≠ ⊤ → p ≤ H.index`, and an arbitrary group Γ with surjective ρ, χ²=1 and A ∈ GL₂. There are no section variables, so no binders are dropped.
- Form passes: single `import Mathlib`, no `set_option`, no sorry'd data, `theorem` only, namespace `TauCetiRoadmap.GeometricFreyMazur`, module docstring of the required shape.
- The one-tactic probe closes nothing.
- The R01/R02 repair shape (scratch) elaborates with only two `sorry` warnings.

### Dependency check (output)

`depcheck: 34 roadmaps, 313 edges, 0 problem(s)`. There is no UPWARD or CYCLE line. GeometricFreyMazur sits at line 107 of the merge order, after its last board supplier CongruenceSpectralGap (line 106).

### Gaps

- All 10 slugs are identical in `design/plan.json` `gaps` and in the README contracts (lines 59–93).
- Every supplier and section exists.
- Nine gaps are cited on their consumers' *Needs:* lines; the exception is R05.
- Two gaps were checked for minimality against main:
  - gap:cyclic-surface-resolution-and-contraction: SchemeAndStackFoundations §4.13 has `bertini_smoothness`, but not connectedness, transversality, Hirzebruch–Jung resolution or Castelnuovo contraction, so the gap stands.
  - gap:gonality-norm-and-base-change: there is no gonality notion on main, at the open heads or at the pins, so the gap stands.

### Cross-roadmap citations resolved (82)

- ModularCurves (main): §§0D, 0E, 2C, 5B, 5C.
- ModularCurvesPartII (head of its pull request): §§1.2, 1.3, 2.3, 3.9, 3.14, 4.1, 4.6–4.10, 5.7, 5.13, 5.16, 6.1, 9.13. §9.13 has the cyclic filter and the ψ(m) multiplier; §4.7's genus (p+2)(p−3)(p−5)/24 equals 1+(p²−1)(p−6)/24, which is 3 at p=7.
- SchemeAndStackFoundations (main): §§0.8, 0.9, 1.17 (`finiteGroupQuotient_projective` with norm polarization and flat base change), 3.2, 4.11–4.13, 5.1–5.3, 5.9, 5.10. §1.7 is drift (R06).
- AlgebraicCurves (main): Layers 3–7 and 12A–12E.
- FuchsianOrbifolds (main): Layers 0–5.
- ComplexKahlerGeometry (main): K3, K6.1.
- RiemannianGeometry (main): R7.0, R8.
- ComplexComparisonPartII (head): C−1.1–C−1.3, C2.2, C4.1–C4.5, C5.4, C6.2.
- InverseGaloisAndArithmeticFundamentalGroups (head): IG.0.3, IG.1.3 (includes characteristic-zero algebraically closed base extension for finite-type schemes), IG.3.1.
- AbelianSchemesAndArithmeticModuli (head): A1.1, A1.8, A3.1–A3.5, A3.7, A3.8, A6.1, A6.6, A6.7, A6.20, A6.25, A6.34.
- NeronModelsAndSemistableAbelianVarieties (head): §§1.3, 1.8.
- CongruenceSpectralGap (board design, accepted): CSG.5/congruence-bound, λ′₁≥21/100 for every congruence subgroup.

All suppliers are on main or earlier in the merge order.

### Library declarations opened at the pins

- Mathlib:
  - `Matrix.ProjGenLinGroup` (`GeneralLinearGroup/Projective.lean:41`), `mk_eq_mk_iff` (:64), `ProjectiveSpecialLinearGroup.toPGL` (:113), `toPGL_injective` (:120).
  - `Matrix.ProjectiveSpecialLinearGroup` (`ProjectiveSpecialLinearGroup.lean:33`).
  - `Matrix.norm_eq_sup_sup_nnnorm` and `norm_entry_le_entrywise_sup_norm` (`Analysis/Matrix/Normed.lean:87`, :106).
  - `Subgroup.index` (`GroupTheory/Index.lean:55`).
  - `Sym`, `Sym.map`, `Sym.map_map` (`Data/Sym/Basic.lean:43`, :342, :361).
  - `Matrix.SL2.commutator_eq_top` (:804, with hypotheses a≠0 and a²≠1).
- Tau Ceti:
  - `closure_range_toSpecialLinearGroup_eq_top_of_field` (`Transvection.lean:595`).
  - `TauCeti.RiemannSurface.degree` (`Degree.lean:120`), `FiniteHolomorphicMap` (:133), `degree_comp` (:434).
  - `ramificationDivisor` (`Ramification.lean:112`).

Every README "From Mathlib" and "From Tau Ceti" claim checks out.

### Duplication and ownership

- Searches by object (gonality, Abramovich, Li–Yau, Frey–Mazur, Kani–Schanz, diagonal quotient surface, self-twist, isotriviality, proper-subgroup index) over main, the 338 indexed open heads and the board packages find no second owner.
- ModularCurvesPartII owns X(p) and T_m, which are imported here.
- The board's ModularCurvesPartIII design is an alias index with zero nodes that imports this roadmap, so it is not a second owner.
- No fully qualified name collides.
- Pinned Tau Ceti isogeny API is relevant (R06).

### Sources sample (15 seeded targets plus all flagged)

The author flagged no unverified locators. BLR90 is settled as uncertified.

| Target | Locator checked | Result |
|---|---|---|
| 0.5 | BT16 §2.1 p.714 (lines 227–233), §2.4 pp.715–716 (lines 289–321) | Sound: orders p,2,3; only CM and SBC ramify |
| 1.1 | BT16 §3 opening pp.717–718 (lines 358–380) | Sound |
| 2.3 | BT16 Lemma 11(a) p.722 (line 578), proof p.723 | Sound; h(M)=O(p^{4δ}) |
| 2.7 | BT16 Prop 12(c) p.724 (line 626), proof p.725 | Sound; O(p^{24δ}) |
| 3.6 | BT16 Prop 17 pp.727–728 (line 751) | Locator right; signed conclusion is a justified correction (source issue below) |
| 4.3 | BT16 Prop 18 pp.728–731 (line 814) | Sound; conjugate companion justified by sign of det γ̃ (line 913) |
| 5.2 | BT16 Prop 25 pp.736–737 (line 1182); BTE §4.1 p.3 | Sound; restricted to CM⁺ as BTE requires; bound (p^{−2δ′}+d³p^{−1}) matches line 1195 |
| 5.8 | BT16 Prop 27 pp.737–740 (line 1224) | Locator right; added non-Hecke-projection hypothesis justified by counterexample |
| 6.1 | BT16 p.741 (line 1395), §1 p.711 (line 91) | Sound |
| 7.1 | BT16 Thm 29 proof p.741 (lines 1412–1416) | Sound |
| 7.3 | BT16 Thm 29 proof items (1)–(3) pp.741–742 | Sound |
| 8.2 | BT16 p.710 lines 71–76, 81–82 | **Fails**: text has no index bound (R07) |
| 8.4 | BT16 Thm 1 p.710 (lines 58–64) | **Fails**: no self-twist statement (R07) |
| 9.7 | BT16 Thm 1 p.710 (line 58) | Sound; uniformity of M_N in k comes from §9.5, not from Thm 1's quantifier order |
| 10.1 | BT16 Cor 30 p.742 (line 1458); gon≤g+1 p.740 (line 1379) | Sound; the README's M_{N+1} repairs the source's M_N |

### Adversarial pass (computed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conv. disc normalization | \|z\|=tanh(1/2); r→0 | d=1.0000; a(1)=3.41228=4π sinh²(1/2); a(r)/r² at r=10⁻³: 3.14159 | holds |
| Conv. ddᶜ/ω_𝔻 | ∂∂̄(−log(1−\|z\|²)) | equals dz∧dz̄/(1−\|z\|²)²; 4πddᶜ gives 4dxdy/(1−\|z\|²)², curvature −1 | holds |
| Conv. Checks (p=7 frames, left action) | 3 mod 7; g·(h·φ) | squares {1,2,4}, so 3 is a nonsquare; φ∘h⁻¹∘g⁻¹=(gh)·φ | holds |
| Conv. diagonal degree | X→X² | Deg=2(2g−2) (p=7: 8); area 4π(2g−2)=2πDeg | holds |
| 0.1 frames/components | p=7; p≡1,3 mod 4 | (e₁,3e₂) changes component; −1 is a square iff p≡1 mod 4 | holds |
| 0.2 Z(p) | generic fibre | \|PSL₂(𝔽₇)\|=168; orbit splits 168+168 over two component pairs | holds |
| 0.3 CM± | j=1728, h_y=±[i] | both char. poly t²+1; derivative of stabilizer (−1,−1) | **fails as written (R04)** |
| 0.3 Checks | order-3 lift [[0,1],[−1,−1]] | trace −1, so other eigenvalue −1−t; gsg⁻¹=[[−1,2],[−1,1]]≠±s | hold |
| 0.4 SBC | cusp c, p=7 | same-line cusps (p−1)/2=3; cusp/elliptic orders coprime | holds |
| 0.5 branch locus | all type pairs | orders 2,3,p pairwise coprime (p>3); mixed pairs have trivial common inertia | holds (Check wording R08) |
| 0.6 T_m, ψ | m=1,2,3,4,6,9 | brute cyclic counts 1,3,4,6,12,12=ψ; σ₁(4)=7, σ₁(9)=13; det multiplier m | holds |
| 1.1 triangle | p=5,6,7 | 1/2+1/3+1/p<1 iff p>6 | holds |
| 1.2 U_p,L_p | p=7, p=101 | det=1.0; U₇⁷=−I; (SU₇)³=−I; tr SU=1; y₇=1.72508=root of y+1/y=1/sin(π/7); (1−b)p²/π²=1.000646; p=5 gives 1−4sin²=−0.382 | holds |
| 1.3 witness | p=7,…,1013 | exact word identities true for 9 primes; det 1, ≡I mod p, tr 2p²+2; compact tr/p²→0.683877 vs 27/(4π²)=0.683918 | holds |
| 1.4 cusped systole | p=7 | tr≡2 mod p²; min hyperbolic \|tr\|=47; 2arcosh(23.5)=7.6994<4log7=7.7836; U(7)L(−7)=[[−48,7],[−7,1]] | holds |
| 1.5 cusp discs | p→∞ | log y_p=log(p/π)+o(1); iy_p, i/y_p at distance 2log y_p | holds |
| 1.6 metric comparison | r=1; R=3 | tanh²(1/2)=0.21355; coth(1.5)=1.1048 ≈1+2e⁻³=1.0996 | holds (matches BT16 Prop 7) |
| 1.7 compact radius | L≤4log p+C | each deep visit ≥(log p)/2, so ≤8+o(1) visits; e^{−R_s}L=4p^{−1/4}log p→0 | holds |
| 1.8 q-discs | p=101, y=1/2 | radius 0.96937 ⊂ B(c,4.1636); Im changes by [1/m,m] | holds |
| 2.1 height | all-ones | entrywise 1, Frobenius 2; h(MN)≤2h(M)h(N) | holds |
| 2.2 elliptic lift | [[2,1],[1,1]] | cosh d=3.5; h=2≤√7=2.6458 | holds |
| 2.3 cusp lift | M↦MU^k | γ_p(U) fixes iy_p | holds |
| 2.4 double coset | γ∈H | M=I, d=0 | holds |
| 2.5 unique lift | δ=0.1, 0.2 | 8δ=0.8<1 forces vanishing; 1.6>1 does not | holds |
| 2.6 lens | (D,R)=(3,2),(10,1),(1,5) | arcosh(cosh(D+R)/cosh D)=2.686,1.657,5.566 ≤ 2artanh√s=2.689,1.657,5.693 | holds |
| 2.7 overlap count | x a cusp | 2log p−O(1)>(1+2δ)log p, so count 1 | holds |
| 3.1 reconstruction | p=5 projective line | ≥p−1=4 invertible points; det(−Q)=det Q | holds |
| 3.2 rank three | units | a²+b²=1: 4 units; a²−ab+b²=1: 6 units; diag(1,−1) normalizes with det −1 | holds |
| 3.3 Heegner repulsion | BTE Prop 2.1 | Heegner only; m=a²+b²=2 at (1,1) | holds |
| 3.4 T̄_m | m=1 | graph {(z,z̄)} tangent span {(1,1),(i,−i)} contains no (i,i); meets T₁ on the real locus | holds |
| 3.5 T_m∩CM⁻=∅ | E=ℂ/ℤ[i], f=[a+bi] | h_y=[i], g_y=g_x; CM⁻ needs [2i]=0 on E[p] | holds (with R04 normalization) |
| 3.6 signed bicusps | p=13, a=5 | a²≡12≡−1; min uv with v/u≡a^{±2}: 12=p−1 | holds; unsigned BT16 version fails |
| 4.1 big diagonals | 3R/2 per coordinate | midpoint at 3R/4<R; Δ_g∩Δ_h over Fix(h⁻¹g) | holds |
| 4.2 unit count | [[2,1],[1,1]] | eigenvalue 2.618, log 0.9624; count ≤(A log p+log2)/0.9624 | holds |
| 4.3 dichotomy | sign of det γ̃ | det<0 gives a conjugate locus | holds (signed) |
| 4.4 rotation count | d=1, p=7, k=1 | D=0.98010; sinh(D/2)=sinh(1)sin(π/7) | holds |
| 5.1 adapters | diagonal; q-fold | 2(2g−2); ×q | holds |
| 5.2 CM⁺ decay | d=4 | Σ_{m<4}ψ=8≤14<64 | holds |
| 5.3 CM⁻ decay | ε=0.1, p=101 and 1009 | sinh ε/sinh(log p)·p=0.2004, 0.2003 (BTE's printed reciprocal grows like p) | holds |
| 5.4 SBC p-weighted | δ₃=0.01, δ₁=0.001 | −1−2δ₃+3δ₁=−1.017; (B+2)δ₃<1 needed | holds |
| 5.5 cusped measure | q=t² | density dr dθ/(r log²r); mass 2π/(−log ε)=1.364 (ε=0.01), 0.455 (10⁻⁶) | holds |
| 5.6 measure error | p=7, 11, 101 | ratio p/(p−6)=7, 11/5, 101/95; g=3, 26, 40376; s=24, 60, 5100 | holds |
| 5.7 Hecke tubes | branch z↦(az+b)/d | isometry of h_Y, not h_X | holds |
| 5.8 big-diagonal | C⊂T₁×T₁ | Σmult/Deg=\|G₀\|/(2K)=3p/(p−6)=21 (p=7), 3.189 (p=101) | unrestricted fails; restricted holds |
| 6.1 SymⁿZ | n=1,2 | fibre 2!=2 over distinct points, 1 over 2[z] | holds |
| 6.2 image reduction | degree-q map to ℙ¹ | gonality 1 kept | holds (supplier R05) |
| 6.3 pencil map | hyperelliptic genus g | 2g+2 fibres 2[f(b)] | holds |
| 6.4 wreath | n=1 | W=G | holds |
| 6.5 degrees | n=2, 3 | ΣDeg C_ij=(n−1)Deg C=Deg C, 2Deg C | holds |
| 7.1 support | n=2 | transposition·(g,g⁻¹) fixes Δ_g^{12} | holds |
| 7.2 index | two p-slots | lcm(p,p)=p; order divides 6n!p | holds |
| 7.3 Ram | exponents | min of finitely many positive η | holds |
| 7.4 Hurwitz | z↦z² on ℙ¹; n=1 | −2=2(−2)+2; D≤2dK and 2g−2≥dK | holds |
| 7.5 rigidity | N=1 | vacuous | holds |
| 8.1 7/800 | exact | (21/100)/24=7/800; area πD/3 (ABR96 §1.7) | holds |
| 8.2 index | p=2,3,5,7 | brute minimal proper index 2,3,5 (SL and PSL), PSL₂(𝔽₇): 7 | holds for all p (R03) |
| 8.3 monodromy | N=1,2 | thresholds 114.3, 228.6; 7·229/800=2.004>2 | holds |
| 8.4 self-twist | 𝔽₅ control | A·diag(2,3)=[[0,3],[2,0]]=−diag(2,3)·A | holds; χ²=1 unused (R03) |
| 9.1 classifying map | Ψ=[a] | projective class trivial, so H₁ | holds |
| 9.2 Hom lattice | h=2f | deg h=4 deg f; cyclic h forces a=±1 | holds |
| 9.3 Hecke lift | E′=E/K_m | f=π_K, λ=1 | holds |
| 9.4 descent | p=5, σf=−f | 2f[p]=0 contradicts invertibility | holds |
| 9.5 uniform k | \|k\|>\|ℂ\| | only a finitely generated k₀ is embedded | holds |
| 9.6 over k | as 8.3 | as 8.3 | holds |
| 9.7 original base | twist E^χ | projective torsion equal, no scalar-compatible Ψ | holds |
| 9.8 function field | same | statable (R01) | holds |
| 10.1 genus | g=0,1 | gon≤g+1 gives 1, 2; P_N=M_{N+1} | holds |
| 10.2 rational/elliptic | M₃ | gon 1, 2 <3 | holds |
| 10.3 resolution | 3/1, 3/2, 7/6, 2/1 | chains [3], [2,2], [2⁶], [2] | holds |
| 10.4–10.5 contraction | C·E=1 | C²→C²+1 | holds |
| WE point-ball | line (z,z/2) | V/a=1.2 at q=1/4, 1.0769 at q=3/4 (decreasing); h(s_t)=2log cosh(t/2); h′(s_t)=sinh²(t/2); ds/dt=2/sinh t | holds |
| Suggested decls | one-tactic probe | none closes | not padding by triviality; padding by headline rule (R03) |

## Not verifiable

- **BLR90.** Paywalled; settled as uncertified and not read.
- **Analytic proofs of §5.8 and the relative point-ball derivation.** The full analytic chain of the bicusp shell estimate and the Green/coarea derivation (README worked examples) was checked only at its displayed identities and instances (table rows WE and 5.8). Their complete proofs are supplier work behind the declared gaps.
- **Hecke boundary label ratio v/u (README worked example, line 1428).** Re-derived by the scaling argument; not checked against ModularCurvesPartII §9.13's boundary formula in full detail.
- **Coverage.** Ownership against open pull requests was checked through the roadmap index (338 heads, 2026-10-24T15:52:48Z).

## Source issues

- **Error** in BT16 at Lemma 5 proof, p.718: the trace-(2−p²) witness is a product of two parabolic elements of Γ(p), hence trivial after filling cusps; it should be a hyperbolic element that survives filling (e.g. trace 2p²+2); affects the proof.
- **Misprint** in BT16 at §3.1, p.718: the cusped injectivity radius is defined as the infimum of lengths, whereas Lemma 5 and Corollary 8 use half-lengths; it should be half the infimum; affects nothing.
- **Gap** in BT16 at Corollary 8 proof, p.720: it bounds the minimal loop by 2 log p and infers at most one cusp visit; the loop has length 4 log p+O(1), so two visits are possible and must be counted; affects the proof.
- **Error** in BT16 at Proposition 12(a) proof, p.724: it says δ<1/4 forces a p-divisible O(p^{8δ}) integer to vanish; this needs 8δ<1, i.e. δ<1/8; affects the proof.
- **Error** in BT16 at Proposition 17, pp.727–728: the reconstructed integral matrix may have negative determinant, so the bicusps lie on an ordinary or a conjugate Hecke locus; for p≡1 mod 4 the conclusion should allow conjugate loci; affects a stated result.
- **Error** in BT16 at Proposition 27, p.737: the statement omits that both projections are non-Hecke; a general curve in T₁×T₁ has ratio 3p/(p−6), tending to 3; it should add that hypothesis; affects a stated result.
- **Gap** in BT16 at Proposition 27 proof, pp.739–740: it uses Proposition 23 (diagonal tubes) for point-ball volume growth and Proposition 17 for disjointness of bicusp balls, which only bounds the overlap by two; affects the proof.
- **Gap** in BT16 at Corollary 30, p.742: the threshold M_N covers genus <N only via gon≤⌊(g+3)/2⌋ when N≥3; for N≤2 it needs M_{N+1}; affects nothing.
- **Error** in BT16 at §2.5, p.717: T_n is defined by cyclic isogenies, yet its projection degree is given as σ₁(n), which counts all order-n kernels; it should be ψ(n); affects nothing.
- **Misprint** in BTE at Proposition 4.1 proof, p.3: the displayed tube-volume ratio is printed as sinh(ρ_X/2)/sinh ε; it should be sinh ε/sinh(ρ_X/2); affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, p.4: the sum of ball volumes counts a point in k overlapping balls k times, but the tube term has no overlap factor; it needs a cusp-count factor p^{O(δ₃)}; affects the proof.
- **Gap** in BTE at Proposition 4.2 proof, p.4: it partitions SBC by ordinary small Hecke loci only and invokes BT16 Proposition 17; it should include conjugate Hecke loci; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "15a9232", "job": "REV-PKG-GeometricFreyMazur", "model": "opus", "worker": "fable-rev64"} -->
