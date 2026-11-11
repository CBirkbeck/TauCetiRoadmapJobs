# Review of VirtualFundamentalClass (pull request #1996 at 676f128)

**Verdict:** needs changes

## R01 (P1) — The Artin-base transitivity triangle uses an unconstructed object

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:488`: “Prove functoriality and transitivity, including the triangle `f*L_Y → L_X → L_{X/Y} →`”, stated at line 484 for “a morphism of relative Deligne–Mumford type to an algebraic stack”.
**Claim:** For an Artin base `Y` no target constructs the absolute `L_Y`. §3.3 builds only the relative complexes of morphisms of relative DM type.
**Witness:** For `f : pt → B𝔾_m`: `f*L_{B𝔾_m} = k[−1]` with `H¹ = k`, `L_pt = 0` and `L_{pt/B𝔾_m} = k`. DerivedDeRhamCohomology §5.8 supplies only the scheme cotangent complex.
**Repair:** Add the cotangent complex of arbitrary morphisms of the locally finite-type algebraic stacks in scope, with smooth-presentation descent and transitivity. Restrict the positive-degree vanishing to morphisms of relative DM type. Add the triangle `k[−1] → 0 → k → k` as a Check.

## R02 (P2) — Perfectness alone does not give the cone-stack exact sequence

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:579`: “Turn a distinguished triangle with perfect third term into a short exact sequence of abelian cone stacks.”
**Claim:** The third term must be perfect of amplitude `[-1,0]`. The new lci sentence in §5.5 now relies on this step.
**Witness:** Take `k[1] → 0 → k[2]`. The first two terms satisfy (⋆) and the third is perfect, but the induced sequence `0 → 0 → 𝔸¹` is not surjective. BehrendFantechi1997 line 735 (Prop. 2.7, p. 22) imposes `[−1,0]`.
**Repair:** “For a distinguished triangle `E→F→G→E[1]` with `E,F` satisfying (⋆) and `G` perfect of amplitude `[-1,0]`, prove `h¹/h⁰(G∨)→h¹/h⁰(F∨)→h¹/h⁰(E∨)` short exact (Behrend–Fantechi Prop. 2.7, p. 22).” Add the shifted triangle as a negative Check.

## R03 (P2) — Quotient closure needs a restriction on the acting stack

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:541`: “actions of a vector-bundle stack, and short exact sequences. Prove that fibre products and quotients remain cone stacks”.
**Claim:** The quotient by an arbitrary vector-bundle-stack action need not be a stack in groupoids.
**Witness:** Let `B𝔾_a` act trivially on the zero cone over `pt`. The quotient is `B²𝔾_a`, with `π₂ = 𝔾_a ≠ 0`, but a cone stack has `π₂ = 0`.
**Repair:** State quotient closure for actions of vector bundles. For vector-bundle-stack actions, require the local exact presentations of Behrend–Fantechi Prop. 1.13, p. 15. Add the trivial `B𝔾_a` action as a negative Check.

## R04 (P2) — “Develop pullback” does not specify a valid operation on obstruction theories

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:715`: “Develop pullback, external direct sum, and compatibility data given by a morphism of distinguished triangles.”
**Claim:** An absolute obstruction theory does not pull back to an obstruction theory along an arbitrary morphism.
**Witness:** Pulling `0 → L_pt = 0` back along `𝔸¹ → pt` gives `0 → L_𝔸¹ = 𝒪·dt`, which induces `0 → 𝒪` on `H⁰`. That map is not an isomorphism.
**Repair:** Specify étale pullback of absolute theories, external sums over the field, and cartesian base change of relative theories with their map to `L_{X'/Y'}`. For smooth absolute pullback, require §8.1's compatible triangle. Add `𝔸¹ → pt` as a negative Check.

