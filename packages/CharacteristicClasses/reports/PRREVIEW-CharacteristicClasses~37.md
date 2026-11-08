# Review of CharacteristicClasses (pull request #1854 at c9c60d0)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CharacteristicClasses/` at c9c60d0. The previous review on file (r36) read pull request #1807 at 70140e6. This folder is not that one. Its whole diff against main comes from three commits it shares with #1807's history (2cf8a27e, b4658595, 74e527e8), and this pull request adds no CharacteristicClasses change of its own. #1807 has since moved on twice: to 70140e6 (TopologicalKTheory T1.6a owns the finite oriented carriers) and then to ac36c47 (pinned Thom, Euler, frame, Serre and series names; four headlines). This head keeps main's C1.1a and the older `Suggested.lean`.

There are twelve findings, six of them blocking. Adopting #1807's current folder repairs R01, R02 and R04–R09 (checked by grep of `roadmaps show CharacteristicClasses --pr 1807`). R03 is caused by this pull request's own AlgebraicTopology rewrite and still needs repairing after that. Each finding is stated against this head so that it can also be repaired in place.

## R01 (P1) — CharacteristicClasses and TopologicalKTheory each supply the other through C1.1a

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:20–23`: "C1.0 and C1.1a construct their positive-rank oriented double covers, lifted finite cells and coordinate maps. TopK T1.6a owns the fixed-rank and stable colimits … on those carriers." Also `:254–277` (C1.1a), `:371`, `:376` and `:1348–1353`.

Claim: CharacteristicClasses consumes TopologicalKTheory T1, T1.3–T1.5, T1.6a and T6.4. At this head, TopologicalKTheory (carried by this same pull request) consumes CharacteristicClasses C1.1a as an input to T1.6a. Each roadmap therefore names the other as a supplier, which is a two-roadmap cycle. The dependency check reports no CYCLE. A likely reason is that the TopK sentences that make CharacteristicClasses a supplier also call C1.1b a "consumer"; this is a false negative of the check, not an acyclic design. The carrier C1.1a builds is also pinned (see R04).

Witness: `TauCetiRoadmap/TopologicalKTheory/README.md:384` at this head reads "compare using CharacteristicClasses C1.1a's finite oriented-cover precursor". Line 116: "CharacteristicClasses C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor". Line 75 has the same wording.

Repair: make TopologicalKTheory the single owner.
- Lines 20–30: "The positive-rank finite oriented Grassmannian is the pinned `TauCeti.finiteOrientedGrassmannian r N` (`Topology/Grassmannian/Oriented.lean`), the orientation double cover of T1.5's tautological bundle, with its pinned `Tautological` bundle and `forget` map. TopK T1.6a owns its lifted Schubert cells, coordinate maps, fixed-rank and stable colimits, universal-bundle diagrams and classifier comparison. C1.0 and C1.1a identify the determinant-sign cover with these carriers." BSO(n) then becomes the colimit "of TopK T1.6a's carriers".
- C1.1a: delete the construction of the carrier, the lifted cells, the characteristic maps and the rank/ambient squares. Keep the direct-sum and section comparisons, the path-transport sign system and the cyclic-SO sign (−1)^(n−1), as consumers of T1.6a's lifted cells.
- Lines 371, 376 and 1348–1353: replace "C1.1a's oriented lift" and "C1.1a/TopK T1.6's" by "TopK T1.6a's".
- TopologicalKTheory (its own review): lines 75–80, 116, 300 and 384 must state C1.1a as a consumer only.

#1807's current head does exactly this: its TopK lines 151–152 call C1.1a "a consumer, with no input into this roadmap", and its C1.1a cites the pinned carrier. Test: afterwards no TopK line names a CharacteristicClasses item as an input.

## R02 (P2) — HomotopySpheres is cited five times, twice as a supplier, and the gate fails on it

Location: `README.md:24–27`: "HomotopySpheres §3A and §4A supplies the earlier compactly generated substrate". Also `:277`, `:383` ("Consume the CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres") and `:463–465` ("§4A's quaternion-conjugation dictionary S³/{±1}≃SO(3) as the only HomotopySpheres input").

Claim: HomotopySpheres is on the list of roadmaps never cited as suppliers. Lines 383 and 463–465 consume it. Both inputs have owners at this head:
- The compact-generation coreflection is AlgebraicTopology Stage 4.5's (`TauCetiRoadmap/AlgebraicTopology/README.md:133–135`: "Stage 4.5 owns the compact-generation interface: the coreflection k from `TopCat` onto Mathlib's `CompactlyGenerated`").
- The double cover S³ → SO(3) is pinned: `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (`Topology/Algebra/CliffordAlgebra/Spin/Covering.lean:108`, already consumed in C3.5) together with `TauCeti.realSpinThreeEquivQuaternionUnitary` (`LinearAlgebra/CliffordAlgebra/Spin/Real/Three.lean:192`, Spin(3) ≅ unit quaternions).

Witness: the worker's gate at c9c60d0 gives `dropped=5`, for example "line 383: CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres". `grep -c HomotopySpheres` is 5 here and 0 at #1807's head.

Repair (every occurrence must go, because the gate matches the name):
- 24–27: "AlgebraicTopology Stage 4.5 supplies the compact-generation coreflection on which the stable colimits are formed; stable O/SO and ΩBSO comparisons are downstream consumers, not inputs."
- 277: "colimits and their classifier comparison."
- 383: "Consume AlgebraicTopology Stage 4.5's compact-generation coreflection, right adjoint to the inclusion of Mathlib's `CompactlyGenerated`, with its counit;".
- 463–465: "together with the pinned spin double cover `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` at n=3 and `TauCeti.realSpinThreeEquivQuaternionUnitary`, so SO(3) is doubly covered by S³."

