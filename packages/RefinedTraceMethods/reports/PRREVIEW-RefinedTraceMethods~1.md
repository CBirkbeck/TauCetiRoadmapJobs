# Review of RefinedTraceMethods (pull request #1493 at c47abe4)

**Verdict:** needs changes

## R01 (P1) — Supply the E₁ derivation adjunction used to construct extensions

**Location:** `TauCetiRoadmap/RefinedTraceMethods/README.md:2045`, “Import coherent E₁ module and derivation interfaces from GeneralizedCohomology G2.8.”

**Claim:** The map δ from the derived fiber of multiplication to ΣI can already be converted into an augmented E₁-algebra map A→A⊕ΣI by that supplier. This is the missing step that makes the displayed pullback an algebra, and subsequently defines the domain of infinitesimal sifted-colimit preservation. It is not just an ordinary module map.

**Witness:** `TauCetiRoadmap/GeneralizedCohomology/README.md:432` supplies multiplicative infinite-loop machinery, not derivations. Its module models are at line 281. `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:2869` supplies only animated commutative derivations. Raskin uses the missing adjunction at r line 1417.

**Repair:** Own the missing spectral associative construction in §4.14, before using its pullback. State the natural mapping-space equivalence between A-bimodule maps `fib(A⊗A→A)→N` and sections `A→A⊕N` in E₁-algebras over A, including the outer bimodule action, compatible ring maps and homotopies. Give its source/proof inputs and API, and change the module-model citation to G2.4 with the supplied operadic comparison. Do not replace it by the commutative cotangent complex. Test A=𝕊 (fiber zero and contractible derivation space), the free associative algebra on one sphere generator (derivations are determined by the image of that generator), and δ=0 (the pullback is A⊕I). On a free associative algebra on x,y the required law gives δ(xy)=xδ(y)+δ(x)y, retaining both actions. These tests distinguish the required construction from a bare bimodule map or a commutative substitute. No declared supplier gap covers it.

## R02 (P2) — Remove the duplicate sphere Segal target

**Location:** `TauCetiRoadmap/RefinedTraceMethods/README.md:567`, “Also establish … `S^{tC_p}` ≃ `S^∧_p`”; also the sphere comparison at line 579.

**Claim:** §2.3 includes the sphere Segal equivalence among results to establish, although its proof route supplies only Postnikov/Tate convergence and p-completeness. P-completeness does not identify this Tate spectrum with the completed sphere.

**Witness:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:338` explicitly constructs the same sphere equivalence using its Singer and Adams comparison. Its supplier contract at line 106 expressly treats the sphere values as its outputs, not inputs from this roadmap.

**Repair:** Delete the two nonessential sphere-value assertions from §2.3, leaving the Postnikov, p-invertible vanishing, p-completeness and bounded-above fixpoint targets here. Do not add an upward supplier edge. Leave the Segal equivalence and its proof with the later Part II. The surviving tests still compute `(Hℚ)^{tC_p}=0`, `π₀(Hℤ)^{tC_p}=ℤ/p`, `π₁(Hℤ)^{tC_p}=0`, and the residual fixpoint expression for H𝔽_p as 0. Thus removing these assertions does not remove an input to the stated local proof routes. If the sphere theorem is intended to be owned here instead, its actual Singer/Adams inputs and ownership must move here as well; merely citing NS's example does not perform that move.

## R03 (P3) — Replace the dual-number locator

**Location:** `TauCetiRoadmap/RefinedTraceMethods/README.md:2330`, “[LT], §3, Example 3.8, p. 30.”

**Claim:** This is the displayed source locator for the general dual-number relative K₁/K₂ formulas in §4.19.

**Witness:** lt line 1231 concerns a locally nilpotent, nonnilpotent ideal in a perfection quotient in characteristic p. Its calculation is K₂(A,k)=0 but π₂ of the p-completed relative spectrum nonzero (lt line 1239).

**Repair:** Replace this locator by the actual low-degree inputs already imported in the paragraph: `K2SymbolsBrauer` §§13.7, 13.12–13.13 and the van der Kallen locator supplied there; use the split relative sequence for the kernel assertion. Retain the hypothesis that 2 is invertible. For k=ℚ[t] the formula gives ℚ[t]dt, while for k=ℤ the actual relative K₂ is ℤ/2 and Ω¹ over ℤ is 0. The latter remains a useful negative control. LT Example 3.8 may instead accompany the distinct warning that local nilpotence is not nilpotence.

## Verified sound

The entire 4,171-line README and the 32-line Lean file were read. The review checked the supplied head, the whole-folder scope, all 15 seeded source targets, the ordinary pinned carriers, ownership by object, supplier direction, and the headline/signature/padding requirements. The computations below are adversarial tests, not a claim that finite tests prove the general theorems. No false headline identity was found. R01 is an unavailable proof input, R02 is conflicting ownership, and R03 is a locator defect.

The worker gate passed every listed scanner and the targeted build. Independent direct elaboration of `TauCetiRoadmap/RefinedTraceMethods/Suggested.lean` exited 0 with no warnings. There are no declarations, so there are zero section-variable signature probes and zero one-tactic padding probes to perform; no signatures were silently weakened. The outside-folder diff is empty. No PR file was changed.

The required dependency check returned:

```text
depcheck: 204 roadmaps, 1497 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This does not detect the unavailable derivation interface or the duplicate ownership above. The supplied gate result was:

