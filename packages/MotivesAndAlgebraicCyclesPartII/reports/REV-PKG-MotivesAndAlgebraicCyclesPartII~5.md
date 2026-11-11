<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13026#issuecomment-6791655579 -->
Review (codex) of 035f418

Verdict: needs_changes

1. **F01** (P2) Require separation for the curve compactification input

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/README.md:535`: “for a smooth connected analytic curve `U` … there is a connected open `U′ ⊂ U` containing `x` and `x′` and an embedding … into a smooth projective … curve”.

   **Claim:** Smoothness and connectedness alone suffice for the two-point shrinking and compactification statement. Section 4.5 then applies this input to its general smooth connected curve.

   **Witness:** Glue two analytic affine lines over `ℂ₂` along their punctured lines. Their distinct origins have intersecting neighbourhoods in every common open neighbourhood. Such a neighbourhood cannot embed in a Hausdorff projective analytic curve.

   The imported category explicitly admits this example: TropicalAndBerkovichArithmetic, open pull request #1494, `TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:616` makes Hausdorffness a separate property; its Check at line 628 admits the nonseparated doubled disc. Thus there is no inherited separation convention excluding the witness. The affinoid input actually read is vanDerPut line 57, Theorem 1.1, printed p. 156; affinoid spaces are separated. Scholze line 1556 uses shrinking in the proof of Lemma 6.4, p. 37, without supplying an extension of this step to nonseparated analytic curves.

   **Exact repair:** State §4.2 for separated smooth connected analytic curves, and add the doubled-origin example as a negative-control Check. Preserve the generality of §4.5: before invoking §4.2, join the two points by a finite chain of connected separated open curve charts, choose a classical point in each consecutive overlap, apply the separated argument on each chart, and combine the resulting homotopies by addition and transitivity. State this reduction and its input in §4.5 rather than applying §4.2 once to the entire curve. Alternatively, explicitly make separation part of the curve convention for these two auxiliary targets and explain why the curve models used in §4.6 satisfy it; do not restrict the headline sheafification theorem.

   **Repair tested:** In the doubled line, take `x = 0₁`, `x′ = 0₂`, and intermediate point `y = 1` in the common punctured line. Both charts are separated. From
   `[x] + ℓA ∼ [y] + ℓB` and `[y] + ℓC ∼ [x′] + ℓD`,
   addition gives
   `[x] + ℓ(A+C) ∼ [x′] + ℓ(B+D)`.
   This retains §4.5 for the counterexample without claiming a nonexistent projective embedding. In a single open disc, choose a smaller open disc containing both points; its complement in `ℙ¹` is one closed disc containing infinity, so the repaired §4.2 has the intended positive instance.

2. **F02** (P3) Correct van der Put’s theorem and proof pagination

   **Location:** `packages/MotivesAndAlgebraicCyclesPartII/sources.toml:29` and `packages/MotivesAndAlgebraicCyclesPartII/README.md:1391`: “Theorem 1.1 (pp. 155–158); Corollary 1.3 (p. 159, proof pp. 159–161)”. The theorem range also occurs at README line 537.

   **Claim:** Pages 159–161 contain the proof of Corollary 1.3, while Theorem 1.1 and its proof occupy pages 155–158.

   **Witness:** vanDerPut line 57 states Theorem 1.1 on p. 156; line 163 finishes its proof on p. 159. Corollary 1.3 is at line 165. Lines 167–193 begin §2 and the UFD theorem’s proof.

   **Exact repair:** Use “Theorem 1.1, p. 156, proof pp. 156–159; Corollary 1.3, p. 159”. Remove the purported pp. 159–161 proof locator from the reference and the existing `vanDerPut` manifest entry; keep that entry’s identity and provenance. Update §4.2’s theorem range consistently.

   **Repair tested:** The new range reaches the final gluing step at vanDerPut line 163 and the corollary at line 165. It excludes the subsequent unique-factorization argument, which is not the input required by §4.2.

Two findings: one P2 and one P3; one blocking. Both findings from round 4 are repaired. The new findings concern the scope of a curve compactification input and a source locator, not the scope of the roadmap. The four package inputs were not changed.

## Verified sound

### Previous findings and repair-pattern audit

No previous finding was marked not actionable.

|Round-4 finding|Repaired passage in the package README|Assessment and recomputation|
|---|---|---|
|F01: missing shift and unrestricted reduced-unit object|Line 886: “the reduced cohomology of `ℙ¹` with coefficients `M` is that of `G_m` shifted by `[−1]`”; line 658 uses the global reduced free motive.|Repaired. At the complex point the two reduced cohomologies are `ℤ[−2]` and `ℤ[−1]`; `ℤ[−1][−1] = ℤ[−2]`. Tensoring with `ℤ(1)[2] = ℤ[2]` returns `ℤ`. The swaps on `ℤ[1]⊗ℤ[1]` and on `ℤ⊗ℤ` are respectively `−1` and `+1`.|
|F02: missing API for the Laurent completion|Lines 153–156: “The structure map … is an isometric ring map”; “Universal property”; “Functoriality”; “Base change”.|Repaired. Constant coefficients retain their norm. Evaluation at `T=1/2` sends `1+2T` to `2`, with norm bound `2=2`. Evaluation at `1/3` would send `T⁻¹` of norm `2` to norm `3` and is excluded. Coefficientwise composition agrees term by term.|

The adversarial recheck covers all additions in §§0.3, 5.1 and 8.2, including the new base-change claim, zero-ring clause and fourth Check. For `B=ℂ×ℂ` with maximum norm, `(1,0)+(0,1)T` has norm `1+1/2=3/2` in both the completed projective tensor product and `B((T))_{1/2}`; the maximum-norm product of two Laurent algebras instead gives `1`. The asserted base-change object is the former.

Every occurrence of `Ḡ_m`, the Tate shifts, reduced projective cohomology, and the Laurent completion was reread. Later reduced-unit identifications are restricted to the nonarchimedean locus or to `|p|<1`; §§10–11 use the global Tate object. The Laurent completion’s functoriality uses the contractive pushouts of TropicalAndBerkovichArithmetic §0.16, now resolved at its head. No remaining instance of either repaired pattern was found.

The unchanged targets were read throughout. Prior adversarial rows were reused only where they contain actual computed values; the new sample and changed passages were recomputed. An 80-target working ledger was retained in the job scratch area. The table below selects the required sample, headline families, repairs and findings for the comment-sized report.

### Principles, organization and shape

The package extends the Nisnevich-motive roadmap rather than replacing it. It develops the integral Banach arc theory, including archimedean points, both residue primes 2 and 3, discrete algebraically closed fields, and the root-free KH variant. No good-prime shortcut, computational algorithm, copied source paragraph, sorry’d data, `set_option`, forbidden supplier or duplicate Lean declaration was found.

There are 13 mathematical layers and 80 numbered targets. Each target has a Needs line; each layer has Examples and Dependencies. Definition blocks retain their API and at least three Check bullets. The order describes the prerequisites for the targets, including separate K-cofibre and stable-motive branches; it does not claim to follow a source’s exposition. The main-branch EnhancedDerivedSheaves, PerfectoidSpaces and SchemeAndStackFoundations roadmaps were read for house shape.

No machine path, HTML anchor, job identifier, pull-request number, LaTeX delimiter or process hand-off text occurs in the roadmap or acceptance file. Bibliographic version dates identify the texts used. Mathematical notation such as `Dmot`, `Marc`, `E_K` and `MG_C` is not presented as a Lean declaration. The actual named APIs are assigned to suppliers; they were resolved there. The `Perf.Spd` lead in the supplied citations scan is a planned supplier name in DiamondsAndVStacks §D6.1, not a claimed pinned-library declaration.

The six referenced works have six manifest keys. Five texts are available in the supplied legal cache; BLR remains settled as uncertified. No source was fetched or manifest entry altered. R02 records the incorrect existing locator rather than rewriting it.

### Source sample checked against the cached text

All 15 seeded targets were opened at their locators, including the proof steps used as routes. Scholze locators below refer to arXiv v3’s internal printed pages. There was no additional author-flagged unresolved locator besides the settled BLR background citation.

|Target|Locator and lines read|Hypotheses, page and statement check|
|---|---|---|
|0.3 Uniformization and geometric arc-covers|Scholze Examples 3.4–3.8, Proposition 3.9, pp. 15–16; lines 658–694.|The nonzero Laurent cover, uniform completion, rescaled perfection, complex condensed comparison and real involution are supported. Discrete residue fields require the analytic-cover step before the strict product.|
|0.5 Strict basis and restricted subcanonicity|Scholze Proposition 3.11, Corollary 3.12, Theorems 3.13–3.14, pp. 17–18; lines 708–775.|Nondiscrete fields in the bounded product; algebraic closure for strictness; perfectoid input and `|p|<1` for the second subcanonical site. No subcanonicity claim for all Banach rings.|
|1.2 Finitary derived arc-sheaves|Scholze Definition 4.10, Remark 4.11, Propositions 4.12–4.13, pp. 22–23; lines 937–967.|Strict-basis continuity, bounded-below extension to all rings, uniform cohomological bounds for unbounded continuity, colimits, truncations and left completeness agree.|
|1.4 Finitary maps and open immersions|Scholze Definitions 4.21–4.22 and Lemma 4.23, pp. 24–25; lines 1037–1066.|Relative cartesian square, slice-colimit stability, cancellation and both directions of the open-monomorphism characterization agree.|
|2.3 Rational homotopy t-structure|Scholze Proposition 5.10, p. 30; lines 1269–1282.|Rational coefficients, two-column spectral sequence with columns 0 and 1; the integral extension is separately proved in §4.10.|
|4.2 Shrinking and compactifying curves|Scholze proof of Lemma 6.4, p. 37, lines 1549–1572; vanDerPut Theorem 1.1 and Corollary 1.3, pp. 156–159, lines 27–87 and 150–171.|The affinoid compactification is supported. It does not supply a projective neighbourhood containing both origins of a nonseparated curve: R01. The reference’s proof pagination is wrong: R02.|
|4.4 Line domains with disc complements|Scholze Lemma 6.5 and proof, pp. 37–39; lines 1575–1648.|Nondiscrete algebraically closed nonarchimedean field; rational coefficients; open line domains with finite disjoint closed-disc complements. Endpoint cokernel and `d` reduced-unit summands agree. The roadmap corrects the printed degree and root-bound slips.|
|4.9 Effective tilting|Scholze Proposition 6.8, pp. 39–40; lines 1669–1683.|The `|p|<1` locus, perfectoid basis, inversion of `p` and trace divided by `p` are retained; the tilt uses marked untilts rather than restriction to characteristic `p`.|
|4.10 Integral homotopy t-structure|Scholze Corollary 6.9, p. 40; lines 1684–1701.|Arbitrary small arc-stack. The rational-to-torsion image argument is included; rational and torsion calculations alone are not substituted for it.|
|7.1 One-unit K-cofibre|Scholze discussion and Proposition 8.8, pp. 46–47; lines 1943–1984.|Uniform nonarchimedean norm, a topologically nilpotent unit with unbounded root orders, Tor-unitality, unitization independence, completion continuity and connective agreement on totally disconnected rings.|
|8.4 Stable affine pushforward|Scholze Theorem 9.2 and proof, pp. 50–51; lines 2109–2131.|Finite cohomological dimension and embedding into a finite-dimensional ball are both retained, including the arc-local extension. The general proper case is postponed to geometric rigidity.|
|10.5 Mapping formulas over a discrete field|Scholze Theorem 11.1 and proof, pp. 57–58, lines 2395–2441; CD Theorem 5.2.2, p. 44, lines 2048–2055.|Algebraically closed discrete field and smooth projective variety; rational Adams weights and prime-to-characteristic completion. The corrected `[−2j]` is required by CD’s `K_{2j−q}` formula and the projective-line test.|
|10.6 Berkovich/algebraic étale comparison|Scholze Remark 11.2 and Theorem 11.1, pp. 57–58; lines 2392–2441.|Algebraically closed field, étale descent, affine-line invariance, Tate stabilization and comparison on compact dualizable generators. No unsupported nonclosed-field hyperdescent extension.|
|11.1 Nearby cycles|Scholze construction before Definition 11.3, pp. 58–59; lines 2442–2466.|Completed algebraic closure of `k((T))`, chosen pseudouniformizer and compatible prime-to-`p` roots, module-category description and augmentation. Pullback direction is corrected in the roadmap.|
|12.1 Normed arc-stacks/v-stacks|Scholze Proposition 12.1 and Corollary 12.2, pp. 62–63; lines 2590–2621.|Perfect analytic characteristic-`p` Banach rings with chosen norm; target over the norm torsor; fully faithful right adjoint; partially proper image; separatedness for canonical compactification.|

The repaired projective-line proof was separately checked at Scholze lines 2132–2154. Source error calculations in §§3.5, 4.4, 8.5 and 10.5 were also reread. The van der Put correction is a package locator error, not an error in that source.

### Computed adversarial table

These are computations and negative controls, not proofs of the general theorems. “Retain” means that this test requires no edit.

|Statement|Instances tried|Values computed on both sides|Result / change|
|---|---|---|---|
|0.1 compact transition|Radii `1+1/n → 1`|At every stage `norm(T)=1+1/n>1`; in the colimit `norm(T)=1`. A radius-2 source lifts, the radius-1 identity does not.|Retain direction of compact transition.|
|0.2 arc-cover|Two complex points; zero ring|Two projection images have union of cardinality 2; one has cardinality 1. Empty spectrum has cardinality 0 and is covered by the empty family.|Retain finite-family and empty conventions.|
|0.3 analytic cover|Trivially valued closed field; zero ring|Before adjoining `T`, nonzero norms are 1; afterward `norm(T)=1/2`, `norm(T⁻¹)=2`. For zero ring both are 0.|Retain nonzero qualification.|
|0.3 archimedean norm|Over `ℂ`, `f=1+2T`|Sum norms of `f,f²` are `2,4`; supremum norms are `1,2`, violating submultiplicativity in the latter model.|F02 repair sound.|
|0.3 universal property|Evaluation at `1/2` and `1/3`|At `1/2`, `f↦2` and `T⁻¹↦2`, with bounds `2,2`; at `1/3`, inverse image norm `3>2`.|F02 repair sound; inverse bound discriminates.|
|0.3 functoriality/base change|Complex conjugation twice; `B=ℂ²`; `B=0`|Coefficient `a↦ā↦a`. The vector polynomial `(1,0)+(0,1)T` has projective tensor and target norms `3/2=3/2`, versus product norm `1`. Zero base gives `0=0`.|F02 additions sound.|
|0.5 strict cover|Trivial closed `k`; `A=0`; identity perfectoid base change|Original `k` has no norm in `(0,1)`; Laurent residue closure contains norm `1/2`. `M(0)=∅`. `A⊗̂_A A=A`.|Retain analytic reduction and P2.13 input.|
|1.2 finitary sheaves|Profinite `S={0,1}^ℕ`; strict field; annulus|Constant sheaf gives locally constant functions, not all of `ℤ^S`; the indicator of the all-zero singleton is not locally constant. Strict `H¹=0`; prime-to-residue-characteristic annulus `H¹=ℤ/ℓ`.|Retain strict-basis restriction.|
|1.4 finitary/open iff|Identity, `a=0`, `a=1,r≤1`; point in interval|Identity square is cartesian; loci are whole and empty. `{0}⊂[0,1]` is injective but not open and not finitary.|Both directions distinguished.|
|1.5–1.7 dimension/excision|Point, two points, interval endpoint|Point and profinite fibre dimensions 0. Excision stalks at endpoint are `0→ℤ→ℤ`; inside the open they are `ℤ→ℤ→0`.|Retain finite-dimension hypotheses and variance.|
|2.1 effective motives|Complex disc; nonarchimedean disc; `1+aT`|Bounds `2+0=2≤3` and `1+2=3`. For `0<norm(a)<1`, the nonconstant unit’s reduced class is 1, but it is not a constant unit.|Retain reduced units and ball invariance.|
|2.3 rational truncations|At complex point `M=ℚ[1]⊕ℚ[−1]`|Cohomology is `ℚ` in degrees `−1,1`, 0 elsewhere; `τ≤0 M=ℚ[1]`, `τ≥1 M=ℚ[−1]`. Each has identical values at point and ball.|Retain cohomological indexing.|
|3.1–3.4 one-units/Tate|Minus one over `ℚ₂,ℚ₃`; complex and real points|`norm(−1−1)=1/2,1`; only the first is a one-unit. Complex reduced motive `ℤ[1]` yields Tate `ℤ`; real conjugation gives `−1` on the circle’s first homology.|Retain threshold and twist.|
|3.5 annulus/root bounds|`T²−1`; `T²+T/2+4` over `ℂ₂`|First extrema `(1,1)`, excluding zero coefficient from division. Second root norms `(1/8,2)`; minimum coefficient bound `1<2`, whereas erroneous maximum `4>2` admits it.|Retain earlier repair.|
|4.1 transfers|Empty object; multiset degrees 0,1,2|Induced maps `0,id,2id`; on two components degrees `(1,2)` give `(a,b)↦(a,2b)`.|Retain additive opposite-category convention.|
|4.2 compactification|Doubled-origin analytic line; separated open disc|In the doubled line, `2^n→0₁` and `2^n→0₂`, with norms `2^{−n}→0`; origins are distinct. In a Hausdorff target both limits must coincide. For the disc, a smaller disc has one closed complementary disc.|Fails: R01.|
|4.2/4.5 repaired route|Two affine-line charts meeting at `y=1`|Two homotopies combine to `[0₁]+ℓ(A+C)∼[0₂]+ℓ(B+D)`; both sides have the same total multiplicity.|R01 repair preserves curve-homotopy generality.|
|4.3 marked Jacobian|`ℙ¹`, one or two marks; characteristic `p`|Torus ranks `0,1`; for two marks coordinate `a/b`, unchanged by simultaneous scaling. Over closed `C`, `z↦z^p` is onto even in characteristic `p`.|Retain pointwise surjectivity, not étaleness.|
|4.4 disc complements|Disc, annulus, `d=2,e=3`|Reduced ranks `0,1`; boundary-degree matrix has `de=6` entries, not `e²=9`. With `r₁=1/4,r₂=4,k_i=2,n=4,s₁=1/2,s₂=2`, inner bound `1/16<1/2`, outer bound `256>2`.|Retain corrected degree and root estimates.|
|4.6 additive negative control|`0,C,C×C` in characteristic `ℓ`|Presheaf values `0,ℤ/ℓ,(ℤ/ℓ)²`. Artin–Schreier field cokernel is 0; the disc class `T` would require infinitely many fractional exponents and survives.|Retain residue-prime inversion.|
|4.8 torsion headline|Residue exponents 2,3,1; complex point|Unit coefficient rings `ℤ[1/2],ℤ[1/3],ℤ`; bad-prime torsion is 0, good-prime unit is `ℤ/n`; complex unit remains `ℤ`.|No good-prime narrowing.|
|4.9 and 8.3 tilting|Characteristic-`p` perfectoid field; `ℂ_p`; empty stack|Characteristic-`p` field tilts to itself. For `ℂ_p`, characteristic changes `0→p`, while prime-to-`p` torsion is `μ_n≅ℤ/n` on both sides and `p`-torsion motives are 0. Empty remains empty.|Retain marked-untilt construction.|
|4.10 integral truncations|Complex `M=ℤ[1]⊕ℤ/2[0]`; map `ℚ→ℚ/ℤ`|`τ≤−1 M=ℤ[1]`, `τ≥0 M=ℤ/2[0]`; point/ball values agree. Image of `ℚ→ℚ/ℤ` is all `ℚ/ℤ`, nonzero although rationalization is 0.|Retain separate image argument.|
|5.1 permutations|Tensor powers 0,1,2 at complex point|Powers 0 and 1 have only identity permutation. Tate swap is `+1`; shifted reduced-motive swap is `(−1)^{1·1}=−1`.|F01 repair sound.|
|5.3 cancellation headline|Complex point, empty base, good-prime torsion|Tensor by `ℤ` is identity; empty category has map `0→0`; tensor by `μ_n` has inverse tensor by its dual.|Retain all-base theorem.|
|5.4 projective cells|`ℙ⁰,ℙ¹,ℙ²` over complex point|Rational motive complexes have cohomological degrees `{0},{0,−2},{0,−2,−4}`; each added cell contributes exactly `ℚ[2n]`.|Retain integral cell/rational splitting distinction.|
|6.1/6.3 Kmot headlines|`ℂ₂,ℂ₃,ℂ`; weights 0,1,2|Ranks `ℤ[1/2],ℤ[1/3],ℤ`; complex rational `π₂=ℚ`, not 0. Eigenvalues `1,2,4`; projector denominators `3,−2,6`, giving the three coordinate vectors.|Retain spectrum and Adams splitting.|
|6.2 flag invariants|`Σ₂`, nonabelian `Σ₃`|Regular-character traces `(2,0)` and `(6,0,0)`; invariant dimensions `2/2=1` and `6/6=1`.|Retain averaging and degree-zero line.|
|7.1 one-unit K-cofibre|`ℚ_p`; closed valued field; product with `T=(p,p²)`|`pℤ_p/(pℤ_p)²=𝔽_p≠0`; closed-field maximal ideal has `I²=I`. Product norms `norm(T)=p⁻¹`, `norm(T⁻¹)=p²`; root inverse norm `p^{2/n}→1`.|Retain root hypothesis; inverse norm need not be reciprocal of norm.|
|7.4 KH variant|`ℚ₃`; field product; zero ring|Cofibre `π₀=ℤ`; fibre `π₀=ℤ×ℤ/2`. Rational ranks of one field, two fields, zero ring are `ℚ,ℚ²,0`.|Retain cofibre orientation and root-free scope.|
|7.6 explicit K headline|Strict fields with exponents 2,3,1|`π₀(E_K[1/p])=ℤ[1/2],ℤ[1/3],ℤ`; strict empty value 0.|Retain localized rank; no integral rank retraction of Kmot at `p>1`.|
|7.7 arithmetic gluing|`p=2,3`|`ℤ[1/p]∩ℤ_p=ℤ` inside `ℚ_p`: `a/p^r∈ℤ_p` forces `p^r∣a`.|Retain integral E∞ gluing.|
|8.2 projective-line duality|Complex point; real orientation|`(ℤ⊕ℤ[−2])⊗ℤ[2]=ℤ[2]⊕ℤ`; reduced `G_m` cohomology `ℤ[−1]` must shift by `−1`. Real top homology has conjugation `−1`.|F01 repaired, with global cofibre.|
|8.4 affine pushforward|Two-point affine space embedded in a complex disc|`f_*(M,N)=M⊕N`; both projection-formula sides equal `(M⊗P)⊕(N⊗P)`; fibre dimension 0.|Retain finite-ball and dimension hypotheses.|
|8.5/9.4 six-operation headline|Identity; closed disc; `βℕ` over complex point|Identity dimension 0. Closed disc lies in the ball class. `βℕ` has dimension 0 but no embedding into a finite-dimensional complex ball, which is metrizable.|Retain two-stage proper construction.|
|9.1/9.6 rigidity headlines|`D(ℤ)`; two complex points; interval|`ℤ` is compact/dualizable, infinite free sum is not. Two-point category `D(ℤ)²`. On interval, `j_!ℤ≠0` but `RΓ(j_!ℤ)=fib(ℤ→ℤ)=0`.|Retain distinction from compact generation.|
|9.5 mixed Tate negative control|Elliptic curve over `𝔽̄_p`|Three divisor classes on `E²` have intersection matrix with off-diagonal 1, diagonal 0, determinant 2. Tate-only prediction gives endomorphism dimension 2; actual dimension at least 3.|Retain non-Tate example.|
|10.2 transfer-free rigidity|`k=𝔽̄₃,n=2` and `n=3`|`μ₂=ℤ/2`, `k×/k×²=0`; with `n=3`, motivic category is 0 but `D(ℤ/3)≠0`. On affine line, Artin–Schreier class `t≠0`.|Retain even good coefficients and invertibility hypothesis.|
|10.5 mapping headline|`ℙ¹,j=1`; `Spec 𝔽̄_p`|`π₋₂=K₀^{(1)}(ℙ¹)_ℚ=ℚ`; `π₀=0`. Finite-field rational weight 0 gives `ℚ`, other weights 0.|Retain `[−2j]`; unshifted version fails.|
|10.6 comparison headline|`ℙ¹`; finite coefficients|Both categories give `ℤ⊕ℤ(1)[2]`; at algebraically closed field with `ℓ≠p`, both coefficient categories are `D(ℤ/ℓ)`.|Retain algebraically closed scope.|
|11.1 nearby-cycle construction|First point into two; `π=T,T^{1/n}`|Pullback is `ℤ²→ℤ,(a,b)↦a`. Normalized valuations `1,1/n` are nonzero; good-reduction `ℙ¹` maps to `ℤ⊕ℤ(1)[2]`.|Retain corrected arrow and normalization.|
|11.3–11.5 Galois stacks|Rational fibre; `ℓ≠p`; `p`|`R⊗ℚ=ℚ[t^{±1}]`; `R⊗𝔽_ℓ=𝔽_ℓ`; `R⊗𝔽_p=0`. Additive band has integral degree-zero ring and rational positive terms.|Retain fibre-product, not product, ring.|
|11.6/11.8 monodromy headline|`A=ℤ/2,p=3`; two-step rational pair|`A⊗ℚ=0` but underlying `A≠0`; coaction constant term is identity. Two-step `N≠0,N²=0`; scalar 1 has all iterates 1.|Retain integral underlying object and local nilpotence.|
|12.1 normed comparison|Point with two plus rings; closed versus open disc|For an arc object, values on `(C,C⁺)` and `(C,O_C)` are both `Y(C)`; unit/counit composites are identity. In multiplicative lexicographic coordinates, a rank-two boundary value `(1,2)>(1,1)` has rank-one generization value `1`: the closed bound admits that generization; the strict bound admits neither.|Retain partially proper image and norm-torsor base.|
|12.3 overconvergence headline|Constant sheaf; extension by zero; `n=1`|Specialization `id:ℤ/n→ℤ/n` is invertible; `0→ℤ/n` is not for `n>1`; at `n=1` it is `0→0`.|Retain both directions and zero coefficients.|
|12.4 retract|Full inclusion `I` with right adjoint `R`; point|`RI=id`, hence `(IR)²=IR`; at a point both functors are identity.|Retain retract conclusion without claiming compact generation.|

### Pinned-library and headline audit

The content checkout used for elaboration is main `d2e9ef2`. Its manifest pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Definitions and surrounding binders were opened at these pins, not inferred from their names.

|Pinned declarations opened|Repository-relative location|What is supplied|
|---|---|---|
|`CategoryTheory.GrothendieckTopology`|Mathlib/CategoryTheory/Sites/Grothendieck.lean:72|Sieve topology with maximal sieve, pullback and transitivity axioms; no Banach site.|
|`NormedField`|Mathlib/Analysis/Normed/Field/Basic.lean:155|Multiplicative norm and metric on a field; neither completeness nor nontrivial valuation is included.|
|`IsUltrametricDist`|Mathlib/Topology/MetricSpace/Ultra/Basic.lean:47|Strong triangle inequality; does not add completeness.|
|`SSet.Quasicategory`|Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41|Inner-horn fillers; no stable/presentable motivic category.|
|`continuousCohomology`|Mathlib/RepresentationTheory/Homological/ContCohomology/Basic.lean:131|Homology of homogeneous continuous cochains for a topological representation.|
|`PowerSeries.IsRestricted.subring`|Mathlib/RingTheory/PowerSeries/Restricted.lean:90|Restricted-series subring; ultrametric hypothesis is in scope.|
|`Subring.unitClosedBall`|TauCeti/Analysis/Normed/Ring/Ultra.lean:84|Closed-ball subring under ultrametric seminorm and norm-one hypotheses.|
|`TauCeti.unitBallIdeal`, `TauCeti.mem_unitBallIdeal`|TauCeti/Analysis/Normed/Ring/UnitBall.lean:90, 101|Strict open-ball ideal in that subring; zero ring is handled separately in the roadmap.|
|`TauCeti.norm_inverse_one_sub`, `TauCeti.norm_inverse_one_sub_sub_one`, `TauCeti.isUnit_unitClosedBall_of_norm_sub_one_lt`|TauCeti/Analysis/Normed/Ring/UnitBall.lean:160, 171, 185|Normed ultrametric ring with norm one and summable geometric series; exact inverse estimates.|
|`TauCeti.PowerSeries.isPrincipalIdealRing_isRestricted_subring`|TauCeti/RingTheory/PowerSeries/Weierstrass/Ideal.lean:115|Complete ultrametric normed field and positive radius; no nontrivial-valuation hypothesis.|
|`TauCeti.cohomologicalDimensionAt`, `TauCeti.strictCohomologicalDimensionAt`|TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Basic.lean:146, 151|Dimensions valued in `ℕ∞`.|
|`TauCeti.cohomologicalDimensionAt_le_of_isClosed`|TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClosedSubgroup.lean:80|Closed-subgroup bound for compact totally disconnected groups.|
|`TauCeti.strictCohomologicalDimensionAt_le_cohomologicalDimensionAt_add_one`|TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/Strict.lean:181|Compact-group bound including infinite dimension.|

Object searches covered Banach spectra/sites, finitary arc-sheaves, stable motivic categories, algebraic K-theory spectra, reduced units, restricted power series and the listed dimension inputs. The existing ideal, inverse estimates and PID theorem are imported, not rebuilt. Ordinary sites, ordinary presentable-category machinery and quasicategories do not supply the missing motivic ∞-categorical carriers.

The Summary’s headline inventory is:

1. Cancellation (§5.3).
2. Finitarity and rational Adams decomposition of Kmot (§§6.1, 6.3).
3. Strict-base K-cofibre description (§7.6).
4. Torsion and effective/stable tilting (§§4.8, 4.9, 8.3).
5. Six operations and proper base change (§§8.5, 9.4).
6. Geometric and analytic-base rigidity (§§9.1, 9.6).
7. Integral algebraic étale comparison (§10.6).
8. Nearby cycles and integral monodromy (§§11.1, 11.8).
9. Overconvergent torsion comparison (§12.3).

Every family is named in `packages/MotivesAndAlgebraicCyclesPartII/Suggested.lean`’s module docstring with its missing carriers: Banach arc-sites, enhanced stable sheaf categories, tensor inversion, K-theory spectra or v-stack coefficient categories. None is statable at these pins using only a few simple native definitions. No scalar stand-in or free predicate replaces a headline.

The prescribed `lake env lean` elaboration, from the pinned content checkout, exited **0 with no output and no warnings**. The file has exactly one `import Mathlib`, one module docstring, the required namespace, **zero declarations and zero sorries**. Thus the exhaustive one-tactic padding probe has zero inputs, as does the `#check @name` binder audit. No declaration was skipped; no Tau Ceti module build was needed.

