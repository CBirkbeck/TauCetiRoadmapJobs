# Review of ToeplitzOperators (pull request #1684 at 67492e4)
Folder: `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/`

**Verdict:** needs changes

## R01 (P1) — Clear the acceptance-build diagnostics and forbidden imports

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/Suggested.lean:1–7`; `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/StableInverseTargets.lean:1`.

**Claim:** The acceptance gate fails its build-diagnostics check on six Mathlib module-system warnings. The same header fails `imports`, `mathlib-subimports` and `no-import-mathlib`. The companion additionally imports another roadmap module, which the brief forbids in every reviewed Lean file.

**Witness:** The targeted build exits 0 but replays six non-`sorry` import warnings. The worker records `build=6 FAIL`; `Suggested.lean:1` imports `Mathlib.Analysis.Fourier.AddCircle`, while the companion imports `TauCetiRoadmap.OperatorTheory.ToeplitzOperators.Suggested`.

**Repair:** Use the single `import Mathlib`, followed by the actually used `TauCeti.Topology.Circle.Degree`. Consolidate the companion's headline statements into `Suggested.lean`, without an inter-roadmap import. Rerun the targeted gate. The combined scratch copy with the corrected header elaborates; no non-`sorry` diagnostics occur. This P1 is the brief's classification of the failed build gate, **not** a claim that Lean returned a compilation error or that the new mathematical theorem is false.

## R02 (P2) — Remove all six admitted data constructions

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/Suggested.lean:41,98,124,140,164,198`.

**Claim:** `hardyBasis`, `coordinateCutoff`, `blockCoordinateCutoff`, `blockSectionReflection`, `symbolLoop` and `sectionReflection` have `sorry` bodies. The index and stability acceptance statements, including all three new companion theorems, consequently depend on admitted data. The later coordinate equations describe the intended objects but do not satisfy the no-admitted-data rule.

**Witness:** `coordinateCutoff` is admitted at line 98; `finiteSection` uses it at line 108; the new inverse-norm theorem consumes that compression. An arbitrary twice-scaled cutoff gives sections 4I for T=I, so inverse bounds 1/4 cannot bound ‖T⁻¹‖=1.

**Repair:** Keep only definitions needed by retained headlines, with real native bodies. The scalar cutoff can use `lp.evalCLM` and `PiLp.continuousLinearEquiv`; normalization already has a real body. Move heavy constructions and dependent signatures that cannot meet this rule to explicit README targets and identify the affected headlines in the module docstring. Remove unused reflection/block scaffolding from the acceptance file. Test the real cutoff on e₀: its first coordinate must be 1, not 2; test the real loop for 2z: its degree must be 1, not the constant loop's 0. The existing admitted formula assertions would exclude those wrong models, but are themselves admissions rather than constructions. This finding accounts for all six `sorry-data` gate failures.

## R03 (P2) — Make Suggested.lean test the statable headline theorems

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:82,134,147,217–230`; `Suggested.lean:9–14`; `StableInverseTargets.lean:25–54`, within the same folder.

**Claim:** Brown–Halmos, scalar Coburn and the scalar Fredholm-symbol equivalence are absent although they are statable on the existing native Hardy subspace and multiplier compression. The three new T4 headlines live only in the companion, which is not imported by the specified acceptance-test module. Neither module docstring inventories missing headlines or their missing carriers.

**Witness:** Scratch signatures for Brown–Halmos, Coburn and Fredholm iff nonvanishing all elaborate at the pins using the existing real-bodied `hardySubspace`, `toeplitz` and `continuousSymbol`. None of those three statements needs `hardyBasis` or an admitted operator.

**Repair:** Put those three signatures and the retained new T4 headlines in `Suggested.lean`, with real definitions as in R02. Inventory the remaining end theorems in the module docstring and name the specific missing carrier for each genuinely unstatable one. For Brown–Halmos use the actual shift `toeplitz (continuousSymbol (fourier 1))`, not an arbitrary free operator. Preserve the nonzero-symbol hypothesis in Coburn: a=0 has both kernels equal to H²; z has kernel 0 and adjoint kernel span(e₀). Preserve the Fredholm predicate separately from the numerical index identity: the zero operator is not Fredholm.

## R04 (P3) — Delete API and instance padding from the acceptance test

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/Suggested.lean:45,55,79,87,102,111,129,144,169,202`.

**Claim:** These are basis/coordinate defining equations, a multiplier definitional equality, a routine compression bound and two `infer_instance` examples, rather than headline acceptance statements. Reflection definitions are not used by any headline currently stated.

**Witness:** Replacing only `symbolMultiplier_apply`'s admission with `rfl` succeeds. The two C*-ring examples already use `infer_instance`. The six basis/cutoff/reflection/loop equations specify the defining APIs, and `norm_finiteSection_le` is the elementary compression bound.

**Repair:** Delete them from `Suggested.lean`; retain the mathematical APIs and discriminating Checks in the README. In particular, do not replace the admitted multiplier theorem with its one-line proof in the submitted acceptance file. The scratch `rfl` probe gives identical Hölder products, e.g. both sides are 2e₀ for a=2,x=e₀. Rows A73–A75 and A89 show the other APIs belong in the README. Keep the genuine matrix-coefficient, norm-isometry, index and stability headlines when their definitions satisfy R02.

## R05 (P3) — Supply exact source locators and identify the versions used

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:41–302,311–319`.

**Claim:** No mathematical target has a theorem/section-and-page locator. The bibliography supplies four works, without even an edition for either Böttcher–Silbermann title. There is no `sources.toml`. This prevents the requested cited-locator audit; source access alone does not identify which claim supports which target.

**Witness:** Park's Proposition 2.7, printed p.4 (`park` line 158), assumes a continuous nowhere-zero symbol. README line 147 asks for every nonzero L∞ symbol. The general theorem is sound, but this source proposition alone does not state it.

**Repair:** Attach exact locators at the claims, specify editions, and record the works under stable source keys in `sources.toml`. For the measurable-symbol Coburn statement cite a source at that generality, or give and locate the extension of the proof; keep the general statement. For instance a nonzero semicircle indicator satisfies the intended hypothesis but not Park's. The source sample below distinguishes four reconstructed supporting locations, one narrower source statement, and ten uncertified locations; no locator is invented for inaccessible books.

## R06 (P3) — Give each definition its API, Checks and local dependencies

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:1–41,93–123,188–215,290–309`; both Lean module docstrings.

**Claim:** The README is six dense T-sections, not the specified roadmap shape. There are no per-definition `**Checks.**` lists, no `*Needs:*` lines, no per-layer Examples/Dependencies and no exact supplier-contract section. T6's handful of examples does not provide three discriminating Checks for each construction. Most Lean names, including all three new theorem names, do not occur in the README.