Then π₂(SO(3)) = π₂(S³) = 0 as stated, and the gate's `dropped` is 0.

## R03 (P2) — four AlgebraicTopology names cited as supplier declarations are dropped by this pull request's AlgebraicTopology rewrite

Location: `README.md:610` ("consume AT4's generic `simplicialRealizationCW`"), `:811` ("AT2.5's single `supBallEuclideanDiskHomeomorph`"), `:831` ("AT4.5's `relativeCWPushout`") and `:847` ("AT4.5's `homotopyPushoutGluingComparison`").

Claim: this pull request's commit d723ba17 deletes these four names from `TauCetiRoadmap/AlgebraicTopology/README.md`. #1807's AlgebraicTopology head still has them (5 mentions), so the break is specific to this pull request. The diff against main removes "Own `supBallEuclideanDiskHomeomorph`", "Own `relativeCWPushout`", "Own `homotopyPushoutGluingComparison`" and "Own `simplicialRealizationCW`", and none of the four exists in pinned Tau Ceti or Mathlib (`grep -rlw` is empty for each). These citations resolve nowhere at this head; `roadmaps resolve` misses them because main still has the old text. `relativeCWPushoutCWModel` is kept (AT line 909–910: "the target MorseTheory and CharacteristicClasses cite as relativeCWPushoutCWModel"). #1807's current CharacteristicClasses folder cites the same four names, so adopting it does not repair this.

Witness: `grep -c` of each name in `TauCetiRoadmap/AlgebraicTopology/README.md` at c9c60d0 returns 0. The renamed owners are: AT 552 "Own the sup-ball-to-Euclidean-disk homeomorphism"; AT 833 "the carrier `relativeCWPushoutCarrier`"; AT 850 "Own the homotopy-pushout gluing comparison"; AT 1064 "Own the realization CW structure of every native simplicial set".

Repair:
- 610: "consume AT4.7's realization CW structure of a simplicial set (one cell per nondegenerate simplex)".
- 811: "AT2.5's sup-ball-to-Euclidean-disk homeomorphism, whose fixed formula is …".
- 831: "AT4.5's relative CW pushout carrier `relativeCWPushoutCarrier`".
- 847: "AT4.5's homotopy-pushout gluing comparison and `relativeCWPushoutCWModel`".

Each replacement has been grepped and is present in AT at this head.

## R04 (P2) — the README plans objects the pinned Tau Ceti has, and says the library lacks what it has

Location: `README.md:83–84`: "The pinned Tau Ceti has no Serre-fibration declaration; these are supplier targets, not library theorems, and none is cited here by Lean name." Also:
- `:218–227` (C1.0): "construct the orthonormal frame principal O(n) bundle by Gram–Schmidt … freeness and transitivity on each fibre".
- `:247–249`: identify the orientation double cover "with the frame quotient by SO(n), prove its local two-sheet description".
- `:258–263` (C1.1a, the finite oriented Grassmannian).
- `:806–809` (the Hausdorff total space).
- `:862–899` (C2.1–C2.2).

Claim: each of the following was checked at Tau Ceti 2fd255d9, either by `#check` in a scratch probe (all resolve) or by reading the file at the line given.
- `TauCeti.TopCat.serreFibrations` (`Topology/Homotopy/SerreFibration/Basic.lean:107`), `TauCeti.TopCat.mem_serreFibrations_of_exists_trivialization` (`SerreFibration/FiberBundle.lean:365`, one common fibre F for all trivializations, exactly the condition at README:76) and `TauCeti.TopCat.mem_serreFibrations_proj` (`:395`). AlgebraicTopology 5.5 at this head consumes these same names (its README:1249–1252), so line 83 also contradicts its own supplier.
- `TauCeti.OrthonormalFrameBundle` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean:109`), and `TauCeti.OrthonormalFrameBundle.toOrientationCover_eq_toOrientationCover_iff` (`Orientation/OrthonormalFrame.lean:120`). The latter says two frames give the same point of the cover iff `q = op g • p` with `0 < det g`, which is C1.0's frames-mod-SO(n) identification. `VectorBundleOrientationCover.trivializationHomeomorph` and `isCoveringMap_proj` (`Orientation/Cover.lean:262, 298`) give the local two-sheet description.
- `TauCeti.finiteOrientedGrassmannian r N` (`Topology/Grassmannian/Oriented.lean:44`): the orientation cover of the finite tautological bundle, with `Tautological`, `forget`, and `encard_univ_fullRank` (two points in full rank). Rank 0 is excluded, with the same remark as README:265. This is C1.1a's carrier, word for word.
- `TauCeti.FiberBundle.t2Space_totalSpace` (`Topology/FiberBundle/Separation.lean:37`, `[T2Space B] [T2Space F]`).
- `TauCeti.IsThomClass` (`Topology/VectorBundle/EulerClass.lean:245`), `TauCeti.eulerClass` (`:356`), `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero` (`:383`), `TauCeti.VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` and `exists_isThomClass` (`Orientation/ThomClass.lean`, `[CompactSpace B]`), and `VectorBundleOrientationCover.signLocalSystem` (`Orientation/LocalSystem.lean:75`).

Witness: `#check @TauCeti.TopCat.mem_serreFibrations_proj` elaborates at the pin, and AT README:1249 reads "Consume native `TauCeti.TopCat.serreFibrations` and its pullbacks".

