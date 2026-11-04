## H01 (CBirkbeck) — applied differently

The supplier contract in `TauCetiRoadmap/FunctionFieldArithmetic/README.md:285` replaces an unlinked supplier name with an immutable GitHub link to its actual specification and explicitly records LT.0–LT.2 → FunctionFieldArithmetic; lines 300–303 enumerate the LT.1–LT.2 targets consumed, alongside the three LT.0 targets at line 290. The specification is `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md` at commit `1842229991e0c68c8cc99af607ac3b6e9861f6a4`, and `merge-order/ORDER.txt:55` already places this supplier before FunctionFieldArithmetic at line 168, so the repair exposes the existing owner without duplicating its carriers or changing the library pins.

## H02 (CBirkbeck) — applied differently

The implicit unit-image identification becomes an explicit ramification assertion of lubinTate_artin in `TauCetiRoadmap/FunctionFieldArithmetic/README.md:1092`, proved from the added torsion displacement/Herbrand calculation at line 1023, unramified composita, quotient compatibility and compact inverse limits at line 1116; §4.4 now names this input at lines 1243 and 1262, with characteristic-two and lower-versus-upper Checks. The mathematical gap is confirmed by kw line 1078 and kw line 1084, but the suggested dependencies on #1411 and #1410 are revisions of existing roadmaps, which this job excludes as suppliers: the general cohomological comparison stays with ClassFieldTheory, while this repair supplies the filtration compatibility of the equal-characteristic Lubin–Tate realization already owned here, using yoshida line 895 and yoshida line 905.

### Ownership, sources and citation verification

The immutable supplier link in the README resolves to `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md` with blob `e7f5284e0885c6b7a0611726ca560c40c01a7d96`. Its LT.0 targets are at lines 76, 110 and 146; the consumed LT.1 targets are at lines 246, 280, 298 and 335, and LT.2 targets at lines 394, 412 and 449. The formal-hom and formal-module definitions quantify over commutative rings, and adic-points over complete separated linearly topologized algebras; the mixed-characteristic restriction belongs to LT.1–LT.2, not those three carrier definitions. The index contains no new-roadmap pull request for this supplier; the linked board specification and the existing merge edge are the evidence supplied for review. Pull-request text was outside the authorized edit scope.

The ClassFieldTheory supplier was read on main `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`: `TauCetiRoadmap/ClassFieldTheory/README.md:1425` specifies unit-defined conductor minima and the unramified criterion, without the all-depth comparison. LocalFieldsRamification on that same main supplies lower/upper numbering and the Herbrand quotient theorem in Layer 3, especially `TauCetiRoadmap/LocalFieldsRamification/README.md:883`; this theorem transports an established filtration comparison to quotients. The new calculation starts with actual Lubin–Tate torsion and is independent of the Schmid–Witt calculation, so §4.4 does not supply its own prerequisite. No declaration named map_unitFiltration_normResidue, no generic formal-module carrier, and no supplier's fully qualified declaration name was added here.

Ownership was searched by object in the main roadmaps, the board packages, the indexed open supplier contracts and every supplied sibling checkout. The general formal-module objects remain with LubinTateFormalModulesAndQuasiCanonicalLifts; this roadmap owns the equal-characteristic Lubin–Tate construction and its ramification computation because LT.1–LT.2 have the finite-extension-of-ℚ_p hypothesis. Ownership against other open pull requests for which the brief supplies no files was not checked; in particular the proposed ClassFieldTheory and LocalFieldsRamification amendment heads were not used as supplier contracts. No ownership moved to a later roadmap.

The cross-roadmap citations were resolved against main `ae2562c` and the open heads, and the named supplier sections were inspected. The final resolver reports no unresolved cross-roadmap citation or Lean name; its external-library lookup is unavailable, so library claims were checked directly in the supplied pinned sources instead. Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. `Mathlib/RingTheory/FormalGroup/Basic.lean:56` bundles a two-variable power series and its formal-law axioms, with commutativity a separate class at line 76; `FormalGroup.Point` at line 126 consists of power-series-valued parameters with nilpotent constant term. `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/AdicPoint.lean:69` supplies evaluated points for a Weierstrass law, rather than the generic formal-module action contract. Object searches at both pins found no generic formal-homomorphism/formal-module package discharging LT.0. No update, backport or new point carrier was introduced.

