<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6790238604 -->
Review (codex) of 0366dd7

Verdict: needs_changes

1. **F01** (P2) Retain the cohomological shift and use the global reduced motive

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:878`, “the reduced cohomology of `ℙ¹`, which by ball invariance is that of `G_m`”, followed by the identification with `Ḡ_m`. The same unrestricted reduced-unit identification occurs at line 650.

   **Claim:** The projective-line duality route works for arbitrary small arc-stacks using the displayed cohomology identification and the reduced multiplicative group.

   **Witness:** At the complex point, reduced cohomology is `ℤ[−2]` for `ℙ¹` and `ℤ[−1]` for `G_m`. They differ by `[−1]`. Section 3.2 defines `Ḡ_m` only on the nonarchimedean locus.

   **Exact repair:** Keep the theorem for arbitrary `X`. In the route, state that reduced cohomology of `ℙ¹` is reduced cohomology of `G_m` shifted by `[−1]`. Compute the latter using maps from `cofib(ℤmot[∗] → ℤmot[G_m]) = ℤ(1)[1]`, valid over every base by §3.4. Identify this cofibre with `Ḡ_m` only on the nonarchimedean locus. Use the same global cofibre in the sign explanation at line 650, or explicitly restrict that explanation to the nonarchimedean locus and give the complex-point sign separately. Scholze line 2152 explicitly retains the shift; Scholze line 1444 returns to arbitrary bases for the Tate definition.

   **Repair tested:** Over `ℂ`, the cofibre is `ℤ[1]`; its dual is `ℤ[−1]`, and shifting again by `[−1]` gives `ℤ[−2]`. For coefficients `ℤ(1)[2]`, reduced projective-line cohomology is `ℤ[−2] ⊗ ℤ[2] = ℤ`, as the counit needs. Also the swap on `ℤ[1] ⊗ ℤ[1]` is `−1`, whereas the swap on the Tate object `ℤ ⊗ ℤ` is `+1`. On a nonarchimedean base the same cofibre is `Ḡ_m`, recovering the intended calculation. This repair preserves both archimedean and nonarchimedean cases.

2. **F02** (P3) Give the new Laurent completion its definition API

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:149`, “let `A((T))_{1/2}` be the completion of the Laurent polynomial ring”.

   **Claim:** Section 0.3 introduces a new completed Banach algebra, now used by §0.5, with the required definition apparatus.

   **Witness:** Lines 149–159 contain the definition, route, three Checks and Needs line, but no API bullet list. The functor on contractive base maps and its identity/composition laws are not stated.

   **Exact repair:** Add an API list in §0.3: the contractive structure map and distinguished inverse-compatible unit; the unique contractive extension to a complete Banach `A`-algebra equipped with a unit `u` satisfying `|u| ≤ 1/2` and `|u⁻¹| ≤ 2`; and the coefficientwise map induced by every contractive `A → B`, fixing `T`, with identity and composition. Retain the three existing discriminating Checks. Keep this construction in the README, not in `Suggested.lean`.

   **Repair tested:** For `A = B = ℂ`, the induced identity fixes every coefficient and `T`; evaluation at `u = 1/2` has inverse norm `2` and sends `1 + 2T` to `2`, with `|2| = 2 ≤ 2`, its sum norm. The coefficientwise composite sends `Σ a_n Tⁿ` to `Σ g(f(a_n)) Tⁿ`, equal to the map of `g ∘ f`. The zero-ring exclusion and its existing Check remain valid.

Two findings: one P2 and one P3; one blocking. The seven previous findings are mathematically repaired. The remaining changes concern a proof route and the API of a newly introduced definition; neither requires narrowing a headline theorem. The package inputs were not edited.

## Verified sound

### Previous findings, individually checked

All locations in this table are in `packages/MotivesAndAlgebraicCyclesPartII/README.md`. No previous finding was marked not actionable. The earlier mathematical failures are not being re-raised.

