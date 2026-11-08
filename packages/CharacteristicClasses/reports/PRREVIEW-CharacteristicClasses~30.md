# Review of CharacteristicClasses (pull request #1808 at 60a92ec)

**Verdict:** needs changes

Full review: the folder changed by 456 lines since 6fc75e4. Of the previous review's seven findings, five are repaired, one is partly repaired (now R01) and one is not repaired (now R08). Two findings block: R01 and R02.

## R01 (P2) — C1.1a and C2.0 still plan objects the pinned Tau Ceti already has (previous R03 partly repaired)

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:282–284`, "Construct its direct-sum and cover-section comparisons and path-transport sign local system using TopK T1's vector-bundle atlases"; `README.md:808–811`, "Prove the native bundle total space is Hausdorff from the Hausdorff base, finite-dimensional Hausdorff fibers and local trivialization charts".

Claim: the repair moved C1.0 and C2.1–C2.2 onto the pinned declarations, but two passages still plan objects that exist at Tau Ceti 2fd255d9. Section C1.0 (line 274) and C2.1 (line 868) already consume two of the three C1.1a objects by name, so the README also contradicts itself.

Witness: `Topology/VectorBundle/Orientation/Prod.lean:78` `VectorBundleOrientation.prod` (first factor first) and `:147` `VectorBundleOrientationCover.prodMap`; `Orientation/Cover.lean:498` `nonempty_iff_exists_section`; `Orientation/LocalSystem.lean:75` `signLocalSystem`; `Topology/FiberBundle/Separation.lean:37` `TauCeti.FiberBundle.t2Space_totalSpace`.

Repair: in C1.1a, replace the sentence with: consume the pinned `TauCeti.VectorBundleOrientation.prod` and `TauCeti.VectorBundleOrientationCover.prodMap` (`Orientation/Prod.lean`), `VectorBundleOrientation.nonempty_iff_exists_section` and `VectorBundleOrientationCover.signLocalSystem`. Keep only the Stiefel-quotient comparison, which is not pinned. In C2.0, replace the Hausdorff sentence with a citation of the instance `TauCeti.FiberBundle.t2Space_totalSpace`. All five names elaborate at the pin (scratch `#check` file, exit 0).

## R02 (P2) — a statable C2.2 headline is absent, and the docstring's not-statable list is incomplete and misstates one reason

Location: `Suggested.lean:27–57`, the not-statable list. It does not mention the Euler-class obstruction theorem, the Gysin sequence, the exterior Hopf theorem, the Chern-character theorems or the ℝP^(2^k) non-immersion. Its last bullet says "no curvature form of a connection or de Rham comparison for bundles at the pins".

Claim:
1. C2.2 (README 951–953) proves that a rank n ≥ 2 bundle over a CW base of dimension ≤ n has e = 0 exactly when a nowhere-zero section exists. C7.AdjointHopfObstruction (README 2098–2104) calls this the primary-obstruction theorem and is built to test its dimension hypothesis. The oriented case can be stated with pinned carriers only, yet it is absent from the file.
2. The other headline results named in the README summary (lines 3–10) are not statable, and the docstring does not say so. These are the Gysin sequence (C2.2), `H^*(K;ℚ)=Λ(z_i)` (C5a.5), the rational Chern-character isomorphism and its Thom/Todd correction (C6.3–C6.4), and the non-immersion of ℝP^(2^k) (C7.3a). For C7.3a the missing carrier is real: Tau Ceti's smooth projective space cannot be imported alongside `import Mathlib`.
3. The last bullet's reason is half false. Connections and their curvature are pinned; what is missing is de Rham cohomology and the de Rham/singular comparison.

Witness: scratch `Probe2.lean`, containing the statement below, elaborates with only a `sorry` warning. Importing `TauCeti.Geometry.Manifold.Instances.Projectivization` fails with "environment already contains `Projectivization.instTopologicalSpace`". `CovariantDerivative.curvatureOperator` is at `Curvature/Basic.lean:89`.

Repair: add, under C2.2, the following statement (tested; it elaborates as written in universe 0, with ℤ coefficients):

