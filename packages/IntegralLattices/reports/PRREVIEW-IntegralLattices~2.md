# Review of IntegralLattices (pull request #1239 at cdfcd0f)

**Verdict:** rejected

The folder replans an existing completed foundation and another roadmap's rank-24 constructions. Under the review contract, those ownership defects require a Part II scope, rather than approval of this folder as a new plan. There are also a supply cycle, a failing gate and omitted statable headlines. No pull-request file was changed.

## R01 (P1) — Break the lattice–Eichler supply cycle

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:101–105`, also 1375–1387 and 1784. The text calls the dependency order “by phase”.

**Claim:** early IntegralLattices supplies OTM §0.3, whose Eichler output supplies IntegralLattices §§5C–5D. Splitting implementation modules is presented as resolving this arrangement.

**Witness:** `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:147,159` at the supplied open head consumes IntegralLattices §§4B/4D; IntegralLattices consumes that same roadmap's §0.3. The roadmap graph has both directed edges.

**Repair:** give these results one direction of supply. For example, place the lattice-specific Eichler comparison here after the class/spinor interface, consuming the earlier general strong-approximation contract; OTM then consumes it. Alternatively put the later uniqueness applications in a separate Part II after OTM. Delete the duplicate N2/N3 ownership. On the witnessed two-node graph, either repair removes the reverse edge; a phase annotation does not. Preserve the factorwise noncompactness hypothesis and the rank-two exception.

The mechanical checker prints no cycle (output below), so this is a manual dependency finding, not a claim that the checker emitted one.

## R02 (P1) — Supply the general local input promised in §3I

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:924–927,1002–1009`, compared with 851–889.

**Claim:** §3I takes a lattice over any unramified finite extension `R/ℤ₂`, with a Jordan splitting “as in 3B”. Its only local prerequisites are §§3B–3E, stated on `ℤ_p` and its native localization carrier.

**Witness:** take the unramified quadratic extension with residue field `𝔽₄` and `L=R` with Gram `[2]`. Its type-I rank is 1 and `N=2`; it is not the rank-one `ℤ₂` lattice supplied by §3A.

**Repair:** own the finite-free `R` lattice, dual/scale/norm API and Jordan existence/invariance at this generality in an earlier local subsection, or cite an exact earlier owner that supplies them. Update the scope and dependency table accordingly; do not narrow Cho's general theorem to `ℤ₂`. The test lattice must remain rank 1 over `R`, with scale/norm `2R`, residue cardinality 4 and exponent 2. Restriction of scalars changes rank and is not this missing comparison. Cho Definition 2.1 and §2.2 support the general local setting, but a source citation alone is not an owned prerequisite.

## R03 (P1) — Clear the required build gate

**Location:** `TauCetiRoadmap/IntegralLattices/Suggested.lean:1`.

**Claim:** the acceptance module must build with `sorry` as its only warning.

**Witness:** the supplied gate has `build=1 FAIL`: importing Mathlib without the module system produces an additional warning. Direct elaboration reproduces it, although Lean exits successfully.

**Repair:** add the module-system declaration before the imports and rerun the targeted gate. A scratch copy with `module` elaborated without this warning. This finding's P1 severity follows the brief's mandatory build-failure classification; it is not an elaboration error or a mathematical counterexample.

## R04 (P2) — Consume the completed foundation instead of planning it again

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:512–565,597–650,792–832`.

**Claim:** these remain milestones to define/prove lattice predicates, determinant/signature, rationalization, duality, discriminant forms, gluing, bounded-norm finiteness, minimum and successive-minimum API, and Hermite's inequality.

**Witness:** `Completed/IntegralLattices/README.md:162–396` owns the foundation. At the pins, `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean:85,93,140`, `PosDef/Hermite.lean:60,81` and `PosDef/SuccessiveMinima.lean:45,94,143` already provide several repeated targets.

**Repair:** make the extension a Part II, state where the completed roadmap stops, and delete already supplied targets from its layers. Put exact declarations and genuine remaining extensions in the scope/supplier contracts. In particular, the squared-norm successive minima are already native; their difference from real-length minima does not justify replanning them. The retained Minkowski-second-theorem extension needs its own precise constant. On `A₂`, both the native and proposed Hermite statements give `2 ≤ 2`; on `diag(1,4)`, both successive-minimum APIs give `(1,4)`.

Also update the consumer description at lines 65–69 and 492–505: `TauCetiRoadmap/ThetaSeries/Suggested.lean:1–12,25–31` imports the native completed foundation, not `TauCetiRoadmap.IntegralLattices.Suggested`. Its bridge remains a valid named consumer, but the asserted import is stale.

## R05 (P2) — Import the existing rank-24 constructions

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:1822–1828,1884–1886`.

**Claim:** §6E constructs all 24 reference rows, verifies their root systems, and owns a later comparison with the conventional Leech model.

**Witness:** `TauCetiRoadmap/Rank24LatticeConstructions/README.md:223–249` constructs the 23 rootful rows; lines 312–374 construct the Leech lattice and prove minimum 4 and absence of roots.

**Repair:** consume those constructions by roadmap and section. If the Lorentz-kernel model is needed, retain only its new construction/comparison and explicitly identify the existing Leech target. Do not reconstruct the other 23 rows. For the `E₈³` row the supplied trivial-glue construction already gives rank 24, determinant 1 and 720 roots; the proposed repeat adds no different object. This repair does not assume that rootlessness alone identifies a lattice or proves completeness.

## R06 (P2) — State the missing low-rank classification headline

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:21,1809–1813`; `Suggested.lean:37–54,575`.

**Claim:** low-rank unimodular classification, including uniqueness of the even positive-definite rank-eight lattice, is a principal result. The acceptance file states only the indefinite even-unimodular uniqueness theorem from Layer 6.

**Witness:** a scratch theorem on native `IntegralLattice V` and `IntegralLattice W`, assuming `IsEven`, `IsUnimodular`, `IsPosDef` and rank 8 for each, with conclusion `Nonempty (L.Isometry M)`, elaborates at these pins.

**Repair:** add the actual statable classification headlines, beginning with rank-eight uniqueness; use the native reference lattice for the normal-form version if desired. Audit §§5C–5I, 6A odd, 6B–6G and 7C against the same rule. For each genuinely unstatable result name the missing carrier in the module docstring. The tested rank-eight statement needs neither a stand-in nor a new carrier; it excludes the indefinite `U⁴` by `IsPosDef`, and admits `E₈` on both sides.

## R07 (P3) — Remove acceptance-test padding

**Location:** `TauCetiRoadmap/IntegralLattices/Suggested.lean:255–271,555–568,796–827`; `ArchimedeanVolume.lean:32–53`.

**Claim:** primary-generator API and admitted rejection tests/small values are presented alongside the headline acceptance theorems.

**Witness:** `ArchimedeanVolume.lean:49` closes by `simp [orthogonalSkewBasisVolume, sphereArea]` in a scratch copy. Suggested's four rejection declarations repeat the `A₁²`, seven-clause, rank-one and cyclic-two README Checks.

**Repair:** delete this padding from `Suggested.lean` and the corresponding auxiliary acceptance file; keep the mathematics as README API/Checks. In particular delete `exists_bilinearLagrangian_gaussSign_ne_zero`, `twoElementaryAdmissible_independence`, `rankOne_one_characteristic_congruence_fails`, `padicDiscriminant_not_determined_by_cyclicTwoSummand` and the two primary-length API theorems. Delete the sphere/product positivity, recurrence and rank-0/1/2/3 acceptance lemmas; retain only definitions needed by genuine volume headlines. The rank-two probe gives `2π=2π`; it demonstrates deletion-worthy padding, not a request to prove it in place.

## R08 (P3) — Remove the computational deliverables

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:1882,2252–2300,2396`.

**Claim:** the roadmap requires implementing and certifying an exhaustive rootlessness checker, stored database certificates, symbol algorithms and certified searches.

