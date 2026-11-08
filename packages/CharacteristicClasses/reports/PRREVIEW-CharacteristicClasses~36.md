# Review of CharacteristicClasses (pull request #1807 at 70140e6)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/CharacteristicClasses/` at this head. The previous review on file (r35) read pull request #1808 at a3b1e14, a stacked branch that includes this one; the folder at this head is not the one r35 read. Against this head's own history the folder is main's copy plus the module-system header and a 70-line edit moving the finite oriented carriers to TopologicalKTheory T1.6a (`README.md` 20–33, 255–274, 365–372, 1343–1348). It is the version that #1808's reviews r17 and r23 read before #1808 repaired it; #1808's current head (d1a45bf) carries the repaired folder (four pinned headlines, pinned frame, Thom, Euler and Chevalley names, locators), and #1854 carries this head's version. Nine findings, four blocking. The simplest repair of R02–R06 and R08 is to adopt #1808's current two files here and then apply R01, R07 and r35's R02 to them; each finding below is nevertheless stated against this head so that it can be repaired in place.

## R01 (P2) — HomotopySpheres is cited five times, twice as a supplier, and the gate refuses the name

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:25–28` ("HomotopySpheres §3A and §4A supplies the earlier compactly generated substrate and consumes these classifiers"), `:273` ("their HomotopySpheres classifier comparison"), `:379` ("Consume the CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres"), `:459–462` ("together with HomotopySpheres §4A's quaternion-conjugation dictionary S³/{±1}≃SO(3) as the only HomotopySpheres input").

Claim: HomotopySpheres is on the project's list of roadmaps never cited as suppliers, and the worker's gate at this head fails with `dropped=5` on exactly these lines (`scratch/gate.md`; `grep -n HomotopySpheres` on the two files gives these five lines and no other). Lines 379 and 459–462 consume it. Both inputs have owners this README already cites: the compact-generation coreflection is AlgebraicTopology Stage 4's at this head (`TauCetiRoadmap/AlgebraicTopology/README.md:126`, "owns the compact-generation coreflection and CW comparison"), and the double cover `Ad : SU(2) → SO(3)` with kernel `{±1}` is LieGroups Layer 5 on main (`RepresentationTheory/LieGroups/README.md:479–485`).

Witness: gate line `dropped: line 379: CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres`.

Repair (the gate's rule is a plain name match, so every occurrence must go):
- 25–28: delete "HomotopySpheres §3A and §4A supplies … finite oriented-cover comparison." and write "AlgebraicTopology Stage 4 supplies the compact-generation coreflection on which the stable colimits are formed; the stable O/SO and ΩBSO comparisons are downstream consumers, not inputs to the finite oriented-cover comparison."
- 273: "colimits and their classifier comparison."
- 379: "Consume AlgebraicTopology Stage 4's compact-generation coreflection, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, with its counit;".
- 459–462: "together with LieGroups Layer 5's double cover `Ad : SU(2) → SO(3)` with kernel `{±1}` and the identification of `SU(2)` with the unit quaternions `S³`. Prove π₂(SO(k))=0 for every k: …".
After these edits `dropped` is 0.

## R02 (P2) — the docstring's "not statable" list is false at the pin, and two statable headlines are absent

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:12–32` ("there is no Thom-class carrier, no bundle disk/sphere cell structure and no orientation local system on a vector bundle at the pins", "there is no Euler class and no fundamental class of a manifold at the pins", "no curvature form on a principal bundle").

Claim: at Tau Ceti 2fd255d9 (the pin of this worktree's `lake-manifest.json`) all of the following elaborate from a scratch importer (`scratch/Probe1.lean`, 25 `#check` lines, exit 0 apart from one namespace slip corrected below):
- `TauCeti.IsThomClass F E u` (`Topology/VectorBundle/EulerClass.lean:245`), a predicate on classes of `(thomPair F E).singularCohomology R k M (finrank ℝ F)`;
- `TauCeti.eulerClass R k M F E n` (`EulerClass.lean:356`) and `TauCeti.eulerClass_eq_zero_of_forall_ne_zero` (`:383`): a continuous nowhere-zero section kills every Euler class;
- `TauCeti.VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` (`Topology/VectorBundle/Orientation/ThomClass.lean:121`, `[CompactSpace B]`) and `TauCeti.VectorBundleOrientation.exists_isThomClass` (`:186`): an oriented bundle over a compact base has a Thom class with coefficients in any commutative ring; `TauCeti.exists_isThomClass_of_compactSpace` (`MayerVietoris/Basic.lean`) for rings with a single unit;
- `TauCeti.VectorBundleOrientationCover.signLocalSystem F E R hι : LocalCoefficientSystem R B` (`Orientation/LocalSystem.lean`), the README's `o(E)` of line 171;
- Mathlib's `CovariantDerivative.curvatureOperator` (curvature of a connection; what is absent is de Rham cohomology on bundles and the de Rham/singular comparison, not the curvature form).

Genuinely absent (searched at the pin): a relative cup product on `TopPair` (so the Thom isomorphism and the Gysin sequence are not statable), an Euler characteristic of a space, any infinite Grassmannian or `BU(r)` carrier, Chern, Stiefel–Whitney and Pontryagin classes, a Chern–Weil map.

Statable and absent: C2.1's general-base Thom-class existence and uniqueness (README 858–882; the pinned theorem has `[CompactSpace B]`, the roadmap's content is the general base) in the shape of `exists_singularCohomology_thomPair_fiber`, and C2.2's primary-obstruction theorem (README 890–895: rank n ≥ 2 over a CW base of dimension ≤ n, `e=0` iff a nowhere-zero section exists), statable on `TauCeti.eulerClass` with `Topology.CWComplex` and `Topology.RelCWComplex.cell`. #1808's current `Suggested.lean` states both (`existsUnique_singularCohomology_thomPair_fiber` line 122, `exists_isThomClass_of_orientation` 146, `eulerClass_eq_zero_iff_exists_ne_zero` 162) and r35 elaborated them.