|Previous finding|Repaired passage|Assessment and computed witness|
|---|---|---|
|F01, analytic reduction before the strict basis|149: “`A → A((T))_{1/2}` is an arc-cover”; 184: “first pass to the analytic cover”.|Repaired mathematically. Trivially valued closed `k` has only nonzero norm `1`; the new cover has `|T| = 1/2`, inverse norm `2`, and its completed algebraically closed residue is nondiscrete. R02 is the new definition's API omission.|
|F02, nonadditive constant presheaf|582: “`F(B) = Hom(ℤ[Marc(B)], ℤ/ℓ)`”.|Repaired. Values on `0`, `C`, `C × C` are `0`, `ℤ/ℓ`, `(ℤ/ℓ)²`. A correspondence of degrees `(1,2)` acts by `(1,2)` on the components. The constant presheaf is now explicitly rejected.|
|F03, integral objects rationalized|1242: “its constant term is integral and its augmentation ideal `tℚ[t]` is rational”.|Repaired in §§11.5 and 11.6. For `p = 3`, `A = ℤ/2`, the coaction has constant term `id_A` and all positive terms zero. The underlying object is `ℤ/2`, not `0`.|
|F04, division by a zero coefficient|483: “over the indices `1 ≤ i ≤ n` with `a_i ≠ 0`”.|Repaired. For `T² − 1`, the minimum runs over `{2}` and equals `1`; the maximum is also `1`. For `T + a₀`, both extrema are `|a₀|`.|
|F05, reversed nearby-cycle pullback|1144: “the pullback map `g_* ℤ → g_* h_* ℤ = f_* ℤ`”.|Repaired, including §10.3. One point into two induces `(a,b) ↦ a`. The augmentation uses the inverse only after proving this map an equivalence.|
|F06, perfectoid tensor-product citation|186: “PerfectoidSpaces §P2.13”.|Repaired in the contract and Layer 0 dependency block too. Main §P2.13 at line 7391 supplies perfectoid completed tensor products. For `B = C = A`, the pushout is `A`. The distinct rational-localization use still cites P2.3.|
|F07, missing tilt and KH APIs/Checks|616: “A map `φ : Y → X` … induces `φ♭`”; 792: “induces a map of cofibre sequences”.|Repaired. Each definition has its API and at least three Checks. Characteristic-`p` perfectoid fields tilt to themselves; `ℂ_p` tilts to characteristic `p`. For `ℚ₃`, KH-cofibre rank is `ℤ`, whereas the fibre has `π₀ = ℤ × ℤ/2`; field products have rational rank `ℚ²`.|

The repair-pattern search covered residue closures and analyticity in Layer 0; additivity, empty values and disconnected bases in Layer 4; all root-extremum formulas; every use of integral/rational rank and the KH comparison in Layers 6–7; tilting in Layers 4 and 8; all displayed nearby-cycle comparison arrows in Layers 10–11; and all uses of `Ḡ_m`, Tate shifts and rational monodromy. R01 arises from the last of these searches. The previous computed tests remain applicable to unchanged cancellation, finite-characteristic rigidity, mixed Tate nonexamples, mapping formulas and v-stack comparisons. Unchanged targets not supported by an earlier computed row were read and tested anew; the working ledger covers all 80 numbered targets.

### Principles and shape

The package develops the general integral theory over archimedean and nonarchimedean Banach rings. Its nonarchimedean restrictions are attached to constructions that require them; R01 identifies the places where that distinction was lost in an explanation. No good-prime restriction, computational algorithm, sorry'd data, `set_option`, forbidden supplier, copied source paragraph or re-planning of the base roadmap was found. The base roadmap's finite correspondences and Nisnevich motives are imported; the étale and Banach arc constructions are new here.

The 13 layer headings name mathematics, with Examples and Dependencies at each layer, and all 80 numbered targets have Needs lines. The organization explains the two branches after cancellation: Layer 7 uses K-theory, while Layer 8 constructs stable motives and six operations; Layer 12 branches from the torsion and rigidity results. No source-following declaration or source-chapter heading remains. Main EnhancedDerivedSheaves, PerfectoidSpaces and SchemeAndStackFoundations were read for the house shape. Apart from R02, the explicit definition blocks have API and Check lists. Backticked mathematical notation is distinguished from claimed Lean declaration names; there are no own Lean identifiers claimed to be declared by the empty acceptance file.

No machine path, job identifier, pull-request number, HTML anchor, LaTeX delimiter or executable procedure was found in the roadmap or Lean file. `metadata.toml` contains the mathematical topic. The six referenced works have six manifest keys; none was rewritten or duplicated. BLR remains settled as uncertified. No fetch or new missing-reference request was needed.

### Seeded source sample

The cached legal Scholze v3 text was opened at every sampled locator, including proof passages used as routes. Page numbers below are the printed/internal pages of that version, not a different published pagination. No author-flagged unresolved locator was found beyond the settled BLR background citation.

