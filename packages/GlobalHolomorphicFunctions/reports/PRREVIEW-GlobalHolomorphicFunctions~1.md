# Review of GlobalHolomorphicFunctions (pull request #992 at bcaf613)

**Verdict:** needs changes

🤖 Independent AI review. Seven findings, three blocking. No counterexample was found to the displayed mathematical identities or the admitted Lean statements. The blocking findings concern supplier contracts, overlapping ownership, and missing acceptance statements. The passing gate does not discharge these checks.

## R01 (P1) — GH5 consumes coefficient naturality absent from the eligible supplier

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1181`, “DG1.2's coefficient naturality”; also the bundled `mapCoeff` used at lines 1163–1167.

**Claim:** DifferentialGeometry 0.3/0.4 and 1.2 supply fixed-coefficient postcomposition on bundled smooth forms and its commutation with the exterior derivative.

**Witness:** On main, `TauCetiRoadmap/DifferentialGeometry/README.md:321` states pullback naturality, not coefficient naturality; neither its README nor Suggested declares `mapCoeff`. The revision's README adds these at lines 345, 403 and 449.

The main checkout was verified at `9c6e95d911c8ef4a94a1d22116bd70e3fbcb4858`, equal to its `origin/main`. DifferentialGeometry is existing work; its open revision is not an eligible replacement supplier under this review's contract. This roadmap has no declared gap. This is distinct from DG's genuine generic form, wedge, regularity, Green and real de Rham contracts, which do exist on main.

**Exact repair:** Declare the missing supplier contracts under DifferentialGeometry, with matching gap entries in the plan and README: (1) fixed continuous real-linear coefficient maps induce smooth postcomposition on its smooth forms; (2) for complete real normed coefficient spaces and smooth forms, this postcomposition commutes with `mextDeriv`. Cite the supplied main contracts for everything else. These contracts must precede their use in GH5. On the actual application, the maps ℝ→ℂ and ℂ→ℝ have composite identity; the repaired naturality law then gives `d(Re β)=Re(dβ)=η` when `dβ` is the complexification of the real form η.

## R02 (P2) — Ownership claims contradict two existing owners

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:248`, lines 289–299, and lines 391–407, especially “this roadmap is the one owner”.

**Claim:** The genus-one factor/basic API and filled compact exhaustion are assigned here, with ZerosOfLFunctions described as a later consumer and Hyperfunctions' exhaustion reassigned here.

**Witness:** `TauCetiRoadmap/ZerosOfLFunctions/README.md:963`–977 owns E₁, its API and canonical products; `TauCetiRoadmap/Hyperfunctions/README.md:197` and 217 explicitly owns the filled exhaustion. Merge order: ZerosOfLFunctions 76, GlobalHolomorphicFunctions 80.

The ZerosOfLFunctions file was read at the supplied open head; Hyperfunctions was read on main. The former still explicitly plans its own E₁ and divisor-indexed construction. The latter owns the real-even-dimensional exhaustion, including the plane case. Merely declaring these roadmaps consumers does not transfer their ownership. The arbitrary-genus product and the extension from growth hypotheses to compact summability are additional mathematics and can remain, with their differences stated.

**Exact repair:** Cite ZerosOfLFunctions Layer 5.2–5.5 for the overlap and remove the claim that it already consumes this roadmap. Keep the general primary-factor and summability variants explicitly as extensions of that contract; do not reassign its E₁ API. Cite Hyperfunctions HF2.AnalyticPreparation for its existing exhaustion and remove the claim of exclusive ownership of that case; distinguish any genuinely additional finite-dimensional generalization. A change of ownership requires an actual coordinated change to the owner, not a unilateral assertion here. Check the resulting boundary on E₁(1)=0, E₁′(1)=−e, and Ω=ℂ with Kₙ the radius-n closed ball: the existing owners and the proposed constructions give the same objects. The dependency check must remain acyclic after the ownership repair.

## R03 (P2) — Statable headline theorems are absent

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:784` (full Weierstrass factorization) and `:1205` (additive Cousin I), and `:473` (complete holomorphic function space); `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean:1`–24 and the complete declaration list.

**Claim:** Suggested is the acceptance test for the end theorems, but it contains neither full factorization nor Cousin I nor a completeness theorem, and its introduction does not identify unavailable headlines and their missing carriers.

**Witness:** Scratch signatures for full factorization, Cousin I and completeness elaborated at the pins, using existing products, open sets, locally finite covers, `HolomorphicMapSpace` and `CompleteSpace`.

Full factorization can quantify over the subtype of nonzero zeros, use their native finite analytic orders as multiplicities, and state a locally uniformly convergent product with the origin power and an entire exponential factor. Cousin I can quantify directly over a cover locally finite on the open subtype and holomorphic transition functions. Neither requires an ad hoc carrier. Completeness is directly expressible as `CompleteSpace (HolomorphicMapSpace U)` using the scoped uniformity already defined in the file. The existing equal-divisor theorem is a useful intermediate result; it does not state the full conclusion for an arbitrary entire f.

**Exact repair:** Add these three headline statements with `sorry`, preserving their full generality, and name the form/de Rham headlines that are not yet statable on the pinned generic manifold-form carriers in the module docstring. For the factorization test f(z)=z, the origin order is 1, the nonzero-zero index is empty, the product is 1, and g=0 gives z=z. For Cousin I on a two-member cover with constant c₁₂=1 and c₂₁=−1, take b₁=1,b₂=0; their differences are exactly 1 and −1. For completeness, constants 1/n are Cauchy in the stated uniformity and converge to the holomorphic zero map. All three tests fit the elaborated signatures.

## R04 (P3) — Remove padding and duplicate native targets from the acceptance files

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean:123`, `:127`, `:207`–233, `:281`, `:350`–385; `TauCetiRoadmap/GlobalHolomorphicFunctions/ProductCotangentTargets.lean:28`, `:49`, `:118`.

**Claim:** The files include boundary computations, definitional API, direct supplier aliases, and a native cotangent theorem restated as new targets.

**Witness:** `majorant_exp` closes with `exact Real.prod_one_add_le_exp_sum s (fun i => norm_nonneg (u i))`. The two elementary-factor specializations already use one `simp`; the multiplication comparison is `rfl`; three contour results are direct supplier aliases.

All 46 admissions were tried individually with `rfl`, a closing `simp`, and `infer_instance` on copies; 45 remained after the additional exact-lemma probe for `majorant_exp`. This is not evidence that the remaining 45 are all headlines. In particular, `barDerivative_eq_zero_iff_cr` is algebraic unpacking of the definition, independent of any analytic hypothesis. `regular` repeats `Complex.integerComplement`; `paired_summable` is the native `summable_cotTerm` with reciprocal notation, and the final cotangent identity is `cot_series_rep` (or its natural-index predecessor). Requiring a different proof does not create a new library statement. The companion's remaining intermediate estimates belong in the README proof route, rather than an acceptance-test API catalogue.

**Exact repair:** Delete the elementary-factor zero/one specializations, direct contour aliases, definitional function-space API and CR rearrangement from `Suggested.lean`; cite their inputs in the README. Delete `majorant_exp` from `ProductCotangentTargets.lean`; apply the same headline-only rule to that file, removing native restatements and intermediate proof-route targets. Do not prove this padding in place. Keep the finite-product sharp inequality as distinct mathematics: with u=(1,1), both sharp sides are 3, while the imported exponential bound gives 4≤e². This separates the new sharp estimate from the duplicate bound.

