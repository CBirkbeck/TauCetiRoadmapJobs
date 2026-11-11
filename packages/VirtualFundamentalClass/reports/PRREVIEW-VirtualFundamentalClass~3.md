# Review of VirtualFundamentalClass (pull request #1996 at b7256a8)

**Verdict:** needs changes

## R01 (P1) — Layer 5 still depends on its own consumer

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:605`: “use deformation to the normal cone and Layer 8’s Vistoli comparison for regular-immersion virtual pullback”.
**Claim:** This gives the cycle 5 → 8 → 7 → 6 → 5, despite the Layer 5 dependency list.
**Witness:** The dependency lists at lines 781, 704 and 640 supply the return edges. The symbol `𝔑_{X/Y}` at line 604 is first defined in §9.1.
**Repair:** Move the virtual-pullback sentence to §8.3. In §5.5 write the smooth sequence as `B T_{X/Y} → 𝔠_X → f*𝔠_Y`; define `𝔑_{X/Y}=h¹/h⁰((L_{X/Y})∨)` there before using it for lci transitivity. For `𝔸¹→pt`, this gives `B O→B O→0` without Layers 8–9.

## R02 (P1) — The Artin-base transitivity triangle uses an unconstructed object

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:465`: “including the triangle `f*L_Y → L_X → L_{X/Y} →`”.
**Claim:** §3.3 constructs cotangent complexes only for morphisms of relative DM type, but this triangle also needs the absolute cotangent complex of an arbitrary algebraic base.
**Witness:** For `f:pt→B𝔾_m`, `f*L_{B𝔾_m}=k[−1]`, with `H¹=k`; `L_pt=0` and `L_{pt/B𝔾_m}=k`. The base-to-field morphism is not of DM type. DerivedDeRhamCohomology §5.8 supplies schemes only.
**Repair:** Add the geometric cotangent complex for arbitrary morphisms of the locally finite-type algebraic stacks in scope, with its smooth-presentation descent and transitivity. Restrict the positive-cohomology vanishing assertion to morphisms of relative DM type. Include the triangle `k[−1]→0→k→k` as a Check.

## R03 (P2) — Perfectness alone does not give the cone-stack exact sequence

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:544`: “Turn a distinguished triangle with perfect third term into a short exact sequence of abelian cone stacks.”
**Claim:** The third term needs perfect amplitude contained in `[-1,0]`; perfectness without this bound is insufficient.
**Witness:** For `E=k[1]→F=0→G=k[2]`, both first terms satisfy (⋆) and `G` is perfect. The induced sequence is `0→0→𝔸¹`, whose last map is not surjective. BehrendFantechi1997 line 735 imposes the bound.
**Repair:** Write: “For a distinguished triangle `E→F→G→E[1]`, with `E,F` satisfying (⋆) and `G` perfect of amplitude `[-1,0]`, prove `h¹/h⁰(G∨)→h¹/h⁰(F∨)→h¹/h⁰(E∨)` short exact (BF Prop. 2.7, p. 22).” Add the displayed shifted triangle as a negative Check.

## R04 (P2) — Quotient closure needs a restriction on the acting stack

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:518`: “actions of a vector-bundle stack, and short exact sequences. Prove that fibre products and quotients remain cone stacks”.
**Claim:** A quotient by an arbitrary vector-bundle-stack action need not be an algebraic stack in groupoids.
**Witness:** Let `E=B𝔾_a` act trivially on the zero cone. Its homotopy quotient is `B²𝔾_a`, with `π₂=𝔾_a≠0`; a cone stack has `π₂=0`. Truncating the quotient destroys the required torsor square.
**Repair:** State quotient closure for actions of vector bundles. For vector-bundle-stack actions, require the local exact presentations of BF Prop. 1.13, p. 15, and prove the resulting quotient and torsor square from those data. Include the `B𝔾_a` action as a negative Check.

