# Review of LocalVariationalFieldTheory (pull request #916 at e8c937a)

**Verdict:** accepted

:robot: Independent AI review. Two P3 findings remain in the secondary acceptance file; no P1 or P2 finding. The recorded gate passes. This verdict means ready for a human's final approval, not approval or merge by the AI. The two collection scans and two downstream-only roadmap references have the access limitations recorded below.

## R01 (P3) — Delete the two remaining real-descent padding theorems

**Location:** `TauCetiRoadmap/LocalVariationalFieldTheory/RealFieldsSuggested.lean:22,28`: “theorem realField_descent” and “theorem realField_finrank”.

**Claim:** These are new acceptance targets. Both are direct applications of pinned results already consumed by README lines 90–98. They remain unchanged after the previous R02; the scalar/oscillator padding in the main file has been removed.

**Witness:** `TauCeti/LinearAlgebra/Complex/Conjugation.lean:271,278,296` supplies the equivalence, tensor formula and rank identity. Both scratch probes below elaborate with no warnings:

```lean
exact ⟨TauCeti.realPointsEquiv
  (K := (starLinearEquiv ℂ).toLinearMap) star_star,
  TauCeti.realPointsEquiv_tmul
    (K := (starLinearEquiv ℂ).toLinearMap) star_star⟩
```

```lean
exact TauCeti.finrank_realPoints
  (K := (starLinearEquiv ℂ).toLinearMap) star_star
```

**Repair:** Delete these declarations from `RealFieldsSuggested.lean`; do not prove them in place. The README already cites their supplier. If nothing remains in this secondary file, delete the file. The retained categorical/polynomial-jet comparison belongs in the README.

**Test of repair:** The native maps send `1⊗2+i⊗3` to `2+3i`; fixed/complex dimensions for ranks 0, 1, 2 are respectively `(0,0)`, `(1,1)`, `(2,2)`. Deletion loses no new mathematical target. The extra finite-dimensional assumption on the second theorem is unnecessary: the native theorem also covers infinite-dimensional modules, with both finranks zero.

## R02 (P3) — Apply the acceptance-file form to the secondary file

**Location:** `TauCetiRoadmap/LocalVariationalFieldTheory/RealFieldsSuggested.lean:5–16`: “import Mathlib.LinearAlgebra.Complex.FiniteDimensional”, “import Mathlib.LinearAlgebra.TensorProduct.Basic”, and “namespace LocalVariationalFieldTheory”.

**Claim:** The Lean form rules apply to each listed Lean file. This file still has Mathlib submodule imports, no `import Mathlib`, the wrong namespace, and a generic “suggested forms” docstring instead of the headline/missing-carrier inventory. Its two declaration names also do not appear in the README. The main file has repaired these issues.

**Witness:** The elaborated names are `LocalVariationalFieldTheory.realField_descent` and `.realField_finrank`; the required namespace is `TauCetiRoadmap.LocalVariationalFieldTheory`. The worker gate reports zero import violations despite this secondary-file content.

**Repair:** Deleting the empty secondary file after R01 resolves this finding. If it is retained with substantive targets, use `import Mathlib`, only necessary individual Tau Ceti imports, the required namespace, mathematical declaration docstrings and the target-signatures module docstring; reconcile every retained name with the README.

**Test of repair:** The R01 probe uses `import Mathlib` and the individual conjugation module successfully. All seven existing declarations were checked with `#check @name`; no needed binder was silently lost. Namespace/import cleanup does not require altering the mathematics.

## Verified sound

### Disposition of the previous review

No repair report marking a finding “not actionable in this package” was supplied or found in this package's reports. These are fresh checks against the specified head and available supplier versions, not an incremental approval.

| Previous finding | Current passage/evidence | Disposition |
|---|---|---|
| R01, prototypes instead of headlines | `Suggested.lean:10`: “The other headlines are not statable at the pins”; lines 65 and 77 now state the finite Clifford/Spin and covariance/pairing comparisons. | Repaired. The long scalar prototype is gone, and missing general carriers are named. |
| R02, four padding theorems | `RealFieldsSuggested.lean:22,28` still declares the two real-field theorems. The main file's oscillator/Klein–Gordon declarations are gone. | Partly repaired; remaining part is R01 above. |
| R03, missing structure/API/Checks/dependencies | README has “Exact supplier contracts”, 29 numbered sections, 29 `*Needs:*` lines, 29 Checks lists and six Examples/Dependencies endings. | The structural defect is repaired. The computations below exercise the added checks and retained API rather than counting headings alone. |
| R04, Lean form | Main file begins “Local variational field theory: target signatures”; secondary file still says “These are suggested forms.” | Partly repaired; remaining part is R02 above. |
| R05, global first-variation/Lepage locator | README:291 cites “§5A, Corollary 5.3, printed p.197” and “Corollary 5.5, printed p.200”; §2.3 also cites Theorem 5.9. | Repaired; exact passages reopened at `anderson` lines 9116, 9190, 9337. |
| R06, UnboundedOperators UO1–UO5 | README:1167 retains “UnboundedOperators UO1–UO5”. The supplied OperatorTheory head now has “Milestone names and dependency order” and the UO1–UO5 table. | Resolved by the supplier's present text, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:331–342`. Do not repeat the old missing-anchor finding. |

### Gate, elaboration and declaration probes

Verified head `e8c937a8910c561867eeeb7f664723d2f0bd7892`, a clean worktree, and an empty outside-folder diff against `origin/main`. No worktree file was changed. The worker's gate reports every check zero, including build, imports, stray-files, outside-folder and dependency checks, ending `OK`. Its secondary-file import blind spot does not turn the reported passing gate into an independently observed failure; R02 records the content defect directly.

Built only the needed imported module `TauCeti.LinearAlgebra.CliffordAlgebra.Spin.Real.ThreeOne`, then elaborated the original main and secondary Lean files separately. Each exits successfully with exactly two intentional `sorry` warnings. A scratch signature copy prints all seven explicit declarations: three main definitions, two main theorems and two secondary theorems. The main signatures have no hidden standing hypotheses; the secondary signatures retain the additive, complex-module, star-additive and star-module assumptions, and finrank retains finite dimensionality. No binder repair was needed.

Tested all four admitted declarations for padding: the two secondary declarations close by one `exact` as shown above; replacing each main admission by `simp` leaves its substantive goal unsolved. Reading the definitions and the Clifford universal property confirms that neither main target is a definition unfolding or a single existing library theorem: constructing the extension and identifying its restriction, or deriving the four-by-four covariance/pairing identities, still requires the comparison argument.

The independent dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1406 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All 29 `*Needs:*` lines and supplier paragraphs were read. The apparent Layer 3/4/5 forward references are explicitly separated into earlier generic constructors and later model comparisons at README:752–761; the generic Noether theorem does not consume its model applications. The metric/density part of §6.3 precedes §6.2 and uses no Dirac-variation conclusion. No declared gaps, route-specific good-case exclusion, sorry-valued data, `set_option`, computational algorithm or re-planning of an existing roadmap was identified. The finite leader elimination is a mathematical coordinate construction.

