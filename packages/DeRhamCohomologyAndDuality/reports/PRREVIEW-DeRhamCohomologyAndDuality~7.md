# Review of DeRhamCohomologyAndDuality (pull request #2085 at aa9b119)

**Verdict:** needs changes

This is a full review of the folder at aa9b119, which has 697 changed lines since 420558d.

- All four findings of the previous review are repaired.
- The gate passes and the dependency check reports no problem.
- Seven findings remain, one of them blocking. R01: §§3.1–3.2 claim as this roadmap's two pieces of homological algebra that Tau Ceti has at the pin.
- The other six are P3:
  - pinned declarations the routes restate without naming;
  - a misdescribed adjacent roadmap;
  - a characterization that does not accept the stated inputs;
  - missing locators;
  - stale attributions;
  - the pull request's title.

## Previous findings

- **R01 (re-raised): restore the K6.1 consumer record.** Repaired.
  - `README.md:86–88` reads: "The open-pair comparison and compact-support formula that ComplexKahlerGeometry K6.1 uses for analytic cycles are their boundaryless instances, consumed from §§2.4, 3.1–3.3 and 4.1".
  - `## Downstream consumers` is back at `:842–853`.
  - The K5a sentence stays in *Scope* (`:77–80`).
  - ComplexKahlerGeometry at the head of #1234 still says that K6.1.RelativeIntegration "owns these boundaryless open-pair statements" (`TauCetiRoadmap/ComplexKahlerGeometry/README.md:1980`). That pull request settles this by a rebase; no edit here can.
- **R02: Layer 1 on Tau Ceti's carrier.** Repaired.
  - `README.md:293–297` reads: "say that `φ` *has local primitives* when every `x ∈ M` lies in an open `U` carrying some `g : M → F` with `TauCeti.IsPrimitiveOn φ g U`".
  - The headline at `Suggested.lean:58–62` is wider than the form proposed (`[IsManifold I 1 M]`, no `FiniteDimensional`). It is still true at that width (row 4).
  - The contrast the finding quoted is rewritten at `:281–289`.
  - A related gap remains: Tau Ceti also has the continuous-path integral of closed forms (R02 below).
- **R03: §2.4 statable, and the docstring's reasons.** Repaired.
  - `Suggested.lean:93–119` states §2.4 with its three abbreviations.
  - The docstring (`:21–35`) names only §§3.3, 4.1 and 4.2, and its reasons hold at the pin. `SmoothSingular/Integral.lean` has only `integral_zero`, `_smul`, `_add`, `_ofFunction` and `_smoothSingularSubcomplexMap_app`, and no Stokes. No `HomologicalOrientation` is built from a `Manifold.Orientation`.
- **R04: contracts at the pin.** Repaired.
  - *From Tau Ceti* (`:168–245`) names the pinned declarations with their files.
  - `smoothSingularChainComplex` and `smoothToSingular` no longer occur.
  - The DifferentialGeometry contract (`:247–254`) keeps only 8.3's equivalence, 8.4 and 8.5.
  - The support-enlargement law is cited as `TauCeti.HomologicalOrientation.localHomologyRestriction_fundamentalClassOn_of_subset` (`LocalHomology/FundamentalClass.lean:161`), which is exactly that law.

## R01 (P2) — §§3.1–3.2 claim as this roadmap's the relative coordinates and the kernel comparison that Tau Ceti has

**Location.**
- `README.md:35`, owned: "the algebraic comparison of a cone with a kernel".
- `:586`: "the identification with Mathlib's cocone and its signs is this roadmap's".
- `:602–604`: "build the comparison from its shifted cone to its kernel: a chain map, a quasi-isomorphism".
- The Check at `:617`.

**Claim.** Both objects are pinned declarations. They hold for any map of `ℤ`-indexed complexes of modules, and the extended de Rham complexes are such complexes.

- `CochainComplex.mappingCocone.relativeCoordinates f p q hpq : (mappingCocone f).X p ≃ₗ[R] K.X p × L.X q` negates the second projection. It comes with:
  - the differential `(a, b) ↦ (d a, f a − d b)` (`relativeCoordinates_d`);
  - criteria for cocycles and coboundaries;
  - naturality in maps of pairs (`relativeCoordinates_map`).

  With `f` the restriction to `W`, this is §3.1's coordinate isomorphism, signs included.
- `CochainComplex.mappingCocone.quasiIso_lift_of_shortExact`: for a short exact `0 → X₁ → X₂ → X₃ → 0`, the lift `X₁ ⟶ mappingCocone S.g` is a quasi-isomorphism. The Check at `:617` is `CochainComplex.mappingCocone.acyclic_mappingCocone_id`.

