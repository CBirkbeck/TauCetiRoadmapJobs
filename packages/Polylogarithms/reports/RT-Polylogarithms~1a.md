<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/170#issuecomment-6314720165 -->
Red team round 1 pass a (codex) of c17d319

Verdict: needs_changes

1. **F01** (P3) Computational algorithms exceed the scope contract

   Location: packages/Polylogarithms/README.md:203–209, “Prove `rationalFourier_compatibility`, `rationalApprox_error`, termination and exact arithmetic correctness.” Also §6.3.

   Claim: Specify a terminating rational approximation algorithm, its exponential bit-precision complexity, and a numerical diagnostic interface.

   Witness: README.md:203 defines the algorithm with cutoff `3·2^p`; line 209 explicitly requires termination and discusses complexity. The review contract excludes computational algorithms.

   Exact repair text: “Retain the uniform Fourier-tail theorem and Kummer identity as analytic targets. Remove `rationalUnitShapes`, `rationalFourierSum`, `rationalApprox`, their termination/complexity obligations, and `PolylogDiagnostic`’s numerical certification interface. Keep exact regulator and rank statements in §§2.5 and 6.1.”

2. **F02** (P1) The sixth-root Check reverses the two integral Bloch kernels

   Location: packages/Polylogarithms/README.md:117, “a primitive sixth root `w` need not have `[w]` in the strict-exterior Bloch kernel, although `2[w]` does.”

   Claim: The strict-exterior boundary of a primitive sixth-root symbol can be nonzero.

   Witness: In `F=ℚ(√−3)`, take `w=(1+√−3)/2`. Then `1−w=w⁻¹`, hence `w∧(1−w)=w∧w⁻¹=0` integrally. The potentially nonzero order-two diagonal belongs to the antisymmetric tensor quotient.

   Exact repair text: “Integrally, `[w]` lies in the strict-exterior Bloch kernel because `1−w=w⁻¹`. It need not lie in the antisymmetric-tensor kernel: over `ℚ(√−3)`, its diagonal boundary has order two, so `2[w]` lies in both. Rationalization removes this distinction.”

3. **F03** (P2) An easy every-family headline is omitted

   Location: packages/Polylogarithms/README.md:413–419 and packages/Polylogarithms/Suggested.lean:114–121, 376–399.

   Claim: The package promises `zagier_three_everyFamily`, but groups the Zagier assertions among targets requiring future carriers.

   Witness: `zagier_three_exists` already provides every necessary carrier: number fields, selected infinite places, raw `Finsupp` families, `IsCycle3`, `normalizedPeriod`, rational scalars and Dedekind zeta. Replacing existence of a family by a family binder requires no new carrier.

   Exact repair text: Add the following headline, retaining §3.8’s proof dependence on `cycleLifting_three`:

   ```lean
   /-- Every rational weight-three cycle family has rational zeta-normalized period. -/
   theorem zagier_three_everyFamily (F : Type u) [Field F] [NumberField F]
       (e : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) ≃
         InfinitePlace F)
       (c : Fin (InfinitePlace.nrRealPlaces F + InfinitePlace.nrComplexPlaces F) → F →₀ ℚ)
       (hc : ∀ j, IsCycle3 (c j)) :
       ∃ q : ℚ, normalizedPeriod 3 (fun i => (e i).embedding) c =
         (q : ℝ) * (NumberField.dedekindZeta F 3).re := by
     sorry
   ```

4. **F04** (P3) Statable Checks lack their Lean mirrors

   Location: packages/Polylogarithms/README.md:213, 274, 639, 1113–1116; packages/Polylogarithms/Suggested.lean:153–157, 253–262, 338–342, 397–399.

   Claim: The README Checks test the kept native definitions; the omitted derivative values allegedly require new carriers.

   Witness: `circlePartial 6 I`, a constant function failing `FiveTermFunction`, and `collidingPointCycle` over `ZMod 2` use existing definitions. Derivatives at `2`, `−1`, and `1` have exactly the carriers of the retained derivative-at-half theorem.

   Exact repair text: “Add proved mirrors for `circlePartial 6 Complex.I = 209/225` and `¬ FiveTermFunction (fun _ : ℚ => (1 : ℚ))`. Replace the noncollision point-cycle example by one combining that case with `collidingPointCycle (1 : ZMod 2) = Finsupp.single 1 2`, keeping two examples for that definition. Add named admitted targets `singleValued_three_derivative_two`, `singleValued_three_derivative_negOne`, and `singleValued_three_derivative_one`; the last states `HasFDerivAt (singleValued 3) (0 : ℂ →L[ℝ] ℝ) 1`. Remove them from the list of unavailable carriers.”

   Complete the same repair for the remaining native Checks: the prime-unit independence in §3.2; raw cyclic expansions at `(1,1,1)` and `(2,2,2)` in §3.1; rescaling of the displayed determinant-ratio tuples in §3.5; positive-size zero-column determinants in §4.4; and the one-dimensional obstruction square in §4.6. Combine related assertions to retain at most two proved examples per definition. Promote the unproved boundary values `Λ(π/2)=Λ(π)=0` and `¬ IsCycle4 (Finsupp.single (2 : ℚ) 1)` to named README/Lean theorem targets if their proofs require the planned analytic descent. Add the concrete negative control `¬ IsCycle3 (Finsupp.single (3 : ℚ) 1)`, detected by `(u(2)∧u(3))⊗u(3)` and prime valuations. Presently an always-true cycle predicate passes every retained cycle example.