## R05 (P2) — “Develop pullback” does not specify a valid operation on obstruction theories

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:662`: “Develop pullback, external direct sum, and compatibility data given by a morphism of distinguished triangles.”
**Claim:** An absolute perfect obstruction theory does not remain an absolute obstruction theory under arbitrary pullback; the allowed morphisms and target complex must be stated.
**Witness:** Pull `0→L_pt=0` back along `𝔸¹→pt`. The resulting `0→L_𝔸¹=O·dt` induces `0→O` on `H⁰`, not an isomorphism; the original theory satisfied both conditions.
**Repair:** Specify étale pullback of absolute theories, external sums over the field, and cartesian base change of relative theories with the map to `L_{X'/Y'}`. For smooth absolute pullback require the compatible triangle of §8.1, including the relative cotangent term. Add `𝔸¹→pt` as the negative Check.

## R06 (P3) — Definitions still lack their own APIs and discriminating Checks

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:317`: “Construct `Spec_X 𝒜` … with its universal property and arbitrary base change.”
**Claim:** The three Examples bullets per layer do not supply an API list and three discriminating Checks for each definition.
**Witness:** §1.3 has no API bullets or Checks. Lines 357–359 test cones and normal cones, not relative Spec. The same omission occurs for sites, cone stacks, obstruction theories, resolutions and the virtual class.
**Repair:** Supply prose API bullets and at least three computed Checks per definition. For §1.3 use `Spec_X O=X`, `Spec_X O[t]=𝔸¹_X`, and `Spec_X(O×O)=X⊔X`. Add the dual-sensitive obstruction example `[O(1)→0 Ω_ℙ¹]`, whose virtual degree is −1, not +1. Put Scope, Conventions and per-supplier contracts in the required order.

## R07 (P3) — Most sampled targets have no exact source locator

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:535`: “construct the abelian cone stack `h¹/h⁰((E_fl)∨)`”; likewise §§1.1, 2.1, 2.3, 5.3, 6.3, 7.1, 7.4, 8.2 and 8.3.
**Claim:** The bibliography and broad section references do not identify the supporting result and page at each claim.
**Witness:** BehrendFantechi1997 line 674 states §4.4's result in Prop. 2.4, p. 20; line 1162 supplies §6.3 in Thm. 4.5, p. 35. Neither subsection gives that locator.
**Repair:** Add exact locators throughout. For the sample use BF Prop. 2.4 p. 20; Cor. 3.9/Def. 3.10 p. 29; Thm. 4.5 p. 35; Def. 5.2 pp. 38–39 and Prop. 5.3; Prop. 5.7 p. 41; Lemma 5.9 p. 42; Prop. 5.10 pp. 42–44. In §9.3 cite Prop. 7.1 for cones and Prop. 7.2(1), p. 50, for classes. For Chow groups cite Vistoli (3.1)–(3.4), pp. 632–634; for orientations (5.1), pp. 650–652 and BF §7, pp. 48–49. Give precise site and Chern-class locators too, marking unread textbook locators uncertified.

## R08 (P3) — The pinned pushforward name remains wrong

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:181`: “`TauCeti.AlgebraicGeometry.Chow.ChowGroup` and `Chow.pushforward` for closed immersions”.
**Claim:** `Chow.pushforward` is not the pinned declaration.
**Witness:** `TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211` defines `TauCeti.AlgebraicGeometry.Chow.ChowGroup.pushforward`, inside `namespace ChowGroup`, for a closed immersion between locally Noetherian schemes. No `Chow.pushforward` exists at the pin.
**Repair:** Replace the name by `TauCeti.AlgebraicGeometry.Chow.ChowGroup.pushforward`, cite that file and declaration, and retain its closed-immersion and locally Noetherian hypotheses.

## R09 (P3) — Codimension grading is still promised outside the build

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:99`: “Provide codimension notation for pure-dimensional stacks”.
**Claim:** No numbered target defines that notation or its conversion to dimension grading.
**Witness:** §2.1 at lines 372–375 builds only dimension-graded groups. For `X=ℙ¹`, codimension 1 must be `A₀(X)`, whereas unchanged indexing would give `A₁(X)`.
**Repair:** Add to §2.1: “For `X` pure of dimension `d`, define `A^c(X)_ℚ=A_{d−c}(X)_ℚ`, for integer `c`, and prove the regrading laws.” Check the point class on `ℙ¹` has codimension 1 and dimension 0.

## R10 (P3) — Process wording remains in the supplier inventory

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:173`: “They do not yet form the conormal algebra, relative normal cone, blowup, or deformation-to-the-normal-cone API.”
**Claim:** “Yet” describes anticipated progress rather than the mathematical ownership boundary.
**Witness:** The roadmap's §1.5 consumes the scheme normal-cone and deformation API from SchemeAndStackFoundations §5.5; the missing stack extension is the actual target here.
**Repair:** Write: “Consume the scheme normal-cone, blowup and deformation APIs from their named suppliers; §1.5 constructs the algebraic-space and stack extensions.” Keep library inventories and deferrals under Scope and ownership.

