# Review of VonNeumannAlgebras (pull request #889 at 87aeca1)

**Verdict:** needs changes

## R01 (P1) — Reciprocal supply prevents a single merge order

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:62`, `:80`, `:1277`, `:2130`. The scope calls these “milestone dependencies”.

**Claim:** Milestone interleaving does not meet the single-direction contract between roadmaps. Both directions below are explicit.

| This folder consumes | The supplier consumes back | Verifiable witness |
| --- | --- | --- |
| OperatorTheory/SelfAdjointSpectralTheory SA-B85–86, README:83, :408, :754 | V4.0.Fields | Main `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:690`, :705 |
| CStarAlgebras C5, README:64, :2533 | V0–V4 and V13a | Supplied CStarAlgebras head, `TauCetiRoadmap/CStarAlgebras/README.md:41`, :467, :499 |
| OperatorAlgebraDynamics D1, README:1277 | V0–V4, V8 and V11 | Main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:46`, :158, :257 |
| BanachAlgebras A7 Fourier uniqueness, README:2186 | V11's closed double-dual embedding | Main `TauCetiRoadmap/BanachAlgebras/README.md:997`, :1004, :1021 |

**Witness:** Each row gives both directions of a two-roadmap cycle. For example, Fields → SA-B85 → V4.0.Decomposition cannot determine an order of the two folders containing those three milestones.

**Repair:** Move the shared foundation prefix before its consumers and applications into a subsequent Part II. Move the LCA closed-embedding prerequisite to the earlier harmonic-analysis owner; repoint reciprocal contracts in the affected packages. Preserve the full theorems. Recheck that each row has one direction: renaming milestones or moving this unsplit folder leaves both arrows intact.

## R02 (P1) — B1 does not supply the claimed operator-topology API on main

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:200`: “generic SOT/WOT sequence boundedness and norm-bounded product continuity”.

**Claim:** V1 consumes these results and the Hilbert matrix-coefficient comparison as existing BanachSpaceTheory B1 work.

**Witness:** Main `TauCetiRoadmap/BanachSpaceTheory/README.md:41`–`:72` specifies annihilators, quotient duals, adjoints, Goldstine and weak/weak-star topology. It has no SOT/WOT block. The supplied open revision adds that block at :80–:95.

**Repair:** Keep B1 for its actual duality results. Own the missing adapters here using native pointwise/WOT carriers and uniform boundedness, or cite an admissible earlier Part II. An open revision cannot supply them. Test rank-one projections onto eₙ: WOT/SOT limits 0, norms 1, no norm convergence.

## R03 (P1) — The finite Gleason prerequisite has no admissible owner

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:2400`, :2410, :2445, :2914: “consume QuantumFoundations QF2.Frame”.

**Claim:** The scalar extension proof imports a finite-dimensional Gleason theorem; the Dye boundary example imports QF2.ElementaryBloch. The secondary contracts call these existing owner results.

**Witness:** `roadmaps show QuantumFoundations` reports no such roadmap on main or in an open roadmap pull request. The board/package-name search also found none. No matching declared gap exists. The duplicated contract inside this README is not a supplier.

**Repair:** Own the finite frame prerequisite before Scalar and the Bloch calculation, or name an actual admissible supplier. Remove the fictitious claims/duplicate contracts. Test the signed reduction in dimension 3: f(v)=|v₁|²−1/2, add 1/2, apply finite Gleason, then subtract (1/2)I to recover diag(1/2,−1/2,−1/2). Restating finite Gleason does not supply it.

## R04 (P2) — `generated` contains an admitted structure field

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:57`–`:62`: `centralizer_centralizer' := by sorry`.

**Claim:** A von Neumann algebra is constructed with an admitted proof of its defining field. This fails the binding no-sorry-in-def rule and the worker's `sorry-data` check, even though the underlying centralizer construction is mathematically valid.

**Witness:** The admission is in a `def`, and no retained theorem in this file mentions `generated`. Mathlib's concrete structure requires the double-centralizer equality in `Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:70`.

**Repair:** Delete this unused definition; keep generation/leastness in the README. If a headline needs it, give an admission-free body. Controls: the empty set generates ℂI; {e₁₂} with star closure generates M₂.

## R05 (P2) — Statable density headlines are absent from the acceptance module

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:226`, :264; `Suggested.lean:65`; `ProjectionClosureTargets.lean:34`.

**Claim:** Suggested omits Kaplansky density. Its projection-closure headline appears only in a separate module, outside the acceptance build.

**Witness:** A scratch statement of the closed-unit-ball Kaplansky theorem elaborated with only `import Mathlib`, `StarSubalgebra`, double centralizers and `ContinuousLinearMap.toPointwiseConvergenceCLM`. The existing companion projection-closure statement also elaborates. Neither needs an invented carrier.

**Repair:** State both headlines in Suggested, moving projection closure there. Keep its infinite-dimensional hypothesis. Controls: the unit balls of ℂI and (ℂI)″ coincide; in H=ℂ, 1/2 is a positive contraction but not a projection limit.

## R06 (P2) — A diagonal example substitutes for the finite complex-time headline

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/FiniteComplexModularTargets.lean:5`, :16, :34; README:1478–:1517.

**Claim:** The README promises arbitrary finite-block densities, coordinate independence and GNS conjugation. Lean gives only a diagonal single-block convention test.

**Witness:** For h=[[1/2,1/6],[1/6,1/2]], Tr(h)=1 and spec(h)={2/3,1/3}. β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]]. This input to the README theorem is outside the Lean signature, despite using ordinary finite matrices.

**Repair:** Keep diagonal tests in the README. State the general finite-matrix theorem on native carriers, including coordinate transport and blockwise centrality. Name unavailable finite-GNS comparisons and missing carriers in the docstring. The rotated h must be an input; central h must give β_z=id for all z.

## R07 (P3) — API and boundary tests pad the Lean acceptance files

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:45`, :108; `ProjectionClosureTargets.lean:41`; unused definitions at Suggested:29, :84, :90, :97.

**Claim:** Symmetry, range commutation and the finite-dimensional boundary case are API/Check material. IsFactor, IsTracial, IsTracialWeight and IsKMS support no retained headline.

**Witness:** Symmetry uses v* in place of v: e₂₁ implements e₁₁∼e₂₂ and e₁₂ reverses it. The range conclusion even holds for u=2I, where uu*=4I commutes but u is not isometric. In dimension 1 the closed projection set is {0,1}.

**Repair:** Delete the padding from `Suggested.lean` and the companion boundary theorem; retain README statements/Checks. Delete unused definitions. Do not prove padding in place. All 11 theorems were tried with `simp`; none closed. This finding concerns their API/boundary role.

## R08 (P3) — All three Lean files violate the import contract

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:5`, `FiniteComplexModularTargets.lean:1`, `ProjectionClosureTargets.lean:1`.

**Claim:** Each imports individual Mathlib submodules and omits the required single `import Mathlib`.

**Witness:** The worker reports `imports=1`, `mathlib-subimports=7`, `no-import-mathlib=1` for Suggested. The other files have respectively two and three Mathlib subimports.