```text
gate RefinedTraceMethods: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The README has the requested scope, conventions, contracts, nine layers, examples/dependencies, consumers and references. Its treatment of Mathlib is a deferral to actual ordinary carriers, not a promise to wait for new Mathlib work. No computational algorithm, sorry'd data, option override, route-specific prime exclusion, or copied source passage was found. The hypotheses at 2 and the number-field prime inversions belong to the cited comparison theorems, while the underlying general theories remain owned. Layer 4 explicitly constructs concrete K in §4.9 before its use by motives; this is a declared internal build order rather than a cycle through the universal characterization.

**Seeded source verification (15 targets).** Locators were read in the supplied legal cached versions, including hypotheses and proof steps where used. The README flags no additional locator as unverified. Source line references below identify the extraction, not a second version of the work.

| Target | Text inspected and locator | Outcome |
|---|---|---|
| §1.3 coherent derived mixed category | ke lines 193–298, §§2.1–2.4, pp. 5–7; h lines 188–263, §2, pp. 4–5 | Underlying b-quasi-isomorphisms, unbounded dg Λ-modules and the modified cone are supported. This is not the derived category of the abelian category of mixed complexes. |
| §2.2 finite-action quotient | ns lines 835–865, 953–965, 1010–1035, Theorem I.3.3 and its monoidal refinement; lmmt lines 625–662, Proposition 3.9/Remark 3.10, pp. 15–16 | Tensor ideal and Tate endomorphism description supported; idempotent completion is supplied separately. |
| §2.10 spherical group rings/categorical THH | ns lines 5615–5642, 5699–5707, 5848–5915, 5954–5988, Appendix B and §IV.3; blm lines 440–488, 511–522, 886–908, 1076–1128, 1365–1391 | Cyclic nerve/free-loop comparison, Frobenius lift and categorical Morita/localization statements supported with derived/cofibrant models. |
| §4.14 extensions/linearization | r lines 228–251, §2.3 and Variant 2.3.2, p. 6; r lines 1413–1442, §§5.3–5.4, pp. 31–32 | Source supports the mathematics and the connective truncation colimit. Its derivation adjunction is not supplied by the cited roadmap: R01. |
| §4.19 assembly/low degrees | hn lines 1280–1312, Theorem 1.4.1 and proof; lmmt lines 625–655; lt lines 1231–1245, Example 3.8, p. 30 | The assembly cofiber has the p-fold circle and pointed C_p factor. The dual-number locator is wrong: R03. |
| §5.2 rational graded HKR/relative THH | ec2 lines 9427–9450, Snaith comparison; ke §§2.2–2.4; w lines 1020–1068, relative solid THH | Rational Koszul calculation retains degree 2 for β and degree 3 for σβ; periodic logarithmic generator has degree 1. Relative versus absolute THH is distinguished. |
| §6.4 even flatness/descent/duality | p lines 1286–1320, 1438–1462, 1890–1925; w lines 574–610, 725–830, 914–930, §§2.1–2.4 | Ordinary even-flat characterization, solid one-way implication, both-sided duality assumption and nuclearity/descent hypotheses retained. |
| §6.6 synthetic operations | ar lines 586–717, Definitions/Propositions 2.59–2.67; ar lines 798–866, Lemma 2.75 | Circle norm has shift (1)[1]; finite norm is unshifted. README correctly asks for lax monoidality; source statement has a missing qualifier. |
| §6.8 image of J/local coefficients | r-gal lines 1018–1042, 1438–1497, §§5.3/5.5; dr lines 56–80; d-thesis lines 9553–9563, 9790–9806, 10028–10051; w lines 1478–1514, 1656–1675, 1787–1924 | Odd-prime and 2-primary fixed-point inputs differ; the all-prime comparison is only E₁. The subgroup-fixed j variant is distinguished from the full K(1)-local sphere. |
| §6.9 q-Hodge pullback/local comparisons | w lines 1578–1614, 1787–1924, §§4.7–4.17 | Pullback definition, p>2 theorem, p=2 theorem, quotient conditions and limits on multiplicativity retained. |
| §6.11 cyclonic coefficients/Adams coherence | w lines 2579–2617, 2660–2700, 2743–2768, 2911–2956, 3100–3193, 3660–3674, §§5.2–5.4 | Bounded-below naive/genuine equivalence, divisor equalizer, q↦q^m inflation with β fixed and A₂ coherence supported. |
| §7.4 localization cofiber | mw lines 763–982, 1088–1100, §2.4 | Requires the smooth/proper base, local rigidity, size conditions, dualizable E₁ tower, thick ideal and bimodule transition factorization. These are retained. |
| §7.7 derived Hom/dual/tensor | mw lines 1391–1507, Lemma 3.9, Corollary 3.10, Lemma 3.11 and proof of Corollary 3.12, pp. 33–35 | Derived Ext¹ and completion are essential. The README explicitly imposes amplitude [0,1] before identifying the tensor filtration with the output Whitehead filtration. |
| §8.6 trace Adams operations | bms lines 3656–3693, Construction 9.13/Proposition 9.14, pp. 291–292 | Weight γ^i, transported circle action and inverse factor on the circle cohomology parameter are consistent. |
| §9.4 ordinary reduction/fiber | ammn lines 102–124, 563–585, 817–835, Theorem A, Theorem 2.20 and Corollary 3.9; cmm lines 90–102 | Associative TC square versus commutative henselian K square, Σ/Σ² shifts, p-torsion-free range and extra π₋₁ hypothesis supported. |

**Headline coverage.** The end-theorem groups are: cyclotomic/Cartier equivalence (§3.4); continuous motives and their rigidity (§§4.5–4.8); trace and multiplicativity (§§4.10–4.11); DGM, henselian and rational comparisons (§4.17); Snaith and coherent Adams operations (§5.1); even/q-Hodge and framed comparison (§§6.5–6.10); twisted and Habiro/number-field comparison (§§6.13–6.14); refined finite-coefficient and rational ku/KU calculations (§§7.6–7.9); prismatic/syntomic trace comparisons (§8); associative and henselian K Beilinson squares (§9.4); and their integral graded refinement (§9.5). The module docstring covers these groups and names the missing carriers. It does not substitute polynomial identities or scalar predicates for them. No statable headline was identified as absent.

**Pinned library audit.** Pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Object searches covered cyclic/mixed complexes, spectral THH/TC, stable higher categories, Cartier operators, ordinary Tate groups, smooth/étale algebra, Kähler differentials, nodal quotients, even filtrations and localizing motives. In particular the following definitions/declarations were opened (13 file locations):

| Pinned file and line | What it actually supplies |
|---|---|
| `Mathlib/AlgebraicTopology/SimplicialObject/Basic.lean:48` | Simplicial objects as functors from the opposite simplex category, without cyclic operators. |
| `Mathlib/AlgebraicTopology/MooreComplex.lean:65` and line 158 | Kernel model of normalized Moore chains and its functor; no Connes B or unbounded mixed enhancement. |
| `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41` | Inner-horn filling predicate. It is not a library of stable presentable monoidal infinity categories or spectral THH. |
| `Mathlib/RingTheory/Kaehler/Basic.lean:148` | Ordinary Kähler differential module, not the derived cotangent or HKR comparison. |
| `Mathlib/RingTheory/Smooth/Basic.lean:539` | Formal smoothness plus finite presentation. |
| `Mathlib/RingTheory/Etale/Basic.lean:205` | Formal étaleness plus finite presentation. |
| `Mathlib/RingTheory/WittVector/Identities.lean:44` and line 138 | FV=p for ordinary Witt vectors; the reverse VF=p has the characteristic-p hypothesis. |
| `Mathlib/Data/Nat/Factorization/Defs.lean:183` | Factorization of powers, with the total-function boundary at zero; positivity is separately needed in §7.6. |
| `TauCeti/RingTheory/Node/Basic.lean:37` | Ordinary commutative nodal quotient, not a graded spectral coefficient ring. |
| `TauCeti/RingTheory/Node/Basic.lean:51`, lines 65, 75, 97 and 133 | Quotient map, coordinates, uv=a, universal lift with its relation and hom extensionality. No domain/nonzero assumption is implicit. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:167` | Even cyclic Tate calculation with finite-group and generating-element data. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:200` | Odd cyclic Tate calculation, distinct from the even cokernel. |
| `TauCeti/RepresentationTheory/Homological/TateCohomology/Periodic.lean:346` | Algebraic cyclic periodicity; an Eilenberg–Mac Lane/spectral comparison still needs its supplier. |

No named declaration is introduced by Suggested.lean, so there is no fully qualified declaration collision. The native carriers above explain why the ordinary tests are not replacements for the missing spectral headlines.

**Ownership and supplier resolutions.** `roadmaps list`, object searches through `roadmaps grep`, and `roadmaps show` were used, with main files for existing roadmaps and the supplied new-roadmap heads for open work. Board package/source metadata and the supplied sibling checkouts were also inspected. The following 18 supplier groups were resolved at their actual sections; broad foundational citations were read for the claimed objects, not taken as proof that every needed operation exists.

| Supplier | Resolved sections, file lines and input |
|---|---|
| EnhancedDerivedSheaves | README lines 1544, 1698, 1732, 1842, 1994: idempotent/Ind completion, absolute dualizability, HR-modules, rational animation. Animated commutative derivations at 2869 do not repair R01. |
| GeneralizedCohomology | README lines 281, 432, 1642: G2.4 module models, G2.8 multiplicative machine, G5.4 ku/KU/Bott. R01 distinguishes these. |
| StableHomotopyKTheory | README lines 2710–2817, §§7.29–7.34: obstruction/deformation and Moore towers; bimodule factorization remains a target here. |
| BordismFormalGroups | F6.1 and F6.5 (README line 1526): localization, finite Borel norms/Tate/residual actions and stable quotients. |
| AInfCohomology | AI.0–AI.4 and AI.7.2 (README lines 3815–4032): periods, décalage and trace inputs. Scanner leads tateFinite/tateOrbit/completedTateComparison occur at 3832–3834. |
| PrismaticCohomologyPartIII | §§6.8–6.9, 6.28, 6.31, 7.0; README lines 751–834: trace and rational squares. Scanner lead Prismatic.Trace.rationalBeilinson occurs at 807. All four leads resolve to supplier APIs. |
| DGAInfinity | Layers 6,8,9 (README lines 466–570): ordinary dg Morita/Hochschild/proper character. Cyclic B-compatibility here is additional. |
| NoncommutativeGeometry | N1 (README lines 84–143): complex cyclic chains/cochains. No identification of continuous and algebraic duals. |
| KTheoryFiniteLocalFields | §§4.0–4.5 and 5.1 (README lines 638–819): ordinary cyclic, cyclotomic, nilpotent ordinary-ring, Tate and prime-field shift inputs. |
| GeneralAlgebraicKTheory | Concrete K models; §13.6 (README line 2949) restricts derived invariance to enhanced models. General stable-category K is additional here. |
| KTheoryLowDegrees/K2SymbolsBrauer | Relative K₂/boundaries; K2SymbolsBrauer §§13.12–13.13 (README lines 3341–3395) retains 2 invertible and D(aε,b)↦a db. |
| TopologicalKTheory/CharacteristicClasses | T1–T5 and C3/C5/C6: bundle operations and Chern/Bott normalization. Coherent localized spectral Adams lifts are additional. |
| DerivedDeRhamCohomology/CrystallineCohomology | Cotangent, divided-power, completion, de Rham and de Rham–Witt lanes remain suppliers, rather than trace-side reconstructions. |
| PrismaticCohomology/PartII | §0.59 and PartII §§5.1–5.8: δ and q-PD; intrinsic Nygaard objects stay supplier-owned. |
| SolidAnalyticRings | §§1–2,6.4 (README line 631): solid and p-complete tensor interfaces, bounded-below closure and completed sphere unit. |
| QWittVectors | §2.4 (README line 414): perfectly covered Λ-rings, faithful flatness, torsion-freeness and zero-ring convention. |
| HabiroRings | §§2.6–2.12,5.6,5.8–5.9 (README lines 527,1007,1048,1069): spectral completion, completed base change, number-field coefficients. |
| HabiroCohomologyFoundations | §§4.1,4.8,4.21,4.28,5.26 (README lines 1295,1404,1606,1736,2146): pairs, framed and étale models, coherent export and finite coefficients. |


The adjacent open objects were compared in `GeneralAlgebraicKTheoryPartII` (scope and §§13–14 contracts), `StableHomotopyKTheoryPartII` (§§2.7, 7 and 8.3), `ChromaticHomotopyTheory` (supplier contract and §9.5), and the Habiro/solid suppliers above. GeneralAlgebraicKTheoryPartII consumes the stable-category K extension and adds further applications; ChromaticHomotopyTheory consumes the height-one description and adds its Tate field computation; Habiro Part II consumes the trace comparison. The sphere Segal overlap is R02. No upward supplier is proposed to repair it. A downstream contract that asks for an additional theorem is not itself evidence that the earlier roadmap already supplies it.

**Adversarial computations.** Each row identifies a named statement block by README line, records actual values (including zero/boundary values), and records the disposition. “Retain” means no defect exposed by these instances; it does not upgrade an untested general assertion to a proof. S denotes the sphere, H denotes Eilenberg–Mac Lane realization, and h=q−1. Tensor products in spectral rows are derived.

| Statement (README line) | Instances and computed sides | Result/change |
|---|---|---|
| Cyclic category (85) | n=0,1,2: rotation orders 1,2,3; HomΛ([1],[0]) has 2 elements versus HomΔ having 1. A rotation on (a,b,c) repeated three times gives (a,b,c). | Retain; distinguishes Δ and Λ. |
| Derived cyclic chains (114) | A=k gives normalized C₀=k, Cₙ=0 for n>0. For M₂(k), b(e₁₂⊗e₂₁)=e₁₁−e₂₂ rather than 0. | No change. |
| Connes B (144) | On k[x], B(x)=1⊗x, class dx; B(1)=0. On the zero algebra both sides are 0. | No change. |
| Complex chain/cochain comparison (166) | For ℂ, HC₂=HC²=ℂ, although normalized C₂=0. For ψ(a,b)=a(0)b′(0), ψ(Bx)=1=(B*ψ)(x). | No change. |
| Mixed complexes (186) | Two-term k with b=B=id between opposite degrees: b²=B²=0 but bB+Bb=id in each degree, not 0. k[−1] has H₋₁=k. | No change. |
| Derived mixed category (216), sampled | M₀=M₁=k, b=0, B=id: HC⁻₁=k, HC⁻₀=0; B=0 gives HC⁻₀=k. For b=id,B=0, b-homology=0 but outer H⁰ in the abelian-category derived model is M≠0. | Retain correct localization. |
| Precyclic cone (238), sampled | Zero input gives 0⊕0 and both matrices zero. The unital k input has b-homology k in degree 0. For A→M₂(A), the corner sends 1 to diag(1,0), differing from the matrix unit diag(1,1). | Retain nonunital cone route. |
| CC/CN/CP (263) | M=k[0]: HC₂=k, HC⁻₂=0, HC⁻₋₂=k, HP₋₂=k. For M₂ⱼ=k, j≥0, CP₀=∏k versus sum-totalization ⊕k; (1,1,…) lies only in the former. | No change. |
| SBI (294) | M=k[0]: HH₀→HC₀ is id:k→k; S:HC₂→HC₀ is id; HH₂=HH₁=0. For CN, u takes the degree-0 generator to degree −2. | No change. |
| Mixed-map compatibility (308) | Identity map between b=0 two-term objects with Bsource=id and Btarget=0: fb=bf=0, but fB=id≠0=Bf. | No change. |
| Mixed Morita (320) | Matrix trace sends e₁₁↦1 and e₁₁−e₂₂↦0. For the infinite free B-module example, VU−UV=p₀, so HH₀ of its corner sends 1↦0. | No change. |
| Shuffle/products (332) | On k[x,y], dx shuffle dy=[1⊗x⊗y−1⊗y⊗x], giving dx∧dy; swapping gives its negative. For matrices, μ((e₁₁⊗e₁₂)(e₂₁⊗e₁₁))=0 but μ(e₁₁⊗e₁₂)μ(e₂₁⊗e₁₁)=e₁₂e₂₁=e₁₁. | No change. |
| Circle-tensor property (365) | A=R gives R⊗T=R and HH₀=R, HH₁=0. A=R[x] gives HH₀=R[x], HH₁=R[x]dx and higher groups 0. | No change. |
| Ground-ring base change (379) | ℤ[x]→ℚ[x]: HH₀ and HH₁ become ℚ[x] and ℚ[x]dx. In (∏k)⊗k[t], t-degrees have a common finite bound; (tⁱ) in ∏k[t] has none. | No change. |
| Étale base change (391) | k[x]→k[x,x⁻¹]: HH₀=k[x,x⁻¹], HH₁=k[x,x⁻¹]dx on both sides; B(x)=dx, whereas xB(1)=0. | No change. |
| Antisymmetrization (405) | n=0,1,2: πε=1,1,2 times id. On dx∧dy over 𝔽₂, ε is a nonzero HKR class but πε=0. | No change. |
| B and de Rham (432) | x² in degree 0 maps under B then HKR to 2x dx, equal to d(x²); at p=2 both are 0. On degree 1 the rational normalization divides the raw degree-2 projection by 2. | No change. |
| Derived HKR filtration (446) | A=k has L=0 and gr⁰=k, higher gr=0. A=k[x] has L=A dx in degree 0; gr¹=A dx[1], higher exterior powers=0. | No change. |
| HH(𝔽_p/ℤ) (458) | Degree-2 divided power a satisfies aᵖ=p!γ_p(a)=0; in THH(𝔽_p), uᵖ≠0. For p=2, a²=0 versus u²≠0. | No change. |
| Coherent actions (486) | Trivial group gives Fun(*,Sp)=Sp. For S₃, (12)(23)=(123) while (23)(12)=(132); a commuting family cannot encode that action. | No change. |
| Orbits/fixed points (512) | G=1: XₕG=XʰG=X, norm=id and Tate=0. For C₂ on Hℤ trivially, norm on degree 0 is 2 and Tate π₀=ℤ/2. | No change. |
| Finite-action quotient (541), sampled | G=1 makes every object induced, quotient=0 and End(unit)=0=Tate. For C₃, R=Hℤ trivially acted on: π₀Endquot(unit)=ℤ/3, agreeing with coker(3). | Retain quotient and idempotent completion. |
| Postnikov/Tate bounds (559) | Hℚ with C₂ or C₃: norm invertible, Tate=0. Hℤ with C₂: π₀=ℤ/2, π₁=0; bounded-below Tate need not vanish. Sphere conclusion would have π₀=ℤ_p. | R02 removes the separately owned sphere conclusion. |
| Tate fixpoint (571) | X=H𝔽_p with trivial C_(p²)-action: the residual iterated Tate expression is 0. Treating the residual action as an unrelated trivial C_p-action instead gives a nonzero Laurent Tate model. | No change. |
| Parametrized Tate (585) | Base *=B1: dualizing spectrum S, norm=id and cofiber=0. For the circle the adjoint representation is a real line, giving ΣXₕT rather than XₕT. | No change. |
| Cyclic realization (605) | Cyclic bar of the trivial group realizes to a point, and suspension spectrum is S. Cyclic bar of ℤ has components indexed by ℤ, matching free loops in S¹. | No change. |
| Edgewise subdivision (630) | p=2, n=0 selects original degree 1; p=3, n=1 selects degree 5, from p(n+1)−1. | No change. |
| E₁ THH (644) | THH(S)=S; THH(0)=0. For H𝔽_p, π₀=𝔽_p and π₂=𝔽_p, unlike ordinary HH(𝔽_p/𝔽_p), whose π₂=0. | No change. |
| THH Frobenius (673) | On the unit the Frobenius is the canonical unit-to-Tate map. For H𝔽_p it sends 1↦1; the zero map would send 1↦0. | No change. |
| Relative THH (698) | Relative THH(R/R)=R. For R=H𝔽_p, relative π₂=0, while absolute π₂=𝔽_p. | No change. |
| Linearization over THH(ℤ) (724) | A=Hℤ: THH(ℤ)⊗THH(ℤ)Hℤ=Hℤ=HH(ℤ/ℤ); relative π₁ and π₂ vanish. | No change. |
| Free E₁ Bökstedt (736) | Perfect k=𝔽_p gives k[u], uᵖ≠0. k=𝔽_p(t) has nonzero dt in π₁. For k=𝔽_(p²), k⊗𝔽_p k=k×k, not k. | No change. |
| Mixed/circle equivalence (760) | k[0] with trivial B gives circle-fixed π₀=k and π₋₂=k. Two-term B=id gives HC⁻₀=0 instead of k. | No change. |
| Circle norm (772) | For k[0], HHₕT has k in degrees 0,2,…; its suspension has k in degrees 1,3,…, matching fib(HC⁻→HP). | No change. |
| HZ finite/circle Tate (784) | C₁:0; C₂ on Hℤ: πeven=ℤ/2, πodd=0. Circle periodic homology of ℤ has ℤ in every even degree. | No change. |
| Lax equalizers (802) | For zero source/target functors, an object is x plus the unique 0→0 map; for identity functors it is x plus an endomorphism, not only an invertible endomorphism. On ℤ, multiplication by 2 is allowed. | No change. |
| Symmetric monoidal THH (831) | Unit S maps to S; S⊗A=A and THH(S)⊗THH(A)=THH(A). Zero input gives 0 on both sides. | No change. |
| NS formula for TC (851) | On THH(𝔽_p), π₀can=π₀φ=id on ℤ_p, so their difference is 0; resulting π₀TC=ℤ_p and π₋₁TC=ℤ_p. | No change. |
| TC adjunction (865) | Mapping from the trivial cyclotomic unit into 0 gives 0=TC(0). On a map from the unit, Frobenius compatibility is an equalizer condition, not an arbitrary underlying element. | No change. |
| Spherical group rings (877), sampled | Ω(*)=1: THH(S)=Σ∞₊L(*)=S. For G=ℤ, π₀ of free-loop components is ℤ on both sides, whereas a point model would have one component. | Retain loops and Frobenius lift. |
| Stable-category THH (889), sampled | Zero category gives 0; Perf(S) gives S. Morita-equivalent matrix algebra M₂(k) has HH₀=k rather than k⁴. | Retain Morita/localization enhancement. |
| Orthogonal spectra (917) | Sphere structure at V=0,W=ℝ is S⁰∧S¹→S¹, the unit identification; dimension shift is 1, not 0. | No change. |
| Genuine fixed points (943) | For genuine C₂-sphere, π₀ categorical fixed points is A(C₂)=ℤ²; geometric fixed points give S with π₀=ℤ. | No change. |
| Complete universes (970) | The sign line of C₂ has fixed dimension 0, so ΦC₂(S^sign)=S⁰; trivial line has fixed dimension 1 and gives S¹. | No change. |
| Borel completion (997) | G=1: F(EG₊,X)=X. A free induced G-object has Tate 0, while categorical invariants need not be 0. | No change. |
| Geometric localization (1015) | G=C₂, induced cell C₂₊∧S maps to 0 under ΦC₂, while ΦC₂(S)=S. | No change. |
| Isotropy separation (1027) | G=C_p, induced spectrum has geometric term 0; G=1 reduces to the identity triangle X→X→0. | No change. |
| Finite-family circle spectra (1041) | At m=1 fixed/geometric input is the underlying spectrum. For a free C_p cell its ΦC_p is 0; replacing every fixed functor by the underlying one would retain p copies. | No change. |
| Orthogonal/cyclotomic comparison (1067) | Unit and zero objects have underlying S and 0 on both sides. The C_p geometric unit is S, not the rank-p induced cell. | No change. |
| TR and genuine TC (1079) | For k=𝔽_p, TR¹₀=k, TR²₀=W₂(k)=ℤ/p²; R reduces modulo p, whereas V(1)=p. | No change. |
| Representation-graded TR (1109) | λ=0 gives ordinary TR-degree; λ the trivial complex line shifts by real dimension 2. The faithful complex C_p-line has fixed dimension 0, not 2. | No change. |
| Endofunctor coalgebras (1144) | F=id permits (Hℤ,×2); fixed-point/equivalence objects exclude it. Zero object has the unique 0→0 structure. | No change. |
| Genuine coreflection (1171) | Bounded-below prime-field model has π₀TR=W(𝔽_p)=ℤ_p. Unit/counit on an already matched object are identity, not multiplication by p. | No change. |
| Bökstedt construction (1185) | Sphere cyclic levels are S, yielding S after realization. On 0 every smash level and realization are 0. | No change. |
| Two THH models (1211) | At H𝔽_p both models have π₀=π₂=𝔽_p; the linear HH model would have π₂=0 over 𝔽_p. | No change. |
| Genuine restriction pullback (1225) | n=1 uses C_p/1=C_p; n=2 uses C_(p²)/C_p=C_p. The quotient has order p in both, not p² in the second. | No change. |
| de Rham–Witt TR (1239) | Perfect 𝔽_p: WₙΩ¹=0, TRⁿ₀=ℤ/pⁿ; at n=1 this is 𝔽_p. | No change. |
| Circle-equivariant p-typical convention (1271) | A single prime p selects one Frobenius; integral cyclotomic data at p=2 and p=3 require two maps. T/C_p→T sends z↦zᵖ. | No change. |
| Classical Cartier (1300) | On (𝔽₂)², F(x,y)=(x,0), V(x,y)=(0,x): FV=0=2id but VF(1,0)=(0,1). On ℤ, (F,V)=(2,1) and (1,2) both satisfy FV=2, but id between them fails F-commutation. | No change. |
| Topological Cartier (1326) | M=Hℤ with F=p,V=1 gives composite p, agreeing with norm on π₀; F=V=1 gives composite 1≠p. | No change. |
| V-completion (1355) | ℤ with V=id has cofib(Vⁿ)=0 and completion 0; V=p has cofib=ℤ/pⁿ and completion ℤ_p. Ordinary p-completion is ℤ_p in both cases. | No change. |
| Cyclotomic t-structure (1382) | THH(𝔽_p) has cyclotomic degree-zero group W(𝔽_p)=ℤ_p, although underlying π₀THH=𝔽_p. | No change. |
| TR/Cartier equivalence (1408), headline | At the prime field, TR₀=ℤ_p, F=1,V=p; quotient by V has π₀=𝔽_p. The V=id model would give quotient 0. | Retain marked F,V and completeness. |
| Cartier heart (1420) | (ℤ_p,F=1,V=p) is V-complete; (ℤ,F=p,V=1) has V-completion 0 and is not a nonzero object of that complete heart. | No change. |
| TR detects quasi-isogenies (1434) | Multiplication by p on ℤ_p has kernel 0 and cokernel 𝔽_p, killed by p, and becomes invertible on ℚ_p; zero map on ℤ_p does not. | No change. |
| Null Frobenius (1446) | X=0 gives ∏ₙXₕC_(pⁿ)=0. For a nonzero p-torsion input each homotopy-orbit factor is p-torsion, whereas a weight-zero THH(𝔽_p) has TR₀=ℤ_p. | No change. |
| Positive weights (1460) | At p=2, weight 1 maps to weight 2; in truncation ≤1 target=0. Weight 0 maps to weight 0 and is not forced to vanish. | No change. |
| Graded convergence (1486) | Xᵢ=ΣⁱH𝔽_p for i≥1: πⱼ of the tail >n is 0 for n>j. Weight-zero THH(𝔽_p) is spectrally p-torsion but TR₀=ℤ_p is not torsion. | No change. |
| Relative dualizable categories (1514) | E=Sp,C=Mod_R has dual Mod_(Rop); for R=S evaluation S⊗S→S is identity. Zero module category has dual 0 and evaluation 0. | No change. |
| Ordered trace class (1539) | In vector spaces, id on kʳ is represented by Σᵢeᵢ*⊗eᵢ; its trace is r. An infinite-rank identity is not a finite sum of rank-one tensors. | No change. |
| Trace-class preduals (1565) | Rank-one f(v)=λ(v)w has classifier λ⊗w and evaluation f; replacing classifier by 0 gives zero, distinguishable when λ(v)=1,w≠0. | No change. |
| E₁ rigidity (1577) | For the unit module the left/right evaluation composites are id; for zero object they are 0=id₀. An E₁ module does not acquire a braiding from these equations. | No change. |
| Nuclear objects (1600) | A finite-dimensional k-module is generated by rank-one evaluations. For k, 1*⊗1 evaluates to 1; zero classifier evaluates to 0. | No change. |
| Rigidity criterion (1623) | Unit-generated compact case: the unit's identity factors through its dual tensor with value 1↦1. Empty generating collection generates only 0, not a nonzero unit. | No change. |
| Nuclear closure (1633) | Cofiber(id:k→k)=0; finite sum k⊕k has identity classified by two rank-one summands and trace 2. | No change. |
| Continuous Calkin (1645) | For the zero category, Ind, quotient and Calkin category all equal 0. For compactly generated C, the defining localization has composite C→Ind(C)→quotient equal to 0. | No change. |
| Accessible localizing invariants (1668) | A split exact sequence C→C⊕D→D gives T(C⊕D)=T(C)⊕T(D); C=D=Perf(k) gives K₀=ℤ², not ℤ. | No change. |
| Continuous extension (1693), headline | On the compactly generated unit, Tcont(Ind Perf(k))=T(Perf(k)); for K₀ this is ℤ. Zero category gives 0. | Retain normalization on compacts. |
| Uniqueness of extension (1716) | Two normalized extensions on Ind Perf(k) have the same value K₀=ℤ and identity comparison on the marked generator 1; scaling by 2 fails that marking. | No change. |
| Relative localizing motives (1728) | Motive of 0 is 0; split C⊕D maps to U(C)⊕U(D). For the unit, K₀(Perf(k))=ℤ gives a nonzero endomorphism class. | No change. |
| Nuclear E-modules (1753) | E itself has evaluation 1⊗1↦1; zero E-module has every classifier and evaluation zero. | No change. |
| Length-one resolution (1776) | Split identity resolution 0→M→M→0 has kernel 0 and cofiber 0. A purported resolution with zero middle map on M=k would have kernel and cokernel k. | No change. |
| Enriched duality (1801) | Rank-one k-module has k*⊗k→End(k), 1*⊗1↦id; two basis vectors give the four matrix units. | No change. |
| Rigidity of motives (1811), headline | The unit is dual to itself; its evaluation on 1⊗1 is 1. A zero evaluation gives a zero snake composite instead of id. | Retain duality normalization. |
| Connective stable-category K (1823) | K(0)=0, K₀(Perf(k))=ℤ generated by [k], and [k⊕k]=2[k]. | No change. |
| Nonconnective K (1849) | IK(0)=0; Perf(k) has K₀=ℤ and K₋₁=0. Suspension delooping shifts a class from degree n to n+1. | No change. |
| Truncating invariants (1877) | For an invariant satisfying the stated truncation property, A→Hπ₀A induces an equivalence. A=Hk gives identity; S→Hℤ has unequal π₁ (ℤ/2 versus 0), so it is not itself a spectral equivalence. | No change. |
| K as invariant unit (1905) | Unit transformation sends [k]∈K₀(k)=ℤ to 1∈π₀THH(k)=k; at k=𝔽₂, 2[k] maps to 0. | No change. |
| Dennis trace (1917) | In k[t,t⁻¹], unit t maps to t⁻¹dt, unit 1 to 0; rank r maps to r·1. | No change. |
| Cyclotomic trace (1946) | K₀(𝔽_p)=ℤ maps to TC₀(𝔽_p;ℤ_p)=ℤ_p by 1↦1; K(0)→TC(0) is 0→0. | No change. |
| Trace uniqueness/multiplicativity (1972) | Product of rank 2 and rank 3 classes has rank 6, and trace(2·3)=6=trace(2)trace(3); zero transformation fails unit 1↦1. | No change. |
| Relative fibers (1986) | Identity ring map: relative K=relative TC=0. Split dual numbers have relative K₁=k via 1+εa↦a. | No change. |
| Bimodule THH trace (2014) | THH(S;M)=M, THH(A;0)=0. For M=A, bimodule trace is THH(A); arbitrary bimodule has two endpoint actions, e.g. right twisting changes ma to mσ(a). | No change. |
| Square-zero extensions (2039), sampled | (a,m)(b,n)=(ab,an+mb), so (0,m)(0,n)=0; A⊕0=A. For δ=0, fib of the two zero sections contributes ΩΣI=I, so pullback=A⊕I. | R01 supplies missing map-space adjunction. |
| Goodwillie derivative (2063), sampled | ψ=id gives colim ΩⁿΣⁿX=X. Constant ψ=C has reduced functor 0 and derivative 0. Connective truncations of Σ⁻¹Hℤ first recover its degree −1 class after the extension step. | Retain reduction and connective extension. |
| Stable K derivative (2095) | For the rational dual-number direction, K₁(ℚ[ε],ε)=ℚ; THH(ℚ;ℚ)=Hℚ, so its suspension has π₁=ℚ, whereas its loop has π₁=0. | No change. |
| Stable TC derivative (2107) | Zero bimodule gives relative TC=0 and ΣTHH(A;0)=0. The linear term for A=S,M=Hℤ is ΣHℤ, with π₁=ℤ and π₀=0. | No change. |
| Pseudo-extensibility (2121) | For a linear reduced functor L, cross-effect₂(X,Y)=fib(LX⊕LY→LX⊕LY)=0. For X↦X⊗X, the mixed summands are X⊗Y and Y⊗X, not 0. | No change. |
| Postnikov convergence (2143) | Hk has τ≤nHk=Hk for n≥0, so limit=Hk. A zero tower has limit 0; levelwise vanishing of low groups follows only when the connectivity bound tends upward. | No change. |
| Infinitesimal sifted colimits (2165) | I=0 gives extension A→A and relative functor 0. For a filtered sum of square-zero modules, products in the ideal remain 0 and the linear term is ΣTHH(A;colim I)=colim ΣTHH(A;I). | R01 repairs the domain construction. |
| Derivatives to nilpotence (2187) | I²=0 has one nontrivial ideal layer I; I³=0 can have I and I². For k[ε]/ε³, I²=kε²≠0 and I³=0. | No change. |
| DGM (2201), headline | A=B gives zero fibers. For 𝔽_p[ε]→𝔽_p, relative K₁ is additive 𝔽_p; completed relative TC has the same degree-one class. For ℚ[ε]→ℚ both p-completed fibers vanish. | Retain connective, π₀-surjective nilpotent comparison. |
| Henselian trace rigidity (2213), headline | Identity henselian pair (R,0) has fiber 0 on both sides. For complete DVR ℤ_p,(p), quotient is 𝔽_p and the ideal is not nilpotent: pⁿ≠0 for every n. | Retain genuinely henselian extension. |
| Rational Goodwillie (2238), headline | ℚ[ε]→ℚ: K₁relative⊗ℚ=ℚ and HC₀relative=εℚ≅ℚ; relative K₀ and HC₋₁ are 0. | Retain one-degree shift. |
| Kinv truncating (2264) | A=Hk has A→Hπ₀A=id, so Kinv comparison=id. A square-zero nilpotent direction contributes equal K and TC linear fibers, hence its Kinv linear fiber=0. | No change. |
| Filtered-tower trace square (2276) | Constant identity tower gives identity on both inverse limits and zero total fiber. Tower ℤ/pⁿ has lim=ℤ_p, not a single finite quotient. | No change. |
| Mod-p K continuity (2288) | Constant ring tower gives K(R)/p on both sides. For ℤ_p/pⁿ, compatible units have limit ℤ_p×; reduction to n=1 alone retains only 𝔽_p×. | No change. |
| Truncating nil-invariance/excision (2300) | Square-zero I has I²=0; the perfection quotient in LT has locally nilpotent I with no uniform nilpotence exponent. Its K₂relative=0 but completed π₂≠0. | No change. |
| TC C_p assembly (2314), sampled | p=2: pointed C_p has one nonbasepoint; p=3: two. For R=0 all terms are 0. Thus the final reduced C_p factor has multiplicity p−1, not p. | Retain shifted THH and p-fold circle. |
| Dual numbers (2326), sampled | k=ℚ: relative K₁=ℚ, K₂=0=Ω¹ℚ/ℤ. k=ℚ[t]: K₂=ℚ[t]dt. k=ℤ: K₂=ℤ/2≠0=Ω¹ℤ/ℤ. | R03 changes locator, not statement. |
| Almost-module continuous K (2340) | Zero almost ideal annihilates every module, producing zero almost category and K=0; unit ideal leaves ordinary modules. | No change. |
| Snaith (2380), headline | Bott β=[H]−1 on S² has β²=0 in reduced finite-base K, but the spectral localization makes β invertible. ψ²β=2β, so an integral periodic ring map would have to invert 2. | Retain localization at k. |
| Coherent stable Adams (2404), headline | ψ²ψ³β=6β=ψ⁶β. In KU[1/2], ψ²(β⁻¹)=(1/2)β⁻¹; integral KU cannot contain that inverse image. | Retain coherent localized lift. |
| Rational graded HKR (2432), sampled | β has degree 2, σβ degree 3; B(β²)=2βσβ. For Laurent β, δ=β⁻¹σβ has degree 1 and B(β⁻¹)=−β⁻²σβ. | Retain Koszul sign and Laurent derivative. |
| Relative ku/KU THH (2444), sampled | R=A gives THH(ku_A/ku_A)=ku_A, and periodicization gives KU_A; rational coefficients are Aℚ[β] and Aℚ[β±¹]. | Retain relative unit. |
| Oriented fixed/Tate coefficients (2458) | q−1=βt; ψ²β=2β, ψ²q=q² implies ψ²t=((q+1)/2)t. At q=1 this gives t, not 2t. For C₂, (1+z)²−1=2z+z². | No change. |
| Étale spectral lifts (2486) | Identity π₀-algebra lifts to the given base with identity marking. Zero étale algebra lifts to zero; a chosen marking excludes arbitrary automorphisms of a nontrivial étale extension. | No change. |
| Spherical base hypotheses (2498) | On ℤ[x], ψ₂(x)=x² and the target is free of rank 2 over the image, basis 1,x. On ℤ[ε]/ε² with ψ₂ε=2ε, reduction modulo 2 makes ε act by 0, so this map is not flat. | No change. |
| Compatible global lifts (2524) | On S[x±¹], ψ²ψ³x=x⁶=ψ⁶x; on the base unit ψ¹=id. Reversing the degree convention to x↦x⁻ᵐ fails ψ¹=id. | No change. |
| Solid nuclear trace class (2551) | For a free rank-one solid module, evaluation of 1*⊗1 is 1; for the zero module it is 0. Infinite product identity is not represented by a finite rank-one sum. | No change. |
| Perfect-even site (2580) | R and Σ²R have even homotopy for even R; ΣR has odd π₁=π₀R. Zero is even; the odd shift is excluded. | No change. |
| Homological evenness (2605) | At even R, the representable unit has π₂ⱼ₊₁=0. For ΣR, π₁=π₀R≠0, showing parity is detectable. | No change. |
| Even flatness (2632), sampled | Free R² is an even-flat finite cell when R is even; filtered colimit of such cells retains flatness. Over Hℤ, H𝔽₂ has Tor₁(𝔽₂,𝔽₂)=𝔽₂, unlike a flat discrete module. | Retain ordinary characterization and only the stated solid implication. |
| Faithfully even flat (2656), sampled | R→R has fiber 0 and detects every module. Nonzero R→0 sends R to 0 and cannot be faithful. | Retain faithfulness, not flatness alone. |
| Solid duality R (2678), sampled | Finite free rank-one R-module has bidual R and evaluation id; an infinite direct sum has ordinary dual a product, so direct sum and product cannot be interchanged. | Retain both module sides and explicit assumption. |
| Ordinary even filtration (2702) | For even Hℤ, fil⁰=Hℤ, fil¹=0. For Σ²Hℤ as module, fil¹=Σ²Hℤ and fil²=0. | No change. |
| Solid even filtration (2730) | On the discrete even unit, evaluation gives the same groups π₀=ℤ, πodd=0. Zero input has every step 0. | No change. |
| Synthetic finite operations (2758), sampled | n=1: norm=id, Tate=0. For induced C₂-object R[C₂], norm identifies coinvariants and invariants with R, hence Tate=0; for trivial H𝔽₂ the ordinary Tate realization has 𝔽₂ in every degree. | Retain unshifted finite norm and lax structure. |
| Synthetic circle operations (2788), sampled | Unit Hk with trivial circle: fixed terms in degrees 0,−2,…; orbits in 0,2,…; the norm source is shifted by one plus filtration twist, not unshifted. | Retain (1)[1] and Lemma 2.75 bounds. |
| Filtered solid relative THH (2815) | For identity base map, relative THH is the base; on even Hℤ its first two filtration steps are Hℤ and 0. | No change. |
| K(1)-local sphere (2829) | At odd p use ψʳ on KU_p; at p=2 use ψ³ on KO₂. KU₂ has π₂=ℤ₂, while KO₂ has π₂=ℤ/2, so substituting KU for KO changes fixed-point input. | No change. |
| Image of J (2857) | Connective cover keeps π₀=ℤ_p and removes all negative homotopy of the K(1)-local sphere; j is therefore not the untruncated fixed-point spectrum. | No change. |
| All-prime E₁ comparison (2887) | At p=2 the stated E₁ comparison survives; an E∞ conclusion would require additional coherent operations not provided by an equality of π₀=ℤ₂. Unit maps take 1↦1 on both sides. | No change. |
| THH(ℤ_p)/J (2899) | At p=3, π₅THH(ℤ₃)=ℤ/3; at p=2, π₃THH(ℤ₂)=ℤ/2. Thus mixed-characteristic THH is not even. | No change. |
| Cyclotomic integer comparison (2911) | p=3 gives ℤ₃[ζ₃], ramification degree 2; p=2 gives ℤ₂[ζ₂]=ℤ₂, degree 1, outside the cited odd-prime theorem. | No change. |
| ψ⁰/q-Hodge pullback (2925), sampled | Unit R=A gives Fⁱ=h^max(i,0)A[[h]]; F¹=hA[[h]], F²=h²A[[h]]. Constant positive filtration hA[[h]] would fail at i=2. | Retain specified pullback. |
| Odd-prime local comparison (2950), sampled | Unit over ℤ₃: gr⁰=ℤ₃, gr¹=hℤ₃[[h]]/h²≅ℤ₃. Degree shearing places weight 1 in homotopy degree 2. | Retain completion and shearing. |
| p=2 local comparison (2962), sampled | Unit over ℤ₂ has the same h-adic graded values ℤ₂. The prime is 2, so an argument requiring 2 invertible would compute in ℚ₂ instead and lose integral coefficients. | Retain separate theorem. |
| Quasiregular quotient (2974), sampled | Identity quotient has ideal 0, and combined filtration is h-adic. For a nonzero regular ideal (x), cotangent contributes one degree-1 generator; replacing quotient by an étale map would give 0. | Retain quasi-lci and relative semiperfectness conditions. |
| Arithmetic gluing (2988) | For the coefficient lattice, ℚ∩∏ₚℤ_p=ℤ inside finite adeles. Omitting the rational corner would leave ∏ₚℤ_p, which contains non-diagonal sequences. | No change. |
| Global q-Hodge (3013), headline | At A=R=ℤ, grⁱ of h-adic filtration is ℤ for i≥0; its trace coefficient lies in degree 2i. Zero rank/frame gives no differential forms of positive degree. | Retain global and local gluing. |
| Completeness/multiplicativity (3025) | ∩ₙhⁿℤ[[h]]=0 and lim ℤ[h]/hⁿ=ℤ[[h]]. Multiplication hⁱ·hʲ=hⁱ⁺ʲ distinguishes multiplicative from constant filtration. | No change. |
| Framed inputs (3037) | S=A[x] has relative dimension 1 and Ω¹=A[x]dx; empty frame on S=A has Ω¹=0. Étale S=A×A still has dimension 0, not rank 1 as an A-module. | No change. |
| q-divided powers (3060) | δ⁰=1, δ¹=x−y, δ²=(x−y)(x−qy)/(1+q); at q=1 δ²=(x−y)²/2. ∇qxδ²=x−y; ∇qyδ²=−(x−qy). At x=0 the cancelled polynomial numerator identity still gives 0=0. | No change. |
| Framed Čech resolution (3086) | A=ℤ[1/2], S=A[i], d=0: R₁=S⊗A S=S×S. Full diagonal completion gives S, while coordinate-only completion retains S×S. In degree 0 the corrected q-D is S[[h]]. | No change. |
| Framed comparison (3109), headline | One-variable linear summand has q-Hodge differential h:x↦h dx, hence H¹=A[[h]]/h; q-de Rham differential sends x↦dx and has H¹=0 on this summand. Empty frame gives h-adic unit. | Retain q-Hodge versus q-de Rham. |
| Framed trace E∞ pair (3133), headline | The unit maps 1↦1 and products of filtration generators obey h·h=h². For the one-variable pair, the linear H¹=A[[h]]/h survives; replacing it by de Rham gives 0. | Retain trace enhancement beyond supplied E₀ pair. |
| Cyclonic category (3158), sampled | m=1 has one divisor, hence no prime transition conditions. m=6 has divisors 1,2,3,6 and prime edges for 2 and 3; omitting either loses a compatibility. | Retain all finite cyclic groups. |
| Cyclonic ku/KU (3185), sampled | Inflation by 2 sends q↦q², β↦β; thus h↦2h+h². Stable Adams instead sends β↦2β. At β=0 these are still different graded maps. | Retain inflation/Adams distinction. |
| A₂ coherence (3211), sampled | Toric x has ψ²ψ³x=x⁶=ψ⁶x; at q, inflation composition gives q⁶. Equality of these values alone supplies no Tate-square homotopy. | Retain explicit higher compatibility. |
| TC−(m) (3238) | m=1 gives XʰT. On ku unit, π₀ at m=2 is ℤ[q] completed at q²−1. For divisor 1 of 2, βt₂=q²−1 maps to (q+1)βt₁; at q=1 the factor is 2. | No change. |
| Cyclonic filtration/KU (3263) | Inverting β sends βtₘ=qᵐ−1 to tₘ=(qᵐ−1)β⁻¹. β has homotopy degree 2 and filtration degree 1; omitting the latter would shift gr by 0 rather than 1. | No change. |
| Twisted q-Hodge (3290), headline | m=1 recovers h; m=2 uses q²−1=(q−1)(q+1). At q=−1, q²−1=0 but q−1=−2, so the m=2 completion cannot be replaced by m=1 integrally. | Retain all cyclotomic stages. |
| Habiro–Hodge (3302), headline | On A=R=ℤ[1/2], factorial-stage completion gives lim ℤ[1/2][q]/∏ⱼ≤n(1−qʲ); completion at q−1 gives ℤ[1/2][[h]]. The m=2 stage also sees q=−1. | Retain full divisor limit and module-level theorem. |
| Number-field KU (3316), headline | F=ℚ, Δ=6 gives R=ℤ[1/6], with 2- and 3-completions 0. F=ℚ(i), Δ=12 gives R=ℤ[i][1/6]; Δ=1 leaves ramification at 2 and violates hypotheses. | Retain discriminant and small-prime conditions. |
| Rigidification (3346) | Rigid target unit factors through itself with identity; zero target has envelope 0. Rational-index interpolation has arbitrarily many intermediate stages, unlike a fixed finite chain. | No change. |
| Refined invariant (3369) | For smooth proper Perf(k), realization of Tref returns T(k); at the zero category both refined value and realization are 0. | No change. |
| Killing pro-algebra (3381) | Killing the unit algebra makes the unit zero, hence target 0; killing zero leaves the original unit. These two boundary values distinguish the localization. | No change. |
| Smooth proper categories (3407) | Perf(k) has compact diagonal and finite-dimensional Hom(k,k)=k. Perf(k[t]) has Hom(A,A)=k[t], infinite-dimensional over k, so is not proper over k. | No change. |
| Smooth proper normalization (3430) | On Perf(k), K₀=ℤ and refined normalization has the same marked class 1. Zero category gives 0. | No change. |
| Refined base change (3440) | Identity base change gives the identity comparison; extension k→k² carries the rank-one unit to (1,1), not (1,0). | No change. |
| Localization cofiber (3452), sampled | Zero killed algebra gives dual term 0 and cofiber T(X), hence no change. Killing unit gives T(X)→T(X) by id and cofiber 0. | Retain tower duals and bimodule factorization hypotheses. |
| Oriented completion (3464) | βt=q−1; after β inversion t-adic completion is h-adic completion degreewise. Degree-zero coefficient ring is ℤ[[h]], not uncompleted ℤ[h]. | No change. |
| Refined THH/TC⁻ (3474) | Relative unit THH(k/k)=k; TC⁻ is khT. For k=Hℚ, π₀=ℚ and π₋₂=ℚ, so forgetting circle fixed points would lose π₋₂. | No change. |
| High-powered integers (3500) | 1,9,16,64 pass; 0 fails positivity; 3 fails exponent≥2; 8 and 32 fail the 2-exponent condition. v₂(32)=5; vₚ(d⁴)=4vₚ(d) for d>0. | No change. |
| Torsion-free base change (3524) | ℤ⊗ℤℤ/m=ℤ/m with Tor₁=0; ℤ/m⊗ᴸℤℤ/m has Tor₁=ℤ/m. | No change. |
| Finite-coefficient q-Hodge (3542), headline | m=1 gives zero quotient spectrum and zero completed q-Hodge complex. m=9 and m=16 are admissible; m=4 is algebraically powerful but not supplied by the stated spectral tower. | Retain completed pair and high-powered spectral restriction. |
| Filtered derived Hom (3554), sampled | M=k gives RHom(k,N)=N. Over ℤ, Hom(ℤ/m,ℤ)=0 but Ext¹(ℤ/m,ℤ)=ℤ/m, producing a degree −1 homotopy group. | Retain derived Hom. |
| Finite-coefficient dual (3564), sampled | m=9: Homℤ(ℤ/9,ℤ)=0, Ext¹=ℤ/9, Ext²=0; m=16 similarly gives ℤ/16 in Ext¹ only. | Retain odd dual degree. |
| Completed tensor filtration (3574), sampled | Over ℤ_p[[x,y]], tensor of two ℤ_p quotients has Tor ranks (1,2,1). Tensor filtration gr¹=0 while output Whitehead gr¹=Σ²Hℤ_p. Over ℤ_p, two 𝔽_p inputs give Tor ranks (1,1), inside amplitude [0,1]. | Retain amplitude clause; negative control works. |
| Pro-idempotence (3590) | ℤ/9⊗ᴸℤℤ/9 has H₀=H₁=ℤ/9, so not termwise idempotent. For m₁=9,m₂=16, gcd=1 gives H₀=H₁=0; for 9,27 both equal ℤ/9. | No change. |
| Trace-class transitions (3600) | m=9 has m³=729 and m=16 has m³=4096; quotient maps send 1↦1. The dual has degree −1, shifting tensor amplitude to [−1,0], not [0,1]. | No change. |
| Rational ku refined coefficients (3612), headline | For finite test module ℤ/m, dual contributes Ext¹=ℤ/m, and its cofiber against an even base shifts that contribution into even degree. The unit term B survives as B in the displayed exact sequence. | Retain ind-extension, no canonical split. |
| Rational KU refined coefficients (3622), headline | β⁻¹ has degree −2; multiplying by β identifies successive even coefficient groups. Odd groups are 0; q−1=βt persists. | Retain periodic ind-coefficients, not connective truncation. |
| Trace descent (3648) | Identity cover has constant Čech object and totalization equal to the original trace. Empty cover of the empty affine/zero algebra gives 0. | No change. |
| Even HH on QRSP covers (3658) | Perfect field 𝔽_p over itself has L=0 and HH=𝔽_p in degree 0. A regular quotient over ℤ has cotangent in homological degree 1, yielding even divided powers after the HKR shift. | No change. |
| Cyclic/de Rham (3668) | Unit ℤ over ℤ: HC⁻₋₂=ℤ and HP₂=ℤ, while HC⁻₂=0. Filtration-completed de Rham terms reproduce these shifts. | No change. |
| Perfectoid coefficient node (3681) | Ainf[u,v]/(uv−ξ): v=1 gives u=ξ; after v inversion u=ξv⁻¹. Mod ξ, uv=0, so for nonzero residue ring u and v are zero divisors. | No change. |
| THH deformation (3708) | Killing the relative Bott parameter recovers HH; in the prime-field comparison, polynomial uᵖ≠0 differs from divided-power aᵖ=0. | No change. |
| THH antisymmetrization (3718) | In form degree 2, the two signed tensor terms project to 2dx∧dy; at p=2 this is 0. | No change. |
| THH cotangent filtration (3742) | L=0 gives only weight 0; for a single smooth coordinate, Λ¹L is rank 1 and Λ²L=0. | No change. |
| Nygaard/décalage (3754) | On a one-term torsion-free complex, Lη_f leaves degree 0 unchanged; on degree 1 it inserts f. For differential f:A→A, décalage changes the divided differential to 1. | No change. |
| Segal over O_C (3764) | The parameter map on the perfectoid even generator has the indicated Frobenius unit; in degree 0 the unit maps 1↦1. Zero comparison would send 1↦0 and fail. | No change. |
| Derived spectral-sequence convergence (3776) | Constant complete tower has lim¹=0; tower ℤ←2ℤ←2ℤ←… has lim=0 and nontrivial lim¹ (ℤ₂/ℤ), so arbitrary tower convergence cannot be inferred. | No change. |
| Negative TC (3786) | For 𝔽_p, 1−F=0 on W(𝔽_p)=ℤ_p, so π₋₁TC=ℤ_p. For algebraically closed 𝔽̄_p, Artin–Schreier/Witt gives surjectivity and coker=0. | No change. |
| Trace Adams (3798), sampled | p=5, γ=2: weights i=0,1,2 give 1,2,4. Circle parameter transport has factor 2⁻¹=3 mod 5, not 2. At i=−1 the factor is γ⁻¹ when that degree is defined. | Retain inverse circle convention and weight γⁱ. |
| Characteristic-p even TC sheaf (3828) | At weight 0 over 𝔽_p, F−1=0 on ℤ_p, not surjective on points; étale Artin–Schreier covers kill the obstruction locally. | No change. |
| Syntomic K sheaves (3838), headline | Weight 0 on the prime field gives K₀ completed=ℤ_p. With mod pⁿ coefficients it gives ℤ/pⁿ. The raw π₋₁TC=ℤ_p above is not a negative connective K-group. | Retain sheafification, connective truncation and i≥1 on odd comparison. |
| Habiro trace export (3876) | F=ℚ,Δ=6 has zero local terms at 2,3; F=ℚ(i),Δ=12 retains the two conjugate embeddings in split coefficient factors. Shearing weight i shifts by −2i. | No change. |
| Coefficient order (3904) | Hℤ: completion then inversion has π₀=ℚ_p; rationalization then p-completion gives 0. Multiplication by p becomes an isomorphism on ℚ_p but not on ℤ_p. | No change. |
| Trivial integers/THH(𝔽_p) (3930) | Degree-0 map ℤ→𝔽_p has kernel pℤ; its cofiber fits the stated cyclotomic sequence. For X=0 all three terms and the fiber are 0. | No change. |
| Spectral versus ordinary reduction (3944) | R=ℤ: π₀(R⊗S𝔽_p)=𝔽_p=R/p, but the source retains higher spherical Tor. For R=ℚ both p-completed trace terms are 0. | No change. |
| β comparison (3958) | Domain/codomain composition is K(R/p)→TC(R/p)→HP(R); β∘tr is typed, tr∘β is not. For R=ℚ, completed domain and codomain are 0. | No change. |
| Spectral Beilinson square (3985) | At i=0 the low-degree total cofiber is killed by p⁰=1, hence 0. At p=2,i=1 the stated bound is annihilation by 2, not vanishing integrally. | No change. |
| Associative Beilinson square (3999), sampled/headline | R=ℚ has all p-completed corners 0. R=ℤ_p has HC₀(R;ℚ_p)=ℚ_p, so relative TC has π₁=ℚ_p and cofiber π₂=ℚ_p. | Retain associative generality and rational coefficients. |
| Henselian K square (4011), sampled/headline | R=ℤ_p: relative units 1+pℤ_p (1+4ℤ₂ for logarithm at 2) rationalize to ℚ_p, matching (ΣHC)₁=ℚ_p. R=0 has all corners 0. | Retain henselian commutative scope. |
| Beilinson fiber shifts (4023), sampled/headline | For HC₀=ℚ_p, ΣHC has π₁=ℚ_p and Σ²HC has π₂=ℚ_p. p=2 gives bounds −1 and 0; p=3 gives 1 and 2, the latter only with the extra π₋₁ hypothesis. | Retain shift and small-prime bounds. |
| Integral graded refinement (4037), headline | i=0: LΩ/LΩ≥0=0, so its rational isogeny target is 0. At p=2 the equivalence range i≤p−2 includes only i=0; at p=3 it includes i=0,1. | Retain uncompleted derived de Rham and stated range. |

The table has 198 rows, one for each named statement block. Its nonexamples include noncommutative matrices/S₃, nonperfect characteristic-p coefficients, nonflat base change, an étale disconnected diagonal, p=2 and 3, degree-zero/empty inputs, unbounded products, total-function factorization at 0, and higher Tor. Numerical and sign tests were recomputed rather than inferred from the sorry build. Checks concerning generic higher-categorical universal properties are boundary/normalization tests; their general proofs remain roadmap work.


## Not verifiable

- No seeded source was inaccessible: all 15 targets were checked in legal cached texts. No additional source request or manifest edit was needed.
- The spectral headline theorems cannot be mechanically truth-tested by the empty Lean module at these pins. The successful build certifies import and file form only. Their mathematical evidence is the source and instance audit above, not Lean proofs.
- The report does not certify every unsampled external source locator, or all higher coherences from a finite list of computations. General claimed supplier availability is subject to R01; no hidden axiom or absent interface is treated as proved.

## Source issues

- **Misprint** in ammn at Definition 2.14, printed p. 11 (ammn line 496): the source says the crystalline trace composes tr after β; it should be β after tr; affects a stated result.
- **Misprint** in ammn at proof of Proposition 3.1, printed p. 15 (ammn line 707): the source says the Verschiebung defect subtracts gF; it should be Vg−gV; affects the proof.
- **Misprint** in ammn at §3.1 graded spectra, printed p. 15 (ammn line 721): the source says Day convolution uses multiplication of nonnegative integers; it should be addition, so p-fold powers have weight pi; affects a stated result.
- **Misprint** in ammn at proof of Proposition 3.3, printed p. 16 (ammn line 748): the source says every retained weight j is X_i; it should be X_j; affects the proof.
- **Misprint** in ar at Proposition 2.67, printed p. 18 (ar line 708): the source says finite synthetic Tate is symmetric monoidal; it should be lax symmetric monoidal, as its proof supplies; affects a stated result.
- **Misprint** in lmmt at Remark 3.11, printed p. 16 (lmmt line 672): the source says the stabilized relative K-theory is ΩM; it should be ΣM in the displayed split-extension convention; affects the proof.
- **Misprint** in w at proof of Lemma 6.11, printed p. 84 (w line 3766): the source says λ^d((x−y)/(q−1)) equals its Pochhammer-normalized divided power; it should include the factor (−1)^d; affects the proof.
- **Error** in w at 6.12(c) and Lemma 6.13, printed pp. 85–86 (w lines 3800–3808): the source says coordinate-difference envelopes give the comparison for arbitrary étale framings; it should first discard complementary diagonal components by full diagonal completion; affects a stated result.

These source defects are not additional PR findings: the README corrects them. For the last error, the empty-frame étale example A=ℤ[1/2], S=A[i] gives S⊗A S=S×S, whereas the trace side has S. For the synthetic monoidal qualifier, the trivial-group Tate functor sends the unit to 0, excluding a strong unit-preserving monoidal functor. For the λ sign, d=1 gives denominators q−1 and 1−q with opposite signs.