|Target|Locator and source lines opened|Hypotheses and support|
|---|---|---|
|0.1 Compact assembly|Definition 2.7, Remark 2.8, Proposition 2.9, pp.9–10; Scholze line 367 through line 400.|Presentable category, finite limits commuting with filtered colimits, generation by compact-transition sequences. The result is for seminormed rings; completion does not transfer it to Banach rings.|
|0.3 Uniformization and geometric covers|Examples 3.4–3.8, Proposition 3.9, pp.15–16; Scholze line 658 through line 694.|Nonzero input for the prescribed-norm Laurent cover; separated uniform completion, perfection with rescaled norms, and complex/real comparisons. The repaired analytic reduction corrects Example 3.6's missing qualification.|
|1.1 Finitary hypersheaf criterion|Theorem 4.1, Remark 4.2, p.19; Scholze line 791 through line 809; Lemmas 4.7–4.9, pp.20–22, Scholze line 867 through line 935.|Strict rings, finite-product and filtered-colimit preservation; positive abelian cohomology vanishes. Compactly assembled coefficient categories are explicitly included.|
|1.4 Finitary maps and open immersions|Definitions 4.21–4.22, Lemma 4.23, pp.24–25; Scholze line 1037 through line 1066.|The condition is a relative cartesian square. Stability, cancellation, slice colimits, and both implications of the finitary-monomorphism/open-immersion criterion agree.|
|1.6 Left adjoints and excision|Propositions 4.24–4.25, pp.25–26; Scholze line 1067 through line 1091.|Finitary maps, open/closed complement, projection formula for the left adjoint; the threshold at `|2| = 1` is as stated.|
|2.1 Effective motives|Definitions 5.1–5.2, Lemma 5.3, Corollaries 5.4–5.5, pp.26–27; Scholze line 1107 through line 1142.|Ball invariance for every Banach test ring; strict/geometric testing and closure under colimits. Dimension bound is `3`, with complex disc dimension `2` and nonarchimedean bound `1 + 2`.|
|3.2 Reduced multiplicative group|Definition 5.15 and adjacent discussion, p.32; Scholze line 1365 through line 1373.|Nonarchimedean locus and quotient in arc-sheaves, not pointwise presheaf quotient. The scope here is correct; R01 concerns later uses.|
|4.8 Torsion and residue characteristics|Corollary 6.6, Theorem 6.7, p.39; Scholze line 1649 through line 1668.|`|n| ≥ 1` everywhere for the iff; norm-smallness for the first `p` claim, pointwise non-smallness for the torsion comparison. The extension via spectral uniformization is justified by §0.3.|
|6.1 Motivic K-theory|Definition 8.3, Proposition 8.4, pp.44–45; Scholze line 1872 through line 1889.|Connective K-theory, spectrum-valued universal ball-invariant arc-sheaf, finitarity, E∞ structure. The route uses group completion and its declared animated resolution supplier.|
|6.3 Rational splitting|Proposition 8.5, Corollary 8.6, pp.45–46; Scholze line 1894 through line 1942.|Rational coefficients; nonnegative Tate weights, separated filtration, eigenvalues `2ⁿ`. The finite-stage projectors have nonzero rational denominators.|
|7.4 Root-free KH-cofibre|Theorem 8.13 and preceding discussion/proof, pp.49–50; Scholze line 2064 through line 2090.|Analytic nonarchimedean Banach rings; Postnikov hypothesis for arc-hyperdescent; KH avoids the root hypothesis. The package compares with its `E_K` only where that object is defined. The source's idempotent-ideal wording is recorded below.|
|9.1 Geometric compact generators|Proposition 10.1, p.53; Scholze line 2215 through line 2245.|Nondiscrete algebraically closed Banach field; equal characteristic and a residue-field splitting for the displayed smooth-projective generating family.|
|9.6 Relative rigidity|Proposition 10.3, pp.54–55; Scholze line 2263 through line 2314.|Analytic affine finite cohomological dimension, or the stated qcqs geometric-point quotient condition. Rigid is not replaced by compactly generated.|
|10.1 Integral étale motives|Remark 11.2, p.57; Scholze line 2401 through line 2404; neighboring qualification at line 2392.|Smooth schemes, étale descent, affine-line invariance and Tate stabilization. The transfer-free presentation and shift agree; the later comparison is restricted to algebraically closed fields.|
|11.1 Nearby cycles|Construction preceding Definition 11.3, pp.58–59; Scholze line 2442 through line 2466.|Completed algebraic closure of `k((T))`; chosen pseudouniformizer and compatible prime-to-residue-characteristic roots; module-category description and extension of scalars. The repaired pullback direction corrects the printed reversal.|

The repaired root calculations were also checked against Scholze line 1465 through line 1477; transfers against line 1500 through line 1506; effective tilting against line 1669 through line 1683; the integral band/monodromy passage against line 2557 through line 2583. The proof of projective duality was opened at Scholze line 2132 through line 2154, which supplies the missing shift in R01. Earlier source-checked targets with computed rows were not treated as newly unread merely because the sample changed.

### Computed adversarial table

The table includes all 15 sampled targets, every headline family, the repaired constructions and all targets touched by a finding. Values are tests of the statements and conventions, not proofs of the general results.

