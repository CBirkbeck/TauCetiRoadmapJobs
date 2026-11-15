# Review of PrismaticCohomology (pull request #1057 at ed42a0a)

**Verdict:** needs changes

## R01 (P3) — Four definitions still lack their Checks lists

**Location:** `TauCetiRoadmap/PrismaticCohomology/README.md:1131`, §§0.58, 1.3 (1796), 2.4 (2419), 2.16 (2604).
**Claim:** Previous R04 remains: each construction needs at least three discriminating Checks attached to its definition.
**Witness:** Each of these four sections has zero `**Checks.**` lists. Their examples remain separately at lines 1666, 2247, 2840 and 2858.
**Repair:** Move the corresponding examples into three Checks bullets under each definition, making the values explicit: §0.58, the ghost pair `(2,0)` comes from `(2,−2)`, `(1,0)` has no preimage, and the underived square over `F₂` has two elements instead of four; §1.3, evaluate the structure-sheaf pushforward on the base chart, its empty open and its two-copy étale cover, obtaining `A`, `0` and `A×A`; §2.4, use affine recovery, two-component products and the smooth affine line's Hodge–Tate groups; §2.16, use the empty presentation, the polynomial root cover and the failure of `Δ` of the original affine line to be a prism. The computed instances are below.

## R02 (P3) — The PR description omits the de Rham comparison restriction

**Location:** PR description, `<!-- roadmap-summary -->`, “with Hodge–Tate, crystalline and de Rham comparisons for smooth algebras and formal schemes”; the paragraph following that block repeats the unqualified comparison.
**Claim:** The description promises a broader de Rham comparison than this head specifies.
**Witness:** `TauCetiRoadmap/PrismaticCohomology/README.md:2161` labels §1.22 “The de Rham comparison (W(A/I) p-torsion-free)”; line 2163 assumes that condition. `Suggested.lean:14` likewise calls this comparison restricted.
**Repair:** In both passages, describe “the smooth Hodge–Tate and crystalline comparisons, and the de Rham comparison under the additional hypothesis that W(A/I) is p-torsion-free.” Keep the general bounded-prism scope of relative cohomology separate from this restriction.

## Previous findings

- R01 — repaired: README lines 2668 and 2886 now list “CR.DDR.5.18, CR.DDR.5.20–CR.DDR.5.22”; all five cited sections, including CR.DDR.4.5, exist at the supplier head.
- R02 — repaired: README uses “Frobenius lift”, “canonical integer δ-structure”, `W_2(f)`, “free δ-ring on S” and “comparison map to site cohomology”; all eleven reported undeclared labels are absent.
- R03 — repaired: README line 2403 now contrasts the regular quotient with `(A,I)=(Z_p[[u]],(u−p))` and `R=A/I`, without the extraneous `f=p`.
- R04 — not repaired: §§0.58, 1.3, 2.4 and 2.16 still pass directly from their construction and prerequisites to the proof route, with no Checks list; carried as R01.
- R05 — repaired: README line 2890 says “PrismaticCohomologyPartII consumes Layers 0–2” without the nonexistent relative link.

## Verified sound

