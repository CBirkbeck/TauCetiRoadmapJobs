# Review of DeRhamCohomologyAndDuality (pull request #1768 at 2aaacd8)

**Verdict:** needs changes

🤖 Independent AI review of the repaired head. Six findings: three P2, three P3. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with only `sorry` warnings and contains no padding, and the mathematics of every stated target survived the adversarial pass. The blocking findings are all about ownership and identity: the roadmap builds inward domination that the open DifferentialGeometry revision also builds, it is titled "differential geometry, Part II" inside a folder named for material it no longer owns, and §2.3 re-plans DifferentialGeometry 8.3's smoothing theorem.

## Repair status of the previous review's findings

| Previous | Status at 2aaacd8 |
| --- | --- |
| R01 (P1) duplicate ownership of DifferentialGeometry 6–11 | **Repaired.** The Summary (`README.md:3–20`) and Scope (`README.md:41–50`) import DifferentialGeometry's layers 6–11 by section and own only relative/continuous/fundamental-class/transversality additions. Residue: §2.3 still re-plans 8.3's corners case (R03 below), and the open DifferentialGeometry revision conflicts with this placement (R01 below). |
| R02 (P1) sharp Sard duplicated HeegaardFloer | **Repaired.** Deleted; `README.md:55–56` names HeegaardFloer §2.1 (F0.S) as owner and every Layer 5 map is `C^∞`. |
| R03 (P1) module-system build warning | **Repaired.** `Suggested.lean:1` is `module`; `lake env lean` exits 0 with exactly four `sorry` warnings (lines 54, 73, 109, 122); the worker's gate records `build=0`. |
| R04 (P1) sphere Check false at n = 0 | **Repaired by deletion.** No sphere cohomology computation remains; it is DifferentialGeometry 7.3's. |
| R05 (P2) degree as endomorphism of ℝ | **Repaired by deletion.** The degree is DifferentialGeometry 10's; nothing here states it. |
| R06 (P2) complementary degrees | **Repaired by deletion.** Duality is DifferentialGeometry 9's; the relative complexes here are ℤ-indexed by extension by zero (`README.md:72–73`). |
| R07 (P2) manifold Poincaré hypotheses | **Repaired by deletion.** The Poincaré lemma is DifferentialGeometry 6.2's; `README.md:180–181` cites it for the `C¹` closed complete-coefficient case only. |
| R08 (P3) Checks and layer structure | **Repaired.** Every definition has three or more discriminating Checks (§§1.1, 2.1, 3.1, 5.1, 5.3); every layer ends with Examples and Dependencies; theorems carry `*Needs:*` lines (the definitions §§1.1, 2.1, 5.1 do not: R05 below). |
| R09 (P3) locators | **Partly repaired.** Lee Prop. 2.28, Thms 6.35–6.36 and Bott–Tu I §§5–6 are attached; §2.2's "[Lee, Ch. 9, collar neighbourhoods]" is still a chapter where theorem numbers exist (R04 below). The constructions marked "this roadmap's" (§§2.3–2.5, 3.2–3.3, 4.1–4.2) carry no external locator, which is acceptable for new constructions declared as such. |

## R01 (P2) — Inward domination is built by two open pull requests, and the two heads disagree on who owns the de Rham theory

**Location:** `README.md:251–298` (§§2.1–2.2) and `Suggested.lean:73–80` (`exists_smooth_inward_deformation`). Quote: "the strict inward cone … strictly inward field … forward semiflow … inward domination".

**Claim:** this roadmap owns the strict inward cone, strictly inward fields, their forward semiflow, the proper exhaustion and inward domination (`README.md:28–31`).

**Witness:** the open DifferentialGeometry revision (pull request of that roadmap, head a565de6) plans exactly these objects as its Layer 3.6: `TauCetiRoadmap/DifferentialGeometry/README.md:570–616` at that head ("construct a smooth strictly inward field and its forward semiflow", the strict inward cone with `ball(x+tv,εt)⊆C`, gluing by `exists_contMDiffSection_forall_mem_convex_of_local`, the variational system on `C × L(E,E)`, the proper exhaustion), and its `Suggested.lean:1401` declares `structure InwardDomination` with the same five clauses as the theorem here. Its line 84 says "DeRhamCohomologyAndDuality consumes them for smoothing singular chains", and its lines 1378–1386 say this folder "owns de Rham cohomology …, the de Rham theorem, Poincaré duality …, the Brouwer mapping degree … and the hairy ball theorem", which this head defers to DifferentialGeometry on main (`README.md:41–50`).

Each head is consistent with main on its own. Merged together, inward domination has two owners and the de Rham complex, Mayer–Vietoris, the de Rham theorem, duality, degree and hairy ball have none. A revision of an existing roadmap is never a dependency, so this README is right not to cite the revision's 3.6; but the double build is real and the brief's ownership rule applies to open pull requests that each build an object.