5. **F05** (P3) The sources manifest is absent

   Location: packages/Polylogarithms/README.md:1148–1169 and packages/Polylogarithms/ (file inventory).

   Claim: Eighteen bibliography entries and the additional Borel 1977 locator support the package.

   Witness: The package contains README.md, Suggested.lean, metadata.toml and review.json, but no sources.toml. Thus no cited work has the required package-level source/access record.

   Exact repair text: “Add `sources.toml` with schema `tauceti-roadmap-sources/v1`, recording every cited work, exact version, target locators, cited-for mapping and source-service access metadata. Include Borel 1977, Remark 6.3, and preserve any operator-certified access status.”

6. **F06** (P1) The stated build contains forward dependencies and a support-complex cycle

   Location: packages/Polylogarithms/README.md:139, 334, 430, 651, 802.

   Claim: Layers and their listed Needs give an implementable direction of supply.

   Witness: §2.3 consumes primitive Hurewicz constructed in §3.7. §3.5 consumes §3.6. §3.9 consumes §4.7. More seriously, §5.3 needs §5.9’s supported Deligne model, while §5.9 needs §5.3’s logarithmic Green comparison.

   Exact repair text: “Move `stableK_hurewiczPrimitive` and its elementary API before §2.3. Put the geometric presentation and `M₃` before the configuration maps. Put the weight-four homotopy proposition before conditional transfer. Split §5.9: construct the universal Deligne/support cone before Green forms; construct the Green/Wang comparison and `cubicalRegulator_beilinson` after Green forms and the cubical regulator. Give each target its own Needs, including the degree/sign dictionary before the chain maps that use it.”

7. **F07** (P2) The Green-form coefficient condition drops separate closedness

   Location: packages/Polylogarithms/README.md:649, “whose required restrictions are `∂bar∂`-closed.”

   Claim: The local logarithmic Green representative is described with a composite-closedness condition on its coefficient forms.

   Witness: BUR line 3095 requires the divisor restrictions to be separately ∂-closed and bar∂-closed. On ℂ², `α=(z₁+bar z₁)i dz₂∧dbar z₂` has `∂bar∂α=0` but neither first derivative vanishes.

   Exact repair text: “After the chosen normal-crossing resolution, each coefficient form `αⱼ` restricts to a form on `Dⱼ` that is separately `∂`-closed and `bar∂`-closed, as in [BUR], Chapter II, Lemma 4.5, pp.80–81.”

8. **F08** (P2) The elliptic algebraic reciprocity target is unnecessarily restricted to characteristic zero

   Location: packages/Polylogarithms/README.md:966, “over an algebraically closed field of characteristic zero.”

   Claim: The algebraic line-arrangement construction and descent to rational functions on an elliptic curve are requested only in characteristic zero.

   Witness: G04 line 2793 (Theorem 6.14) and line 2840 (Proposition 6.17) state the algebraic construction over an arbitrary algebraically closed field. The setup at G04 line 2271 is explicitly for any field.

   Exact repair text: “Let `E⊂ℙ²_k` be a smooth plane cubic over an algebraically closed field `k`, of arbitrary characteristic. Construct the rational algebraic reciprocity homotopy with the stated general-position and multiplicity hypotheses. Restrict to `k=ℂ` only for the analytic comparison. Include smooth cubics in characteristics two and three as boundary Checks.”

9. **F09** (P1) Arbitrary-curve rigidity is used with the wrong Bloch presentation

   Location: packages/Polylogarithms/README.md:452, 476–478, 936, 973.

   Claim: The strong/elliptic reciprocity constructions take values in this package’s explicit rational pre-Bloch group; the cited source’s rigidity argument proves the descent relations.

   Witness: G04 lines 2387–2389 and 2887–2890 use constancy along an arbitrary curve, built into its curve-relation group. README §4.2 proves only `F→F(t)` rigidity; §4.1 explicitly declines identification with the arbitrary-curve presentation.

   Exact repair text: “Before `ellipticReciprocity_relations` and any rigidity-based analytic comparison, construct a named presentation adapter for the specific arbitrary-curve relations used by [G04]. Either prove directly in the explicit five-term quotient that every chord-associativity relation maps to zero, or prove the required specialization/rigidity comparison with [G04]’s curve-relation group. State its hypotheses and source independently of `weightTwo_rationalFunctionRigidity`; that rational-function theorem alone is not the adapter.” Do not silently replace the explicit target by the broader quotient.

10. **F10** (P1) Every-family containment needs an unprovided primitive-to-K comparison

   Location: packages/Polylogarithms/README.md:101, 389, 411–419.

   Claim: A stable homology lift and its primitive projection yield containment in the rational K-theory regulator image, while the package only constructs a map from K-theory into primitive homology.

   Witness: §3.7 supplies `K_j⊗ℚ→Prim H_j`, not surjectivity. §3.8 starts with a homology lift and must recover a K-class. WEI4 lines 493–503 give the missing rational primitive identification; a forward map alone does not.

   Exact repair text: “Extend the early primitive adapter to a natural rational isomorphism `K_j(R)⊗ℚ ≃ Prim H_j(GL(R),ℚ)` for `j≥1`, using the rational H-space theorem in [WEI4], §1, pp.11–12. Construct the rational primitive projection used in §3.8 and prove that pairing with a primitive Borel class is unchanged. `regulatorImageContainment_three` uses this projection followed by the inverse primitive identification.” Replace the assertion that no inverse Hurewicz input is required by this explicit dependency.

## Verified sound

