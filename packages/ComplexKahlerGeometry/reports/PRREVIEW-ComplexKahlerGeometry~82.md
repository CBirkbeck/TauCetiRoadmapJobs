# Review of ComplexKahlerGeometry (pull request #1854 at 7abe607)

**Verdict:** needs changes

This is a full re-review. The folder now carries #1807's rewritten copy plus this pull request's edits: its README differs from #1807's copy by 140 lines and its `Suggested.lean` by 5. Of the previous review's 19 findings, 12 are repaired, 4 partly and 3 not; the per-finding status comes after the new findings. There are 11 findings: R01–R04 are P2 and block acceptance, R05–R11 are P3.

**Gate.** I re-ran it at this head and got the worker's result, with every text count 0. The tool reports `outside-folder=38` because it does not know this pull request's own folders. With the 17 named folders excluded, two files remain (R11). The gate therefore FAILs.

**Dependency check.** Output: `depcheck: 235 roadmaps, 2264 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. I believe this misses one edge class, a supplier that is neither on main nor in the merge order (R01, with the exact line).

**Elaboration.**
- `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` exits 0 with 16 `sorry` warnings and no other diagnostic.
- Pins: Tau Ceti 2fd255d, Mathlib from `lake-manifest.json`.

## R01 (P2) — VariationalMethods and UnboundedOperators are suppliers but are not on main

**Location.** `README.md`:
- line 445, heading "From TauCetiRoadmap.VariationalMethods and TauCetiRoadmap.OperatorTheory/UnboundedOperators";
- lines 1879–1880: "*Needs:* 5.2; 5.5; VariationalMethods §2.2–2.4, §3.1, Layers 3–4, §5.1–5.2; UnboundedOperators §4.7 (UO-D06)";
- also lines 1339–1340, 1831–1846, 1923–1926, 1945 and 2043–2044.

**Claim.** ComplexKahlerGeometry is on main and this pull request revises it, so it may consume only the pins and roadmaps on main. VariationalMethods and UnboundedOperators are new roadmaps in open pull requests (#1028 and #1027). Neither is on main, and neither is in the merge order.

Two cited names also resolve nowhere:
- `toRealBilin` (line 448) has 0 hits in VariationalMethods at its head, in Mathlib and in Tau Ceti.
- `closedFormOperator` (lines 451, 454) has 0 hits in UnboundedOperators' README at its head. Only VariationalMethods uses the name (its line 841).

**Witness.**
- Main 1bea835 has no `TauCetiRoadmap/VariationalMethods` and no `TauCetiRoadmap/OperatorTheory/UnboundedOperators`.
- `roadmaps list` shows "#1027 UnboundedOperators (new)" and "#1028 VariationalMethods (new)".
- `ORDER.txt` lists neither.
- I believe the depcheck's silence on lines 1879–1880 is a false negative.

**Repair.**
1. Delete the VariationalMethods/UnboundedOperators contract (lines 445–458) and their items in the *Needs:* lines of 5.7 and 5.8 and in Layer 5's Dependencies.
2. In 5.7, own the abstract steps that 5.7 actually uses, from the pins:
   - the coercive solution operator, from Mathlib's `IsCoercive.continuousLinearEquivOfBilin` (`Analysis/InnerProductSpace/LaxMilgram.lean`);
   - compactness of the shifted inverse, from 5.5's Rellich theorem;
   - the eigen-expansion of that compact self-adjoint inverse;
   - the identification of its domain with `H²` (already a 5.7 target).
3. Alternatively, move the compact-resolvent and eigen-expansion conclusions to "ComplexKahlerGeometry, Part II", placed after both roadmaps.

## R02 (P2) — The differential-operator core and the Laplace-type predicate have two owners

**Location.** `README.md` 5.2, lines 1444–1464. Lines 1462–1464 read: "PseudodifferentialOperators P1.0 owns jet bundles, the iterated-commutator characterization of the order filtration and the connection expansion of symbols, and consumes this core." See also lines 98–102.

**Claim.** 5.2 now owns linear differential operators, the Fourier symbol, the Laplace-type predicate, `∇*∇`, the density transpose and the formal adjoint. PseudodifferentialOperators on main still owns the same objects and says that this roadmap consumes its copy. Each roadmap hands the object to the other. This head cut the previous cycle by stopping its citation of PseudodifferentialOperators as a supplier, but left two owners.

**Witness.** In `TauCetiRoadmap/PseudodifferentialOperators/README.md` on main:
- line 12: "This roadmap owns the smooth differential-operator core (P1.0)";
- lines 436–441: "Define the Laplace-type predicate on this carrier by order at most 2 and Fourier principal symbol `c|ξ|²_g Id` … CKG K5a consumes this predicate."

This head's line 1455 defines the same predicate, with the same restriction, frame, rescaling and `c = 1` laws.

**Repair.** Choose one owner and make both READMEs name it. Since PseudodifferentialOperators consumes K5a, the owner is 5.2 here. Add PseudodifferentialOperators to this pull request, or to a companion pull request, so that:
- its P1.0 consumes 5.2's operator carrier, symbols, Laplace-type predicate and transposes;
- it deletes its lines 97–98 ("K5a's distributional action and Laplace analysis consume the differential-operator core") and the clause at 441.

## R03 (P2) — 6.1's twisted Kähler identities and Bochner–Kodaira–Nakano omit the Kähler hypothesis on the base

**Location.** `README.md` lines 2074–2078: "For a Hermitian holomorphic bundle `E` with 4.2's Chern connection, prove … the twisted Kähler identities `[Λ, ∂̄_E] = −i(D′_E)*` … Prove `Δ″_E = Δ′_E + [iΘ(E), Λ]` … (Demailly, Chapter VII, (1.2))."

**Claim.** The base metric `ω` is never assumed Kähler. On a Hermitian base both identities carry torsion terms. The cited (1.2) is the formula with those terms, not the one stated.

**Witness.**
- Demailly VII (1.1)c, p. 329 (`demailly-agbook` lines 16248 and 16252): `[Λ, D″_E] = −i(δ′_E + τ*)`, with `τ = [Λ, d′ω]`.
- (1.2), line 16274: `Δ″ = Δ′ + [iΘ(E), Λ] + [D′,τ*] − [D″,τ*]`.
- Corollary (1.3) drops the torsion terms "if ω is Kähler".
- Instance: on `ℂ²` take `ω = (i/2)(dz₁∧dz̄₁ + (1+|z₁|²)dz₂∧dz̄₂)`. Then `d′ω = (i/2) z̄₁ dz₁∧dz₂∧dz̄₂ ≠ 0` at `z₁ = 1`, so `τ ≠ 0` there.

**Repair.** Open the paragraph with "on a Kähler manifold `(X, ω)`". Cite Demailly VII (1.1) with `τ = 0` for the twisted identities and (1.3) for `Δ″_E = Δ′_E + [iΘ(E), Λ]`. Alternatively, keep a Hermitian base and state `τ = [Λ, d′ω]` with (1.2)'s torsion terms. The consumer, RealAnalyticGeometry R3, works with a complete Kähler metric (its line 683), so the Kähler form suffices.

## R04 (P2) — Two statable headlines are absent, and the docstring's list of unstatable ones is incomplete

**Location.** The `Suggested.lean` module docstring, lines 30–54. In the `README.md` Summary (lines 6–13), "Oka and Cartan coherence, the singular locus", "the flat-bundle/local-system equivalences" and "Riemann-surface … computations" are listed as headlines. Line 1042 has "Own **Cartan's coherence theorem**", and lines 2303–2304 read "prove … `b₁ = 2g` by Hodge comparison".

**Claim.**
- Cartan's coherence theorem, in the primitive local form that 3.4 states, is statable with exactly `oka_coherence`'s carriers.
- The genus dictionary `b₁ = 2h^(1,0)` of a compact Riemann surface is statable with the file's own `ComplexDeRhamCohomology` and `DolbeaultCohomology`.
- Neither is stated, and neither is named as unstatable.
- The docstring also omits the singular-locus theorem and the flat-bundle/local-system equivalences from its unstatable list.
- Its reason for the Frölicher spectral sequence is inaccurate. The pinned Tau Ceti has the bicomplex spectral sequence `HomologicalComplex₂.rowFiltrationSpectralSequence` (`Algebra/Homology/SpectralSequence/Bicomplex.lean`). What is missing is the Dolbeault double complex as a bicomplex object.

**Witness.** I appended both statements to a scratch copy of the file. It elaborates at the pins (exit 0, `sorry` warnings only). The b₁ statement:

```lean
theorem finrank_complexDeRhamCohomology_one_riemannSurface
    {X : Type*} [TopologicalSpace X] [ChartedSpace ℂ X] [IsManifold 𝓘(ℂ, ℂ) ∞ X]
    [T2Space X] [CompactSpace X] :
    Module.finrank ℂ (ComplexDeRhamCohomology ℂ X 1) =
      2 * Module.finrank ℂ (DolbeaultCohomology ℂ X 1 0) := by
  sorry
