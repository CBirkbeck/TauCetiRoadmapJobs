# PORT-RankOneConverse

Branch `roadmap/rank-one-converse`, head commit `a182f85e` (`RankOneConverse: roadmap (README, Suggested.lean, metadata)`), on top of main `a0ad405`. Files: `TauCetiRoadmap/RankOneConverse/README.md`, `TauCetiRoadmap/RankOneConverse/Suggested.lean`, `TauCetiRoadmap/RankOneConverse/metadata.toml` (`topic = "math.NT"`, the form of the folders on main). Nothing outside the folder changed.

## Build

    ⚠ [9228/9228] Built TauCetiRoadmap.RankOneConverse.Suggested (2.3s)
    Build completed successfully (9228 jobs).

Warnings: 2, both `declaration uses 'sorry'` (lines 69 and 84, the two headline theorems). No other warning.

## Gate

    gate RankOneConverse: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 long-fences=0 round-labels=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

Depcheck (`gate --depcheck … --movable --content`):

    depcheck: 208 roadmaps, 1719 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. RankOneConverse is at merge-order position 352; its latest suppliers are AutomorphicCongruences (349), ModularIwasawaMainConjectures (350) and HeegnerPointEulerSystems (351).

## Draft pull request body

Skinner's p-converse to Gross–Zagier–Kolyvagin, for weight-two newforms of squarefree level and their GL₂-type abelian varieties A_f. Starting from a one-dimensional Bloch–Kato Selmer group over an imaginary quadratic field K with injective localization at the two primes above p, the roadmap proves analytic rank one and finite Sha over K (Theorem B): residual restriction to G_K, the semilocal-image and strict-kernel computation on the rational Galois cohomology, the one-sided anticyclotomic Selmer module with Wan's reverse divisibility and the augmentation obstruction forcing a nonzero anticyclotomic p-adic L-value, and the supplied squared-logarithm and height formulas turning that value into a non-torsion Heegner point and a simple complex zero. Bump–Friedberg–Hoffstein quadratic nonvanishing with locally prescribed discriminants, stated here on the pinned newforms, Fricke signs, analytic ranks and fundamental-discriminant characters, then yields the rational rank-one converses A and A′, the finite-Selmer criterion C and the rank-zero converse E. The construction of Heegner points, heights, p-adic measures, Kummer/Sha carriers, level lowering and Wan's divisibility stay with their owning roadmaps and are consumed as contracts.

## Roadmaps this one depends on that are still pull requests or board packages