**Witness:** The Hankel definition at line 93 has no Checks list. The condition number at line 215 has none. `stableSections_solution_error`, `sectionProjection` and `extendedSectionInverse` appear in the companion but nowhere by name in the README.

**Repair:** Reorganize the existing content into the required Summary, Scope and ownership, Conventions, exact contracts and numbered layers. Separate APIs from Checks and attach precise needs to each target. Add three explicit discriminating Checks per definition and list retained headline names. For H_a use H_z=0, H_(z⁻¹)e₀=e₋₁, H_(z⁻²)e₁=e₋₁; these distinguish zero, projection and shifted-index mistakes. For κ use 2I↦1, diag(2,1)↦2 and exclusion of singular 0 (its totalized inverse would spuriously give κ=0). Update both docstrings to the required target-signatures form, or remove the companion after consolidation.

## R07 (P3) — Cite the pinned binary Fredholm-product API in the finite-product extension

**Location:** `TauCetiRoadmap/OperatorTheory/ToeplitzOperators/README.md:175–181`.

**Claim:** The finite PiLp theorem is a legitimate extension, but the proposed reconstruction of product kernels, cokernels and index additivity does not identify the existing binary substrate. The scope/contracts should distinguish the new finite-Hilbert transport from results already supplied by Tau Ceti.

**Witness:** `TauCeti/Analysis/Fredholm/Prod.lean:46,98` supplies `ContinuousLinearMap.IsFredholm.prodMap` and `ContinuousLinearMap.index_prodMap`. The latter gives index(S⊕S†)=−1+1=0, the same r=2 instance used here.

**Repair:** Cite those exact declarations, keep the finite-index/PiLp transport and converse as the new targets, and reuse the binary kernel/range/quotient comparisons. On S⊕S† the transported result still has one-dimensional kernel and cokernel and index 0. This is a supplier-citation correction, not a request to delete the genuinely new finite-product theorem.

## Verified sound

This is an independent AI review of the **whole specified folder**, including inherited content. The PR's new T4 implication and bounds survived the mathematical pass. The findings do not claim that adding the inverse theorem re-plans an existing roadmap. The base roadmap already owns finite sections, and this change strengthens that existing target. No unauthorized outside-folder diff, route-specific restriction, computational algorithm, `set_option`, copied source passage or new supply cycle was found. Finite-matrix calculations and solution-error estimates here are mathematical statements, not executable algorithms.

**Scope and counts.** Read all 319 README lines, all 206 lines of `Suggested.lean`, all 56 companion lines and the family index. Read the repository writing checklist and CONTRIBUTING, plus main's `Completed/OrthogonalL2Bases/README.md` and `TauCetiRoadmap/CompactOperators/README.md` for shape. Reviewed 36 named declarations in the worker's signature inventory and checked all 41 named declarations in a combined scratch elaboration (the original 36 plus five companion declarations). Both unnamed instances were also inspected. No needed section binder disappears. There are 15 admitted theorem statements: 12 in Suggested and three in the companion. Each was tried with `rfl`, `simp` and `infer_instance` alternatives; only `symbolMultiplier_apply` closed. A separate successful copy confirmed that one with `rfl` alone. Defining-equation padding remains padding even when a current admitted definition prevents simplification. The two existing instance examples already close with `infer_instance`.

**Build evidence.** `lake env lean` on the original Suggested module exits 0, with only admission warnings. The targeted `lake build TauCetiRoadmap.OperatorTheory.ToeplitzOperators.Suggested` also exits 0, but replays the six module-import warnings, reproducing the worker's diagnostic-gate failure. The combined signature/rfl probe and three missing-headline probes elaborate successfully. A corrected-import scratch copy elaborates without non-admission diagnostics. No PR file or pin was changed. The worker gate is FAIL: `sorry-data=6`, `imports=1`, `mathlib-subimports=6`, `no-import-mathlib=1`, `build=6`; all other reported counters are zero. R01 and R02 account for every nonzero gate category. The independent checks additionally cover the companion's prohibited import and its dependence on admitted data.

**T4 proof check.** On the stable tail, with Q_n=J_n†, the finite-dimensional inverse bound gives norm(A_n Q_nx)≥norm(Q_nx)/C and the analogous inequality for A_n†. Passing to the two strong limits gives norm(Tx)≥norm(x)/C and norm(T†x)≥norm(x)/C. The first makes T injective with closed range; the second gives ker(T†)=0, hence dense range. Thus T is bijective and its bounded inverse has norm≤C. For y=T⁻¹b, B_nTP_ny=P_ny, so B_nb−P_ny=B_nT(I−P_n)y. Since norm(B_n)≤C, the stated error estimate follows. Apply the same reasoning to T† to obtain adjoint inverse convergence. Replacing P_nb by J_nb_n adds exactly the displayed C times right-hand-side error. The identity, triangular operator and pair-swap computations are recorded in rows A77–A88, rather than relying on elaboration as a proof of truth.

**Headline inventory.** The README aims at: the disk-boundary Hardy isometry and least-majorant norm; scalar and block Brown–Halmos and symbol isometry; the Hankel product formula/continuous compactness; scalar Fredholm criterion, negative-winding index, Coburn and scalar invertibility; the matrix determinant-index theorem; bounded-product quotient stability; stable-compression invertibility, inverse convergence and quantitative solution error; finite-section algebra representation and its compatible-pair quotient; and scalar/block two-limit stability. Suggested currently tests the scalar matrix formula, scalar norm isometry, scalar numerical index and scalar finite-section equivalence. The three new stable-inverse results occur only in the companion. R03 verifies three additional missing statable scalar headlines by elaboration. Analytic Hardy, block Toeplitz/Hankel and finite-section-algebra quotient carriers are not constructed in the acceptance file; its docstring neither names these missing results nor explains their carrier requirements. This is not permission to add artificial stand-ins.

**Pinned declarations opened.** Mathlib is `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti is `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, both confirmed against `lake-manifest.json` and package HEADs. Paths below are relative to the relevant library repository.

