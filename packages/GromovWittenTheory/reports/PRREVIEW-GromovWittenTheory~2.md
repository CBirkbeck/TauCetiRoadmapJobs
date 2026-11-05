# Review of GromovWittenTheory (pull request #990 at c0b92ea)

**Verdict:** needs changes

:robot: Independent AI review. There are 12 findings: eight P1, one P2 and three P3. The gate and direct Lean elaboration pass. The blocking findings concern mathematical statements and computed Checks in the README, not elaboration. No pull-request file was changed.

## R01 (P1) — The splitting witness drops a zero inverse-pairing coefficient

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:504`, also lines 553 and 563: “`⟨pt, pt, H⟩_ℓ ⟨1, H, H⟩_0 = 1 · 1 = 1`”.

**Claim:** This is not the Casimir contraction in §6.2. With basis `(1,H,H²)`, the inverse pairing pairs `H` with `H`, not with `1`. Moreover, the left side is the restriction of a degree-two class to a point. The same error propagates to the capped-trace and node-matching Checks.

**Witness:** `g^(H,1)=0`; `⟨H,H,H⟩₀=∫H³=0`. The restriction `H²(M̄₀,₄)→H²(pt)` is zero. In §6.5 the integrand has degree `12+2=14`, but the virtual dimension is `12`.

**Repair:** Replace the claimed values in all three Checks by zero, retaining the inverse-pairing coefficient. Add a nonzero control with insertions `(pt,H,H,H)` and partition `{1,2}|{3,4}`: the term `(A₁,A₂)=(ℓ,0)`, `(Δ_a,Δ_b)=(pt,1)` has coefficient one and both factors equal one. Its insertion degree is ten, its operation degree is zero, and adding the boundary class gives degree twelve. Thus both the corrected restriction and capped trace are one on this replacement control.

## R02 (P1) — The stable compactification has a nonempty evaluation-diagonal fibre

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:564`: “the fibre over the diagonal is empty, as a line is embedded”.

**Claim:** This holds on the smooth-domain two-marked line locus, but is false on the stable-map carrier used in §6.6. Distinct marks need not lie on the nonconstant component. AnalyticStableMaps §12.1 repeats the same unqualified Check; importing it does not make it true.

**Witness:** Attach a constant sphere at a point `p` of a degree-one line. Put both marks on the sphere, whose third special point is its node. This stable map has `ev₁=ev₂=p`.

**Repair:** State emptiness only for the smooth-domain embedded-line locus. On the compactification, include the collision-bubble stratum, parametrized by a line and a point on it; its complex dimension is three. Keep the diagonal's real normal rank four, but do not infer transversality or emptiness of this singular/excess intersection. The displayed bubble is then included and has the required equal evaluations. Record the restriction when consuming AnalyticStableMaps §12.1; no supplier edit is requested in this package.

## R03 (P1) — The ψ-square computation uses the wrong restriction to the collision divisor

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:634`: “`∫ ψ̄₁² = 0 + ∫ [D_(1,5)] ⌣ ψ̄₁ = 1`”.

**Claim:** On `D_(1,5)` mark one is on a three-special-point rational component. Its cotangent class restricts to zero, exactly as the preceding paragraph's factor-restriction law requires. The term declared to be one is zero.

**Witness:** Put `a=π*ψ̄₁^(4)` and `D=D_(1,5)`. On `M̄₀,₅`, `∫a²=0`, `∫aD=1`, `∫D²=−1`, and `ψ̄₁|D=0`; hence `∫Dψ̄₁=0`.

**Repair:** Use `ψ̄₁=a+D` to compute `∫ψ̄₁²=0+2·1−1=1`, or `∫aψ̄₁+∫Dψ̄₁=1+0`. Keep `∫ψ̄₁ψ̄₂=2` as a separate control. This repairs the computation without changing the true ψ-square value or the line comparison.

## R04 (P1) — Genus-one classes on a product of tori need not be factor combinations

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:144`: “the realized classes in genus one are the combinations `aF₁ + bF₂` with `a, b ≥ 0`”.

**Claim:** The symplectic areas of the factors impose no condition excluding mixed Künneth components. The sentence incorrectly identifies the effective set.

**Witness:** Take the same complex elliptic curve `E` in both factors, with areas `1,√2`. The embedded diagonal is genus one. It pairs to one with a suitable mixed class `α₁⌣β₂`; every `aF₁+bF₂` pairs to zero.

**Repair:** Use only the verified assertion that factor covers give realized classes with areas `a` or `b√2`, sufficient for the nondiscrete area-image example. Add the diagonal as a mixed-class control, with area `1+√2`. Do not claim a classification of genus-one effective classes without hypotheses on the elliptic factors and a proof. The corrected example retains all six homology coordinates used in §0.3.

## R05 (P1) — Zero is not always realized, and the unstable constant dimension is wrong

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:138`: “`0 ∈ Eff(g, n, J)` for every `(g, n)`, realized by the constant maps”; line 202: “`d = 2(m − 3) + 4 − 2m = −2`”.

**Claim:** Adjoining zero to the effective set is permissible, but calling it realized at every signature contradicts the stability theorem. The added `−2m` in the dimension Check is not part of the declared virtual-dimension formula.

**Witness:** For `(g,n,A)=(0,2,0)`, constant stable maps do not exist. The formula at line 49 gives `d=2m−2`: for `X=ℂP¹`, `d=0`, not `−2` (AnalyticStableMaps §0.1, line 115).

**Repair:** Distinguish the actual realized set from that set with zero adjoined; say constant maps realize zero only in the pointed-stable range, for nonempty targets. Replace the Check by `d=2m−2` and explicitly attribute emptiness to stability, not dimension. For `ℂP¹` the repaired Check reads: empty carrier, virtual dimension zero, zero numerical operation. Also give the empty-target case if zero-dimensional empty manifolds remain allowed by the conventions.

## R06 (P1) — A complex double zero has multiplicity two, not zero

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:279`: “The zero-set atlases of `z ↦ z` and `z ↦ z²` on ℂ … have classes `1` and `0`”.

