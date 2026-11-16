# PORT-GrossZagierAndArithmeticHeightsPartII

- Branch: `roadmap/gross-zagier-and-arithmetic-heights-part-ii`, from main `5ff4294`.
- Head commit: `eb248529605dc3f99a62bacbb34382aef4de720b`, message "GrossZagierAndArithmeticHeightsPartII: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/GrossZagierAndArithmeticHeightsPartII/{README.md,Suggested.lean,metadata.toml}`. Nothing outside the folder was edited.

## Build

`lake build TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII.Suggested`:

    ✔ [18238/18239] Built TauCetiRoadmap.GrossZagierAndArithmeticHeightsPartII.Suggested (1.6s)
    Build completed successfully (18239 jobs).

The build has 0 warnings and 0 `sorry` warnings, because the file declares nothing.

The first build of the package file as ported gave one non-`sorry` warning: "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file". I added the `module` header line, which 104 of the 251 `Suggested.lean` files on main also carry (for example `TauCetiRoadmap/SchemeKTheoryOperationsPartII/Suggested.lean`). The rebuild has no warning at all.

## Gate

    gate GrossZagierAndArithmeticHeightsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

## Dependency check

Run after the last edit:

    depcheck: 260 roadmaps, 2511 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The roadmap is line 380 of the merge order, and every supplier it names is on main or earlier in that file.

`roadmaps resolve` on the ported README:

- Cross-roadmap citations found nowhere: none.
- Lean names found nowhere: none.

The worker's earlier list of four names came from the old README. `IntegralHermitianLattice.ofCarrier` and `HermitianLatticeInvariants.ofDualQuotient` were removed as backticked names (see Supplier replacements). `ClassicalAlgebraic.supportLocalization` and `ClassicalAlgebraic.properSupports` are named targets of EtaleCohomologyFoundations on main, at `TauCetiRoadmap/EtaleCohomologyFoundations/README.md` lines 770 and 840.

## Draft pull request body

This pull request adds GrossZagierAndArithmeticHeightsPartII. It continues GrossZagierAndArithmeticHeights, which stops at Shimura curves, into the arithmetic intersection theory of special cycles on unitary Rapoport–Zink spaces and on unitary Shimura varieties of signature (n−1,1).

What it builds:
- Kudla–Rapoport cycles, their derived K-classes and Euler intersection numbers, their horizontal and vertical decompositions, and the Deligne–Lusztig and symplectic incidence strata with their Tate classes.
- The density sides of four local comparisons: unramified self-dual, unramified almost self-dual, ramified exotic smooth and ramified Krämer.
- Global special cycles with their K-classes, formal uniformizations and local arithmetic degrees, automorphic Green functions and unitary Borcherds products, derived CM cycles, and Zhang's relative trace series.

What it proves:
- the four local Kudla–Rapoport identities;
- the unramified and modified arithmetic Siegel–Weil formulas;
- the Chow-valued modularity of Kudla divisors on GSpin Shimura varieties and of unitary special divisors over every totally real field;
- the modularity of the CM intersection series over ℚ;
- the strongly regular arithmetic fundamental lemma over ℚ_p: the semi-Lie version for p ≥ n, and the group version for p ≥ n + 1 and for n ≤ 3.

These are the local and global inputs of the arithmetic inner product formula and of the arithmetic Gan–Gross–Prasad comparisons. They are built on the unitary moduli and uniformizations of PELModuliPartII and on the supported K-theory of formal schemes of SchemeKTheoryOperationsPartII, which are imported, not restated.

Two statements are deliberately conditional:
- The Krämer identity in rank n ≥ 4, and the modified Siegel–Weil formula at ramified places in that rank, are stated under an explicit hypothesis (H_m) (§8.6). The published reduction step fails for lattices of odd largest invariant, for example H₁ ⊥ H₁.
- The group AFL at p = n ≥ 5 is excluded, because its deduction needs a converse that holds only for n ≤ 3.

`Suggested.lean` declares nothing: no headline is statable at the pinned Mathlib and Tau Ceti, and its docstring names the missing carriers.

## Roadmaps this one depends on that are still pull requests

All of these are earlier in the merge order. Their heads were read through `roadmaps show`.

- PELModuliPartII
- PELModuli
- FiniteFlatGroupsAndIntegralPadicHodgeTheory
- LubinTateFormalModulesAndQuasiCanonicalLifts
- GrossZagierAndArithmeticHeights
- GeometryOfNumbersAndQuadraticArithmetic
- MotivesAndAlgebraicCycles
- MetaplecticAutomorphicForms
- QSeriesPartitionsAndMockModularForms
- ShimuraCompactifications
- ShimuraVarieties
- AutomorphicSpectralTheory
- ArakelovGeometryAndAbelianHeights
- EndoscopicTransferAndUnitaryTraceComparison
- EndoscopicTransferAndUnitaryTraceComparisonPartII

GanGrossPrasadUnitaryGroups is named only as the roadmap whose identically named requests (gap:relative-fundamental-lemma, gap:relative-finite-transfer) fix the form of two of this roadmap's requests to EndoscopicTransferAndUnitaryTraceComparison. Nothing is consumed from it.