```lean
theorem eulerClass_eq_zero_iff_exists_ne_zero [T2Space B] [Topology.CWComplex (univ : Set B)]
    (hdim : ∀ m, finrank ℝ F < m → IsEmpty (Topology.RelCWComplex.cell (univ : Set B) m))
    (hn : 2 ≤ finrank ℝ F)
    (u : (TauCeti.thomPair F E).singularCohomology (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ)
      (finrank ℝ F)) (hu : TauCeti.IsThomClass F E u) :
    TauCeti.eulerClass (ModuleCat.of ℤ ℤ) ℤ (ModuleCat.of ℤ ℤ) F E (finrank ℝ F) u = 0 ↔
      ∃ s : ∀ b, E b, Continuous (fun b ↦ TotalSpace.mk' F b (s b)) ∧ ∀ b, s b ≠ 0
```

The `←` direction is the pinned `eulerClass_eq_zero_of_forall_ne_zero`. Add docstring bullets for the four non-statable headlines, each with its missing carrier:
- Gysin sequence: no Gysin map, since there is no Thom isomorphism.
- `H^*(K;ℚ)=Λ(z_i)`: no graded cohomology ring.
- Chern-character theorems: no Chern class and no K-theory.
- ℝP^(2^k) non-immersion: `Projectivization.instChartedSpace` clashes with Mathlib's projective topology.

Rewrite the C4.2 bullet to name Mathlib's `CovariantDerivative` and `CovariantDerivative.curvatureOperator` as present, and de Rham cohomology with its singular comparison as absent.

## R03 (P3) — two pinned declarations are cited under names that do not exist

Location: `README.md:961` "`Orientation.toVectorBundleOrientation`" and `README.md:964` "the pinned chart generator `TauCeti.localOrientation`". `Suggested.lean:45` repeats the first name.

Claim: neither name resolves at the pin. Since Mathlib has a root `Orientation`, the partial first name points readers to the wrong namespace.

Witness: scratch `#check @TauCeti.localOrientation` gives "Unknown identifier". `#check @Orientation.toVectorBundleOrientation` gives "Unknown constant". The declarations are `Orientation.localOrientation` (`Singular/LocalHomology/Orientation/Linear.lean:67,138`) and `TauCeti.Manifold.Orientation.toVectorBundleOrientation` (`Geometry/Manifold/Orientation/Basic.lean:24,36,109`).

Repair: write `Orientation.localOrientation` (positive dimension, `Orientation ℝ F (Fin (n+1))`) and `TauCeti.Manifold.Orientation.toVectorBundleOrientation` in README 961 and 964 and in `Suggested.lean:45`. Both `#check` lines elaborate.

## R04 (P3) — C2.1's prose is not at the generality of its Lean statement

Location: `README.md:883–886`, "an orientation determines exactly one class of `H^n(E,E∖0;R,M)` restricting on every fibre to the generator read off from the orientation".

Claim: the Lean statement differs from the prose in two ways.
- It assumes `[Module.Projective K R]`, which the prose omits.
- It holds for an arbitrary class `g ∈ H^r(F,F∖{0};R,M)`, with fibre restriction ±(pull-back of `g`). The prose speaks only of "the generator".

So the README is more general in its coefficients and narrower in `g` than `Suggested.lean`.

Witness: `Suggested.lean:88–92` binds `[Module.Projective K R]` and an arbitrary `g`; `signatures.md` shows the same elaborated type.

Repair: reword README 883–886 as follows. "For coefficients `Hom(C(−;R),M)` with `R` a projective `K`-module and any class `g` of `H^n(F,F∖0;R,M)`, exactly one class restricts on each fibre to the pull-back of `g` along trivializations carrying the orientation to ω, and to its negative along those carrying it to −ω. A generator `g` gives the Thom class."

## R05 (P3) — C5.1 consumes Chevalley restriction under LieHighestWeight's planned names and restates a pinned invariant form

Location: `README.md:1499–1508` (`lieInvariantSymmetricAlgebra`, `lieChevalleyRestrictionIso_coe`, `lieChevalleyRestrictionIso_mem_homogeneous_iff`, `killingSymmetricEquiv_cartan_restriction`, `killingSymmetricEquiv_lie`); `README.md:1482–1484` ("State as this item's own input … the Ad-invariant positive definite form on 𝔤 obtained by Haar averaging"); `README.md:1490–1491`.

