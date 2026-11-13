<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13150#issuecomment-6858633676 -->
Red team round 1 pass a (codex) of 2531294

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) Frobenius Satake includes nonalgebraic representations

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:656–658, “equivalent to the category of `σ`-semilinear representations of `H(L) ⋊ ℤ`”.

   Claim: all finite-dimensional semilinear representations of the abstract semidirect product occur.

   Witness: XZ lines 1654–1656 and 1693 require algebraic restriction to `H(L)`. For `H=𝔾_m`, `σ=id`, the one-dimensional character `t↦ϖ^{vϖ(t)}`, with trivial ℤ action, is nonalgebraic: units map to 1, but ϖ maps to ϖ.

   Exact repair: “The category `F-Sat_G` is equivalent to the full subcategory of finite-dimensional `σ`-semilinear representations of `H(L) ⋊ ℤ` whose restriction to `H(L)` is algebraic (XZ Theorem 3.6.7(ii)). For the standing q-power Frobenius, `σ=id_L`. The full subcategory of direct sums of the normalized `IC_μ` is equivalent to `Rep_L(H)` (XZ §3.6.8, (3.6.8.1)).” Add the valuation character as a negative-control Check. It is excluded, whereas every algebraic character `t↦t^m` remains included.

2. **F02** (P2) De Rham Satake has no Frobenius characteristic polynomial

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:658–662, “both equivalences ... on characteristic polynomials”.

   Claim: the arithmetic and characteristic-zero de Rham Satake equivalences both compare Frobenius characteristic polynomials with the ℓ-adic equivalence.

   Witness: README:799 explicitly says the de Rham object has no Frobenius. For the unit de Rham object on a point, the underlying vector space `K` admits endomorphisms 1 and 2, giving polynomials `T−1` and `T−2` with identical de Rham data.

   Exact repair: “Compare Frobenius characteristic polynomials of normalized arithmetic and ℓ-adic `IC_μ` stalk cohomology. For de Rham coefficients, compare the graded dimensions of stalk cohomology; no Frobenius characteristic polynomial is attached before a Frobenius structure is supplied.” The point example now gives dimension 1 on both sides and makes no unsupported choice between `T−1` and `T−2`.

3. **F03** (P2) The invariant parameter is scaled on only one side

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:855–857, “`P_h(λφ) = λ^h P_h(φ)` equals ... `P̌_h(N + x E)`”.

   Claim: this defines the matching of `φ` and `E` subsequently used to form `Be_H(λ)`.

   Witness: for type A₁ normalize the invariant product of `φ=(1,1)` and `E=E₂₁` to 1. At `λ=2`, the displayed test gives `4=1`; the actual scaled connection has invariant 4. XZ lines 2233 and 2296–2299 distinguish these parameters.

   Exact repair: “Match `φ` with `E` by `P_h(φ)=P̌_h(N+xE)`. Then `λφ` matches `N+λ^h xE`, and both invariant coordinates equal `λ^h P_h(φ)`.” Add the A₁ Check at `λ=2`: both coordinates are 4, while the unscaled `E` coordinate is 1. This preserves the connection formula in §§2.1 and 4.1.

4. **F04** (P1) The coefficient datum excludes required finite fields

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:118–120 and 443–450, “residue field `k`” together with `π^{p−1}=−p` and `c_p²=p`.

   Claim: finite coefficient enlargement supplies this datum for every `k=𝔽_q` while keeping residue field exactly `k`.

   Witness: at `p=q=3`, `(π/c₃)²=−1`. This element is a unit of R; its reduction would square to 2 in 𝔽₃, whose squares are 0 and 1. No such R exists.

   Exact repair: “Start with `R₀=W(k)[π]`, residue field `k`, for the relative geometric comparisons with Frobenius forgotten. Extend coefficients to a finite field extension `K/K₀` containing `c_p`, allowing the residue field of its valuation ring to extend `k`; the curve remains over `k` and Frobenius remains the linear q-power structure by coefficient extension.” Apply this distinction throughout §0.1 and Layer 3. Add the `p=q=3` Check: `K=ℚ₃(√−3,√3)` has residue field 𝔽₉, while the original curve and its traces remain over 𝔽₃. This repairs the obstruction without excluding a prime or changing q.

5. **F05** (P2) Negating a Dwork parameter is invalid at p=2

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:139–141 and 1755–1758, “at every prime ... with `π` replaced by `−π`”.

   Claim: the scalar supplier can be instantiated with the negated Dwork parameter at every prime.

   Witness: at p=2, π=−2 is forced; −π=2 does not satisfy `π^{p−1}=−p`. TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md §RD.6.95 requires that equation; §RD.6.48 explicitly restricts the parameter-negation identity to odd p.

   Exact repair: “For odd p use the supplier with Dwork parameter −π. At p=2 retain its parameter π=−2; the additive character equals its inverse. Compare the opposite-sign algebraic lifts through the Taylor isomorphism for x and −x, carrying Frobenius with it (§RD.1.44), rather than treating 2 as a Dwork parameter.” Add the Check `2≠−2` in K, although both characters on 𝔽₂ take the value −1 at 1. This supplies the characteristic-two comparison without an invalid supplier instance.

6. **F06** (P2) The toric slope headline is statable but absent

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:2266–2286; Suggested.lean:12–44 and 165–178.

   Claim: §11.2 proves the full toric hypergeometric slope theorem, but the acceptance file gives only the orthogonal consequence and does not name §11.2 among unavailable headlines.

   Witness: `Fin`, finite-field unit tuples, `AddChar`, `ℂ_[p]`, norms and `Module.finrank` already express §11.3 in Suggested.lean:169. The same carriers express §11.2 with one finite-sum definition. At n=1,d=1,2 the required ranks are 3,6, whereas the existing theorem has only rank 3.

   Exact repair: add a real-bodied definition `toricSum ψ n d a = Σ_{x : Fin (2*n) → Fˣ} Σ_{z : Fˣ} ψ(Σ x_i − z^d + a*z^d/(∏ x_i))`. State the headline for odd prime p, n≥1, d≥1, d∣p−1, finite F/ZMod p, nontrivial ψ₀ and a∈Fˣ: there are `β : Fin (d*(2*n+1)) → ℂ_[p]` with `‖β i‖^d = ‖(Nat.card F : ℂ_[p])‖^(i:ℕ)` and, for every finite L/F, `toricSum (traceChar p L ψ₀) n d (a_L) = −Σ_i (β i)^(Module.finrank F L)`. Register its name in §11.2. The minus sign is forced by `L(f,T)=∏(1−β_i T)`; n=1,d=2 gives all six slopes 0,1/2,1,3/2,2,5/2, retaining the general d theorem.

7. **F07** (P2) Equal-length hypergeometric sums duplicate an earlier owner

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:1916–1924.

   Claim: the trace-sum formula is introduced here without acknowledging its existing equal-length carrier.

   Witness: TauCetiRoadmap/HypergeometricMotives/README.md:1328–1335 and Suggested.lean:649–654 define `katzExpSum` with relation `t∏x=∏y`. For n=m=1, upper 0, lower quadratic over 𝔽₃, a=2, both sums at t=a⁻¹=2 equal i√3.

   Exact repair: “For equal lengths this trace sum is `katzExpSum` of HypergeometricMotives §4.2 with `t=a⁻¹`, upper and lower characters lifted by norm, and additive character lifted by trace; transport its cyclotomic values to K. This roadmap constructs the arithmetic D-module realization and its trace comparison.” Add that supplier to scope, contracts and §9.1 Needs. Retain the unequal-length Bessel specialization. The reciprocal sends the witness a=2 to t=2 and preserves the value i√3; at a≠a⁻¹ it prevents a parameter reversal.