## R05 (P2) — The lci normal-sheaf sequence rests on a relative perfectness that no target states

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:652`: “For a local complete intersection morphism, apply the transitivity triangle and Layer 4 to obtain the exact sequence of abelian cone stacks `h¹/h⁰((L_{X/Y})∨) → 𝔑_X → f*𝔑_Y`. Construct the natural cone maps in cartesian squares.”
**Claim:** This step needs `L_{X/Y}` perfect of amplitude `[-1,0]` for lci `f`, but §3.4 (line 498) states that only for the absolute `L_X`. The *Needs:* line omits Layer 3, and the cone maps are given no source or target.
**Witness:** BehrendFantechi1997 line 1047 (proof of Prop. 3.14, p. 31) uses exactly this amplitude. DerivedDeRhamCohomology §0.20, at its open head, proves it only for ring maps.
**Repair:** In §3.4 add: “For a local complete intersection morphism `f : X → Y` of Deligne–Mumford stacks, prove `L_{X/Y}` perfect of Tor amplitude `[-1,0]`, étale-locally from DerivedDeRhamCohomology §0.20 (Stacks Project, Tag 08SL).” In §5.5 add the locator “(Behrend–Fantechi, proof of Prop. 3.14, p. 31; Prop. 2.7, p. 22)” and add §§3.3–3.4 to *Needs:*. Give each cone map its source and target, for example `C_{X'/Y'} → u*C_{X/Y}` (p. 23).

## R06 (P3) — §8.3 constructs a second copy of the rational equivalence that §2.5 owns

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:851`: “use deformation to the normal cone to construct Vistoli's canonical rational equivalence. Descend it through the tangent and vector-bundle actions”.
**Claim:** The sentence moved here from §5.5 builds an object that §2.5 already constructs, together with its smooth base change and its tangent-action invariance.
**Witness:** Line 430 reads “Construct Vistoli's canonical rational equivalence comparing normal cones after regular-immersion base change”. BehrendFantechi1997 lines 823–891 (pp. 24–26, Props. 3.3–3.5) cover exactly §2.5's content.
**Repair:** “For a regular local immersion between smooth bases, apply §2.5's canonical rational equivalence and its invariance, descend it through the tangent and vector-bundle actions, and lift it to the global resolutions to prove the refined Gysin formula (Behrend–Fantechi Prop. 5.10(2), pp. 42–44).”

## R07 (P3) — The new cap-action target comes before the classes it uses

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:398`: “Construct the cap action by operational Chow classes and prove the projection formula for proper pushforward, including the first-Chern-class case”.
**Claim:** Operational classes are defined in §2.5 and `c₁` in §2.3, both later in the layer. The *Needs:* line names neither, and the sentence has no locator.
**Witness:** Line 424 reads “Build the rational bivariant groups” and line 407 reads “Descend the supplier's Chern classes”. Vistoli1989 line 1550 (Def. (5.1), pp. 650–651) defines the bivariant classes involved.
**Repair:** Move the sentence to the end of §2.5 as: “For proper `f : X → Y` of separated Deligne–Mumford stacks, `c` operational on `Y` and `α ∈ A_*(X)_ℚ`, prove `f_*(f^*c ∩ α) = c ∩ f_*α`, in particular for `c = c₁(L)` (Vistoli (5.1), pp. 650–651).”

## R08 (P3) — Definitions still lack APIs and computed Checks

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:325`: “Construct `Spec_X 𝒜` for a quasi-coherent algebra on an algebraic space or stack, with its universal property and arbitrary base change.”
**Claim:** Checks were added to nine subsections, but §§1.1–1.3, 1.5, 2.1, 4.1, 4.4, 6.2, 6.4, 6.5, 7.1, 9.1 and 9.2 have none. No definition has API bullets, and three of the added Checks compute nothing.
**Witness:** The dual-numbers and plane Checks of §5.1 (lines 613–614) state no value, and the third Check of §4.3 (line 566) restates line 556. Scope and ownership (line 213) still comes after the supplier contracts (line 139).
**Repair:** Add prose API bullets and three computed Checks for each definition. For §1.3: `Spec_X 𝒪 = X`, `Spec_X 𝒪[t] = 𝔸¹_X` and `Spec_X(𝒪×𝒪) = X ⊔ X`. Replace line 613 with “the tangent action on the normal line is multiplication by `2x`, trivial in characteristic 2”. Replace line 614 with “`I/I²` has rank 2 at the origin and 1 generically, so `𝔑_X` is no vector-bundle stack”. Replace line 566 with “`k[2]` gives the zero stack”. Place Scope and ownership before Conventions.