### Supplier resolution, ownership, gaps and order

The supplied board package index was read before ownership conclusions. Fresh `roadmaps show`, object-oriented `roadmaps grep` and `roadmaps resolve` checks were made, with main used for existing roadmaps and open heads for new ones. The fresh resolver reports no unresolved cross-roadmap citation. It explicitly did not inspect local library pins; the independent pinned-source audit above supplies that check.

The table records representative exact locations and the complete consumed section groups. Line numbers for saved head views exclude the service’s added header.

|Supplier and version|Resolved repository-relative locations and interfaces|
|---|---|
|TropicalAndBerkovichArithmetic, #1494|TauCetiRoadmap/TropicalAndBerkovichArithmetic/README.md:494 (§0.16), 612 (§0.21), 628 (nonseparated Check); §§0.1, 0.7–0.8, 0.12–0.17, 0.20–0.22, 0.24–0.28, 0.30, 0.32, 1.1–1.3, 1.6, 3.7 resolve. Contractive tensor product is projective ℓ¹. General analytic objects are locally Hausdorff: R01.|
|EnhancedDerivedSheaves, main|TauCetiRoadmap/EnhancedDerivedSheaves/README.md:211 (E0.4), 549 (E1.3), 1153 (E3.2), 1229 (E3.4), 1436 (E5:abstract), 1624 (E5:presentability.2), 1732 (E5:presentability.4), 1791 (E5:descent), 1896 (E5:animation), 2031 (E2). The specified E2.1–E2.7 and E5 comparison interfaces resolve; open revisions were not substituted.|
|AnalyticStacks, #1687|TauCetiRoadmap/AnalyticStacks/README.md:209 (§0.5), 230 (§0.6), 468 (§1.5); §§0.4, 0.9–0.10 and 1.1–1.4 resolve. Comodule comparison keeps flatness and finite counit Tor amplitude. The monodromy-operator identification is assigned to this roadmap.|
|GeneralAlgebraicKTheory, #1212|TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:418, 1615, 1738, 2267, 2929, 2939, 3027 resolve §§3.2, 8.3, 8.10, 10.10, 13.4–13.5, 13.8c: ring/nonunital K-theory, excision, Bass spectrum, continuity and finite-field computation.|
|GeneralAlgebraicKTheoryPartII, #1742|TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md:336 (§1.2), additive group-completion K-theory. Its KH use does not replace the declared missing KH contract.|
|SchemeKTheoryOperations, #1229|TauCetiRoadmap/SchemeKTheoryOperations/README.md:717 (§2.6), 804 (§3.1), 904 (§3.3), 945 (§3.4), 1150 (§3.8), 2403 (§6.4), 2636 (§6.8), 2795 (trivial-conormal weight shift in §6.11). General derived-closed-fibre excision is present within §3.8; the Witt heading does not restrict that paragraph.|
|KTheoryFiniteLocalFields, #1281|TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:267 (§1.5), 284 (§1.6), 398 (§2.1), 1350 (§6.5). Perfect positive-characteristic divisibility and finite-field calculations resolve. The §6.5 local-field result does not already supply the algebraically closed-integers contract.|
|RefinedTraceMethods, #1493|TauCetiRoadmap/RefinedTraceMethods/README.md:1907 (§4.10), 2393 (§4.20). Almost-module K-theory requires flat idempotence; the uniform root-norm computation in §7.1 supplies it.|
|JacobianChallenge, main; AnabelianGeometryAndNonabelianChabauty, #1021|TauCetiRoadmap/JacobianChallenge/README.md:121, 284, 434 resolve divisor/Picard/multiplication APIs; TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:4003 is the reduced-boundary generalized Jacobian. The variant here retains arbitrary characteristic and asserts divisibility on points.|
|PerfectoidSpaces, main|TauCetiRoadmap/PerfectoidSpaces/README.md:3843 (P1.4), 4727–4912 (P1.19–P1.22), 5197 (P1.27), 6235 (P2.3), 6635 (P2.7), 7322 (P2.12), 7391 (P2.13), 9976 (P3.20). Tensor pushouts are used over a perfectoid Tate base; identity base change gives A.|
|DiamondsAndVStacks, #820|TauCetiRoadmap/DiamondsAndVStacks/README.md:1730, 1907, 2449, 4243, 6367, 6550, 8660, 8830 resolve D0.22, D0.23, D1.4, D2.7, D4.7, D4.9, D6.1, D6.3. `Perf.Spd` is defined in the D6.1 planned interface.|
|DiamondEtaleCohomology, #922|TauCetiRoadmap/DiamondEtaleCohomology/README.md:580, 622, 786, 909, 1237, 1339, 1367, 1567, 2931 resolve C0.19, C0.24, C2.2, C2.12, C4.5, C4.13–C4.14, C6.1, C9.8.|
|DiamondSixOperations, #927|TauCetiRoadmap/DiamondSixOperations/README.md:541, 768, 829 resolve S2.4, S4.2–S4.3; eligible morphisms and prime-to-p coefficients are retained.|
|MotivesAndAlgebraicCycles, #1313|TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:559–888 resolve §§4.1–4.6, 4.9, 4.11, 4.15–4.18. The perfect-field smooth-projective Chow comparison is separately stated without resolution; it is not confused with the resolution-dependent smooth-proper theorem.|
|MotivicEtaleKTheory, #1470; AdicCoefficientsAndComparisons, #965|TauCetiRoadmap/MotivicEtaleKTheory/README.md:282 (§2.2), higher-Chow/Adams-weight comparison; TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md:1733, L5 `smoothAlterationPair`, with retained finite extension and smooth boundary.|
|ProfiniteCohomology, main; SchemeAndStackFoundations, main|TauCetiRoadmap/ProfiniteCohomology/README.md:2645 (§10.2), 2919 (Layer 11); TauCetiRoadmap/SchemeAndStackFoundations/README.md:4029 (§2.16), Tsen.|
|EtaleCohomologyFoundations, main|TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504, 540, 629 resolve F.2.1, F.2.3, F.3.0: arbitrary-torsion proper base change, invertible-torsion smooth acyclicity, and finite-type geometric dimension bounds.|
|RepresentationTheory/LieGroups, CharacteristicClasses, MorseNovikov, main|TauCetiRoadmap/RepresentationTheory/LieGroups/README.md, Layer 8; TauCetiRoadmap/CharacteristicClasses/README.md:1379; TauCetiRoadmap/MorseNovikov/README.md:1185. Bruhat cells, Euler characteristic and Lefschetz traces apply to compact U(n)/T.|

