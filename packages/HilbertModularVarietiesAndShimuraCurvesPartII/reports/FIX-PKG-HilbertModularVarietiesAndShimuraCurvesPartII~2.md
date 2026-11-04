# Repair report

The findings were verified as mathematical claims. Edits are confined to the authorised package files and this report; only the top-level `gaps` value changes in `design/plan.json`.

## F01 (P2) — applied

Parent evaluation on r̄∨⊗ω⁻¹ → evaluation on r̄⊗ω with arithmetic Frobenius. Updated the parent contract and §0.3, including the numerical negative control. Propagated the same convention to the finite realization and §5.6's completed deformation/Hecke map, with dualization, the ε⁻¹ twist and explicit geometric trace and determinant images.

Evidence: BHHMS23 lines 4449–4451 and HilbertModularVarietiesAndShimuraCurves §R18.3.15. Over 𝔽₂₉ the two evaluations are (9,25) and (1,20), respectively. The completed geometric images are S⁻¹T=5 and qS⁻¹=6, rather than trace T=9. The parent §R18.4.27 uses geometric Frobenius, unlike §R18.3.15: its geometric realization is dualized and ε⁻¹-twisted. Its determinant ψ_parent·ε⁻¹ becomes ψ_parent⁻¹·ε⁻¹=ψ·ε⁻¹ when ψ_parent=ψ⁻¹.

## F02 (P2) — applied differently

Owned §1.1 and `powerSeries_cancellation` → the earlier DeformationAndDerivedPatchingAlgebra request `gap:power-series-cancellation`. Updated the scope, acceptance-file description, dependencies, source attribution and plan gaps. Retained discriminating cancellation Checks under the supplier contract. Stated relative cancellation explicitly; restricted the coefficientwise Witt correction to its power-series target, where that automorphism exists.

Evidence: HAM75 line 101; its proof at HAM75 lines 102–120 uses substitutions and quotient maps fixing any shared coefficient subring. BHHMS23 lines 4404–4405 invoke it. LocalGaloisDeformationRingsPartII T.6/special-fibres already requests this theorem from DeformationAndDerivedPatchingAlgebra R03.3. The abstract cancellation theorem remains general. The supplier must fulfil the declared gap; its files are outside this repair. An arbitrary complete local W(𝔽)-algebra is not assumed to admit a coefficientwise Frobenius automorphism.

## F03 (P2) — applied

Invariant-exchange bridge and even-degree definite compatibility → global Jacquet–Langlands and all-Hilbert compatibility. Added the GL2AutomorphicRepresentationsAndTransfer contract; updated both character and special-representation steps in §0.7, its Needs line and Layer 0 dependencies. Added the cubic indefinite parity and eigenvalue-ratio Check.

Evidence: GL2AutomorphicRepresentationsAndTransfer §§R17.3.1, R17.3.10 preserve split-place components without an even-degree restriction. AutomorphicGaloisRepresentations §4.4 covers every Hilbert form of the specified type and every finite place away from the coefficient prime, retaining monodromy. Its §6.10 explicitly assumes even degree and a definite quaternion algebra. The source route is BHHMS23 Corollary 8.4.6(ii), BHHMS23 line 5389.

## F04 (P2) — applied

Unqualified reverse depth inequality → equality when the B-module is finite over both A and B. Added the strict-inequality example and its finite-over-A counterpart in §2.5. The Cohen–Macaulay transfer statement and downstream flatness route retain their existing finiteness hypotheses.

Evidence: GN22 lines 2171–2175, 2230–2241. For M=O⟦T,y⟧, Ext over A first appears in degree 2 with value κ⟦y⟧, and over B in degree 3 with value κ. For M=B/(y), both depths are 2.

## F05 (P2) — applied

Compound local/global Breuil–Mézard request → the unique local multiplicity identity and predicted-weight support, with finite K, p>2 and sufficiently large coefficients. §0.6 explicitly owns global patched-weight nonvanishing; §1.5 explicitly owns scheme-theoretic crystalline weight support and arithmetic nonvanishing. Updated both gap descriptions and the proof route; added multiplicity and nilpotent-action Checks.

Evidence: GK14 lines 105–123 state the local identity and weight identification; GK14 lines 1573–1580 give global nonvanishing. EGS15 lines 1832–1835 concern the action on the quaternionic patched weight module. These global conclusions are no longer requested from the local-ring supplier. No empty predicate or replacement Lean theorem was introduced.