Read packages/Polylogarithms/README.md:1–1169 and packages/Polylogarithms/Suggested.lean:1–402 in full, and the content repository's README.md and CONTRIBUTING.md. Counts: **52 Lean declarations** (18 definitions, 12 admitted theorem statements, 22 proved-example texts); **42 numbered target-bearing subsections**, including both bold mathematical targets; **47 Checks blocks**, containing 214 bullet Checks plus inline Checks. The tables below record the instances examined, not completed proofs of the planned library. All 22 Lean example statements were checked mathematically; no elaboration or build was run. Exact rational arithmetic independently checked the configuration witnesses listed below. Source verification covers **19 works** and **31 locator groups** (30 with readable supporting passages; BOR77's displayed formula is only partially verifiable), recorded in the source table. Supplier inspection covers **four supplied open heads** and **four relevant main-roadmap contracts**; the unavailable supplier heads are listed separately.

The Lean file has one `import Mathlib`, the requested namespace, no `set_option`, no sorry-valued data, no `True` placeholder, no admitted examples and no `lemma` declarations. There are no standing `variable`/`include` blocks: all theorem assumptions are explicit. Universe `u` is shared by `F` and the test module `V`; the universal rational symbol quotient fits that universe. The raw predicates are meaningful universal-property tests, not numerical vanishing substitutes. No forced headline was identified; R03 concerns a missing one.

### Lean declaration and context ledger

In this table `QMod V` means `[AddCommGroup V] [Module ℚ V]`; `NF F` means `[Field F] [NumberField F]`. Unlisted arguments are ordinary value arguments, with no hidden section hypotheses. Line numbers refer to packages/Polylogarithms/Suggested.lean. “Matches” means the written mathematical signature agrees with the stated convention; it does not certify tactic elaboration.