**Exact repair:** this is settled between the two pull requests, not inside this folder. Either the DifferentialGeometry revision drops its Layer 3.6 and consumes nothing from here (then §§2.1–2.2 stay as written), or it keeps 3.6 and, once it is on main, this folder deletes §§2.1–2.3, cites DifferentialGeometry 3.6 in the contracts and in §2.4's `*Needs:*`, and drops `exists_smooth_inward_deformation` from `Suggested.lean`. In both cases the revision's consumer paragraph must stop assigning layers 6–11 to this folder. If the worker cannot act on this inside the package, mark it not actionable with that reason, so that a human chooses.

## R02 (P2) — The roadmap's name is not its folder's

**Location:** `README.md:1` ("# Roadmap: differential geometry, Part II — …"), `Suggested.lean:7` (same title), against the folder `TauCetiRoadmap/DeRhamCohomologyAndDuality/`, the namespace `TauCetiRoadmap.DeRhamCohomologyAndDuality` (`Suggested.lean:35`) and the merge-order entry `DeRhamCohomologyAndDuality`.

**Claim:** this is DifferentialGeometry's Part II.

**Witness:** the house rule names an extension "<that roadmap>, Part II" and the folder is the roadmap's identity: the merge order lists it as `DeRhamCohomologyAndDuality` (line 372 of 373), the metadata and the Lean namespace carry that name, and no `DifferentialGeometryPartII` exists on main, in the open pull requests or on the board. The folder name advertises de Rham cohomology and duality, both of which `README.md:41–47` now assign to DifferentialGeometry 6–9. A reader following AlgebraicTopology's or ComplexKahlerGeometry's citations of "DeRhamCohomologyAndDuality" expects the de Rham theorem and finds relative transversality.

**Exact repair:** rename the folder, the Lean namespace, the metadata and the merge-order entry to `DifferentialGeometryPartII`, keeping the title; a rename is outside the README/Lean edit allowance, so the worker or operator does it. If instead the name `DeRhamCohomologyAndDuality` is to stay, the title and the Lean docstring must drop "differential geometry, Part II" and the folder must own something de Rham-and-duality-shaped, which under this head it does not. Precedent: the folder-identity finding on PolynomialGaloisGroups' Part III.

## R03 (P2) — §2.3 re-plans DifferentialGeometry 8.3's smoothing theorem over models with corners

**Location:** `README.md:300–314` (§2.3) and `README.md:131–133` (contract: "8.3: … the absolute smoothing equivalence for boundaryless Hausdorff σ-compact finite-dimensional manifolds"). Quote: "Applied to §2.2 with `N = I.interior M`, this gives the smooth chain equivalence for every Hausdorff σ-compact finite-dimensional `M` over any real model with corners from the boundaryless case".

**Claim:** DifferentialGeometry 8.3 supplies only the boundaryless case; the corners case is derived here.

**Witness:** DifferentialGeometry on main, `README.md:826–834`, states the smoothing theorem for `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` with no boundaryless hypothesis, and its "Boundary and corners" paragraph (`README.md:63–94`) restricts only layers 3–5 to boundaryless or half-space models. So the corners case is DifferentialGeometry's statement, and §2.3's application plans it a second time. The reason given here, that a face-fixing relative smoothing into a target with boundary fails, is correct (I recomputed the `3`-simplex witness: forced Hessian with diagonal `2` and off-diagonal `−2` gives value `−3t² + o(t²)` along `(t, t, t)`), but it is a defect in DifferentialGeometry's sketched route, not a licence for a consumer to re-plan the theorem; a sketch names a route and does not make it mandatory.

**Exact repair:** in the DifferentialGeometry contract and in §2.4's `*Needs:*`, cite 8.3 as stated, for every model with corners. Reduce §2.3 to its genuinely new content, the transfer lemma for a smooth homotopy retraction (`j : N → M`, `r : M → N`, `j ∘ r ~ id`), stated without the sentence that derives the corners case, or delete §2.3 if nothing here consumes the lemma (§2.4 consumes 8.3 directly). Keep the `3`-simplex counterexample under "Statements that must not enter the library" as the record that the face-fixing route is boundaryless, and let a DifferentialGeometry revision reroute 8.3 through inward domination. On the instance `M = [0, ∞)`, the imported 8.3 gives `H₀ = ℝ` with every point cycle the class of `0`, which is the same value §2.3's Check computes; nothing is lost.

## R04 (P3) — §2.2 cites a chapter where theorem numbers exist

**Location:** `README.md:277–279` ("[Lee, Ch. 9, collar neighbourhoods]") and `README.md:636–637` (References: "Ch. 9 (flows, collar neighbourhoods)").

**Witness:** GeometricTopology's fair-use extract on main (`TauCetiRoadmap/GeometricTopology/references/lee-smooth-collar.md`) locates in Lee, 2nd ed., Ch. 9: Theorem 9.24 (Boundary Flowout, an inward-pointing field flows out from the boundary), Theorem 9.25 (Collar Neighborhood, printed p. 222) and Theorem 9.26 (printed p. 223: a proper smooth embedding `M → Int M` making the inclusion a homotopy equivalence). Theorem 9.26 is inward domination for the half-space model.

