# Review of SobolevPolynomialApproximation (pull request #1612 at ef3d525)

**Verdict:** needs changes

🤖 Independent AI review. Scope: this roadmap folder at the specified head; no pull-request files were changed.

## R01 (P1) — Polynomial inclusion is not injective on the empty open set

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:36–39` — “through an injective continuous linear map”.

**Claim/problem:** Boundedness does not imply nonemptiness. The specified inclusion cannot be injective for every bounded open Ω.

**Witness:** Take n = 1, Ω = ∅, k = m = 0, p = 2. Polynomial functions 0 and 1 are distinct, but both restrict to the unique element of L²(∅).

**Repair and recheck:** Keep the map for bounded Ω, but require Ω.Nonempty for injectivity and identification of its range with the full polynomial space. Add the empty-domain negative control. On Ω = (0,1), the images of 0 and 1 have distance 1; on ∅ the repaired claim makes no injectivity assertion.

## R02 (P1) — Affine geometry formulas admit zero denominators

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:112–115` — “if `Metric.ball y ρ' ⊆ Ω'` then `‖B‖ ≤ diam Ω / (2ρ')`”.

**Claim/problem:** The ball inclusions do not assert positive radii, and the volume ratio does not assert a nonempty domain. Both formulas are false under the stated hypotheses.

**Witness:** For B = id on ℝ and Ω = Ω′ = (0,1), ρ′ = 0 gives 1 ≤ 1/0 = 0. For Ω = Ω′ = ∅, the determinant formula gives 1 = 0/0.

**Repair and recheck:** Require 0 < ρ′ and 0 < ρ for their respective radius bounds. State volume Ω = |det B| · volume Ω′ without division; derive the ratio only when 0 < volume Ω′ < ∞. For (0,1), center 1/2 and radius 1/2, the corrected bound is 1 ≤ 1. For empty sets the multiplicative formula is 0 = 1·0.

## R03 (P1) — Several proof routes cite declarations absent from the pins

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:63,88–92,107,172,186–192,219` — “by `TauCeti.Wkp.exists_hasWeakLineDerivOn_value`”.

**Claim/problem:** The exact pinned Tau Ceti tree has no W1p.norm_le_norm_value_add_norm_gradient, W1p.exists_value_ae_eq_const_of_gradient_eq_zero, Wkp.exists_hasWeakLineDerivOn_value, HasWeakLineDerivOn.comm, W1p.compL, Set.IsLipschitzDomainWith, or W1p.isCompactOperator_valueL_of_isLipschitzDomainWith. Analysis/Sobolev/Poincare/Wirtinger/Compactness.lean is also absent. These are substantive inputs, especially the all-order directional-derivative bridge used in three milestones. No supplier gaps are declared.

**Witness:** TauCeti/Analysis/Sobolev/RellichKondrachov.lean:141 supplies W1p0 compactness; TauCeti/Analysis/Sobolev/W1p/LocalCompactness.lean:111 supplies restriction to a relatively compact subdomain. Neither supplies the asserted full W1p Lipschitz-domain operator.

**Repair and recheck:** Cite PDE on main, Lane A.2/A.5/A.6, for its actual density/Poincaré/domain/Rellich targets. Give the missing all-order derivative bridge, weak-derivative symmetry and composition input explicit ownership and statements before use; do not invent pinned names. Put any genuinely new supplier obligation in a declared gap. Test the bridge on u = x²: D u = 2x in W¹,p and D²u = 2; distinguish full-domain compactness from the zero-boundary/local pinned results.

## R04 (P1) — The averaged-Taylor signature lacks the hypotheses needed for linearity

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:90–91; TauCetiRoadmap/SobolevPolynomialApproximation/README.md:130–143` — “def averagedTaylorL (φ : E n → ℝ) (m : ℕ)”.

**Claim/problem:** The elaborated signature accepts every φ and every open Ω. Its sorried body conceals the missing integrability conditions: the README formula cannot define the promised continuous linear map at this generality. This is also the gate’s fourth sorry-data failure.

**Witness:** On Ω = (0,1), m = 0, p = ∞, take φ(x) = 1/x, u = 1, v = x−1. Lean’s nonintegrable integrals give Q(u)=Q(v)=0, while Q(u+v)=∫1=1.

**Repair and recheck:** Carry compact support inside Ω and the regularity/boundedness conditions in the map’s own signature and give an actual integral construction if it is simple enough to retain. Otherwise remove the map and its dependent signatures and describe the missing construction in the docstring, while retaining statable headlines in native form. With a valid normalized cutoff, Q(1)=1 and Q(x−1)=∫xφ−1, so additivity gives Q(x)=∫xφ. Record this as a Check.

## R05 (P2) — Order truncation is admitted data used to define every positive-order seminorm

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:57–62` — “def Wkp.toOrderL … := sorry”.

**Claim/problem:** This gate failure makes the seminorm and headline signatures depend on an unspecified operation. The type alone permits the zero operator, including at equal orders.

**Witness:** At j = k = 1, the zero map sends u(x)=x on (0,1) to 0; the intended identity sends it to u, whose first-derivative seminorm is 1.

**Repair and recheck:** Define truncation by actual recursion through TauCeti.Wkp.lowerOrderL, with identity at equal orders, if retained as a simple supporting definition. Otherwise remove declarations depending on it and restate the headline without admitted data. Verify the repaired body gives the identity at j=k and preserves the value of x.

## R06 (P2) — Exponent conversion is an unnecessary admitted construction

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:73–74` — “def Wkp.ofExponentLE … := sorry”.