**Witness:** line 1882 requires a checker to exhaust integer residual boxes and certify its output. These are executable-procedure/certificate deliverables, which the roadmap contract excludes.

**Repair:** retain the mathematical rootlessness statement and its explicit lattice, and formulate any useful general mass-exhaustion theorem directly for finite sets of isometry classes. Remove the implementation, stored-record and exhaustive-search programme, including its acceptance-only record structures. The computed corrected Lorentz vector has norm `21024−145²=−1`; this establishes the orthogonal-splitting premise, not rootlessness. For the mass theorem, the discriminant −23 test has total `1/4+1/2=3/4`, while either omitted class leaves a strict deficit. These mathematical obligations survive without a checker specification.

## R09 (P3) — Replace broad source labels with verifiable locators

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:1130,1197–1250,1306–1332,2640–2710`.

**Claim:** B2 cites Cox Theorem 7.7 “and its narrow analogue”; B4/B5 and several construction supplements lack exact theorem/page locators for all branches. No `sources.toml` records the cited works.

**Witness:** Cox (1989), Theorem 7.7, printed p.137, is explicitly about imaginary quadratic orders and primitive positive-definite forms. It does not locate the real narrow-class branch. Cox Theorems 2.8/2.13 are at pp.27/29.

**Repair:** attach exact version, theorem/section and printed-page locators to each retained claim and record each work once in `sources.toml`. Keep unread legal sources explicitly uncertified rather than claiming their text was checked. Give the oriented real dictionary and split branch their own precise locators or owned proofs. Correct the bibliography: the mass paper ends at p.286, not 285 (`conway-sloane-mass1988 line 6`); Kirschmer's first name is Markus, not “T.” (`kirschmer2016 line 11`). For B8, the cited mass-paper §2 is history, not a locator for the binary proper-class formula; cite equation (1) plus the orbit/stabilizer argument and its binary inputs. Recheck B2 on discriminants −3 and 12: the former fits Cox 7.7, while the latter needs the separate narrow-class argument.

## R10 (P3) — Restore the required roadmap and Lean form

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:1–3,50,230,510,2314`; `ArchimedeanVolume.lean:5–14,36–53,59–70`.

**Claim:** the document uses milestone catalogues and prerequisite tables, while definitions do not consistently carry three discriminating Checks or the required per-layer Examples/Dependencies sections. The auxiliary Lean file lacks the prescribed headline module docstring and several declaration docstrings.

**Witness:** the lattice-form API at README 2314 and mass API at 2448 use Examples/Edge cases fields rather than three discriminating computed Check bullets each. Archimedean `sphereArea_pos`, `orthogonalSkewBasisVolume_pos`, `O` and coordinate definitions have no declaration docstring.

**Repair:** apply the normative shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layer subsections, per-target Needs, Examples and Dependencies. Give each retained definition at least three discriminating computed Checks; do not merely count several facts in an API paragraph. For mass, use rank 0 (`m=m⁺=1`), rank 1 (`m=1/2,m⁺=1`) and the nonambiguous discriminant −23 class (`O=SO=2`) to distinguish all conventions. Bring both Lean files into the required docstring/section form after removing R07/R08 padding.

## R11 (P3) — Drop the false minimality claim for the gluing check

**Location:** `TauCetiRoadmap/IntegralLattices/README.md:647–648`: “the smallest lattice where they differ is `A₁ ⊕ A₁`”.

**Claim:** the distinction between integral and even overlattices first occurs at that rank-two lattice.

**Witness:** for `L=⟨4⟩`, `A_L=ℤ/4` and `H=⟨2⟩`, one has `b(2,2)=0` but `q(2)=1/2`. The index-two overlattice `(1/2)ℤ` has Gram `[1]`: integral, not even.

**Repair:** remove “smallest” and keep `A₁²` as a useful two-generator example, or use this rank-one example. Recomputing gives `det M=4/2²=1`, `H=H⊥`, and nonzero quadratic restriction, so both the integral and even criteria distinguish it correctly.

## Verified sound

This section records successful instance checks and resolved declarations, not a proof of every general theorem. All three target files were read. The original head was confirmed; the diff outside `TauCetiRoadmap/IntegralLattices` is empty. No `set_option`, sorry-bodied data, admitted examples, extra roadmap imports or copied source passages were found in the target files. The supplied scanner reports zero for those checks. The roadmap retains dyadic primes, rank-zero guards and the general Nikulin boundary conditions; no good-primes shortcut was found.

The gate's only failure is the module-system warning in R03. Its counters are `depcheck=0`, `outside-folder=0`, `stray-files=0`, all text/form scanner counters zero, and `build=1 FAIL`. Direct `lake env lean` on the original Suggested module succeeds with its 18 admitted-theorem warnings plus that warning. The scratch module-system copy has no such extra warning. A separate scratch Archimedean copy elaborates too.

The requested dependency command produced:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

There was no `UPWARD`, `CYCLE` or `moved:` line. IntegralLattices' absence from the order is not treated as a defect. Every prerequisite table, supplier table and the N0–N4 prose route was read; R01 is the explicit cycle those prose routes expose, and R02 is a coefficient-generality gap the checker does not detect. No declared supplier gaps were supplied for this package.

**Elaborated signatures and padding.** I re-elaborated `#check @...` for all 39 actual declarations of Suggested, comparing the results with the README: the worker's count of 41 includes two prose matches rather than declarations. No required section binder was lost. In particular nondegeneracy/evenness, positive definiteness, rank, dyadic exception, and the actual congruence/finite-sum conditions remain in the relevant types. All 19 Archimedean declaration signatures were also re-elaborated. Its measure signatures retain finite dimension, chart/manifold, Borel, Lindelöf, differentiability and injective-differential arguments. No mathematical conclusion was inferred from a binder that disappears. Each of the 18 Suggested sorries was tried with `rfl`, `simp` and `infer_instance` on a copy; none closed that way. The small rejection declarations are nevertheless padding by their mathematical content. The Archimedean rank-two value closed by the one `simp` invocation stated in R07. No pin lemma was found that immediately supplies the remaining headline statements.

**Headline inventory.** The README's principal programme and deep endpoints are: local/Jordan and symbol classification; class/genus/spinor dictionaries and class-number finiteness; finite quadratic-module generator classification; Milgram and van der Blij; Nikulin existence, genus uniqueness, splitting, discriminant-automorphism surjectivity, primitive embeddings and 2-elementary classification; indefinite unimodular classification and definite low-rank classification; rank-16 distinction, rank-24 constructions and the E₈ order; local-density stabilization/evaluations; and Euclidean orthogonal-group volume. Mass assembly and Eichler are explicitly assigned elsewhere, subject to R01. Suggested includes generator classification, Milgram, van der Blij, positive/binary class finiteness, Nikulin existence/strict existence/2-elementary existence, even indefinite uniqueness, and stored-list exhaustion. The auxiliary file includes metric/measure volume headlines. The docstring names symbols, adelic/spinor data, Hilbert symbols and quadratic-order Picard/ring-class fields as unavailable. It does not account for the other absent headlines, and rank-eight uniqueness was positively tested as statable (R06).

**Pinned library audit.** File prefixes below are library-relative at Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, the manifest pins. Opened declaration bodies/types include:

| Object and exact declarations | Pinned file and line | What the native object does and does not include |
| --- | --- | --- |
| `Submodule.IsLattice` | `Mathlib/Algebra/Module/Lattice.lean:67` | Finite generation and full scalar span; no positive-definiteness or nondegeneracy field. |
| `LinearMap.BilinForm.dualSubmodule`, `dualSubmoduleToDual` | `Mathlib/LinearAlgebra/BilinearForm/DualLattice.lean:37,74` | Integer-valued pairings; the latter is a linear map, not automatically a perfect-pairing equivalence. |
| `QuadraticMap.associatedHom`; quadratic `baseChange` | `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean:853`; `TensorProduct.lean:40,127` | Invertible-two hypotheses really apply; bilinear base change is the correct integral input. |
| `IntegralLattice` | `TauCeti/LinearAlgebra/IntegralLattice/Basic.lean:63` | Full rational embedded lattice, symmetric form, `le_dual`; accepts degenerate and indefinite forms. README's displayed fields are a presentation, not a verbatim native declaration. |
| `radical`, `isPosDef_iff`, `isPosDef_iff_isPosSemidef_and_nondegenerate` | `TauCeti/LinearAlgebra/IntegralLattice/Signature.lean:58,120,175` | Native signature/radical and elementwise positivity comparisons already exist. |
| `scale`, `restrict`, `restrictFull`, `restrictFullIsometry` | `TauCeti/LinearAlgebra/IntegralLattice/Scaling.lean:74`; `Restriction.lean:65,173,199` | Form twist and restriction in the correct ambient space; arbitrary submodules need rationalization. |
| `minimum`, `IsPosDef.minimum_pos` | `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Minimum.lean:81,152` | Native minimum is total; zero-rank value is 0. Prose's positive-rank convention needs an explicit comparison, not a duplicate definition. |
| bounded sets, shells, isometry finiteness | `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Finite.lean:85,93,140` | Native positive-definite statements; negative-definite versions follow there too. |
| `successiveMinimum`, `monotone_successiveMinimum`, exact simultaneous attainment | `TauCeti/LinearAlgebra/IntegralLattice/PosDef/SuccessiveMinima.lean:45,94,143` | Squared norms, indexed by `Fin rank`, not lengths or an assertion of a basis. |
| `IsPosDef.three_pow_mul_minimum_pow_le`, `minimum_le_rpow_mul_determinant_rpow` | `TauCeti/LinearAlgebra/IntegralLattice/PosDef/Hermite.lean:60,81` | The very Hermite bound planned in §2E. |
| `oddCyclic`, `dyadicCyclic`, `dyadicU`, `dyadicV` | `TauCeti/LinearAlgebra/FiniteBilinearModule/OddCyclic/Basic.lean:62`; `Dyadic/Cyclic.lean:56`; `Dyadic/RankTwo/Basic.lean:67,140` | Actual finite modules and half-norm quadratic maps; coprimality/positive-exponent conditions matter. |
| `typeE₈RootLattice`, its positive-definiteness | `TauCeti/LinearAlgebra/IntegralLattice/RootLattice/TypeE.lean:682,734` | Native reference object exists; importing it does not require inventing a carrier. |
| `inducedRiemannianMetric`, `riemannianVolume` | `TauCeti/Geometry/Manifold/Riemannian/Induced.lean:92`; `VolumeDensity/Volume.lean:76` | The measure really comes from the differential pullback metric and chart density; its total volume is not a field of the definition. |

The native restriction, characteristic, metabolic/Gauss-sign and localization `#check`s in the acceptance file also resolve at the pins. Object searches included duals/discriminant gluing, squared minima, finite orthogonal groups, primitive embeddings and rank-24 references, not just proposed declaration names. The main, package and provided open-head searches yielded R04/R05; the fresh finite-quadratic classification/Nikulin targets were not found already proved at these pins. Main `SuccessiveMinima` distinguishes real lengths from this squared-norm convention; that distinction is legitimate, but the squared-norm API now exists in Tau Ceti.

**Resolved cross-roadmap contracts.** These are source inspections, not Lean imports from other roadmaps.

