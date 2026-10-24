# Human review response: HeegnerPointEulerSystems

Commit: `1c93fe1` (two authorized roadmap files; not pushed).

The review contains eight distinct actionable points: its coefficient-ring and arithmetic-construction objections are separate, as are supplier availability, characteristic-three rigidity and elliptic-unit/Katz ownership. H04–H06 remain blocking specification obligations; a successful build and content gate do not discharge them.

## H01 (CBirkbeck) — applied

The equality for an arbitrary parametrization becomes an equality for the specified primitive family, with the factor (a)² for scalar multiples and exact Selmer kernel/cokernel factors for isogenies in `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:1399`, carried through §§8b.2, 8b.7 and 8b.10; the normalizations use the optimal quotient, distinguished lattice, fixed isogenies, clearing integer and Néron/BDP periods (bcgs line 505, bcgs line 524, bck line 71, cgs line 870). In S=ℤ₅⟦T⟧ with source class 25, multiplication by 5 changes the square-index valuation from 4 to 6, so the repaired identity has the compensating valuation 2 on char(X_tors), while §8.13 explicitly compares only the same underlying point family.

## H02 (CBirkbeck) — applied

The coefficient ideal in the conventions and `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:678` changes from (a_ℓ,ℓ+1)⊂ℤ_p to the same ideal in the actual coefficient DVR R=O_𝔭, with uniformizer valuation and depth v_ϖ(p)m for reduction modulo p^m. In ℤ₅[ϖ] with ϖ²=5, a₁₉=ϖ gives I₁₉=(ϖ), although the residue field is 𝔽₅; the elliptic ℤ_p formulas are the specialization, and the generic ideal classification is imported from the pinned `IsDiscreteValuationRing.ideal_eq_span_pow_irreducible`.

## H03 (CBirkbeck) — applied

Elliptic-only Kummer/descent becomes the completed O_𝔭-component construction on T_𝔭A_g/ϖ^M in `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:603` and §§4.2–4.4, followed by the actual Hecke-maximal-ideal classes in the common V/k₀ at §4.10 (`README.md:795`), with coefficient, localization, marking and derivative-convention comparisons (zhang line 741, zhang line 774, zhang line 843, zhang line 854). Sections 6.7, 6.12, 6.13, 6.15 and 6.18 now consume this arithmetic construction; the generic derivative theory remains supplied once, and the separate level-raising/multiplicity-one contract is still required for its coefficient identifications.

## H04 (CBirkbeck) — answered

GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, KatoEulerSystems, PadicHodgeRegulators and AutomorphicCongruences have no roadmap specification on verified main `1c3cc07` or in the indexed open-roadmap heads; their board records do not supply the missing reviewable specifications consumed by `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:121` and its other supplier contracts. This remains blocking: the authorized edits cover only this roadmap’s README and Lean file, so adding or revising those owners, the pull-request dependency description or the merge order is outside scope, and another obligation paragraph here would not repair their absence.

## H05 (CBirkbeck) — answered

The characteristic-three rigidity obligation at `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:163` remains unresolved: EulerSystemsAndKolyvaginSystems at head `d10d192`, §§5.11–5.13, still excludes p=3 from the relevant rigidity/exact-length assertions, and bcgs line 905 states Lemma 2.2.4 only for p>3 despite the p≥3 statements at bcgs line 832. A proved characteristic-three extension requires its own specification and proof at the general owner; narrowing this roadmap to p>3 would discard the required odd-prime scope, and its owner’s files are outside the authorized edits.

## H06 (CBirkbeck) — answered

The elliptic-unit/Katz obligation at `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:225` remains unresolved: EulerSystemsCyclotomicMainConjecture at head `0ff8c20` develops cyclotomic/circular units, including its §5.1 index theorem, rather than the required imaginary-quadratic elliptic-unit/Katz components. The board’s `packages/ModularIwasawaMainConjecturesPartII/design/README.md`, §§CZ.2–CZ.3, routes related CM work to a different proposed owner, so assigning a new extension to the existing cyclotomic roadmap here would neither establish an eligible earlier supplier nor respect existing ownership.

## H07 (CBirkbeck) — applied