### Headline inventory

| Headline from the README | Acceptance coverage at the pins |
|---|---|
| General nonlinear bundle jets, prolongation and locally finite-order bicomplex (§1.1/1.3) | Named in the module docstring; missing nonlinear jet/contact/sheaf operator carriers. |
| Real/complex polynomial-jet comparison (§1.2/1.4) | Named in the docstring; the jet algebra is missing. Plain descent/rank is already native and should be removed from the secondary file. |
| All-order first variation, interior Euler projection, global Lepage existence (§2.1/2.2) | Named with missing density/source/Lepage carriers. |
| Untwisted and orientation-twisted global variational cohomology (§2.3) | Named with the missing augmented variational complex. Ordinary de Rham theory alone is insufficient. |
| Differential-substitution Euler chain rule (§3.1) | Named with missing jet substitution, linearization and evaluated density transpose. |
| Intrinsic graded Cauchy bracket and constraints (§3.3–3.8) | Named with missing admissible functional/domain and graded spatial-jet interfaces. |
| Exact finite Dirac Clifford/Spin comparison (§3.10) | Stated as `diracClifford_spin_comparison` using native algebras/matrices and three simple definitions. |
| Finite Dirac covariance and invariant pairing (§3.10) | Stated as `dirac_covariance_and_pairing` on the actual native Spin action. |
| Noether I and improvement (§4.1) | Named with missing characteristics, source forms and current carriers. |
| Joint-parameter Noether II equivalence (§5.1) | Named with missing joint jets and current operators. |
| Regular coordinates, stationary identity presentation, KT exactness, including n=0,1 (§5.4–5.7) | Named with missing smooth equation-jet/sheaf complexes; native exterior/symmetric algebras are not those complexes. |
| Global real Dirac variation and Hilbert/Belinfante comparison (§6) | Named with missing Lorentzian spinor, metric/coframe variation and density adapters. |

The cyclic-module bijection is an auxiliary algebraic comparison, not a substitute for a missing headline. Scalar/oscillator computations remain README Checks. No other statable headline was identified as absent.

### Pinned library and ownership audit

Pins checked from the manifest: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths in the following table are relative to those repositories. These are inspected declarations, not claims based on a newer library.

| Pinned object opened | File/line and consequence |
|---|---|
| `realPart`, `imaginaryPart`, `realPart_add_I_smul_imaginaryPart` | `Mathlib/LinearAlgebra/Complex/Module.lean:387,395,413`; fixed real subspace and decomposition, with no Hermitian metric requirement. |
| `realPoints`, `realPointsEquiv`, tensor/inverse formulas, `finrank_realPoints` | `TauCeti/LinearAlgebra/Complex/Conjugation.lean:116,271,278,285,296`; fixed points of a conjugate-linear map, with involutivity separately required for descent. Rank has no finite-dimensional premise. |
| `tmulConj`, involutivity, base-change naturality | Same file:311,339,383; real-linear base change commutes with coefficient conjugation. LVF's new content is the categorical/jet comparison. |
| Fundamental lemma | `Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:205`; open domain, local integrability, smooth compact tests with support inside the domain, conclusion almost everywhere. It does not itself give pointwise equality. |
| Kähler carrier and universal derivation | `Mathlib/RingTheory/Kaehler/Basic.lean:148,226`; quotient module and degree-one derivation, not the full jet bicomplex. |
| Clifford inclusion and universal property | `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean:111,136,165`; a real-linear vector map with the exact square law extends to an algebra map. |
| Native Hermitian vector dictionary and even generator formula | `TauCeti/LinearAlgebra/CliffordAlgebra/RealForm/ThreeOne.lean:79,133,151,310`; explicit coordinates, determinant −Q and exact product images. Both Weyl blocks were tested on all 16 ordered basis pairs. |
| Native Spin–SL₂ map and action | `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/Real/ThreeOne.lean:79,90,130,264`; the Spin map uses the actual even matrix model, and vector action is Hermitian congruence. |
| Positive Levi–Civita carrier | `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita.lean:156,359`; standing `RiemannianBundle`, uniqueness restricted to differentiable fields. It supplies no indefinite metric-family theorem. |
| Positive smooth Levi–Civita regularity | `TauCeti/Geometry/Manifold/VectorBundle/CovariantDerivative/LeviCivita/Regularity.lean:163,292`; finite regularity bounds and smooth Riemannian specialization. |

Object searches used `roadmaps grep` for jets, density transposes/formal adjoints, descent, Dirac bundles, Legendre theory, Cauchy functionals and Koszul–Tate theory; searched main, the available indexed heads and package README/Lean files; and searched both pinned libraries. The board-package search for jet/bicomplex/KT/Cauchy objects returned no competing specification. No duplicate fully qualified declaration name was found. The native duplication actually witnessed is R01. Read main DifferentialGeometry, HopfRinow and SpinGeometry for shape and ownership. Existing SpinGeometry G3–G5 is Riemannian/Hermitian or compact-group geometry; LVF's indefinite Lorentzian pairing and torsionful action adapter is distinct. General bundle and connection construction remains with SBC.

| Resolved cross-roadmap interface | Current location and audit |
|---|---|
| DifferentialGeometry forms/orientation/integration | Main `TauCetiRoadmap/DifferentialGeometry/README.md`, Layers 0–2, §§5.2–5.5; density entry at 528. Form and boundary hypotheses remain attached. |
| DifferentialGeometry cohomology and metric comparison | Same file:782,920,923, Layer 6 and §§12.3–12.4. Ordinary de Rham and positive-metric inputs only; orientation-local-system variational comparison stays here. |
| SmoothBundlesConnections associated bundles/densities/frames | Supplied head `TauCetiRoadmap/SmoothBundlesConnections/README.md:439,615,635`, B2.1/B2.4/B2.5. |
| SBC connections and curvature | Same file:693,741,778,802, B3.1–B3.3/B4.1–B4.2. |
| SBC good covers/Čech comparison | Same file:1043,1111, B6.0–B6.1. Constant-coefficient comparison exists; twisted variational construction is not attributed to it. |
| SBC positive Yang–Mills normalization | Same file:1478,1509. Its energy is ∫‖F‖² and derivative has factor 2; LVF's −F²/4 gives −one-half that energy and Euler −D_A†F. Its left-action gauge generator is −D_Aξ; LVF's +D_Aε uses ε=−ξ. |
| PseudodifferentialOperators P1.0 | Supplied head `TauCetiRoadmap/PseudodifferentialOperators/README.md:255,387–411`. Owns linear vector-bundle jets and the two smooth-base transposes. LVF compares nonlinear jets and evaluated jet-dependent coefficients; it does not replace P1.0. |
| HopfRinow Layer 1 | Main `TauCetiRoadmap/HopfRinow/README.md:244–287`. Explicit nondegenerate metric, joint family and tensorial connection-variation contract; no positive signature/completeness premise is imported. |
| IntegrableSystems I3 | Main `TauCetiRoadmap/SymplecticGeometry/IntegrableSystems/README.md:213–230`. Time-dependent first variation, endpoint terms and quasi-invariant currents; regular/local versus hyperregular/global Legendre hypotheses match. |
| SpinRepresentations Layer 7 | Main `TauCetiRoadmap/RepresentationTheory/SpinRepresentations/README.md:881–955`. Norm-one group, full norm-±1 cover, component qualifications and indefinite Lie adapters match LVF's distinction. |
| UnboundedOperators UO1–UO5 | Supplied OperatorTheory head, `TauCetiRoadmap/OperatorTheory/UnboundedOperators/README.md:331–342`; the grouped milestones and anchor now exist. Boundary only, not a prerequisite. |
| NoncompactQuantumSymmetry M4–M6 | Supplied head `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md`, M4, M5:3263 and M6:5831; particle representations/kinematics, not local variational fields. Boundary only. |
| OperatorAlgebraDynamics D8 | Main `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:554`; CAR/Weyl/Fock scope matches the quantum boundary. |