| Supplier/consumer | Resolved location | Check |
| --- | --- | --- |
| Completed IntegralLattices | `Completed/IntegralLattices/README.md:162–396` | Lattice, dual/discriminant, finite modules, gluing and ADE foundation; duplicated targets identified in R04. |
| QuadraticFormInvariants | `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:601,1319,2552,2578` | Hasse invariant, local realization with low-rank restrictions, comparison to cohomological Hilbert symbols and product formula. |
| GlobalQuadraticForms | `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean:104,111,439,544` | Actual finite/real scalar extensions and Hasse–Minkowski equivalence for nondegenerate finite-dimensional forms. |
| GlobalNumberFields | `Completed/GlobalNumberFields/Suggested.lean:777,824,989,991` | Quadratic proper/invertible equivalence, narrow-to-wide surjection and finite Picard groups. The worker's missing-name lead at 777 is a false positive. |
| ClassFieldTheory | `TauCetiRoadmap/ClassFieldTheory/Suggested.lean:4318,4327,4350,4396` | Field-order ring-class data with rank-two hypothesis, and cohomological product formula; no split algebra is admitted as a number field. |
| RestrictedProducts | `Completed/RestrictedProducts/Suggested.lean:85–88,135,492` | Actual restricted-product carriers, integral subgroup and compactness. No Tamagawa measure is inferred. |
| OrthogonalSpinGroups | `Completed/OrthogonalSpinGroups/Suggested.lean:418,901,1022,1248` | Reflection norm, transvection quotient, real base change and finite-adelic group. No strong approximation is inferred from their existence. |
| OrthogonalTamagawaAndLatticeMass, supplied head | `TauCetiRoadmap/OrthogonalTamagawaAndLatticeMass/README.md:147–159,525–549` | Eichler route consumes lattice input; rank-16/rank-24 mass completeness is separately owned. This creates R01, not permission for a phase cycle. |
| RootSystems | `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md:293–294` | Generic ADE/Weyl theory; no pinned numerical E₈ order was found in the audited root-system output. |
| LieGroups and DifferentialGeometry | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:291–297`; `TauCetiRoadmap/DifferentialGeometry/README.md:910–935` | Embedded matrix Lie groups, metrics and volume densities; suitable for the retained real-volume route. |
| ThetaSeries | `TauCetiRoadmap/ThetaSeries/README.md:18–21,210–220`; `Suggested.lean:1–12,25–39` | Half-norm/exponential/real bridge agree. The alleged import from this Suggested file is absent (R04). |
| Rank24LatticeConstructions | `TauCetiRoadmap/Rank24LatticeConstructions/README.md:223–249,312–374` | Existing owners of rootful rows and Construction-B Leech; R05. |
| GeometryOfNumbersAndQuadraticArithmeticPartII | `packages/GeometryOfNumbersAndQuadraticArithmeticPartII/README.md:16,83,492` | Package already consumes completed lattice/E₈ data and this extension's signature theorem; it does not make this folder owner of the foundation again. |

The two finite-quadratic names flagged by the citation scan are declared at Suggested 229 and 285. `TauCetiRoadmap.IntegralLattices.Suggested` is a module path, not a missing declaration. Ownership searches included the supplied sibling heads and board packages. No unprovided open head is used as a finding witness. The generic AdelicAlgebraicGroups AA.4.2 name was located by the roadmap resolver; its separate open-head ownership audit was not part of the supplied sibling-file set. The independently witnessed OTM cycle does not depend on that limitation.

**Computed adversarial pass.** Here `⟨a⟩` has Gram `[a]`, `U=[[0,1],[1,0]]`, and discriminant quadratic values are half-norms modulo 1. “Pass” means the displayed instances agree, not that numerical tests prove the general assertion. Finite congruence and small binary automorphism/shell counts were independently recomputed with exact integer/rational arithmetic. Gaussian rows also admit the displayed exact cyclotomic simplifications. `Rxx` in the change column points to a required ownership, statement or presentation repair.

| Statement | Instances tried | Computed sides / discriminating values | Result | Change |
| --- | --- | --- | --- | --- |
| Single carrier / 0A | rank 0; `⟨0⟩`; proper rank-one submodule of `ℚ²` | Full spans: `0=0`, `ℚ=ℚ`, but `ℚe₁≠ℚ²`; zero form is admitted, last submodule not full | Pass | R04 |
| Isometry includes the carrier | `⟨1⟩`, `⟨4⟩` | Rational scaling gives form equivalence; integral determinants `1≠4` prohibit lattice isometry | Pass with 0A's carrier-preserving definition | R04 |
| Determinant convention / 0C | empty Gram; `U`; basis swap in `A₂` | `det∅=1`; `det U=−1`; swapped determinant `3=(−1)²·3` | Pass | R04 |
| Finite-index determinant | `diag(1,1)`, sublattice `diag(2,1)` | index `2`; new determinant `4=2²·1`; content remains `1` | Pass | — |
| Signed rational determinant | `U`, rank 2 | plain determinant `−1`; signed determinant `−(−1)=1` | Pass | — |
| Definiteness/signature / 0E | `⟨2⟩`, `⟨−2⟩`, `diag(2,−2,0)` | triples `(1,0,0)`, `(0,0,1)`, `(1,1,1)`; last has both signs and a 1-dimensional radical | Pass | R04 |
| Positive-definite sublevels | `⟨1⟩`, `⟨−1⟩`, bound 1 | first set `{−1,0,1}` has 3 points; second is all `ℤ` | Pass | R04 |
| Fixed shells versus sublevels | `⟨−1⟩`, `U`, rank 0 | norm −1 shell has 2 points; `U` norm 0 contains all `(a,0)`; rank-0 shell counts `r(0)=1,r(1)=0` | Pass | — |
| Form twist versus carrier dilation | `⟨2⟩`, scalar 3 | twist Gram `[6]`, determinant 6; dilation `3ℤ` Gram `[18]`, determinant 18 | Pass | — |
| Zero/negative twist | `⟨2⟩`, scalars 0 and −1 | new determinants `0,−2`; signatures `(0,1,0),(0,0,1)` | Pass | — |
| Direct sum | `⟨2⟩⊕⟨−2⟩` | rank `1+1=2`; determinant `2·(−2)=−4`; norm at `(1,1)` is `0` | Pass | R04 |
| Rationalization / 1A | `ℤ` with pairing `2xy`; zero module | `ℚ⊗ℤ≅ℚ`, form `2xy` restricts back; zero gives rank `0=0` | Pass | R04 |
| Even/quadratic dictionary / 0B | pairing `2xy`; pairing `xy` | first polar of `x²` is `2xy`; second would require integer `Q(1)=1/2`, impossible | Pass | R04 |
| Dual / 1B | `⟨2⟩`, `⟨0⟩` | duals `(1/2)ℤ`, `ℚ`; bidual in first case is `ℤ`; second dual is not finitely generated over `ℤ` | Pass | R04 |
| Twisted dual | `⟨2⟩`, twist 3 | dual `(1/6)ℤ=(1/3)((1/2)ℤ)`; dual-basis Gram `1/6` | Pass | — |
| Discriminant quotient / 1C | `⟨2⟩`, `U`, `⟨0⟩` | group orders `2,1,∞`, matching `abs det=2,1` only in nondegenerate cases | Pass | R04 |
| Discriminant polar / 1D | `A₁`, `A₂` | generator values `q=1/4,1/3`; self-pairings `1/2,2/3`; `q(2x)−2q(x)=b(x,x)` in both | Pass | — |
| Sign reversal of discriminant form | `⟨2⟩`, `⟨−2⟩` | order 2 on both; generator q-values `1/4,−1/4` | Pass | — |
| Scale/norm ideals / 0D | `U`, `⟨1⟩`, `⟨2⟩` | `(s,n)=(ℤ,2ℤ),(ℤ,ℤ),(2ℤ,2ℤ)`; each has `2s⊆n⊆s` | Pass | — |
| Level / 1J | `U`, `⟨1⟩`, `⟨2⟩`, `A₂`, rank 0 | least N `1,2,4,3,1`; for even cases these annihilate q and no smaller positive N does | Pass | — |
| Unimodular splitting / 0F | `M=2ℤ⊂⟨1⟩`; coordinate line in `I₂` | first restriction det4, complement0, index2 so no splitting; second det1, direct sum index1 | Pass | — |
| Cancellation warning | `E₈²`, `D₁₆⁺`, add U | root-span indices `1≠2`; stabilized signatures both `(17,1)` and unimodular/even invariants agree | Pass of the discriminator | — |
| Radical quotient / 0G | affine `Ã₁=[[2,−2],[−2,2]]` | norm `2(x−y)²`; radical `ℤ(1,1)`; quotient Gram `[2]`, signature `(1,0,0)` | Pass | R04 |
| Integral overlattice containment / 1E | `L=⟨2⟩`, `M=(1/3)ℤ` | `B(1/3,1)=2/3∉ℤ`; M is not inside `(1/2)ℤ` and has norm `2/9` | Pass | — |
| Integral gluing / 1E | `A₁²`, diagonal subgroup H | `#A=4,#H=2`; `b(h,h)=1=0 mod1`; new determinant `4/4=1` | Pass | — |
| Even gluing / 1F | same H | `q(h)=1/2≠0`; resulting unimodular lattice is odd | Pass | — |
| Claimed smallest gluing example | `⟨4⟩`, H generated by 2 | `b(2,2)=1=0`; `q(2)=1/2`; rank `1<2` | Fail | R11 |
| Finite module nondegeneracy | `ℤ/2`, q-values `1/4` versus `0` | adjoint kernels `{0}` versus all 2 elements | Pass | — |
| Quadratic Lagrangian/metabolic | q of `A₁²`; hyperbolic `u(2)` | diagonal H in first has `H=H⊥` but q-value1/2; coordinate H in second has q0 and `H=H⊥` | Pass | R07 keeps these as Checks |
| `minGenerators` | 0, `ℤ/6`, `(ℤ/2)²` | lengths `0,1,2`; primary maxima `0,1,2` | Pass | R07 |
| Primary component at a nonprime | `A=ℤ/6`, p=0,1,6 | p=0 component A; p=1 component0; p=6 component A; lengths `1,0,1≤1` | Pass of total-function cases | — |
| Generator admissibility | odd `(p,k,θ)=(3,1,1),(3,0,1),(3,1,3)` | admissible `true,false,false`; group sizes `3,1,3`, last pairing degenerate | Pass | — |
| Generator prime/to-module | cyclic3; cyclic2; U(2); V(2) | primes `3,2,2,2`; orders `3,2,4,4` | Pass | — |
| Realization determinants | cyclic3θ2; cyclic2θ5; U(2); V(2) | determinants `6,10,−4,12`; valuations `1,1,2,2` | Pass | — |
| Empty sum and decomposition | empty list; two cyclic2 blocks | orders `1,4`; lengths `0,2`; actual sum/isometry data exclude arbitrary unrelated modules | Pass | — |
| Generator classification / 1G | trivial module; q of `A₁²` | admissible list lengths `0,2`; resulting groups orders `1,4` and q generators `1/4,1/4` | Pass | — |
| Gauss character normalization | x=0,1/2,1/4 | `expCircle(x)=1,−1,i`; using πi instead gives wrong `i` at x=1/2 | Pass | — |
| Odd Gaussian blocks / 1H | cyclic3 θ1,θ2; cyclic5 θ2 | sums `−i√3,i√3,√5`; signs `6,2,0`; order5 is not a square, so last not metabolic | Pass | — |
| Dyadic Gaussian blocks / 1H | cyclic2θ1,θ5; cyclic4θ3 | sums `1+i,1+i,√2(−1+i)`; signs `1,1,3` | Pass | — |
| Rank-two Gaussian blocks / 1H | U(2), V(2), V(4) | sums `2,−2,4`; signs `0,4,0`, magnitudes `√4,√4,√16` | Pass | — |
| Gauss sum under sum/metabolic | `A₁²`; U(2) | `(1+i)²=2i` sign2; hyperbolic sum2 sign0 | Pass | R07 |
| Milgram / 1I | `⟨2⟩`, `⟨−2⟩`, U, E₈ | signatures modulo8 `1,7,0,0`, equal Gauss signs | Pass | — |
| Odd-lattice negative control | `⟨1⟩` | trivial discriminant sign0 but signature1; evenness fails | Pass | — |
| Rank-one/ADE / 1K | A₁,A₂,D₄,D₅,E₆,E₇ | determinant/order `2,3,4,4,3,2`; representative q `1/4,1/3,1/2,5/8,2/3,3/4` | Pass | — |
| D₈ glue / 1K | spinor h=(1/2,…,1/2) | norm2, q1=0; `#H=2`, determinant `4/4=1` | Pass | R04 |
| Characteristic vectors / 1L | `⟨1⟩`, w=1,3; `⟨2⟩`, w=0,1 | first norms1,9≡signature1; second norms0,2≠signature1 modulo8 | Pass | R07 |
| Minimum/shells/kissing / 2B | I₂; A₂ | minima1,2; minimal shell sizes4,6; r(0)=1 in both | Pass | R04 |
| Automorphism finiteness / 2C | I₂,A₂,U,`⟨1,−2⟩` | `(O,SO)` sizes `(8,4),(12,6),(4,2),(∞,∞)` | Pass | R04 |
| Direct-sum automorphism subgroup | `⟨1⟩⊕⟨1⟩` | product order `2·2=4`; full order8 includes coordinate swap | Pass | — |
| Covolume / 2D | A₂; `diag(1,4)` | covolumes `√3,2`; squares `3,4=det` | Pass | — |
| Hermite / 2E | A₂; rank-one `[4]` | `2=(4/3)^(1/2)√3`; `4=1·4` | Pass | R04 |
| Successive minima / 2F | `diag(1,4)`, A₂ | squared minima `(1,4),(2,2)`; products4,4 versus determinant4,3 | Pass of definitions; second-theorem constant must be explicit | R04/R10 |
| Positive class finiteness / 2G | rank0 d1,d0; rank1 d2,d−2 | class counts `1,0,1,0` | Pass | — |
| Local bridge / 3A | `⟨2⟩`, p2,p3 | local Gram2 in each; duals `(1/2)ℤ₂` and `ℤ₃`; rational completions rank1 | Pass | — |
| Jordan splitting / 3B | A₂ at3; U at2 | A₂ equivalent to `[2]⊕[3/2]`, scales0,1; U is a single rank-two scale0 block | Pass | — |
| Odd-prime classification / 3C | p3, rank0/1 | one empty class; rank-one unit classes represented1,2; residues squares `{1}` | Pass | — |
| Dyadic diagonalization / 3D | U; `diag(1,−1)` | both det−1, but norm ideals `2ℤ₂` and `ℤ₂`; U cannot be diagonalized into unit lines | Pass | — |
| Dyadic symbol equivalences / 3E | `[1]` and `[9]`; `[1]` and `[3]` | oddities1=9 mod8 but `1≠3 mod8`; first isometry x↦3x, second unit nonsquare | Pass on rank-one symbols | — |
| Genus and actual integral data / 3F | `[1]`, `[17]` | same at2 since17≡1 mod8; determinants1≠17 and valuations at17 are0,1 | Pass | — |
| Real-place condition / 3F | `[1]`, `[−1]` | positive/negative indices `(1,0)` versus `(0,1)`; real congruence impossible | Pass | — |
| Hilbert/oddity constraints / 3G | rational form `diag(−1,−1)` | Hilbert signs at∞ and2 are−1 each, all odd places+1; product1 | Pass | — |
| Rational genus comparison / 3H | I₂ and basis shear P=[[1,1],[0,1]] | new Gram `[[1,1],[1,2]]`, det1; integral and rational congruence both hold | Pass | — |
| General R input / 3I | unramified quadratic R, Gram[2] | R-rank1, residue cardinal4, scale=norm2R; available bridge is ℤ₂-rank data | Missing owned input | R02 |
| Type and empty constituents / 3I | 0; `[1]`; `[2]`; U | types II,I,I,II; empty rank0 contributes0; `[2]` has norm2R not R | Pass | — |
| Bound/free and exponent identity / 3I | `[1]⊕[2]` | t2,b1,c0; `N_M=5,N_Q=7`, difference2=`2+1−1` | Pass | — |
| Cho exponent low ranks / 3I | 0,`[1]`,`[2]`,U,E₈ at2 | N `0,1,2,2,8`; for U `(N_M,N_Q)=(0,2)` | Pass | — |
| Exponent under scaling | U→U(2) | N `2→5`, change3=`n(n+1)/2` at n2 | Pass | — |
| Binary content/discriminant / B1 | A₂,I₂,U | contents `2,1,2`; primitive Δ `−3,−4,1`; field,field,split respectively | Pass | — |
| Negative-definite binary transfer / B2 | A₂→−A₂ | determinants3=3, Δ−3=−3, automorphism orders12=12; norm signs reversed | Pass | — |
| Imaginary forms→ideals / B2 | f=(1,1,1), Δ−3 | ideal `(1,(−1+√−3)/2)=O`, norm1=a; one ideal/form class | Pass | R09 locator |
| Oriented real forms→ideals / B2 | f=(1,0,−3),−f, Δ12 | unoriented ideals both O; corrected classes O and √3O have signs of norm +/−; mod3 squares never−1 | Pass of counterexample and correction | R09 locator |
| Split composition / B2–B3 | m1,5,8 | unit groups orders1,4,4; modulo±1 class orders1,2,2; square subgroups of units have sizes1,2,1 | Pass | — |
| Ring-class-field boundary / B3 | Δ−3; split Δ1 | imaginary Pic size1 predicts trivial ring extension; `ℚ×ℚ` has zero divisors `(1,0)(0,1)=0` and cannot supply Field | Pass | — |
| Improper automorphism criterion / B4 | Δ−23 principal/nonprincipal | proper classes C3; inversion fixed count1; `O/SO` indices2/1 respectively | Pass | — |
| Binary automorphism orders / B4 | `[[2,1],[1,12]]`, `[[4,1],[1,6]]` | full/proper sizes `(4,2)`, `(2,2)` | Pass | — |
| Pell criterion / B4 | U; `x²−2y²` | split O size4; `(3,2)` solves `3²−2·2²=1`, its powers give infinitely many isometries | Pass | — |
| Reduced forms / B5 | Δ−23 | reduced `(1,1,6),(2,1,3),(2,−1,3)`; 3 proper classes, 2 inverse orbits | Pass | R09 locator |
| Torus points / B6 | Δ−4; Δ1 | norm-one complex numbers circle; split pairs `(t,t⁻¹)` give `G_m` | Pass | — |
| Binary volume / B7 | Δ12; Δ1 | norm-one unit generator `2+√3` gives log-period `log(2+√3)>0`; split modulus integral `∫dt/t=∞` | Pass of required distinction | — |
| Binary genus mass / B8 | Δ−3,Δ−23 | `1/(2·6)=1/12`; `3/(2·2)=3/4=1/4+1/2`; wrong full-count formula gives1/2 | Pass | — |
| Class/proper class / 4A | Δ−23 | inverse-orbit count2 versus proper count3; orientations cannot be forgotten | Pass | — |
| Stabilizer and quadratic convention / 4B | `[2]` at3 | q=2x², polar4xy, associated2xy; full stabilizer±1 size2, proper stabilizer1 | Pass | — |
| Spinor genus low ranks / 4C | `[1]`; I₂ | proper-spinor counts1,1; naive idele quotients∞,2, so general high-rank formula is excluded | Pass of guards | — |
| Eichler / N2,N3,4D | split rank3; definite rank3 | Spin real factor `SL₂(ℝ)` noncompact versus compact; hypothesis true/false | Mathematics guard passes; graph fails | R01 |
| Indefinite binary class finiteness / 4E | Δ1,12 | proper class counts1,2, both finite; rank≥3 branch not silently used | Pass | — |
| Integral transvection / 4F | U⊕[2], u=e,w=g | `E(f)=f+g−e`, `E(g)=g−2e`; norms0,2 and pairing0 unchanged | Pass | — |
| Transvection parameter quotient / 4F | w and w+au | same images of e,f,g for every a; parameter along u maps to identity | Pass | — |
| Anisotropic indefinite branch / 4F | `x²+y²−3z²` | modulo3 isotropy forces x=y=0, then descent forces z=0; real signs `(2,1)` | Pass; transvection-only proof would fail | — |
| p-neighbor relation / 4G | L=M; p2 | both indices1≠2, so identity is not a 2-neighbor; reverse pair has the same two indices | Pass | — |
| Genus from signature/q / 5A | E₈²,D₁₆⁺; E₈,−E₈ | first pair same signature(16,0),q0; second pair q0 but signatures(8,0)/(0,8) differ | Pass | — |
| Minimal local determinant / 5B | q of `[2]` and `[10]` | same order2 q-generator1/4; determinant ratio5 nonsquare in ℚ₂ | Pass of exception | R07 |
| Nonexceptional minimal determinant | q of A₂ at3 | Jordan minimal block [3/2] and generator realization [6] have determinant ratio4, a square; both have q-generator1/3 after the unit change | Pass; full rank-two determinant is not the minimal-block determinant | — |
| Nikulin existence / 5B | zero form; q0 rank8; q0 rank1 | empty product determinant1 and signature0 pass; rank8 signature8≡0 passes; rank1 signature1≠0 fails | Pass | — |
| Strict Nikulin corollary | U⊕A₁ | rank3>length1; signature1=Gauss sign1; local boundary equalities not invoked | Pass | — |
| Genus uniqueness / 5C | U⊕A₁; E₈² versus D₁₆⁺ | first rank3=length1+2 and indefinite; second pair equal invariants but t−0 excludes uniqueness hypothesis | Pass | R01/R06 |
| Stabilization / 5D | A₁→U⊕A₁ | invariants `(1,0,q)`→`(2,1,q)`; rank3, length1 | Pass | R06 |
| U/E₈ splitting bounds / 5D | U²; U⊕E₈(−1) | ranks4≥0+3 and10≥0+9; signatures(2,2),(1,9); displayed summands exist | Pass | R06 |
| Discriminant automorphism surjectivity / 5E | U; U(2) | target groups size1 and2; identity/coordinate swap lift both in second case | Pass | R06 |
| Primitive injection / 5F | ℤ→ℤ by1 and2 | cokernels0 andℤ/2; first image direct summand, second not | Pass | R06 |
| Primitive unimodular embedding / 5G | `[2d]` in U, d>0 | e+df norm2d primitive; e−df norm−2d; complementary q is negative and orders both2d | Pass | R06 |
| Universal signature criterion / 5G | signature(1,0) into(1,1); into(0,0) | first `2≤2` and coordinate embedding exists; second `1≤0` fails | Pass | R06 |
| Embedding uniqueness / 5H | A₁ in U² | complement signature(1,2), rank3≥length1+2; both complement signs positive | Pass of criterion | R06 |
| General embedding graph / 5I | identity S=T; zero S | first H=A, graph order#A, quotientδ0, complement0; second H0 and complementT | Pass of signs/domains | R06 |
| Two-elementary admissibility / 5J | zero,A₁,U,U(2),D₄ | `(δ,t+,t−,a)=(0,0,0,0),(1,1,0,1),(0,1,1,0),(0,1,1,2),(0,4,0,2)` satisfy seven clauses | Pass | — |
| Two-elementary forbidden tuple | `(δ,t+,t−,a)=(0,4,0,0)` | prior parity/rank clauses pass; clause4 requires4≡0 mod8, false | Pass of exclusion | R07 |
| Odd indefinite model / 6A | I₁,₁; I₂,₁ | signatures(1,1),(2,1), determinant−1; odd norm1 vector persists | Pass | R06 |
| Parity kernel / 6A supplement | I₂; I₁,₁ | kernel index2, det4; same-parity basis gives diag(2,2) versus U(2) | Pass | — |
| Characteristic neighbors | I₂,I₄,I₈ | w²2,4,8; nonoriginal preimages nonintegral, integral odd, even respectively | Pass | — |
| Explicit W neighbors | W=diag(1,−1) | a=(1/2,1/2),b=(1,−1): a²=b²0, B(a,b)=1; second displayed basis also GramU | Pass | — |
| Odd unit-splitting construction | isotropic v, B(v,w)=1,w²=a odd | u=w+((ε−a)/2)v has u²ε; y=v−εu has y²−ε and B(u,y)=0 | Pass algebraically | — |
| Characteristic signature construction | I₂,₁, characteristic(1,3,1) | norm1+9−1=9≡1=2−1 mod8 | Pass | — |
| Even indefinite classification / 6A | U; U⊕E₈ | rank2/10, signatures(1,1)/(9,1), determinant−1; normal forms coincide with inputs | Pass | — |
| Definite even-unimodular existence / 6B | ranks0,1,8 | empty lattice yes; signature obstruction1≠0 mod8; E₈ yes | Pass | R06 |
| Rank≤9 classification / 6C | ranks1,8,9 | I₁; I₈/E₈ distinguished odd/even; I₉ and E₈⊕I₁ have norm1 shell sizes18 versus2 | Pass of discriminators | R06 |
| Rank16 distinction / 6D | E₈²,D₁₆⁺ | both determinant1 and480 roots; root-span indices1 and2 | Pass | — |
| Correct Dₙ⁺ / 6A supplement | n4,8,16 | h²1,2,4; integral unimodular parity odd,even,even; Dₙ index2 | Pass | — |
| Rejected adjacent-sums span | n4 with half vector | alternating functional annihilates all generators; rank3<4 | Pass of correction | — |
| Rank24 rows / 6E | E₈³; conventional Leech | determinant1 each; roots720 versus0, minima2 versus4 | Instance invariants agree; ownership fails | R05 |
| Lorentz kernel premise / 6E supplement | spatial3,5,…,47,51; time145 | square sum21024; norm−1; printed3,…,49 sum20824 would require square20825, between144² and145² | Pass of corrected norm only | R08/R09 |
| Lorentz explicit basis | u=2e₁−e₂,b=5e₁−3e₂ | ℓ(u)=1,ℓ(b)=0; det of first2×2 columns−1; b²34, B(b,u)=13, hence B(b,k_j)=−13c_j | Pass of basis/Gram formula | — |
| E₈ coordinate model / 6F | h=(1/2)^8; e₁−e₂ | squared norms2,2; coordinate sums4,0 even; h·(e₁−e₂)=0 | Pass of membership/form normalization | R06 |
| E₈ automorphism order / 6G | stated orbit factors | `240·126·23040=696729600`; D₆ factor `2⁵·720=23040` | Pass of numerical assembly | R06 |
| Mass / 7A | rank0; `[1]`; A₂ | `(m,m+)=(1,1),(1/2,1),(1/12,1/6)`; factor2 starts at positive rank | Pass | — |
| Proper/full mass with no improper automorphism | Δ−23 nonprincipal orbit | full weight1/2; two proper weights1/2+1/2=1 | Pass | — |
| Local bilinear count / 7C | U modulo2,4,8 | counts6,16,32; normalized3,4,4 | Pass of stabilization, not at first level | — |
| Odd local count / 7C | U modulo3,9 | counts4,12; normalized4/3,4/3=`2(1−1/3)` | Pass | — |
| Odd split-type sign / 7C | U at3 | det−1 nonsquare, but `−det=1` square; ε+1 gives4/3 | Pass | — |
| Rank-one local density / 7C–7G | `[1]` modulo8,16; `[2]` modulo8,16 | root counts4,4 and4,8; stabilized densities4 and8 | Pass | — |
| Good-prime density limit / 7C | rank1; split rank2 | α_p2 in rank1; split rank2 `2(1−1/p)→2`; raw reciprocal product tends0 | Pass of normalization warning | — |
| Normalized rank2 product / 7C | I₂; U | I₂ inverse normalized product `L(1,χ−4)=π/4`; U gives zeta pole at1 | Pass | — |
| Dyadic model conversion / 7D | U overℤ₂ | n2,N2,#O₂⁺(𝔽₂)2: `α=2^(2−1)·2=4`; Cho β=2; quadratic-count density1 | Pass | — |
| Rank0 dyadic index | zero lattice | O=SO=1, index1, count1, N0; factor1/2 not applicable | Pass | — |
| Sphere area definition | j0,1,2,3 | Gamma-totalized j0 gives0; geometric cases `2,2π,4π` | Pass with j≥1 guard | R07 |
| SO empty products / 7E | n0,1 | both products1; actual groups singletons, volume1 | Pass | R07 |
| SO/O volumes / 7E | n2,3 | SO `2π,8π²`; O `4π,16π²`; O0 exception1 | Pass | — |
| Skew metric / Arch coordinates | A=B=[[0,1],[−1,0]] | coordinate squared norm `2/2=1`; `−trace(A²)/2=−(−2)/2=1` | Pass | — |
| Coordinate normalization negative control | same A without1/√2 | norm²2 versus desired1 | Pass of distinguishing law | — |
| Volume recurrence / 7E | n3 | `8π²=(4π)(2π)`; n1 would demand spurious sphere0 if guard dropped | Pass | R07 |
| Low-rank mass / 7G | rank0; positive `[a]` | one class each, O sizes1,2, reciprocal masses1,1/2 | Pass | — |
| Rank16 mass input / 7I | supplied automorphism orders | `1/970864271032320000+1/685597979049984000=691/277667181515243520000` | Pass of sum; completeness remains supplier's | — |
| Theta convention / 8S | A₁ norm2 root, discr generator norm1/2 | theta exponent `2πiτ` gives q¹; discriminant factor `exp(2πi·1/4)=i`; covolume√2 gives coefficient1/√2 | Pass | R04 consumer citation |
| Gram isometry/genus predicates | empty Gram; `[1]`,`[4]`; shear ofI₂ | empty congruence unique; determinant ratio4 forbids integral isometry; shear gives integral/local/real congruence simultaneously | Pass | — |
| Stored semantic record / 9A | A₂ | rank2,det3,level3,min2,kissing6,aut12, shell counts `(r0,r1,r2,r4)=(1,0,6,0)` | Values pass; programme is outside scope | R08 |
| Stored automorphisms require no extra unit field | positive G with `PᵀGP=G` | determinants yield `detP²=1`, hence detP=±1; for G0 this implication would fail, but positive definiteness excludes it | Pass | — |
| Mass exhaustion / 9B | Δ−23, reps principal only / both | partial1/4<3/4; complete1/4+1/2=3/4 | Pass; no completeness inferred from membership alone | R08 |
| Unique representative / 9B | full Δ−23 list | inverse orbit represented once; one matching literal matrix among2 pairwise nonisometric entries | Pass | R08 |