The direction at `:602` is also wrong: there is no canonical chain map from the cocone to the kernel. Take `φ : ℝ² → ℝ`, `(k₁, k₂) ↦ k₁`, in degree 0. Then `H⁰(cocone) = {(0, k₂)}`, and every `(k₁, k₂) ↦ k₂ + c·k₁` is a chain map inducing the isomorphism. The canonical map is the lift `k₂ ↦ (0, k₂)` from the kernel.

**Witness.**
- Tau Ceti `TauCeti/Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean`:
  - `:54` declares `relativeCoordinates`;
  - `:76` states "In relative coordinates the shifted cone differential is `(a, b) ↦ (d a, f a - d b)`";
  - `:136` is `relativeCoordinates_map`.
- `MappingCocone/Basic.lean:147` and `:221`; both declarations elaborate at the pin.

**Repair.**
- *Scope* `:35`: replace "the algebraic comparison of a cone with a kernel" by "the compatibility of Tau Ceti's kernel-to-cocone quasi-isomorphism with the connecting maps".
- *From Tau Ceti*: add
  - `CochainComplex.mappingCocone.relativeCoordinates`, `relativeCoordinates_d`, `d_relativeCoordinates_symm_eq_zero_iff`, `relativeCoordinates_symm_mem_range_d_iff` and `relativeCoordinates_map` (`Algebra/Homology/HomotopyCategory/MappingCocone/Relative.lean`);
  - `CochainComplex.mappingCocone.quasiIso_lift_of_shortExact` and `CochainComplex.mappingCocone.acyclic_mappingCocone_id` (`MappingCocone/Basic.lean`).
- §3.1: state that the coordinates are Tau Ceti's `relativeCoordinates` for the extended restriction, which give the degree-`q` term and the differential of the *Conventions*. Keep the connecting-map sign `δ[b] = −[(0, b)]` and its witness as this roadmap's.
- §3.2: "For a degreewise surjective cochain map with kernel `N`, the lift `N ⟶` cocone is a quasi-isomorphism (`quasiIso_lift_of_shortExact`); prove that it is compatible with the connecting maps, including the sign." Replace the Check at `:617` by a Check on that sign.

**Test.** On §3.1's sign witness, with `f` the restriction to `ℝ ∖ {0}`, `relativeCoordinates_d` sends `(0, b)` with `db = 0` to `(0, 0 − 0) = 0`. This is the cocycle of the *Conventions*.

## R02 (P3) — Three routes restate pinned declarations without naming them

**Location.**
- §1.2, `README.md:331–341`: the lift integral, its independence of the lift, concatenation, reversal, homotopy invariance, naturality, agreement with `TauCeti.pathIntegral`, and vanishing loop integrals.
- §2.3, `:478–485`, with *Needs* "AlgebraicTopology Stage 2 (chain homotopy of a homotopy)".
- §2.4, `:510–513`: "by the five lemma on the short exact sequences of chains of the two pairs".

**Claim.**
- **§1.2.** It generalizes Tau Ceti's `TauCeti.pathClassIntegral` from closed `C¹` forms to forms with local primitives, but never names it.
  - `TauCeti.pathClassIntegral` is defined by the same lift through `TauCeti.PrimitiveSpace`.
  - For closed `C¹` forms its API covers every property listed: `pathClassIntegral_mk_eq_sub`, `PrimitiveSpace.value_monodromy`, `pathClassIntegral_trans`, `pathClassIntegral_symm`, `pathClassIntegral_mk_eq_pathIntegral`, `pathClassIntegral_mpullback`, `periodHom` and `mem_exactForms_one_iff_periodHom_eq_zero`.
  - Neither *Scope* (`:50–51`) nor *From Tau Ceti* lists it.
- **§2.3.** The singular chain homotopy of a homotopy is Mathlib's `TopCat.Homotopy.singularChainComplexFunctorObjMap`, not a roadmap target.
- **§2.4.** The five-lemma step is Tau Ceti's `SSetPair.quasiIso_chainComplexMap`, and its dual is `SSetPair.quasiIso_cochainComplexMap`.

**Witness.**
- Tau Ceti `TauCeti/Geometry/Manifold/DeRham/Period.lean`:
  - `:90`, where `pathClassIntegral` lifts through `PrimitiveSpace.isCoveringMap_proj`;
  - `:197`, `:313` and `:405`.
- Mathlib `Mathlib/AlgebraicTopology/SingularHomology/HomotopyInvariance.lean:49`.
- Tau Ceti `AlgebraicTopology/SimplicialSet/Homology/Relative/Basic.lean:145` and `AlgebraicTopology/Cohomology/Relative.lean:90`.