Suppliers on main: AbelianSchemesAndArithmeticModuli, SchemeKTheoryOperationsPartII, SchemeKTheoryOperations, SchemeAndStackFoundations, EtaleCohomologyFoundations, AnalyticNumberTheoryPartII, ArithmeticLocallySymmetricSpaces, ComplexKahlerGeometry, ComplexComparisonPartII and AutomorphicFormsOnReductiveGroups.

Overlaps: no other open pull request changes this roadmap. No cited id is dropped by an open pull request, and none is defined only by an open revision. All of this was re-checked at the heads.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the required form: one module docstring, an empty namespace, no declaration and no sorry'd data. Changes to the file:

- the `module` header line, which removes the module-system warning (see Build);
- one clause in the docstring stating that Tau Ceti's `Matrix.localDensity` is the density of a symmetric matrix over `ℤ_[p]`, with no hermitian form, so the hermitian densities remain absent at the pins.

Checked:
- No headline is statable at the pins. The pinned Tau Ceti has only `TauCeti.FormalScheme.Spf.carrier` and `.structureSheaf` for formal schemes, and `TauCeti.AlgebraicGeometry.Chow.ChowGroup` for Chow groups; it has no Rapoport–Zink space, Shimura variety, orbital integral or hermitian density.
- The `#check @name` comparison has no input, because there are no declarations. No scratch file was needed and nothing changed.

The package README's `## Acceptance file` section is not part of the house shape. Its content (the headline list, the conditional statements and the missing carriers) is now a "Lean." paragraph at the end of `## Conventions`, as on main (AbelianSchemesAndArithmeticModuli has the same pattern).

## Supplier replacements and duplication removals

1. **PELModuliPartII Layer 7 citations were wrong.** This is a mathematical citation error, not only renumbering. At the head of the PELModuliPartII pull request, and in its board package, which has the same numbering, the sections are:

   | Section | Content |
   |---|---|
   | §7.1 | localized RSZ moduli |
   | §7.2 | semi-global RSZ moduli |
   | §7.3 | exotic integral model |
   | §7.4 | global Krämer modification |
   | §7.5 | unitary local-model comparison |
   | §7.6 | localized smoothness, representability and finiteness over the product PEL moduli |
   | §7.8 | Krämer regularity |
   | §7.9 | almost self-dual geometry |
   | §7.10 | gluing |

   The package cited:
   - §7.3 for the semi-global model;
   - §7.4 for the exotic model;
   - §§7.3–7.5 for "semi-global, exotic, Krämer";
   - §§7.1–7.2 for the localized model and its smoothness;
   - §7.2 for the finite comparison with the product PEL moduli.

   The fix touches the Scope, the PELModuliPartII and ShimuraCompactifications contracts, §§10.1, 10.3, 12.5, 12.6, 13.3 and the Needs and Dependencies of Layers 10, 12 and 13:

   | Object | Old | New |
   |---|---|---|
   | semi-global model | §7.3 | §7.2 |
   | exotic model | §7.4 | §7.3 |
   | Krämer model | §7.5 | §7.4 |
   | localized model | §§7.1–7.2 | §§7.1 and 7.6 |
   | product comparison | §7.2 | §7.6 |

   §§7.8–7.9 were added to the contract for the regularity and semistability that §13.3 relies on. Every other PELModuliPartII citation was checked heading by heading at the head and is correct: §§0.7, 1.1–1.6, 2.1–2.5, 3.3–3.7, 4.6, 5.1–5.3, 5.5, 5.7–5.8, 6.1, 6.5–6.8, 8.5, 9.3, 9.5–9.9.
2. **AutomorphicLFunctionsAndLocalFactors AL.0 → AnalyticNumberTheoryPartII §§5.3g–5.3h (main).** At its head, AutomorphicLFunctionsAndLocalFactors records that its AL.0.2–AL.0.4 identifiers resolve to AnalyticNumberTheoryPartII §§5.3g–5.3h. Those identifiers are characters, self-dual measures, local Schwartz–Bruhat spaces, Fourier inversion, adelic Schwartz spaces, Poisson summation and partial transforms. The README now cites the owner on main directly: in the Scope, in a new contract section, and in 19 *Needs*, Dependencies and route mentions. That removes one open-PR dependency.

   The contract states how §5.3g, written for completions of number fields and the standard character, applies here:
   - every finite extension of ℚ_p is such a completion (Krasner);
   - a character of conductor O_F₀ is ψ_v(a·) with a·O_F₀ = 𝔇⁻¹, which §5.3g treats through the pairing aB;
   - the hermitian space is used with the symmetric F₀-pairing Tr_(F/F₀) h, so f̂̂(x) = f(−x).