| Statement | Instances tried | Computed construction / left side | Computed comparison / right side | Result; change |
| --- | --- | --- | --- | --- |
| §0.4 Frobenius lift | `F₂`, identity | `φ(x)=x` | `x²=x`; congruence holds, although a δ-structure would require `δ(0)=δ(2)=1` | Distinction retained |
| §0.18 coefficient map | `Z→F₂`, `(0,1)` | `W₂(f)(0,1)=(0,1)≠0` | Both target ghosts are `0`; coordinates distinguish the image | Naming repair preserves map |
| §0.18 composition and truncation | `Z→Z/4→F₂`, coordinates `(3,5)` | Composite and iterated maps give `(1,1)` | Truncate after mapping also gives `(1,1)` | Equal |
| §0.19 projection API | Same vector; `j=0,1` | Coordinates `1,1` | `f(3)=1`, `f(5)=1` | Equal |
| §0.42 localized structure | `Z₂→Z₂[1/3]`, `p=2` | `δ(1/3)=1/9` | `(1/3)²+2/9=1/3=φ(1/3)` | Uniqueness preserved |
| §0.43 integer Frobenius | `p=2`, integer `2` | `2²+2δ(2)=4−2=2` | Identity sends `2↦2` | Equal |
| §0.44 p-local δ | `p=2`, `x=1/3` | `2δ(x)=2/9` | `x−x²=1/3−1/9=2/9` | Equal |
| §0.45 integer restriction | `p=2`, integer `3` | Image of `δ_Z(3)=−3` | `δ_Z_(2)(3)=(3−9)/2=−3` | Equal |
| §0.55 free integral δ-ring | `p=2`, one generator mapped to `2` | `x₀↦2`, `x₁↦−1`, `x₂↦−1` | `δ(2)=−1`, `δ(−1)=−1`; `φ(x₀)↦4−2=2` | Universal-map values agree |
| §0.58 pullback square | `p=2`, `Z`; then `F₂` | Ghosts of `(2,−2)` are `(2,0)`; `(1,0)` would require `y=−1/2` | `(2,0)` satisfies congruence; `(1,0)` fails; `W₂(F₂)` has 4 elements, ordinary fibre product 2 | Three witnesses for R01 |
| §0.63 distinguishedness | `A=Z₂`, `d=2,4` | `δ(2)=−1` is a unit; `δ(4)=−6` is not | `(d,φ(d))=(2),(4)`; membership of `2` is true, false | Both directions agree |
| §0.66 divisibility | `p=2`, `x=2`, `n=0,1,2` | `δ(2)=−1`, `δ(4)=−6`, `δ(16)=−120` | Dividing by `1,2,4` gives integers `−1,−3,−30` | Bounds preserved |
| §0.66 separatedness | `Q[t^(1/2^∞)]`, `φ=id` | `δ(t)=(t−t²)/2≠0` despite all roots | `⋂2ⁿA=A≠0`; separatedness fails | Excluded as required |
| §0.74 crystalline predicate | `(Z₂,(2))` | `δ(2)=−1`, multiplication by `2` injective | `φ=id`, reduction `F₂`, torsion bound `2` | Renaming preserves predicate |
| §0.78 forgetting orientation | Generators `2,−2` of `Z₂` | Universal generator maps respectively to `2,−2` | Both generate `(2)`; orientations differ | Orientable versus oriented retained |
| §0.87 regular sequences | `A=Z₂[[u]]`, `d=u−2`, `r=0,s=1` | `φ(d)=u²−2`; modulo `d` this becomes `2`, regular in `Z₂` | Modulo `2`, `d=u` is regular; for `r=1`, `φ(d)=u²` is regular | Claimed pairs regular |
| §1.3 topos pushforward | `(Z₂,(2))`, base `X=Spec F₂`; `U=X,∅,X⨿X` | Sections are `Z₂`, `0`, `Z₂×Z₂` | Site sections over the three slices have the same values | Three witnesses for R01 |
| §1.22 rewritten δ-lift | `(A,I)=(Z₂,(2))`, `q:A→F₂` | `ψ(2)=2` in `W(F₂)=Z₂` | `2∈2W(F₂)`; `W(F₂)[2]=0` | Map and restriction preserved |
| §1.22 scope in PR text | `A=Z₂[ε]/ε²`, `I=(2)`, `φ(ε)=0` | `A` is 2-torsion-free and complete; `δ(2)=−1` | In `W(F₂[ε]/ε²)`, `[ε]≠0` but `2[ε]=V([ε²])=0` | Bounded crystalline base excluded by §1.22; R02 |
| §2.2 repaired contrast | Breuil–Kisin base `A/I=Z₂`; compare `R=Z₂` and `F₂` | Base: `L=0`, `gr₀=Z₂`, `grᵢ=0` for `i>0` | Quotient: `L=F₂[1]`, `grᵢ=Γⁱ(F₂)=F₂` for all `i` | Filtration maps are isomorphisms only in the base example |
| §2.4 sheaf gluing | Over `(Z₂,(2))`: `F₂`, `F₂×F₂`, smooth `F₂[t]` | First two values: `Z₂`, `Z₂×Z₂`; affine-line reduction: `H⁰=F₂[t]`, `H¹=F₂[t]dt`, `H²=0` | Affine recovery, product and smooth Hodge–Tate formulas give those values | Three witnesses for R01 |
| §2.10 site comparison | `(Z₂,(2))`, `R=F₂` | `Δ=Z₂`; evaluation at the initial prism is identity | `RΓ(O_Δ)=Z₂`; comparison `1↦1` | Renaming preserves comparison |
| §2.16 root cover | Over `(Z₂,(2))`: empty presentation; `R=F₂[x]` | Empty: `S=F₂`, `B=Z₂`; polynomial: `S=F₂[x^(1/2^∞)]`, `B=W(S)`, `B/2=S` | Original affine line has `H¹(Δ̄)=F₂[x]dx≠0`; a prism quotient is discrete | Three witnesses for R01 |
| §2.20 repaired supplier citation | `S=F₂` | Supplier: `LWΩ_S=A_crys(S)=Z₂` | Prismatic value over `(Z₂,(2))` is `Z₂` | Corrected five-section list resolves |