8. **F08** (P3) The subquotient Check fails to distinguish its proposed wrong model

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:1479–1480, “using the literal image ... gives the wrong group for `Std ⊗ Std` of `SL₂`”.

   Claim: the literal image of `Rep(SL₂)` misses the invariant line in its standard tensor square.

   Witness: `Std⊗Std = Sym² Std ⊕ 1`; both summands and both projection/inclusion morphisms are already in `Rep(SL₂)` and its image. Their dimensions are 3 and 1, with total 4, in both proposed models.

   Exact repair: replace this Check by “For H=SO₈ with geometric monodromy G₂, Std₈ restricts as Std₇⊕1. Subquotient closure contains Std₇, while the literal image of Rep(SO₈) has no seven-dimensional nontrivial object: its smallest nontrivial representation has dimension 8.” The new positive and negative models give presence and absence of the rank-seven summand, respectively.

9. **F09** (P3) Torus level structures are not all trivial

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:543, “For `G = 𝔾_m` all level data are trivial”.

   Claim: the two-point levels disappear for a torus.

   Witness: §0.3 keeps torus level change. For G=𝔾_m, Ω=ℤ; a line bundle with one marked fibre has automorphism group 1, with no marking it has automorphism group 𝔾_m, and two markings have a relative ratio in 𝔾_m.

   Exact repair: “For G=𝔾_m, V=0, Bun_G(0,2) has one point in each degree, and Bun_G(1,2) has a 𝔾_m of relative trivializations in each degree. For trivial tame character the Hecke eigenvalue is constant.” In degree zero, the second big cell is 𝔾_m and the first is a point, as §0.3 requires.

10. **F10** (P3) The pinned-library absence claim is too broad

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:189–190, “No Kloosterman, Bessel, isocrystal or Hecke-eigensheaf declaration exists at the pin.”

   Claim: Tau Ceti has no Bessel declaration.

   Witness: TauCeti/Analysis/SpecialFunctions/BesselI.lean:81 defines `Real.besselI`; line 85 states its defining formula. It is an analytic Bessel function, not a Bessel F-isocrystal.

   Exact repair: “Tau Ceti has no Bessel F-isocrystal or Hecke eigensheaf at the pin. Its `Real.besselI` in TauCeti/Analysis/SpecialFunctions/BesselI.lean is an analytic special function and does not supply a connection on a curve.” The existing analytic declaration then satisfies the revised inventory without being mistaken for the missing carrier.

11. **F11** (P1) The finite projective subgroup input is not assigned to its owner

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:1506–1510, “the finite solvable subgroups of `PGL₂` force irregularity `> r`”.

   Claim: the listed prerequisites supply the finite subgroup classification.

   Witness: XZ lines 2427–2450 uses disconnected finite subgroups. The declared principal-SL₂ gap covers connected reductive subgroups. McKaySkewGroup §0.2, README:366–390 already owns the characteristic-zero finite SL₂ classification, but is not cited.

   Exact repair: add McKaySkewGroup §§0.1–0.2 to the supplier contracts and §6.3 Needs. State the projective consequence explicitly: “Lift a finite subgroup of PGL₂ to its finite inverse image under SL₂→PGL₂, use McKaySkewGroup's classification and concrete models, and quotient by {±1}; transport the finite characteristic-zero representations by scalar extension. The solvable alternatives are cyclic, dihedral, A₄ and S₄.” For the exceptional witness, binary tetrahedral order24 becomes A₄ order12, with normal wild V₄ order4. This uses the owner on main; it neither duplicates the classification nor depends upward on ArtinRepresentations §7.6.

12. **F12** (P1) Chebotarev recognition is used without its owner

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:1703–1707, “semisimple Chebotarev in a faithful representation”.

   Claim: the listed prerequisites provide the passage from closed-point Frobenius traces to an isomorphism of representations.

   Witness: ArithmeticGaloisRepresentations §5.13, README:3922–3926 supplies precisely continuous ℓ-adic recognition up to semisimplification. None of §7.5's listed sections supplies it. Equal polynomials alone cannot distinguish a nontrivial unipotent extension of 1 by 1 from 1⊕1.

   Exact repair: add ArithmeticGaloisRepresentations §5.13 to the supplier contracts and §7.5 Needs. State: “Apply its recognition theorem to the continuous, semisimple ℓ-adic representations on the smooth curve, with ℓ≠p and the same geometric Frobenius convention; use traces in all representations, including exterior powers, to identify characteristic polynomials.” The rank-two unipotent countermodel has polynomial `(1−T)²` but is excluded by semisimplicity; two copies of `1⊕1` are recognized. This supplier precedes the present roadmap.

13. **F13** (P1) Ordinary Newton semicontinuity does not cover the logarithmic boundary

   Location: packages/KloostermanSheavesAndBesselIsocrystals/README.md:1423–1427, “Newton semicontinuity for log-convergent F-isocrystals”.

   Claim: PadicDifferentialEquationsAndRigidCohomology §§RD.3.43 and RD.5.101 supply the specialization inequality including the logarithmic point 0.

   Witness: that supplier's README:6868 states semicontinuity for convergent F-isocrystals; README:11012–11056 defines log-isocrystals without this theorem. The SL₂ residue E₁₂≠0 prevents treating its logarithmic extension as an ordinary convergent isocrystal at 0.

   Exact repair: declare `gap:log-newton-semicontinuity` in plan.json and the README, owned by PadicDifferentialEquationsAndRigidCohomology §RD.3.43: “For a finite locally free convergent log-F-isocrystal on a smooth pair (X,D) over a finite field, with finite characteristic-zero coefficients and nilpotent residues, Newton polygons specialize upward with unchanged endpoints, including specialization to D; the Newton polygon is constant on a dense open of each irreducible component.” Add it to §5.3 Needs. In the rank-two logarithmic model with residue E₁₂ and Frobenius diag(1,q), the residue remains nonzero, while both generic and boundary slopes are (0,1); the new contract covers precisely this missing boundary case. The eleven existing gaps do not include this statement.

## Verified sound

The entire README (2,455 lines) and Suggested.lean (180 lines) were read. There are 65 numbered README targets and 11 actual Lean declarations: six definitions and five theorems. The supplied signature extraction's two additional entries are prose fragments, not declarations. I compared all 11 supplied elaborated signatures with the source and README; none loses a section hypothesis. I did not run Lean, in accordance with the read-only/no-build instruction. Counts below refer to explicit finite or local tests, not proofs of the proposed library.

All five Lean theorem signatures survived the tests recorded below. None is a one-tactic restatement, a boundary-case theorem, or a replacement for an unavailable carrier. The six definitions have real bodies and are used by those theorems. The signature file has one `import Mathlib`, the correct namespace, no `set_option`, no sorry'd data, no `lemma`, and five honest theorem admissions. R06 records the missing additional headline.