| Remaining two-elementary rejection tuples | `(1,3,0,1)`, `(1,4,0,2)`, `(0,4,0,4)` | failed clauses respectively `3∉{1,7} mod8`, `δ=1≠0`, and `4≠0 mod8`; earlier clauses true | Pass of exclusions | R07 |
| K3 model | U³⊕E₈(−1)² | rank22, signature(3,19), determinant(−1)³=−1, q0; signature difference−16 divisible8 | Pass | — |
| K3 rank-one embedding | e+df in a U summand, d>0 | norm2d; vector coordinates include1 so primitive; complement signature(2,19), rank21≥length1+2 | Pass of existence/uniqueness criterion | R06 |
| K3 signature range | signature(1,ρ−1), 1≤ρ≤10 | target signature(3,19), `2ρ≤20≤22`; complementary rank22−ρ≥ρ+2 atρ≤10 | Pass of stated range | — |

The table has 150 instance rows, including all 15 sampled targets, the declared mathematical headlines and each mathematical finding witness. Algebraic definition rows test an admitted example and an excluded/misnormalized example where applicable. Group tests include the nonabelian dihedral automorphism groups of I₂ and A₂ as well as cyclic discriminant groups; no argument infers nonabelian orbit behavior from an abelian-only calculation. Zero rings, inseparable coefficient extensions, characteristic-p base fields, nonreduced schemes and arbitrary topologies are outside these lattice signatures; the relevant finite residue fields and rank-zero total-function cases were tested instead. The general transvection and unit-splitting rows are symbolic substitutions, not numerical evidence for an anisotropic proof route.