The citation resolver reports no unresolved names, but also says it did not inspect pinned library names. Direct library checks above supply that evidence. It is not a substitute for exact-section checks; the inaccessible QF/RQFT boundary references are recorded below. Ownership against open work with no supplied readable files is not certified. No new supplier edge or ownership move is proposed.

### Seeded source sample

Four texts were fetched through the sources service and read at the locators. The Anderson copy is the openly distributed manuscript linked in the README; the other three are the explicitly cited arXiv versions, avoiding a claim about different published numbering. All source descriptions below are paraphrases.

| Seeded target | Source text/locator checked and scope |
|---|---|
| 1.2 Real descent and field evaluations | Borcherds p.35 unavailable. Native descent and naturality were checked at the pin; the categorical/polynomial extension is not claimed to have been read in that scan. |
| 2.3 Global variational cohomology and density twisting | `anderson` lines 8898–8904 (Theorem 5.1, p.191), 9337–9348 (Theorem 5.9, pp.203–204). Augmented positive-contact rows and Euler-augmented top degree match. Orientation twisting/sheaf comparison is explicitly LVF work. |
| 3.1 Jet-coefficient transpose and differential redefinition | `bfls` lines 664–676, §3.2 equations (25)–(26), printed p.16, puts the coefficient inside (−D). `anderson` lines 2922–2941, Theorem 2.12, pp.46–47, supplies the interior-Euler input. Differential substitutions and variable-density Hermitian adapters are the stated extension, not a quoted general theorem there. |
| 3.2 Model equations and cyclic solution modules | Borcherds pp.37–40 unavailable. Independently checked the left-module universal property, non-A-stable kernel and concrete ODE action. |
| 3.3 Cauchy phase bundles and admissible domains | `bfls` lines 683–708, equation (27), printed p.17, is the local-functional bracket comparison. It does not supply all global/Schwartz/boundary domains; those are constructed explicitly here. |
| 3.5 Canonical bracket, grading and multilocal algebra | Same locator; source uses a skew-adjoint differential operator and local variational derivatives. LVF separately proves its canonical, graded, chart/domain and multilocal extensions. |
| 3.7 Legendre interaction comparison | UNSW pp.13–14/41 unavailable. The regular Legendre calculation and velocity-dependent counterexample were recomputed. |
| 3.9 Quadratic normalization and sourced Maxwell | Borcherds pp.46–48/52 and UNSW p.31 unavailable. Hessian/source factors and both directions of the fixed-current conservation test were recomputed. `bbh` §6.6 supports the Noether comparison, not the literal scan reading. |
| 3.10 Finite Dirac Clifford and Spin comparison | Borcherds pp.107/110/115–118 and UNSW pp.19–20 unavailable. The actual native generator formulas, Clifford squares, dual-frame/chirality, covariance and pairing were checked independently. |
| 5.1 Joint-parameter Noether II | `bbh` lines 1922–1935, §6.6 equation (6.27), printed p.48: enlarge jets by ε and use finite-order linear homogeneous parameter dependence. The source's later completeness uses regularity; LVF's basic integration-by-parts iff does not assume completeness. |
| 5.5 Identity normal form and stationary presentation | `bbh` lines 1231–1257, §5.1.3 equations (5.10)–(5.13), pp.31–32, and 1316–1355, Theorem 5.1/proof, pp.33–34. Dependent equations have a triangular identity matrix; LVF states the stationary-ring and smooth finite-stage refinements separately. |
| 5.6 Koszul–Tate resolution and contraction | `bbh` lines 1316–1355, same theorem and paired-variable proof. The regularity hypotheses are retained via §5.4; smooth radial homotopy, budgets and sheafification are LVF obligations. |
| 5.7 Dimensions zero and one, and reducibility | `bbh` lines 1237–1251 use two coordinate directions; the cited split does not establish these low-dimensional cases. LVF explicitly supplies separate contractible-pair constructions, checked below. |
| 6.2 Real Dirac action with independent connection | `bgm` lines 743–754, §5 Theorem 5.1, p.14, concerns metric-induced Dirac variation. It does not certify arbitrary torsionful connections. LVF derives their trace/density correction from its own Green/divergence identity. |
| 6.3 Metric transport, coframe variation and reduced stress | `bgm` lines 743–754, p.14, and 820–876, §6 pp.15–16, retain the chosen spinor identification and on-shell stress qualification. The near-identity inverse-square-root branch and independent-connection reduction are stated as constructions, not a canonical identification of arbitrary endpoint metrics. |

Also reopened Anderson Definition 2.11 (p.44, line 2833), Corollary 2.13(i) (p.49), Propositions 4.1–4.3 (pp.114–115, lines 5944–5960), and Corollaries 5.3/5.5 (pp.197/200, lines 9116/9190). The source's infinite-jet results are distinguished from LVF's finite-stage and locally finite-order versions. All literal-source uncertainty paragraphs were read; unavailable scan contents are not silently certified.

### Adversarial computations

These are computations of the stated objects and negative controls, not formal proofs of every general theorem. Every numbered target section, each headline, both findings and all 15 sampled targets occur below. Unless a row specifies a repair, its result is agreement and no change. Empty/rank-zero cases are included where the object admits them; arithmetic characteristic-p/DVR tests are inapplicable to this roadmap's explicitly real/complex coefficients. Matrix tests use the actual pinned coordinate formulas, not an arbitrary representation with the same squares.

Computed rows: **160**.