## R05 (P3) — The seeded source sample has no verifiable locator

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1186`–1203 and `:1239`–1243.

**Claim:** The GH5 coordinate worked examples, and the surrounding theorem targets, should have exact source locators. The references name two books and subjects, without edition, theorem/section number or page; no `sources.toml` exists.

**Witness:** The GH5 sample contains no source citation. The references provide only Conway and Ahlfors with unnamed chapters. The sources service returned Conway as uncertified/paywalled and no legal text for Ahlfors.

**Exact repair:** Supply an identified legal source and exact edition/version, theorem or section, and printed page for each target, including the coordinate sample; record each cited work once in `sources.toml`. Record honest derived computations against the differentiation/polar-integration results used rather than inventing theorem numbers for exercises. The computation itself needs no sign repair: at z=2 in direction 1, both sides of the logarithm-square identity are log 2; the disk moments for (m,n)=(0,0),(1,0),(1,1) are π,0,π/2. Source certification remains unavailable until the locator and text are supplied.

## R06 (P3) — Restore the required README structure and discriminating Checks

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1`–15 and the headings through `:1221`.

**Claim:** The document needs the standard scope, conventions, exact supplier contracts, build order, layers, and per-definition API/Checks, rather than placing the development under “Scope and foundations”.

**Witness:** The file has zero `*Needs:*` lines and zero `**Checks.**` lists. There are no per-layer Examples/Dependencies sections or Exact supplier contracts section; most of the 1,243 lines sit under one scope heading.

**Exact repair:** Reorganize the existing mathematics into the prescribed headings, put each target's statement and proof inputs on its own Needs line, and give each definition its API and at least three discriminating Checks. Preserve the mathematical content. For the Wirtinger definitions, use z, conjugate z and |z|²: their (∂z,∂̄) values are (1,0), (0,1), and (conjugate z,z). These exclude exchanging the operators, omitting 1/2, or using the wrong sign. For the Runge-pair definition, distinguish a disk, an annulus inside a disk, and the same annulus inside an annular ambient domain. The table below supplies concrete further checks.

## R07 (P3) — Bring both Lean files into the required declaration form

**Location:** `TauCetiRoadmap/GlobalHolomorphicFunctions/Suggested.lean:1`–24, `:350`–375; `TauCetiRoadmap/GlobalHolomorphicFunctions/ProductCotangentTargets.lean:3`–120.

**Claim:** Both files require the target-signatures module docstring, README layer-order sections, declaration docstrings and agreement between retained Lean names and README names.

**Witness:** Suggested calls itself nonexhaustive, has no layer section comments, and leaves multiple declarations undocumented. The companion has no declaration docstrings; names such as `sharp_finite` and `finite_shift` do not occur in the README.

**Exact repair:** After deleting padding, give each file the required module docstring and each retained declaration a mathematical docstring, order retained targets by README layer, and identify their retained Lean names in the README. State the unavailable generic form/de Rham carriers explicitly. This is a form repair: the checked signatures already preserve countability, smoothness, escape, nonvanishing and locality hypotheses, so none should be weakened.

## Verified sound

The three submitted files were read in full. The recorded gate at the specified head passes every scanner, dependency and targeted-build check, and the outside-folder diff is empty. The worktree remained unchanged. The missing Primitive object file was built with the specified individual-module command; direct elaboration of Suggested then exited 0 with **28 sorry warnings and no other warnings**. A complete companion copy also elaborated with **18 sorry warnings**. Signature copies printed **47 Suggested declarations and 26 companion declarations**. Their types were compared against the README: no standing binder disappeared, and the scope `∞` elaborates to the smooth order rather than analytic `ω`. No source file, pin, manifest or roadmap was edited.

The dependency command returned exactly:

```text
depcheck: 208 roadmaps, 1452 edges, 0 problem(s)
```

There are no Needs lines to audit; all supplier statements in the prose were examined. The mechanical result detects neither R01's absent contract nor R02's conflicting ownership. It is not a finding that this check passes.

**Headline inventory.** The README's principal results are Looman–Menchoff; compact-support Cauchy–Green and reconstruction; Runge equivalence and finite-rank/zero-free approximation; hulls and complete compact-open holomorphic function spaces; prescribed zero/signed divisors and boundary noncontinuation; Mittag–Leffler and essential isolated singularities; primary products, exact orders and full Weierstrass factorization; the full-boundary Cauchy–Pompeiu application; global smooth ∂̄ solvability and closed completion; Cousin I and planar two-form exactness/de Rham vanishing. The first group through isolated-singularity realization, product existence/exact orders, equal-divisor factorization, and scalar ∂̄/closed completion have signatures. R03 identifies three absent, directly statable end theorems. The full-boundary application, hull/complete-space endpoints and form consequences also need an explicit headline disposition; the present docstrings give none. Generic manifold `SmoothForm`/`mextDeriv` and de Rham quotients are roadmap carriers, not pinned declarations; they must not be invented as sorry-valued data.

**Pinned declarations opened.** Paths below are relative to the named library at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are 29 declaration groups, not claims about a newer library.