The source's ramification argument was read at its actual generality: yoshida line 83 allows complete discretely valued fields without a characteristic-zero restriction; yoshida line 333 gives torsion as an O/𝔭^m-module, yoshida line 336 gives primitive-point valuations, and yoshida line 895 through yoshida line 904 computes displacement and the Herbrand value. Yoshida Proposition 6.14 states only the final vanishing bound; the fuller filtration calculation used here is explicitly in its proof. Yoshida Theorem 6.15 at yoshida line 905 provides the covering by Lubin–Tate extensions. Kosters–Wan's local-reciprocity input precedes its symbol calculation at kw line 1078 through kw line 1086; its quotient step is kw line 1153. Both works already have the keys yoshida and kw in `packages/FunctionFieldArithmetic/sources.toml`; no new work or missing reference was introduced, and settled uncertified/waived references were not reopened.

### Adversarial mathematics pass

The finite unit sets were enumerated in 𝔽_Q[T]/T^m for Q=2,3,5 and m=1,2,3. The unit-image and upper-group comparisons tested equality of sets in both directions, including inversion and nontrivial quotients; the table also records the valuation and inverse-limit calculations used in the new proof.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Formal-hom supplier preserves the actual law | Multiplicative law, h=2X+X², X=Y=1; wrong h=2X | h(F)=15=F(h,h); wrong h gives 6≠8 | The homomorphism condition distinguishes the operations | Expose the supplier; no replacement definition |
| Tangent-compatible coefficient action | Additive law over 𝔽₃[[T]], coefficient T | Derivatives T=T for TX; T³≠T for a Frobenius-twisted action; zero action has [1]=0≠X | Tangent and unital conditions exclude both wrong actions | Retain exact LT.0 contract |
| Evaluated adic-point carrier | Multiplicative law over ℤ₃ at x=y=3; zero ideal; ε²=0 | 3+3+9=15 and (1+3)²=16=1+15; zero point sums to 0; ε+_F ε=2ε | Evaluated law agrees with its intended group | Reuse the adic-points supplier |
| Mixed-characteristic supplier targets | Q=3, m=1, multiplicative Lubin–Tate law | [3](X)=3X+3X²+X³; primitive division degree 2=(3−1)3⁰; arithmetic Artin of −1 acts by −1 | Matches the LT.1–LT.2 contract | Name the exact consumed targets |
| Displacement index is independent of the unit lift | m=2, a=1+T and a′=1+T+bT²; identity class | ord(a−1)=ord(a′−1)=1<2; a=1 would give ∞ rather than an allowed j | The nonidentity hypothesis is necessary | State a∈Oˣ and a≢1 mod 𝔭^m explicitly |
| Torsion displacement | Q=2,m=3,j=1,2; Q=3,m=2,j=0,1 | ord_M([a−1]α)=2,4 and 1,3 respectively; ordinary displacements have the same values | Matches primitive torsion levels m−j | Add the displacement assertion |
| Ordinary versus formal subtraction | ord_M(α)=1, ord_M(β)=2 or 3 | Higher mixed terms have order at least 3 or 4; both formal and ordinary differences have order 2 or 3 | Higher terms cannot cancel the leading displacement | Explain the valuation step |
| Herbrand conversion | Q=3,m=2; Q=2,m=3 | φ(2)=1, φ(8)=2; φ(1)=1, φ(3)=2, φ(7)=3 | φ(Q^s−1)=s, including the trivial final group | Add the conversion, not an identification of the two indices |
| Finite unit-image/upper-group equality | Q=3,m=2,r=0,1,2 | Image orders 6,3,1 equal upper orders 6,3,1; lower orders at 0,1,2,3 are 6,3,3,1 | Wrong lower numbering fails at r=2 | Add the exact upper filtration and Check |
| Trivial first level and residue characteristic two | Q=2,m=1 and m=2 | At m=1 all orders are 1; at m=2 upper/unit orders are 2,2,1 for r=0,1,2 | No nontrivial tame factor at Q=2 | Add the characteristic-two Check |
| Arithmetic inversion preserves unit filtrations | Q=5,m=1,a=2; deeper principal units | 2⁻¹=3 and 2·3=1 mod 5; both lie in U⁰, while U¹/U¹={1}; enumerated inverses preserve every U^r | Artin inversion changes the action, not its subgroup image | Retain arithmetic normalization in the comparison |
| Depth-zero comparison | Unramified quadratic L/K; identity extension | Unit image=G⁰={1}, whereas Art(π) has order 2; identity extension gives order 1 at every depth | U⁰ must be Oˣ | State r=0 and its negative-control Check |
| Unramified base extension | Q=3,m=2 torsion composited with an unramified quadratic field | Total group order 12; nonnegative ramification orders 6,3,1 equal unit-image orders 6,3,1 | The unramified factor contributes no inertia | Explain the compositum step |
| Quotient compatibility | Q=3,m=2, quotient by tame subgroup of order 2 or wild subgroup of order 3 | First quotient gives image/upper orders 3,3,1; second gives 2,1,1 | Equality survives both kinds of quotient | Use Herbrand only after the LT comparison |
| Compatible inverse limits | Q=2,r=1,m=1,2,3,4 | Finite image orders 1,2,4,8; u=1+T restricts to 1,1+T,1+T,1+T; the pair (1+T,1) at levels 2,3 fails compatibility | One compact unit realizes compatible finite images | State compactness and finite-quotient definition |
| Constant-only infinite extension | Unramified ℤ₂ tower, finite degrees 2,4,8 | Every unit-image order and every nonnegative upper-group order is 1 | No spurious inertia appears in the limit | Add the unramified tower Check |
| Schmid–Witt upper-group input | y³−y=T⁻¹; finite quotient killing the tame subgroup above | U¹ image and G¹ each have order 3; U² image and G² each have order 1; conductor exponent 2 | The symbol filtration now has a prior ramification identification | Name §4.2 in §4.4's route and Needs |
| Existing primitive normalization under the added comparison | x=p[T⁻¹], n=1,2, p=2,3; zero or constant-only class | Degrees 1,p and conductors 0,2; primitive infinite G¹=ℤ_p; zero/constant positive groups=0 | No finite-layer shift or conductor change | Preserve the previous ASW formulas |