**Repair:** Replace each Mathlib import block with the single allowed import. The scratch Kaplansky statement already elaborated under that import. Re-elaborate the acceptance module after consolidating its headlines.

## R09 (P3) — Ten supplier links freeze roadmap work at commits

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:52`, :63, :64, :67, :80, :83, :200, :2130, :2155, :2599.

**Claim:** These are commit-pinned links into the roadmap repository, rather than live owner/section citations. This is distinct from permissible pinned library citations.

**Witness:** The worker reports `blob=10`; the B1 link at :200 illustrates why a historical revision cannot establish the contract on main (R02).

**Repair:** Cite roadmap names and exact sections with repository-relative or main links, after resolving R01–R03. Check each destination again; replacing the URL without correcting a missing contract is insufficient.

## R10 (P3) — TeX subscript syntax remains outside a code span

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:188`: `ℕ_{≥1}`.

**Claim/Witness:** The worker reports `tex=1`; the prose embeds TeX-only subscript syntax.

**Repair:** Write “the positive natural numbers” or put the expression in an inline code span. The intended evaluations remain f(1), f(1/2), f(1/3), so the repair does not change the example's index set.

## R11 (P3) — The reference section contains pull-request numbers

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:3003`, :3007, :3010.

**Claim/Witness:** Three upstream PR-number references fail `prnum=3`. In particular, :3009–:3012 mention declarations absent at these pins; they are described as upstream design material, not implemented suppliers.

**Repair:** Replace the process references with timeless mathematical targets and exact pinned declarations where available. Keep the missing density/Hilbert–Schmidt work with its actual owner. Do not relabel `Module.Dual.eq_trace_mul_weight`, `LinearMap.hilbertSchmidtCore` or `LinearMap.Norms.HilbertSchmidt` as pinned APIs: object/name searches found none.

## R12 (P3) — Four HTML anchors fail the residue rule

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:225`, :689, :2912, :2933.

**Claim/Witness:** All four are explicit `<a id=…>` tags; the worker reports `residue=4`.

**Repair:** Use the required ordinary subsection headings and update internal fragment links. Delete the fictitious secondary supplier blocks as part of R03 rather than preserving their anchors.

## R13 (P3) — Definitions and dependencies are not presented in roadmap form

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:1`, :124, :784, :991, :2368.

**Claim:** Missing are the prescribed title/Summary, scope, supplier-contract/build-order sections, layer Examples/Dependencies, item-level Needs, and three discriminating Checks per definition.

**Witness:** There are zero `*Needs:*` lines and zero `**Checks.**` blocks. For example, V7's normal-module definition at :993 has no three-item Check list; V12.J.Maps at :2368 bundles many API requirements into one paragraph.

**Repair:** Restructure without thinning: give APIs, three Checks per definition, exact hypotheses/locators and individual Needs. Module controls: zero, defining M₂-module (dimension 1/2), uncountable scalar module (dimension ∞, no countable embedding). Jordan controls: identity, transpose, zero nonunital map.

## R14 (P3) — The sampled targets lack exact source locators

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/README.md:608`, :721, :954, :993, :1113, :1244, :1256, :1306, :1478, :1624, :1696, :2368, :2418, :2423, :2951.

**Claim:** Broad chapter links lack theorem/page locators for sampled assertions and adapters. The source-ledger path at :3036 does not exist.

**Witness:** V12.J.Dye has no theorem/page citation; its linked comparison does contain Theorem 4.3, preprint p.14 (`hamhalter2014 line 627`). V4.PositivePredual can cite Peterson Theorem 4.3.3, p.62, and Corollary 4.3.4, p.63 (`peterson2013 line 2436`, line 2462).

**Repair:** Add theorem/page locators, distinguish source theorems from new adapters, and record availability. The finite-adele corner is Laca Proposition 3.2.1, preprint p.9 (`laca1999 line 407`); correct the attribution. Replace the nonexistent ledger. Keep the I₂ exclusion and intended generality; do not narrow to fit a source.

## R15 (P3) — The Lean namespace and documentation do not identify the headline test

**Location:** `TauCetiRoadmap/VonNeumannAlgebras/Suggested.lean:13`, :24, :79; `FiniteComplexModularTargets.lean:4`, :26; `ProjectionClosureTargets.lean:5`.

**Claim:** Suggested uses the library namespace, omits the unavailable-headline/carrier inventory and layer comments, and lacks some declaration docstrings. README and Lean names are not synchronized.

**Witness:** Suggested:79 and FiniteComplexModularTargets:26 have no declaration docstring. Suggested's generic sentence about unavailable APIs names neither Tomita–Takesaki, continuous cores, nor the classification headlines or the carriers each lacks.

**Repair:** Use `TauCetiRoadmap.VonNeumannAlgebras`, target-signatures module/layer documentation and declaration docstrings. State expressible headlines; name the missing carriers for others. Synchronize retained Lean names with the README.

## Verified sound

**Scope.** Read all 3,036 README lines and 215 Lean lines, normative README/CONTRIBUTING, and main BanachSpaceTheory, OperatorTheory and OperatorAlgebraDynamics material. Verified head and empty outside-folder diff; changed no repository file. No algorithm target, `set_option`, admitted example, stray file, copied source passage or re-planned main VonNeumannAlgebras roadmap was established.

Gate output:

```text
gate VonNeumannAlgebras: set_option=0 blob=10 latex=0 tex=1 prnum=3 sorry-data=1 sorry-examples=0 residue=4 private-paths=0 imports=1 mathlib-subimports=7 no-import-mathlib=1 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

Every nonzero failing rule is covered by R04 and R08–R12. The worker's targeted build passed. Independently, `lake env lean` on Suggested passed with seven `sorry` warnings only. Scratch copies with `#check @name` for all 15 Suggested declarations, four finite-complex declarations and three projection-closure declarations also passed: **22 signatures checked, no dropped binder found**. The Hilbert completeness assumptions, projection theorem's infinite-dimensional hypothesis, diagonal theorem's strict positivity, and dense-subgroup theorem's Haar/regularity/countability assumptions remain in the elaborated types. No signature was repaired in this read-only review. Separate `simp` probes failed to close all **11** admitted theorem bodies; the admitted field in `generated` was not counted as a theorem.

The requested movable dependency command returned, verbatim:

```text
depcheck: 161 roadmaps, 1141 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. This is the mechanical result, not evidence against the explicit reciprocal contracts in R01. No `*Needs:*` lines existed to check; all supply prose was read instead.

**Headline inventory and Lean coverage.** Present: bicommutant, projection Schroeder–Bernstein, cyclic/separating equivalence and dense translations. Projection closure appears only in a companion; Kaplansky is absent (R05). The finite complex-time companion covers only diagonal densities (R06).

Other README headlines, absent from the acceptance module: V0 faithful/separable Gelfand–Naimark; V2 completed tensor/L² comparisons and abelian classification; V3 type-I decomposition; V4 predual, normality and central decomposition; V5 comparison/trace theory; V6 standard form, semifinite and lattice-type classification; V7 arbitrary-cardinality dimension/index; V8 group/subgroup, compact ergodic-action trace/SU(2) and Bernoulli models; V9 formal-degree/covolume; V10 affiliation, Tomita–Takesaki, finite complex-time/GNS, KMS and affine type III; V11 weights, spatial derivatives, cocycles, cores/duality, Connes invariants/flows; V12 two projections, ultrapowers/central sequences, scalar Gleason and Dye/enriched Jordan reconstruction; V13 CP extension, injectivity⇔semidiscreteness, AFD and II₁/IIIλ/III₀/III₁ classification. R15 requires a precise missing-carrier inventory; R05–R06 establish avoidable omissions/substitution.

**Pinned object audit:** 19 groups. Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths are library-relative.

| Object and pinned location | What is already provided; what is additional here |
| --- | --- |
| `Mathlib/Analysis/VonNeumannAlgebra/Basic.lean:45`, :67, :118, :123, :157 | WStarAlgebra has a Banach predual witness; concrete VonNeumannAlgebra is a star subalgebra with a double-centralizer field. It does not include nonzero identity or a chosen faithful state. Commutants and projection membership are native; concrete/abstract/topological comparisons remain additional. |
| `Mathlib/Algebra/Star/Subalgebra.lean:312`, :317, :332 | Star centralizers include adjoints; the double-centralizer comparison is native. Generation must respect this, rather than centralizing a non-star-closed generating set just twice without the star closure. |
| `Mathlib/Analysis/InnerProductSpace/WeakOperatorTopology.lean:38`, :47, :71, :83 | Matrix-coefficient extensionality, convergence/continuity and adjoint on the WOT copy exist. Ultraweak/ultrastrong extensions are separate work. |
| `Mathlib/Topology/Algebra/Module/Spaces/PointwiseConvergenceCLM.lean:60`, :124, :155 | Pointwise topology, evaluations and the norm-to-pointwise map exist; sufficient to state Kaplansky on native operators. |
| `Mathlib/Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:147`, :196, :246 | PositiveLinearMap's GNS construction and nonunital/unital representations exist. The requested cyclic-vector, faithfulness and normality comparisons are not the same declarations. |
| `Mathlib/Analysis/CStarAlgebra/PositiveLinearMap.lean:62` | Positive functionals are norm bounded; reuse their native continuous-map interface. |
| `Mathlib/Analysis/LocallyConvex/WeakDual.lean:184`, :193; `SeparatingDual.lean:88` | Weak-dual continuous functionals and the right-dual equivalence/separation are supplied. This is not a chosen W*-predual or its positivity theorem. |
| `Mathlib/Analysis/InnerProductSpace/TensorProduct.lean:685` | Tensor-map adjoints exist with the stated complete-space hypotheses. The completed Hilbert tensor and arbitrary-measure comparison require additional construction. |
| `Mathlib/MeasureTheory/Constructions/Pi.lean:75`, :105, :210, :290 | Finite-product outer measure/Carathéodory construction exists; the convenient rectangle theorem has SigmaFinite premises. V2 explicitly distinguishes its all-measure maximal-product proof from native bind product. |
| `Mathlib/Probability/ProductMeasure.lean:384`, :401, :494; `Probability/Independence/InfinitePi.lean:124` | Infinite product uniqueness, cylinder values, reindexing and independence exist. Joint measurability and the arbitrary-group Bernoulli action are additional. |
| `Mathlib/Dynamics/Ergodic/Action/OfMinimal.lean:44`, :56 | The existing invariant-function result assumes finite measure. It does not discharge the noncompact Haar theorem. |
| `Mathlib/Algebra/Symmetrized.lean:42`, :165, :171; `Algebra/Jordan/Basic.lean:90` | SymAlg and the symmetrized product/Jordan identity exist; division by 2 requires its invertible instance. They do not bundle normal Jordan *-maps or prove Dye. |
| `TauCeti/MeasureTheory/Function/StronglyMeasurable/InnerRegular.lean:50`, :85 | Continuous-on-finite-measure and finite-strong-measurability adapters require the stated regularity/Borel/R1 and target hypotheses. V8 names those requirements rather than inventing global separability. |
| `TauCeti/RepresentationTheory/Continuous/Integrated/Basic.lean:141`, :172, :188 | Integrated operator and vector/norm formulas. The definition permits noncommutative AddGroup; additional convolution assumptions are not inherited by the definition. |
| `TauCeti/Analysis/Semigroups/Group/Stone/Unbounded.lean:69`, :106, :115 | Stone existence, uniqueness and the characterization are implemented. Modular groups still require their modular construction. |
| `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:87`, :90, :237, :288, :303 | Nonnegative residue-class von Mangoldt coefficients, half-plane series identity and continuous boundary remainder. The reduced-class hypothesis matters. |
| `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301` | Nonnegative coefficients, LSeriesHasSum for Re(s)>1, continuous remainder on Re(s)≥1 and residue yield a normalized partial-sum limit. V10 uses, rather than replans, this theorem. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/HigherPrimePowers.lean:316`, :372 | Higher-prime-power bound and a dominated-weight little-o theorem, with number-field/norm hypotheses. The rational-prime adapter is additional. |
| `TauCeti/NumberTheory/ArithmeticDirichletSeries/Transfer.lean:110`, :140 | Abel transfer and prime-count asymptotic with nonzero density. In V10, 1/ϕ(d)>0 for d≥1 supplies it. |

**Resolved ownership.** `roadmaps grep`/`show`, main, supplied sibling heads and board packages were searched by object: fields/representations, CP/Jordan maps, products, Haar, primes and closed operators. These 12 owner groups were opened. Revisions were not used as suppliers; no name collision was established in admissible copies. Unprovided open-head files were not inspected.

| Owner/source of contract | Resolution |
| --- | --- |
| Main OperatorTheory and its OrthogonalGeometry, PolarDecomposition, SelfAdjointSpectralTheory and OperatorIdeals subroadmaps | Generic operator theory belongs there; SA-B85 creates R01. Supplied UnboundedOperators README:31–:32 consumes V10 and owns the comparison, not a replacement foundation. |
| Main BanachSpaceTheory B1/B2/B4/B5 | Annihilators at README:41, Krein–Šmulian/James at :74, Banach tensors and Riesz work are real contracts. The operator-topology addition is not on main: R02. |
| Supplied CStarAlgebras C1–C6 | README:41–:54 assigns W*/CP foundations here. C1/C5 targets exist; reciprocal supply requires R01. |
| Main BanachAlgebras A3/A7 | Unitization-character comparison at README:449; early regular L² model at :935; Fourier uniqueness at :997. The last consumes V11, hence R01. |
| Main OperatorAlgebraDynamics D1/D4/D5 | D1 regular covariant representations at README:112; VNA comparison at :158; LCA duality at :257; direct-integral input at :316. R01. |
| Main AmenableGroups Layer 7, items 1–2 | README:415, :438, :470 provides arbitrary-LCH Haar/convolution interfaces; invariant means and Følner theory are also owned there. |
| Main RepresentationTheory/CompactGroups, Layers 3–5 and SU(2) | Schur orthogonality, Peter–Weyl and SU(2) irreducibles are named existing targets (README:481–:484). V8's ergodic operator-algebra trace/classification is additional. |
| Main GlobalNumberFields Layer 4 | README:412–:416 supplies finite adeles, integral subrings, local compactness and diagonal embeddings. The explicit rational finite-adele Hecke corner is a V10 adapter. |
| Main OptimalTransport Layers 2 and 8 item 2 | Analytic-set completion measurability at README:458; Jankov–von Neumann uniformization at :1004. VNA explicitly owns Lusin–Novikov separately. |
| Main ModularForms Layer 2 | README:200–:203 names the shared Hecke carrier/convolution; V10 preserves the product and constructs its operator realizations. |
| Completed ArithmeticDirichletSeries Layer 9 | README:337 identifies Wiener–Ikehara; implemented versions were checked at the Tau Ceti pin above. |
| Completed OneParameterSemigroups | Generator/resolvent ownership is real. The link at VNA README:45 still points to its former active-folder location; use `Completed/OneParameterSemigroups/README.md` when repairing supplier links. |