**Claim:** This confuses real and complex local degree. It disagrees with the named suppliers' normalization.

**Witness:** A small nonzero complex value has two preimages under `z²`, each with positive real Jacobian determinant: `1+1=2`. AnalyticStableMaps §10.2, line 963, explicitly gives multiplicity `r` for `z^r`.

**Repair:** Keep ℂ and change the classes to `1,2`, citing AnalyticStableMaps §10.2 or ImplicitAtlases §5.6. Alternatively use `x,x²` on ℝ, as ImplicitAtlases §5.2, line 609, does: the latter has signed degree `1−1=0`. Both corrected pairs still demonstrate why unrelated atlases cannot be compared without a concordance witness.

## R07 (P1) — Transfer multiplicity is not always an automorphism order

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:531`: “The transfer degree is the order of the generic branch-swap stabilizer”; line 536: “the factor swap is a target automorphism”.

**Claim:** The degree-two rule itself is correct, but its asserted explanation is false in general. Ordering can produce two distinct source points rather than an automorphism of one target object. This distinction is essential to the requested retained-arrow normalization.

**Witness:** Glue two nonisomorphic pointed elliptic curves. No automorphism exchanges their components, yet the ordered product has two preimages. Both source and target stabilizers have order four: the degree is `2·4/4=2`, not a swap-stabilizer order.

**Repair:** Compute the weighted degree by summing source lifts with their source/target stabilizer ratios. Separate a coarse two-sheeted map from a one-sheeted map with a stabilizer index. Retain the genus-two nonseparating control at line 535 (`1·2/1=2`), and add generic nonseparating genus four (`2·1/1=2`) and the nonisomorphic elliptic-component example (`2·4/4=2`). Do not call the degree-two maps embeddings without specifying a local ordered branch chart.

## R08 (P1) — The full Novikov completion is not an ordinary internally graded ring

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:152`: “prove that `Λ_ω` is a graded ring”; “A homogeneous element … may have infinitely many monomials of distinct `c₁`”.

**Claim:** An ordinary internal grading has finite homogeneous support. The full area completion need not have that property. Moreover, with the finite-dimensional graded `V` stipulated here, a homogeneous element can involve only finitely many Chern numbers, even if infinitely many curve classes have those numbers. The later phrase “completed grading” does not define a replacement or repair the false homogeneous assertion.

**Witness:** For `S²`, `f=Σ_(k≥0)q^k` belongs to `ℚ((q))`; its degrees are `0,4,8,…`, so it is not a finite homogeneous sum and is not homogeneous. For `V=ℚ`, a homogeneous series has one Chern number.

**Repair:** Define the closed homogeneous pieces by the coefficient condition `v_A ∈ V^(D−2c₁(A))`, and specify the allowed area-convergent sums of these pieces. Reserve an ordinary internal grading for their direct sum; call the full carrier its filtered completion. State that general series can have infinitely many degrees, whereas a homogeneous series has Chern numbers in the finite set determined by the degrees of `V`. Transport this convention explicitly to §§7.1–7.2. The series above then remains allowed but inhomogeneous; on a target with `c₁=0`, its analogue is homogeneous. Do not narrow the target class to avoid this issue.

## R09 (P2) — Small quantum associativity does not determine the conic count

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:611`: “`H² ⋆ H² = qH`, i.e. `N₂ = N₁² = 1`”; also lines 505, 572 and 619.

**Claim:** Every positive-degree coefficient in the displayed small quantum products counts lines. Associating those products gives the same line coefficient on both sides; it contains no conic invariant. Likewise the four insertions at line 505 are dimensionally incapable of counting conics through five points. The correct numbers `N₂=1,N₃=12` are not consequences of the displayed calculation.

**Witness:** For conics, `d_(0,4,2ℓ)=18`, while `(pt,pt,H,H)` has degree twelve; the operation degree is `−4`, hence zero. Small-product associativity reads `qN₁H=qN₁H`, independently of `N₂`.

**Repair:** Keep the small-product Check as that equality. If the enumerative claims remain, add the higher-point WDVV/potential coefficient argument and its incidence comparison as explicit targets, citing KM1994 §5.2.1, (5.16)–(5.17), p. 28 (lines 1254–1278). The recurrence gives `N₂=1·(2−1)=1` and `N₃=2(10−10)+4(5−2)=12`. These are the appropriate discriminating computations. Alternatively remove the unsupported enumerative deductions from the Checks and examples; the small quantum ring remains in scope.

## R10 (P3) — Exact source locators are still absent for substantial new targets

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:311`, 543, 629, 641, 657, 673, 697 and 713: for example, “Prove the line comparison and class identity” (§8.5).

**Claim:** Supplier sections identify inputs, but do not provide source locators for the new scalar Hodge-family theorem, capped trace, cotangent-line construction, descendant equations or ancestor recursion. Neither of the two references supplies all these assertions at the cited locators. The exact sourced sample is recorded below; these entries cannot be certified merely by resolving supplier names.