## R11 (P3) — The Lean file omits the required namespace

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/Suggested.lean:17`: the file ends immediately after its module docstring.
**Claim:** The no-declaration form is justified, but the required `TauCetiRoadmap.VirtualFundamentalClass` namespace is absent.
**Witness:** All 17 lines contain only `import Mathlib` and the docstring; there is no `namespace` or `end` command.
**Repair:** Append `namespace TauCetiRoadmap.VirtualFundamentalClass` and its matching `end TauCetiRoadmap.VirtualFundamentalClass`. Keep the file free of substitute theorems and data definitions.

## R12 (P3) — The description omits new-folder status and the class hypotheses

**Location:** PR description: “Specify the intrinsic normal cone, perfect obstruction theories, and the Behrend–Fantechi virtual fundamental class.”
**Claim:** The description does not expressly say that it adds a roadmap, or disclose the global-resolution and resolution-property scope of its class-construction target.
**Witness:** The base contains no VirtualFundamentalClass folder; the change adds 988 lines. `TauCetiRoadmap/VirtualFundamentalClass/README.md:52–55` requires a global resolution, constant virtual rank and the resolution property.
**Repair:** Write: “Add the VirtualFundamentalClass roadmap. Its Chow-valued class is constructed for separated finite-type Deligne–Mumford stacks with the resolution property and a globally resolved perfect obstruction theory of constant virtual rank.” Retain the description's DerivedDeRhamCohomology dependency and pure-dimensional relative-base scope.

## R13 (P3) — The repeated Needs lines omit actual inputs

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:340`: “*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.”
**Claim:** This dependency list omits the scheme normal cones and deformation explicitly imported by §1.5, and repeats the list for unrelated targets.
**Witness:** Lines 335–336 consume SchemeAndStackFoundations §5.5, but neither this Needs line nor Layer 1's Dependencies at line 363 names it. §1.5 also uses §1.3's relative spectrum.
**Repair:** Give each subsection its actual inputs: for §1.5 list §§1.1–1.4 and SchemeAndStackFoundations §5.5; include that supplier in Layer 1's Dependencies. Likewise record §2.1 before Chow operations, §§7.1–7.3 before public evaluation, and the separate statement/route inputs of each remaining target.

## Verified sound

Previous-review dispositions at this head:

| Previous finding | Head passage | Disposition |
|---|---|---|
| R01 | TauCetiRoadmap/VirtualFundamentalClass/README.md:220, “this roadmap supplies the rational Chow groups”; merge positions 24, 319, 403 | Repaired by the earlier-owner alternative: this roadmap precedes both consumers; the later board package must consume this core. |
| R02 | TauCetiRoadmap/VirtualFundamentalClass/README.md:461, “For a morphism of relative Deligne–Mumford type to an algebraic stack”; :407, “Build the rational bivariant groups” | Repaired for the requested relative objects; the additional absolute transitivity prerequisite is R02. |
| R03 | TauCetiRoadmap/VirtualFundamentalClass/README.md:833, “For `Y` pure of dimension `d`” | Repaired. |
| R04 | TauCetiRoadmap/VirtualFundamentalClass/README.md:717, “with the resolution property”; :719, “Resolve the roof … and truncate” | Repaired as a target under the added hypothesis. |
| R05 | TauCetiRoadmap/VirtualFundamentalClass/README.md:58, “pure-dimensional local complete intersection with the resolution and class hypotheses” | Repaired. |
| R06 | TauCetiRoadmap/VirtualFundamentalClass/README.md:606, “Layer 8’s Vistoli comparison” | Not repaired; R01. |
| R07 | TauCetiRoadmap/VirtualFundamentalClass/README.md:203, “DerivedDeRhamCohomology §5.8 … supplies the scheme cotangent complex” | Repaired. |
| R08 | TauCetiRoadmap/VirtualFundamentalClass/README.md:3, “Summary”; numbered subsections and per-layer Examples/Dependencies | Partly repaired; per-definition APIs/Checks and required section order remain, R06. |
| R09 | TauCetiRoadmap/VirtualFundamentalClass/README.md:596, “Thm. 3.11 and Props. 3.12–3.13”; :475, “Tor amplitude `[-1,0]` (…08SL)” | Partly repaired: several locators added and the unsupported converse removed; R07 remains. |
| R10 | TauCetiRoadmap/VirtualFundamentalClass/README.md:24, “Stack/”; :26, “Chow/”; :181, “Chow.pushforward” | Partly repaired: directory names fixed, declaration name still wrong, R08. |
| R11 | TauCetiRoadmap/VirtualFundamentalClass/Suggested.lean:9, “Theorem 3.11 requires …”; :13, “Propositions 5.5–5.10 require …” | Repaired: missing carriers named, catalogue deleted. |
| R12 | TauCetiRoadmap/VirtualFundamentalClass/README.md:99, “Provide codimension notation”; :173, “do not yet form” | Partly repaired: scheduling text deleted; R09 and R10 remain. |
| R13 | PR description `depends-on` block names “#868 DerivedDeRhamCohomology” | Repaired. |