| Line | Declaration | Section and variable/instance context | Instances tried; result; change |
|---:|---|---|---|
| 28 | `polylog` | Supplier formula; `n : ℕ`, `z : ℂ` | `n=0,1,2`; `z=0,1`, lower cut boundary. Integral formula has the expected factorial and logarithm sign; supplier equality still needs its unavailable head. |
| 37 | `singleValued` | Supplier formula; `n : ℕ`, `z : ℂ` | `n=2,3`, `z=0,1,−1`; Bernoulli `B₁=−1/2` gives the displayed corrections. Matches. |
| 45 | `blochWigner` | Supplier formula; `z : ℂ` | `0,1`, real cut, conjugation; sign agrees with `L₂` and the differential. Matches. |
| 51 | `unitVector` | Symbols; `F : Type u`, `[Field F]` | `0,1,−1`; prime valuations of `2,3,5` over ℚ. Endpoint zero and rational torsion removal are consistent. |
| 57 | `FiveTermFunction` | Symbols; field `F`, `QMod V`, both universe `u` | Zero function passes; constant one fails; no degenerate raw five-term denominators required. R04. |
| 65 | `trilogCyclic` | Symbols; field `F`, `[AddCommGroup V]` | `(1,1,1)` and `(2,2,2)` expanded exactly; cyclic variable renaming agrees with README. |
| 73 | `TrilogRelationFunction` | Symbols; field `F`, `QMod V` | Identity function fails inversion at `2`; `[1]` retained; every denominator in the relation has a nonzero hypothesis. Matches. |
| 85 | `IsCycle3` | Symbols; field `F`; universal `QMod V,b` | Zero and `[1]` pass; universal quotient test recovers the actual boundary, rather than a real period. Matches. |
| 93 | `IsCycle4` | Symbols; field `F`; universal `QMod V,b` | `[1]`, `[2]+[1/2]` pass; `[2]` fails after the planned trilogarithm functional. Matches. |
| 99 | `periodMatrix` | Determinants; field `F`, arbitrary `ι`, ring embeddings and raw families | `Fin 0`, `Fin 1`, zero and doubled columns; embeddings are rows. Matches. |
| 104 | `normalizedPeriod` | Determinants; `NF F`, `[Fintype ι] [DecidableEq ι]` | Empty determinant, ℚ, ℚ(i); exponent and square-root discriminant agree. No selection condition is needed for this raw definition. |
| 114 | `zagier_three_exists` | Headline; `NF F`, equivalence selecting every infinite place | ℚ and ℚ(i); nonzero rational factor and actual cycle predicate retained. Every-family counterpart missing: R03. |
| 126 | `lobachevsky` | Layer 2; `θ : ℝ` | `0,π/2,π`; oddness and factor `2` inside logarithm consistent with zero full-period integral. |
| 130 | `blochWigner_lobachevsky` | Layer 2; `z : ℂ`, `0<z.im` | `z=i` gives angles `π/2,π/4,π/4`; all denominators nonzero. Matches. |
| 137 | `circlePartial` | Layer 2; `N : ℕ`, `w : ℂ` | `N=0,3,6`, `w=i,1`; exactly `N` terms beginning at one. R04 for second witness. |
| 141 | `circlePartial_error` | Layer 2; `N>0`, norm-one `w` | `N=1`, `w=1,−1,i`; bound follows from the absolute tail, including endpoints. Matches. |
| 146 | `blochWigner_kummer` | Layer 2; `z≠0,1` | `i`, `(1+i)/2`, real `2`; conjugations give the stated three unit-circle arguments. Matches. |
| 153 | `example` | Layer 2; no binders | `lobachevsky 0=0`; true, boundary-only test. |
| 156 | `example` | Layer 2; no binders | `S₃(i)=8/9`; exact recomputation agrees. |
| 162 | `projectedCrossRatio` | Layer 3; field `F`, five vectors in `F³` | Moment-curve ratio `6/5`, last swap `5/6`, rescaling cancellation. Totalized definition distinguished from generic API. |
| 168 | `tripleRatio` | Layer 3; field `F`, six vectors in `F³` | Moment-curve value `10/9`; generic endpoint value `1`; rescaling cancellation. Matches. |
| 175 | `triangleParameter` | Layer 3; field `F`, six vectors in `F³` | Elementary triangle at `2,1`; determinant order matches the source convention, not its inverse. |
| 180 | `example` | Layer 3; concrete rational six-tuple | Parameter `2`; exact determinants agree. |
| 191 | `example` | Layer 3; concrete rational six-tuple | Parameter `1`; endpoint retained. |
| 202 | `example` | Layer 3; concrete rational five-tuple | Projected ratio `6/5`; recomputed. |
| 210 | `example` | Layer 3; swapped rational five-tuple | Projected ratio `5/6`; recomputed. |
| 218 | `example` | Layer 3; rational moment-curve six-tuple | Triple ratio `10/9`; recomputed. |
| 229 | `example` | Layer 3; rational six-tuple | Triple ratio `1`; all twenty three-by-three minors are nonzero. |
| 243 | `singleValued_three_relations` | Layer 3; no standing assumptions; `F=ℂ,V=ℝ` inferred | Endpoint three-term relation and `(1,1,1)` give `3ζ(3)+4(−3ζ(3)/4)=0`. Admissible specialization is a named README obligation. |
| 247 | `example` | Layer 3; field `F` | `u(0)=0`; branch test agrees. |
| 250 | `example` | Layer 3; field `F` | `u(1)=0`; additive identity test agrees. |
| 253 | `example` | Layer 3; `F=V=ℚ` | Zero five-term function; true. Negative counterpart missing: R04. |
| 256 | `example` | Layer 3; `F=V=ℚ` | Identity cyclic block at `(1,1,1)` equals zero; this is not asserted to satisfy the full relation. |
| 259 | `example` | Layer 3; `F=V=ℚ` | Identity is not a trilogarithm relation function: `2≠1/2`. |
| 264 | `example` | Layer 3; field `F`; universal `V,b` introduced in proof | `[1]` passes `IsCycle3`, using `b(1)=0`. |
| 268 | `example` | Layer 3; field `F`; universal `V,b` | `[1]` passes `IsCycle4`, using `u(1)=0`, without assuming `b(1)=0`. |
| 272 | `example` | Layer 3; `F=ℚ`; universal `V,b` | `[2]+[1/2]` passes by inversion and opposite unit vectors. |
| 286 | `cycleLift_iff` | Layer 4; four rational modules, four linear maps, commuting square, cycle and chosen preimage | Zero spaces and obstruction square; witnesses transform as `z=x−k` and `k=x−z`. True even without the redundant square/cycle assumptions. |
| 298 | `cycleLift_of_injective` | Layer 4; same modules/maps, surjective `p`, injective `q`, cycle `y` | Choose preimage `x`; `q(a x)=0` forces `a x=0`. One-dimensional noninjective countermodel correctly excluded. |
| 308 | `normalizedPeriod_empty` | Layer 4; `NF F`, `Fin 0` rows, arbitrary `n : ℕ` | `n=0,2,4`; empty determinant one and natural subtraction by zero. Matches. |
| 314 | `example` | Layer 4; ℚ, one row, doubled endpoint symbol | Matrix entry `2 L₃(1)`; correct coefficient orientation. |
| 318 | `example` | Layer 4; ℚ, empty rows | Weight-four period `π⁴`; discriminant of ℚ is one. |
| 325 | `zagierExistence_totallyRealEven` | Layer 4; `NF F`, explicit `[IsTotallyReal F]`, `2≤n`, `Even n`, empty rows | ℚ weights two/four and ℚ(√2) weight two; nonzero rational scalar accommodates the fixed empty determinant. |
| 335 | `collidingPointCycle` | Layer 5; arbitrary field `F`, `t : F`, ℕ coefficients | `t=0,1` over ℚ and `t=1` over `ZMod 2`; multiplicity remains two. Missing characteristic-two mirror: R04. |
| 338 | `example` | Layer 5; ℚ | Collision at zero gives `single 0 2`, not reduced support. |
| 341 | `example` | Layer 5; ℚ | Noncollision coefficient at one equals one. |
| 345 | `etaJet` | Layer 5; four complex value/derivative arguments | Unit constants, rotating second unit, Steinberg jets; sign is `log‖f‖ Im(dg/g)−log‖g‖ Im(df/f)`. |
| 349 | `etaJet_steinberg` | Layer 5; `z≠0,1`, arbitrary real tangent `v : ℂ` | Substitute `f=z,g=1−z,df=v,dg=−v`; matches the Bloch–Wigner differential term by term. |
| 353 | `example` | Layer 5; no binders | Constant-unit jets give zero. |
| 356 | `example` | Layer 5; no binders | `etaJet 2 i 0 (−1)=log 2`; `−1/i=i`, so sign is positive. |
| 362 | `singleValued_three_differential` | Layer 6; `z≠0,1`, every tangent `v`; differentiability in conclusion | `1/2,2,−1,i`; radial correction and cut points agree. |
| 371 | `singleValued_three_derivative_half` | Layer 6; arbitrary `v : ℂ` | `(4/3)log²2 Re(v)` follows by substitution; missing analogous named statements are R04. |

### README adversarial ledger

Each row covers the definitions, identities and API targets in that entire numbered subsection, including its Checks. “No change” means no defect was established in the listed boundary instances. Future-carrier constructions were checked as mathematical specifications, not as available Lean implementations.