|Statement|Instances tried|Values computed on both sides|Result / change|
|---|---|---|---|
|0.1 compact maps|Radius `1`, stages `1 + 1/n`, `n ≥ 1`|Stage norm of `T` is `1 + 1/n > 1`; colimit norm is `1`. A radius-2 source lifts; the radius-1 identity does not.|Correct direction and noncompact identity.|
|0.3 analytic cover|Trivially normed algebraically closed `k`; zero ring|Original nonzero norms all `1`; cover has `|T| = 1/2`, `|T⁻¹| = 2`. Zero ring gives `|T| = 0` and empty spectrum.|Mathematical repair sound; R02 adds the API.|
|0.3 norm and extension|`f = 1 + 2T` over `ℂ`, evaluation `T = 1/2`|Sum norms of `f,f²` are `2,4`; supremum norms are `1,2`. Evaluation gives `2`, bounded by sum norm `2`.|Excludes the incorrect supremum norm; R02 repair tested.|
|0.5 strict cover|Trivial `k`, then Laurent cover and completed residue closure|Before reduction no norm in `(0,1)`; afterward `T` has norm `1/2`, singleton algebraically closed residue is nondiscrete.|F01 repaired.|
|1.1 strict hypersheaves|Zero ring, strict point, two points|Abelian values `0`, `F(C)`, `F(C)²`; positive cohomology at strict point `0`. Annulus Kummer `H¹ = ℤ/ℓ` gives the non-strict control.|Product and strictness hypotheses discriminate.|
|1.4 finitary/open iff|`a = 0`; `a = 1,r ≤ 1`; `{0} ⊂ [0,1]`|Loci are whole, empty, and a closed nonopen point. Identity square cartesian; last monomorphism is not finitary.|Both directions tested.|
|1.6 excision|`j:(0,1] → [0,1]`|Stalks at `0`: `0 → ℤ → ℤ`; at `1`: `ℤ → ℤ → 0`. Norm of `2`: `2`, `1/2`, `1` over `ℂ,ℚ₂,ℚ₃`.|Variance and archimedean threshold correct.|
|2.1 effective motives|Complex disc; nonarchimedean disc; `1+aT`|Dimension bounds `2+0=2 ≤ 3`, `1+2=3`; nonconstant unit has class `1` in reduced units.|Ball invariance differs from invariance of raw units.|
|3.2 reduced units|Over `ℂ₃`: `1+3`, `3`, `−1`|Classes have respectively residue/value `(1,0)`, value `1`, and residue `2 ≠ 1`; only the first is killed.|Retains both residue units and value group.|
|3.5 root extrema|`T²−1`; `T+a₀`; `T²+T/2+4` over `ℂ₂`|Extrema `(1,1)`, `(|a₀|,|a₀|)`, `(1/8,2)`. For the last polynomial, annulus coefficient bound `min(4,1)=1 < 2`; `max(4,1)=4 > 2` would admit it.|Zero-coefficient repair and annulus correction verified.|
|4.6 additive negative control|`0,C,C×C`; characteristic-`ℓ` disc|Values `0,ℤ/ℓ,(ℤ/ℓ)²`; field Artin–Schreier cokernel `0`, disc class `T ≠ 0` since the required fractional-exponent chain is infinite.|F02 repaired, residue-prime inversion essential.|
|4.8 norm versus spectrum|Rounded norm on `ℤ₂`|`‖2‖=1`; `‖2ⁿ‖^(1/n) → 2^(−1/2)<1`; uniformized norm `2^(−1/2)`.|No false equivalence of norm-smallness and pointwise smallness.|
|4.8 torsion headline|Residue exponents `2,3,1`; complex point|Unit coefficients `ℤ[1/2],ℤ[1/3],ℤ`; bad-prime torsion `0`, prime-to-characteristic unit `ℤ/n`, complex integral unit `ℤ`.|Integral generality retained.|
|4.9 and 8.3 tilting|Characteristic-`p` perfectoid field; `ℂ_p`; empty stack|Characteristic-`p` field unchanged; `ℂ_p` changes characteristic with the same `μ_n` for `(n,p)=1`; `p`-torsion motives `0` on both; empty remains empty.|F07 repaired; naive characteristic-`p` restriction would be empty.|
|5.1 permutations|Complex point, tensor powers `0,1,2`|Identity for powers `0,1`; Tate swap `+1`, reduced free motive `ℤ[1]` swap `−1`.|R01 replaces the unrestricted `Ḡ_m` shorthand.|
|5.3 cancellation headline|Complex point; empty base; prime-to-`p` torsion|Tensoring by `ℤ` is identity; zero category maps `0→0`; tensoring by `μ_n` has inverse its dual.|No failed boundary instance.|
|6.1 Kmot headline|`ℂ₂,ℂ₃,ℂ`|Motivic rank groups `ℤ[1/2],ℤ[1/3],ℤ`; an integral rank retraction in the first two cases would solve `2r=1` or `3r=1` in `ℤ`. Complex rational `π₂=ℚ`, versus `0` for a rank-only sheaf.|Correct spectrum and localized rank.|
|6.2 flag input|Cyclic `Σ₂`, nonabelian `Σ₃`|Character traces on classes `(2,0)` and `(6,0,0)`; averages `1` and `1`.|Invariant subspace is the degree-zero line.|
|6.3 Adams splitting headline|Weights `0,1,2`|Eigenvalues `1,2,4`; denominators `3,−2,6`; three projectors give `(1,0,0),(0,1,0),(0,0,1)`.|Denominators nonzero and ordering correct.|
|7.1 root hypothesis|`ℚ_p` versus closed valued field|`pℤ_p/(pℤ_p)²=𝔽_p≠0`; in divisible valuation case `I²=I`.|KH extension genuinely differs from the root-dependent construction.|
|7.4 KH-cofibre|`ℚ₂,ℚ₃`, closed `C`, `C×C′`, zero ring|Cofibre `π₀=ℤ`; fibres `π₀=ℤ`, `ℤ×ℤ/2` respectively. Closed-field rational rank `ℚ`, product `ℚ²`, zero `0`.|F07 repaired; orientation distinguished at `p=3`.|
|7.4 source's ideal wording|Field `k`, unit ideal `I=k=I²`|`KH₀(k)=ℤ`, `KH₀(k/I)=0`; quotient by an idempotent ideal is not generally invisible.|Source issue only; package uses excision instead.|
|7.6 explicit K headline|Strict field, residue exponents `2,3,1`; empty strict ring|`π₀ E_K[1/p]=ℤ[1/2],ℤ[1/3],ℤ`; empty value `0`.|No excluded residue characteristic.|
|8.2 projective duality|Complex point|Reduced cohomology: `ℙ¹ → ℤ[−2]`, `G_m → ℤ[−1]`. Correct full duality: `(ℤ⊕ℤ[−2])[2]=ℤ[2]⊕ℤ`.|R01 restores the missing shift; headline remains true.|
|8.5 and 9.4 six operations|Identity; finite two-point map|Identity has dimension `0`; `f_*(M,N)=M⊕N`, tensor gives `(M⊗P)⊕(N⊗P)` on either side.|Restricted construction precedes general proper projection.|
|9.1 geometric rigidity headline|`D(ℤ)`|`ℤ` compact/dualizable; identity of `⊕ℕ ℤ` factors through no finite partial sum, so it is neither compact nor dualizable.|Compact objects distinguished from arbitrary objects.|
|9.6 analytic rigidity headline|Two complex points; `[0,1]`|Category of two points is `D(ℤ)²`; `j_!ℤ` for `(0,1]` has nonzero stalks but global sections `fib(ℤ→ℤ)=0`.|Rigid is not replaced by generation by the unit.|
|10.1 integral étale presentation|`A¹`, `ℙ¹`, characteristic `p`|Motives `ℤ`, `ℤ⊕ℤ(1)[2]`; étale Artin–Schreier gives `ℤ/p=0`, whereas Nisnevich `k×/p` contains `[t]` for `k=𝔽_p(t)`.|Transfer-free étale category distinguished from Nisnevich motives.|
|10.2 rigidity input|`𝔽̄₃,n=2`, and `n=3`|`μ₂=ℤ/2`, field `H¹=0`; at `n=3` motive category `0` but `D(ℤ/3)≠0`, with nonzero Artin–Schreier class on the line.|Earlier coefficient-2 repair retained.|
|10.4–10.6 mapping/comparison headline|`ℙ¹,j=1`; `Spec 𝔽̄_p`|`π₋₂=K₀^(1)(ℙ¹)_ℚ=ℚ`, `π₀=0`; finite-field rational weight-zero value `ℚ`, other weights `0`, prime-to-`p` torsion survives.|`[−2j]` and integral comparison consistent.|
|11.1 nearby-cycle construction|First point into two; `π=T`|Pullback `ℤ²→ℤ` is `(a,b)↦a`; normalized valuations of `T,T^(1/n)` are `1,1/n`, giving a nonzero rational comparison.|F05 repaired.|
|11.5 integral band|Colimit of `R[x_n]`, `x_n↦m x_nm`|Degree zero `R`; degree `d≥1` is `ℚt^d`; reduced cobar gives rational degree-one cohomology, while `H⁰=R`.|F03 repaired in both band passages.|
|11.6 and 11.8 monodromy headline|`ℤ/2` at `p=3`; rational two-step object|Integral object `ℤ/2≠0`, rationalization `0`, coaction `id⊕0`. Two-step operator `N≠0,N²=0`; scalar `1` has every iterate `1`.|Integral underlying objects and local nilpotence both retained.|
|12.3 overconvergence headline|Constant sheaf; extension by zero; `n=1`|Specialization `id:ℤ/n→ℤ/n`; `0→ℤ/n` fails for `n>1`; for `n=1` it is `0→0`.|Both directions and zero coefficient tested.|
|12.4 retract|Point and general full inclusion|At point both functors identity; generally `RI=id` and `(IR)²=IR`.|Retract conclusion does not assert compact generation of the retract.|