Computed adversarial cases (`0` denotes the terminal zero cone stack where appropriate):

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| §0.1 shared carriers | `pt`, `B(C₂)`, `B(S₃)` | Stabilizers `1`, `C₂`, `S₃` | Groupoid automorphisms `1`, `C₂`, `S₃` | Retains nonabelian stabilizers. |
| §0.2 dimension | Atlas `𝔸¹→pt`; empty stack | `1−1=0`; `−∞` | `dim pt=0`; `dim ∅=−∞` | Atlas correction agrees. |
| §0.3 quotient dimension | `B𝔾_m`; `Bμ₂` in characteristic 2 | `0−1=−1`; `0−0=0` | Dimensions `−1`, `0` | Nonsmooth group retained; second stack is not DM. |
| §1.1 sites, sampled | `Spec k`, quasi-coherent rank-two module; `BG_m` | Atlas module `k²`; weight-one representation | Same `k²`; same weight-one descent datum | Comparisons must preserve descent; exact locator R07. |
| §1.2 locally free descent | Rank 0, rank 1; sign representation of `C₂`, char≠2 | Dual ranks `0,1`; sign character `−1` | Double dual ranks `0,1`; sign character `−1` | Forgetting descent gives wrong trivial character. |
| §1.3 relative Spec | Algebras `k`, `k[t]`, `k×k` | `pt`, `𝔸¹`, two points | Functor points: one, elements, idempotents | Correct universal-property instances; R06, R13. |
| §1.4 cones and hulls | `k[a,b]/ab`, `k×k`, `Sym(k^(ℕ))` | Hull `𝔸²`; degree zero `k²`; infinite degree-one rank | First has coherent degree-one part; others fail cone axioms | Conventions exclude the wrong carriers. |
| §1.5 normal cones | Origin in node; regular divisor in `𝔸¹` | `k[a,b]/ab`; `k[t]` | Normal sheaves `k[a,b]`; `k[t]` | Strict inclusion versus equality; supplier edge R13. |
| §1.6 smooth ambient comparison | `pt⊂𝔸¹⊂𝔸²`, projection to first coordinate | Normal coordinates `k²`, extra action `k` | Quotient `k²/k=k` | Ranks `2−1=1`. |
| §2.1 Chow groups, sampled | `B(C₂)`, `B(S₃)`, `∅` | `A₀=ℚ,ℚ,0`; degrees `1/2,1/6,0` | Stabilizer weights `1/2,1/6`; empty cycle 0 | Earlier owner at merge position 24; locators R07. |
| §2.2 Chow operations | `Spec ℂ→Spec ℝ`; projection `𝔸¹→pt` | Pushforward `2[pt]`; pullback `[𝔸¹]` | Residue degree 2; dimension shift +1 | Residue and grading tests agree. |
| §2.3 homotopy/Chern, sampled | `O`, `O(1)`, `O(−1)` on `ℙ¹` | Self-intersections `0,[pt],−[pt]` | Top Chern classes `0,[pt],−[pt]` | Sign and zero bundle distinguished; R07. |
| §2.4 refined Gysin | `0⊂𝔸¹`; its self-base-change | `i![𝔸¹]=[pt]`; self-intersection 0 | Normal line gives inverse pullback; `c₁(k)=0` | Includes non-Tor-independent square. |
| §2.5 bivariant orientations, sampled | Identity; regular `pt⊂𝔸¹`; smooth `pt→B𝔾_m` | Degree shifts `0,−1,+1` | Orientation degrees `0,1,−1` | Target Artin base retained; R07. |
| §2.5 canonical rational equivalence | Two transverse coordinate divisors in `𝔸²` | Both iterated cones are `𝔸²` | Difference of cycles 0 | Equivalence has boundary 0 in this test. |
| §3.1 derived site operations, sampled | `Spec 𝔽₂→Spec ℤ`, maps `x,x+2` | Pulled-back smooth-site equalizer is empty | Equalizer after reduction is `𝔸¹_𝔽₂` | Correctly excludes arbitrary lisse-étale topos pullback. |
| §3.1 tensor comparison | Dual numbers `A`, module `k=A/(ε)` | `Tor_i^A(k,k)=k` for every `i≥0` | Ordinary tensor only `k` in degree 0 | Derived operations cannot be replaced by ordinary tensor. |
| §3.2 perfectness/resolutions | `[k→0 k²]`; acyclic `[k→id k]` | Virtual ranks `2−1=1`, `1−1=0` | Dual cone-stack dimensions `−1`, `0` | Rank signs agree. |
| §3.3 relative cotangent | `pt→B𝔾_m`; identity | Relative complexes `k[0]`, `0` | Absolute base complex `k[−1]`, with `H¹=k` | Relative example works; absolute input missing, R02. |
| §3.4 local presentation | `k[x]/x²`, characteristics 2 and 3 | Differential `2x`: zero in char 2, rank one over `k` in char 3 | `H⁰,H⁻¹`: both `A` in char 2, both length 1 in char 3 | Same two-term model, amplitude `[-1,0]`. |
| §3.5 square-zero lifting | `g:Spec k[ε]/ε²→Spec k[x]/x²`, `x↦ε`; extension to `k[ε]/ε³` | Every candidate square is `ε²≠0` | Obstruction is generator of `J=(ε²)` | No lift; split extension has obstruction 0. |
| §4.1 quotient presentations | `[k/k]`, identity action map; zero action map | Identity case: one isomorphism class, trivial stabilizer | Zero case: objects `k`, stabilizer `k` | Presentation criterion distinguishes equivalence from equal ranks. |
| §4.2 cone stacks/exactness | Split sequence `𝔸¹→𝔸²→𝔸¹` | Kernel `𝔸¹`; dimensions `1,2,1` | `2=1+1` | Split exactness works; unrestricted quotients fail, R04. |
| §4.2 unrestricted quotient | Trivial action of `B𝔾_a` on `pt` | Quotient `B²𝔾_a`, with `π₂=𝔾_a` | Cone stacks have `π₂=0` | Counterexample; R04. |
| §4.3 Picard stack | Complexes `[k→id k]`, `[k→0 k]`, `k[2]` | `0`; `𝔸¹×B𝔾_a`; truncation 0 | `(π₀,π₁)=(0,0),(k,k),(0,0)` | Derived construction forgets out-of-range degrees, as intended. |
| §4.4 abelian cone stack, sampled | `E=k[1]`, `E=k[2]`, `E=k^(ℕ)[1]` | `𝔸¹`, `0`, incoherent `H⁻¹` | First amplitude `[-1,0]`; second truncation 0; third excluded | Coherence and truncation distinguish cases; R07. |
| §4.5 morphism criteria | `k[1]→0`; `0→k[1]` | Dual maps `pt→𝔸¹`; `𝔸¹→pt` | `H⁻¹`: surjection `k→0`; nonsurjection `0→k` | First closed immersion, second not. |
| §4.5 triangles | `k[1]→0→k[2]` | Dual stack sequence `0→0→𝔸¹` | Last map misses 1; perfect third term has amplitude `[-2,-2]` | Counterexample; R03. |
| §5.1 intrinsic normal sheaf | `pt⊂𝔸¹`; smooth `𝔸¹` | `[k/k]` with identity differential; `B O` | `𝔑_pt=0`; `𝔑_𝔸¹=B T_𝔸¹` | Ambient tangent action is essential. |
| §5.2 refinements | Add one smooth ambient coordinate | Cone rank rises `r→r+1` | Quotient by extra rank-one tangent removes 1 | Presentations agree. |
| §5.3 intrinsic cone, sampled | `pt` embedded in `𝔸¹` and `𝔸²` | `[k/k]=0`; `[k²/k²]=0` | Intrinsic cone `pt`, dimension 0 | Both presentations agree; R07. |
| §5.4 dimension/lci | Dual numbers; `k[x,y]/(x²,xy)` | First cone is normal line; second has `C=N` | First lci; second conormal ranks 2 at origin, 1 generically | Equality alone does not characterize lci. |
| §5.4 products | Smooth `𝔸¹×𝔸¹` | `B(O⊕O)` over `𝔸²`, total dimension 0 | `B O×B O`, total dimension `0+0` | Product convention agrees. |
| §5.5 smooth transitivity | `𝔸¹→pt` | `B O→B O→0` | Kernel `B O`; relative dimension −1 | Correct smooth sequence; cyclic route R01. |
| §5.5 lci negative Check | `Y=V(xy,xz,yz)`, `X=V(x+y+z)`, `k=ℚ` | `dim 𝔠_X=0`; `dim f*𝔠_Y=3−3=0` | Normal line would force `0=1+0` | Nonexact cone sequence confirmed. |
| §6.1 obstruction theories, sampled | `pt`, `E=k[1]→0`; `E=k[0]→0` | `H⁰`: `0→0` iso versus `k→0` not iso | Cone maps `pt→𝔸¹` closed versus `pt→B𝔾_a` not closed immersion | Both directions of criterion separated. |
| §6.2 obstruction cone | `pt` with obstruction space `k` | Image is `{0}⊂𝔸¹`, dimension 0 | Intrinsic cone is `pt`, dimension 0 | Zero image is correct here, not whole obstruction bundle. |
| §6.3 lifting, sampled | `X=𝔸¹`, split thickening of `pt` by `k` | Obstruction 0; lifts `x↦aε`, `a∈k` | `Ext⁰(k,k)=k` acts simply transitively | Torsor is not a unique lift; R07. |
| §6.4 perfect theories | Pullback `𝔸¹→pt` of zero absolute theory | Pulled complex 0, `H⁰=0` | Required `H⁰(L_𝔸¹)=O` | Pullback needs qualification, R05. |
| §6.4 external sum | Point theories `k[1]` and `k²[1]` | Sum rank `−3`; obstruction rank 3 | Ranks `−1+(−2)=−3` | Product theory agrees. |
| §6.5 global resolutions | Pullback `[O→id O]`; direct sum of two such complexes | All cohomology 0; ranks `1−1=0`, `2−2=0` | Resolutions of zero, with actual global bundles | Existence preserved in these operations. |
| §6.6 curvilinear obstructions | `x↦ε` for `X=V(x²)` over `k`, extension `ε³=0` | Obstruction `ε²`, coefficient 1 | Fibre cone is the full normal line | Nonzero curvilinear obstruction detected. |
| §7.1 resolved cone, sampled | Smooth `𝔸¹`, canonical `E=Ω` | `F₁=0`, `F₀=O`, resolved cone `𝔸¹` | Pullback of `B O` along zero presentation gives `𝔸¹` | Resolved cone dimension 1; R07. |
| §7.2 zero-section formula | `X=V(x²)⊂𝔸¹`, char 2 and 3 | `rank F₀=rank F₁=1`; cone multiplicity 2 | Class `2[pt]` in `A₀`, both characteristics | Differential change does not change multiplicity. |
| §7.3 independence | Add `[k→id k]` to zero theory on point | Resolved cone becomes `𝔸¹⊂𝔸¹`; Gysin gives `[pt]` | Original class `[pt]` | Choice change preserves class. |
| §7.3 common roof | `ℙ¹`, `[O(−2)→0 O]`, derived automorphism `id+ε` | `Ext¹(O,O(−2))=k` | Chain-map cross component 0; roof permits the nonzero class | Added resolution-property route addresses previous finding. |
| §7.4 public construction, sampled | Previous two presentations of point | Evaluation with zero resolution `[pt]` | Evaluation after acyclic addition `[pt]` | Choice-independent value 1; R07. |
| §7.5 no obstructions | Smooth point, `E=0` | `H⁻¹=0`, virtual rank 0; class `[pt]` | Ordinary class `[pt]`, degree 1 | Positive case; source sign misprint recorded below. |
| §7.5 obstruction formula | `ℙ¹`, `[O(1)→0 Ω]`; point with `k^r[1]`, `r=0,1,2` | Classes `−[pt]`; point classes `[pt],0,0` | `c₁(O(−1))`; `c_r(k^r)` | Dual-sensitive values; add Check under R06. |
| §7.6 lci/product, sampled | Dual numbers times dual numbers; `pt⊔𝔸¹` | Product length 4, virtual rank 0; disconnected ranks 0 and 1 | `2·2=4`; no constant rank on disconnected example | Product works; non-pure example excluded. |
| §7.7 degree | `Spec ℂ/ℝ`; dual numbers; `B(S₃)` | Degrees `2,2,1/6` | Length×residue degree `1·2,2·1`; stabilizer weight `1/6` | Proper degree normalization agrees. |
| §8.1 compatibility | Smooth square `𝔸¹→pt`, canonical theories | Triangle `0→O→O→0` | Dual exact sequence `B O→B O→0` | Relative cotangent term cannot be omitted. |
| §8.2 smooth pullback, sampled | Same square | Pullback `[pt]↦[𝔸¹]`; intrinsic cone `B O` | Canonical virtual class `[𝔸¹]`; naive cone pullback is zero section | Classes agree; cones need compatible diagram, not literal equality. |
| §8.3 regular pullback, sampled | `pt⊂𝔸¹`, canonical obstruction theories | `i![𝔸¹]=[pt]` | Virtual class of point `[pt]` | Codimension −1 shift agrees; R07. |
| §8.4 functoriality | Map `𝔸¹→𝔸¹`, `t↦t²` | Graph codimension 1, projection relative dimension 1 | Net Gysin shift 0, pullback `[𝔸¹]=[𝔸¹]` | Factorization agrees. |
| §8.5 coherence | `𝔸²→𝔸¹→pt` | Successive pullback `[pt]↦[𝔸¹]↦[𝔸²]` | Composite gives `[𝔸²]`, shift 2 | Composition holds in split test. |
| §9.1 relative cone | `pt→B𝔾_m`; identity of node `Y=V(xy)` | Cone `B𝔾_a`, dimension −1; cone `Y`, dimension 1 | Base dimensions `−1,1` | Pure singular base included. |
| §9.2 relative class | `pt→B𝔾_m`, `E=L=k`; `id_Y`, `E=0` | Degree `−1+1=0`, class `[pt]`; degree `1+0=1`, class `[Y]` | Point class; sum of node's two axes | Relative grading agrees. |
| §9.3 base change, sampled | `pt⊂𝔸¹`, base change to `pt`; field extension `k→K` | Identity cone `pt→𝔸¹` closed, not iso | Flat extension normal cone `𝔸¹_K→𝔸¹_K` iso | General closed immersion and flat equivalence separated. |
| §9.3 flat virtual class | Dual numbers after `k→K` | `[Spec K[ε]/ε²]vir=2[pt_K]` | Flat pullback of `2[pt_k]` is `2[pt_K]` | Formula holds; class locator is Prop. 7.2(1), R07. |
| §9.4 regular base change/formulas | Identity family over `𝔸¹`, restrict to origin | `[𝔸¹]↦[pt]` | Relative zero theory on fibre gives `[pt]` | Smooth-base Gysin case agrees. |
| §9.4 products | Relative identities on two lines | Class `[𝔸²]`, index 2 | `[𝔸¹]×[𝔸¹]`, index `1+1` | Product grading agrees. |
| §9.5 relative functoriality | Common base `pt`; identity compatible square | Relative class `2[pt]` for dual numbers | Absolute class `2[pt]`; identity Gysin preserves it | Absolute recovery agrees. |
| §9.6 smooth-stack fibre | `V=W=𝔸²`, `X=Y=V(xy)`, `h=id` | `j*L_{V/W}=0`, class `[axis_x]+[axis_y]` | `0^![N_{Y/𝔸²}]=[Y]` | Example works over singular pure base. |
| Headline 1: intrinsic cone | Smooth `𝔸²`; dual numbers | Cone dimensions `2−2=0`, `1−1=0` | Both target dimension 0; hulls are intrinsic normal sheaves | No pinned DM/cone-stack carrier. |
| Headline 2: obstruction criterion | Point with `k[1]`, point with `k[0]` | Cohomological condition true, false | Closed-immersion condition true, false | No pinned geometric obstruction-theory carrier. |
| Headline 3: VFC/independence | Double point, and an acyclic summand | Both resolution calculations give `2[pt]` | Same intrinsic class in `A₀` | No pinned stack Chow/Gysin carrier. |
| Headline 4: basic formulas | Point ranks `r=0,1`; double-point product | Classes `[pt],0`; product degree 4 | Top Chern classes `[pt],0`; `2·2=4` | Scope corrected; pullback specification R05. |
| Headline 5: relative theory | `pt→B𝔾_m`; singular identity base | Dimensions `−1+1=0`, `1+0=1` | Classes `[pt]`, `[axis_x]+[axis_y]` | Relative target exists in prose; R02. |
| Headline 6: public evaluation | Point, zero versus acyclic resolution | Chosen evaluation 1 | Alternate evaluation 1 | No statable replacement at pins. |
| Codimension convention | Point class on `ℙ¹` | Dimension index 0 | Codimension `1−0=1` | Definition missing from targets, R09. |
| Pinned carrier conventions | `SchPseudofunctor`; `Spaces.IsAlgebraicSpace` | Category-valued presheaf; fppf sheaf with representable diagonal and étale atlas | First need not be a groupoid/stack; second has no separation axiom | Roadmap supplies extra stack and separation assumptions. |
| Namespace and padding | Suggested.lean | 0 declarations; 0 namespaces | Required namespace count 1; eligible padding probes 0 | R11; no missing statable headline found. |
| PR scope | Base versus head | Base folder absent; 988 added lines | Prose does not expressly identify addition or class hypotheses | R12. |