## R09 (P3) — Most claims still have no exact source locator

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:570`: “construct the abelian cone stack `h¹/h⁰((E_fl)∨)`”. The same gap occurs in §§1.4, 2.1, 5.1, 5.3, 6.3, 7.1 and 8.3, and in the new lci sentence of §5.5.
**Claim:** The bibliography and the broad section references do not identify the result and page that support each claim.
**Witness:** BehrendFantechi1997 line 674 states the result as Prop. 2.4, p. 20, and line 1162 gives §6.3 as Thm. 4.5, p. 35. Vistoli1989 lines 892–960 give (3.1)–(3.4), pp. 632–634.
**Repair:** Add these locators. Behrend–Fantechi: §1, p. 5 (§1.4); Def. 3.6, p. 27, with the presentation on p. 28 (§5.1); Cor. 3.9 and Def. 3.10, p. 29 (§5.3); Prop. 2.4, p. 20 (§4.4); Thm. 4.5, p. 35 (§6.3); Def. 5.2, p. 38 (§7.1); Prop. 5.10, pp. 42–44 (§8.3). Vistoli: (3.1)–(3.4), pp. 632–634, and p. 620 for `deg BG` (§2.1).

## R10 (P3) — *Needs:* lines omit actual inputs

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:354`: “*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.” (§1.5)
**Claim:** §1.5 imports SchemeAndStackFoundations §5.5 and uses §1.3, but neither its *Needs:* line nor Layer 1's Dependencies names them. §3.3 now cites SchemeAndStackFoundations §1.10, which its *Needs:* line (491) omits.
**Witness:** Line 349 reads “Import scheme normal cones and deformation to the normal cone from `SchemeAndStackFoundations` §5.5”. Line 484 reads “small étale site of SchemeAndStackFoundations §1.10”.
**Repair:** Set §1.5's line to “*Needs:* §§1.1–1.4 and SchemeAndStackFoundations §5.5”. Add SchemeAndStackFoundations §5.5 to Layer 1's Dependencies and §1.10 to §3.3's *Needs:*. Give every other subsection its own inputs.

