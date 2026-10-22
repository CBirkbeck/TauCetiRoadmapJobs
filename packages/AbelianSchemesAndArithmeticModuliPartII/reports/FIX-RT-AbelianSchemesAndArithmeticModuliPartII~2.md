# Mathematical repair report

The first six finding sections refer to review r2a; the following four refer to review r2b. Their identifiers are retained verbatim. The reviews raise distinct findings, so none needs duplicate settlement. Supplier gaps specify requirements; they do not certify a supplier implementation.

## F01 (P1) — applied

Review a. Undeclared hyperbolic estimates → three B3 targets: `purePartHeightBound`, `purePartVolumeLowerBound`, `purePartFundamentalVolumeUpperBound`. They retain the graph-component hypotheses, positive-dimensional pure projection, fixed metric, constants and uniformity in γ. Horizontal growth now depends on them. Four boundary Checks distinguish height growth, ball volume, fundamental-domain volume and the vertical case.

Evidence: Gao-Ax line 650 fixes the hypotheses; Gao-Ax line 667, Gao-Ax line 672 and Gao-Ax line 675 give the three estimates. The definable-input contract alone did not state them.

## F02 (P1) — not actionable in this package: ShimuraVarieties must supply the abelian Ax input

Review a. Missing algebraic-to-Ax-type bridge → `gap:algebraic-betti-ax-type`, recorded in both supplier-contract locations. It requests abelian Ax–Lindemann and `algebraicSubvariety_bettiAxType`, with the full fundamental-cube and arc implications and three controls. The fibre alternative now explicitly consumes this gap. Editing this package cannot establish a theorem in ShimuraVarieties.

Evidence: GH line 1003 separates definability from its application of Ax's theorem. Neither the conditional Ax-type alternative nor the Kuga dictionary proves the missing implication. The contract requires an independent abelian proof and introduces no dependency on B3's mixed Ax–Schanuel conclusion. GH states the required bridge directly; no independently verified locator into Ax's original paper is claimed.

## F03 (P1) — not actionable in this package: the parent must supply the general arithmetic prerequisites

Review a. Implicit inputs → `gap:uniform-manin-mumford` and `gap:lang-neron-modulo-trace`, each in README and plan. Added `finiteMaximalGHGenericallySpecial`, its trace-free product statement and three Checks. Trace and GH-special definitions now cover algebraically closed characteristic-zero constants. Supplier proofs of uniform Manin–Mumford, general Lang–Néron and bounded-degree torsion remain outside this package.

Evidence: GH line 546 states family-uniform torsion closures; GH line 610 through GH line 649 uses bounded-degree torsion and Lang–Néron. ConradTrace line 1079 states finite generation for every finitely generated regular extension, without a characteristic restriction. GH line 512 and GH line 120 provide the two local application targets. The bounded-degree consequence includes the bounded-degree finite étale cover input, rather than assuming finite generation alone implies it.

## F04 (P3) — applied

Review a. Supported-sequence Check → `degreeCompletion_infiniteSupport`, a named Lean boundary target for the all-unit tensor sequence, with every coefficient nonzero and exclusion from the canonical direct-sum image. The other supported-sequence example remains proved and is correctly described as distinguishing fixed finite truncations.

Evidence: multiplication of the n scalar tensor factors maps the degree-n coefficient to 1, also for n=0 via the empty-tensor equivalence. A direct-sum element has finite support, so it cannot map to this sequence. This proves the mathematical distinction without assuming a completion comparison.

## F05 (P3) — applied

Review a. Two repeated-definition Checks → elliptic Poincaré ranks and the product polynomial of two elliptic curves. Replaced `completedPoincare_base` with `completedPoincare_rank_two`, and `frobeniusPolynomial_native` with `frobeniusPolynomial_elliptic_product`. These remain geometric README Checks on their intended carriers.

Evidence: KS line 674 and KS line 676 give kernels Sym² of ranks one and two. Hence ranks are 1+1+1=3 and 1+2+3=6, with final kernels 1 and 3. Expanding `(X²−aX+q)(X²−bX+q)` gives the displayed quartic; its last two coefficients obey dimension-two reciprocity.

## F06 (P3) — not actionable in this package: merge-order edits are outside the authorized files

Review a. The branch comparison confirms one inherited insertion in `merge-order/ORDER.txt`. This repair leaves that file untouched. Removing it from the branch or separating intake changes requires the worker or maintainer; a package-file edit cannot change that diff. The dependency check independently confirms correct supply direction.