The Eisenstein route gains the actual Heegner bound over Λ[1/p] at the augmentation prime in `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:1853` (§8.39a), using §§8.24 and 8.33–8.35 and the uniform errors of §8.39, and §8b.10 now explicitly consumes it before finite-system nonvanishing. This is CGS Theorems 6.5.1–6.5.2 (cgs line 1426, cgs line 1432, cgs line 1438), with E(K)[p]=0 and no residual irreducibility or corank-one hypothesis; at augmentation, lengths 4>3 refute the bound even though both modules disappear after inverting γ−1.

## H08 (CBirkbeck) — applied differently

Competing classical CM constructors become imports of ArithmeticStatisticsPartVI’s marked divisors/images in `TauCetiRoadmap/HeegnerPointEulerSystems/README.md:452` and §1.6, with explicit ownership of its logarithm/height, low-rank and character-multiplicity targets in Scope and ownership and the supplier contract at `README.md:147`; EffectiveClassNumbers §2.8 retains the conductor-one trace. Statistics remains earlier and supplies its full odd-prime nonvanishing theorem, including bad, ramified and nonordinary primes, while §§7.11–7.12 explicitly distinguish conditional all-prime descent and general-F RM descent from its character-level theorem, so no reverse import or target move is needed and the missing general CM/height supplier remains the separate H04 obligation.

## Citation, ownership and pin audit

The final citation inventory uses main `1c3cc07` and the 332 open-roadmap heads indexed at 2026-10-24T02:57:03Z. The five missing suppliers were checked independently of citation-name resolution; its four unresolved citation leads correspond to the missing GrossZagierAndArithmeticHeights, ModularIwasawaMainConjectures, KatoEulerSystems and PadicHodgeRegulators specifications, while AutomorphicCongruences is absent as well. These unresolved citations are retained as explicit blocking inputs, not reported as resolved.

The added statistics contracts were read at `88461f2`; the generic Euler-system and cyclotomic-owner READMEs were reread at their final indexed heads and have the same relevant contents. The added abelian Kummer input resolves to SelmerIwasawaCohomology §2.12a, which constructs the field/isogeny-natural connecting map and all-place Selmer comparison; the coefficient-localized point-family application belongs here. The new common-residual construction and augmentation-prime theorem concern the actual Heegner system, leaving generic derivative, cohomology, valuation and characteristic-ideal APIs with their existing owners.

Ownership was searched by mathematical object across main, the open-roadmap inventory, the board packages and all supplied sibling checkouts. EffectiveClassNumbers retains its trace, statistics retains its CM images and character applications, and the general Euler-system owner retains derivatives and abstract descent; no later supplier was introduced and no existing roadmap was replanned. The board’s CM designs do not constitute an eligible main/open specification for H06.

The library revisions were verified as Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching the manifest. Mathlib’s `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56` defines a DVR under commutative-ring/domain assumptions as a local principal ideal ring with nonzero maximal ideal; its line 362 supplies the nonzero-ideal power theorem and does not impose topology, completeness or finite residue field. Those arithmetic coefficient assumptions are separately retained in the roadmap.

No new cited work or missing legal source was introduced; the source evidence above uses the supplied legal extractions. The unresolved items are missing mathematical specifications and proof obligations, not requests for literature.

## Acceptance-test and signature audit

The declaration inventory of `TauCetiRoadmap/HeegnerPointEulerSystems/Suggested.lean`, after removing its module docstring, is empty: zero definitions, instances and theorems. The per-declaration `#check @name` list is therefore empty and no variable binder can disappear; there is no nonempty signature scratch file to elaborate. The requested module build elaborated the import and namespace successfully. The docstring now also names the missing arithmetic carriers for the common-residual construction, augmentation-prime bound and normalized-family equalities; it introduces no surrogate theorems.

## Adversarial pass on repaired statements