**Claim/problem:** This is a separate sorry-data gate failure. No headline in this file uses the definition. Its type specifies a continuous linear map but does not specify the value-preserving inclusion promised in the README.

**Witness:** On Ω=(0,1), k=0 and equal exponents, both the identity and zero map have the displayed type; they send the constant 1 to 1 and 0 respectively.

**Repair and recheck:** Delete this unused definition from Suggested.lean and keep the full construction and value/derivative-preservation API in the README. The equal-exponent Check must have value 1 on the constant 1; a zero map fails it.

## R07 (P2) — The polynomial-to-Sobolev map is admitted data

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:77–78` — “def Wkp.ofPolynomialL … := sorry”.

**Claim/problem:** This separate sorry-data gate failure leaves the Bramble–Hilbert statement using an unspecified map, rather than the Sobolev class represented by the polynomial.

**Witness:** On Ω=(0,1), k=m=0, p=2, the zero continuous linear map has this type but sends polynomial 1 to a class of norm 0 instead of norm 1.

**Repair and recheck:** Retain this only with a real native construction and the correct a.e. polynomial value. Otherwise express approximation using a Sobolev element whose value equals polynomial evaluation, or name the unavailable construction in the docstring. Verify the constant-1 example has norm 1, and apply R01’s separate nonemptiness condition to injectivity.

## R08 (P2) — The quotient is used outside the domain of its defining map

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:94–96` — “The quotient normed space `W^{m+1,p}(Ω) ⧸ Wkp.polynomialsDegLE m`”.

**Claim/problem:** Item 4 has no boundedness assumption, although Wkp.polynomialsDegLE was defined as the range of the bounded-domain polynomial inclusion. On an unbounded domain not every polynomial lies in Wkp.

**Witness:** For Ω=ℝ, p=2 and m=0, the constant polynomial 1 has ∫ℝ |1|² = ∞; it has no corresponding W¹,² element under the promised inclusion.

**Repair and recheck:** State this quotient construction for bounded Ω. If an unbounded-domain version is desired, define the subspace of polynomial representatives that actually belong to Wkp and distinguish it from the full polynomial space. On (0,1), 1 has L² norm 1 and the original quotient construction is defined.

## R09 (P2) — Taylor’s integral remainder needs regularity along the whole segment

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:125–129` — “For `u` of class `C^m` near `y`”.

**Claim/problem:** This suffices to form the degree-m Taylor polynomial at y, but not to assert the integral remainder to x. The cited pinned theorem requires one more derivative on the whole interval.

**Witness:** For m=0, y=0, x=1, take u=0 below 1/2 and u=1 above it. It is smooth near y. The remainder is 1; its a.e. classical derivative integral is 0.

**Repair and recheck:** Separate polynomial construction from the remainder theorem. For the latter require C^(m+1) on a neighbourhood of the segment (or state and supply the appropriate absolute-continuity version). Mathlib/Analysis/Calculus/Taylor.lean:534 has the required ContDiffOn order m+1. For u(t)=t², m=1, y=0, x=1, the corrected formula gives 1=∫₀¹2(1−t)dt.

## R10 (P2) — Statable headline theorems are missing from the acceptance test

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:9–12,100–117,198–222; TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:4–10,95–105` — “the behaviour of Sobolev seminorms under affine changes of variables”.

**Claim/problem:** The file omits affine scaling, higher-order composition and the continuous-representative/embedding headline. Their carriers exist: Euclidean spaces, continuous linear equivalences, Wkp, Lp values and ordinary functions. The module docstring also does not name Deny–Lions or any other unstatable headline and its missing carrier. A sorried averagedTaylorL is not a theorem about that construction.

**Witness:** The eight theorems in Suggested.lean include polynomial algebra and norm comparisons, but none asserts an affine scaling estimate or existence of a continuous representative of Wkp.value.

**Repair and recheck:** After removing admitted data, state the affine and embedding headlines on native carriers, with existential Sobolev representatives where a bundled operation is not yet available. Inventory all headlines in the docstring; for Deny–Lions identify the missing Lipschitz-domain carrier. Check affine dilation on u=x, F(x)=2x: the first-derivative L² norm changes from √2 to 2. Check the embedding representative of x has supremum 1 on (0,1).