3. **Backticked declaration names of open-PR suppliers became section citations.** The brief allows a supplier declaration only if it exists at the pins or on a roadmap on main. Thirteen backticked names, in 34 occurrences on 17 lines, were affected:
   - from GeometryOfNumbersAndQuadraticArithmetic: `IntegralHermitianLattice.ofCarrier`, `.dual`, `HermitianLatticeInvariants.ofDualQuotient`, `hermitianLocalDensity`, `normalizedSiegelPolynomial`, `choYamauchiWeight`;
   - from MetaplecticAutomorphicForms: `weilIndex`, `weil_generators`, `weil_hermitianUncertainty`, `weil_hermitianNormalizations`, `siegelWeilSection`, `siegelWeil_anisotropic`, `thetaSectionCollection`.

   They are now cited by their numbered targets (GeometryOfNumbersAndQuadraticArithmetic 2.7.1–2.7.3, 3.2.2, 3.2.4–3.2.7) or sections (MetaplecticAutomorphicForms §§2.1, 2.5, 3.3a, 3.3b, 6.2, 6.4, 6.7), with the object named in words. I opened each target at its head to confirm the numbering. The remaining backticked names are pinned Mathlib or Tau Ceti declarations, or named targets on main (`fourierUnitVanishing`, `ClassicalAlgebraic.supportLocalization`, `ClassicalAlgebraic.properSupports`).
4. **Z(x₀).** PELModuliPartII §2.4 constructs the single special divisor Z(x₀) through which π₂ factors, and says so in its consumers paragraph. §4.1 and the Scope now cite it there and identify it with Z(O_F·x₀) of §0.2. §4.1's *Needs* line moves from §§2.1–2.3 to §§2.1–2.4. Nothing was deleted, since §0.2 is the general construction.
5. **Contract shape.** "From Mathlib and Tau Ceti" is split into "From Mathlib" and "From Tau Ceti". The Tau Ceti part now names `Matrix.localDensity` (TauCeti/NumberTheory/IntegralLattice/LocalDensity/Basic.lean:546) and `TauCeti.AlgebraicGeometry.Chow.ChowGroup` (TauCeti/AlgebraicGeometry/Chow/Basic.lean:295), with what each lacks. All Mathlib and Tau Ceti names were opened at the pins:
   - `Module.equiv_directSum_of_isTorsion`, Mathlib/Algebra/Module/PID.lean:230;
   - `IsNonarchimedeanLocalField`, Mathlib/NumberTheory/LocalField/Basic.lean:46, a `Prop` class extending `IsValuativeTopology`, `LocallyCompactSpace` and `ValuativeRel.IsNontrivial`;
   - `TauCeti.FormalScheme.Spf.carrier`, Carrier.lean:73;
   - `TauCeti.FormalScheme.Spf.structureSheaf`, StructureSheaf.lean:262.

**Gaps.** All eight declared gap requests were re-checked at the suppliers' current texts and remain open:

| Gap | Supplier text now |
|---|---|
| gap:nonaffine-formal-filtration-product | SchemeKTheoryOperationsPartII §2.4 is still stated for affine X only; §2.5 forms limits but asserts no filtration product |
| gap:ramified-hermitian-densities | GeometryOfNumbersAndQuadraticArithmetic §3.2 is still unramified |
| gap:arithmetic-chow-star-products | ArakelovGeometryAndAbelianHeights §§1.8–1.10 are still ĈH¹; ArakelovGeometryAndAbelianHeightsPartII, earlier in the order, has adelic line bundles only; Polylogarithms §5.12 says its Green presentation "is not the arithmetic Chow group of a regular model" |
| the five Jacquet–Rallis gaps to EndoscopicTransferAndUnitaryTraceComparison | its smooth-transfer section §4.7 is endoscopic only; GanGrossPrasadUnitaryGroups still makes the two requests of the same name; EndoscopicTransferAndUnitaryTraceComparisonPartII still requests gap:jr-local-comparison |

**Duplication sweep by object.** Run with `roadmaps grep` over main and all 454 open roadmap heads, not only the 227 with local checkouts. Searched: Kudla–Rapoport, arithmetic fundamental lemma, arithmetic Siegel–Weil, Borcherds product, regularized theta lift, Kudla–Millson, Gross–Kohnen–Zagier or Yuan–Zhang–Zhang, Kudla or special divisor, Vollaard or unitary Deligne–Lusztig, Coxeter variety, Krämer, Jacquet–Rallis, incoherent, derived or fat CM, GSpin, Deligne–Lusztig on main, and arithmetic Chow or star product. No second owner of any target was found, so no removal was needed. Notes:

- PELModuliPartII (open, earlier) constructs no special cycle besides Z(x₀) (its consumers paragraph says so), and owns the exotic strata, which §5.4 imports.
- GrossZagierAndArithmeticHeights §6.20 owns only the quaternionic p = 2 series on X_U × X_U. §12.6a(d) is the general YZZ theorem and neither re-proves nor consumes it.
- ComplexMultiplicationAndExplicitReciprocityPartII (line 401, later) owns the integral divisor of orthogonal Borcherds products on the model of a maximal lattice. This roadmap owns the generic-fibre relation (§12.6a(e)) and the unitary integral divisor at good primes (§12.5(b)), as the Scope says.
- HodgeClassesForJacquetLanglands (earlier) uses Kudla–Millson forms for its own lifts and owns no modularity theorem. SiegelModularForms (later) says Kudla–Millson theory is "not objects here".
- MotivesAndAlgebraicCycles §7.19 takes the almost self-dual identity as an explicit premise, which §4.5 discharges. That is a consumer relation, not a second owner.
- FunctionFieldArithmetic (later) treats the function-field analogues (Feng–Yun–Zhang). They are other objects.
- MultiquadraticPartII, HeegnerPointEulerSystems and HalfIntegralWeightModularForms only cite Gross–Kohnen–Zagier's genus-character results.
- On main, no roadmap constructs Deligne–Lusztig varieties or Lusztig's Coxeter cohomology. ReductiveGroupsPartII cites affine Deligne–Lusztig papers only.