**Repair.**
- **§1.2.** Add an API bullet: for a closed `C¹` form with complete `F` on a finite-dimensional Hausdorff smooth `M`, `∫_γ φ = TauCeti.pathClassIntegral φ ⟦γ⟧`, and Tau Ceti's API is the closed case of each property listed. Then list these declarations from `Geometry/Manifold/DeRham/Period.lean` in *Scope* and *From Tau Ceti*:
  - `TauCeti.pathClassIntegral`;
  - `TauCeti.periodHom`;
  - `TauCeti.PrimitiveSpace.value_monodromy`;
  - `TauCeti.pathClassIntegral_mk_eq_pathIntegral`;
  - `TauCeti.mem_exactForms_one_iff_periodHom_eq_zero`.
- **§2.3.** Replace "AlgebraicTopology Stage 2" by Mathlib's `TopCat.Homotopy.singularChainComplexFunctorObjMap`. The smooth prism can be Mathlib's `SSet.Homotopy.chainComplexMap` (`Mathlib/AlgebraicTopology/SimplicialSet/Homology/HomotopyInvariance.lean:88`), applied to the simplicial homotopy that `Φ` induces on `TauCeti.smoothSingularSubcomplex I M`.
- **§2.4.** Name `SSetPair.quasiIso_chainComplexMap` and `SSetPair.quasiIso_cochainComplexMap` in the route and in *Needs*, and add both to *From Tau Ceti*.

**Test.** The angular form on `ℂ ∖ {0}` is smooth and closed, so `TauCeti.periodHom` at the unit loop is the `2π` of the §1.2 Check.

## R03 (P3) — TangentialBordism §2.1 is misdescribed, so the stated difference from Layer 5 is not one

**Location.** `README.md:73–77`: "TangentialBordism §2.1 proves parametric transversality to a closed embedded submanifold with a dense set of good parameters, … an arbitrary smooth map `j : N → V` into a vector space, with a Haar-null exceptional set".

**Claim.**
- At its open head, TangentialBordism §2.1 proves that the bad parameters form a null set. On a vector space, `TauCeti.IsNullSet` means Haar-null, so "Haar-null" is no difference.
- The remaining difference, a map instead of a submanifold, is the diagonal case:
  - `F_p` is transverse to `j` iff `(x, y) ↦ (F(x, p), j(y))` is transverse to `Δ_V ⊂ V × V`.
  - This holds because `(D_xF u + w, Dj v + w)` spans `V × V` iff `(u, v) ↦ D_xF u − Dj v` is onto.
  - Universal transversality of that family is exactly §5.2's `htotal`.
- `j : N → V` should be `j : W → V`, the source used throughout Layer 5.

**Witness.**
- `TauCetiRoadmap/TangentialBordism/README.md:513–514` at #942's head 7022ba9: "form a `TauCeti.IsNullSet` in S, so the good parameters are dense".
- Tau Ceti `Geometry/Manifold/Measure.lean:36`: every Haar measure of every chart image of the set vanishes.

**Repair.** Replace the sentence with: "TangentialBordism §2.1 proves parametric transversality to a closed embedded submanifold, with a null set of bad parameters, and relative Whitney approximation into a manifold. Layer 5 is its flat case against a smooth map `j : W → V`, transversality of `(x, y) ↦ (F(x, p), j(y))` to the diagonal of `V × V`, stated on `TauCeti.IsRegularParameter` so that it is statable at the pins, and proved by its own route. §2.5 here prescribes boundary collar data for fillings into a vector space."

**Test.** Take `F = x² + p` and `j = 0` on `W = 0`. Then `(2xu + w, w)` spans `ℝ²` iff `x ≠ 0`, so the bad set is `{0}` both ways, as in §5.2's Check.

## R04 (P3) — §4.1 characterizes `o_h` by a declaration that does not take `o`

**Location.** `README.md:649–653`: "boundaryless manifolds `N` over any real model, with an orientation `o` … (a `TauCeti.HomologicalOrientation` of `N` … whose local orientation at each point is `TauCeti.localOrientationOfManifoldOrientation`)".

**Claim.** At the pin, `TauCeti.localOrientationOfManifoldOrientation` takes only an orientation over `𝓘(ℝ, E)`, with `E` an inner-product space, charts in `E` and index `Fin (n + 1)`. It therefore applies neither to `o` over a general `I` nor in dimension 0, the dimension of §4.1's two-point Check (`:699–700`).

