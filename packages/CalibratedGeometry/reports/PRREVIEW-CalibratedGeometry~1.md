# Review of CalibratedGeometry (pull request #946 at 0f3a0d5)
**Verdict:** needs changes

:robot: Independent AI review. Seven findings, five blocking (P1/P2). The worktree was not changed. The worker's gate passes; the findings below concern mathematics, ownership, acceptance-test coverage, and specification detail beyond that gate.

## R01 (P1) — Campanato controls an almost-everywhere class, not arbitrary point values

**Location:** `TauCetiRoadmap/CalibratedGeometry/README.md:516`, “`f∈C^(0,ζ) ↔ sup_(x,ρ) ρ^(−n−2ζ)∫_(B_ρ(x))|f−f_(x,ρ)|²<∞`”.

**Claim:** The integral condition characterizes membership of the given function in the Hölder space. No continuous representative or almost-everywhere identification is specified.

**Witness:** On B₁(0)⊂ℝ, let f(0)=1 and f(x)=0 otherwise. Every ball average and every displayed integral is 0. But |f(0)−f(t)|/|t|^ζ=|t|^(−ζ) is unbounded.

**Repair:** For locally L² functions, state existence and uniqueness of a locally Hölder representative modulo almost-everywhere equality; state the pointwise equivalence separately for continuous representatives. Specify interior balls, positive radii, and the L²/mean term in full norm comparisons (constants have oscillation seminorm zero). Import PDE's existing Campanato/Morrey characterization (`TauCetiRoadmap/PDE/README.md:191`), extending it componentwise where needed; keep the new vector-system decay and iteration here. For this witness the representative is identically zero and has Hölder seminorm 0, while the original pointwise function correctly fails the continuous-function version.

## R02 (P1) — The relative triangulation contract is stronger than its supplier on main

**Location:** `TauCetiRoadmap/CalibratedGeometry/README.md:45`, “Its smoothing-and-triangulation item1 supplies the relative smooth triangulation used in C2”; also lines 225–230.

**Claim:** GeometricTopology supplies relative smooth triangulations with ordered parametrized simplices and boundary compatibility, from which C2 obtains a finite integral fundamental chain.

**Witness:** `TauCetiRoadmap/GeometricTopology/README.md:938` on main states smooth triangulation/PL uniqueness. It does not specify the relative boundary-extension or ordered face-parametrization contract used at C2 lines 227–230. There is no declared gap.

**Repair:** Consume the main-branch triangulation theorem and make the required relative/ordered refinement an explicit target here, with its hypotheses and locator, or declare a precise supplier gap in the prescribed plan/README locations. Do not treat the open revision of an existing roadmap as an additional supplier. Test the contract on an oriented triangulated square: the two diagonal faces must be the *same parametrized generator* with coefficients +1 and −1, and the remaining chain must be the prescribed outward-first boundary chain. Agreement only of face images does not give cancellation in the free smooth-simplex module. An explicit global vertex order and compatible boundary refinement make that test pass.

## R03 (P1) — Remove the nonexistent independent HomotopySpheres comparison

**Location:** `TauCetiRoadmap/CalibratedGeometry/README.md:154`, “compare with … HomotopySpheres Stage 4A … coordinate oriented carrier”; line 157, “CC C1.1a's existing HS identification”.

**Claim:** There is a separate finite oriented carrier in HomotopySpheres and an existing identification with it supplied by CharacteristicClasses C1.1a.

**Witness:** `TauCetiRoadmap/HomotopySpheres/README.md:583` at the supplied open head consumes TopologicalKTheory's carriers. `TauCetiRoadmap/CharacteristicClasses/README.md:245` on main constructs the finite orientation cover; lines 265–267 assign the HomotopySpheres classifier comparison to TopologicalKTheory T1.6a.

**Repair:** Compare C1's intrinsic finite-dimensional carrier directly with CharacteristicClasses C1.1a's cover of TopologicalKTheory T1.5. Delete the nonexistent third carrier and commuting triangle. If a stable classifier comparison is actually needed, state it separately against TopologicalKTheory T1.6a. Test rank one in ℝ: the finite cover has two points, whereas the fixed-rank classifier BSO(1) is a point. The corrected finite-carrier comparison preserves both orientations instead of conflating these objects. Rank zero retains the separately specified two-point sign cover.

## R04 (P2) — Import the existing Gram–Hadamard theorem

**Location:** `TauCetiRoadmap/CalibratedGeometry/README.md:133`, “Own the Hadamard inequality `det(gram v)≤Π‖v_i‖²` through Gram–Schmidt”.

**Claim:** This roadmap owns a new development of the general Gram–Hadamard inequality.

**Witness:** `TauCetiRoadmap/SuccessiveMinima/README.md:188` on main already states §0.1.2, `hermitian_gram_hadamard`, for arbitrary finite families in a normed RCLike inner-product space, including dependent and empty families and infinite-dimensional ambient spaces.

**Repair:** Delete the duplicate target and import SuccessiveMinima §0.1.2 by name in scope, supplier contracts, and the affected dependency lines. Keep the new comass and exterior-Hilbert-norm comparisons. The real specialization gives exactly the required inequality: (1,0),(1,1) has Gram determinant 1 and squared-norm product 2; duplicate unit vectors give 0≤1; the empty family gives 1≤1. No new Gram–Schmidt theorem is needed.

## R05 (P2) — State the higher-degree Wirtinger headline at the pins

**Location:** `TauCetiRoadmap/CalibratedGeometry/Suggested.lean:17`, “the pins have no exterior (wedge) product of continuous alternating maps, so `ωʳ` has no carrier”. README lines 279–300 promise the all-degree inequality and equality classification.

**Claim:** The higher-degree headline cannot be stated against the pins.

**Witness:** Mathlib has `exteriorPower.wedge` in `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean:35` and the Gram inner product in `Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean:127`. A three-definition probe and both all-degree headline signatures elaborated with only their two `sorry` warnings.

**Repair:** State the actual all-degree inequality and positive complex-plane equality characterization, using the metric identification with exterior powers and a few real-bodied definitions. Correct the module docstring. This does not require developing the general continuous-form wedge API first. The tested construction is:

```lean
def kahlerVector (n : ℕ) : ⋀[ℝ]^2 (EuclideanSpace ℂ (Fin n)) :=
  ∑ j : Fin n, exteriorPower.ιMulti ℝ 2
    ![EuclideanSpace.single j 1, Complex.I • EuclideanSpace.single j 1]

def wedgePower {E : Type*} [AddCommGroup E] [Module ℝ E]
    (a : ⋀[ℝ]^2 E) : (r : ℕ) → ⋀[ℝ]^(2*r) E
  | 0 => exteriorPower.ιMulti ℝ 0 (fun i => Fin.elim0 i)
  | r+1 => (by simpa [Nat.mul_succ] using
      exteriorPower.wedge ℝ E (2*r) 2 (wedgePower a r) a)

def wirtingerValue (n r : ℕ)
    (v : Fin (2*r) → EuclideanSpace ℂ (Fin n)) : ℝ :=
  inner ℝ (wedgePower (kahlerVector n) r)
    (exteriorPower.ιMulti ℝ (2*r) v) / r.factorial
```