The available headline statements are: signed Dwork congruences (§10.2); the three orthogonal identities (§11.1); toric slopes (§11.2); orthogonal everywhere ordinarity on extension traces (§11.3). The module docstring separately names the unavailable Satake/eigenobject, Zhu/relative comparison, monodromy, generic Newton, functoriality/companions, characteristic-two comparison, arithmetic hypergeometric construction, and adjoint rigidity/simple-wild headlines, identifying their missing geometric carriers. Mathlib's Witt-vector isocrystal is a semilinear vector space, not an F-isocrystal on a curve.

### Lean declaration and instance ledger

All declarations are in `TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals`; there are no ambient section variables. `F,K : Type*` below includes the universes inferred in the supplied signatures. “Finite field” means `[Field F] [Finite F]`; “coefficient field” means `[Field K]`. These exclude the zero ring and cardinality-one fields. Finite extensions of finite fields are separable. The tests deliberately include the total definitions outside the theorem ranges.

| Declaration, line, section | Explicit context | Instances and computed values | Result/change |
|---|---|---|---|
| `dworkBlock`, 56, §10.1 | K field; p,m,s:ℕ; B:ℕ→K | B(j)=j+1,p=2,m=2,s=0: coefficients at 1,2,3 are 0,3,0; p=2,m=1,s=2 selects 4,5,6,7, excludes 8; p=0,s=1 gives zero, p=0,s=0 selects m | Real definition; endpoints and junk values agree. |
| `signed_dwork_congruence`, 66, §10.2 | R domain DVR, K char-zero fraction field, `¬IsUnit 2`; B nonzero everywhere; u:ℕ³→ℤˣ; explicit ha,hb,hc and hu; m,s,N | R=ℤ_(2),K=ℚ,rank-three constant sequence,s=m=1,N=4: coefficient 208/27, divisor −16, quotient −13/27, v₂=0; alternating sequence: 640/27 divided by −16 gives −40/27, v₂=3; rank-five constant quotient −121/243 has v₂=0 | 1,968 coefficient divisibilities; signed exponent is sharp. Completeness is correctly absent. No denominator vanishes. |
| `kloostermanSum`, 89, §11.1 | finite F, coefficient K; ψ:AddChar F K; k:ℕ,a:Fˣ | F₂,a=1,k=0,1,2,3: 1,−1,1,−1; F₃,k=0,a=2:0; F₃,k=2,a=1,2:−1,2 | Empty fibre versus empty tuple distinguished; no truncated rank subtraction. |
| `orthogonalSum`, 97, §11.1 | finite F, coefficient K; ψ,n:ℕ,a:Fˣ | F₂,a=1,n=1,2,3:1,1,1; F₃,a=2,n=0 and1:4,4, while empty-tuple model gives1; F₃,a=1,n=2:7 | `2*n-2` saturates at n=0, documented; every theorem excludes n=0. |
| `quadraticCharIn`, 105, §11.1 | finite F, coefficient K; no odd-characteristic hypothesis on definition | F₃→ℂ at0,1,2:0,1,−1; F₅ at4,2:1,−1; F₃→char2 at1,2:1,1; F₄:0 at0 and1 at each unit | Agrees with the pinned integer character and coefficient cast. |
| `quadraticHypergeometricSum`, 114, §11.1 | finite F, coefficient K; ψ,N:ℕ,b:F | b=0 gives0 even N=0; F₃,N=0,b=1,2:ζ₃²,−ζ₃; N=1,b=1,2:0,i√3 | Total inverse at zero is annihilated by ρ(0); the eliminated-variable formula has correct sign. |
| `traceChar`, 123, §11.1 | p prime; finite F with ZMod p algebra; coefficient K; ψ₀ | F₄=F₂[ω],Tr(0,1,ω,ω+1)=(0,0,1,1), characters=(1,1,−1,−1); trivial ψ₀ gives four1s; F₂ gives(1,−1) | Native trace, not identity or arbitrary additive character. |
| `orthogonalSum_sub_card_eq_kloostermanSum`, 133, §11.1 | finite F/ZMod2; coefficient K; ψ₀≠1; n≥1,a unit | F₂,n=1,2,3:1−2=−1=R₃=R₅=R₇; F₄,a=1,n=1:9−4=5=R₃. Negative control ψ(x)=(-1)^Tr(ωx),a=1 gives−3 versus5 | Correct trace-character restriction. If char K=2, nontrivial ψ₀ cannot exist. |
| `gaussSum_mul_orthogonalSum_sub_card`, 145, §11.1 | finite F with ringChar F≠2; arbitrary coefficient field K; ψ≠1,n≥1,a unit | F₃,a=1,n=1: (−i√3)(1−3)=2i√3=H₃(4); reversing Gauss sign gives−2i√3. F₉:3(25−9)=48=H₃(1) | Correct ψ(−y), factor4 and all-character scope. Coefficient characteristic2 is allowed: the integer cyclotomic identity specializes. |
| `orthogonalSum_sub_card_eq_convolution`, 156, §11.1 | finite F, arbitrary coefficient field K; ψ≠1,N≥2,a unit | F₂,N=2:1−2=(1²−2)·1=−1; F₃,N=2,a=1:7−3=((−1)²−3)(−1)+(2²−3)2=4 | Correct absence of a half twist in raw sums; it returns in normalized traces. |
| `orthogonalSum_ordinary`, 169, §11.3 | p prime; F:Type finite/ZMod p; ψ₀:AddChar (ZMod p) ℂ_[p],ψ₀≠1;n≥1,a unit; β chosen before every L:Type finite/F | F₂,n=1,a=1 extension traces −1,5,17 give T³+T²−2T−8, valuations of roots0,1,2 and norms1,1/2,1/4. F₃ gives T³+2T²−6T−27, valuations0,1,2. Identity extension has finrank1 | Quantifier order is uniform over L; prime-field algebra structures are unique, so no scalar-tower loophole. β cannot be zero. The universe restriction is stated in the README. |

The three finite-sum identities were tested in 751 instances over F₂,F₃,F₄,F₅,F₇,F₈,F₉, all units, ranks n≤3, and all nontrivial additive characters where the theorem permits them. The Dwork tests used exact rational arithmetic over the incomplete DVR ℤ_(2), not floating-point divisibility. Nine quadric chart sums were independently enumerated: n=3 gives 3 over F₂, 13 and4 over F₃, and the multiset {5,5,37} over F₄; n=4 gives7 over F₂ and13,40 over F₃. These agree with `U_(n−1)+Q^(n−1)−Q`.

### README target and convention ledger

Each numbered target is represented below. The tests include positive and negative models and record actual ranks, scalars, groups, cohomological degrees or polynomial values. A passing local instance is not a claim that a deep theorem was proved. References to R-numbers identify required changes. The standing hypotheses exclude q=1, zero coefficient rings, inseparable finite-field extensions and non-split groups; these cannot be counterexamples to a statement about the standing datum. Nonreduced test schemes are retained in the level-geometry contract; reduced points alone are not asserted to represent the affine Grassmannian.