The supplied overlap report lists no conflicting heads, dropped cited ids, revision-only ids or lost old numbering. The closest open scopes were compared: ArcTopologyAndDescent #1755 owns scheme arc-descent, not this Banach site; AnalyticStacks #1687 owns the generic formalism and leaves the motivic operator identification here; DiamondEtaleCohomology #922 and VStackSheavesAndLisseCategories #1230 own the diamond étale and lisse constructions consumed here. EnhancedDerivedSheaves is consumed on main. Object searches found no second owner for the Banach Laurent cover, free motivic sheaves, one-unit K-cofibre or motivic monodromy. The empty acceptance file cannot duplicate a fully qualified declaration.

All nine gap slugs agree between the README and `packages/MotivesAndAlgebraicCyclesPartII/design/plan.json`: replete-postnikov, compact-hausdorff-dimension, animated-group-completion, einfty-fracture-square, kh-excision-cdh-descent, valuation-ring-k-regularity, suslin-rigidity, padic-k-integers-oc and affinoid-line-bundles. Each names its supplier and exact hypotheses. The group-completion resolution/filtration and KH excision/descent clauses specify related APIs of single constructions. The affinoid contract asks for effective module descent, not the already pinned one-variable PID theorem or Čech acyclicity alone. None is an unowned prerequisite.