| ID | Statement / locator | Instances | Computed left side | Computed right side / control | Result and change |
|---|---|---|---|---|---|
| A001 | Conventions: symmetric jets, README:41 | u(x,y)=xy at 0 | u₁₂=u₂₁=1 | One symmetric coordinate, not two independent variables | Agreement; ordered sums need multiplicities |
| A002 | Contact stage, 41 | u=x² at x=1, tangent to j¹u | θ₀=2−2=0; θ₁=2−2=0 | Holonomic pullback 0; vertical unit gives θ₀=1 | Agreement; raised second stage required |
| A003 | Horizontal/vertical signs, 45–49 | f=u₀ in one dimension | d_Vd_Hf=−dx∧θ₁ | d_Hd_Vf=+dx∧θ₁; sum 0 | Agreement |
| A004 | Horizontal square, 49 | u(x,y)=xy | d_H²u=(1−1)dx∧dy=0 | 0 | Agreement |
| A005 | Density twist, 51 | x↦−x | dx↦−dx; orientation generator↦−o | dx⊗o↦dx⊗o | Agreement; untwisted sign would be −1 |
| A006 | Bilinear versus Hermitian pairing, 55–60 | a=i, u=v=1 | Bilinear B(au,v)=i, transpose coefficient i | Hermitian h(au,v)=−i, adjoint coefficient −i | Agreement; no interchange of the two transposes |
| A007 | Odd left/right derivative, 61–64 | F=θ₁θ₂ | ∂L₁F=θ₂, ∂L₂F=−θ₁ | ∂R₁F=−θ₂, ∂R₂F=θ₁ | Agreement; even F gives sign −1 |
| A008 | Odd reversal, 53/68 | θ₁*,θ₂*=θ₁,θ₂ | (θ₁θ₂)*=θ₂θ₁=−θ₁θ₂ | Reversal law; unreversed rule gives +θ₁θ₂ | Agreement |
| A009 | §1.1 jet equivalence and truncation | u=1+2x+3x²/2, at 0 | j²=(1,2,3); truncate twice=1 | Direct order-zero truncation=1 | Agreement |
| A010 | §1.1 nonlinear coordinate change | v=u², (u,u₁,u₂)=(2,3,5) | (v,v₁,v₂)=(4,12,38) | (u²,2uu₁,2u₁²+2uu₂) | Agreement |
| A011 | §1.1 affine top-order difference | Same jet, u₂:5→6 | v₂:38→42, difference 4 | Fibre derivative 2u times difference 1 =4 | Agreement; not a canonical vector difference across field values |
| A012 | §1.1 jet realization | a+bx+cx²/2 with cutoff 1 near 0 | Jet (a,b,c) before and after cutoff | Arbitrary prescribed second jet | Agreement |
| A013 | §1.1 zero dimensions/rank | Base point, or zero-dimensional fibre | JʳE=E on a point; vertical tensor rank 0 for discrete fibre | No derivative coordinates; affine model 0 | Agreement |
| A014 | §1.2 descent and inverse; R01 | z=2+3i | 1⊗2+i⊗3↦2+3i | Re z=2, Im z=3 reconstruct z | Agreement; delete duplicate theorem |
| A015 | §1.2 descent nonzero control | i⊗1 | i | Scalar multiplication i·1=i; zero map gives 0 | Agreement |
| A016 | §1.2 rank; R01 | Φ=0,ℂ,ℂ²; infinite-dimensional complex space | Real fixed finranks 0,1,2,0 | Complex finranks 0,1,2,0 | Agreement; native result covers all four |
| A017 | §1.2 naturality/unit-counit | f(w)=2w, i⊗3 | Descent then f gives 6i | Tensor f then descent gives 6i; inverse recovers i⊗3 | Agreement |
| A018 | §1.2 conjugation on jets | Generator u₁, coefficient 2+3i | Conjugate D((2+3i)u₀)=(2−3i)u₁ | D of conjugate=(2−3i)u₁ | Agreement |
| A019 | §1.3 total derivative | f=xu₀² at (1,2,3) | Df=u₀²+2xu₀u₁=16 | Base-only derivative 4 is wrong | Agreement |
| A020 | §1.3 locally finite order | χ_k u_k on disjoint intervals tending to infinity | Orders 1,2,3,… globally unbounded | On each compact only finitely many χ_k survive | Agreement; sheaf does not impose global uniform order |
| A021 | §1.3 compact-order qualification | One fixed base point with field values escaping | Higher-order terms on disjoint u-intervals have orders k | A compact subset of E sees a finite maximum; whole fibre need not | Agreement; compactness is in E |
| A022 | §1.3 polynomial differential complex | Polynomial u² | d_alg(u²)=2u du; d_alg²(u²)=2du∧du=0 | Map to smooth contact algebra gives 2uθ; d_V²=0 | Agreement |
| A023 | §1.4 generators versus field values | W=ℝ², evaluation (2,3) | e₁↦2, e₂↦3, 2e₁↦4 | Linear functional on W, a point of W* | Agreement |
| A024 | §1.4 formal product | (1+u+u²+…)(1−u) | Coefficients 1,0,0,… | Unit series | Agreement |
| A025 | §1.4 formal evaluation domain | ε²=0 versus u=2 | Series evaluates to 1+ε; partial sums at 2 are 1,3,7,15 | Nilpotent finite evaluation; no convergent real evaluation at 2 | Agreement |
| A026 | §1.4 filtration and derivative | u₀² and u↦u+1 | D(u₀²)=2u₀u₁ has degree 2; ∂u₀=2u₀ degree 1 | Translation produces constant 1, so fails zero-section filtration | Agreement |
| A027 | §1.4 two differential conventions | α=d_alg u₀, q=1 | Vertical-first D_H⁰α=θ₁∧dx=−dx∧θ₁ | (−1)^qD_H⁰α=dx∧θ₁=d_Hθ₀ | Agreement |
| A028 | §1.4 horizontal-first convention | α=u₀, β=dx, p=1 | d_V(u₀dx)=θ₀∧dx=−dx∧θ₀ | (−1)^p dx∧d_alg u₀ | Agreement |
| A029 | §2.1 first variation | L=u₁²/2 | Eδu+D(u₁δu)=−u₂δu+u₂δu+u₁δu₁ | δL=u₁δu₁ | Agreement |
| A030 | §2.1 all-order Euler/order bound | L=u₂²/2, r=2 | E=D²u₂=u₄ | Order 4=2r | Agreement; first-order prototype gives wrong 0 |
| A031 | §2.1 Poincaré–Cartan/Lepage | ρ=u₁du−u₁²dx/2 | Horizontalization u₁²dx/2; dρ one-contact term −u₂θ₀∧dx | L and Euler source with declared wedge order | Agreement |
| A032 | §2.1 Lepage ambiguity | n=1 versus n=2 | n=1 has no two-contact 1-form; n=2 admits θ¹∧θ² | Addition has horizontalization 0 and no one-contact part in d | Agreement; only n=1 unrestricted uniqueness |
| A033 | §2.2 fundamental lemma | f=0 or 1, nonnegative compact h with ∫h=1 | ∫0h=0; ∫1h=1 | Zero test functional versus nonzero coefficient | Agreement; continuous/full-support upgrade retained |
| A034 | §2.2 Euler kills divergence | L=u₀²u₁ | E=2u₀u₁−D(u₀²)=0 | E(D(u₀³/3))=0 | Agreement |
| A035 | §2.2 interior Euler projection | ω=u₁θ₁∧dx | Iω=−u₂θ₀∧dx; I²ω=Iω | ω−Iω is horizontal exact | Agreement |
| A036 | §2.2 homotopy augmentation | Constant 1, q=0 | d_H1=0, so unaugmented homotopy LHS=0 | id(1)=1; augmented id−constant projection=0 | Agreement; excluded unaugmented assertion is false |
| A037 | §2.2 vertical homotopy | ω=du and function 1 | Kdu=u, d_VKdu=du; K1=0 | (id−s₀*)du=du; (id−s₀*)1=0 | Agreement |
| A038 | §2.3 top cohomology | E=S¹×ℝ, λ=dθ | Euler 0, period 2π | Globally exact current period 0 | Agreement; nonzero top obstruction |
| A039 | §2.3 raw quotient distinction | λ=u₀dθ | Euler=1 | Not in ker E, despite defining a raw divergence-quotient class | Agreement |
| A040 | §2.3 local Helmholtz obstruction | One scalar source coefficient u₁ | Linearization D; transpose −D | D≠−D, so source is not Euler of a local density | Agreement; Euler not onto F₁ |
| A041 | §2.3 zero-section/twist comparison | Vector bundle S¹×ℝ and fibre scaling | Retraction/projection composite on base=id; fibre contracts to 0 | H¹(E)=H¹(S¹)=ℝ; orientation twist trivial on chosen orientation | Agreement |
| A042 | §2.3 relative mapping cone | Inclusion two endpoints→[0,1] | Relative H¹=ℝ via difference of endpoint constants | Kernel of restriction of forms to open pairs is not the assumed general carrier | Agreement; interval period represented relatively |
| A043 | §2.4 affine versus linear Euler | L=u²/2, L+3u | E=u; E=u+3 | At u=0 values 0 and 3 | Agreement |
| A044 | §2.4 high degree need not nonlinear | L=u²u₁ versus −λu⁴/24 | E=0 versus −λu³/6 | At λ=3,u=2 values 0 and −4 | Agreement |
| A045 | §3.1 density transpose | A=xD applied dually to 1 | Aᵗ1=−D(x)=−1 | Coefficient-outside formula gives 0 | Agreement |
| A046 | §3.1 Hermitian density derivative | A=D, ρ=eˣ,H=1 | A†1=−e⁻ˣD(eˣ)=−1 | Unit-density adjoint on 1 is 0 | Agreement |
| A047 | §3.1 variable pairing derivative | A=D,ρ=1,H=e²ˣ | A†1=−e⁻²ˣD(e²ˣ)=−2 | Formula omitting H derivative gives 0 | Agreement |
| A048 | §3.1 differential substitution | v=u+u′, L=eˣv | E_v=eˣ; E_u=(1−D)eˣ=0 | Transpose chain rule gives 0 | Agreement; converse fails on unrestricted fields |
| A049 | §3.1 decay converse | q=ceˣ | (1−D)q=0 for every c | Decay at both ends permits only c=0 | Agreement; at α=0 transpose is identity |
| A050 | §3.1 singular nonlinear substitution | v=u², L=v | E_u=2u, E_v=1 | At u=0: 0 versus 1; on u>0 inverse √v exists | Agreement |
| A051 | §3.1 prolongation bound | s=1, r=1, v=u′, L=(v′)²/2 | E_u=u₄ | Bound 2r+2s=4 attained | Agreement |
| A052 | §3.2 mechanics/scalar models | m=2,u=1,u₂=6; KG u=3,u₀₀=7,u₁₁=2 | Oscillator −10; KG −17 | −(4+6); −7+2−12 | Agreement |
| A053 | §3.2 cyclic-module extremes | P=0, P=1 | Quotients A and 0 | Hom spaces N and 0; kernels N and 0 | Agreement in both directions |
| A054 | §3.2 cyclic inverse | A=M₂(ℂ), P=diag(1,0), u=e₂ | P u=0; [a]↦au kills AP | Evaluation of inverse at [1] gives e₂ | Agreement |
| A055 | §3.2 noncommutative kernel | Same P and u | e₁₂e₂=e₁; P e₁=e₁≠0 | e₂∈ker P but e₁₂e₂∉ker P | Agreement; kernel only a complex subspace |
| A056 | §3.2 operator realization | f=x² | (XD²+D+X)f=4x+x³, value 5 at 1 | x f″+f′+xf=5; (DX−XD)f=x² | Agreement |
| A057 | §3.2 equation ideal | Fixed L=0 versus L=u | I∞(0)=0 | E(u)=1, so image of all Euler expressions would generate unit ideal | Agreement |
| A058 | §3.3 phase coordinates | Q=q²,P=p/(2q), q=2,p=6 | Q=4,P=3/2; dQ=4dq, dP=dp/4−3dq/4 | P dQ=6dq; dQ∧dP=dq∧dp | Agreement |
| A059 | §3.3 canonical vertical inverse | ω=dq∧dp, covector 2dq+3dp | X=(3,−2) | ι_Xω=2dq+3dp | Agreement; no field metric needed |
| A060 | §3.3 affine reference change | q′=q−a(x), p′=p | δq′=δq at fixed x | θ′=pδq=θ; ω′=ω | Agreement |
| A061 | §3.3 noncompact admissibility | F=∫q on compact perturbations of 0 | F finite, Euler q-covector=1, X=(0,−1) | X is not compactly supported | Agreement; excluded by explicit normalization condition |
| A062 | §3.3 admitted noncompact model | F=∫q²/2, reference 0 | Euler=q; X=(0,−q), compact or Schwartz with q | Reference h=0 and Euler=0 | Agreement |
| A063 | §3.3 charged reference | Φ₀=c/r,E₀=cx/r³ outside ball | E₀+∇Φ₀=0; flux 4πc | c=1 gives flux 4π with vanishing exterior Euler derivative | Agreement; charge need not vanish |
| A064 | §3.3 Schwartz coordinate scope | q=e⁻ˣ², smooth x-dependent change Q=eˣ²q | Q=1, not Schwartz | Transition growth eˣ² violates polynomial-bound hypothesis | Agreement; arbitrary smooth changes excluded |
| A065 | §3.3 boundary collar | F=∫₀¹q′, δq=x | δF=1 | Order-zero collar q² gives no boundary trace term | Agreement; bare derivative density not admitted there |
| A066 | §3.4 actual functions/divergences | Circle length 2π, h=Dq and h=1 | Integrals 0 and 2π | Both have Euler 0, but only first is zero functional | Agreement |
| A067 | §3.4 boundary divergence | q=x on [0,1] | ∫Dq=1 | q(1)−q(0)=1 | Agreement; not zero in unrestricted boundary domain |
| A068 | §3.4 derivative descent | F and F+∫Dq on periodic data | Difference 0, both Euler covectors equal | Compact interior test pairing of difference=0 | Agreement |
| A069 | §3.4 dimension zero | One point, F=q²/2 | dF=qδq | No divergence term; at q=2,δq=3 derivative 6 | Agreement |
| A070 | §3.5 even bracket | F=q,G=p | {q,p}=1 | {p,q}=−1 | Agreement |
| A071 | §3.5 odd bracket | One odd q,p | {q,p}=1 | {p,q}=1=−(−1)¹ | Agreement |
| A072 | §3.5 odd product/derivatives | F=qp even | {q,F}=−q, {p,F}=p | Right/left derivative formula gives same (−q,p) vector | Agreement |
| A073 | §3.5 commutator sign | F=q²/2,G=p²/2 | {F,G}=qp; [X_F,X_G]=(−q,p) | −X_(qp)=(−q,p) | Agreement |
| A074 | §3.5 Jacobi | F=q²/2,G=p²/2,H=qp | {{F,G},H}=0, {{G,H},F}=2pq | {{H,F},G}=−2pq; sum 0 | Agreement |
| A075 | §3.5 smeared kernels | Circle length 2π, f=2,g=3 | {Q_f,P_g}=12π | ∫fg=12π; same-kind brackets 0 | Agreement |
| A076 | §3.5 multilocal distinction | F=(∫q)², disjoint unit-integral h,k | Mixed variation=2 | Local integral mixed variation on disjoint supports=0 | Agreement; products not asserted local |
| A077 | §3.6 Legendre images | L=v²/2 versus L=0 | p=v versus p=0 | First image all p, second image zero section | Agreement; no inverse in second case |
| A078 | §3.6 Maxwell primary constraint | No dot A₀ in −F²/4 | Π₀=0 | Preservation gives Gauss; external A has no varied Π₀ | Agreement |
| A079 | §3.6 bulk plus charge | p=x,α=1 on [0,1] | ∫αp′−[αp]=1−1=0 | −∫pα′=0 | Agreement |
| A080 | §3.6 spinor primary coefficients | Commuting ψ,ψ̄ independent | Symmetric coefficients iψ̄Γ⁰/2, −iΓ⁰ψ/2 | Unsymmetric iψ̄Γ⁰,0; difference is boundary-momentum translation | Agreement |
| A081 | §3.7 velocity-independent interaction | L=v²/2−u² | p=v,H=p²/2+u² | H−H₀=u²=−L_int | Agreement |
| A082 | §3.7 velocity-dependent interaction | g=1,p=3 | H=9/6=3/2 | Old-velocity H₀−L_int=−9/2 | Agreement with negative control |
| A083 | §3.7 excluded denominator | g=−1/2 | p=0 for every v | 1+2g=0; inverse formula undefined | Agreement; nonvanishing premise essential |
| A084 | §3.8 complex canonical pairing | p_x=2,p_y=4,δφ=3+5i | π=1−2i; πδφ+π̄δφ̄=26 | p_xδx+p_yδy=6+20=26 | Agreement |
| A085 | §3.8 complex cross brackets | φ=x+iy,π=(p_x−ip_y)/2 | {φ,π}=1/2+1/2=1 | {φ,π̄}=1/2−1/2=0 | Agreement |
| A086 | §3.8 scalar-QED correction | φ=1,π=π̄=0,e=A₀=1; spatial/mass zero | H−H₀=0 | −L_int at free velocity +e²A₀²φ̄φ=−1+1=0 | Agreement |
| A087 | §3.8 gauge sign | Generator −∫α(ej_can⁰−div Π) | δφ=ieαφ, δA_i=−∂iα | D=∂+ieA transforms covariantly | Agreement; ε=−α matches §5.2 |
| A088 | §3.8 primary generator and multiplier | α=t² | δA₀=−2t; δu=−2 | −∂tα, −∂t²α | Agreement |
| A089 | §3.8 flux/Gauss | Torus versus Coulomb reference c=1 | ∫div Π=0 versus 4π | Allowed total charge 0 versus 4π | Agreement |
| A090 | §3.9 quadratic normalization | Constant real amplitude a on periodic volume-one box, m=2 | S=−2a², S′(1)=−4 | Aφ=−2φ, 2Aφ=−4φ; Hessian −4 | Agreement |
| A091 | §3.9 linear source | Same mode, J=3 | Derivative at a=1 is −4+3=−1 | 2Aφ+J=−1, not Aφ+J=1 | Agreement |
| A092 | §3.9 sourced Maxwell | F=0, fixed J≠0 | Euler=−J | ∂μF^{μν}−Jν=−Jν | Agreement; vacuum density alone gives 0 |
| A093 | §3.9 conservation iff | div J=1 or 0; compact χ with ∫χ=1 | δχS=1 or 0 | ∫χ div J=1 or 0 | Agreement; tests both directions |
| A094 | §3.10 coordinate dictionary | x=e₀,e₁; native b₃,b₂ | Q(Pe₀)=−1,Q(Pe₁)=1; det P=−1 | −g(e₀)=−1,−g(e₁)=1 | Agreement |
| A095 | §3.10 Clifford squares | x=e₀,e₁ | C²=I₄,−I₄ | g(x)I₄=I₄,−I₄ | Agreement |
| A096 | §3.10 null/zero vectors | x=e₀+e₁ or 0 | X=diag(2,0) gives C≠0,C²=0; at 0 C=0 | g=0 in both, with nonzero null control | Agreement |
| A097 | §3.10 conjugate-Weyl transport | A=[[1,1],[0,1]] | ε bar A ε⁻¹=[[1,0],[−1,1]] | (A†)⁻¹=[[1,0],[−1,1]] | Agreement |
| A098 | §3.10 boost pairing | A=diag(2,1/2), B=diag(1/2,2) | A†B=B†A=I₂ | ρ†H₀ρ=H₀ | Agreement |
| A099 | §3.10 unipotent covariance | Same unipotent A, X=I₂ | X′=AA†=[[2,1],[1,1]]; X′B=A | Upper block of ρC equals A; lower blocks agree too | Agreement |
| A100 | §3.10 exact Clifford/Spin headline | All 16 native basis pairs b_i,b_j | Upper −X(b_i)adj X(b_j) equals native generator matrix | Lower −adj X(b_i)X(b_j) equals conjugate-transpose adjugate of upper | Agreement on every pair; not merely square testing |
| A101 | §3.10 nontrivial even generator | b₂b₃ | Upper diag(−1,1), lower diag(1,−1) | diag(−σ₃,σ₃) from pinned formula | Agreement |
| A102 | §3.10 central Spin elements | s=1 and −1 | Clifford images ±I₄ | Weyl matrices for A=±I₂ are ±I₄ | Agreement; excludes factoring through SO alone |
| A103 | §3.10 dual-frame and chirality | Spatial Pauli order σ₃,σ₁,σ₂ | Γi=−C(e_i); Γ⁵=diag(I₂,−I₂) | (Γ⁵)²=I₄, anticommutator with Γμ=0 | Agreement |
| A104 | §3.10 orientation/volume | Native order b₀,b₁,b₂,b₃ | ω=Γ⁰Γ¹Γ²Γ³, ω²=−I₄ | Physical P-ordered product=−ω | Agreement |
| A105 | §3.10 Weyl swap/source convention | U=H₀ | UΓ⁵U⁻¹=diag(−I₂,I₂) | Unphased upper/lower four-gamma products square to −I₄ | Algebra agrees; source glyph claim unverified |
| A106 | §3.10 real density | Constant spinor, derivatives 0, real m | L=−mψ̄ψ is real; divergence term 0 | Re L=L | Agreement |
| A107 | §3.10 phase/current normalization | δψ=iψ | Θ=iψ̄Γμ(iψ)=−ψ̄Γμψ | j_V with Θ−K convention | Agreement |
| A108 | §3.10 chirality projections | Γ⁵ψ=ψ, mass 0 | (1−Γ⁵)ψ/2=0; j_−=0 | (j_V−j_A)/2=0 | Agreement |
| A109 | §4.1 Noether I | L=u₁²/2, δu=1 | j=u₁, Dj=u₂ | −E=u₂ | Agreement |
| A110 | §4.1 improvement | Add D(u²/2), same shift | Θ increases by u, K increases by u | j unchanged | Agreement |
| A111 | §4.1 Maxwell superpotential | F¹⁰=2, ε=x¹ | ∂₁(2x¹)−x¹∂₁2=2 | J⁰=2 | Agreement |
| A112 | §4.1 positive Yang–Mills comparison | F₁₂=a=3 | ‖F‖²=9, −F²/4=−9/2 | Derivatives 6 and −3; factor −1/2 | Agreement with SBC B8 |
| A113 | §5.1 universal joint identity | λ=u₁²/2,Rε=Dε | δλ=u₁ε″; RᵗE=u₃ | u₃ε+D(u₁ε′−u₂ε)=u₁ε″ | Agreement |
| A114 | §5.1 quantifier negative control | λ=u dx,Rε=ε | RᵗE=1 | A primitive chosen separately for ε is nonlocal, not joint-finite-order | Agreement; weaker quantifiers excluded |
| A115 | §5.1 support/zero parameter | ε=0 on an open set | Every finite jet of ε=0, so B=0 there | Support inclusion; parameter-independent current 1 would fail | Agreement |
| A116 | §5.1 dimension zero | λ=u²/2,Rε=2ε,u=3,ε=4 | δλ=24 | (RᵗE)ε=6·4=24, divergence 0 | Agreement |
| A117 | §5.2 stabilizers | U(1), φ=0 versus φ=1, e≠0 | Constants all stabilize first; only 0 stabilizes second | dε=0 and εφ=0 | Agreement; e=0 must be treated separately |
| A118 | §5.2 compact support | Connected noncompact chart, ε constant | Nonzero constant support is whole chart | Compactly supported constant must be 0 | Agreement |
| A119 | §5.2 polynomial Maxwell symbol | ξ=(1,0,0,0) | M=diag(0,1,1,1); ξM=0 | Left-kernel fibre dimension 1 | Agreement |
| A120 | §5.2 null symbol | ξ=(1,1,0,0) | q=0,M=−ξ^sharp⊗ξ has rank 1 | Pointwise left-kernel dimension 3, versus polynomial module rank 1 | Agreement; no fibrewise rank-one overclaim |
| A121 | §5.2 non-Abelian curvature | F=E₁₂, ε=E₂₁ in sl₂ | [F,ε]=diag(1,−1) | D_A²ε≠0; Noether identity needs its own argument | Agreement |
| A122 | §5.3 equation Koszul differential | E₁=x,E₂=y | δ(e₁e₂)=xe₂−ye₁, δ²=xy−yx=0 | Square-zero law | Agreement |
| A123 | §5.3 stationary annihilator | δe=x, δz=0 | δ(ez)=xz | x[z]=0 in H₁ | Agreement; no free presentation over original A |
| A124 | §5.3 stage budget | r=2 versus 3 | Equation labels of order 0 versus ≤1; gauge labels none versus J=0 | Bounds abs(I)+2≤r and abs(J)+3≤r | Agreement |
| A125 | §5.4 mixed metric block | g⁻¹=[[2,1],[1,3]] | a=2,b=5,B=[5],C₁=0 | det B=5=2⁰det g⁻¹ | Agreement |
| A126 | §5.4 nonzero off-block entry | g⁻¹=[[2,1,1],[1,3,0],[1,0,4]] | B=[[5,−1],[−1,7]],det B=34,C=(0,3) | a det g⁻¹=2·17=34 | Agreement; C₂ cannot be dropped |
| A127 | §5.4 leader count | n=2,r=2,d=1,m=0; n=4,r=2,d=1,m=2 | Counts 2 and 6 | d[(n−1)C(n+r−2,n)+C(n+r−3,n−1)]+mC(n+r−2,n) | Agreement |
| A128 | §5.4 null-coordinate control | g⁻¹=[[0,1],[1,0]] | g⁰⁰=0, chosen formula cannot invert | In orthogonal coordinates eigenvalues +1,−1 give a=1,b=−1 | Agreement; change chart, retain metric |
| A129 | §5.4 scalar zero field | Standard scalar-QED action at φ=0 | Real-pair kinetic block remains 2g⁰⁰Id | Nonzero if g⁰⁰≠0, independent of φ | Agreement |
| A130 | §5.5 identity triangular step | Abelian identity | Coefficient of D₀E⁰ is −1 | D₀E⁰=−Σ_iD_iEⁱ; remaining terms independent | Agreement |
| A131 | §5.5 stationary H₁ | δ=L∂η, one closed odd z | H₁=(A/(L))z; δ(ηz)=Lz | Kernel of A→H₁ is (L) | Agreement |
| A132 | §5.5 empty labels/rank zero | r=2 or gauge rank 0 | No z labels; direct sum 0 | H₁=0 for independent equation-coordinate Koszul complex | Agreement |
| A133 | §5.6 paired-variable contraction | δc=z,h=c∂z | (δh+hδ)c=c, on z gives z | Euler degree operator gives 1·c,1·z | Agreement |
| A134 | §5.6 radial normalization | Same pair, c² | (δh+hδ)c²=2c² | Normalized contraction identity requires division by 2 | Agreement over ℝ; no characteristic-2 extension |
| A135 | §5.6 smooth coordinate pair | δη=L | H(L)=η,δH(L)=L; H(1)=0 | id−ιπ gives L and 0 | Agreement; H is not A-linear |
| A136 | §5.6 stationary coefficient retention | f=f(y) | (δH+Hδ)f=0 | f−ιπf=0 | Agreement |
| A137 | §5.6 off-shell contraction | Invertible equation L=1, cycle f | δ(ηf)=f | Positive homology 0 | Agreement |
| A138 | §5.6 jet transition | c₀,z₀ at r=3 | D raises to c₁,z₁ at r=4 | δDc=Dδc=Dz | Agreement; no fixed-stage derivative closure |
| A139 | §5.7 n=1 gauge-only failure | Flat U(1), δc_k=−e_(k+1) | e₀ closed, no preimage | Nonzero H₁ class | Agreement with explicit negative control |
| A140 | §5.7 n=1 complete identities | Add b₀,δb₀=e₀ | e₀ becomes boundary | H₁ class 0; same for every equation-antifield jet | Agreement |
| A141 | §5.7 redundant gauge pair | δc_J=z_J, δb=e | δ(c_J−D_JRᵗb)=z_J−z_J=0 | Adding δt_J=c_J−D_JRᵗb kills cycle | Agreement |
| A142 | §5.7 n=0 pure connections | No one-form components | Minimal complex=A in degree 0 | H₀=A, H_p=0 for p>0 | Agreement |
| A143 | §5.7 n=0 redundant antifield | δc=0 | c is nonzero H₂ class | δs=c makes class 0 | Agreement |
| A144 | §5.7 strict reducibility | n≥1 monic symbol ξ₀; n=0 zero action | ξ₀Z=0 forces Z=0; zero·Id=0 | Irreducible operator in positive dimension, reducible zero action | Agreement; configuration kernels are different |
| A145 | §6.1 scalar stress | dotφ=2, gradient norm 3,m=1,φ=4 | T⁰⁰=(4+9+16)/2=29/2 | Positive energy formula | Agreement |
| A146 | §6.1 Maxwell stress | norm(E)=2,norm(B)=3,E·∇Φ=−10 | T_H⁰⁰=13/2,T_can⁰₀=−7/2 | Difference −10 | Agreement; no pointwise canonical positivity |
| A147 | §6.1 pure gauge | A=dχ | F=d²χ=0,T_H=0 | Gauge-invariant Hilbert expression 0 | Agreement |
| A148 | §6.1 global spin connection | Trivial lift, constant frame, zero ω | ∇^S=∂ | Local coefficient formula ∂+ρ*(0)=∂ | Agreement; arbitrary lift is supplied data |
| A149 | §6.2 torsion divergence | Constant density, V=e₁; Γ²_(21)=2,Γ¹_(22)=−2 in a spatial orthonormal two-plane | t₁=2, ordinary divergence 0, covariant divergence 2 | divρV+t(V)=0+2=2 | Agreement; metric-compatible connection with nonzero trace |
| A150 | §6.2 unsymmetric real-part identity | Same t(V)=2, divρV=0 | Correction −(i/2)·2ρ=−iρ | Symmetric minus unsymmetric density=−iρ | Agreement; compact support does not erase bulk term |
| A151 | §6.2 density correction | ρ=eˣρ_g,t=0 | tρ=−dx | Dirac Euler correction +(i/2)Γˣψ | Agreement |
| A152 | §6.2 trace-free specialization | tρ=0 | Bulk correction 0 | Difference −(i/2)d_HJ only | Agreement; torsion itself need not vanish |
| A153 | §6.3 metric transport | g_t=(1+t)g₀ | A_t=(1+t)Id,b_t=(1+t)^−1/2Id,b′₀=−Id/2 | g_t(b_tv,b_tw)=g₀(v,w) | Agreement |
| A154 | §6.3 inverse/density variation | h=g₀ in dimension 4 | δg⁻¹=−g₀⁻¹,δρ=2ρ | Derivatives of (1+t)^−1g₀⁻¹ and (1+t)²ρ | Agreement |
| A155 | §6.3 branch normalization | Outside support g_t=g₀ | A_t=b_t=Id | Alternative −Id squares correctly but is not near identity | Agreement; specified branch excludes wrong model |
| A156 | §6.3 connection variation | Flat g,h=f g, orthogonal unit X=Y and Z | 2g(δ∇_X X,Z)=−Z(f) | Koszul variation formula; at Z(f)=2 gives −2 | Agreement; fixing connection would give 0 |
| A157 | §6.3 reduced-action chain rule | Formal independent variables e,ω with S=eω and ω(e)=e | dS_red/de=2e | S_e+S_ωω′=e+e=2e | Agreement; at e=1 holding ω fixed gives wrong 1 instead of 2 |
| A158 | Worked source normalization, 1132–1140 | L=(∂φ)²−m²φ²−λφ⁴ | ∂L/∂φ=−2m²φ−4λφ³ | Euler=−2(□φ+m²φ+2λφ³) | Algebra agrees; literal scan equation unverified |
| A159 | Worked reality/current scale, 1132 | L and L+h.c. | L+h.c.=2Re L | Euler and Noether current scale by 2, stationary zero set unchanged | Algebra agrees; source wording unverified |
| A160 | Worked Maxwell coupling signs, 1145–1161 | J independent of A | E(−A·J)=−J; E(+A·J)=+J | Stationary E_A=J versus E_A=−J | Algebra agrees; alleged scan discrepancies unverified |