All new assertions retain the complete discretely valued field and finite residue field assumptions of Layer 4, m≥1 for primitive Lubin–Tate torsion, abelianness for Artin restriction, and integer depths r≥0. The a=1 case is excluded before taking its finite displacement valuation. Inseparable extensions do not satisfy the abelian Galois hypothesis; Q=1 is not a field cardinality. There is no denominator added, no conclusion assumed as a hypothesis, and the ramification argument uses only §4.1, the earlier part of §4.2 and LocalFieldsRamification Layer 3.

### Elaborated signatures and README agreement

All 18 supplied elaborated `#check @name` types were compared with their README statements and the unchanged `Suggested.lean`. No declaration lost a required binder, no statement or definition changed, and no signature re-elaboration was needed because the Lean file was unchanged; the targeted module build passed against the pins. The ramification additions remain README targets on the formal-module/torsion carriers already identified as unavailable in the module docstring.

| Declaration | Binder/statement comparison and computed witness |
| --- | --- |
| exists_divisor_degree_eq_one | Finite k, intrinsic function-field hypothesis and exact constants retained; degrees 3 and 2 combine as 3−2=1, without asserting a degree-one place. |
| riemannRoch_reducedBasis | Rational-subfield algebra, scalar tower, finite dimension, hF and the chosen unit x retained; for D=−∞ on k(x), r=0,1,2 gives bases empty, {1}, {1,x}, dimensions 0,1,2. |
| artinSchreierWitt | Prime and characteristic retained; on W(𝔽_p), Frob−id=0. |
| aswQuotient | Same prime and characteristic hypotheses retained; over 𝔽_p the length-0,1,2 groups have orders 1,p,p². |
| witt_additiveHilbert90 | Finite-dimensional cyclic Galois extension and generating σ retained; at n=1 over 𝔽₄/𝔽₂, trace values 0,0,1,1 have kernel {0,1}, equal to the difference image, and trace image {0,1}; n=0 gives singleton groups. |
| artinSchreierWitt_galois | Prime, characteristic and arbitrary n retained; over 𝔽_p, quotient and continuous-character counts are both pⁿ, including 1 at n=0. |
| localAbelianExistence_laurentSeries | Finite coefficient field, open subgroup and finite index retained; H=Kˣ gives degree/index 1, and valuation subgroup 2ℤ gives the unramified degree/index 2. |
| effectiveDivisorCount | Total Nat.card definition requires only its field/algebra carriers; on ℙ¹/𝔽₂, A₀,A₁,A₂=1,3,7. |
| zeta | Same definition-level carriers; first coefficients 1,3,7 on ℙ¹/𝔽₂. |
| placeCount | Same definition-level carriers; degree-0,1,2 place counts on ℙ¹/𝔽₂ are 0,3,1. |
| pointCount | Same definition-level carriers; N₀=0 from the empty divisor index set, N₁=3, N₂=3+2·1=5. |
| zeta_eulerProduct | Finite field, hF and exact constants retained; the T² coefficient is 6 pairs of degree-one places plus one degree-two place, 6+1=7=A₂. |
| zeta_logDeriv | Same arithmetic hypotheses and r>0 retained; r=1,2,3 gives 3=3, 14=14, 45=45. |
| effectiveDivisorCount_of_large | Same arithmetic hypotheses and 2g≤n+1 retained; g=0,q=2,n=0,2 gives 1=2−1 and 7=8−1, with no subtraction underflow. |
| zeta_rationality | Same arithmetic hypotheses retained; ℙ¹/𝔽₂ has numerator 1, and y²=x³+x+1 over 𝔽₅ has affine fibre counts 2,0,2,2,2, hence N₁=9, P=1+3T+5T² and P(1)=9. |
| IsLPolynomialData | Total integer-polynomial predicate, with no implicit field restriction; g=1,N₁=9,q=0,1,5 gives coefficient lists (1,8,0), (1,7,1), (1,3,5), satisfying the stated Newton/symmetry equations. |
| IsLPolynomialData.unique | Both predicates use the same q,g,N; g=0 forces P=1, while q=5,g=1,N₁=9 forces a₁=3 and a₂=5. |
| lPolynomial_isLPolynomialData | Finite field, hF, exact constants and the actual zeta-numerator identity retained; the elliptic example gives 3=9−5−1 and 5=5·1; changing N₁ to 8 gives the false equality 3=2. |

### Validation and commit

Committed as `f7a17ee02467963667a25c686e614fe9e90663c4`: `FunctionFieldArithmetic: review repairs (expose supplier and derive ramification comparison)`. Only `TauCetiRoadmap/FunctionFieldArithmetic/README.md` changed; the worktree is clean and nothing was pushed.

Build: `lake build TauCetiRoadmap.FunctionFieldArithmetic.Suggested` exited 0, with the 11 expected admitted-theorem warnings and no errors. Exact final line:

```text
Build completed successfully (9028 jobs).
```

The final mechanical dependency check produced the following complete output, with no UPWARD or CYCLE line:

```text
depcheck: 35 roadmaps, 327 edges, 0 problem(s)
```

The gate was rerun after committing and exited 0. Exact gate summary line:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