Ownership against open work: this roadmap is the owner of every construction it states. That covers the special cycles on all four local models, the unitary Deligne–Lusztig and symplectic incidence strata, the ramified density formulas and corrections, the global special cycles and degrees, the automorphic Green functions and unitary Borcherds products, the generic-fibre YZZ modularity with its orthogonal Borcherds relation, the derived CM cycles, Zhang's relative trace series and the AFL. No suggested declaration exists, so no qualified name can collide.

## Upstream-reviewer read: fixes made

- The PELModuliPartII Layer 7 citations pointed at the wrong sections (item 1 above). This is the only fix of a statement a mathematician would flag as wrong.
- The AL.0 citation named a supplier that itself redirects these targets elsewhere (item 2), and two §§ about Schwartz–Bruhat analysis would otherwise have rested on an indirection.
- House style:
  - "without a legal copy of the text" in the McGraw03 reference is process narrative and was removed;
  - "each is stated in our words with the location in the version read" in Source corrections became "each is stated with its location in the version listed under References".
- I scanned for process words (so far, current, removed, round, package, review, board, deferred, optional, for later, unverified) and for LaTeX delimiters. Only the mathematical "current" remains.

I found no false identity, wrong sign, vacuous statement or unsourced claim beyond these. The adversarial table records what was computed.

## Adversarial mathematics pass

The numbers were recomputed with a scratch script, run at q = 3 and q = 5, plus hand computation. These values were computed:
- the Hermitian curve over 𝔽₉ by brute force;
- representation counts over ℤ[i]/3^N;
- the unitarity and cyclic-vector determinants of §9.1;
- orbital-integral shells and transfer factors over ℚ₃ and ℚ₉;
- the norm-one vectors of §12.4 in a box;
- the 3-adic descent of §12.6a modulo 27.

