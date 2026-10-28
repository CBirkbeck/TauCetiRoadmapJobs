# GATE-SmoothBundlesConnections~1: answers to human review

Reviews answered: three COMMENT reviews (heads 791dd40, 1c45ab4, e3abb0d). Repair commit: `c473c502` on top of `e3abb0d`. H01–H06 come from the first review, H07–H10 from the second (they repeat H01, H03, H05 and H06), and H11 from the third. The third review itself records H01–H10 as resolved at e3abb0d. Each one was rechecked against the current files.

## H01 (CBirkbeck) — applied
The restricted-holonomy reduction over the wrong base is fixed in `TauCetiRoadmap/SmoothBundlesConnections/README.md` B5, in the paragraph beginning "Construct the connection-preserving immersed principal **H** reduction". It builds the full reduction Q→M, the regular covering `M'=Q/H⁰→M` with deck group H/H⁰ acting by `[h]·[q]=[q h⁻¹]`, and the H⁰-reduction `q↦([q],q)` into the pullback of P to M'. A reduction over M itself is asserted only when H=H⁰. The B7 lens test (n≥2) gives full holonomy μ_n, trivial H⁰ and covering S³. For character exp(2πik/n) it gives μ_(n/gcd(n,k)) and covering S³/μ_gcd(n,k), the kernel of ℤ/n→μ_(n/g) having order g. This is the reviewer's counterexample, now used as a test.

## H02 (CBirkbeck) — applied
B1.1 and B1.5 consume LieGroupoidsPoisson G0.1 by section, and that roadmap is now an inspectable open roadmap pull request adding a new folder. Its README supplies the regular-fibre, fibre-product and kernel-distribution contracts and says at line 1084 that "G0.1 … supplies SBC B1.1/B1.5". `Manifold.IsSubmersion` (Mathlib `Geometry/Manifold/Submersion.lean:553`) is the chart predicate only, as the reviewer says. The depcheck shows no upward edge.

## H03 (CBirkbeck) — applied differently
The concrete tuple complex `cechConstants`/`cechRealComplex`, the record `NormalizedCechConstantsNativeIso` and its sorry'd data are removed from `Suggested.lean`: sorry'd data is not allowed there. In their place the file states the identification on Mathlib's native carrier. `cechTupleConstantSection C i` is the unit of `constantSheafAdj` at ℝ followed by restriction to the native product open (a real body, no free parameter). `cechTupleConstantSection_bijective_iff` says it is bijective iff `cechIntersection C i` is nonempty. That fixes the degree-p factors of `cechComplexFunctor C.openSet` applied to `locallyConstantRealSheaf`, and the unit commutes with restriction, so the native differential agrees with the coordinate one. README B6.1 states this with the same names. Refinement maps consume TopologicalSheafCohomology TS1.1–1.2; the README had cited it as "TS973", a pull-request number, and now uses the roadmap name.

## H04 (CBirkbeck) — answered
No edit is needed here. DGFloer on main now consumes SmoothBundlesConnections B1.4 for the free proper quotient and principal projection (DGFloer README lines 158 and 825) and ComplexKahlerGeometry K7.1 for the projective carrier. B1.4 here keeps ownership of the general quotient.

## H05 (CBirkbeck) — applied
B6.2 consumes DifferentialGeometry Layer 9.3's fundamental-class integration comparison on K7.1's ℂP¹ carrier: "consume DG9.3's general fundamental-class integration comparison on K7.1's common ℂP¹ carrier". It keeps only the Hopf curvature integral and the Chern-number calculation. DG Layer 9.3 (DifferentialGeometry README line 1498 onward, line 1572) names "SmoothBundlesConnections B6.2 consumes its ℂP¹ instance".

## H06 (CBirkbeck) — applied
B6.5 says that on a fixed bundle the equal-curvature gauge classes form a torsor for `H¹_dR(M;ℝ)/(2π image H¹(M;ℤ))`. A chosen A₀ gives coordinates `[A]↦[A−A₀]`, and replacing A₀ by A₁ translates them by `−[A₁−A₀]`. Witness: `[A−A₁]=[A−A₀]−[A₁−A₀]`.

## H07 (CBirkbeck) — applied
This repeats H01; the same B5 repair applies. The homotopy-invariant map for a general connection goes into H/H⁰ ("construct π₁(M)→H/H⁰"), and a homomorphism into G appears only in the flat dictionary.

## H08 (CBirkbeck) — applied differently
This repeats H03, with the same repair. Augmentation stays separate. README B6.1 consumes Tau Ceti's `cechAugmentation` and its component theorem, and it explicitly does not infer a quasi-isomorphism from the coordinate isomorphism. The coefficient, exponential and refinement compatibilities stay as README targets.

## H09 (CBirkbeck) — applied
This repeats H05; see H05.

## H10 (CBirkbeck) — applied
This repeats H06; see H06.

## H11 (CBirkbeck) — applied differently
The finding is correct. In the old `Suggested.lean`, `instance … CompleteSpace (L2Section h μ)` (old line 332) and `def trivialBundleL2Equiv` (old line 380) kept only the section variables their types mention, so `[FiniteDimensional 𝕜 F]` was dropped. With F = c₀₀ and a one-point unit-mass base, the two together make an incomplete space complete. Both declarations are removed rather than given the binder, because they were sorry'd data (an `instance` and a `def` with `sorry` body), which the acceptance test forbids. The module docstring now records that the finite-rank L² Hilbert space is not statable at the pins: Mathlib and Tau Ceti have no normed structure on measurable bundle sections. README B2 now says "with **finite-rank** bundles". It adds that finite-dimensionality of the model fibre is a hypothesis in the signature of the completeness theorem, the Hilbert structure and the trivial-bundle isometry, with the c₀₀ one-point counterexample as the negative control.