Every Needs line and supplier contract was read. The prescribed dependency check completed with:

```text
depcheck: 237 roadmaps, 2158 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was changed.

## Not verifiable

- BLR §9.2, Proposition 3, Example 8 and Proposition 10 remain unread and settled as `uncertified`. No renewed request or duplicate source key was created. The usable marked-Jacobian proof input in Scholze was read.
- The references’ extra assertion about the author’s separate 21 January 2026 copy was not used to certify any locator; certification here is against the cached arXiv v3 text.
- The nine supplier gaps remain contracts for future library work, not completed formal proofs. Their declarations, owners, stated hypotheses and overlap were checked.

## Source issues

- **Misprint** in Scholze at Proposition 2.21, p. 13, Scholze line 521: the source says spectral radius is a norm before separated completion; it should be a seminorm, since a nonzero square-zero element has spectral radius zero; affects nothing.
- **Misprint** in Scholze at Example 3.6, p. 16, Scholze line 672: the source says every bounded residue-field product is totally disconnected; it should require analytic reduction first, since a trivially valued closed field stays discrete; affects a stated result.
- **Misprint** in Scholze at Definition 6.2, p. 35, Scholze line 1503: the source says transfer presheaves are covariant in the displayed monoid-map category; it should use the opposite category to recover ordinary presheaf pullbacks; affects a stated result.
- **Error** in Scholze at proof of Proposition 5.19, p. 35, Scholze line 1471: the source says take the maximum of two coefficient bounds; it should take their minimum, as root norms one-eighth and two demonstrate; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38, Scholze line 1601: the source says each annular summand has e degree coordinates; it should have d, giving de coordinates in total; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38, Scholze line 1621: the source says the outer threshold is r₁ and the inner exponent is n; it should use outer threshold r₂ and inner exponent kᵢ; affects the proof.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38, Scholze line 1631: the source says the ratio-minus-one numerator reverses the coordinates; it should be first coordinate minus second; affects nothing.
- **Misprint** in Scholze at proof of Lemma 6.5, p. 38, Scholze line 1633: the source says the containment passes through an extra rational term; it should put the reduced-unit zero-rank summand in the image of differences of point classes; affects nothing.
- **Misprint** in Scholze at discussion before Theorem 8.13, p. 49, Scholze line 2068: the source says KH ignores quotients by idempotent ideals; it should state nil-invariance for nilpotent ideals and use excision for arbitrary ideals; affects nothing.
- **Gap** in Scholze at six-operation construction after Proposition 9.3, p. 52, Scholze line 2183: the source says begin with all affine maps of finite cohomological dimension and proper pushforward; it should first justify projection or start with the bounded-ball class and enlarge after rigidity; affects the proof.
- **Misprint** in Scholze at proof of Proposition 9.3, p. 52, Scholze line 2154: the source says the global reduced multiplicative-group motive is the reduced-unit sheaf; it should use the global Tate cofibre and identify it with reduced units only nonarchimedeanly; affects nothing.
- **Error** in Scholze at Theorem 11.1, p. 57, Scholze line 2399: the source says the rational mapping spectrum is the weight-j K-summand; it should include the shift [−2j]; affects a stated result.
- **Misprint** in Scholze at construction before Definition 11.3, p. 58, Scholze line 2453: the source says the geometric map induces the reverse cohomology arrow; it should induce g_*ℤ→f_*ℤ, inverted only after proving equivalence; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "035f418e21a3bdfb97b47f48b44a489591ac75f5", "job": "REV-PKG-MotivesAndAlgebraicCyclesPartII~5", "model": "gpt-6-astra", "worker": "chris-10"} -->
