<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/139#issuecomment-6336140231 -->
Red team round 1 pass b (claude) of 17d85a4

Verdict: needs_changes

1. **F01** (P1) The "A0 surface-Picard extension" of AlgebraicModuliForArithmeticGeometry does not exist

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/README.md:64`: “AlgebraicModuliForArithmeticGeometry, A0 surface-Picard extension: for proper flat finitely presented algebraic-space families … represent the fppf surface Picard functor by an algebraic space”; consumed at `README.md:702` (2.2 *Needs*), `README.md:1973` (8.2 *Needs*).

   **Claim:** The contract is written as if supplied by a section "A0" of AlgebraicModuliForArithmeticGeometry, including the Picard flatness criterion `b₁=2(h¹(O)−h²(O))`. No such section, and no surface Picard representability theorem, exists in that roadmap at the head of its open pull request; 2.2, 2.3, 3.3 and 8.2 therefore rest on an unowned prerequisite (a dependency that should be a declared gap but is cited as supplied).

   **Witness:** AlgebraicModuliForArithmeticGeometry README at head `98fd038` (its open pull request; `merge-order/ORDER.txt:30`): layers are numbered 1–9, no "A0"; "surface-Picard"/"surface Picard" occur nowhere; its §7.6 (lines 9483–9547) supplies only `relativePicardSheaf`, `relativePicardBaseChange`, `relativePicardKernel`, `sectionPicardSplit`; its §7.6.3 (line 9557) *assumes* `Pic_{Y/S}` represented, pointing to ComplexComparisonPartII §C3.2d.2 `relative_picard_algebraicSpace` (`ORDER.txt:35`). The flatness criterion occurs nowhere there.

   **Exact repair text:** Replace `README.md:64` by: “- **AlgebraicModuliForArithmeticGeometry, §7.6:** the fppf relative Picard sheaf `relativePicardSheaf` of an algebraic-space morphism, `relativePicardBaseChange`, `relativePicardKernel` (exactness of `0→Pic(T)→Pic(X_T)→Pic_{X/B}(T)` under universal `O_T≅f_{T*}O`) and `sectionPicardSplit`. What AlgebraicModuliForArithmeticGeometry must provide (gap:proper-flat-space-picard-representability): for a proper flat finitely presented morphism of algebraic spaces f:X→B with O_T→f_{T*}O_{X_T} universally an isomorphism, representability of Pic_{X/B} by a separated group algebraic space locally of finite presentation over B, compatible with base change. What AlgebraicModuliForArithmeticGeometry must provide (gap:picard-flatness-betti): for proper flat Y→Spec R over a local Noetherian W(k)-algebra with closed fibre Y, Pic_{Y/R}→Spec R is flat when b₁(Y)=2(h¹(O_Y)−h²(O_Y)) (DI21, proof of Theorem 4.3, pp. 16–17).” Replace “AlgebraicModuliForArithmeticGeometry, A0 surface-Picard extension” at `README.md:702` and `README.md:1973` by “AlgebraicModuliForArithmeticGeometry §7.6; gap:proper-flat-space-picard-representability” (and at 1973 also “gap:picard-flatness-betti”), and record both slugs in the plan’s `gaps` list. If ComplexComparisonPartII §C3.2d.2 `relative_picard_algebraicSpace` states the representability at the needed generality, cite it there instead of the first gap (it precedes this roadmap in the merge order).

2. **F02** (P1) FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 is cited for DI21 Proposition 4.2, which it does not state

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/README.md:65`: “Supply DI21 Proposition 4.2, pp. 15–16: the finite local group obstruction to lifting an α_{p^n} direct factor to W₂”; used at `README.md:1971` (8.2: “The generic finite-flat group nonlifting result DI Proposition 4.2 belongs to R07.1”).

   **Claim:** The non-lifting theorem that 8.2 (hence 8.3–8.7) needs — a finite commutative group scheme over k whose unipotent quotient has α_{p^n} as a direct summand has no finite flat lift to W₂(k) — is attributed to R07.1 as if supplied. R07.1 at its head contains no W₂-lifting statement; the prerequisite is unowned.

   **Witness:** FiniteFlatGroupsAndIntegralPadicHodgeTheory README at head `7782ded` (its open pull request; `ORDER.txt:41`): §§R07.1.1–R07.1.12 (lines 553–1123) contain no lifting-to-`W₂` statement; the only α_p non-lifting remark is the Oort–Tate Check `oortTate_Fp` (line 2414), “α_p has no finite flat lift to ℤ_p”, a different theorem (lift over ℤ_p, not over W₂(k) for arbitrary k, and not for a direct summand of a larger L). DI21arxiv line 677–679 states Proposition 4.2 as above.

   **Exact repair text:** Add before 8.2 an owned target: “### 8.1a Finite local group schemes with an α₂-summand do not lift to W₂. k is algebraically closed of characteristic two; L is a finite commutative k-group scheme with multiplicative part L_mult. If the unipotent quotient L/L_mult has α_{2^n} (n≥1) as a direct summand, then L admits no finite flat W₂(k)-group scheme with closed fibre L. Use the Hopf-algebra presentation k[T₁,…,T_r]/(T_i^{2^{n_i}}) of the fibre ring, uniqueness of its W₂-lift as a scheme, and the comultiplication of t=T₁ to produce the contradiction. (DI21, Proposition 4.2 and proof, pp. 15–16.) *Needs:* FiniteFlatGroupsAndIntegralPadicHodgeTheory, R07.1 (Hopf algebras, Frobenius and Verschiebung, Cartier duality); SchemeAndStackFoundations §4.6 (deformations of a complete intersection).” Replace at `README.md:65` the sentence “Supply DI21 Proposition 4.2 … Layer 8 uses α₂.” by “Hopf algebras, Frobenius and Verschiebung, and Cartier duality of finite commutative group schemes over k and W₂(k).” In 8.2 replace “The generic finite-flat group nonlifting result DI Proposition 4.2 belongs to R07.1” by “Apply 8.1a to L=Pic⁰=α₂” and add 8.1a to its *Needs*.