**Seeded source verification.** Fifteen sampled targets were addressed. No additional locator is explicitly marked “unverified” in the README. All 20 cited works (18 references plus Cox and Cohen in the body) were attempted through the sources service. Nine full texts were obtained, one partial supplement, two service-classified uncertified/paywalled entries, and eight unavailable works. The unavailable text does not postpone this verdict. No source extraction or manifest was written into the PR.

| Sampled target | Text/locator actually inspected | Hypotheses, normalization and verdict |
| --- | --- | --- |
| The single lattice carrier | `nikulin1980 line 206`, §1.1, pp.107–108; native `IntegralLattice` and `IsLattice` declarations above | Nikulin assumes nondegeneracy; the native carrier deliberately does not. Finiteness/fullness/integrality are checked at the pin, not falsely attributed to a broader Nikulin definition. |
| Determinant | `nikulin1980 line 221`, p.108; `serre1973 line 2010`, V.1.3.3, p.49 | Basis change multiplies by the square of a unimodular determinant, hence by 1. Serre's chapter is unimodular; the change-of-basis argument itself gives the stated integral identity. |
| Definiteness | `serre1973 line 2002`, V.1.3.2, p.49; native `Signature.lean:120–175` | Real signature and its sign-index convention agree. Serre's nondegenerate setting does not supply the degenerate extension; that is native and was inspected separately. |
| Positive definite, not definite | native `PosDef/Finite.lean:85,93,140`; `serre1973 line 2217`, V.2.3, p.54 | Positive sublevels and definite fixed-shell/automorphism finiteness are different assertions. Explicit `⟨−1⟩` and U tests distinguish them. O'Meara's exact cited text remains unavailable. |
| Form twists, carrier dilations, and sums | `nikulin1980 line 212,219`, pp.107–108; `serre1973 line 1988`, V.1.2, p.48; native Scaling/Dual.Scaling | Nikulin scales the form, requiring the result integral; integer twists are covered. The submodule dilation distinction and dual identity were checked against the native definition. |
| Rational ambient space and abstract inputs | `serre1973 line 1962`, V.1.1, p.48; native Basic/Rationalization | Source uses an abstract free integral module; the rational embedded realization is the roadmap/native comparison, not an asserted source notation. Zero and rank-one round trips are in the table. |
| Dual lattice | `nikulin1980 line 277`, §1.3, p.109; `cho2015 line 118`, Definition 2.2, preprint p.3; native DualLattice | Hom/dual-lattice identification needs nondegeneracy. The zero form correctly has a non-finitely-generated rational dual. |
| Discriminant forms | `nikulin1980 line 278–287`, §1.3, p.109 | Bilinear values in ℚ/ℤ, quadratic full norms in ℚ/2ℤ for even lattices. Dividing by 2 gives exactly the pinned half-norm convention, with polar equal to b. |
| Scale, norm ideal, level | `cho2015 line 106–117`, §2.1/Definition 2.1, preprint p.3; native Gram/dual formulas | Scale/norm definitions and modular rescaling agree. The sampled levels 1,2,4,3 were computed directly. The precise O'Meara §82E level locator was not certified. |
| Theta series conventions are Theta Series' | `TauCetiRoadmap/ThetaSeries/README.md:18–21,210–220`; `Suggested.lean:34–39` | πi times full norm, q-exponent half norm, half-norm discriminant character and even-rank automorphy convention agree. This is a resolved consumer convention, not a supplier edge. |
| Mass | `conway-sloane-mass1988 line 24–34`, equation (1), p.259; lines147–160 §3 p.262 and318–328 §6 p.266 | Reciprocal full automorphism orders, rank≥2 guard, and distinct low-rank corrections match. Bibliographic last page needs correction (R09). |
| B2 Forms and ideal classes | `cox line 5186–5194`, Theorem7.7, p.137, original1989 edition; source page viewed | Primitive positive-definite imaginary case and ideal `(a,(−b+√Δ)/2)` confirmed. The theorem does not state the real narrow-class extension; that locator remains uncertified. Negative-definite sign reversal is an elementary additional argument. |
| B4 Automorphisms, ambiguous classes, Pell | `cox line 2004–2020`, Theorem3.9 p.50; lines2053–2063 p.51; lines2072–2080 Lemma3.10 p.52; all pages viewed | Opposite form gives inverse, and full classes are inverse orbits, for negative discriminants. The real Pell/unit theorem cited through Cassels was not text-certified; U and the nonsplit Pell witness were calculated independently. |
| B5 Reduction and class number | `cox line 1114–1119`, definition(2.7)/Theorem2.8 p.27; lines1199–1202 Theorem2.13 p.29; pages viewed | Primitive positive-definite forms have unique reduced proper representatives with the boundary sign convention, and finitely many. OCR lost a line/inequality, so the image governs. The real-cycle/split branches are not supplied by these two theorems. |
| B8 Binary mass | mass equation(1) above; Cox class inversion at pp.50–51 | The binary formula is a deduction: ambiguous orbits contribute1/(2w), two-element orbits1/w, hence h⁺/(2w). The cited mass-paper §2 is historical discussion, not that formula's exact locator. The −3 and −23 values were independently checked. |