## R11 (P3) — The Lean file omits the required namespace

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/Suggested.lean:17`: the file ends immediately after its module docstring.
**Claim:** The file states nothing, which is justified, but the required `TauCetiRoadmap.VirtualFundamentalClass` namespace is still missing.
**Witness:** The file has 17 lines and no `namespace` command. On main, `CFSGStatement/Suggested.lean` and `DiagrammaticCoherence/Suggested.lean` also state no theorem, and each opens its namespace.
**Repair:** Append `namespace TauCetiRoadmap.VirtualFundamentalClass` followed by `end TauCetiRoadmap.VirtualFundamentalClass`.

## R12 (P3) — The description omits that it adds a roadmap and the class hypotheses

**Location:** Pull-request description: “Specify the intrinsic normal cone, perfect obstruction theories, and the Behrend–Fantechi virtual fundamental class.”
**Claim:** The description does not say that the pull request adds a roadmap, or that the class construction assumes the resolution property and a global resolution.
**Witness:** The base has no VirtualFundamentalClass folder, and the change adds 1047 lines. `README.md:52–54`: “If `X` is separated, `φ` is perfect of constant rank `n`, and `X` has the resolution property and `E` a global resolution”.
**Repair:** “Add the VirtualFundamentalClass roadmap. Its Chow-valued class is constructed for separated finite-type Deligne–Mumford stacks with the resolution property and a globally resolved perfect obstruction theory of constant virtual rank.”

## R13 (P3) — The negative-dimension example overclaims

**Location:** `TauCetiRoadmap/VirtualFundamentalClass/README.md:99`: “The dimension of a pure-dimensional stack can be negative, as for a classifying stack of a positive-rank bundle.”
**Claim:** A classifying stack of a rank-`r` bundle over a base of dimension `d` has dimension `d − r`, which is non-negative whenever `d ≥ r`.
**Witness:** For a smooth surface `X`, `B T_X` has dimension `2 − 2 = 0`. It is `𝔠_X`, which §5.4 makes pure of dimension zero.
**Repair:** “… can be negative, as for `B𝔾_a` over `Spec k`, of dimension `−1`.”

## Previous findings

- R01 — repaired: §5.5 now reads “apply the transitivity triangle and Layer 4 to obtain … `h¹/h⁰((L_{X/Y})∨) → 𝔑_X → f*𝔑_Y`”, with no Layer 8 edge. The moved sentence in §8.3 introduces a new problem, now R06.
- R02 — not repaired: §3.3 still states “including the triangle `f*L_Y → L_X → L_{X/Y} →`” for morphisms to an algebraic stack (now R01).
- R03 — not repaired: §4.5 still reads “with perfect third term” (now R02).
- R04 — not repaired: §4.2 still reads “actions of a vector-bundle stack … quotients remain cone stacks” (now R03).
- R05 — not repaired: §6.4 still reads “Develop pullback, external direct sum” (now R04).
- R06 — partly repaired: Checks were added in §§0.2, 1.4, 3.2, 4.2, 4.3, 5.1, 5.3, 6.1 and 7.2. §1.3 and other subsections still have no Checks, no section has API bullets, and the section order is unchanged (now R08).
- R07 — not repaired: §4.4 still reads “construct the abelian cone stack `h¹/h⁰((E_fl)∨)`” with no locator (now R09).
- R08 — repaired: “`TauCeti.AlgebraicGeometry.Chow.ChowGroup.pushforward` for closed immersions of locally Noetherian schemes”.
- R09 — repaired: §2.1 reads “For `X` pure of dimension `n`, define `A^c(X)_ℚ = A_{n−c}(X)_ℚ`”, and Conventions no longer promises codimension notation.
- R10 — repaired: “They do not form the conormal algebra, relative normal cone, blowup, or deformation-to-the-normal-cone API.”
- R11 — not repaired: `Suggested.lean` is unchanged and has no namespace (now R11).
- R12 — not repaired: the description is unchanged (now R12).
- R13 — not repaired: §1.5 still reads “*Needs:* Layer 0 and AlgebraicVectorBundles L1A–L2B.” (now R10).

## Verified sound

| Statement | Instances tried | Left value | Right/comparison value | Result; change |
|---|---|---|---|---|
| Conventions: negative dimension | `B𝔾_a` over `k`; `B T_X`, `X` a smooth surface | `0−1 = −1`; `2−2 = 0` | The example class is claimed to be negative | The second instance is non-negative: R13 |
| Tau Ceti pushforward | `Chow/ClosedImmersion.lean:211` at the pin | `ChowGroup Z k →+ ChowGroup X k` along a closed immersion | `IsLocallyNoetherian Z, X` at :208 | Agrees with the README |
| Mathlib “do not form” | Pin searched for blowup and the associated graded ring of an ideal | `RingTheory/ReesAlgebra.lean:18`: blowup not yet present; 0 definitions | README: absent | Agrees |
| §0.2 Checks | `𝔸²`; `B𝔾_a`; rank-2 bundle on a curve | `2`; `0−1 = −1`; `1+2 = 3` | Without the atlas correction, `B𝔾_a` would have dimension 0 | Correct and discriminating |
| §1.4 Checks (sample) | `Sym(𝒪²)`; `𝒪×𝒪` in degree 0; `Sym(𝒪^(ℕ))` | `𝔸²_X`; `S₀ = 𝒪² ≠ 𝒪`; `S₁` not coherent | BF p. 5: `S₀ = 𝒪_X`, `S₁` coherent and generating | Correct; locator R09 |
| §2.1 (sample) | Point of `ℙ¹`; `BC₂`, `BS₃` | Codimension `1−0 = 1`; degrees `1/2`, `1/6` | `A¹(ℙ¹) = A₀`; Vistoli p. 620: `deg BG = 1/n` | Correct; locator R09 |
| §2.2 projection formula | `f : ℙ¹×BC₂ → ℙ¹`, `L = 𝒪(1)`, `α = [ℙ¹×BC₂]` | `f_*(c₁(f*L)∩α) = f_*[pt×BC₂] = ½[pt]` | `c₁(L) ∩ f_*α = c₁(L) ∩ ½[ℙ¹] = ½[pt]` | Formula holds; uses §§2.3 and 2.5: R07 |
| §3.2 Checks | `L[0]`; `[K →id K]` of rank `r`; sum of resolutions | Amplitude `[0,0]`; rank change `r−r = 0` | Defining the rank as `rank E⁰` alone would change it by `r` | Correct and discriminating |
| §3.3 descent for algebraic spaces | SchemeAndStackFoundations §1.10 on main | README:2422, “The small étale site of an algebraic space” | Cited for étale descent | Resolves; *Needs:* omits it: R10 |
| §3.3 Artin-base triangle | `pt → B𝔾_m` | `f*L_{B𝔾_m} = k[−1]`, `H¹ = k` | `L_pt = 0`, `L_{pt/B𝔾_m} = k` | Absolute `L_Y` is not constructed: R01 |
| §4.2 Checks | `[C/0]`; trivial `𝔾_a` action on `𝔸¹`; `[𝔸²/𝔸¹]` | `C`; `𝔸¹×B𝔾_a`; `2−1 = 1` | The cone, the product, `rank F₁ − rank F₀` | Correct |
| §4.2 quotient closure | Trivial `B𝔾_a` action on `pt` | `B²𝔾_a`, `π₂ = 𝔾_a` | A cone stack has `π₂ = 0` | Counterexample: R03 |
| §4.3 Checks | `[k →0 k]`; `[k →id k]`; chain homotopy | `(π₀,π₁) = (k,k)`; `(0,0)` | `𝔸¹×B𝔾_a`; `pt` | First two correct; the third restates the target: R08 |
| §4.5 triangles | `k[1] → 0 → k[2]` | Dual sequence `0 → 0 → 𝔸¹` | The last map misses `1`; Prop. 2.7 needs `[−1,0]` | Counterexample: R02 |
| §5.1 Checks (sample) | Smooth `𝔸¹`; `k[x]/x² ⊂ 𝔸¹` in char 2 and 3; `k[x,y]/(x²,xy)` | `B𝔾_a`; action by `2x`, zero in char 2 | `I/I²` of rank 2 at the origin, 1 generically | First correct; the other two state no value: R08 |
| §5.3 Checks | Smooth; regular hypersurface; `I = x(x,y)` | `𝔠 = 𝔑 = BT`; `C = N`, a line | `Sym(I/I²) ≅ gr_I` because `I ≅ (x,y)`; not lci | Correct; BF Prop. 3.12 error below |
| §5.5 smooth sequence | `𝔸¹ → pt` | Relative dimensions: `B T` is `−1`, `𝔠_𝔸¹` is `−1` | `f*𝔠_pt` is the zero cone, `0`; `−1 = −1+0` | Correct |
| §5.5 lci route | `X = V(xy,xz,yz,x+y+z) → Y` | `L_{X/Y} = 𝒪_X[1]`, amplitude `[−1,−1]` | Needs relative lci perfectness, which no target states | Holds here; the general input is missing: R05 |
| §5.5 negative Check | Origin fibre over `ℚ`; char 3 | Image `{a² = (a+b)(a+c)} ⊂ 𝔸³` misses `(1,1,1)`: `1 ≠ 4` | In char 3, `1 = 1·1` and `(1,1,1)` is hit | Correct over `ℚ`; the choice of `k` matters |
| §6.1 Checks | `id_L`; `Ω ⊕ V[1] → Ω`; `k^(ℕ)[1] → 0` | `H⁰` iso and `H⁻¹` iso; `V → 0` epi | `H⁻¹ = k^(ℕ)` is not coherent | Correct; the third isolates coherence |
| §7.2 Checks | Smooth `X`; `k[x]/x²`; `s = 0` in `𝒪(1)` on `ℙ¹` | `[X]`; `0^![2N] = 2[pt]`; `Ob = 𝒪(1)` | `+[pt]`; the reversed quotient gives `−[pt]` | Correct |
| §8.3 (sample) | `pt ⊂ 𝔸¹` with canonical theories; owner search | `i^![𝔸¹] = [pt] = [pt]vir` | §2.5 (line 430) and §8.3 both construct the equivalence | Formula agrees; duplicate owner: R06 |
| §6.4 pullback | Pull `0 → L_pt` back along `𝔸¹ → pt` | `H⁰`: `0 → 𝒪` | An isomorphism is required | Fails: R04 |
| §1.3 relative Spec | Algebras `𝒪`, `𝒪[t]`, `𝒪×𝒪` | `X`, `𝔸¹_X`, `X ⊔ X` | Checks in §1.3 at this head: 0 | Missing: R08 |
| §4.4 locator | BehrendFantechi1997 line 674 | Prop. 2.4, p. 20 | README locator: none | R09 |
| `Suggested.lean` | Namespace count | 0 at this head | 1 in each of 2 declaration-free files on main | R11 |
| Pull-request text | Base versus head | Folder absent on the base; +1047 lines | The description does not mention the addition or the resolution hypotheses | R12 |

The rows for untouched statements and for the six headline theorems stand as in the previous review, of `b7256a8`.

- Source locators checked against the text: 17. In BehrendFantechi1997: pp. 5, 15, 20, 22, 23, 24–26, 27, 28, 29, 30, 31, 35, 38 and 42–44. In Vistoli1989 (GDZ scan): pp. 620, 632–634, 641 and 650–651.
- Library declarations opened at the pins: 3. They are `TauCeti.AlgebraicGeometry.Chow.ChowGroup.pushforward` (`TauCeti/AlgebraicGeometry/Chow/ClosedImmersion.lean:211`) with its variables at :208, and `Mathlib/RingTheory/ReesAlgebra.lean:18`. Mathlib has 0 definitions of a blowup or of the associated graded ring of an ideal.
- Cross-roadmap citations resolved: 6. SchemeAndStackFoundations §1.10 (README:2422) and §5.5 (README:7109) on main. DerivedDeRhamCohomology §5.8 (README:4508) and §0.20 (README:379) at its open head. StableReductionPartII README:102 and README:6587 consume Layer 2's projection formula and `c₁`, consistent with §2.2.
- Ownership: searched for the projection formula and operational classes on Deligne–Mumford stacks across main and the open heads. No second owner exists, and no overlap, dropped id or revision-only id is listed.
- Gate: the worker's gate at this head is `OK`, with all 29 checks at 0, including `build=0`. My rerun without the candidate order reports only `depcheck: NOT IN ORDER`, which is design-stage placement and not a finding.
- Dependency check: `depcheck: 229 roadmaps, 2059 edges, 0 problem(s)`, with 0 UPWARD, CYCLE or moved lines. The roadmap sits at position 24, after DerivedDeRhamCohomology (23) and before StableReductionPartII (320).
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no warnings. The file is unchanged since `b7256a8` and has 0 declarations, so neither the `#check @` comparison nor the one-tactic probes has anything to test. There are 0 changes outside the folder.
- Remarks on untouched text: README lines 205 and 1001–1002 cite roadmaps by pull-request URL. The `Suggested.lean` docstring's “Theorem 3.11” and similar references do not name Behrend–Fantechi.