## F01 (P2) — applied

Review b. Topological charted surface → explicit `[IsManifold 𝓘(ℂ) ω S]` in `riemannGoodCover`, with matching README and docstring. The proof route uses the complex-analytic surface's smooth structure, a Riemannian metric and convex neighbourhoods. No smoothing theorem for arbitrary topological surfaces is consumed.

Evidence: GH line 1049 through GH line 1056 uses differentiable coordinate neighbourhoods and a good-cover refinement. The scratch elaborated type retains the analytic-manifold instance. The wider topological statement need not be false for this generality mismatch to be a valid finding.

## F02 (P3) — applied

Review b. Two admitted boundaries → proved theorems, using `simp [Set.eq_univ_iff_forall]` and `simp [hconst, Set.iInter_const]`. Their names and signatures are unchanged. The README distinguishes these proved Checks from the remaining `compactLatticeImageLimit_powers` target.

Evidence: the rank-zero lattice is a singleton; intersection of a constant family is its fixed set. Both proof scripts elaborate at the pins without warnings on these declarations.

## F03 (P3) — applied

Review b. Porism 4.3 locator 541 → 540 in README and manifest. Both marked-lattice references now include §1.2 on printed pp.524–525 and §3.1 on pp.529–531, with PDF pp.5–6 and 10–12. The Theorem 6.1 locator remains pp.550–551.

Evidence: Waterhouse line 132 gives printed 524; Waterhouse line 143 starts §1.2. Waterhouse line 762 gives printed 540 and Waterhouse line 786 contains Porism 4.3. Thus the earlier page arithmetic was incorrect.

## F04 (P3) — applied

Review b. Manifold-only prose with k≤∞ → the actual open-Euclidean target, 1≤k≤ω, with ω explicitly real analytic, followed by its manifold consequence in charts. Added explicit rank bounds r≤m,n in prose and updated the Lean docstring. The true analytic case and general manifold consequence are retained.

Evidence: Mathlib `Analysis/Calculus/ContDiff/Defs.lean` defines the regularity scale as `WithTop ℕ∞`, with analytic top level. The elaborated `constantRankLocal` type retains k, its lower bound, both rank bounds, openness and constant differential rank.

## Adversarial mathematics pass