| Target | Instances; computed left and right values | Result/change |
|---|---|---|
| §0.1 normalized datum | q=2,r=2,d=1: −1/√2 versus erroneous1 and−1/2; q=4,d=2 half twist1/4, square1/16; p=q=3 requires a unit square−1 in F₃, impossible | R04; two Frobenius factors at extension degree2, not one. |
| §0.2 root-depth quotient | SL₂: two root lines, not one; Gm:V=0 and generic zero functional; GL₂/F₂:det diag(1+t,1)=1+t has odd t coefficient, whereas any square has coefficient0 | Field and bad-isogeny cases agree; no commutator shortcut. |
| §0.3 level models | SL₂ neutral cell A²; PGL₂ Ω=C₂ gives two components; Gm Ω=ℤ, one-marking Aut=1, no-marking Aut=Gm, two-marking relative ratioGm | Target agrees; its torus example needs R09. |
| §1.1 coefficient categories | On point, weight1 dual has weight−1; j:Gm→A¹, j!K stalk0=0 versus degree-zero j+ stalkK; rank-one exponential trace at1 is ζ₃ versus ζ₃⁻¹ after sign reversal | Operations conditional on declared gap; de Rham trace language must mean an added arithmetic structure, as in R02. |
| §1.2 ULA and hyperbolic localization | A² weights(1,−1): both sides K[−2](−1); weights(1,1):both K[−4](−2); j!K over id has nonzero vanishing cycles, over point has none; skyscraper rank0 off support versus rank1 at support | Direction/shifts and nonsmooth base-change test agree. |
| §1.3 Satake | Gm graded object concentrated at1 has weight1; PGL₂ minuscule IC has dimension2 cohomology and stalk multiplier q⁻¹/², not q⁻¹; abstract Gm(L) character sends units1 and uniformizerϖ, unlike any algebraic t^m | R01, R02. |
| §1.4 clean automorphic datum | SL₂ ordinary fibre K[2] has H^(−2)=K; normalized fibre has H⁰=K; generic boundary stalk0 on both extensions; φ=0 gives nonzero boundary cone | Genericity and normalization distinguish wrong extension. |
| §1.5 Hecke action | Unit rank1/shift0/twist0; SL₂ standard rank2, its tensor square rank4; d=1 IC multiplier q⁻¹/², wrong full twistq⁻¹ | Ranks and half twist agree. |
| §1.6 eigenobject | Unit→unit with evaluation scalar1; SL₂/F₃,a=1 normalized trace1/√3 on both realizations; nonsmooth automorphic boundary has stalk0 but nearby rank1 | ULA is required of Satake factor over X, not automorphic object over its identity. |
| §1.7 tame variant | F₅ exponent1/4 yields fourth-root monodromy i, exponent1 yields1; trivialχ exponent0 gives1; PGL₂ nonidentity Ω inverts i to−i | Rational exponents and component action retained. |
| §1.8 trace comparison | diag(1,3),diag(2,2) both trace4 but degree-two traces10,8 and determinants3,4; normalized rank2/F₃ trace1/√3; de Rham forgets both scalar Frobenii1 and2 | Extension traces are necessary; R02 fixes the incompatible earlier wording. |
| §2.1 FG connection | Torus A=0; SL₂ A=[[0,1],[λ²x,0]]; SL₂×SL₃ atλ=2 affine scales4,8, not4,4 | Product Coxeter numbers and nonzero parameter retained. |
| §2.2 invariant matching | A₁,φ=(1,1),λ=2: scaled invariant4 versus unscaled E invariant1; torus both quotient points; A₁×A₂ scales4,8 | R03. |
| §2.3 oper slice | PGL₂ slice A¹, parameter0 slope0, parameter1 slope1/2; wrong residue diag(1,−1) differs from nilpotent residue eigenvalues0,0 | Origin included as nongeneric; specified residue matters. |
| §2.4 critical localization | A=K[t],M=K,tχ=0: derived tensor M⊗ᴸ_A K has Tor₁=K and Tor₀=K versus underived onlyK; same oper under two characters gives same eigenvalue | Flatness correctly stated as hypothesis; gap supplies rational centres. |
| §2.5 quantized Hitchin | A₁ invariant in two opposite-weight coordinates is uv; invariant ring K[uv] dimension1 equals oper slice dimension1; symbol of uv has degree2 | Fixed invariant normalization and moment-map flatness are required, not arbitrary localization. |
| §2.6 central descent | SL₂ conjugator diag(a,1) has determinant a; scalar correction c needs c²a=1; a=b² gives c=b⁻¹, nonsquare a gives no c; √x monodromy−1 versus constant quadratic torsor monodromy1 | Rational marking excludes constant torsor; GL₂ kernel dimension1 requires determinant. |
| §2.7 Zhu comparison | r=3,λ=1 solution functional1+x+x²/8 versus horizontal1−x+x²/8; substituting first in horizontal equation gives x coefficient2 instead0; big-cell rank1 on both sides | Column/dual convention agrees; normalization subject to R03. |
| §2.8 characteristic-zero monodromy | SL₂ adjoint h¹=1−1−0=0, wrong double-I₀ gives−1; B₃ dim21 contains G₂ dim14; D₄ dim28 has triality-fixed G₂ dim14; SL₃ char-zero group dim8, p=2 groupSO₃ dim3 | Correct D_(n+1) row and distinct p-adic exception. |
| §2.9 symmetries | A₁ rotation a scales b₁b₀ by a, not a²; a=2,b=3 composed scale6; A₂ outer sign x→−x becomes x in char2; SO₄ standard rank4=2·2 | Contravariant dual-group direction and product case agree. |
| §3.1 relative specialization | Unit family map is id on A†; closed point degree2 is missed by k-rational points but is rational over k₂; support comparison arrow rigid,c→deRham,c versus ordinary deRham→rigid | Every rigid point tested after extension; R04 separates coefficient extension from base k. |
| §3.2 minuscule comparison | SL₂ standard d=1: both H⁰ dimensions2 and all other degrees0; removing Satake shift gives H¹ dimension2 and H⁰ dimension0 | Degree and rank match, conditional on relative-geometry contract. |
| §3.3 quasi-minuscule middle image | PGL₂ cone uv=w² punctured: Hc^(−1),Hc⁰ dimensions1,3; H⁰,H¹ dimensions3,1; middle image H⁰ dimension3; j! vertex degree−2 dimension0 versus j!* dimension1 | No affine-puncture assertion; source's overstrong concentration is not copied. In char2 μ₂ quotient is radicial, still not an étale double cover. |
| §3.4 quasi-minuscule comparison | E₈ has0 nontrivial minuscule generators but adjoint rank248; PGL₂ adjoint rank3=dim Sym²K²; End(unit connection)=K versus Frobenius-compatible End=K^σ | Dense convergence gap is used before Frobenius, as required. |
| §3.5 tensor comparison | K²⊗K² ranks4=3+1, evaluation preserves scalar1; E₈ adjoint supplies rank248 instead of empty minuscule collection; exponent1/4 monodromyi versus integral exponent1 monodromy1 | Idempotents/tame data and generator case agree. |
| §4.1 Bessel Frobenius | Unit Frobenius1; SL₂/F₃ trace1/√3; torus 2ρ=0 so constant rank1/Frob1 | Transport retains tensor unit; coefficient issue R04. |
| §4.2 logarithmic extension | SL₂ N=E₁₂ has rank1,N²=0; unit N=0,Frob1; generic SL₂ formal slope at∞1/2>0 | Nilpotent extension at0 does not assert log regularity at∞. |
| §4.3 Frobenius at0 | C₀=diag(t⁻¹,t),q=t²:NC₀=qC₀N=tE₁₂; C₀NC₀⁻¹=q⁻¹N; inverse givesqN; PGL₂ classes diag(1,q) anddiag(q,1) Weyl-conjugate | Half cocharacter cannot be used directly in SL₂; signs correct. |
| §4.4 Frobenius matrix | Kummer A=−a:δC/C=−(q−1)a; inverse has opposite logarithmic derivative; q=3,a=1/2 gives C=x⁻¹; degree2 uses C(x)C(x^q) | Correct column equation and product order. |
| §4.5 gauge dictionary | At0, Ad(C₀)N=q⁻¹N while Ad(C₀⁻¹)N=qN; differentiating inverse gives δΦ=ΦA−qA(x^q)Φ | Source's equation and residue convention cannot both describe C; README's correction is explicit. |
| §5.1 Newton class | GL₂ (0,0) versus(−1/2,1/2): ordinate at1 is0 versus−1/2, hence reversed polygon order; degree2 unnormalized slopes double to(−1,1) | Dominance and normalization agree. |
| §5.2 cuspidal bound | α=(3+4i)/5 and α⁻¹ have complex absolute value1 but at a place over5 slopes−1,1, outside[−1/2,1/2]; central degree characterq slope1 versus finite-order character slope0; C₂ component vectors(1,±1) | Finite-order central character and chosen component values genuinely used. |
| §5.3 generic ordinarity | SL₂/F₂ raw polynomial T²+T+2 has slopes0,1, normalized−1/2,1/2; removing finitely many zeros of a nonzero polynomial on Gm leaves dense open; tensor generators finite versus infinite collection | No dependence on characteristic-two comparison; logarithmic specialization needs R13. |
| §6.1 monodromy definitions | Unit tensor category group1; StdSL₂⊗StdSL₂=Sym²⊕1 gives ranks3+1 in literal image as well as closure; SO₈/G₂ restriction ranks7+1 distinguishes closure | R08 repairs the stated negative control. |
| §6.2 wild monodromy | SL₂ exp(tN)=1+tN is nonidentity for t=1, torus N=0 gives1; procyclic semisimple Zariski image has no nontrivial principal unipotent | Almost-simple hypothesis excludes torus countermodel. |
| §6.3 principal-PGL₂ exclusion | SL₃ exponents1,2 give3+5=8, offset source gives1+3=4; G₂ bound14/6<3 gives integerIrr≤2; A₂,p2 admitsSO₃=PGL₂ | R11 supplies finite disconnected subgroup classification. |
| §6.4 monodromy table | SL₂ groupSL₂ dimension3; SO₇ groupG₂ dimension14 not21; SL₃,p2 excluded here and deferred to§11.4; central quotients send centres to1 | No exception lost in theorem range. |
| §6.5 simple wild parameters | F₅((t)),u⁴=t,z⁵−z=u⁻²: v(uz²)=1, v(u(2z+1))=3, lower break2, upper2·5/20=1/2, Ad Swan2·1/2=1; central quotient c=2 changes lower2→1; p2 fails2∤2 | Correct adjoint/nonadjoint distinction; GR assumes adjoint. |
| §6.6 adjoint rigidity | SL₂ Irr∞=1, invariants0=1, invariants∞=0 givesh¹0; rank0 torus would leave invariants and is outside almost-simple scope; p2 fails Weyl prime-to-p hypothesis | Both local invariant terms retained; no all-prime 1/h assertion. |
| §7.1 Frobenius torsor | SL₂ ratios±1 give eigenvalues±t⁻¹,±t; normalization selects+1; PGL₂ centre1 gives unique Frobenius | Centralizer is of geometric monodromy; exception handled later. |
| §7.3 exact solution radius | v₂(4^j/(j!)²)=2s₂(j), quotient byj tends0 along powers2, radius1; λ→2λ gives4, λ→λ/2 gives1/4; trivial constituent radius∞; SL₄ adjoint restriction10+5=15 | Origin and dual-solution convention necessary; no solutions at∞ in A₁ power-series test. |
| §7.4 integral functoriality | radii1 and1/abs(c) force abs(c)=1; c=2 atp2 would yield radius2; G₂ standard→SO₇ standard both rank7; normalized central ratio1 | Identity inclusion needs no radius argument. |
| §7.5 HNY functoriality | G₂ representation generators have dimensions7 and binom(7,2)−7=14; spin restriction8=7+1 alone misses adjoint; nontrivial unipotent extension and1⊕1 both polynomial(1−T)² | R12 adds semisimple recognition owner. |
| §7.6 companions | SL₂→PGL₂ kernel{±1} size2 despite surjectivity; SL₂ companions both dimension3, SO₇ companions both G₂ dimension14; neutral-component match alone leaves possible C₂ component group | Declared companion contract retains tautological representations and component groups. |
| §8.1 scalar realization | F₃ normalized rank2 traces1/√3,−2/√3; odd rank raw argument changesa→−a under inverseψ; p2 π=−2 while−π=2 is not a Dwork parameter | R05; scalar ownership retained. |
| §8.2 orthogonal matrices | odd n=1 operatorδ³−λ²x(4δ+2), first coefficient2λ² versusλ² with E/2; even n=3,N(e₃−e₄)=0 whereas addingE₃₄ gives−e₃ | Factors2 and even-rank omitted central chain entry matter. |
| §8.3 invariant line | SO₄ diagonal gives3+1=4; SO₈/F₂ traces7/8 andSO₇ −1/8 differ1; central zero weights multiplicity2 decomposes1+1 | Invariant-line Frobenius1, not arbitrary constant. |
| §8.4 quadric model | n=3 sum overδ empty, potential has four terms; every numerator/denominator pair homogeneous degree2/2 or1/1 so common rescaling factor1; n=2 labels collide | Valid range n≥3, SO₄ handled separately. |
| §8.5 boundary count | n=4,F₂ chart sum7=1+8−2; printed formula gives5; F₃ chart13,40 versus printed7,34; n=3 both constantsQ²−Q | Nine independent chart enumerations agree with repaired source formula. |
| §8.6 even trace | n=4,F₂ trace7/8, equals1+(1−2)/8; SO₄/F₃,a=1 trace(1/√3)²=1/3 andSO₃ trace−2/3 adds1 | Scaling agrees with invariant-line decomposition. |
| §9.1 hypergeometric realization | upper(0,1/2),lower(1/3):differences−1/3,1/6,rank2; equal length1:leading x(1−x), extra singularity1; empty/one:rank1; empty/empty:delta1 rank0 off1; resonant0,1 difference−1 | Generality matches Miy; finite-sum ownership needs R07. |
| §9.2 normalized hypergeometric | n3,m1 zero eigenvaluesq⁻¹,1,q; n2,m0 eigenvaluest⁻¹,t and trace−R₂/t; F₃ Gaussg=−i√3, norm-lift degree2 gives−g²=3 | Extension sign and constant twist agree. |
| §9.3 odd comparison | n1 rank3 spectrumq⁻¹,1,q, no zero eigenvalue; pullback4 turns coefficientλ²x(δ+1/2) intoλ²x(4δ+2); p2 factor4=0 and quadratic lower character unavailable | Odd-characteristic restriction essential. |
| §9.4 convolution | F₃,n2,a1 normalized convolution before twist−4/(3√3), after half twist−4/9, aftershift+4/9=(7−3)/9; F₂ corresponding values+1/4 beforeshift,−1/4 after | Correct shift[1](1/2); n1 excluded. |
| §10.1 Dwork data | B=1 ratios1 and congruence difference0; p2,m1,s2 block4..7; B=j+1,m2,s0 gives3x²; rank3 B4/B2=1/27=−1 mod4 versus B0/B0=1 | Ordinary versus signed data distinguished, empty p0 block documented. |
| §10.2 signed congruence | R=ℤ_(2),rank3,s1,m1,N4 quotient−13/27 has v₂0, so stronger modulusfails; alternating pair quotient−40/27 hasv₂3; rank5 constant quotient−121/243 hasv₂0 | Exact arithmetic verifies1,968 coefficients; no completeness needed for coefficient divisibility. |
| §10.3 unit-root lines | B=1,F=1/(1−x),η=1/(1−x),p2 multiplier1+x; q4 multiplier(1+x)(1+x²)=1+x+x²+x³; inverse derivative has opposite sign | q-step product rather than singlep-step required. |
| §10.4 two solution series | n1,p2:F=1−8x+8x²+…,G=1+8x+24x²+…; both first mod2 truncations1; h=F/G=1−16x+112x²+…; h′/h constant−16=ηF(0)−ηG(0) | Both horizontal and Frobenius equations, with h(0)=1, required. |
| §10.5 maximal-slope quotient | q2,n1:Frob q/f has constant2 and slope1, while f has constant1/slope0; quotient connection+η versus solution−η; reciprocal h⁻¹ has first coefficient+16 | Correct dual and q^n factor retained. |
| §10.6 p2 comparison | x and−x equal mod2 but differ by2x overK; F₂ ranks3,5,7 traces−1/2,−1/4,−1/8 on both sides; quotient maps normalized at0 by1 | Uses specified-map slope theorem and Taylor isomorphism, not equality of lifts. |
| §11.1 identities/definitions | F₂ ranks0,1,2,3 raw1,−1,1,−1; F₃ quadratic values0,1,−1; N0 hypergeomζ₃² or−ζ₃; char2 identity−1=−1; odd identity2i√3=2i√3; convolution4=4 overF₃ | All five definitions' three discriminating Checks evaluated; nontrace F₄ control−3≠5 confirms restricted first identity. |
| §11.2 toric slopes | n1,d1:dimension3,volume1/2,degree3;d2:volume1,degree6,slopes0,1/2,1,3/2,2,5/2; face determinant2, primitive vertex index1; p2 derivative−2z²=0 | Mathematics conditional on two declared toric contracts; Lean omission R06. |
| §11.3 everywhere ordinarity | F₂ raw rank2 slopes0,1 normalize−1/2,1/2; orthogonal rank3 raw0,1,2 normalize−1,0,1; even rank4 adds0; candidate raw0,1,1 has wrong final height2 versus3 | All-prime range consistent, including rank divisible byp. |
| §11.4 exceptional A_(2n) | SL₃,p2 monodromySO₃ dim3 versus ambientdim8; rank7 G₂ dim14 versusSO₇21 andSL₇48; central quotient maps centre to1 | Standard comparison does not identify ambient adjoint representations. |
| §11.5 all-prime corollaries | F₂,n2 convolution aftertwist+1/4, shift yields−1/4; Weyl order even so2∤abs(W) false for every almost-simple type; SL₃ adjoint dimension8 versusSO₃ adjoint3 | No misuse of tame-prime break theorem or standard-to-adjoint transfer. |