**Witness:** §8.6 has a formula, Checks and a Needs line, but no theorem/section/page citation to a source for that formula. KM1994 Definition 6.1 (p. 31) states CohFT gluing axioms, not this descendant/ancestor statement.

**Repair:** Supply exact legal-source locators for the new results, distinguishing a sourced theorem from a construction extending a source's setting. Identify the source inputs for each extension and its actual hypotheses. In particular retain the map-stable/pointed-stable distinction in §§8.2–8.6. Resolve the missing locators for the sampled targets before claiming they were source-verified. Also cite CharacteristicClasses C2 item 3 for `∫e(TX)=χ(X)` in §3.4: C3's `c_m=e` and AlgebraicTopology's Euler–Poincaré identity alone do not state that bridge.

## R11 (P3) — Some definitions still lack API lists or discriminating Checks

**Location:** `TauCetiRoadmap/GromovWittenTheory/README.md:629`, 641 and 657: definitions of `L̄_i`, `L_i`, `ψ_i`, and descendant/ancestor brackets; line 317: “a definition allowing independent residues would give dimension 2”.

**Claim:** The layer structure and Needs lines have been added, but these definition sections have no API bullet list separate from the Checks. The proposed independent-residue negative control for `ℂP¹` is not discriminating: the global residue theorem already forces the two residues to sum to zero, even without an explicit node-matching condition.

**Witness:** Meromorphic differentials on `ℂP¹` with simple poles only at `0,∞` form `ℂ·dz/z`, dimension one both with and without an explicit opposite-residue condition. On the two-sphere, two-node curve, matching reduces dimension two to one.

**Repair:** Extract the stated equivariance, pullback, refinement and tensor-power laws into API bullets, and give each bracket definition its multilinearity, degree-selection and comparison API. Use the two-sphere, two-node example to distinguish unmatched from matched residues. Keep at least three computed, discriminating Checks per definition; do not create Lean padding. Use separate named supplier subsections for the suppliers grouped under “remaining roadmaps on main”.

## R12 (P3) — The Lean explanation contains process prose and an excessive absence claim

**Location:** `TauCetiRoadmap/GromovWittenTheory/Suggested.lean:31`: “roadmaps still in pull requests”; line 34: “so no Riemann surface is a domain at the pin”.

**Claim:** The first phrase dates the document. The second does not follow from absence of a general compact-curve adapter: the almost-complex carrier accepts native manifolds and includes the standard real-plane complex structure used by its pseudoholomorphic and energy APIs. Missing stable-map and stable-domain moduli already explain why the actual headlines are not statable.

**Witness:** `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean:67` bundles a smooth tangent endomorphism squaring to minus identity. `JHolomorphic.lean:473` states the standard-complex-line specialization. Neither restricts domains to a nonexistent closed-curve carrier.

**Repair:** Delete the process phrase and replace the broad domain-absence claim by the precise missing compact nodal-domain/stable-map moduli adapter. Retain the headline list and the explanation of its missing carriers. No substitute theorem is requested.

## Verified sound

The following records successful checks and the computed failures separately. A successful example is a consistency test, not a proof of the entire proposed construction.

**Previous review, finding by finding.** The old review had nine P3 findings. No supplied repair report marked a finding “not actionable in this package”.

| Previous finding | Passage at this head | Disposition |
|---|---|---|
| R01 Unicode | README:9, `I_(g,n,A) : H^*(X; ℚ)^(⊗n) → H^*(M̄_(g,n); ℚ)` | Repaired: latex and tex gate counts zero. |
| R02 imports | Suggested.lean:1, `import Mathlib` | Repaired. |
| R03 padding/headlines | Suggested.lean:27, “None of these is statable at the pins” | Repaired: all six old declarations deleted; four headline groups and missing carriers recorded. |
| R04 namespace/docstring | Suggested.lean:51, `namespace TauCetiRoadmap.GromovWittenTheory`; line 6, “This file is not the roadmap” | Repaired; name agreement is vacuous because there are zero declarations. |
| R05 shape/API/Checks | README:132, “Layer 0”; line 148, “Needs”; line 140, “Checks” | Partly repaired: nine layers, Examples/Dependencies and supplier contracts exist; R10–R11 identify remaining omissions. |
| R06 timeless/exact suppliers | README:325, “ComplexCurveModuli D3 item 5, D4, D5, D6” | Supplier abbreviations expanded; process prose remains in Lean (R12). |
| R07 SymplecticGeometry drift | README:69, `SmoothTwoForm.IsSymplectic`, `SmoothTwoForm.Tames` | Repaired: native carriers and AnalyticStableMaps parameter-family contract replace the incorrect supplier. |
| R08 compact Hardy operator | README:311, “the compact-component scalar operator … is constructed here” | Repaired: local disc/strip estimates are distinguished from the new family construction. |
| R09 source locators | README:743–744, explicit versions, theorem/equation numbers and pages | Partly repaired: KM/Pardon locators match; new targets still lack locators (R10). |

**Gate, scope and Lean.** The worker's gate at exactly `c0b92eadb16d388276efcdb5b76d5b1633c75b62` reports all checks zero/OK, including build, stray-files and outside-folder. The independent outside-folder diff is empty; the folder has README.md, Suggested.lean and metadata.toml. Direct `lake env lean` on Suggested.lean returned exit zero, with no warnings. There are zero definitions, instances, axioms or theorems, so the elaborated-signature comparison and one-tactic padding probe each have zero subjects; no hidden section binder can be dropped. No missing Tau Ceti object-file build was required.