The table groups related target statements, their APIs and Checks; it is a mathematical audit, not a proof certificate. It includes the unchanged target families and all retained Lean declarations. New supplier statements were also tested on the boundaries below. Heavy geometric carriers remain README targets.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| Conventions: tensor invariants, shuffle powers, completion | n=0,1,2; zero module; ℤ and 𝔽₂ | Empty tensor gives R; shuffle square is twice the divided square; product permits infinite support | Completion Check strengthened |
| Conventions: dual extension and cotangent | Zero abelian scheme; elliptic scheme; square-zero base | Extension of A∨ has cotangent dual to H¹_dR; tangent test is Hom(H,M) | None |
| Conventions: period coordinates and form | g=1; type diag(1,2); [0], [−1] | Periods 2 and 4; [N] scales by N²; base excluded from Betti projection | None |
| Conventions: traces and specialness | Constant genus-two curve; geometric trace after cover; trace-free family | Constant varieties and torsion cosets have different roles; actual/geometric traces remain distinct | Constant field generalized as needed |
| Conventions: Frobenius, Dieudonné and markings | a=1,2; composition of two maps; identity marking | Descending reciprocity; opposite algebra; inverse contravariant marking restores left action | None |
| Conventions: root product and asymptotic errors | Empty/repeated roots; fixed p versus fixed q | D_* stays positive; errors retain stated dependence | None |
| `tensorSymmetricPower`, membership, diagonal and functoriality | n=0,1,2; zero ring/module; e₀⊗e₁ and its swap | Equalizers impose no degree-zero/one restriction; off-diagonal tensor is excluded | None |
| `degreeCompletion`, truncation and degree-zero detection | Finite support; coefficient N+1; all-unit sequence | Product and direct sum agree on finite supports, differ on all-unit sequence | New infinite-support target |
| Shuffle algebra, divided-power comparison and multigrading | Free ranks 0,1,2; characteristic two; empty summand family | Binomial coefficient and factorial conventions agree; no nonflat-module isomorphism asserted | None |
| Poincaré connection/cotangent notation | d=0,1; square-zero point | Vector kernel rank d; total cotangent rank 2d; duals agree | None |
| Formal-group moments | G_a over ℚ and 𝔽_p; n=0,1,p | Associated-graded diagonal factor n!; characteristic-p map can fail injectivity | None |
| Finite/completed coefficient sheaves | n=0,1,2; elliptic scheme | Ordinary ranks 1,2,3 versus connection ranks 1,3,6 | New rank Check |
| Fourier–Mukai and top completed cohomology | d=0,1; ordinary versus connection sheaf | Shift and canonical-line cancellation match ordinary completed formula | None |
| Isogeny maps, torsion splittings and equivariance | Identity; invertible degree; inseparable dual | Maps have specified direction; invertibility requires dual étaleness | None |
| Poincaré comultiplication and symmetric levels | n=0,1,2; n! invertible/noninvertible | Rational symmetric comparison does not assert integral invertibility | None |
| Square-zero logarithm class and first extension | H=0; id_H and zero for H≠0 | Identity class is nonsplit in positive dimension; zero class is excluded | None |
| Smooth d+ν model and Dolbeault comparison | g=1; degree 0 and 1; Hodge components | Tangent basis and dual forms stay distinct; connection restricts correctly | None |
| Ordinary CM completion and base change | p=2; dual numbers over O_Cp and modulo p^r | Torsion union is smaller integrally; modulo-p^r cofinality has both directions | None |
| Ordinary trivialization and torsion translations | Zero torsion; connected p-power torsion; generic fibre | Completed limits precede moment comparison; integral and generic-fibre maps differ | None |
| Period charts and birational Betti rank | Point base; constant family; zero section; exceptional locus | Combined chart invertible; Betti projection kills base; birational assertion generic | None |
| Betti form, positivity and scaling | Principal elliptic; type (1,2); zero/negative multiplication | Computed factor two and polarization type agree | None |
| Kernel/rank, non-degeneracy and top wedge | Single fibre; diagonal elliptic family; torsion section; singular base | Real rank threshold is twice total complex dimension; smooth-base restriction retained | None |
| Curve degeneracy | Vertical fibre; torsion section; full constant family | Vertical Betti fibres discrete; sections/constant total family give leaves | None |
| Function-field trace and complement | Constant B; zero variety; non-isotrivial elliptic curve | Universal trace and isogeny complement valid over algebraically closed characteristic-zero constants | Extended hypotheses and locator |
| `BettiTorus`, `torusCharacter`, `torusAnnihilator` | n=0; weights (1,−1); zero weight; H=0,whole torus,order two | a−b; annihilators ℤⁿ,0,2ℤ respectively; last is nonsaturated | None |
| Closed-subgroup character separation and countability | n=0; disconnected subgroup; dense cyclic subgroup | Closedness is essential; finite-generation of annihilator gives countability | None |
| Tits and free-matrix growth | Trivial/n=0 group; positive words of lengths 0,1,2 | Trivial group fails hypothesis; word counts 1,2,4 and exponent log2/logc positive | None; Tits locator remains uncertified |
| Invariance of domain | m=0; empty U; identity map | Equal-dimensional openness consistent; injectivity/continuity explicit | None |
| `constantRankLocal` | Zero map; identity; coordinate projection; k=1,∞,ω | Projection form and fibre dimension m−r agree | README/Lean aligned |
| `riemannGoodCover` | Empty surface; ℂ; compact Riemann surface | Empty members permitted; relatively compact countable refinement with contractible intersections | Analytic hypothesis added |
| Fixed homology, equivariant Hom and trace | Zero invariant space; constant family; finite cover | Hodge and global equivariance required; fibrewise Hom alone insufficient | None |
| GH generically special definition and APIs | Constant genus-two curve; torsion multisection; trace zero | Constant subvariety need not be a torsion coset; total dimension includes S | General constant field retained |
| Conditional Ax-type alternative | Singleton; subtorus coset; parabola arc | First two satisfy arc implication; parabola has no permitted coset | Algebraic bridge explicitly requested |
| Algebraic-to-Ax-type supplier contract | Point; abelian-subvariety translate; parabola | Positive controls agree; closed definable alone is insufficient | New supplier gap |
| Betti-leaf transport | Identity loop; torsion section; isolated vertical point | Nonisolated hypothesis essential; group homomorphisms preserve transport | None |
| Free curve monodromy and invariant homology | Trivial connected closure; nontrivial semisimple closure; finite index | Tits applies only in second case; fixed classes give trace on appropriate cover | None |
| Fibre subvariety alternative and virtually invariant kernels | Point; whole fibre; positive-dimensional stabilizer; finite étale cover | Ax input, monodromy type and no invariant vector all needed | Explicit Ax-type dependency |
| Uniform Manin–Mumford supplier contract | Empty fibre; full A; torsion/non-torsion singleton | Uniform bound permits empty union; only torsion translates survive | New supplier gap |
| Lang–Néron and bounded-degree torsion contract | K=k; A=0; geometric trace zero; D=1 | Trace quotient essential; curve-cover input needed for arbitrary D | New supplier gap |
| Finite maximal GH-special theorem and trace-free product reduction | Constant curve; torsion multisection; non-torsion trace-free section | Maximal family is respectively {X}, {X}, empty | Named target and three Checks |
| Curve specialness and full-rank algebraic points | Constant/trace-free families; vertical subvariety; total dimension too large | Analytic degeneracy theorem and finite-special application have distinct prerequisites | Needs updated |
| Pure-part height and volume targets | Upper-half-plane balls; γ_N translation; fundamental domain; point projection | Area π(T+T⁻¹−2), N²<T+T⁻¹−2, translate area π/3; point case excluded | Three explicit targets |
| Mixed growth, stabilizer, normality and quotient induction | Pure projection point/positive dimension; original/very-general pair | Vertical case separate; normality only after stated Hilbert reduction | Growth Needs repaired |
| Finite weakly optimal data | Point; varying coset point; zero defect | Finite rational data does not force finitely many orbit points | None |
| Gao degeneracy loci, closedness and quotient criterion | Point; torsion section; equality threshold; branched graph; exceptional ℙ¹ | Strict inequality and jumping fibres retained; rank-drop locus differs | None |
| Dominant products and fibre-power/difference induction | Constant stabilizer; t≥dim S; multisection; reducible generic fibre | Isotrivial stabilizer allowed; negative rank lower bounds harmless; components retained | None |
| Universal-curve and difference applications | g=2; ℓ=3; M=3g−2; level cover | Fine moduli and family required; finite étale rank descent explicit | None |
| Compact lattice image limit and boundaries | d=0; constant/zero matrix; ℓ^n id; ℓ=2 | Compact preimages give intersection; powers intersect in zero | Two boundaries proved |
| Frobenius polynomial, Weil numbers and point counts | Dimension zero; elliptic curve; product of two elliptic curves; real √p; 1 | P=1; quadratic/quartic conventions agree; 1 fails q>1 Weil condition | Quartic Check added |
| Tate isotropic-image, split-prime and full faithfulness | Zero A; diagonal product; ℓ≠p; finite/infinite base field | Finiteness hypothesis and split-prime step remain explicit; final finite-field domain retained | None |
| Monic lifting and fixed resultant congruence | Zero ring; unit ideal; degree zero; degree drop | Leading coefficient can be chosen 1; fixed Sylvester size preserves congruence | None |
| Shifted-factor slope | e=0; S=1; inseparable R; equal characteristic; degree>2 | Quotient determinant yields nd·e plus stable constant; eventual nonzero guarded | None |
| General/p-adic resultant recognition | P=1 versus X; repeated factor; infinite residue field; incomplete DVR | Dense tests distinguish multiplicity; zero resultant excluded; no completeness needed | None |
| Dieudonné length and saturated injection | Identity; [p]; connected kernel; perfect infinite field | Cokernel length matches p-part of degree; points alone miss connected torsion | None |
| Characteristic polynomial and Frobenius adapter | Arbitrary nonsemisimple u; π; a=1,2 | Polynomial comparison applies to u; semisimplicity only applied to Frobenius | None |
| Cyclic Frobenius block and commutant dimension | a=1; split matrix algebra; product coefficient algebra | Dimension a²; all idempotents retained; Σd_i e_i² for commutant | None |
| Rational/integral p-Tate and Brauer invariant | A=0; ramified/unramified K; a=1,2 | Saturation and opposite algebra retained; invariant f_v ord_v(π)/a | None |
| Honda–Tate and nonreal prime-field orders | π=±√p; nonreal simple class; n=0; p=2 | Real quaternion case distinct; orders contain π and p/π | None |
| Marked/unmarked and finite-support lattices | Identity marking; zero dimension; two composed markings; infinitely many changed primes | Left action and inverse C(f) transport correct; infinite support excluded | None |
| Adelic class set and prime-field p-component | Rational unit; conjugate compact; nonmaximal order; F,V-stable lattice | Double quotient differs from whole lattice-class monoid; V retained | None |
| Generator discriminant and ordered-root product | Degree 1; m=0,1; repeated/equal roots; q=1 | Index-square inequality; positive integer product, empty product 1 | None |
| Local/adelic stabilizer bounds and reduced norms | Repeated factor; ℓ=2; real quaternion d=0,1,2 | Declared local gap; quaternion d=1 separate; d≥2 norm comparison | None |
| `rationalOrbitCount` and fixed-level estimate | X empty; D=0; index one; infinite quotient | Explicit finiteness blocks zero-cardinality loophole; D³h bound | None |
| Lang surjectivity and line-bundle realization | A=0; elliptic; characteristic two; symmetric nonpositive map | Frob−1 étale; symmetric map need not be ample | None |
| Ambiguous classes and splitting density | Trivial unit quotient; ramified prime; nine square classes | Quotient bounded by class number; density 1−2⁻⁹ outside finite ramification | None |
| CM elliptic existence and point groups | Split p; p=2 traces ±1; p=3 trace 3 | Norm-p construction; counts 2 and 8 at p=2; odd-prime exception not imported | Pagination fixed |
| Hermitian masses and squarefree polarization bound | g=0,1,2; K=ℚ(i); no principal polarization | Mass 1/4 versus count 1; factorial coefficient 1/2; zero count permitted | None |
| Power-sum reconstruction and polynomial count | g=0; q=0,1 algebraically; q=2,g=1 for count | Newton signs and reciprocity reconstruct; enlarged interval constant valid | None |
| Isogeny/isomorphism asymptotics and ppav exclusion | Fixed q; small n with negative DPH lower bound; uniform/nonuniform error | Log only after positivity; 69/4=17+1/4 requires uniform assumption; CM growth dominates g² | None |