QuantumFoundations remains unresolved; no gap is declared. Later Subfactors/FactorRigidity/NoncommutativeIntegration consumers were not used as suppliers.

**Seeded source verification.** All 15 targets were followed; no README locator is labelled unverified. Source-service texts and versions are identified below. A verified comparison theorem does not supply a missing README locator.

| Seeded target | Text, locator, hypotheses and outcome |
| --- | --- |
| Weak limits of projections | Companion cites typed physical p.13, while README links Jones chapters 2–16. Both legal Jones URLs returned 404. Not source-certified; dilation and finite-dimensional obstruction computed below. |
| V4.PositivePredual | Peterson Theorem 4.3.3, printed p.62, proof p.63 (`peterson2013 line 2436`, line 2451), and Corollary 4.3.4, p.63 (line 2462). Normal Hermitian functionals have a norm-additive positive decomposition; complex positive spanning follows. No finite/separable assumption. Supports the target. |
| V4.0.Fields | Takesaki I IV.8 and Jones were attempted; book uncertified, notes unavailable. No exact locator for all rectangular-field/change-of-measure/fundamental-family adapters was supplied. Not source-certified. |
| V6.LatticeTypes | No exact theorem/page at target; Jones unavailable. The stated finite/type-II/type-III and nonfactor distinctions pass the explicit models below. This is not verification of all cardinal homogeneous-type claims against a source. |
| V7.StandardAmplifications | Peterson Theorem 4.5.1, printed p.66 (`peterson2013 line 2594`) concerns faithful representation amplifications, but has a finite-dimensional defect noted under Source issues. V7 instead uses arbitrary cyclic sums and I×ℕ and does not copy that false finite formula. The complete stated adapter has no exact source locator. |
| V7.SumsAndCorners | Jones unavailable; general set-indexed dimension and corner laws have no exact locator at target. Finite/zero/uncountable examples below pass; full source verification unavailable. |
| V8.SubgroupCosets | No theorem/page at target. Direct finite S₃ and infinite ℤ computations support the distinction between algebraic and L² expansions. Not source-certified at its claimed generality. |
| V8.LCHRegularNormalBridge | Native measurability/integrated-operator inputs were opened at their pins. The combined arbitrary-LCH bridge is stated as owned proof work, but no precise external theorem locator certifies the entire bridge. It is not justified merely by a second-countable source. |
| V8.BernoulliArbitraryDiscrete | Native product-cylinder/reindexing/independence theorems above verified with their actual hypotheses. Arbitrary-cardinality shift/freeness/ergodicity are additional targets; finite-cylinder and torsion tests below pass. No exact external locator for the full extension. |
| V10.FiniteComplexPowers | Jones exercise unavailable. Finite spectral and matrix-unit calculations confirm the sign and central-state exception. No source theorem/page was supplied for the corrected full theorem. |
| V10.AffineHecke | Laca, arXiv math/9911135v1, Proposition 3.2.1, p.9 (`laca1999 line 407`), Corollary 3.2.2, p.10 (line 420): full finite-adele corner. Neshveyev, math/0002141v1, p.1 (`neshveyev2002 line 28`), Proposition p.2 (line 55), and p.4 (line 141): scaling model/ergodicity and type-III₁ endpoint for 0<β≤1. These do not by themselves verify every new Hecke basis identification. |
| V10.AffineAP | Pinned coefficient/boundary, Wiener–Ikehara, prime-power-removal and Abel-transfer declarations opened as above. Positive residue and modulus assumptions agree. The prime-pair block estimate is owned here, not claimed as a library theorem. |
| V12.J.Maps | Hamhalter arXiv 1408.4597v1, preliminaries p.5 (`hamhalter2014 line 202`) matches linear/star/self-adjoint-square preservation; Proposition 4.1 p.13 (line 592) gives the projection-preserving bounded-linear criterion. The whole normal-map API is further work; no single source theorem is claimed to provide it all. |
| V12.J.Dye lattice input | Earlier V6 target exists and is independent of Scalar/Dye in its statement. No exact external locator for its full center/I₂/cardinal transport theorem. In particular it cannot cite Dye itself as its proof input. |
| V12.J.Dye | Hamhalter Theorem 4.3, preprint p.14 (`hamhalter2014 line 627`), assumes no type-I₂ summand only in the source algebra. Orthogonality is bidirectional (line 621). Jordan extension agrees; normality/uniqueness use preservation of projection suprema and norm spectral approximation. Bunce–Wright Theorem A/B, preprint p.2 (`bunce-wright1992 line 53`) supports the scalar extension with boundedness from its definition. The primary Dye paper was not legally readable; published numbering was not assumed from the preprint. |

Supplementary checks: Hiai v1 Proposition 13.6, p.134 (`hiai2020 line 6778`), Proposition 13.16, p.140 (line 7047), and Theorem 13.17/Remark 13.18, p.141 (line 7080, line 7109), support V11's faithful-reference and supported-power distinctions. Haagerup v1 Theorem 2.4, p.5 (`haagerup2016 line 222`), and Theorem 5.1, p.17 (line 868), retain separability in state homogeneity/III₁ uniqueness, as does the README.

**Computed adversarial sample: 131 of 165 reviewed rows shown.** These retain the 22 Lean declaration checks, all 15 seeded targets and headline families. Supplementary per-target rows are omitted for length. Values and negative controls are computations, not general proofs; “retain” means this test found no correction. Finite models do not certify unreadable proofs or arbitrary-cardinal classification.