The elaborated signatures assert `|wirtingerValue n r v| ≤ 1` for r≤n and real-orthonormal v, and that value 1 is equivalent to J-invariance of `Submodule.span ℝ (Set.range v)` together with positive value. These are the actual normalized form evaluations, not free predicates. At n=r=2, the exterior square has coefficient 2 on (e₁,ie₁,e₂,ie₂), so division by 2! gives 1; reversed orientation gives −1. At n=4,r=2 the real coordinate 4-plane gives 0. The r=0 value is 1, with 0!=1. These tests fix both the factorial and the orientation.

## R06 (P3) — Supply the required definition APIs, Checks, and layer structure

**Location:** `TauCetiRoadmap/CalibratedGeometry/README.md:99` through line 579; for example lines 125–128 introduce `frameVolume` without a Checks list.

**Claim:** The prose is the complete development, but it has no `**Checks.**` blocks, no per-definition API lists, no item-level `*Needs:*` lines, and no layer-end Examples/Dependencies. The required Summary, Scope and ownership, Exact supplier contracts, and How to read the build headings are also absent.

**Witness:** `frameVolume` has no three discriminating Checks. Its zero-degree value is 1, a dependent positive-degree frame has value 0, and the frame ((2,0),(0,3)) has value 6; these distinguish plausible wrong definitions.

**Repair:** Reorganize the existing content into the required roadmap shape without thinning it. Give each definition its API and at least three explicit computed Checks, and each target its actual prerequisites. In particular include orientation reversal, non-Lagrangian frames, the disconnected exact-top-form condition, and R01's negative control. Keep these examples in the README, not as admitted Lean padding.

## R07 (P3) — Attach exact source locators to the individual targets

**Location:** `TauCetiRoadmap/CalibratedGeometry/README.md:600`, the general references paragraph; the individual C1–C6 claims mostly have no source theorem/page locator.

**Claim:** The references name three broad works and the product counterexample, but do not locate most targets or their proof inputs. There is no `sources.toml`; the Lean-only Joyce extraction-line citations have no recorded source/version mapping in the folder.

**Witness:** The moduli assertion at README line 445 has no locator. It is McLean1998 Corollary 3.9, printed p.721, extraction line 562; the Hessian at line 553 is Theorem 3.13, p.723, line 634.

**Repair:** Add an exact locator at each mathematical target, including the analytic estimates and comparison constructions, and record the four cited works once each in the source manifest. Use the primary McLean theorem for the deformation result and Joyce's explicit arXiv version for its convention comparison. The fetched Joyce text is v3 (2003); original submission year 2001 alone does not identify that text. For the product warning cite Züst v2, Corollary 1.4, p.2. The source table below gives verified starting locators, not blanket certification of all C6 estimates.

## Verified sound

**Scope and mechanical checks.** Reviewed all 609 README lines and all 129 Lean lines at the requested head. The folder is new on main, so this is not a re-planning of an existing CalibratedGeometry roadmap; the localized overlaps above can be repaired. There are three folder files (README, Suggested, metadata), no changes outside this folder in `origin/main...HEAD`, and no working-tree changes. Read the repository's normative README and CONTRIBUTING and the merged GeometricMeasureTheory and HopfRinow roadmaps. No algorithmic deliverable, copied source passage, `set_option`, sorry-valued data, admitted example, unauthorized import, or route-specific arithmetic restriction was found. Smooth chains are an explicit scope choice; currents are not silently used in the proposed proof.

The supplied gate records every scanner and the targeted build as passing. Independently ran the required direct Lean elaboration: exit 0, exactly six `sorry` warnings. Independently ran the dependency checker against the supplied order:

```text
depcheck: 163 roadmaps, 1163 edges, 0 problem(s)
```

There are no UPWARD, CYCLE, or moved lines. This does not establish that every named supplier exports the claimed object: R02/R03 concern that separate check. No declared supplier gaps were present. No prior review/repair findings were supplied.

**Signatures and padding.** A scratch copy checked `#check @name` for all eleven declarations: five definitions and six theorems. Compared all eleven types with the README and the worker's signature extraction. No binder was lost and no signature needed changing. Finite dimensionality is retained on the two general C1 theorems; n≥1 is retained on the two comass-one theorems and the special Lagrangian iff; the degree-two iff legitimately allows n=0, when both sides are false. The six theorems each resisted the single-tactic candidates `simp`, `rfl`, and `infer_instance` (18 attempts); every fallback still emitted a `sorry` warning. Reading the pinned norm, symplectic, and exterior APIs found no single library theorem giving these six statements. No padding finding is raised. All six are substantive geometric statements, rather than scalar algebra on unrelated hypotheses.

**Headline coverage.** The README's headline results are: C1 comass/operator-norm equality and the sharp frame-volume bound; C3 the fundamental calibration comparison with its equality case and stability/minimality; C4 all-degree Wirtinger and its positive complex-plane classification, then the Kähler submanifold application; C5 special Lagrangian comass/classification and the manifold volume/minimality consequences; C6 McLean's unobstructed b₁-dimensional moduli theorem, its harmonic tangent space, and the special Lagrangian Hessian/Jacobi identification. The six Lean theorems cover the two C1 statements, degree-two C4, and linear C5. The docstring correctly names the absent manifold calibration and moduli carriers. C6's Hessian/Jacobi statement also needs the absent differential-form/normal-section carriers and should be explicitly named there when revising. The higher-degree C4 omission is actionable at the pins (R05).

**Pinned declarations opened.** Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Paths below are relative to the respective library repositories. The following 18 declaration groups were inspected, not inferred from names:

| Library declaration | File and line | Relevant content and limit |
|---|---|---|
| `ContinuousAlternatingMap.norm_def` | `Mathlib/Analysis/Normed/Module/Alternating/Basic.lean:194` | Infimum of nonnegative product-norm bounds; it is not already an orthonormal-frame supremum. |
| `norm_constOfIsEmpty` | same file, line 310 | Empty-argument value has its ordinary norm. |
| `norm_compContinuousLinearMap_le` | same file, line 432 | General pullback operator bound already exists; cite it when transporting to comass. |
| `ContinuousMultilinearMap.norm_compContinuous_linearIsometryEquiv` | `Mathlib/Analysis/Normed/Module/Multilinear/Basic.lean:1038` | Surjectivity supplies norm equality; an embedding only gives a bound. |
| `LinearMap.normDet` and rank-defect criterion | `Mathlib/Analysis/InnerProductSpace/NormDet.lean:69`, line 111 | Genuine rectangular volume; noninjective maps give zero. |
| `normDet_of_subsingleton`, `normDet_zero` | same file, lines 228, 236 | Zero-dimensional domain gives 1, including the zero map. |
| `normDet_sq_eq_det_gram`, range restriction | same file, lines 303, 365 | Gram normalization and finite-dimensional range comparison. |
| `Matrix.det_gram_ne_zero_iff_linearIndependent` | `Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:125` | Normed inner-product assumptions, not an arbitrary bilinear Gram matrix. |
| `exteriorPower.alternatingMapLinearEquiv` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean:212` | Linear dual of exterior power; a Riesz/metric identification is a further step. |
| `exteriorPower.inner_ιMulti_ιMulti` | `Mathlib/Analysis/InnerProductSpace/ExteriorPower.lean:127` | Determinant pairing on the finite-dimensional real Gram metric. |
| `exteriorPower.wedge` | `Mathlib/LinearAlgebra/ExteriorPower/WedgePairing.lean:35` | Native graded wedge; enough for R05's short construction. |
| `ContinuousMultilinearMap.alternatization` | `Mathlib/Topology/Algebra/Module/Alternating/Basic.lean:637` | Continuous alternating output, unnormalized sum over permutations. |
| `ImplicitFunctionData.contDiffAt_implicitFunction` | `Mathlib/Analysis/Calculus/ImplicitContDiff.lean:41` | Applies after supplying the actual derivative/complement data; does not construct them. |
| `TauCeti.stdSymplecticForm`, evaluation | `TauCeti/Geometry/Symplectic/StandardCompatible.lean:83`, line 90 | ⟨x₁,y₂⟩−⟨y₁,x₂⟩, agreeing with the README sign. |
| `SymplecticForm.transport`, `AlmostComplexStructure.transport` | `TauCeti/Geometry/Symplectic/SymplecticTransport.lean:63`; `Transport.lean:59` | Uses inverse coordinates; R.symm yields evaluation on Rv,Rw. |
| `SymplecticForm.IsLagrangian` | `TauCeti/Geometry/Symplectic/Lagrangian/Basic.lean:99` | Equality with the symplectic orthogonal, not isotropy alone; half-dimensionality matters. |
| `complexAssociatedForm`, `Compatible.hermitianCore`, `complexModule` | `TauCeti/Geometry/Symplectic/Hermitian.lean:78`, line 260; `Complex/Module/Basic.lean:79` | g+iω, conjugate-first under compatibility, with the complex structure determining scalar multiplication. |
| `alternatizeBilinCLM` | `TauCeti/Analysis/Normed/Module/Alternating/Bilinear.lean:43` | B(v,w)−B(w,v), hence 2B for alternating B; it is not itself the claimed normalized bilinear/alternating equivalence. |

Object searches covered these pins, roadmaps on main, the open-roadmap search service and the supplied sibling heads, and local board package READMEs. The board's five-entry active-package index contains no additional geometric owner. Search results from revisions of existing roadmaps were checked against main before treating them as suppliers. No duplicate fully qualified name for this file was found. The intrinsic E-valued oriented Grassmannian comparison is distinguishable from the coordinate finite cover; the normalized bilinear adapter is distinguishable from unnormalized alternatization. Integer smooth-chain comparison is also distinguishable from DG8.3's explicitly real chain complex. These can remain, with the repaired supplier references. The Gram–Hadamard and generic Campanato overlaps cannot remain as independent ownership claims.

**Resolved supplier citations.** Fourteen named roadmap suppliers/counterparts were checked (LieGroups is counted as its sub-roadmap). Existing roadmaps were read on main; the new SBC, PDO and HomotopySpheres roadmaps were read at the supplied heads. The target has zero literal `*Needs:*` lines; all prose supplier references were inspected.

| Supplier and locator | Resolved evidence | Result |
|---|---|---|
| DifferentialGeometry 0.3/1, 5.1–5.4, 8.3–8.4, 9.3, 12.1/12.4/12.5 | `TauCetiRoadmap/DifferentialGeometry/README.md:285`, 524, 836, 872, 915, 923, 930 | Native form/pullback, homotopy, real smooth-chain, duality, metric/volume/divergence targets exist. DG8.3 explicitly requires finite dimension, T2 and σ-compactness for smoothing; carry these inherited manifold hypotheses in the reorganized contracts. |
| AlgebraicTopology Stages 2, 3.1, 6.3 | `TauCetiRoadmap/AlgebraicTopology/README.md:326`, 481, 76 | Relative/integral chain, subdivision/prism and orientation/fundamental-class ownership resolves. The outward-first comparison is explicitly coordinated with DG. |
| RiemannianGeometry R1/R5a.1/R5a.2 | `TauCetiRoadmap/RiemannianGeometry/README.md:179`, 1067, 1103 | First variation and C² relative volume resolve. R5a.1 uses one fixed compact variation support on noncompact sources and is independent of C3. |
| GeometricTopology Layer 1 and smoothing item 1 | `TauCetiRoadmap/GeometricTopology/README.md:218`, 938 | Ordinary tube and smooth triangulation resolve; the asserted relative ordered contract does not (R02). |
| ComplexKahlerGeometry K1/K2/K4/K5a/K5b.0/K6.1 | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:96`, 193, 444, 570, 1075, 1169, 1274 | Complex/type/bundle, real Hodge, Gram/star and Hermitian volume inputs resolve. The singular-cycle application remains its owner. |
| PseudodifferentialOperators P1.0/P5/P6 | `TauCetiRoadmap/PseudodifferentialOperators/README.md:94`, 548, 624 | Compact bundle Hölder spaces, smooth-coefficient Schauder/Fredholm regularity resolve; full versus little Hölder is distinguished at line 564. |
| PDE A.1/A.2/A.4/A.5/A.7, D.16–17, E.22 | `TauCetiRoadmap/PDE/README.md:227`, 231, 238, 241, 259, 305, 331 | Weak spaces, closure, embeddings, Poincaré, scalar Hölder, energy and scalar Schauder inputs resolve. Generic Campanato characterization is also owned there at line 191. |
| SmoothBundlesConnections B1.4/B2/B5 | `TauCetiRoadmap/SmoothBundlesConnections/README.md:160`, 201, 433 | Free proper quotient/principal bundle, smooth bundle operations and holonomy/reduction inputs resolve. |
| RepresentationTheory/LieGroups Layer 2 | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:275` | Finite-dimensional closed-subgroup theorem resolves. |
| TopologicalKTheory T1.5 | `TauCetiRoadmap/TopologicalKTheory/README.md:228`, 293 | Finite coordinate carrier and frame/cell maps resolve. |
| GeneralizedCohomology G4.0b | `TauCetiRoadmap/GeneralizedCohomology/README.md:1082`, 1149 | Smooth graph-chart upgrade on those same real/complex Grassmannians resolves. |
| CharacteristicClasses C1.1a and HomotopySpheres 4A | `TauCetiRoadmap/CharacteristicClasses/README.md:245`; `TauCetiRoadmap/HomotopySpheres/README.md:575` | Finite cover and stable comparison are different contracts; the alleged pre-existing triangle fails (R03). |
| HeegaardFloer F1.3 | `TauCetiRoadmap/HeegaardFloer/README.md:182` | Path Maslov/spectral-flow ownership resolves and is distinct from the oriented phase class. |

**Source sample and access.** The brief supplies no identifiable list of fifteen headings (“none found by heading”). To make the sample reproducible, split C1–C6 into blank-line-separated paragraphs containing Define/Prove/Construct/Compute (case-insensitive), and sample fifteen with Python `random.Random` seeded by the full head string, then sort by line. The resulting starts are 101, 125, 191, 201, 243, 279, 302, 310, 324, 364, 399, 445, 472, 497, 521. All fifteen were read in full. No locator is explicitly flagged unverified in the README. Also checked every explicit locator in its references and Lean docstrings.

All four cited works were obtained through the source service from legal copies: Harvey–Lawson from the Tsinghua institutional archive, McLean from the publisher's open PDF, Joyce arXiv v3, and Züst arXiv v2. Initial DOI/Project Euclid access failures were resolved; no missing-text request remains. Source identifiers below map to those four works. No source text was copied into the package or report.

| Sample | Target | Text and precise locator opened | Assessment |
|---|---|---|---|
| S01, line 101 | Comass, Stiefel maximum, edge degrees | HarveyLawson1982 lines 367–380, II.3 (3.1), pp.56–57; native norm at line 194 above | Comass definition supports the positive-degree geometry; the operator-norm comparison and k=0/empty extension need their own locators/argument. |
| S02, line 125 | Gram volume, Hilbert comparison, Hadamard | Native norm determinant/Gram/exterior declarations; SuccessiveMinima §0.1.2 | Carrier and inequalities tested below; duplicate ownership found. No exact external locator is attached here. |
| S03, line 191 | Pullback equality and integral inequality | HarveyLawson1982 lines 393–408, II.3 Lemma 3.5, pp.57–58 | Supports the smooth compact inequality/equality; noncompact case correctly adds integrability. |
| S04, line 201 | Integer smooth chains and fundamental chain | DG8.3 at line 836; AT Stages 2/3; GT smoothing item 1 | Real-to-integer distinction is respected; relative supplier strengthening is missing (R02). These source papers do not certify this whole chain-level interface. |
| S05, line 243 | Fundamental calibration comparison | HarveyLawson1982 lines 450–467, II.4 Theorem 4.2/Corollary 4.4, p.59 | Bounding-chain and equality requirements agree. The proposed smooth-chain proof avoids relying on the source's current machinery. |
| S06, line 279 | Wirtinger inequality/classification | HarveyLawson1982 lines 412–427, II.3 Example I, p.58; lines 807–852, II.6 Theorem 6.11/Lemma 6.13, pp.70–71 | Supports linear normalization/classification; native headline is statable (R05). |
| S07, line 302 | Kähler bundle application | Same II.3 Example I; CKG K5b.0, p-independent roadmap locator | Pointwise Hermitian calculation and dω=0 wedge argument are consistent. |
| S08, line 310 | Complex submanifolds and torus volume | HarveyLawson1982 II.3 Example I and II.4.2, pp.58–59 | Smooth volume/minimality consequence supported; chart comparison is separately assigned to CKG. |
| S09, line 324 | Special Lagrangian planes and quotient | HarveyLawson1982 lines 1360–1431, III.1 (1.3), Theorem 1.10, Corollary 1.11, pp.87–89; Joyce2001SLLectures lines 67–109, Definition 2.2/Propositions 2.3–2.4, pp.2–3 | The chosen positive orientation is essential and retained. Phase sign is explicitly translated. |
| S10, line 364 | Parallel volume, phase and mean curvature | HarveyLawson1982 lines 1644–1657, III.2 Proposition 2.17, p.96; McLean1998 lines 480–528, §3, pp.718–720 | Sources support constituent geometry; the full global phase-class/cohomology and C²-manifold extension have no attached exact locator. Computed signs below use the roadmap convention. |
| S11, line 399 | Normal graph parametrization | McLean1998 lines 161–178, pp.708–709; Joyce2001SLLectures lines 682–708, p.16 | Supports compact embedded local graphs. The detailed topology/composition estimates still require located targets. |
| S12, line 445 | McLean moduli and regularity | McLean1998 lines 540–567, Theorem 3.6/Corollaries 3.9–3.10, pp.720–721; lines 610–631, proof, pp.722–723; Joyce2001SLLectures lines 678–681, Theorem 5.1, p.16 | Headline dimension and harmonic tangent/metric supported. Does not separately certify every strengthened quantitative bootstrap in the paragraph. |
| S13, line 472 | C¹ weak graphs to Hölder estimates | Read McLean's regularity step at line 630 and the cited PDE/PDO contracts | No exact source for the specified differentiated-system/difference-quotient estimates is supplied. Flat tests below are consistency tests only. |
| S14, line 497 | Vector energy/excess and Campanato | PDE ownership and named Lax–Milgram floor checked | No exact source locator for this package is supplied; pointwise Campanato iff is false (R01). |
| S15, line 521 | Frozen comparison/iteration/system Schauder | PDE E.22 and PDO P6 read | These supply scalar/smooth-coefficient estimates, not by themselves the new rough-coefficient vector theorem. It is explicitly owned here, but its source locator is missing. |

Additional source checks: Züst2025 (key `Zust2025`) lines 64–76, Proposition 1.3/Corollary 1.4, p.2, gives the product lower bound 294/256>1. HarveyLawson1982 lines 1004–1017, II.7 Proposition 7.10, p.76, supplies the decomposable-factor product result. McLean1998 lines 634–649, Theorem 3.13/Corollary 3.14, p.723, supports the special Lagrangian Hessian and Jacobi identification. Joyce's Definition 2.2 phase expression is cosθ ReΩ+sinθ ImΩ, equal to Re(e^(−iθ)Ω); the original Harvey–Lawson phase parameter has the opposite sign and is not silently adopted. Joyce Proposition 2.4 asserts existence of a suitable orientation; it does not justify dropping the positive-real condition.

**Adversarial computations.** The following 140 computed rows cover the sampled paragraphs, every Lean declaration, all headline theorems, and the mathematical constructions/identities throughout C1–C6. They are explicit consistency tests and counterexamples, not proofs of general theorems. “Pass” means the computed instance agrees. Values are exact; affine/unit coordinate examples use the standard metrics. eᵢ are real coordinate vectors and J is multiplication by i. Cases about finite fields, zero rings and inseparability do not instantiate these fixed real/complex inner-product carriers.

| Statement | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Calibration convention (lines 5, 84) | φ=dx on ℝ, positive/reversed unit tangent | φ(e)=1=dvol(e); φ(−e)=−1<1 | Pass; keep orientation explicit. |
| Absolute comass convention (87) | ±dx and 2dx | comasses 1,1,2; evaluations on e are 1,−1,2 | Pass; one-sided frame test needs the stated k=0 separation. |
| Ω normalization (93), n=1 | dz=dx+i dy | Ω∧barΩ=−2i dx∧dy; (i/2)(−2i)=1 | Pass. |
| Ω normalization, n=2 | interleaved real orientation | Ω∧barΩ=4 dvol; (−1)(i/2)²·4=1 | Pass; sign/factor fixed. |
| Phase periodicity (95–97) | θ=0,π,2π on real unit line | φθ(e)=1,−1,1; Re(e^(−iθ)) same | Pass. |
| Comass/native norm (101–114), degree 1 | φ=3dx on ℝ | operator norm 3; frame absolute values {3}, supremum 3 | Pass. |
| Comass/native norm, degree 0 | constant −2 on zero space | norm 2; unique empty-frame value absolute 2; supremum 2 | Pass. |
| Comass/native norm, excess degree | k=2, E=ℝ | form 0, norm 0; frame set empty, real sSup∅=0 | Pass; Lean total supremum handled. |
| Compact Stiefel/maximizer (105) | k=0, k=1 in ℝ, k=2 in ℝ | carriers: one point, {−1,+1}, empty; maxima for 3dx: 3, none in excess degree | Pass; maximizer restricted to k≤dim. |
| Zero form/equality locus (107,166) | φ=0, k=1 | all evaluations 0; equation 0=1 false | Pass; excludes trivial calibration equation. |
| Homogeneity/triangle/definiteness (111) | dx,−dx,2dx | norms 1,1,2; ‖dx−dx‖=0≤2; ‖2dx‖=2·1 | Pass; consume native norm API. |
| Pullback isometry equality (118) | reflection ℝ→ℝ | pullback dx=−dx; norms 1=1 | Pass. |
| Embedding inequality (119) | x-axis inclusion into ℝ², φ=dy | pullback 0, norm 0≤1; not equality | Pass. |
| General linear pullback bound (120) | x↦2x, φ=3dx | pullback norm 6; ‖φ‖‖L‖=3·2=6 | Pass; native bound already exists. |
| `frameVolume` (125), full rank | v=((2,0),(0,3)) | Gram diag(4,9), det36, normDet6 | Pass; nonzero scale test. |
| `frameVolume`, deficient/empty | v=(e,e); empty v | Gram det0, volume0; empty det1, volume1 | Pass; excludes determinant of image dimension alone. |
| Sharp frame-volume inequality (123–128) | area form, v=(2e₁,3e₂), then duplicate e₁ | \|φ(v)\|=6≤1·6; 0≤1·0 | Pass. |
| Exterior simple-vector comparison (131) | v=(e₁,e₁+e₂) | ‖v₁∧v₂‖²=1=det[[1,1],[1,2]] | Pass. |
| Gram–Hadamard (133) | v=(e₁,e₁+e₂); duplicate; empty | 1≤2; 0≤1; 1≤1 | True but duplicate; R04. |
| Riesz/form identification (134) | φ=dx∧dy, bivector e₁∧e₂ | pairing 1=φ(e₁,e₂); on swapped frame −1=−1 | Pass. |
| Hilbert/comass comparison (136) | ω=dx₁∧dy₁+dx₂∧dy₂ on ℝ⁴ | 1≤√2≤√6; zero form gives 0≤0≤0 | Pass; Hilbert norm differs. |
| Oriented Grassmannian carrier (138) | k=1,E=ℝ; k=0 | two orientation rays in each case; forgetful fibre size2 over one plane | Pass; distinguish canonical rank-zero point. |
| Stiefel Gram-map differential (141) | unit frame, symmetric A=diag(2,4) | variation vA/2 gives DGram=A, not 2A | Pass. |
| Free SO(k) action/quotient (144) | k=1,E=ℝ | SO(1)={1}; two frames remain two quotient points | Pass; cannot quotient by O(1). |
| Coordinate transport (147–150) | ι=id, ι′=−id on ℝ | transition −1, conjugation g↦(−1)g(−1)=g | Pass; orientation map still changes sign. |
| Smooth double cover (151) | k=dimE=1 | two oriented points→one unoriented point; degree2 | Pass. |
| HS/CC comparison (154–157) | rank1 ambient ℝ | finite oriented fibre has 2 points; BSO(1) has 1 | Contract absent/mislocated; R03. |
| Rank-zero signed evaluation (160) | φ=−1, positive/negative rays | signed values −1,+1; empty frame alone evaluates −1 | Pass for explicitly separate rays; do not use a frame to represent the negative ray. |
| Closed equality locus (162) | φ=dx on oriented lines in ℝ² | value cos t; equality set t=0 mod2π, closed | Pass. |
| `IsCalibratedFrame` (164) | e₁,−e₁,2e₁ for dx | (ON,value)=(true,1),(true,−1),(false,2) | Pass; both clauses discriminate. |
| Unit decomposable equality plane (166–169) | dx∧dy in ℝ³ | xy-plane positive:1; reversed:−1; xz-plane:0 | Pass. |
| Negation/orientation law (169) | −dx∧dy, reversed xy-plane | evaluation +1, while original orientation gives −1 | Pass. |
| External product general bound (170–172) | dx and dy, concatenated frame | product value1; bound binomial(2,1)·1·1=2 | Pass; coarse bound not equality. |
| Decomposable product bound (173) | dx on one orthogonal line, unit area on another plane | product on concatenated triple1; comass1 | Pass. |
| Orthogonal support insufficient (175) | Züst's two 8-forms | lower bound294/256=147/128>1; factor product1 | Pass negative control. |
| Product orientation (177) | dx,dy swapped | dx∧dy(e₁,e₂)=1; dy∧dx(e₁,e₂)=−1 | Pass. |
| Smooth calibration predicate (182) | dx; 2dx; f(y)dx with f=sin y | (closed,bound)=(yes,yes),(yes,no),(no,yes) | Pass; two independent conditions. |
| Restriction/isometry/parallel transport (184) | constant dx on flat line and translation | pullbacks dx, comass1=1; reflection pullback −dx still comass1 | Pass. |
| Parallel ⇒ closed, componentwise norm (186) | constant 2-form; disconnected constant 1-forms c=1,1/2 | dφ=0; norms constant 1 and1/2 on separate components | Pass; not globally constant without connectedness. |
| Closed need not parallel (189) | φ=(1+cos x)dx/2 on ℝ | dφ=0, norm≤1; covariant derivative=−sin x dx⊗dx/2 | Pass; at x=π/2 derivative−1/2. |
| Calibrated immersion pullback (191) | f(t)=(2t,0), φ=dx | f*φ=2dt=dvol; reversed f gives −2dt versus2dt | Pass. |
| Tangent/frame/parametrization equivalence (192–196) | reparametrize positive line by t↦3t | tangent unit value1; pullback3dt=induced volume3dt | Pass. |
| Pointwise/integrated absolute inequality (196–199) | interval graph y=x, φ=dx, x∈[0,1] | integral1; length√2; 1≤√2 | Pass. |
| Noncompact integrability restriction (198) | whole real line, dx | ∫dx and length both infinite; no finite comparison follows | Pass; requires finite-volume hypotheses where used. |
| Integer chain carrier/boundary² (201–203) | oriented 2-simplex [012] | ∂=[12]−[02]+[01]; ∂²=[2]−[1]−[2]+[0]+[1]−[0]=0 | Pass. |
| Coefficient change/integration (204–206) | coefficient2 on unit oriented segment, dx | integer then real integral2; real coefficient integration2 | Pass. |
| Integer smoothing comparison (207–219) | constant point and constant segment | degree0 coefficient1 stays1; boundary of constant segment=1−1=0 | Pass on test; real isomorphism alone would not exclude ℤ/2 torsion. |
| Shared choice/naturality homotopies (209–216) | affine segment subdivided at1/2 | integral1/2+1/2=1; internal point coefficients +1−1=0 | Pass; strict equality only for shared choices. |
| Parametrized chain mass (220–224) | twice-covered unit circle | mass4π, image length2π; coefficient−2 gives mass8π | Pass; multiplicity retained. |
| Fundamental-chain boundary (225–230) | oriented square split along diagonal | ordered diagonal coefficients +1−1=0; four outside edges remain | Required ordered relative input absent; R02. |
| Fundamental-chain integration/refinement (230–233) | square, area form | two triangle integrals1/2+1/2=1=area | Pass once ordered contract supplied. |
| Relative volume density (237–241) | segment scaled by1+t | Jt=1+t; ∫(Jt−1)=t=Volt−Vol0 | Pass; C² on t>−1. |
| Compact minimizing inequality (243–248) | unit straight segment and y=a sinπx with same endpoints | ∫dx=1 on both; competitor length∫√(1+a²π²cos²πx)≥1 | Pass; strip supplies B. |
| Same boundary insufficient (244–253) | empty boundary: equator loop in cylinder versus empty chain | ∫dθ=2π versus0; loop does not bound | Pass negative control; explicit B excludes it. |
| Equality iff calibrated (254–256) | previous graph a=0 and a≠0 | defect integral0 for a=0; strictly positive for a≠0 | Pass. |
| Constant calibration integral in variation (258) | y=t sinπx with fixed endpoints | ∫dx=1 for every t; derivative0 | Pass. |
| Stability by minimum (261) | same variation | Vol′(0)=0; Vol″(0)=∫π²cos²πx=π²/2≥0 | Pass. |
| First variation/minimality (263) | flat line, constant normal field | H=0; first variation0 | Pass. |
| Boundary term (265) | interval endpoint moved from1 to1+t | length′=1; interior H=0; boundary term1 | Pass negative control; fixed boundary essential. |
| Riemannian product calibration (269) | two unit calibrated intervals | product area1; product form integral1 | Pass under product-comass hypothesis. |
| Minimal need not calibrated (272) | equator S¹⊂S² | length(t)=2πcos t; first0, second−2π | Pass; contradicts stability of any calibration. |
| Wirtinger all degrees (279) | complex 2-plane in ℂ² | ω²(frame)=2, divided by2!=1; comass1 | Pass; absent statable headline, R05. |
| Wirtinger noncomplex control | real 4-plane in ℂ⁴ | ω restriction0, ω²/2 evaluation0; frame volume1 | Pass. |
| Wirtinger zero degree | r=0, any n | ω⁰/0!=1, empty frame volume1 | Pass canonical orientation. |
| Degree-two bound (284) | v=e₁,w=e₁+Je₁ | ω=1; √(1·2−1²)=1 | Pass; independence condition retained for plane classification. |
| `standardKahlerForm` (286) | v=1,w=i; swapped; repeated | Im(conj1·i)=1; −1;0 | Pass; conjugate-first sign pinned. |
| `norm_standardKahlerForm` (289) | n=1; excluded n=0 | norm1=1; zero-space 2-form norm0≠1 | Pass; hn needed. |
| Degree-two iff (290) | (1,i), (1,−i), (0,0) | calibrated true/false/false; unit-and-J condition true/false/false | Pass both directions; zero n gives false↔false. |
| Compatible g/J relation (293) | real (x,y), J(x,y)=(−y,x) | ω(v,Jv)=x²+y²=g(v,v) | Pass; wrong sign gives negative metric. |
| Skew normal form/Pfaffian (297) | orthogonal blocks λ₁J,λ₂J | det=λ₁²λ₂²; oriented Pfaffian=λ₁λ₂; at (1,1) both1 | Pass; retain separate Pfaffian sign. |
| Kähler closed calibration (302–308) | standard ℂ² | dω=0; d(ω²/2)=0; positive plane value1 | Pass. |
| Complex tangent iff calibrated (310) | complex line versus real span(e₁,e₂) in ℂ² | evaluations1 versus0; J-invariance true versusfalse | Pass. |
| Embedded complex comparison (312) | graph z₂=z₁²; graph z₂=bar z₁ | derivative at z₁=1 complex linear versus conjugate-linear | First complex; second tangent not J-invariant. |
| Flat complex normalization/torus (317–320) | ℂ²; rectangular sides (2,3),(1,4) | ω²/2=interleaved dvol; torus volume(2·3)(1·4)=24 | Pass. |
| `standardComplexVolume` (324) | real coordinate frame; swap; repeated | complex determinant1,−1,0 | Pass; rows versus columns agree by det transpose. |
| `standardSpecialLagrangianForm` (326) | n=1, v=e^(it), θ=t | Re(e^(−it)e^(it))=1; θ=t+π gives−1 | Pass. |
| Special Lagrangian comass (327) | n=1 phases0,π/2 | forms dx,dy each norm1; n=0 phaseπ/2 gives0 | Pass; n≥1 essential for norm-one claim. |
| Special Lagrangian iff, positive control (328) | v=(e₁,e₂), θ=0 | ReΩ=1; all imaginary pairings0; ImΩ=0; real>0 | Pass. |
| Special Lagrangian iff, orientation control | v=(−e₁,e₂), θ=0 | ReΩ=−1; Lagrangian true, imaginary0, positivity false | Pass; vanishing alone insufficient. |
| Special Lagrangian iff, non-Lagrangian control | v=(e₁,Je₁) in ℂ² | Ω=0, ReΩ=0; imaginary pairing1; RHS false | Pass. |
| U(n)/SO(n) and phase fibre (332–338) | n=1; n=2 | U(1)/SO(1)=circle; det fibre1=point; dim SU(2)/SO(2)=3−1=2 | Pass; restrict n≥1 as stated. |
| Unoriented quotient/orientation phase | n=1, oriented angle t and t+π | det phases e^(it),−e^(it); det² equal e^(2it) | Pass. |
| Realification/transport (339–352) | 1↦(1,0), i↦(0,1) | ωcomplex(1,i)=1=ωreal((1,0),(0,1)) | Pass; inverse equivalence direction correct. |
| Bilinear-to-alternating adapter (346) | standard area B | intended φ(e₁,e₂)=1; unnormalized alternatization=2 | Pass as distinct target; normalization must remain. |
| J and Hermitian transport (353–358) | v=1,w=i | transported J1=i; g(1,i)+iω(1,i)=i=conj1·i | Pass. |
| Native Lagrangian comparison (359) | real axis in ℂ; zero subspace in ℂ | axis equals symplectic orthogonal; zero's orthogonal=wholeℂ | Pass; half-dimensionality excludes isotropic zero plane. |
| SU(n) reduction (364) | unitary diagonal (e^(it),e^(−it)) | determinant1, Ω preserved; diag(e^(it),1) multiplies Ω by e^(it) | Pass. |
| Parallel Ω calibration (366) | flat complex torus | dΩ=0, dReΩθ=0, comass1 | Pass. |
| U(1) phase without global lift (368–371) | unit circle immersion in ℂ | tangent phase e^(i(t+π/2)); winding1; no periodic real lift | Pass. |
| Phase-class normalization (371–374) | same oriented circle | ∫dθ/(2π)=1; det² class evaluates2 | Pass. |
| Trace/average mean curvature (377–381) | unit circle, T=ie^(it) | Htr=−e^(it)=JT; ιHω(T)=−1=−dθ(T) | Pass sign; in dimension1 Havg=Htr. |
| Minimal iff constant phase (382) | flat real line; unit circle | line H=0, θ=0; circle \|H\|=1, θ′=1 | Pass; connectedness yields one phase. |
| Flat translations/diagonal unitary images | real ℝ² shifted; diag(i,1) image | phases0,π/2; same volume1 on unit frame | Pass. |
| Gradient-graph Lagrangian condition (386) | Hess u=diag(1,0); nonsymmetric graph A₁₂=1 | symmetric graph ωpullback=0; shear gives ω(v₁,v₂)=1 | Pass; actual Hessian symmetry required. |
| Graph Ω/phase determinant (387–389) | Hess u=diag(1,0) | det(I+iH)=1+i; graph volume√2; θ=π/4 makes real√2, imaginary0 | Pass. |
| Phase-angle derivative (390) | H=diag(1,0), Hess v=I | trace((I+H²)⁻¹)=1/2+1=3/2 | Pass. |
| Imaginary residual derivative (392) | same H, θ=π/4 | derivative of e^(−iπ/4)(−1+2i) has imaginary3/√2; factor√2·3/2 same | Pass. |
| Ellipticity/branch (394–396) | H=diag(1,0) | coefficients1/2,1>0; opposite phase has real−√2 | Pass; positive branch excludes it. |
| Normal graph quotient (399–406) | flat torus and constant normal section a | graph y=a; reparametrization changes embedding but not this graph image | Pass; graph coordinate a=0 recovers N. |
| Normal-to-cotangent sign (407) | V=∂y on real line | β=−dx; metric dual has coefficient−1 | Pass. |
| Nonlinear map (410–417) | constant normal translate; variable graph y=t f(x) | constant gives (0,0); n=1 variable gives second component t f′dx | Pass; actual pullback used. |
| Linearization (418–423) | n=2, β=−a₁dx₁−a₂dx₂ | dβ=(∂₂a₁−∂₁a₂)dx₁₂; −d★β=(∂₁a₁+∂₂a₂)dx₁₂ | Pass with direct pullback derivatives. |
| Exact target per connected component (425–430) | two unit circles; top-form constants +1 and−1 | total integral0 but component integrals1,−1; harmonic pairings nonzero | Pass negative control; total mean alone insufficient. |
| Primitive δG (430) | circle η=sin x dx | Gη=sin x dx; δGη=−cos x; dδGη=sin x dx | Pass; harmonic constant excluded. |
| Full Hölder/Green bounds (431–434) | cutoff \|x\|^α | Hölder seminorm near0=1 at every scale; little-Hölder modulus does not tend to0 | Pass; no smooth norm-density assumption. |
| Derivative kernel/complement (435–438) | circle β=c dx and β=sin x dx | harmonic mode maps0; nonconstant mode δβ=−cos x, invertible on zero means | Pass; all forms would include unsolvable constant target. |
| Strict derivative/smooth nonlinear map (438–442) | n=1 graph y=t f, flat tube | F(tf)=t f′dx; linearization remainder0 | Pass in model; not a proof of general Hölder composition estimates. |
| Positive neighborhood (441) | tangent slope a near0 | Re(1+ia)=1>0; reversed parametrization real−1 | Pass. |
| IFT/kernel chart (443) | flat n-torus translations | harmonic1 forms dimension n; normal translation parameters n | Pass; deep IFT inputs still required. |
| McLean moduli dimension (445) | flat T¹,T²; disjoint union of two T¹ | dimensions1,2,2 equal b₁=1,2,2 | Pass; connectedness not needed. |
| C² graph mean-curvature system (448–452) | flat graph u=ax+b | D²u=0; H=0; principal g⁻¹=(1+a²)⁻¹>0 | Pass. |
| Higher/parametric regularity (453–466) | constant normal torus translations V(χ)=χ | spatial derivatives≥1 all0; parameter derivative identity, higher ones0 in every Hölder norm | Pass model; no Banach reparametrization smoothness inferred. |
| L² tangent metric (467) | unit-volume flat torus, constant β,γ | pairing=β·γ; β=e₁ has squared norm1, zero has0 | Pass; intrinsic positive definite metric. |
| C¹ weak graph regularity (472–477) | u=a x on interval | higher derivatives0; interior Hölder norms≤C\|a\|→0 | Pass model; quantitative theorem lacks locator. |
| Area Legendre tensor (478–481) | scalar flat graph p=0; p=a | Lpp(0)=1; Lpp(a)=(1+a²)^(−3/2)>0 | Pass near zero; no global high-codimension convexity claimed. |
| Weak Euler–Lagrange sign (478) | L=½(p²+u²) | integration by parts gives −u″+u=0; div A=b gives u″=u | Pass. |
| Differentiated weak system/F (484–492) | same L, zero reference, w=u′ | a=1, F=u; w″=F′=u′ | Pass; wrong minus sign would give−u′. |
| F bounds (492) | same linear model | ‖F‖∞=‖u‖∞≤‖u‖C¹; [F]ζ=[u]ζ | Pass. |
| Difference quotients (494–496) | u=x² on compact interval | Δτu=2x+τ; DΔτu=2=D∂u; uniform remainderτ→0 | Pass model; weak argument avoids third derivatives. |
| Vector Hilbert norm (503–507) | two constant unit components on unit-volume region | ∫(\|u\|²+\|Du\|²)=2; PiLp norm√2 | Pass; not sup norm1. |
| Comparison solution/Lax–Milgram (497–507) | a₀=I, affine boundary data | v=w affine, w−v=0∈H¹₀; zero Dirichlet homogeneous solution0 | Pass. |
| Constant tensor energy decay (508) | n=2, v=x₁ | energy on Bρ=πρ², on Br=πr²; ratio(ρ/r)² | Pass. |
| Gradient excess decay (509) | n=2, harmonic v=x₁x₂ | average gradient0; excess=πρ⁴/2, ratio(ρ/r)⁴ | Pass exponent n+2. |
| Campanato characterization (516) | f=1 at0,0 otherwise | every average/oscillation integral0; pointwise Hölder seminorm∞ | Fail; R01. |
| Campanato seminorm/full norm | constant f=7 | oscillation0; full Hölder norm7 | Requires L²/mean term; R01. |
| Campanato scaling (517) | n=1, f(x)=x, centered radiusρ | ∫\|f−mean\|²=2ρ³/3; scaled=2ρ^(2−2ζ)/3 | Pass for0<ζ<1 locally. |
| Frozen comparison estimate (521–523) | a=I,F=0,w=x₁ in dimension2 | LHSπρ²; first RHS term C(ρ/r)²πr²=Cπρ² | Pass C≥1. |
| Iteration exponent (524–527) | n=1, α=1/2, γ=3/4 | κ₀=1−2+3/2=1/2∈(0,1); growth supplies exponent3/4 | Pass; γ>1/2 matters in n=1. |
| Uniform coefficient smallness (527–530) | smooth scalar a(x,u,p)=1+x²+p² | oscillation on radiusr, \|p\|≤ε bounded by r²+ε² | Pass; no modulus for arbitrary Du required. |
| Vector Schauder bootstrap (531–539) | a=I,F=0,w affine | Dw constant, Hölder seminorm0; solution C∞ | Pass model; general system estimate unlocated. |
| Weak calibration via approximation (540–547) | graphs y=ε sin x converging C¹ to0 | calibration integral fixed; area defect=O(ε²)→0 | Pass; C¹ pullback is not treated as C². |
| C¹/C∞ moduli topology (548–550) | constant translation sequence a_j→0 | every spatial derivative≥1=0; every C^k distance=\|a_j\|→0 | Pass on model; compactness/regularity supplies general case. |
| Hessian acceleration independence (552) | translations y=at+bt² | volume constant; first and second derivatives0 for all b | Pass at minimal source. |
| Hessian energy formula (554) | unit-period circle β=sin(2πx)dx | ∫\|dβ\|²=0; ∫\|δβ\|²=2π²; graph length″=2π² | Pass. |
| Pointwise second-jet identity (557–562) | A=I₂; A=diag(1,−1) | volume″2, ReΩ″−2 → gap4=(trA)²+skew²; second case2−2=0 | Pass. |
| Pointwise second-jet, shear/skew controls | A=[[0,1],[0,0]]; A=[[0,1],[−1,0]] | gaps1−0=1 and2−(−2)=4; RHS1 and4 | Pass; detects missing skew term. |
| Moving-frame determinant identity (563–565) | v=(e₁,e₂); v=(e₁,Je₁) in ℂ² | det(S+iW)=1 and0; \|Ω(v)\|²=1 and0 | Pass sign with conjugate-first Gram. |
| Moving-frame gap formula (566) | shear A₁₂=1; dilation A=I₂ | W′ Gram norm²1, ImΩ′0 →1; W′0, ImΩ′2 →4 | Pass; Gram norm counts each i<j once. |
| Jacobi operator (573–576) | circle constant β, β=sin(2πx)dx | Δβ=0 and4π²β; normal identification gives same eigenvalues | Pass ellipticity/self-adjoint sign. |
| Jacobi kernel/harmonic tangent (576–579) | flat T² | two constant normal directions, two harmonic1 forms, Hessian0 in each | Pass; no general-minimal unobstructedness claim. |

## Not verifiable

- The worker's actual fifteen-item selection cannot be reconstructed from the brief because no target names are supplied. The replacement seeded sample and its method are reported above; it is not described as the worker's original list.
- All four cited texts were readable legally. However, the README gives no exact locators for the quantitative C¹-to-Hölder/vector-system development, Campanato iteration constants, nonlinear Hölder estimates, parametric gain, global phase-class comparisons, or the specified integral smoothing/triangulation construction. The source sample records which assertions the opened texts actually support; the computed examples do not certify these whole analytic/topological proof routes.
- Supplier contracts R02/R03 cannot be verified at their permitted locations. This is a finding, not an assumed future implementation or an undeclared conditional acceptance.
- No claim of a formal proof of the six admitted theorems is made. The successful Lean runs establish elaboration and binder retention. Ownership searches are textual/object-based searches, not a proof that no equivalent theorem can exist under unrelated terminology.

## Source issues

- **Misprint** in Joyce2001SLLectures at §2.2, equation (3), printed p.4 (line 176): the source places the Hessian equation on ℂᵐ although f has domain ℝᵐ; it should be on ℝᵐ, or the stated real domain; affects nothing.