Claim:
- The Chevalley isomorphism, the Killing transport and degree compatibility are in the pinned Tau Ceti. The five names above are LieHighestWeight L7's planned names on main (its README lines 981–1067), and none exists at the pin.
- The invariant form is the specialization to Ad of a pinned theorem over any `RCLike` field.
- `isSemisimple_of_nondegenerate` needs a further hypothesis that the README does not mention.

Witness:
- `HighestWeight/ChevalleyRestriction.lean:151` `LieSubalgebra.lieChevalleyRestrictionIso` and `:177` `…_mem_homogeneousSubmodule_iff`.
- `Killing/SymmetricAlgebra.lean:94,110` `killingSymmetricEquiv_lieModuleDerivation`, `map_killingSymmetricEquiv_lieInvariants`.
- `Compact/Unitarizable.lean:241` `ContRepresentation.isUnitarizable`.
- Mathlib `InvariantForm.lean:194` requires `∀ I, IsAtom I → ¬IsLieAbelian I`.

Repair:
- In C5.1, consume `LieSubalgebra.lieChevalleyRestrictionIso`, `LieSubalgebra.coe_lieChevalleyRestrictionIso_apply`, `LieSubalgebra.lieChevalleyRestrictionIso_mem_homogeneousSubmodule_iff`, `TauCeti.lieCartanRestriction`, `TauCeti.killingSymmetricEquiv`, `TauCeti.killingSymmetricEquiv_lieModuleDerivation` and `TauCeti.map_killingSymmetricEquiv_lieInvariants` by name. Their hypotheses are an algebraically closed field of characteristic zero, a nondegenerate Killing form and a splitting Cartan subalgebra, which the semisimple complex summand meets.
- Replace the own-input invariant form with `ContRepresentation.isUnitarizable` (𝕜 = ℝ) applied to LieGroups Layer 1's `Ad`.
- Add the no-abelian-atom hypothesis to the citation. On `[𝔤,𝔤]` it follows from nondegeneracy of its Killing form.

All names elaborate (scratch `#check`, exit 0).

## R06 (P3) — the sampled targets C1.0, C2.0 and C5a.1–C5a.7 carry no source locator

Location: `README.md:225–278` (C1.0), `797–862` (C2.0), `1561–1870` (C5a); References `README.md:2208–2217` list no source for the Weil algebra, Cartan's transgression theorem or the exterior Hopf structure.

Claim: every theorem needs a locator. The sample cannot be checked against a text, because none of these items names one. Only C7.AdjointHopfObstruction (Zentner) and the C1.1d clutching (Hatcher) carry locators in this sample.

Witness: no theorem, section or page reference occurs in README 225–278 or 1561–1870. The only Dupont locator nearby is C5.2's "Dupont1978 §8" (line 1526).

Repair: give each sampled target the locator of the source it follows, and record new works in `sources.toml`.
- C1.0: dupont-ln §2, "Vector Bundles and Frame Bundles" (printed p. 7, dupont-ln line 284), and Milnor–Stasheff §5.
- C5a.5: dupont-ccc Theorem 8.1 (line 3514).
- C5a.3–C5a.5: H. Cartan, *La transgression dans un groupe de Lie et dans un espace fibré principal*, which dupont-ccc lists as its reference [8] (line 5018).
- C2.0, C5a.1, C5a.2, C5a.6 and C5a.7: the source each one follows.

## R07 (P3) — another open pull request rewrites this folder, and no order is stated

Location: pull request description, merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

Claim: #1854 (same author) conflicts with this pull request in `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean`, and the description does not order the two. At #1854's head (d723ba1) `Suggested.lean` still defines `chernRootValue`, `pontryaginRootValue` and `toddSeries`, and lists the Thom class as not statable. Merging #1854 last would undo this head's repairs.

Witness: worker's `overlaps.md`: "#1808 and #1854 conflict in `TauCetiRoadmap/CharacteristicClasses/README.md`, `TauCetiRoadmap/CharacteristicClasses/Suggested.lean`". `roadmaps show CharacteristicClasses --pr 1854` shows the old definitions.