| Statement | Instances tried | Values on the two sides / wrong model | Result and change |
| --- | --- | --- | --- |
| V0 faithful representation | M₂, defining representation | e₁₂e₂₁=e₁₁≠0 before and after representation | Faithful, noncommutative test; retain. |
| V0.SeparableFaithful series | A=ℂ, every φₙ=id | Σₙ2^(−n−1)=1; ψ(1)=1 | Correct normalization; retain. |
| V0 zero/nonzero ℓ² refinement | A=0; A=ℂ | Zero action on 0 has dense orbit {0}; on ℓ² closure {0}≠ℓ² | Zero case correctly separated. |
| V0 support example on ℓ² | f(t)=t; diagonal f(1/n) | Entries 1,1/2,1/3; kernel 0; range dense but not closed | Inverse entries n unbounded; retain; R10 typography only. |
| V1 SOT/WOT versus norm | Pₙ=eₙeₙ* on ℓ² | Pₙξ→0; coefficients→0; ‖Pₙ‖=1 | Retain mathematics; R02 missing supplier. |
| V1 bounded-product qualification | Sₙ=e₁eₙ*, Tₙ=eₙe₁* | Both WOT→0; SₙTₙ=e₁₁≠0 | Does not assert joint WOT multiplication; topology distinctions essential. |
| V1 bicommutant headline / Lean :65 | Scalar algebra and full M₂ | (ℂI)′=M₂, (ℂI)″=ℂI; M₂′=ℂI, M₂″=M₂ | Both WOT closed; both iff directions agree. |
| V1 Kaplansky headline | A=ℂI⊂M₂ | Both unit balls={cI:∣c∣≤1}; closure equal | Native statement compiled; add headline, R05. |
| Weak projection limits / finite-coefficient theorem | Compression C=1/4 on a line | P=[[1/4,√3/4],[√3/4,3/4]]; P²=P; P₁₁=C | Finite matching is exact; retain full infinite-H theorem. |
| Weak projection limits / WOT closure theorem | Infinite H, A=(1/2)I | Each finite compression matched; limit coefficient ⟨y,Ax⟩=⟨y,x⟩/2 | Positive contraction limit; move headline, R05. |
| Projection-closure finite-dimensional boundary | H=ℂ and H=0 | Projection sets {0,1} and {0}; 1/2 has square 1/4≠1/2 | Correct boundary, but padding; R07. |
| `generated` | Empty set; {e₁₂}⊂M₂ | Generated algebras ℂI and M₂ after adjoining e₂₁ | Intended mathematics sound; admitted unused def removed, R04. |
| V2.RectangularL2 rectangle norm | μ(A)=2, ν(B)=3 | ‖1_A⊗1_B‖²=6=κ(A×B) | Correct maximal-product convention. |
| V2.RectangularL2 null factor | μ(A)=∞, ν(B)=0 | κ(A×B)=∞·0=0; L² vector=0 | ENNReal zero convention respected. |
| V2 two product measures | μ=ν=∞·Lebesgue on [0,1], diagonal D | Maximal rectangle-cover κ(D)=∞; bind product(D)=0 | Explicitly distinguished; retain. |
| V2 abelian spectral representation | Diagonal ℂ² on ℂ² | Multipliers (a,b); norm=max(∣a∣,∣b∣); commutant diagonal | Multiplicity-one MASA case passes. |
| V3 finite-dimensional decomposition | ℂ⊕M₂ | Algebra dimension 1+4=5; center dimension 2 | Blocks, not one full matrix algebra; retain. |
| `IsFactor` | M₂; ℂ⊕ℂ; zero H | True; false (center dimension 2); false (I=0) | Nonzero condition retained; unused acceptance def, R07. |
| `ProjectionEquivalent` | p=e₁₁,q=e₂₂,v=e₂₁ | v*v=p, vv*=q; p≠q | Correct initial/final direction. |
| `ProjectionSubequivalent` | M₂, p=e₁₁,q=I | p≼I true; I≼p false (ranks 2>1) | Order direction correct. |
| `ProjectionEquivalent.symm` | Same p,q | v*=e₁₂ has initial q, final p | Correct elementary API; delete padding, R07. |
| Projection Schroeder–Bernstein headline | Infinite projection I and proper infinite tail q | I≼q and q≼I true; I∼q true; I=q false | Equivalence, not equality, is the right conclusion. |
| `IsCyclic` | M₂ on ℂ², ξ=e₁; ξ=0 | Orbit=M₂e₁=ℂ²; zero orbit={0} | True/false discriminate the definition. |
| `IsSeparating` | Scalar algebra on ℂ², ξ=e₁; ξ=0 | cξ=0 forces c=0; for ξ=0 every c annihilates | True/false; retain if headline needs it. |
| Cyclic/separating headline | M₂ on ℂ²; H=0 | e₁ cyclic for M₂ and separating for ℂI; zero-space both true | Iff tested both directions, zero case included. |
| V4 concrete predual | M₂, pairing Tr(hx) | h=diag(2,−1) has functional norm 3 | Trace-class norm agrees; no spurious Hilbert norm √5. |
| V4.PositivePredual decomposition | h=diag(2,−1) | h₊=diag(2,0), h₋=diag(0,1); masses 2+1=3 | Exact base norm, not only an upper bound. |
| V4.PositivePredual spanning | φ with imaginary density i e₁₁ | φ=iψ, ψ positive with ψ(I)=1 | Real positive differences alone would miss φ. |
| V4 normality via projection sums | ℓ∞, weights 2^(−n−1) | φ(Σeₙ)=1=Σφ(eₙ) | Arbitrary-sum normality has correct normalization. |
| V4.0.Fields diagonal criterion | Two atoms, one-dimensional fibres | Commutant of diag(a,b) is diag(c,d); off-diagonal e₁₂ fails | Tests decomposability and non-example. |
| V4.0.Fields change of measure | μ=(1,4), ν=(4,1), f=(2,1) | RN multiplier=(1/2,2); norms² 8=4·1²+1·2² | Correct square-root direction. |
| V4.0.Fields zero extension | μ=(1,0), λ=(1,1) | Transported fibre dimensions (1,0); both direct-integral norms²=∣f₁∣² | No inverse division on the zero-density fibre. |
| V4.0.Fields rectangular/unitary API | Fibre maps (2,1/2); then (1,−1) | Norm=max=2, not unitary; second has U*U=I | Essential-supremum and unitarity criteria discriminate. |
| V4.0 central decomposition | ℂ⊕M₂ | Central projections (1,0),(0,I); fibres ℂ,M₂ | Center has two atoms; reconstruction direct sum. |
| V5 finite-factor trace/comparison | M₂, ranks 1 and 2 | τ(p)=1/2<1=τ(I); p≺I | Trace comparison agrees with subequivalence. |
| V5.LatticeFinite | M₂ and B(ℓ²) | Unit finite/modular in M₂; infinite/nonmodular in B(ℓ²) | Finite-dimensionality is not the definition of finite. |
| `IsTracial` | τ=Tr/2; φ=Tr(diag(2/3,1/3)·) | τ(e₁₂e₂₁)=τ(e₂₁e₁₂)=1/2; φ values 2/3≠1/3 | Definition discriminates; unused in acceptance, R07. |
| `IsTracialWeight` | Tr on M₂; standard trace on B(ℓ²) | T(I₂)=2; T(I∞)=∞; T(0)=0 and 0·∞=0 | Extended values necessary; no normality built into this predicate. |
| V6 standard form | M₂, Hilbert–Schmidt model | L_a*=L_(a*); Jx=x*; JL_aJ=R_(a*) | Left/right and conjugation conventions agree. |
| V6 semifinite product trace | e₁₁⊗finite-rank q, rank q=3 | (τ⊗Tr)(e₁₁⊗q)=3/2 | Unnormalized B(ℓ²) trace essential. |
| V6.LatticeTypes Boolean interval | p rank 1 versus I in M₂ | [0,p]={0,p} Boolean; full projection lattice not Boolean | Abelian corner, not global abelianness. |
| V6.LatticeTypes atom criterion | M₂ versus ℂ⊕R | Both have atoms; only M₂ is a type-I factor | Factor hypothesis and nonfactor warning necessary. |
| V6.LatticeTypes II₁ | R | No atoms; every interval modular; unit finite | Matches II₁ criterion. |
| V6.LatticeTypes II∞ | R⊗B(ℓ²) | No atoms; whole lattice nonmodular; 1⊗e₁₁ interval modular | Separates II∞ from III. |
| V6.LatticeTypes III | Type-III factor, nonzero p | No nonzero finite p; every nonzero interval nonmodular | No finite corner accidentally admitted. |
| V6.LatticeTypes I₂ central detection | M₂⊕ℂ | z=(I₂,0) splits into two full-support abelian projections; scalar part cannot | Supremum of I₂ parts=z. |
| V6.LatticeTypes mixed central formulas | R⊕B(ℓ²)⊕M_III | z_I=(0,1,0), z_sf=(1,1,0), z_fin=(1,0,0) | Formulas yield II₁=(1,0,0), III=(0,0,1). |
| V7.StandardAmplifications zero | H=0,J=∅ | S_J=0; range projection 0; trace 0 | Zero module included without a unit vector. |
| V7.StandardAmplifications defining module | N=M₂,H=ℂ² | Isometry ξ↦√2 ξe₁* into L²(M₂); norm²=‖ξ‖² | Scaling √2 required for normalized trace. |
| V7 arbitrary cardinality | N=ℂ,H=ℓ²(I), I uncountable | Basis size=∣I∣; no countable amplification contains H | Set-indexed J required; no separability shortcut. |
| `range_projection_mem_commutant` | π=id,u=I; also u=2I | uu*=I or 4I, commutators 0 in both cases | Isometry unused for this conclusion; API padding, R07. |
| V7.AmplificationTrace | Finite J with ∣J∣=3; empty J | Trace of identity=3; empty=0 | Counts coordinates without normalized matrix trace. |
| V7.Dimension | N=M₂, H=ℂ² and L²(N) | Dimensions 1/2 and 1 | Distinguishes coupling dimension from complex vector dimension. |
| V7 embedding independence | Add one zero amplification coordinate | Tr(diag(P,0))=Tr(P)+0 | Same dimension; padding index set cannot rescale it. |
| V7.SumsAndCorners sum law | Two copies of defining M₂ module | 1/2+1/2=1 | Correct additive convention. |
| V7.SumsAndCorners corner law | p=e₁₁,H=ℂ² over M₂ | dim_(pNp)(pH)=1=(1/2)/(1/2) | Divide by τ(p), not multiply. |
| V7 nonzero-corner hypothesis | p=0 | τ(p)=0; expression dim(H)/τ(p) not a corner formula | Zero explicitly excluded from division. |
| V7 scalar ∞ is not cardinal classification | N=ℂ, dimensions ℵ₀ and ℵ₁ | Extended dimension both ∞; Hilbert spaces not unitary equivalent | README correctly retains cardinal data. |
| V7.Index | ℂ⊂M₂; identity inclusion | dim_ℂ L²(M₂)=4; dim_N L²(N)=1 | Correct index normalization. |
| V8 group-factor criterion | Γ=S₃, ℤ, {1} | Centers dimensions 3, infinite, 1 respectively | Nonabelian alone does not imply factor; trivial factor is ℂ. |
| V8.SubgroupCosets finite algebraic expansion | S₃, H=⟨(12)⟩, index 3 | For u_hu_(g_j), exactly j coefficient=u_h; sum recovers basis element | Non-normal subgroup tests left-coset convention. |
| V8.SubgroupCosets infinite completion | H={1}, Γ=ℤ, f=Σₙ≥₁2⁻ⁿzⁿ | Coefficient at z²=1/4 and infinitely many nonzero; L² norm²=1/3 | Not a finite algebraic expansion; completed claim correct. |
| V8 subgroup expectation | H={1}⊂S₃ | E(u_e)=1; E(u_g)=0 for g≠e | Trace-preserving Fourier truncation, not coefficient sum. |
| V8.LCHRegularNormalBridge trivial action | G=ℝ, M=M₂, α=id | π(x)f(r)=xf(r); λ_sπ(x)λ_s*=π(x) | Covariance has the correct inverse argument. |
| V8 LCH predual/smoothing | Trivial action, ∫k=1 | β_gω=ω, norm difference 0; x_k=x | Convolution cannot introduce a modular factor here. |
| V8 LCH vector measurability | Uncountable discrete G, f=δ_eξ | Support={e}; ‖π(x)f‖₂=‖xξ‖≤‖x‖‖ξ‖ | No global countability needed for this vector. |
| V8 compact ergodic trace | SU(2) conjugation on M₂ | E(x)=Tr(x)I/2; E(e₁₁)=I/2 | Invariant state is tracial; nontrivial matrix example. |
| V8.DenseTranslations / Lean :119 | Γ=ℚ⊂ℝ, Lebesgue Haar | Total mass=∞; invariant L∞ functions constant; [0,1] indicator not invariant | Noncompact hypothesis genuinely extends finite-measure lemma. |
| V8.Bernoulli cylinder measure | Fair two-point base, 3 coordinates | Each prescribed cylinder=1/8=product of three 1/2 masses | Uses product sigma-algebra. |
| V8.Bernoulli shift action | Nonabelian Γ, g,h,k | α_gα_hx(k)=x(h⁻¹g⁻¹k)=α_(gh)x(k) | Correct action order, not hg. |
| V8.Bernoulli torsion freeness | Fair base; element of order 2 | Equal values on one orbit probability 1/2; k disjoint orbits 2⁻ᵏ→0 | Infinite Γ, including torsion, supported. |
| V8.Bernoulli higher torsion | Orbit length r≥2 | Constant orbit probability 2·(1/2)^r=2^(1−r)<1 | Excludes fixed-point mass 1. |
| V8.Bernoulli ergodicity basis test | Infinite orbit of a nonconstant cylinder basis vector | Constant coefficient c has squared norm Σ∣c∣²=∞ unless c=0 | Only constant invariant vector remains. |
| V8.Bernoulli excluded finite group | Γ=S₃, fair base | All-six-equal event has probability 2/64=1/32, invariant | Infinite-group hypothesis indispensable. |
| V8 zero-weight base points | Weights (1/2,1/2,0) | L² base dimension 2, not 3; third singleton mass 0 | Quotient carrier correctly ignores zero-weight coordinate. |
| V9 formal degree/covolume | Lattice cell volume v, Haar rescaling c | d becomes d/c, v becomes cv; product remains dv | Normalization invariant. |
| V10 affiliation | Diagonal real operator D on ℓ² | Diagonal unitary u gives uD=Du on dom(D); swapping unequal eigenspaces fails | Actual domain invariance is necessary. |
| V10 Tomita finite matrix model | h=diag(2/3,1/3) on Hilbert–Schmidt space | Δ(e₁₂)=2e₁₂, Δ(e₂₁)=e₂₁/2; J swaps/conjugates | JΔJ=Δ⁻¹ on both matrix units. |
| `diagonalPower` | h=(2/3,1/3), z=0,1 | h⁰=I; h¹=h | Real scalar cpow body, no admitted data. |
| `diagonalModularPower` | Same h,x=e₁₂,z=1 | hxh⁻¹=2e₁₂; at z=0 returns e₁₂ | Correct direct complex parameter. |
| Finite-complex star identity | Same h,x=e₁₂,z=1 | β₁(x)*=2e₂₁=β₋₁(x*); β₁(x*)=e₂₁/2 | Minus conjugate sign is necessary. |
| Finite-complex star-locus iff | h above, z=1 and z=i | Re=1: false/false; Re=0: true/true | Diagonal theorem true, incomplete headline R06. |
| Finite-complex central exception | h=cI,c>0; n=0,1 | β_z=id for all z; entry-equality condition true (vacuous at n=0) | Correct boundary; no noncentral overclaim. |
| Finite-complex coordinate independence | h=[[1/2,1/6],[1/6,1/2]], z=1 | β₁(e₁₁)=[[9/8,−3/8],[3/8,−1/8]] not self-adjoint | Same eigenvalues as diagonal example; missing input R06. |
| Finite-complex central blocks | M=ℂ⊕ℂ, h=(1/3,2/3) | β_z=id despite unequal cross-block densities | Centrality must be blockwise, not global entry equality. |
| `IsKMS` and V10 KMS headline | x=e₁₂,y=e₂₁,h=diag(2/3,1/3) | F(z)=(2/3)2^(iz); F(0)=2/3, F(i)=1/3 | Correct positive strip; reversed flow gives 4/3 at i. |
| V10 Hecke left/right convention | Affine g=(2,0) | L=2,R=1; λ ratio=2, T ratio=1/2 | Inversion is essential, not a notation-only rename. |
| V10 affine group isomorphism | (2,1)(3,4) | Product=(6,9); M product=[[1,3/2],[0,1/6]]=M(6,9) | Slope-first convention agrees. |
| V10.AffineHecke isometries | n=2 | s₂*s₂=1; φ(s₂s₂*)=1/2; φ(s₂*s₂)=1 | Canonical state nontracial. |
| V10.AffineHecke Haar scaling | A=Zhat, q=2 and 2/3 | m(2A)=1/2; m((2/3)A)=3/2 | Inverse rational scaling, not q. |
| V10.AffineHecke corner covariance | n=2,r=0 | S₂S₂*=1_(2Zhat), mass 1/2; S₂*S₂=p, mass 1 | Distinguishes isometry from unitary. |
| V10.AffineAP residue | d=1 and d=4,a=1 | Residues 1 and 1/2; π_(4,1)(20)=3 | d≥1 avoids totient/log conventions at zero. |
| V10.AffineAP prime pairs | d=3,p=103,q=211, η=1/10 | p≡q≡1; q/p−2=5/103<1/10 | Checks ratio and shared residue; not a proof of divergence alone. |
| V10.AffineAP reciprocal block estimate | X=B^k, ≥cX/log X pairs | Σblock 1/p≥c/((1+δ)k log B); Σₖ1/k=∞ | The stated proof supplies divergence beyond infinitude. |
| V10.AffineType measure obstruction | Haar cylinder Zhat and scale 2 | Equivalent finite invariant density would face return ratios near 1/2, not 1 | Scaling itself is not claimed to prove III without return/ergodicity. |
| V11 supported spatial derivative | M₂, ψ=Tr, φ(x)=Tr(e₁₁x) | Derivative=L_(e₁₁); sends e₁₂↦e₁₂,e₂₁↦0 | Support=e₁₁; faithful-reference condition retained. |
| V11 supported imaginary powers | Same support p=e₁₁ | At t=0, supported power=p≠I | Correct partial-isometry/unitary distinction. |
| V11 cocycle scaling normalization | φ=2ψ faithful | (Dφ:Dψ)_t=2^(it)I; both modular actions equal | Equal automorphism actions alone do not fix scalar phase. |
| V11 core dual sign | θ_s(u_t)=e^(ist)u_t, u_t=h^(it) | θ_s(h)=e^s h; trace scales e^s | Matches the README's positive dual parameter. |
| V11 expectation invariance | Diagonal subalgebra in M₂, diagonal h | E kills off-diagonals; φ(E(x))=φ(x) | Modular-invariant subalgebra passes. |
| V11 S/T invariants | III_(1/2) and III₁ models | S={0}∪2^ℤ versus [0,∞); period subgroup (2π/log 2)ℤ versus {0} | Parameter/sign conventions consistent. |
| V11 harmonic-analysis normalization | G=ℤ/2, normalized counting Haar | Fourier coefficients of δ₀ are (1/2,1/2); inversion sum gives δ₀ | Dual counting normalization required; supplier cycle R01 remains. |
| V11 Pontryagin evaluation | G=ℤ/2, nontrivial χ | χ(1)=−1, so evaluation at 1 differs from at 0 | Point separation and injectivity distinguished from surjectivity. |
| V11 crossed-product duality | Trivial group | M⋊{1}=M; double crossed product=M⊗ℂ=M | Correct zero-step model, no normalization factor. |
| V11 flow/corner type | IIIλ factor and full nonzero corner | Both type IIIλ; flow period unchanged | Corner transport does not claim original representations unitary equivalent. |
| V12 two-projection theorem | p=e₁₁,q=(1/2)[[1,1],[1,1]] | (p−q)²=I/2; pqp=p/2 | Central angle parameter=1/2. |
| V12 tracial ultrapower | Constant sequences I and e₁₁ in M₂ | L² norms 1 and 1/√2; neither is null | Quotient ideal not all bounded sequences. |
| V12 central-sequence/Γ distinction | R⊕ℂ, trace weights (1/4,3/4) | Nontrivial R-tail sequence survives; every unitary has ∣τ(u)∣≥1/2 | No trace-zero Γ unitary; nonfactor shortcut excluded. |
| V12.J.Maps native symmetrization | x=e₁₂,y=e₂₁ | (xy+yx)/2=I/2; division by 2 is nonzero/invertible | Native SymAlg convention matches. |
| V12.J.Maps transpose | M₂, Φ=xᵀ | Φ(xy)=e₁₁; Φ(x)Φ(y)=e₂₂; Jordan products both I/2 | Jordan need not be associative homomorphism. |
| V12.J.Maps unit distinction | Zero map and identity on M₂ | Both preserve star/squares; Φ(I)=0 versus I | Unit preservation must be a separate property unless bijective/unital. |
| V12.J.Scalar signed finite reduction | n=3,f(v)=∣v₁∣²−1/2 | f+1/2=∣v₁∣²; recovered T=diag(1/2,−1/2,−1/2) | Correct algebra; prerequisite unowned, R03. |
| V12.J.Dye lattice input | M₃ versus M₂⊕ℂ | I₂ central part 0 versus (I₂,0) | Pure lattice distinction precedes Jordan reconstruction. |
| V12.J.Dye extension | Transpose on M₃ | Orthogonality pq=0 iff qᵀpᵀ=0; unique extension transpose | Nonmultiplicative normal Jordan example. |
| V12.J.Dye I₂ exception | Bloch deformation, n=(1,0,1)/√2 and north pole | Transition probability 0.853553390593→0.947213595500 | Ortho-map not Jordan; exclusion necessary. |
| V12.J.Enriched evaluation condition | Same deformed Bloch map | The two transition probabilities differ | Full affine/evaluation condition rejects it; no type-I₂ deletion needed. |
| V12.J.CentralSplitting | id⊕transpose on M₂⊕M₂ | First block multiplicative, second antimultiplicative | No single global choice of orientation. |
| V13a complete positivity | Transpose on M₂ | Positive on M₂; Choi flip has eigenvalue −1 on antisymmetric vector | Positivity alone insufficient. |
| V13a extension/expectation | Diagonal expectation M₂→ℂ² | E(I)=I; E(e₁₂)=0; norm 1 | Unital CP projection on nonzero algebra; zero projection has norm 0. |
| V13b injectivity/semidiscreteness | M₂ and scalar algebra | Identity factors through M₂/ℂ with error 0 | Nets allow exact finite case. |
| V13 AFD approximation | R as infinite M₂ tensor product | A finite-prefix element has approximation error 0 in every larger prefix | Actual finite-dimensional subalgebras, not only abstract CP factors. |
| V13 II₁ uniqueness scope | M₂ versus diffuse R | Minimal projection traces 1/2 versus none | “Infinite-dimensional”/diffuse condition needed and retained. |
| V13 trace-module conjugacy | Automorphism with modulus λ=2 | Trace(α(p))=2Tr(p); powers give 2ⁿTr(p) | Nonunit modulus differs from trace-preserving automorphism classification. |
| V13 III₁ product model | Parameters 1/2 and 1/3 | log2/log3 irrational since 2ᵐ≠3ⁿ for m,n>0; generated ratio group dense | Supports III₁ parameter test, not full uniqueness proof. |
| V13 classification separability boundary | Scalar Hilbert amplifications ℓ²(ℵ₀),ℓ²(ℵ₁) | Scalar dimension ∞ in both; cardinalities unequal | README keeps general nets separate from separable classification. |
| Source theorem amplification control | Peterson 4.5.1, M=ℂ,H₁=ℂ,H₂=ℂ² | K=ℂ²; amplified dimensions 2≠4 | Source error; V7's I×ℕ repair avoids this finite model. |
| Source Riemann normalization control | Haagerup 5.4 discretization, 10 intervals of width 1/10 | Wrong square-root weight gives sum 100; correct weight gives 1 | Source misprint; correct before using proof. |
| Source reflection equation | Φ=id on M₃, p=e₁₁,q=e₂₂ | Correct two reflections give e₂₂; printed final q-reflection gives −e₂₂ | Source misprint, not a roadmap identity. |
| Source right support | a=2I | ah=h forces h=0; ah=a forces h=I | Correct support I; source misprint. |
| Source repeated projection-map application | φ:P(M₃)→P(M₃), e=e₁₁ | 1−2φ(e) has eigenvalue −1, hence is not a projection | Extra application is outside φ's domain. |
| Source Riemann cutoff | γ=1,h₀=1/10,h=1/100 | Printed strict cutoff p=9 reaches 0.09; corrected p=99 reaches 0.99 | Cutoff must depend on h. |