3. **F03** (P2) WeilConjectures WC.7 already owns `IsEnriques`, its base change and projectivity, the invariant theorem and the twenty-five-point count; Layer 0 and 3.1 plan them again and the downstream claim is false

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/README.md:15`: “WeilConjectures, Layer WC.7, owns the point count … this roadmap supplies the Enriques invariants it needs”; `README.md:96`–`110` (0.1 `IsEnriques`, `IsEnriques.baseChange`, `IsEnriques.projective`, `isEnriques_iff`), `README.md:144` (0.3 “b₁=b₃=0 and b₂=ρ=10”), `README.md:995` (3.1), `README.md:2049`: “WeilConjectures, Layer WC.7, takes the Enriques invariants of Layer 0”.

   **Claim:** Two owners for one object. WeilConjectures precedes this roadmap in the merge order and, at the head of its open pull request, defines the Enriques predicate itself, proves its characterisation by the numerical-canonical and `b₂=10` convention, base change, projectivity and the étale invariants `b₁=0`, `b₂=ρ=10`, and states the Enriques count `N_r=1+10q^r+q^{2r}`, `N₁=25`, `N₂=57`; it never cites this roadmap. The package re-plans 0.1, 0.3 (invariants) and 3.1 instead of importing them, and its Downstream-consumers paragraph asserts a dependence WeilConjectures does not have.

   **Witness:** WeilConjectures README at head `daa3895` (its open pull request; `ORDER.txt:97`), lines 1415–1424: “define `IsEnriques` …”, targets `enriques_characterization`, `enriques_baseChange`, `enriques_etaleInvariants` (`b₁=0`, `b₂=ρ=10`), “Prove projectivity and equivalence with the numerical-canonical and `b₂=10` Enriques convention of Schröer §4”; lines 1502–1512: target `count_enriques_or_rational_genus_one` with `N₁=25`, `N₂=57` for an Enriques surface with constant Num. The string “EnriquesSurfacesAndIntegralNonexistence” does not occur in that README.

   **Exact repair text:** At `README.md:15` replace the WeilConjectures sentence by: “**WeilConjectures**, Layer WC.7, owns the Enriques predicate `IsEnriques` (numerically trivial canonical bundle and χ(O)=1), its characterisation by `b₂=10` (`enriques_characterization`), base change (`enriques_baseChange`), projectivity, the étale invariants `b₁=0`, `b₂=ρ=10` (`enriques_etaleInvariants`), the constant-Num surface count (`count_surface_of_constant_num`) and its Enriques case (`count_enriques_or_rational_genus_one`). This roadmap adds only what WC.7 does not state: Pic^τ of length two (0.2), the numerical lattice (0.4) and everything from Layer 1 on.” Delete the definition and the four interface bullets of 0.1 and the invariant sentence of 0.3, replacing 0.1 by “### 0.1 The Enriques predicate (WeilConjectures WC.7). Use `IsEnriques`, `enriques_characterization`, `enriques_baseChange` and projectivity from WeilConjectures WC.7; keep here only `IsEnriques.iso` (transport along a k-isomorphism) if WC.7 does not state it.” and 0.3 by “Use `enriques_etaleInvariants` for `b₁=b₃=0`, `b₂=ρ=10`; prove here that `h¹(O_Y)=h²(O_Y)≤1`.” Replace 3.1’s statement paragraph by “This is WeilConjectures WC.7 `count_enriques_or_rational_genus_one`; it is cited, not re-proved.” Delete the first sentence of `README.md:2049`. If the maintainers prefer this roadmap to own the predicate, the repair is instead a repointing of WeilConjectures WC.7 to 0.1/0.3 together with a merge-order move; in that case 0.1 and 0.3 must not cite WC.7 (`README.md:120`, `README.md:148`).

4. **F04** (P3) Six admitted theorems are one tactic from Mathlib

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:35`, `:39`, `:43`, `:46`, `:206`, `:214` (each “:= by sorry”).

   **Claim:** `dyadicRepresentative_nonzero`, `dyadicRepresentative_decomposition`, `globalTwist_nonzero`, `globalTwist_removes_ramified_part`, `i4Star_incidence_count` and `iiiStar_incidence_count` are stated as targets but close by a single tactic at the pinned Mathlib. (The two determinants did not close: `simp [Matrix.det_succ_row_zero, Fin.sum_univ_succ, …]` timed out at the default heartbeats; `decide` on the two counts hit the recursion limit, `decide +kernel` closes them.)

   **Witness:** A probe copy at the pins elaborated with exactly the proofs below and no error.

   **Exact repair text:**
   ```lean
   theorem dyadicRepresentative_nonzero (e a b : Fin 2) :
       dyadicRepresentative e a b ≠ 0 := by
     simp [dyadicRepresentative]

   theorem dyadicRepresentative_decomposition (e a b : Fin 2) :
       dyadicRepresentative e a b = globalTwist e a * 5 ^ b.val := by
     rfl

   theorem globalTwist_nonzero (e a : Fin 2) : globalTwist e a ≠ 0 := by
     simp [globalTwist]

   theorem globalTwist_removes_ramified_part (e a b : Fin 2) :
       dyadicRepresentative e a b * globalTwist e a =
         5 ^ b.val * (2 ^ a.val : ℚ) ^ 2 := by
     fin_cases e <;> fin_cases a <;> fin_cases b <;> norm_num [dyadicRepresentative, globalTwist]

   theorem i4Star_incidence_count :
       (Finset.univ.filter (fun a : Fin 9 → Fin 3 =>
         ∑ i : Fin 9, (![1, 1, 2, 2, 2, 2, 2, 1, 1] i : ℕ) * (a i).val = 2)).card =
         15 := by
     decide +kernel

   theorem iiiStar_incidence_count :
       (Finset.univ.filter (fun a : Fin 8 → Fin 3 =>
         ∑ i : Fin 8, (![1, 2, 2, 3, 4, 3, 2, 1] i : ℕ) * (a i).val = 2)).card =
         6 := by
     decide +kernel
   ```
   Keep them as proved API (the README interface lists them); they are no longer milestones.