## F06 (P2) — applied differently

“Full dictionary” → explicit characteristic-zero tame types, weight-isolating and all-weight types, cosocle lattices, capped subquotients and two-weight extension types. Moved component-union ideals to the ring gap, keeping their formal-variable base change distinct from the global annihilator theorem. §3.2 defines the transported ideals, states that theorem and supplies three discriminating ideal Checks. Mirrored both gaps in the plan.

Evidence: EGS15 lines 687–688, 3212–3241, 3324–3327; BHHMS23 lines 4616–4636, 4706–4713. The type-image assertion concerns E-representations inflated from GL₂(k), after scalar extension; it is not an assertion about arbitrary smooth or mod-p K-representations. Proposition 10.1.11 is a two-weight extension statement, so it remains with type/lattice data. Local component ideals belong to the ring supplier; equality with patched annihilators belongs here.

## F07 (P3) — applied

Design identifiers → reader-facing sections: GK.0→§0.5, GK.1→§1.2 for rings and §1.6 for coefficient objects, GK.4/GK.5→Layers 4–5. Updated every occurrence in the README, including both weighted-representation references. No sections were renumbered.

The final README has zero matches for `GK\.[0-9]`.

## F08 (P3) — applied

Repeated line locators → BHHMS23 lines 5044, 354 and 288; Lemma 8.2.1's page range → p. 90. Replaced both inappropriate Tag 00MK uses with GN22's ideal-separated argument. Every Kisin-smallness reference now cites EGS15 §6.2, p. 34, EGS15 line 1695. Updated the source manifest's retained locators and uses.

Evidence: Lemma 8.2.1 ends at BHHMS23 line 4584, before p. 91. STACKS lines 10986–10988 assume a finite module over a commutative Noetherian local target. GN22 lines 2285–2289 instead apply the criterion to ideal-separated tensor modules, permitting the noncommutative larger algebra. No new Matsumura citation was introduced: the checked GN22 proof supplies this step.

## F09 (P3) — applied

Ambiguous §5.6 → “this roadmap's §5.6” in both contracts. Auxiliary-level freeness → §0.1 and BHHMS23 Remark 8.1.3(iii). The parent §R18.1.4 is retained for its central-kernel input. Updated §0.4's Needs line; §0.3 already imports §0.1 and now gives the precise source in its route.

Evidence: BHHMS23 lines 4452–4461 establish the auxiliary-level central action and quotient. EGS15 lines 1692–1696 establish smallness for the chosen unipotent level. HilbertModularVarietiesAndShimuraCurves §R18.1.4's congruence-level freeness hypothesis is narrower and cannot replace that argument.

## F10 (P3) — applied differently

Identity cancellation tests → dimension and coefficient-automorphism controls under the cancellation supplier contract. Deleted all three `max(f,f)=f` claims. Impossible f=|S|=q=1 examples → the definite rational datum with S={p,ℓ}, giving variable counts 10 and 8 and dimensions 11 and 9. Updated the type-dimension Check to 9=9 and both repeated count examples.

The remaining f=2, |S|=1, q=2 example permits a real quadratic field with p inert and a definite quaternion algebra unramified at finite places: its counts are 9 and 5 and dimensions 10 and 6. All these examples condition on the residual hypotheses of a generic global datum; they do not assert existence of a residual representation from ramification parity alone. No boundary or example declarations were added to Lean.

## Validation