Repair: replace lines 12–37 by a docstring naming the carriers that exist and what is still missing (relative cup, Euler characteristic, classifying-space carriers, characteristic classes, Chern–Weil map, de Rham comparison); state the two headlines above with `sorry` (the forms in #1808's file elaborate at this pin); keep the Thom isomorphism, the Gysin sequence, `e(TM)[M]=χ(M)`, the universal rings, Borel and the Hopf theorem in the not-statable list with the correct reasons.

## R03 (P2) — C1.0, C2.0 and C2.1–C2.2 plan objects the pinned Tau Ceti has, and line 84 says the library lacks what it has

Location: `README.md:84–85` ("The pinned Tau Ceti has no Serre-fibration declaration; these are supplier targets, not library theorems"); `:219–232` (C1.0, "construct the orthonormal frame principal O(n) bundle by Gram–Schmidt … continuity, local chart/trivialization and division equations, freeness and transitivity on each fibre, reconstruction of the vector bundle as the associated standard module"); `:248–250` ("identify the determinant-sign orientation double cover with the frame quotient by SO(n), prove its local two-sheet description"); `:802–805` ("Prove the native bundle total space is Hausdorff from the Hausdorff base, finite-dimensional Hausdorff fibers and local trivialization charts"); `:858–895` (C2.1–C2.2).

Claim, each checked at the pin by `#check` or by file and line:
- `TauCeti.TopCat.serreFibrations : MorphismProperty TopCat` (`Topology/Homotopy/SerreFibration/Basic.lean:107`), `TauCeti.TopCat.mem_serreFibrations_proj` (every native `FiberBundle F E` projection) and `TauCeti.hasHomotopyLiftingProperty_cube_of_exists_trivialization` (every locally trivial map, no base hypothesis), both in `SerreFibration/FiberBundle.lean`. Line 84 is false at the pin.
- `TauCeti.OrthonormalFrameBundle 𝕜 F E V` (`Topology/VectorBundle/OrthonormalFrame/Basic.lean`, docstring lines 20–45: topology and `continuous_iff`, freeness `smul_eq_self_iff`, transitivity `exists_smul_eq_iff`, local trivializations by Gram–Schmidt `exists_trivialization`, `associatedHomeomorph`): C1.0's first paragraph.
- `TauCeti.VectorBundleOrientationCover.trivializationHomeomorph` (the local two-sheet description), `isCoveringMap_proj` (`Orientation/Cover.lean`) and `TauCeti.OrthonormalFrameBundle.toOrientationCover_eq_toOrientationCover_iff` (`Orientation/OrthonormalFrame.lean`): two frames give the same point of the cover iff they differ by `g` with `0 < det g`, the elaborated statement in `scratch/Probe1.lean`. That is C1.0's frames-mod-SO(n) identification.
- `TauCeti.FiberBundle.t2Space_totalSpace` (`Topology/FiberBundle/Separation.lean:37`, instance, `[T2Space B] [T2Space F]`): C2.0's Hausdorff sentence.
- C2.1–C2.2: the Thom existence over compact bases, Euler naturality, vanishing on a nowhere-zero section and the finite Mayer–Vietoris gluing are the declarations of R02.

Repair: replace line 84–85 by a citation of `TauCeti.TopCat.serreFibrations`, `mem_serreFibrations_proj` and `hasHomotopyLiftingProperty_cube_of_exists_trivialization` with their files, keeping Stage 5.5 for the homotopy exact sequence and the spectral sequences; in C1.0 consume `TauCeti.OrthonormalFrameBundle`, `GramSchmidt`, `VectorBundleOrientationCover` and `toOrientationCover_eq_toOrientationCover_iff` by name and keep only the metric-change square root, the smooth versions and the DifferentialGeometry comparison; in C2.0 cite the instance `TauCeti.FiberBundle.t2Space_totalSpace`; in C2.1–C2.2 consume `IsThomClass`, `eulerClass`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero`, `VectorBundleOrientation.exists_isThomClass`, `exists_isThomClass_of_compactSpace`, the Mayer–Vietoris and directed-union lemmas and `signLocalSystem`, keeping as targets the general-base existence, uniqueness, the local-system Thom isomorphism and the Gysin sequence. #1808's current README (its C1.0, C2.0, C2.1–C2.2) is this repair.

## R04 (P2) — C6.1, C7.1 and `Suggested.lean` restate the pinned series, genus polynomials and multiplicative sequences

Location: `README.md:1812–1831` ("Define `Td(x)=x/(1−e^(−x))`, `Â(x)=(x/2)/sinh(x/2)` and `L(x)=x/tanh x` as regular formal series, with the displayed quotients proved by multiplying their denominators. The formal carriers are `toddSeries` … and `lSeries` … prove `lSeries_even`"); `:1902–1926` (the Td, L, Â coefficient formulas and the root forms); `Suggested.lean:49–64` (`chernRootValue`, `pontryaginRootValue`, `toddSeries`, `lSeries`) and `:68–121`.

Claim: at the pin, `RingTheory/PowerSeries/CharacteristicSeries.lean` defines `TauCeti.hirzebruchLSeries A := rescale 2 (bernoulliPowerSeries A) + X` (line 245) and `TauCeti.aHatSeries` (147), proves the displayed quotients by multiplying the denominators (`hirzebruchLSeries_mul_sub` 261, `aHatSeries_mul_sub` 168, `bernoulli'PowerSeries_mul_one_sub_exp_neg` 101), the characterisations (`eq_hirzebruchLSeries_iff` 282), evenness (`rescale_neg_one_hirzebruchLSeries` 296, `coeff_hirzebruchLSeries_of_odd` 306) and the coefficients (`coeff_hirzebruchLSeries` 249, `coeff_two_` 317, `coeff_four_` 324). `MultiplicativeSequence.lean` defines `PowerSeries.multiplicativeSequence Q n k` (110) with `multiplicativeSequence_three_right` (373). `GenusPolynomials.lean` proves `Td₁, Td₂, Td₃` (`multiplicativeSequence_bernoulli'PowerSeries_two` line 72 is `(1/12)(X₀² + X₁)`), `L₁`, `L₂` (`multiplicativeSequence_cartier_hirzebruchLSeries_two` line 121 is `(1/45)(7X₁ − X₀²)`), `Â₁`, `Â₂`, and `expand_cartier_hirzebruchLSeries` (103) is the evenness used for the descent to `x_j²`. The file's `lSeries` is the pinned series and its evenness is the pinned lemma: `scratch/Probe3.lean` proves `lSeries = TauCeti.hirzebruchLSeries ℚ` (coefficientwise: `n=0` both `1`; `n=1`: `2·(1/2) − 1 = 0 = 2·(−1/2) + 1`; `n ≥ 2`: `bernoulli' n = bernoulli n`) and then `lSeries_even` by `rw` and `exact TauCeti.rescale_neg_one_hirzebruchLSeries ℚ`, with no `sorry`. `chernRootValue`/`pontryaginRootValue` are `MvPolynomial.esymm` evaluated at the roots and their squares, the objects `multiplicativeSequence` is built on (`mk_aeval_multiplicativeSequence`, `aeval_multiset_esymm_sq_multiplicativeSequence`).

Repair: in C6.1 and C7.1 cite these declarations by name and file (a `From Tau Ceti` list), and keep as targets only what is not there: the degree-twelve `L₃`, the bundle-level classes `Td(E)`, `L(E)`, `Â(E)` with their Whitney laws on actual bundles, and the Chern character. In `Suggested.lean` delete `chernRootValue`, `pontryaginRootValue`, `toddSeries` and `lSeries` (see R05 for the theorems).

## R05 (P3) — the five sorried theorems are not headlines

Location: `Suggested.lean:68` (`lSeries_even`), `:76` (`twice_even_product_correction_eq_zero`), `:88` (`toddSeries_root_coefficient_two`), `:100` (`lSeries_root_coefficient_four`), `:112` (`lSeries_root_coefficient_six`).

Claim: `lSeries_even` is the pinned `rescale_neg_one_hirzebruchLSeries` after the identification of R04 (closed in `scratch/Probe3.lean`). `toddSeries_root_coefficient_two` and `lSeries_root_coefficient_four` are the pinned `Td₂` and `L₂` read through `mk_aeval_multiplicativeSequence`. `lSeries_root_coefficient_six` computes one small value: with `q₁ = 1/3`, `q₂ = −1/45`, `q₃ = 2⁶B₆/6! = 64/30240 = 2/945`, the pinned `multiplicativeSequence_three_right` gives `(q₁q₂ − 3q₃) = −13/945` and `(q₁³ − 3q₁q₂ + 3q₃) = (35 + 21 + 6)/945 = 62/945`, the stated identity. `twice_even_product_correction_eq_zero` is a theorem about two arbitrary power series over an arbitrary commutative ring whose conclusion is algebra on its hypothesis: `coeff_{2k}(PQ) − Σ_{i≤k} P_{2i}Q_{2(k−i)} = Σ_{i odd} P_iQ_{2k−i}`, and twice that is `0` by `hodd`. None names an object of the roadmap. The one-tactic probe (`scratch/Probe2.lean`: `rfl`, `simp`, `simp [PowerSeries.coeff_mul]`, `simp [chernRootValue]`) closes none of the five, so they are not one-line padding, but the headline rule excludes all of them.

Repair: delete the five theorems from `Suggested.lean`; the README keeps the `L₃` identity in C7.1 and the 2-torsion correction in C3.3 as targets (C3.3 line 1187–1191 and C7.1 line 1906–1924 must then stop naming the Lean declarations). With R02 the file states the two Thom and Euler headlines and otherwise says what is not statable.

## R06 (P3) — C5.1 consumes Chevalley restriction under LieHighestWeight's planned names and restates a pinned invariant form

Location: `README.md:1427–1436` (`lieInvariantSymmetricAlgebra`, `lieChevalleyRestrictionIso_coe`, `lieChevalleyRestrictionIso_mem_homogeneous_iff`, `killingSymmetricEquiv_cartan_restriction`, `killingSymmetricEquiv_lie`); `:1416–1420` ("Own here the compact reductivity inputs that LieGroups does not state: the Ad-invariant positive form on g by CompactGroups Layer 0's Haar averaging").

Claim: the five names are LieHighestWeight L7's planned names on main (`RepresentationTheory/LieHighestWeight/README.md:981–1067`), so the citation resolves, but the objects exist at the pin under other names, and what exists at the pins is cited, not planned through a supplier: `LieSubalgebra.lieChevalleyRestrictionIso : lieInvariants K L L ≃ₐ[K] linearInvariants H` (`Algebra/Lie/HighestWeight/ChevalleyRestriction.lean:151`) with `coe_lieChevalleyRestrictionIso_apply` (163) and `lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`; `TauCeti.lieCartanRestriction` (`Killing/CartanRestriction.lean:203`, surjective at 232, homogeneous at 238); `TauCeti.killingSymmetricEquiv` (`Killing/SymmetricAlgebra.lean:60`) with `map_killingSymmetricEquiv_lieInvariants` (110). The Ad-invariant positive form is the specialisation to `Ad` of the pinned `ContRepresentation.isUnitarizable` (`RepresentationTheory/Compact/Unitarizable.lean`, over any `RCLike` field).

Repair: consume the pinned names above by name, with their hypotheses (algebraically closed field of characteristic zero, nondegenerate Killing form, splitting Cartan subalgebra, which the semisimple complex summand meets); replace the own-input invariant form by `ContRepresentation.isUnitarizable` applied to LieGroups Layer 1's `Ad`; cite LieHighestWeight only for what the pin lacks. #1808's current C5.1 (its lines 1531–1577) is this repair.

## R07 (P3) — C7.3a cites a TopologicalKTheory id and name that this pull request's own TopologicalKTheory head no longer has

Location: `README.md:2052–2053` ("apply TopK T1.1's FiniteRankAtlas reconstruction and its actual bundle isomorphism to TM and ν_f"); `:2071` and `:2095` ("TopK T1.1–T1.3/T1.5–T1.6").

Claim: `TauCetiRoadmap/TopologicalKTheory/README.md` at this head (rewritten by this pull request, commit 3e107fa1) contains neither the label `T1.1` (its T1 items are labelled `T1.5a`, `T1.6a`–`T1.6d`; `grep -n 'T1\.1[^0-9]'` is empty) nor the name `FiniteRankAtlas` (`grep -c FiniteRankAtlas` is 0; main's copy has it at lines 37 and 168). At this head TopologicalKTheory consumes the pinned `TauCeti.FiniteRankBundleCore 𝕜 X` (`Topology/VectorBundle/FiniteRank/Basic.lean:56`) with `ofBundle` and `pointIndexedCore` (its lines 38–52, 96, 258). The worker's overlap tool does not list this because both folders are in the same pull request.

Repair: in 2052–2053 write "apply the pinned `TauCeti.FiniteRankBundleCore.ofBundle` (`Topology/VectorBundle/FiniteRank/Basic.lean`) and TopK T1's bundle-category comparison to TM and ν_f"; in 2071 and 2095 replace "T1.1–T1.3" by the item labels TopologicalKTheory uses at this head for its bundle category, metrics and embeddings (its T1 opening paragraphs, lines 252–407), or simply "TopK T1".

## R08 (P3) — four sampled targets carry no locator, and two cited works are not in the manifest

Location: `README.md:1500–1570` (C5a.1), `:1572–1597` (C5a.2), `:1743–1772` (C5a.6), `:1774–1808` (C5a.7); `:1605–1607`, `:1631–1634`, `:1653–1656`, `:1717–1719` (Cartan 1950 and Chern–Simons 1974 cited in C5a.3–C5a.5); References `:2121–2122`.

Claim: C5a.1, C5a.2, C5a.6 and C5a.7 name no theorem, section or page of any source (C5a.1 names only the Mathlib lemma `d₁₂_apply_apply_ofTrivial`, C5a.6 and C5a.7 only SchubertGeometry and ReflectionInvariantTheory sections). Cartan, *La transgression …* (1950) and Chern–Simons (1974) are cited four times "by locator; no legal open copy" but `packages/CharacteristicClasses/sources.toml` has thirteen entries and none for either work, so the citation is neither certified nor recorded as `uncertified`. The sources already in the manifest carry the missing locators: dupont-ln Proposition A2 (line 2627: invariant forms on `G/H` and `Alt(g/h)^H`), Proposition A7 (2713: invariant inner product by averaging) and Theorem A8 (2752: invariant forms compute de Rham cohomology for compact connected `G`) for C5a.1; dupont-ccc Proposition 8.3 (3548: `I(G) ≅ I(T)^W` for compact connected `G`) for C5a.2; dupont-ccc Corollary 8.35 (3989: Borel, `H*(BG) ≅ H*(BT)^W`) for C5a.6; hatcher-at Corollary 4D.3 (18734: `H*(U(n);ℤ) = Λ[x₁,…,x_{2n−1}]`, `H*(SU(n);ℤ) = Λ[x₃,…]`) and the §3.G table (14232: `SU(n)` degrees `2,…,n`; 14239: `E8` degrees `2,8,12,14,18,20,24,30`) for C5a.7.

Repair: add those locators at the claims; record `cartan-1950` (Colloque de topologie, Bruxelles 1950, pp. 57–71) and `chern-simons-1974` (Ann. of Math. 99, DOI 10.2307/1971013) in the manifest as `uncertified` by locator. #1808's current C5a carries the Dupont and Hatcher locators.

## R09 (P3) — another open pull request carries this folder, and the order with it is not stated

Location: pull request description, merge-order paragraph: "No open pull request must merge before this one. The stacked ModularCurves and SchemeAndStackFoundations move follows #1101 and this pull request."

Claim: the order with #1808 is stated (it follows). #1854, by the same author, also changes `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean` (worker's `overlaps.md`: "#1807 and #1854 conflict in `TauCetiRoadmap/AlgebraicCurves/Suggested.lean`"; `roadmaps show CharacteristicClasses --pr 1854` shows this head's old `Suggested.lean`, declarations at its lines 50–113) and is not ordered against this pull request.

Witness: `roadmaps list` rows for #1807 (70140e6), #1808 (d1a45bf) and #1854 (c9c60d0), all carrying CharacteristicClasses.

Repair: name #1854 in the merge-order paragraph with its position, and rebase the later of the two so that it carries the repaired folder.

## Previous findings

The previous review on file (r35) read pull request #1808 at a3b1e14; its folder is not this head's. Checked against this head anyway:
- **r35 R01 (HomotopySpheres) — not repaired.** The same five mentions are at lines 25, 273, 379, 459 and 461 here; now R01.
- **r35 R02 (ℝP headline docstring) — not applicable.** This head states no ℝP headline; the headline itself is absent (R02 above lists what is statable).
- **r35 R03 (#1854 order) — not repaired.** Now R09.
- **r35 R04 (two files outside the roadmap folders) — repaired for this pull request.** `git diff --stat origin/main...HEAD` outside the fourteen folders the brief names is empty, and the gate reports `outside-folder=0`.
Of the eight findings of r17 (#1808 at 0439c6d, the version this head carries): R01 (module header) is repaired here (`module` / `public import Mathlib` / `@[expose] public section`, gate `build=0`); R06 (LieGroups "Layer 5A") is repaired (line 1413–1416 cites Layer 6 and Layer 7, both on main at `LieGroups/README.md:383, 407`); R07 (Cohen and Bott–Tu in the manifest) is repaired (`cohen-fiber-bundles`, `bott-tu` present); R08 is repaired; R02–R05 are not, and are R02–R06 above.

## Verified sound

**Gate and build.** Worker's gate at 70140e6: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=5 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL`; the only failure is R01. `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean`: exit 0 in 10 s, warnings only `declaration uses sorry` at 68:8, 76:8, 88:8, 100:8, 112:8. Single `public import Mathlib`, no `set_option`, no sorried data, `theorem` only, 123 lines. Dependency check this round:

```text
depcheck: 240 roadmaps, 2459 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; CharacteristicClasses is on main and not in `ORDER.txt`. `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere (the worker's `citations.md`; R07 is found at a head the tool treats as the same pull request).

**Signatures.** `signatures.md` lists 11 declarations; two of them (`,` and a backtick) are artefacts of the worker's own `#check @,` lines in `scratch/signatures/SignatureCheck.lean:125, 132`, not declarations of the file. The nine real ones carry every binder in their own signatures (`[CommRing A] [Algebra ℚ A] {r} (x : Fin r → A)`; `[CommRing R] (P Q) (hodd) (k)`); none uses a section variable, so none can lose one. Each elaborated type matches its README sentence (C6.1 1823–1829, C3.3 1187–1191, C7.1 1906–1924).

**Padding probe** (`scratch/Probe2.lean`, each theorem with `first | rfl | simp | simp [defs]`): none closes; `twice_even_product_correction_eq_zero` is left with the antidiagonal sum, the root theorems with their original goals after `simp` normalises `(1/12 : ℚ) •` to `12⁻¹ •`. The duplication probe (`scratch/Probe3.lean`) is in R04.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b; `scratch/Probe1.lean` plus file reads): `TauCeti.IsThomClass` (EulerClass.lean:245), `eulerClass` (356), `eulerClass_eq_zero_of_forall_ne_zero` (383), `VectorBundleOrientation.exists_singularCohomology_thomPair_fiber` (Orientation/ThomClass.lean:121; in namespace `TauCeti.VectorBundleOrientation`, the bare `TauCeti.` name is unknown), `VectorBundleOrientation.exists_isThomClass` (186), `exists_isThomClass_of_compactSpace`, `VectorBundleOrientationCover.{signLocalSystem, trivializationHomeomorph, isCoveringMap_proj}`, `OrthonormalFrameBundle.toOrientationCover_eq_toOrientationCover_iff`, `OrthonormalFrameBundle` (OrthonormalFrame/Basic.lean:20–45), `FiberBundle.t2Space_totalSpace` (Separation.lean:37), `TopCat.serreFibrations` (SerreFibration/Basic.lean:107), `TopCat.mem_serreFibrations_proj`, `hasHomotopyLiftingProperty_cube_of_exists_trivialization`, `hirzebruchLSeries` (245), `coeff_hirzebruchLSeries` (249), `rescale_neg_one_hirzebruchLSeries` (296), `aHatSeries` (147), `PowerSeries.multiplicativeSequence` (110), `multiplicativeSequence_three_right` (373), `multiplicativeSequence_bernoulli'PowerSeries_two` (GenusPolynomials.lean:72), `multiplicativeSequence_cartier_hirzebruchLSeries_two` (121), `expand_cartier_hirzebruchLSeries` (103), `evalFundamentalClass` (Cohomology/FundamentalClass.lean), `LieSubalgebra.lieChevalleyRestrictionIso` (ChevalleyRestriction.lean:151), `lieCartanRestriction` (CartanRestriction.lean:203), `killingSymmetricEquiv` (SymmetricAlgebra.lean:60), `map_killingSymmetricEquiv_lieInvariants` (110), `ContRepresentation.isUnitarizable` (Compact/Unitarizable.lean), `TauCeti.FiniteRankBundleCore` (FiniteRank/Basic.lean:56), `TauCeti.finiteOrientedGrassmannian` (Topology/Grassmannian/Oriented.lean), Mathlib `d₁₂_apply_apply_ofTrivial` (Algebra/Lie/Cochain.lean:118).

**Cross-roadmap citations resolved** (main 3b3f7ef or this head): LieGroups Layers 1, 5, 6, 7 (main 261, 358, 383, 407; the `SU(2) → SO(3)` cover at 479–485); CompactGroups Layer 0 (main 205); LieHighestWeight L7 names (main 981–1067; R06); LieGroupoidsPoisson §G1.3a (main 18); ReflectionInvariantTheory §§1–4 (main 7, 19, 40, 68); SpinGeometry G4.1a/G4.1b/G4.3/G4.4 (main 397, 425, 52–53); SchubertGeometry S9.6 (main 128); MorseNovikov N6 (main 807–851); GeometricTopology Layers 1, 3, 10, 11 (main 177, 357, 786, 831); TopologicalSheafCohomology TS1.1–TS1.2 (main 7–11, which name C1.2b as the consumer); ConvexityToric T2 (main 73); MorseTheory M5 (main 857); RiemannianGeometry R3 (main 347); AffineMorseLefschetz A4.0 (main 13); SmoothBundlesConnections B1.4, B2, B6.0–B6.3 (main 421–1716); IndexTheory I7.2 (#1077 head, line 1338; earlier in the merge order); at this head: AlgebraicTopology Stages 4.5 (`relativeCWPushout`, `homotopyPushoutGluingComparison`, `relativeCWPushoutCWModel`, `simplicialRealizationCW`), 2.5 (`supBallEuclideanDiskHomeomorph`), 4.6, 4.8, 5.5, 6.0, 7, 8.3, 8.5, 8.8b, 8.9, 8.10, 8.12 (all present by grep); TopologicalKTheory T1.5a (408), T1.6a–d (483, 655, 747, 797; `finiteOrientedGrassmannian` at 87, 500), T6.4, T3.4/T4.8/T7.4 as the numbered items 4, 8, 4 of T3, T4, T7 (lines 1022, 1112, 1549, the last "Prove the doubled-space formula"), the countable-colour producer and `gapPartition` (525, 159); GeneralizedCohomology G4.0a (21 mentions); ComplexKahlerGeometry K4 (967), K7.1 (1962), K7.2 (2000). Overlaps: the lead "SpinGeometry §G4.1a only at #1674" is false (main line 397); no id this README cites is dropped by another pull request; the order with #1808 is stated, #1854 is R09.

**Ownership.** The Thom class, Euler class, orientation cover, frame bundle, Serre fibrations and the characteristic series are owned by the pinned library (R02–R04); the general-base Thom theorem and the Euler primary obstruction are stated by no roadmap on main and, among open pull requests, only by #1808's and #1854's copies of this folder (same author, stacked). The sibling labels `bundleDiskSphereRelCW` and `cechSingularCWTypeComparison` are cited by RiemannianGeometry and ComplexComparisonPartII and stay here. Ownership against the other open pull requests the brief lists was checked by `roadmaps grep` of `hirzebruchLSeries`, `IsThomClass` and `eulerClass` in Lean files: only this folder's copies.

**Sources read at their locators** (cache line numbers): hatcher-vbkt (printed page = cache page − 4): Proposition 1.3 and the Gram–Schmidt step, line 488–506 (printed p. 12); disk and sphere bundles `D(E)`, `S(E)`, lines 640–651 (p. 16); the Gram–Schmidt deformation retraction of `GL_n(ℝ)` onto `O(n)`, lines 1019–1030 (p. 26); the pair `(D(E),S(E))`, Thom class and Euler class as its zero-section restriction, lines 3426–3443 (p. 88). dupont-ln: Proposition 9.1 (2138, polarization isomorphism `S^k(V*) ≅ ℝ[x]_k`), Proposition 9.3 (2195, `P(F^k)` closed, multiplicative, natural), Theorem 9.5 (2244, connection independence), Lemma 9.6 (2264, the homotopy operator on `M × ℝ`); Propositions A2, A7, Theorem A8 (2627, 2713, 2752). dupont-ccc: Chapter 4 Exercise 3 with (4.15) `dTP(θ) = P(Ω^k)`, (4.16) naturality, (4.17) `TP(θ) = k ∫₀¹ P(θ ∧ U_s^{k−1}) ds`, `U_s = sΩ + ½(s² − s)[θ,θ]` (2247–2264), the form C5a.3 restates; Theorem 8.1 (3514, `I(G) ≅ H*(BG)` for compact `G`); Proposition 8.3 (3548); Corollary 8.35 (3989). hatcher-at: Corollary 4D.3 (18734), §3.G table (14232, 14239). zentner-instanton-sheet2: Exercise 2, lines 45–61 (`p₁(su(E)) = −4c₂(E) + c₁(E)²`, `su(E) ⊗ ℂ ≅ End₀(E)`, `p₁ = −c₂(su(E) ⊗ ℂ)`).

**Adversarial table** (values computed this round; the five Lean theorems, the sampled targets and every target a finding touches):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `lSeries_even` (L68) | coefficients `n = 0, 1, 2, 3` | `lSeries`: `1`, `2·(1/2) − 1 = 0`, `4·(1/6)/2 = 1/3`, `0`; `hirzebruchLSeries`: `1`, `2·(−1/2) + 1 = 0`, `1/3`, `0`; odd `B_n = 0` for `n ≥ 3` | true; equals the pinned series (Probe3) |
| `twice_even_product_correction_eq_zero` (L76) | `k = 0`; `k = 1`; general | `P₀Q₀ − P₀Q₀ = 0`; `(P₀Q₂ + P₁Q₁ + P₂Q₀) − (P₀Q₂ + P₂Q₀) = P₁Q₁`, `2P₁Q₁ = 0` by `hodd 0`; difference `= Σ_{i odd} P_iQ_{2k−i}` | true; free-variable algebra (R05) |
| `toddSeries_root_coefficient_two` (L88) | `r = 0`; `r = 1`; `r = 2` | `0 = (0² + 0)/12`; `x²/12 = (x² + 0)/12`; `(x₁² + x₂²)/12 + x₁x₂/4 = ((x₁+x₂)² − 2x₁x₂)/12 + 3x₁x₂/12 = (e₁² + e₂)/12` | true; pinned `Td₂` |
| `lSeries_root_coefficient_four` (L100) | `r = 1`; `r = 2` | `−x⁴/45 = (0 − x⁴)/45`; `−(x₁⁴ + x₂⁴)/45 + x₁²x₂²/9 = (−(p₁² − 2p₂) + 5p₂)/45 = (7p₂ − p₁²)/45` | true; pinned `L₂` |
| `lSeries_root_coefficient_six` (L112) | `q₃`; `r = 1`; CP⁶ | `q₃ = 64·(1/42)/720 = 2/945`, `q₁q₂ − 3q₃ = −7/945 − 6/945 = −13/945`, `q₁³ − 3q₁q₂ + 3q₃ = (35 + 21 + 6)/945 = 62/945`; `r=1`: `2x⁶/945 = 2p₁³/945`; `p = (1+u²)⁷`: `(62·35 − 13·7·21 + 2·343)/945 = 945/945 = 1 = σ(CP⁶)` | true; small value (R05) |
| C1.0 metric change | `h₁(u,v) = h₀(Hu,v)`, `f = H^{−1/2}e` | `h₁(H^{−1/2}u, H^{−1/2}v) = h₀(H^{1/2}u, H^{−1/2}v) = h₀(u,v)`; Sylvester eigenvalues `λ_i^{1/2} + λ_j^{1/2} > 0` | correct |
| C1.0 cover = frames/SO(n) | pinned iff | `toOrientationCover o p = toOrientationCover o q ↔ ∃ g, 0 < det g ∧ q = op g • p` | agrees; owned by the pin (R03) |
| C1.1a sign on the added line | rank `n−1 → n`, cyclic block permutation | sign of the `n`-cycle `(−1)^{n−1}`; `n = 2`: swap, `−1`; `n = 3`: 3-cycle, `+1` | as stated |
| C1.1d table | `[S¹,O(k)]`, `[S²,O(k)]` | `π₁(O(1)) = 0` gives `ℤ/2`; `π₁(SO(2)) = ℤ` with reflection acting by `−1` gives `ℤ⋊ℤ/2`; `π₁(SO(k≥3)) = ℤ/2` gives `(ℤ/2)²`; `π₂(SO(k)) = 0` gives `ℤ/2` | agree |
| C1.1d calibration | `O(−1)`, `TS²` | `s_S = z⁻¹s_N`: winding `−1`, `⟨c₁(O(−1)),[CP¹]⟩ = −1`; `χ(S²) = 2` | agree |
| C2.0 cells | rank 0; empty base; sup-ball map | `S(E) = ∅`, `D(E) = X`, cells `q+0`, Thom model `X₊`; a point; `‖(‖v‖∞/‖v‖₂)v‖₂ = ‖v‖∞`, sup-ball → Euclidean disk | correct |
| C2.0 Hausdorff total space | pinned instance | `t2Space_totalSpace [T2Space B] [T2Space F]` | owned by the pin (R03) |
| C2.1 Thom class | B = pt, `o = ω` / `o = −ω`; `K = 𝔽₂` | fibre restriction `g` / `−g`; `−g = g`, orientation irrelevant | consistent with the pinned statement |
| C2.2 Euler iff | `TS²`; `S²×ℝ²`; `su(F)` on HP¹ | `e = 2 ≠ 0`, no section; `e = 0`, constant section; rank 3 over dimension 4: `e ∈ H³(S⁴) = 0` but no section (`p₁ = −4u`) | both directions in range; the dimension hypothesis is necessary |
| C2.2 odd rank | orientation reversal | `e(−E) = −e(E) = e(E)` under `id_E`, so `2e = 0` | correct |
| C2.3 Checks | `S²`: identity, antipodal, constant; tetrahedron | `2`, `−2`, `0` (Lefschetz number `1`); `4 − 6 + 4 = 2` | correct |
| Conventions: Euler form | block `[[0,−α],[α,0]]` | `Pf([[0,a],[−a,0]]) = a` with `a = −α`: `Pf(F/2π) = −dα/2π`; complex curvature `i dα`, `c₁ = (i/2π)(i dα) = −dα/2π` | `e = c₁`, as stated |
| C3.3 Whitney correction | `p_k(E⊕F)` | `(−1)^k c_{2k}(E_ℂ⊕F_ℂ) = Σ p_ap_b + (−1)^k Σ_{a+b=k−1} c_{2a+1}c_{2b+1}` | formula correct |
| C3.3 Check on ℝP⁴ | `L ⊕ L` | `p₁(L⊕L) = −c₁(L_ℂ)² = −y² ≠ 0` in `H⁴(ℝP⁴;ℤ) = ℤ/2`, `p(L) = 1` | detects the correction |
| C5a.1 CE degree one | `(da)(X₀,X₁)` | `(−1)^{0+1} a([X₀,X₁]) = −a([X,Y])`; Mathlib `d₁₂ f x y = −f⁅x,y⁆` | agree |
| C5a.1 Koszul `2d = Σ e^a∧L_{e_a}` | degree 1 | `(L_Xa)(Y) − (L_Ya)(X) = −a([X,Y]) + a([Y,X]) = −2a([X,Y]) = 2da(X,Y)` | correct |
| C5a.1 Haar average | left invariance | `L_h^*Aω = ∫ L_{gh}^*ω dg = Aω` by right invariance of Haar | image left-invariant |
| C5a.1 `H¹(K;ℝ)` | closed 1-forms | `da = 0 ⇔ a([g,g]) = 0`; exact 1-forms are `d(constants) = 0` | `ann([g,g])` |
| C5a.2 rational structure | `θ ↦ exp(iθ)` | `dχ(a) = ia`, `(i/2π)(ia) = −a/2π` | agrees with Conventions 190–191 |
| C5a.2 generator count | rank, centre | `rank K` generators, central directions `d = 1` | consistent with RIT §3 |
| C5a.3 Weil curvature | `θ_t = tθ` | `dθ_t + ½[θ_t,θ_t] = t(Ω − ½[θ,θ]) + ½t²[θ,θ] = tΩ + ((t²−t)/2)[θ,θ]`; Dupont `U_s` line 2264 | agree |
| C5a.3 `d_W CS_P = P(Ω)` | degree `d ≥ 1` | `∫₀¹ (d/dt)P(F_t) dt = P(F₁) − P(F₀) = P(Ω) − 0` | correct |
| C5a.3 rank one | `P = −a/2π` | `CS_P = P(θ) = −θ/2π` | matches line 1639 |
| C5a.4 Koszul model | degrees; trivial group | `|e_i| = 2d_i − 1`, `D(e_i) = P_i` of degree `2d_i`; empty system gives `ℝ` | consistent |
| C5a.5 transgression page | `z_i ∈ E^{0,2d_i−1}` | `d_r : E^{p,q} → E^{p+r,q−r+1}`, `r = 2d_i` lands in `E^{2d_i,0}`; `π₁(BK) = π₀(K) = 0` | well-formed |
| C5a.6 Poincaré series | `SU(2)`, `U(2)`, `SU(3)`, trivial | `1+t³` (Betti 2, top 3); `(1+t)(1+t³)` (Betti 4, top 4); `(1+t³)(1+t⁵)` (top 8 = dim); `P(−1) = 0`; trivial `1` | agree; Cor 8.35 is real coefficients |
| C5a.7 degrees | `U(n)`, `SU(n)`, `E8` | `Σ_{d=1}^n (2d−1) = n²`; `Σ_{d=2}^n (2d−1) = n² − 1`; `3+15+23+27+35+39+47+59 = 248 = dim E8`, invariant degrees `2,8,…,30` (Hatcher 14239) | agree |
| C5a.7 integral `U(n)` | Hatcher 4D.3 | `Λ_ℤ[x₁,…,x_{2n−1}]` | agree |
| C5a.7 `SU(2)/N(T) = ℝP²` | integral cohomology | `H⁰ = ℤ`, `H¹ = 0`, `H² = ℤ/2` | agree |
| C5a.7 strict upper triangular | `n = 2` | one-dimensional abelian: centre = `g ⊄ [g,g] = 0` | counterexample holds |
| C7.AdjointHopf basis | three matrices | each `A* = −A`, trace `0`, independent | basis of `su(2)` |
| C7.AdjointHopf Check | `Z = diag(1,−1)` | `X = (Z − Z*)/2 = 0`, `Y = (Z + Z*)/(2i) = diag(−i, i)`, `X + iY = Z` | correct |
| C7.AdjointHopf roots | `0, x−y, y−x` | `e₂ = −(x−y)²`, `p₁ = −c₂ = (x−y)² = (x+y)² − 4xy = c₁² − 4c₂`; Zentner line 50 | agree |
| C7.AdjointHopf on HP¹ | `c₁ = 0`, `⟨u,[HP¹]⟩ = 1` | `⟨p₁(E),[HP¹]⟩ = −4`; `e ∈ H³(S⁴) = 0`; `w_{1,2,3} = 0`; `ε¹⊕P` gives `p₁ = e(P)² = 0`, contradiction | no section, not stably trivial |
| C7.1 `L₃` | see row 5 | `(62p₃ − 13p₁p₂ + 2p₁³)/945` | correct |
| C7.3a | `m = 2^k` | `(1+a)^{m+1}(1+a)^{m−1} = (1+a)^{2m} = 1 + a^{2m} = 1` below degree `2m`; `(1+a)^{m−1} = ∏_{i<k}(1+a^{2^i}) = Σ_{j<m} a^j`; `k = 1`: `w̄₁(ℝP²) = a ≠ 0` | correct |
| C1.5a Checks | `CP¹ → CP∞ → K(ℤ,2)`; `H¹(ℝP∞;ℤ)` | generator `+1` under the `h` normalisation, `−h` gives `−1`; `Hom(ℤ/2,ℤ) = 0`, first integral class `y = β(a)` in degree 2 | agree |

## Not verifiable

- Milnor–Stasheff §§9–15, 18–19, Appendix C, Theorem 15.3 and Lemma 18.1; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3; Bott–Tu §§6, 11–14, 20–23: settled uncertified in the manifest, cited by locator, text not read.
- Cartan 1950 and Chern–Simons 1974 (R08): not in the manifest; no legal open copy found (Cartan's Colloque proceedings and the Annals paper are not in an open repository); the Weil-algebra and transgression statements were checked against dupont-ccc Chapter 4 Exercise 3 and Theorem 8.1 instead.
- `TauCeti.evalFundamentalClass` was `#check`ed but not read; it is not cited by this head.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, page 1: the source writes "skey-adjoint" for the endomorphisms defining `su(E)`; it should be "skew-adjoint"; affects nothing.