| Statement block | Instances and conventions tried | Result / change |
|---|---|---|
| Conventions, lines 22–51 | `n=0,1,2,3`; `z=0,1,∞`; unnormalized alternation; rows versus columns; positive discriminant square root | Analytic endpoint conventions, negative exterior boundary and `eₙ=n(N−dₙ)` are consistent. |
| 2.1 Descent and embedding regulators | ℚ zero complex rows; ℚ(i), conjugate embeddings; sixth root over ℚ(√−3) | First two pass; integral-kernel Check false: R02. |
| 2.2 Group cocycles | `(∞,0,1,i)`, swapped vertices, repeated point, five generic points | Alternating measurable cocycle specification avoids claiming continuity at degeneracies; no change. |
| 2.3 Borel calibration | Matrix units `E₁₂,E₂₁,E₂₂` and first transposition | Direct trace sum `−3`, half-sum `−3/2`, normalized `Φ₃=1/2`; no source misprint copied. Early primitive input missing from order: R06. |
| 2.4 Hyperbolic model, regions, truncations and Lobachevsky volume | Vertical heights `1,2`; Möbius inversion axis; `z=i` and real degeneration; cutoff `H→2H`; orientation swap | Metric density `h⁻³`, cusp tail `area/(2H²)`, exclusion of the hemisphere interior and signed volume tests agree. |
| 2.5 Fourier bound and rational approximation | `N=1,3,6`; `w=1,i`; `z=0,1,2,(1+i)/2` | Tail and shape signs pass. Algorithm outside contract: R01; missing Fourier mirror: R04. |
| 3.1 Explicit weight-three relations | Raw `(1,1,1)`, `(2,2,2)`, `(1,1,c)` modulo inversion; identity-function negative control | Exact coefficients agree, including negative `[1/4]`; endpoint `[1]` is retained. |
| 3.2 Low-weight complexes and native predicates | Weights `1,2,3`; `[1]`, `[2]`, `[3]⊗u(5)`; zero/nonzero constant functions | Repeated wedge kills `d²`; prime valuations distinguish nonzero exterior boundaries. R04 for omitted negative test. |
| 3.3 Residues | Uniformizer first/last, units, two uniformizers by multilinearity, characteristic-two residue | First-versus-last signs and cochain shift are consistent; nonunits are not reduced without valuation-zero proofs. |
| 3.4 Configurations and Bigrassmannian | Repeated vectors; dimension one; deletion/projection squares; infinite-field genericity | Degenerate denominators excluded; both face operations and signed total differential specified. |
| 3.5 Signed configuration maps | Moment-curve five/six-tuples; given four-vector witness; generic triple-ratio-one tuple | Recomputed `18`, `36`, `−60` and `+300` coefficients. No raw triple-ratio identity is inferred from a boundary. Forward use of §3.6: R06. |
| 3.6 Geometric group, triangle map, Gale duality, top transfer | Triangle parameters `2,1`; repeated/four-collinear tuples; seven-point deletion signs; rank-two Gale matrix; identity and degree-`d` norm | Endpoint, reduction sign and dual matrix agree. Norming three factors independently would give `d³` and is correctly excluded. |
| 3.7 Primitive K-theory and Borel class | `j=1`; ℚ units `2,3`; product of degree-one classes; stabilization `GL₃→GL₄` | Cross coproduct distinguishes nonprimitive homology. Forward Hurewicz alone does not provide later image containment: R10. |
| 3.8 Zagier existence and every-family containment | ℚ `[1]`; ℚ(i) `[1]`; zero/equal columns; singular rational column change | Factors `1` and `16`, allowance of rational factor zero, and existence/nonzero distinction agree. R03 and R10. |
| 3.9 Conditional complex transfer | Identity extension, degree `d`, tower | Conditional scope and coherence requirements explicit; forward placement corrected by R06. |
| 4.1 Inductive rational-curve presentation | `1/t` at zero; weights one/two/three; constants; residue characteristic two | Poles go to infinity, endpoint zero is distinguished from totalized inverse, noncycle differences are excluded. Arbitrary-curve identification is deliberately absent. |
| 4.2 Low-weight rigidity and comparison | ℚ(a,b)(t), `{t,a,b}`; `[3]₂`; inversion at `1`; degree-one/top complex | Indecomposable rather than full K₃ rigidity is the correct consequence of the residue sequences. It does not supply R09's arbitrary-curve comparison. |
| 4.3 Analytic constancy | Constant cycles; raw `[t]₃` not a cycle; pole specialization; endpoint-corrected three-term relation | Kernel-to-constancy and continuity extension are explicit targets, not assumed from inversion alone. |
| 4.4 Zagier predicates and periods | Odd/even signatures; ℚ, ℚ(i); doubled/zero columns; `d=0`; conjugate representative | Factors `3` at weight two and `16` at weight three over ℚ(i) agree; no scaling of nonexistent columns. |
| 4.5 Explicit weight-four cycles | `[1]`, `[2]`, `[2]+[1/2]`, zero; totally real fields | `L₃(2)=7ζ(3)/8` detects the noncycle; explicit-to-inductive inclusion has the correct direction. Downstream theorem is not consumed. |
| 4.6 Cycle obstruction | Zero modules; `C=D=E=ℚ,J=0,p=a=id`; injective target comparison | Obstruction can be nonzero despite symbol surjectivity. Both native lifting theorems pass. |
| 4.7 Empty determinants and homotopy conjecture | ℚ even weights; ℚ(√2); irreducible quadratic finite place; adding infinity | Empty determinant one and full residue fields are correct; affine finite-place statement kept distinct from projective reciprocity. |
| 5.1 LF test forms and currents | Empty manifold, degrees outside `[0,m]`, escaping bumps, Dirac derivative, noncompact support | LF topology, negative transpose and degree shifts pass; arbitrary current multiplication correctly unavailable. |
| 5.2 Analytic cycles and Poincaré–Lelong | Divisor `z^r`; singular two-branch curve; proper resolution; finite-mass extension | Multiplicities, `i/π` normalization and hypotheses match DEM; source API availability remains limited below. |
| 5.3 Relative Chow families and Green forms | `x²=t`, base change `t=s²`, zero and doubled cycles, characteristic-two native diagnostic; composite-closed coefficient | Multiplicity-bearing relative-cycle construction survives the collision test. Green coefficient condition fails: R07. Support-model order: R06. Native mirror: R04. |
| 5.4 Logarithmic r forms and residues | `m=1,2,3`; constant norm one/non-one; codimension one; `z∧c`; nonintegrable uncancelled product | `r₁=iη`, negative `darg∧darg` term and codimension shift agree. Degree-by-degree Deligne conversion remains an explicit obligation. |
| 5.5 Raw Deligne/simplex regulator | Weight one; simplex degrees zero/one; transposition; conjugate cycle pair | Top operator and ordinary/cochain degree shifts agree; raw chain identity appropriately requires the later dictionary. Order: R06. |
| 5.6 Normalized currents | Complex dimension one; codimension zero/one; ordinary degrees one/two; critical Deligne degree | Koszul factor `(-1)^q`, normalization `(2πi)^(-d)`, and `d_D[-log|f|]=−δ_div(f)` agree. |
| 5.7 Wang and boundary forms | `m=0,1,2`; ratio one; repeated entry; zero/infinity faces | `T₁=u`, `T₂=u(∂v−bar∂v)−v(∂u−bar∂u)` and first cubical sign negative agree. |
| 5.8 Cubical regulator | Cube degree zero; point-unit in degree one; degenerate cube; infinity normalization | Cycle current and `−log|a|` agree; forbidden-face cycles are excluded. |
| 5.9 Supported comparison | Empty/full support; degree-zero cube; principal divisor; square-zero cone; subcritical degrees one/two | Cone shift and component signs pass. Construction/Green comparison must be separated: R06. |
| 5.10 Mixed regulator | Cube dimension zero; simplex dimension zero; opposite mixed boundaries | Both endpoint regulators and signs agree with BFT's mixed construction; no inverse comparison assumed solely from notation. |
| 5.11 Chow parameter forms | Doubled component; node; point collision; `(p,q)=(0,1),(1,2)`; submersion versus singular pullback | Degree `q−1` and factor `(2πi)^(-p)` agree; arbitrary current pullback is not used. |
| 5.12 Green and Arakelov cones | Principal divisor; zero cycle/curvature; `Spec ℂ` versus arithmetic base | Cone construction is stated on the supplied complex regulator; no integral arithmetic comparison inferred from a complex current. |
| 5.13 Curve complexes and η regulator | Constants; `{z,1−z}`; local loop around zero; tame unit/nonunit distinction | Sign of η, residue direction and Chern normalization agree with NEK/SCH. |
| 5.14 Chow dilogarithm; bold **strong reciprocity** | Transposition, norm-one constant, Steinberg term, nonzero Bloch kernel ambiguity | Two triangles are separately requested; general assertion remains conjectural. The cited rigidity argument needs the adapter in R09. |
| 5.15 Rational curves and algebraic-number fields | Auxiliary point changed; coincident divisors with multiplicities; degree-`d` cover and norm | Rational coefficients remove the source's six-torsion qualification; finite-cover degree must be divided only rationally. General-curve rigidity use is covered by R09. |
| 5.16 Elliptic line arrangements | Line rescaling; tangent multiplicity; repeated line; chord associativity; characteristic two/three | Characteristic restriction is narrower than the source: R08. Descent into the selected Bloch presentation needs R09. |
| 5.17 Weight-three curve regulator; bold **generalized reciprocity conjecture** | Diagonal tensor, constants, local parameter residue; K₄ versus Milnor K₄ | Differential and residue signs agree; generalized reciprocity remains a proposition, not an automatic theorem. |
| 5.18 Elliptic Fourier kernel and pairing | Zero frequency excluded; repeated last point; simultaneous translation; scale `2`; one Fourier triad; area zero | Factor `1/32`, summability bound and constants `iA³/(4π²)`, `−iA³/(3π²)` recompute correctly, with frequency reindexing. Analytic regularization is still an owned proof obligation. |
| 6.1 Completed units and p-adic matrix | Rank zero, one prime of local degree `N`, `(a,−a)`, ℚ(√2) at seven, two-primary torsion, nonunit `p` | `10²≡2`, `11⁶≡15 (mod 49)`; log valuation one follows on `1+7ℤ₇`. No odd-prime-only or discrete-injectivity substitution. |
| 6.2 Trilogarithm differential | `1/2,2,−1,i`; real cut; radial/angular vectors; limit at one | Exact coefficients and derivative tending to zero at one agree; missing native statements: R04. |
| 6.3 Diagnostic interface | Exact nonzero exterior image; positive real interval; zero p-adic digits; empty matrix | Logical distinctions are correct; computational deliverable removed under R01. |