Untouched-statement rows and the one-tactic padding results stand as in the previous review of `36d19e5`.

- 142 changed lines reviewed; 5 previous findings accounted for; 0 Lean declarations changed; 0 changes outside this folder; worktree clean.
- 19 source locators opened in 2 texts, including seeded intersections and their dependencies: BS22 lines 531, 759, 819, 1136, 1488, 2082, 2197, 2344, 2710; ALB23 lines 537, 733, 739, 893.
- 5 pinned declarations opened: Mathlib `WittVector.map_coeff` (`RingTheory/WittVector/Basic.lean:267`), `truncate`, `truncate_surjective`, `coeff_truncate` (`RingTheory/WittVector/Truncated.lean:288`, 297, 303), `RingTheory.Sequence.IsRegular` (`RingTheory/Regular/RegularSequence.lean:146`).
- 5 corrected supplier targets resolved in `TauCetiRoadmap/CrystallineCohomology/README.md:6873`, 6911, 6933, 6975, 7007 at #857; numeric identifiers survive the heading regrouping; citation scan reports 0 unresolved cross-roadmap citations.
- 13 declarations checked with `#check @name` on a scratch copy; all elaborated signatures agree with the README, with 0 lost binders and 0 signature changes.
- Gate passes every scanner; targeted module build and direct Lean elaboration pass with exactly 4 `sorry` warnings and no other warnings.
- Dependency output: `depcheck: 245 roadmaps, 2215 edges, 0 problem(s)`; 0 UPWARD or CYCLE lines.
- Title and description checked against the 3-file, 3074-line addition to main: 0 removed base headings or declarations, 13 added declarations; comparison restriction reported in R02.

Overlap check: read PrismaticCohomologyPartII, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, PerfectoidQuotients, AInfCohomology, EnhancedDerivedSheaves, PerfectoidSpaces, DerivedModuleAlgebra and DerivedDeRhamCohomology. Shared objects retain these owners: integral δ-adjunctions and general orientable envelopes—PrismaticCohomology; p-local prisms, regular envelopes and semiperfectoid universal quotients—PerfectoidSpaces; complete étale δ-extension—PerfectoidQuotients; AΩ and Tate interfaces—AInfCohomology; enhancements—EnhancedDerivedSheaves; cotangent and completion algebra—DerivedModuleAlgebra; PD envelopes and derived de Rham—DerivedDeRhamCohomology; Nygaard/absolute, étale/syntomic and logarithmic extensions—Parts II, III and IV respectively.

Source independence: changed passages only; 12 passages compared with 2 sources, no copied expression or reused material found. Largest share BS22: 259 of 367 source-citation occurrences before References. No layer was added, removed or reordered; the contents comparison is not reopened in this incremental review.

## Not verifiable

- none within the changed passages and carried findings.

## Source issues

- none

## For the human reviewers

- none