5. **F05** (P3) The only Tau Ceti import is unused

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/Suggested.lean:2`: “import TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Isotropic”.

   **Claim:** No declaration of that module is used by the file. The names used are `IntegralLattice.ofGramMatrix`, `ofGramMatrix.basis`, `ofGramMatrix_carrier`, `integralForm`, `integralForm_ofGramMatrix_apply`, `carrier`, `form` (module `TauCeti.LinearAlgebra.IntegralLattice.Basic`), `IsEven` (`…IntegralLattice.Even`), `dualCarrier` (`…IntegralLattice.Dual.Basic`) and `discriminantQuadraticMap`, `discriminantQuadraticMap_mk` (`…IntegralLattice.Discriminant.Quadratic`). `Overlattice/Isotropic.lean` declares `IsIntegral`, `IsEven` on intermediate carriers, `ofIsotropicSubgroup` and the order isomorphisms, none of which appears in the file; the import works only through its public re-exports.

   **Witness:** Pinned Tau Ceti `a91d3aaf`, `TauCeti/LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean:81–436` (declaration list) and `:8–10` (its public imports); defining modules as listed above (`Basic.lean:261`, `:281`, `:271`, `:156`, `:295`; `Even.lean:67`; `Discriminant/Quadratic.lean:122`, `:129`).

   **Exact repair text:** Replace line 2 by
   ```lean
   import TauCeti.LinearAlgebra.IntegralLattice.Basic
   import TauCeti.LinearAlgebra.IntegralLattice.Even
   import TauCeti.LinearAlgebra.IntegralLattice.Dual.Basic
   import TauCeti.LinearAlgebra.IntegralLattice.Discriminant.Quadratic
   ```
   (`Discriminant.Quadratic` publicly imports `Even` and the discriminant/dual modules, so the last line alone also compiles.) Not elaborated here: the review environment has no `IntegralLattice` objects.

6. **F06** (P3) Statable native-lattice Checks have no Lean mirror

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1701`: “compute determinant −4 and rank eight modulo two … The rational inverse has denominator two, not four”; `README.md:1715`: “N₁^{-1} must match all entries of … matrix (14)”; `README.md:1717–1723` (the dual norms).

   **Claim:** The inverse-entry, denominator and mod-two-rank Checks are statable on `firstGram`/`secondGram` at the pins (the matrices are in the file) but have no `example` or named target; only entry Checks of the matrices themselves are mirrored.

   **Witness:** A probe copy at the pins proved the two identities below by `decide`; the mod-two rank statement elaborates (left admitted in the probe).

   **Exact repair text:** Add after `secondGram_symmetric`:
   ```lean
   /-- Twice the inverse of the first Gram matrix: integral, so every dual pairing has
   denominator dividing two; its entries give `(C₁*)² = −1`, `(R*)² = 0`, `(F*)² = −2`,
   `C₈*·F* = 2`, `R*·F* = 1` after halving. -/
   def firstGramTwiceInverse : Matrix (Fin 10) (Fin 10) ℤ := !![
     -2,-2,-2,-2,-2,-2,-1,-1,0,2;
     -2,-4,-4,-4,-4,-4,-2,-2,0,4;
     -2,-4,-6,-6,-6,-6,-3,-3,0,6;
     -2,-4,-6,-8,-8,-8,-4,-4,0,8;
     -2,-4,-6,-8,-10,-10,-5,-5,0,8;
     -2,-4,-6,-8,-10,-12,-6,-6,0,8;
     -1,-2,-3,-4,-5,-6,-4,-3,0,4;
     -1,-2,-3,-4,-5,-6,-3,-4,0,4;
     0,0,0,0,0,0,0,0,0,2;
     2,4,6,8,8,8,4,4,2,-4]

   /-- Twice the inverse of the second Gram matrix. -/
   def secondGramTwiceInverse : Matrix (Fin 10) (Fin 10) ℤ := !![
     -2,-2,-2,-2,-2,-2,-1,-1,0,0;
     -2,-4,-4,-4,-4,-4,-2,-2,0,0;
     -2,-4,-6,-6,-6,-6,-3,-3,0,0;
     -2,-4,-6,-8,-8,-8,-4,-4,0,0;
     -2,-4,-6,-8,-10,-10,-5,-5,0,0;
     -2,-4,-6,-8,-10,-12,-6,-6,0,0;
     -1,-2,-3,-4,-5,-6,-4,-3,0,0;
     -1,-2,-3,-4,-5,-6,-3,-4,0,0;
     0,0,0,0,0,0,0,0,0,2;
     0,0,0,0,0,0,0,0,2,0]

   /-- The first inverse has denominator two: `N₁ · (2 N₁⁻¹) = 2`. -/
   example : firstGram * firstGramTwiceInverse =
       (2 : ℤ) • (1 : Matrix (Fin 10) (Fin 10) ℤ) := by decide

   /-- The second inverse has denominator two: `N₂ · (2 N₂⁻¹) = 2`. -/
   example : secondGram * secondGramTwiceInverse =
       (2 : ℤ) • (1 : Matrix (Fin 10) (Fin 10) ℤ) := by decide

   /-- The dual norms of 6.2, doubled: `(C₁*)² = −1`, `(R*)² = 0`, `(F*)² = −2`,
   `C₈*·F* = 2`, `R*·F* = 1`. -/
   example : firstGramTwiceInverse 0 0 = -2 ∧ firstGramTwiceInverse 8 8 = 0 ∧
       firstGramTwiceInverse 9 9 = -4 ∧ firstGramTwiceInverse 7 9 = 4 ∧
       firstGramTwiceInverse 8 9 = 2 := by decide
   ```
   and list `firstGramTwiceInverse`, `secondGramTwiceInverse` in 6.1’s interface. For the mod-two rank add the named targets `theorem firstGram_rank_modTwo : (firstGram.map (Int.castRingHom (ZMod 2))).rank = 8 := by sorry` and the same for `secondGram`, listed in 6.1.

