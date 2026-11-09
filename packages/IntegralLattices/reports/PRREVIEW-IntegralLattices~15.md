# Review of IntegralLattices (pull request #617 at e2fb851)

**Verdict:** needs changes

This is a full review of the repaired head. The folder is now main's text (commit `47fc6a3`) with
the Layer B repairs of the previous round, and the gate's text scanners, the dependency check and
the build all pass. What remains is one blocking defect that the previous round's R14 only
touched the edge of: a large part of what the README presents as this roadmap's targets, and most
of what `Suggested.lean` states, is already proved in Tau Ceti at the pin `2fd255d`, and neither
file cites it. The other findings are the unrepaired P3s of the previous round and the merge
state of the branch.

**Repairs of the previous review, finding by finding.**

- R01 (stale folder): repaired. The folder is main's `47fc6a3` text plus the Layer B edits;
  `Suggested.lean` has 877 lines and 31 sorried theorems, no roadmap import, no sorried data.
  The branch itself was not merged with main, see R06.
- R02 (depcheck UPWARD/CYCLE): repaired, `0 problem(s)` (output under *Verified sound*).
- R03–R08 (sorry-data, sorry-examples, imports, prnum, residue, statement-hygiene): repaired,
  every count is 0 in the worker's gate and in mine.
- R09 (outside-folder): not repaired, see R05.
- R10 (conflicting open heads, no order stated): not repaired, see R06.
- R11 (Layer B native): repaired. B1 and B4 are marked "(native)", B2, B3 and B5 say what is
  native and keep one target each, and §*From Tau Ceti* has six new rows (README 453–458)
  whose 68 declarations all exist at the pin (list under *Verified sound*).
- R12 (positive definite in the B3 display): repaired, README 1293 reads "primitive positive
  definite forms", with the `Δ = −4` witness at 1302–1304.
- R13 (Class Field Theory contract): repaired, README 458 and 1054–1057 say `NumberFieldOrder K`
  with `[Field K]`, `[NumberField K]` and no degree hypothesis, which matches
  `ringClassField` at `TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean`.
- R14 (native theorems restated as headlines): not repaired, and wider than stated, see R01–R02.
- R15 (carrier display): not repaired, see R03.
- R16 (Allcock–Gal–Mark locator): not repaired, see R04.

## R01 (P2) — Tau Ceti already owns the genus, class numbers, masses, local densities, orthogonal volumes, the rank-16 pair and mass saturation; the README presents them as targets and cites none