```

`cartan_coherence` has `oka_coherence`'s binders. Its conclusion gives `V`, `N` and generators `g j` that are holomorphic on `V` and vanish where all `f i` vanish, such that every germ `h` at `y ∈ V` vanishing on that zero set is `Σ j, c j * g j` near `y`.

Values: an elliptic curve gives `2 = 2·1` and `ℂP¹` gives `0 = 2·0`. For `A = {z² = 0} ⊂ ℂ` the generator is `g₁ = z`.

**Repair.**
1. Add both theorems (Demailly II (4.29), p. 99, for Cartan; 7.3 for `b₁`), with backticked names in README 3.4 and 7.3.
2. Name in the docstring, with the missing carrier of each, the singular-locus theorem (analytic subsets and their dimension) and the flat correspondence (the holomorphic-bundle mixin).
3. Correct the Frölicher reason.

## R05 (P3) — Two targets restate what the pins already provide

**Location.**
- `Suggested.lean` lines 321–331 (`IsKahlerForm`).
- `README.md` lines 138–140: "agrees with Tau Ceti's `SmoothTwoForm.Compatible` convention through DifferentialGeometry 0.4's `legacySmoothTwoFormEquiv`, a comparison proved in 6.1"; and lines 2059–2061.
- `README.md` line 2218: "Own what the pin lacks: `ConnectedSpace` from path-connectedness".

**Claim.**
- The second and third clauses of `IsKahlerForm` are the pinned `SmoothTwoForm.Compatible`.
- `SmoothTwoForm I M` is by definition `SmoothForm I M ℝ 2` at the pin, so no comparison through `legacySmoothTwoFormEquiv` is needed. That name does not exist at the pins.
- `ConnectedSpace` of projective space is an existing instance.

**Witness.**
- Tau Ceti `Geometry/Manifold/TwoForm/Basic.lean:37` has `abbrev SmoothTwoForm … := SmoothForm I M ℝ 2`.
- `Geometry/Symplectic/Manifold/TwoForm.lean:231` defines `Compatible` as `Invariant` ∧ `Tames`.
- I proved `IsKahlerForm E M κ ↔ mextDerivₗ 𝓘(ℝ, E) 2 κ = 0 ∧ SmoothTwoForm.Compatible κ (ofComplexManifold E M)` in four lines from `invariant_iff`, `tames_iff` and `eval₂_apply` (exit 0).
- Mathlib `Topology/Connected/PathConnected.lean:721` has the instance `PathConnectedSpace.connectedSpace`. The pinned `Projectivization.instPathConnectedSpace` is at `Topology/Algebra/Projectivization.lean:251`.

**Repair.**
1. Define `IsKahlerForm` as `mextDerivₗ 𝓘(ℝ, E) 2 κ = 0 ∧ SmoothTwoForm.Compatible κ (ofComplexManifold E M)`, and add `TauCeti.Geometry.Symplectic.Manifold.TwoForm` to the imports.
2. Replace the `legacySmoothTwoFormEquiv` comparison in the Conventions and 6.1 with the pinned abbreviation.
3. Delete the `ConnectedSpace` target from 7.1 and cite the instance.

## R06 (P3) — 7.1 and AlgebraicTopology Stage 4.6 put different topology instances on ℂPⁿ

**Location.** `README.md` lines 2204–2206: "with the pinned quotient topology … (Tau Ceti's `Projectivization.instTopologicalSpace`, the same definition as Mathlib's, on which AlgebraicTopology Stage 4.6 builds the CW structure)".

**Claim.** Stage 4.6 builds on Mathlib's instance, not on Tau Ceti's. At the pins the two cannot exist in one environment. As stated, 7.2's consumption of Stage 4.6's CW structure on 7.1's manifold cannot be elaborated.

**Witness.**
- `TauCetiRoadmap/AlgebraicTopology/README.md` at this head, line 1075: "with native `Projectivization ℂ (Fin (n+1) → ℂ)` under Mathlib's quotient topology".
- A scratch file importing `Mathlib` and `TauCeti.Geometry.Manifold.Instances.Projectivization` fails: "environment already contains 'Projectivization.instTopologicalSpace' from Mathlib.Topology.Algebra.Projectivization".

**Repair.** Make 7.1 state that the carrier topology is Mathlib's instance, which Stage 4.6 uses, and correct the quoted clause. In the Tau Ceti contract, record that the pinned charts and `Projectivization.instIsManifold` are consumed once Tau Ceti's duplicate instance is removed. Add the identification of the two instances, which have the same body, as a 7.1 target.

## R07 (P3) — Citations in other roadmaps that this revision breaks

**Location.**
- The former-numbering list, `README.md` lines 490–502.
- Lines 2155–2159, which move the integral cycle class to Part II.

**Claim.**
- Three former heading anchors are cited by roadmaps on main, and the list does not map them. The overlap check still reports `#k2-dolbeault-calculus-and-the-local-lemmas`, `#k5-compact-hermitian-elliptic-theory-and-serre-duality` and `#k7-projective-torus-and-hopf-examples`.
- `BundleTest`, `BundleDistribution` and `BundleSobolev` are deleted from `Suggested.lean` with no mapping. They are deleted correctly, as sorried data.
- RealAnalyticGeometry still names this roadmap as the consumer of its R5.