SelmerIwasawaCohomology, ArithmeticGaloisDuality, GL2AutomorphicRepresentationsAndTransfer, AutomorphicLFunctionsAndLocalFactors, ModularCurvesPartII, ArithmeticStatisticsPartI, ArithmeticStatisticsPartVI, MetaplecticAutomorphicForms, SerreWeightAndLevelOptimisation, AutomorphicGaloisRepresentations, EllipticCurveModularity, EllipticCurveModularityPartII, GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, HeegnerPointEulerSystems (open pull requests); AutomorphicCongruences (board package #129, head c88704a, merge-order position 349). EllipticCurves, ModularForms and PadicMeasuresIwasawaAlgebras are on main. Every one of these precedes RankOneConverse in the merge order.

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already satisfied the acceptance-test rule: one real-bodied definition (`IsPrimitiveQuadraticTwist`) needed to state the two Bump–Friedberg–Hoffstein headlines (`infinite_twist_analyticRank_eq_zero`, `infinite_twist_analyticRank_eq_one`) on native carriers, no API lemmas, no examples, no sorry'd data, no `set_option`. The docstring lists the other headlines (Layers 0–3, 5–6 and Theorems A, A′, C, E) as not statable and names the missing carrier for each; I re-checked those carriers at the pins (Mathlib f6090c70, Tau Ceti 358314d4): no attached modular abelian variety with Hecke action, no Bloch–Kato Selmer group of V, no odd-p elliptic Selmer group with local Kummer map, no analytic continuation of `WeierstrassCurve.LSeries`, and `ContinuousCohomology.tateShafarevich` needs E(ℚ̄) as a `TopRep`, which does not exist. So nothing was added.

Lean changes, all import-form: `import TauCeti.…` became `public import TauCeti.…` (two modules, both present at the pin), and `@[expose] public section` was inserted before the namespace, the form of the only `module`-system file on main (CoboundaryExpansion) and of the sibling ports. Without `public` the three declarations were invisible to any importer. Statements and docstrings are unchanged.

Signature audit: a scratch `module` file importing `TauCetiRoadmap.RankOneConverse.Suggested` with `#check @name` for all three declarations was elaborated once (`lake env lean`). The elaborated types carry every binder explicitly (`{N} [NeZero N] {k} (f) (hχ : f.χ = 1) (hk : 0 < k) (ε : ℤ) (hε) (S₀) (hS₀) (hN)`, with `M`, `NeZero M`, `g` existential inside the set); there are no section variables, nothing was dropped, and each type agrees with the README §4.1 statement. Nothing changed as a result.

## README changes

- Shape unchanged (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–6 each with Examples and Dependencies, Downstream consumers, Worked examples, References). A missing blank line before `## Layer 3` was added.
- Timeless wording: "derived here … rather than requested" / "are requested" / "is not requested here" in the GL2 and SelmerIwasawaCohomology contracts rephrased as statements of what the suppliers provide; the sentence "is not a headline theorem of the acceptance file" (§1.1) deleted; the References preamble no longer refers to the sources manifest (not part of the roadmap folder) and now says locators name theorem, section and printed page of the linked version; "at the pins"/"at the pin" became "in the pinned library".
- The accepted review's two non-blocking notes (F01: pinned `WeierstrassCurve.LFunction`/`LSeries` and reduction predicates named in the Mathlib contract and the Lean docstring; F02: the Weil-restriction identification clause in `gap:quadratic-abelian-sha`) were already applied in the package text and are kept.

## Supplier replacements and duplication removals

None needed. Every library declaration the README names was found at the pins by grep (file list in the Mathlib and Tau Ceti contracts, all present: `tateShafarevich`, `continuousCohomology`, `WeierstrassCurve.LFunction/LSeries/localPolynomial`, the four reduction predicates, `AbelianVariety`, `Newform` with `isNorm`, `analyticRank`, `frickeSign`, `frickeCompletedL_sub_eq`, `eq_of_forall_notMem_eigenvalue_eq`, `quadraticTwistOf` and its three lemmas, the two formal-group torsion lemmas, `selmerGroup₂`, `fittingIdeal`, `fittingIdeal_baseChange`). Duplication sweep by object over main and the 448 open heads (`roadmaps grep`): Bump–Friedberg–Hoffstein appears only in MetaplecticAutomorphicForms §§8.85–8.87 (kernel exports, final nonvanishing assigned to a "RankZeroOneBSD" that does not exist on main, in the merge order, among the open pull requests or the board packages; CMRankZeroConverse's own Scope says the same) and as coordinates in SiegelModularForms, so §4.1 is the owner; p-converses elsewhere are ModularIwasawaMainConjectures §5.4 (cited in Scope), CMRankZeroConverse §0.1 and RankZeroOneBSDPartII §3.1 (both later in the order; RankZeroOneBSDPartII assigns the irreducible-residual localization criteria to RankOneConverse); the (D,N)=1 elliptic instances are ArithmeticStatisticsPartVI (cited). No open head declares a Lean name colliding with the three here.

## Citations

`roadmaps resolve` on the ported README: one lead, "AutomorphicCongruences §2.22: no roadmap AutomorphicCongruences on main or in an open pull request". False positive: AutomorphicCongruences is a board package (#129), listed in the merge order before this roadmap, and its README at head c88704a has `### 2.22 Wan's ordinary GU(3,1) Rankin–Selberg divisibility` (line 1179) with Wan's Theorems 1.1–1.2 as the contract describes. All other cross-roadmap citations and the three Lean names resolve.

Sources: skinner-2020 Theorems A (p.330), A′ (pp.330–331), B (p.331), C (p.332) and E (pp.351–352) were read from the Annals text and compared clause by clause with §§3.1, 4.3, 4.4, 5.3, 6.2; all match (B(b) "odd prime nonsplit in K" is the source's "inert or ramified in K"). bfh-1990 Theorem (i)–(ii), printed pp.543–544, was read from the scan: f of even weight k, trivial character, level M; S finite containing the primes of M; (i) εD<0, every prime of S split, simple zero at k/2; (ii) εD>0, every prime of S split, nonzero value. The source gives one field per S; the README's infinitude argument (enlarge S₀ by a prime ramified in each previously found field) derives the headline's `.Infinite`.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `infinite_twist_analyticRank_eq_zero` / `_eq_one` versus bfh-1990 Theorem (i)–(ii), printed pp.543–544 (read from the scan) | f weight k even, trivial character, level M; S ⊇ primes of M; sign of twist = ε if D>0, −ε if D<0 when every prime of M splits | εD>0 → twisted sign +1, L(k/2,f,χ_D)≠0 → order 0; εD<0 → sign −1, simple zero → order 1; BFH give one field per S, infinitude by adding to S₀ a prime ramified in each of finitely many found fields (every new field splits there) | matches; D=1 (pinned `IsFundamentalDiscriminant` includes 1) adds at most one element to the value-branch set, infinitude unaffected | none |
| twisted sign formula ε(g)χ_δ(−M₀)=ε(g)sgn(δ) | M₀=11, δ=5: χ_5(11)=(1/5)=1, χ_5(−1)=+1; δ=−4: χ_{−4}(11)=−1 so 11 inert, excluded by χ_δ(q)=1 | +1 and (excluded) | matches README §4.1 Check | none |
| ε(g)=i^k·ε_N(g) via `frickeCompletedL_sub_eq`: Λ_N(k−s)=i^k ε_N Λ_N(s) | k=2, ε_N=−1: ε=+1; k=2, ε_N=+1: ε=−1; k odd: i^k ε_N ∉ ℤ, so `hε` is unsatisfiable and the theorem is vacuous, as S_k(Γ₀(N)) with trivial character is 0 for odd k | ±1; vacuous for odd k | consistent | none |
| `IsPrimitiveQuadraticTwist` at δ=1 and at Δ, δ=5 | δ=1: `ZMod 1` trivial, χ=1, predicate reads a_q(g′)=a_q(g) for q∤M₀M′, g′=g accepted; Δ, δ=5: χ_5(2)=χ_5(3)=−1, τ(2)=−24, τ(3)=252 | demands a₂=24, a₃=−252; Δ fails at q=2 (−24≠24) | matches Checks | none |
| Checks on ramified primes in the headline sets | q∣δ, q∈S₀: `fundamentalDiscriminantChar δ q`=0≠1 | excluded | matches "A definition of splitting by χ≠−1 would wrongly admit ramified q" | none |
| local base-change signs (GL2 contract) | split: (−μ(q))²=1; inert St: −1; inert St⊗ξ: ξ∘Nm=1 so St, −1; ramified St: −1; ramified St⊗ξ: +1; ∞: i·i=−1 | two inert: (−1)(−1)(−1)=−1; one ramified St⊗ξ: (−1)(+1)=−1; one inert: +1 | matches Conventions Checks and skinner-2020 §3 | none |
| Theorem A, A′, B, C, E hypotheses versus skinner-2020 pp.330–332, 351–352 (text extracted) | A: one odd ℓ with π_ℓ=St⊗ξ or two odd special primes; A′: nonsplit at one odd prime or split at two odd primes; B (a)–(e); C (a)–(c) at good ordinary p≥5; E: #A_f(ℚ),#Sha finite ⇒ ord=0 | hypothesis lists compared clause by clause | all match; README B(2) "odd prime nonsplit in K" = source "inert or ramified in K" | none |
| Conventions Euler polynomial on V* and V at q=5, a_q=1 | V*=H¹: 1−T+5T²; V=H¹(1): geometric Frobenius scaled by q⁻¹: 1−T/5+T²/5 | as README | matches | none |
| HT weights | ℚ_p(1) weight −1; H¹ weights 0,1; V=H¹(1) weights −1,0; V*≅V(−1) by the Weil pairing | as README | matches | none |
| logarithmic Euler factor (1+p−a_p)/p | p=5: a_p=1 → 1; a_p=0 → 6/5; zero needs a_p=p+1 > 2√p since (√p−1)²>0 for p≠1 | nonzero | matches | none |
| §0.1 unipotent square | 𝔽₅: (1 1;0 1)²=(1 2;0 1), fixed line (1,0); 𝔽₂: square = I | nonzero / identity | odd p needed, as stated | none |
| §1.1 transport | loc(x)=(x,2x), e(x)=2x, h(y,z)=(3y,3z): h∘loc∘e⁻¹(x)=(3x/2,3x); h(loc 1)=(3,6)=loc′(e 1) | kernel 0 both | matches | none |
| §1.3 dimensions | local χ=−2, h⁰=h²=0 ⇒ h¹=2; finite line dim 1; global h¹−h²=2−4+… = 2, image = h¹−h²=2; h²∈{0,1} ⇒ h¹∈{2,3} | 2 | matches | none |
| §1.4 kernels | diagonal X∩F dim 1; axes on e₁: dim 2; axes on e₂: 0; B(e): 1−1=0 | as README | matches | none |
| §2.1 fibre, weights, involution | n=2: (2,1),(−2,−3); Λ/(γ−a), a=1+p, p=5: γ⁻¹−a=−aγ⁻¹(γ−a⁻¹), a²=36≠1 in ℤ₅; a=1: (γ−1) both | two negative weights; distinct primes | matches | none |
| §2.2 numerics and ring map | p=5, n₀=8: κ=16≥6, 8∣16, 4∣8; γ↦a⁻¹γ evaluated at a gives 1, γ↦aγ gives a² | as README | matches | none |
| §2.4 modules over Λ=O[[t]] | Λ/(t²): char (t²)⊆(t), coinvariants O rank 1; Λ/(t−p): coinvariants O/p rank 0, (t−p)⊄(t)Λ[1/p]; Λ/(p,t): char (1), rank 0; Λ: char 0, rank 1 | as README | matches | none |
| §3.1 orders and Sha | (0,1),(1,0) sum 1; (1,1) sum 2; d=2: 1+1=2; ℤ/5⊕ℚ₇/ℤ₇ finite 5-part, infinite | as README | matches | none |
| §4.1 discriminants | D₀=−7, δ=17: −7≡1, 17≡1 (mod 4), coprime, 17≡1 (mod 8), −119≡1 (mod 8) fundamental; 13≡1 (mod 3) square in ℚ₃, 2 nonsquare unit | as README | matches | none |
| §4.3 negative control | conductor 2q, split types at 2 and q: no odd St⊗ξ, one odd St | fails both alternatives | matches skinner-2020 p.331 remark | none |
| §5.1 torsion | #E(𝔽₅)≤5+1+⌊2√5⌋=10<25; p=3: 7<9; formal group order-p point v(t)≤1/(p−1): 1/4, 1/2, and 1 at p=2 with [2](−2)=(1−2)²−1=0 in Ĝ_m/ℤ₂; ℤ/25 alternating pairing b(ng,mg)=nm·b(g,g)=0 | as README | matches | none |
| §5.2 genus formula | level 1: 1+1/12−1/4−1/3−1/2=0; level 2: 1+3/12−1/4−0−1=0 | 0, 0 | matches | none |
| §6.1–6.2 orders | ε(f)=+1, ε(f/K)=−1 ⇒ ε(f⊗χ_D)=−1, δ>0; ranks 0+d; orders 1−1=0; (2,1) would give 3≠1 | as README | matches | none |

## Unresolved

- Ownership against open pull requests was checked through the tool index (448 open heads) and the sibling checkouts; no further open pull requests were named without files.
- The GitHub API was rate-limited for part of the job; the gate and the board-package fetch were run after the reset and both succeeded.
- No suspicious instructions were found in any text read.


Pull request: #1805 (roadmap/rank-one-converse at a182f85)