- **Location.** `README.md:464–466` ("Two comparisons are not native and stay targets … Minkowski's
  second theorem is 2F below"); 876–883 (3F, the genus and its finite test); 1572–1576 (4A, class
  sets and class number); 1725–1734 (4E rank 2); 2119–2129 (6C, "The statements are"); 2141–2154
  (6D, "This milestone constructs both lattices and proves those four statements"); 2254 (6G,
  "This milestone is owned here"); 2268–2274 (6H, "Prove that"); 2441–2446 (7A, "The two sums
  are defined, and both are finite"); 2460–2499 (7C, stabilization and the odd-prime values);
  2575–2590 (7E, the product, the factor 2 and the Gamma identity); 2623–2628 (7G, ranks 0 and
  1); 2722–2735 (9B); 2039–2066 (5J, the seven conditions "pinned" as this roadmap's); and the
  paragraphs 206–212 and 2696–2700 ("Milgram is not duplicated … is this roadmap's").
- **Claim.** Each of these is a theorem or a definition of the pinned Tau Ceti, and §*From Tau
  Ceti* lists none of the files below. A consumer reading the README is sent to targets instead
  of to the library: `OrthogonalTamagawaAndLatticeMass` at its head writes "IntegralLattices §2G
  owns class finiteness, §6C owns rank-eight uniqueness, §6D owns the rank-16 reference pair and
  its non-isometry" (its `README.md:9`) and "The index set is finite by IntegralLattices §2G"
  (281). Two owners for one object is supplier drift.
- **Witness.** At Tau Ceti `2fd255d`, under `TauCeti/`:
  - 3F: `SameGenus` (`NumberTheory/IntegralLattice/Genus.lean:77`, signature equality and
    `localIntegralForm` equivalence at every prime, the README's definition) and the finite test
    `sameGenus_iff_localIntegralForm_equivalent_primeFactors` (216: equal nonzero determinants,
    signatures, and the primes of `2·det`, the README's 3F test);
  - 4A, 2G: `genusClasses` (`ClassNumber.lean:76`), `classNumber` (144),
    `IsPosDef.finite_genusClasses` (173); `genusProperClasses` and `properClassNumber`
    (`ProperClassNumber.lean:75, 153`); the Gram-level finiteness
    `exists_finset_forall_exists_gramMatrix_mem (n D)` (`LinearAlgebra/IntegralLattice/PosDef/Classes.lean:52`:
    a finite set of Gram matrices meeting every positive definite lattice of rank `n` and
    determinant `≤ D`), which is 2F's `finite_classes_of_posDef` with `≤ D` in place of `= d`;
  - 4E rank 2: `finite_genusClasses_of_finrank_eq_two` (`Binary/ClassNumber.lean:93`);
  - 2F: `IsPosDef.prod_successiveMinimum_mul_pi_pow_le` (`PosDef/Minkowski.lean:219`),
    `(∏ λᵢ)·πⁿ ≤ 4ⁿ·Γ(n/2+1)²·det L`, the square of 2F's inequality, whose file header calls it
    Minkowski's second theorem;
  - 5J: `TwoElementaryAdmissible` (`LinearAlgebra/IntegralLattice/TwoElementary.lean:81`, the same
    seven fields with the same names), `TwoElementaryLatticeWithInvariants` (285, the same body),
    the four boundary witnesses (100) and the necessity half
    `TwoElementaryLatticeWithInvariants.twoElementaryAdmissible` (303);
  - 6C: `IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine`
    (`PosDef/SmallRankUnimodular.lean:378`: `Iₙ`, `E₈` or `I₁ ⊕ E₈`) and
    `IsPosDef.nonempty_isometry_typeE₈RootLattice_of_isEven` (407);
  - 6D: `sameGenus_e8PowLattice_checkerboardPlusLattice` and
    `isEmpty_isometry_e8PowLattice_checkerboardPlusLattice` (`NumberTheory/IntegralLattice/EvenUnimodularGenus.lean:72, 82`)
    on the native `e8PowLattice 2` and `checkerboardPlusLattice 16`, with evenness,
    unimodularity and positive definiteness of both;
  - 6H: `nonempty_isometry_orthogonalSum_hyperbolicPlane_e8PowLattice` (`Cancellation.lean:311`)
    and `not_forall_nonempty_isometry_of_orthogonalSum` (344);
  - 6G: `card_isometry_typeE₈RootLattice` (`RootLattice/TypeE/WeylGroup.lean:272`);
  - 7A, 7G: `mass`, `properMass` (`Mass.lean:91, 100`), `properMass_eq_two_mul_mass` (154,
    positive rank, finite genus), `mass_eq_one_of_finrank_eq_zero` (252),
    `mass_eq_inv_two_of_finrank_eq_one` (264), and B8's count `h⁺ + a = 2h`
    (`properClassNumber_add_card_eq_two_mul_classNumber`, `ProperClassNumber.lean`);
  - 7C: `Matrix.localDensityCount` and `localDensity` (`LocalDensity/Basic.lean:110, 546`, over
    `ℤ_p`), stabilization at every prime from `r₀ = 2·v_p(2 det A) + 1`
    (`localDensityCount_div_pow_of_det_ne_zero`, 599), the odd-prime good-prime values in both
    parities (711, 737, with `ε = χ((−1)^{m+1} det)` for `n = 2m + 2`, the README's
    `((−1)^{n/2} det | p)`), and the hyperbolic plane at 3 (762);
  - 7E: `orthogonalGroupMeasure` (`Geometry/Euclidean/Volume/OrthogonalGroup.lean:344`, a Haar
    measure), `orthogonalGroupVolume`, `specialOrthogonalGroupVolume` (420, 426),
    `specialOrthogonalGroupVolume_eq_prod` (500: `∏_{j=2}^{n} 2π^{j/2}/Γ(j/2)`, the README's
    display at 2577), `orthogonalGroupVolume_eq_two_mul_specialOrthogonalGroupVolume` (475, for
    `n ≥ 1`), `two_mul_pi_rpow_mul_prod_Gamma_eq_two_pow_div_orthogonalGroupVolume` (516, the
    README's identity at 2586), and `roundSphereVolume_eq_two_mul_pi_rpow_div_Gamma`
    (`Volume/Sphere.lean:397`, the README's `sphereArea`);
  - 9B: `sum_inv_natCard_isometry_eq_mass_iff` (`Mass.lean:221`: pairwise non-isometric lattices
    of a genus with finite isometry groups carry the whole mass exactly when they represent every
    class) and `StoredClassNumberCertificate` (`LMFDB/StoredClassNumberCertificate.lean:73`);
  - 1H, 1I, 1L, 4F, 6B: the declarations of the previous review's R14, re-verified below.
- **Repair.** Add the files above to §*From Tau Ceti*, by declaration, and rewrite each milestone
  as consumed, keeping as a target only what the pin lacks, in one clause each: 3F nothing (cite
  `sameGenus_iff_localIntegralForm_equivalent_primeFactors` for the finite test); 4A nothing;
  2G cite `exists_finset_forall_exists_gramMatrix_mem`; 2F cite the squared form; 4E rank 2
  nothing; 5J only the sufficiency `TwoElementaryAdmissible → TwoElementaryLatticeWithInvariants`
  on the native predicates; 6C, 6D, 6G, 6H nothing; 7A and 7G ranks 0–1 nothing (B8 stays); 7C
  nothing (the roadmap's count on an integer matrix is the native count of `A.map Int.cast`, so say
  so); 7E only the comparison the native file says it does not formalize, that the Riemannian
  volume of the induced metric `−tr(XY)/2` is `orthogonalGroupMeasure` (its total mass
  `specialOrthogonalGroupVolume n`); 9B nothing. Delete line 466's claim and the two "not
  duplicated" paragraphs' attribution of Milgram's theorem to this roadmap; point `6G`'s "owned
  here" and OTM's consumer rows at the native names. Then re-run the dependency check (the R
  rows for these milestones shrink to T rows).

## R02 (P3) — `Suggested.lean` states the native theorems of R01 as headlines, several through Gram-level stand-ins

- **Location.** `TauCetiRoadmap/IntegralLattices/Suggested.lean` lines 115 `vanDerBlij`, 215
  `nonempty_isometry_iff_gaussSign_eq`, 232 `milgram`, 275
  `volume_ball_mul_prod_sqrt_successiveMinimum_le`, 287 `finite_classes_of_posDef`, 346
  `finite_genusClasses_rank_two`, 361 `infinite_isometry_of_isIndefinite`, 498
  `TwoElementaryAdmissible`, 518 `TwoElementaryLatticeWithInvariants`, 574
  `exists_isEven_isUnimodular_isPosDef_iff`, 581
  `nonempty_isometry_typeE₈RootLattice_of_isEven_of_finrank_eq_eight`, 590 and 599 (6C odd and
  rank 9), 614 `d16PlusGram`, 634 `e8SumE8Gram`, 643 `d16Plus_sameGenus_not_isometric_e8SumE8`,
  681 `gramIsometric_e8SumE8_sum_U_d16Plus_sum_U`, 692 `natCard_isometry_typeE₈RootLattice`,
  704–737 `localDensityCount` and its two theorems, 751 `sphereArea`, 756
  `orthogonalSkewBasisVolume`, 850 `IsGenusMass`, 864 `isometric_mem_of_sum_eq_genusMass`; and
  the docstring 38–56, which lists 1H, 1I, 1L, 2F, 2G, 4E, 4F, 6B, 6C, 6D, 6G, 6H, 7C, 7E and 9B
  as headlines "the finished roadmap will be able to prove".
- **Witness.** On a scratch copy at the pins, seven of them close with one term each:
  `L.vanDerBlij hU hw`; `(nonempty_isometry_iff_bilinear_isometry_and_gaussSign_eq h₁).trans
  (and_iff_right hb)` after `rw`; `rw [L.gaussSign_discriminantQuadraticModule_eq_sigPos_sub_sigNeg
  hL]; push_cast; rfl`; `TauCeti.IntegralLattice.infinite_isometry_of_isIndefinite (by rwa
  [L.finrank_carrier]) hL`; `TauCeti.IntegralLattice.exists_isEven_isUnimodular_isPosDef_iff n`;
  `⟨(hp.nonempty_isometry_typeE₈RootLattice_of_isEven hu he (by rwa
  [L.finrank_carrier])).some.symm⟩`; `TauCeti.IntegralLattice.card_isometry_typeE₈RootLattice`.
  The elaboration exited 0 with no error. `h.twoElementaryAdmissible` closes the necessity half
  of 5J on the native predicates, and `⟨sameGenus_e8PowLattice_checkerboardPlusLattice 2,
  isEmpty_isometry_e8PowLattice_checkerboardPlusLattice le_rfl⟩` proves 6D on the native
  lattices. The Gram-level forms (2G, 4E, 6C odd and rank 9, 6D, 6H, 7C, 9B) are transports of the
  native statements through `ofGramMatrix`, `Int.cast` or a change of basis, and
  `GramSameGenus`, `IsGenusMass` and the roadmap's `localDensityCount` are stand-ins for the
  native `SameGenus`, `mass` and `Matrix.localDensityCount`.
- **Repair.** Delete the declarations listed (the README keeps the statements as consumed facts
  or Checks), and name them in the docstring as proved in Tau Ceti. Restate what stays on the
  native carriers: `exists_twoElementaryLattice_iff` on `TauCeti.IntegralLattice.TwoElementaryAdmissible`
  and `TwoElementaryLatticeWithInvariants` with no local copy; `gramSameGenus_iff_of_isEven` on
  `SameGenus` of the two `ofGramMatrix` lattices; `exists_genusClasses_equiv_doubleCoset` with
  `SameGenus` and the native isometry quotient in place of `GramSameGenus` and `GramIsometric`;
  7E as the one comparison of R01, with `specialOrthogonalGroupVolume n` on the right of
  `soEuclideanMeasure_univ` and `orthogonalGroupVolume n` on the right of
  `oEuclideanMeasure_univ`, and `sphereArea`, `orthogonalSkewBasisVolume` deleted. What then
  remains stated is 1G's decomposition data, 4B, 5A (the converse), 5B, 5G, 5J (sufficiency),
  6A, 6E and 7E's comparison, which is the roadmap's actual acceptance test.

## R03 (P3) — "The single lattice carrier" still displays fields the pinned structure lacks

- **Location.** `README.md:223–229`: `[isLattice : carrier.IsLattice ℚ]` and `integral : ∀ x ∈
  carrier, ∀ y ∈ carrier, form x y ∈ (1 : Submodule ℤ ℚ)`.
- **Witness.** `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63–73` at the pin: `isLattice :
  carrier.IsLattice ℚ` is an explicit field, and the last field is `le_dual : carrier ≤
  form.dualSubmodule carrier`; there is no `integral` field.
- **Repair.** Display the pinned fields and the file, and keep the sentence that integrality is
  `L ≤ L^⋆` (the README's own "Dual lattice" paragraph). On `ℤe` with `B(e,e) = 1/2` both
  formulations fail (`2ℤe ⊉ ℤe`, `1/2 ∉ ℤ`); on `A₁` both hold.

## R04 (P3) — 3E's Allcock–Gal–Mark locator names the unimodular theorem

- **Location.** `README.md:862`: "(Theorem 5.1 there, which proves the canonical symbol a
  complete invariant)".
- **Witness.** `allcock-gal-mark2016` line 686 (p. 16) is Theorem 5.1, which classifies
  **unimodular** lattices by dimension, type, sign and oddity. The symbol calculus is Theorem 6.2
  (line 849, p. 20), Theorem 6.3 (line 864, p. 20) and Corollary 6.4 (line 917, p. 21), the
  canonical form as a complete invariant, which is also the manifest's locator.
- **Repair.** Cite "Theorems 6.2 and 6.3, p. 20, and Corollary 6.4, p. 21, with Theorem 5.1,
  p. 16, for the unimodular constituents".

## R05 (P3) — Gate `outside-folder`: two `Completed/` folders not named as this pull request's own

- **Location.** `Completed/LocalFieldsRamification/` (`COMPLETION.md`, `README.md`,
  `Suggested.lean`) and `Completed/LocalGaloisGroups/` (`README.md`, `Suggested.lean`).
- **Witness.** The worker's gate prints `outside-folder=5 … FAIL` with these paths; mine prints
  `outside-folder=10`, the same five plus the four files of the two folders the brief names. The
  pull request's title and description are about LocalFieldsRamification. No acceptance is
  possible while the gate fails.
- **Repair.** Record `Completed/LocalFieldsRamification` and `Completed/LocalGaloisGroups` as this
  pull request's own folders, or move those changes to a pull request of their own. Nothing
  changes in this folder.

## R06 (P3) — The branch was not merged with main: the folder still conflicts, its generated files regress, and the order against #1411 and #1797 is unstated

- **Location.** The whole folder; `STATUS.md:1–3` and `PROGRESS.md:46–47`; the description's
  merge-order paragraph, which names only #1410.
- **Claim.** The previous repair copied main's files instead of merging `origin/main`
  (`4daf5e1`), so git still sees two divergent rewrites of the same base `eaf17b1`. The copy was
  taken before main's generated progress report `91ba40ae`, so the head carries `STATUS.md` of
  2026-10-24 ("`271e1af`") in place of main's of 2026-11-09 ("`7ca783d`") and `PROGRESS.md` without
  main's two latest windows (`git diff origin/main HEAD -- TauCetiRoadmap/IntegralLattices`:
  STATUS 49 lines, PROGRESS −18 lines). Resolved toward the head, the merge would overwrite main's
  generated files with stale ones.
- **Witness.** `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (content): Merge
  conflict in TauCetiRoadmap/IntegralLattices/README.md" and the same for `Suggested.lean`;
  `git merge-base origin/main HEAD` is `eaf17b1`. The overlap report says "#617 and #1411 conflict
  in … `TauCetiRoadmap/IntegralLattices/Suggested.lean`" and "#617 and #1797 conflict in
  `TauCetiRoadmap/IntegralLattices/README.md`, `…/Suggested.lean`": #1411 carries the old
  1374-line file, #1797 an 826-line variant of main's.
- **Repair.** Merge `origin/main`, resolving `README.md` and `Suggested.lean` to this head's
  text (after R01–R04) and `STATUS.md`, `PROGRESS.md` to main's; state in the description which
  of #1411 and #1797 merges first against this one. This is a worker step; the folder's
  mathematics does not change.

## R07 (P3) — B6 and B7 carry no locator

- **Location.** `README.md:1353–1360` (B6) and `1375–1410` (B7). Neither paragraph cites a source;
  the "Hard theorems" row for B7 (2957) gives only "Dirichlet's unit theorem with B4 and B5".
- **Claim.** Every target carries a locator. B6 asserts `SO(L_p) ≅ T_L(ℤ_p)` and compactness of
  `T_L(ℤ_p)`; B7 asserts compactness of `T_L(ℚ)\T_L(𝔸)` for nonsquare `Δ` and the modulus-kernel
  statement in the split branch. Both are standard, and the sampled Checks hold (`Δ = −4`:
  `T(ℤ) = {±1, ±i}`, volume `2π/4`; `Δ = 12`: `log(2 + √3)`; `U`: infinite volume, kernel volume
  1), but a reader cannot verify the statements' hypotheses against a text.
- **Repair.** Give each statement its source with theorem and page: the local isomorphisms of B6
  from the binary norm-form theory already cited for B4 (Cassels, *Rational Quadratic Forms*,
  Chapter 13), and B7's compactness from a text on adelic points of tori, or, since the README
  proves it from B4 and B5, say so in the paragraph itself as its proof route and cite Cohen §5.6
  and Cox for the unit and class inputs.

## Verified sound

**Gate, my run** (`gate … --base origin/main`): `set_option=0 blob=0 latex=0 tex=0 prnum=0
sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0
no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0
empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0
stray-files=0 dirty=0 outside-folder=10 source-material=0 FAIL`. The worker's run has
`outside-folder=5` and `build=0`. The pins are main's (`lake-manifest.json` identical to
`origin/main`): Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.

**Dependency check.**

```text
depcheck: 239 roadmaps, 2346 edges, 0 problem(s)
```

**Elaboration.** `lake env lean TauCetiRoadmap/IntegralLattices/Suggested.lean` exits 0 in 13 s
with 31 warnings, all `declaration uses sorry`. Imports are `Mathlib` and twenty `TauCeti.*`
modules, all built. No `lemma`, `#check`, `#eval`, `#print` or `set_option`.

**Signatures.** I put `#check @name` for all 65 declarations (the 66 of the worker's list, with
`Archimedean.SO`/`O` abbreviations) into one scratch file importing the built module; it
elaborated with exit 0 and no error. Compared with the README: `vanDerBlij` keeps
`[FiniteDimensional ℚ V] [L.IsNondegenerate]`; `infinite_isometry_of_isIndefinite` keeps
`[L.IsNondegenerate]` and `3 ≤ finrank ℚ V`; `exists_primitiveEmbedding_iff` keeps
`[FiniteDimensional ℚ V] [S.IsNondegenerate]` and the two inequalities that make the
natural-number differences exact; `finite_genusClasses_rank_two` carries `G.IsSymm` and
`G.det ≠ 0`; `gramSameGenus_iff_of_isEven` carries evenness and nondegeneracy of both
`ofGramMatrix` lattices; `padicDiscriminant_eq_squareClass_gramDet` carries the dyadic exception
`p ≠ 2 ∨ ¬ HasCyclicTwoSummand`. No binder was lost, and no generality differs from the README.

**The 68 Tau Ceti declarations of the six new Layer B rows** (README 453–458) all exist at the
pin, each found as a `def`/`theorem` in the file the row names: `binaryNormForm … binaryContent_smul`
(`Binary/NormForm.lean`), `binaryProperClass` (`Orientation.lean`), `binaryOrder`,
`discr_binaryOrderBasis`, `binaryNumberFieldOrder(_conductor)`, `binaryOrderEquivProductOfSq`
(`Order.lean`), `indexTwoSublattices_binaryContent_ne` (`Examples.lean`),
`hyperbolicPlane_binarySplitProperClass` (`SplitClass.lean`), the four `NormOne.lean` theorems,
`index_specialOrthogonalGroup_eq_two_iff_reflected` (`Isometry.lean`), the two `Ambiguous.lean`
criteria with `picClass_two_one_three_sq_ne_one`, `binaryDeterminant23` and its card
(`Determinant23.lean`), `card_isometry_hyperbolicPlane`, the twenty-two `BinaryQuadraticForm`
declarations from `Content.lean`, `Ideal/{Class,Narrow/Class,PicEquivalence,Narrow/Equivalence,
Composition,Narrow/Composition,Reflection,DiscriminantTwelve,RingClassField}.lean`,
`Split/{Classes,Composition}.lean`, `PrimitiveReduced.lean`, `Ideal/ClassNumber.lean`,
`LagrangeReduction.lean`, `FiniteClasses.lean`, and `ringClassField`, `ringClassArtinMap`,
`ringClassArtinEquiv`, `QuadraticAlgebra.instNumberField`, `QuadraticOrder.numberFieldOrder`,
`numberFieldOrder_eq_maximal_iff`, `productSubalgebra`, `equivProductOfSq`. Their statements
agree with the prose: `card_specialOrthogonalGroup_of_binaryDiscriminant_neg` is `|SO(L)| =
#(binaryOrder)ˣ`; `card_specialOrthogonalGroup_of_isSquare_binaryDiscriminant` needs `Δ ≠ 0` and
gives 2; `finrank_ringClassField_neg_twenty_three_eq_three` is the degree over `QuadraticAlgebra
ℚ (−23) 0`; `nat_card_pic` is `#Pic = #primitiveReducedForms n` for `Δ = −n`;
`exists_finset_forall_exists_smul_mem` needs only `D ≠ 0`, as the README says.

**Cross-roadmap citations resolved at this head and on main, 14.** Class Field Theory
`hilbertProductFormula` (head `Suggested.lean:706`, re-exporting Tau Ceti's); Quadratic Form
Invariants `hilbertSymbol_productFormula` (head 156), `hilbertSymbol_eq_cohomological` (164),
heading "6D. The classification and its corollaries" (head `README.md:1657`); Global Quadratic
Forms `hasseMinkowski_equivalent` (main `Suggested.lean:439`), `equivalent_of_locallyEquivalent`
(544); Global Number Fields `picEquivUnitsIdealClassMonoid` (`Completed/…/Suggested.lean:798`),
`finite_narrowPic` (991); Orthogonal and Spin Groups `spinorNorm_reflection` (420),
`transvectionLiftHom` (904), `orthogonalBaseChangeReal` (1025), and
`strongApproximation_finiteAdelicSpin` is indeed not cited; Root Systems `RootPairing.weylGroup`
(main `README.md:189`); Restricted Products' build layers (main README 246–); Theta Series
Layer 2 (484) with `ratModel` (518) and Layer 6 (703); Differential Geometry 12.1 and 12.4
(915, 923); `RepresentationTheory/LieGroups` (real finite-dimensional Lie groups, its README 79).

**Ownership against open pull requests.** The closest open roadmaps in vocabulary are Theta
Series (#1187, a pin bump), OrthogonalTamagawaAndLatticeMass (#1222), LatticePackingsAndPerfectForms
(#1723), OrthogonalSpinGroups (#1181) and GeometryOfNumbersAndQuadraticArithmetic Part II
(#1691). Each cites this roadmap's labels and claims no second ownership: OTM consumes 2G, 4B,
6C–6E, 7C (its `README.md:9, 18, 171, 281`); LPPF consumes 0F and the native successive minima,
and takes Minkowski's second theorem from `SuccessiveMinima` (its 155, 285–288), not from here;
GoNQA II consumes 1I and 1L (its 16, 83, 497). The only overlap defect is R01's drift into OTM's
ownership sentence. No id this README cites is dropped by an open head, and no id this pull
request drops is cited elsewhere (overlap report).

**Sources, read at their locators.** `allcock-gal-mark2016`: Theorem 5.1 line 686 (p. 16),
Theorem 6.2 line 849 and 6.3 line 864 (p. 20), Corollary 6.4 line 917 (p. 21), and the SPLAG
correction at 919–924 (R04). `voight2023`: Definition 3.10 line 230 (`[Λ : Λ ∩ Π] = [Π : Λ ∩ Π]
= p`, under `p ∤ disc Λ` at 229), Lemma 3.12 line 245 (equal discriminant, same genus),
Proposition 3.13(iii) line 261 (`v ∈ Λ∖pΛ`, `p² | Q(v)`, `Λ(p, v) = p⁻¹vℤ + {w : T(v,w) ∈ pℤ}`);
with `T(v,v) = 2Q(v)` this is the README's `β(v,v) ≡ 0 (mod 2p²)`, and Voight's Remark 3.1
restricts odd lattices only at `p = 2`, which 4G excludes. `boya-sudarshan-tilma2003`: (6.1)–(6.3)
lines 643–655 (p. 16, `−tr λ² = 2`), (6.4)–(6.5) lines 659–669 (`vol SO(n) = ∏_{d=2}^{n} vol
S^{d−1}`, `8π²` at `n = 3`), (6.9) line 684 (p. 17, `vol O(n) = 2 vol SO(n)`). The manifest
settles `conway-sloane-mass1988` (waived) and `kawauchi-kojima1980` (uncertified).

**Headline theorems.** The docstring (38–56) lists 1H, 1L, 1I, 2F, 2G, 4B, 4E, 4F, 5A, 5B, 5G,
5J, 6A, 6B, 6C, 6D, 6H, 6E, 6G, 7C, 7E, 9B; 3E/3G and 4C are named as not statable (correct: no
genus-symbol carrier; `finiteAdelicSquareClasses` lacks the diagonal). Every listed headline is
stated. Of the 22, fifteen are proved at the pin (R01–R02); the honest headlines are 4B, 5A,
5B, 5G, 5J (sufficiency), 6A, 6E and 7E's comparison. The one-tactic probe is R02's witness; the
other sorried theorems do not close in one tactic.

**Adversarial pass.** Values computed by hand in exact arithmetic; the `D₁₆⁺` determinant and
leading minors by a rational Gaussian elimination on the displayed matrix.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| B1 norm form and discriminant | `!![4,1;1,6]`; `A₂`; `U` | `4x²+2xy+6y²`, content 2, primitive `(2,1,3)`, `Δ = 1−24 = −23`, `disc N_L = 4−96 = −4·23`; `A₂`: `(1,1,1)`, `Δ = −3`; `U`: `2xy`, content 2, `Δ = 1` | pass; native `discrim_binaryNormForm` | none |
| B1 content under index | `⟨2e₁,e₂⟩ ≤ ℤ²` vs `⟨e₁+e₂,e₁−e₂⟩` | `4x²+y²` content 1; `2x²+2y²` content 2; both index 2 | pass; native `indexTwoSublattices_binaryContent_ne` | none |
| B2 dictionary, `Δ < 0` | `Δ = −23`; `Δ = −4` | reduced forms `a ≤ √(23/3) < 3`: `(1,1,6)`, `(2,±1,3)`, so `#Pic = 3`; `Δ = −4`: `(1,0,1)` only, `#Pic = 1`, while all primitive classes are `x²+y²`, `−x²−y²`: 2 | pass with "positive definite" (R12 repaired) | none |
| B2 sign clause, `Δ = 12` | `x²−3y²`, `−x²+3y²` | `𝒪 = ℤ[√3]` maximal (`disc ℚ(√3) = 12`), `N(2+√3) = 1`, `#Pic = 1`, `#NarrowPic = 2`; `x²−3y²` omits `−1` mod 3; oriented images `𝒪`, `√3·𝒪` differ | pass; native `narrowPicClass_discrimTwelve…_ne_negative` | none |
| B2 split branch | `Δ = 25`; `Δ = 1` | `(0,5,c)`, `c ∈ (ℤ/5)ˣ`: 4 classes; `U`: 1 class, `(ℤ/1)ˣ` trivial | pass; native `splitProperClassEquivUnits` | none |
| B3 composite | `Δ = −23`; `Δ = −4` | `[K(H):K] = 3 = #Pic`; `1 = 1` | pass; native `finrank_ringClassField_neg_twenty_three_eq_three` | none |
| B3 genus coset | `Δ = 25` | `C = ((ℤ/5)ˣ)² = {±1}`, 2 classes per genus, 2 genera of 4 classes | consistent with B5, B7 | none |
| B4 ambiguity | `!![4,1;1,6]`; `!![2,1;1,12]`; `U`; `A₂` | norm 4 only at `±e₁`; `e₂ ↦ (x,y)` with `4x+y = ±1`, norm 6 forces `92x² ∓ 46x = 0`, `x = 0`: `O = {±I}`, order 2 `= w`, `2w = 4` not attained; `!![2,1;1,12]`: `e₂ ↦ (1,−1)` is a reflection, `|O| = 4 = 2w`; `|O(U)| = 4 = 2·2`; `|O(A₂)| = 12 = 2·6` | pass; native `card_isometry_binaryDeterminant23` | none |
| B4 Pell | `Δ = 8`; `Δ = 12`; `Δ = 1` | `1+√2`, `2+√3` of norm `−1`, `+1`: infinite; split: `{±1}` | pass | none |
| B5 class counts | `Δ = −23`; `Δ = −3`; `Δ = 25` | 3; 1 (`(1,1,1)`); `φ(5) = 4` | pass; native `nat_card_pic`, `splitProperClassEquivUnits` | none |
| B6 integral points | `Δ = −4`; `Δ = 12`; `U` | `{±1,±i}`, `w = 4`; `±(2+√3)^k`; `{±1}` | pass | R07 (locator) |
| B7 volumes | `Δ = −4`; `Δ = 12`; `U` | `2π/4 = π/2`; `log(2+√3)`; `ℤ̂ˣ × ℝ_{>0}` infinite, kernel `ℤ̂ˣ` volume 1 | pass | R07 (locator) |
| B8 mass | `A₂`; genus of `!![4,1;1,6]` | `1/12 = 1/(2·6)`; `a = 1`: `1/4 + 1/2 = 3/4 = 3/(2·2)`; `h = (3+1)/2 = 2`, `h/(2w) = 1/2 ≠ 3/4` | pass; native `properClassNumber_add_card_eq_two_mul_classNumber` gives `h⁺ + a = 2h` | none |
| 1H odd value | `q_θ^{(3)}(3)`, `θ = 1, 2` | `1 + 2e(2/3) = −i√3 = √3·e(6/8)`: `6 = −2 + 0`; `θ = 2`: `i√3`, `2 = −2 + 4`, `(2∣3) = −1` | pass | none |
| 1I, 1L | `⟨2⟩`, `⟨−2⟩`, `⟨1⟩`, `E₈`, `I₈` | `1+i = √2 e(1/8)`: sign 1 = `t₊−t₋`; `1−i`: `−1`; `⟨1⟩`: `w² ≡ 1`; `E₈`: `w = 0`, `8 ≡ 0`; `I₈`: `8 ≡ 0` | true; native (probe) | R02 |
| 2F | `⟨a⟩`; `A₂`; `2ℤ⁵ + ℤ(1,…,1)` | `2√a ≤ 2√a`; `2π ≈ 6.28 ≤ 4√3 ≈ 6.93`; `(8π²/15)·32 ≈ 168 ≤ 512`; squared form `(∏λ)πⁿ ≤ 4ⁿΓ(n/2+1)² det` is the native inequality | true; native | R01–R02 |
| 2G | rank 2, det 3; rank 8, det 1 | reduced `[1,0;0,3]`, `[2,±1;±1,2]` (`2c = 3` impossible at `b = 0`): 2 classes; `I₈`, `E₈` | true; native Gram finiteness with `≤ D` | R01–R02 |
| 5B conditions | `(1,0,q₁⁽²⁾(2))`; `(1,0,q₁⁽³⁾(3))`; `(0,0,0)` | sign `1 ≡ 1`, `l = 1 ≤ 1`, (3) vacuous, (4) off; `6 ≢ 1`, no `⟨2a⟩` has `|A| = 3`; rank 0 all four hold with empty product | pass | none |
| 5B exception | `⟨2⟩`, `⟨10⟩` over `ℤ₂` | `q = 1/4 = 5/4` in `ℚ/ℤ`; determinants differ by 5, `5 ≢ 1 (mod 8)` nonsquare | pass; `padicDiscriminant` reads `θ·2^k = 2` vs `10` | none |
| 5J witnesses | `(0,4,0,0)`, `(1,3,0,1)`, `(1,4,0,2)`, `(0,4,0,4)` | pass 1–3, fail 4 (`4 ≢ 0 mod 8`); pass 1–4, fail 5 (`3 ≠ ±1`); pass 1–5, fail 6 (`δ = 1`); pass 1–6, fail 7 | pass; native `not_twoElementaryAdmissible_boundary_witnesses` | R01–R02 |
| 6D Gram | `d16PlusGram` | symmetric; det 1; leading minors `4, 8, …, 60, 1`; `h² = 4`, `h·(e₁₄+e₁₅) = 1`, `(e₁₃−e₁₄)·(e₁₄+e₁₅) = −1`, `(e₁₄−e₁₅)·(e₁₄+e₁₅) = 0` | true; native on `checkerboardPlusLattice 16` | R01–R02 |
| 6E root counts | `D₁₆E₈`, `E₈³`; `A₁₇E₇`, `D₁₀E₇²` | `480+240 = 720 = 3·240`; `306+126 = 432 = 180+252`; Coxeter numbers at rank 4: `A₄` 5, `D₄` 6 | pass; hypotheses native except four rows | none |
| 6G | orbit chain | `240·126 = 30240`, `·23040 = 696729600 = 2¹⁴·3⁵·5²·7` | true; native | R02 |
| 7C values | `U` at 3; `I₂` at 3, 5; `U` at 2 | `#O₂⁺(𝔽₃) = 2(3−1) = 4`, `4/3`; `ε = (−1∣3) = −1`: `2(3+1)/3 = 8/3`; `(−1∣5) = 1`: `8/5`; `2^{r+2}/2^r = 4` | true; native with `ε = χ((−1)^{m+1}det)`, `n = 2m+2` | R01–R02 |
| 7E values | `sphereArea 1..4`; `SO(2)`, `SO(3)`; Gamma identity `n = 0, 1, 2` | `2, 2π, 4π, 2π²`; `2π`, `8π²`; `2 = 2/1`, `2π^{−1/2}Γ(1/2) = 2 = 4/2`, `2π^{−3/2}·√π = 2/π = 8/(4π)` | true; native products | R01–R02 |
| 7A, 7G | rank 0; `⟨a⟩`; genus of `!![4,1;1,6]` | `m = m⁺ = 1`; `1/2`, `1`; `3/4`, `3/2 = 2m` | true; native | R01–R02 |
| 9B | genus of `!![4,1;1,6]`; three Gram matrices of one lattice | `1/4 + 1/2 = 3/4`; `3·(1/4) = 3/4` while a class is missing, so pairwise non-isometry is needed | true; native `sum_inv_natCard_isometry_eq_mass_iff` requires `Pairwise IsEmpty` | R01–R02 |
| Carrier display | `A₁`; `ℤe`, `B = 1/2` | `le_dual` ⇔ `2 ∈ ℤ`; `2ℤe ⊉ ℤe` ⇔ `1/2 ∉ ℤ` | equivalent; display wrong | R03 |
| 3E locator | AGM | Thm 5.1 = unimodular; 6.2/6.3/6.4 = canonical form | locator wrong | R04 |
| Merge state | `origin/main` vs HEAD | two conflicts; STATUS `271e1af` vs `7ca783d`; PROGRESS −18 lines | defect | R06 |

## Not verifiable

- **Nikulin**, *Integer symmetric bilinear forms* (Izv. 1979 / Math. USSR-Izv. 1980), cited at
  1.3.3, 1.8.1–1.8.2, 1.9.1, 1.9.4, 1.10.1–1.10.2, 1.11.2–1.11.3, 1.12.2–1.12.4, 1.15.1, 1.16.3,
  3.6.2: paywalled (IOP) and not in the manifest; no open copy found. The statements were checked
  mathematically and against Tau Ceti's native `TwoElementary.lean` (3.6.2) and
  `Localization/Discriminant/Form.lean` (1.9.4, one direction), whose docstrings cite the same
  numbers.
- **Cox**, *Primes of the form x² + ny²*: Theorems 2.8, 2.13, 3.9, 7.7 (B2, B4, B5; flagged
  uncertified). Commercial monograph; checked mathematically and against Tau Ceti's
  `BinaryQuadraticForm` docstrings, which cite §2, §3 Lemma 3.2 and §7 Theorem 7.7.
- **Cohen**, *Computational ANT* §5.2, §5.6 (B2, B5; flagged). Commercial.
- **Cassels**, *Geometry of Numbers* Ch. VIII (2F; flagged): checked against the native
  Minkowski theorem instead.
- **Conway–Sloane**, SPLAG Ch. 15–16 and the mass paper (waived): checked through
  `allcock-gal-mark2016` and the native `LocalDensity` and `OrthogonalGroup` files, which cite
  equation (6) and §§2, 3, 6.
- **O'Meara, Serre, Milnor–Husemoller, Kawauchi–Kojima** (uncertified): books and a paywalled
  paper, cited at sampled targets only through statements checked above.

## Source issues

- **Error** in Conway–Sloane, *SPLAG* (cited by the README; no manifest key) at Chapter 15, the
  canonical form of 2-adic symbols (printed page not checked): the source says a sign can walk the
  whole length of a train, leaving at most one sign per train; it should allow several signs per
  train when a compartment's oddity blocks the walk (`allcock-gal-mark2016` lines 919–924);
  affects a stated result.