### Source locator ledger

All 18 bibliography works and Borel 1977 were fetched through the source service from legal copies. For SCH, the institutional copy at Stanford was also fetched and has the identical SHA-256 hash to the bibliography copy; its extracted-line locators are unchanged. No source text was copied into the package. These are locator groups actually inspected; a group containing several adjacent numbered results is counted once. The 31 rows below certify locations and the stated scope, except for the expressly limited Borel formula row. They are not certification of every equation in the long scans.

| Work and locator | Extracted-text witness | Verification |
|---|---|---|
| Z90 §7, (33)–(36), Proposition 3; §8 | Z90 lines 841, 884–895, 929 | Bernoulli normalization, endpoints and special-value formulation located. |
| Z07 §3, (2), pp.10–11 | Z07 lines 392–421 | Bloch–Wigner convention, Kummer identity and circle Fourier series located. |
| Z07 §4, pp.13–16 | Z07 lines 571–589 | Hyperbolic interpretation and volume normalization located. |
| G94 Theorem 3.12, Proposition 3.13, §3.10 | G94 lines 1105–1194, 1322–1360 | Projected identities, duality, homology map, rank-two vanishing and conjectural comparison distinguished. |
| G94 Theorem 5.11, manuscript pp.45–46 | G94 lines 2290–2294 | Nonzero rational original-coordinate Borel comparison located. |
| G95 Theorem 1.1 | G95 lines 245–249 | Weight-three existence statement located; it is not an all-cycle isomorphism. |
| G95 Definition 1.5 and triangle order | G95 lines 474–500 | Vertex/side-point ordering and three relation families located; no extra η term in Definition 1.5. |
| G95 Lemma 1.16, Proposition 1.18, Corollary 1.19 | G95 lines 755–802, 832–860 | Arbitrary-curve presentation differs from this package's rational-curve presentation; analytic differential/constancy located. |
| G95 §9.2, pp.310–311 | G95 lines 3473–3485 | All-configuration spectral-sequence proof input is not supplied by the existence theorem alone. |
| MIL Theorem 7.2.1 and Lemma 7.2.2 | MIL lines 160–178 | Angle sum and upper-half-space integration located. |
| SV Definition 3.1.3; Theorem 3.3.1 | SV lines 512–519, 769–773 | Relative-cycle condition and base change, rather than reduced support pullback. |
| SV Corollary/Proposition 3.3.12–3.3.13 | SV lines 1065–1081 | Reduced-base flat case and characteristic-exponent integral issue distinguished. |
| SV Theorems 4.2.2, 4.4.11 and Corollary 4.4.13 | SV lines 2008–2011, 2734–2747, 2802–2814 | h-descent and projective Chow-family representation located; not universal flat incidence. |
| G00 Proposition 4.1, (28), pp.17–20 | G00 lines 733–790 | Weight-three regulator components and derivative normalization agree. |
| G04 §5.4–5.5, Theorem 5.7/5.11 | G04 lines 1799–1805, 2030–2052, 2160–2167 | Borel-coordinate comparison located; matrix-unit calibration independently recomputed. |
| G04 §6.1–6.2, Proposition 6.1 and Lemma 6.4 | G04 lines 2306–2336, 2383–2389 | Distinct B₂ presentations and arbitrary-curve rigidity are explicit: R09. |
| G04 Theorem 6.5 and family/cover results | G04 lines 2392–2398, 2537–2543, 2578–2583, 2651–2678 | Rational-curve formula, six-torsion qualification, family variation and algebraic-number-field cover argument located. |
| G04 Theorem 6.14 and Proposition 6.17 | G04 lines 2793–2805, 2840–2848, 2887–2890 | Arbitrary characteristic and the curve-relation descent argument: R08–R09. |
| GR Theorems 1.1–1.2, Conjecture 1.4 and §1.2 | GR lines 114–117, 196–200, 251 | Existence/every-family distinction and explicit/inductive comparison checked; empty determinants not normalized by imaginary columns. |
| GR §5.1, Lemmas 5.1–5.2, Proposition 5.4 | GR lines 2391–2438, 2586–2593 | Weight-three relations, cobracket and specialization route located. |
| BFT §4, Proposition 4.3 and Theorem 4.7 | BFT lines 251–275, 296–322 | Supported complex and universal regulator comparison located; README cone shift checked independently. |
| BFT §5, (5.1)–(5.2), Proposition 5.16 | BFT lines 335–348, 463–483, 640–654 | Wang form normalization and residue sign located. |
| BFT Theorems 5.23, 5.26 and 6.11 | BFT lines 670–677, 718–724, 828–869, 939–941 | Cube/simplex boundary signs and universal comparison located. |
| D96 Theorems 2.1, 3.3–3.4 | D96 lines 306–313, 766–837 | Curve K₄/residue square and elliptic pairing located; exact Fourier constants in README checked separately. |
| DEM I §§2–3; III §§2–3 | DEM lines 538, 869–871, 1288–1292, 6928–6935, 7027–7052, 7172–7179 | Current complexes, finite-mass extension, support and `i/π` Poincaré–Lelong normalization located. |
| BUR II Corollary 3.8; Definition 4.2, Theorem 4.3, Lemma 4.5 | BUR lines 2948–2954, 3056–3095 | Integrability range, supported Green class and separate coefficient closedness: R07. |
| NEK §§7.3–7.5 | NEK lines 841, 855–867, 889–896, 916–922 | Unit logarithm, cup/tame conventions and curve η normalization located. |
| SCH §4, p.28 | SCH lines 978–1018 | Rational Chern-character sign and multiplicativity located. |
| SHA §1.5, Proposition 1.5.6, Theorem 1.5.7, Definitions 1.5.9–1.5.10 | SHA lines 879–880, 899–901, 922–934 | Completed-unit rank and unit-logarithm formulation located, including the kernel's unit-domain qualification. |
| WEI V §6; WEI4 IV §1 | WEI lines 1728–1732, 1825, 1884, 1908–1939; WEI4 lines 493–503 | Localization, specialization and rational primitive isomorphism located; R10 requests the missing local adapter target. |
| BOR77 Remark 6.3, p.632 | BOR77 lines 590–594 | Totally-real/odd-`m` rationality and locator verified; displayed exponent is lost in text extraction and not visually certified. |