Repair:
- Replace 83–84 by a citation of the three Serre-fibration declarations with their files, keeping AT 5.5 for the homotopy exact sequence and the spectral sequences.
- In C1.0, consume `OrthonormalFrameBundle`, `toOrientationCover_eq_toOrientationCover_iff`, `trivializationHomeomorph` and `isCoveringMap_proj` by name. Keep as targets only the metric-change square root, the unitary and smooth versions and the DG chart-sign comparison.
- In C1.1a, cite `finiteOrientedGrassmannian` (R01).
- In C2.0, cite the instance `t2Space_totalSpace` instead of proving Hausdorffness.
- In C2.1–C2.2, consume `IsThomClass`, `eulerClass`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero`, `exists_isThomClass` and `signLocalSystem`. Keep as targets the general-base existence and uniqueness, the local-system Thom isomorphism, the Gysin sequence and the primary-obstruction converse.

## R05 (P2) — the `Suggested.lean` docstring's "not statable" reasons are partly false, and two statable headlines are absent

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:13–15`: "there is no Thom-class carrier, no bundle disk/sphere cell structure and no orientation local system on a vector bundle at the pins". Also `:24–25`: "there is no Euler class and no fundamental class of a manifold at the pins".

Claim: at the pins, `TauCeti.thomPair` and `TauCeti.IsThomClass` (the Thom-class carrier) exist, and so do `VectorBundleOrientationCover.signLocalSystem` (the README's `o(E)`, line 170) and `TauCeti.eulerClass`. The fundamental class also exists: `TauCeti.HomologicalOrientation` (`AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean:75`) with `HomologicalOrientation.evalFundamentalClass` (`AlgebraicTopology/Cohomology/FundamentalClass.lean:88`) and `fundamentalClassEquiv`. The other clauses checked out and are correct:
- no disk/sphere relative cell structure;
- no relative cup product on `TopPair` (only `singularCup`, `integralCup` and `twistedCup`), so the Thom isomorphism and the Gysin sequence are not statable;
- no curvature of a connection at Mathlib 1b1ccf4b. `Geometry/Manifold/VectorBundle/CovariantDerivative/` has `Basic`, `Torsion`, `LeviCivita` and `Metric`, but no curvature, which corrects r36's mention of a `curvatureOperator`.

Two statements are statable and absent:
- C2.1's general-base existence and uniqueness of the oriented Thom class (README 862–886; the pin has it only for `[CompactSpace B]`; the README cites Milnor–Stasheff §10, uncertified, for every base);
- C2.2's primary-obstruction theorem for oriented bundles of rank n ≥ 2 over a CW base of dimension ≤ n (README 897–899), statable on `TauCeti.eulerClass` of a Thom class with Mathlib's `Topology.CWComplex` and an empty-cells bound above n.

Witness: `#check @TauCeti.IsThomClass` and `#check @TauCeti.VectorBundleOrientationCover.signLocalSystem` elaborate at the pin. #1807's head states both headlines (`existsUnique_singularCohomology_thomPair_fiber`, `eulerClass_eq_zero_iff_exists_ne_zero`, its `Suggested.lean` lines 126 and 166).

Repair:
- Rewrite lines 12–32 so that they name the carriers that exist and give the true missing pieces: relative cup, disk/sphere cells, classifying-space carriers, Chern/Stiefel–Whitney/Pontryagin classes, principal curvature and the Chern–Weil map.
- For `e(TM)[M]=χ(M)`, name the comparison of a tangent-bundle orientation with `HomologicalOrientation` as the missing link, not the Euler or fundamental class.
- State the two headlines above with `sorry`.

## R06 (P2) — C6.1, C7.1 and `Suggested.lean` restate the pinned characteristic series and genus polynomials

Location: `README.md:1824–1832`: "The formal carriers are `toddSeries`, Mathlib's `bernoulli'PowerSeries ℚ` … and `lSeries`, the rescaling of Todd's series by 2 minus X … prove `lSeries_even`". Also `:1907–1928`, and `Suggested.lean:49–64` (`chernRootValue`, `pontryaginRootValue`, `toddSeries`, `lSeries`).

Claim: the pinned `RingTheory/PowerSeries/CharacteristicSeries.lean` defines:
- `TauCeti.hirzebruchLSeries A := rescale 2 (bernoulliPowerSeries A) + X` (line 245), with the quotient `hirzebruchLSeries_mul_sub` (261), evenness `rescale_neg_one_hirzebruchLSeries` (296) and the coefficients (249, 317, 324);
- `TauCeti.aHatSeries` (147).

`GenusPolynomials.lean` has Td₂ = (1/12)(X₀² + X₁) (`multiplicativeSequence_bernoulli'PowerSeries_two`, 72) and L₂ = (1/45)(7X₁ − X₀²) (`multiplicativeSequence_cartier_hirzebruchLSeries_two`, 121). `MultiplicativeSequence.lean` has `PowerSeries.multiplicativeSequence` (110) and `multiplicativeSequence_three_right` (373). `chernRootValue` and `pontryaginRootValue` are the `esymm` evaluations behind `mk_aeval_multiplicativeSequence` (160) and `aeval_multiset_esymm_sq_multiplicativeSequence` (300).

Witness: in a scratch probe, `theorem lSeries_eq_hirzebruchLSeries : lSeries = TauCeti.hirzebruchLSeries ℚ` is proved coefficientwise without `sorry`. At n = 1, both sides are 0; for n ≥ 2, `bernoulli n = bernoulli' n`. `lSeries_even` then follows by `exact TauCeti.rescale_neg_one_hirzebruchLSeries ℚ`.

Repair: in C6.1 and C7.1, cite these declarations by name and file. Keep as targets only:
- the degree-twelve L₃;
- the bundle classes Td(E), L(E), Â(E) with their Whitney laws on actual bundles;
- the Chern character.

Delete the four definitions from `Suggested.lean`; R07 covers the theorems.

## R07 (P3) — the five sorried theorems are not headline theorems

Location: `Suggested.lean:68` (`lSeries_even`), `:76` (`twice_even_product_correction_eq_zero`), `:88`, `:100` and `:112` (the three root-coefficient theorems).

Claim: none of the five names an object of the roadmap.
- `lSeries_even` is the pinned evenness (R06).
- The Td₂ and L₂ root forms are the pinned genus polynomials evaluated through `mk_aeval_multiplicativeSequence`.
- The degree-six identity computes one value: q₃ = 2⁶B₆/6! = 2/945, and `multiplicativeSequence_three_right` gives (62p₃ − 13p₁p₂ + 2p₁³)/945.
- `twice_even_product_correction_eq_zero` is algebra on its own hypothesis about two arbitrary power series.

The one-tactic probe (`rfl`, `simp`, `simp [PowerSeries.coeff_mul]`, `simp [chernRootValue]`) closes none of them, so they are not one-line padding. The headline rule excludes them anyway.

Witness: the elaborated type of `twice_even_product_correction_eq_zero` (worker's `signatures.md`) mentions only `PowerSeries R`, `coeff` and `Finset.range`.

Repair: delete the five theorems from `Suggested.lean`. The README keeps the L₃ identity (C7.1) and the 2-torsion correction (C3.3) as targets. C3.3 lines 1191–1195, C6.1 lines 1826–1832 and C7.1 lines 1910–1928 must then stop naming the Lean declarations, since a backticked name of this roadmap's own must be declared in `Suggested.lean`.

## R08 (P3) — C5.1 consumes the Chevalley restriction under LieHighestWeight's planned names when the pin has the objects

Location: `README.md:1432–1440`: "Its `lieInvariantSymmetricAlgebra`, `lieCartanRestriction`, `lieChevalleyRestrictionIso` and `lieChevalleyRestrictionIso_coe` give the actual restriction isomorphism". Also `killingSymmetricEquiv_cartan_restriction` and `killingSymmetricEquiv_lie`, and `:1420–1422` (the invariant form, owned here).

Claim: at the pin these objects are:
- `LieSubalgebra.lieChevalleyRestrictionIso` (`Algebra/Lie/HighestWeight/ChevalleyRestriction.lean`), with `coe_lieChevalleyRestrictionIso_apply`;
- `TauCeti.lieCartanRestriction` (`Algebra/Lie/Killing/CartanRestriction.lean:203`);
- `TauCeti.killingSymmetricEquiv` (`Killing/SymmetricAlgebra.lean:60`).

`lieInvariantSymmetricAlgebra` and the `_coe` and `_lie` variants are LieHighestWeight L7 plan names. What exists at the pins is cited by its pinned name.

Witness: `grep -rn 'def lieCartanRestriction'` in pinned Tau Ceti finds `CartanRestriction.lean:203`; `lieInvariantSymmetricAlgebra` is absent from the pin.

Repair: consume the pinned names with their hypotheses: an algebraically closed field of characteristic zero, a nondegenerate Killing form and a splitting Cartan subalgebra, which the semisimple complex summand meets. Cite LieHighestWeight L7 only for what the pin lacks. #1807's C5.1 is this repair.

## R09 (P3) — four sampled targets have no locator, and the Cartan and Chern–Simons citations are absent from the manifest

Location: `README.md:1505–1574` (C5a.1), `:1576–1601` (C5a.2), `:1747–1776` (C5a.6) and `:1778–1812` (C5a.7). Also `:1610–1611`, `:1637–1638`, `:1657` and `:1721` (Cartan 1950 and Chern–Simons 1974), and References `:2125–2126`.

Claim: C5a.1, C5a.2, C5a.6 and C5a.7 name no theorem, section or page of any source. `packages/CharacteristicClasses/sources.toml` has thirteen entries, none for Cartan's Colloque paper or Chern–Simons, so those citations are neither certified nor recorded as `uncertified`. Certified sources already in the manifest carry the missing locators. They were checked at their lines this round:
- dupont-ln Proposition A2 (line 2627), Proposition A7 (2713) and Theorem A8 (2752), for C5a.1;
- dupont-ccc Proposition 8.3 (line 3548, printed p. 115), for C5a.2;
- dupont-ccc Corollary 8.35 (3989, p. 130), for C5a.6;
- hatcher-at Corollary 4D.3 (18734) and the §3.G table (14232 for SU(n), 14239 for E8, p. 326), for C5a.7;
- alekseev-meinrenken §3.1, pp. 9–10 (lines 343–373), for C5a.3's Weil algebra: it is the Koszul algebra `Sg*⊗∧g*`, and its basic subcomplex `(Sg*)^inv` has zero differential. The manifest records this source for C5a.3, but the README never cites it.

Witness: `grep -c 'cartan\|chern-simons' packages/CharacteristicClasses/sources.toml` is 0. `grep -ci alekseev TauCetiRoadmap/CharacteristicClasses/README.md` is 0.

Repair:
- Add the locators above at the claims.
- Add alekseev-meinrenken §3.1 to C5a.3, and dupont-ccc Theorem 8.1 (line 3514, p. 114) and hatcher-at Theorem 3C.4 (Hopf) to C5a.4–C5a.5.
- Record `cartan-1950` (Colloque de topologie, Bruxelles 1950) and `chern-simons-1974` (Ann. of Math. 99, DOI 10.2307/1971013) in the manifest as `uncertified`, cited by locator.

## R10 (P3) — the sampled targets have no Checks and no `*Needs:*` lines, and the README lacks the house shape

Location: C1.0 (`README.md:218–252`), C2.0 (`:790–860`) and C5a.1–C5a.7 (`:1505–1812`). Each defines objects (frame bundles and the metric transport; the disk/sphere relative CW structure; `j`, `A_forms`, `A_CE` and `H`; the Weil algebra and `CS_P`; the Koszul model `K_I`) but has no **Checks.** list and no `*Needs:*` line.

Claim: the README has 5 **Checks.** blocks and 1 `*Needs:*` line (754) in 2131 lines, and no `### Examples` or `### Dependencies` section. It also has no `# Roadmap:` title, `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts` or `## How to read the build`. Every definition needs at least three discriminating Checks.

Witness: `grep -c '\*\*Checks\.\*\*' README.md` gives 5 and `grep -c '### Examples' README.md` gives 0. Neither C5a.1 nor C2.0 contains "Checks".

Repair: give each sampled target three Checks and a `*Needs:*` line. Values computed in the table below can be used:
- C1.0: H = diag(1,4) transports e₂ to e₂/2 with h₁-norm 1; H₁^{1/2}H₂^{1/2} is not symmetric for non-commuting H₁ and H₂; rank 0 has a singleton frame.
- C2.0: rank 0 gives S(E) = ∅ and Thom model X₊; TS² with cells 0, 2 gives Thom cells 2, 4; the sup-ball map sends (1,1) to (1,1)/√2.
- C5a.1: da(X,Y) = −a([X,Y]) against Mathlib's `d₁₂_apply_apply_ofTrivial`; H¹(SU(2)) = 0; all CE differentials of a torus vanish.
- C5a.3: τ(−a/2π) = −θ/2π; F₁ = Ω and F₀ = 0.
- C5a.6: SU(2) has Poincaré series 1+t³ and U(2) has (1+t)(1+t³).
- C5a.7: the E8 odd degrees sum to 248.

Rename the headings to the house shape when the folder is next rewritten.

## R11 (P3) — the pull request edits two files outside the roadmap folders this review lists

Location: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (three lines).

Claim: `git diff --stat origin/main...HEAD`, excluding the seventeen folders named for this pull request, lists these two files. The gate fails `outside-folder=2`, and there is no acceptance while the gate fails. `roadmaps list` does list ArithmeticDirichletSeries and SymplecticGeometry among #1854's roadmaps, so the edits may be intended as this pull request's own. But the gate's folder set does not include them.

Witness: gate output "outside-folder (2): Completed/ArithmeticDirichletSeries/README.md, TauCetiRoadmap/SymplecticGeometry/README.md".

Repair: either move the two loop-cut sentences to their own pull request, or have SymplecticGeometry and Completed/ArithmeticDirichletSeries recognised as folders of this pull request, so that the gate's outside-folder count is 0.

## R12 (P3) — this folder is an older copy of #1807's, and the order with #1808, which also changes it, is wrong

Location: pull request description, merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

Claim: CharacteristicClasses is changed by #1807 (ac36c47), #1808 (6931121) and this pull request. This head's CharacteristicClasses commits are all in #1807's history (`git merge-base --is-ancestor 74e527e8 70140e6` is true), and this pull request adds none. A three-way merge of this head's two files with #1807's current files, against main's, gives 16 conflict hunks in `README.md` and 3 in `Suggested.lean`. The worker's `overlaps.md` reports that #1808 and #1854 conflict in `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean`, so "independent" is false for this folder. #1808's head still has five HomotopySpheres lines.

Witness: `roadmaps list` shows #1807 (ac36c47), #1808 (6931121) and #1854 (c9c60d0), each carrying CharacteristicClasses; `overlaps.md` names the #1808/#1854 conflict in both CharacteristicClasses files.

Repair: rebase this branch on #1807 once #1807 merges, or merge #1807's current head now, so that CharacteristicClasses drops out of this pull request's diff apart from R03's four AT-name edits. Then state in the merge-order paragraph which of #1808 and this pull request is rebased on the other.

## Previous findings (r36, read at #1807 70140e6)

- **R01 (HomotopySpheres): not repaired.** The same five lines are 24–27, 277, 383, 463 and 465 here; now R02.
- **R02 (docstring and absent headlines): not repaired.** `Suggested.lean` is unchanged; now R05. r36's mention of a pinned `CovariantDerivative.curvatureOperator` does not hold at Mathlib 1b1ccf4b (no curvature declaration under `Geometry/Manifold/VectorBundle/CovariantDerivative/`), and R05 corrects it.
- **R03 (C1.0, C2.0, C2.1–C2.2, line 84 pinned): not repaired**, and C1.1a is added because this head constructs the pinned `finiteOrientedGrassmannian`; now R04.
- **R04 (series restated): not repaired**; now R06.
- **R05 (five theorems not headlines): not repaired**; now R07.
- **R06 (C5.1 planned names): not repaired**; now R08.
- **R07 (TopK T1.1 and `FiniteRankAtlas`): not applicable at this head.** This pull request's TopK T1 item 1 (`TauCetiRoadmap/TopologicalKTheory/README.md:173–176`) names "the actual point-indexed `FiniteRankAtlas X`", so C7.3a's citation at lines 2056 and 2074 resolves here.
- **R08 (locators and manifest): not repaired**; now R09.
- **R09 (order between #1807 and #1854): partly repaired.** The description now puts #1807 first; the #1808 order is R12.

## Verified sound

**Gate and build.** Worker's gate at c9c60d0: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=5 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`. The failures are R02 and R11.

`lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean`: exit 0; the only warnings are `declaration uses sorry` at 68:8, 76:8, 88:8, 100:8 and 112:8. The file has a single `public import Mathlib`, no `set_option`, no sorried data, `theorem` only, and 123 lines.

Dependency check, run this round:

```text
depcheck: 238 roadmaps, 2451 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. CharacteristicClasses is on main and not in `ORDER.txt`. R01 is a cycle the check does not see.

**Signatures.** `signatures.md` lists 11 entries. Two of them (`,` and a backtick, at its lines 125 and 132) are artefacts of the worker's own `#check` file. The nine real declarations carry every binder in their own signatures (`[CommRing A] [Algebra ℚ A] {r} (x : Fin r → A)`; `[CommRing R] (P Q) (hodd) (k)`), so no section variable can be lost. Each elaborated type matches its README sentence (C6.1 1824–1832, C3.3 1191–1195, C7.1 1910–1928).

**Probe** (scratch file importing Mathlib and the pinned Tau Ceti modules): `lSeries = TauCeti.hirzebruchLSeries ℚ` and `lSeries_even` were proved from the pin with no `sorry`. The one-tactic probes leave goals: the antidiagonal sum for the 2-torsion theorem, and `12⁻¹ • …` for the Todd root form. 22 `#check`s of pinned names all resolve.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b, file and line):
- Euler, Thom and orientation: `IsThomClass` (EulerClass.lean:245), `eulerClass` (356), `eulerClass_eq_zero_of_forall_ne_zero` (383), `VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` and `exists_isThomClass` (Orientation/ThomClass.lean, compact base), `exists_isThomClass_of_compactSpace` (MayerVietoris/Basic.lean:612), `signLocalSystem` (Orientation/LocalSystem.lean:75), `trivializationHomeomorph` and `isCoveringMap_proj` (Orientation/Cover.lean:262, 298), `toOrientationCover_eq_toOrientationCover_iff` (Orientation/OrthonormalFrame.lean:120), `OrthonormalFrameBundle` (OrthonormalFrame/Basic.lean:109), `finiteOrientedGrassmannian` (Grassmannian/Oriented.lean:44) and `encard_univ_fullRank`, `t2Space_totalSpace` (FiberBundle/Separation.lean:37).
- Serre fibrations: `serreFibrations` (SerreFibration/Basic.lean:107), `mem_serreFibrations_of_exists_trivialization` (FiberBundle.lean:365), `mem_serreFibrations_proj` (395), `hasHomotopyLiftingProperty_cube_of_exists_trivialization` (325).
- Series: `hirzebruchLSeries` (CharacteristicSeries.lean:245), `rescale_neg_one_hirzebruchLSeries` (296), `aHatSeries` (147), `multiplicativeSequence` (MultiplicativeSequence.lean:110), `multiplicativeSequence_three_right` (373), `multiplicativeSequence_bernoulli'PowerSeries_two` (GenusPolynomials.lean:72), `multiplicativeSequence_cartier_hirzebruchLSeries_two` (121).
- Lie theory and spin: `LieSubalgebra.lieChevalleyRestrictionIso`, `lieCartanRestriction` (CartanRestriction.lean:203), `killingSymmetricEquiv` (Killing/SymmetricAlgebra.lean:60), `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` (Spin/Covering.lean:108), `realSpinThreeEquivQuaternionUnitary` (Spin/Real/Three.lean:192), `pathConnectedSpace_realCliffordSpinGroupZero_add_two` (Spin/Connected.lean), `realCliffordSpinLastLocalSection` (Spin/SphereSection.lean).
- Homotopy and homology: `hasHomotopyExtensionProperty_base` (Extension/CWComplex.lean:142), `HasHomotopyExtensionProperty.image` (Extension/Basic.lean:275), `ContinuousMap.IsWeakHomotopyEquivalence.isIso_singularHomologyMap` (WeakHomotopyEquivalence.lean:110), `HomologicalOrientation` (Orientation/Homological.lean:75), `evalFundamentalClass` (FundamentalClass.lean:88), `cwEulerChar` (EulerCharacteristic/Basic.lean:64).
- Mathlib: `d₁₂_apply_apply_ofTrivial` (Algebra/Lie/Cochain.lean:118), `exists_embedding_euclidean_of_compact` (WhitneyEmbedding.lean:132), `sSetTopAdj` (SingularSet.lean), `cechComplexFunctor` (Sites/SheafCohomology/Cech.lean:65), `esymmAlgEquiv` (Symmetric/FundamentalTheorem.lean:341).
- Absent at the pin: `FiniteRankAtlas` (a TopK plan name), `relativeCWPushout`, `simplicialRealizationCW`, `supBallEuclideanDiskHomeomorph`, `homotopyPushoutGluingComparison`, a relative cup product, and a curvature declaration.

**Cross-roadmap citations resolved:**
- At this head:
  - AlgebraicTopology Stages 2.5 (552), 4.5 (133, 821–860, `relativeCWPushoutCWModel` at 910), 4.7 (1064), 4.8 (1091), 5.5 (1249), 8.1–8.12 (Stage 8 items 1–12, including 8.8b by 7 mentions);
  - TopologicalKTheory T1.1 (173), T1.5 (236), T1.5a (307), T1.6a (381), T1.6b–d (515, 607, 657), T6.4, T3.4 (833);
  - GeneralizedCohomology G4.0a (1782–1783);
  - ComplexKahlerGeometry K4 (444), K7.1 (291), K7.2;
  - MorseNovikov N6 (808, 852).
- On main 665b395:
  - SpinGeometry G4.1a, G4.1b, G4.3, G4.4 (397, 425, 52–53). This makes the `overlaps.md` lead "G4.1a only at #1674" false, so it is not a finding.
  - LieGroups Layer 5's SU(2)→SO(3) cover (479–485).

`roadmaps resolve` found nothing unresolved, but it misses R03 because main still has the old AlgebraicTopology names.

**Ownership.** `roadmaps grep` over the open heads was run for "Weil algebra", "Chern–Weil map/homomorphism/isomorphism", "Thom isomorphism", "Gysin sequence", "H*(BU(", "Stiefel–Whitney class" and `finiteOrientedGrassmannian`. Outside the three copies of this folder (#1807, #1808, #1854), only consumers cite these objects: TangentialBordism (lines 45, 88, 267), StringOrientation (80, 210) and DGFloer (282, 744, 781). None restates them. One cross-roadmap note, which is not CharacteristicClasses' object: DGFloer's head (line 962) still says CharacteristicClasses consumes its `connectedMapHomologyComparison`, while this README consumes AT 4.8 and AT 4.8 also owns the connected-map comparison. That double ownership is for the AlgebraicTopology and DGFloer reviews.

**Sources read at their locators** (cache line numbers):
- hatcher-vbkt (printed page = cache page − 4):
  - Proposition 1.3 with the Gram–Schmidt step, lines 488–508 (§1.1, p. 12);
  - disk and sphere bundles, 636–647 (§1.1, p. 16);
  - Gram–Schmidt deformation retraction GL_n(ℝ) → O(n), 1017–1033 (§1.2, p. 26, header "Section 1.2" on p. 27);
  - Thom class of (D(E),S(E)) and the Euler class as its zero-section restriction, 3426–3443 (§3.2, p. 88).
- dupont-ccc:
  - Chapter 4 Exercise 3, (4.15)–(4.17), lines 2247–2264, with `TP(θ) = k∫P(θ∧U_s^{k−1})` and `U_s = sΩ + ½(s²−s)[θ,θ]`;
  - Theorem 8.1, 3514 (compact G, `I(G) ≅ H*(BG;ℝ)`, p. 114);
  - Proposition 8.3, 3548;
  - Corollary 8.35, 3989.
- dupont-ln: Proposition A2 (2627), Proposition A7 (2713), Theorem A8 (2752).
- alekseev-meinrenken: §3.1, 332–373.
- hatcher-at: Theorem 3C.4 (12343), Corollary 4D.3 (18734), §3.G table (14230–14239, with "degree" = |y|/2 at 14221).
- zentner-instanton-sheet2: Exercise 2, lines 45–61.

Each supports the statement as written at the sampled targets, with the reservation in Source issues.

**Adversarial table** (values computed this round; the sampled targets, the five Lean theorems, and the targets the findings touch):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `lSeries_even` (L68) | coefficients n = 0, 1, 2, 3 | `lSeries`: 1; 2·(1/2) − 1 = 0; 4·(1/6)/2 = 1/3; 0. `hirzebruchLSeries`: 1; 2·(−1/2) + 1 = 0; 1/3; 0 | true; equal to the pinned series (probe) |
| `twice_even_product_correction_eq_zero` (L76) | k = 0; k = 1; without `hodd` | P₀Q₀ − P₀Q₀ = 0; (P₀Q₂+P₁Q₁+P₂Q₀) − (P₀Q₂+P₂Q₀) = P₁Q₁, and 2P₁Q₁ = 0 by `hodd 0`; over ℤ with P = Q = 1+X: 2·(1 − 0) = 2 ≠ 0 | true; hypothesis needed; free-variable algebra (R07) |
| `toddSeries_root_coefficient_two` (L88) | r = 0, 1, 2 | 0 = 0; x²/12 = x²/12; (x₁²+x₂²)/12 + x₁x₂/4 = (e₁² − 2e₂ + 3e₂)/12 = (e₁²+e₂)/12 | true; pinned Td₂ |
| `lSeries_root_coefficient_four` (L100) | r = 1, 2, with y = x² | −y²/45 = (0 − y²)/45; −(y₁²+y₂²)/45 + y₁y₂/9 = (−P₁² + 2P₂ + 5P₂)/45 | true; pinned L₂ |
| `lSeries_root_coefficient_six` (L112) | q₃; power sums; CP⁶ | q₃ = 64·(1/42)/720 = 2/945; [2(P₁³ − 3P₁P₂ + 3P₃) − 7(P₁P₂ − 3P₃) + 35P₃]/945 = (2P₁³ − 13P₁P₂ + 62P₃)/945; P = (7, 21, 35): (2170 − 1911 + 686)/945 = 1 = σ(CP⁶) | true; small value (R07) |
| C1.0 metric transport | H = diag(1,4); non-commuting H₁ = diag(4,1), H₂^{1/2} = [[a,b],[b,c]] with b ≠ 0 | h₁(H^{−1/2}e₂, H^{−1/2}e₂) = 4·(1/2)² = 1; Sylvester sums 1+1, 1+2, 2+2 > 0; H₁^{1/2}H₂^{1/2} = [[2a,2b],[b,c]] not symmetric | correct; the "need not compose" caveat is needed |
| C1.0 cover = frames/SO(n) | pinned iff; n = 1 | same point ⇔ q = op g • p with det g > 0; O(1)/SO(1): ±e give 2 points | agrees; owned by the pin (R04) |
| C1.0 Hatcher locators | p. 12, p. 26 | Proposition 1.3 Gram–Schmidt step (488–506); GL_n → O(n) retraction (1019–1030) | supported |
| C1.1a finite oriented carrier | r = N; r = 0; sign of the added line | pinned `encard_univ_fullRank` = 2, README "two orientations"; pin excludes r = 0, README uses a point; (−1)^{n−1}: n = 2 → −1 (swap), n = 3 → +1 (3-cycle) | correct; duplicates the pin (R01, R04) |
| C2.0 cells | rank 0; TS² over S² (cells 0, 2); v = (1,1) | S(E) = ∅, D(E) = X, Thom model X₊; Thom cells 2, 4, so H̃*(Th) = ℤ in 2 and 4, matching the Thom isomorphism; ‖v‖∞/‖v‖₂ = 1/√2, image norm 1 = ‖v‖∞ | correct |
| C2.0 Hatcher locators | p. 16; p. 88 | S(E), D(E) for a metric (636–641); Thom class of (D(E),S(E)) (3428–3433) | supported |
| C2.0 Hausdorff total space | pinned instance | `t2Space_totalSpace [T2Space B] [T2Space F]` | owned by the pin (R04) |
| C2.1 Thom class | B = pt with o = ω or −ω; K = 𝔽₂ | restriction g or −g; −g = g, so orientation is irrelevant | consistent with the pinned statement |
| C2.2 Euler iff | TS²; S²×ℝ²; su(F) on HP¹; oriented rank 1 | e = 2 ≠ 0, no section; e = 0, constant section; rank 3 over dim 4: e ∈ H³(S⁴) = 0 but no section; unit section, e = 0 | dimension hypothesis necessary and stated |
| C3.3 Whitney correction | L ⊕ L on ℝP⁴ | Σp_ap_b = 0 since p(L) = 1; correction −c₁(L_ℂ)² = −y² ≠ 0 in H⁴(ℝP⁴;ℤ) = ℤ/2 | detects the correction |
| Conventions: Euler form | block [[0,−α],[α,0]] | Pf([[0,a],[−a,0]]) = a with a = −α gives −dα/2π; complex curvature i dα, so c₁ = (i/2π)(i dα) = −dα/2π | e = c₁, as stated |
| C5a.1 CE degree one | (da)(X₀,X₁) | (−1)^{0+1}a([X₀,X₁]) = −a([X,Y]); Mathlib `d₁₂ f x y = −f⁅x,y⁆` | agree |
| C5a.1 Koszul identity | degree 1 | (L_Xa)(Y) − (L_Ya)(X) = −a([X,Y]) + a([Y,X]) = −2a([X,Y]) = 2da(X,Y) | `2d = Σe^a∧L_{e_a}` holds |
| C5a.1 H¹(K;ℝ) | SU(2); torus | [g,g] = g gives H¹ = 0 = H¹(S³); bracket 0 gives d = 0 and H* = Λg* | `ann([g,g])` correct |
| C5a.2 rational structure | θ ↦ exp(iθ); U(2) | dχ(a) = ia, (i/2π)(ia) = −a/2π; rank 2 with d = 1, 2 gives weights 2, 4 | agrees with Conventions 189–191 |
| C5a.3 Weil curvature | θ_t = tθ; t = 0, 1; rank one | t(Ω − ½[θ,θ]) + ½t²[θ,θ] = tΩ + ½(t²−t)[θ,θ] = Dupont's U_s; F₀ = 0, F₁ = Ω; CS = P(θ) = −θ/2π | agree |
| C5a.3 Bianchi sign | d_WΩ | dΩ = [Ω,θ] = −(−1)^{2}[θ,Ω] = −[θ,Ω] | as stated |
| C5a.4 Koszul model | SU(2); trivial group | d = 2, \|e\| = 3, Λ(e₃) = H*(S³); empty system gives ℝ | consistent |
| C5a.5 transgression page | z_i ∈ E^{0,2d_i−1} | d_{2d_i} lands in E^{2d_i,0}; π₁(BK) = π₀(K) = 0 | well formed |
| C5a.6 Poincaré series | SU(2), U(2), SU(3), trivial | 1+t³; (1+t)(1+t³), Betti 4 = 2², top 4; (1+t³)(1+t⁵), top 8; P(−1) = 0; trivial: 1, χ = 1 | agree; Σ(2d_i − 1) = 2N + r = dim K |
| C5a.7 degrees | U(n), SU(n), E8 | Σ_{d=1}^n(2d−1) = n²; n² − 1; 3+15+23+27+35+39+47+59 = 248; Hatcher table 2,8,…,30 (14239) | agree |
| C5a.7 exercises | SU(2)/N(T); strict upper triangular, n = 2 | ℝP²: H⁰ = ℤ, H¹ = 0, H² = ℤ/2; 1-dimensional abelian, centre g ⊄ [g,g] = 0 | counterexample holds |
| C7.AdjointHopf basis and decomposition | three matrices; Z = diag(1,−1) | each A* = −A with trace 0; X = 0, Y = (Z+Z*)/(2i) = diag(−i,i), X + iY = Z | correct |
| C7.AdjointHopf p₁ | roots 0, x−y, y−x | e₂ = −(x−y)², p₁ = −c₂ = (x+y)² − 4xy = c₁² − 4c₂; Zentner line 50 | agree |
| C7.AdjointHopf on HP¹ | c₁ = 0, ⟨u,[HP¹]⟩ = 1 | ⟨p₁,[HP¹]⟩ = −4; e ∈ H³(S⁴) = 0; w₁, w₂, w₃ = 0; ε¹ ⊕ P gives p₁ = e(P)² = 0, a contradiction | no section, not stably trivial |
| C6.1/C7.1 series coefficients | Td coefficient 2; L coefficient 4 | B'₂/2! = (1/6)/2 = 1/12; 2⁴B₄/4! = 16·(−1/30)/24 = −1/45 | agree with the pinned coefficients (R06) |

## Not verifiable

- Milnor–Stasheff §§9–15, 18–19 and Appendix C, including Theorem 15.3 and Lemma 18.1 (C2.0's Thom-space cells); Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3; Bott–Tu §§6, 11–14, 20–23. All are settled `uncertified` in the manifest and cited by locator; the texts were not read.
- Cartan 1950 (C5a.3–C5a.5) and Chern–Simons 1974 (C5a.3) are not in the manifest, and no legal open copy is known. The Weil-algebra, transgression and `I(g) ≅ H*(BK;ℝ)` statements were checked against alekseev-meinrenken §3.1 and dupont-ccc Chapter 4 Exercise 3 and Theorem 8.1 instead (R09).
- tom Dieck 14.4.3 (C1.1b) is outside the sample and was not read this round.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, page 1: the source calls the endomorphisms defining su(E) "skey-adjoint"; it should be "skew-adjoint"; affects nothing.
- **Gap** in zentner-instanton-sheet2 at Exercise 2(b), page 2: the hint derives the integral identity p₁(su(E)) = c₁² − 4c₂ through the Chern character, which determines classes only modulo torsion; it should use the integral splitting principle (roots 0, ±(x−y)) or assume torsion-free H⁴; affects the proof.