Beyond the seed, the following difficult source statements were inspected directly:

- `nikulin1980 line 313–318`, Theorem1.3.3, p.110: signature modulo8 and discriminant form; the half-norm conversion yields the displayed Milgram identity.
- `nikulin1980 line 488–519`, Theorem1.9.1, p.114: minimal local realization, including the cyclic-order-two exception and determinant factor5.
- `nikulin1980 line 605–615`, Theorem1.10.1, p.117: all four existence conditions. The printed page was viewed to resolve OCR signs and inequalities; odd and dyadic determinant boundary clauses match the signatures.
- `nikulin1980 line 716–741`, Proposition1.11.2/Theorem1.11.3, p.120: generator Gauss signs; the exact sums in the table fix the half-norm/exponential conversion.
- `nikulin1980 line 795–875`, §§1.12–1.13, pp.122–124, and lines900–945, §1.14, pp.125–126: primitive embedding, uniqueness/splitting and discriminant-automorphism criteria. The indefinite and complementary-sign hypotheses are present in the README.
- `nikulin1980 line 1630–1662`, Theorems3.6.2/3.6.3, pp.144–145: seven 2-elementary existence clauses and indefinite uniqueness. The existence page was viewed; the small boundary witnesses above distinguish clauses4–7.
- `cho2015 line 90–119`, Definition2.1 and its ambient hypotheses, preprint p.3; lines1223–1252, Lemma5.1/Theorem5.2, preprint pp.24–25: general unramified coefficients, modular parity, `N_M`, `N_Q`, `N`, and the orthogonal/special-orthogonal index. These match the stated formulas; the dependency at that generality is R02. Publication pagination was not substituted for preprint pagination.
- `allcock-gal-mark line 886–924`, Corollary6.4 and discussion, preprint p.21: canonical forms use signways, with the stated correction to the older train formulation. This verifies the chosen corrected source; the unavailable SPLAG chapter itself was not certified.
- `serre1973 line 2022–2032`, V.1.3.5 p.49, and lines2170–2216, V.2 Theorems2–6 pp.53–54: characteristic class, signature congruence and indefinite classification. The source keeps the unimodular category throughout. The p.54 scan confirms the nonpositive-sign branch and the normal-form multiplicities.
- `vanderblij1959 line 54–57`, Theorem2's unimodular specialization, printed p.292: characteristic square equals signature modulo8. OCR of the surrounding Gaussian integral is poor; the source supports the cited specialization, not an independently audited analytic proof.