| Supplier file and line | Declaration / precise fact inspected |
| --- | --- |
| `Mathlib/Analysis/Fourier/AddCircle.lean:123,298,411` | `fourier`, `fourierCoeff`, `fourierBasis`: positive monomial, negative exponent in coefficient integral, ℤ-indexed L² Hilbert basis. This does not itself supply the nonnegative-mode Hardy basis. |
| `Mathlib/Analysis/Fourier/AddCircle.lean:261` | `span_fourierLp_closure_eq_top`: density for 1≤p<∞; not the missing L¹ Fejér approximation theorem. |
| `Mathlib/Analysis/InnerProductSpace/Projection/Basic.lean:120` | `Submodule.orthogonalProjectionOnto`: codomain is the submodule; requires `HasOrthogonalProjection`, satisfied for the closed Hardy subspace. |
| `Mathlib/MeasureTheory/Function/Holder.lean:132,182,186` | `ContinuousLinearMap.holderL`, heterogeneous Lp multiplication and `Lp.smul_def`; no extra arbitrary multiplier is introduced. |
| `Mathlib/MeasureTheory/Function/LpSpace/ContinuousFunctions.lean:143` | `ContinuousMap.toLp`: native continuous-symbol embedding; full-support equality of sup and essential sup still needs the indicated comparison. |
| `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:1052` | Native Lp pointwise star; it alone is not a whole operator-valued L∞ C*-algebra construction. |
| `Mathlib/Analysis/Normed/Lp/lpSpace.lean:892,1266` | `lp.inftyCStarRing` for arbitrary C*-ring fibers, and `lp.evalCLM` for coordinate evaluation. |
| `Mathlib/Analysis/Normed/Lp/PiLp.lean:1141` | `PiLp.continuousLinearEquiv`, giving the finite-function/finite-Lp transport needed for a real cutoff. |
| `Mathlib/Analysis/Normed/Operator/Fredholm/Basic.lean:368,613` | `isFredholm_iff_exists_isQuasiInverse`, `IsFredholm.index_comp`; finite-rank quasi-inverse formulation, not an undeclared Calkin carrier. |
| `Mathlib/Analysis/Normed/Operator/Fredholm/Open.lean:104` | `index_continuousOn_isFredholm`, on the Fredholm locus in the norm topology. |
| `Mathlib/LinearAlgebra/Matrix/ToLinearEquiv.lean:160` | `Matrix.exists_mulVec_eq_zero_iff` over an integral domain, so applicable to ℂ[z]. |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean:127` | `LinearMap.finrank_range_of_inj`. |
| `Mathlib/LinearAlgebra/FreeModule/PID.lean:554` | `Submodule.smithNormalFormOfRankEq`: needs full rank over a PID; does not directly manufacture the roadmap's polynomial U,D,V operators. |
| `Mathlib/LinearAlgebra/Matrix/Basis.lean:51` | `Module.Basis.toMatrix`, columns given by basis coordinates. |
| `Mathlib/Analysis/Complex/Poisson.lean:276` | `DiffContOnCl.circleAverage_poissonKernel_smul`, for functions holomorphic on the disk and continuous to its boundary. |
| `Mathlib/Analysis/Complex/Harmonic/Poisson.lean:92,103` | `InnerProductSpace.HarmonicOnNhd.circleAverage_poissonKernel_smul` and the `HarmonicContOnCl` version; applies to real harmonic majorants on smaller disks. |
| `Mathlib/Analysis/Complex/Harmonic/MeanValue.lean:67` | `InnerProductSpace.HarmonicOnNhd.circleAverage_eq`. |
| `Mathlib/Analysis/Complex/JensenFormula.lean:375` | `AnalyticOnNhd.circleAverage_log_norm`: nonzero center value and nonzero radius; T1's factorization at 0 addresses the former. |
| `TauCeti/Topology/Circle/Degree.lean:77,82,100` | `Circle.degree`, `sub_eq_degree_mul`, `degree_eq_of_homotopy`: counterclockwise sign, radians with factor 2π, moving-basepoint homotopies permitted. |
| `TauCeti/Analysis/Contour/Winding/Number/Basic.lean:76` | `TauCeti.Contour.windingNumber γ a b z₀`: complex-valued normalized principal-value integral; avoidance is needed for the ordinary integral interpretation. |
| `TauCeti/Analysis/Fredholm/CompactPerturbation.lean:87,137` | `IsFredholm.add_of_isCompactOperator`, `index_add_of_isCompactOperator`. These already supply the perturbation theorem behind the roadmap's Toeplitz specialization. |
| `TauCeti/Analysis/Fredholm/Prod.lean:46,98` | `IsFredholm.prodMap`, `index_prodMap`, under nontrivially normed-field/normed-space hypotheses; neither assumes finite dimension of the ambient spaces. |

**Ownership and supplier resolution.** Used `roadmaps grep` and `roadmaps show`, object searches of both pinned libraries, main, the available board packages, and the supplied open-roadmap heads. The local board package search found no competing Toeplitz construction. The five additional packages named in the worker's package index concern arithmetic; their inaccessible remote contents were not silently treated as searched. The existing main copy and this PR are the same roadmap, not two owners; no distinct roadmap declaring these fully qualified Toeplitz names was found. Search hits for Hellinger–Toeplitz, Toeplitz–Cuntz and geometric quantization do not define this Hardy-space/finite-section library.

| Citation resolved | Exact text inspected and result |
| --- | --- |
| CStarAlgebras C1 | `TauCetiRoadmap/CStarAlgebras/README.md:145–153` at the supplied open head: quotient C*-norm, closed ranges/isometry, spectral permanence with appropriate unitization. |
| CStarAlgebras C5 | Same file, lines 602–612: native bounded product, cofinite norm-null ideal, quotient and pointwise operations. The ℕ instance is the required sequential ideal. |
| CStarAlgebras C8 | Same file, lines 824–831: shift Sx(0)=0,Sx(n+1)=x(n), native Circle, symbol z and compact-kernel extension. Agrees with Toeplitz's i−j matrix convention. |
| OperatorKTheory K4 | `TauCetiRoadmap/OperatorKTheory/README.md:375–384` at the supplied open head: Calkin/Atkinson bridge and native index comparison. K6's later use of the Hardy projection does not make the consumed K4 contract depend on Toeplitz. |
| BanachSpaceTheory B5 | `TauCetiRoadmap/BanachSpaceTheory/README.md:336–346` **on main**, not its revision PR: native scalar L∞ Hölder product, unit and commutative C*-laws. The open revision was also inspected but is not substituted as the supplier. |
| BanachAlgebras A3 boundary | `TauCetiRoadmap/BanachAlgebras/README.md:679–689` on main: finite Banach-product spectrum/inverse comparison, explicitly assigning the Hardy/finite-section theory here. This is distinct from the finite-product Fredholm-index target. |
| Family index | `TauCetiRoadmap/OperatorTheory/README.md:66–69,83`: same ownership and named external suppliers. |

There are **five resolved supplier sections from three external roadmaps**, plus the BanachAlgebras ownership boundary and family index. No missing cited section or invented declared gap was found. There are no `*Needs:*` lines to inspect; R06 asks for those local edges. The internal proof order T1→T2→T3, independent bounded-product T4 with T1/T2 transports, then T5 and T6 is coherent. The external supplier checker reports exactly:

```text
depcheck: 205 roadmaps, 1501 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. No ownership move is proposed.