### Pinned APIs, ownership and dependency direction

The manifest pins checked were Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant source files were read at those revisions, rather than inferred from current documentation:

| Library file | Objects checked | Result |
|---|---|---|
| Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean | `integral_log_sin_zero_pi`, half-period integral | Existing normalization input; not a new integral theorem to plan. |
| Mathlib/NumberTheory/NumberField/DedekindZeta.lean | `NumberField.dedekindZeta` | Complex argument and result agree with `.re` in the headline. |
| Mathlib/Analysis/Distribution/Distribution.lean | `Distribution`, `delta`, `lineDerivCLM` | Real test-function continuous dual and negative-transpose derivative already exist. The proposed new carrier is manifold-form currents. |
| Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean | `AlgebraicCycle.map`, residue-degree weights | Native cycle pushforward exists; multiplicity-bearing relative incidence is a separate construction. |
| TauCeti/Analysis/Complex/ContinuousLog/Basic.lean | `HasContinuousLogOn`, nonvanishing, multiplicative/inverse/quotient, slit-plane and gluing/path API | Branch infrastructure exists at the pin; it does not itself prove polylogarithm identities. |
| TauCeti/NumberTheory/LocalField/Logarithm.lean | The four logarithm declarations cited in README lines 63–64 | Finite extensions, including `p=2`; injectivity requires the stated ramification/depth inequality. |
| TauCeti/FieldTheory/FunctionField/Place/Residue.lean | `Place.residueUnit` and multiplication/inverse/power rules | Valuation zero required before reduction, as the package says. |
| TauCeti/FieldTheory/FunctionField/Place/Zeros.lean | `finite_setOf_ord_ne_zero` | Function-field finite support available with its function-field assumptions. |