Lean context: there are no declarations, so there is no `variable` or `include` context to check.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions: duals | ramified plane h(e,f) = u⁻¹; unit line e | h(ae+bf, e) = −bu⁻¹, h(ae+bf, f) = au⁻¹: trace dual = Λ, O_F-dual = uΛ; ⟨e⟩: trace dual u⁻¹⟨e⟩, invariant 1 | Holds | — |
| Conventions: Fourier | unramified vertex lattice of type t; character of conductor O_F₀ | [Λ^∨:Λ] = q^(2t), vol(Λ) = q^(−t), vol(Λ)vol(Λ^∨) = 1; ψ_v(a·) with aO = 𝔇⁻¹ has conductor a⁻¹𝔇⁻¹ = O | Holds | contract reworded |
| Conventions: logarithms and Green scales | n = 1, a = 1; R < 0 | W′ = (1 + q⁻¹)·log(q²) = (8/3)log 3 at q = 3; with log q it is half. Γ(0,t) = −Ei(−t) | Holds | — |
| 0.1 | a ∈ O_F scalar; rank one h = ϖ^a | H(ax,y) = āH(x,y), h(ax,y) = a·h(x,y); norms equal; dual ϖ^(−a)O_F·x in both | Holds | — |
| 0.2 | x = 0; val h(x,x) = −1; h(u,u) = 1 | Z(0) = N_n; ∅; N_(n−1) of relative dimension n−2 | Holds | — |
| 0.3 | d = 0, 1; q = 3 | point; #Y₁(𝔽₉) = 28 = q³+1 by brute force over 𝔽₉ | Holds | — |
| 0.4 | type 1, 3; type-3 Λ | dims 0, 1; isotropic lines of a 3-dimensional hermitian 𝔽_(q²)-space: q³+1 = 28 | Holds | — |
| 0.5 | V₁, val 1; val −1; y = ax | Tor₁ = (ϖ)/(ϖ²) ≅ O_F̆/ϖ ≠ 0; Z = ∅, both 0; dependent labels excluded | Holds | — |
| 0.6 | C ≅ ℙ¹, O(D)\|_C = O(−1) | χ(O_C) − χ(O_C(1)) = 1 − 2 = −1 = deg O(D)\|_C | Holds | — |
| 0.7 | n = 3, V = H ⊥ ⟨ϖ⟩, L = ⟨e, a⟩ | det = −ϖ (odd, nonsplit); Λ_j Gram ϖ·(H ⊥ ⟨1⟩), Λ_j^∨ = ϖ⁻¹Λ_j, type 3, L ⊂ Λ_j for all j ≥ 0: infinitely many curves | Holds | — |
| 0.8 | r = 0; n = 2, a = 1, 3 | identity; Int₂ = (a+1)/2 = 1, 2 | Holds | — |
| 0.9 | a = 1, 3, 5; a = −1, −3 | D = Σ(−X)^i: D(1) = 0, −D′(1) = 1, 2, 3 = (a+1)/2; a = −3: D = 0 versus (a+1)/2 = −1 | Holds | — |
| 1.1 | n = 2, unit y | Z(y) ≅ N₁ flat, vertical class 0 | Holds | — |
| 1.2 | O_F², I₂, hyperplane F·(1, ϖ^k) | norm 1 + ϖ^(2k), a unit for k ≥ 0 (p odd): type 0 | Holds | — |
| 1.3 | L♭ = ⟨y⟩, val 2, q = 3, 5 | degrees (q²+q) + 1 = 13, 31; D = 1 − X + X², D(−q) = 13, 31; vol⁻¹·D(−1/q) = q²·D(−1/q) equal | Holds | — |
| 1.4 | colength 1; saturated | interval {L♭, L♭_Λ}: 2; {L♭}: 1 | Holds | — |
| 2.1 | d = 0, 1; q = 3, 5 | 1 + q² + q(q² − q) = 28, 126 = q³+1; eigenvalue +q gives −8, −74; H^(2j)(Y°)(j) eigenvalues q^(4j)/q^(2j) = q^(2j), −q^(4j−1)/q^(2j) = −q^(2j−1) | Holds | — |
| 2.2 | d = 1, i = 1; ℙ¹ ⊃ 𝔸¹ | H²(Y₁)(1) of rank 1; H⁰_c(𝔸¹) = H¹_c = 0, H²_c = ℚ_ℓ(−1) | Holds | — |
| 2.3 | n = 3 | multiplicities of §1.4 (2 or 1) | Holds | — |
| 2.4 | x ∈ Λ, shell, anisotropic; q = 3, 5 | f = −8, −24 (= 1 − q²); f̂(Λ) = 8, 24; shell −1; anisotropic 0 | Holds | — |
| 2.5 | n = 2, unit L♭ | 0 = −0 | Holds | — |
| 2.6 | line D ⊂ ℙ² | ch(O_D) = 1 − e^(−H) = H − H²/2; wrong model −H − H²/2 | Holds | — |
| 2.7 | point stratum | χ(O_P ⊗ᴸ O_Z(x)) = 1 − 1 = 0 | Holds | — |
| 3.1 | n = 1, a = 1, q = 3; L = ⟨ϖ⟩ against Λ = ⟨1⟩ | W′ = (8/3)log 3; representation count of T = (ϖ) by ⟨ϖ⟩ over ℤ[i]/3^N: 36 (N = 2), 108 (N = 3) = (q+1)q^N; density q + 1, not Den(L) = 0 | Holds | — |
| 3.2 | t = 1…4; q = 3, 5 | −m′(t;1) = 1, 1+q, (1+q)(1−q²), …: 1, 4, −32, −896 (q = 3); 1, 6, −144, −18144 (q = 5); m(0) = 0 | Holds | — |
| 3.3 | n = 2, unit L♭, x ⊥ L♭, a = 1, 3; a < 0 | (a+1)/2 = 1, 2 on both sides; 0 = 0 | Holds | — |
| 3.4 | 1̂_M | vol(M)·1_(M^∨), vol(M) = q^(−val M) | Holds | — |
| 3.5 | n = 1, a = 3; L♭ = ⟨e⟩, val 1 | 2 = −D′(1); val(u) = 2, u^∨ of valuation −2, w + u^∨ of valuation −2 for v(c) ≥ −1 | Holds | — |
| 4.1 | W₁, val 0, 2 | Int_Y = 0, 1 | Holds | — |
| 4.2 | n = 2 | E·E = deg O(−1) = −1 = (−1)^(n−1); π₁⁻¹ of a balloon is ℙ¹ of multiplicity q+1 | Holds | — |
| 4.3 | rank one, a = 0, 2, 4, 6; a = −2; q = 3, 5 | ∂Den_Λ = 1, q+2, 2q+3, 3q+4 (1, 5, 9, 13 at q = 3) = 1 + (q+1)a/2, from the overlattices ⟨ϖ^(−j)x⟩ ⊥ ⟨ϖ⟩ of types 2 and 1; Int_aux(2) = (q+2)/(q+1); a = −2: 0 = 0 | Holds | — |
| 4.4 | x integral at no type-0 lattice | Exc(x) = 0 | Holds | — |
| 4.5 | a = 0, 2, 4, 6 | (q+1)·a/2 = ∂Den_Λ − Den(L) = 0, 4, 8, 12 (q = 3), with Den(L) = D_L(1) = 1 | Holds | — |
| 4.6 | r = 1; q = 3 | (q²−1)/(q+1) = q − 1 = 2 | Holds | — |
| 5.1 | e with h = 1, x = u⁻¹e | h(x,x) = −u⁻², F₀-valuation −1: N(x) = ∅ | Holds | — |
| 5.2 | type-4 component ℙ¹; q = 3, 5 | χ(O) − χ(O(q−1)) = 1 − q = −2, −4 | Holds | — |
| 5.3 | (x,x) against (x,0), n = 2 | differ by [O_D(−D)], of length ≥ 1 at generic points; empty case 0 = 0 | Holds | — |
| 5.4 | type 2, 4 | point; ℙ¹ with deg ω = q − 1 = 2 at q = 3 | Holds | — |
| 5.5 | (0,0), (0,1), (1,1), (1,2); q = 3, 5 | 2, 4, 2(q+3) = 12/16, 2(2q+4) = 20/28; inner bound b₁ instead of j gives 2(2q+3) | Holds | — |
| 5.6 | diag(1,1), x₂ = e₁ + e₂ | θ = diag(1, −1): det −1; −id has det (−1)^n = 1; non-normal basis: h(x₁, −x₂) = −1 ≠ 1 | Holds | — |
| 6.1 | (1,1) plane; type 2, 4; q = 3, 5 | −D′ = 2, 2(1 − q²) = −16, −48; Den(H₂, L) = (1 − q⁻²)(1 − q⁻⁴) = 640/729, 14976/15625; Den(H₁, L) = 0 | Holds | — |
| 6.2 | one eligible M | coefficient 2 = the type-two weight of §6.1 | Holds | — |
| 6.3 | t(A) = 1; t(A) = 3 | t(M) ∈ {0, 2}; μ(4) = 1 − q² against μ(2) = 1: opposite signs | Holds | — |
| 6.4 | invariants (1,1), (3,3) | vol = q⁻¹, q⁻³ = 1/3, 1/27 at q = 3 | Holds | — |
| 6.5 | Λ of type 4; q = 3, 5 | f(Λ) = −q(1+q) + q² + 1 = 1 − q = −2, −4; f̂(Λ) = q − 1 = 2, 4; whole stratum 2(1 − q) | Holds | — |
| 6.6 | rank 2, (1,1) | both sides 2 | Holds | — |
| 6.7 | a = 3 example | h(u⁻¹e ± x₀) = −β + β = 0; h(e, u⁻¹e ± x₀) = −βu, valuation one; a = 1 forces trace-self-dual, excluded | Holds | — |
| 6.8 | n = 2, (1,1), (1,3) | 2 = 2; Int = 4 (§5.5 at (0,1)) = 2·#type-two overlattices = 2·2 | Holds | — |
| 6.9 | u²/ϖ a unit | v_F₀((u²/ϖ)a) = v_F₀(a); u⁻² shifts F₀-valuation by 1 | Holds | — |
| 7.1 | x = 0 | Z(0) = whole space, codimension 0 | Holds | — |
| 7.2 | m = 0, 1, 2 | m = 0 undefined (U′ of dimension −1); m = 1: Y = S = ℙ¹; m = 2: fibre ℙ¹ over a rational Lagrangian | Holds | — |
| 7.3 | type 2; m = 0 | tangent bound 1 = dim ℙ¹; F^⊥ ⊂ Λ^⊥ = 0 impossible at m = 0 | Holds | — |
| 7.4 | type 2; nonintegral L | ℙ¹; Z(L) = ∅ | Holds | — |
| 7.5 | s = 0, 1 nonsplit; split | degrees 1, 2q (= 6 at q = 3); split nonunit not horizontal | Holds | — |
| 7.5a | (α,β) = (0,0), (0,1), (1,1); H₁, H₃; q = 3, 5 | χ = 1: 0, 1, 2 − 2q = −4/−8; χ = −1: 0, 1, 2 + 2q = 8/12; Int(H₁) = 1 − q = −2/−4, Int(H₃) = 4 − (q+1)² = −12/−32 | Holds | — |
| 7.6 | n = 2, 3 | α = 1, 0 | Holds | — |
| 7.7 | n = 3, ℓ = 1, r = 2 | Int(I₃) = 0 + 1·(1 − 0) = 1; δ_odd(ℓ) would give 0 | Holds | — |
| 7.8 | x ∈ Λ^♯ | π·h(x,x) ∈ O_F gives h ∈ O_F₀; norms on π⁻¹Λ^♯ have valuation ≥ −1 | Holds | — |
| 8.1 | n = 2, χ = ±1 | t_max = 0, 2: no correction, one coefficient c₂ | Holds | — |
| 8.2 | unimodular n = 2, 3; t = 2, 3 | 0, 1; 1 − χq; 1 − q² | Holds | — |
| 8.3 | Haar rescaling by c | partial integral × c | Holds | — |
| 8.4 | rank-three counterexample | Gram det π₀·(N(β) − 1)/π₀ − N(β) = −1; 2q classes of β; value 2q·vol(L♭) ≠ 0 | Holds | — |
| 8.5 | n = 2, 3 unimodular L♭ | α = 1, 0 | Holds | — |
| 8.6 | H₁; ⟨π₀⟩ ⊥ H₃; H₁ ⊥ H₁; H₁ ⊥ ⟨u₃⟩ | norms π(ab̄ − āb) ∈ π₀O_F₀; projection coefficient 1/(2π) ∉ O_F; minimal presentation valuation 4 = val(L); Int(L) = (1 − q) + (q + 1) = 2, Int^(2) = 1 − q = −2/−4 = ∂Den^(2) | Holds | — |
| 8.7 | rank 2, (2,2), χ = ±1; I_n | 3(1 − q) + (q − 1) = 2 − 2q = −4/−8 and 2 + 2q = 8/12, equal to §7.5a; δ_odd(n) on both sides | Holds | — |
| 9.1 | n = 3 over ℚ₉/ℚ₃; n = 4, d = −1, 1; n = 2 | gᵗ(3J)g = 3J; h(u,u) = 1, det(u, gu, g²u) = −1; n = 4: det = 8, and 0 for d = 1; V₂ anisotropic | Holds | — |
| 9.2 | (g,u) not regular semisimple | no number assigned | Holds | — |
| 9.3 | γ = ((0,1),(1,0)), ((−2,1),(−3,2)), a = diag(3,1) over ℚ₃; ((−4,1),(−15,4)) over ℚ₉; γ = 1 | shells {0}: Orb = 1, ∂Orb = 0; shells {0, −1}: Orb = 0, ∂Orb/log 3 = −1 = −Int; conjugate: shell {−1}, ω = −1, ∂Orb/log 3 = +1 = 0 − log(1/3)/log 3; ℚ₉: ∂Orb/log 9 = −1; γ = 1: Σ(−1)^k 3^(−ks) diverges | Holds | — |
| 9.4 | n = 2, g′ = diag(h, d); √ε | det(1 − g′) = (1 − h)(1 − d); N(√ε) = −ε; codimension 0 against expected 1 | Holds | — |
| 9.5 | q ≥ n+1; q = n = 3; nonintegral d | q + 1 ≥ n + 2 > n + 1 residues; 4 residues, at most 3 excluded; v(1 − ξd) = −1 with det(1 − ξg′) a unit | Holds | — |
| 9.6 | m = 1; q ≥ m | Int = (a+1)/2 constant on shells; q + 1 > m | Holds | — |
| 9.7 | m = 1 | bound p > 2; rank-one lifting length | Holds | — |
| 9.8 | n = 1, 2; F₀ = ℚ₉ | empty; Int = (v(1 − dd̄) + 1)/2 = 1, 2 at v = 1, 3; ∂Orb = −log 9 | Holds | — |
| 10.1 | T = I₂, a = [[1,b],[0,1]], b̄ = −b; x/3 | aᵗTā = [[1, −b],[b, 1 − b²]]; generic cycle Z(1/9, 1_U) ≠ ∅, actual Hom empty | Holds | — |
| 10.2 | r = 1 | Cartier class [O_Z(t,φ)] | Holds | — |
| 10.3 | split place, F₀ = ℚ, n = 2, F = ℚ(i), p ≡ 1 mod 4 | p-divisible dimensions (n, 0) for A₀ⁿ against (n − 1, 1) for A: Z(T) empty at v; basic locus nonempty (E × E supersingular) | Holds | — |
| 10.4 | residue degree f | log(q^f) = f·log q | Holds | — |
| 11.1 | F = ℚ(i), α = T − i | ᾱ(0)⁻¹Tᾱ(T⁻¹) = −i(1 + iT) = T − i; ordinary reciprocal T + i ≠ α | Holds | — |
| 11.2 | maximal against nonmaximal order | finite étale against a possible vertical component | Holds | — |
| 11.3 | change of ℓ | α unchanged | Holds | — |
| 11.4 | 2-dimensional vertical support | class in F₁ → Gr₁ ≅ CH₁ | Holds | — |
| 11.5 | split place | A₀ⁿ → A quasi-isogeny excluded by the dimensions of §10.3 | Holds | — |
| 12.1 | n = 1; n = 2 over ℚ isotropic | CH¹ = 0; Δ trivializes a power of ω, c₁ = 0 | Holds | — |
| 12.2 | n = 1; u ⊥ z_δ | point; u ∈ z_δ^⊥, not cyclic | Holds | — |
| 12.3 | u = 0, a = e | −log e = −1; Γ(0,t) = −Ei(−t) | Holds | — |
| 12.4 | V = ℚ(i)³, h = diag(1,1,−1), z = (0,1,2) | z-norm 1 − 4 = −3; norm-one vectors ⊥ z in a box: {±e₁, ±ie₁}; multiplicities 2 and 0 at (z,1), (z,k₅); weight 2 − n = −1 at n = 3 | Holds | — |
| 12.5 | μ = ((1+i)/2,0,0), L′ = ½L; μ = (0,0,1) in O_F ⊕ O_F ⊕ 3O_F; metric on (1,i) | Q(μ) = ½ ≢ 1, 2μ ∈ L; Q(±μ) = −1, 2μ ∉ L; [w,w] = 0, [w,w̄] = −4, ‖w‖² = 1/(πe^γ) | Holds | — |
| 12.6 | principal divisor | (div f, −log\|f\|²) is 0 | Holds | — |
| 12.6a | x² − 3y² − 3z² mod 27; signatures; weights | 0 primitive solutions mod 27 (anisotropic); 1+1+1−3 = 0 in U ⊥ W; k − σ/2 = 2 at σ = p − 2 and 0 for (Λ, −Q); weights 5/2 = (p/2 + 1) + e/2 for p = 1, e = 2 and p = 2, e = 1 | Holds | — |
| 12.6b | n = 2, 3 | weight (2n−2)/2 + 1 = n: 2, 3; Q = h(x,x), trace would double indices | Holds | — |
| 12.7 | n = 1; [F₀:ℚ] = 2, n = 3 | CH¹ = 0; signature (4,2) and (6,0), p = 4 ≥ 3 | Holds | — |
| 12.8 | [E:F] against [E:F₀] | factor 2 | Holds | — |
| 12.9 | F₀ ≠ ℚ; n = 2 | not asserted | Holds | — |
| 12.10 | 3J control (g,u), u = e₁ + e₃ | h(u,u) = 6, det = −1, char poly (T − 1)³ reducible | Holds | — |
| 12.11 | ξ′ < 0 at v′ | −Ei(−4πa\|ξ′\|) finite | Holds | — |
| 13.1 | pure tensor section | product of local Whittaker integrals | Holds | — |
| 13.2 | \|Diff\| ≥ 2 | two vanishing factors: first derivative 0 | Holds | — |
| 13.3 | inert nonsplit place | almost self-dual lattice required | Holds | — |
| 13.4 | n = 2, 3; K′ of index m | c_K = +1/vol, −1/vol; c_(K′) = m·c_K | Holds | — |
| 13.5 | log q_(v₀) against log q²_(v₀) | factor 2 | Holds | — |
| 13.6 | n = 3, m = 1, 3 | bidegrees (0,0), (2,2) | Holds | — |
| 13.7 | factor ½ | conjugate pair gives one integral | Holds | — |
| 13.8 | F₀ = ℚ | excluded (Minkowski) | Holds | — |
| 13.9 | n = 2, q = 3, 5 | ratio (q+1)/(q² − 1) = 1/2, 1/4; c₀·ratio = −1/8, −1/24 | Holds | — |
| 13.10 | n ≤ 3; n ≥ 4 ramified | unconditional; under (H_m) | Holds | — |
| 14.1 | ξ < 0 | Ei(−4πa\|ξ\|) finite | Holds | — |
| 14.2 | expansion | (2∂J + Int_(K−B)) + Int_B = 2∂J + Int_K | Holds | — |
| 14.3 | Σc_p log p = 0 | c_p = 0 (unique factorization) | Holds | — |
| 14.4 | nonnegative test function | positive orbital integral at the orbit | Holds | — |
| 14.5 | n = 1, 2; (n,p) = (3,3), (5,5) | empty; −1, −2 at a = 1, 3; both parts at (3,3); part (a) at (5,5) not asserted (6 residues of F^1 against 6 conditions) | Holds | — |
| 14.6 | n = 1; q = 9, n = 2 | empty; −log 9 = −1·log q | Holds | — |