**Exact repair:** cite "[Lee, Thms. 9.24–9.26, pp. 222–223]" in §2.2 and in References, keeping the sentence that the general convex model is this roadmap's.

## R05 (P3) — Contract and shape slips

**Location:** `README.md:55–56`, `README.md:166–200` (§1.1), `README.md:251–274` (§2.1), `README.md:526–549` (§5.1), `README.md:610–616`.

**Witness and repair, one item each:**

- `README.md:55–56` lists HeegaardFloer under "It does not own, and imports by section" and then says the theorem is one "which no target here needs". A supplier that nothing consumes is not imported; move the sentence to a plain deferral ("sharp finite-order Sard is HeegaardFloer §2.1's; Layer 5 is `C^∞` and does not need it") outside the import list.
- §§1.1, 2.1 and 5.1 define `HasLocalPotentials`, the strict inward cone and `incidenceEquation`/`IsRegularIncidenceParameter` with API bullets and Checks but no `*Needs:*` line; add one each (Mathlib `ContinuousMap`, `HasFDerivAt`, `Metric.ball`; `ModelWithCorners.isClosed_range`, `I.convex_range`; Tau Ceti `TauCeti.IsRegularParameter`).
- `README.md:610–612` says ComplexKahlerGeometry "consumes §3.2's relative integration of open pairs and §4.1's … formulas (its K6)". On main, ComplexKahlerGeometry's K6 is "Kähler identities and Hodge decomposition" (`README.md:1243`) and the roadmap nowhere mentions relative integration or open pairs; only its open revision has a K6.1 relative-integration contract, and that contract cites this roadmap's former targets DR.3.8 and DR.4.4, which no longer exist. State the consumer as it is on main (its K5a punctured-plane regression, `README.md:939`) or drop the K6 pointer.
- `README.md:265–266` says the inward cone construction glues "from constant local fields by `exists_contMDiffSection_forall_mem_convex_of_local`"; that theorem (Mathlib `Geometry/Manifold/PartitionOfUnity.lean:592`) needs the local sections to be smooth on a neighbourhood and to take values in the convex fibre sets there, and the file's section variables for it include the partition-of-unity hypotheses; name `[T2Space M] [SigmaCompactSpace M]` at that bullet as the Conventions promise. Likewise `exists_contMDiffMap_one_nhds_of_subset_interior` (`:526`) carries `[NormalSpace M]`, discharged for finite-dimensional Hausdorff σ-compact manifolds through local compactness; say so once in the contracts.

## R06 (P3) — The integration comparison's ownership should be stated against AlgebraicTopology's attribution

**Location:** `README.md:456–484` (§4.1) and `README.md:35–37`.

**Witness:** AlgebraicTopology on main assigns "the smooth/constant-system/real-coefficient conversions and the integration comparison" to "DG9.3" (`TauCetiRoadmap/AlgebraicTopology/README.md:84–85`, also `:1205`, `:1320–1321`, `:1338`), while DifferentialGeometry 9.3 on main (`README.md:869–873`) plans duality only and never mentions fundamental classes. So the comparison is planned nowhere on main except here; there is no double owner, but a reader of AlgebraicTopology cannot find it.

**Exact repair:** one sentence in Scope: "AlgebraicTopology 6.3 names DifferentialGeometry 9.3 as the consumer of its classes and owner of the integration comparison; DifferentialGeometry 9.3 plans duality only, and that comparison is §4.1 here."

## Verified sound

**Coverage.** Read all 648 README lines and all 136 Lean lines (8 declarations: 4 definitions with real bodies, 4 theorems); the change set of 1482 lines; the previous review and its nine findings. The diff outside the folder is empty (`git diff --stat origin/main...HEAD` restricted to the complement of the folder prints nothing; `changes.md` records "none"). The folder holds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.DG"`). No `set_option`, no sorried data, no admitted example, no `lemma`, no `Mathlib.<submodule>` import, no pull-request number, process word or local path in the README (grep for the forbidden vocabulary returned only the mathematical word "around"). Mathematics, not algorithms: the Picard-iteration paragraph in §2.2 sketches an ODE existence proof.

**Gate and dependency check.** The worker's gate at this head, quoted as data:

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

I ran the dependency check with `--movable` against the board's merge order and main:

```text
depcheck: 204 roadmaps, 1647 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. The roadmap is listed in the merge order (line 372 of 373); its suppliers DifferentialGeometry, AlgebraicTopology, HeegaardFloer, GeometricTopology and ComplexKahlerGeometry are on main, TangentialBordism (an adjacent roadmap, not a supplier) is at line 10. Every `*Needs:*` line (§§1.2, 1.3, 2.2–2.5, 3.1–3.3, 4.1–4.2, 5.2–5.3) names sections of this roadmap, DifferentialGeometry, AlgebraicTopology, Mathlib or Tau Ceti; none names a later roadmap. No gaps are declared (no readable `design/plan.json`; the README declares none), and no `needs-references.toml` exists.

**Lean.** `lake env lean` on `Suggested.lean` from the worktree exits 0 with exactly the four `sorry` warnings. `import TauCeti.Analysis.Fredholm.LevelSet.GlobalParametric` exists at the Tau Ceti pin. I appended `#check @name` for all eight declarations to a scratch copy and elaborated it once; the elaborated types agree with the worker's dump. The one "dropped binder" lead, `incidenceEquation` losing its `NormedSpace ℝ` instances, is correct: its body is `F (x, p) − j y` and needs only the additive group on `V`; every theorem that uses it carries the normed-space and finite-dimensionality instances explicitly. README and Lean generality agree target by target (table below). Padding probe: each sorried theorem tried with `first | simp | rfl | infer_instance | exact ⟨_, _⟩ | aesop` on the scratch copy; all four fail ("unsolved goals" at the four theorem sites, `aesop` "made no progress" on the last), so nothing is padding. No declaration restates a definition, mirrors a Check or computes a value.

**Headline theorems** (README Summary, `README.md:17–20`):