## Not verifiable

These limitations do not erase the findings or certify unread theorems. The source request file contains the eight unavailable works and the absent SPLAG chapters, with one lifetime key per work. Cohen and Wall remain settled uncertified entries and are not re-requested.

| Source/item | Where looked and result | Claims not certified from that text |
| --- | --- | --- |
| `omeara1963`, *Introduction to Quadratic Forms* | Sources-service bibliography lookup was rate-limited; institutional searches produced references but no readable copy | §§82E,91C,92,93,102–106, including the level, integral Jordan, class-number and low-rank proof locators. |
| `cassels1978`, *Rational Quadratic Forms* | Sources service; WorldCat/Open Library catalogues; no readable legal text | Chapters8–11 and13, especially real binary reduction/Pell and indefinite arithmetic proof routes. |
| `ganyu2000`, *Group schemes and local densities* | DOI landing page at Project Euclid; service found no readable PDF | Theorem7.3 and the exact odd-density normalization comparison. Direct counts above verify only their displayed examples. |
| `milnor-husemoller1973`, *Symmetric Bilinear Forms* | Springer paywall, sources-service lookup and institutional searches | ChapterII and Appendix4 proofs. Nikulin, Serre and van der Blij independently support the particular statements inspected above. |
| `splag1999`, full third edition | Author-hosted `splag3.pdf` is a 1998 third-edition supplement with Chapter17/corrections/bibliography, not the full book | Chapters4,15,16,18,26,27 and the alleged “printed” generator/Lorentz defects. The numerical bad-vector checks do not establish what an unread source printed. |
| `ebeling2013`, *Lattices and Codes* | Sources-service lookup and Springer paywall | Discriminant/glue and rank≤24 references, which lack precise locators here. |
| `kitaoka1993`, *Arithmetic of Quadratic Forms* | Sources-service lookup and Cambridge landing page; no open PDF | General Minkowski–Siegel apparatus cited for Layer7. |
| `kneser2002`, *Quadratische Formen* | Sources-service bibliography lookup was rate-limited | Neighbor/class-number source. Voight's survey was retrieved, but is not certification of this primary text. |
| `chenevier-lannes2019`, *Automorphic Forms and Even Unimodular Lattices* | Springer paywall; author-page attempt timed out | Rank24 background. |
| `cohen1993`, *A Course in Computational Algebraic Number Theory* | DOI publisher record; service classified uncertified/paywalled | §5.2 real/narrow counterpart cited in the hard-theorem table. |
| `wall1963`, *Quadratic forms on finite groups, and related topics* | ScienceDirect DOI record; service classified uncertified/paywalled | The metabolic Gauss-sum proof and surrounding Witt theory. Native metabolic/gauss-sign statements were inspected instead. |
| Real/narrow and split binary branches | Cox's readable theorem is the imaginary case; Cohen/Cassels as above | The corrected Δ12 example is sound, but no exact source theorem was certified for the entire B2/B4/B5 real/split programme. |
| Lorentz-kernel rootlessness and all24 rows | Corrected norm/basis computed; no exhaustive proof executed; conventional Leech owner read | Neither norm−1 nor determinant1 proves rootlessness or completeness. The roadmap must provide its mathematical proof after the ownership repair. |
| General volumes/classification and local stabilization | Lean statements elaborate with sorry; selected explicit instances checked | No claim that numerical checks or a sorry build prove these general theorems. |

Kirschmer and Voight were retrieved legally and identified; their whole tables/algorithms were not certified as substitutes for the roadmap's proofs. The auxiliary volume signatures were inspected against native metric/volume definitions; a full independent proof of the Riemannian fibration measure formula was not supplied by this review.

## Source issues

- none

No newly verified source misprint, false theorem or proof gap is asserted. OCR omissions are extraction defects. The known canonical-symbol correction is read in Allcock–Gal–Mark, but the corresponding full SPLAG pages were not available; the roadmap's alleged printed construction errors are therefore not entered as newly verified source errata.