### Counts, native carriers and ownership

The ledger covers all 65 numbered targets, including their definitions and conventions, and all 11 Lean declarations. All 228 README Check bullets were read and assessed against their target; the tables record the discriminating computations rather than treating the bullets as proofs. Independently computed arithmetic tests comprise 751 finite-field identity instances, 1,968 signed-congruence coefficients, and nine quadric chart sums: 2,728 instances in total. The finite fields were 𝔽₂, 𝔽₃, 𝔽₄, 𝔽₅, 𝔽₇, 𝔽₈ and 𝔽₉; the identity tests included every nontrivial additive character, every nonzero parameter and ranks n=1,2,3, except that the characteristic-two Kloosterman comparison deliberately uses the prime-field trace character. The F₄ nontrace character gives the negative control recorded above. The quadric tests include n=4, where the two competing boundary constants separate.

The pinned Mathlib commit is `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; the pinned Tau Ceti commit is `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Native definitions and relevant hypotheses were read in Mathlib/Algebra/Group/AddChar.lean:72, Mathlib/RingTheory/PowerSeries/Basic.lean:112, Mathlib/RingTheory/PowerSeries/Expand.lean:33, Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:45, Mathlib/NumberTheory/GaussSum.lean:72 and :200, and Mathlib/FieldTheory/Finite/Trace.lean:37 and :49. In particular, additive characters preserve zero and addition; the integer quadratic character is zero at zero; the Gauss product theorem has nontriviality and primitivity hypotheses. None of those declarations proves one of the five headline signatures by a one-lemma application.