Repair: state the order with #1854 in the merge-order paragraph, and rebase the later of the two onto the earlier. The rebased branch must carry this head's version of the folder.

## R08 (P3) — the pull request still changes two files outside its roadmap folders (previous R07 not repaired)

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

Claim: neither folder is one of the pull request's own folders, so each change is a finding under the brief's rule. The worker's gate at 60a92ec fails only on this check.

Witness: worker's gate `outside-folder=2 … FAIL` lists exactly these two files. `git log origin/main..HEAD` on them shows `e591d103` and `61e5385e`.

Repair: rebase so that commits `e591d103` and `61e5385e` drop out, or name the two folders as the pull request's own.

## Previous findings

- **R01 — repaired.** `Suggested.lean:1–4` now reads `module`, `public import Mathlib`, `public import TauCeti.Topology.VectorBundle.Orientation.ThomClass`, with `@[expose] public section` at line 60. The worker's gate no longer reports a build failure, and `lake env lean` exits 0 with warnings at 87:8 and 111:8 only.
- **R02 — repaired, with one residue.** The docstring (lines 13–26) now names `thomPair`, `IsThomClass`, `eulerClass`, `signLocalSystem` and `existsUnique_singularCohomology_thomPairOver_iUnion`. The general-base Thom-class theorems are stated at lines 87 and 111. The Thom-isomorphism reason ("no relative cup product") is correct: no `TopPair` cup exists at the pin. The residue is the false curvature reason, now in R02.
- **R03 — partly repaired.** Line 74 now reads "Serre fibrations are the pinned Tau Ceti class `TauCeti.TopCat.serreFibrations`". The DGFloer bullet now keeps only the exact sequence and the spectral sequence. C1.0 consumes `OrthonormalFrameBundle` and the orientation cover, and C2.1–C2.2 consume the Thom and Euler declarations. C1.1a (282–284) and C2.0 (808–811) remain, now R01.
- **R04 — repaired.** C6.1 (1874–1911) and C7.1 (1983–2006) cite `PowerSeries.multiplicativeSequence`, `TauCeti.hirzebruchLSeries`, `aHatSeries` and the `GenusPolynomials` theorems. The four definitions are gone from `Suggested.lean`.
- **R05 — repaired.** `lSeries_root_coefficient_six` and `twice_even_product_correction_eq_zero` are deleted. The README keeps both statements as prose (C7.1 line 1996, C3.3 lines 1254–1257).
- **R06 — repaired.** Line 1477 now reads "[LieGroups Layer1 and Layer6]…[CompactGroups Layer0–1]". On main, LieGroups Layer 1 (line 261) gives `Ad`, and Layer 6 (line 383) gives maximal tori, conjugacy and `N(T)/T ≃ W(root system)`. CompactGroups Layer 0 (line 205) gives Haar averaging and Layer 1 (line 226) the averaged Hermitian form.
- **R07 — not repaired.** The same two files are still changed, now R08.

## Verified sound

**Gate and build.** The worker's gate at 60a92ec reports `set_option=0 … readme-ids-missing=0 … depcheck=0 … stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`; the only failure is R08. I re-ran `lake env lean` on `Suggested.lean`: exit 0, warnings only `declaration uses sorry` at 87:8 and 111:8. The file has no `set_option`, no sorried data, a single `import Mathlib` plus one existing `TauCeti.*` module, and `theorem` only. The dependency check, run this round:

```text
depcheck: 243 roadmaps, 2481 edges, 0 problem(s)
```

It shows no UPWARD, CYCLE or `moved:` line. CharacteristicClasses is on main, and the merge order does not list it.

**Signatures.** I compared the elaborated types in the worker's `signatures.md` with README C2.1. Both theorems keep `[FiniteDimensional ℝ F]`, `[FiberBundle F E]`, `[VectorBundle ℝ F E]` and `hι`, and the first keeps `[Module.Projective K R]`. No section binder is lost. The only mismatch with the README is the prose generality in R04.