| Library file and line | Declaration and actual input checked |
|---|---|
| `Mathlib/Topology/LocallyFinsupp.lean:49` | `Function.locallyFinsuppWithin`: support contained in U, finite intersection with some neighborhood at every point of U; no openness or ambient global finiteness is built in. |
| `Mathlib/Analysis/Meromorphic/Divisor.lean:40`, `:69`, `:78` | `MeromorphicOn.divisor`, `divisor_apply`, `AnalyticOnNhd.divisor_apply`: infinite order is sent to zero; finite order/nontriviality must be supplied separately. |
| `Mathlib/Analysis/Analytic/Order.lean:91` | `AnalyticAt.analyticOrderAt_eq_natCast`: analytic unit at the center and equality on a full neighborhood. |
| `Mathlib/Analysis/Meromorphic/Order.lean:97` | `meromorphicOrderAt_eq_int_iff`: meromorphy, analytic unit, punctured-neighborhood equality. |
| `Mathlib/Analysis/Normed/Module/MultipliableUniformlyOn.lean:86`, `:129` | `Summable.hasProdUniformlyOn_one_add`, `hasProdLocallyUniformlyOn_one_add`: compact/continuous with eventual cofinite majorant; the local version uses one global majorant. The README's compact-dependent adapter is a different interface. |
| `Mathlib/Analysis/Complex/LocallyUniformLimit.lean:200` | `Complex.logDeriv_tendsto`: open domain, local uniform convergence, eventually holomorphic approximants, and nonzero limit at the point. |
| `Mathlib/Analysis/Calculus/LogDerivUniformlyOn.lean:24` | `logDeriv_tprod_eq_tsum`: factor nonvanishing, holomorphy, summable logarithmic derivatives, locally uniform product and nonzero product. |
| `Mathlib/Analysis/Complex/Exponential.lean:682` | `Real.prod_one_add_le_exp_sum`: every real term nonnegative; directly supplies the companion's exponential majorant. |
| `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:118`, `:125`, `:132` | Uniform sine-product multipliability on all compact sets; the formula for sin(πz)/(πz) is on the integer complement. In particular the quotient's totalized value at zero is not the product value 1. |
| `Mathlib/Analysis/SpecialFunctions/Trigonometric/Cotangent.lean:211`, `:222`, `:229` | `summable_cotTerm`, `cot_series_rep'`, `cot_series_rep`: paired series and integer exclusion; root namespace. |
| `Mathlib/Analysis/Complex/IntegerCompl.lean:23` | `Complex.integerComplement`: complement of the integer-cast range; already the companion's regular set. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:334` | `Complex.GammaSeq_tendsto_Gamma`: all complex s, including totalized exceptional values. |
| `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:151` | `Real.tendsto_harmonic_sub_log`: the normalization needed in the reciprocal-Gamma product. |
| `Mathlib/Geometry/Manifold/ContMDiffMap.lean:38` | `ContMDiffMap`: subtype of maps with the stated manifold differentiability; the native definition does not install this roadmap's scoped compact-convergence uniformity. |
| `Mathlib/Topology/UniformSpace/CompactConvergence.lean:169`, `:222`, `:254`, `:431` | Native continuous-map uniformity, compact-exhaustion basis, local-uniform convergence comparison, completeness under compact coherence and target completeness. |
| `Mathlib/Geometry/Manifold/ContMDiff/Basic.lean:385` | `contMDiff_inclusion`: smooth inclusion between open subtypes. |
| `Mathlib/Geometry/Manifold/PartitionOfUnity.lean:555` | `SmoothPartitionOfUnity.exists_isSubordinate`: closed set, open cover, T₂ and σ-compact smooth finite-dimensional manifold context. |
| `Mathlib/MeasureTheory/Measure/Lebesgue/Complex.lean:60` | `Complex.volume_preserving_equiv_real_prod`: area normalization. |
| `Mathlib/Analysis/Complex/HasPrimitives.lean:110`, `:280` | `Complex.IsConservativeOn` and its differentiability equivalence: all corner orders, open domain and continuity. |
| `Mathlib/MeasureTheory/Integral/DivergenceTheorem.lean:373` | Off-countable FTC: continuity, derivative outside a countable exceptional set, and interval integrability; the README explicitly undertakes these premises. |
| `Mathlib/MeasureTheory/VectorMeasure/AddContent.lean:318` | `VectorMeasure.exists_extension_of_isSetSemiring_of_le_measure`: additive content, measurable semiring, domination by a finite measure, real normed-space context. |
| `Mathlib/MeasureTheory/VectorMeasure/Variation/Basic.lean:184` | `variation_le_of_forall_enorm_le`: domination on measurable sets. |
| `Mathlib/MeasureTheory/VectorMeasure/Decomposition/Lebesgue.lean:142`, `:413`, `:429`, `:434`, `:440` | Signed singular-part singularity does exist (a `nonrec theorem`); complex decomposition requires both real/imaginary decomposition instances; RN integrability and reconstruction. |
| `TauCeti/Analysis/Contour/Primitive.lean:180`, `:253`, `:283` | Closed-period exactness, primitive-to-logarithm, no-holes logarithm; open sets and nowhere-zero hypotheses retained. |
| `Mathlib/Analysis/SpecialFunctions/Log/Summable.lean:142`, `:171`, `:222` | `Finset.norm_prod_one_add_sub_one_le`, `multipliable_one_add_of_summable`, `tprod_one_add_ne_zero_of_summable`: norm-summable deviations, with each factor nonzero for the last result. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:397` | `Complex.Gamma_mul_Gamma_one_sub`: totalized reflection identity, including integers. |
| `Mathlib/Analysis/SpecialFunctions/Gamma/Digamma.lean:64`, `:94` | Recurrence excludes nonpositive integers; reflection excludes all integers. |
| `Mathlib/MeasureTheory/Covering/Differentiation.lean:837` | `VitaliFamily.ae_tendsto_average_norm_sub`: locally integrable input and averages along the Vitali family. |
| `TauCeti/Analysis/Complex/Conformal/Morera.lean:41` | `TauCeti.morera`: open domain, continuity, conservativity. |

**Ownership and citation audit.** Object searches used the roadmap grep/show tools, the supplied sibling checkouts, main, board packages and both pinned libraries. No second fully qualified declaration in this roadmap's namespaces was found outside its own checkout. Main has no GlobalHolomorphicFunctions folder to re-plan; the local overlaps are R02, so the repairable verdict is needs changes rather than rejection. ConformalMapping main L5 (`README.md:124` onward) supplies Jordan separation/filled-hull topology. Its open revision L1 consumes GH's function space, but that revision was not used as a supplier. DifferentialGeometry main 0.3/0.4, 1.3/1.4, 5.6.3 (`:708`–734) and 6.1–6.2 (`:786`–796) resolve respectively to generic forms, regularity/paired Leibniz, integer-weighted AC-cycle Green specialized to native contour cycles, and real de Rham objects. R01 isolates the exception at 1.2. ComplexKahlerGeometry's supplied heads resolve K2's scalar-input/parameter distinction and K5a's complex quotient comparison; these are downstream uses, not GH suppliers. Hyperfunctions HF2.AnalyticPreparation on main and ZerosOfLFunctions Layer 5 at its supplied head were read in full around the overlap. The board's AutomorphicSpectralTheoryPartII cites GH's general primary products and keeps growth estimates separately; HeegaardFloer's supplied head asks for additional Hölder/Beurling estimates, not a replacement for the general global divisor theory. No computational algorithm, sorry-valued data, `set_option`, copied source passage, or route-specific restriction was found. Finite grids and Riemann sums here are analytic proof constructions.

**Adversarial computations.** These are explicit test instances, not proofs of all universal statements. “Pass” means the two computed sides agree, the bound holds, or the negative control is excluded. The first table covers every declaration in both files, including definitions and proved API; the second covers the additional README statements and proof interfaces. Non-applicable arithmetic coefficient/rank tests were replaced by the actual edge cases here: empty domains/index sets, disconnected domains, poles, totalized division, origin orders and boundary accumulation. “Keep” means no mathematical correction is indicated by the instance, not that the declaration belongs in the acceptance file.

| Statement (S=Suggested; P=ProductCotangentTargets) | Instances | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| S: IsRungeCompactPair | K=closed annulus 2≤\|z\|≤3; Ω=D₄ or 1<\|z\|<4 | D₄: inner component closure D̄₂ is compact in Ω, predicate false; annular Ω: inner closure meets \|z\|=1, predicate true | Pass | Keep |
| S: isRungeCompactPair_iff_approximation | Same K; f=1/z | In D₄, error <1/3 on \|z\|=3 would contradict ∮(1/z−g)=2πi; in annular Ω take g=f, error 0. Empty K: both sides true | Pass | Keep |
| S: exists_finite_rank_runge_operator | K={0}, Ω=U=ℂ; also K=∅ | N=1, ζ=0,w=1,g=1 gives error 0≤εB; empty K permits N=0 | Pass | Keep |
| S: exists_zero_free_holomorphic_approximation | Ω punctured plane; K unit circle; u=z | Take g=z, error 0 and winding 1. A global exponential has winding 0 and is excluded; Ω=ℂ fails the Runge premise | Pass | Keep |
| S: exists_holomorphic_with_zero_orders | m=0; m(2)=2 | f=1 has order 0 everywhere; f=(z−2)² has order 2 at 2 and 0 elsewhere | Pass | Keep |
| S: exists_meromorphic_with_divisor | ν(0)=−1; ν=0 | f=1/z has order −1 at 0, divisor −[0]; f=1 gives divisor 0 and order 0; f=0 has order ∞ and is excluded | Pass | Keep |
| S: exists_meromorphic_prescribed_principal_parts | E={0}, P=1/z²+z | f=1/z²: f−P=−z analytic, principal coefficient 1 and pole order 2; empty E permits f=0 | Pass | Keep |
| S: exists_holomorphic_prescribed_isolated_singularities | E={0}, P=exp(1/z) | f=P off zero: difference 0; negative Laurent coefficients 1/k!, no finite pole-order assumption | Pass | Keep |
| S: elementaryFactor | p=0,1,2; w=0,1,−1 | Eₚ(0)=1; Eₚ(1)=0; E₀(−1)=2, E₁(−1)=2/e, E₂(−1)=2/√e | Pass | Keep |
| S: elementaryFactor_order_zero | p=0,w=0,1 | 1=1 and 0=0; empty correction sum=0 | Padding | R04: delete |
| S: elementaryFactor_one | p=1,w=−1 | 2/e=(1−(−1))exp(−1) | Padding | R04: delete |
| S: exists_entire_primary_product | aₙ=n+1,pₙ=n | F(0)=1; zero at 1 has order 1; compact tail bounded by a geometric series after n+1≥2R | Pass | Keep |
| S: elementaryFactor_deviation_le | p=0 or 1, w=0 or 1 | At 0:0≤0; at 1:1≤1. p=1,w=−1:1−2/e≤1 | Pass | Keep |
| S: hasProd_one_add_of_summableOnCompact | u₀=−1, all others 0; all u=0 | First product=0, second=1; sup sums 1 and 0; both limits holomorphic | Pass | Keep |
| S: exists_entire_primary_product_exact | Empty index; two copies a=2,p=0 | Empty F=1, orders 0; repeated product (1−z/2)² has order 2 at 2=card of fibre; finite cofinite filter is bottom | Pass | Keep |
| S: exists_entire_genusOne_product | S={2}, m=0 or 2 | m=0: product 1, order/divisor 0; m=2: (1−z/2)²exp(z), value at 0=1 and order/divisor at 2=2 | Pass | Keep |
| S: exists_entire_genusOne_product_of_divisor | D=2[2]; D=0 | Weighted sum=2/4=1/2; normalized product above has divisor D; empty support product=1 | Pass | Keep |
| S: primitive_of_vanishing_closed_integrals | f=1 on ℂ; f=1/z on punctured plane | Primitive z has derivative 1 and periods 0; second period around circle=2πi, so premise fails | Native alias | R04: delete |
| S: holomorphic_log_of_logDeriv_primitive | f=exp z; f=z on punctured plane | logDeriv exp=1, primitive z, exp z=f; logDeriv z=1/z has period 2πi | Native alias | R04: delete |
| S: holomorphic_log_of_filledHull_subset | U=ℂ, f=1; U punctured plane | First g=0 gives exp g=1; second filled hull contains 0 outside U, so premise fails | Native alias | R04: delete |
| S: exists_entire_log | f=exp(z²), f=1, f=0 | g=z² or 0 works; f=0 violates nonvanishing since exp never 0 | Pass | Keep |
| S: exists_entire_exp_mul_of_divisor_eq | f=z²exp z,F=z²; also f=0,F=1 | Divisors 2[0]=2[0], g=z gives equality; second divisors both 0 but nontriviality of f fails | Pass | Keep |
| S: exists_holomorphic_quotient | F=1/z with arbitrary value at 0 | f=1,g=z gives F=f/g off {0}; g has nonzero germ; F=0 permits f=0,g=1 | Pass | Keep |
| S: differentiableOn_complex_of_continuous_real_lineDerivatives_cr | f=z and f=conjugate z | z: fx=1,fy=i=i fx; conjugate: fx=1,fy=−i≠i fx, excluded | Pass | Keep |
| S: barDerivative | u=z, conjugate z, \|z\|² | Values 0,1,z respectively; at z=1+i the last is 1+i | Pass | Keep |
| S: zDerivative | u=z, conjugate z, \|z\|² | Values 1,0,conjugate z respectively; at z=1+i the last is 1−i | Pass | Keep |
| S: barDerivative_eq_zero_iff_cr | u=z and conjugate z | z: 0=0 iff i=i; conjugate: 1≠0 iff −i≠i; only rearranges A+iB=0 | Definitional API | R04: delete |
| S: differentiableAt_complex_iff_barDerivative_eq_zero | u=z and conjugate z; u=\|z\| at 0 | First equivalence true/true; second false/false. Last real differentiability fails: totalized fderiv=0 is not evidence of holomorphy | Pass | Keep |
| S: cauchyGreen | φ=0; φ=∂̄ψ, ψ radial compact smooth with ψ(0)=1 | T0=0; T(∂̄ψ)(0)=−∫₀∞h′(s)ds=1 for ψ=h(\|z\|²) | Pass | Keep |
| S: cauchyGreen_kernel_integrable | φ bounded by M near z | Integral of M/r on disk radius ε=2πMε<∞; value assigned at ζ=z has measure 0 | Pass | Keep |
| S: cauchyGreen_contDiff | φ=0; φ=∂̄ψ | Solutions 0 and ψ are smooth, with all orders finite/smooth as required | Pass | Keep |
| S: cauchyGreen_barDerivative | φ=∂̄ψ | Tφ=ψ and ∂̄Tφ=∂̄ψ=φ; zero datum gives 0=0 | Pass | Keep |
| S: cauchyGreen_barDerivative_reconstruct | ψ=h(\|z\|²), h(0)=1, compact support | At 0, −∫h′=h(0)−h(∞)=1=ψ(0), fixing the kernel sign | Pass | Keep |
| S: exists_smooth_barDerivative_eq | f=1,z,conjugate z; empty Ω | u=conjugate z, \|z\|², conjugate z²/2 give ∂̄u=1,z,conjugate z; empty Ω imposes no point equation | Pass | Keep |
| S: exists_smooth_closed_completion | f=z and f=conjugate z | Choose g=conjugate z or 0: ∂̄g=1=∂z z, or 0=∂z conjugate z | Pass | Keep |
| S: HolomorphicMapSpace | U=∅ or unit disk | Empty domain has one map; z is analytic on disk, conjugate z is not (∂̄=1) | Pass | Keep |
| S: HolomorphicMapSpace.toContinuousMap | f(z)=z on disk | Underlying continuous function evaluates to z; at 0 it is 0 | Pass | Keep |
| S: HolomorphicMapSpace.toContinuousMap_injective | Constant maps 0 and 1 on nonempty disk | Images have values 0 and 1 at 0; equality is false on both carriers | API | R04: delete |
| S: openSubtypeLocallyCompact | U=D₁, x=0 | Closed disk radius 1/2 is a compact neighborhood in U; empty U has no points to check | Pass | Keep |
| S: compactConvergenceUniformity | Constant maps 1/n→0 on U | Sup difference on any nonempty compact=1/n→0, identical under the pullback | Pass | Keep |
| S: tendsto_iff_tendstoLocallyUniformly | Same constant sequence; U empty | Both convergence tests give 1/n→0; empty-domain sup=0 | API | R04: delete |
| S: toContinuousMap_mul | Constants 2 and 3 | Both functions take value 6 | Definitional | R04: delete |
| S: ambientRepresentative | Constant 1 on unit disk | Value 1 inside and 0 outside; no continuity claimed at \|z\|=1 | Pass | Keep |
| S: range_holomorphicMapSpace_toContinuousMap | Continuous z and conjugate z on disk | z in range and holomorphic representative; conjugate excluded by ∂̄=1. Empty domain: unique map on each side | Pass | Keep |
| S: isClosed_range_holomorphicMapSpace_toContinuousMap | Constant analytic maps 1/n | Limit 0 remains analytic; disk example conjugate z has ∂̄=1 and is not a local-uniform holomorphic limit | Pass | Keep |
| S: exists_holomorphic_no_boundary_ball_extension | Ω punctured plane, f=exp(1/z); Ω=∅ or ℂ | At boundary 0, essential Laurent coefficients 1/k! preclude extension; frontier empty in the other two cases | Pass | Keep |
| S: exists_holomorphic_no_meromorphic_boundary_germ | Same punctured plane | Infinitely many nonzero negative coefficients versus finitely many for a meromorphic germ; disk overlap is connected | Pass | Keep |
| P: finiteProduct | Empty set; u=(1,−1) | Products 1 and 0 | Pass | Keep |
| P: finiteMajorant | Empty set; u=(1,−1) | Majorants 1 and 4 | Pass | Keep |
| P: sharp_finite | u=(1,1); u=(1,−1); empty | Errors 3≤3, 1≤3, 0≤0; no division by a zero factor | Pass | Keep |
| P: majorant_exp | u=(1,1); empty | 4≤e² and 1=exp 0 | One-lemma padding | R04: delete |
| P: regular | z=0,1,1/2,i | Membership false,false,true,true; equal to native integerComplement | Native duplicate | R04 |
| P: pairedTerm | n=0,z=1/2; z=0; z=1 | −2+2/3=−4/3; −1+1=0; totalized 0+1/2=1/2 | Pass | Keep |
| P: pairedCot | z=1/2 and 0 | At 1/2 paired telescoping sum=−2, plus 2 gives 0; at 0 all terms and reciprocal are 0 | Pass | Keep |
| P: symmetricPartial | N=0,1; z=1/2 | q₀=2; q₁=2−2+2/3=2/3; q_N=1/(N+1/2) | Pass | Keep |
| P: modelCot | z=1/2,0,i | Values 0,0 (totalized at pole), and −iπ coth π; pole value does not make it analytic | Pass | Keep |
| P: riemannSum | y=1; y=0 totalized | At 1: 1.0766640475≤S₁≤1.0766740476; at 0: prefactor 0 and nonsummable constant series has tsum 0, giving 0 | Pass | Keep |
| P: paired_summable | z=1/2 | Absolute paired sum=2 by telescoping; order O(1/n²), unlike unpaired harmonic tail | Native duplicate | R04 |
| P: locally_uniform_paired | Singleton compact {1/2} | Error \|q_N−q\|=1/(N+1/2)→0 | Pass | Keep |
| P: finite_shift | N=0,z=1/2; N=1,z=0 | First difference=−4/3=(3/2)⁻¹−(1/2)⁻¹; second=3/2=2⁻¹−(−1)⁻¹, even at a totalized pole | Pass | Keep |
| P: paired_periodic | z=1/2 | q(3/2)=0=q(1/2); boundary terms tend to 0 | Pass | Keep |
| P: entire_difference | F=0; z=1/2; integer 0 | On regular half-integer c−q=0; matching residues 1−1=0 removes pole; extension value 0 | Pass | Keep |
| P: paired_strip_bound | z=i | Norm lies in [3.1533280950,3.1533480951], below 4+3π/2=8.7123889804 | Pass | Keep |
| P: model_strip_bound | z=i | Norm π coth π=3.1533480949 equals the displayed exponential bound | Pass | Keep |
| P: extension_periodic | Entire extension F=0 | F(z+1)=0=F(z); F=1 fails agreement at z=1/2 (1≠0) | Pass | Keep |
| P: extension_bounded | F=0 | Range={0}, bound 0; F=z fails agreement at 1/2 | Pass | Keep |
| P: improper_integral | R=0,1; R→∞ | Integrals 0,π/4; limit arctan R=π/2 | Pass | Keep |
| P: riemann_error | y=1 | 0.4941222792≤π/2−S₁≤0.4941322793, within [0,1] | Pass | Keep |
| P: imaginary_axis | y=1 | Both sides equal −i(1+2Σₙ≥1 1/(1+n²)); truncation magnitude 3.1533280950, tail≤0.00002 | Pass | Keep |
| P: paired_vertical | y→∞ | 1/y→0 and S_y→π/2, so −i(1/y+2S_y)→−πi | Pass | Keep |
| P: model_vertical | y→∞ | −πi coth(πy)→−πi; exponential e^(−2πy)→0 | Pass | Keep |
| P: extension_zero | F=0; F=constant c | First 0=0; agreement at 1/2 forces c=0, excluding a nonzero additive constant | Pass | Keep |
| P: cotangent_identity | z=1/2; z=i | 0=0 at half-integer; π cothπ lies inside the computed paired-series interval at i | Native duplicate | R04 |

The declaration table has **73 rows**. The following README-only table also includes negative controls for every finding affecting an interface.

| README statement/interface | Instances | Computed values on both sides | Result | Change |
|---|---|---|---|---|
| Wirtinger convention and real-differentiable CR equivalence | u=z, conjugate z, \|z\| at 0 | (∂z,∂̄)=(1,0),(0,1); \|z\| at 0 has no real derivative despite totalized derivative 0 | Pass | Keep |
| Looman bad set and Baire exhaustion Eₙ | f=z; increments real h | \|f(z+h)−f(z)\|=\|h\| and \|f(z+ih)−f(z)\|=\|h\|, so N=1 bounds both; bad set E=∅. For conjugation CR fails | Pass | Keep |
| Relative closedness versus completeness of E | E=Ω=(0,1) in a real-line model | Sequence 1/n is Cauchy with missing limit 0; local compactness still holds. This distinguishes the Baire route from a false completeness claim | Pass | Keep |
| Balanced scalar vertical estimate | R=[0,1]², F=R, φ=y, N=1 | Boundary integral=1; area integral of ∂yφ=1; error 0=5N area(R\F) | Pass | Keep |
| Balanced scalar horizontal estimate | Same R,F, φ=x | Boundary integral=1, area integral of ∂xφ=1, error 0 | Pass | Keep |
| Degenerate enclosing rectangle J | F={0}×[0,1], φ=x+y | Both boundary differences integrate to 0; area(F)=0, so both derivative area integrals are 0 | Pass | Keep |
| One-dimensional affine interpolation and derivative match | P={0,1}, g(y)=y² on [0,1], N=2 | Interpolant y has derivative 1 on the gap; endpoint difference=1=∫₀¹1; error 1≤2·length(gap)=2 | Pass | Keep |
| Empty-slice polygonal estimate | Unit square, F={(0,0),(1,1)}, φ=x+y,N=1 | Actual top-bottom difference=1; path lengths≤2w+h=3≤5h=5 | Pass | Keep |
| Fubini and measurable restricted derivatives | F=R=[0,1]², φ=xy | ∬∂yφ=∫₀¹x dx=1/2; iterated section integral also 1/2; derivative bound 1 | Pass | Keep |
| CR cancellation and rectangle-strip reduction | f=z on unit square; inner J=[1/4,3/4]² | Both positively oriented contour integrals 0; four-strip edge contributions cancel to 0 | Pass | Keep |
| Balanced finite grid | w=3,h=1,N=2 | δ=1/2, m=6,n=2; cell sides=1/2, ratio=1, twelve cell areas sum to 3; internal edges cancel in pairs | Pass | Keep |
| Rectangle additive content and vector extension | Split unit square at x=1/2; f=z | A(left)=0,A(right)=0,A(whole)=0; μ masses 10N+10N=20N; empty content=0 | Pass | Keep |
| Complex RN density and singular-part elimination | c=(1+i)volume restricted to unit square | Density 1+i inside; total variation √2 times area; singular part 0, and 0+withDensity(1+i)=c | Pass | Keep |
| Square-to-ball differentiation normalization | Half-side r=1 | Square area=4, enclosing ball area=2π; for constant integrand averages 1≤(π/2)·1; correct ratio π/2 | Pass | Keep |
| Vanishing content from E-density and all-corner Morera | f=z; reversed or degenerate rectangle | Every content=0, averages=0; reversal gives −0=0, zero-length edges 0; hence Morera inputs remain true | Pass | Keep |
| Cauchy fundamental-solution weak identity | φ=h(\|z\|²), h(0)=1,h=0 for large s | Kernel times ∂̄φ integrates to ∫₀∞h′(s)ds=−1=−φ(0); wrong sign gives +1 | Pass | Keep |
| Uniform compact-product Riemann sums | G=constant c, area(K₁)=A | Every mesh sum=cA=integral; modulus ω_G=0 gives error 0. Empty K₁ gives 0=0 | Pass | Keep |
| Cutoff reconstruction on K | f=1, radial cutoff α=1 near 0, K={0} | (1/π)∫∂̄α(ζ)/(−ζ)dA=−∫h′=1=f(0); support avoids K | Pass | Keep |
| Primary-factor zeros and normalization | p=0,1,2; w=0,1 | Eₚ(0)=1 and only w=1 kills 1−w; exponential factor is never 0 | Pass | Keep |
| Primary-factor derivative | p=0,1,2; w=1 | E′ values −1,−e,−e^(3/2); formula −wᵖexp(Qₚ) gives the same three nonzero values | Pass | Keep |
| Primary-factor logarithmic derivative | p=0,1,2; w=−1 | Values −1/2,+1/2,−1/2, matching −(−1)ᵖ/2; w=1 excluded | Pass | Keep |
| Genus-one global and disk logarithmic bounds | w=1,−1 | At 1: Real.log 0=0≤2 and ≤1; at −1: log 2−1<0≤1≤2 | Pass | Keep |
| General product zero order and unit tail | Factors (z−2)², exp z, then 1s | At 2: order 2+0=2; elsewhere 0. An identically-zero factor changes order to ∞, which the finite-order variant excludes | Pass | Keep |
| Repeated-index grouping of weighted product | S={2},m=2 | Two repeated factors and one squared factor both (1−z/2)²exp z; at z=2 both 0, at 0 both 1 | Pass | Keep |
| Weighted majorant and native-divisor conversion | D=2[2], R=3 | Repeated sum=2·(3/2)²=9/2=R²·(2/4); toNat 2=2; negative D excluded | Pass | Keep |
| Universal variable genus | aₙ escaping, pₙ=n−1, n≥1; tail \|aₙ\|≥2R | Each majorant≤2^(−n); tail from N sums to 2^(1−N) | Pass | Keep |
| Least fixed genus and absolute criterion | aₙ=n; aₙ=2ⁿ; finite/empty lists | n-list: Σ1/n diverges, Σ1/n² converges, genus 1; powers of 2: Σ2^(−n)=1, genus 0; finite/empty genus 0 | Pass | Keep |
| Logarithmic derivatives of locally uniform products | Finite factors z−1,z−2; evaluate at z=0 | P(0)=2,P′(0)=−3, ratio −3/2=−1−1/2; zeros 1 and 2 excluded from V | Pass | Keep |
| Uniform absolute-tail criterion weaker than sum of suprema | X=positive integers, uₙ(x)=1/n if x=n, else 0 | Each point has one term; uniform tail sup=1/N→0, but Σ sup\|uₙ\|=Σ1/n diverges; product at x=1+1/x | Pass | Keep |
| Uniform-tail nonzero conclusion | Same family; insert u₁≡−1 | Original product at x positive >1; inserted zero factor makes limit 0 at every x, agreeing with zero-factor criterion | Pass | Keep |
| Holomorphic hull, hole filling and hull equality | K=2≤\|z\|≤3 in Ω=D₄, or Ω=1<\|z\|<4 | Hulls are D̄₃ and K respectively; inner hole filled only in first ambient domain | Pass | Keep |
| Hull compactness, idempotence, monotonicity | Concentric closed disks radii 1 and 2 in ℂ | Hull(D̄₁)=D̄₁⊂D̄₂=Hull(D̄₂); double hull=D̄₁, both compact | Pass | Keep |
| Hull distance to complement | K unit circle, Ω=D₃; K empty or Ω=ℂ | Both K and its filled disk have distance 2 to Ωᶜ; empty infima are ∞, on both sides | Pass | Keep |
| Hull contained in convex hull | K unit circle; test z=2 | Hull=closed unit disk=conv K; exp(z) gives \|exp 2\|=e²>sup_K\|exp\|=e, separating 2 | Pass | Keep |
| Generic filled compact exhaustion | Ω=ℂ; Ω={\|z\|>1}; dimension-zero space | Kₙ=D̄ₙ in ℂ; exterior example Kₙ={1+1/n≤\|z\|≤n}; inner complementary closure touches \|z\|=1, outer component unbounded; zero-dimensional whole space Kₙ={0} | Ownership conflict | R02 |
| Exhaustion nesting/cofinality | Ω=ℂ; compact D̄_R | D̄ₙ⊂D_(n+1), and N≥R contains D̄_R; empty Ω gives all Kₙ=∅ | Pass | Keep |
| Compact-open comparison metric d_C | Ω=ℂ, constants f=0,g=1 | Every sₙ=1, so Σ2^(−n)·1/2=1/2; reversed pair same; equal maps give 0 | Pass | Keep |
| Metric triangle and min comparison | Sup values s=t=1 | 2/(1+2)=2/3≤1/2+1/2=1; min(1,1)/2=1/2=1/(1+1)≤1 | Pass | Keep |
| Uniformity and Cauchy characterization | Constants f_j=1/j on ℂ | d_C(f_j,0)=1/(j+1)→0; compact sup=1/j→0; compact restrictions have same sup | Pass | Keep |
| Function-space completeness and representative comparison | f_j=z+1/j on disk | Limit z is holomorphic; compact sup error=1/j and derivative error=0; zero extension outside does not change on-domain values | Missing signature | R03 |
| Continuous algebra, evaluation and restriction | Constants 2,3; evaluation at any x | Sum=5, product=6; evaluating/restricting before or after gives 5,6 | Pass | Keep |
| Derivative continuity in compact-open topology | f_j=z²+z/j | Derivative=2z+1/j, compact derivative error=1/j; original error≤R/j on radius-R compact | Pass | Keep |
| O(K) subspace and distinction from interior-holomorphic maps | K unit circle; functions z and 1/z | Both extend to an annular neighborhood and add/multiply there; interior condition alone is vacuous since int K=∅ | Pass | Keep |
| O(K) is not open on closed disk | ε conjugate z for ε>0 | Sup distance to 0=ε, but ∂̄=ε≠0 in disk; every norm neighborhood of 0 contains a nonmember | Pass | Keep |
| O(K) is not closed on closed disk | Σzⁿ/(n+1)² | Uniform tail≤Σₙ≥N1/(n+1)²→0; derivative coefficient sum at 1 is Σn/(n+1)²=∞, preventing extension | Pass | Keep |
| O(K) on finite and empty K | K={0,1}, desired values a,b | Polynomial a+(b−a)z takes a,b; empty K has one function; O(K)=C(K) | Pass | Keep |
| Contour estimate and orientation | Unit circle, f=1,g=0; degenerate interval | Integral difference=0≤1·2π; reversed orientation negates 0; zero-length interval both sides 0 | Pass | Keep |
| Disk Morera closure route | f_j=z+1/j on rectangle | All boundary integrals 0, uniformly limiting to ∮z dz=0; same continuous limit as native closure | Pass | Keep |
| Polynomial versus rational Runge | K unit circle; f=1/z; allowed pole 0 | Polynomial contour obstruction gives error≥1; rational f itself gives error 0. Sphere complement has inner/outer components | Pass | Keep |
| One-pole push geometric expansion | K=D̄₁,a=3,b=3.1,δ=0.2 | Distances 2,2.1>0.4; \|a−b\|/dist(b,K)=1/21<1/2; tail of geometric series tends to 0 | Pass | Keep |
| Finite jet interpolation refinement | f=z², marked 0, jet order 1 | P=0,Q=z²; quotient=1 extends at 0; approximant Q·1=z², values/derivatives 0,0 at 0 | Pass | Keep |
| Unbounded-component pole pushed to infinity | K=D̄₁, pole b=4 | 1/(z−4)=−(1/4)Σ(z/4)^k; ratio≤1/4, truncation error≤(1/4)^(M+1)/3 | Pass | Keep |
| Finite-rank collar estimate for a constant | f=c, B≥\|c\|, K={0} | One evaluation A f=c gives norm error 0≤εB; B=0 forces c=0 | Pass | Keep |
| Signed divisor shells and quotient germ convention | f=(z−1)²/z; denominator z | Orders −1 at 0, 2 at 1, 0 elsewhere; changing totalized value at 0 does not change the meromorphic germ | Pass | Keep |
| Runge square neighborhoods and hull intersection | K={0}, Ω=ℂ, centered mesh cells | Finite square union surrounds 0, its filled hull shrinks with mesh diameter O(δ); intersection={0} | Pass | Keep |
| Dual cycles and winding decomposition | V annulus around 0, a₁=0; σ₁ positive circle | winding(σ₁,0)=1; γ=2σ₁ has n₁=2; γ−2σ₁=0 has winding 0 everywhere | Pass | Keep |
| Rational winding correction and zero-free logarithm | u=z³ on annulus, R=z³ | (2πi)⁻¹∮u′/u=3; u/R=1, logarithmic periods 0; log=0, avoiding the wrong winding-zero approximation of u | Pass | Keep |
| Direct boundary primary-factor construction | Ω punctured plane, a=1/2,b=0 | w(z)=−1/(2z); w(a)=−1; B₀(w)=1−1/(2z) has one simple zero at a, pole only outside Ω | Pass | Keep |
| Shell corrections and convergent divisor tails | Deviation bound 2^(−n) | Tail from n=N sums to 2^(1−N); unit tails contribute order 0, retaining finite prescribed head orders | Pass | Keep |
| Branchwise shell-cover boundary accumulation | Ω=D₁, branch approaching ξ=1 | Shell points tend to 1 while every compact \|z\|≤r<1 meets finitely many; meromorphic extension with those zeros would have infinite zero order and be 0 | Pass | Keep |
| Dense-boundary whole-overlap construction | Boundary point a_j, choices distance<1/n | For fixed j, distance to a_j→0; K_m meets only levels n<m, a finite set; boundary ball extension would have accumulating zeros | Pass | Keep |
| Connected larger-domain hypothesis | Ω disk with nonzero f; V=Ω disjoint union another disk | Extending f by 0 on the extra disk is holomorphic, so connectedness is necessary; connected larger V meets ∂Ω and cannot evade the boundary obstruction | Pass | Keep |
| Arbitrary-disk and interior-germ consequences | Ω punctured plane, disk meeting 0, f=exp(1/z) | Segment first exit=0; continuation would have infinitely many negative Laurent coefficients at an interior point, impossible for a meromorphic function | Pass | Keep |
| Mittag–Leffler uniqueness and naturality | P=1/z at 0; solutions f=1/z and f+z | Difference=z entire; translation by a changes principal part to 1/(z−a); scaling z→2z changes residue to 1/2 | Pass | Keep |
| Negative Laurent part extends over punctured plane | P=exp(1/z)+1/(2−z) near 0 | Negative part Σₖ≥1 z^(−k)/k!=exp(1/z)−1 converges for every z≠0; regular part 1+1/(2−z) only local | Pass | Keep |
| Full factorization and origin order | f=z; f=z²exp z | First m=1,P=1,g=0; second m=2,P=1,g=z; products give z and z²exp z exactly | Missing signature | R03 |
| Uniqueness of entire logarithm for a fixed product | g=0 and h=2πi; disconnected negative control | exp g=exp h=1 and h−g=2πi; different integers on two components show why constancy is on connected ℂ | Pass | Keep |
| Sine product and cotangent residues | z=0,1; near integer k | Sine:0=π·0·1 and 0 from n=1 factor; cotangent leading term 1/(z−k), residue 1 | Pass | Keep |
| Cosine and shifted tangent product | z=0,1/2 | Cosine values 1 and 0; first cosine factor at 1/2 is 1−1=0; −πtan(πz) has residue +1 at 1/2 | Pass | Keep |
| One-sided genus-one and reciprocal Gamma | z=0,−1,1 | Unprefactored product at 0=1; full reciprocal-Gamma RHS at 0,−1=0; at 1, e^γ·product=1=1/Γ(1) | Pass | Keep |
| Bilateral shifted sine normalization | α=1/2,z=0,1/2 | At 0 scalar sin(πα)=1; linear exponent πcot(πα)=0; at 1/2 a factor vanishes and sinπ=0 | Pass | Keep |
| Shifted logarithmic-derivative regularization | α=1/2,z=0 | Each difference term (n+α)⁻¹−(n+α)⁻¹=0; g′=πcot(πα)=0 agrees with LHS | Pass | Keep |
| Paired-cotangent strip term estimate | z=i,n=1 | Actual norm \|2i/(−2)\|=1≤3/(1/4+1)=12/5; integer exclusion avoids undefined analytic poles | Pass | Keep |
| Decreasing-function strip sum | \|y\|=1 | Each term 1/((n−1/2)²+1); integral comparison bounds total by 1+π/2≈2.5708; first term 0.8 | Pass | Keep |
| Entire extension and Liouville constant | c−q, at half-integer and vertical infinity | Residue difference 1−1=0; value at 1/2=0; upper limit −πi−(−πi)=0 fixes constant | Pass | Keep |
| Improper Riemann tail control | R=1 | Tail ∫₁∞(1+t²)⁻¹dt=π/4≤1/R=1; y=0 is excluded from the bound 1/y | Pass | Keep |
| Theta product and real shift | r=1/2,z=0 | Numerical finite-product limits H(0)≈3.09196915555; H(2log r)≈6.18393831109=2H(0); ratio r⁻¹e⁰=2 | Pass | Keep |
| Hyperbolic sine product | z=0 and i | At 0 both 0; at i, sinh(πi)=0 and first factor 1+i²=0 | Pass | Keep |
| Integer and half-integer admissibility | Paired integer roots ±n, half roots ±(n−1/2) | Inverse-square shell terms 2/n² and 2/(n−1/2)² summable; at z=0 every product factor=1 | Pass | Keep |
| Slow escaping logarithmic zeros | aₙ=log n,n≥2,pₙ≥n; R/log N=1/2 | Tail majorants≤2^(−n−1), sum from N=2^(−N); p=n−1 variant uses sum 2^(1−N) | Pass | Keep |
| Square lattice and Manhattan shells | N=1,2 | Shell sizes 4,8=4N; minimal lengths 1,√2≥N/√2; large-shell deviation≤8√2R³/N² summable | Pass | Keep |
| Sparse genus-zero example | aₙ=2ⁿ, R=1,N=1 | Deviation sum Σₙ≥1 2^(−n)=1=2^(1−1); product vanishes at z=2, normalized value at 0=1 | Pass | Keep |
| General ratio product convergence | aₙ=bₙ; finite perturbation a₁=2,b₁=1 | First every factor=1; second product=(z−2)/(z−1), zero at 2, pole at 1; distance from compact to pole closure bounds denominator | Pass | Keep |
| Accumulating-pole ratio example | aₙ=2/n²,bₙ=1/n² | Σ\|aₙ−bₙ\|=π²/6; cancellation would require m²=2n², impossible for positive integers; bₙ→0 excludes a neighborhood of 0 | Pass | Keep |
| Crescent topology and polynomial compact-open density | z=−1/2 | \|z\|=1/2<1, \|2z−1\|=2>1; exterior and removed disk meet at 1, so complement connected | Pass | Keep |
| Crescent failure of global approximation: first pole | f=1/z,z=−t | \|f\|=1/t; any polynomial norm≤M on disk, error≥1/t−M→∞ | Pass | Keep |
| Crescent failure of global approximation: second pole | f=1/(z+1),z=−1+t | \|2z−1\|=3−2t>1, \|f\|=1/t; error≥1/t−M→∞ | Pass | Keep |
| Jordan-region cycle and hole signs | Outer radius 2, inner radius 1 | Index at 0:1−1=0; at 3/2:1−0=1; at 3:0−0=0; oriented area=4π−π=3π | Pass | Keep |
| Full-boundary Cauchy–Pompeiu sign | Unit disk, f=\|z\|²,ξ=0 | Boundary term=1; ∂̄f=z, area term=(1/π)∫1=1; RHS1−1=0=f(0) | Pass | Keep |
| Puncture subtraction and circle/area errors | Same disk with ε-circle | Small-circle integral=2πi ε²; its error norm=2πε²=2πsup_circle\|f−f(0)\|; area deletion bound≤2πMε | Pass | Keep |
| Real/imaginary contour and curl comparison | F=conjugate z=x−iy | F dz has real xdx+ydy and imaginary xdy−ydx; curls 0 and 2=2Re ∂̄F; total circle integral 2πi | Pass | Keep |
| dbar contour Stokes cross-check | F=z on unit disk | ∮z dbarz=−2πi; −2i∫∂z z dA=−2iπ; sign agrees with GH5 moments | Pass | Keep |
| Upper/lower/axis pointwise approximation | Fixed points i,−i,0 | Eventually in pieces 1,2,3; limits 1,−1,0. At n=1 strips meet only excluded boundary height 1/2, so neighborhoods disjoint | Pass | Keep |
| Five-piece normalization example | n=1; Q(0) within 1/2 of 1 | \|Q(0)\|≥1/2, \|P\|≤(1/2)/(1/2)=1 off 0; P(0)=1. General ratio bound=1/n→0 | Pass | Keep |
| Two-domain hull and transfer | K=2≤\|z\|≤3; Ω₁=D₄, Ω₂=1<\|z\|<4 | Hulls D̄₃ and K; transfer on H=K permits g=f for common polynomial, error 0 | Pass | Keep |
| Exponential-minus-one product | z=0,2πi | At 0 both 0, normalized first-order factor 1; at 2πi first product factor 1−1=0, matching exp(2πi)−1=0 | Pass | Keep |
| Real Stone–Weierstrass versus holomorphic polynomials | Unit disk, conjugate z=x−iy | Real-coordinate complex span contains x−iy exactly; holomorphic approximants cannot converge uniformly on disk since limit would have ∂̄=0, versus 1 | Pass | Keep |
| Smooth shell cover and extension by zero | Ω disk, a cutoff compactly supported in \|z\|<1/2 | Outside its support all derivatives 0; extension across \|z\|=1 remains 0; partition coefficients sum 1 on Ω | Pass | Keep |
| Smooth Runge shell correction convergence | Errors ≤2^(−j) in each fixed eventual seminorm | Tail seminorm sum from N≤2^(1−N); ∂̄ of corrections=0; sum of data χ_j f=f | Pass | Keep |
| Affine solution-space classification | f=1,u₀=conjugate z | u=u₀+h gives ∂̄u=1+0=1; subtracting u₀ gives unique on-domain h. Off-domain total representatives are not claimed unique | Pass | Keep |
| GH5 solution example f=conjugate z | u=conjugate z²/2; z=1+i | ∂̄u=conjugate z=1−i; adding entire h changes ∂̄ by 0 | Pass | Keep |
| GH5 Gaussian and bounded solutions | u₀=−exp(−\|z\|²); z=1 | ∂̄u₀=z exp(−\|z\|²)=e⁻¹; bounded entire additions are constants, while h=z is unbounded | Pass | Keep |
| GH5 datum z and exact differential negative control | u=\|z\|²; g=conjugate z | ∂̄u=z; ∂z g=0 but dg=dbarz≠0, so merely ∂z g=0 does not imply dg=0 | Pass | Keep |
| Closed completion and solution classification | f=z,g=conjugate z | ∂z f−∂̄g=1−1=0; dω=0. Adding holomorphic h changes the difference by 0 | Pass | Keep |
| Closed versus globally exact one-form | ω=dz/z on punctured plane | dω=0, but circle period=2πi≠0; no global primitive | Pass | Keep |
| Tangent inclusion and real-coordinate restriction | Open disk, point 0, vectors 1 and i | Inclusion derivative and inverse send 1→1,i→i; restricting u=z² gives the same derivative 0 at 0 | Pass | Keep |
| Coefficient maps and dz,dbarz | L₁,L_i on t=1; basis (1,i) | dz values (1,i), dbarz values (1,−i); Re∘L₁ sends 1 to 1 | Supplier gap | R01 |
| Coordinate formula for du | u=z² at 1+i | ∂z u=2+2i,∂̄u=0; du(1)=2+2i, du(i)=−2+2i, agreeing on both basis vectors | Pass | Keep |
| Wedge normalization and 2-form coefficient | Basis (1,i), η=dx∧dy | dz∧dbarz evaluates −2i; h=1/(−2i)=i/2, so h(−2i)=1=η(1,i) | Pass | Keep |
| Complex and real two-form primitive | η=dx∧dy; u=(i/2)conjugate z | ∂̄u=i/2; d(−u dz)=(i/2)(−2i)dx∧dy=η; real part remains a real primitive | Needs coefficient contract | R01 |
| GH5 sample: d(i z²) | z=1+i, vectors 1 and i | Both sides evaluate to −2+2i and −2−2i respectively | Pass | Keep |
| GH5 sample: d(i\|z\|²) | z=1+i, vectors 1 and i | Both sides evaluate to 2i and 2i respectively; swapping holomorphic/antiholomorphic coefficients would fail | Pass | Keep |
| GH5 sample: d(\|z\|²) | z=1+i, vectors 1 and i | Both sides evaluate to 2 and 2 | Pass | Keep |
| GH5 sample: d(\|z\|⁴) | z=1+i, vectors 1 and i | Both sides evaluate to 8 and 8 since \|z\|²=2 | Pass | Keep |
| GH5 sample: d((log\|z\|)²) | z=2, direction 1; z=1 | At 2 both give log 2; at 1 both 0. Derivative of log(\|z\|²) at 2 would be 1, a different function | Pass | Keep |
| GH5 sample: integer ∂z monomial | m=−1,n=1,z=2 | ∂z(z⁻¹ conjugate z)=−conjugate z/z²=−1/2; RHS m z^(m−1)conjugate z^n=−1/2 | Pass | Keep |
| GH5 sample: integer ∂bar monomial | m=−1,n=1,z=2 | ∂̄=1/z=1/2; RHS n z^m conjugate z^(n−1)=1/2; z=0 excluded | Pass | Keep |
| GH5 sample: natural ∂z monomial at origin | (m,n)=(0,0),(1,0),(2,0),z=0 | Derivatives 0,1,0; piecewise RHS gives 0,1,0, avoiding an unintended negative natural exponent | Pass | Keep |
| GH5 sample: natural ∂bar monomial | (m,n)=(0,0),(0,1),(1,1),z=1+i | Values 0,1,1+i on both sides; ∂bar of z is 0 | Pass | Keep |
| GH5 sample: disk monomial moment | (m,n)=(0,0),(1,0),(1,1),(2,2) | Integrals π,0,π/2,π/3; angular factor 2π or 0, radial factor 1/(2m+2) | Pass | Keep |
| Additive Cousin I cocycle and partition sign | Two sets, c₁₂=1,c₂₁=−1, ρ₁+ρ₂=1 | b₁=ρ₂,b₂=−ρ₁, hence b₁−b₂=1; ∂̄b₁=∂̄b₂; corrected holomorphic differences stay 1 | Missing signature | R03 |
| Cousin cover for Mittag–Leffler | E={0}⊂ℂ, Ω₀=ℂ\{0}, U₁=D₁ | Union=ℂ; overlap punctured disk; transition 1/z is holomorphic there, its principal part remains 1/z | Pass | Keep |
| Real planar H² conclusion | η=dx∧dy on ℂ and its open restrictions | η=d(x dy), class 0; no integration over a compact closed surface is asserted | Pass | Keep |

This second table has **123 rows**, for **196 computed rows** in total. The GH5 seeded sample is covered formula by formula; the source locator check is distinct and remains uncertified. No formula change was made or inferred from a successful sorry build.

## Not verifiable

- **GH5 coordinate worked examples, source theorem/page/hypotheses:** no locator or identified course-note source is attached to the sample. The formulas and hypotheses were checked directly above, but there is no source theorem number or printed page to confirm.
- **Conway, Functions of One Complex Variable I:** the sources service's bibliographic lookup resolved only to a paywalled Springer DOI prefix and returned `uncertified`. No text was read and no theorem/page support is claimed. It was not added as a new missing-text request.
- **Ahlfors, Complex Analysis:** the sources service's bibliographic lookup returned no legal text; the missing-reference record preserves the work's key, the requested use, and the unsuccessful lookup. No edition is supplied by the README. No source numbering, passage support or absence of source errata is certified.
- No other locator is flagged unverified in the README. The two bibliography entries were both attempted. No book extraction was available, so there are no legitimate source-text line citations to add. No source passage was copied into this report. The review is completed with these limitations and is not parked for a text.

## Source issues

- none