The Tau Ceti reconstruction and ramification interfaces were checked in TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:138, TauCeti/NumberTheory/LocalField/Herbrand/Quotient.lean:176 and TauCeti/NumberTheory/LocalField/Herbrand/UpperQuotient.lean:98. The reconstruction `ULift` occurs on the group-valued functor and is not a substitute for changing an object universe. The analytic Bessel declaration is recorded in R10. Searches by object across main, Completed, packages and the supplied open heads found no independent duplicate of the five fully qualified Lean theorem names; the same-name open roadmap is discussed below.

Nineteen named supplier/owner groups were checked against their available current text. The following is the citation ledger, including the three newly identified owners. Sections within a row were checked together; a declared gap is not counted as an already proved supplier theorem.

| Supplier/owner | Sections or objects checked | Result |
|---|---|---|
| CongruenceSpectralGap | §§4.2a–4.2b | Raw scalar sums and their sheaf interface are owned there. |
| CharacterSumsOverFiniteFields | §3.3 | Hasse–Davenport over ℂ, transported through character values; F₉ Gauss sum 3=−(i√3)². |
| KloostermanMomentsAndPotentialAutomorphy | §§1.1,1.3,2.1,2.5,2.6 | Names and sections exist at the supplied head; scalar normalization and Bessel dictionary retained. The stale missing-roadmap lead is rejected. |
| GlobalShtukasAndFunctionFieldLanglands | §§0.1,0.3,0.14,1.1–1.9,1.12 | Finite-field geometry is supplied; mixed-characteristic relative geometry and Newton bound remain the declared contracts. |
| ReductiveGroupsPartII | RG2.3.3, RG2.3.6, RG2.4.1 | Parahoric models, Moy–Prasad filtration, Iwahori–Weyl group; no replacement by commutators at bad primes. |
| ReductiveGroups | Layers 1,7,9,10 | Root and representation conventions present; principal-SL₂ classification is the declared gap, not a finite disconnected classification. |
| OrthogonalSpinGroups | Layers 0–1 | Quadratic and central-form interfaces distinguish SO from Spin. |
| PadicDifferentialEquationsAndRigidCohomology | RD.0–RD.6 sections in the contracts | R05 and R13 are the substantive mismatches. Old RD.6.64 is explicitly mapped to RD.2.52 at README:48, so its old citation is valid. |
| PadicDifferentialEquationsAndRigidCohomologyPartII | MS.4, specifically MS.4.6 | Specified-map maximal-slope reconstruction exists; citing the containing MS.4 section is valid. |
| BunGAndNewtonStrata | §§1.5,1.22 | Rational dominance and detection by representations have the required direction. |
| MotivesAndAlgebraicCycles | §§6.1–6.3,6.5 | Neutral reconstruction, generation and torsors; subquotient closure must be retained. |
| FormalConnectionsOpers | F2, F3.3, F4, F6 | Generic connections, gauge action and opers are imported, not rebuilt. |
| AffineLieAlgebras | A7–A8 | Complex critical centres are owned there; their rational-form extension is an explicit gap. |
| SpringerResolutionAndCharacteristicCycles | §§8.1–8.6,9.1–9.2,9.4,9.6–9.7 | Algebraic D-module operations and localization prerequisites are named. |
| DeligneWeightsAndPurity | §§8.5,8.12,8.14,8.19 | Operations, proper direct image and purity interfaces present. |
| EtaleCohomologyFoundations | Constructible ℓ-adic coefficient framework | Supplies the comparison-side carriers, not the arithmetic Satake construction. |
| HypergeometricMotives | §4.2 | Existing equal-length finite sum identified; R07 repairs the missing ownership citation. |
| McKaySkewGroup | §§0.1–0.2 | Existing finite SL₂ classification supplies the projective consequence in R11. |
| ArithmeticGaloisRepresentations | §5.13 | Semisimple ℓ-adic recognition supplies R12. |