### Pinned library audit

The actual pinned files were opened, including the hypotheses surrounding declarations. No library same-object result was left as a new Lean target. Searches by Berkovich/arc-site, K-theory spectrum, stable/presentable category, unit-ball ideal, restricted series and cohomological dimension found elementary carriers and the imported analytic algebra, but not the motivic carriers required by the headlines. Tau Ceti's rank-one adic subspaces of polydiscs are narrower than the arbitrary Banach-ring spectrum/site, and its ordinary triangulated stable categories are not the stable ∞-categories needed here.

|Declaration opened|Pinned file and line|What the native declaration supplies, and what it does not|
|---|---|---|
|`CategoryTheory.GrothendieckTopology`|`Mathlib/CategoryTheory/Sites/Grothendieck.lean:72`|Sieves with maximal-sieve, pullback and transitivity axioms; no Banach site or enhanced sheaf category.|
|`NormedField`|`Mathlib/Analysis/Normed/Field/Basic.lean:155`|Field with multiplicative norm and metric; completeness and nontrivial valuation are separate assumptions.|
|`IsUltrametricDist`|`Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47`|Strong triangle inequality on distance; no completeness or separation is added by this predicate.|
|`SSet.Quasicategory`|`Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41`|Inner horn filling; no stability or presentability.|
|`continuousCohomology`|`Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131`|Homology of homogeneous continuous cochains for `TopRep`; does not itself give the motivic geometric-point comparison.|
|`PowerSeries.IsRestricted.subring`|`Mathlib/RingTheory/PowerSeries/Restricted.lean:90`|Restricted series subring under the ultrametric hypothesis; complete-field and positive-radius conditions enter the PID theorem.|
|`Subring.unitClosedBall`|`TauCeti/Analysis/Normed/Ring/Ultra.lean:84`|Closed unit-ball subring for an ultrametric seminormed ring with norm-one class.|
|`TauCeti.unitBallIdeal`, `TauCeti.mem_unitBallIdeal`|`TauCeti/Analysis/Normed/Ring/UnitBall.lean:90`, line 101|Ideal of elements of norm `<1` in that closed ball. The package separately treats the zero ring.|
|`TauCeti.norm_inverse_one_sub`, `TauCeti.norm_inverse_one_sub_sub_one`, `TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt`|`TauCeti/Analysis/Normed/Ring/UnitBall.lean:160`, line 171, line 185|Ultrametric normed ring, norm-one class and summable geometric series; inverse estimates exactly as imported.|
|`TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`|`TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean:115`|Complete ultrametric normed field, positive radius; no nontrivial-valuation hypothesis.|
|`TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`|`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146`, line 151|Dimensions in `ℕ∞`.|
|`TauCeti.cohomologicalDimensionAt_le_of_isClosed`|`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClosedSubgroup.lean:80`|Closed subgroup bound for compact totally disconnected groups, including infinite dimension.|
|`TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`|`TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Strict.lean:181`|Compact-group strict bound; `1+1=2` gives the disc input, and `∞+1=∞` is included.|