## R11 (P2) — The continuity proof uses a density statement unavailable at p = ∞

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:198–209` — “the smooth approximants of Meyers–Serrin converge uniformly by the same bound”.

**Claim/problem:** This route is stated for every permitted p, but smooth functions are not dense in the W^(k,∞) norm. The change-of-exponent discussion for the representation formula does not specify a finite exponent in the embedding range for this continuity argument.

**Witness:** For u(x)=|x| on (−1,1), every smooth v has ess sup |v′−sign(x)| ≥ 1, by continuity of v′ at 0. Thus no W¹,∞ smooth approximants converge to u.

**Repair and recheck:** For p=∞ choose and name a finite r>n/k (when k≥1), use the finite-measure inclusion and finite-r Meyers–Serrin density, then apply the finite-r embedding estimate. Handle k=n=0 separately. On |x|, vε=√(x²+ε²) converges uniformly with error at most ε and in W¹,r for finite r, while the W¹,∞ derivative obstruction remains 1.

## R12 (P2) — The averaged polynomial is unnecessarily restricted below the cited source’s generality

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:130–143` — “For `u ∈ W^{m,p}(Ω)`”.

**Claim/problem:** The construction stops at W^(m,p). Brenner–Scott §4.1, Propositions 4.1.12 and 4.1.17, constructs the same averaged polynomial already on L¹(B), using integration by parts, and gives the derivative identity with only the derivative regularity it requires. The roadmap supplies neither that general construction nor an owner for it.

**Witness:** brenner-scott line 4503 gives the L¹(B) domain; line 4517 gives its bounded polynomial image; line 4524 gives the weaker Sobolev hypothesis for differentiation (printed p.95).

**Repair and recheck:** Build the L¹(B)-to-polynomial operator using the fixed smooth cutoff, and prove its agreement with the displayed derivative formula on W^(m,p). Retain the latter as a specialization. Test the indicator of half the ball: it is in L¹ but not W¹,¹ across its interior jump, yet every coefficient ∫uψ is finite.

## R13 (P3) — Evaluation injectivity is one-tactic padding

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:35` — “theorem injective_evalₗ”.

**Claim/problem:** This is a direct transport of the pinned multivariate-polynomial extensionality theorem, not a headline acceptance target.

**Witness:** A scratch copy closes this theorem with one exact using MvPolynomial.funext, and elaborates successfully. The supplying declaration is Mathlib/Algebra/MvPolynomial/Funext.lean:82.

**Repair and recheck:** Delete it from Suggested.lean. Keep evaluation injectivity in the README API and cite MvPolynomial.funext in the supplier contract. The successful probe was `exact fun _ _ h => MvPolynomial.funext (fun x => congrFun h (WithLp.toLp 2 x))`.

## R14 (P3) — Definitions have no discriminating Checks and dependencies are not itemized

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:18–243` — “each have their basic API”.

**Claim/problem:** There are zero Checks blocks and zero Needs lines. Contractions, polynomial spaces/inclusion, truncation, seminorms, exponent conversion, quotient and averaged Taylor require their own API and at least three discriminating Checks. The broad acceptance bullets do not supply them. The requested Summary, Scope and ownership, Conventions, Exact supplier contracts, build explanation, Layer/Examples/Dependencies and downstream structure are absent.

**Witness:** The empty-domain inclusion and zero-radius examples in R01–R02 pass every written acceptance bullet. No local Check currently distinguishes them from the intended domain assumptions.

**Repair and recheck:** Reorganize into the requested layers, preserving the mathematical content, and add exact per-target dependencies and APIs. Give each definition positive, negative and boundary Checks with computed values; include R01–R02’s controls. For the averaged polynomial use Q(1)=1, Q(x)=x for degree≥1, and a degree-one approximation of x² that is not x².

## R15 (P3) — Most targets have no exact source locator

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/README.md:50–117,125–139,144–153,176–192,210–222,245–255` — “Chapter 4 (§4.1–4.4)”.

**Claim/problem:** The six references have no sources.toml record. Many numbered targets have only a bibliography entry or a pinned/proposed name; none of the book theorem citations supplies a printed page. In particular, the functional forms, Deny–Lions and boundary-density statements have no claim-level locator.

**Witness:** The matching Brenner–Scott derivative identity is Proposition 4.1.17, p.95, not a chapter-wide locator. The representation formula is Proposition 4.2.8, pp.97–99; item 10 does not name it.

**Repair and recheck:** Add exact claim-level locators and one source key per work in sources.toml. Use the verified locations below and distinguish source theorems from consequences or extensions. Record unread sources honestly; do not invent page numbers for Ciarlet or Evans. The m=1 derivative Check below matches Proposition 4.1.17 after shifting the source’s degree index by one.

## R16 (P3) — The Lean/README declaration correspondence and docstrings are incomplete

**Location:** `TauCetiRoadmap/SobolevPolynomialApproximation/Suggested.lean:26–43,65–69,81–85; TauCetiRoadmap/SobolevPolynomialApproximation/README.md:18–96` — “finrank_polynomialsDegLE”.

**Claim/problem:** Several Lean names never appear in the README, including evalₗ, injective_evalₗ, finrank_polynomialsDegLE, homogeneousComponent_pderiv and the two norm-comparison theorem names. Conversely Wkp.polynomialsDegLE is presented as this roadmap’s named object but has no declaration. Theorems at lines 35,37 and 68 lack docstrings.

**Witness:** The file declares 16 objects but no Wkp.polynomialsDegLE; the README describes the range using that backticked name at line 39.

**Repair and recheck:** After pruning to headlines, name every retained declaration in the README and document its mathematics. Describe non-retained API in prose rather than promising Lean declarations. Name the polynomial-range construction as a README target in prose unless needed by an actual retained headline. Recheck the correspondence in both directions.

## Verified sound

This is a record of checks that succeeded and computed tests that exposed defects, not certification of every unproved theorem. Read the repository README and CONTRIBUTING, main’s PDE Lane A and the completed OrthogonalL2Bases roadmap, both target files in full, and the relevant pinned definitions. No executable numerical algorithm, copied source passage, set_option, extra import, outside-folder change, or competing owner of the averaged-Taylor/Bramble–Hilbert/Deny–Lions package was found.

The brief describes a 15-target seeded sample but supplies no target identifiers (“none found by heading”). I did not invent a seed or claim to recover that sample: the examination below covers all 16 numbered items, the standing definitions and every Lean theorem, exceeding its numerical coverage. All six distinct precise Brenner–Scott citations were opened. Ciarlet’s exact citation remains unread. No README locator is explicitly flagged unverified.

**Build, gate and binder checks.** Confirmed head ef3d52537a201ddb48490021abf30746e1985385. The provided push gate reports four sorry-data violations and no other failures; R04–R07 address all four occurrences individually. The imported module `TauCeti.Analysis.Sobolev.Wkp.Basic` built successfully. Running `lake env lean` on Suggested.lean then exited 0 with only the 12 expected sorry warnings. A scratch copy with `#check @name` for all 16 declarations also exited 0. The Fact binders, finite-measure instance for exponent conversion and explicit boundedness argument for polynomial inclusion were retained; no lost section hypothesis was found. The averaged-polynomial signature really lacks cutoff hypotheses. No signature was changed in the worktree.