- Formatting gate repair: put the Breuil–Mézard identity, the three indexed expressions in §0.6 and the crystalline weight-locus notation in §1.5 into inline code spans. These are the seven raw TeX fragments at README lines 70, 303 and 467; only delimiters changed. The gate's `tex` count changed **7 → 0**, and every package-content counter is **0**. The auxiliary scratch-layout invocation exited **1** solely for `dirty: ?? TauCetiRoadmap/` (its untracked package link); it made no commit. Re-ran the required Lean elaboration and dependency check after the formatting edits: both **exit 0**, with exactly the warnings and dependency output recorded below. `Suggested.lean`, its signatures and all mathematical statements are unchanged by this formatting repair.
- Ran `lake env lean` on `packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean` from the content checkout: **exit 0**. Exact diagnostic content: `declaration uses 'sorry'`, at **65:8** and **83:8**, and no other diagnostics. No Tau Ceti import is present, so no missing object build was required. No process remains running.
- Elaborated one scratch copy containing `#check @name` for **all four remaining declarations**: **exit 0**, with the same two warnings. Compared every printed signature to §§2.2–2.3 and the Conventions. The definitions retain all their ring, additive-group, module and map arguments. The extension theorem retains its two rank hypotheses, generator surjection, annihilator-quotient isomorphism and positive-rank argument. The pullback theorem retains locality, Noetherianity, all three nonzero-module hypotheses, rank hypotheses and both surjections. **No binder repair was needed.** The deleted cancellation declaration is no longer claimed in the README.
- `git diff --check`: **exit 0**, no output. Structural checks confirmed four supplier gaps with the required fields and matching README slugs, 12 unique valid source entries, all four acceptance names in the README, no prohibited Lean forms, and no machine paths in deliverable prose or the manifest. Parsed comparison confirms every plan field outside top-level `gaps` is unchanged.
- `roadmaps resolve` checked main **7bd35ba** and **352** indexed open roadmap heads: **exit 0**, cross-roadmap citations found nowhere: **None**; Lean names found nowhere: **None**. Its final note says pinned Lake declarations were not checked by that tool; those were inspected directly at the supplied content pins.
- Ran the required dependency check with this package name, the supplied merge order and `--movable`: **exit 0**. Its complete output is:

```text
depcheck: 48 roadmaps, 551 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

The content checkout is main commit 7bd35ba3. The inspected pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Every source used for a repair was already available in the legal cache with its manifest key; no new source fetch or missing-reference request was needed. The separately supplied `tex=7` gate failure is resolved as recorded above.

## Citation and ownership audit

Read representative main roadmaps `TauCetiRoadmap/RestrictedPowerSeries/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` for shape. Used `roadmaps show`, `roadmaps grep` and `roadmaps resolve` against the indexed heads and main. Rechecked the cited section headings for the parent, CompletedCohomologyPartII, DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings, GlobalGaloisDeformations, NoncommutativeAndEquivariantIwasawa, SmoothRepresentationsOfLocalGroups, FiniteFlatGroupsAndIntegralPadicHodgeTheory, PadicMeasuresIwasawaAlgebras and Chebotarev, and read the normalization/transfer sections used in the repairs. The F.1 reference in NoncommutativeAndEquivariantIwasawa denotes its foundation interface, rather than a new numbered analytic construction.

The object searches included local power invariance, tame types, component-union ideals, support freeness, pullback annihilators, patched weight modules and Iwasawa miracle flatness. They included main and the available open-head files, including the sibling roadmaps named in the brief. The four board-only suppliers ModpRepresentationsOfGL2OverLocalFields, LocalGaloisDeformationRingsPartII, PotentialAutomorphyInfrastructurePartII and LocallyAnalyticDistributionsPartII were inspected through their accepted plans when the open-roadmap tool found no README. No additional open pull requests were sought outside the supplied index. No helper agents were used.

Cancellation is assigned to its earlier algebra owner, consistently with the local-ring design's existing request. The only additional constructions spelled out here are the global support/nonvanishing consequences already belonging to §§0.6, 1.5 and 3.2. Their local multiplicities, types and component ideals remain supplier requests. The noncommutative flatness theorem remains distinct from DeformationAndDerivedPatchingAlgebra §3.3's commutative theorem. The acceptance names do not occur in any other roadmap's Lean file in the object/name search.

Direct pin inspection found the native declarations used by the acceptance file and README:

| Declaration | Pinned source file and line |
|---|---|
| CategoryTheory.Abelian.Ext | Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:118 |
| IsLocalRing | Mathlib/RingTheory/LocalRing/Defs.lean:30 |
| IsNoetherianRing | Mathlib/RingTheory/Noetherian/Defs.lean:192 |
| IsRegularLocalRing | Mathlib/RingTheory/RegularLocalRing/Defs.lean:51 |
| LinearMap.ker | Mathlib/Algebra/Module/Submodule/Ker.lean:59 |
| Module.Finite | Mathlib/RingTheory/Finiteness/Defs.lean:121 |
| Module.Free | Mathlib/LinearAlgebra/FreeModule/Basic.lean:43 |
| Module.Flat | Mathlib/RingTheory/Flat/Basic.lean:113 |
| Module.FaithfullyFlat | Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:63 |
| Module.annihilator | Mathlib/RingTheory/Ideal/Maps.lean:868 |
| Module.support | Mathlib/RingTheory/Support.lean:47 |
| MvPowerSeries | Mathlib/RingTheory/MvPowerSeries/Basic.lean:86 |
| PowerSeries | Mathlib/RingTheory/PowerSeries/Basic.lean:56 |
| Matrix.GeneralLinearGroup | Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:42 |
| Nat.Prime | Mathlib/Data/Nat/Prime/Defs.lean:42 |
| Representation | Mathlib/RepresentationTheory/Basic.lean:48 |
| WittVector | Mathlib/RingTheory/WittVector/Defs.lean:52 |
| Submodule.spanFinrank | Mathlib/Algebra/Module/SpanRank.lean:66 |
| TauCeti.completedGroupAlgebra | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145 |
| TauCeti.completedGroupAlgebraModule | TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Module.lean:344 |

`IsLocalRing` includes nontriviality. `Module.Free` supplies a basis without a finite-rank assertion. `spanFinrank` converts an infinite cardinal to 0, so its numerical interpretation needs finiteness. `Representation` alone imposes no smoothness. The native completed group algebra is a compatible inverse-limit family and does not assert uniformity or analytic dimension. No new heavy construction or library substitute was added to `Suggested.lean`.

## Adversarial mathematics record

Arithmetic in the finite-field rows is in 𝔽₂₉ unless stated otherwise. Structural tests of global targets use their specified local or module consequences; they do not pretend to construct an automorphic representation by counting variables. The table records the computed values and the boundary of each assertion, not a claim that elaboration proves the target.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Conventions: global domain | p=0,1,2,3,23,29; f=0,1 | No global datum before 29; at 29 reducible box {12,13,14}; f=0 has no p-adic field of that degree | Domain excludes the junk inputs | None |
| Conventions: Hecke polynomial | q=5, roots 2,3 | S=5/6=25, T=25·5=9; S⁻¹T=5, qS⁻¹=6; polynomial X²−5X+6 | Matches geometric r̄ | F01 |
| Parent arithmetic adapter | Same datum | r̄⊗ω has arithmetic roots 17,21: (T,S)=(9,25); wrong dual twist has 12,18: (1,20) | Wrong model separated | F01 |
| Parent §R18.4.27 geometric realization | q=5,T=9,S=25; ψ_parent=ψ⁻¹ | Geometric roots 17,21; dualization and ε⁻¹ give 5/17=2,5/21=3; det twist ψ_parent⁻¹ε⁻¹=ψε⁻¹ | Distinct from arithmetic §R18.3.15 | F01 pattern repair |
| Frobenius inversion and division domain | Same roots; q=0,1 boundaries | Inverse roots 15,10; q=0 is impossible away from p; q=1 excluded at w₁ | Every inverse is of a unit | F01 witness retained |
| Hodge and adjoint twist | Weights (0,−1), (2,−1) | Sign change (0,1); ε-twist (3,0); determinant weight 1→3 | Conventions consistent | None |
| Norm determinant sign | f=1, diag(2,1) | Inverse character 2⁻¹=15; positive character 2 | Distinguishes signs | None |
| Central character | Scalar z, Sym²⊗det⁻¹; χ(z)=2 | z²z⁻²=1; χ⁻²=22 versus χ²=4 | Scalars and dual twist match | None |
| Pontryagin/integral dual | M=𝔽; complex O→O by p | Hom(𝔽,O)=0, Hom(𝔽,E/O)=𝔽; dual differential −p and cokernel O/p | Duals not interchangeable | None |
| Level-map direction | Regular C₂₉ representation | Invariant dimension 1 versus total dimension 29; larger-level invariants embed in smaller-level space | Direction fixed | None |
| Inversion as anti-map | Upper/lower unipotents u,v | uv has rows (2,1),(1,1); vu has (1,1),(1,2) | Nonabelian order matters | None |
| gap:power-series-cancellation | A=ℤ_p⟦t⟧ versus B=ℤ_p | Dimensions of A⟦x⟧ and B⟦x⟧ are 3 and 2 | Nonisomorphism discriminates | F02/F10 |
| Cancellation variable count | A⟦x⟧≅W(𝔽)⟦X₁,X₂⟧ | Dimensions 3 before, 2 after; coefficient ring has one variable, not two or zero | No spurious variable loss | F02 |
| Relative cancellation | Shared coefficient c under an O-linear input | Every substitution fixes c; quotient composites send c→c→c | Source proof preserves coefficients | F02 |
| Witt correction | 𝔽₉=𝔽₃[a]/(a²+1) | a³=−a; inverse Frobenius sends −a→a; [a] restored | Uses automorphism on normal-form target | F02 |
| gap:tame-types: image category | Trivial E-type and Steinberg of GL₂(𝔽₂₉) | Dimensions 1 and 29; first is in the image, second excluded | Correct characteristic-zero domain | F06 |
| Weight-isolating/all-weight types | f=1 generic semisimple two-weight set | Isolating intersection has size 1; all-weight reduction has size 2 | Roles distinguished | F06 |
| Two-weight extension type | Nontrivial extension of distinct weights σ,σ′ | JH multiplicities (1,1), intersection cardinality 2, versus isolating cardinality 1 | Proposition 10.1.11 retained with types | F06 |
| gap:single-type-rings | f=1 isolated weight; crossing O⟦x,y⟧/(xy−p) | Fixed-determinant local relative dimension 4; special-fibre branches (x),(y) | Local rings and components only | F06 |
| gap:breuil-mezard-pbt | Fontaine–Laffaille regular predicted/nonpredicted weight | μ=1/0; an isolating constituent of multiplicity 1 contributes 1/0 to e | Local multiplicity support | F05 |
| §0.1 exponent bounds | p=23,29, r₀=11 | At 23: 12>8; at 29: {12,13,14}; 11 is EGS-generic but outside stronger box | Strong genericity retained | None |
| §0.1 quaternion boundary | F=ℚ; finite ramification ∅ or {ℓ} | Definite total ramification count 1 or 2; only 2 is even; split rational indefinite curve excluded | Impossible base case rejected | F10 |
| §0.1 small auxiliary level | F=ℚ, roots −1,i,ζ₃,ζ₆, w₁=5 | Values ζ+ζ⁻¹−2 are −4,−2,−3,−1, respectively; none divisible by 5 | Root-of-unity condition holds in this test | F09 |
| §0.2 reducible BDJ weights | p=5, inertia ω²⊕1 and ω³⊕1 | Weight counts 2 and 3: Sym¹,det²Sym¹; Sym²,det³,det³Sym⁴ | Boundary exceptional weight retained | None |
| §0.2 irreducible recipe | p=5, inertia ω₂²⊕ω₂¹⁰ | Sym¹ gives exponents 2,10; det·Sym³ gives 6+4=10 and 6+20=26≡2 mod 24 | Antisymmetric subsets used | None |
| §0.2 generic rational-local example | p=29, inertia ω¹³⊕1 | Weights Sym¹² and det¹³Sym¹⁴; 29−3−12=14 | Two weights, correct dual convention | None |
| §0.2 extension-class condition | Split versus a class outside a proper L_α | Split class 0 lies in L_α; a class outside has nonzero image in H¹/L_α and loses that weight | Full extension class retained | None |
| §0.3 zero and exactness | Zero coefficient; regular C₂₉ norm vector | S(0)=M(0)=0; augmentation of norm vector is 29=0 although vector≠0 | Localization is necessary | None |
| §0.3 variance and central quotient | Short exact coefficient sequence; trivial admissible coefficient | Dual reverses 1→2→3 to 3→2→1; M restores order; constant sheaf rank 1 | Quotient comparison only on r̄-part | F09 |
| §0.4 projective versus free | C₂ and S₃ over 𝔽₂₉; C₂₉ | Trivial summand dimension 1, free dimensions 2n or 6n; rank-one C₂₉ module dimension 29 | General projectivity, p-group freeness | None |
| §0.5 weighted colimit | Correct/incorrect away weight; χ(z)=2 | Nonzero weight Hom versus 0; central factors 22 versus 4 | Weight and character constraints bind π | F07 reference only |
| §0.6 global weight equivalence | Local multiplicities (1,1) and (1,0) | Products 1 and 0; global patched/nonpatched weight spaces nonzero and zero respectively | Both directions, global ownership | F05 |
| §0.6 small prime | p=5, projective image A₅ | 5>2 is true but additional image hypothesis fails | The exception is retained | None |
| §0.7 Gram determinant | q=2, ratios 3 and 2 | 3⁻¹=10, (2−3)(2−10)=8; at ratio 2 product 0 | Unit criterion separates boundary | F03/F10 |
| §0.7 indefinite parity and special type | Totally real cubic F, q=2 | Two ramified real places; even finite ramification count; special ratios 2 and 15 versus allowed 3 | Full transfer covers odd degree | F03 |
| §1.2 local determinant directions | f=2 unrestricted versus fixed type | Unrestricted determinant has f+1=3 directions; fixed type releases one | No one-variable unrestricted shortcut | None |
| §1.2 R∞ and S∞ | (f,|S|,q)=(1,2,1),(2,1,2) | Variable counts (10,8),(9,5); dimensions (11,9),(10,6); differences 2,4 | Realisable parity profiles | F10 |
| §1.2 variable identity | Same tuples | (3+3)+(4+1−1)=10; (3+6)+(0+2−2)=9 | Matches 4|S|+q−1+2f | F10 |
| §1.2 empty added-variable set | f=[F:ℚ]=2, S={v}, q=2 | q−f=0; R∞ equals its local factor, with 9 variables | Empty formal-variable set valid | None |
| §1.3 type dimensions | f=1, |S|=2, q=1 | 1+(3+1)+4+1−1=9=4·2+1 | Type dimension equals dim S∞ | F10 |
| §1.3 Hodge quotient and twist | (1,0),(2,0),(2,−1) | Sums 1,2,1; second quotient 0; ε-twist (3,0) has sum 3 | Zero quotient and determinant shifts agree | None |
| §1.4 patching-functor conditions | Zero functor; A=O⟦t⟧, A⊕A/(t) | Zero rank 0 fails rank-one minimality; latter depth min(2,1)=1<dim A=2 | Support alone insufficient | None |
| §1.4 integral torsion | A⊕A/(p) | p kills a nonzero vector; torsion-free rank-r module has no such vector | Torsion-free clause separates | None |
| §1.5 exact functor and away type | Zero coefficient; two surviving weights with r₁=r₂=1 | Value at zero 0; mixed fibre dimension 2 instead of 1 | Single-weight hypothesis necessary | F05/F07 |
| §1.5 weight nonvanishing | μ=1 or 0; zero abstract functor | Arithmetic residual value nonzero or 0; zero functor gives 0 even at μ=1 | Nonvanishing not an abstract axiom consequence | F05 |
| §1.5 scheme-theoretic support | A=𝔽[ε]/ε², M=A or A/(ε) | ε·1=ε≠0 versus 0; both have same unique field-valued point | Pointwise support is insufficient | F05 |
| §1.6 residual fibres | Free support rank r=2; lattice reduction | Fibre 𝔽² and Hom-dual dimension 2; lattice reduction has finite length while O-lattice does not | Compare reduction, not integral JH factors | F07 reference only |
| §1.7 big patched module | f=1; M∞=0 versus nonzero fibre | dim(K₁/Z₁)=3, residual grade 2, dimension 1; zero module has zero fibre | Infinite vector dimension compatible with Iwasawa finiteness | F07 reference only |
| §2.1 grade/CM/depth | Λ=O⟦T⟧, Λ, Λ/(T), Λ/(ϖ) | (j,depth,δ)=(0,2,2),(1,1,1),(1,1,1) | Depth equals δ for CM modules | None |
| §2.1 non-CM and zero | Λ⊕Λ/(ϖ); zero | Ext⁰ and Ext¹ both nonzero; zero grade ∞ and dimension −∞ | One-degree and nonzero conditions matter | None |
| §2.1 extension grade | 0→Λ --ϖ→Λ→Λ/ϖ→0 | j(middle)=0=min(0,1) | Correct minimum convention | None |
| FreeRankOnSupport definition | M=0; k², ranks 0,1,2 | Zero quotient support 0 for every rank; k²≇k, k²≅k²; rank 0 over nonzero support impossible | Rank and zero conventions explicit | None |
| §2.2 extension theorem | A=𝔽₂[ε]/ε², M=A,N=(ε),r=1 | Ann(M)=0; Ann(N)=Ann(M/N)=(ε); quotient length 1; M length 2 with one generator | All three hypotheses compatible | F08 locator only |
| §2.2 generation failure | A=ℤ/4, M=(ℤ/2)² | Minimal generators 2 versus r=1; annihilator quotient 0 versus ℤ/2 | Split middle module excluded | None |
| modulePullback definition | id,id on k; zero,zero on k | Kernel is diagonal dimension 1; zero maps give full product dimension 2 | Defining equation selects object | None |
| §2.3 positive fibre product | A=k⟦x,y⟧/(xy), branches to k | (x)+(y)=(x,y)=Ann k; intersection 0; pullback A | Both criterion and annihilator agree | None |
| §2.3 negative direction | A=k⟦t⟧, M₁=M₂=A→k | Sum 0≠(t); pullback has basis (1,1),(t,0), rank 2 rather than 1 | Iff tested against false sum condition | None |
| §2.4 central variable | A=O⟦T,x⟧, M=A/(x) or A | Killed: grades 1,0 and dimensions 2,2; torsion-free: grade 0,0 and dimensions 3,2 | Different grade shifts retained | None |
| §2.4 growth and coefficients | Ω=k⟦T⟧; O=ℤ₃[π]/(π²−3) | length Ω/Tⁿ=n, log_n(n)=1; O/π=𝔽₃, O/3=𝔽₃[π]/π² | n≥2 and uniformizer reduction needed | None |
| §2.4 small prime | O=ℤ₂,K=1,M=𝔽₂ | Integral grade 1, residual grade 0; dimensions 0=0 | General algebra retains p=2 | None |
| §2.5 arbitrary-module inequality | A=O⟦T⟧, B=A⟦y⟧, M=B | Depths 2 and 3; first Ext groups κ⟦y⟧ and κ | Reverse inequality false | F04 |
| §2.5 finite restriction | Same rings, M=B/(y) | Depths 2=2; dimensions 2=2 | Equality's finiteness scope verified | F04 |
| §2.6 miracle flatness | A=O⟦T,x⟧, M=A/(T) or A/(ϖ) | Grades 1=1 and coefficient-flat; grades 1≠0 and ϖ·1=0 | Both directions discriminated | F08 route only |
| §3.1 maximal CM over support | k⟦x,y⟧-module k⟦y⟧ | Annihilator (x); depth 1=dimension support 1 | Ambient dimension 2 is not support dimension | None |
| §3.2 common rank | O⟦x,y⟧/(xy−p), two copies | Special fibre xy=0; branch ranks 2 and 2 | Common rank need not be 1 | None |
| §3.2 singleton ideal | A=k⟦x,y⟧/(xy), select V(x) | I=(x); quotient k⟦y⟧ of dimension 1, versus A dimension 1 with two branches | Wrong zero ideal retains another component | F06 |
| §3.2 union ideal | Select both branches | Intersection (x)∩(y)=0; sum (x,y) gives k instead of A | Union uses intersection | F06 |
| §3.2 empty subset | Select no branch | Empty ideal intersection A, quotient 0; zero ideal gives quotient A≠0 | Empty union fixed | F06 |
| §3.3 algebraic-type support | Two disjoint generic types, multiplicities 1,2,r=2 | Generic factor ranks 2 and 4 | Local freeness need not have one global rank | None |
| §3.4 projective lift | r=2 | Hom(P_σ,D₀²)=2; modular socle Hom dimension 2; nonmodular quotient contributes 0 | Upper and lower embeddings needed | F07/F08 |
| §4.1 gluing definitions | f=1,2, d=dim P | Ranks d,4d and d,4d,7d; R′/pR dimension d versus R′/pR′ dimension 3d | Correct integral pullback, not raw product | F08 locator only |
| §4.2 Loewy conditions | Q=σ; permitted two/three-layer quotients | [Q/soc Q:σ]=0 fails (b); allowed lengths 2 or 3 | Socle alone does not suffice | None |
| §4.3 minimal generators | r=2 terminal quotient | Residual dimension 2 forces ≥2; route supplies ≤2 | Minimum exactly 2 | None |
| §4.4 adjoint/type lattice | Sym²⊗det⁻¹; modular versus kernel labels | Dimension 3, scalar character 1; nonmodular kernel patched value 0 | Quotient keeps rank r | None |
| §4.5 generic-to-integral freeness | r=2, p-torsion-free S²→M | Generic ranks 2→2, kernel generic rank 0; p-power-torsion kernel in S² is 0 | Integral injectivity valid | None |
| §4.6 third radical | k[t]/t⁴→k[t]/t³ | Full dimensions 4,3; both rad³ quotients dimension 3 | Only truncated comparison asserted | None |
| §4.7 generation comparison | f=1,r=2 | Baseline Hom dimension 2, an extra map forces ≥3; truncation comparison restores 2=2 | Rank r distinct from residue degree f | None |
| §4.8 profile support | f=2,j=1 | Three profiles, total rank 7d; double-adjoint adds 9d, giving 16d | Nonrectangular support retained | None |
| §4.8 twist and p-membership | f=1; p=29,N=12,a₂=2,d*=1 | Determinant sums 3=2+1=3+0; inverse character 15; unit factor (2/2)·1+O(29³)=1+O(29³) | Denominators 2 and 1 nonzero; 0,1,p=2 excluded here | None |
| §4.9 first-order multiplicity | r=2 | Fibre surjection 𝔽²→𝔽² has kernel dimension 0; before fibre k⟦t⟧→k has kernel (t)≠0 | Fibre qualification essential | F08 locator only |
| §5.1 GK dimension | f=1,2 | 2≥3−δ, δ≤1 gives 1; 4≥6−δ, δ≤2 gives 2 | Upper and lower bounds agree | None |
| §5.2 second-congruence structure | r=2 | Every constituent occurs twice; K₁-invariants D₀² | No accidental rank-one claim | None |
| §5.3 faithful flatness | f=1,2; Frac(O) negative control | Required grades 2=2,4=4; residual fibre nonzero; Frac(O)/ϖ=0 | Faithfulness uses nonzero closed fibre | None |
| §5.4 Banach lift | Compact torsion 𝔽 versus flat O | Hom(𝔽,E)=0; Hom(O,E)=E, unit ball O, reduction 𝔽 | Torsion-free specialization required | None |
| §5.5 unweighted dimension | Regular C₂₉ away representation | Nonzero invariants dimension 1 inside total dimension 29 | Lower-bound inclusion has correct direction | F10 |
| §5.6 completed Hecke convention | q=5,T=9,S=25 | S⁻¹=7; trace 7·9=5, determinant 5·7=6; 5/17=2,5/21=3 | Matches §0.3 in the inverse limit | F01/F09 |
| §5.6 reduction and localization | Complex O --p→O; 𝔽×𝔽 | Reduction has two nonzero residual degrees; algebra has two maximal ideals before localization | No unrestricted reduction or locality claim | None |
| §5.6 inertness | |S_p|=1,2 | Away tensor factors 0 or 1; empty tensor O | Single-place comparison scoped | F09 |
| §5.7 R=T and complete intersection | R=O⟦x,t⟧, quotient by x | dim R=3, quotient O⟦t⟧ has dimension 2 and codimension 1; faithful module annihilator 0 | Faithfulness kills intervening kernels | None |

The extension theorem's argument uses a surjective endomorphism of a finite module twice after quotienting by Ann(M), so no local or Noetherian binder is silently needed (BHHMS23 lines 4572–4584; STACKS line 1544). For the pullback theorem, surjectivity of both projections gives the annihilator intersection. In rank one the obstruction to the diagonal map is I/(I₁+I₂); locality/Nakayama detects whether it vanishes. These are the mathematical checks behind the two retained `sorry` signatures, separate from elaboration.

## Maintainer notes

The deleted acceptance name is `TauCetiRoadmap.HilbertModularVarietiesAndShimuraCurvesPartII.powerSeries_cancellation`. Its theorem is now an explicit earlier supplier gap; no other Lean name changed. No external roadmap files, merge-order files, tooling, pull-request text or metadata were edited. The plan's historical nodes remain untouched as required; the top-level gaps and README carry the operative ownership contracts. The supplier additions are requests, not assertions that those roadmaps already contain the requested theorems. Independent review remains necessary.