| Headline | Treatment at the pins |
| --- | --- |
| §1.3 exactness on simply connected domains | Stated: `exists_hasFDerivAt_of_simplyConnected`, on native `C(Ω, ℂ →L[ℝ] F)`, `SimplyConnectedSpace`, `HasFDerivAt`. |
| §2.2 inward domination | Stated: `exists_smooth_inward_deformation`, on native `ModelWithCorners`, `ContMDiff`, `ModelWithCorners.interior`. |
| §3.3 relative de Rham isomorphism | Not statable: no manifold differential forms, exterior derivative or de Rham complex at either pin (Mathlib's `Geometry/Manifold/` has no form carrier; Tau Ceti has no `deRham*` or `SmoothSimplex` declaration). Named in the docstring with the missing carriers. |
| §4.1 integration comparison, §4.2 boundary form | Not statable: no `integralTopForm`, `deRhamHom` or AlgebraicTopology 6.3 fundamental class at the pins. Named in the docstring. |
| §5.3 generic relative transversality | Stated: `exists_isRegularIncidenceParameter_relativeTranslate`; its input §5.2 is stated as `addHaar_setOf_not_isRegularIncidenceParameter`. |

§§2.3–2.4 are also named in the docstring as not statable (no smooth singular chain complex at the pins), which is correct.

**Pinned declarations opened** (Mathlib f6090c70, Tau Ceti 358314d4; paths relative to each library):

| File and line | What it gives, and what the README assumes of it |
| --- | --- |
| Mathlib `Geometry/Manifold/IsManifold/Basic.lean:164–177` | `ModelWithCorners` has `convex_range'` (ℝ-convex range over `ℝ`) and `nonempty_interior'`; `:396` `isClosed_range`. §2.1's "convex, closed, with nonempty interior" is exactly the structure. |
| Mathlib `Geometry/Manifold/IsManifold/InteriorBoundary.lean:103,112,165,321` | `ModelWithCorners.interior`, `.boundary`, `BoundarylessManifold`, `isOpen_interior (hn : n ≠ 0)`. |
| Mathlib `Geometry/Manifold/Instances/Real.lean:207,239` | `modelWithCornersEuclideanQuadrant`, notation `𝓡∂ n`. |
| Mathlib `Geometry/Manifold/PartitionOfUnity.lean:526–530, 592–601` | `exists_contMDiffMap_one_nhds_of_subset_interior` (`[T2Space M] [NormalSpace M] [SigmaCompactSpace M]`, closed `s ⊆ interior t`, value `1` near `s`, `0` off `t`, in `[0,1]`); `exists_contMDiffSection_forall_mem_convex_of_local` (fibrewise convex sets, local smooth sections). |
| Mathlib `Geometry/Manifold/SmoothApprox.lean:81–85, 123–127` | `Continuous.exists_contMDiff_approx_and_eqOn`, `Continuous.exists_contDiff_approx_and_eqOn`: positive continuous tolerance, closed `S`, `U ∈ 𝓝ˢ S`, smooth on `U`; conclusion approximates, agrees on `S`, support contained. |
| Mathlib `Analysis/Calculus/BumpFunction/FiniteDimension.lean:79–80` | `IsOpen.exists_contDiff_support_eq`: `f.support = s`, values in `[0,1]`. |
| Mathlib `MeasureTheory/Integral/CurveIntegral/Basic.lean:123–126` | `curveIntegral` as a Bochner interval integral of `ω (γ t) (γ' t)`: completeness is what makes §1.2's comparison meaningful. |
| Mathlib `AlgebraicTopology/FundamentalGroupoid/SimplyConnected.lean:76` | `SimplyConnectedSpace.paths_homotopic`. |
| Mathlib `Algebra/Homology/HomotopyCofiber.lean:215–222`, `HomotopyCategory/MappingCocone.lean:33` | cofiber differential: first component `−d`, second `φ + d`; `mappingCocone φ = (mappingCone φ)⟦−1⟧`. With the shift's sign this is `(a, g) ↦ (da, −φa − dg)`, the formula at `README.md:395`. |
| Mathlib `Algebra/Homology/Embedding/Extend.lean:116`, `Embedding/Basic.lean:211`, `CategoryTheory/Abelian/Ext.lean:56` | `HomologicalComplex.extend`, `ComplexShape.embeddingUpNat`, `ChainComplex.linearYonedaObj`. |
| Tau Ceti `Analysis/Fredholm/LevelSet/GlobalParametric.lean:63–65, 83–94` | `IsRegularParameter f c l := ∀ x, f (x, l) = c → Surjective ((fderiv ℝ f (x, l)).comp (inl ℝ E Λ))`, the `E`-direction only; `isMeagre_setOf_not_isRegularParameter` needs total surjectivity, Fredholm slices and a finite-order bound and concludes meagre, not null. |
| Tau Ceti `Analysis/Fredholm/LevelSet/Basic.lean:118` | `levelSetChart` from a strict derivative with full range. |
| Tau Ceti `Analysis/Calculus/Sard/OutermostStratum.lean:345–348` | `addHaar_image_criticalPoints_eq_zero`: `C^n` on `U` with `(finrank E)² + 1 ≤ n`, Haar image of critical points null. |
| Tau Ceti `Geometry/Manifold/Boundary/Collar/Brown.lean:458–459` | `IsLocallyCollared.isCollared [CompactSpace N] [T2Space M] (hf : Injective f)`. |
| Tau Ceti `AlgebraicTopology/Cohomology/Basic.lean:60,94`, `Relative.lean:66,156` | `TopCat.singularCochainComplex`, `TopCat.singularCohomology`, `TopPair.singularCochainComplex`, its short complex. |

No smooth singular chain, manifold differential form, de Rham or fundamental-class declaration exists at either pin (grep of Tau Ceti for `SmoothSimplex`, `deRhamComplex`, `deRhamCohomology`, `smoothSingular`; of Mathlib's `Geometry/Manifold` for `DifferentialForm`/`extDeriv`).

**Cross-roadmap citations resolved** (on main at 929496d4, or at the open head named):

| Citation | Resolution |
| --- | --- |
| DifferentialGeometry 0.1, 0.3–0.4, 1.1–1.4, 2.1–2.2, 3, 5.1–5.3, 6.1–6.4, 8.3–8.5, 9, 10, 11 | All present on main (`README.md:268–909`); the names `deRhamComplex`, `deRhamCohomology`, `closedForms`, `exactForms`, `extensionByZero`, `properPullback`, `SmoothSimplex`, `smoothSingularChainComplex`, `smoothToSingular`, `fullSimplex`, `simplexFace`, `SmoothSimplex.integral`, `chainIntegral`, `deRhamHom`, `deRhamEquiv`, `integralTopForm` all occur in the cited items. 8.3's generality: R03. |
| AlgebraicTopology Stages 2, 3, 6.1, 6.3, 6.5; `RelativeTwistedClassDatum` | Present (`README.md:326, 471, 946`; `:1319`, `:1398`); 6.5's degree comparison is downstream of 6.3 as the README says. |
| HeegaardFloer §2.1 (F0.S) | `README.md:1185` on main. |
| GeometricTopology Layer 1 collars | `README.md:205–208` on main, with the Lee Ch. 9 extract. |
| ComplexKahlerGeometry K5a, K6 | K5a (`:570`) with the punctured-plane regression (`:939`); K6 on main is Kähler identities: R05. |
| TangentialBordism §2.1 | At its open head: dense parametric transversality to a closed embedded submanifold and relative Whitney approximation; the object here (Haar-null set, arbitrary smooth `j : W → V`) is different, as the Scope says. |
| DifferentialGeometry open revision | Layer 3.6 inward domination and the consumer paragraph: R01. |
| Prior work `urkud/DeRhamCohomology` | Cited for design only. |

Ownership search by object across the open pull requests (`roadmaps grep` for inward domination and strictly inward fields, relative de Rham, incidence equations and regular incidence parameters, local potentials): the only hits that build the same objects are the DifferentialGeometry revision's 3.6 (R01); RicciFlow's "strictly inward" cones, LefschetzPencils' and SchubertGeometry's incidence equations, MorseNovikov's local potentials of closed forms and the arithmetic "relative de Rham" complexes are different objects.

**Sources.** Both cited books (Lee, Bott–Tu) resolve only to paywalled DOIs: see Not verifiable. The seeded sample is §§1.1, 1.3, 2.1–2.5, 3.1–3.3, 4.1–4.2, 5.1–5.3; all fifteen have computed rows below. Lee's Ch. 9 theorem numbers were checked against GeometricTopology's fair-use extract on main (R04); Lee's Prop. 2.28 and Thms. 6.35–6.36 and Bott–Tu I §§5–6 are cited by locator alone.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances | Values computed | Result; change |
| --- | --- | --- | --- |
| §1.1 `HasLocalPotentials` | `φ = dx`; `φ = x dy`; angular form on `ℂ∖{0}`; `d(|x|^(3/2))` | `g = Re` has `Dg = dx`; a potential of `x dy` would have mixed partials `∂_y∂_x g = 0` and `∂_x∂_y g = 1`; `arg` branches give local potentials with loop integral `2π ≠ 0`; `(3/2)|x|^(1/2) sgn x` is continuous, not `C¹` | Pass; separates from the zero, always-true, global-potential and `C¹`-closed predicates |
| §1.1 degenerate domains | `Ω = ∅`; `F = 0` | predicate vacuously true on `∅`; `SimplyConnectedSpace ∅` fails (nonempty is part of the class), so §1.3 is not vacuous on `∅`; for `F = 0` every `φ = 0`, `g = 0` | Pass |
| §1.2 path integral | angular form on the unit loop, twice, reversed; `dx` along `t ↦ t + i·W(t)`; constant path | `2π`, `4π`, `−2π`; `Re(1) − Re(0) = 1` with no derivative used; `0` | Pass |
| §1.2 independence of potentials | `ω = dx`, subdivision `0 → 1 → 3`, potentials `x` and `x + 7` | `1 + 2 = 3`; `(8 − 7) + (10 − 8) = 3` | Pass |
| §1.3 headline, Lean generality | `Ω = ℂ`, `φ = dx`; slit plane, angular form; `Ω = ℂ∖{0}` | `g = Re + c`, unique up to `c` on connected `Ω`; `g = arg`; punctured plane not simply connected and the loop integral `2π` obstructs: hypothesis necessary | Pass; Lean carries `IsOpen Ω`, `[SimplyConnectedSpace Ω]`, no completeness (finite sums of potential differences) — same as README |
| §2.1 strict inward cone | `C = [0, ∞)` at `0` and at `1`; quadrant at the origin; boundaryless model | at `0`: `v = 1` with `ε = 1/2`; `v = 0`: `ball(0, εt) ∌ ⊆ C`; `v = −1`: `−t ∉ C`; at `1`: `v = 0` works for `δ < 1`; quadrant: `(1, 0)` excluded since `(t, −εt/2) ∉ C`, `(1, 1)` included; `C = E`: all of `E` | Pass; closed tangent cone would wrongly admit `v = 0` at `0` |
| §2.1 convexity, scaling, chart transport | `v = 1, 3` at `0` on the half-line, weights `1/4, 3/4`; chart `y = 2x` | `5/2 > 0`; derivative `2` sends `1 ↦ 2 > 0`; signed weights `(2, −1)` would give `−1` | Pass |
| §2.2 headline, convexity load-bearing | model `C = {0} ∪ ⋃ₙ [1/(n+1) + εₙ, 1/n] ⊆ ℝ` (closed, dense interior, unique differentiability at `0` through the ray) | the component of `0` is `{0}`, so no continuous path joins `r(0) ∈ interior` to `0`: the theorem would be false; excluded only because Mathlib's `ModelWithCorners` has `convex_range'` (`Basic.lean:171`) | Pass at the pin; README's "convex" at `:253` is the structure field, not an extra hypothesis |
| §2.2 persistence in the interior | boundary point `x` of convex `C`, `v` strictly inward, `s > 0` | if `y ∈ ball(x − sv, εs) ∩ C` then the midpoint of `y` and `x + sv − w` is `x` with `x + sv − w` interior, so `x` interior: contradiction; forward trajectories from the interior never reach the boundary | Pass |
| §2.2 Checks | `[0, ∞)` with `X = 1`; `[0, 1]` with `X = 1/2 − x`; `X = x(1 − x)`; boundaryless `M` | `Φ(t, x) = x + (1 − t)²`: `Φ(0, x) = x + 1`, `Φ(1, x) = x`, `x > 0 ⇒ Φ > 0`; `ψ(s, x) = 1/2 + (x − 1/2)e^(−s)`, `r(x) = 1/2 + (x − 1/2)/e ∈ (0, 1)`; `r(0) = 0 ∉ (0, 1)`; `r = id` | Pass |
| §2.2 smoothness of `Φ` at `t = 1` | `s = (1 − t)²` | `ψ` is the restriction of the ambient flow of a local extension of `X`, so smooth up to `s = 0`; composite with `(1 − t)² ≥ 0` is smooth; `Φ(1, x) = ψ(0, x) = x` | Pass |
| §2.3 transfer identities | `N = (0, ∞) ⊆ M = [0, ∞)`, `r(x) = x + 1`, chain `[x]` | prism of `j ∘ r ~ id` on `[x]` has boundary `[x] − [x + 1]`; `H₀` sends both to `1`; two inverses `s, t` of `i`: `s ~ s i t ~ t` | Pass algebraically; ownership R03 |
| §2.3 cube-root charts Check | `φ_a(y) = cuberoot(y − a)` on `ℝ` | a path smooth in every chart has `γ(t) − γ(t₀) = h(t)³` with `h(t₀) = 0`, so `γ'(t₀) = 3h²h' = 0` for all `t₀`: constant; transition `cuberoot(u³ + a − b)` is not smooth at `u³ = b − a`, so this is not an `IsManifold` | Pass; discriminates `IsManifold` from `ChartedSpace` |
| §2.4 relative chains | `W = ∅`; `W = X`; `(ℝ, ℝ∖{0})` | absolute complex; `C(X)/C(X) = 0` on both sides; LES `0 → H₁(ℝ, W) → H₀(W) = ℝ² → H₀(ℝ) = ℝ → H₀(ℝ, W) → 0` gives `H₁ ≅ ℝ`, `H₀ = 0`; path `2t − 1` has boundary `[1] − [−1] ⊆ W` | Pass |
| §2.5 retractions | `t = 2, −1, 0.3`; `v = (3, 4)` | `1, 0, 0.3`; `(3, 4)/max(1, 5) = (0.6, 0.8)`; `‖v‖ ≤ 1 ⇒ r(v) = v` | Pass |
| §2.5 collar hypothesis necessary | boundary trace `θ ↦ (|sin θ|, 0)` | not differentiable at `θ = 0, π`; no smooth filling restricts to it | Pass |
| §2.5 target with boundary | faces `(y−z)², (x−z)², (x−y)²` of the `3`-simplex into `[0, ∞)` | smooth filling: gradient `0`, Hessian diagonal `2`, off-diagonal `−2`, value along `(t, t, t)` is `½(6 − 12)t² = −3t² < 0`; continuous filling `max(Q + ψ, 0)` exists | Pass; the "must not enter" statement is correct |
| §3.1 relative differential and cocone signs | arbitrary `(α, β)`; `T(α, β) = (α, −β)` | `d²(α, β) = (0, dα|_W − d(α|_W) + d²β) = 0`; cocone differential from Mathlib's cofiber (`−d`, `φ + d`) and the `⟦−1⟧` sign is `(a, g) ↦ (da, −φa − dg)`; `T` intertwines | Pass; matches `README.md:393–395` |
| §3.1 connecting map sign witness | `(ℝ, ℝ∖{0})`, `b = 1` on `(0, ∞)`, `0` on `(−∞, 0)`, `c = [−1, 1]` | `∫_c 0 − (b(1) − b(−1)) = −1`; `δ[b] = −[(0, b)]` evaluates to `1`; singular `b(∂c) = b(1) − b(−1) = 1`; opposite sign gives `−1` | Pass |
| §3.1 degree zero and extremes | `H⁰(ℝ, ℝ∖{0})`; `W = ∅`; `W = X` | constants vanishing on `W`: `0`; absolute complex; cone of the identity, acyclic | Pass |
| §3.2 evaluation formula | `α = ψ dx`, `supp ψ ⊆ (−1, 1)`, `∫ψ = 1`, `β = Ψ|_W` with `Ψ(x) = ∫_{−∞}^x ψ` | relative cocycle: `dα = 0`, `α|_W = dβ`; over `[−1, 1]`: `1 − (1 − 0) = 0`; `(α, β) = d(Ψ, 0)` | Pass |
| §3.2 cone-to-kernel map | surjection `r : A → B` with section `s`, `Ψ(a, b) = a − d(sb) − s(ra − db)` | `rΨ = ra − db − (ra − db) = 0`; `Ψd(a, b) = da − ds(ra − db) = dΨ(a, b)` | Pass; the formula `∫_c α − ∫_{∂c} β` holds for chains with no simplex in `W` and `∂c ⊆ W`, which is the relative-class evaluation |
| §3.2 kernel model wrong for forms | `1/x` on `ℝ∖{0}` | no smooth extension across `0`: restriction not onto | Pass |
| §3.3 headline | `(ℝ, ℝ∖{0})` degree 1; `(ℝ², ℝ²∖{0})` degrees 1, 2 | `H¹(ℝ, W) ≅ ℝ` generated by `δ[b]` evaluating to `1`; LES `H¹(ℝ²) = 0 → H¹(W) = ℝ → H²(X, W) → 0` and `H⁰(X) ≅ H⁰(W) → H¹(X, W) → H¹(X) = 0` give `H² ≅ ℝ`, `H¹ = 0`; `−(0 − ∫_{∂D} θ) = 2π` | Pass |
| §4.1 headline | `S¹` both orientations; two points `+, −`; `ℝ` with `ψ dx`, `K = [−1, 1]` | `2π` and `−2π` on both sides; `f(a) − f(b)` versus the sign-blind `f(a) + f(b)`; pairing `1`, unchanged under `K ⊆ K'` | Pass; not a double owner (R06) |
| §4.1 avoidance by `(1, 0)` chart simplices; dimension zero | compact piece `S` inside an injective chart simplex; `K` finite | `β = 0` reduces §3.2 to `∫_c α`; `Σ ε_o(x) α(x)` on an empty `K` is `0` | Pass |
| §4.2 boundary formula | `D¹ = [−1, 1]`, `α = 0`, `β` locally constant `c₊, c₋`; `[0, 1]`, `α = dx`, `β = x`; `β = 0` near `∂M` | outward-first orientation of `∂D¹` is `+` at `1`, `−` at `−1`: `∫_{∂} β = c₊ − c₋`, pairing `−(c₊ − c₋)`; `1 − (1 − 0) = 0` and `(dx, x) = d(x, 0)`; reduces to §4.1 | Pass; agrees with §3.1's sign |
| §5.1 `incidenceEquation` | `F(x, p) = x + p`, `j = id`, `((1, 2), 3)` | `1 + 3 − 2 = 2`; derivative `(u, v, q) ↦ u − v + q`, slice `(u, v) ↦ u − v` | Pass; order `((x, y), p)` matches `TauCeti.IsRegularParameter`'s `inl` |
| §5.1 `IsRegularIncidenceParameter` | `F = x² + p`, `W` a point, `j = 0`, `p = −1, 0, 1`; `W = ℝ`, `j = id` | zeros `±1` with slice derivatives `±2`: regular; zero `0` with derivative `0`: not; empty fibre: regular; `(u, v) ↦ 2xu − v` onto for every `x`: every `p` regular | Pass; separates from always-true and `Dj`-forgetting predicates |
| §5.1 avoidance | `dim E + dim W < dim V` | rank of `(u, v) ↦ D_xF u − Dj v` is `≤ dim E + dim W < dim V`, never onto, so a regular `p` has no incidence point; countable families by countable unions of null sets | Pass |
| §5.2 headline | `F = x² + p`, `j = 0`; `F = x²`; `V = 0`; `P = 0` | bad set `{0}`, Haar-null; total derivative at `(0, p)` is `0`: hypothesis fails and bad set `= ℝ` of infinite measure; everything onto `0`: bad set `∅`; `P = 0`: total derivative equals the slice derivative so the lone parameter is regular, consistent with `μ{0} > 0` | Pass; universal transversality is necessary and the statement holds in all degenerate cases |
| §5.2 route | incidence manifold `Z` of dimension `dim E + dim W + dim P − dim V`, projection `π : Z → P` | `p` is a critical value of `π` iff some slice derivative over `p` is not onto; `π` is `C^∞` and Tau Ceti's flat Sard needs `(dim Z)² + 1 ≤ ∞` in each of countably many charts | Pass |
| §5.3 headline, universal transversality of the translate | `F(x, p) = f(x) + β(x)p` at a zero | `β(x) > 0`: `q ↦ β(x)q` onto; `β(x) = 0`: `x ∈ C` minimises `β` so `Dβ(x) = 0`, derivative is `Df u − Dj v`, onto by `hgood` | Pass |
| §5.3 Checks | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `β = 0`; `f = β = x²`, `j = 0` | `0 + 4·1 = 4`, `C = {0}` fixed; `C = E`, `p = 0`; translate `x²(1 + p)` has zero `0` with derivative `0` for every `p`, so no regular parameter: `hgood` necessary | Pass |
| §5.3 Lean generality | `V = 0`; `E = 0`; `r` arbitrary | `p = 0`, `‖0‖ < r`, trivially regular; one point source; a ball of radius `r` has positive Haar measure so is not inside the null bad set | Pass; README and Lean carry `[FiniteDimensional ℝ E] [FiniteDimensional ℝ V] [FiniteDimensional ℝ W]` |
| `relativeTranslate` | `f(x) = x`, `β = x²`, `p = 2`, `x = 0, 1` | values `0, 3`; `d_x = 1 + 4x`: `1, 5`; `∂_p = β`: `0, 1` | Pass |
| Conventions: ℤ-indexing | point, degrees `0, 1`; relative degree `0` | `Ω⁰ = ℝ`, `Ω¹ = 0`; extension by zero gives `Ω⁻¹ = 0` so the relative degree-`0` term is `Ω⁰(X)` alone | Pass |

The table has 38 computed rows and covers the fifteen sampled targets, the five headlines and every target a finding touches.

## Not verifiable

- **Lee, Introduction to Smooth Manifolds, 2nd ed.** (Prop. 2.28, Ch. 9, Thms. 6.35–6.36): the sources service resolves the work only to a paywalled Springer DOI and returns `uncertified`; no legal full text is known. The Ch. 9 theorem numbers and printed pages used in R04 come from GeometricTopology's fair-use extract on main, not from the book. The manifest entries the two fetch attempts wrote were removed, since this review edits no manifest and no `sources.toml` existed for this folder.
- **Bott–Tu, Differential Forms in Algebraic Topology** (Ch. I §5, §6): `uncertified` for the same reason; the §6 relative de Rham locator is consistent with the chapter's structure but was not read.
- Ownership against open pull requests was checked only in the sibling checkouts the brief lists and through `roadmaps grep`; the board's package index names no package that builds these objects.

## Source issues

- none