Main-roadmap contracts inspected: TauCetiRoadmap/GeometricTopology/README.md:627–691 supplies a complete curvature-minus-one metric and volume; TauCetiRoadmap/DifferentialGeometry/README.md, Layers 0–2, 5–6 and 8 supplies the differential-form direction; TauCetiRoadmap/SchemeAndStackFoundations/README.md:6507, 6593, 6641 supplies Chow groups, `Chow.properPushforward`, `Chow.flatPullback` and `Chow.c1`; TauCetiRoadmap/AlgebraicVectorBundles/README.md:422 distinguishes its bundle operations from successor-owned Chow/Chern theory. The package does not need a new owner for these objects. In §5.3's eventual implementation, the actual Chow API names above should be used for the descriptive `proper-pushforward` reference.

The supplied ColemanIntegrationPartII, QWittVectors, ErdosProgressionPowers and ArithmeticDynamics head files were searched for the consumed objects and supplier names. None is named as a direct supplier by this package. ColemanIntegration's base-prefix contract must not be inferred from its Part II head. No duplicate owner was established from those four heads.

Dependency command output, reproduced verbatim:

```text
NOT IN ORDER: Polylogarithms (insert it after its last supplier)
depcheck: 5 roadmaps, 37 edges, 1 problem(s)
```

Exit status was 1. There is **no UPWARD or CYCLE line**. The missing-order line is not raised as a finding, per the review brief. The check's five-roadmap coverage cannot certify unavailable supplier graphs; R06 concerns separately visible dependencies inside this package. No target was moved to or imported from a later roadmap during this read-only pass.

The requested `git diff --stat origin/main...HEAD` showed only the package: README.md (1169 lines), Suggested.lean (402), metadata.toml (1), review.json (8), four files and 1580 insertions. No outside-package PR edit was found. The review did not modify these four files.

## Not verifiable

- Exact current names, signatures, hypotheses and backward edges in the unavailable supplier heads: PolylogarithmFunctions, K3BlochGroups, BorelRegulators, GeneralAlgebraicKTheory, StableHomotopyKTheory, K2SymbolsBrauer, SchemeKTheoryOperations, AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, MotivicEtaleKTheory, IntegralIwasawaTheory and ColemanIntegration. They are absent from the supplied content tree and are not among the four supplied open-head folders. HodgeStructures and MotivesAndAlgebraicCycles are also unavailable for the asserted prerequisite chain of the universal regulator. Their absence from these inputs is not itself reported as a supplier gap.
- The preceding library inspection checks the files and objects listed above, not an exhaustive object-level grep of both complete pinned libraries. In particular, no global claim of absence of an existing polylogarithm/Bloch implementation is certified.
- Lean elaboration, implicit instance synthesis and tactic success were not run, as required by the read-only/no-build instruction. All 52 declarations were inspected; their mathematical signature checks do not replace a build.
- G95's scanned coordinate formulas and some diagram entries have imperfect OCR. Named locations and legible portions were checked, and configuration coefficients were independently recomputed, but every glyph in the §3/§5 complex-comparison diagrams was not certified against an image. BOR77's displayed formula at Remark 6.3 likewise disappears from the extracted text; its scope and location are certified, its exact exponent from the image is not.
- The roadmap leaves the all-configuration higher differentials, quotient-level top comparison, singular logarithmic regularization and common Fourier-product limiting argument as proof obligations. This pass verifies the displayed controls and identifies missing interfaces; it does not supply proofs of those research-level targets.
- No previous repair report marking findings “not actionable in this package” was present in the supplied package. No settled finding is intentionally re-raised.

All cited works were obtainable legally; no unresolved missing-text request remains. R05 concerns the missing package manifest, not inability to obtain the sources.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c17d3192e5b7f90be10abbd58e89729c30bd0aa5", "job": "RT-Polylogarithms~1a", "model": "gpt-6-astra", "worker": "chris-2"} -->
