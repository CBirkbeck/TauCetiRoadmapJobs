# Review of LocalVariationalFieldTheory (pull request #916 at 7d1dfbe)

**Verdict:** needs changes

:robot: Independent AI review. Six findings: one P2 and five P3. The recorded push gate passes; the blocking issue is the acceptance file's use of prototypes in place of headline statements. No mathematical counterexample to the displayed physical sign formulas was found in the computations below. The two collection scans remain unavailable, so their literal readings are not certified.

## R01 (P2) — Replace coordinate prototypes with headline acceptance statements

**Location:** `TauCetiRoadmap/LocalVariationalFieldTheory/Suggested.lean:4`, especially lines 6–13 and 21–233. The docstring calls these a “one-dimensional scalar finite-stage direct-limit prototype” and a “coordinate first-order multiplet prototype.”

**Claim:** These declarations serve as the roadmap's acceptance test. They do not test completion of its general jet calculus, first variation, global variational cohomology, Cauchy bracket, Noether I/II, KT resolution or curved Dirac/stress results. The module neither lists those unavailable headline statements with their missing carriers nor states the native-matrix part of FiniteDirac's substantive comparison. Most definitions support only example calculations or have no headline consumer at all.

**Witness:** `Suggested.lean:106,218,227` are its only three admitted theorems: derivative compatibility for a scalar prototype and two model Euler calculations. There is no admitted first-variation, Noether, resolution, Clifford-covariance or stress theorem.

**Repair:** Rewrite the acceptance file around the headline inventory below. Remove the prototype development and definitions used only by its checks. For each headline lacking native carriers, name that theorem and the precise missing carrier in the module docstring, with no substitute. State the finite-dimensional Dirac/Clifford comparison on the pinned Spin/SL₂ and matrix carriers, using only the few explicit matrices/intertwiners needed. Keep scalar and oscillator calculations as README Checks. This is not a request to encode missing jet/sheaf theories in a large structure or to replace them with hypotheses containing the conclusion.

**Test of repair:** A75 distinguishes the actual Clifford map from zero: its timelike square must be I₄. The existing `diracSpinAction` definition tests no such conclusion. A23–A24 distinguish the general variational theorem from a first-order scalar calculation: `L=u₂²/2` has Euler expression `u₄`. A docstring naming the missing all-order carrier honestly records that obligation; the current oscillator theorem does not.

## R02 (P3) — Delete four padding theorems

**Locations:** `TauCetiRoadmap/LocalVariationalFieldTheory/RealFieldsSuggested.lean:22,28`; `TauCetiRoadmap/LocalVariationalFieldTheory/Suggested.lean:218,227`.

**Claim:** The first two are new real-field theorem targets; the latter two belong in the acceptance test.

**Witness:** At the pin, `TauCeti/LinearAlgebra/Complex/Conjugation.lean:271,278,296` already supplies the real-points equivalence, pure-tensor formula and dimension equality. Both RealFields targets close with one `exact`; the two model targets reproduce README calculations.

The successful scratch proofs, after importing the individual pinned conjugation module, are:

```lean
exact ⟨TauCeti.realPointsEquiv
  (K := (starLinearEquiv ℂ).toLinearMap) star_star,
  TauCeti.realPointsEquiv_tmul
    (K := (starLinearEquiv ℂ).toLinearMap) star_star⟩
```

and

```lean
exact TauCeti.finrank_realPoints
  (K := (starLinearEquiv ℂ).toLinearMap) star_star
```

**Repair:** Delete these declarations from the Suggested files, rather than proving them in place. Cite the native real-descent results in the supplier contract; retain the genuinely additional functorial and polynomial-jet comparisons in the README. Keep the oscillator and Klein–Gordon calculations as Checks.

**Test of repair:** Both one-tactic probes elaborate without warnings or errors. A15–A17 test descent at ranks 0, 1 and 2 and on `2+3i`; A67–A68 compute the model Euler values −10 and −17. Deletion loses no new theorem specification: the native results and the README calculations remain.

## R03 (P3) — Supply the required per-definition API, Checks and dependency structure

**Location:** `TauCetiRoadmap/LocalVariationalFieldTheory/README.md:46`, with representative definitions at 48–65, 150–180 and 339–379.

**Claim:** The prose specifies the reusable library and its order of supply. It does contain substantial mathematics and several negative controls, but none of the six layers has the required Examples/Dependencies ending; there are no `*Needs:*` lines or `**Checks.**` lists. Definitions are embedded in long paragraphs without their own API and three discriminating Checks. Exact supplier contracts and the required opening/ownership structure are absent. Many theorems, including the Cauchy-domain extensions, have no claim-local locator.

**Witness:** Searching the complete README for `*Needs:*`, `**Checks.**`, `### Examples` and `### Dependencies` returns zero occurrences. The phase-bundle definition at line 150 has no three explicit computed checks.

**Repair:** Restructure into the prescribed Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layers, consumers and references. Give each definition its API and at least three independent Checks, and each theorem its hypotheses, claim-local locator and own dependency list. Preserve the mathematical content and existing negative controls. Cite native inputs explicitly, including `IsOpen.ae_eq_zero_of_integral_contDiff_smul_eq_zero` rather than re-planning the fundamental lemma's existing analytic core. Distinguish the all-signature local Yang–Mills extension from SBC B8's existing positive Riemannian variation theory.

**Test of repair:** For CauchyPhase, A43 tests nonlinear cotangent transformation, A45 rejects the integrable but inadmissible `∫q`, and A48 retains a nonzero-flux admissible reference. These give three discriminating checks with computed values. The dependency lists must preserve the acyclic order already made explicit in lines 303–312.

## R04 (P3) — Bring both Lean files into the specified form

**Locations:** `TauCetiRoadmap/LocalVariationalFieldTheory/RealFieldsSuggested.lean:5–16`; `TauCetiRoadmap/LocalVariationalFieldTheory/Suggested.lean:4–13,25–29,127–160`.

**Claim:** Both files obey the Lean acceptance-file rules.

**Witness:** RealFields imports two Mathlib submodules and no `import Mathlib`, and uses `namespace LocalVariationalFieldTheory`. Numerous main-file declarations lack docstrings; neither module has the required headline/missing-carrier docstring or layer comments.

**Repair:** After removing the padding/prototypes, use the single `import Mathlib` plus only individually used `TauCeti.*` modules, the namespace `TauCetiRoadmap.LocalVariationalFieldTheory`, the required target-signatures module docstring, layer comments and a mathematical docstring for every retained declaration. Make every retained Lean name appear in the README and every claimed README declaration exist in Lean. For example, `realField_descent` and `realField_finrank` are not named in the README at all; deleting them under R02 resolves those mismatches.