All eleven existing gap slugs match between design/plan.json and the README's exact contracts, with named suppliers. Their hypotheses were read, including the all-prime scalar/toric statements and the coefficient extension in companion monodromy. Their current absence from the suppliers is not a finding. R13 identifies a distinct missing contract. No previous repair's “not actionable in this package” decision is re-raised.

The nearest-roadmap scope comparison found distinct ownership: GeometricSatakeAndFusion treats the Fargues–Fontaine/integral étale setting; MixedHodgeModulesAndIrregularHodgeTheory treats the complex Hodge setting; GlobalShtukasAndFunctionFieldLanglandsPartII consumes this package's Kloosterman eigenobjects and rigidity. It does not supply them back. The generic oper and critical-centre overlaps are already imported. There is no second copy on main.

The overlap with open roadmap #2289 is real: its current README differs from this board package and already contains repairs corresponding to R04, R05, R07 and R10, plus a more precise MS.4.6 citation. Reconcile the #13150 package onto the current #2289 text before exporting it, preserve the existing section mapping, and apply the remaining findings once. This is the same roadmap's open text, not a second independent owner or a reason to duplicate its changes.

The requested mechanical dependency check completed with this output:

```text
depcheck: 239 roadmaps, 2171 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The check does not discover the missing mathematical ownership edges R11–R13. The read-only diff against origin/main contains ten changed files, all in packages/KloostermanSheavesAndBesselIsocrystals (1,436 insertions, 316 deletions). No tracked package file was modified by this review. Only this report and scratch notes were written; no Lean build or repository/network write was run.

### Source locator and independence ledger

Seventy-seven distinct locators were checked against the cached legal texts, in fourteen sources. “Verified” here means that the cited passage was located and compared with the target, including any discrepancy reported above or in Source issues; it does not certify every step of the source's proof. Pagination and versions follow sources.toml, especially the XZ v2 and FG v3 preprint pagination.

| Source | Locators checked | Text witnesses |
|---|---|---|
| XZ (48) | 2.6.4; 2.8.2,2.8.3,2.8.5–2.8.7; 2.10.2; 3.1.2,3.1.4,3.2.5,3.3.3,3.4.3–3.4.4,3.5.1,3.5.3,3.6.5,3.6.7–3.6.8,3.6.10; 4.1.4–4.1.5,4.1.8–4.1.11; 4.2.6–4.2.7; 4.3.3; 4.4.4–4.4.5; 4.5.5–4.5.6; 5.1.1,5.1.3–5.1.4,5.2.2–5.2.3,5.3.4–5.3.5,5.3.8–5.3.9,5.3.11,5.4.2–5.4.3; A.5,A.9,A.12–A.13 | XZ lines 919,999,1024,1060,1070,1177,1243,1259,1356,1409,1478,1491,1566,1578,1654,1688,1695,1721,1827,1836,1892,1948,2057,2105,2201,2329,2333,2425,2440,2469,2523,2532,2557,2620,2630,2738,2782,2883,2893,2911,2932,2948,3054,3105,3139,3159. |
| HNY (5) | §1.2; Proposition1.1; Corollary1.3; Lemma2.3; Definition2.4 | HNY lines 435–499,527–594,683–700. |
| FG (2) | Corollary10; (14.1) | FG lines 1237–1271. |
| Zhu (6) | Theorem8; Corollary9; Lemmas18–21 | Zhu lines 377,435,918,925,993,1008. |
| BD (3) | §§5.3,5.5,7.8 | BD lines 6178–6556,6941–6970,8537–8568. |
| Miy (3) | Main Theorem; Theorem4.1.3; Remark4.1.9 | Miy lines 64–90,1187–1192,1304–1309. |
| GR (1) | Proposition5.6 with standing §5.3 adjoint hypothesis | GR lines 1302–1312. |
| LT (1) | Theorem1.8 (=7.10) | LT lines 262–265. |
| PRW (2) | §3.3; Theorem3.2 | PRW lines 685–729. |
| Car (1) | Equation(4) | Car lines 37–76. |
| VL-est (1) | Proposition2.1 | VL-est lines 274–281. |
| DAd (2) | Theorem1.2.1 (=4.3.2); Theorem4.1.1 | DAd lines 78–83,1235–1241,985–988. |
| Tsu (1) | Theorem1.3, including preceding maximal-quotient setup | Tsu lines 75–86. |
| AC (1) | Proposition1.3.13 | AC lines 817–840. |

Five additional prose comparisons, beyond those locator-aligned statements, were made: the coefficient/sign discussion at README:118–141 against XZ lines 1731–1733 and 2329; the middle-image proof plan at README:1130–1150 against XZ lines 2063–2092; the radius/constituent argument at README:1658–1670 against XZ lines 2537–2551; the quadric boundary explanation at README:1847–1853 against XZ lines 2774–2802; and the Gauss-identity docstring at Suggested.lean:145–150 against XZ lines 2900–2911. No copied expressive sentence, clause-by-clause paraphrase or translated passage was identified. Shared formulas, standard terminology and hypotheses were distinguished from expression.

Counting named source citation groups in the README body (one source attribution followed by one or more locators is one group), the distribution is XZ84, HNY8, FG7, Zhu5, Miy5, Wan93/04 jointly5, GR3, AS892, BD2, Dw692, and one each for DH35, Spe80, VL-est, DAd, Tsu, AC, LT, PRW, Car, ESDE and KatzCC: 134 groups. Bibliography entries and bare eponymous names are excluded. XZ has the largest share, 84/134.

XZ's contents at XZ lines 16–55 were compared with the roadmap's layers. There is no one-to-one run: Layer1 combines XZ §§2–3 and4.1; Layer2's oper comparison (§4.3) precedes Layer3's relative comparison (§4.2); generic Newton bounds (§5.4) move to Layer5 before monodromy; classical constructions precede the hypergeometric layer, reversing XZ §§5.2–5.3; AppendixA becomes Layer10 before the final all-prime conclusions. The dependency lines force Frobenius/log extension before Layer5, the generic ordinary locus before Layer10 reconstruction, and characteristic-two comparison before Layer11's all-prime conclusion. FG, Zhu, HNY and Miy provide separately cited inputs. The selection and scope are not a renamed source table of contents. No source table, figure or exercise list was taken over as such.

Source independence: 82 passages compared with 14 sources; no copied expression identified; largest share XZ, 84 of 134 named-source locator groups; contents compared with XZ: independent.

## Not verifiable

- AS89, Wan93, Wan04, Bal82, DH35, ESDE and KatzCC remain the seven settled uncertified sources. Their stated locators were retained; their source text was not certified and no repeat request was made. In particular, the all-prime toric contracts are accepted as declared contracts, not as newly checked proofs.
- The critical displayed formulas in the cached scans of Dw69 Theorems2–3 (Dw69 lines 394–407 and 527–542) and Spe80 Theorem(2.35) (Spe80 lines 537–539) are not fully legible in the extraction. Their exact printed formulas are not counted in the 77 verified locators. The parallel XZ congruence statement was readable and was tested independently.
- Abe is a bibliography/background source; no separate theorem locator from it is certified by this pass. Source entries not listed in the locator ledger were not silently counted as verified.
- No fresh Lean elaboration was performed. The supplied elaborated signatures were compared with the unchanged file, as the read-only restriction requires. Mathematical counterexamples and native-definition inspection do not replace a later build of repaired signatures.
- Future implementations of the eleven declared supplier gaps, and of the proposed logarithmic semicontinuity contract, cannot be checked at these pins. Acceptance remains conditional on those contracts.
- The errata below concern the cached versions. Whether each has been corrected in a later published version was not established; no claim of a published correction is made.

## Source issues

- **Error** in XZ at Theorem1.1.4, pp.3–4 (XZ lines 146–159,184–188): the source says normalized Frobenius is defined over ℚ_p(μ_p); it should be defined after adjoining the required square root of p, already necessary at p=3 and rank2; affects a stated result.
- **Error** in XZ at §4.1.1, pp.37–38 (XZ line 1751): the source says the commutator-and-centre subgroup gives the required second level; it should be the Moy–Prasad affine-root kernel, which differs for GL₂ in characteristic2; affects a stated result.
- **Misprint** in XZ at §4.1.13, p.42 (XZ lines 1989–1990): the source says the algebraic tame exponent is integral; it should be rational modulo integers with denominator prime to p, to realize nontrivial finite tame characters; affects a stated result.
- **Error** in XZ at proof of Lemma4.2.6(i), p.44 (XZ lines 2057–2070): the source says affineness makes the full shifted direct image holonomic in one degree; it should be the middle image, using opposite one-sided vanishings and cleanness, without asserting affineness of that punctured chart; affects the proof.
- **Error** in XZ at §4.4.3 and Theorem4.4.4, p.50 (XZ lines 2329–2336): the source says the displayed gauge equation has the stated Frobenius direction and residue; it should be rewritten in the pullback-to-original direction, with the corresponding derivative sign and residue conjugation; affects a stated result.
- **Misprint** in XZ at proof of Lemma4.5.5, p.53 (XZ lines 2440–2441): the source says principal-SL₂ adjoint summands have degrees 2e_i−2 for exponents e_i; it should be degrees 2e_i, giving dimension8 rather than4 in typeA₂; affects the proof.
- **Gap** in XZ at proof of Corollary4.5.6, p.53 (XZ lines 2476–2477): the source says a surjection between the two monodromy subgroups establishes their isomorphism; it should be supplemented by faithful-representation and component-group control, since SL₂→PGL₂ is a nonisomorphic surjection; affects the proof.
- **Misprint** in XZ at §5.2.3, p.57 (XZ line 2639): the source says the rank-n spectrum ends with q^{2n} times its common Gauss factor; it should be q^{n−1} times that factor; affects a stated result.
- **Error** in XZ at Proposition5.3.5(ii), p.59 (XZ line 2782): the source says the even-quadric boundary contribution is (Q−1)Q^{n−2}; it should be Q^{n−1}−Q, giving chart sum7 rather than5 at n=4,Q=2; affects a stated result.
- **Misprint** in XZ at proof of Proposition5.3.8(i), p.61 (XZ line 2890): the source says the middle eigenvalue of the rank-three symmetric square is zero; it should be one for the determinant-one rank-two object; affects the proof.
- **Error** in XZ at §5.3.9 and (5.3.11.1), p.61 (XZ lines 2893–2911): the source says the normalized objects agree by unshifted convolution; it should be convolution followed by [1](1/2), whose trace factor is −Q^{−1/2}; affects a stated result.
- **Error** in XZ at PropositionA.9, p.66 (XZ lines 3107–3124): the source says the cyclic quotient is the solution line with connection d−ηdx; it should be its dual with connection d+ηdx, as e₂=xηe₁ forces; affects a stated result.
- **Gap** in XZ at §A.11, p.66 (XZ lines 3136–3137): the source says the unit-root-line comparison directly identifies maximal-slope quotients as F-isocrystals; it should be dualized and given the common q^n Frobenius factor before applying maximal-slope reconstruction; affects the proof.
- **Misprint** in XZ at §A.13, p.68 (XZ lines 3215–3217): the source says the parity split retains the original upper bound and shifts by m2^{s−i}; it should be upper bound 2^{s−t−1}−1 and shift m2^{s−t}; affects the proof.
- **Misprint** in FG at Corollary10, p.28 (FG line 1239): the source says the orthogonal inclusion has source type D_{2n+1}; it should be D_{n+1} for target B_n; affects a stated result.
- **Misprint** in FG at (14.1), p.29 (FG lines 1267–1271): the source says both boundary terms use inertia at zero; it should be one term at zero and one at infinity; affects the proof.
- **Misprint** in HNY at proof of Corollary1.3, p.254 (HNY lines 582,594): the source says the determinant section vanishes on the trivial bundle; it should be nonvanishing there, detecting acyclicity; affects the proof.
- **Misprint** in HNY at Remark2.5, p.256 (HNY lines 703–705): the source says the affine character has domain I(1)/I(0); it should be I(1)/I(2); affects a stated result.
- **Misprint** in HNY at Definition2.6, p.257 (HNY lines 706–707): the source says the character-twisted object lies on Bun_G(0,2); it should be Bun_G(1,2), with its torus level structure; affects a stated result.
- **Gap** in AC at proof of Proposition1.3.13(ii), p.16 (AC lines 838–840): the source says shrinking a dominant quasi-finite map makes it finite étale; it should be factored through its purely inseparable part first, since Frobenius on 𝔸¹ is nowhere étale; affects the proof.

## For the human reviewers

- BD is an author-hosted preprint used at README:659 and :901–902, with its status recorded in sources.toml. Its publication/licence status was not independently adjudicated; no source expression was identified as reused.
- AS89, Wan93, Wan04, Bal82, DH35, ESDE and KatzCC retain their settled uncertified status. The scope of that existing source-access waiver is for the human reviewers; this pass requests no new text.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "2531294283fdfa135e58332570000f90627fddd1", "job": "RT-KloostermanSheavesAndBesselIsocrystals~1a", "model": "gpt-6-astra", "worker": "chris-33"} -->