- Source sample: 15/15 targets examined; 0 README locators flagged unverified; 33 recorded result-locator groups opened across BF, Vistoli and Stacks; missing claim-level citations are R07.
- Source witnesses: BehrendFantechi1997 lines 674, 725, 733, 969, 983, 1010, 1040, 1139, 1162, 1282, 1299, 1353, 1366, 1397, 1428, 1618, 1676, 1682, 1734, 1740; Vistoli1989 lines 892, 960, 989, 1096, 1423, 1471, 1550, 1671; Stacks 07BF line 2253, 0GR1 line 1333, 08SL line 1303, 0AFR line 1421, 08MZ line 296.
- Pinned declarations opened: 9, including `SchPseudofunctor` (`TauCeti/AlgebraicGeometry/Stack/Basic.lean:37`), `Spaces.IsAlgebraicSpace` (`TauCeti/AlgebraicGeometry/AlgebraicSpace/Basic.lean:195`), `ChowGroup` (`TauCeti/AlgebraicGeometry/Chow/Basic.lean:295`), its pushforward (`TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211`), `SchemeWeilDivisor.toAlgebraicCycle` (`TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/Basic.lean:75`), `Pseudofunctor.IsStack` (`Mathlib/CategoryTheory/Sites/Descent/IsStack.lean:49`), `reesAlgebra` (`Mathlib/RingTheory/ReesAlgebra.lean:40`), and the native cotangent differential and first homology (`Mathlib/RingTheory/Extension/Cotangent/Basic.lean:61`, :333).
- Supplier audit: 6 named supplier roadmaps resolved on main or the supplied open revision; 10 explicit section/label groups inspected, including AlgebraicVectorBundles' old-label map and DerivedDeRhamCohomology §5.8 at #868.
- Ownership audit: 2 object searches across main/open work, 1 later board package overlaps (the earlier-owner repair assigns this core here); 5 closest-open-PR leads examined; no conflicting edit, dropped cited id, revision-only id or duplicate Lean declaration identified.
- Dependency command output: `depcheck: 232 roadmaps, 2073 edges, 0 problem(s)`; 0 UPWARD/CYCLE/moved lines. This roadmap is at position 24, after DerivedDeRhamCohomology; the internal layer cycle is R01.
- Worker gate: all 29 reported check fields are 0, including `build=0`, result `OK`; independent `lake env lean` exit 0, no warnings; 0 declarations for mechanical signature comparison and one-tactic probes.
- Repository checks: head `b7256a8b156190ab5e04eb3483c7bcab140a090f`; 0 changes outside the folder; worktree remains clean; 53 numbered targets and 6 headline goals covered above.