**Test of repair:** All 51 explicit declarations were checked with `#check @name` on scratch copies. The 49 main-file names have the `TauCetiRoadmap` prefix; the other two do not. The two RealFields statements retain all star-module assumptions, and finrank retains finite dimensionality: no silently dropped necessary binder was found. Import/namespace cleanup must preserve that fact. The worker gate's all-zero import counts did not catch the secondary file's violations.

## R05 (P3) — Correct the global first-variation and Lepage locator

**Location:** `TauCetiRoadmap/LocalVariationalFieldTheory/README.md:461`, claiming Chapter 5 §C constructs global first-variation/Lepage equivalents.

**Witness:** In the retrieved manuscript, global first variation is Corollary 5.3, printed p.197 (`anderson` line 9116); general Lepage existence and one-dimensional uniqueness are Corollary 5.5, printed p.200 (line 9190). Both are in §5A.

**Repair:** Cite §5A, Corollaries 5.3 and 5.5, pp.197 and 200, directly at the targets. Cite §5C separately for its generalized Poincaré–Cartan/naturality discussion. For the cohomology claim add Theorem 5.9, pp.203–204, keeping the README's Euler-augmented interpretation at top degree.

**Test of repair:** Corollary 5.3 explicitly includes uniqueness in base dimension one, matching A25. Corollary 5.5's proof allows higher-contact additions for larger dimension, matching A26. The repaired locator leads to those exact statements rather than a different discussion.

## R06 (P3) — Update the stale UnboundedOperators boundary citation

**Location:** `TauCetiRoadmap/LocalVariationalFieldTheory/README.md:457`, citing “UnboundedOperators UO1–UO5” and the anchor `milestone-names-and-dependency-order`.

**Witness:** The supplied UnboundedOperators file has Parts A–F (`README.md:17,67,113,137,269,314`) and targets such as UO-A01, UO-D06 and UO-F03. Neither UO1–UO5 nor that anchor occurs.

**Repair:** Replace this ownership-boundary citation with the actual relevant parts/targets, respecting its own division of ownership with HilbertModules H6 and SelfAdjointSpectralTheory. It is a boundary statement here, so keep it out of LVF's prerequisites. Do not turn a later quantum/operator consumer into a supplier.

**Test of repair:** Part A identifies spectral-integral domains; Part E addresses cores; UO-F03 at line 324 states tensor evolution with explicit spectral domains. Those are resolvable targets. This is P3, not an unowned LVF prerequisite: no proof here consumes UO1–UO5.

## Verified sound

**Build, signatures, gate and scope.** Checked the requested head exactly; the outside-folder diff is empty. The worker's full gate records all checks passing, including its targeted build. Independently built the imported Clifford module, then ran `lake env lean` on the original `Suggested.lean`: exit 0, exactly three `sorry` warnings. The two signature copies elaborate with 49 and 2 `#check @...` outputs respectively; the secondary file has exactly two `sorry` warnings. No section hypothesis loss was found. No source worktree file was edited.

The independent dependency command produced:

```text
depcheck: 200 roadmaps, 1322 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line appeared. There are no declared gaps and no `*Needs:*` lines to audit; explicit prose edges were read instead. LVF3's later model comparisons consume LVF4/LVF5; its early Cauchy constructors do not. This is explicitly separated at lines 303–312, rather than a genuine Noether/Cauchy cycle. No route-specific exclusion, sorry-valued data, `set_option`, external edit or executable algorithm was identified. Triangular leader elimination is a mathematical proof construction, not a reason to flag an algorithm.

**Headline inventory and pin coverage.**

| README headline | Pinned statement coverage |
|---|---|
| LVF1 general smooth-bundle jets, locally finite-order sheaf and bicomplex | Missing general nonlinear jet, contact-form and sheaf operators; the scalar colimit is only a prototype. Name the unavailable headline/carriers in the docstring. |
| LVF2 all-order first variation, interior Euler projection, global Lepage theorem | Missing native general jet-density/Euler/Lepage carriers; neither Euler model computation states it. |
| LVF2 variational cohomology and orientation-twisted obstruction | Missing the LVF variational complex and its twisted comparison, beyond ordinary supplied de Rham complexes. |
| LVF3 differential-redefinition Euler chain rule | Missing jet substitution, linearization and evaluated density transpose on those carriers. |
| LVF3 intrinsic Cauchy functionals, graded canonical bracket and actual constraints | Missing the admissible functional/phase-domain and graded jet interfaces. A formula on arbitrary scalars would not replace this theorem. |
| LVF3 finite Dirac Clifford/Spin and covariance comparison | Native Spin, SL₂, matrices, linear maps and Clifford universal property exist. Explicit gamma/transport matrices are simple definitions; the substantive comparison is not stated. |
| LVF4 Noether I and current improvement | Missing prolonged characteristics, source forms and current carriers. |
| LVF5 joint-parameter Noether II iff theorem | Missing joint jets and finite-order current operators, not a reason to weaken its quantifiers. |
| LVF5 regular coordinates, stationary identity presentation, KT exactness including n=0,1 | Native exterior/symmetric algebras exist, but the smooth equation-jet/sheaf complexes do not. The docstring needs to name these targets. |
| LVF6 global real Dirac, metric/coframe variation and Hilbert/Belinfante comparison | Missing the roadmap's global Lorentz spinor, variation and density adapters. |
| LVF1 real descent and dimension | Already supplied by native `realPointsEquiv`, its tensor rule and `finrank_realPoints`; the kept new work is functorial/jet compatibility. |
| LVF3 SourceCyclicODE | Auxiliary comparison is statable with native algebra/module quotients and kernels. Its noncommutative kernel distinction was checked; it is not a replacement for the missing deep headlines. |

**Padding probes.** Tested all five admitted theorems. Both RealFields targets closed with one `exact` after the relevant individual native import. A scratch copy replacing each of the other three `sorry`s with `simp` did not close any: two reported no progress and the oscillator retained its Euler equality. The two model results are nevertheless padding because they are explicit README model Checks. The derivative-descent theorem is not reported as one-tactic padding; it is part of R01's lengthy substitute carrier. No failure of a scratch probe is a failure of the original build.

**Pinned library objects opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to their respective library repositories.

| Declaration / object | Pin location and checked content |
|---|---|
| `realPart`, `imaginaryPart`, `realPart_add_I_smul_imaginaryPart` | `Mathlib/LinearAlgebra/Complex/Module.lean:387,395,413`; star-module assumptions and real fixed-subspace codomain, no Hermitian pairing. |
| `starLinearEquiv` | `Mathlib/Algebra/Star/Module.lean:112`; semilinear star map used in the successful probes. |
| `TauCeti.realPoints` | `TauCeti/LinearAlgebra/Complex/Conjugation.lean:115`; real submodule of fixed points of a conjugate-linear map. Involutivity is separately supplied to descent, not built into an arbitrary semilinear map. |
| `realPointsEquiv`, `_tmul`, `_symm_apply`, `finrank_realPoints` | Same file, lines 271,278,285,296; exact map, inverse and rank theorem. The rank theorem does not require finite dimensionality. |
| `tmulConj`, `_tmul`, `_involutive`, `_eq_self_iff`, `_baseChange` | Same file, lines 311,324,339,346,383; coefficient conjugation and real-linear base-change compatibility. Some claimed naturality is already native too. |
| Fundamental lemma | `Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:44,186,205`; global/manifold and open-set test-function versions, with local integrability and almost-everywhere conclusion. Continuity and full support are needed for everywhere equality; bundle/jet adapters remain LVF work. |
| `KaehlerDifferential`, `.D` | `Mathlib/RingTheory/Kaehler/Basic.lean:148,226`; degree-one module and derivation, not the claimed complete LVF vertical/horizontal bicomplex. |
| `ExteriorAlgebra`, `SymmetricAlgebra` | `Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean:60`, `Mathlib/LinearAlgebra/SymmetricAlgebra/Basic.lean:50`; algebra carriers, not a smooth KT contraction theorem. |
| `realSpinThreeOneEquivSpecialLinear` and its coercion formula | `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/ThreeOne.lean:81,93`; actual even-Clifford matrix equivalence, with vector-action comparison later in the same module. |
| Clifford vector dictionary | Same file, lines 146–176, and `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/ThreeOne.lean`; the even vector is −ι(v)ι(e₃); A76 also checks an actual norm-one even product. |
| `CovariantDerivative.leviCivitaConnection` | `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:156,359`; native Riemannian bundle hypothesis, not arbitrary indefinite metrics. |
| `contMDiffOn_leviCivitaConnection`, smooth instance | `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Regularity.lean:163,292`; finite regularity inequalities and the smooth Riemannian specialization. |

**Ownership and supplier resolution.** Read merged DifferentialGeometry, SpinGeometry, HopfRinow and IntegrableSystems material for shape and contracts. Object searches used `roadmaps grep` across its indexed main/open work, direct searches of the supplied sibling checkouts and the board packages, and pinned-library searches for jets, Euler/variation, Cauchy functionals, Koszul–Tate, real forms and differential operators. Board-package matches did not reveal another local variational/KT/Cauchy owner. Generic Banach minimization in VariationalMethods V2/V3 is a different object. No duplicate fully qualified Lean name was found in the searched roadmaps; the native mathematical duplication is R02.

| Resolved roadmap interface | Location and result |
|---|---|
| DifferentialGeometry forms, integration, density, positive metric comparison | Main `TauCetiRoadmap/DifferentialGeometry/README.md:268,311,503,782,910`; layers 0/1/5/6/12 are real suppliers. The references at LVF lines 9 and 420 should be consolidated to these exact sections. |
| SmoothBundlesConnections bundle/connection floor | Supplied head `TauCetiRoadmap/SmoothBundlesConnections/README.md:437` onward, B2–B4; associated bundles, connections and density-measure interfaces exist. |
| SBC good covers and Čech comparison | Same file B6.0–B6.1 and dependency summary at 1418–1429; constant-coefficient interface, not an already supplied orientation-local-system variational theorem. LVF explicitly owns that extension. |
| SBC Yang–Mills | Same file B8.1–B8.2, lines 1476–1540; energy is `∫|F|²`, first variation coefficient +2, with positive pairing/Riemannian metric. LVF's `−F²/4` equals −one-half that density in this specialization and gives Euler `−d_A*F`. Keep that adapter explicit. |
| PseudodifferentialOperators P1.0 | Supplied head `TauCetiRoadmap/PseudodifferentialOperators/README.md:94,137,213,222`; linear vector-bundle jets, factorization and both transposes exist as targets. LVF's nonlinear jets and jet-dependent coefficients are additional objects. |
| IntegrableSystems I3 | Main `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:213–230`; regular/local and hyperregular/global distinction, time dependence and quasi-invariant current all present. |
| HopfRinow Layer 1 nondegenerate supplier | Main `TauCetiRoadmap/HopfRinow/README.md:245–282`; explicit smooth nondegenerate metric/family connection and the stated variation identity, with no distance/completeness requirement. No supplier gap here. |
| SpinRepresentations Layer 7 | Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:881–935` and its continuing Lie/cover discussion; distinguishes full norm-±1 cover, norm-one subgroup and identity-component image. |
| NoncompactQuantumSymmetry M4–M6 | Supplied head has M4 at 1928, M5 at 3263, M6 at 5831; representation-theoretic boundary, not a local-field construction. |
| OperatorAlgebraDynamics D8 | Main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:554`; CAR/Weyl/free-equilibrium boundary is present. |
| UnboundedOperators | Supplied file's actual Parts A–F read; old target labels do not resolve, R06. |

The citation resolver reports no names missing everywhere, but explicitly says it did not check pinned-library names. Those were therefore checked directly above. Its broad name matches do not validate stale section labels. QuantumFoundations and RelativisticQuantumFieldTheory are downstream boundary citations; their files are absent from the supplied main snapshot and no head paths for those roadmaps were supplied. Their precise target ownership was not certified by this review (see below). They were not counted as new suppliers.

**Seeded source verification.** Four texts were retrieved legally through the sources service and opened: `anderson`, `bbh`, `bfls`, `bgm`. The initial Anderson author-host attempt timed out; the cited openly distributed manuscript was then retrieved. Exact collection editions `borcherds` and `unsw` were not retrieved. Source IDs below identify the numbered extractions, not files committed into this repository.

| Seeded target | Text/locator outcome |
|---|---|
| Pairing and fermion conventions | A10–A12 compute the conventions; no exact source locator is attached to this paragraph. The collection's literal fermion readings remain unverified. |
| LVF1.SourcePolynomialComparison | A18–A22 check generators, filtration and signs. Borcherds pp.35/49 unavailable; no claim of source-text verification. |
| LVF3.SourceCyclicODE | A39–A42 check both quotient extremes, a noncommutative example and the displayed ODE. Borcherds p.40 unavailable. |
| LVF3.CauchyPhase | A43–A49 test nonlinear coordinates, support, decay, charged background and boundary exclusions. These domain extensions are LVF constructions; no source theorem certifying them all is supplied. |
| LVF3.CauchyFunctionals | A50–A52 test the integral/Euler and divergence distinctions. `bfls` lines 603–618 requires the horizontal resolution/topological restrictions; it does not identify every global functional kernel with divergences. |
| LVF3.CauchyBracket | `bfls` §3.2 equation (27), printed p.17, lines 681–708 gives the variational-derivative bracket; lines 664–676 give formal adjunction. A53–A56 check the canonical and graded signs. The graded/noncompact domains are additional targets, not certified by that equation alone. |
| LVF3.CauchyConstraints | A57–A59 test Legendre degeneracy, charge improvement and the real action's momenta. No all-domain constraint theorem was found in the cited bracket locator; the README owns this construction. |
| LVF3.UNSW41ScalarLegendre | A60–A64 independently verify the correction and canonical factors. UNSW p.41 unavailable. |
| LVF3.UNSW41GaugeComparison | A65–A66 compute the transformations. `bbh` §6.6 equation (6.27), printed p.48, lines 1922–1935 verifies enlarged parameter jets/linear homogeneous dependence, not the collection's Hamiltonian formulas. |
| LVF3.Borcherds52Quadratic | A69–A70 verify Hessian/source normalization; p.52 unavailable. |
| LVF3.MaxwellSourceAdapter | A71–A72 verify the local variation and conservation iff; the claimed scan omissions/index switches cannot be checked. |
| LVF5.KTResolution | `bbh` §§5.1.3–5.2, equations (5.10)–(5.13), printed pp.31–32, lines 1231–1257; Theorem 5.1, pp.33–34, lines 1316–1354. These support the flat split and paired-variable proof. A91–A97 also test the roadmap-owned mixed-metric and order-budget refinements, which are not claimed to appear verbatim in BBH. |
| LVF5.LowDimensions | A98–A101 explicitly compute n=0,1 and strict reducibility. BBH's displayed leaders require two coordinate directions; the low-dimensional branches are separate LVF constructions, not an extrapolation of that source split. |
| LVF6.DiracRealAction | A104–A106 independently derive the torsion/density signs. `bgm` Theorem 5.1, printed p.14, lines 743–754 uses its generalized-cylinder identification for a semi-Riemannian spin metric family; §6 lines 820–909 discusses stress. It does not supply arbitrary independent torsionful connections. The README explicitly owns that additional comparison. |
| Literal-source model adapters | A111–A114 check algebraic signs/factors. The exact Borcherds/UNSW lines and glyph uncertainty remain not verifiable. |

Additional Anderson checks: Definition 2.11, printed p.44 (`anderson` line 2833); Theorem 2.12, pp.46–47 (2922–2941); Corollary 2.13(i), equation (2.42), p.49 (3021–3028); §4A Propositions 4.1–4.3, pp.114–115 (5944–5960); §5A Theorem 5.1, p.191 (8898–8904), Corollaries 5.3/5.5 (9116,9190), and Theorem 5.9, pp.203–204 (9337–9348). Positive contact degree, augmentation, and the difference between source infinite-jet statements and LVF's locally finite-order/sheaf obligations were retained.

**Computed adversarial table: 120 rows.** All 15 seeded targets, the headline families, both Lean files' declarations and each finding's mathematical witness are represented. Algebraic checks are over ℝ/ℂ as declared; characteristic 2/3 and DVR substitutions are outside these signatures. Rank/dimension zero and one, non-Abelian versus Abelian actions, nonlinear coordinates, formal nilpotents, topology, boundary/support, sign, normalization and total-index boundary cases were tested where applicable.


The following are computed adversarial witnesses, not proofs of the general theorems. “Retain” means the displayed witness agrees; it does not certify every extension of that statement. README locations refer to `TauCetiRoadmap/LocalVariationalFieldTheory/README.md`. Matrix calculations use ordinary matrix multiplication; analytic examples are evaluated on their stated local or supported domains.

| # | Statement / location | Instance | Computed sides / discriminator | Result; change |
|---|---|---|---|---|
| A01 | Symmetric jet indexing, 17 | u(x,y)=xy | u₁₂=u₂₁=1; one symmetric coordinate, versus two ordered occurrences | Retain multiplicities |
| A02 | Contact realization, 17 | u(x)=x² at x=1, tangent of its prolongation | du=2, u₁dx=2, θ₀=0; arbitrary vertical tangent gives θ₀=1 | Retain raised stage |
| A03 | d_H on coefficients, 21 | f=xu₀² | Df=u₀²+2xu₀u₁; at (1,2,3), both sides=16 | Retain |
| A04 | d_Hθ sign, 21 | θ₀=du₀−u₁dx | dθ₀=−du₁∧dx=dx∧θ₁; opposite sign gives −dx∧θ₁ | Retain |
| A05 | d_V and anticommutation, 23–25 | f=u₀, one base dimension | d_Vd_Hf=−dx∧θ₁; d_Hd_Vf=dx∧θ₁; sum=0 | Retain |
| A06 | Squares, 25 | f=u₀ on two base coordinates | d_H²f=(u₁₂−u₂₁)dx¹∧dx²=0; d_V²u₀=0 | Retain symmetry |
| A07 | Local versus uniform finite order, 25 | disjoint bumps χ_k(x), expression Σχ_k u_k, k≥1, supports escaping to infinity | On any compact x-region only finitely many k; on all ℝ the required orders are 1,2,3,… with no maximum | Retain sheafification |
| A08 | Orientation twist, 27 | orientation reversal x↦−x in dimension 1 | Pullback dx=−dx; pullback density = density; twist supplies the missing −1 | Retain |
| A09 | Global obstruction, 27,109 | E=S¹×ℝ, λ=dθ | E(λ)=0; period=2π whereas a global exact current has period 0 | Retain ker-E quotient |
| A10 | Bilinear versus Hermitian pairing, 31–36 | scalar operator a=i, u=v=1 | Bilinear B(au,v)=i=B(u,iv); Hermitian h(au,v)=−i=h(u,−iv) | Retain distinct transposes |
| A11 | Left/right odd derivatives, 37–40 | F=θ₁θ₂ | ∂₁ᴸF=θ₂, ∂₁ᴿF=−θ₂; ∂₂ᴸF=−θ₁, ∂₂ᴿF=θ₁ | Retain minus sign for even F |
| A12 | Reversal involution, 29,42 | real odd θ₁,θ₂ | (θ₁θ₂)*=θ₂θ₁=−θ₁θ₂; multiplicative unreversed star gives +θ₁θ₂ | Retain |
| A13 | General jet affine law, 48–65 | fibre change v=u² on u>0, u=2,u₁=3,u₂=5 | v=4,v₁=12,v₂=2·9+2·2·5=38; between u₂=5 and 6, difference=4 | Retain noncanonical affine structure |
| A14 | Jet surjectivity, 89 | prescribed u₀=a,u₁=b,u₂=c | u(x)=a+bx+cx²/2 has jet (a,b,c) at 0; cut off identically 1 nearby gives same jet | Retain |
| A15 | Real descent, 67–87; RealFieldsSuggested 22 | ℂ with conjugation, x=2+3i | e(1⊗2+i⊗3)=2+3i; e(i⊗1)=i; zero map would give 0 | True; R02 deletes duplicate target |
| A16 | Real finrank, 82; RealFieldsSuggested 28 | V=0,ℂ,ℂ² | (real fixed rank,complex rank)=(0,0),(1,1),(2,2); underlying real rank would be (0,2,4) | True; R02 |
| A17 | Descent naturality / unit, 75–85 | W=ℝ, f(w)=2w, z=i,w=3 | fℂ(e(i⊗3))=6i=e(i⊗f(3)); conjugation fixes 1⊗3 but sends i⊗3 to −i⊗3 | Retain functorial extension |
| A18 | Generator versus value space, SourcePolynomialComparison 91–93 | W=ℝ², generator basis e₁,e₂, evaluation (2,3) | ev(e₁)=2, ev(e₂)=3, ev(2e₁)=4; evaluation is a covector on W and needs no identification W≃W* | Retain W* field carrier |
| A19 | Completed polynomial product, 95 | f=1+u+u²+…, g=1−u | Degree 0 coefficient=1; degree k≥1 coefficient=1−1=0 | Retain finite coefficient sums |
| A20 | Formal evaluation / filtration, 95 | f=Σu^k, ε²=0 | f(ε)=1+ε; at real u=2 the partial sums 1,3,7,… diverge; D(u₀²)=2u₀u₁ retains degree 2 | Retain nilpotent/convergence distinction |
| A21 | Two source differentials, 97 | q=1,p=0, α=d_alg u₀ | Vertical-first image of D_H⁰α is θ₁∧dx=−dx∧θ₁; multiplying by (−1)^q gives d_Hθ₀=dx∧θ₁ | Retain signed comparison |
| A22 | Horizontal-first differential, 97 | p=1, α=u₀, β=dx | d_V(u₀dx)=θ₀∧dx=−dx∧θ₀; (−1)^p d_alg gives the same coefficient −1 | Retain |
| A23 | First variation / order bound, 101–105 | L=u₁²/2 | δL=u₁δu₁; Eδu+D(u₁δu)=−u₂δu+u₂δu+u₁δu₁; order E=2=2r | Retain; general theorem absent in Lean, R01 |
| A24 | Higher order Euler, 101 | L=u₂²/2 | E(L)=D²u₂=u₄; order 4=2·2; first-order-only formula gives 0 | Retain; R01 |
| A25 | Lepage form and 1D uniqueness, 105 | n=1,L=u₁²/2 | ρ=u₁du−u₁²dx/2; horizontalization=u₁²dx/2; d_H(fθ₀)=0 forces top θ coefficient f=0 for an order-zero candidate | Retain specified class |
| A26 | Higher-contact Lepage ambiguity, 105 | n=2, add θ₀¹∧θ₀² | Horizontal component=0; d of added form has contact degree≥2, so one-contact component=0 | Retain nonuniqueness |
| A27 | Fundamental lemma, 107 | continuous f=1 and nonnegative compact test h with ∫h=1 | ∫fh=1≠0; f=0 gives integral 0 for every h | Native test theorem exists; cite it in R03 repair |
| A28 | Euler kills divergence, 107 | B=u₀³/3, L=DB=u₀²u₁ | ∂₀L=2u₀u₁; D∂₁L=D(u₀²)=2u₀u₁; E=0 | Retain |
| A29 | Positive-contact homotopy versus constants, 107 | n=1,q=0,f=1 | d_H1=0 but id(1)=1; positive-contact θ₀ instead has d_Hθ₀=dx∧θ₁≠0 | Retain q≥1 restriction |
| A30 | Interior Euler / top augmentation, 107 | ω=d_V(u₁²dx/2) | Iω=−u₂δu dx; ω−Iω is the first-variation divergence; applying I again leaves −u₂δu dx | Retain augmented row |
| A31 | Vertical homotopy, 107 | ω=du on a star-shaped fibre | Kdu=u, d_VKdu=du; id−s₀* on du is du; on constant 1 both sides 0 | Retain |
| A32 | Nonlinearity qualification, 111 | L=u³u₁ and L=u⁴ | E(u³u₁)=3u²u₁−D(u³)=0; E(u⁴)=4u³ | Retain distinction |
| A33 | Density transpose, 117–127 | A=xD in one coordinate, f arbitrary | Aᵗf=−D(xf)=−xf′−f; at f=1 gives −1, versus false −xDf=0 | Retain coefficient inside composition |
| A34 | Weighted adjoint, 120–127 | A=D,ρ=e^x,H=1 | A†1=−e^(−x)D(e^x)=−1; unweighted adjoint on 1=0 | Retain density term |
| A35 | Differential field redefinition, 129–144 | α=1, L=e^xv, v=u+u′ | E_v=e^x; (1−D)e^x=0=E_u; ker(1+D) contains e^(−x) | Retain failed converse control |
| A36 | Decay converse, 137–142 | q=ce^x | q→0 at −∞; q→0 at +∞ iff c=0; resulting E_v=0=E_u | Retain both-end sufficient condition |
| A37 | Nonlinear redefinition, 142–144 | v=u²,L=v | E_v=1; E_u=2u; at u=0 these are 1 and 0 | Retain invertibility qualification |
| A38 | Mechanics comparison, 146 | L=v²/2−q²/2 | FL=v, E_L=(v²+q²)/2, Euler=−q−q″; endpoint term=vδq | Retain I3 ownership |
| A39 | Cyclic module, 148 | A=ℂ,P=0 and P=1,N=ℂ | Hom(A/0,N) and ker0 both ℂ; Hom(A/A,N) and ker1 both 0 | Retain both extremes |
| A40 | Noncommutative cyclic kernel, 148 | A=M₂(ℂ),P=diag(1,0),N=ℂ² | kerP=ℂe₂; E₁₂e₂=e₁∉kerP, while dim Hom_A(A/AP,N)=1 | Retain ℂ-subspace, not A-submodule |
| A41 | Smooth ODE model, 148 | f=1 and f=x | (DX−XD)f=f; P1=x; Px=1+x² | Retain smooth module |
| A42 | Fixed Euler ideal, 148 | L=0 versus density u | I∞(0)=0; E(u)=1, so taking all Euler images gives unit ideal | Retain fixed L |
| A43 | CauchyPhase cotangent chart, 150–152 | q>0,Q=q²,P=p/(2q) | PδQ=pδq; δQ∧δP=δq∧δp; at q=2,p=3,δq=1 gives θ=3 on both sides | Retain |
| A44 | Affine reference change, 152 | q′=q−c(x), fixed c | δq′=δq; pδq′=pδq; ω′=ω | Retain external reference hypothesis |
| A45 | Compact-perturbation admissibility, 154 | h=q,reference=0 on ℝ | h(s₀)=0 but E_q(h)=1; X_h=(0,−1) is not compactly supported | Retain exclusion |
| A46 | Admissible normalized Hamiltonian, 154 | h=(q²+p²)/2,reference=0 | h(s₀)=0,E(h)(s₀)=(0,0); X_h=(p,−q), compact for compact q,p | Retain |
| A47 | Schwartz branch, 156 | q=p=e^(−x²), polynomial h=(q²+p²)/2 | h=e^(−2x²), E=(e^(−x²),e^(−x²)); all derivatives polynomial×Gaussian | Retain growth hypotheses |
| A48 | Charged reference cancellation, 158 | exterior Φ₀=Q/r,E₀=Qx/r³ | ∇Φ₀=−Qx/r³; E₀+∇Φ₀=0; sphere flux=4πQ | Retain nonzero-flux sector |
| A49 | Boundary branch, 160 | interval, h=q_x²/2 | δF=−∫q_xxδq+[q_xδq]; q=x,δq=x gives boundary term 1, not 0 | Retain exclusion from collar class |
| A50 | CauchyFunctionals first variation, 162 | closed circle, h=q_x²/2, q=sin x,v=sin x | dF[v]=∫cos²x=π; ∫(−q_xx)v=∫sin²x=π | Retain |
| A51 | Functional equality versus divergence, 164 | circle, h=q_x | F_h=0 for all periodic q; E(h)=0. Interval q=x instead gives F_h=1 | Retain domain-dependent equality |
| A52 | Zero-dimensional functionals, 164 | Σ={a,b}, h(a)=2,h(b)=3 | Integral=5; divergence space=0 | Retain |
| A53 | CauchyBracket sign, 166–172 | one point, F=q²/2,G=p²/2 | {F,G}=qp; X_F=(0,−q),X_G=(p,0); commutator=(−q,p)=−X_(qp) | Retain |
| A54 | Smeared canonical brackets, 172 | circle length 2π,f=g=1 | {Q₁,P₁}=2π; {Q₁,Q₁}={P₁,P₁}=0 | Retain kernel interpretation |
| A55 | Local versus multilocal, 172 | q=a bump on U, b bump on disjoint V; ∫a=∫b=1 | (∫(a+b))²−(∫a)²−(∫b)²=2; a normalized local integral has cross difference 0 | Retain separate product algebra |
| A56 | Graded bracket, 174–178 | odd q,p,F=qp | {q,p}={p,q}=1; {F,q}=q,{F,p}=−p from right/left derivatives | Retain |
| A57 | CauchyConstraints primary image, 180–182 | Maxwell L, time velocity v₀ arbitrary | Π₀=∂L/∂v₀=0 for every v₀; scalar velocity block still invertible | Retain singular full image |
| A58 | Differentiable gauge generator, 180 | interval Abelian momentum p, parameter α | ∫αp′=[αp]−∫α′p; subtract boundary charge gives −∫α′p, whose δA=−α′ | Retain bulk-plus-charge |
| A59 | Dirac primary equations, 182 | spatially constant commuting ψ=x+iy | L_uns=i xẋ+i yẏ−xẏ+yẋ; Re L=yẋ−xẏ; real momenta=(y,−x), complex unsymmetrized slots differ | Retain representative-dependent constraints |
| A60 | Interaction Hamiltonian theorem, 186–198 | L₀=v²/2,L_int=v²,π=3 | v=1,H=3/2; old inverse expression (1/2−1)·9=−9/2 | Retain velocity-independent hypothesis |
| A61 | UNSW41ScalarLegendre, 200–204 | e=A₀=1,φ=1,π=π̄=0,m=0,no spatial derivatives | Actual (dot φ̄,dot φ)=(i,−i),H=0,H₀=0; L_int at free velocities=1, correction e²A₀²|φ|²=1; RHS=−1+1=0 | Retain corrected formula |
| A62 | Complex canonical covector, 200 | δφ=δx+iδy, p_x=2,p_y=4 | π=1−2i; πδφ+π̄δφ̄=2δx+4δy | Retain factor 1/2 |
| A63 | Free current normalization, 204 | φ=1,∂₀φ=i | j_free⁰=i(i−(−i))=−2, real; omit i gives 2i | Retain algebra; scan unavailable |
| A64 | Torus Gauss / charged flux, 205 | constant charge density 1 on volume V torus | ∫divΠ=0 versus ∫e j⁰=V≠0; exterior Coulomb field instead has flux 4πQ | Retain charge restriction |
| A65 | UNSW41GaugeComparison, 206 | e=α=1 | ∂G/∂π=iφ, ∂G/∂π̄=−iφ̄; after spatial IBP ∂G/∂Π=−dα=0 | Retain |
| A66 | Time-dependent generator, 206 | α=t² | δA₀=−2t; δu=−2; δΠ₀=0; two Abelian generators have bracket 0 | Retain |
| A67 | Klein–Gordon sign, 209; Suggested 218 | m=2,u=3,h₀₀=5,h₁₁=7 | E=−5+7−4·3=−10; −(□+m²)u=−(5−7+12)=−10 | True model Check; R02 |
| A68 | Oscillator, Suggested 227 | m=2,u=3,h₀₀=5 | E=−12−5=−17; −(m²u+h₀₀)=−17 | True model Check; R02 |
| A69 | Borcherds52Quadratic, 211 | supported φ,h; scale φ↦(1+t)φ | derivative of (1+t)²(φ,Aφ) is 2(φ,Aφ); Hessian=2A=−P, not A | Retain factor 2 |
| A70 | Quadratic plus source, 211 | one coefficient A=−2,φ=3,J=5 | derivative of −2φ²+5φ is −12+5=−7; 2Aφ+J=−7 | Retain normalization control |
| A71 | MaxwellSourceAdapter, 215–223 | local A₀=x₁²/2,A_i=0 | F¹⁰=−x₁, E⁰=−1−J⁰; δS under dχ is ∫χ divJ | Retain sign |
| A72 | Maxwell gauge invariance iff, 215–217 | fixed J⁰=t,Jⁱ=0, supported χ with ∫χ=1 | divJ=1; δS=1, while conserved J=constant gives δS=0 | Retain both directions |
| A73 | Native/physical Clifford form, 234–239; Suggested 250 | x=(1,2,3,4) | P x=(4,−3,2,1); Q(Px)=28=−(1−4−9−16); detP=−1 | Retain |
| A74 | Conjugate Weyl transport, 241–245 | A=diag(2,1/2) | ε bar(A) ε⁻¹=diag(1/2,2)=(A†)⁻¹; T†H₀T has blocks 0,ε,−ε,0 | Retain |
| A75 | FiniteDirac Clifford headline, 245–258 | physical basis e₀,e₁ | C(e₀)²=I₄,C(e₁)²=−I₄; Γ⁰Γ¹+Γ¹Γ⁰=0; zero gamma matrices would give 0≠I₄ | R01: statable matrix target absent |
| A76 | Spin restriction, 248–252 | s=ι(Pe₁)ι(Pe₂), norm 1 | Native A=σ₃σ₁=ε; c(s)=diag(ε,ε)=ρ_W(A), since (ε†)⁻¹=ε | Retain convention on this Spin element |
| A77 | Chirality, 266–278 | specified Pauli order | iΓ⁰Γ¹Γ²Γ³=diag(1,1,−1,−1); its square=I₄; unphased product square=−I₄ | Retain |
| A78 | Flat real Dirac density, 280–283 | ψ=(f(t),0,f(t),0), real f,m=0 | L=2iff′, V⁰=2f², (i/2)∂V⁰=2iff′; Re L=0=L−2iff′ | Retain |
| A79 | Dirac vector/axial currents, 284–292 | ψ=(1,0,0,0), Γ⁵ψ=ψ | V⁰=1; j_V⁰=j_A⁰=−1; j_+⁰=−1,j_-⁰=0 | Retain sign and projectors |
| A80 | Noether I, 316 | mechanics translation in q,L=u₁²/2,Q=1 | j=u₁; Dj=u₂=−E·Q; on u₂=0, Dj=0 | Retain |
| A81 | Maxwell superpotential, 316 | ε=1, E^μ=∂νF^νμ | ∂ν(εF^νμ)−εE^μ=0; direct current −F^μν∂νε=0 | Retain constant-parameter cancellation |
| A82 | Noether II joint identity, 320–328 | L=u₀²/2,R=D, arbitrary ε | δL=u₀ε₁; RᵗE·ε+D(u₀ε)=−u₁ε+u₁ε+u₀ε₁ | Retain |
| A83 | Noether II false weak quantifiers, 326 | same L,R; fixed ε | Pointwise primitive ∫u₀ε₁ dx may exist, but RᵗE=−u₁, equal −1 at u₁=1 | Retain joint-jet requirement |
| A84 | Current support, 328 | B=u₀ε for supported ε | Outside supp ε, ε and all derivatives=0, hence B=0; ε=0 gives B=0 | Retain homogeneity |
| A85 | Noether II n=0, 331 | L=u²/2,Rε=2ε,u=3 | δL=6ε=RᵗE·ε; divergence=0 | Retain separate branch |
| A86 | Maxwell symbol, 335 | ξ=(1,0,0,0) | M=diag(0,1,1,1), row ξ·M=0; at ξ=0, M=0 and pointwise kernel dimension 4, unlike polynomial-module rank 1 | Retain polynomial carrier |
| A87 | Scalar stabilizer, 336 | connected domain,e=1,φ=0 versus φ=1 | Constant ε=c allowed for φ=0; cφ=0 forces c=0 for φ=1 | Retain configuration/local-operator distinction |
| A88 | Yang–Mills adjoint square, 337 | non-Abelian curvature | D_A²ε=[F_A,ε]; for su(2) basis F=e₁,ε=e₂ gives e₃≠0; invariant contraction giving gauge identity cancels | Retain no universal square-zero assertion |
| A89 | Strict Koszul differential, 339 | two equations E₁=x,E₂=y | δ(e₁e₂)=xe₂−ye₁; δ²(e₁e₂)=xy−yx=0 | Retain |
| A90 | Stationary-ring annihilator, 341 | cycle z,δz=0,δe=x | δ(ez)=xz; hence x[z]=0, whereas a free C∞-module generator would survive multiplication by x | Retain stationary coefficients |
| A91 | RegularCoordinates mixed metric, 345–349 | g⁻¹=[[2,1,1],[1,3,0],[1,0,4]] | B=[[5,−1],[−1,7]],detB=34=2·detg⁻¹; C=(0,3), so the off-diagonal leader coefficient is nonzero | Retain full block |
| A92 | Leader counts, 353–359 | pure n=2,d=1,r=2 then 3 | N₂=2,N₃=5; 2 second-order equations, then 6 equation/prolongation labels with 1 dependency | Retain counts |
| A93 | Scalar coupled leaders, 359 | n=4,d=1,m=2,r=2,φ=0 | N₂=3+1+2=6; scalar principal coefficients remain nonzero at φ=0 | Retain no field-value stratification |
| A94 | Identity triangular elimination, 361 | Abelian r=3 | −D₀E⁰=Σ_i D_iE^i; dependent coefficient −1, determinant −1; no order-4 jets | Retain |
| A95 | Identity normal form, 365–371 | equations (x,0), odd generators (η,z) | δη=x,δz=0; H₁=(C∞/(x))z; xz=δ(ηz) | Retain quotient coefficients |
| A96 | KTResolution, 373–379 | δc=z,δz=0,δ η=L | H(z)=c,H(L)=η; (δH+Hδ)z=z and on L gives L; πz=πL=0 | Retain |
| A97 | KT contraction normalization, 377 | c² and zc | δ(c²)=2cz, H(cz)=c²/2; Hδ(c²)=c²=id−ιπ on c² | Retain radial division; no A_r-linearity |
| A98 | LowDimensions n=1, 381 | flat U(1), only δc_k=−e_(k+1) | e₀ is cycle and not boundary; adding δb₀=e₀ makes its class 0 | Retain complete identity list |
| A99 | Redundant gauge antifields, 381 | δb=e,δc=Rᵗe | δ(c−Rᵗb)=Rᵗe−Rᵗe=0; δt=c−Rᵗb kills it | Retain |
| A100 | LowDimensions n=0, 383 | no connection components | Minimal H₀=F,H₁=H₂=0; unpaired degree-2 c gives [c]≠0; δs=c removes it | Retain |
| A101 | Strict reducibility, 385 | n=1,R=D,Z=aD^k+… | Principal coefficient of DZ is a; DZ=0 forces a=0 recursively; constant configuration ε has Dε=0 nonetheless | Retain distinction |
| A102 | Scalar Hilbert stress, 392 | m=2,u=3,u_t=4,one spatial derivative=5 | T⁰⁰=(16+25+36)/2=77/2≥0; canonical formula gives 16−(16−25−36)/2=77/2 | Retain |
| A103 | Maxwell Hilbert/canonical energy, 392 | E=(2,0,0),B=0,∇Φ=(3,0,0) | T_H⁰⁰=2; T_can⁰₀=2+6=8; difference=E·∇Φ=6 | Retain improvement qualification |
| A104 | DiracRealAction torsion trace, 400–408 | flat 4D metric, Γ₁ has boost block [[0,a],[a,0]] in directions 0,1, other Γμ=0; V=(1,0,0,0) | t₀=a, coordinate density divergence=0, ∇μVμ=a; λ_uns−λ_sym=ia/2 | Retain bulk correction |
| A105 | Density correction, 406–408 | torsion-free,f=e^x,V=∂x | tρ=−dx; ρ⁻¹∂(ρV)=1; density divergence+tρ(V)=0=∇V | Retain −d log f |
| A106 | Symmetrized Dirac Euler term, 408 | constant Γ,flat ∇,ρ=e^x,m=0 | integration by parts adds +(i/2)Γ^xψ; −(i/2)tρΓψ=+(i/2)Γ^xψ | Retain sign |
| A107 | Fixed-carrier metric variation, 410 | g_t=(1+t)g₀ near 0 | A_t=(1+t)I,b_t=(1+t)^(−1/2)I; g_t(b_tv,b_tw)=g₀(v,w); b′₀=−I/2 | Retain branch/compact-support qualification |
| A108 | Noncanonical long-path transport, 412 | constant g_t=g₀ | Near-identity b=I, Clifford coefficients unchanged; arbitrary unrelated endpoint spin lifts have no supplied identification | Retain chosen lift/transport requirement |
| A109 | Reduced-action chain rule, 414 | finite-dimensional control S(e,ω)=eω,ω(e)=e² | S_red=e³, derivative=3e²; holding ω fixed gives e², connection term contributes 2e² | Retain independent/restricted distinction |
| A110 | Metric inverse/density, 420 | g_t=diag(1+t,−1) at t=0 | derivative g⁻¹=diag(−1,0)=−g⁻¹hg⁻¹; derivative sqrt(abs detg)=1/2=(tr_g h)/2 | Retain |
| A111 | Literal quartic normalizations, 424–430 | u=1,λ=6,m=0,zero derivatives | Physical −λu⁴/24 gives E=−1; literal −λu⁴ gives E=−24, normalized zero equation cubic coefficient 12 | Retain algebra; literal scan unavailable |
| A112 | Literal interaction sign, 433–436 | u=1,λ=24 | +λu⁴/24=1 versus physical −λu⁴/24=−1; first perturbative action coefficients have opposite sign | Retain distinction |
| A113 | Literal Maxwell indices/coupling, 437–446 | choose E^μ=∂νF^νμ=1,J^μ=1 | Minus coupling equation E−J=0; reversed-index expression −E−J=−2; plus coupling gives E+J=2 | Retain algebra; literal scan unavailable |
| A114 | Bianchi control, 449–453 | A=x dy on ℝ³ | F=dx∧dy; all cyclic derivatives=0; dF=0 | Retain |
| A115 | ScalarStage quotient definition, Suggested 21–115 | f=u₀ at r=0 and its pullback at r=2 | Both common-stage values=u₀; derivatives both u₁; f and u₀+1 remain unequal at every stage | True prototype; R01 |
| A116 | ScalarStage eulerAllOrders, Suggested 117–122 | r=0,L=u₀²/2; r=1,L=u₁²/2 | E=u₀ and E=−u₂ respectively; r=0 has exactly one summand | True prototype; R01 |
| A117 | Coordinate directions/Hessian, Suggested 127–180 | n=N=1, j=(u,v),h=(a), L=u²+v² | fieldPartial=2u,gradientPartial=2v,totalDerivative(v)=a,E=2u−2a; at (2,3,5),E=−6 | True prototype; R01 |
| A118 | Contact declarations, Suggested 182–198 | holonomic tangent (dx,du,dv)=(1,v,a) | contactZero=v−v=0; contactOne=a−a=0; independent vertical du=1 gives contactZero=1 | True definition tests; R01 |
| A119 | Zero-index carriers, Suggested 127–198 | n=0 or N=0 | Fin0 has 0 indices; base/horizontal sums=0; no fabricated component index; with n=0,N=1 Euler reduces to fieldPartial | No out-of-range/junk-index defect found |
| A120 | Real-descent padding witness, RealFieldsSuggested 22–30 | K=(starLinearEquiv ℂ).toLinearMap | Native `realPoints K` and `selfAdjoint V` elaborate as the same subtype/module here; both complete one-`exact` probes return exit 0 | R02: delete both from Suggested files |


## Not verifiable

- **Exact Borcherds collection edition:** the 121-page scan identified by the README's digest was not found by the sources service using either the supplied local filename or the `local:`-prefixed citation. No manifest/cache entry was supplied. The related Berkeley course URL does not identify this exact artifact. Thus pp.35–54,107,110,115–118, the literal coefficients, alleged omissions and handwritten glyph uncertainties are not source-certified. The algebraic formulas were tested independently in the table; a plausible calculation does not verify what the scan says.
- **Exact UNSW collection edition:** the 62-page scan was likewise unavailable through both filename forms and source resolution. Its pp.13–14,19–20,31,41 literal Hamiltonian, current and coupling claims remain unverified. The report does not adopt the README's attributed errata as independently found source errors.
- **Downstream QuantumFoundations and RelativisticQuantumFieldTheory ownership:** neither is present in the supplied main tree, and the brief gives no readable open-head path for either. Their QF/RQFT section claims were not independently resolved. No new checkout was fetched to fill this gap. This limitation does not introduce an upward prerequisite into LVF.
- **Source support for the additional global/graded/finite-stage extensions:** the retrieved primary texts support the comparisons described above, not every added arbitrary-bundle, Schwartz/flux-domain, torsionful or finite-order-sheaf theorem. The README generally labels these as its own construction obligations. The computations test signs and edge cases; they are not completed general proofs of these new library results.

The missing-reference record contains only the two unavailable collection scans. Anderson was subsequently obtained and removed from that record. This review is finished with a needs-changes verdict; it is not parked for sources.

## Source issues

- **Misprint** in bbh at §5.1.3, Dirac-field paragraph, printed p.31 (`bbh` line 1213): the source says the stationary surface in zero-jet space is empty; it should be the whole zero-jet space, since first-order equations constrain no zero-jets; affects nothing.
- **Misprint** in anderson at Theorem 5.9, equation (5.26a), printed p.204 (`anderson` lines 9345–9346): the source says unaugmented horizontal cohomology agrees with de Rham cohomology through degree n; it should use Euler-augmented cohomology at degree n, or restrict unaugmented horizontal cohomology to degrees below n; affects a stated result.

For the second issue, on E=ℝ×ℝ with n=1, `u² dx` has Euler coefficient `2u`, so it is not a divergence, whereas H¹_dR(E)=0. The surrounding theorem concerns the Euler–Lagrange complex and its proof uses that augmentation. The roadmap already makes the needed distinction correctly at line 109.