## Not verifiable

Review completed without editing the manifest or bypassing paywalls. Missing-source records are in `needs-references.toml`.

- **jones2015:** the linked Vanderbilt author PDF and the older Vanderbilt course-directory URL both returned 404. No operator-held copy was found in the configured local source directory. Physical p.13 and chapters 2–16 therefore remain uncertified.
- **takesaki1, takesaki2, takesaki3, runde2002, ghj1989:** the source service returned paywalled/uncertified book records. The cited IV.8, VII–IX/XII, XIII/XV–XVIII, §6.4, and pp.142–148 locators were not checked against book text.
- **dye1955, hls1981:** DOI resolution reached JSTOR landing pages, without a verified legal open text. The primary Dye proof and compact-ergodic trace theorem were not read. Hamhalter's open comparison does not certify Dye's original theorem numbering.
- **wassermann1:** the Annals landing page did not yield readable source text through the service; **wassermann3** was returned as uncertified. The full SU(2) classification proof is not verified.
- **connes-takesaki1977:** Project Euclid landing page yielded no PDF. **araki-woods1968:** EMS landing page yielded no verified open text. **connes-woods1985:** Cambridge landing page yielded no verified open text. Their decomposition/product/classification locators remain unchecked.
- **connes-stormer1978, haagerup1985, haagerup1987, bost-connes1995:** publisher records were returned as uncertified. Accessible Haagerup/Neshveyev preprints verify only the comparisons specifically recorded above.
- **cfw1981:** the linked IHES address returned catalog HTML, not the cited mathematical text. Definitions 5–6 through Theorem 10 were not readable. **connesperiodic1975** and **connes1985:** legal author/publisher PDFs were obtained, but the extractions are image-only and OCR was unavailable; their theorem locators were not read.
- **haageruplp1979, grundling:** bibliographic searches through the service did not identify readable legal copies for the stated locators. **laca-raeburn1999:** DOI/Wiley returned HTTP 403; the different Laca finite-adele paper was read and identified explicitly above.
- No exact source locators certify the additional arbitrary-cardinality adapters in the sampled Fields, LatticeTypes, dimension, subgroup, LCH and Bernoulli targets. This is recorded as incomplete source verification, not a claim that those statements are false. The full III₀ cohomology/classification proofs were not independently reconstructed.