**Witness.**
- SmoothBundlesConnections line 576 on main links `../ComplexKahlerGeometry/README.md#k5-compact-hermitian-elliptic-theory-and-serre-duality`. This head's heading is "Layer 5: … (K5)".
- ComplexComparisonPartII line 3788 (#848): "*Needs:* ComplexKahlerGeometry K5a's `BundleTest`, `BundleDistribution`". RicciFlow line 144 (#1023) cites `BundleSobolev`.
- RealAnalyticGeometry line 1019 on main: "This is the provider consumed by ComplexKahlerGeometry K6".

**Repair.**
1. Give the map as a table whose header names the former numbering, with one row per former anchor (`#k2-…` → Layer 2, `#k5-…` → Layer 5, `#k7-…` → Layer 7) and rows `BundleTest` → 5.1 bundle tests, `BundleDistribution` → 5.1 bundle distributions, `BundleSobolev` → 5.5 `H^s(E)`.
2. Change RealAnalyticGeometry line 1019 to "ComplexKahlerGeometry, Part II".

## R08 (P3) — Mixed numbering and one notation slip

**Location.**
- `Suggested.lean` docstrings cite "K3.HolomorphicStalk" (line 169), "K5b.1" (279, 287) and "K6.1" (334, 343, 351, 366).
- `README.md` line 92, "RealAnalyticGeometry consumes K1–K5b and K6.0", and lines 2521–2539 use former ids.
- Line 1261 reads "agrees only for `λ ∈ ℤ/2`".

**Claim.**
- The README now numbers these targets 3.2, 5.10 and 6.2. Its §6.1 is the former K6.0, so a docstring's "K6.1" sends a reader to the wrong section.
- `ℤ/2` denotes the group of order two, not `(1/2)ℤ`.

**Witness.** The former-numbering map (line 500) gives "`K6.0` → 6.1; `K6.1` → 6.2". For the monodromy: at `λ = 1/4`, `e^(−πi/2) = −i ≠ i = e^(πi/2)`; at `λ = 1/2` both values are `−1`.

**Repair.** Use the README's numbering (3.2, 5.10, 6.2, 5.1–5.8, 5.9, 6.1) in the docstrings and in lines 92 and 2521–2539, and write `λ ∈ (1/2)ℤ`.

## R09 (P3) — Sampled targets without locators, including the Malcev input of 8.2

**Location.**
- `README.md` 8.2, lines 2424–2429: "Prove the restricted Malcev rationality statement from `Γ` … `Γ ∩ A` a uniform lattice, `AΓ` closed" (no locator).
- 4.1, lines 1170–1176: the section/reconstruction equivalence.
- 5.5, lines 1662–1667: the embeddings `H^s → C^k` and Rellich.

**Claim.** Each of these deep or standard theorems has no locator. The previous review asked for the Raghunathan locator.

**Witness.**
- `sakane-parallelisable` lines 111–113 (p. 189) rest the lattice step on Raghunathan, Corollary 1 on p. 31 and Theorem 1.13 on p. 23. The manifest records `raghunathan-discrete-subgroups`.
- `demailly-agbook` line 13162 (V (11.1), p. 267) identifies holomorphic bundles with locally free `𝒪`-modules.
- `demailly-agbook` lines 14239–14242 (VI (2.1)–(2.2), p. 289) give the Sobolev and Rellich lemmas.

**Repair.** Cite:
- raghunathan-discrete-subgroups, Theorem 1.13 (p. 23) and Corollary 1 (p. 31), in 8.2;
- Demailly V (11.1), p. 267, in 4.1;
- Demailly VI (2.1)–(2.2), p. 289, for the integer-order cases in 5.5.

## R10 (P3) — Other open pull requests change this folder, and the stated order is wrong or missing

**Location.** This pull request's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.**
- #1808 rewrites this folder differently from this head, so it is not independent.
- #1234 also changes the folder, and no order is stated for it.

**Witness.**
- The overlap report lists conflicts in `ComplexKahlerGeometry/README.md` and `Suggested.lean` with #1234, #1807 and #1808.
- `roadmaps show ComplexKahlerGeometry` at each head, compared with this head, gives differences of 140 README lines and 5 Lean lines for #1807, 532 and 32 for #1808, and 5396 and 684 for #1234.

**Repair.** State in the description which of #1808 and #1234 rebases on which relative to this pull request. Do not restate what #1807 already carries.

## R11 (P3) — Edits outside the folders named as this pull request's own

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`. The gate reports `outside-folder` = 2.

**Claim.** Neither folder is among those this pull request's review covers.

**Witness.** `git diff --stat origin/main...HEAD`, with the 17 named folders excluded, lists exactly these two files.

**Repair.** Either name both folders as the pull request's own, or move the two edits to their own pull request.

## Previous findings (review of 0ab1982)

- **R01 (sorried data): repaired.** The gate reports `sorry-data=0`. The 10 definitions have real bodies, for example `polydisc` at lines 101–103 and `lefschetzPow` at lines 359–363.
- **R02 (SurfaceTopology/PlanarTopology): repaired.** Both names occur 0 times. Line 2306 reads "no step classifies surfaces or compares `Σ` with a standard genus-`g` model", and the integral cup basis is derived from the pinned fundamental class, universal coefficients and alternating forms (lines 2307–2331).
- **R03 (two-way supply with RealAnalyticGeometry): repaired here.** No *Needs:* line or contract cites RealAnalyticGeometry. 6.2 stops at the real ambient class (lines 2152–2159), and 3.5's finiteness uses local parametrization and compactness (lines 1092–1097). RealAnalyticGeometry line 1019 is now stale (R07).
- **R04 (two-way supply with PseudodifferentialOperators): partly repaired.** The cycle is cut, but the core now has two owners (R02).
- **R05 (no headline stated): repaired.** 16 theorems are stated, and the docstring names unstatable ones. The remainder is in R04.
- **R06 (duplication of pinned objects): repaired.** The Tau Ceti contract (lines 199–375) lists the pinned carriers, and the constructions are cut to what the pin lacks. The remainder is in R05.
- **R07 (CW structure of ℂPⁿ): repaired.** Lines 2262–2264 consume AlgebraicTopology Stage 4.6.
- **R08 (re-planning GlobalHolomorphicFunctions): repaired.** Lines 84–91 say "Nothing of it is consumed here", and no GH label remains.
- **R09 (nonexistent AlgebraicTopology names, reversed 8.12 clause): repaired.** Both names occur 0 times, and the 8.12 clause is gone.
- **R10 (LieGroupoidsPoisson reverse edge): repaired.** The sentence is deleted.
- **R11 (pull-request numbers, commit links): repaired.** There are 0 occurrences of "#279", "#280" and `github.com`.
- **R12 (unresolved labels): partly repaired.** The section labels now resolve at the suppliers' heads. `toRealBilin` and `closedFormOperator` do not resolve, and the suppliers are not on main (R01).
- **R13 (imports): repaired.** The file has `public import Mathlib` and 13 `TauCeti.*` modules, all used, and the gate reports `imports=0`.
- **R14 (padding): repaired.** The one-tactic probe closes none of the 16 theorems.
- **R15 (`Classical.choose` datum): repaired.** The declaration is deleted, and the gate reports `statement-hygiene=0`.
- **R16 (README shape): repaired.** The house headings are in place. The README has 35 subsections, 35 `**Checks.**` lists, 35 *Needs:* lines and 8 Examples/Dependencies pairs.
- **R17 (locators): partly repaired.** Rainer 7.4, Hörmander 2.3.4–2.3.5, the Demailly labels, Wells chapters and Angella have been added. The Raghunathan input of 8.2, and 4.1 and 5.5, still have none (R09).
- **R18 (other open pull requests): not repaired.** See R10.
- **R19 (edits outside the folder): not repaired.** See R11.

## Verified sound

**Gate and build.**
- My gate run matches the worker's.
- `Suggested.lean` elaborates: exit 0, 16 `sorry` warnings.
- `#check @` of all 26 declarations in one scratch file: exit 0.
  - Every theorem keeps `[FiniteDimensional ℂ E]`; the compact ones keep `[T2Space M] [CompactSpace M]`; `hodge_theorem_deRham` keeps `[BoundarylessManifold I M]` and the Riemannian-bundle instances.
  - Seven definitions drop `[FiniteDimensional ℂ E]`: `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology`, `mextDerivℂ`, `deRhamCocycles`, `deRhamCoboundaries` and `ComplexDeRhamCohomology`. `IsKahlerForm` and `lefschetzPow` drop it too. None of them needs it.
  - Nothing changed against the README statements.
- Padding probe: none of the 16 theorems closes with `rfl`, `infer_instance`, `simp` or `trivial`.

**Docstring claim tested.** The projective import clash is real (R06 witness).

**Library declarations opened at the pins.**
- Tau Ceti:
  - `Orientation/Basic.lean:83` (`card_eq`): an orientation forces `m = dim`, so `hodge_theorem_deRham` has no junk `m`;
  - `Riemannian/HodgeStar.lean:73` and `:127`; `Codifferential.lean:88`;
  - `DeRham/Basic.lean:45, 77, 95, 127, 141` (real only);
  - `DifferentialForm/Regularity.lean:478` (`mextDerivₗ` is ℝ-linear, so `mextDerivℂ` is new);
  - `Dolbeault/Basic.lean:86, 95`;
  - `TwoForm/Basic.lean:37`; `Symplectic/Manifold/TwoForm.lean:174, 202, 231`;
  - `DifferentialForm/Smooth.lean:249, 265`; `DifferentialForm/Closed.lean:43`;
  - `Integration/TopForm.lean:518`, a real `integralTopForm`. A Hodge–Riemann statement would need a degree cast `2k+2(n−k) → 2n`, so the docstring's verdict that it is not statable stands;
  - `Topology/Algebra/Projectivization.lean:90, 251`;
  - `SpectralSequence/Bicomplex.lean`;
  - `SymplecticBasis.lean:357`;
  - `Singular/LocalHomology/FundamentalClass.lean:204, 373`.
- Mathlib:
  - `RegularLocalRing/Defs.lean:52` (the class includes Noetherian);
  - `Topology/Algebra/Projectivization.lean:44`;
  - `PathConnected.lean:721`;
  - `NewtonIdentities.lean:221`;
  - `Geometry/Manifold/Complex.lean:155`;
  - `TestFunction.lean:335`;
  - `Lebesgue/Complex.lean:63`.
- I also checked by grep, at the pins, the files of 57 Tau Ceti names and 36 Mathlib names that the README cites. All resolve.

**Cross-roadmap citations resolved.**
- DifferentialGeometry on main: 0.1 (272), 0.3 (284), 0.4 (294, 303), 1.1–1.3 (315–322), 2.1–2.2 (345, 352), 5.2–5.5 (511–528), Layers 6–7 (782, 806), 8.3–8.5 (836–852), 12.1, 12.3, 12.4 (915–923).
- SmoothBundlesConnections on main: B2.1–B2.4 (559–776), B3.1–B3.3, B4.1, B5.0, B5.2, B6.0–B6.3 (871–1716). Its lines 58–62 and 1935–1940 agree with the direction of supply.
- AlgebraicTopology at this head: Stage 4.4 (757), 4.6 (1061, 1075–1077), 5.0 (1181), 6.3 (1762), 6.4 (2124), 8.7 (2453); consumer lines 142, 1216, 2210.
- PDE on main: §1.3 (769), §1.7 (996), §2.2 (1148), §5.3 (1927), §5.6 (2097).
- LieGroupoidsPoisson on main: §G1.3a (18, 603); lines 85–91 and 2020 say this roadmap consumes it.
- ComplexManifolds on main: Milestones 1–7 (172–319), items 7.4–7.5 (346–353).
- ComplexTori on main: Milestone 1 (130).
- RealAlgebraicGeometry (Completed): Layer 7 (479).
- VariationalMethods at #1028: §2.2–§5.2 and `operatorDomainV` (845). UnboundedOperators at #1027: §4.7 (703).
- RealAnalyticGeometry on main: its consumer lines 173–850 agree.
- DeRhamCohomologyAndDuality at #2085: lines 110–111 leave complex-coefficient de Rham to this roadmap, so it has a single owner.
- PseudodifferentialOperators on main: lines 12, 91–98, 164, 436–441 (R02).

**Merge order.** ComplexKahlerGeometry is on main and is not in `ORDER.txt`. SmoothBundlesConnections is at position 12, PseudodifferentialOperators 13, ComplexComparisonPartII 39, GlobalHolomorphicFunctions 97, LieGroupoidsPoisson 152.

**Ownership against open pull requests.** `roadmaps grep` for Newlander, Dolbeault–Grothendieck, Weierstrass preparation, Oka, Rückert, Hartogs, Hard Lefschetz, Serre duality and Kähler returns no second owner. The Hard Lefschetz hits (#1040, #929, #1061) are étale or linear. ComplexComparisonPartII and TeichmullerGeometry consume this roadmap. Ids that only an open revision defines: none.

**Seeded sample, verified at the text.**
- 3.3: Rainer Theorem 7.4 (line 716) gives the Laurent expansion and its coefficient integral.
- 3.4: Demailly II (2.7) (3872), (2.10) (3931), (3.19) (4286), (4.19) (4613), (4.22) (4742), (4.29) on p. 99 (4842), and (4.32) on p. 101 (4959).
- 3.5: (4.24) on p. 98 (4789: density of `A_reg`) and (4.31) on p. 100 (4929); Hartogs I (3.28) (1266) has the same hypotheses as `hartogs_extension`.
- 2.3: Dolbeault–Grothendieck I (3.29) (1288), stated for a neighbourhood, as the README says.
- 3.2: Weierstrass preparation II (2.1) (3794); division (2.3) with "The representation (2.4) is unique" (3817).
- 6.2: III (1.25) (6820), (2.6)–(2.7) (6997, 7027); VI (8.5)–(8.6) (15442, 15452), (8.12) on p. 313 (15523), (8.17) (15557); Ballmann 4.23 (2090), 5.31 (2742).
- 6.1, 4.2: Ballmann 3.18 (1400), 4.17 (1990), 5.25 (2680), the trivial-bundle case.
- 7.2: Demailly V (15.5)–(15.6) on p. 278 (13724); Knutson p. 1 theorem (`H⁰(O(1)) = V*`).
- 2.4: IV (6.13)–(6.15) on p. 216 (10730–10742).
- 5.10: VI (7.2) on p. 309 and (7.3) on p. 310 (15385–15390).
- 8.2: Sakane Theorem 1, restated on p. 189 (line 102), with the central reduction at lines 106–115.
- 8.3: Angella Theorems 2.1 (256), 2.3 (276), 4.1 (766); Appendix A (916–920: `b₁ = 4`, `h^(1,0) = 3`, `h^(0,1) = 2`).
- 1.1, 1.2, 3.1, 4.4, 5.4, 5.8 and 7.1 carry no source locator. They consume pinned declarations, all of which resolved. For 4.1 and 5.5 see R09. The README flags no locator as unverified.

**Adversarial table.** "Probe" marks a statement elaborated at the pins in this review.

| # | Statement | Instance | Left / right values | Result | Change |
|---|---|---|---|---|---|
| 1 | `newlander_nirenberg` | `J = ofComplexManifold E E`; the `ℝ⁴` structure of 1.3 | the identity chart is pseudoholomorphic; `N_J(∂x,∂u) = [∂y, ∂v + y∂x] = ∂x ≠ 0` | consistent; hypothesis non-vacuous | none |
| 2 | `dolbeault_grothendieck_polydisc` | n=1, `φ = z̄ dz̄`; n=0; `r₁ ≤ 0` | `∂̄(z̄²/2) = z̄ dz̄`; degree ≥ 1 forms are 0 on a point; empty domain | holds | none |
| 3 | `polydisc` | `r = (1,1)` | `(0.9, 0.9)` in (‖·‖₂ = 1.27); `(1, 0)` out | product, not ball | none |
| 4 | `hartogs_extension` | n=1, `K={0}`; n=2, shell `1≤\|z\|≤2` | `1/z` has no extension; 1 inside / 0 outside violates the identity theorem | both hypotheses needed | none |
| 5 | `weierstrass_preparation` | `w² − z`; `e^z w`; d=0 | `u=1, a₀=−z, a₁=0`; `u=e^z, a₀=0`; `u=f, u(0)=f(0)≠0` | holds | none |
| 6 | `weierstrass_preparation_unique` | `f = w²` | a second factorization `(1+w)·P` with P monic of degree 2 would need `w²/(1+w)` to be a polynomial: impossible | unique (Demailly II (2.3)) | none |
| 7 | `isRegularLocalRing_holomorphicStalk` | n=0, n=1 | `spanFinrank 𝔪 = 0 = dim`; `𝔪 = (z)`: 1 = 1 | holds | none |
| 8 | `uniqueFactorizationMonoid_holomorphicStalk` | node `w²−z²−z³` | `(w − z√(1+z))(w + z√(1+z))`, two non-units | consistent | none |
| 9 | `rueckert_nullstellensatz` | `f₁=z², g=z`; k=0; `f₁=1+z` | `z² = 1·z²` (m=2); `g≡0`, m=1, empty sum; m=0 with `a₁ = 1/(1+z)` | holds incl. boundary | none |
| 10 | `oka_coherence` | `(z₁,z₂)`; `(z, z²)`; k=0 | `g₁=(z₂,−z₁)`; `h₁z + h₂z² = 0 ⇒ h = −h₂(z, −1)`; N=0 | holds | none |
| 11 | `hodge_theorem_deRham` | flat `T²`, degree 1 (`k=0, l=1, m=2`) | harmonic forms of dim 2 = `b₁`; `cos x dx = d sin x` ↦ 0 | holds; `m = dim` forced | none |
| 12 | `finiteDimensional_dolbeaultCohomology` | `ℂP¹`; Hopf | `h^(1,0) = h^(0,1) = 0`; Hopf `h^(0,1) = 1` | holds without Kähler | none |
| 13 | `finrank_dolbeaultCohomology_serre` | Hopf, n=2: `(0,1)↔(2,1)`, `(1,0)↔(1,2)`; p=3 | 1=1; 0=0; p=3 has LHS 0, so `hp` is needed | holds | none |
| 14 | `finrank_complexDeRhamCohomology_eq_sum_dolbeault` | elliptic curve k=1; `ℂP¹` k=2; k>2n | 2=1+1; 1=0+1+0; 0=0 | holds | none |
| 15 | `finrank_dolbeaultCohomology_symm` | Hopf | `h^(1,0)=0 ≠ 1=h^(0,1)`; Hopf has no Kähler form since `H²=0` | Kähler hypothesis needed | none |
| 16 | `even_finrank_complexDeRhamCohomology_odd` | elliptic curve; Hopf | `b₁=2`; `b₁=1`, not Kähler | holds | none |
| 17 | `lefschetzPow` | `ℂ²`, `ω = dx₁∧dy₁+dx₂∧dy₂`, j=2 on `1` | `ω∧ω = 2 vol`, not `vol` | no `1/j!`, as documented | none |
| 18 | `hard_lefschetz` | k=n; curve, k=0 | `L⁰ = id`; `[f]↦[fω]`, `ℂ^c→ℂ^c` with `∫ω>0` per component | holds | none |
| 19 | `IsKahlerForm` | `±dx∧dy` on `ℂ`; `κ_ε` on `ℂ²` | `(1,i)↦+1/−1`; `κ_ε(v,Jv) = \|v\|²+ε(bc−ad) ≥ (1−ε/2)\|v\|²`, `κ_ε(∂x₁,∂x₂) = ε ≠ 0 = κ_ε(∂y₁,∂y₂)` | discriminates; equals pinned `Compatible` (probe) | R05 |
| 20 | `DolbeaultCohomology` | compact Riemann surface, (1,0) | cocycles = holomorphic 1-forms (dim g); all (1,0)-forms modulo 0 is infinite-dimensional | image of cocycles is right | none |
| 21 | `dolbeaultCoboundaries`, `deRhamCoboundaries` at q=0 / k=0 | — | `⊥`, no `q−1` junk | holds | none |
| 22 | Kähler-form sign vs pinned `Tames` (`TwoForm.lean:174`) | `ℂ`, `J=i` | `form(v, Jv) > 0` on both sides | same convention | none |
| 23 | 1.1 orientation | `z↦iz`; `z↦z̄`; `diag(2,i)` | `\|i\|²=1`; `det = −1`; `\|2i\|²=4` | consistent | none |
| 24 | 1.1 `φ_z̄` test | `z̄`; `z²` | pullback of dz is `dz̄` vs `2z dz` | types (0,1), (1,0) | none |
| 25 | 1.2 implicit map | `G=v²−z` at `(1,1)` | `F(1,0)=√1=1`; branch `−√` gives −1 | uniqueness pins the branch | none |
| 26 | 1.2 cusp | `w²−z³` | `dG = (−3z², 2w) = 0` at 0 | regularity needed | none |
| 27 | 3.1 real Osgood | `xy/(x²+y²)` | separately analytic; value 1/2 on `x=y≠0` vs 0 at origin | real analogue fails | none |
| 28 | 3.3 principal/regular split | `(z−a)⁻²(1+(z−a)²)`; `1/(z−a)` | principal part `(z−a)⁻²`, regular part 1, value 1; `c₋₁ = (2πi)⁻¹∮dz/(z−a) = 1` | holds (Rainer 7.4) | none |
| 29 | 3.4 Nullstellensatz | `𝔞=(z²)` in `ℂ{z}` | `V={0}`, `I(V)=(z)=√𝔞` | holds ((4.22)) | none |
| 30 | 3.4 Krull dimension | chain `(z₁)⊂…⊂(z₁..zₙ)` | length n; (4.32): `𝔪` needs ≥ n generators and has n | holds | none |
| 31 | 3.5 singular locus | `z²=w³`; `z₁z₂=0` | `∇=(2z,−3w²)` vanishes only at 0; Sing = {0}, dim 0 < 1 | holds ((4.31)) | none |
| 32 | 4.1 / 7.2 sections | `O(1)`, `O(2)` on `ℂP¹` | `h⁰ = 2`; `binomial(3,1) = 3` | holds (V (15.6)) | R09 |
| 33 | 4.2 Chern connection | `h=e^(−φ)`; `O(1)`, `h=(1+\|z\|²)⁻¹` | `A=−∂φ`, `Θ=∂∂̄φ`; `∂∂̄log(1+\|z\|²) = (2π/i)ω_FS = −2πiω_FS` | holds | none |
| 34 | 4.3 monodromy | `d + λdz/z`, λ=1/2, 1/4 | `e^(−πi) = −1 = e^(πi)`; `−i ≠ i` | agrees iff `λ∈(1/2)ℤ` | R08 |
| 35 | 4.4 morphisms | ranks (1,2)→(2,1) | `Hom(ℂ,ℂ²)⊕Hom(ℂ²,ℂ)`, dims 2+2 | non-isomorphisms admitted | none |
| 36 | 5.4 Fréchet | `sin(jx)/j` on `S¹` | sup norms: `C⁰` 1/j→0, `C¹` 1, `C²` j | neither convergent nor bounded | none |
| 37 | 5.5 strict margin | `u = χ loglog(1/\|x\|)` on `ℝ²` | `∫\|∇u\|² = 2π∫₀^(1/2) dr/(r log²(1/r)) = 2π/log 2`; u unbounded | `s>k+n/2` strict | R09 |
| 38 | 5.5 weights | ξ=1, s=1 | `2 ≤ 4 ≤ 4` | constants 1 and `2^\|s\|` | none |
| 39 | 5.7 Peetre | s=−1, η=−ζ, \|ζ\|=1 | `1 ≤ 2^(1/2)` holds; `⟨η⟩^s` version gives `1 ≤ 2^(1/2)/2`, false | `\|s\|` needed | none |
| 40 | 5.7 codifferential sign | m=3, k=1 vs pinned (k=0) | `(−1)^7 = (−1)^(3·2+1) = −1` | consistent | none |
| 41 | 5.8 kernel count | two circles, ranks 1 and 2 | `dim ker Δ = 1+2 = 3` | holds | none |
| 42 | 5.9 Gram normalization | `dz` | `\|dx+idy\|² = 2`; `dz♯ = ∂x − i∂y = 2∂_z`; `ω²/2! = dvol` | holds | none |
| 43 | 6.1 Kähler identities | `d^c = i(∂̄−∂)` | `[Λ,d] = i∂̄*−i∂*`, which equals `−(d^c)*` | equal | none |
| 44 | 6.1 twisted identity on a Hermitian base | `ω=(i/2)(dz₁∧dz̄₁+(1+\|z₁\|²)dz₂∧dz̄₂)`, z₁=1 | `d′ω=(i/2)z̄₁dz₁∧dz₂∧dz̄₂ ≠ 0` ⇒ `τ≠0`, `[Λ,D″] = −i(δ′+τ*)` | false without Kähler | R03 |
| 45 | 6.1 `[iΘ,Λ]` | curve, `iΘ = aω` | `(1,1)`: `+a`; functions: `−a` | bound only for k ≥ 1 | none |
| 46 | 6.2 Hodge–Riemann | `f dz`, `f dz̄`; `ω₁−ω₂` on `ℂP¹×ℂP¹` | `i(−2i) = 2`; `(−i)(2i) = 2`; `(ω₁−ω₂)∧ω = 0`, `∫(ω₁−ω₂)² = −2`, sign `−1` | positive | none |
| 47 | 7.1 transition | `z = 1/w` | real Jacobian `\|−1/w²\|² > 0` | orientation kept | R05 |
| 48 | 7.2 `ω_FS` | `ℂP¹` | `(1/π)·2π·∫₀^∞ r dr/(1+r²)² = 1`; unnormalized form gives π; `c₁ = (i/2π)(−2πiω_FS) = ω_FS` | holds | none |
| 49 | 7.3 unimodularity | `[[0,2],[−2,0]]` vs `J` | det 4 vs 1 | unimodularity needed | none |
| 50 | 7.3 Hopf | `z^a dz_j`, `z^(−m)dz_j` | weights `2^(\|a\|+1) ≥ 2`, `2^(1−m−n) ≤ 1/2`; Betti 1,1,0,1,1 = diamond sums | holds | none |
| 51 | 8.2 Heisenberg | Gaussian lattice | `A ≅ ℂ`, `Γ∩A = ℤ[i]`, base `ℂ²/ℤ[i]²`; dims 1+2 = 3 | matches Sakane lines 106–115 | R09 |
| 52 | 8.3 Iwasawa | invariant forms | `∂̄(dz̄₃ − z̄₁dz̄₂) = −dz̄₁∧dz̄₂`; `∂(dz₃−z₁dz₂) = −dz₁∧dz₂`; 3, 2, 4 (Angella lines 918–920) | `5 > 4 = b₁` | none |
| 53 | Cartan coherence (probe) | `A={z²=0} ⊂ ℂ` | statement elaborates; `g₁ = z` | statable, absent | R04 |
| 54 | `b₁ = 2h^(1,0)` (probe) | elliptic curve; `ℂP¹` | `2 = 2·1`; `0 = 2·0` | statable, absent | R04 |
| 55 | 5.2 Laplace-type predicate vs PseudodifferentialOperators | this README line 1455 vs its lines 436–441 | identical clauses | two owners | R02 |
| 56 | 5.7 supplier names | `toRealBilin`, `closedFormOperator` | 0 hits each where cited | unresolved | R01 |

## Not verifiable

- Webster, Math. Z. 201 (1989), pp. 303–316 (`webster-nn`, uncertified, paywalled): the 1.4 route.
- Hörmander, ALPDO I, Theorems 2.3.4–2.3.5 (`hormander-alpdo1`, uncertified): 5.3.
- Wells, Chapter II, and Chapter IV §§4–5 (`wells-dacm`, uncertified): 2.4, 5.7 and 5.10, and the docstrings of `hodge_theorem_deRham` and `finiteDimensional_dolbeaultCohomology`.
- Raghunathan, Theorem 1.13 (p. 23) and Corollary 1 (p. 31) (`raghunathan-discrete-subgroups`, uncertified): proposed in R09 from `sakane-parallelisable` lines 112–113; not read.

## Source issues

- **Misprint** in demailly-agbook at Chapter VII, proof of Theorem (1.1), p. 329: the proof refers to an unresolved "Prop. V-12.??" for normal coordinate frames; it should cite Chapter V, Proposition (12.10); affects nothing.