Result: no instance refutes a statement, Check or worked example. No hypothesis was added and no claim weakened. The only statement changes are the citation repairs listed above.

## Unresolved, for the worker and the human reviewers

- §8.6 and §8.7: (H_m) in rank m ≥ 4 is a hypothesis, not a target, because no published argument proves it. The Krämer identity in rank n ≥ 4 and §13.10 at ramified places of dimension n ≥ 4 are conditional on it. In §9.5(b), the converse at q = n ≥ 4 is likewise not a target, so Zhang's group AFL at p = n ≥ 5 is not a headline. These are the review's decisions and are kept.
- Eight gap requests remain open:
  - to EndoscopicTransferAndUnitaryTraceComparison: five, all Jacquet–Rallis;
  - to GeometryOfNumbersAndQuadraticArithmetic: gap:ramified-hermitian-densities;
  - to SchemeKTheoryOperationsPartII: gap:nonaffine-formal-filtration-product;
  - to ArakelovGeometryAndAbelianHeights: gap:arithmetic-chow-star-products.

  Each was re-checked and is still unfilled.
- SchemeKTheoryOperationsPartII, on main, names this roadmap as a consumer. The nonaffine filtration product it would need to add is the gap above.
- SelmerIwasawaCohomologyPartII (line 418, later) requests "hermitian Frobenius incidence varieties and their cohomology" from ReductiveGroupsPartII under gap:unitary-incidence. The closed unitary Deligne–Lusztig varieties Y_Ω of §0.3 and their Coxeter cohomology (§§2.1–2.2) are the nondegenerate case of that request. That later roadmap could cite these sections; nothing changes here.
- AnalyticNumberTheoryPartII §5.3g is written for completions of number fields with the standard character. The contract states how it applies to an arbitrary p-adic F₀ with a character of conductor O_F₀. A reviewer may prefer that §5.3g state the local case directly.
- Sources not opened this round:
  - Lusztig76 and McGraw03 are cited through LZ and by main theorem; neither was read here;
  - YZZ09 is read from a university archive host; LL1, LL2 and Zha12 from author pages.
- The overlap and citation tools now read main at `e213fdd`, while this worktree is at `5ff4294`. Every supplier named above is still an open pull request at the newer index, and the resolver finds every citation.
- Untrusted text: no instruction-like text was found in the package reports, the supplier heads or the review. Nothing was acted on.


Pull request: #2457 (roadmap/gross-zagier-and-arithmetic-heights-part-ii at eb24852)