7. **F07** (P3) Works cited inside targets have no entry in References, and one has no locator

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/README.md:638`: “derive it from the full hypotheses of Lang (1983), Theorem 4.1”; `README.md:254` (Bombieri–Mumford 1977; Cossec–Dolgachev 1989, Chapter III); `README.md:604` (Cossec–Dolgachev III.3.4.1; Cossec–Dolgachev–Liedtke Theorem 6.1.10); `README.md:1267` (“corrected Liu–Lorenzini–Raynaud 6.6”); `README.md:2051–2077` (References: six entries).

   **Claim:** Five works are cited as proof inputs without a References entry, and Lang 1983 is cited by theorem number with no page or source. A reader cannot locate them; the policy requires a locator for every target.

   **Witness:** `README.md:2055–2077` lists only SCH23, ESB21, DI21, MMV22, Fontaine and Stacks. The cached legal copy of Lang 1983 (Math. Ann. 265, GDZ scan; id Lang1983) has Theorem 4.1 at Lang1983 line 757 (page 19 of the scan) and Theorem 4.2 at line 760. (Overlaps pass a F12 on the missing manifest; this item is the README’s own reference list.)

   **Exact repair text:** Add to References: “- **Lang1983.** William E. Lang, *On Enriques surfaces in characteristic p. I*, Math. Ann. 265 (1983), 45–65, GDZ scan; Theorem 4.1 (reducibility) and Theorem 4.2 (numerical decomposition), §4.” “- **BM77.** Enrico Bombieri and David Mumford, *Enriques’ classification of surfaces in char. p, II*, Complex Analysis and Algebraic Geometry (1977), 23–42; Theorem 3 and Proposition 11 (cited by locator; uncertified).” “- **CD89.** François Cossec and Igor Dolgachev, *Enriques Surfaces I*, Progress in Mathematics 76 (1989); Chapter III, Theorem 3.4.1 (cited by locator; uncertified).” “- **CDL.** François Cossec, Igor Dolgachev and Christian Liedtke, *Enriques Surfaces I*, manuscript; Theorem 6.1.10 in the 2021 numbering (cited by locator; uncertified).” “- **LLR04.** Qing Liu, Dino Lorenzini and Michel Raynaud, *Néron models, Lie algebras, and reduction of curves of genus one*, Invent. Math. 157 (2004), Theorem 6.6, with the 2018 corrigendum (cited by locator; uncertified).” At `README.md:638` write “Lang (1983), Theorem 4.1 ([Lang1983](#ref-lang1983), §4)”.

8. **F08** (P3) Process narrative: “revised” matrices and a dated reading remark

   **Location:** `packages/EnriquesSurfacesAndIntegralNonexistence/README.md:1651`: “Enter the revised integer matrices”; `:1715`: “revised matrix (14)”; `:1771`: “the revised inverse Gram matrix”; `:1789`: “The revised inverse matrix”; `:2077`: “section numbers are those read on 14 October 2026”.

   **Claim:** “Revised” is unexplained and timeless-reading breaks: the printed matrices (14) and (16) of the cited manuscript are exactly the inverses of `firstGram` and `secondGram` (no revision is involved), and a date of reading is process narrative.

   **Witness:** SCH23arxiv lines 1841–1853 and 1933–1945 (matrices (14), (16)) agree entry by entry with the exact inverses recomputed from `Suggested.lean:76–99` (denominator two; rows doubled give the integer matrices in F06). `README.md:2057` already names the revision of the source.

   **Exact repair text:** Delete the word “revised” at `README.md:1651`, `:1715`, `:1771` and `:1789`. Replace the last sentence of `README.md:2077` by “Tags are the stable locators.”

## Verified sound

- Read all 2077 README lines and all 236 Lean lines; the brief, the red-team rules and the section prompts.
- Lean: 35 declarations read (6 definitions, 15 theorems of which 13 admitted, 14 proved examples); no section variables, so no silently dropped binders. Elaboration as submitted fails only because the review environment has no compiled `TauCeti.LinearAlgebra.IntegralLattice.*` objects (see Not verifiable). A probe copy without that import and without the six lattice-dependent declarations and examples 8–12 elaborates with exactly nine `declaration uses 'sorry'` warnings and no other diagnostic (the one error is the then-dangling `open TauCeti`). Every Lean name occurs in the README; `theorem` only; no `set_option`, `#eval`, `#print`, `lemma`, `True` placeholder or sorried data; `import Mathlib` single; module docstring, namespace and layer comments in README order.
- Targets: 112 read (0.1–0.4, 1.1–1.26, 2.1–2.20, 3.1–3.13, 4.1–4.11, 5.1–5.15, 6.1–6.12, 7.1–7.4, 8.1–8.7). Adversarial instances tried: the definition of `IsEnriques` against K3 (b₂=22) and abelian (b₂=6) surfaces and against a blown-up Enriques surface; Pic^τ∈{ℤ/2, μ₂, α₂} and their Cartier duals in 1.12–1.15; C=0 in 1.17; nef isotropic effective D in 1.4 (both half-fibres of the pencil are the only effective divisors in the class); Weyl reflections preserve the square in 1.5; étale rank-two groups over a connected base are constant in 2.8; fppf versus étale torsors under ℤ/2 in 3.12; n=0,1 in 3.12; the eight exponent triples and x=0 in 3.6; the four units of ℤ[1/2] in 3.5; u≡1 and u≡5 mod 8 in 3.6/3.9; r=1,2 and q=2,4 in 3.1; Shioda–Tate with Mordell–Weil rank zero in 5.2; I₀* over 𝔽₂ in 2.20; the quasielliptic cusp curve as a special bisection in 1.19–1.20; tame double fibres with ordinary/additive half-fibres in 1.11 (agrees with MMV22 Lemma 2.2); exceptional/supersingular versus ordinary in 8.1–8.4. No false “iff”, sign or normalisation was found beyond what pass a reported.
- Checks recomputed exactly (fractions, GF(2) elimination, exhaustive enumeration): both Gram matrices symmetric, even, determinant −4, GF(2)-rank 8 (so invariant factors 1⁸,2,2), inverse denominators 2, discriminant group (ℤ/2)² with q-values 0,0,0,1/2, the eight dual-basis entries of 6.2, the identity R̃²=2n for C₈*+nR*+F*, 15 incidence vectors in six orbits of sizes 2,2,1,2,4,4, the four even-square pairs {0,8},{1,7} (one spinor class) and {0,7},{1,8} (the other), 6 III* vectors in four orbits of sizes 2,1,2,1 under the reversal of figure (17), point counts 25 of all 18 candidate triples and of the three extra triples (15+4+6, 17+4+4, 15+4+6), the n_a table, 25/57, the four quasielliptic component triples, (e+f)²=2 on U, the Hensel inequality 1/8<1/4, −15≡1 mod 16, χ(Θ)=−10 and both tangent triples. All agree with the README. (About 70 numerical Checks.)
- Locators: 40 SCH23 locators verified in the cached legal copy of arXiv:2004.07025v3 (“Third revised version, 19 July 2022”, pages = printed pages): Lemma 1.1 p. 5; Theorem 2.1 p. 8; Propositions 3.1 p. 10, 3.2 p. 11, 4.1, 4.2 p. 12, Lemma 4.3 p. 12, Proposition 4.4 p. 13; Theorems 5.1, 5.2, Proposition 5.3 p. 14; Propositions 5.4, 5.5 p. 15; Theorem 5.6 p. 16; Proposition 6.2 p. 19; Proposition 7.1 p. 20; Corollaries 7.2, 7.3 p. 21; Proposition 8.1 p. 22; Corollaries 8.2, 8.3 p. 23; Theorem 9.1, Proposition 9.2 p. 24; Proposition 9.3 p. 25; Theorem 9.4 p. 26; Theorems 10.4 p. 29, 10.5 p. 31; Proposition 11.1 p. 32 with table (12) p. 33; Propositions 11.2 p. 34, 11.3 p. 35, 11.4 p. 38, 12.1 p. 38, 12.2 and graph (13) p. 41, 12.3 and graph (15) p. 42, (16) p. 43, 13.1 and figure (17) p. 44, 13.2 p. 45, 14.1 p. 47; Theorem 15.1 p. 49; statements of 4.2 (“there is a fibration” in (iii), (iv)), 3.1, 5.4 (i)–(iii), 9.2, 12.2, 12.3, the §4 definition and (14), (16), (17) read in full and found to support the README as written. ESB21 (math/0405510v2): Theorems 1.1–1.3 p. 2, Lemma 2.3 p. 4, Definition 2.6 p. 5, Propositions 2.7, 2.8 pp. 5–6, 3.16 p. 12, Theorem 4.2 p. 13, Corollary 4.3 p. 14 (10). DI21 (1906.04616v2): Proposition 3.3 p. 11, Corollary 3.4 p. 12, Proposition 4.2 p. 15, Theorem 4.3 p. 16, Theorem 6.1 p. 20, Proposition 7.1 p. 23 (printed χ(Θ)=10 is the typo the README names), Theorem 7.2 p. 23 (7). MMV22 (2201.05481v1): Definition 1.1 p. 1, Theorem 1.2, Remarks 1.4–1.5 p. 2, Lemmas 2.1–2.4 pp. 3–4 (8). Lang1983 Theorem 4.1 at line 757. Total 66 locators, none wrong; the SCH23 and DI21 author-manuscript dates named in References match the cached arXiv versions.
- Suppliers: IntegralLattices Layer 6, milestone 6A (indefinite classification, `U^{t₊}⊕E₈(−1)^k`) exists on main (`TauCetiRoadmap/IntegralLattices/README.md:1643`); LocalFieldsRamification Layers 1–2 exist (`README.md:267`, `:561`); JacobianChallenge Layer D exists (`README.md:218`); AlgebraicVectorBundles on main. Tau Ceti at `a91d3aaf`: `SquareClassGroup`, `card_unitSquareClasses_padic_two`, `Padic.not_isSquare_five`, `UnramifiedQuadratic`, `FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDuality`, `LineBundleClass`, `Scheme.CartierDivisor.toLineBundleClassHom`, `LineBundleClass.eulerDegreeHom`, `LineBundleClass.picZero`, `rigidifiedPicardFunctor`, `IntegralLattice.hyperbolicPlane` (Examples.lean), `d8PlusLattice` (RootLattice/D8Plus/Basic.lean), `evenIntermediateCarrierOrderIsoIsotropicSubgroup` (Overlattice/Isotropic.lean), `exists_eq_neg_one_pow_mul_five_pow_mul_sq` and `isSquare_coe_iff_mem_unitsPrincipal_three` (NumberTheory/Padics/SerreSigns.lean) all present; `count_surface_of_constant_num` is a WC.7 suggested name, not a pinned declaration. Mathlib at `6b7abb3c`: `Pi.basisFun` (LinearAlgebra/StdBasis.lean), `hensels_lemma` (NumberTheory/Padics/Hensel.lean, strict inequality `‖F a‖ < ‖F' a‖²`), `bijective_algebraMap_int_of_finite_of_unramified` (NumberTheory/NumberField/ExistsRamified.lean, hypotheses `Module.Finite ℤ 𝒪`, `Algebra.Unramified ℤ 𝒪`, `IsDomain 𝒪`, `FaithfulSMul ℤ 𝒪`) match the README. Open supplier pull requests checked live: WeilConjectures #1208 (head `daa3895`), AlgebraicModuliForArithmeticGeometry #853 (`98fd038`), FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 (`7782ded`), all open and non-draft; K3SurfacesAndSymplecticBoundedness #1375 (`b82cbb7`) open, draft. (17 supplier citations checked; three defects, F01–F03.)
- Dependency check, verbatim:
  ```text
  NOT IN ORDER: EnriquesSurfacesAndIntegralNonexistence (insert it after its last supplier)
  depcheck: 9 roadmaps, 74 edges, 1 problem(s)
  ```
  `grep -nx` of the name in `merge-order/ORDER.txt` is empty: an imported package, not a defect. No UPWARD or CYCLE line.