## Verification outcomes

- Final required elaboration of `packages/AbelianSchemesAndArithmeticModuliPartII/Suggested.lean`, run from the pinned content checkout: exit 0, exactly 24 `declaration uses 'sorry'` warnings, no other diagnostics. The file has 3 definitions, 2 abbreviations, 28 theorems and 6 proved examples. No Tau Ceti import or prerequisite module build was needed.
- A scratch copy with `#check @name` for the infinite-support target, both repaired analytic signatures and both proved lattice boundaries also elaborated: exit 0, the same 24 warnings. The analytic instance, regularity/rank assumptions, direct-sum domain and primality binders are retained.
- Earlier elaboration exposed a direct-sum binder syntax error and docstring placement before a scoped command; both were corrected. One invocation from the board checkout found no default toolchain and was rerun from the required content checkout. A missing scratch-probe launch followed a strict name-matching assertion; the assertion and probe were corrected. These failures do not remain in the final checks.
- Required dependency command: exit 0, with exact output:

```text
depcheck: 9 roadmaps, 77 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line.

- `git diff --check`: exit 0. Structural checks found all 33 named Lean declarations in the README, all 8 gap slugs with matching supplier-contract lines, 21 unique complete source records, and no plan change outside its top-level `gaps`. No admitted data, admitted examples, extra imports or `set_option` were introduced.

## Maintainer consequences

ShimuraVarieties §§P.1,3.5a–3.5d must supply `gap:algebraic-betti-ax-type`; AbelianSchemesAndArithmeticModuli A6 must supply `gap:uniform-manin-mumford` and `gap:lang-neron-modulo-trace`. These contracts do not claim those supplier targets exist. No merge-order relocation or upward supply edge is requested. The inherited merge-order insertion requires action outside this package.

No existing named Lean declaration was removed or renamed. `riemannGoodCover` gains an analytic-manifold hypothesis. The function-field-trace and GH-special README definitions now admit algebraically closed characteristic-zero constants, as needed by their general finite-special application. The two removed identifiers, `completedPoincare_base` and `frobeniusPolynomial_native`, were README Check labels and are replaced by the labels reported above. Geometric consumers otherwise keep their names.

ConradTrace was fetched through the sources service from the author's public page and is recorded once in the manifest. The Ax-type bridge is cited through the explicit GH statement; no missing original text is needed for that contract. Tits remains settled as uncertified. No commit, merge-order edit or external write was performed. Fresh independent review remains required.