## Not verifiable

- Fulton1998, *Intersection Theory*, 2nd ed., Chapters 1–6: title search found no legal text; DOI 10.1007/978-1-4612-1700-8 resolves only to a paywalled publisher; uncertified.
- IllusieI, *Complexe cotangent et déformations I*, III Cor. 3.1.3: DOI 10.1007/BFb0059052 resolves only to a paywalled publisher; uncertified; BF's citation is not direct verification.
- IllusieII, *Complexe cotangent et déformations II*: title/LNM 283 search resolves only to a paywalled publisher; uncertified.
- LaumonMoretBailly2000, *Champs algébriques*: title search resolves only to a paywalled publisher; uncertified; no precise locator is supplied in the README.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says equality of intrinsic cone and normal sheaf characterizes local complete intersections; it should retain the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has equality without being lci; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.14, p. 31: the source says the intrinsic-cone sequence is exact for every lci morphism; it should assert that sequence for smooth morphisms, since the Cartier section of the three coordinate axes contradicts lci exactness; affects a stated result.
- **Gap** in BehrendFantechi1997 at Proposition 5.3, p. 39: the source says derived resolution isomorphisms may be treated as chain maps without loss of generality; it should justify a common global comparison, for example through the resolution-property roof construction; affects the proof.
- **Misprint** in BehrendFantechi1997 at Proposition 5.5, p. 40: the source says vanishing of degree-one cohomology of the obstruction complex suffices; it should say degree-minus-one cohomology; affects a stated result.
- **Misprint** in BehrendFantechi1997 at Example 7.6, p. 52: the source says the final zero section belongs to the normal bundle indexed by `Y/X`; it should use `Y/W`; affects nothing.
- **Misprint** in Vistoli1989 at §5, product operation following Definition (5.1), p. 651: the source says the product for `F→G→H` belongs to the bivariant group for `F→G`; it should belong to the group for `F→H`; affects nothing.
- **Misprint** in BehrendFantechi1997 at proof of Lemma 4.6, p. 37: the source says the universal obstruction yields a map from `I/mI` into the obstruction space; it should use the dual of `I/mI` as the domain; affects the proof.