These are computed local and module controls for the changed statements and their new proof inputs; source certification of an arithmetic theorem is separate from testing its algebraic shape. Cases outside the displayed hypotheses are negative controls, not additional claimed arithmetic realizations. The table does not certify the unresolved supplier obligations.

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Conventions: actual coefficient DVR and normalized depth | R=ℤ₅[ϖ], ϖ²=5; k=𝔽₅ | vϖ(ϖ)=1; vϖ(5)=2; reduction mod 5 requires depth 2 | Corrected ℤ_p → R; residue field does not determine R |
| Conventions: nonzero coefficients and characteristic zero | R=𝔽₅ versus integer ring R of ℚ₅(√5) | 5=0 in 𝔽₅; 5=ϖ²≠0 in R | The former is excluded; nonzero ℓ+1 makes finite depth well defined |
| Pinned nonzero ideal classification | I=(5²) and I=0 in ℤ₅ | exponents 2 and ∞ respectively | Use IsDiscreteValuationRing.ideal_eq_span_pow_irreducible; nonzero hypothesis retained |
| §1.5 supplied CM image and quotient functoriality | Point-module control x=1; quotient ×2, then ×3; zero map | 3(2·1)=6=(3·2)1; zero map gives 0 | Reuse supplied image; point and trace remain distinct |
| §1.6 conductor-one agreement and trace scaling | Two-element negation orbit of 1; scale by 5 | 1+(−1)=0; 5·0=5+(−5)=0 | Transport the same marked family, rather than reconstruct it |
| §3.1 actual localized Kummer construction | Free completed point module R; M=0,1,2; points 0,1,ϖ | R/(1)=0; [1]ϖ≠0; [ϖ]ϖ=0, [ϖ]ϖ²≠0 | Added GL₂-type finite and integral classes; no fractional uncompleted points |
| §3.1 unit denominator | p=5; denominators 3 and 5 | 3⁻¹=2 mod 5; 5⁻¹ undefined mod 5 | Only a 𝔭-unit denominator is used in the normalized point |
| §3.1 coefficient reduction | R, point ϖ, M=2 → M′=1 | [ϖ]ϖ² maps to 0=[ϖ]ϖ | Specified finite classes as actual reductions |
| §3.1 scalar extension | k₀=𝔽₅ → k=𝔽₂₅; point coefficients 0 and 1 | 0↦0, 1↦1; the latter remains nonzero | Base change is tied to the Kummer map |
| §3.1 restriction and corestriction | Identity extension; two-element negation orbit | res(1)=1; cor gives 1−1=0=δ(trace) | Real field maps, not arbitrary cohomology identifications |
| §4.1 sum of coefficient ideals | p=5; (a₁,ℓ₁+1)=(10,20), (a₂,ℓ₂+1)=(25,150) | local depths 1,2; sum depth min(1,2)=1; product depth 3 | Arithmetic specialization of the supplied ideal, over R |
| §4.1 empty conductor | n=1; empty prime set | Σ∅=0; T/0=T; M(1)=∞ | No finite-power replacement of the empty sum |
| §4.1 zero eigenvalue and finite depth | aℓ=0, ℓ=19, p=5 | min(∞,v₅(20))=min(∞,1)=1 | v(0)=∞; ℓ+1≠0 is essential |
| §4.1 insertion law | s empty, then insert 19 with a=10 at p=5 | 0+(10,20)=(5) | Correct sum, not intersection |
| §4.1 ordered quotient maps | I_s=(25), I_t=(5) in ℤ₅ | [6]25↦[1]5; 25↦0 mod 5; [1]5 has no well-defined lift mod 25 | Direction R/I_s→R/I_t is retained |
| §4.1 ramified coefficient ideal | a₁₉=ϖ, R=ℤ₅[ϖ], ϖ²=5 | min(1,vϖ(20))=min(1,2)=1; length R/(ϖ)=1; cardinality 5 | The generator need not lie in ℤ₅ |
| §4.2 cyclic derivative and its sign | C₃, D=σ+2σ² | (σ−1)D=(2,−1,−1)=3−(1+σ+σ²); −D gives (−2,1,1) | Fixed range and computed sign witness |
| §4.2 full orbit sum and empty derivative | D₁=1; conjugate points 1 and −1 | trace 0, raw point 1; multiplying derivative by 1 leaves 0 | The full Galois trace remains necessary over R |
| §4.2 endpoint convention | d=20, ℓ=19, Iℓ containing 20 | D_Zhang−D_supplier=20·1=0 in R/Iℓ | The two source conventions agree only after the required reduction |
| §4.3 invariant vanishing and excluded trivial representation | p=5; scalar 2·id versus trivial action on 𝔽₅² | fixed-space dimensions 0 versus 2 | Added the GL₂-type branch under Zhang’s actual image hypotheses |
| §4.3 induction over coefficient exponent | R/(ϖ²), vector ϖ; multiply by ϖ | ϖ·ϖ=ϖ²=0; its socle is a residue-field submodule | Invariant induction needs the residual vanishing; trivial action still has nonzero socle |
| §4.4 unique descent | Restriction control χ(x,y)=(x+y,y), z=(0,1) | χ⁻¹z=(−1,1); χ(−1,1)=(0,1); zero map has preimages 0,1 of 0 | The inverse uses the proved vanishing, including for T𝔭/ϖ^M |
| §4.4 coefficient/restriction square | χ on ℤ²; reduce (−1,1) modulo 5 | χ(4,1)=(0,1) mod 5, the reduction of χ(−1,1) | Same descended class, not an unrelated residual class |
| §4.8 ramified reduction depth | e=2, p=5, M(n)=1 then 2, m=1 | ϖ∉(5); ϖ²=5∈(5); required inequality 1<2 or 2≥2 | Added depth em for reduction modulo p^m |
| §4.10 common residual carrier | J[𝔪]≃V≃A⁰[𝔭₀], marked basis of 𝔽₅² | (1,0)↦(1,0); zero class↦(0,0) | Arithmetic Kummer construction is now a target before Layer 6 |
| §4.10 scalar-extension comparison | 𝔽₂₅=𝔽₅[t]/(t²−2) | 1 extends to 1; squares mod 5 are 0,1,4 so t∉𝔽₅ | An arbitrary k-class cannot be declared k₀-rational |
| §4.10 localization, restriction and marking compatibility | χ(x,y)=(x+y,y); marking u=2; x=(2,3) | χ(2x)=(10,6)=2χ(x); mod 5 both give (0,1) | Added commuting maps and retained scalar marking |
| §4.10 residual nonvanishing normalization | R=ℤ₅[ϖ]; completed coefficients 1,ϖ | [1]ϖ=1, [ϖ]ϖ=0 | A nonzero integral point map alone does not fix a nonzero residual class |
| §6.7 new common-carrier prerequisite | Two residual local lines over 𝔽₅; values 3 and 1; ratio 3 | 3=3·1; scaling both by 2 gives 1=3·2 mod 5 | The arithmetic classes now precede the level-changing congruence |
| §6.12 support invariant with new residual carrier | support at 1, support only at 6, empty support | ν=0,2,∞ respectively | Same definition, now supplied by §4.10 |
| §6.13 base locus with new residual carrier | all zero localizations; one localization equal to 1; ℓ=p | all permitted good primes; that prime excluded; p excluded | Same good-prime domain, now supplied by §4.10 |
| §6.15 finite/transverse relation and parity | 𝔽₅² finite e₁, transverse e₂; ψ(e₁)=e₂; w=−1 | ψ(1,0)=(0,1); ε₀=+1, ε₁=−1 | Normalization and localization come from §4.10 |
| §6.18 triangular-basis dimensions | ν=0,1,2 | (preferred dimension, opposite bound, detecting primes)=(1,0,1),(2,1,3),(3,2,5) | Actual common-carrier classes added to prerequisites |
| §7.11 conditional versus character descent | Untwisted free rank-one module with trivial C₃ action | trivial component dimension 1; either nontrivial character component dimension 0 | Does not replace statistics’ nontrivial-character theorem |
| §7.12 RM versus elliptic character conclusion | RM degree d=1,2 | predicted free ℤ-ranks 1,2, whereas a selected elliptic χ-component has coefficient dimension 1 | Explicitly different carriers and hypotheses |
| §8.6a optimal/distinguished lattices | map diag(5,1) on ℤ₅²; source versus target | determinant 5; cokernel order 5 and length 1 | Unit differential does not identify integral Tate lattices |
| §8.6a X₁ distinguished-curve convention | 2-power isogeny at p=3 and p=5 | v₃(2^r)=v₅(2^r)=0; at p=2 valuation r | Prime-to-p comparison applies only in the stated odd-prime setting |
| §8.6a scalar family and regulator | source class 25 in free ℤ₅⟦T⟧; a=5 and a=2 | class/regulator scales to 125 or 50; quotient exponents 3 or 2 | Fixed maps and periods; every nonunit retained |
| §8.6a scalar exact sequence | y_src=5², a=5 | kernel Λ/(5) length 1; quotient lengths 3=1+2 | char(Q_a)=(a)char(Q_src) |
| §8.6a corrected integral square equality | source quotient (5²), source X characteristic (5⁴), a=5 | uncorrected lengths 4≠6; corrected lengths 2+4=6 | (a)² on char(X_tors), never silently cancelled |
| §8.6a zero and unit cases | a=0 or 2 at p=5 | a=0 leaves quotient rank 1; v₅(2)=0 so corrected lengths 4=4 | Nonzero scalar hypothesis and unit test explicit |
| §8.6a isogeny maps and exact transport | S=Λ, y_src=5; X_tors=(Λ/(5))²; f=[5], a=1 | C_S exponent 1; K_X,C_X exponents 2,2; both sides exponent 6 | Retained all three torsion factors in the displayed transport identity |
| §8.6a primitive prime-to-p isogeny | p=5; cyclic subgroup of order 5 versus scalar [5] | cyclic kernel gives invariant residual line of dimension 1; [5] kernel dimension 2 and degree 25 | Residual irreducibility excludes the first; primitive excludes the second |
| §8.13 normalization-unit comparison | p=5; α=1 mod 5, β=0 mod 5, u_K=1 | u_Kα²(β−1)²=1 mod 5; inert u_Kα²(β²−1)=−1 mod 5 | Unit for the same family only; does not cancel a p-multiple |
| §8.39a rank-one paired decomposition | X=Λ⊕(A/(T²))² over A=Λ[1/5] | free rank 1; paired torsion length 2+2=4 | Actual non-torsion Heegner system and uniform bound are inputs |
| §8.39a augmentation divisibility | M=A/(T²), Q=A/(T³) | lengths 2≤3; paired 4≤6; (T⁴)⊃(T⁶) | Includes (T) without residual irreducibility |
| §8.39a negative augmentation control | M=A/(T⁴), Q=A/(T³) | 4≤3 false; after inverting T both lengths become 0 | Old localization cannot supply the new bound |
| §8.39a weak torsion versus irreducibility | cyclic action diag(2,3) on 𝔽₅² | two invariant lines; common fixed-vector dimension 0 | No irreducibility assumption added to Eisenstein descent |
| §8b.2 fixed BDP comparison under scaling | p=3; source logarithm valuation 2; scale by 3 | squared logarithm valuations 4→6; square-index valuations 4→6 | Same scaling on both sides, or explicit (3²) |
| §8b.5–§8b.9 normalization in equalities | source q=5², X characteristic 5⁴; prime-to-5 isogeny and a=2 | normalization factors have valuation 0; equality 4=4 | Uncorrected equality uses the specified primitive family |
| §8b.10 Eisenstein proof order and scalar factors | augmentation lengths M=2,Q=3; source equality q=5², X=5⁴; a=5 | bound 4≤6; scaled corrected equality 2+4=6 | §8.39a is now an input; Katz and reciprocity specifications remain separately necessary |
| §8b.13 determinant normalization prerequisite | unit a=2 at p=5; nonunit a=5 | a·ι(a)=4 has valuation 0; 25 has valuation 2 | Carries normalization into the existing determinant comparison |

## Build and gates

`lake build TauCetiRoadmap.HeegnerPointEulerSystems.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.HeegnerPointEulerSystems.Suggested (4.4s)
Build completed successfully (8976 jobs).
```

The committed worktree is clean. The required dependency check exited 0 and emitted exactly:

```text
depcheck: 28 roadmaps, 252 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. The final full gate exited 0 and emitted exactly:

```text
gate HeegnerPointEulerSystems: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