Dependency-check output:

```text
depcheck: 205 roadmaps, 1498 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line occurred. There are no Needs lines to audit; this absence is R14. PDE is a roadmap on main, so its revised open pull request was inspected for ownership only, not used as a dependency. Main’s Lane A.1 (lines 225–228), A.2 (229–232), A.4 (236–238), A.5 (239–241), and A.6 (242–258) own the weak Sobolev carriers, density, first-order embeddings/Poincaré and Lipschitz-domain/trace/extension/Rellich package. Those section references resolve. The bare “PDE Lane A” references are too coarse to replace the missing exact library declarations in R03.

**Ownership and duplication.** Object searches used the roadmap service across main and the indexed open heads, and searched the board’s readable package READMEs/Lean files. The five package heads listed in the supplied board index concern analytic number theory, automorphic congruences, Kato Euler systems, Lawrence–Venkatesh and logic; no corresponding competing Sobolev approximation package was found. PDE’s readable open revision retains foundational Sobolev/first-order ownership (README lines 26–31, 46–52); higher-order polynomial approximation is distinct. Completed OrthogonalL2Bases concerns orthogonal weighted bases, not Sobolev polynomial remainders. Algebraic de Rham/Poincaré search hits concern different carriers, not the degree-controlled real polynomial potential in item 2. No same fully qualified declaration name was found in the searched roadmap files. The one exact library duplication found in Suggested.lean is R13. This roadmap can own the approximation extension without rebuilding the PDE foundation; it need not be rejected as an irreparable re-plan.

**Pinned declarations opened.** Paths here are library-repository-relative. Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Declaration / object | File and line | Verified content and boundary |
| --- | --- | --- |
| `MvPolynomial.restrictTotalDegree`, `mem_restrictTotalDegree` | Mathlib/RingTheory/MvPolynomial/Basic.lean:164,174 | Support total-degree bound; includes the zero polynomial. Finite-variable module finiteness is at line 222. |
| `MvPolynomial.funext` | Mathlib/Algebra/MvPolynomial/Funext.lean:82 | Evaluation determines a polynomial over an infinite integral domain; applies to ℝ. |
| `MvPolynomial.IsHomogeneous.sum_X_mul_pderiv` | Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:73 | Euler factor is the degree, with no inverted factor hidden in the theorem. |
| `MvPolynomial.sum_homogeneousComponent` | Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:558 | Reconstruction by homogeneous components. |
| `StarConvex`, `starConvex_empty` | Mathlib/Analysis/Convex/Star.lean:69,98 | Segment closure; nonemptiness and center membership are not fields. Empty sets satisfy it. |
| `taylor_integral_remainder` | Mathlib/Analysis/Calculus/Taylor.lean:534 | Requires ContDiffOn of order n+1 on the whole interval. |
| `HasFTaylorSeriesUpToOn.comp`, `FormalMultilinearSeries.taylorComp` | Mathlib/Analysis/Calculus/ContDiff/FaaDiBruno.lean:1050,898 | Classical composition with MapsTo and Taylor-series hypotheses; not a weak-Sobolev composition theorem. |
| `Lp.antitone` | Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:159 | Finite measure and ordered exponents; not an unconditional inclusion. |
| `iteratedGradientChain` | TauCeti/Analysis/Calculus/IteratedGradient.lean:105 | Index zero is gradient; successor differentiates the preceding field. |
| `Wkp.lowerOrderL`, `iteratedGradient`, `value`, `ext` | TauCeti/Analysis/Sobolev/Wkp/Basic.lean:175,221,236,385 | Native order-changing and representative APIs; equality is determined by the Lp value. |
| `Wkp.norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq_succ` | TauCeti/Analysis/Sobolev/Wkp/Basic.lean:421 | Exact recursive norm square from order two for every p. |
| `Wkp.norm_sq_eq_norm_lowerOrder_sq_add_norm_iteratedGradient_sq` | TauCeti/Analysis/Sobolev/Wkp/Basic.lean:433 | Exact square sum also at order one for p=2. |
| `W1p.norm_value_le`, `norm_gradient_le` | TauCeti/Analysis/Sobolev/W1p/Basic.lean:447,451 | Component norms are bounded by the graph norm. |
| `W1p.ofExponentLE` | TauCeti/Analysis/Sobolev/W1p/Basic.lean:641 | Finite-measure, value-preserving map; a.e. value/gradient laws at 679/688. |
| `Wkp.iteratedGradient_ae_eq_of_contDiffOn` | TauCeti/Analysis/Sobolev/Wkp/Classical.lean:106 | Requires the stated classical smooth representative and its a.e. equality. |
| `Wkp.denseRange_ofTestFunctionₗ_top` | TauCeti/Analysis/Sobolev/Wkp/Density.lean:144 | Whole-space domain and p≠∞; not arbitrary-domain/all-exponent Meyers–Serrin. |
| `enorm_sub_setAverage_le_of_starConvex` | TauCeti/Analysis/Sobolev/Poincare/Potential.lean:216 | C¹ function, star center at the evaluation point, containing ball bound, positive-measure averaging set. README correctly distinguishes this from its new kernel. |
| `W1p0.isCompactOperator_valueL` | TauCeti/Analysis/Sobolev/RellichKondrachov.lean:141 | Zero-boundary space, bounded domain, finite p. |
| `W1p.isCompactOperator_valueL_restrictL` | TauCeti/Analysis/Sobolev/W1p/LocalCompactness.lean:111 | Compact closure of the smaller domain inside the larger, finite p. |

**Headline inventory.** The README identifies averaged Taylor, Bramble–Hilbert, Deny–Lions, affine seminorm scaling, higher-order change of variables and embedding. Its other deep targets are the polynomial kernel, Rellich, and boundary smooth density/continuity. Polynomial potential and kernel are attempted as Lean theorems; Bramble–Hilbert is attempted through admitted maps. Averaged Taylor is only admitted data. Affine scaling/composition and the continuous representative theorem are statable using native carriers and are absent. Deny–Lions/Rellich need a specified Lipschitz-domain predicate, which is absent at the pin and should be named in the module docstring. Boundary density on the inline star-shaped domains is statable through native smooth functions and Wkp value representatives. R10 concerns the missing acceptance coverage, not a demand to reproduce every API theorem.

**Padding probes.** All eight sorried theorems were probed on scratch copies: `injective_evalₗ` closes by the single exact in R13; single simp did not close `finrank_polynomialsDegLE`, `homogeneousComponent_pderiv`, `exists_pderiv_eq`, either norm comparison, `seminorm_top_eq_zero_iff`, or `exists_bramble_hilbert`. A second copy changing only injectivity elaborated successfully. Failure of simp is not a proof of depth; no additional one-tactic padding claim is made.

**Adversarial values.** The table tests every numbered target and the defining conventions. Values for intended maps refer to the README’s formulas; the four admitted bodies cannot themselves be evaluated. In one-dimensional rows, identify E with ℝ. μr denotes ∫yʳφ(y)dy for a fixed normalized smooth, nonnegative, even cutoff supported in (−1,1), so μ0=1, μ1=0 and μ2>0. Domains are open. Constants in inequalities are deliberately left as quantified constants, with the numerical constraint shown. These tests discriminate hypotheses and conventions; they are not general proofs.

| Statement | Instances | Values on the two sides / controls | Result and change |
| --- | --- | --- | --- |
| Euclidean carrier and degree-zero convention | n=0,1,2; m=0 | E₀ has one point; constant-polynomial dimension 1 in each case, choose(n,n)=1 | Consistent; keep zero-dimensional case explicit. |
| Partial/full contraction | u(x)=x², h=3, gradient index 0 and Hessian index 1 | D u=2x; full first contraction=6x; D²u applied once=6; full second contraction=18 | Correct degree and direction; add Checks. |
| Homogeneity of contraction | h replaced by 2h | First contraction 12x=2·6x; second 72=2²·18 | Correct; excludes degree-one scaling of the Hessian. |
| Polynomial evaluation injectivity | q=0,1,X in one variable | At x=0: 0,1,0; at x=1: 0,1,1 | Distinct evaluations distinguish these; general claim supplied by Mathlib. R13. |
| Polynomial dimension | (n,m)=(0,2),(1,2),(2,2) | Bases have 1,3,6 monomials; binomial values 1,3,6 | Pass. |
| Total degree, including zero | m=0; q=0,1,X | 0 and 1 belong; X has degree 1>0 | Pass; does not confuse total degree with per-variable degree. |
| Polynomial Sobolev inclusion/injectivity | Ω=∅ versus (0,1); q=0,1; k=m=0,p=2 | Empty: both images 0. Interval: norms 0 and 1 | R01/R07; add nonemptiness for injectivity and real body. |
| Ball-star hypothesis and ball containment | Ω=∅; Ω=(−1,1), ball radius 1 or 1/2 | Empty: StarConvex=true, ball inclusion=false. Nonempty interval: inclusion=true | Existing nonempty qualification on containment is correct. |
| Comparison with closed-convex-hull convention | x=1/2, Ω=(−1,1), B radius 1 then 1/2 | Closed hull for radius 1 is [−1,1], not contained; for radius 1/2 is [−1/2,1/2], contained | Smaller-radius qualification is necessary and correct. |
| Chunkiness | Ω=(−R,R), ρ=R>0 | diam/ρ=2R/R=2 | Correct dimensionless normalization. |
| 1: truncation identity/composition/value | k=2→1→0, u=x² | Values x²→x²→x²; first derivative 2x; direct 2→0 value x² | Intended API consistent; zero map instead gives 0. R05. |
| 1: seminorms and classical agreement | u=x², Ω=(0,1),p=2,k=2 | Orders 0,1,2: 1/√5, 2/√3, 2; classical fields x²,2x,2 agree | Correct intended definition. |
| 1: p=2 norm comparison | u=x, Ω=(0,1),k=1 | S=√(1/3+1)=2/√3=graph norm; S/√2≤S≤√2S | Pass. |
| 1: graph norm is not always S | u=sin x, Ω=(0,2π),p=∞,k=1 | value and derivative norms 1,1; S=√2; graph norm=sup√(sin²+cos²)=1 | Lower bound is equality; stated √2 comparison passes. |
| 1: polynomial derivative vanishing | q=x², m=2 | Third derivative seminorm 0; second derivative seminorm 2 on length-one interval | Correct threshold; not one order earlier. |
| 1: exponent conversion | u=1, Ω=(0,2), source exponent 2,target 1 | Norms √2→2; factor 2^(1−1/2)=√2; bound 2≤√2·√2=2 | Pass intended inclusion; zero map wrong. R06. |
| 2: homogeneous derivative identity | R=x²+x+1; d=0,1 | d=0: 1=∂x(x); d=1: 2x=∂x(x²) | Index shift correct. |
| 2: Euler integration and closedness | P=(y,x),m=1; wrong P=(−y,x) | First potential xy has gradient (y,x); mixed derivatives 1=1. Wrong field has −1≠1 | Pass; closedness excludes wrong model. |
| 2: degree-zero/empty-index potential | n=1,m=0,P=3; n=0 | Q=3x has derivative 3; empty family admits Q=0, degree≤1 | Pass; denominator d+1 is 1, never zero in ℝ. |
| 3: kernel iff, both directions | Ω=(0,1), m=1; u=x, x² | u=x: top seminorm 0 and polynomial witness x. u=x²: top=2 and no affine witness | Pass for intended derivatives. |
| 3: preconnectedness control | Ω=(0,1)∪(2,3), m=0, u=0 on first,1 on second | Gradient 0 but no global constant; values disagree 0≠1 | Correctly excluded by preconnectedness. |
| 4: quotient and descended seminorm | Ω=(0,1),p=2,m=0,u=x and u=1 | For x: quotient norm √(1+1/12), top seminorm 1; for 1: quotient norm=top=0 | Consistent bounded-domain construction. |
| 4: unbounded polynomial range | Ω=ℝ,p=2,q=1 | ∫|q|²=∞, whereas membership requires finite norm | R08: boundedness or a different subspace required. |
| 5: higher-order composition | F(x)=2x, u=x², Ω′=(0,1),Ω=(0,2) | u∘F=4x²; second derivative 8; chain term 2·2²+2(2x)·0=8 | Correct Faà di Bruno convention; missing weak bridge R03. |
| 6: affine value scaling | Same domains, u=x,p=2,j=0 | Original norm √(8/3); pullback norm 2/√3; 2^(−1/2)√(8/3)=2/√3 | Forward equality; inverse recovers √(8/3). |
| 6: affine derivative scaling | Same, j=1 | Original derivative norm √2; pullback 2; 2·2^(−1/2)√2=2 | Inverse: (1/2)√2·2=√2. Both directions pass. |
| 6: endpoint exponent | Same, p=∞,j=1 | Original norm 1; pullback 2; determinant factor 1, bound 2≤2·1 | Correct exponent-zero convention. |
| 6: geometric operator bounds | Identity, Ω=(0,1), center 1/2 | Radius 1/2: 1≤1/(2·1/2)=1. Radius 0: 1≤1/0=0 | R02; positivity needed. |
| 6: determinant/volume | B=2 on intervals; identity on empty set | Nonempty: 2=2/1. Empty: 1≠0/0=0 | R02; multiplicative formula survives as 0=1·0. |
| 7: affine polynomial invariance | q=x²,F=2x+1,m=2; q=0 | q∘F=4x²+4x+1, degree 2; zero stays zero | Pass. |
| 8: Taylor factorial | u=x²,y=1,x=3,m=2 | T²=1+2·2+(2/2!)·2²=9=u(3); without factorial gives 13 | Correct factorial; add Check. |
| 8: integral remainder | u=t²,y=0,x=1,m=1; step function,m=0 | Smooth: remainder 1=∫₀¹2(1−t)dt. Step: remainder 1 versus derivative integral 0 | R09 separates valid regularity from merely local jet. |
| 9: normalized averaging | m=0,u=1 and u=x | Q⁰1=μ0=1; Q⁰x=μ1=0 | Correct normalization; zero operator fails first test. |
| 9: polynomial reproduction | m=1,u=1,x; m=2,u=x² | Q¹1=1, Q¹x=x; Q²x²=μ2+2xμ1−2μ2+x²−2xμ1+μ2=x² | Pass intended formula. |
| 9: degree restriction | m=1,u=x² | Q¹x²=2xμ1−μ2=−μ2, not x² | Discriminates degree-one truncation. |
| 9: derivative identity | m=2,u=x²,j=0,1 | j=0: gradient 2x=∫(2y+2(x−y))φ; j=1: Hessian 2=∫2φ | Source index shifts agree; j counts gradient index, not scalar derivative order. |
| 9: unrestricted cutoff linearity | m=0, Ω=(0,1),φ=1/x,u=1,v=x−1 | Q(u)+Q(v)=0+0; Q(u+v)=∫1=1 | R04; actual cutoff hypotheses required. |
| 9: L¹ generality | u=indicator of half-ball, m≥1 | ∫|u|<∞; ∫uψ coefficients finite; interior jump derivative is not an L¹ function | R12; source construction includes this input. |
| 10: representation and sign | n=1,m=0,u=x, x=1/2, even cutoff | u(x)−Q⁰u=1/2; averaged segment integral ∫φ(y)(1/2−y)dy=1/2 | Pass; reversed difference would give −1/2. |
| 10: polynomial remainder | u=x²,m=2 | u−Q²u=0; D³u=0, kernel integral 0 | Pass; diagonal kernel can be assigned 0 on a null set for n≥1. |
| 11: low-order Bramble–Hilbert | Ω=(−1,1),m=0,p=∞,u=x,j=0 | Error norm 1; RHS C·2·1=2C | Requires C≥1/2; compatible. |
| 11: derivative estimate/top equality | Same,m=1,u=x² | j=1: error derivative norm 2≤C·2·2=4C; top: 2=2 | Correct exponent and top equality. |
| 11: polynomial exactness | u=x,m=1 | Error 0 in every order; top derivative 0, hence RHS 0 | Intended Q passes; zero Q fails at j=0. |
| 11: potential Lp estimate | n=1,m=0,f=1, Ω=(0,1),p=1,2,∞ | Kernel exponent 0; g=∫1=1; ‖g‖p=‖f‖p=diam=1 | Bound needs C≥1; endpoints consistent. |
| 11: combined graph constant | n=1,m=0,p=2,Ω=(−1,1),u=x,C=1 | Error graph norm √(8/3); CBH=√10, top norm √2, RHS √20 | Bound holds; finite sum and √2 loss point in correct direction. |
| 12: sublinear annihilation | Ω=(0,1),ℓ(u)=|∫u′|,u=x,q=3 | ℓ(u)=1=ℓ(u+3); top L² seminorm 1 | Reduces to 1≤M·CBH; constants annihilated. |
| 12: bilinear annihilation | b(u,v)=(∫u′)(∫v′),u=x,v=2x | b=2; top norm product=1·2=2; replacing either input by a constant gives 0 | Correct subtraction in both variables. |
| 13: compactness, not identity compactness | Ω=(0,π),uN=sin(Nx)/N,p=2,k=0 | ‖uN‖²₀=π/(2N²)→0; ‖uN′‖²=π/2 | Supports correct lower-order direction; full-domain supplier still absent at pin. |
| 14: Deny–Lions on a connected interval | Ω=(0,1),m=0,p=2,u=x or constant | For x quotient norm √(13/12), top norm 1; for constant both 0 | Compatible norm equivalence. |
| 14: disconnected negative control | Two unit intervals; u=0 then1,m=0 | Distance to global constants=1/√2>0; gradient seminorm 0 | Connectedness is essential and present. |
| 15: endpoint p=1 | Ω=(−1,1),k=n=1,u=x | Sup=1; scaled sum=2^(−1)·1+2⁰·2=5/2 | Bound possible with C≥2/5; borderline case retained. |
| 15: p=∞ continuity route | Same domain,u=|x|,k=1 | Sup=1; scaled sum=1+2·1=3; smooth derivative error stays ≥1 | Inequality compatible; claimed norm-density route fails, R11. |
| 15: point evaluation | u=x, x=1/2 on (0,1),p=2,k=1 | Evaluation=1/2, ‖u‖=2/√3, ratio √3/4 | Bounded functional claim has correct domain once representative fixed. |
| 16: dilation neighbourhood and smooth density | Ω=(−1,1),x0=0,t=2,u=x | Closure [−1,1]⊂(−2,2); pullback x/2; W¹,² difference=√(2/3) | For t↓1 difference |1−1/t|√(8/3)→0; finite-p route consistent. |
| 16: boundary continuity and derivative components | u=x²,k=2,p=2,n=1; j=0,1 | Boundary value at 1 is 1; derivative component with v=3 is 6x, boundary value 6 | Correct homogeneity and extension; j≤k should be explicit when formalized. |
| Incidental source check: Brenner–Scott (4.3.14)–(4.3.15) | Ω=(−R,R), u=x, p=2, ρ=R | γ=2; squared full-norm/gradient-norm ratio=1+R²/3→∞ | Source omits diameter dependence; README’s explicit CBH does not repeat this error. |

**Source verification and locators.** All text retrieval used the sources service. The fetched Brenner–Scott PDF identifies the 2008 third edition. Its Q of order r has degree less than r; this README’s degree-m Q corresponds to r=m+1. There is no off-by-one defect in item 9’s derivative identity after accounting for iteratedGradientChain index zero being the first derivative.

| Target(s) | Text opened | What was verified / limit |
| --- | --- | --- |
| Standing ball-star convention | brenner-scott line 4556, Definition 4.2.2, p.96 | Closed hull convention; README explicitly accounts for the smaller-radius change. |
| 8–9 | brenner-scott lines 4421,4435,4484,4503,4517,4523; Definitions 4.1.1/4.1.3 and Propositions 4.1.9/4.1.12/4.1.17, pp.93–95 | Degree, integral normalization, L¹ extension, polynomial range and derivative formula. R09/R12 address hypotheses/generality. |
| 10 | brenner-scott line 4627, Proposition 4.2.8, pp.97–99; proof lines 4646–4737 | Change of variables, determinant power, convex-hull support and kernel bound; source proof divides by dimension, so n=0 needs its trivial separate treatment. |
| 11 | brenner-scott line 4849, Lemma 4.3.6, pp.101–102; line 4935, Lemma 4.3.8, pp.102–104 | Lp potential estimate including p=1,∞; radius condition, diameter power and polynomial degree. Basis-free operator-norm adaptation needs the stated finite-dimensional comparison. |
| 12 | bramble-hilbert line 127, Theorem 2, pp.114–115; standing domain at line 53, p.113 | Bounded linear-functional case and annihilation of polynomials. The README’s sublinear and bilinear versions are consequences, not this source’s literal statement. |
| 14 | bramble-hilbert line 104, Theorem 1, p.114; deny-lions lines 2164–2179, III §2, Definition 2.1/Theorem 2.1, p.366 | Polynomial quotient and top-order seminorm; strong-cone domain and diameter-weighted norm in Bramble–Hilbert; abstract Beppo-Levi quotient completeness in Deny–Lions. Do not attribute the precise modern Lipschitz formulation to an unspecified theorem. |
| 15 | brenner-scott line 4778, Lemma 4.3.1, p.100; line 4831, Lemma 4.3.4, p.101 | Finite 1<p<∞ with k>n/p, and p=1 with k≥n. The displayed continuity proof uses finite-p density. |
| 16 | brenner-scott line 6173, Exercise 4.x.20, p.127 | Related continuity argument under a segment condition; not a claim-level locator for all of item 16. |
| 1–7,13 and remaining subclaims | Pinned definitions and calculations above; README often gives no source locator | Mathematical tests performed. Exact literature-locator certification is incomplete where no locator was supplied; R15. |

## Not verifiable

- **Ciarlet**, The Finite Element Method for Elliptic Problems, 2002, Theorem 3.1.3: SIAM DOI `10.1137/1.9780898719208` returned HTTP 403. Institutional search found bibliographic records, not a readable copy. Its numbering, page and exact hypotheses are not certified. R02 is an independent counterexample to the README, not an allegation about Ciarlet.
- **Dupont–Scott**, Polynomial approximation of functions in Sobolev spaces, 1980: DOI `10.1090/S0025-5718-1980-0559195-7` and the publisher PDF route returned journal HTML rather than the paper. The legal OSTI preprint route timed out. No published theorem number or page was invented. The README gives no target-specific locator.
- **Evans**, Partial Differential Equations, 2nd edition, Chapter 5: the AMS route did not yield the book; author/institutional searches yielded errata and course listings. Chapter text and exact supporting theorems were not certified.
- The supplied seeded sample has no individual target identifiers. All 16 numbered items were examined instead; no claim is made about an unrecoverable random selection.
- Source unavailability does not defer this verdict. All independent mathematical, ownership, dependency, build and signature checks above were completed. The three unread works are consolidated in the required missing-reference file; successful Bramble–Hilbert and Deny–Lions retrievals were removed from that request list.

## Source issues

- **Error** in brenner-scott at Lemma 4.3.14, equation 4.3.15, printed p.104 (brenner-scott lines 5012–5024): the source says a constant depending only on dimension and chunkiness bounds the full Sobolev norm modulo the mean by the gradient seminorm; it should be allowed to depend on domain diameter, or assume normalized diameter; affects a stated result.