The README's headlines are (1) the operations and all eight Kontsevich–Manin identities, with tame-path independence; (2) `I_(1,1,0)(1)=χ(X)·1`; (3) the completed unital CohFT and associative, unital, graded-commutative quantum product; (4) string, dilaton, divisor, descendant–ancestor comparison and genus-zero ancestor recursion. The Lean docstring lists these groups (the comparison is part of its descendant group). All require missing geometric moduli/virtual carriers, not a few simple definitions. No statable headline omitted in favour of a stand-in was found. No sorry'd data, set_option, algorithmic shortcut or copied source prose was found.

**Dependency direction.** Independently rerun with the supplied candidate order, `--movable` and main content:

```text
depcheck: 208 roadmaps, 1458 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No declared gap was available. The internal target order is acyclic, but §§6.2–6.3 depend explicitly on §§6.4–6.6: implement those construction targets before the two identity proofs. Layer 0's use of a supplier stable-map carrier does not depend on its later local exposition in Layer 1.

**Pinned declarations actually opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The relative paths below are within those libraries, not newer upstream versions.

| Declaration/object | File and line at pin | Content and limit checked |
|---|---|---|
| `AddMonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64` | Coefficients are `M →₀ R`; finite support, no completion. |
| `HahnSeries` | `Mathlib/RingTheory/HahnSeries/Basic.lean:52` | Coefficients plus partially well-ordered support on a partially ordered exponent type; does not encode arbitrary real-period finite-below support. |
| `LaurentSeries` | `Mathlib/RingTheory/LaurentSeries.lean:100` | Hahn series with integer exponents. |
| `DirectSum.IsInternal` | `Mathlib/Algebra/DirectSum/Basic.lean:440` | Canonical direct-sum map is bijective; full Novikov series need not belong to the finite-degree sum (R08). |
| `SmoothAlmostComplexStructure` | `TauCeti/Geometry/Symplectic/Manifold/AlmostComplex.lean:67` | Smooth tangent endomorphism and square identity; no tameness, integrability or compactness field. |
| `SmoothTwoForm.IsSymplectic` | `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:92` | Closed and fibrewise nondegenerate; no compactness/connectedness field. |
| `SmoothTwoForm.Tames` | `TauCeti/Geometry/Symplectic/Manifold/TwoForm.lean:114` | Positivity on every nonzero tangent vector. |
| `stdComplexLineEnergyDensity` and positivity | `TauCeti/Geometry/Symplectic/Manifold/Energy.lean:118`, 162 | Sum of the two tangent contributions; positive for a nonzero differential under tameness. |
| `stdComplexLineEnergy` | `TauCeti/Geometry/Symplectic/Manifold/Energy.lean:373` | Integrates the positive part of half the density. For the standard complex-linear identity, density two and normalized energy density one. |
| `IsPseudoholomorphic` | `TauCeti/Geometry/Symplectic/Manifold/JHolomorphic.lean:103` | Pointwise differentiability with derivative intertwining J; does not itself assert smoothness or stable nodal domains. |
| `singularCohomologyFunctor` | `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:129` | Contravariant functor in natural-number degree with explicit categorical coefficient data. |
| Alexander–Whitney cup associativity | `TauCeti/AlgebraicTopology/Cohomology/Cup.lean:103` | Actual cup cochains and coefficient-associativity hypotheses; not a virtual integration theorem. |

Object searches for stable-map moduli, implicit atlases, Novikov completion, Chern classes and Gromov–Witten operations found no native geometric acceptance-test carriers. Hits on `StableMorphism` in Auslander–Reiten theory are unrelated. Further algebraic inputs opened: `Basis.repr` (`Mathlib/LinearAlgebra/Basis/Defs.lean:89`) is an equivalence with finitely supported coordinates; `Module.finrank` (`Mathlib/LinearAlgebra/Dimension/Finrank.lean:61`) is cardinal rank converted to ℕ and may be zero in infinite dimension, so finite dimensionality is essential; `Finset` (`Mathlib/Data/Finset/Defs.lean:75`) is a duplicate-free multiset; `TopCat` (`Mathlib/Topology/Category/TopCat/Basic.lean:31`) carries only a topology, not separation or compactness; `AlgebraicTopology.singularHomologyFunctor` (`Mathlib/AlgebraicTopology/SingularHomology/Basic.lean:52`) supplies ordinary homology. `LinearMap.BilinForm` (`Mathlib/LinearAlgebra/BilinearMap.lean:529`) is a nested linear map, and `BilinForm.toDual` (`Mathlib/LinearAlgebra/BilinearForm/Properties.lean:350`) requires finite dimension and nondegeneracy. `Matrix.nonsingInvUnit` (`Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean:445`) requires a unit determinant. These are existing inputs, not newly owned geometry.

**Suppliers resolved against main or the given open head.** `roadmaps resolve` found no unresolved roadmap or Lean-name leads. Its output explicitly did not check pinned Lake packages; the separate pinned search above supplies that check. Every Needs line was read. The following groups record the resolved contracts (all paths start `TauCetiRoadmap/` and end `README.md`).

| Supplier | Sections/lines inspected | Resolution |
|---|---|---|
| AnalyticStableMaps, supplied open head | §§0.1/0.3 (105,140), 1.1–1.2 (206–235), 2.1 (249), 3.7 (627), 4.1/4.3 (668,700), 6.2–6.3 (792–816), 7.3 (850), 8.1 (872), 9.1–9.2 (910–934), 10–13 (945–1101) | Carrier, index, obstruction, chart, orientation, virtual functional, family, forgetting, marked universal family, joint trace and exports all exist. R02 and R06 distinguish an erroneous imported Check from a valid construction contract. |
| ImplicitAtlases, supplied open head | §§1.1 (284–315), 3.1 (438–454), 4.2–4.3 (534–582), 5.2–5.6 (598–677), 6.4–6.5 (728–760), 7.1–7.4 (770–849) | Engine supplies actual atlas/product/Gysin laws under its joint-model and orientation hypotheses; it explicitly leaves application identities to this roadmap. Real versus complex multiplicity is R06. |
| ComplexCurveModuli, main | D3–D6; D7 lines 192–215; D8 lines 215–223 | Stable-domain groupoid, Hardy/plumbing families, properness, finite-action charts, universal curve, contraction product and order coherence, clutching and weighted target adapter exist. No singular-map orbifold structure is exported. |
| Orbifolds, main | O1–O4; O5 lines 672–740 | Full-isotropy integration, rational pairing, Thom and wrong-way maps have the claimed scope; arbitrary singular map zero loci are excluded. |
| MorseNovikov, main | N1 lines 75–138 | Exact support condition, convolution finiteness, units, completion, group-ring embedding, period pushforward and Laurent comparison; no finite-dimensional tensor identification is asserted by the supplier. |
| CharacteristicClasses, main | C1.2b lines 419–483; C2 lines 550–718, especially 658–664; C3 item 2 lines 826–837 | Čech/singular comparison has paracompact Hausdorff CW-type hypotheses; Chern and Euler inputs exist. C2 item 3 is the proper Euler-number locator. |
| AlgebraicTopology, main | Stage 5 item 1 lines 849–866; Stage 6 items 1–2 lines 1011–1068; Stage 7 item 1 lines 1573–1585; Stage 8 item 7 lines 1811–1818 | Künneth, coefficient duality, cup/cap, Euler–Poincaré and finite-CW manifold contracts resolve, with field/PID and topology hypotheses retained. |
| DifferentialGeometry, main | 8.3–8.5 lines 836–861 | Smooth-chain integration and de Rham comparison with T2, σ-compact, finite-dimensional smooth hypotheses. |
| GeometricTopology, main | Smoothing-and-triangulation item 1 lines 937–943 | Smooth triangulation supplies the finite-CW route for compact X. |
| ComplexKahlerGeometry, main | K5b lines 1168–1239 | Compact boundaryless Hermitian Dolbeault/Serre theory, including smooth normalization components; not the nodal scalar-family construction. |
| HeegaardFloer and PDE, main | F1 lines 171–185, F2 item 1; Lane A lines 223–266 | Local disc/strip CR and Sobolev/trace inputs, not an already supplied compact Hardy family. |
| HamiltonianFloerOperations, main | H1 lines 25–40; H7 lines 91–109 | Downstream consumer of coefficients and quantum product. Its cochain regrading accounts for `q^A ↦ e^(−A)`; it is not an upward supplier. |

Ownership searches used `roadmaps grep` by object across the indexed main/open material, direct searches of board package designs, and the supplied sibling files. Generic completion, domain geometry, virtual engines, characteristic classes and Čech comparisons have the owners above. AnalyticStableMaps §13.4 (line 1085) explicitly assigns the GW operations and descendants here. FukayaTheory (line 7) excludes closed GW classes; SymplecticFieldTheory distinguishes its punctured theories; TaubesGromov (main, line 29) distinguishes its point-insertion invariant from stable-map GW theory. HamiltonianFloerOperations consumes the closed theory. Arithmetic Hodge-bundle hits concern algebraic families, not this analytic nodal scalar-family construction. No second owner for the new closed GW operations was found. No fully qualified declaration collision is possible in the empty Suggested.lean. Open work without a supplied file/head was not independently inspected beyond the tool's index.

**Seeded source sample: all 15 targets.** Both cited works were fetched legally through the sources service; no manifest was edited. The source versions are [KM1994, arXiv v2](https://arxiv.org/abs/hep-th/9402147v2) and [Pardon2016, arXiv v6](https://arxiv.org/abs/1309.2370v6). Their printed arXiv page numbers match the README. No target was explicitly marked unverified in the README.

| Sample target | Text/locator actually read | Result and scope |
|---|---|---|
| 0.2 Novikov/state module | MorseNovikov N1 lines 75–138; no primary locator for the new completion/grading assertion | Supplier supports support/convolution; finite-basis identification passes; grading fails R08. |
| 1.1 stable carrier/range | Pardon2016 lines 4094–4117, §9.1 p. 95; lines 4353–4366, Thm 9.2.10/Def 9.3.1 p. 100; AnalyticStableMaps §§1.1–1.2 | Nodal maps and finite automorphisms match. Def 9.3.1 assumes `2g+n>2`; unstable numerical extensions are separate targets, not that definition. R05 corrects the Check. |
| 1.2 combined diagrams | Pardon2016 lines 4360–4364, Def 9.3.1 p. 100; AnalyticStableMaps §13.3 | Tautological coarse pushforward is supported; chart-level relative/refinement strengthening is local construction work. No exact source locator for that strengthening. |
| 2.1 weighted adjoint | Orbifolds O5 items 1,4; ComplexCurveModuli D8 | Supplier contracts support weighted duality. New adjoint uses finite perfect pairing; no primary source locator is attached. |
| 2.2 operation | KM1994 lines 128–142, Def 2.2/(2.1)–(2.2), p. 4; Pardon2016 Def 9.3.1, p. 100 | Grading and stable-range carrier match. KM gives axioms for projective targets, not a proof of arbitrary symplectic GW axioms. The README correctly owns that construction. |
| 3.2 Hodge family | KM1994 lines 408–421, §2.4.5 p. 10; CKG K5b | Supports obstruction cohomology and Hodge dual, not the full Hardy-family/base-change theorem. Missing construction locator, R10. |
| 4.2 covariance | KM1994 lines 134–136, 2.2.1 p. 4 | Super permutation convention agrees; odd transposition gives minus one. |
| 5.2 fundamental class | KM1994 lines 176–185, 2.2.3/(2.6)–(2.7), p. 5 | Non-basic pullback and three-point exception match exactly. |
| 6.3 genus reduction | KM1994 lines 242–246, 2.2.7/(2.12), p. 6 | Ordered last-two-mark formula agrees, with stable source and `g≥1`. |
| 6.5 spine/capped trace | ComplexCurveModuli D7 item 1; Pardon2016 lines 1698–1702 p. 40 and 4087–4090 p. 95 | Bridge product is supplied; Pardon explicitly does not prove the needed fibre-product/GW axioms. No locator for the new capped trace. R01 refutes its numerical Check. |
| 8.1 domain cotangent lines | ComplexCurveModuli D7 and CharacteristicClasses C3 inputs | No source locator for ψ-boundary relation or intersection numbers. R03 refutes the displayed derivation. |
| 8.2 map cotangent line | AnalyticStableMaps §11.2; CharacteristicClasses C1.2b/C3 | Families and Chern inputs resolve. Tensor-power descent is a local target without a source locator. The CP¹ computation is consistent. |
| 8.3 brackets | Virtual functional and §8.2 definitions | No primary locator. Point, one-mark and two-mark CP¹ computations agree. |
| 8.5 comparison | §8.1–§8.3, §6.5 and supplier contraction inputs | No source theorem/page for this general singular-map supported comparison. Point and CP¹ tests agree; full assertion is not source-certified. |
| 8.6 ancestor TRR | Domain ψ relation and proposed splitting route | No source theorem/page for the displayed mixed ancestor/descendant formula. The n=3,4,5 tests below agree; full assertion is not source-certified. |

Additional source checks: KM1994 lines 186–204 support divisor and genus-zero degree zero; lines 220–241 support the splitting formula; lines 816–819 (Theorem-Definition 4.5, p. 19) support the conditional quantum ring; lines 1455–1473 (Definition 6.1, p. 31) have covariance/gluing but no unit. Definition 6.1 uses a coefficient field: the README's general Novikov-ring version must be its explicitly constructed finite-free, perfect-pairing extension, not a claim that the source already states a nonfield theorem. The constant-map correction is verified below and in Source issues.

**Adversarial computations.** There are 57 rows, covering every numbered target, the conventions, all headline groups, all seeded targets and every mathematical finding. An equality of values here is a tested instance; construction/coherence claims without a primary locator retain the limitations above. Coefficients are ℚ, not arbitrary characteristic: division by finite isotropy orders is legitimate; characteristic two and the zero ring are outside these standing coefficients. Signed dimensions and `τ_(−1)=0` must remain signed/explicit rather than truncated natural subtraction.

| Statement | Instances tried | Values computed on the two sides | Result; change |
|---|---|---|---|
| Conventions: virtual dimension | CP¹ `(0,3,0)`; point `(0,3,0)`; CP² `(0,0,ℓ)` | `2(−2+3)=2=dim X`; `0=0`; `2(−1+3)=4=dim dual plane` | Consistent. |
| Conventions: operation degree | CP² `(0,4,ℓ)`, insertions pt,pt,H,H | `t−d+s=2−12+12=2`; `s−2m−2c₁=12−4−6=2` | Consistent; R01 uses it. |
| Conventions: local energy | Standard complex-linear identity on ℝ² | Native density `1+1=2`; native half-density `1`; area density `1` | Normalized energy matches area; raw density must not be integrated without its half. |
| Conventions: left dual | T², basis α,β, `∫αβ=1` | Left duals `−β,α`; reconstruct α as `0·(−β)+1·α=α` | Correct. |
| 0.1 effective zero | Constant `(0,2,0)` | Adjoined-zero membership `true`; realized membership `false` | R05. |
| 0.1 positivity/torsion | CP² classes ℓ,−ℓ; nonzero torsion | Areas `1,−1,0`; nonconstant representatives require `>0` | Negative and torsion classes excluded. |
| 0.1 torus effective Check | Diagonal E in E×E | Mixed pairing `1`; all factor combinations give `0`; area `1+√2` | R04. |
| 0.2 support/completion | S²; zero area map; torus positive quadrant | `Σq^k` has finite sublevels, e.g. below 3 has 3 terms; zero period forces finite support; `a+b√2<3` has finitely many pairs | Correct support distinction. |
| 0.2 negative support | `Σ_(a≥0)q^(aF₁−aF₂)` | All `a≥1` have area `<0`; sublevel below zero is infinite | Correct exclusion. |
| 0.2 finite-dimensional tensor | V=0; V=ℚ²; infinite direct sum | `0⊗Λ=0`; two coordinate series give two pure tensors; `e_k q^k` needs unbounded coefficient span | Finite-dimensional isomorphism plausible with real proof route; infinite-dimensional negative control works. |
| 0.2 degree/completed homogeneity | S² `Σq^k`; V=ℚ | Degree components `4k`, each coefficient 1; no finite-degree sum; homogeneous coefficients have one c₁ | R08. |
| 0.2 pairing extension | T² odd block | Matrix `[[0,1],[-1,0]]`, determinant `1`; same determinant in Λ | Perfectness survives scalar extension; odd degrees unchanged for c₁=0. |
| 0.3 class finiteness | CP² area bound 3; A=3ℓ | Classes `0,ℓ,2ℓ,3ℓ`: 4; decompositions `(0,3),(1,2),(2,1),(3,0)`: 4 | Correct for nonnegative bound. For negative E use zero classes, not an unqualified `floor(E)+1`. |
| 0.3 dense image/torsion | T⁴; Enriques | Six bounded integer coordinates give finite lattice set; torsion gives 2 lifts per free class | Correct route; no discreteness premise. |
| 1.1 stable range | `(0,3),(1,1),(0,2),(1,0)` | `2g−2+n=1,1,0,0`; stable-domain targets exactly first two | Correct on nonempty moduli. |
| 1.1 unstable maps | Unmarked degree-one CP¹ map; constant two-mark map | Automorphism orders `1` versus infinite; dimensions `0` versus `2m−2` | Carrier distinction correct; R05 fixes second dimension. |
| 1.2 combined map | CP² lines/3 marks; genus-one constants | Target-domain dimension `0`, source `10`; constant generic isotropy homomorphism `C₂→C₂` identity, special `C₄→C₄` identity | Correct instance; full chart coherence not implied by this test. |
| 2.1 weighted integral | M̄₁,₁ coarse orientation class h | Weighted `∫h=1/2`; ordinary `∫h=1` | Correct retained-kernel normalization. |
| 2.1 forgetful adjoint | M̄₀,₄→pt | `π*1=1`, `π_*1∈H^(−2)=0`, `π_*h=1` | Correct. |
| 2.1 clutching adjoint/identity | pt→M̄₁,₁; identity | `∫wt(2h)=1=∫pt1`; identity matrix remains identity | Correct. |
| 2.2 operation | CP² line, pt,pt,H versus pt,pt,pt | `s=d=10` gives 1; `s=12≠10` gives 0 | Correct selection and normalization. |
| 2.2 negative/over-top degree | CP² conic with 4 insertions pt,pt,H,H | `r=12−4−12=−4`; target H^(−4)=0 | Correct vanishing; refutes R09's proposed use. |
| 2.3 path/orientation | Constant collared family; line count endpoints | Boundary test `1−1=0`; both line counts 1 | Correct orientation control. |
| 2.3 unrelated atlases | Complex z,z²; real x,x² | Complex degrees `1,2`; real signed degrees `1,0` | R06. |
| 3.1 weights/orientation | Constant genus-one map; ineffective C₂ | Source/target weights `1/2,1/2`, ratio 1; reflection orientation character `−1` | Correct cancellation/exclusion. |
| 3.2 Hodge rank | Rational self-node; two spheres one node; elliptic pair one node | `g=0+1=1`; `0+0=0`; `1+1+0=2` | Rank formula passes. |
| 3.2 residue discriminant | ℙ¹ with poles 0,∞; two spheres/two nodes | First has dimension 1 even without node law; second unmatched dimension 2, matched 1 | R11 negative-control repair. |
| 3.2 isotropy representation | Elliptic involution | Pullback of dz is `−dz`; action on Hodge and dual is `−1` | Correct. |
| 3.3 obstruction/model | g=0; g=1,m=1, enlargement rank 2 | Ob ranks `0,1`; latter image rank 1 plus Ob rank 1 equals 2 | Rank/left-inverse bookkeeping consistent; no global concordance inferred merely from ranks. |
| 3.3 quadratic shrinking | `K=‖A⁻¹P‖C>0`, `0<r<1/K` | Zero inequality would give `1≤Kr<1` after dividing by r | Forces r=0; K=0 forces r=0 directly. |
| 3.4 Euler normalization | CP¹, point, T² | Euler integrals `2,1,0`; weighted test h gives `1,1/2,0`; constant classes paired give same | Correct χ_top normalization; source correction needed. |
| 3.4 Hodge sign | CP¹, insertion pt; rank-two twist | `−∫λ·∫pt=−1/24`; `c₂(V)−λc₁(V)+λ²`, with `λ²=0` | Correct. |
| 3.4 high-dimension vanishing | g=2,m=4,n=0 | Operation degree `8`; target dimension `6`; class zero | Correct. |
| 4.1 effectivity | CP² −ℓ, torsion, 2ℓ | First two have zero operations; conic class has positive area 2 and nonempty carrier | Correct. |
| 4.2 covariance | T² α,β,1; even CP² insertions | Transposed values `1,−1`; Koszul sign `−1`; even sign `+1` | Correct. |
| 4.3 grading | `(0,3,0)`, `(1,1,0)` | Degrees `s−2m`, respectively `s`; unit genus-one degree 0 | Correct. |
| 5.1 basic/forgetting | `(0,4),(1,2),(2,1)`; `(1,1)` | Forgotten stability values `1,1,2`; last gives `0` and no stable-domain target | Correct. |
| 5.1 fibre integration | Lines CP², extra mark | `π_*1=0`; `π_*ev*H=1`; fibre real dimension 2 | Correct; “relative degree 1” must mean normalized fibre fundamental class, not zero-dimensional map degree. |
| 5.2 unit | CP² `(pt,pt,1)` in class ℓ; `(pt,1,1)` in class 0 | `8≠10` gives 0; `∫pt=1` | Correct three-point exception. |
| 5.3 divisor | CP² line pt,pt,H,H | `1=(ℓ·H)·1=1`; for A=0 divisor multiplier 0 | Correct. |
| 5.4 constants | CP¹ n=4, pt,1,1,1 versus pt,pt,1,1 | `∫pt=1`; `∫pt²=0`; T² α,β,1 gives 1 | Correct. |
| 6.1 Casimir/sign | T²; CP²; odd regrouping | T² trace `1+1−1−1=0`; CP² antidiagonal square is identity; one odd swap `−1` | Correct diagonal and order. |
| 6.2 splitting | Original pt,pt,H,H; corrected pt,H,H,H | Original `0=1·0·1=0`; corrected `1=1·1·1` | R01. |
| 6.3 genus reduction | A=0, insertion 1; total insertion degree 2 | CP¹ `2=2`; T² `0=0`; degree-two insertion RHS integrals have degree `2m+2`, hence all zero | Formula passes; second Check only yields zero, not a nonzero degree-zero restriction of a degree-two class. |
| 6.4 transfer | Generic nonseparating genus 4; genus 2; two unequal elliptic components | `2·1/1=2`; `1·2/1=2`; `2·4/4=2` | Degree rule right, automorphism-only explanation false (R07). |
| 6.5 spine | Bridge with two nodes plus side branch | `t=ut₁t₂`; divisor multiplicities `(1,1,0)`; tail with node-free stabilization contributes 0 | Correct local product; global trace remains a construction target. |
| 6.5 capped trace | Original CP² insertions; corrected R01 | Degrees `14>12` give 0 versus claimed 1; corrected `10+2=12` gives 1 | R01. |
| 6.6 node matching | Line plus two-mark ghost; product pt×M̄₁,₁ | Evaluation difference `p−p=0`, carrier nonempty; product weight `1·1/2=1/2` | R02; product normalization passes. |
| 7.1 CohFT degree/unit | CP¹ three pt insertions; unit insertion | Output q degree 4 equals `6−2`; unit has nonzero coefficient only at A=0 | Consistent after R08 completion correction. |
| 7.2 product | CP¹ x²; T² αβ; CP² H²⋆H² | `x⋆x=q`, degrees `2+2=4`; odd reversal `1→−1`; CP² `qN₁H=qN₁H` | Product controls pass; no N₂ information (R09). |
| 7.2 enumerative recurrence | KM (5.17), d=2,3 | `2−1=1`; `2(10−10)+4(5−2)=12` | Correct replacement route, not the displayed small product (R09). |
| 8.1 domain ψ | n=3,4,5 | ψ at n=3 is 0; integral at n=4 is 1; at n=5 square `0+2−1=1`, mixed 2 | R03 corrects intermediate equality. |
| 8.2 descent/map ψ | Isotropy orders 2,3; CP¹ 2 marks | `c₁(L^12)/12=c₁(L^6)/6`; writing h₁,h₂ gives ψ₁=`−h₁+h₂`, so `∫ψ₁h₂=−1` | Correct; denominator N=6 is nonzero in ℚ. |
| 8.3 brackets | Point; CP¹ 1 and 2 marks | Point values `1,1,1/24`; CP¹ primary values `1,1`, descendant `−1` | Correct. |
| 8.4 string/dilaton/divisor | Point n=4,5; CP¹ degree 1 | String `1=1`, `2=1+1`; dilaton `−1=(−2+1)·1`; divisor Check `0=0+0` | Correct with existing map-stable forgetful target; τ_(−1)=0 explicit. |
| 8.5 ancestor correction | Point; CP¹ `(0,3,ℓ)` | Point correction 0; `⟨τ₁(1),pt,pt⟩=0+0`; `⟨τ₁(pt),pt,1⟩=0+1=1` | Consistent boundary correction; full supported comparison not source-certified. |
| 8.6 ancestor TRR | Point n=3,4,5; CP² n=3 | Empty sum `0=0`; n=4 `1=1·1`; n=5 `2=1+1+0`; CP² ancestor 0 versus descendant `1=0+1` | Consistent sampled values; no general source locator. |

## Not verifiable

- The new construction claims in sampled §§0.2, 1.2, 2.1, 3.2, 6.5 and 8.1–8.6 are not all traceable to exact primary-source locators. The suppliers were read at the named sections and provide the inputs recorded above; this does not verify a new theorem against a source that is never identified. R10 states the repair. In particular no claim is made that checking the n=3,4,5 recursion examples certifies the full singular-map descendant/ancestor comparison.
- Both works actually listed in References were obtained from their specified arXiv versions through the sources service. No cited text was inaccessible or paywalled; no additional missing-text request was necessary. There is no sources.toml in this folder, and this review was instructed not to edit a manifest.
- Ownership against open work without supplied files was not independently checked. Indexed search hits are not a review of those files. The principal relevant open suppliers and neighbouring owners supplied in the brief were inspected as recorded above.

## Source issues

- **Error** in KM1994 at §2.2.5, equation (2.9), printed p. 6, lines 210–215: the source says the genus-one constant unit coefficient is the holomorphic Euler characteristic; it should be the topological Euler characteristic, already giving two rather than one for ℂP¹; affects a stated result.
- **Misprint** in KM1994 at §2.4.5, printed p. 10, line 411: the source says the constant-map obstruction sheaf is on genus-zero moduli with arbitrary class; it should be on the genus-g degree-zero moduli under discussion; affects nothing.