## Source issues

- **Misprint** in hamhalter2014 at equation (1), preprint p.3 (`hamhalter2014 line 115`): the source says the final reflection uses the image of q; it should be the image of p on both outer factors; affects a stated result.
- **Misprint** in hamhalter2014 at the right-support definition, preprint p.5 (`hamhalter2014 line 213`): the source says ah=h defines right support; it should be ah=a; affects a stated result.
- **Misprint** in hamhalter2014 at the proof of Theorem 4.2, preprint p.13 (`hamhalter2014 line 615`): the source says to apply the projection map again to the final target-algebra reflection; it should be simply the reflection 1−2φ(e); affects the proof.
- **Error** in peterson2013 at Theorem 4.5.1, printed p.66 (`peterson2013 line 2594`): the source says amplification by H₁⊗H₂ always makes faithful representations equivalent; it should be amplification by a sufficiently large infinite Hilbert space for nonzero representations; affects a stated result.
- **Misprint** in haagerup2016 at the proof of Lemma 5.4, preprint p.22 (`haagerup2016 line 1227`): the source says discretized operators use the inverse square root of the mesh; it should be the square root of the mesh; affects the proof.
- **Misprint** in haagerup2016 at the proof of Lemma 5.4, preprint p.23 (`haagerup2016 line 1246`): the source says the cutoff depends on the fixed upper mesh bound and retains a differential in a discrete sum; it should be a cutoff depending on the actual mesh, with no differential; affects the proof.
