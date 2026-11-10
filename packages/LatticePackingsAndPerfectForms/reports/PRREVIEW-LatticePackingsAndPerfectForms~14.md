# Review of LatticePackingsAndPerfectForms (pull request #1723 at ba416b6)

**Verdict:** needs changes

Full review of the folder at `ba416b6`. The folder has not changed since the previous review, which read the same head. That review's R02 is repaired in the description; its R01 is not, and is raised again. This round finds four new defects, two of them blocking: Layer 7.4 restates a Tau Ceti group and homomorphism, and 3.3 reads a junk value of the successive-minima index.

## R01 (P2) — The branch pins Tau Ceti `358314d4`, but the README declares `2fd255d9`, where the Leech covering-radius headline is statable and absent

Re-raised: H01/H02 of the earlier repair reports (answered "not actionable inside the roadmap folder"), which was R01 of the previous review.

**Location.**
- `lake-manifest.json` (unchanged): Tau Ceti `358314d4`, Mathlib `f6090c70`. Main `f8836c4` pins `2fd255d9` and `1b1ccf4b`.
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:282–285`: "The pins are Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`. Every Tau Ceti and Mathlib declaration … is cited as it is at those revisions."
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:32–37`: "… exists at the Tau Ceti revision `2fd255d9…` that README.md cites and is absent from the earlier revision this file is elaborated against."

**Claim.** The folder is written against two library revisions. Twenty-two library names that the README cites are absent at the branch pin. The module docstring describes the branch rather than the mathematics, and it becomes false at merge: from then on main's `2fd255d9` applies, `μ(Λ₂₄) = √2` is statable, and it is not stated.

**Witness.** These names are absent at `358314d4` and present at `2fd255d9`:
- the nine Leech declarations (`Rank24/Leech/Basic.lean:236`, `:299`, …);
- six `IsMinkowskiReduced` declarations;
- `IsPosDef.minimum_le_mul_determinant_rpow`, `kissingNumber_typeE₈RootLattice` and `ofGramMatrix_singleton_eq_rankOne`;
- the three `HeckeRing.GL2.Newform` bad-prime lemmas (`Newforms/BadPrime/Classification.lean`);
- `ZLattice.prod_successiveMin_mul_measureReal_le_two_pow_mul_covolume` (`MinkowskiSecond.lean:626`).

**Why the settled reason fails.** The reason is true of a repair job confined to the folder. This report is addressed to the pull request, and its author can merge main. After the merge the pull request's diff against main is still only the folder's three files, because the manifest comes from main and is not edited by hand.

**Repair.**
1. Merge `origin/main` into the branch. No README line changes: 282–285 become true as written.
2. In `Suggested.lean`, add `import TauCeti.LinearAlgebra.IntegralLattice.Rank24.Leech.Basic`. After `kissingNumber_eq_kissingNumber`, state:

   ```lean
   /-- **3.4.** The Leech lattice has covering radius `√2` in the real model of the Gram matrix of
   any `ℤ`-basis (Conway–Parker–Sloane; Conway–Sloane, Ch. 23). -/
   theorem coveringRadius_gramForm_leechLattice (b : Basis (Fin 24) ℤ TauCeti.leechLattice) :
       (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = Real.sqrt 2 := sorry
   ```

3. In the module docstring, delete the text from "The Leech covering radius" to "indexed by `Fin 24`.". Add the theorem to README 3.4 under "API and acceptance statements".
4. Apply the after-merge step of R02.

This hunk was elaborated at main's pins in the previous review (exit 0, 53 `sorry` warnings). This review did not re-run it, because the only Lean commands it may run use this worktree's pins, where the module is missing. Here I checked the carrier by reading `Leech/Basic.lean:236` (`leechLattice : IntegralLattice (Fin 24 → ℚ)`) and `:299` (`isPosDef_leechLattice`).

## R02 (P2) — Layer 7.4 rebuilds the orthogonal group `O(q_L)` and the map `O(L) → O(q_L)`, which Tau Ceti already provides

**Location.**
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/Suggested.lean:692–701` (`quadraticIsometryGroup`: "Composition gives the native finite quadratic self-isometries their group structure.") and `:720–739` (`discriminantQuadraticHom`).
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1894–1898`: "Bundle … `Isometry.discriminantQuadraticIsometry` as `discriminantQuadraticHom`. The group instances `bilinearIsometryGroup` and `quadraticIsometryGroup` use composition …"

**Claim.** The roadmap gives the self-isometries of a finite quadratic module a second group structure, and builds a second homomorphism `O(L) →* O(q_L)`. Both objects exist in Tau Ceti, so they must be cited, not restated. The bilinear side (`bilinearIsometryGroup`, `discriminantHom`) has no library counterpart at either pin and stays here.

**Witness.**
- At the branch pin: `TauCeti.QuadraticMap.orthogonalGroup`, in `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:186`. Its docstring (`:180–185`, `:215–216`) says that `IsometryEquiv Q Q` "carries no group structure". `orthogonalGroupEquivIsometryEquiv` (`:217`) identifies the two underlying sets.
- At `2fd255d9`, additionally: `TauCeti.FiniteQuadraticModule.orthogonalGroup` (`FiniteBilinearModule/OrthogonalGroup.lean:49`) and `TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom` (`IntegralLattice/Discriminant/OrthogonalGroup.lean:249`).

**Repair.**

*Now, in the folder only (tested).* Add `import TauCeti.LinearAlgebra.QuadraticForm.OrthogonalGroup.Basic`, delete `quadraticIsometryGroup`, and replace `discriminantQuadraticHom` with:

```lean
/-- **7.4.** The induced action on the discriminant quadratic module of an even lattice, valued in
Tau Ceti's orthogonal group `O(q_L)`. -/
noncomputable def discriminantQuadraticHom (L : IntegralLattice V) [L.IsNondegenerate]
    (he : L.IsEven) :
    TauCeti.IntegralLattice.Isometry L L →*
      TauCeti.QuadraticMap.orthogonalGroup (L.discriminantQuadraticModule he).quadratic where
  toFun e := (TauCeti.QuadraticMap.orthogonalGroupEquivIsometryEquiv _).symm
    (e.discriminantQuadraticIsometry he)
  map_one' := by
    ext x
    simp only [TauCeti.QuadraticMap.coe_orthogonalGroupEquivIsometryEquiv_symm,
      OneMemClass.coe_one, LinearEquiv.coe_one, id_eq]
    change (Isometry.discriminantQuadraticIsometry (1 : Isometry L L) he).toAddEquiv x = x
    rw [Isometry.discriminantQuadraticIsometry_toAddEquiv]
    simp [Isometry.one_def]
    rfl
  map_mul' f g := by
    ext x
    simp only [TauCeti.QuadraticMap.coe_orthogonalGroupEquivIsometryEquiv_symm,
      Subgroup.coe_mul, LinearEquiv.mul_apply]
    change (Isometry.discriminantQuadraticIsometry (f * g) he).toAddEquiv x =
      (f.discriminantQuadraticIsometry he).toAddEquiv ((g.discriminantQuadraticIsometry he).toAddEquiv x)
    simp only [Isometry.discriminantQuadraticIsometry_toAddEquiv]
    simp [Isometry.mul_def]
    rfl
```

A scratch copy with these changes elaborates at the branch pin: exit 0, 52 `sorry` warnings and nothing else. `fvIndex` and `fvIndex_rankOne` are unchanged and still elaborate.

In README 7.4:
- write that `O(q_L)` is Tau Ceti's `TauCeti.QuadraticMap.orthogonalGroup`, and that this roadmap adds only the group `bilinearIsometryGroup` of the bilinear module;
- add `TauCeti.QuadraticMap.orthogonalGroup` and `TauCeti.QuadraticMap.orthogonalGroupEquivIsometryEquiv` (`TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`) to the 7.4 row of *From Tau Ceti* and to its *Needs:* line.

*After R01's merge.*
- Delete `discriminantQuadraticHom`.
- Import `TauCeti.LinearAlgebra.IntegralLattice.Discriminant.OrthogonalGroup`.
- Define the even branch of `fvIndex` as `(TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom L he).range.index`. Its codomain is the same group: `FiniteQuadraticModule.orthogonalGroup A` is the abbreviation `QuadraticMap.orthogonalGroup A.quadratic` (`OrthogonalGroup.lean:49–50`).
- Cite `discriminantOrthogonalHom` in 7.4, 7.5 and *From Tau Ceti*.

## R03 (P2) — 3.3 reads Successive Minima's 0-based minima at index n

**Location.** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1009–1013`: "Prove `coveringRadius A = GoN.latticeCoveringRadius (stdLattice A)` … Prove Jarník's inequalities `λₙ/2 ≤ coveringRadius A ≤ (∑ᵢ λᵢ)/2 ≤ n λₙ/2` with `λᵢ = SM.successiveMin (stdLattice A) (closedBall 0 1) i`".

**Claim.**
- In Successive Minima, `successiveMin … i` is the `(i+1)`-st minimum. Its index is a natural number, with the junk value `0` from index `n` on. This README uses index `0` for the first minimum in 1.2, and says so in 1.9. With the definition as written, `λₙ` is the junk `0` and the chain of inequalities is false. The diag(1,4) Check (`λ₁ = 1`, `λ₂ = 2`) silently reads the indices 1-based.
- GoN's `latticeCoveringRadius` takes values in `[0, ∞]` (GoN §4.4.2, through `Metric.infEDist`), so the stated equality compares a real number with an extended real.

**Witness.** For `I₂`, SM's indices 0, 1, 2 give 1, 1, 0 (`SuccessiveMinima/README.md:307–318`: the value is `sInf ∅ = 0` at every index `≥ d`). The last inequality then reads `(1 + 1)/2 ≤ 2·0/2`, which is false.

**Repair.**
- Write "with `λᵢ = SM.successiveMin (stdLattice A) (closedBall 0 1) (i − 1)` for `1 ≤ i ≤ n` (SM indexes from `0`, as in 1.9)".
- Write "Prove `ENNReal.ofReal (coveringRadius A) = GoN.latticeCoveringRadius (stdLattice A)`".

Tested: `I₂` gives `1/2 ≤ 0.70711 ≤ 1 ≤ 1`, and diag(1,4) gives `1 ≤ 1.11803 ≤ 1.5 ≤ 2`.

## R04 (P3) — 2.2's *Needs:* line omits 1.9 and lists an unused GoN item; the GoN contract lists items no milestone consumes and omits §4.3

**Location.**
- `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:885` and the 2.2 dependency row at `:923`: "GoN 4.5.1; … L 0.3, 1.1, 2.1".
- `:131–133`: "`StarBody` (4.5.1), … `criticalDeterminant` (4.5.2), `IsLLLReduced`, `lll_short_vector_factor` (5.1.2, 5.1.4)".
- `:306–308`: the GoN contract "4.4.1 …, 4.4.2 …, 4.5.1 star bodies, 5.1 LLL-reduced bases".

**Claim.**
- 2.2's route uses 1.9: the compact set of reduced representatives with `det = 1` and `min ≥ η` is 1.9's last claim, and the route says to "use the reduced-Gram bounds of 1.9". 1.9 is missing from the *Needs:* line, and star bodies appear nowhere in the route.
- The GoN contract lists 4.5.1, 4.5.2 and 5.1.x, which no milestone consumes.
- The contract omits §4.3, which 5.4 and 5.5 do consume.

**Witness.** In the README, `GoN 4.5.1` occurs only at 885 and 923. `criticalDeterminant`, `IsLLLReduced` and `lll_short_vector_factor` occur only at 133. 5.4's *Needs:* line (1534) reads "GeometryOfNumbersAndQuadraticArithmetic §4.3"; §4.3 at GoN's head `3b084ef` defines `polynomialLaplacian`.

**Repair.**
- In 2.2's *Needs:* line and table row, replace "GoN 4.5.1" with "L 1.9".
- Make the GoN contract read: "§4.3 `polynomialLaplacian`, `polynomial_fischer_decomposition`, `polynomial_sphere_harmonic_span`, `fourier_harmonic_gaussian` (5.4, 5.5); 4.4.1 `latticePackingRadius` (1.4); 4.4.2 `latticeCoveringRadius` (3.3)".
- At 131–133, drop `StarBody`, `criticalDeterminant`, `IsLLLReduced` and `lll_short_vector_factor`. They are already deferred to GoN at 170–171.

## R05 (P3) — 7.3's determinant criterion has a redundant hypothesis and misses the criterion its own formula gives

**Location.** `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md:1865–1867`: "`det L` is then a `rank L₂`-th power times a `rank L₁`-th power, so a lattice of squarefree determinant and rank `p` prime is indecomposable".

**Claim.**
- Prime rank alone forces indecomposability, so "squarefree determinant" plays no part in the stated conclusion.
- The determinant identity gives a separate criterion that holds in every rank: a squarefree determinant `> 1` forces indecomposability. The API bullet's "determinant … identities give obstruction tests" is never stated in this form.

**Witness.**
- `2I₃` has determinant 8, which is not squarefree, and prime rank 3, so it is indecomposable.
- diag(1,1,2,3) has rank 4 and determinant 6. A decomposition would have ranks 2 and 2 and determinant `d₁²d₂²`, a square, so this lattice is indecomposable, and the stated criterion does not decide it.

**Repair.** Replace the clause with: "so every lattice of prime rank is indecomposable; and since both exponents are `≥ 2`, every lattice of squarefree determinant `> 1` is indecomposable, in every rank". Add the Check "diag(1,1,2,3): rank 4, determinant 6, not a square, so not of the form `d₁²d₂²`, hence indecomposable although its rank is composite".

## R06 (P3) — Editorial defects

**Location and repair**, all in `TauCetiRoadmap/LatticePackingsAndPerfectForms/README.md`:
- `:1037–1038` "… and is listed under *Explicit scope exclusions*)." has an unmatched `)`. Delete it.
- `:1881` "(*Pinned conventions*)" points to a section that does not exist. Write "(*Conventions*, Tensor products)".
- `:1210` "`isExtreme_iff`: : extreme iff …". Write "`isExtreme_iff`: Voronoi's theorem: extreme iff perfect and eutactic."
- `:1765` "`isHalfUniversal_iff_twoNinety`: (Bhargava–Hanke), for …" has lost its subject. Write "the 290 theorem (Bhargava–Hanke), for the half-norms of an even lattice."
- `:870–872` "Rank one has the unique determinant-one form [1], so a maximizing sequence has a convergent subsequence after reduction and `min` is continuous" joins two unrelated facts with "so". Write "In rank one the only determinant-one form is [1], so γ₁ = 1 is attained. In every rank, `min` and `det` are continuous on `PosDefForm n`; state both."

**Claim.** Each is a broken cross-reference, garbled punctuation or a sentence without its subject.

**Witness.** The quoted lines. The README's headings (`grep '^## '`) contain no *Pinned conventions*.

## Previous findings

- **R01 — not repaired.** `changes.md` reports 0 changed lines. The manifest still pins `358314d4`, README 282–285 still names `2fd255d9`, and `Suggested.lean` 32–37 is unchanged. Raised again as R01.
- **R02 — repaired.** The description's depends-on block now reads "- [ ] #1421 ProbabilisticAndMetricNumberTheory", next to #851 and #1001.

## Verified sound

**Gate, build and order.**
- The worker's gate at `ba416b6` passes: every check 0, `build=0`, OK.
- No file changes outside the folder: the diff stat over `':!TauCetiRoadmap/LatticePackingsAndPerfectForms'` is empty.
- Dependency check: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The merge-order lines are GoN 55, PMNT 62, WeightsInEtaleCohomology 147 and this roadmap 148. IntegralLattices, ThetaSeries, SuccessiveMinima, ModularForms, GlobalQuadraticForms and Rank24LatticeConstructions are on main.

**Elaboration, signatures and padding.**
- `lake env lean` on `Suggested.lean` exits 0 with 52 messages, all `declaration uses sorry`.
- One scratch file held `#check @name` for all 112 declarations. Its output equals `signatures.md` character for character after normalising whitespace (25118 = 25118 characters).
- The one dropped-binder lead, `polynomialsOfDegreeLE`, declares its own `E` with `[NormedAddCommGroup E] [InnerProductSpace ℝ E]` and needs none of the dropped instances.
- Padding probe: each of the 52 `sorry`s was replaced by `first | rfl | (simp; done) | infer_instance | (norm_num; done) | trivial | decide | sorry`. All 52 still warn, so none closes in one tactic.
- No `set_option`, no `lemma`, a single `import Mathlib`, and nine `TauCeti.*` imports, all present at the branch pin.

**Library names.**
- I scanned the README's 204 backticked names containing `.` or `_`. Every library name is found at `2fd255d9` / `1b1ccf4b`. The tokens that are not library names are the six knowl ids, the label `dim.det.level.class_number`, notation (`Esc_k`, `D_L`, `f_L`, `Sym_n`) and supplier-roadmap target names.
- 22 names are absent at the branch pin (R01).
- Declarations opened: `Matrix.det_fromBlocks₁₁` (`SchurComplement.lean:369`), `abs_sub_round` (`Order/Round.lean:193`), `LinearMap.BilinForm.tensorDistrib_tmul` (`BilinearForm/TensorProduct.lean:115`), `Matrix.PosDef.inv` (`PosDef.lean:579`), `Matrix.PosDef.transpose` (`:181`), `posDef_iff_dotProduct_mulVec` (`:456`), and the convex-body, `ZSpan`, `volume_ball`, `toSphere` and level-one dimension declarations of the Mathlib table, each in the file named.
- No bundled `IntegralLattice` tensor product exists at either pin, so the docstring's "not statable" note for 7.1–7.3 is correct.
- Mathlib's `DeloneSet.coveringRadius` is a covering bound, not the inhomogeneous minimum, so it is not a duplicate of `coveringRadius`.

**1.6, tested against the three Tau Ceti statements.**
- `IsPosDef.minimum_le_rpow_mul_determinant_rpow` is `min ≤ (4/3)^((n−1)/2) det^(1/n)` (`PosDef/Hermite.lean`).
- `IsPosSemidef.successiveMinimum_zero` is index 0 = minimum, for positive rank.
- `IsPosDef.minimum_le_mul_determinant_rpow` at `2fd255d9` is `(4/π) Γ(n/2+1)^(2/n)` (`PosDef/Minkowski.lean`).

**Cross-roadmap citations, resolved at main `f8836c4` or at the open heads.**
- IL: 0F (the native splitting), 1C–1D, 1G (`Finite quadratic forms (1G)` with `O(q)`), 2A–2E (native, including finiteness of `O(L)`), 4A, 6C, 6D, 9B.
- Completed IL Layers 3 and 5.
- TS:
  - Layer 1 (`poissonSummation`, `gaussian`, `fourier_gaussian`);
  - 2A (`dual_dual`), 2D (`realModel`; `RealSpace` and `realModel` at TS `Suggested.lean:498`, `:521`), 2G (`shell`, `ncard_vectorsOfNorm_ratModel`);
  - Layer 5, 7C–7D, 8B, 8D.
- SM: 0.1.2 `hermitian_gram_hadamard`, 1.1, 1.5 `exists_successiveMin_witnesses` (lattice vectors attaining all minima), 2.1.4.
- GoN at `3b084ef`: §4.3 has all four names, with the formula `(−i)^ℓ t^(−ℓ−n/2) P(ξ) exp(−π‖ξ‖²/t)`; 4.4.1, 4.4.2, 4.5.1, 4.5.2, 5.1.2, 5.1.4.
- PMNT at `d311ebe`: §4.9b `mahler_relativelyCompact_iff`, max norm, every `n`.
- Weights at `9e753f8`: §6.1, the Ramanujan bound.
- ModularForms §0.1 (`M_k(N,χ) = S_k ⊕ E_k`), GQF 4.4 (product formula) and 6.1, EffectiveDiophantineMethods §1.8 (Fincke–Pohst, `#1046`), Rank24LatticeConstructions Layer 6.
- `overlaps.md`: no open pull request changes this roadmap or drops an id it cites.

**Ownership.**
- I searched every open roadmap and main for the Hermite constant, perfect, eutactic and strongly perfect forms, Voronoi's theorem, the Ryshkov polyhedron, spherical designs, Venkov, the 15 and 290 theorems, Kitaoka, Cohn–Elkies, Festi–Veniani, covering density, Mordell and the kissing number. Only this roadmap owns them. The 15/290 hits in #1745, #1816 and #1948 are regex false positives, and NumberFieldEnumeration only parametrises a Hermite-type bound.
- Packing and covering radii of Euclidean lattices are cited from GoN, real successive minima from SM, theta series and the real model from TS, and the lattice arithmetic from IL.
- The only duplication found is R02.

**Seeded sample (15 targets).**
- 0.4: TS 2D/2G resolve.
- 0.5: TS Layer 1 `dual`, 2A. Values in the table.
- 1.1, 1.3 and 3.2: definitions and values checked; there is no external locator.
- 1.6: three Tau Ceti statements opened (above).
- 1.7: Mathlib's `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` (`MeasureTheory/Group/GeometryOfNumbers.lean`).
- 3.1: Conway–Sloane is not verifiable; the relevance criterion was recomputed on ℤ² and A₂.
- 3.3: SM 1.5 and GoN 4.4.2 resolve; see R03.
- 4.1 and 4.2: the definitions match dsv2007 lines 60–68 (p.2). 4.1's "unique solution" locator, §1 p.2, is correct.
- 4.10: dsv2007 lines 87–96 (Table 1, p.3) give 2, 3, 7, 33, 10916 with maxima D₄, D₅, E₆, E₇, E₈; line 107 (Theorem 1.1, p.3).
- 5.3: venkov2001 lines 2427–2479, printed pp.20–21: Definition 6.1, Proposition 6.2 (strongly eutactic iff 2- or 3-design, coefficients `n/(N(L)|X|)`), Definition 6.3, Theorem 6.4. The README's route for "strongly perfect ⇒ perfect", through `(xᵀHx)²`, is not Venkov's rank computation but is valid.
- 4.4: "discussion after Definition 6.1, pp.20–21" is lines 2429–2439.
- 5.4 and 5.2: venkov2001 lines 1175–1242, Theorem 3.2 on printed p.11, which assumes `n ≥ 2`. The README's antipodal criteria also hold in dimension 1, where `X = {±r}` is the whole sphere.
- 7.3: no locator. The statements are elementary and the values were recomputed (R05).
- Also checked:
  - Coulangeon–Nebe (arXiv:1201.1832v1, read for this review): Corollary 2.3 on p.3 (rank ≤ 43, through Kitaoka's Theorem 7.1.1) and Remark 2.4(1) (rank ≥ 44 needed; Steinberg's examples for n ≥ 292) support 7.2.
  - Festi–Veniani §2.1, p.3 (quadratic form on `L♯` for even `L`, bilinear otherwise) and Theorem 2.8, p.9 support 7.5.

**Adversarial pass.** Every value was computed this round, by hand or by a short script.

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 0.4 shells | [1], t = −1, 0; [2], t = 2 | squared-norm shells ∅, {0}, {±1}: sizes 0, 1, 2; `sphere 0 √(−1)` = {0} ≠ ∅, so `t ≥ 0` is needed | Pass |
| 0.5 contragredient, sums, duals | I₂, U = [[1,1],[0,1]]; [2]⊕[3]; [4]; diag(1,4) | `(U•A)⁻¹` = [[2,−1],[−1,1]] = `U⁻ᵀ•A⁻¹`; acting by U⁻¹ gives [[1,−1],[−1,2]]; det 6, value 5 at (1,1); dual generator: 4·(1/4)² = 1/4 = (1/4)·1²; dual diag(1,1/4), det 1/4 | Pass |
| 1.1 min, S, sublevels | diag(1,4); I₂; [1]; rank 0 | min 1, S = {±e₁}, kiss 2, span 1; min 1, kiss 4; C = −1, 0, 1 give ∅, {0}, {0,±1}; `sInf ∅ = 0` | Pass |
| 1.3 S⁺ | I₂; A₂; diag(1,4) | #S⁺ = 2, 3, 1 = 4/2, 6/2, 2/2 | Pass |
| 1.6 comparisons | A₂ | 2 = (4/3)^(1/2)·3^(1/2); Tau Ceti statements as paraphrased | Pass (Minkowski: R01) |
| 1.7 `hermite_le_minkowski` | n = 1, 2, 8, 24; [4]; I₂ | right sides 1.00000, 1.27324, 2.81814, 6.734 against γₙ = 1, 1.15470, 2, 4; [4]: 4 = 4; I₂: π < 4 | Pass |
| 1.8 `hermite_le_pow` | [4]; A₂; I₂; E₈ | 1 ≤ 1; 1.15470 = 1.15470; 1 < 1.15470; 2 ≤ 2.737 | Pass |
| 2.1 Mordell | n = 2, 3, 4, 8 | 1 ≤ 1; 1.25992 ≤ 1.33333; 2 = 2; 64 = 64 | Pass |
| 2.2 attainment | n = 2, η = 1/4; ε = γₙ | diag(1/t,t) allowed iff 1 ≤ t ≤ 4; η = 0 admits the unbounded family; route uses 1.9 | Pass; R04 |
| 2.3 γ₂, γ₃ | A₂; A₃; I₃ | 4/3; 8/4 = 2; I₃: 1 < 2 | Pass |
| 3.1 cell, relevance | [4]; I₂; A₂ | metric length 2 = √4; area 1; e₁ + 2ℤ²: shortest only ±e₁; (1,1) + 2ℤ²: four shortest; A₂ coset of e₁−e₂: ±(e₁−e₂) norm 2, ±(1,1) norm 6 | Pass |
| 3.2 μ, deep holes, Θ | [4]; I₂; rank 0 | μ = ρ = 1; μ = 0.70711 > ρ = 0.5, Θ = π/2, square has 4 extreme points; rank 0: μ = 0, cell = {0} = its extreme points | Pass |
| 3.3 Jarník | I₂, diag(1,4) | SM indices 0, 1, 2 on I₂ give 1, 1, 0: `1 ≤ 0` false; corrected: 0.5 ≤ 0.70711 ≤ 1 ≤ 1 and 1 ≤ 1.11803 ≤ 1.5 ≤ 2 | R03 |
| 3.4 covering values | ℤⁿ, A₂, A₃, D₄, E₈, Λ₂₄; I₃; rank 1 | μ² = n/4, 2/3, 1, 1, 1, 2; Θ(A₂) = 1.2092, Θ(I₃) = 2.7207, Θ(Λ₂₄) = 2¹²π¹²/12! = 7.9035; rank 1: Θ = 2(√a/2)/√a = 1 | Pass; R01 |
| 4.1 perfection | I₂; A₂; D₄; diag(1,4); rank 0 | span ranks 2/3, 3/3, 10/10, 1/3; kiss 4, 6 ≥ 6, 24 ≥ 20; rank 0: 0 = 0 | Pass |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | ∑xxᵀ = 2I = 2A⁻¹, c = 1/2 = 2/(4·1); [[4,−2],[−2,4]] = 6A⁻¹, c = 1/6 = 2/(6·2); (A⁻¹)₂₂ = 2/5 against 0 from S = {±e₁} | Pass |
| 4.5 Voronoi | A₂; I₂; [[2,1],[1,3]]; rank 0, 1 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; rank 0: S = ∅, A⁻¹ = empty sum; rank 1: γ ≡ 1, both sides true | Pass |
| 4.6, 4.7 finiteness | ranks 1, 2 | perfect classes 1 ([1]) and 1 (A₂); eutactic classes in rank 2: I₂, A₂ | Pass |
| 4.9 neighbour | A₂, N = [[0,−1],[−1,0]]; [1], N = [1]; rank 0 | t ∈ [0,2], ρ = 2, neighbour [[2,−1],[−1,2]], det 3, min 2; ρ = 0; rank 0: `0·1/2 − 1 = 0` in ℕ, so every N is a facet normal and the neighbour P is perfect | Pass |
| 4.10 counts, γⁿ | ranks 4–8 | 2, 3, 7, 33, 10916; 16/4 = 4, 32/4 = 8, 64/3, 128/2 = 64, 256/1 | Pass |
| 4.11 Cohn–Elkies, γ₂₄ | f ↦ 3f; f ↦ f(a·); Λ₂₄ | ratio 3/3 = 1; the factor a⁻ⁿ on f̂(0) cancels the radius r/a; δ = (√4/2)²⁴/√1 = 1, γ = 4 | Pass |
| 5.2 moments | {±1}; ℤ² roots; hexagon; dimension 1 | 2 = 1·2·1; second moment 2 = 4/2; fourth 2 ≠ 3/2; hexagon 9/4 = 9/4; n = 1: c_j = 1, both sides 2r^(2j)a^(2j) | Pass |
| 5.3 design forms | D₃ roots (A₃); A₂; I₂; rank 0 | second moment 8 = 12·2/3; fourth 8 ≠ 48/5; A₂ 9/4 = 9/4; I₂ 2 ≠ 3/2; rank 0: ∅ is no design, so `hn` is needed | Pass |
| 5.4 Gram Laplacian | I₂; diag(1,4); E₈ (`CartanMatrix.E 8`) | Δ(X₀²) = 2; 2 − 1/2 = 3/2 and 2 − 2 = 0; (A⁻¹)₀₀ = 4, (A⁻¹)₇₇ = 2; Laplacians 4 and 0; root sums 240 − 120 = 120 and 240 − 240 = 0 | Pass |
| 5.5 Fourier identity | s = τ/i; τ = i; s = 4, n = 2 | (−i)^d s^(−n/2−d) = (τ/i)^(−n/2) τ^(−d); multipliers −i (d = 1), −1 (d = 2); prefactor 1/4 | Pass |
| 5.6 Hecke | E₈ with P = 2, P = 0; odd d | constant term 2, norm-2 coefficient 480; 0 and 0; odd d cancels under x ↦ −x | Pass |
| 5.7 Venkov | n = 8, 16, 24 | t = 7, 3, 11; dim S at weights 6, 8, 10 is 0 (< 1); at 10 is 0 (< 1); at 14–22 is 0, 1, 1, 1, 1 (< 2); dim S₂₄ = 2 | Pass |
| 6.1 universality | ℤ³; ℤ⁴; A₂; 2I₄ | ℤ³ misses 7, 15, 23, 28, 31, 39, 47, 55, 60; 7 = 4+1+1+1; A₂ half-norm truant 2; 2I₄ minimum 2 | Pass |
| 6.2 escalation | [1] by 2 | pairings 0, ±1 give diag(1,2) (det 2) and [[1,1],[1,2]] (det 1, ≅ I₂) | Pass |
| 6.3 15 theorem | ⟨1,2,5,5⟩; ⟨1,2,5,10⟩; ⟨1,1,2⟩ | misses below 2000: {15}; misses below 300: none; truant 14 | Pass |
| 6.4 290 theorem | 2I₄; [2]; A₂ | half-norm = sum of four squares (all 29); [2] misses half-norm 2; A₂ misses norm 4 | Pass |
| 7.1, 7.2 Kitaoka | A₂⊗A₂; [√2]⊗[3]; rank 0 | det 81, min 4 = 2·2, kiss 18 (all pure tensors), #Aut 144; 3√2 = √2·3; 0 = 0·min B | Pass |
| 7.3 decomposability | E₈ against A₂⊗D₄; 2I₃; diag(1,1,2,3) | det 1 against 1296; 2I₃: det 8, rank 3, indecomposable; det 6 is not a square | R05 |
| 7.4 composition order | 2I₃, f = (12), g = (23) | (f·g)(e₁/2) = e₂/2, (g·f)(e₁/2) = e₃/2; q(eᵢ/2) = 1/4 | Pass; R02 |
| 7.5 `fvIndex_rankOne` | m = 3, 4, 5, 6, 8, 12, 15, 24, 30 | 1, 1, 1, 1, 1, 2, 2, 2, 2; O(ℤ/8, b) = {1,3,5,7}, O(ℤ/8, q) = {1,7} | Pass |
| Worked examples | A₃*, A₃, D₄, E₈, [[2,1],[1,3]], LMFDB 2.3.6.1.1 | det 128, δ = 3√3/32, Θ = 5√5π/24 = 1.4635; δ = √2/8, Θ = 2π/3; δ = 1/8, Θ = π²/4; Δ = π⁴/384; #Aut 4; Δ = 0.45345, γ = 0.57735 | Pass |

## Not verifiable

| Source | Cited at | Where I looked |
| --- | --- | --- |
| Conway–Sloane, *SPLAG*, Ch. 21 §3, Ch. 23, Ch. 25 | 3.1 (seeded), 3.4 | Springer, behind a paywall; no legal open copy. The relevance criterion was checked on instances only. |
| Gruber–Lekkerkerker, *Geometry of Numbers*, Ch. 2 §13 | 3.3 (seeded) | North-Holland/Elsevier, behind a paywall. Jarník's inequalities were checked on instances (R03). |
| Martinet, Schürmann, Ash, Kitaoka, Bhargava, Bhargava–Hanke, Hanke, Cohn–Elkies | 1.9, 2.1, 4.5, 4.7, 4.9, 6.3, 6.4, 4.11 | Outside the seeded sample. Kitaoka's Theorem 7.1.1 is used here as Coulangeon–Nebe quote it (p.3). |

## Source issues

- none
