# Review of PeriodsAndSpecialValues (pull request #1496 at 58a34e8)

**Verdict:** needs changes

## R01 (P1) — Repoint the relative K-theory contract to its actual owner

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:200`, also lines 788, 1005 and 1059. The contract attributes “relative triples for an additive functor” and “the stable automorphism boundary” to GeneralAlgebraicKTheory §§4.15–4.16.

**Claim:** these sections supply the relative group and boundary used to construct the equivariant obstruction.

**Witness:** `TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:899` is now “Additive automorphisms and split-exact Q-theory”; §4.15 is absent. Its scope at line 7 imports triples and the boundary from AlgebraicKTheory §§3.2–3.3.

The actual construction is in `TauCetiRoadmap/AlgebraicKTheory/README.md:355` and `:372`: the relative triple presentation and the boundary from additive automorphism K₁. GeneralAlgebraicKTheory §4.17 adds exactness at the target K₁ without fullness. This is supplier drift, rather than a request to construct another relative K-group here. Both owners precede this consumer.

**Repair:** cite AlgebraicKTheory §§2.2, 3.2–3.3 for automorphisms, triples and the boundary throughout the supplier contract and affected Needs lines. Retain GeneralAlgebraicKTheory §§4.16–4.17 only for the Q-comparison and non-full exactness, and retain its separately used §§6.19 and 12.11. Test the repointed interface on ℤ→ℚ: the class of multiplication by 2 has valuation 1 at 2, multiplication by 1 has valuation 0, and composition multiplies scalars and adds valuations. These are the same signs required by PS.5.1; no change of the obstruction formula is needed.

## R02 (P2) — Retire the two supplier gaps already covered by the stated owners

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:98–106`, compared with `packages/PeriodsAndSpecialValues/design/plan.json:22–31`. The active gap list still asks for the K3 “integral H² cup lattice” and “primitive-embedding uniqueness … and indefinite even-unimodular classification”.

**Claim:** these remain required extensions of K3SurfacesAndSymplecticBoundedness and IntegralLattices, respectively.

**Witness:** `TauCetiRoadmap/K3Surfaces/README.md:314` supplies the actual integral cup lattice. `TauCetiRoadmap/IntegralLattices/README.md:1559` and `:1643` supply primitive-embedding uniqueness and indefinite classification. The reviewed README already consumes these owners.

Re-raised: b/F08 in `packages/PeriodsAndSpecialValues/reports/FIX-RT-PeriodsAndSpecialValues~1.md`.

That repair's reason was that the completed lattice roadmap excludes classification and the geometric K3 theorem still requires a supplier extension. The active IntegralLattices roadmap on main, and K3Surfaces at the supplied head, now provide the exact inputs; the final README itself cites them. Thus the reason no longer supports keeping these extension requests. This finding does not ask this package to edit a supplier or re-plan its theorem. Neither slug occurs under Exact supplier contracts, so retaining them also gives intake a different contract from the one presented to implementers.

**Repair:** retire `gap:k3-betti-even-unimodular` and `gap:indefinite-lattice-classification` from the active gap list, retaining the explicit K3Surfaces and IntegralLattices contracts at lines 98–106. On the application, Λ=U³⊕E₈(−1)² has rank 22, determinant −1 and signature (3,19); the orthogonal complement used in PS.8.4 has rank 19 and discriminant length 1, so 19≥1+2. These inputs remain available with no additional supplier extension. Reconcile the other three registered slugs with their now-local constructions as described below; do not announce duplicate work to suppliers.

## R03 (P3) — Register the two newly cited works

**Location:** `TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2559` and `:2580`; source inventory `packages/PeriodsAndSpecialValues/sources.toml`.

**Claim:** KZ supplies the period-conjecture formulation and Scholl supplies the eigenmotive construction, but neither work has a source-register entry.

**Witness:** the register contains neither author/title pair. The legal author copies are readable: KZ §4.1 at KZ line 1324, and Scholl Theorems 1.2.1/1.2.4 at Scholl lines 103/118.

**Repair:** add one record per work, using the existing README keys `KZ` and `Scholl`, their actual section/theorem locators, cited-for targets and sources-service provenance. Keep author-copy numbering explicit. Searching by title and author found no alternate existing key. The access test succeeded for both works, so this repair needs no new source request or duplicate entry. This review has not edited the register.

## Verified sound

The complete 2,580-line README and 237-line Lean file were read. The review covered all 81 PS subsections, their API bullets, conventions, examples and Needs lines. Every subsection has at least three Check bullets. The observations below are finite adversarial tests and source/interface checks, not proofs of the planned theorems.

The worker's push gate passes, including the targeted build, import rules, absence of sorry'd data and `set_option`, stray files, source-material checks and outside-folder changes. HEAD was confirmed as `58a34e8553ec71438b8edeb983a3871567274658`; the diff outside this roadmap is empty. No worktree file was changed. The independently rerun dependency check returned:

```text
depcheck: 204 roadmaps, 1629 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This does not detect the stale section ownership in R01.

Direct `lake env lean` elaboration passed with exactly the 13 expected sorry warnings. A scratch copy then printed all 38 elaborated declarations: 25 definitions and 13 theorems. Their signatures agree with the README, including the positive-index hypothesis on summability, admissibility on both product factors, `Fact (Nat.Prime p)` on both p-adic sums, strict bounds on λ and positive N in the midpoint estimate, and `Module.Finite` in the dimension conclusion. No section binder was lost and no signature change is requested. Each sorried theorem was tried separately with `simp`, `rfl` and `infer_instance`; all 13 remained unproved. Searches by object found no single pinned lemma giving one of these full headlines. The small values below belong in the README and were not added to Suggested.lean.

The README's headline families are: comparison determinants and Deligne periods; Dirichlet/modular period algebraicity and Hasse–Weil/functional-equation transport; marked formal-period comparison; fundamental-line and regulator comparisons; integral and equivariant Tamagawa formulations and proved-case transport; Bloch–Kato, elliptic and Rankin–Selberg comparisons; period-integral inequalities and covariance; quartic Picard–Fuchs, monodromy, symmetric-square and integral mirror-map results; quintic semistable and geometric Frobenius comparison; and motivic Hoffman basis with numerical spanning. Conjectures are explicitly predicates, not promised general proofs. The 13 statable headlines are present. The module docstring names the remaining families and their missing geometric, motivic, Selmer or determinant-category carriers. It does not replace those carriers with arbitrary scalar data.

### Seeded source sample

- **Fixed-fibre projective map, README:1912–1923.** Park Definition 4.8/Remark 4.9, printed p.442, are at Park line 1173 and line 1180; the radius algebra is explicit at line 1212. Theorem 4.11, printed p.443, begins at line 1233 and imposes the valuation conditions. Corollary 4.12, printed p.445, at line 1345 requires a smooth complete intersection. Definition 3.1, printed p.433, at line 677 supplies the factorial, π and ℏ factors. Lemmas 2.2–2.3 and Proposition 2.4, printed pp.430–432, at lines 548, 562 and 594 supply the two contractions and their target. Proposition 5.2, printed p.449, at line 1568 includes the factor q in the Frobenius diagram. The choice π^(p−1)=−p is compatible with the γ-choice explicitly discussed at Park line 1433. The README's passage through varying positive radii and finite coefficient extension is a proof target built from these results; it is not misrepresented as a verbatim theorem of Park. The computed top-form sign and two q factors are recorded below.
- **Residue coordinates and the small prime, README:1925–1933.** SH Lemma 4.8, printed p.6, is at SH line 271; its proof at lines 278–286 gives the s-recurrence used to form D. Park's map above supplies the factorial diagonal. Multiplication gives the displayed R, determinant 12 and 3-adic length one under the explicitly conditional residue-lattice assumption. SG Lemma 5.6, printed p.30, at SG line 1082 requires p>dim(V); it cannot justify integral divisibility for this threefold at p=3. The README says exactly this and distinguishes R from the unknown integral-lattice matrix C.

There are no additional locators labelled unverified in the README. The two settled access limitations are recorded below. Scholl and KZ were also read through legal author copies obtained by the sources service; Scholl Theorems 1.2.1/1.2.4 at Scholl lines 103/118 distinguish the Chow projector from the homological eigenmotive, matching PS.1.6.

### Computed adversarial table

Values are exact unless marked ≈. “Retain” means the instance did not refute the stated claim; it is not a certification of its general proof. Related API statements share a row only where the same calculation tests their source, target and normalization. The 105-row table includes every PS subsection, all 38 Lean declarations, both seeded targets, and the targets touched by the findings.

| Statement | Instances tried | Computed values on the two sides / wrong-model control | Result | Change |
|---|---|---|---|---|
| PS.0.1 comparison matrix and determinant; basis change, block sum | P=diag(2,3), A=diag(5,1), C=diag(1,7); rank 0 | det(C⁻¹PA)=30/7=6·5/7; det(∅)=1; block determinant 2·3=6 | Consistent; controls discriminate | Retain; inverse comparison and grading are explicit. |
| PS.0.2 involution and real eigenspaces | swap matrix; Tate line m=0,1 | F²=I; dimensions (+,−)=(1,1); Tate eigenvalues 1,−1 | Consistent; controls discriminate | Retain; not merely an arbitrary involution unrelated to geometry. |
| PS.0.3 coefficient-field period class | E=ℚ(√2), multiplier √2 at its two embeddings | embedded multiplier=(√2,−√2); (√2,√2) is not that multiplier | Consistent; controls discriminate | Retain simultaneous E× quotient, not independent coordinate quotients. |
| PS.0.4 plus/minus determinant and twist | ℚ(0), ℚ(1), zero-dimensional space, zero comparison | c⁺(ℚ(0))=1; c⁻(ℚ(1))=2πi; empty determinant=1; zero map determinant=0 | Consistent; controls discriminate | Retain nonzero comparison hypothesis and twist switch. |
| PS.0.5 Tate Hodge versus geometric period | m=1 | native lattice map sends 1↦1; geometric comparison scalar=2πi; weights/types −2 and (−1,−1) | Consistent; controls discriminate | Retain adapter; native tate does not supply the scalar. |
| PS.0.5 elliptic comparison, second-kind differential, marking | λ=1/2, K≈1.854075, E≈1.350644 | J=2(K−E), H=2E; det[[2K,2J],[2iK,2iH]]=4πi; residues d(2/s)=0, ds/s=1 | Consistent; controls discriminate | Retain exact integration/inverse distinction. |
| PS.0.5 cycle basis change | B=[[1,2],[0,1]]; doubling a cycle | B⁻¹=[[1,−2],[0,1]]; doubled-cycle sublattice index=2, not 1 | Consistent; controls discriminate | Retain primitive marking requirement. |
| PS.1.1 Euler factors, reciprocity, direct sum | q=2,s=2, unit and doubled unit; rank 0 | (1−1/4)⁻¹=4/3; doubled factor=16/9; empty factor=1 | Consistent; controls discriminate | Retain reciprocal and multiplicativity. |
| PS.1.1 inertia/monodromy and conductor | rank-two Steinberg block; ℚ(i)/ℚ | dim ker N=1 versus full rank 2; conductor 4 versus trivial conductor 1 | Consistent; controls discriminate | Retain ker N and ramification data; no good-primes-only replacement. |
| PS.1.2 Γ normalization and multiplicities | Γℂ(1); two copies; Γℂ(1/2) | 1/π versus half-normalized 1/(2π); two-copy ratio 4; Γℂ(1/2)=√2 | Consistent; controls discriminate | Retain pinned Deligne normalization. |
| PS.1.2 middle Hodge summand | rank-three Sym² example at s=3 | correct Γℂ(3)Γℝ(3)=1/(4π⁴); determinant-parity substitute gives 1/(2π⁴) | Consistent; controls discriminate | Retain eigenspace multiplicities; determinant shortcut expressly excluded. |
| PS.1.3 critical integers | ℚ(0); Hodge pair (0,3),(3,0) | ℚ: 2 and −1 critical, 0 and 1 not; pair: interval {1,2,3} | Consistent; controls discriminate | Retain poles as analytic poles, not total Gamma values. |
| PS.1.4 normalized-value predicate | ζ(2); zero value with nonzero period | ζ(2)/(2πi)²=−1/24; completed ratio=−1/(24π); zero quotient=0 | Consistent; controls discriminate | Retain finite L-value and algebraicity, not nonzero-unit condition. |
| PS.1.5 Dirichlet character orientation | conductor 5, χ(2)=i; odd twist | local polynomial 1−iT versus wrong inverse 1+iT; odd period factor 2πi·τ(χ) | Consistent; controls discriminate | Retain geometric/arithmetic Frobenius distinction. |
| PS.1.5 negative arguments and omitted factors | trivial character, n=2; vanished Euler factor | −B₂/2=−1/12=ζ(−1); vanishing correction has order at least 1, not an invertible value | Consistent; controls discriminate | Retain Bernoulli endpoint and leading-term transport. |
| PS.1.6 eigenprojector and modular signs | weights 2 and 4; rank-three ambient projector | weight 2 has critical m=1 and c⁻; weight 4 has m=1,2,3 with alternating signs; desired projector rank=2 versus 0 or 3 | Consistent; controls discriminate | Retain local eigenmotive construction, not an arbitrary rank-two representation. |
| PS.1.7 functional-equation predicate | N=4, unit N=1; zero continuation | ε²=4 gives ε=±2 and normalized sign ±1; unit ε=1; zero germ has no finite order | Consistent; controls discriminate | Retain normalization and nonzero germ. |
| PS.1.8 alternating Hasse–Weil product | elliptic curve over 𝔽₂ with #E=3, a=0; a point | Z(T)=(1+2T²)/((1−T)(1−2T)); coefficient of T in log Z is 3; point gives (1−T)⁻¹ | Consistent; controls discriminate | Retain cohomological sign (−1)^i. |
| PS.2.1 evaluation, Stokes, products | interval [0,1], dx; reverse orientation; product; pair (X,X) | integrals 1=x(1)−x(0), −1, product 1; relative class/value 0 | Consistent; controls discriminate | Retain marked evaluation and boundary sign. |
| PS.2.2 inverse comparison and torsor operations | invertible scalar maps 2 and 3 | inverse(2·3)=1/6=(1/3)(1/2); inverse(2)=1/2, not 2 | Consistent; controls discriminate | Retain comparison direction, with domains specified. |
| PS.2.2 torsor inversion, noncommutative control | U=[[1,1],[0,1]], V=[[1,0],[1,1]] in GL₂ | (UV)⁻¹=[[1,−1],[−1,2]]=V⁻¹U⁻¹; U⁻¹V⁻¹=[[2,−1],[−1,1]] differs | Controls discriminate | Retain inverse-order law and specified torsor actions. |
| PS.2.3 Tate torsor localization | Tate variable t, inverse square, zero value | per(t)=2πi; per(t⁻²)=−1/(4π²); t↦0 cannot extend over t⁻¹ | Consistent; controls discriminate | Retain inversion of the actual Tate element. |
| PS.3.0 Tate-Hom/Adams comparison | (i,n)=(0,0),(1,1),(0,−1) | groups ℚ, F×⊗ℚ, 0 respectively; negative degree K₋₂=0 versus erroneous K₀=ℚ | Consistent; controls discriminate | Retain signed K-degree and negative-weight vanishing. |
| PS.3.1 determinant fundamental line and virtual objects | two odd lines; finite torsion module after rationalization | interchange sign −1; rationalized torsion module=0 with determinant 1 | Consistent; controls discriminate | Retain virtual category target; repoint relative-group citation per R01. |
| PS.3.2 real regulator trivialization | rank 0 and regulator 2I₂ | determinants 1 and 4; inverse trivialization gives 1 and 1/4 | Consistent; controls discriminate | Retain orientation; regulator cannot silently be inverted twice. |
| PS.3.2a number-field regulator ranks | ℚ,j=2 and j=3; imaginary quadratic | regulator ranks 0,1,1; corresponding Betti-plus dimensions 1,0,1 | Consistent; controls discriminate | Retain parity and embedding multiplicities. |
| PS.3.3 leading terms | germs 3s², 2/s, zero germ | orders 2,−1,undefined; leading coefficients 3,2,undefined | Consistent; controls discriminate | Retain nonzero meromorphic-germ premise. |
| PS.4.1 integral determinant and shifts | [O --π³→ O] in degrees (0,1) and (−1,0) | lattices π³O and π⁻³O; valuations 3 and −3 | Consistent; controls discriminate | Retain shift sign and perfectness premise. |
| PS.4.2 finite correction and nonregular coefficients | O/π³; trivial ℤ₂ module over ℤ₂[C₂] | length 3; reciprocal length contribution −3 after shift; Ext^{2k}(ℤ₂,ℤ₂)=ℤ/2 for every k>0 | Consistent; controls discriminate | Retain bounded-perfect hypothesis; finiteness alone is not substituted. |
| PS.4.3 local Euler factors and finite local condition | eigenvalue 3; V=ℚ_p(1) away from p | factor 1−3=−2 versus inverse −1/2; full H¹,H² each dimension 1, finite condition dimension 0 | Consistent; controls discriminate | Retain explicit complex and finite-condition correction. |
| PS.4.4 dyadic ordinary/Tate comparison | trivial and sign ℤ₂ representations of C₂ | trivial H^{2k}=ℤ/2 for k>0, odd=0; sign interchanges parity; comparison cone has unbounded nonzero cohomology | Consistent; controls discriminate | Retain exclusion of an automatic perfect integral model. |
| PS.5.1 relative boundary, lattice gluing (R01) | ℤ→ℚ, multipliers 2,1,1/2,3 | v₂=1,0,−1,0; v₃(3)=1; products add valuations | Citation defect R01 | Formula survives; correct owner is AlgebraicKTheory §§3.2–3.3. |
| PS.5.1 extended reduced norm | Hamilton quaternions over ℝ, scalar −1 | −1 is not a reduced norm; correcting by λ=−1 gives λx=1, which is | Consistent; controls discriminate | Retain positivity restriction and independence construction. |
| PS.5.2 ETNC obstruction sign | boundary value 1, regulator class −1 | δ̂(L*)+RΩ=1−1=0; subtraction would give 2 | Consistent; controls discriminate | Retain sum and inverse-line convention. |
| PS.5.3 shifted zeta isomorphism | order m=1, one shift | shifted order −1; d(C[1])=d(C)⁻¹; boundary sign changes −[C] to +[C] | Consistent; controls discriminate | Retain typed shift; not an unshifted trivialization. |
| PS.5.4 proved-case transport and rational characters | C₃, p=7; C₂ sign; away from 2 | nontrivial χ(C₃)=ω∈ℚ₇∖ℚ; inverse character ω²≠ω; sign(C₂)=−1; rational scalar 2 has all odd valuations 0 | Consistent; controls discriminate | Retain ℚ-valued scope, dual character and all required primes. |
| PS.6.1 motivic pair and triple condition | y²=x³−2, P=(3,5); zero motive | x(2P)=129/100; the weight −1 quotient can be 0 while Selmer rank≥1; zero dimensions all 0 | Consistent; controls discriminate | Retain triple hypotheses; negative weight alone is insufficient. |
| PS.6.2 local points, Haar normalization, Sha | scale local measure by 2 and covolume inversely; ℚ(1) | product 2·(1/2)=1; good factor 1−1/p; including place 2 changes reciprocal factor by 2 | Consistent; controls discriminate | Retain restricted product and small-open exponential domain. |
| PS.6.3 elliptic regulator and BSD quotient | Mordell–Weil sublattice index 3; 11a1 | regulator multiplier 3²=9; torsion 5 and Tamagawa 5 give factor 5/25=1/5 | Consistent; controls discriminate | Retain actual integral basis, minimal differential and full real period. |
| PS.6.4 rank-zero/one witness transport | 3(s−1) and 3(s−1)² | both leading coefficients 3; derivatives at 1 are 3 and 0; orders 1 and 2 | Consistent; controls discriminate | Retain exact-order input; no inference from first derivative alone. |
| PS.6.5 Tamagawa conjecture predicate | positive rational x, all valuations zero; only odd valuations zero | first gives x=1; second permits x=2 | Consistent; controls discriminate | Retain every prime in the rational conclusion. |
| PS.6.6 Rankin–Selberg normalization | consecutive ranks 2,3 and 3,4 | tensor ranks 6,12; twists 2,3 give weight −1 in each case | Consistent; controls discriminate | Retain motivic twist and central 1/2 normalization. |
| PS.6.7 scalar extension and rank implication | E-dimensions 0,1,2 | finite extension preserves 0,1,2; nonzero class gives dimension≥1, not dimension=1 | Consistent; controls discriminate | Retain annihilator/level-raising hypotheses. |
| PS.7.1 `legendreRadicand`, `legendreIntegrand` | λ=1/2, u=0,1/2,1 | radicands 1,17/16,2; integrands 2,8/√17,√2 | Consistent; controls discriminate | Retain real square root and positive domain. |
| PS.7.1 `legendreK`, `legendre_substitution` | λ=1/2; λ=0 boundary | both integrals ≈1.8540746773; boundary both π/2 | Consistent; controls discriminate | Retain parameter/modulus adapter; boundary equality is not a separate Lean target. |
| PS.7.1 `legendreMidpoint`, `legendre_midpoint_error` | λ=1/2,N=1; N=0 | midpoint≈1.9402850003; error≈0.086210323≤4√2≈5.65685425; N=0 total midpoint 0 is excluded | Consistent; controls discriminate | Retain N>0 and λ<1. |
| PS.7.2 normalized-value stability | denominators 1 and 2; numerator perturbation 1 | quotient errors 1 and 1/2 versus bounds 1 and 1/2; two order contributions 1+2=3 | Consistent; controls discriminate | Retain nonzero denominator and lower-bound premise. |
| PS.7.3 normalization covariance | scale period 2, basis index 2, four local measures by 2 | period multiplier 2; regulator multiplier 4; measure multiplier 16; inverse factors cancel in quotient | Consistent; controls discriminate | Retain separate covariances instead of an unexplained invariant scalar. |
| PS.7.4 period-conjecture predicate | evaluation ℚ[t]→ℚ at t=1 | nonzero t−1 maps to 0; injectivity false for arbitrary evaluations | Consistent; controls discriminate | Retain actual period algebra; conjecture not asserted as theorem. |
| PS.8.1 quartic family and quotient | t=1 versus t=0 | (1,1,1,1) has equation/gradient 0 at t=1; Fermat t=0 smooth although z=(4t)⁻⁴ undefined; quotient group order 16 | Consistent; controls discriminate | Retain geometric base independent of z chart. |
| PS.8.2 normalized residue form | t=0, z₃=1,2,0 | chart coefficients πi/2 and πi/16; z₃=0 excluded; omitting 2πi gives 1/4 and 1/32 | Consistent; controls discriminate | Retain form scaling, cubic denominator and chart domain. |
| PS.8.3 Picard–Fuchs operator | apply normalized operator to 1 | −24z=−3/(32t⁴); printed-source alternative gives −t²/8 | Consistent; controls discriminate | Retain corrected t-rescaling. |
| PS.8.4 marked orthogonal complement | T₀ with Gram G; K3 lattice; jumping fibre | det G=−4; Λ rank22, det−1, signature(3,19); complement rank19≥1+2; special transcendental rank can be 2 instead of 3 | Consistent; controls discriminate | Retain marked complement, not “transcendental lattice at every fibre”; retire obsolete gaps R02. |
| PS.8.4 isotropic period and gluing | p=i; M₂⊕T₀ | (v,v)=0, (v,v̄)=8; determinant −16 with index4 gives ambient determinant −1 | Consistent; controls discriminate | Retain integral gluing; rational direct sum is insufficient. |
| PS.8.4 primitive-embedding hypothesis | L=U⊕U⊕⟨−6⟩, vectors e₁+f₁ and 2e₁+2f₁+g | norms 2,2; divisibilities 1,2; rank gap4≥3, but no ambient isometry identifies them | Consistent; controls discriminate | Retain unimodularity; the broader source statement fails. |
| PS.8.5 monodromy and convention | unipotent around ∞, p=i | period coordinate maps to 4+i; all five MᵀGM equal G; ordered product I; (M∞−I)² has sole nonzero entry (3,2)=−64 and cube 0 | Consistent; controls discriminate | Retain column conventions and marked translation. |
| PS.8.6 `quarticA`, `quarticG`, Frobenius solutions | n=0,1,2,3 | A=1,24,2520,369600; G=0,104,12276,5632160/3; log coefficient starts 1 | Consistent; controls discriminate | Retain harmonic H₀=0 and factorial normalization. |
| PS.8.7 `quarticW0`, `quartic_symmetric_square` | z=0; first two coefficients | both constant terms 1; square of ₂F₁ starts 1+24z+2520z²; A gives the same | Consistent; controls discriminate | Retain complex norm bound; total ₂F₁ outside its radius is not continuation. |
| PS.8.8 conifold local solutions and reflection | local hypergeometric regular solution; two based loops | coefficient 1/32 versus wrong 3/32; fixed points ±i/√2 versus 1±i/√2 | Consistent; controls discriminate | Retain specified chart and conjugate loop distinction. |
| PS.8.9 `quarticMirrorCoordinate` | first four nonzero coefficients | q=z+104z²+15188z³+2585184z⁴; inverse Z=q−104q²+6444q³−311744q⁴ | Consistent; controls discriminate | Retain derivative 1 and branch normalization. |
| PS.8.10 modular relation and chosen branch | q through degree 3 | 1/j=q−744q²+356652q³; chosen Z has coefficient −104 at q² | Consistent; controls discriminate | Retain distinguished formal root; an unspecified algebraic root does not fix the coordinate. |
| PS.8.11 `quarticMirror_integral` | coefficients n=0,…,4; weaker localization model | 0,1,104,15188,2585184 are integers; q+q²/2 has coefficient 1/2 and fails ℤ-integrality | Consistent; controls discriminate | Retain all coefficients and all primes, not integrality after inverting 2. |
| PS.8.12 quintic invariant sector | diagonal group, S₅ transposition, p=3 | group order 125 is a 3-adic unit; 120 is not; transposition sends holomorphic form to −form | Consistent; controls discriminate | Retain G-invariants and S₅-stability, not natural S₅-invariants. |
| PS.8.13 connection and derivative basis | λ=1/5; nilpotent boundary | g=1/2, final connection column (−12,−25,−35/2,−5); N⁴=0, N³e₀=e₃; det D=1 | Consistent; controls discriminate | Retain δ and companion-matrix orientation. |
| PS.8.14 raw/normalized Frobenius and semilinearity | p=3; λe₃ | normalization p⁻²=1/9; F(λe₃)=λ³F(e₃), not λF(e₃) | Consistent; controls discriminate | Retain semilinear parameter and geometric normalization. |
| PS.8.15 `dworkSeries`, `dworkCoeff` | p=0,1,2,3; n=0,1,2,3 | p=0 gives exp(z), p=1 exp(2z); p=2 coefficients 1,1,1,2/3; p=3 coefficients 1,1,1/2,1/2 | Consistent; controls discriminate | Retain rational definition; summability theorems restrict to prime p. |
| PS.8.15 `dworkPairWeight` | n=0,…,5 | 0,0,0,1/2,1,35/24; at n=3 only (1,2) contributes 1/2 | Consistent; controls discriminate | Retain strict pair inequalities and empty sums. |
| PS.8.15 `dworkSigma0_summable` | terms B_n(n−1)!, n=20,40,80 | valuations p=2:3,7,16; p=3:4,10,18; p=5:3,6,13; p=7:2,5,10 | Consistent; controls discriminate | Retain every prime; the linear-minus-log estimate supplies the general limit. |
| PS.8.15 `dworkSigma2_summable` | same terms with pair weight | valuations p=2:−4,−2,5; p=3:0,5,12; p=5:1,3,9; p=7:0,3,7 | Consistent; controls discriminate | Retain convergence, not termwise integrality; logarithmic harmonic loss accounted for. |
| PS.8.16 boundary Frobenius matrix | p=3, lower-left C arbitrary | diagonal 27,9,3,1; NF=pFN has matching coefficient 27 on first link; pairing multiplier 27 regardless of C | Consistent; controls discriminate | Retain explicit Dwork-sum computation: horizontality/pairing alone do not determine C. |
| PS.8.16a semistable-model scope | N=2,p=3; N=3,p=3; r=2 chart | boundary two reduced points in first case; equation 0=0 in excluded case; xy=T has reduced crossing, xy=T² different total space | Consistent; controls discriminate | Retain N>1 and p∤N, with arbitrary admissible coefficients. |
| PS.8.16a blowup and base change | blow up origin of 𝔸²; pull back zero ideal to point | fibre is ℙ¹; blowup of point in zero ideal is empty | Consistent; controls discriminate | Retain flat base-change law and separate specialization statement. |
| PS.8.16a quintic specialization | N=5,T=λ,U=−5 | discriminant 1+5⁵λ⁵ is 0 at −1/5 and 2 at 1/5; −5 is a unit at 3 but not 5 | Consistent; controls discriminate | Retain correct sign and excluded prime. |
| PS.8.17 smoothness and projector | all coordinates nonzero; p=3,5 | singular equations force 1+5⁵λ⁵=0; 125 invertible at 3, zero in characteristic5 | Consistent; controls discriminate | Retain stated smooth base and prime-to-group-order hypothesis. |
| PS.8.17 fixed-fibre radius/degree relation (sample) | top form x^u t^s dx₁…dx₅dt | charge equation sum(u)=5s; total polynomial degree=6s; slope a in s becomes a/6 in total degree | Consistent; controls discriminate | Retain variable radii; one closed radius is not asserted to contain all dagger forms. |
| PS.8.17 fixed-fibre map T (sample) | u_s, s=0,1,2,3 | T images r₀,−r₁,2r₂,−6r₃; θ_w top sign −1 cancels the leading − in T | Consistent; controls discriminate | Retain −πℏ⁶ scaling, factorials and target H⁴(U). |
| PS.8.17 Frobenius and residue twist (sample) | q=3; two Euler contractions | contraction factor q²=9, Park factor q=3 gives TF_raw=3Fr_U T; residue contributes 3, total9 | Consistent; controls discriminate | Retain q⁻²F_raw and H³(V)(−1). |
| PS.8.17 residue coordinates (sample) | R=diag(1,−1,2,−6)D | R rows (1,−1,1,−1),(0,1,−3,7),(0,0,2,−12),(0,0,0,6); det12; v₃=1, v₇=0 | Consistent; controls discriminate | Retain rational map; integral lattice identification remains conditional. |
| PS.8.17 boundary-lattice consequence | p=3, Δ₃=25/648 | p³·24Δ₃/25=1 is integral, but v₃(Δ₃)=−4<−3; at p≥7 v_p(24/25)=0 | Consistent; controls discriminate | Retain bound −4 at3 versus −3 at allowed larger primes. |
| PS.9.1 `PositiveIndex`, `Admissible` | [],[1],[2,1],[0],[1,2] | positive: true,true,true,false,true; admissible: true,false,true,false,false | Consistent; controls discriminate | Retain positivity and descending-first-entry criterion. |
| PS.9.1 `DescendingTuple`, `mzvTerm` | k=[2,1], tuples (2,1),(1,2),(1,1),(1,0); empty | first allowed with term1/4; other three excluded; empty term1 | Consistent; controls discriminate | Retain strict descent and positive entries. |
| PS.9.1 `multipleZeta`, `mzv_summable_iff` | [],[2],[1],[1,2] | empty sum1 and ζ(2)=π²/6 summable; latter two diverge and Lean total tsum is0 | Consistent; controls discriminate | Retain positive-index hypothesis; junk total value is not analytic regularization. |
| PS.9.2 `mzvEncode`, `mzvDecodeAux`, `mzvDecode` | [],[1],[2,1],[0]; word001101; pending count1 with1 | encodings empty,1,011,1; decode001101=[3,1,2]; auxiliary decode=[2]; decode0=[] | Consistent; controls discriminate | Retain positivity for inverse laws; [0] is a discriminating negative control. |
| PS.9.2 `shuffles`, `stuffles` | words01,01; indices[2],[2] | shuffle multiplicities 4·0011+2·0101; stuffle 2·[2,2]+[4] | Consistent; controls discriminate | Retain multiplicities, not sets. |
| PS.9.3 iterated integrals and endpoints | ζ(2) word01; empty word; inadmissible1 | values π²/6,1,divergent endpoint; endpoint regularization assigns formal T to1 | Consistent; controls discriminate | Retain tangential specification; no ordinary integral at divergent endpoint. |
| PS.9.4 `mzv_shuffle`, `mzv_stuffle` | [2]·[2] | (π²/6)²=π⁴/36; shuffle 4ζ(3,1)+2ζ(2,2)=π⁴/36; stuffle 2π⁴/120+π⁴/90=π⁴/36 | Consistent; controls discriminate | Retain both admissibility hypotheses and descending words. |
| PS.9.5 two regularizations | [1,1] | stuffle polynomial (T²−ζ(2))/2; shuffle polynomial T²/2 | Consistent; controls discriminate | Retain distinct regularizations, not an equality before ρ. |
| PS.9.6 comparison operator ρ | 1,T,T²,T³ | 1,T,T²+ζ(2),T³+3ζ(2)T−2ζ(3) | Consistent; controls discriminate | Retain sign of odd coefficient and exponential normalization. |
| PS.9.7 regularized double shuffle | [1,1]; weight3 relation | ρ((T²−ζ(2))/2)=T²/2; constant relation ζ(2,1)−ζ(3)=0 | Consistent; controls discriminate | Retain full polynomial relation, not only T=0 by definition. |
| PS.9.8 mixed Tate category over ℤ | ℚ(1); Kummer class of2 | weight−2, graded index1; Kummer class ramifies at2 and is excluded from unramified-over-ℤ extensions | Consistent; controls discriminate | Retain integral-base condition. |
| PS.9.9 extensions and free Lie algebra | weights n=1,2,3 | Ext¹ dimensions 0,0,1; one odd generator at3 versus none at1 or2 | Consistent; controls discriminate | Retain number-field/ring-of-integers distinction. |
| PS.9.10 path torsor and finite coalgebras | words in two letters of length≤0,1,2 | dimensions1,3,7; 0 shuffle0=2·00 leaves length≤1; truncation-dual product00=0 | Consistent; controls discriminate | Retain finite subcoalgebras, not truncated shuffle subalgebras. |
| PS.9.11 motivic MZV algebra and stable kernel | unit and ζᵐ(2) | per(1)=1; per(ζᵐ(2))=π²/6≠0; neither is killed | Consistent; controls discriminate | Retain actual framed periods and maximal stable ideal construction. |
| PS.9.12 coaction and all cuts | word01; ζᵐ(2),ζᵐ(3) | Δ01=∅⊗01+0⊗1+01⊗∅; Δζᵐ(2)=1⊗ζᵐ(2); ζᵐ(3) also has ζᴸ(3)⊗1 | Consistent; controls discriminate | Retain A⊗H order and endpoint cuts. |
| PS.9.13 `hoffmanDim`, f-alphabet, dimension | weights0…12 | 1,0,1,1,1,2,2,3,4,5,7,9,12 from 1/(1−t²−t³) | Consistent; controls discriminate | Retain weight0 unit and even Tate generator. |
| PS.9.14 derivations and common kernel | weight3; ζᵐ(2,3) | no lower odd derivation at weight3, whose space has dimension1; D₃ζᵐ(2,3)=−2ζᴸ(3)⊗ζᵐ(2) | Consistent; controls discriminate | Retain correct strict weight range and coaction orientation. |
| PS.9.15 framed relative products and shifted all-two integrals | one and two twos after initial zero | values −2ζᵐ(3), and −2ζᵐ(3)ζᵐ(2)+2ζᵐ(5) | Consistent; controls discriminate | Retain motivic product/boundary construction; numerical identities alone do not imply it. |
| PS.9.16 `zagierCoeff` | (a,b)=(0,0),(1,0),(0,1) | coefficients (1), (−2,9/2), (3,−11/2); denominators1 or2 | Consistent; controls discriminate | Retain exchange of a,b when switching from ascending source notation. |
| PS.9.17 `oneThree`, `zagier_evaluation`, `mzv_allTwo` | (0,0),(1,0),(0,1); m=0,1,2 | indices[3],[2,3],[3,2]; ζ(3)=ζ(3); mixed values −2ζ3ζ2+9ζ5/2 and3ζ3ζ2−11ζ5/2; all-two1,π²/6,π⁴/120 | Consistent; controls discriminate | Retain empty twos and natural-subtraction range r≤a+b. |
| PS.9.18 motivic Zagier lift | same weight5 pair, D₃ | coefficients −2 and3 agree with coaction; possible kernel term lies in the ζᵐ(5) line | Consistent; controls discriminate | Retain kernel argument plus period evaluation, not an unjustified injective period map. |
| PS.9.19 `IsHoffman` and level filtration | [],[1],[2,3]; weights5,6 | membership true,false,true; weight5 has two level1 words; weight6 levels0/1/2 have counts1/0/1 | Consistent; controls discriminate | Retain count of threes as level. |
| PS.9.20 Hoffman cut matrix | weight5 coefficient matrix | [[3,−11/2],[−2,9/2]] has det5/2; doubling its second column gives mod2 [[1,1],[0,1]] | Consistent; controls discriminate | Retain column-dependent scaling and invertible reduction. |
| PS.9.21 p-adic determinant criterion | p=3 [[1,1],[3,1]]; p=2 [[1,1],[2,1]]; all-ones matrix | determinants−2,−1,0; first two unit reductions, last singular and violates strict lower-entry valuation condition | Consistent; controls discriminate | Retain nonzero diagonal and strictness. |
| PS.9.22 motivic Hoffman basis | weights0,1,5 | basis sizes1,0,2 agree with d₀,d₁,d₅; no weight1 generator | Consistent; controls discriminate | Retain motivic basis, no numerical independence claim. |
| PS.9.23 `numerical_spanning`, `mzv_span_finrank_le` | weights0,1,2,5 | numerical dimensions1,0,1,≤2; finite-generation conclusion included; (2πi)²=−24ζ(2) | Consistent; controls discriminate | Retain numerical upper bound and Tate localization for mixed Tate periods. |

### Pinned-library and ownership audit

The native objects were searched by mathematical object and defining operations, not just by the proposed theorem names. No roadmap-owned declaration has been given a fully qualified name already used by the sibling files examined. Searches included the main repository, the board packages, the supplied open checkouts, and the roadmap index's `grep`/`show` interface. Scope comparisons included EllipticCurvePeriodsAndModularParametrizations, HypergeometricMotives, Polylogarithms, MotivicEtaleKTheory, BorelRegulators and the K3/lattice suppliers. The specialized quartic/quintic calculations and descending multiple-zeta/Hoffman constructions belong here; generic elliptic integrals, word shuffle, motivic periods, regulator classes and lattice classification retain their existing owners.

Declarations opened at the pins included:

| Pinned declaration / file and line | What it actually provides; limitation checked |
|---|---|
| `harmonic`, `Mathlib/NumberTheory/Harmonic/Defs.lean:23` | Sum of reciprocals 1 through n over ℚ, H₀=0. This fixes the quartic logarithmic coefficients. |
| `Complex.Gammaℝ`, `Complex.Gammaℂ`, `Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45` and `:53` | π^(−s/2)Γ(s/2) and 2(2π)^(−s)Γ(s); the factor 2 is present. |
| `Complex.Gamma_eq_zero_iff`, `Mathlib/Analysis/SpecialFunctions/Gamma/Beta.lean:447` | Total Gamma is zero at nonpositive integers; analytic criticality cannot be defined by those total values alone. |
| `ordinaryHypergeometric`, `Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:81`; radius theorem `:204` | Sum of the ₂F₁ formal multilinear series; no chosen analytic continuation or generic ₃F₂ carrier. The radius theorem has parameter non-pole hypotheses. |
| `TauCeti.Hodge.tate`, `tate_F`, `TauCeti/Geometry/Hodge/Tate/Basic.lean:91` and `:100` | Weight −2m, filtration cut at −m, native lattice inclusion. It does not identify the geometric comparison with 2πi. |
| `TauCeti.TensorWords.of`, `deconcatenation`, `TauCeti/LinearAlgebra/TensorCoalgebra/Coaugmented/Basic.lean:84` and `:228` | Direct sum including degree zero, coproduct over all cuts. It is not the generic shuffle product. |
| `TauCeti.IntegralLattice.form_ofGramMatrix_basisFun_apply`, `TauCeti/LinearAlgebra/IntegralLattice/StandardCoordinates.lean:53` | Coordinate pairing xᵀGy for symmetric integral G on the rational ambient module. It is not a geometric K3 marking. |

The two citation-resolver leads, `TauCeti.Real.legendreK` and `TauCeti.Real.legendreEc`, are not pinned declarations. They resolve as the planned canonical names in `TauCetiRoadmap/EllipticIntegrals/README.md:150–184`, with Milestones 1 and 3 at lines 232 and following. The target identifies them as roadmap inputs, and explicitly explains the temporary parameter adapter in Suggested.lean. They are not reported as missing pinned APIs. The main-branch EllipticIntegrals and completed HodgeStructures roadmaps were used as shape and convention comparisons.

Resolved supplier contracts, grouped by their actual input, are recorded below. These are section resolutions; only the specific calculations above test mathematical consequences. Broad labels such as MC.2 were resolved to the concrete numbered subsections, rather than assumed to identify a declaration.

| Input | Resolved owner and section; witness location |
|---|---|
| Elliptic differential, Tate module, heights, Selmer/Sha | EllipticCurves Layers 1,2,4,6,7; `TauCetiRoadmap/EllipticCurves/README.md:335` begins the layered build. |
| Commutative determinant lines and acyclic signs | PadicMeasuresIwasawaAlgebras §5.1, `README.md:3172`; projective determinant at3196, acyclic trivialization at3250, characteristic divisor at3316. |
| Reduced norms and their images | ClassicalArithmeticCompletion §§7.10,7.60, `README.md:14550` and15856. |
| Lattices and geometric K3 marking | IntegralLattices 5G,5H,6A, `README.md:1541,1559,1643`; K3Surfaces §2.1 at304; K3SurfacesAndSymplecticBoundedness §§3.1,4.2 at525,567. |
| Quotients, modifications and blowups | SchemeAndStackFoundations §§1.17,1.23,4.11, `README.md:2624,3021,5528`; its blowup input is StableReduction Layer4. |
| Pure and mixed realizations, relative pairs, formal periods | MotivesAndAlgebraicCycles §§2.3,2.5–2.7,4.13,4.17–4.19,5.7,6.7–6.10, `README.md:369,403,415,433,797,872,886,913,1052,1211,1227,1248,1264`. |
| Motivic cohomology/Adams weights | MotivicEtaleKTheory §§2.2–2.4, `README.md:282,305,328`; negative-weight extension remains local PS.3.0. |
| Characteristic-zero compactification and comparison | ResolutionOfSingularitiesCharacteristicZero §§6.1–6.2 at881,893; ComplexComparisonPartII C5.1–C5.7 at2335,2563,2892,3014,3396,3721,3846. |
| K-theory ranks and real regulators | ArithmeticKTheory §§3.3–3.4 at1138,1190; BorelRegulators §§2.1–2.3,6.0a–6.3 at247,267,287,724,753,772,795,817. |
| Full Weil–Deligne parameters and arithmetic adapter | SmoothRepresentationsOfLocalGroups full-WD and Frobenius-semisimplification targets, `README.md:4436–4690`; ArithmeticGaloisRepresentations §§2.4–2.6,3.3 at1806,1902,2008,2651. |
| Compatible systems and common coefficient field | SmallRamificationAndAbelianVarietyBaseCases §5.0d at1985/1998 supplies the raw carrier for n≥1; PotentialModularityAndCompatibleSystems §§1.6,1.7,1.15 at210,242,380; AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6 at1818,2149, strong-field statements at3287,3312. |
| Local/global L-functions and finite Euler corrections | AutomorphicLFunctionsAndLocalFactors AL.1,AL.3–AL.5; AL.1 local normalization starts at885, epsilon/Gauss interfaces at1139–1243, archimedean factors at1255. |
| Bernoulli and modular critical values | DirichletPadicLFunctions §0.4 at229; ModularSymbolsPadicLFunctions §§1.1–1.2 at1323,1380; ModularCurvesPartII §§14.1–14.4a at3498–3599; ModularForms Layer8 at764. |
| Abelian Hⁱ compatibility and zeta duality | NeronModelsAndSemistableAbelianVarieties §6.10 at4117; WeilConjectures WC.1–WC.2 at236,624; EtaleDualityAndPerverseSheaves §§0.5–0.6 at668,821. |
| Ordinary-real versus Tate compact support | NoncommutativeAndEquivariantIwasawa F.3 at1844; ArithmeticGaloisDuality D7.3–D7.7 at5073,5392,5576,6018,6222. |
| Finite local conditions, Selmer complexes, determinants | SelmerIwasawaCohomology §§2.9,2.21,2.23–2.24,3.14,4.7,4.9,4.24–4.25 at562,849,918,936,1631,1880,1923,2298,2310; FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.P3/P5 at1412,1486. |
| Relative K-theory, determinant laws, zeta isomorphisms | Relative group/boundary corrected in R01; IntegralHeckeAndGaloisDeterminants §0.6 at1022; NoncommutativeAndEquivariantIwasawa §§7.9,7.13–7.15 at3840,3964,3988,4097; IntegralIwasawaTheory §§11.1,11.7 at1443,1551. |
| Crystalline, log and rigid comparisons | CrystallineCohomology CR.3/CR.5–CR.7; PadicDifferentialEquationsAndRigidCohomology RD.1.46/1.63 at3361,3806, RD.4.20–4.24/4.29/4.31/4.36–4.38 at7562–7978, RD.5.107–5.109/5.115 at11096–11324, RD.7.1/7.10 at13813,14032. The relative lifting hypotheses remain obligations in PS.8.17. |
| Tate cusp and analytic modular invariant | ModularCurvesPartII §3.6 at1050; ModularForms Layer0 at259. Neither is cited as supplying the Schwarzian comparison. |
| Classical polylogarithms and generic word/groupoid objects | PolylogarithmFunctions scope and principal-domain definitions at11,44; ColemanIntegration L1.12 and AnabelianGeometryAndNonabelianChabauty §2.0/§2.4 supply shuffle and all-cut duality. Only the two-letter index specialization and stuffle construction are local. |

In that table, a bare `README.md:line` is relative to `TauCetiRoadmap/<owner>/`; completed material was also checked where named. Main was used when it contains the owner; otherwise the available open head was used. GeneralAlgebraicKTheory's changed §4.16 is not silently treated as its old boundary construction.

The five declared gaps were compared with the package plan and the final supplier contracts. Besides the two redundant requests in R02, the three motive-related requests now have explicit routes: PS.1.6 constructs the modular eigenprojector motive from the imported Chow/parabolic infrastructure; PS.3.0 composes the MotivicEtaleKTheory comparison with the Tate-Hom comparison; PS.9.15 constructs the framed relative products from MotivesAndAlgebraicCycles' relative pairs. None has supplier `none`. Their slugs remain in the design list but none occurs in the README, so the package's active gap record should be reconciled with this local ownership rather than treated as five still-missing supplier theorems.

## Not verifiable

- **BG**, the abelian Tate ETNC citation, remains settled as uncertified: the available record is its published locator, not readable source text. No new access request was made and no statement about its unseen proof is certified here.
- **Tate-legal** remains settled as waived. Its locator is retained without claiming that the text was inspected; no repeated request was made.
- The finite computations and the sorry build do not certify the future proofs, in particular the family-level gluing of the fixed-fibre comparison, the relative log comparison, or the conditional identification of the quintic boundary lattice. The README explicitly retains these as targets/hypotheses. The seeded source comparison certifies the cited fixed-fibre inputs, not an already completed formal proof of those extensions.

## Source issues

- **Misprint** in H at Theorem 4.12, arXiv v1 printed p.15 (H line 696): the source says i=j∘α for an automorphism α of the ambient lattice; it should be i=α∘j; affects nothing.
- **Error** in H at Theorem 4.12, arXiv v1 printed p.15 (H line 693): the source says the embedding-uniqueness criterion applies to any even nondegenerate ambient lattice; it should require the even unimodular ambient hypothesis; affects a stated result.
- **Error** in H at Proposition 4.26 and Example 4.27, arXiv v1 printed p.21 (H lines 971–978): the source says the pulled-back operator composes with multiplication by t; it should compose with multiplication by 1/t, with the corresponding period rescaling; affects a stated result.
- **Misprint** in H at Theorem 4.28, arXiv v1 printed p.22 (H line 1026): the source says the regular local hypergeometric solution has upper parameters 1/8 and 3/8; it should have upper parameters 1/8 and 1/8; affects a stated result.
- **Gap** in H at proof of Theorem 4.29, arXiv v1 printed p.23 (H lines 1038–1043): the source says the two based loops have the same image and hence the same continuation; it should distinguish the conjugate reflections and establish the chosen chart's continuation; affects the proof.
- **Error** in SH at §§3.1–3.2, Definition 3.3, printed pp.3–4 (SH lines 109 and 146): the source says the rank-four sector is invariant under the natural combined permutation and diagonal action; it should be diagonal-invariant and permutation-stable, with a sign twist for permutation invariance; affects a stated result.
- **Misprint** in Scholl at Theorem 1.2.4, printed p.2 (Scholl lines 121–123): the source says the motive has coefficients in E after defining the coefficient field L; it should be coefficients in L; affects nothing.
