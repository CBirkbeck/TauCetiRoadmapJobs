# Review of TangentialBordism (pull request #942 at d91d208)

**Verdict:** needs changes

A full review: the folder changed by 187 lines since b345f48 (the head PRREVIEW-TangentialBordism~7 read). The change adds B1.6's relative smoothing into compact targets as a second Lean headline (`exists_contMDiff_homotopicRel`), rewrites the transversality paragraph of 2.1 with an explicit Sard route, adds B1.5's relative boundary triangulation (Munkres) with CalibratedGeometry 2.4 as its consumer, states that AlgebraicTopology Layer 8 consumes B1.6, renames AlgebraicTopology "Stages" to "Layers", and moves the Tau Ceti orientation import to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`. Three blocking findings concern the new 2.1 text (two owners of the smoothing and transversality statements, a Sard theorem cited beyond its generality, DifferentialGeometry ids that its open revision drops); two P3 findings concern the gate's build warning and a locator.

## Previous findings

PRREVIEW-TangentialBordism~7 accepted b345f48 with no finding, so there is nothing to carry. Its three earlier repairs (the declared gap gap:finite-quadratic-arf, the Layer 1 residues, the SpinGeometry and Milnor–Stasheff locators) are unchanged at this head (`README.md:79–84`, `:167–181`, `:495–498`, `:1880–1884`).

## R01 (P2) — Two owners of relative smoothing and relative transversality into compact targets

**Location.** `README.md:68–74` ("B1.6 owns the parametric transversality theorem, the smoothing of continuous maps relative to a closed set (`exists_contMDiff_homotopicRel` for compact targets) and relative transversality. Sources are manifolds with corners, boundaryless ones included. … AlgebraicTopology's smoothing of classifying maps into Circle, RP^N and CP^N and its transverse preimages of the hyperplanes (Layer 8) are the boundaryless compact-target case and consume B1.6"); `README.md:2696–2701` (the same claim under Downstream consumers); `Suggested.lean:42–57`.

**Claim.** This roadmap owns both statements for every source, boundaryless sources included, and AlgebraicTopology Layer 8 consumes them.

**Witness.** AlgebraicTopology at the head of its open revision #1663 (`rev/1663 README.md:69–74`) says the opposite: "Stage 8.13 … owns, for an arbitrary compact boundaryless target manifold and an arbitrary closed embedded submanifold, the smoothing of continuous maps relative to a closed set and relative transversality; TangentialBordism B1.6 states the corner-source extension … and consumes nothing here", and `:2381–2435` states both theorems (boundaryless sigma-compact source, the same embedding-plus-tubular-retraction route, Mathlib's `exists_contMDiff_approx_and_eqOn`, Lee 6.26/6.35/6.36). AlgebraicTopology's other open revision #1652, the one this pull request names for its "Layer" numbering, has no smoothing or transversality target at all (`rev/1652 README.md`, Layer 8: `:2445–3262`, no occurrence of "smoothing of maps", "transvers" or "TangentialBordism"), and AlgebraicTopology on main (eaf17b1) cites TangentialBordism nowhere. So the object "smooth a continuous map into a compact boundaryless manifold rel a closed set; make it transverse to a closed embedded submanifold" is planned at two open heads, and each says the other consumes it in the opposite direction. The Lean headline `exists_contMDiff_homotopicRel` is stated over an arbitrary model with corners `I`, so its `I.Boundaryless` instance is exactly the theorem AlgebraicTopology 8.13 claims. As written, this README also asserts a cycle: 4.2, 4.4 and 8.4 consume "AlgebraicTopology Layer 8" (`README.md:870`, `:989`, `:2039`) while `:72–74` and `:2697–2698` say AlgebraicTopology Layer 8 consumes B1.6.

**Repair.** One owner, earlier in the merge order. AlgebraicTopology is on main and precedes this roadmap, so the boundaryless-source statements belong to AlgebraicTopology 8.13 as at #1663's head: in Scope (`:68–74`), the supplier table row for AlgebraicTopology (`:151`) and 2.1 (`:271–311`), consume "AlgebraicTopology 8.13 (as at its open revision)" for smoothing into compact targets and relative transversality with boundaryless source, name that revision in the pull request's revision-dependencies paragraph, keep here only what 8.13 does not state (the parametric theorem with countably many strata, facewise relative transversality on a source with corners, and the non-compact-target reduction through doubles), and delete the two sentences saying AlgebraicTopology Layer 8 consumes B1.6. `exists_contMDiff_homotopicRel` then either becomes AlgebraicTopology's headline (cited, not declared here) or is kept only if AlgebraicTopology's head drops its claim; the docstring must say which. If the authors settle it the other way (8.13 consumes B1.6), that is an upward edge for AlgebraicTopology and cannot be recorded here; it has to be settled at the AlgebraicTopology head. Either way the two heads must say the same thing.

## R02 (P2) — The parametric transversality route cites an equal-dimension Sard theorem for a projection of unequal dimensions

**Location.** `README.md:271–281` ("the s∈S for which F(−,s) fails to be transverse to Z on some stratum form a null set in DifferentialGeometry 10.2's sense (`IsNullSet`) … On each stratum the bad parameters are the critical values of the projection to S of the embedded submanifold F⁻¹(Z), null by 10.2's `isNullSet_image_criticalPoints`").

**Claim.** The pinned `isNullSet_image_criticalPoints` shows that the critical values of the projection `F⁻¹(Z) ∩ (stratum × S) → S` are null.

**Witness.** At the Tau Ceti pin (2fd255d9) the declaration is `TauCeti.isNullSet_image_criticalPoints [LindelofSpace M] … (hdim : finrank ℝ E = finrank ℝ E') (hf : MDifferentiable I J f)` (`TauCeti/Geometry/Manifold/Sard/EqualDimension.lean:105–108`); its module docstring says "Sard's theorem for maps between manifolds of equal dimension … in equal dimensions no higher regularity is needed" (`:12–22`), and `dense_isRegularValue` (`:112`) carries the same `hdim`. The projection has source dimension `dim(stratum) + dim S − codim Z` and target dimension `dim S`; these agree only when `dim(stratum) = codim Z`. The use this paragraph is written for, B5.3's transversality to the zero section of a Grassmannian Thom space (`README.md:1136`), has `dim M = n` and `codim Z = k` with `n ≠ k` in general (a surface in ℝ⁵: source dimension `2 + s − 3 = s − 1 ≠ s`). The general flat Morse–Sard theorem is at the pin with no relation between the dimensions, `TauCeti.addHaar_image_criticalPoints_eq_zero` and `ContDiff.addHaar_image_criticalPoints_eq_zero` (`TauCeti/Analysis/Calculus/Sard/OutermostStratum.lean:347–373`, hypothesis `(dim E)² + 1 ≤ n` on the differentiability order, satisfied by `C^∞`), but no manifold version of it exists at the pin, and the only roadmap that plans one, DeRhamCohomologyAndDuality (#1768, `rev/1768 README.md:7`, `:148–149`), is not an allowed supplier of this roadmap (not on main, not earlier in the merge order).

**Repair.** State in 2.1 the manifold Sard theorem the route needs as a target of this roadmap: for a `C^∞` map between manifolds with corners over finite-dimensional real models, with Lindelöf (second-countable) source and no relation between the dimensions, the image of the critical set is `IsNullSet` in the target, proved chartwise from the pinned flat `TauCeti.addHaar_image_criticalPoints_eq_zero` exactly as `EqualDimension.lean` does for its flat input (countably many charts by the Lindelöf property). Cite that flat declaration under "From Tau Ceti" and derive the parametric theorem from this target; keep the pinned equal-dimension declarations only for the degree-style uses (the exhaustion regular value at `:330–332`, where source and target are one-dimensional). Add the Check that excludes the equal-dimension reading: `M = pt`, `S = N = ℝ²`, `Z = {0}`, `F(pt, s) = s`: `F⁻¹(Z)` is a point and its projection to `S` has image `{0}`, null, but no theorem with `finrank E = finrank E'` applies to a map from a 0-manifold to ℝ².

## R03 (P2) — DifferentialGeometry ids cited as supplier that its open revision #886 renumbers or removes

**Location.** `README.md:152` (supplier row: "DifferentialGeometry, 2.1, 2.2, 5.5, 10.2 … 5.5's face-indexed abstract boundary … 10.2's manifold Sard theorem `dense_isRegularValue`"); `:243–249`, `:271–281`, `:353`, `:364–366`, `:437`, `:536`, `:628`, `:2082`; `:288` ("DifferentialGeometry 8.3 uses only the simplex case").

**Claim.** DifferentialGeometry 5.5, 8.3 and 10.2 exist as cited.

**Witness.** They exist on main (eaf17b1: `TauCetiRoadmap/DifferentialGeometry/README.md:528` "5.5 Densities, and Stokes with corners", `:836` "8.3 Smooth chains", `:884` "10.2 Sard"). At the head of the open revision #886 (a565de62) the first is split into "5.5a Densities" and "5.5b Smooth faces, abstract boundary and corner Stokes" (`rev/886 README.md:841`, `:850`), so the face-indexed abstract boundary this roadmap cites is 5.5b, and Layers 6–11 are gone: "smooth singular chains and the de Rham theorem, Poincaré duality, Sard's theorem on manifolds, the Brouwer mapping degree … are DeRhamCohomologyAndDuality's, which consumes this roadmap; none of them is a target here" (`:259–262`); the strings "10.2" and "8.3" occur nowhere at that head. The worker's overlap scan reports the 5.5 drop (`scratch/overlaps.md`); 10.2 and 8.3 are the same defect found by reading the head. When #886 merges, the supplier citations at `:152`, `:249`, `:353`, `:536` break, and the Sard citation points at a roadmap that no longer owns it.

**Repair.** Cite "DifferentialGeometry 5.5b" (the id at #886's head) wherever 5.5 is meant for the abstract boundary and faces, and name #886 in the pull request's revision-dependencies paragraph beside #1652. For Sard, cite the pinned library directly instead of a roadmap section: `TauCeti.IsNullSet` (`TauCeti/Geometry/Manifold/Measure.lean:36`), `TauCeti.isNullSet_image_criticalPoints` and `TauCeti.dense_isRegularValue` (`TauCeti/Geometry/Manifold/Sard/EqualDimension.lean:105`, `:112`) under "From Tau Ceti", with their equal-dimension hypothesis stated, and the flat `TauCeti.addHaar_image_criticalPoints_eq_zero` for R02. Replace "DifferentialGeometry 8.3 uses only the simplex case" by a sentence that needs no id (the simplex case of relative smoothing is what a de Rham comparison needs) or drop it.

## R04 (P3) — The gate's build counts Lake's module-system warning

**Location.** `scratch/gate.md` ("build=2 FAIL … imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module` to the start of this file"); `Suggested.lean:1–2`.

**Claim.** The targeted build passes the gate.

**Witness.** Rerunning `lake build TauCetiRoadmap.TangentialBordism.Suggested` at this head prints the warning twice (once on replay, once for `:irArts`) besides the two `declaration uses sorry` warnings; the worker's gate counts every warning that is not the sorry warning as a build problem, and no acceptance is possible while it fails. At the Mathlib pin 1b1ccf4b every library file is a module file, which is why the warning appeared after the merge of main (the previous head built with `build=0`).

**Repair.** Write the file in module form: `module`, a blank line, `public import Mathlib`, `public import TauCeti.Geometry.Manifold.Orientation.OrientedAtlas`, the docstring, `public section`, then the namespace unchanged, and `end` after `end TauCetiRoadmap.TangentialBordism`. I elaborated exactly that copy with `lake env lean` (scratch copy, exit 0): the only diagnostics are the two sorry warnings at the two theorems; both `#check` types are unchanged. The gate's import rule accepts `public import Mathlib`.

## R05 (P3) — 5.7 (B5.7) has no locator

**Location.** `README.md:1420–1440` ("Construct the connective bordism skeletal/Atiyah–Hirzebruch spectral sequence (AHSS) with actual geometric filtration … Give E2=H_p(X,A;Ω_q), naturality, coefficient monodromy where present, differentials and convergence").

**Claim.** Every theorem carries a locator.

**Witness.** The subsection cites no source; every other subsection of Layers 2–10 does. The sampled target cannot be checked against a text.

**Repair.** Add the standard locator for the AHSS of a connective homology theory on a CW pair (the chapter of Switzer's *Algebraic Topology — Homotopy and Homology* on the Atiyah–Hirzebruch spectral sequence, or Adams's *Stable Homotopy and Generalised Homology*, Part III, with theorem and page), cited for the E2 term, the differentials and finite-total-degree convergence, and add the geometric-filtration comparison as the construction owned here.

## Verified sound

### Gate, dependency direction, acceptance test

- Gate rerun at d91d208 with `--base origin/main`: every scanner zero (`set_option=0 … stray-files=0 dirty=0 outside-folder=0 source-material=0`), exit 0; the worker's record adds `build=2` (R04). The diff outside the folder against `origin/main` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`.
- Dependency check with `--movable`:

  ```text
  depcheck: 239 roadmaps, 2349 edges, 0 problem(s)
  ```

  No UPWARD or CYCLE line. The merge order lists TangentialBordism tenth, after EllipticCohomology, StringOrientation, SmoothBundlesConnections and PseudodifferentialOperators; CalibratedGeometry (the new consumer of B1.5, `rev/946 README.md:67–69`, `:203–210`, `:501–520`) is listed later, so that edge is downward. IndexTheory (#1077) and StringOrientation (#948) are the pull request's declared open suppliers, new roadmap folders, cited at their heads.
- `Suggested.lean`: imports `Mathlib` and `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` (present at the pin: `TauCeti/Geometry/Manifold/Orientation/OrientedAtlas.lean`); no `set_option`, no sorry'd data, no admitted `example`, 85 lines. I elaborated a scratch copy with `#check @exists_contMDiff_homotopicRel` and `#check @orientedThreeManifold_parallelization` appended (`lake env lean`, only the two sorry warnings): the first carries `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M]` on the source over an arbitrary `ModelWithCorners ℝ E H`, `[IsManifold J ∞ P] [T2Space P] [CompactSpace P] [BoundarylessManifold J P]` on the target, `IsClosed C → IsOpen U → C ⊆ U → ContMDiffOn I J ∞ f U → ∃ g, ContMDiff I J ∞ g ∧ f.HomotopicRel g C`, which is the README statement at `:283–288` (the "arbitrarily small" clause of the README is weaker in Lean, not stronger); the second is unchanged since ~6 and matches `:1982–2001`. No section binder was lost. Mathlib at the pin has the two cited inputs with the hypotheses the route uses: `Continuous.exists_contMDiff_approx_and_eqOn` over any model with corners with `[IsManifold I ∞ M] [SigmaCompactSpace M] [T2Space M]`, closed `S`, `U ∈ 𝓝ˢ S`, `CMDiff[U] n f` (`Mathlib/Geometry/Manifold/SmoothApprox.lean:72–82`), and `exists_embedding_euclidean_of_compact [T2Space M] [CompactSpace M]` giving a smooth closed embedding with injective derivative (`Mathlib/Geometry/Manifold/WhitneyEmbedding.lean:132–135`); `ContinuousMap.HomotopicRel` is `Mathlib/Topology/Homotopy/Basic.lean:629`.
- Padding probe: the new headline with `first | simp | exact ⟨f, ?_, ?_⟩ | infer_instance | rfl` fails (the goal is the existential, no tactic closes it); the parallelization headline's sixteen probes from the earlier reports stand. Neither declaration restates a definition, mirrors a Check or computes a value.
- The headlines not statable at the pins are named in the docstring with the missing carrier (`Suggested.lean:14–31`): transversality predicate, bordism groups, Thom spectra, Steenrod operations, `KO`, transfer maps, the compact Albert algebra. Parametric and relative transversality are correctly listed as not statable (no transversality predicate at the pins).

### The declared gap

gap:finite-quadratic-arf (`README.md:167–181`) is unchanged since ~7: precise (carrier, formula, each law with hypotheses, m = 0 separated), minimal (no Arf invariant of a quadratic form at the pins: "Arf" occurs only in Hasse–Arf files), declared in the README (no `design/plan.json` exists for this roadmap), and agreeing with GeometricTopology 4.3.1 at its open head (`rev/903 README.md:1371–1402`). Every use names the slug (`:82`, `:153`, `:162`, `:185`, `:205`, `:224`, `:233`, `:1906`, `:1933`).

### Seeded sample

Cache ids are sha256 prefixes of the sources cache; pages are printed pages.

- 2.4 (B1.2): Milnor–Stasheff `4f8edd74 line 5439` Theorem 17.1 (collar neighbourhood), p.206 (`line 5445`); `line 5452–5458` the oriented cobordism relation and Lemma 17.2 (reflexive, symmetric, transitive by `[0,1]×M`, `−X`, gluing along the common boundary through 17.1), p.207 (`line 5477`). Miller `c70bf1f2 lines 95–109` Definitions 1.1–1.2, p.2 (`line 94`). Exact.
- 3.2 (B2.2): Miller `c70bf1f2 lines 114–118` the external product `N_m(X)⊗N_n(Y)→N_(m+n)(X×Y)` on `(M,f)⊗(N,g)`, p.2; Milnor–Stasheff `lines 5470–5481` the product on `Ω_*` and `M₁×M₂ ≅ (−1)^(mn) M₂×M₁`, pp.207–208. Exact.
- 4.1 (B4.1) and 4.3 (B4.3): Milnor–Stasheff `line 3651` Theorem 11.14 (Wu), `w = Sq(v)` with `v` characterised by `⟨v ⌣ x, μ⟩ = ⟨Sq(x), μ⟩` (`lines 3647–3656`); Chapter 8 defines the Stiefel–Whitney classes by the Thom identity. Exact.
- 4.4 (B4.7): Guillou–Weibel arXiv:1301.0872v1, fetched this round (`b27fcec7`): Definition 6.1 (`line 748`, p.18) the ℓ-simple system with exponents `< ℓ`, `≤ 1` on odd generators, matching `README.md:942–946`; Theorem 6.2 (`lines 752–758`, p.18) with hypotheses (i) `E₂ ≅ W ⊗ V` as algebras and (ii) a transgressive ℓ-simple system, conclusion free graded-commutative on `τ(x_i)` and, for even `x_j` at odd ℓ, on `τ(y_j ⊗ x_j^(ℓ−1))`, matching `:946–957`; Kudo's Theorem 6.5 (`lines 784–788`, p.19): `β(x)` transgresses to `−β(y)`, `P^a(x)` to `P^a(y)`, and for `n = 2a` `x^(ℓ−1)⊗y` to `−Q^a(y)` with `Q^a = βP^a` (`line 744`), matching the README's `τβ = −βτ` and `d_r(y^(p−1)⊗z) = −βP^k z`. Exact.
- 5.1 (B5.1): Miller `c70bf1f2 line 131` §2 begins on p.3 (`line 128`) with the embedding, normal bundle and Thom space; Thom `25813484 line 2410` Théorème IV.6 (L-equivalence classes of `V^n` identified with maps `V → M(SO(k))`), p.74 (folio 75 at `line 2464`); `line 2462` Théorème IV.8 (the cobordism groups are the stable homotopy groups of `M(SO(n))`), p.75. Exact.
- 5.6 (B5.6): the citations are GeneralizedCohomology G4 item 3 (orientation data and Thom isomorphism, `GeneralizedCohomology/README.md:1224`), G5 items 1–2 (finite Spanier–Whitehead duality `:1512`, geometric duality adapter with the smooth Euclidean embedding `:1523`) and G5 item 3 (Thom spectra from diagrams `:1536`); all on main.
- 5.7 (B5.7): no source (R05); the three Checks are recomputed below.
- 6.2 (B4.5): Thom `line 2528` Théorème IV.10 (all Stiefel–Whitney numbers zero implies a mod 2 boundary) and `line 2538` Corollaire IV.11 (equal numbers implies cobordant mod 2), p.77 (`line 2545`). Exact.
- 6.3 (B4.6): Milnor–Stasheff `lines 5357–5382` Problems 16-D–F (hypersurface Chern class and `s_n = d(n+2−d^n)`; the `(1,1)` hypersurface `H_(m,n)` with `m,n ≥ 2` and `s_(m+n−1) = −(m+n)!/m!n!`; the mod 2 calculus with real `(1,1)` hypersurfaces), pp.203–204 (`line 5365`). Exact; the sign in 16-E is the complex one used by 6.5, and 6.3 uses the mod 2 count `binom(m+n,m)`.
- 6.6 (B6.2): Wall `bcb3caf2 line 352` Lemma 7 (`P(C) ∼ P(R)²`); `lines 467–468` Lemma 8 (`∂₂σ(1)=0`, `∂₂σ(2)=1`, `∂₂σ(i)=σ(i−2)` for `i>2`, a derivation); `line 483` Lemma 9 (`ker ∂₂` contains `τ_i` of each degree not a power of 2, leading term `σ(i)`); `lines 514–530` Lemmas 10–12 (greatest-term description of `im δ₂`); `line 567` Lemma 13 (`ker ∂₁/im ∂₁` polynomial, dual to the mod 2 Pontrjagin numbers); pp.300–306 by the memory map of ~6. Exact.
- 7.1 (B3.0): Atiyah–Bott–Shapiro §§10–11 is paywalled (Elsevier), cited by locator; the Clifford and KO suppliers (SpinGeometry G5.0 `:506`, G6.0 `:586`, G6.7 `:831`; GeneralizedCohomology G5.5 `:1767`; IndexTheory I2.5 `rev/1077 :468`, I5 `:609`) resolve.
- 8.4 (B3.1): Benedetti–Lisca `aa5a2f05 line 15` Theorem 1 ("Every orientable, closed 3-manifold is parallelizable"), p.1. Exact; the boundary and non-compact extensions are stated as this roadmap's.
- 9.1 (B3.6): Baez `f8087fb9 line 1297` §3.4 "OP² and the Exceptional Jordan Algebra" (points are trace-one projections in `h₃(𝕆)`, `line 1425`) and `line 1768` §4.2 "F₄". Exact.
- 10.1 (B6.3): Thom `line 2774` Théorème IV.17 (`Ω ⊗ ℚ` polynomial with one generator in each dimension divisible by 4), p.84 (folio 83 at `line 2772` closes the previous page); Mathlib `Rep.FiniteCyclicGroup.groupHomologyIsoEven` is at `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:85`. Exact.
- Unverified-flagged locators: the README flags none as unverified. The two new locators, Lee Theorem 6.26 p.141 / 6.35 pp.145–146 / 6.36 pp.146–147 and Munkres Definition 8.3 pp.80–81 / Theorem 10.6 p.104, are under Not verifiable.

### Cross-roadmap citations resolved this round

On main (eaf17b1): GeneralizedCohomology G1 item 1 (`:141`), G2 item 10 (`:533`), G3 items 3 and 8 (`:710`, `:785`), G4 items 3–5 (`:1224–1246`), G5 items 1–5 (`:1512–1687`); CharacteristicClasses C1 (`:212`), C2 (`:728`), C3 with C3.6 (`:1000`, `:1229`), C6 (`:1731`), C7.3/C7.3a (`:1817`, `:2002`); SpinGeometry G4 (`:395`, G4.3/G4.4 at `:52–53`), G5 item 0 (`:506`), G6 items 0 and 7 (`:586`, `:831`); ClassifyingSpaces Stage 4 / `groupHomology` (`:44`, `:74–75`); RiemannianGeometry R1 (`:179`); LieHighestWeight Layer 8 compact suppliers (`:1197`, `:1255`); LieGroups Layer 2 and Layer 4 (`:275`, `:326`); SpinRepresentations Layer 7 (`:881`); AffineMorseLefschetz A0/A5/A6 (`:172`, `:1323`, `:1410`); ComplexKahlerGeometry K7.1 (`:1407`); DGFloer Layer 1 Serre sequence (`:142`, `:226`); DGAInfinity Layer 0 (`:263`); TopologicalKTheory T1/T3/T5/T7 (`:163`, `:754`, `:886`, `:1148`); PseudodifferentialOperators P5/P6 (`:927`, `:1484`); SmoothBundlesConnections B1.4 (`:31`); GeometricTopology Layer 1 (`:177`, collars `:205`, tubular neighbourhoods `:218–221`), Layer 11 (`:831`), smoothing-and-triangulation item 1 (`:938–943`); DifferentialGeometry 2.1, 2.2, 5.5, 8.3, 10.2 (`:345`, `:352`, `:528`, `:836`, `:884`; R03 for their open head). At open heads: StringOrientation S1.3, S1.5, S2.2, S2.3, S5.3 (`rev/948 :34–57`); IndexTheory I2.5, I5, I7.2, I7.5 with `spinFour_signature_eq_neg_sixteen_mul_quaternionicIndex` and `rokhlin_signature_dvd_sixteen` (`rev/1077 :468`, `:609`, `:868–873`); GeometricTopology 4.3.1 (`rev/903 :1371`, the declared gap); CalibratedGeometry 2.4 as consumer (`rev/946 :501–520`); AlgebraicTopology Layers 2–8 as numbered at #1652 (`rev/1652 :499–2445`), named in the pull request's revision paragraph.

### Ownership

B1.5's relative triangulation (boundary or chosen faces a subcomplex) is claimed here and consumed by CalibratedGeometry 2.4 at #946, which reads GeometricTopology's item 1 as the boundaryless existence theorem; GeometricTopology on main states item 1 for "every smooth manifold" without a relative clause (`:938–943`), so the relative refinement has one owner. The Spin-surface refinement and filling (8.1–8.2), the finite-rank framed PT (5.2), the theories over pairs (5.4) and the parallelization headline are as in ~7 (no second owner on main or in the brief's checkouts). The smoothing and transversality statements of 2.1 have two owners (R01). Ownership against open pull requests whose files the brief does not supply was not checked.

### Adversarial mathematics table

Rows marked "new" were computed this round; rows marked "~7", "~6", "~5" or "~4" carry the values those reports computed for passages unchanged since.

| Statement / target | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| 2.1 relative smoothing `exists_contMDiff_homotopicRel`: degenerate data | M = ∅; C = ∅, U = ∅; C = U = M; P = pt; P = ∅ with M ≠ ∅ | ∅: g the empty map, homotopy rel ∅; C = U = ∅: `ContMDiffOn` on ∅ holds, conclusion is Whitney approximation; C = M: hf gives f smooth, g = f, constant homotopy; P = pt: f constant, g = f; P = ∅: no f, vacuous | Pass, new |
| 2.1 route: ε and the segment | W ≠ V; W = V | ε(x) = dist(e f(x), V∖W) > 0 continuous; ball convex so (1−t)ef + t g̃ ∈ W for all t; W = V: ε = 1 | Pass, new |
| 2.1 route: rel C | x ∈ C | g̃(x) = e f(x) by `EqOn g f S`, segment constant, r(e f(x)) = f(x) | Pass, new |
| 2.1 Check: circle | M = P = S¹ ⊂ ℂ, W = ℂ∖{0}, r(z) = z/|z|, f ≡ 1 | g = r∘g̃ homotopic to f, degree 0 ≠ 1; g̃ alone need not lie on S¹ | Pass, new |
| 2.1 Check: circle transversality | M = P = S¹, Z = {1}, C = ∅ (β ≡ 1), S the δ-disc, δ < 1 | constant map: df = 0, not transverse (preimage all of S¹); F(x,s) = (1+s)/|1+s| constant in x, equals 1 iff s ∈ (−1,∞)×{0}, a null line in the disc; off it the preimage is ∅, transverse vacuously | Pass, new |
| 2.1 relative transversality: derivative where β = 0 | β = ψ², ψ(x) = 0 | dβ_x = 2ψ dψ = 0; d_x F(·,s) = dr(d(ef)_x) = df_x since r∘e = id; ∂_s F = β(x) dr = 0, so F ⋔ Z at (x,s) iff f ⋔ Z at x, which holds on U | Pass, new |
| 2.1 relative transversality: where β > 0 | β(x) > 0 | s ↦ e f(x) + β(x)s is an affine diffeomorphism onto a ball inside W, r a submersion: slice is a submersion, transverse to every Z | Pass, new |
| 2.1 parametric theorem: dimension of the projection | M = pt, S = N = ℝ², Z = {0}; M² in ℝ⁵, k = 3 | F⁻¹(Z) has dim 0 vs dim S = 2; dim F⁻¹(Z) = 2 + s − 3 = s − 1 vs s: `hdim` of `isNullSet_image_criticalPoints` fails in both | Fail: R02 |
| 2.1 Checks: endpoint face | M = [0,1], C = {0}, Z = {0}, f(t) = t; f(t) = 1+t | face derivative rank 0 < codim 1, no homotopy rel C fixes it; 1+t misses Z | Pass, ~4 |
| 2.1 tubes, rounding, doubles, exhaustion | I ⊂ I×ℝ; quadrant; I, ∅; K = [0,1] ⊂ ℝ | normal rank 1; one boundary arc; doubles S¹, ∅; sublevel of radius > 1 contains K in its interior, radius 1 fails | Pass, ~4 (values) |
| 2.3 relative triangulation | N = [0,1]; N = D² with ∂ a triangle; N = ∅; closed N | K = two vertices + edge, L = two vertices; cone on the triangle extends; K = L = ∅; L = ∅ reduces to Whitehead | Pass, new (statement); locator not verifiable |
| Gap: Arf laws | V = 0; H; A; H⊕H; H⊕A; A⊕A | Gauss sums 1, 2, −2, 4, −4, 4; zero counts 1, 3, 1, 10, 6, 10; Arf(A⊕A) = 0 = Arf(H⊕H) | Pass, ~7 |
| 2.4 collared witnesses | I×M; reversed; empty | boundary M − M = 0; reversal flips signs; locator supplies collar (17.1) and relation (17.2) | Pass, ~7 |
| 3.1 inverses / 3.2 interchange sign | O points; SO signed points; lines in RP²; two 1-dim factors | 1+1 = 0; +1−1 = 0, +1+1 = 2 ≠ 0; (+)(−) = −; (−1)^(1·1) = −1 at `4f8edd74 line 5480` | Pass, ~7 |
| 4.1 diagonals / Sq / Cartan / Adem | edge; a ∈ H¹(RP∞); a²; Sq¹Sq¹a | ∂(−e⊗e) = AW−T·AW; Sq¹a = a², Sq²a = 0; Sq²a² = a⁴; 0 | Pass, ~4 |
| 4.3 Wu / Thom relation | RP²; trivial line; tautological | Sq(1+a) = 1+a+a² = w; SqU = U; Sq¹U = aU | Pass, ~4 |
| 4.4 odd operations / Kudo sign / transpotence degree | p = 3, K(ℤ/3,2) | P¹y = y³; τy = −βι₂ = 2βι₂; d_r(y²⊗z) = −βP¹z of degree 2·3+2 = 8, r = 2·1·2+1 = 5; signs agree with `b27fcec7 lines 786–788` | Pass, new (source), ~4 (values) |
| 5.1 collapse / stabilization | framed point; sign flip; empty cycle | degrees +1, −1, basepoint | Pass, ~4 |
| 5.6 graph-embedding ranks | (d,e,r) = (0,1,1),(0,1,2),(2,2,5),(1,3,3) | normal rank r+e−d = 2,3,5,5; shift r − rank = d − e = −1,−1,0,−2 | Pass, ~5 |
| 5.7 AHSS Checks | X = pt; total degree 0; two components | only p = 0, abutment Ω_q; only (0,0); E²_(0,0) = Ω₀ ⊕ Ω₀, not Ω₀ | Pass, new (values); locator missing, R05 |
| 6.2 point numbers vs joint numbers | id: S¹→S¹; RP²; S² | point numbers 0, joint 1; w₁² = w₂ = 1; both 0 | Pass, ~5 |
| 6.3 hypersurface Newton numbers | H_ℝ(2,4); H_ℝ(1,2); RP², RP¹ | binom(6,2) = 15 ≡ 1; dimension 2, number 0 while binom(3,1) = 3 ≡ 1 (so m,n ≥ 2 needed); 3 ≡ 1, 2 ≡ 0 | Pass, ~4 |
| 6.6 Wall derivations / torsion product | σ₄; Y₆Y₅ | ∂₂σ₄ = σ₂, ∂₂²σ₄ = ∂₂σ₂ = 1 (Lemma 8); Y₅² = δ(Y₆Y₅) ≠ 0 | Pass, new (source lines), ~4 (values) |
| 7.1 ABS normalization | +pt; circle; K3 | 1; η; −p₁/24 = 2, c(a) = 2u² so α = a | Pass, ~4 |
| 8.4 parallelization headline | M = ∅; ℝ³ and half-space; negated e₁; RP²×ℝ; countable union of half-spaces | vacuous; det 1, products smooth; det −1 excluded; no oriented atlas; componentwise det 1, no compactness used | Pass, ~6/~4 |
| 9.1 idempotent charts | v = (1,0,0),(1,1,0); zero matrix; split null a | P² = P, trace 1; trace 0 excluded; tr(A∘A) = 1 + 2t²N(a) bounds t a | Pass, ~4 |
| 10.1 realization range / degree 7 | C₃ even homology; lens product | ker(3:ℤ→ℤ) = 0; coefficient −1 ≡ 2 ≠ 0 in F₃ | Pass, ~4 |
| 10.2–10.4 transfers, kernels, Ext | as in ~4 | 1+1 = 0 in π₁SO₈; Scal ≥ 56; a² = 4b; −10, −28, gcd 28 | Pass, ~4 |

The new rows show that the smoothing route and its Checks agree on every instance tried, and that the one computed failure is the generality of the cited Sard declaration (R02).

## Not verifiable

- Munkres, *Elementary Differential Topology* (Annals of Math. Studies 54): Definition 8.3 pp.80–81 and Theorem 10.6 p.104 (`README.md:460`, `:2713–2716`). The sources service found no legal copy (JSTOR landing page, host in no licence class; recorded in `scratch/fetch/needs-references.toml`, not in any manifest). Cited by locator; the extension-from-the-boundary clause is not confirmed against the text.
- Lee, *Introduction to Smooth Manifolds* (Springer, paywalled): Theorems 6.26, 6.35, 6.36, 21.10, 21.13. The service records it `uncertified` in the scratch manifest. A copy of the book is in the sources cache from a third-party course page whose licence I could not establish, so I did not read it; the theorem numbers are cited by locator, as in the previous reports.
- Atiyah–Bott–Shapiro (Elsevier), Anderson–Brown–Peterson and Milnor 1960 (JSTOR), McCleary (Cambridge), Stong (Princeton), Gompf–Stipsicz (AMS), Stolz 1992 (JSTOR), mathlib4#31350 (a pull request, not a text): cited by locator alone, unchanged since the previous reports. No `sources.toml` exists for this roadmap and nothing on the board was edited; the two records this round went to a scratch manifest.
- GeometricTopology 4.3.1 and AlgebraicTopology 8.13 exist only at open heads (#903, #1663); the first is the declared gap, the second is R01.

## Source issues

- none