### Suppliers, ownership and overlaps

The board-package index was read before any absence assessment. The source-of-truth distinction was respected: main for existing suppliers, supplied open heads for new roadmaps. The `roadmaps show`, `roadmaps grep` and `roadmaps resolve` services were used. A fresh resolver found no missing cross-roadmap citation or Lean name; its notice that it could not check pinned Lake packages does not substitute for the direct pinned-file audit above.

Representative resolutions, together with the complete named section families checked in the contracts:

|Supplier|Resolved location and consumed object|
|---|---|
|TropicalAndBerkovichArithmetic, new roadmap #1494|`TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:189` (§0.1); lines 396, 494, 722, 774 (§§0.12,0.16,0.24,0.27); §§0.7–0.8,0.13–0.15,0.17,0.20–0.22,0.25–0.26,0.28,0.30,0.32,1.1–1.3,1.6,3.7 resolve to the spectrum, Banach algebra, disc and slope inputs. The projective tensor norm in §0.16 is ℓ¹ in the archimedean setting.|
|EnhancedDerivedSheaves, main|`TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1732` (E5:presentability.4); E0.4, E1.3, E2.1–E2.7, E3.2, E3.4, E5:abstract.1–5, E5:presentability.2–4, E5:descent and E5:animation supply the named generic carriers. Main E2.7 at line 2377 distinguishes hypercompletion from Postnikov completeness. Its open revisions are not substituted as suppliers.|
|AnalyticStacks, new roadmap #1687|`TauCetiRoadmap/AnalyticStacks/README.md:209` (§0.5), line 230 (§0.6), line 468 (§1.5); §§0.4,0.9–0.10,1.1–1.4 also resolve. The flat Hopf-algebra/counit Tor-amplitude hypothesis is retained. At line 1302 its downstream contract explicitly leaves the motivic operator identification to this roadmap.|
|GeneralAlgebraicKTheory, new roadmap #1212|`TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:418` (§3.2), lines 1615,1738,2267,2929,2939,3027 (§§8.3,8.10,10.10,13.4,13.5,13.8c): ring/nonunital K-theory, Tor-unital excision, Bass spectrum, continuity and finite-field computation.|
|GeneralAlgebraicKTheoryPartII, new roadmap #1742|`TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:336` (§1.2) supplies additive group-completion K-theory. Its §9.5 at line 2287 imports the KH model from SchemeKTheoryOperations as a gap; it does not already own the missing integral KH theory requested here.|
|SchemeKTheoryOperations, new roadmap #1229|`TauCetiRoadmap/SchemeKTheoryOperations/README.md:717` (§2.6), §§3.1,3.3,3.4,3.8,6.4,6.8,6.11. The general derived-closed-fibre excision appears within §3.8, despite its Witt heading; line 2795 gives the trivial-conormal weight shift. The KH and valuation-ring contracts are kept explicit.|
|KTheoryFiniteLocalFields, new roadmap #1281|`TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:267` (§1.5), line 284 (§1.6), line 398 (§2.1). Section 6.5 at line 1350 is a local-field statement with a degree-one valuation quotient; it does not supply the declared algebraically closed `O_C` gap.|
|RefinedTraceMethods, new roadmap #1493|`TauCetiRoadmap/RefinedTraceMethods/README.md:1907` (§4.10) and line 2393 (§4.20): multiplicative K-theory and continuous K-theory of almost modules. The latter keeps flatness/idempotence and explicit root-colimit hypotheses; this package's uniform root case supplies them.|
|JacobianChallenge, main; AnabelianGeometryAndNonabelianChabauty, new roadmap #1021|`TauCetiRoadmap/JacobianChallenge/README.md:121`, line 284, line 434: divisor/Picard/multiplication inputs. `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4003` is the reduced-boundary generalized Jacobian in characteristic zero; §4.3 here states its arbitrary-characteristic pointwise variant.|
|PerfectoidSpaces, main|`TauCetiRoadmap/PerfectoidSpaces/README.md:7391` is P2.13. P1.4, P1.19–P1.22, P1.27, P2.3, P2.7, P2.12 and P3.20 are the distinct tilt, untilt, localization, almost-acyclicity and étale-site inputs.|
|DiamondsAndVStacks, new roadmap #820|`TauCetiRoadmap/DiamondsAndVStacks/README.md:1730`, line 1907, line 2449, line 4243, line 6367, line 6550, line 8660, line 8830 resolve D0.22,D0.23,D1.4,D2.7,D4.7,D4.9,D6.1,D6.3. `Perf.Spd` is a supplier's planned name in D6.1, not a nonexistent pinned declaration: the initial scan's lead is not a finding.|
|DiamondEtaleCohomology, new roadmap #922|`TauCetiRoadmap/DiamondEtaleCohomology/README.md:580`, line 622, line 786, line 909, line 1237, line 1339, line 1367, line 1567, line 2931 resolve C0.19,C0.24,C2.2,C2.12,C4.5,C4.13–14,C6.1,C9.8. Coefficient invertibility and bounded dimension are retained where used.|
|DiamondSixOperations, new roadmap #927|`TauCetiRoadmap/DiamondSixOperations/README.md:541`, line 768, line 829: S2.4, S4.2–S4.3, with eligible maps and prime-to-`p` coefficients.|
|MotivesAndAlgebraicCycles, new roadmap #1313; MotivicEtaleKTheory, new roadmap #1470|`TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:559` through line 888 resolve §§4.1–4.18; its scope is Nisnevich motives. `TauCetiRoadmap/MotivicEtaleKTheory/README.md:282` supplies §2.2's rational higher-Chow/Adams-weight comparison. Neither is re-planned.|
|AdicCoefficientsAndComparisons, new roadmap #965|`TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:1733`, L5 `smoothAlterationPair`; retained finite extensions and smooth normal-crossing boundary feed §9.1.|
|ProfiniteCohomology, main|`TauCetiRoadmap/ProfiniteCohomology/README.md:2645` (§10.2), line 2919 (Layer 11); continuity and the dimension theory. Actual bound declarations are checked at the pin above.|
|SchemeAndStackFoundations and EtaleCohomologyFoundations, main|`TauCetiRoadmap/SchemeAndStackFoundations/README.md:4029` (§2.16); `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504`, line 540, line 629 (F.2.1,F.2.3,F.3.0): Tsen, torsion proper base change, invertible-coefficient smooth acyclicity and geometric dimension.|
|RepresentationTheory/LieGroups, CharacteristicClasses and MorseNovikov, main|LieGroups Layer 8 supplies flag/Bruhat inputs; `TauCetiRoadmap/CharacteristicClasses/README.md:1380` identifies the Euler integral with `χ(G/T)=|W|`; `TauCetiRoadmap/MorseNovikov/README.md:1185` supplies Lefschetz counts. Applied to `U(n)/T`, compactness and connectedness hold.|