**Source sample.** The worker supplied no target IDs (“none found by heading”), and none of the targets has a locator. Consequently I cannot reproduce an undisclosed worker sample or mark its locators verified. For a reproducible fallback, I numbered the mathematical rows A01–A112 below and used `random.Random(1684).sample(range(1,113),15)`, sorted. The 15 selected rows are A02,A33,A34,A40,A54,A58,A62,A67,A68,A74,A75,A80,A81,A101,A104. All are also included in the computed adversarial table. No README locator is explicitly flagged “unverified”; rather, all locators are absent.

All four bibliography works were attempted through the sources service. `park` was obtained legally from the linked faculty page; the two Böttcher–Silbermann books and Conway were classified uncertified/paywalled. They are not pending requests for the author to bypass a paywall. The initial unresolved analysis-book request was cleared after the same source key resolved to the Springer edition's paywall. The roadmap manifest was not edited. Reconstructed Park locations below refer to [Park's faculty-hosted notes](https://faculty.tcu.edu/richardson/Seminars/EftonToeplitz_2016.pdf), not to nonexistent README locators.

| Sample | Source location actually read | Number/page/hypothesis result |
| --- | --- | --- |
| A02 | `park` line 31, §1, printed p.1 | Hardy nonnegative-mode closed-span description supports this object; no numbered theorem. |
| A33 | Park, pp.1–5 inspected | The trigonometric-polynomial multiplier criterion is not stated there; no alternative exact book locator supplied. Uncertified. |
| A34 | Park, pp.1–5 inspected | The actual-complement Hankel construction is not stated there. Uncertified. |
| A40 | `park` line 184, §3, printed p.5 | Supports finite matrix multiplication and block Hardy compression. No separate numbered construction. |
| A54 | `park` line 144, proof of Theorem 2.5, printed p.4 | Nonvanishing continuous symbols are reduced by homotopy to monomials; agrees with the roadmap. |
| A58 | `park` line 158, Proposition 2.7, printed p.4 | Continuous and nowhere-zero hypotheses are stronger than the target's nonzero L∞ hypothesis. General version not source-certified. |
| A62 | `park` line 198, Theorem 3.1, printed p.5 | Continuous matrix symbols, pointwise invertibility and negative determinant winding agree. |
| A67 | Tau Ceti `Analysis/Fredholm/Prod.lean:98` read | Binary index sum confirmed at the pin; finite-PiLp extension has no cited external locator. Uncertified as a source citation. |
| A68 | Mathlib `Analysis/Normed/Lp/lpSpace.lean:892` read | Native C*-product confirms the carrier claim; no external printed-page locator is supplied. |
| A74 | Böttcher–Silbermann titles attempted | Finite-compression bound is mathematically checked below; cited theorem/page cannot be checked. |
| A75 | Same | Strong convergence and adjoint convergence checked below; exact source location unavailable. |
| A80 | Same | Strong inverse convergence checked by the T4 proof above; exact source location unavailable. |
| A81 | Same | Adjoint inverse convergence checked above; exact source location unavailable. |
| A101 | Same | Multiplicativity/star checked using bounded strong and strong-adjoint limits; exact source location unavailable. |
| A104 | Same | Compatible-pair quotient theorem not verified against an accessible exact source location. |

Additional source checks: compact semicommutators at `park` line 105 (Proposition 2.2, p.3); shift extension at line 134 (Theorem 2.3, p.4); Fredholm criterion at line 139 (Corollary 2.4, p.4); negative winding at line 141 (Theorem 2.5, p.4); boundary uniqueness at line 156 (Lemma 2.6, p.4); scalar invertibility at line 181 (Corollary 2.8, p.5). The printed index-integral misprint is recorded below. Park is a short expository source, so these matches do not replace exact primary/textbook references for the full generality of the library.

**Computed adversarial pass.** The following 116 rows cover the prose constructions, their stated identities and implications, the headline results, every sampled target and every mathematical finding witness. S is the forward shift, E_ij sends e_j to e_i, N=n+1, and φ=(1+√5)/2. “Pass” means the computed test agrees, not that these examples prove the theorem. Missing-source status is independent of passing numerical or algebraic tests. The table uses intended mathematical constructions; R02 explains why admitted Lean data cannot serve as their implementation. Tests appropriate to this complex Hilbert-space scope include zero spaces, r=0, n=0/1/2, zero symbols, noninvertible operators, reversed order and signs, tails, and noncommuting 2×2 matrices. Characteristic-p fields, nonreduced schemes and nonabelian groups are not inputs to these statements.


| ID | Statement and README line | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- | --- |
| A01 | Normalized Haar/Fourier conventions (11–15) | 1, z, z⁻¹ | ∫1=1; ∫z=0; hat(z)(1)=1, hat(z)(−1)=0 | Pass; retain normalization |
| A02 | Hardy closed span and negative-mode characterization (16,43) | e₀, e₁, e₋₁ | First two have negative coefficients 0 and belong; e₋₁ has coefficient 1 at −1 and is excluded | Pass; add these Checks |
| A03 | Hardy basis, completeness and sequence equivalence (44–46) | e₀+2e₂ | Coefficients (1,0,2,…); squared norms on both sides 5 | Mathematical target sound; admitted basis R02 |
| A04 | Projection and orthogonal splitting (46–47) | e₋₁+2e₀ | P gives 2e₀, complement e₋₁; squared norms 5=4+1 | Pass |
| A05 | Multiplier definition/norm (47–49) | a=2, x=e₀; a=0 | M₂x=2e₀; operator norm=2=essential sup; zero gives 0=0 | Pass |
| A06 | Multiplier adjoint (48) | a=i, x=e₀ | M_i†x=−i e₀=M_conj(i)x; wrong unchanged symbol gives +i e₀ | Pass |
| A07 | Multiplier linearity (49) | a=1,b=i,x=e₀ | M_(1+i)x=(1+i)e₀=M₁x+M_ix | Pass |
| A08 | Multiplier products and constants (49) | a=z,b=z⁻¹ | M_a M_b e₀=e₀=M₁e₀; M₀e₀=0 | Pass |
| A09 | Continuous-symbol embedding, norm equality (49–50) | a=2z; continuous a=0 | L∞ and sup norms both 2; both 0 for zero | Pass; full support matters |
| A10 | Power-series disk function (52–53) | x=e₀+2e₁ | F_x(w)=1+2w; at w=1/2 both descriptions give 2 | Pass |
| A11 | Local uniform convergence/holomorphy (53–54) | x=e₂ and geometric coefficients 2⁻ⁿ | F=w²; geometric sum=1/(1−w/2), tail on abs(w)≤ρ bounded by (ρ/2)^(N+1)/(1−ρ/2)→0 | Pass; ρ<1 |
| A12 | Evaluation estimate (54) | w=1/2; x with coefficients (1/2)ⁿ | F_x(w)=4/3; norm(x)=2/√3; RHS=(2/√3)/(√3/2)=4/3 | Pass; sharp bound |
| A13 | Radial L² convergence (54) | x=e₂ | Squared radial error=(1−r²)²→0 | Pass |
| A14 | Harmonic-majorant Hardy definition (55–58) | F=0, F=w, F=1/(1−w) | Least values at 0 are 0 and 1; last function's radial mean=1/(1−r²)→∞, so no finite majorant value | Pass; discriminates nonmember |
| A15 | Majorant norm and isometric boundary comparison (58,64–67) | F=1+w | Radial mean=1+r²; supremum=2=boundary norm²=least-majorant value at 0 | Pass |
| A16 | F_x equals Poisson extension (59) | x=e₁; w=r e^(iθ) | Both equal r e^(iθ); negative boundary mode would give conjugate(w), not holomorphic | Pass |
| A17 | Poisson majorant and its minimality (59–63) | F=w and F=1+w | Least majorants 1 and 2+2Re(w); differences from abs(F)² are 1−abs(w)²≥0 in both cases | Pass; zero majorant excluded |
| A18 | L¹ square convergence used in minimality (62) | F=w | L¹ error of squares=1−r²→0 | Pass |
| A19 | Radial Parseval/majorant converse (64–66) | coefficients 2⁻ⁿ | Radial mean=1/(1−r²/4); supremum=4/3=Σ4⁻ⁿ | Pass |
| A20 | Reproducing and normalized kernels (67–68) | w=0, w=1/2 | k₀=1, norm=1; k_(1/2)=1/(1−z/2), norm²=4/3; inner(k_w,e₁)=w | Pass; conjugate-first convention |
| A21 | Boundary uniqueness and log integrability (69–72) | F=w; F=1−w; F=0 | Boundary zero sets: empty; singleton of measure 0; whole circle of measure 1. Mean log abs for first two=0 | Pass; nonzero hypothesis indispensable |
| A22 | circleAverage/AddCircle transport (73–74) | constant 1, e^(iθ) | Normalized integrals (1,0) on both parametrizations; raw angle integral of 1=2π | Pass |
| A23 | L¹ Fourier uniqueness and Fejér approximation (74–75) | f=z; f=0 | Fourier coefficients δ_(k,1), 0; Fejér mean of z=(1−1/(N+1))z, L¹ error=1/(N+1) | Pass; new circle L¹ target distinct from L² basis |
| A24 | L² product/coefficient formula (75–76) | f=1+z,g=1−z | fg=1−z²; convolution coefficients (1,0,−1) match integrals | Pass; product is L¹ |
| A25 | Toeplitz compression definition (19,80) | a=z,z⁻¹,0 on e₀ | Outputs e₁,0,0; M_(z⁻¹)e₀=e₋₁ is removed by P | Pass |
| A26 | Matrix i−j / j−i dictionary (19–22,81) | a=z, row 1 column 0 | Entry=1=hat(a)(1)=c₋₁; c₁=0 | Pass; opposite sign rejected |
| A27 | Toeplitz adjoint and constants (81) | a=i; a=z | T_i†=−iI; T_z†e₀=0 and T_z†e₁=e₀ | Pass |
| A28 | Symbol-map linearity (80–81) | a=1,b=z on e₀ | T_(1+z)e₀=e₀+e₁=(I+S)e₀ | Pass |
| A29 | Toeplitz norm equality/injectivity (81) | a=0,2z | Norms 0=0 and 2=2; 2z cannot map to zero | Pass; headline present |
| A30 | Brown–Halmos iff, unique symbol (82–83) | T=S; T=E₀₀ | S†SS=S; S†E₀₀S=0≠E₀₀. Symbols z and none respectively | Pass; headline missing R03 |
| A31 | Bounded matrix/symbol and uniform-compression iff (83–87) | c₀=1, others 0; c_k=1 all k | Identity bounds=1 and symbol 1; all-ones N-square norm=N, no uniform bound or bounded extension | Pass |
| A32 | Bilateral Laurent/Fourier comparison (86–88) | a=z | Bilateral shift sends δ₀ to δ₁; Fourier image sends 1 to z | Pass |
| A33 | Multiplier criterion (89–91) | a=2; a=2·1_E with measure(E)=1/4 | Norm ratios=2 for constant case and on approximants to 1_E; bound C=1 fails, C=2 works | Pass; bound recovers essential sup |
| A34 | Hankel codomain and definition (93–94) | a=z and a=z⁻¹ on e₀ | H_z e₀=0; H_(z⁻¹)e₀=e₋₁ in H²⊥ | Pass |
| A35 | Semicommutator sign (95) | a=z,b=z⁻¹ | SS†−I=−E₀₀; −H_(z⁻¹)†H_(z⁻¹)=−E₀₀ | Pass |
| A36 | Analytic/coanalytic product identities (96–97) | a=z⁻¹,b=z; reversed order | S†S=I=T₁; reversed SS†=I−E₀₀ | Pass; arbitrary multiplicativity excluded |
| A37 | H∞ multiplier comparison (97) | analytic z; coanalytic z⁻¹ | z preserves H² with norm 1; z⁻¹ sends e₀ outside H² before compression | Pass |
| A38 | Continuous semicommutator compactness (98–99) | a=z²,b=z⁻³ | Difference maps e₁↦−e₀,e₂↦−e₁, other basis vectors↦0; rank 2 | Pass |
| A39 | Block Hardy/L²/sequence carriers (102–106) | r=1,2; x=(e₀,2e₁) | r=1 recovers scalar norm; r=2 norm²=5 in all three models; r=0 is zero space | Pass; r=0 excluded where nonzero algebra needed |
| A40 | Block multiplier/compression/Fourier entries (107–108) | constant A=E₁₂ in dimension 2 | T_A(e₀⊗e₂)=e₀⊗e₁; coefficient at mode 0=E₁₂, other modes=0 | Pass |
| A41 | Block linearity, adjoint, isometry (108) | A=E₁₂, B=E₂₁ | T_A†=T_B; both norms=1; (T_A+T_B)(e₀⊗e₁)=e₀⊗e₂ | Pass |
| A42 | Block Brown–Halmos (108) | T=I⊗E₁₂; E₀₀⊗I | Shift conjugation fixes first; sends second to 0≠second | Pass; missing headline inventory R03 |
| A43 | Operator-valued L∞ product, unit, star and C*-law (109–112) | constant E₁₂ and E₂₁ | AB=E₁₁, BA=E₂₂; A†A=E₂₂, norm=1=norm(A)²; I·A=A | Pass; do not commute matrix factors |
| A44 | Block continuous embedding/multiplier bound (112–113) | diag(2,1) | Sup, essential sup and multiplier norm all 2; e₁ attains 2 | Pass |
| A45 | Ordered Fourier convolution (113–116) | A=zE₁₂,B=z⁻¹E₂₁ | Product coefficient at 0=E₁₁; reverse product gives E₂₂ | Pass |
| A46 | Block Hankel/product/compact defect (117–121) | A=zE₁₂,B=z⁻¹E₂₁ | Semicommutator=−E₀₀⊗E₁₁; reverse coanalytic/analytic product exact | Pass |
| A47 | Hardy/shift-algebra identification and symbol (126–129) | S and I−SS† | Symbols z and 0; vacuum projection transported to E₀₀ | Pass; C8 conventions agree |
| A48 | Unique T_a+K decomposition (130) | I−E₀₀; a=0 | Pair is (1,−E₀₀); a nonzero constant cannot be absorbed in compact K since essential norm=1 | Pass |
| A49 | Essential norm and essential spectrum (131–132) | a=2; a=z | Essential norms 2,1; spectra {2},unit circle, equal symbol ranges | Pass |
| A50 | Scalar Fredholm iff (134) | a=z,z⁻¹,0 | Kernels/cokernels (0,1),(1,0),(∞,∞); Fredholm values true,true,false match nowhere-zero values | Pass; headline missing R03 |
| A51 | Normalization and loop definition (135–137) | a=2z, a=−2, forbidden a=0 | Normalized points z,−1; endpoint pairs (1,1),(−1,−1); zero yields 0/0=0, norm 0≠1 | Pass with nonvanishing; loop admitted R02 |
| A52 | Degree/contour normalization (138–140) | γ(t)=exp(2πit), reverse loop | Integrals γ′/γ are ±2πi; winding=±1=degree | Pass; source's missing i recorded separately |
| A53 | Degree zero iff continuous logarithm (140–142) | a=2; a=z | log(2) is periodic, degree 0; angle lift for z changes by 2π, degree 1, no periodic logarithm | Pass |
| A54 | Monomial homotopy and index invariance (142–144) | a_s=(1+s)z, 0≤s≤1 | Every symbol has winding 1 and index −1; a_s/z positive so never zero | Pass |
| A55 | Scalar index sign (134–144) | z²,z⁻²,1 | Indices −2,+2,0 equal negative winding −2,+2,0 | Pass |
| A56 | Compact-perturbed index (144,151–153) | T=I−E₀₀ | Kernel and cokernel dimensions 1,1; index=0=−wind(1) but not invertible | Pass |
| A57 | C*-spectral permanence use (146) | z in shift quotient | Quotient image has spectrum unit circle in both quotient and Calkin; S itself has disk spectrum in both C*(S) and B(H) | Pass; distinct quotient and ambient spectra |
| A58 | Coburn alternative (147–149) | z,z⁻¹, nonzero indicator of semicircle; a=0 | Kernel pairs (0,span e₀),(span e₀,0),(0,0); zero symbol has (H,H), refuting dropped nonzero assumption | Pass; headline missing R03; source narrower |
| A59 | Fredholm index zero implies scalar invertibility (149–151) | a=2; a=z; I−E₀₀ | First index 0 and inverse 1/2 I; z index −1; compact-perturbed example index 0 but not scalar Toeplitz | Pass; scalar qualifier essential |
| A60 | Continuous scalar invertibility iff nonvanishing/wind zero (150–151) | a=2,z,0 | Truth values true,false,false; RHS respectively (true,0),(true,1),(false,undefined) | Pass; nonzero prerequisite protects winding |
| A61 | Block algebra, quotient kernel and symbol map (155–160) | constant E₁₂; E₀₀⊗E₁₂ | Symbols E₁₂ and 0; norms both 1 but essential norms 1 and 0 | Pass |
| A62 | Matrix Fredholm/determinant-index theorem (160–162) | diag(z,z⁻¹); diag(z,0) | First det=1,index=−1+1=0,Fredholm true; second det=0 and infinite kernel,Fredholm false | Pass |
| A63 | Laurent approximation through invertibles (162–165) | A=diag(z,2), perturbation εI | Minimum singular value=1; abs(ε)<1 keeps both factors nonzero; ε=−2 fails second entry | Pass; use a strict perturbation bound |
| A64 | Polynomial shift Q and Smith comparison (165–173) | A=diag(z,z⁻¹), m=1 | Q=diag(z²,1), det Q=z²≠0 polynomial; Smith diagonal (1,z²), determinant unchanged after permutations | Pass |
| A65 | Unimodular analytic Toeplitz inverses (171–175) | U=[[1,z],[0,1]] | det U=1; U⁻¹=[[1,−z],[0,1]]; Toeplitz product has off-diagonal S−S=0 and diagonal I | Pass |
| A66 | Finite-product Fredholm iff (175–181) | S⊕S†; S⊕0 on infinite summand; empty product | Fredholm true,false,true; defect dimensions (1,1),(∞,∞),(0,0) | Pass; cite binary supplier R07 |
| A67 | Finite-product index sum (177–185) | S⊕S†; two backward shifts | 0=(−1)+1; 2=1+1; z⁻ᵐI_r has index mr, m=1,r=2 gives 2 | Pass; cite existing index base R07 |
| A68 | FiniteOperator and bounded product (190–192) | n=0,1; identities | Dimensions 1,2; operator norms 1,1; bounded-family norm=1; no entrywise sup norm substitution | Pass |
| A69 | Norm-null ideal/quotient (193–196) | A_n=I, G_n=I/(n+1) | Norms 1 and 1/(n+1)→0; quotient classes [I] and 0 | Pass; C5 supplied |
| A70 | Quotient invertibility iff eventual inverse bound (197–200) | I except A₀=0; A_n=I/(n+1) | First tail inverse norms 1 and quotient unit; second inverse norms n+1→∞ and quotient zero | Pass; early singular values harmless |
| A71 | Arbitrary finite-dimensional/block variant (201–204) | r=1,2; varying dimensions d_n=n+1 | Identity inverse norms all 1; dimension-zero endomorphism algebra has 0=1, excluded by nonzero-space hypothesis | Pass |
| A72 | r=1 scalar/block coordinate comparison (205–209) | vector coefficients (3,4) | Entries at (0,0),(1,0) are 3,4; scalar entries same; both norms=5 | Pass |
| A73 | Coordinate cutoff and finite sections (211–213) | n=0,1; x=e₀+2e₁+3e₂ | Cutoffs (1),(1,2); J†J finite identity; zero extension P₁x=(1,2,0,…) | Pass; admitted cutoff R02 |
| A74 | Finite-section norm bound (213) | T=2I; T=S,n=0 | Norms 2≤2 and 0≤1 | Pass; API padding in Lean R04 |
| A75 | Strong compression and adjoint limits (213–214) | T=S, x=e_j | Compression equals e_(j+1) once n≥j+1; adjoint equals e_(j−1) once n≥j, or 0 for j=0 | Pass |
| A76 | Condition number (214–215) | A=2I; A=diag(2,1); A=0 | κ=2·1/2=1; κ=2·1=2; singular case excluded (total inverse would misleadingly give 0) | Pass |
| A77 | Stability forces invertibility (217–222) | T=2I; unilateral shift | First inverse norm 1/2 and stable; shift has finite-section determinant 0 at every n, hence hypothesis false | Pass; new headline in companion only R03 |
| A78 | Passage of two lower bounds (219–222) | T=2I and T=S | For 2I: both inequalities 2norm(x)≥2norm(x); S has lower bound 1 but S†e₀=0, so adjoint bound fails | Pass; adjoint argument essential |
| A79 | Every actual inverse bound inherited (219–222) | T=2I; C=1/2, C=1/4 | Inverse norm 1/2≤1/2; for C=1/4 finite-tail premise already false | Pass; quantifier order correct |
| A80 | Extended inverse strong limit (223) | T=2I | B_n=(1/2)P_n; error at x=(2⁻ʲ)_j equals 2^(-(n+1))/√3→0 | Pass |
| A81 | Extended inverse adjoint strong limit (224) | T=iI | B_n†=iP_n; limit iI=(T⁻¹)†; unstarred limit would be −iI | Pass |
| A82 | Initial values do not affect limits (224–225) | T=I; replace B₀ by 100I | For n≥1, B_n=P_n; error on e₀ is 0 eventually despite initial 99 | Pass |
| A83 | Exact projection-tail identity (225–226) | T=I+E₀₁,n=0,y=e₁,b=e₀+e₁ | x₀=e₀,P₀y=0; LHS=e₀; B₀T(I−P₀)y=e₀ | Pass; positive sign necessary |
| A84 | Quantitative solution error (227) | Same triangular T; C=φ=(1+√5)/2 | LHS=√2; RHS=1+φ²=(5+√5)/2; for n≥1 both are 0 | Pass; new headline in companion only |
| A85 | Approximate-right-hand-side error (228–230) | T=I,b=0,b_n=ε_n e₀ | Solution norm=abs(ε_n); RHS C·norm(J_nb_n−P_nb)=abs(ε_n), C=1 | Pass; ε_n→0 gives convergence |
| A86 | Finite limsup yields strictly larger tail bound (231) | inverse norms 1+1/(n+1) | limsup=1; C=1 fails every n; every C>1 succeeds eventually | Pass; strict inequality essential |
| A87 | Strong versus norm inverse convergence (232–234) | T=I; fixed e_j and moving e_(n+1) | (P_n−I)e_j eventually 0; (P_n−I)e_(n+1)=−e_(n+1), so operator norm=1 | Pass |
| A88 | Ambient invertibility insufficient (236–237) | Successive pair swap, sizes 1,2,3 | Finite determinants 0,−1,0; ambient operator squares to I and has norm 1 | Pass |
| A89 | Reflection W_n, tail and W_n² (241,256) | n=0,1; x=(a,b,c,…) | W₀x=(a,0,…); W₁x=(b,a,0,…); W₁²x=(a,b,0,…)=P₁x | Pass; no natural subtraction tail bug |
| A90 | Finite-section algebra/remainder form (242–245) | Pure I; S_n S_n†; S_n† S_n | Triples (a,K,L)=(1,0,0),(1,−E₀₀,0),(1,0,−E₀₀), G=0; n=0 both latter matrices 0 | Pass |
| A91 | Corner compression/extension inverse (246–248) | n=0, finite matrix [2]; ambient S | J[2]J†=2E₀₀, recompression [2]; extending compression of S gives 0≠S | Pass; corner restriction indispensable |
| A92 | Classical Hankel and flip J (249–250) | a=z⁻¹; e₀ and e₁ | JH_a e₀=e₀=C_z e₀; JH_a e₁=0=C_z e₁ | Pass; −n−1 offset correct |
| A93 | Widom identity, left boundary (251–252) | a=z,b=z⁻¹, size N | LHS=I_N; RHS=(I_N−E₀₀)+E₀₀+0=I_N | Pass |
| A94 | Widom identity, right boundary (251–252) | a=z⁻¹,b=z, size N | LHS=I_N; RHS=(I_N−E_(N−1,N−1))+0+E_(N−1,N−1)=I_N | Pass, including N=1 |
| A95 | W_n weak convergence (253) | Fixed e_j,e_k | inner(e_k,W_ne_j)=1 only when n=j+k, eventually 0; norm(W_ne₀)=1 | Pass; not strong convergence |
| A96 | Compact sandwich norm convergence (253) | K=L=E₀₀ | E₀₀W_nE₀₀=0 for n>0; with K=L=I instead norm=1 | Pass; both compact hypotheses used |
| A97 | Reflected compact strong convergence (254) | K=E₀₀ | W_nP_nKP_nW_n=E_nn; value on fixed e_j eventually 0, operator norm stays 1 | Pass |
| A98 | Compact projection tails (256) | K=E₀₀; K=diag(1/(j+1)) | Tail norms 0 and 1/(n+2), respectively, tending to 0; I has tail norm 1 | Pass |
| A99 | Reflected Toeplitz identity (257) | a=z,n=1 | W₁[[0,0],[1,0]]W₁=[[0,1],[0,0]]=T₁(z⁻¹) | Pass |
| A100 | Unique remainder data and two strong limits (258–263) | A_n=I_N+P_nE₀₀P_n+W_n(2E₀₀)W_n | Limits I+E₀₀ and I+2E₀₀; symbols both 1, data recover K=E₀₀,L=2E₀₀ | Pass |
| A101 | Strong-limit multiplicativity/star (262–263) | A_n=S_n,B_n=S_n† | W(AB)=SS†=I−E₀₀=W(A)W(B); W(A*)=S†=W(A)* | Pass; strong adjoint convergence needed |
| A102 | Limsup bounds and closedness estimates (264–266) | a=1,K=E₀₀,L=2E₀₀,G=0 | R=3; symbol norm 1≤3; limit norms 2,3≤3; compact norms 1,2≤6 | Pass |
| A103 | Independent boundary matrix units/pair image (267–269) | I−S_nS_n† and I−S_n†S_n | Pairs (E₀₀,0),(0,E₀₀); reflected defects independent even though at n=0 both matrices [1] | Pass; finite prefix disappears |
| A104 | Norm-null quotient, compatible pair and injectivity (271–273) | G_n=I_N/(n+1); (S,S) | First has pair (0,0) and quotient class 0; second symbol pair (z,z) is incompatible since reflection needs z⁻¹ | Pass |
| A105 | Inverse-closed pair image / two-limit stability iff (273–277) | Pure scalar 2; a=1,K=−E₀₀,L=0 | First limits both 2I and stable; second limits I−E₀₀,I and all sections singular | Pass; one limit alone insufficient |
| A106 | Pure scalar continuous stability criterion (277–279) | a=2,z,z⁻¹ | Stable values true,false,false; winding values 0,1,−1; finite inverse norms 1/2,undefined,undefined | Pass; existing Lean equivalence correct |
| A107 | Block reflection preserves fiber (280–283) | r=2,n=1, x=e₀⊗e₂ | W_nx=e₁⊗e₂; wrong fiber reversal gives e₁⊗e₁ | Pass; retain as Check |
| A108 | Ordered block Widom/remainder/limits (284–286) | A=zE₁₂,B=z⁻¹E₂₁ | AB=E₁₁; left defect E₀₀⊗E₁₁, right defect 0; reversing order would use E₂₂ | Pass |
| A109 | Block stability needs both operators, not determinant alone (286–295) | diag(z,z⁻¹) | det=1,wind=0,index=0; kernel and cokernel dimensions 1 each; all pure sections singular | Pass |
| A110 | Symmetric unbounded coefficient example (296–299) | c_k=1/(abs(k)+1), normalized constant vectors of length N | Rayleigh quotient=2(N+1)H_N/N−3; N=1,2,3 gives 1,3/2,17/9; diverges like 2log N | Pass; L² coefficients but no L∞ symbol |
| A111 | Antisymmetric coefficient comparison (300–301) | k=±1,±2; sum to m | abs(c_k−1/k)=1/(abs(k)(abs(k)+1)); two-sided sum=2(1−1/(m+1))→2 | Pass; c₀=0 avoids 1/0 |
| A112 | Hilbert-transform multiplier and Toeplitz bound (301–302) | θ∈(0,2π); coefficient 1/k | Multiplier i(π−θ) has essential sup π; adding ℓ¹ error norm 2 gives compression norm≤π+2 | Pass; requires a precise source locator |
| A113 | Lean symbolMultiplier_apply (Suggested.lean:55) | a=2,x=e₀ | Both sides are the same Hölder product, value 2e₀; `rfl` succeeds | Padding R04 |
| A114 | Lean basis/cutoff/reflection formula declarations (Suggested.lean:45,102,129,144,169,202) | e₀, block e₀⊗e₂; n=1 | Basis inclusion=e₀; cutoff coordinate=1; reflected position=1 with same fiber; symbol loop of 2z at 1/4=i | Intended formulas correct; keep as README API, R02/R04 |
| A115 | Lean sectionProjection (companion:15) | n=1, x=(1,2,3,…) | J₁J₁†x=(1,2,0,…); zero and rescaled maps would give (0,0,…) or (4,8,0,…) | Native formula correct conditional on real cutoff R02 |
| A116 | Lean extendedSectionInverse and total inverse (companion:20) | T=2I; T=0 on nonzero finite corners | B_n=(1/2)P_n; singular case Ring.inverse(0)=0, B_n=0, stability false | Pass; totalization does not manufacture stability |


## Not verifiable

- **The undisclosed worker sample and every claimed exact locator.** No 15 target IDs were supplied, no target headings were recognized, and the README contains no numbered source locations. The fallback seeded sample is explicitly identified above; it is not represented as the worker's original sample. R05 remains actionable even though several statements could be located independently.
- **Böttcher–Silbermann, Analysis of Toeplitz Operators.** The sources service first tried the De Gruyter DOI landing page; a second attempt with the same key reached the Springer DOI and returned uncertified/paywalled. Publisher search identified multiple editions; the README selects none. The finite-section representation, compatible-pair quotient and two-limit theorem were checked mathematically here, but not against book text. The [Springer edition record](https://link.springer.com/book/10.1007/978-3-662-02652-6) is bibliographic evidence only.
- **Böttcher–Silbermann, Introduction to Large Truncated Toeplitz Matrices, and Conway, A Course in Functional Analysis, second edition.** Both service lookups returned uncertified/paywalled. No theorem/page or book passage is certified. No paywall was bypassed and neither text is being requested again under another key.
- **General nonzero-L∞ Coburn and Brown–Halmos source support.** The readable Park notes do not provide the stated general Coburn proposition or the needed Brown–Halmos theorem; the available mathematical proof route and examples are not a substitute for the missing locators. The generality should be kept, with an appropriate reference.
- **The linked Hardy-space design discussion.** The [public Zulip URL](https://leanprover.zulipchat.com/#narrow/stream/116395-maths/topic/Hardy%20Spaces/near/588721731) returned a browser-loading shell; searches for the message in the public archive returned no text. Its claimed design agreement was not certified. The roadmap's explicit harmonic-majorant construction was reviewed on its own terms.
- **Remote-only board-package content.** Searched the available local board packages and the supplied roadmap heads. The index additionally names five arithmetic packages whose remote-only files were not supplied; no exhaustive claim is made about those contents. Ownership against the readable open roadmaps was checked.

No missing source stopped the mathematical, signature, dependency or gate review. The report is complete with the above source-certification limits. No human approval, PR comment or repository mutation was performed.

## Source issues

- **Misprint** in park at Theorem 2.5, printed p.4 (`park` line 142): the source says the logarithmic integral is normalized by 1/(2π); it should be 1/(2πi), with differentiability for the ordinary integral; affects a stated result.
- **Error** in park at Lemma 4.3, printed p.7 (`park` line 281): the source says every identity-plus-trace-class operator is an exponential; it should be restricted to invertible ones; I−E₀₀ is singular; affects a stated result.
- **Misprint** in park at §4 after Lemma 4.3, printed p.7 (`park` line 286): the source says winding one makes the scalar Toeplitz operators invertible; it should be winding zero; the shift has winding one and is not onto; affects a stated result.