**Witness.** `TauCeti/AlgebraicTopology/Singular/LocalHomology/Orientation/Chart.lean:202` elaborates to `[InnerProductSpace ℝ E] … [ChartedSpace E M] … → Manifold.Orientation (modelWithCornersSelf ℝ E) M (Fin (n + 1)) → finrank ℝ E = n + 1 → (x : M) → LocalOrientation M x (n + 1)`.

**Repair.** Replace the parenthetical with: "… whose local orientation at `x` is, in positive dimension `n`, `TauCeti.localOrientationOfManifoldOrientation` of `o` transported along AlgebraicTopology 6.3's passage from `I` to `𝓘(ℝ, EuclideanSpace ℝ (Fin n))` through a linear equivalence `E ≃L[ℝ] ℝⁿ`, and in dimension `0` the signed point class `ε_o(x)[x]`". AlgebraicTopology on main uses that passage (`TauCetiRoadmap/AlgebraicTopology/README.md:1433–1434`).

**Test.** On the two-point Check, the local images `[a]` and `−[b]` give the class `[a] − [b]` and the pairing `f(a) − f(b)`.

## R05 (P3) — The headline theorems §2.4 and §3.3 carry no locator

**Location.**
- §2.4 (`README.md:500–520`) and §3.3 (`:621–627`) cite no source.
- §§2.3, 2.5 and 3.2 have neither a locator nor a clause saying that the statement is this roadmap's.

**Claim.** Every theorem needs a locator. §2.4 and §3.3 are the relative forms of the smoothing theorem and of the de Rham theorem. DifferentialGeometry cites both, with locators in the same edition of Lee that this README already lists.

**Witness.**
- `TauCetiRoadmap/DifferentialGeometry/README.md:838–839` on main: "The smoothing theorem [Lee, Thm. 18.7]".
- `:852` there: "`deRhamEquiv` … [Lee, Thm. 18.14]".
- `README.md:500–520` and `:621–627` here contain no bracketed source.

**Repair.**
- §2.4: add "(the absolute case is [Lee, Thm. 18.7]; the relative form is this roadmap's)".
- §3.3: add "(the absolute case is [Lee, Thm. 18.14]; the relative form is this roadmap's)".
- §§2.3, 2.5 and 3.2: add one clause each saying that the statement is this roadmap's.
- Add "2.4" and "3.3" to the `cited_for` of `lee` in the sources manifest.

## R06 (P3) — Four attributions are stale or inexact

- **`README.md:240`** cites `levelSetChart`. The pinned name is `TauCeti.levelSetChart` (`Analysis/Fredholm/LevelSet/Basic.lean:83` opens `namespace TauCeti`; the definition is at `:118`).
- **`:176–177`** says the flow is "jointly smooth in finite dimensions".
  - `TauCeti.contMDiffOn_flowOf` (`Geometry/Manifold/Flow/Basic.lean:124`) is stated under `variable [T2Space M] [BoundarylessManifold I M] [CompleteSpace E]` (`:79`).
  - Add "on a Hausdorff boundaryless manifold". §2.2 uses the flow only on the boundaryless interior.
- **`:857–858`** (*Prior work*) says "the de Rham carriers consumed from DifferentialGeometry". These carriers are Tau Ceti's (`:193–199`). Write "consumed from Tau Ceti".
- **`:852–853`** reads: "Citations of these targets as DR.3.8 and DR.4.4 refer to §§3.1–3.3 and §4.1 here."
  - `roadmaps grep 'DR\.(3\.8|4\.4)'` over main (01daf25) and the 461 open heads finds only this README.
  - ComplexKahlerGeometry cites these targets as DG8.3, DG8.4 and DG9.3 (main `:1382`, `:1396`).
  - Delete the sentence.

## R07 (P3) — The pull request's title and description say the opposite of the head

**Location.**
- The title: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- The description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.**
- At aa9b119 the README names K6.1 as a consumer (`:86–88`, `:844`).
- It cites ComplexKahlerGeometry as a supplier nowhere; K5a appears only as an adjacent roadmap (`:77–80`).
- The change is also much wider than the title says: Layer 1 is recast, §2.4 is stated in Lean, and the contracts are repointed to the pin.

**Witness.** `grep -n ComplexKahler README.md` returns lines 77, 87, 397 and 844. None of them is a contract line or a *Needs* line.

**Repair.** Retitle and redescribe the pull request:
- Layer 1 on Tau Ceti's local primitives;
- §2.4 stated in `Suggested.lean`;
- contracts on the pinned declarations;
- K6.1 kept as the consumer of §§2.4, 3.1–3.3 and 4.1.

## Verified sound