**Padding probe.** I tried `first | simp | rfl | infer_instance | exact?` on a scratch copy, and `exact?` alone on the first theorem. Neither theorem closes ("`exact?` could not close the goal" on both). Neither restates a definition, mirrors a Check or treats a boundary case. The second theorem follows from the first in the same way as the pinned compact-base derivation, `Orientation/ThomClass.lean:186–211`.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b):
- Two scratch `#check` files: 117 names in the first, 14 in the second; all resolve except the two in R03.
- Thom and Euler: `Orientation/ThomClass.lean:121,186`; `MayerVietoris/DirectedUnion.lean:227,301` (gluing and vanishing over an arbitrary base, with no separation hypothesis); `MayerVietoris/Basic.lean:519,561,612`; `EulerClass.lean:245` (`IsThomClass`, finite-dimensionality built in), `258`, `327`, `356`, `368`, `383`, `402`, `412`.
- Trivializable bundles: `VectorBundle/ThomClass.lean:522` (the sign-det rule).
- Frames and orientation covers: `OrthonormalFrame/Basic.lean`, `Pullback.lean:97`, `Orientation/OrthonormalFrame.lean:80,120,309`, `Orientation/Cover.lean:262,298,339,498,533`, `LocalSystem.lean:75,139`, `Tautological.lean:39`, `Grassmannian/Oriented.lean:44` (positive rank only, matching README 284–292).
- Serre fibrations: `SerreFibration/Basic.lean:107,143,179`, `FiberBundle.lean:325,365,395`; `Homotopy/Extension/CWComplex.lean:142`, `Extension/Basic.lean:275`; `GramSchmidt.lean:128` (`Continuous.gramSchmidtNormed_bundle`).
- Series and genus polynomials: `CharacteristicSeries.lean:147,245` (`hirzebruchLSeries = rescale 2 B + X`, as C6.1 says), `MultiplicativeSequence.lean:110,201,250,300,373`, `GenusPolynomials.lean:65–158` (each in rank at least the degree, as C7.1 says).
- Manifold carriers: `FundamentalClass.lean:88`, `FiniteCWType.lean:123` (`TauCeti.eulerChar`).
- Docstring absences confirmed: no `TopPair` cup and no Chern or Stiefel–Whitney class (grep). The pin has only the discrete-group `TauCeti.classifyingSpace` (`ClassifyingSpace/Basic.lean`) and no infinite Grassmannian.

**Cross-roadmap citations resolved:**
- LieGroups Layers 1 and 6, CompactGroups Layers 0–1 and LieHighestWeight L7/L9 on main.
- SpinGeometry G4.1a on main, line 397. The overlap lead claiming only #1674 defines it is false: the tool looked for a `§G4.1a` heading.
- AlgebraicTopology at this head: `supBallEuclideanDiskHomeomorph` line 361, `relativeCWPushout` 658, `homotopyPushoutGluingComparison` 672, `relativeCWPushoutCWModel` 730, `simplicialRealizationCW` 848.
- TopologicalKTheory at this head: T1.3 metrics, line 198.
- Overlaps: the order with #1807 is stated; #1854 is R07. No id this README cites is dropped elsewhere, and none this pull request drops is cited.