## Not verifiable

- **Borcherds collection scan.** No readable copy of the exact 121-page edition identified by the README's digest was available. The sources service was tried with the collection filename and local-prefixed filename; title resolution returned HTTP 429 from arXiv search. The Berkeley Math275 page identifies related context, not this scan. Consequently the literal p.35 descent remark, pp.35–54 normalizations and alleged omissions, and pp.107/110/115–118 gamma/chirality/current readings are not source-certified. Their displayed algebra was tested independently above.
- **UNSW collection scan.** The same service attempts did not supply the exact 62-page edition; title resolution likewise returned HTTP 429. All listed physical-page claims, including pp.13–14/19–20/31/41 and the missing-i, source-coupling and interaction-Hamiltonian attributions, remain uncertified. Both works are recorded under their existing `borcherds`/`unsw` keys in the scratch missing-reference record; no repository manifest was edited. The review is complete and is not parked for those texts.
- **QF/RQFT downstream boundaries.** `QuantumFoundations` and `RelativisticQuantumFieldTheory` have no readable files in the supplied main checkout or listed sibling paths. `roadmaps show` reports neither name on main or in its open index, although `roadmaps resolve` reports no unresolved citations. Their exact QF/RQFT section/anchor and ownership claims therefore could not be verified. No further open pull requests were sought. These are downstream exclusions/consumers, not inputs to any retained headline or proof route, so this is not an unowned prerequisite finding. Ownership against those unavailable open texts is not checked.
- **Extent of mathematical certification.** The 160 rows are explicit finite, local, degenerate and sign controls plus source/signature/ownership checks. They are not Lean proofs of the future global gluing, graded functional, finite-order resolution or metric-variation theorems. Those constructions remain the roadmap's obligations.

## Source issues

- **Misprint** in bbh at §5.1.3, Dirac-field paragraph, printed p.31 (`bbh` line 1213): the source says the zero-jet stationary surface is empty; it should be the whole zero-jet space, since these first-order equations constrain no zero-jets; affects nothing.
- **Misprint** in anderson at Theorem 5.9, equation (5.26a), printed p.204 (`anderson` lines 9345–9346): the source says unaugmented horizontal cohomology agrees with de Rham cohomology through degree n; it should use Euler-augmented cohomology at n, or restrict the unaugmented claim to degrees below n; affects a stated result.

The alleged collection-scan errata are not listed as independently discovered source issues because those texts were not readable.