- Policy: title capitalises “Enriques”; no `lemma`, `set_option`, LaTeX delimiters, issue or pull-request numbers; definitions with Checks all have at least three (pass a F09, F18, F19 cover the non-discriminating ones); at most two examples per definition except where pass a F08 applies.
- Not re-raised (pass a, codex, 17d85a4): F01 three fictitious supplier roadmaps; F02 SchemeAndStackFoundations SF.* drift and absent DI21 theorems; F03 JacobianChallenge boundary; F04 K3 sibling citations; F05 WeilConjectures cycle (my F03 is the complementary duplication/ownership fact); F06 missing discriminant headlines; F07 basis-pairing wrappers; F08 lattice example contract; F09 biconductrix Check; F10 general reducibility theorem; F11 quasielliptic III*/II* multiplicities; F12 missing `sources.toml` (my F07 concerns the README reference list); F13 stale pins and “newer than the Lean pin”; F14 auxiliary Jacobian count; F15 publication instruction and the trailing name catalogue in Suggested.lean; F16 characteristic-zero lifting; F17 forward reference in 1.12–1.14; F18 family Checks; F19 Picard-constancy controls.

## Not verifiable

- `Suggested.lean` imports `TauCeti.LinearAlgebra.IntegralLattice.Overlattice.Isotropic`, whose compiled object (and every `IntegralLattice` object) is absent in the review environment: `firstLattice`, `secondLattice`, `firstLattice_even`, `secondLattice_even`, the two basis-pairing theorems and examples 8–12 were not elaborated; their arithmetic content was recomputed independently (above). Repairs F05 and F06 were tested only where no Tau Ceti object is needed.
- `firstGram_determinant`, `secondGram_determinant`: value −4 confirmed by exact elimination; no one-tactic proof found at the default heartbeats.
- Liu–Lorenzini–Raynaud Theorem 6.6 and its 2018 corrigendum (4.3): paywalled; whether the corrected statement gives equal geometric Kodaira types at the two tame double fibres in characteristic two (p divides the multiplicity) could not be checked. SCH23arxiv line 1084–1087 asserts it citing the uncorrected reference.
- Fontaine preprint 91-02, Bombieri–Mumford 1977, Cossec–Dolgachev 1989 and Cossec–Dolgachev–Liedtke Theorem 6.1.10: no cached legal copy.
- ComplexComparisonPartII §C3.2d.2 `relative_picard_algebraicSpace` (named by AlgebraicModuliForArithmeticGeometry §7.6.3 as the owner of Picard representability): not read; whether it reaches the algebraic-space-family generality of 2.2 is open and bears on the F01 repair.
- The K3 sibling (#1375, draft) and SchemeAndStackFoundations section mapping were not re-examined beyond pass a F02 and F04.