## Other repairs found while applying these
- The gate refused the head `Suggested.lean`: 19 sorry'd data declarations, 14 `Mathlib.*` sub-imports, an import of another roadmap's module (`TauCetiRoadmap.DifferentialGeometry.Suggested`) and no `import Mathlib`. The file is rewritten as an acceptance test: a single `import Mathlib`, one module docstring listing which headlines are statable and what each missing one lacks, and only the definitions the statements need.
- Stated headlines: `exists_smoothGoodCover_refining` and `exists_finite_smoothGoodCover_refining`. These strengthen the old bare existence statements to refinement of an arbitrary open cover, which matches the README's "good-cover refinements". Also stated: `cechTupleConstantSection_bijective_iff`.
- Not statable at the pins, recorded in the docstring with the missing carrier:
  - Ehresmann (no manifold structure on regular fibres);
  - the free proper quotient (no orbit-space manifold structure);
  - connections, curvature, Ambrose–Singer and holonomy (no manifold differential forms; Mathlib `extDeriv`, `Analysis/Calculus/DifferentialForm/Basic.lean:72`, is on normed spaces only);
  - the flat dictionary;
  - L²;
  - circle-bundle classification and Hopf/Chern–Weil. Tau Ceti has `singularCohomology` (`AlgebraicTopology/Cohomology/Kronecker.lean`) but no principal-bundle carrier, no c₁ and no smooth ℂP¹.
- Own names `ContinuousFiberMetric`, `cechConstants` and `cechConstantsNativeIso` were removed from the README backticks, and every Lean name is now introduced in the README (B6.0 and B6.1).

## Signature check
I added `#check @name` for all seven declarations to the module temporarily, elaborated it once with the build command, then removed the lines. Results:
- `SmoothGoodCover` takes only E, H, M, I and the charted-space instances.
- `exists_smoothGoodCover_refining` carries `[IsManifold I ∞ M] [FiniteDimensional ℝ E] [T2Space M] [SecondCountableTopology M] [I.Boundaryless]` and the cover hypothesis.
- The finite version carries `[CompactSpace M]` in place of second countability.
- `cechTupleConstantSection_bijective_iff` needs no manifold hypothesis: the contraction field gives connectedness.

Everything agrees with README B6.0–B6.1. No binder was lost.

## Adversarial pass (statements added or changed)
| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `exists_smoothGoodCover_refining` | M = ∅ | C.Index = Empty: `covers` vacuous, refinement vacuous | holds | none |
| same | ι = ∅, M ≠ ∅ | hypothesis `∀x, ∃i, x∈U i` false | vacuous, true | none |
| same | M = S¹, U = {S¹} | two arcs meet in two disjoint arcs (disconnected, not good); three arcs: pairwise intersections are single arcs, triple intersection empty, so a 3-member good refinement exists | holds (existence only) | none |
| same, generality | boundary allowed | README restricts to boundaryless; Lean has `[I.Boundaryless]` | agree | none |
| `exists_finite_smoothGoodCover_refining` | compact M without second-countability binder | compact Hausdorff manifold has a finite atlas, hence second countable | holds | none |
| `cechTupleConstantSection_bijective_iff` | p = 0, member empty | sections over ⊥ of a sheaf = 0; ℝ → 0 is not injective; RHS false | both false | none |
| same | p = 1, tuple (i,i) | intersection = U_i, the same factor as p = 0 | consistent | none |
| same | nonempty W | W contractible ⇒ connected ⇒ locally constant sections = ℝ, unit gives r ↦ const r | both true | none |
| same, wrong model | constant presheaf instead of sheaf | sections over ∅ would be ℝ, so the map is bijective on an empty intersection and the "←" direction fails | excluded by using `constantSheaf` | none |
| `SmoothGoodCover` wrong model | contraction = identity at all times | contradicts `at_zero` unless W is a point | excluded | none |
| README H11 finite-rank claim | F = c₀₀, one-point base, μ = δ | L² ≅ F incomplete | finite rank needed | README hypothesis added |
| README B5 lens covering, k = 2, n = 4 | ℤ/4 → μ_2 kernel order 2 | covering S³/μ_2, H⁰ = 1 | agrees with the B7 formula | none |

## Ownership and sources
- Smooth good covers and the constant-sheaf Čech coordinates on smooth manifolds are owned here (B6.0–B6.1).
- `roadmaps grep` checks: "good cover" and `constantSheafAdj` give no other owner of smooth good covers among the listed open heads or on main. TopologicalSheafCohomology owns the generic raw refinement maps, which are consumed by section. No declaration name matches a declaration in a readable roadmap.
- Sources: no new citation was added, and nothing was added to `needs-references.toml`.

## Build
`lake build TauCetiRoadmap.SmoothBundlesConnections.Suggested`: Build completed successfully (8976 jobs), with three `declaration uses 'sorry'` warnings (the three theorems).

## Gate
`gate SmoothBundlesConnections: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