## Not verifiable

- Fulton1998, *Intersection Theory*, 2nd ed.: DOI 10.1007/978-1-4612-1700-8 resolves only to a paywalled publisher page; uncertified.
- IllusieI, *Complexe cotangent et déformations I*, III Cor. 3.1.3: DOI 10.1007/BFb0059052 resolves only to a paywalled publisher page; uncertified.
- IllusieII, *Complexe cotangent et déformations II*: the title search for LNM 283 resolves only to a paywalled publisher page; uncertified.
- LaumonMoretBailly2000, *Champs algébriques*: the title search resolves only to a paywalled publisher page; uncertified, and the README gives no locator.

## Source issues

- **Error** in BehrendFantechi1997 at Proposition 3.14, p. 31: the source says the intrinsic-cone sequence is short exact for every local complete intersection morphism; it should assert it for smooth morphisms and keep only the normal-sheaf sequence for lci, since the Cartier section `x+y+z` of the three coordinate axes misses `(1,1,1)`; affects a stated result.
- **Error** in BehrendFantechi1997 at Proposition 3.12, p. 30: the source says equality of intrinsic cone and normal sheaf forces a local complete intersection; it should keep only the vector-bundle-stack criterion, since `k[x,y]/(x²,xy)` has ideal `x(x,y)` of linear type, so `C = N`, without being lci; affects a stated result.