The supplied overlap report contains no changed competing head, dropped cited id, revision-only id or broken old numbering. The standalone fresh `roadmaps overlaps` command could not recompute package overlaps because this package is not itself on main or an open content pull request; the supplied package overlap evidence was used instead. Its closest heads were inspected: ArcTopologyAndDescent #1755 owns scheme arc-descent (`TauCetiRoadmap/ArcTopologyAndDescent/README.md:8`), AnalyticStacks owns the generic formalism and assigns the motivic operator identification here, DiamondEtaleCohomology owns diamond étale coefficients, and VStackSheavesAndLisseCategories owns its v-stack/lisse theory. EnhancedDerivedSheaves is consumed on main. No additional jointly owned object or reciprocal supply was identified.

All nine gaps have the same slug in `design/plan.json` and the README, named suppliers and explicit hypotheses. None has supplier `none`. The animated resolution/filtration is the API of one group-completion construction; the KH excision/descent clauses specify one KH theory. They are not unrelated bundled requests. The field/valuation hypotheses distinguish the K-theory gaps from existing noetherian or local-field results; the affinoid gap asks for descent rather than the already pinned one-variable PID theorem. These remain declared contracts, not findings for absent future proofs.

The requested dependency command completed, without modifying the merge order:

```text
depcheck: 236 roadmaps, 2155 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. All Needs lines and layer dependency blocks were read, including the two-stage six-functor construction and the extra §10.5 input to nearby cycles.

### Headline inventory and Lean acceptance

The Summary's nine headline families are:

1. Cancellation, §5.3.
2. Finitarity and rational Adams decomposition of Kmot, §§6.1,6.3.
3. Explicit strict-base K-cofibre, §7.6.
4. Torsion and effective/stable tilting, §§4.8,4.9,8.3.
5. Six operations and proper base change, §§8.5,9.4.
6. Geometric and analytic-base rigidity, §§9.1,9.6.
7. Algebraic étale comparison, §10.6.
8. Nearby cycles and integral monodromy, §11.8.
9. Overconvergent torsion comparison, §12.3.

Every family is named in the module docstring of `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`, with its missing carrier. None becomes statable merely by adding a few simple definitions: each requires the Banach arc-site, motivic stable ∞-categories, spectrum-valued K-theory/localization, or the v-stack coefficient categories. Existing ordinary Grothendieck topologies and quasicategories do not supply those constructions. No statable headline was replaced by a scalar or abstract-predicate stand-in.

The prescribed `lake env lean` elaboration of the package file, run from the pinned content checkout, exited **0 with no output and no warnings**. There is one `import Mathlib`, the required module docstring and namespace, and **zero declarations, zero sorries**. The exhaustive one-tactic probe therefore has zero inputs, and the `#check @name` binder audit likewise has zero inputs: no theorem or definition was skipped and no standing hypothesis can have been dropped. No Tau Ceti module build was needed. There is no padding or import finding.