**Ownership.** RiemannianGeometry (#1327, #1683) and ComplexComparisonPartII (#848) cite the cross-roadmap labels `bundleDiskSphereRelCW` and `cechSingularCWTypeComparison` (roadmaps grep), so I left those backticked target labels alone. The gate's readme-ids check passes. Nothing here is also owned by AlgebraicTopology #1652/#1663 or TopologicalKTheory #1781/#1807.

**Sources read at their locators:**
- zentner-instanton-sheet2 Exercise 2, lines 45–61: `p₁(su(E))=−4c₂(E)+c₁(E)²`, `su(E)⊗ℂ≅End₀(E)`; its route (b) is rational, which README 2074 already flags.
- hatcher-vbkt §1.2: "Clutching Functions" at printed p. 22 (line 844), Proposition 1.11 at p. 23 (line 905), Proposition 1.14 at p. 25 (line 988). These match "pp22–26".
- dupont-ccc Theorem 8.1, line 3514: Cartan's isomorphism for compact G.
- tomdieck-at 14.4.3, line 14467: the Milnor space.
- cohen-fiber-bundles Proposition 3.27 and its example, lines 3583–3590: `w̄(RP^(2^k))=1+a+…+a^(2^k−1)`; the extraction drops the superscript.

**Adversarial table** (values computed this round):

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_…_thomPair_fiber` (L87) | B = ∅ | `H^r(∅,∅)=0`, both clauses vacuous, `u=0` | true |
| same | B = pt, `o=ω` / `o=−ω` | `u=g` / `u=−g`; two trivializations differ by `sign det` (ThomClass.lean:522) | consistent |
| same | rank 0, two points, opposite signs | `u=(g,−g)`; a constant class gives `±(g,g)` | unique, as Check 2 says |
| same | `K=𝔽₂`; `g=0` | `−g=g`, orientation irrelevant; `u=0` | true |
| same | non-compact, non-Hausdorff base | pinned iUnion gluing has no base hypothesis (DirectedUnion.lean:227) | true |
| same | `R` not projective | `Hom(C⊗R,M)=C^*(−;Hom(R,M))`; true, but Lean excludes it | README/Lean mismatch (R04) |
| `exists_isThomClass_of_orientation` (L111) | B = ∅; `K=0`; Möbius | vacuous `∀ b`; `span = ⊤` in the zero module; no orientation exists | true |
| same | `K=ℤ`, `S¹×ℝ` | fibre restriction is a generator of `H¹(ℝ,ℝ∖0)≅ℤ` | true |
| C2.2 converse (R02 repair) | TS² over S²; point; ∅ | `e[S²]=2≠0`, no section; `H²(pt)=0`, section; both sides true | holds |
| same | su(F) over HP¹ | dim 4 > rank 3: `e=0`, no section | `hdim` necessary |
| C1.0 metric change (sample) | `f_i=H^(−1/2)e_i` | `h₁(f_i,f_j)=h₀(H^(1/2)e_i,H^(−1/2)e_j)=δ_ij`; Sylvester eigenvalues `λ_i^(1/2)+λ_j^(1/2)>0` | correct |
| C1.0 orientation cover (sample) | pinned iff | same image ↔ differ by an orthogonal map with `det>0` (OrthonormalFrame.lean:120) | agrees |
| C2.0 cells (sample) | rank 0; empty base; sup-ball map | `S(E)=∅`, Thom model `X₊`; a point; `‖(‖v‖∞/‖v‖₂)v‖₂=‖v‖∞` | correct |
| C2.0 Hausdorff step (sample) | pinned instance | `t2Space_totalSpace` [T2 B][T2 F] | duplicated (R01) |
| C2.1 Check 3 | Möbius bundle, ℤ and 𝔽₂ | `H¹(E,E₀;ℤ)≅H⁰(S¹;o)=0` (invariants of ℤ under −1); 𝔽₂ class exists | correct |
| C5a.1 CE (sample) | degree 1 | `(da)(X₀,X₁)=(−1)^(0+1)a([X₀,X₁])`; Mathlib `d₁₂_apply_apply_ofTrivial` gives `−f⁅x,y⁆` | agree |
| C5a.1 Koszul (sample) | degree 1 | `Σe^a∧L_(e_a)a (X,Y)=(L_Xa)(Y)−(L_Ya)(X)=−2a([X,Y])=2da(X,Y)` | correct |
| C5a.2 rational structure (sample) | `θ↦exp(iθ)` | `(i/2π)·ia=−a/2π`, as Conventions line 197 | agree |
| C5a.3 Weil curvature (sample) | `θ_t=tθ` | `t(Ω−½[θ,θ])+½t²[θ,θ]=tΩ+((t²−t)/2)[θ,θ]`; rank one `CS=−θ/2π` | correct |
| C5a.4 Koszul (sample) | degrees; trivial group | `|e_i|=2d_i−1`, `|P_i|=2d_i`; empty system gives `ℝ` | consistent |
| C5a.5 page (sample) | `z_i∈E^(0,2d_i−1)` | `d_(2d_i)` lands in `E^(2d_i,0)`; `π₁(BK)=0` | well-formed |
| C5a.6 Poincaré (sample) | SU(3), U(2), trivial | `3+5=8`, `1+3=4`; `χ=P(−1)=0`; trivial group `1` | agree |
| C5a.7 degrees (sample) | E8, SU(n), `SU(2)/N(T)` | `3,15,23,27,35,39,47,59` sum 248; `4..2n` / `3..2n−1`; `ℤ,0,ℤ/2` | agree |
| C5a.7 exercise (sample) | strict upper triangular, n = 2 | 1-dimensional abelian; centre ⊄ derived `=0` | counterexample holds |
| C7.AdjointHopf basis (sample) | three matrices | each `A*=−A`, trace 0, independent | basis of su(2) |
| C7.AdjointHopf Check (sample) | `Z=diag(1,−1)` | `X=0`, `Y=diag(−i,i)`, `X+iY=Z` | correct |
| C7.AdjointHopf roots (sample) | `0,x−y,y−x` | `e₂=−(x−y)²`, `p₁=(x−y)²=c₁²−4c₂`; Zentner line 50 | agree |
| C7.AdjointHopf on HP¹ (sample) | `c₁=0`, `⟨u,[HP¹]⟩=1` | `⟨p₁(E),[HP¹]⟩=−4`; `ε¹⊕P` gives `p₁=e(P)²=0` | no section, not stably trivial |
| C7.1 L₃ | `q₃=2⁶B₆/6!` | `2/945`; `q₁q₂−3q₃=−13/945`; `q₁³−3q₁q₂+3q₃=62/945` | correct |
| C7.1 Checks | CP⁶; HP³; HP² | `(2170−1911+686)/945=1`; `p=1+4u+12u²+8u³`, `(496−624+128)/945=0`; `(49−4)/45=1` | match signatures |
| C7.2 half-argument | 2k roots, degree 2k | `2^(2k)·2^(−2k)[∏x coth x]_(2k)` | equal |
| C7.3 Whitney correction | L on RP⁴ | `p₁(L⊕L)=−c₁(L_ℂ)²=y²≠0` in `H⁴(RP⁴;ℤ)=ℤ/2`, `p(L)=1` | detects |
| C7.3a | `m=2^k` | `(1+a)^(m−1)=Σ_(j<m)a^j`; `w̄_(m−1)=a^(m−1)`; RP⁸↛ℝ¹⁴ | correct; not statable (R02) |
| C3.3 Wu | `Sq¹w_j` | `C(j−2,0)w₁w_j+C(j−1,1)w_(j+1)` | `w₁w_j+(j−1)w_(j+1)` |
| C3.6 involution | antipodal map on `S^(2r)` bundle | orientation of `x^⊥` taken with `−x`, so `e↦−e`; fixed ring `R[p₁..p_(r−1),e²]` | correct |
| C1.1d table | `[S¹,O(2)]`, `[S¹,O(k≥3)]`, `[S²,O(k)]` | `ℤ⋊ℤ/2`, `(ℤ/2)²`, `ℤ/2` | agree |
| C5.1 Chevalley | semisimple complex summand | pinned iso needs an algebraically closed field of characteristic 0, nondegenerate Killing form, splitting Cartan | met (R05) |

## Not verifiable

- Milnor–Stasheff §§5, 9–15, 18–19, Appendix C and Theorems 10.4 and 15.3; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3. The manifest settles these as uncertified; they are cited by locator and I did not read the text.
- Bott–Tu §§6, 11–14, 20–23: uncertified (Springer book).
- H. Cartan, *La transgression dans un groupe de Lie…* (proposed in R06): not in the manifest and not fetched. Its contents are not asserted here beyond dupont-ccc's citation of it.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, page 1: the source says "skey-adjoint" for the endomorphisms defining su(E); it should be "skew-adjoint"; affects nothing.
- **Error** in zentner-instanton-sheet2 at Exercise 3, hint, page 1: the source identifies BSU(2) with HP¹ ≅ S⁴; it should be HP^∞, whose 7-skeleton is HP¹ = S⁴, which is what the cellular-approximation hint needs; affects nothing.