**Gate**, run on this head:

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's gate adds `build=0`.

**Dependency check** (`--movable`, the board's merge order, main):

```text
depcheck: 237 roadmaps, 2309 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The roadmap is at line 395 of 398 in the merge order.

**Folder.**
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- The diff outside the folder is empty.
- No process word, pull-request number or LaTeX delimiter appears, apart from the stale old-numbering sentence in R06.

**Lean.**
- `lake env lean` on `Suggested.lean` gives only five `sorry` warnings (lines 58, 78, 116, 149, 162).
- A scratch copy with `#check @name` for all 11 declarations elaborates. Each elaborated type matches its README statement:
  - §1.3 carries `[IsManifold I 1 M] [SimplyConnectedSpace M]`;
  - §2.2 and §2.4 carry `[FiniteDimensional ℝ E] [IsManifold I ∞ _] [T2Space _] [SigmaCompactSpace _]`, and §2.4 also carries `hW : IsOpen W`;
  - §5.2 carries four `FiniteDimensional` instances, `[BorelSpace P]` and an add-Haar `μ`;
  - §5.3 carries three `FiniteDimensional` instances, `hnonneg`, `hzero` and `hgood`.
- The dropped-binder lead on `incidenceEquation` (no `NormedSpace` instances) is benign: its body is a subtraction, and every theorem that uses it carries the instances. No declaration was changed, so nothing had to be rechecked.
- The imports are `Mathlib` plus four `TauCeti.*` modules, all used.

**Padding probe.** Each `sorry` was replaced by `first | rfl | simp | infer_instance | trivial | aesop | exact …`. All five theorems fail (errors at lines 62, 84, 119, 157 and 172), so there is no padding. §2.4 does not close by `SSetPair.quasiIso_chainComplexMap` alone either: its two `QuasiIso` instances need DifferentialGeometry 8.3.

**Headlines.**
- The Summary's end theorems are §§1.3, 2.2, 2.4, 3.3, 4.1, 4.2 and 5.3.
- `Suggested.lean` states §§1.3, 2.2, 2.4 and 5.3, plus §5.2.
- Its docstring names §§3.3, 4.1 and 4.2 as not statable, with reasons true at the pin: there is no cochain map from forms to smooth singular cochains, and no tangent-to-homological orientation.

**Library declarations opened at the pins.**
- A scratch file of 104 `#check` lines elaborates (61 Tau Ceti-side, `TopCat`/`TopPair` included; 43 Mathlib). The one exception is `ModelWithCorners.locallyPathConnectedSpace`, whose module is not built; it was read at `TauCeti/Geometry/Manifold/Topology.lean:36`.
- Read in unbuilt modules:
  - `TauCeti.IsLocallyCollared.isCollared` (`Boundary/Collar/Brown.lean:459`, `[CompactSpace N] [T2Space M]`);
  - `TauCeti.compactlySupportedDeRhamComplex.extendByZero` (`DeRham/ExtendByZero.lean:205`);
  - `TauCeti.deRhamCohomology.map_eq_of_homotopy` (`DeRham/HomotopyInvariance.lean:105`, boundary and corners allowed);
  - `TauCeti.exists_mextDeriv_eq_of_simplyConnectedSpace` (`DeRham/SimplyConnected.lean:69`);
  - `TauCeti.integralTopForm_mextDeriv` (`Integration/Stokes.lean:37`);
  - `TauCeti.integralTopForm_mpullback_subtypeVal` (`Integration/OpenSubset.lean:71`);
  - `TauCeti.integralTopForm_ofFunction_finite_zeroDim` (`Integration/ZeroDim.lean:67`);
  - `Topology.IsOpenEmbedding.integralTopForm_mpullback_of_isOrientationPreservingAt` (`Integration/ChangeOfVariables.lean:228`);
  - `TauCeti.pathIntegral` (`Integration/Path.lean:74`);
  - `TauCeti.exists_contMDiffMap_isProperMap_nonneg` (`Exhaustion.lean:71`);
  - the `Period.lean` and `MappingCocone/Relative.lean` declarations of R01 and R02.
- Bodies quoted and used in the table:
  - `TauCeti.IsPrimitiveOn` (`LocalPrimitive.lean:70`): open `U`, `MDifferentiableOn`, and `d g = φ` on `U`.
  - `PrimitiveSpace.isCoveringMap_proj` assumes a closed `C^r` form, complete `F`, finite-dimensional `E`, `T2Space` and `IsManifold I ∞`.
  - `IsPrimitiveOn.isOpen_setOf_eq` and `eventuallyEq_add_const` need only `[IsManifold I 1 M]`.
  - `IsCoveringMap.existsUnique_continuousMap_lifts` needs only `SimplyConnectedSpace` and `LocallyPathConnectedSpace` of the source.
  - `TauCeti.IsRegularParameter` (`GlobalParametric.lean:63`): surjectivity of `(fderiv f (x, l)).comp inl` at every solution.
  - `TauCeti.smoothSingularSubcomplex` (`SmoothSingular/Basic.lean:77`): `ContMDiffOnSubset I ∞` on the full simplex.
  - `TauCeti.HomologicalOrientation` takes `[ChartedSpace E M] [T2Space M] [FiniteDimensional ℝ E]`, with `M E : Type`.
  - `TauCeti.boundaryOrientation` is stated for `modelWithCornersEuclideanHalfSpace (n + 1)`.
  - Mathlib's `ChainComplex.linearYonedaObj` (`CategoryTheory/Abelian/Ext.lean:56`) introduces no sign, so the singular coboundary is `f ∘ ∂`, as the *Conventions* assume.

**Cross-roadmap citations resolved** (main 01daf25).
- **DifferentialGeometry:**
  - 8.3 (`:836–844`); its README allows the sub-simplicial-set implementation that Tau Ceti now has.
  - 8.4 (`:845–851`). The citations tool reported `SmoothSimplex.integral_mextDeriv` as found nowhere, but it is DifferentialGeometry's own target (`Suggested.lean:2628` there), so the report is a false positive.
  - 8.5 (`:852–860`); `deRhamEquiv` is stated at any model `I`, so it covers §4.2's boundary (`Suggested.lean:2667` there).
  - 9.3 (`:872–874`), duality only.
- **AlgebraicTopology:**
  - `:82–85` names DG9.3, as `README.md:69–71` here says.
  - `:1360–1435` plans `[M, ∂M]`, the pair map `(M, ∂M) → (M, U)` and the passage to the Euclidean model.
- **ComplexKahlerGeometry:** K5a at `:30–34` and `:939`; K6.1 at `:1382` and `:1396`.
- **HeegaardFloer:** F0.S is §2.1 (`:20`, `:71`).
- **GeometricTopology:** on main.
- **TangentialBordism §2.1:** at #942's head, `:408` and `:498–514` (R03).

**Ownership against open pull requests** (the sibling checkouts plus `roadmaps grep` over 461 heads).
- **#886 DifferentialGeometry** (head b5e32fc):
  - `:55–72` assigns Layers 1–5 and §4.1 here.
  - `:1969–1998` puts 8.3 on Tau Ceti's carriers, with its own Mayer–Vietoris route for corners, so §2.3 is not an upward input to it.
- **#1652 AlgebraicTopology:** `:90–95` calls Layer 5 an analogue proved by its own route.
- **#1797 AlgebraicTopology:** `:88–100` and `:2410–2425` give §4.1 the integration comparison and give AT6.3 the class datum, consistent with §4.1 here.
- **#1234 ComplexKahlerGeometry:** see the previous R01 above.
- **#1807, #1808 and #1854 ComplexKahlerGeometry:** K6.1 is unchanged from main.
- **#946 CalibratedGeometry:** consumes Tau Ceti's period map; no overlap.
- Greps for `PrimitiveSpace`, inward domination, strictly inward fields, `IsRegularIncidenceParameter`, `incidenceEquation` and "relative de Rham" find no other owner. The relative de Rham hits in CrystallineCohomology and AbelianSchemesAndArithmeticModuli are algebraic, a different object.

**Previous-findings check.** All four are repaired, as stated above.

**Adversarial table** (values computed at this head).

| # | Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- | --- |
| 1 | Scope `:82–88`, consumers `:842–853` | K6.1 main; #1234 head | Main `:1382` "DG8.4's open-pair cone"; `:1396` "DG9.3's compactly supported relative integration formula and DG8.3's … relative-chain comparison"; DG 8.3–8.4 and 9.3 are absolute only; the README says "single owner, this roadmap" and records the consumer; #1234 `:1980` "owns these boundaryless open-pair statements" | Repaired; #1234's rebase is outside this folder |
| 2 | §1.1 predicate (sample) | `dx`; `x dy`; angular form; `d(|x|^(3/2))`; `d(x² sin(1/x))` | `g = Re`: holds. Mixed partials `0 ≠ 1`: fails. Local branches of `arg`, loop integral `2π`: local yes, global no. Derivative `(3/2)|x|^(1/2) sgn x`, continuous, not `C¹`: holds. `g′(0) = 0`, `g′(x) = 2x sin(1/x) − cos(1/x)`: holds, though `φ` is discontinuous | Pass |
| 3 | §1.2 integral (sample) | angular loop once, twice, reversed; `dx` along `t + iW(t)`; `0 → 1 → 3` with `Re`, `Re + 7`; constant path; two lifts | `2π`, `4π`, `−2π`; `Re 1 − Re 0 = 1`; `(1 − 0) + (10 − 8) = 3`; `0`; `(v₁ + c) − (v₀ + c) = v₁ − v₀`. The closed smooth case is `TauCeti.pathClassIntegral` (same lift, `Period.lean:90`) | Pass; citation is R02 |
| 4 | §1.3 headline, Lean (sample) | proof inputs at the pin; slit plane; `ℂ ∖ {0}`; `S¹` with `dθ`; a point; `∅`; `1/z` | Only `[IsManifold I 1 M]` is used (`LocalPrimitive.lean:132`); the lifting criterion needs simply connected and locally path-connected; `arg`; loop `2π ≠ 0`, so no global primitive; period `2π`; `g` constant; `SimplyConnectedSpace ∅` is false; `Log`, and `∮ dz/z = 2πi` | Pass |
| 5 | §2.1 cone (sample) | `[0,∞)` at `0`; quadrant, `(1,0)`; interior point; convexity step | Need `tv ≥ εt`, so the cone is `(0,∞)`; `(t, −εt/2) ∈ ball((t,0), εt) ∖ C`, so excluded; all of `E`; `y + t(q−x) + w = (1−t)y + t(q + (y−x) + w/t)` with `‖(y−x) + w/t‖ < 2ε₀` | Pass |
| 6 | §2.2 headline, Lean (sample) | `[0,∞)` with `Φ = x + (1−t)²`; `[0,1]` with `X = 1/2 − x`; `X = x(1−x)`; boundaryless; `t > 1` | `Φ(0,x) = x + 1`, `Φ(1,x) = x`, `x > 0 ⇒ Φ > 0`; `r(0) = 1/2 − 1/(2e) ≈ 0.316`, `r(1) ≈ 0.684`; `r(0) = 0`, not interior; `r = id`; `(1−t)² ≥ 0`, so only the forward semiflow is used | Pass |
| 7 | §2.3 transfer (sample) | both identities; `N = M`; the `[0,∞)` witness; `S¹` with `N` a point | `i_M j_* s r_* = j_* i_N s r_* ~ (jr)_* ~ id`; `j_* s r_* i_M = j_* s i_N r_* ~ (jr)_* ~ id`; inverse `s`; `[0] ↦ [1]`, `∂(t ↦ t) = [1] − [0]`; composite `0` on `H₁(S¹) = ℝ` | Pass; citation is R02 |
| 8 | §2.4 headline, Lean (sample) | `(ℝ, ℝ∖{0})`; `W = ∅`; `W = X`; graph of a nowhere-differentiable `w` | `0 → H₁ → ℝ² →(sum) ℝ → H₀ → 0` gives `H₁ ≅ ℝ`, `H₀ = 0`; `2t − 1` has `∂ = [1] − [−1] ↦ (1, −1)`; `![∅]` has no simplices, the absolute case; the cokernel of the identity is `0`; smooth simplices into the graph are constant, smooth relative `H₁` is the reduced `ℝ^(W)`, singular is `0` | Pass; R02, R05 |
| 9 | §2.5 (sample) | `r(2)`, `r(−1)`, `r(0.3)`; `r(3,4)`; `|sin θ|`; face data | `1`, `0`, `0.3`; `(0.6, 0.8)`; not differentiable at `θ = 0`; faces `(y−z)²`, `(x−z)²`, `(x−y)²`; Hessian diagonal `2`, off-diagonal `−2`; along `(t,t,t)`: `½t²(6 − 12) = −3t² < 0` | Pass; R05 |
| 10 | §3.1 signs (sample) | `d²`; cocone coordinates; sign witness; extension `b̃`; degree `0` | `(0, dα|_W − dα|_W + d²β) = 0`; Mathlib cocone in `(α, g)`: `(dα, −α|_W − dg)`, which is `(dα, α|_W − dβ)` for `g = −β` and equals `relativeCoordinates_d`; `−(b(1) − b(−1)) = −1`, so `−[(0,b)] ↦ 1 = b(∂c)`; `(db̃, 0) + (0, b) = d(b̃, 0)`; `H⁰(ℝ, ℝ∖{0}) = 0` | Signs pass; ownership is R01 |
| 11 | §3.2 (sample) | `ψ dx` with `β = Ψ|_W`; projection `ℝ² → ℝ`; `id`; `1/x` | `1 − (1 − 0) = 0` and `d(Ψ, 0) = (ψ dx, Ψ|_W)`; `H⁰(cocone) = {(0,k₂)}`, where every `(k₁,k₂) ↦ k₂ + c·k₁` is a chain map and the canonical map is the lift `k₂ ↦ (0, k₂)`; `acyclic_mappingCocone_id`; `1/x` does not extend | Direction and ownership are R01 |
| 12 | §3.3, not statable (sample) | `(ℝ, ℝ∖{0})`; `(ℝ², ℝ²∖{0})`; statability | `H¹ = ℝ²/ℝ = ℝ`; `H² ≅ H¹(W) = ℝ`, `H¹(X,W) = 0`, `−(0 − 2π) = 2π`; no Stokes for smooth simplices at the pin | Not statable, as stated; R05 |
| 13 | §4.1, not statable (sample) | `S¹`, both orientations; two points; `ℝ` with `K = [−1,1]`; `K′ = [−3,3]`; `2t − 1`; the input of `o_h` | `±2π`; `f(a) − f(b)` against `f(a) + f(b)`; `4t − 2` has `∂ = [2] − [−2] ⊂ ℝ∖K` and `∫_{−2}^{2} ψ = 1`; `8t − 4` gives `1`; `±1 ∈ K`, so no relative cycle; `deRhamHom[ψ dx] ∈ H¹(ℝ) = 0` while the pairing is `1`; the chart declaration needs `𝓘(ℝ,E)`, an inner product and `Fin (n+1)` | Pass except R04 |
| 14 | §4.2, not statable (headline) | `D¹`, `α = 0`, `β = c₊, c₋`; `[0,1]` with `dx`, `x` | `0 − (c₊ − c₋)`; `1 − (1 − 0) = 0`, and `(dx, x) = d(x, 0)` | Pass |
| 15 | §5.1 (sample) | `((1,2),3)`; `x² + p`, `W = 0`, `p = −1, 0, 1`; `j = id`; avoidance | `1 + 3 − 2 = 2`; derivatives `±2` (regular), `0` (not), empty fibre (regular); `(u,v) ↦ 2xu − v` is onto; `dim E + dim W < dim V` leaves no onto map | Pass |
| 16 | §5.2 headline, Lean (sample) | `x² + p`; `x²`; `V = 0`; `P = 0`; the diagonal | Bad set `{0}`; `htotal` fails at `(0,p)` and every `p` is bad; no bad `p`; Haar `= c·δ₀`, so the statement is "`0` is regular", given by `htotal`; `(D_xF u + w, Dj v + w)` spans iff `D_xF u − Dj v` is onto | Pass; R03 |
| 17 | §5.3 headline, Lean (sample) | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `β(x) > 0`; `β(x) = 0`; `f = β = x²`, `j = 0`; `V = 0` | `4`; `q ↦ β(x)q` is onto; a minimum gives `Dβ(x) = 0`, and `hgood` applies; `x²(1+p)` has a zero with derivative `0` for every `p`; `p = 0`, `‖0‖ < r` | Pass |
| 18 | Contracts and stale text | `levelSetChart`; `flowOf`; *Prior work*; DR ids | `namespace TauCeti` (`LevelSet/Basic.lean:83`); boundaryless variable (`Flow/Basic.lean:79`); the carriers are Tau Ceti's (`:193–199`); the grep finds no citing roadmap | R06 |
| 19 | Padding | the five sorried theorems | The one-tactic probe fails at lines 62, 84, 119, 157 and 172 | Pass |

The table covers the 15 sampled targets, the eight headlines (five stated, three not statable) and every target a finding touches.

## Not verifiable

- **Sources.** Lee, *Introduction to Smooth Manifolds* (DOI 10.1007/978-1-4419-9982-5), and Bott–Tu, *Differential Forms in Algebraic Topology* (DOI 10.1007/978-1-4757-3951-0), are recorded as `uncertified` (paywalled). They were not fetched again, so these locators stand on the locator alone:
  - Lee Prop. 2.28;
  - Lee Thms. 9.24–9.26, pp. 222–223;
  - Lee Thms. 6.35–6.36;
  - Bott–Tu Ch. I, §5 and §6.
- **The manifest's `cited_for`.** It lists "2.2" for `lee` and "3.1" for `bott-tu`. The README also cites Lee at §§5.2–5.3 and Bott–Tu at §4.1, and R05 adds §§2.4 and 3.3.
- **The two-owner text at #1234's head.** No edit to this folder can settle it.

## Source issues

- none