## Not verifiable

- BLR §9.2, Proposition 3, Example 8 and Proposition 10 remain unread and settled as `uncertified`. No repeated request or renamed key was created. Scholze's proof of Lemma 6.4 is available for the marked-Jacobian input actually used.
- The nine declared supplier gaps are mathematical contracts, not completed formal proofs. Their owners, matching declarations, hypotheses and overlap were audited; their absence is not a defect in this package.
- The standalone overlap service does not recognize this unported package. Package-specific overlap facts were checked from the supplied report and the readable neighboring heads, as described above.

## Source issues

- **Misprint** in Scholze at Proposition 2.21, p.13, Scholze line 521: the source says the spectral radius is a norm before separated completion; it should be a seminorm, since a nonzero square-zero element has spectral radius zero; affects nothing.
- **Misprint** in Scholze at Example 3.6, p.16, Scholze line 672: the source says the bounded residue-field product is totally disconnected for every Banach ring; it should require analytic reduction first, since a trivially valued closed field remains discrete; affects a stated result.
- **Misprint** in Scholze at Definition 6.2, p.35, Scholze line 1503: the source says a transfer presheaf is covariant in the displayed monoid-map category; it should be contravariant to recover ordinary presheaf pullbacks; affects a stated result.
- **Error** in Scholze at proof of Proposition 5.19, p.35, Scholze line 1471: the source says use the maximum of the two coefficient bounds; it should use their minimum, as roots of norms one-eighth and two demonstrate; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze line 1601: the source says each annular term has e degree coordinates; it should have d per annulus and de in total; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze line 1621: the source says the outer threshold is r₁ and the inner estimate uses exponent n; it should use outer threshold r₂ and inner exponent kᵢ; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze line 1631: the source says the ratio-minus-one numerator has the opposite order of the two coordinates; it should be first coordinate minus second; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p.38, Scholze line 1633: the source says a malformed containment includes an extra rational term; it should place the zero-rank reduced-unit summand in the image of differences of point classes; affects nothing.
- **Misprint** in Scholze at discussion before Theorem 8.13, p.49, Scholze line 2068: the source says KH ignores quotients by idempotent ideals; it should describe nil-invariance for nilpotent ideals, while arbitrary ideals are handled by excision; affects nothing.
- **Gap** in Scholze at six-operation construction after Proposition 9.3, p.52, Scholze line 2183: the source says start from all finite-dimensional affine maps with their proper pushforward; it should first justify projection or start with the bounded-ball class and enlarge after rigidity; affects the proof.
- **Error** in Scholze at Theorem 11.1, p.57, Scholze line 2399: the source says the rational mapping spectrum is the weight-j K-summand; it should include the shift [−2j]; affects a stated result.
- **Misprint** in Scholze at construction before Definition 11.3, p.58, Scholze line 2453: the source says the geometric map gives the reverse cohomology arrow; it should induce g_*ℤ→f_*ℤ, with the inverse used after proving equivalence; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "0366dd72c60daeefeb9dbaec9a64f38bac30c826", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~4", "model": "gpt-6-astra", "worker": "chris-9"} -->
