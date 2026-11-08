<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7629#issuecomment-6721603082 -->
Review (claude) of 3f218e3

Verdict: needs_changes

1. **F01** (P2) 1.2's "same image iff isomorphic over some extension" is false for one extension

   Location: `packages/StackPointsAndResidualGerbes/design/README.md` line 691 (1.2, API bullet 3): "Two
   objects over `k` have the same image iff they become isomorphic over some extension of `k`."

   Claim: for objects `x, y` of `𝒳` over `Spec k`, equal points of `|𝒳|` iff some field extension
   `k ⊆ k'` has `x|_{k'} ≅ y|_{k'}`.

   Witness: stacks-04XE lines 341–350: `p : Spec K → 𝒳` and `q : Spec L → 𝒳` are equivalent when some
   `Spec Ω` has two morphisms, one to `Spec K` and one to `Spec L`, with 2-isomorphic composites; the two
   morphisms are arbitrary. Counterexample to the "only if" with one extension: `𝒳 = Spec ℚ(i)`,
   `k = ℚ(i)`, `x = id` and `y = σ` (complex conjugation), both objects over `Spec k`. They represent the
   single point of `|𝒳|` (take `Ω = ℚ(i)` with the two maps `σ` and `id`: `id ∘ σ = σ ∘ id`). For a single
   embedding `ι : ℚ(i) → Ω`, the pullbacks are the ring maps `ι` and `ι ∘ σ`, which differ since
   `ι(i) ≠ ι(−i)` (`2ι(i) ≠ 0`); in a scheme, isomorphic objects are equal, so `x` and `y` are isomorphic
   over no single extension. The "if" direction holds (one extension with equal maps is an instance of
   the definition).

   Repair: replace the bullet by "Two objects `x, y` over `k` have the same image iff there are a field
   `Ω` and two field homomorphisms `i, j : k → Ω` with `i^*x ≅ j^*y`; one embedding does not suffice
   (stacks-04XE lines 341–350)", and add the Check "On `Spec ℚ(i)`, the objects `id` and complex
   conjugation over `ℚ(i)` represent the same point and are isomorphic over no single extension of
   `ℚ(i)`: `i = σ`, `j = id` realises the equivalence." Tested: with two embeddings the instance computes
   `σ^*(id) = σ = id^*(σ)`; the Checks of 1.2 (`B(ℤ/2)_ℝ`, `𝔸¹_ℝ`, the absolute versus relative points)
   are unchanged, and no other target uses the bullet (3.4's "every field-valued point in the class `x`
   factors through `𝒵_x`" is Lemma 100.11.11, which uses the Stacks relation).

2. **F02** (P3) 1.1's third API bullet is vacuous

   Location: `design/README.md` lines 663–664 (1.1, API bullet 3): "If `x` is a finite type point, every
   representative which is locally of finite type is one; the property is attached to the point."

   Claim: the bullet states a fact about finite type points.

   Witness: read literally it says that a locally finite type representative witnesses the definition,
   which is Definition 101.18.2 itself (stacks-06RD lines 1567–1569); `design/plan.json` 1.1 has no
   corresponding `api` entry (its three are `iff_closedPoint`, `map`, `dense`). The content worth stating
   is the opposite warning: a finite type point has representatives that are not locally of finite type,
   `Spec k̄ → Spec k` for `k̄/k` infinite (not of finite type, `k̄` not a finitely generated `k`-algebra),
   while `Spec k → Spec k` is.

   Repair: replace the bullet by "The property is attached to the point, not to the representative: a
   finite type point has representatives that are not locally of finite type (`Spec k̄ → Spec k` with
   `k̄/k` infinite), and conversely one locally finite type representative suffices." Tested: on
   `Spec ℤ_(p)` the generic point is of finite type through `Spec ℚ`, while `Spec ℚ̄ → Spec ℤ_(p)` is not
   locally of finite type; the three Checks of 1.1 are unchanged.

3. **F03** (P3) 5.2's route does not say why the base of the dense open gerbe is locally Noetherian

   Location: `design/README.md` lines 1253–1255 (5.2): "factor through the reduced closure of `x` (0.5),
   pass to its dense open gerbe (2.6), which contains `x`, reduce to the base algebraic space by 3.4's
   pullback formula, and apply the space case"; `*Needs:*` line 1255–1257.

   Claim: the space case (Decent Spaces, Lemmas 68.13.9–68.13.10) applies to the base `U` of the dense
   open gerbe `𝒰`.

   Witness: stacks-decent-spaces lines 1565–1570 (68.13.9 needs `X` locally Noetherian) and 1584–1590
   (68.13.10 needs a quasi-compact monomorphism from a field, e.g. `X` decent); stacks-06RD lines
   4861–4863: "If `𝒳` is locally Noetherian, then `X` is locally Noetherian by fppf descent (details
   omitted)". In the decent case 5.1 (Lemma 101.48.5) gives decency of `U`; in the locally Noetherian
   case nothing in 5.2 gives local Noetherianity of `U`. The roadmap has the input: a gerbe is smooth and
   surjective (2.3, Lemma 101.33.8), and 0.1's API descends a smooth-local property along a smooth
   surjective morphism, so `U` is locally Noetherian when `𝒰` is; `𝒰` is locally Noetherian as an open
   substack of the closed substack `𝒳'` of `𝒳` (0.5's API, Lemma 101.17.5).

   Repair: in 5.2 add "the base is decent by 5.1 when `𝒳` is, and locally Noetherian by 0.1's descent
   along the smooth surjective gerbe (2.3) when `𝒳` is" and add 0.1 and 2.3 to the `*Needs:*` line and
   `target:0.1`, `target:2.3` to `plan.json` 5.2. Tested: on `Spec ℚ(t)/ℤ` (locally Noetherian, not
   decent) the base of the one-point gerbe is the space itself, locally Noetherian through its atlas
   `Spec ℚ(t)`, and 68.13.9 applies; on `B𝔾_m` both routes give `Spec k`.

Needs changes: one P2 finding (R01) and two P3 notes (R02, R03); a fix round applies them before the
package stage. The two round-3 findings are repaired (checked passage by passage below). The sixteen
declared supplier gaps are contracts the review relies on, not findings. The fifteen sampled targets,
the headline theorems and every passage a repair changed were read at their locators and recomputed
in the adversarial table.

## Round-3 findings, checked one by one

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P3) 7.3's homogeneous-space step named a supplier that did not commit to it | repaired (differently, as the repair report says) | README 7.3 lines 1569–1582: "`G_x` is affine and locally of finite type over `k` (1.3, the inertia being locally of finite type), hence of finite type, so it is a closed subgroup of some `GLₙ` (Tau Ceti `…exists_isClosedImmersion_generalLinear`). The fppf quotient `Q = GLₙ/G_x` (Tau Ceti `CommHopfAlgCat.fppfHomogeneousQuotient`) is a scheme smooth over `k` of pure dimension `n² − dim G_x` (gap:homogeneous-quotient-scheme), and the projection `π : GLₙ → Q` is a `G_x`-torsor (…`isPullback_fppfHomogeneousQuotientTorsor`) … `dim T_{BG_x} = … = dim Lie(G_x) − dim G_x`, which vanishes iff `G_x` is smooth (…`smooth_iff_finrank_lie_eq_ringKrullDim`)"; the `*Needs:*` line (1582–1592) lists 1.3, 2.2, §1.21, the four Tau Ceti names and the three gaps; `plan.json` 7.3 matches item by item. The four declarations were opened at the pin (below); the gap is stated at lines 389–395 with SGA 3 VI_A Théorème 3.2, read at sga3-vi-a lines 871–894 (below). ReductiveGroups Layer 2 is no longer cited anywhere (grep). The route is recomputed in the adversarial table. |
| F02 (P3) three `*Needs:*` lines disagreed with `plan.json` | repaired | README 0.2 line 465–466: "§1.20 (`Stacks.points` and `inertia`, for the API's `|f|` and `I_𝒳`)"; 1.1 line 649: "*Needs:* 0.5 (the reduced induced locally closed substack, for the density of finite type points)"; `plan.json` 3.4 `prerequisites` has `target:3.1`, `target:3.2`; 2.5 line 899–900: "*Needs:* 2.1, 2.3 (a gerbe is surjective, flat and locally of finite presentation), 2.4" with `plan.json` 2.5 adding `target:2.3`. My own script (targets with ranges expanded, roadmap sections, gaps, Mathlib and Tau Ceti names, after stripping parentheticals) reports 0 of 38 targets differing; gap `neededBy` sets equal the citing subsections for all 16 gaps; 129 README Checks against 129 plan tests, equal per target. |

## Verified sound

**Dependency gate** (the command of the brief, no UPWARD or CYCLE line):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 237 roadmaps, 2343 edges, 0 problem(s)
```

**Citation resolver** on the README (main at 09dc2bb, 470 open heads): "Cross-roadmap citations found
nowhere: None"; "Lean names found nowhere: None". The eleven leads of the worker's earlier run
(`scratch/citations.md`) are SchemeAndStackFoundations names, each attributed to its section in the
README and present in that README on main (§1.8 `Spaces.EtaleLocal`, §1.13 `Groups.GroupSpace`, §1.15
`Groups.IsTorsor`, §1.18 `Stacks.StackInGroupoids`, `Stack.stackification`, §1.19
`IsDeligneMumford.iff_unramified_diagonal`, §1.20 `SmoothLocal.atlas_independent`,
`Stacks.points.pullbackSurjective`, §1.21 `actionQuotient.torsorEquiv`, §1.7
`points.test_no_residue_field`; AlgebraicModuliForArithmeticGeometry §4.1 `IsGerbe.equivalence_iff`).
**Overlaps** (`scratch/overlaps.md`): no open pull request changes this roadmap; no cited id dropped
by an open pull request; no id defined only by an open revision; the closest roadmaps in vocabulary
are five revisions of SchemeAndStackFoundations, a roadmap on main (the README cites main). The one
object shared with a roadmap on main is the gap `homogeneous-quotient-scheme`: FlagVarieties
(`TauCetiRoadmap/FlagVarieties/README.md` line 69) declares the same slug on the same supplier section
(ReductiveGroups Layer 3) for representability as a separated finite type scheme; this roadmap's
sentence adds smoothness and pure dimension. Both hand the object to ReductiveGroups; neither owns it,
so there is one owner.

**Principles.** Every statement is at the Stacks Project generality (absolute stacks, any base, no
good cases); no roadmap is re-planned (duplication greps below); supply is downward (the gate above:
SchemeAndStackFoundations and ReductiveGroups on main, AlgebraicModuliForArithmeticGeometry a
new-roadmap pull request earlier in the order); statements in the author's words with theorem numbers
and cached-line locators, no passage copied (compared 0.5, 2.4, 2.5, 4.1, 4.2, 4.4, 5.2, 7.3 against
the text); no algorithm; no Lean file at the design stage, so no sorry'd data and no `set_option`.
Untrusted text: nothing in the README, the supplier READMEs, the sources or the board package
instructed anything.

**Sources: the seeded sample**, each read at the cited lines; theorem number, page, hypotheses and
statement agree with the README unless a finding says otherwise:

| Target | Source lines read | Result |
|---|---|---|
| 0.5 | stacks-04XE 1073–1091 (Lemma 100.10.1, unicity omitted), 1092–1106 (10.2–10.3), 1107–1125 (Def 10.4, Remark 10.5); stacks-06RD 1484–1498 (17.4–17.5) | correct; the README's route (scheme atlas, `vanishingIdeal`, the two pullbacks to `R` reduced and equal) is the source's with a scheme in place of a space |
| 1.2 | stacks-04XE 341–350 (equivalence of points), 399–423 (Def 4.2 and discussion); stacks-06RD 1593–1601 (18.6 at a closed `{x}`) | closed points of finite type correct; API bullet 3 is R01 |
| 2.4 | stacks-06QB 2722–2774 (Prop 28.9 with its converse: stabilizer by Lemma 5.7, `R/G` by Bootstrap 11.7, gerbe by Groupoids in Spaces 27.1), 2775–2820 (28.10 (1)–(4)) | correct; the README's route is the source's |
| 2.5 | stacks-06QB 2821–2843 (Prop 28.11, uses 28.2, 28.3, 28.5, 28.8–28.10, 27.13), 2862–2875 (28.13, openness from 27.15), 2876–2890 (28.14, descent from 27.16) | correct; `*Needs:*` 2.1, 2.3, 2.4 and the two gaps are exactly the inputs |
| 3.4 | stacks-06ML 1306–1310 (Ex 11.9), 1312–1337 (11.10–11.12); stacks-06RD 452–456 (4.16), 4831–4839 (51.1); stacks-06QB 2846–2861 (28.12); stacks-decent-spaces 1500–1540 (13.5, Def 13.6) | correct |
| 4.1 | stacks-06RD 1609–1665 (Lemma 18.7 with proof: `u`, `R = u ×_𝒳 u`, Theorem 97.17.2, 94.16.1, descent along `u ×_𝒳 U → 𝒵 ×_𝒳 U`) | correct; the "moreover" clause is the proof's content |
| 4.2 | stacks-06RD 3059–3095 (31.2 and proof: `U'`, `R'`, Spaces over Fields 10.9, Morphisms of Spaces 28.7, 97.17.2, 78.25.1), 3057–3058; stacks-decent-spaces 1500–1531 (13.5) | correct; the README's hypothesis (a surjective flat lfp locally quasi-finite scheme cover) is what the proof uses, with Theorem 101.21.3 for the quasi-DM case as the gap says |
| 4.4 | stacks-06RD 3096–3129 (31.3 and proof: affine Noetherian chart, `u` with `{u}‾ ∩ E = {u}`, `R' = p⁻¹(Z)`) | correct; the README's route is the source's |
| 5.2 | stacks-06RD 4842–4865 (51.2, hypotheses (1)–(4)), 4866–4869 (Remark 51.3); stacks-decent-spaces 1565–1583 (13.9), 1584–1601 (13.10), 1604–1616 (Ex 13.11) | statement correct; route note R03 |
| 5.5 | rydh2011 1236–1245 (the error of LMB Déf. 11.2, finite extensions); stacks-06ML 1288–1297 (Def 11.8 and footnote) | correct |
| 6.3 | stacks-06QB 2664–2695 (28.6, `R = G`, fully faithful then essentially surjective by the gerbe property); alper-moduli 6996–6999 (4.5.16 (1)–(2)), 16537–16550 (7.4.39 remark, Exercise 7.4.40 (1)) | correct |
| 7.1 | ahr2020 246–252 (`X^{[n]}_Z` by `I^{n+1}`; neighbourhoods of a closed point through the residual gerbe) | correct |
| 7.2 | ahr2020 39–44 (`N_x = (I/I²)^∨`), 474–479 (quasi-separated, lft, affine stabilizers; `i : BG_x → X` closed immersion, `N_x = (i^*I)^∨` as `G_x`-representation) | correct; the README drops quasi-separatedness and proves the closed immersion by its own 6.4 |
| 7.3 | ahr2020 479–484 (`T_{X,x}` as pairs `(τ, α)`, `G_x` by precomposition on `α`, `T ≅ N` for smooth `G_x`); alper-moduli 6859–6881 (Def 4.5.7), 6948–6951 (Exercise 4.5.11); sga3-vi-a 871–894 (Théorème 3.2 for the gap) | correct; the source's precomposition is the right action of Convention 5, whose inverse the README uses, with the weight witness |
| 7.4 | ahr2020 484–486 (`X = [X/G]`, `G` smooth, `N_x = T_{X,x}/T_{G·x,x}`, `G_x` not necessarily smooth), 55–62 (Theorem 1.2: quasi-separated, lft over `k = k̄`, affine stabilizers, `x` smooth closed with linearly reductive `G_x`) | correct; the README adds the closed-orbit hypothesis the source has through "closed point" |

Also read: stacks-06QB 2893–2904 (28.15, for 4.3); stacks-06RD 4686–4735 (Def 48.1, Lemmas 48.2–48.5,
for 5.1 and the decency steps of 5.2–5.3), 1545–1592 (Def 18.2, Lemmas 18.1, 18.3–18.5 for 1.1);
stacks-04XE 424–437 (Lemma 4.3, used in 1.2's API); sga3-vi-a 871–894: `F`, `G` flat and locally of
finite type over a local Artinian ring, `u : F → G` quasi-compact with finite kernel; (i) the left
quotient exists in `Sch/A`; (ii) `p` surjective and open, `F\G` a sum of schemes of finite type; (ii′)
the connected components irreducible of dimension `dim G − dim F`; (iv) for `u` a monomorphism: (a′)
represents the fppf quotient sheaf and `G → F\G` is an `F`-torsor, (b) smooth if `G` is, (c) separated.
For `G = GLₙ` quasi-compact and `p` surjective the sum is finite, so "of finite type" in the gap is
right, and `H\G ≅ G/H` through `g ↦ g⁻¹` as the README says.

**Library declarations at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` from `lake-manifest.json`;
each opened at file and line, name present at the line). Mathlib: all 21 of the "From Mathlib"
section, including `finite_of_finite_type_of_isJacobsonRing` (`[IsJacobsonRing R] [Field S]
[Algebra.FiniteType R S]` ⇒ `Module.Finite R S`, the Zariski lemma of 5.5),
`retractionKerCotangentToTensorEquivSection` (Kaehler.lean:324, no smoothness of `P`),
`Algebra.FormallySmooth.exists_lift` (Basic.lean:125), `LocallyOfFinitePresentation.iff_locallyOfFiniteType`
(Noetherian.lean:271, `[IsLocallyNoetherian Y]`). Tau Ceti: `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`
(Representation/Embedding.lean:212: `G : AffineGroupSchemeCat (CommRingCat.of k)`,
`[LocallyOfFiniteType G.obj.X.hom]`, `∃ n f, IsClosedImmersion f.hom.hom.left`);
`TauCeti.HopfAlgebra.smooth_iff_finrank_lie_eq_ringKrullDim` (Tangent/Regularity.lean:112, variables
`{k} {H} [Field k] [CommRing H] [HopfAlgebra k H]`, `[Algebra.FiniteType k H]`; the `[IsAlgClosed k]`
of line 61 is closed by `end AlgebraicallyClosed` before it: `Algebra.Smooth k H ↔ finrank (Derivation
k H (CounitAlgebra k H k)) = ringKrullDim H`); `CommHopfAlgCat.fppfHomogeneousQuotient`
(Homogeneous/Basic.lean:217, namespace `CommHopfAlgCat`, variables `{R} [CommRing R] (H : CommHopfAlgCat R)
(I : HopfIdeal R H)`, the sheafification of the left-coset presheaf, line 17);
`CommHopfAlgCat.isLocallySurjective_fppfHomogeneousQuotientSheafProjection` and
`CommHopfAlgCat.isPullback_fppfHomogeneousQuotientTorsor` (Torsor.lean:154, 160: kernel pair `G × N`
through `fst` and `fppfQuotientTorsorAction`); representability only for linearly reductive `N`
(Coinvariants.lean:219) and reductive `N` in characteristic zero (line 255), so the general case is
rightly a gap; `TauCeti.linearlyReductiveAffineGroupSchemeProperty` (LinearlyReductive.lean:60, a `def`);
`TauCeti.Comodule` (Comodule/Basic.lean:50), `TauCeti.ComoduleCat` (Cat.lean:50);
`TauCeti.AlgebraicGeometry.SchPseudofunctor` (Stack/Basic.lean:37), `SchemePresheaf`,
`Spaces.RepresentableDiagonal`, `Spaces.EtaleAtlas`, `Spaces.IsAlgebraicSpace`
(AlgebraicSpace/Basic.lean:68, 74, 113, 195).

**Cross-roadmap citations resolved now.** SchemeAndStackFoundations on main (README last changed
2026-10-21, before round 3's check at `65930ba`): sections §1.2 (line 2091), §1.7 (2229), §1.8 (2250),
§1.9 (2299), §1.12 (2409), §1.13 (2418), §1.14 (2458), §1.15 (2502), §1.16 (2589), §1.17 (2624), §1.18
(2745), §1.19 (2817), §1.20 (2843), §1.21 (2951), §1.22 (2989), §1.23 (3021), §4.12 (5613), §4.13
(5643) all exist with the headings the README describes. ReductiveGroups on main: Layer 1
"representations = comodules" (line 176), Layer 3 "subgroups, quotients, components" (234–248: "The
quotient `G/H` is first the fppf sheaf quotient; whether it is represented by a scheme … is a theorem
with hypotheses"; no smoothness or dimension clause, so the gap asks for what is missing), Layer 3A
(249). AlgebraicModuliForArithmeticGeometry at the head of its pull request (4f0ad34): §4.1 (line 1873)
with `IsGerbe` (1877), `IsGerbe.equivalence_iff` (1897), `relativeGerbe` (1905), `relativePullback`
(1923), `relativeComposition` (1931), `relativeDescent` (1939, "locally essentially surjective"); §8.1
(9868) with `deformationGroupoid` (9870), `deformationFunctorOfPoint` (9888, "under (RS)"),
`stabiliserActionOnDeformations` (9892); §8.3 (9944) with `FramedDeformation` (9946),
`framedDeformation_twoFibre` (9966), `framedTangent_exactSequence` (10006, under RS). (RS) for algebraic
stacks is assumed there, so gap:algebraic-stacks-satisfy-rs is correctly declared.

**Declared gaps** (16): the same slugs in `plan.json` and in the README contracts (script-checked:
no slug on one side only), each with a named supplier and section and a `needs` sentence; each asks
for something absent at its supplier (SchemeAndStackFoundations on main as above; ReductiveGroups Layer
3 as quoted; AlgebraicModuliForArithmeticGeometry §8.1 assumes RS). The new gap
`homogeneous-quotient-scheme` is precise (smooth affine `G` of finite type over a field, closed
`H`; separated finite type scheme, smooth, pure dimension `dim G − dim H`; torsor clause pinned to Tau
Ceti) and minimal (representability at the pin is only for linearly reductive `H`, and `μ_p`, `α_p` are
stabilizers in the Checks). The review relies on all sixteen.

**Adversarial pass** (values computed on each side; the sampled targets, the headline theorems, the
new gap and every target a finding touches; rows of rounds 2–3 with computed values were reused only
where no text changed and the target is not in the sample):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.5 unique reduced closed substack on closed `T`; locally closed case | `T = ∅`; `T = |𝒳|`; `Spec k[ε]`; `[Spec k[t]/(t²)/𝔾_m]`; `[𝔸¹/𝔾_m]` at `{1}` | `𝒵 = ∅`; `𝒳_red`; `Spec k`; atlas `Spec k[t]/(t²)` with reduced induced `Spec k`, `𝔾_m`-invariant, quotient `B𝔾_m`; `T̄ ∖ T = {0}`, `𝒰 = Spec k`, substack `Spec k`; two candidates correspond to two reduced `R`-invariant closed subschemes of `U` with support `T'`, equal by uniqueness on `U` | holds |
| 0.5 API: Lemma 10.2 needs `𝒳` reduced; 10.3 needs `𝒴` reduced | `Spec k ⊂ Spec k[ε]`; `Spec k[ε] → 𝔸¹`, `t ↦ ε` | same support, not equal; `t ↦ ε` does not factor through `t ↦ 0` since `ε ≠ 0` | holds, Checks present |
| 1.1 finite type points | `Spec ℤ_(p)` generic; `𝔸¹_k` generic; `Spec k̄ → Spec k` | `ℚ = ℤ_(p)[1/p]` of finite type; `k(t)` not a finitely generated `k[t]`-algebra; `k̄` not finitely generated over `k` while the point is of finite type through `id` | holds; API bullet 3 vacuous: R02 |
| 1.2 closed ⇒ finite type; `π₀𝒳(Spec k) → |𝒳|` | `{x}` closed in `|𝒳|`; `B(ℤ/2)_ℝ`; `𝔸¹_ℝ`; `Spec ℚ(i)` with `id`, `σ` | 18.6 with `T = {x}`: `T ∩ ft ≠ ∅`; `H¹(ℝ, ℤ/2) = {±1}`, two classes, one point; `End(ℝ) = {id}` so `π₀ = ℝ`, the point `t² + 1` has residue field `ℂ`, no map `ℂ → ℝ`; `id`, `σ` equivalent through `(σ, id)`, never through one `ι` (`ι(i) ≠ −ι(i)`) | API bullet 3 false as written: R01 |
| 2.4 gerbe ⇔ inertia flat lfp; 28.10 | `[𝔸¹/𝔾_m]`; `Bμ_p/𝔽_p`; free action; `∅`; `Spec k[ε]`; 6.1's use of 28.10 (3) | fibres `𝔾_m` at `0`, `1` at `1`: not flat; inertia a form of `μ_p`, flat fp; trivial inertia ⇒ setoid ⇒ algebraic space, a gerbe over itself; both sides vacuous; trivial inertia, gerbe over `Spec k[ε]` (no reducedness in Def 28.1); `T₁ = T₂ = Spec k` over `𝒵_x → Spec κ(x)` gives `R_x → Spec(k ⊗_{κ(x)} k)` surjective flat lfp | holds |
| 2.5 diagonal criterion; universal homeomorphism; quasi-compact diagonal | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bμ_p → Spec 𝔽_p`; `Bℤ → Spec k` | `Δ` = unit section `Spec k → 𝔾_m`, closed immersion of codimension 1, not flat; nilpotent thickening is a universal homeomorphism and `(ε) ⊗ k → k` is zero while `(ε) → k[ε]` is injective, not flat; `K^×/K^{×p}` collapses over `K(a^{1/p})`, one point per point, gerbe for flat fp `μ_p`; `Isom` of two trivial torsors is `ℤ_k = ⊔_ℤ Spec k`, not quasi-compact, while `Δ_{Spec k} = id` | holds |
| 3.4 regular; factorisation; rigidity; base; pullback | `Spec k[x,y]/(xy)` at `0`; `Spec ℂ → 𝔸¹_ℚ` at `t² + 1`; `Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m]`; non-gerbe `[𝔸¹/𝔾_m] → Spec k` | `𝒵 = Spec k` regular; factors through `Spec ℚ(i)`; free (`t + n = t ⇒ n = 0`), étale relation `⊔_ℤ Spec ℚ(t)`, one point, reduced, Noetherian atlas, residual gerbe itself with base itself; `Spec F` with étale cover `Spec ℚ(t)` would make `ℚ(t) ⊗_F ℚ(t) = ∏_ℤ ℚ(t)` finite; `𝒵_0 = B𝔾_m` over `Spec k`, `𝒵_1 = Spec k`; `𝒵_y ×_{Spec k} 𝒳 = 𝒳`; Lemma 4.16 one-directional: `𝒵_1 = Spec k` DM while `𝒳` is not | holds |
| 4.1 finite type points and `[u/(u ×_𝒳 u)]` | `Spec ℤ_(p)` generic; `𝔸¹_k` generic; `[𝔸¹/𝔾_m]` at `1`; `BG`, `G = 𝔸¹/ℤ`; one-point `𝒵 → 𝒳` lft | `Spec ℚ → Spec ℤ_(p)` an open immersion, of finite type; `Spec k(t) → 𝔸¹` not lft though `𝒵_η` exists; `Spec k → [𝔸¹/𝔾_m]` open immersion; `u ×_𝒳 u = G` not a scheme, so only the gap covers the quotient; (2) ⇒ (1) by 18.6 on `𝒵` and 18.4 | holds |
| 4.2 flat locally quasi-finite presentations | `Bμ_p/𝔽_p`; `𝔸¹_ℚ/ℤ` generic; `B𝔾_m`; `B(ℤ/2)` | fibre `μ_p` finite: quasi-DM, not DM (`μ_p` not unramified); `U' = Spec ℚ(t)`, `R' = ℤ × Spec ℚ(t)`, residual space `Spec ℚ(t)/ℤ`, not a field; a locally quasi-finite `U ×_{B𝔾_m} Spec k → Spec k` would have dimension `0` while `U ×_{B𝔾_m} Spec k → U` is a `𝔾_m`-torsor of relative dimension `1`, so `U = ∅`: no such cover, yet `𝒵` exists by 4.3; étale atlas, `𝒵 = B(ℤ/2)` | holds; hypothesis sufficient, not necessary, as the Check says |
| 4.4 locally Noetherian ⇒ residual gerbes | `Spec ℚ(t)/ℤ`; `[Spec k[x₀, x₁, …]/𝔾_m]`; `U/G` of Ex 100.11.6 | locally Noetherian, `𝒵 =` itself; not locally Noetherian, stabilizer a closed subgroup scheme of `𝔾_m × U`, affine so quasi-compact, `𝒵` by 4.3; not locally Noetherian, `Spec ℚ̄ → X` lft so `𝒵` by 4.1 | holds |
| 4.5 (headline) closed ⇔ closed immersion, locally Noetherian | `[𝔸¹/𝔾_m]`; DVR; `U/G` of Ex 100.11.6 | `B𝔾_m → 𝒳` closed, `Spec k → 𝒳` open not closed; `Spec(R/𝔪)` closed, `Spec K` open; the closed point has `𝒵 = Spec ℚ̄ → X` a monomorphism that is not a closed immersion (else `= X` by 0.5, but `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete, `U` not) | holds |
| 5.2 factorisation through `𝒵_x` | `id_{𝔸¹}`; `Spec k[ε] → 𝔸¹`; Ex 68.13.11; `𝒴 = ∅`; `Spec ℚ(t)/ℤ` | image `= 𝔸¹ ≠ {η}`; nonreduced, no factorisation; `Y → X` factors through no field point (orbit map `Γ → Y` has no section); vacuous; base of the gerbe is the space itself, locally Noetherian by its atlas, 68.13.9 applies | statement holds; route gap R03 |
| 5.3 (headline) `𝒵_x` a gerbe over `Spec κ(x)` for decent `𝒳` | `Spec ℚ(t)/ℤ`; `𝔸¹_ℚ` at `t² + 1`; `[Spec ℂ/(ℤ/4)]_ℝ` | not decent (`Spec ℚ(t) ×_X Spec ℚ(t) = ⊔_ℤ Spec ℚ(t)`), base not a field; `κ = ℚ(i)`; base `Spec ℂ/(ℤ/4) = Spec ℝ`, `κ = ℝ`, no real object since `H¹(ℝ, ℤ/4) = Hom(ℤ/2, ℤ/4) = {0, 2}` both map to `0 ∈ H¹(ℝ, ℤ/2)` | holds |
| 5.5 fppf image; lfp iff finite | `Spec κ(t) → Spec κ`; finite `k/κ`; `k = κ(x)`; `BG_k` at `k̄`; a finite-over-`κ(x)` object `y` of `𝒵_x` | `κ(t)` not finitely generated: not lfp, no fppf cover of `Spec κ` factors; lfp by cancellation along the lfp gerbe `𝒵_x → Spec κ(x)`, image `= 𝒵_x` by local essential surjectivity; identity; a `k`-hom `k̄ → κ''` with `κ''/k` finite is impossible, image proper; if `y` were fppf-locally a pullback of `x`, the `κ(x)`-linear `k → κ''` (isomorphic objects have equal images in `Spec κ(x)`) with `κ''` finite over `κ(x)` forces `k` finite | holds |
| 6.2 (headline) `𝒵_x ×_{𝒵_x^♭} Spec k ≃ BG_x` | `BG_k` trivial torsor; `[Spec ℂ/(ℤ/4)]_ℝ` at `ℂ`; `Spec κ`, `k/κ` finite | `BG`, while `𝒵_x ×_𝒳 Spec k = G`; `B(ℤ/2)_ℂ`; `Spec k = B1` | holds |
| 6.3 equivalence criterion; neutrality; object over `κ(x)` not a section | `[Spec ℂ/(ℤ/4)]_ℝ`; `B(ℤ/2)_ℝ`; `𝔸¹_ℚ` at `t² + 1` over `ℚ(i)` and `ℂ`; `Spec ℚ(t)/ℤ`; quaternion `(t, −1)/ℚ(t)` | `Spec ℂ → Spec ℝ` not an isomorphism, `B(ℤ/2)_ℂ → 𝒵` not an equivalence; trivial torsor, `𝒵 ≃ B(ℤ/2)_ℝ`; `ℚ(i) → ℚ(i)` iso, `ℚ(i) → ℂ` not; base `= X` not a scheme, the identity is a section, no representative is an isomorphism onto `X`; residue of `(t, −1)` at `t = 0` is `−1 ∉ ℚ^{×2}`, non-split, while `(t², −1) ≅ (1, −1)` splits, so an object over `σ : t ↦ t²` exists with `κ → K = σ` not onto | holds |
| 6.4 (headline) rational points: `𝒵_x ≃ BG_x`, closed immersion at closed `x` | `k = k̄`, closed `x`; `Bμ_p/𝔽_p(t)`; `Spec k → Spec κ`, `k/κ` finite nontrivial | section `Spec k → 𝒵_x^♭` is a monomorphism, 3.2 makes it an isomorphism (`𝒵_x^♭` reduced locally Noetherian one-point by 3.4, flat fp point by 3.1), 6.3 gives `BG_x`, 4.5 the closed immersion; `μ_p` not smooth and the statement holds; `𝒵_x = Spec κ ≠ Spec k = BG_x` without the section | holds |
| 7.1 neighbourhoods | `𝔸²` at `0`; `[𝔸¹/𝔾_m]`; `BG`; local Artinian `A`, `𝔪^{n+1} = 0` | `k[x,y]/(x,y)²` of length 3; `[Spec k[t]/(t^{n+1})/𝔾_m]`; ideal `0`, all neighbourhoods `BG`; closed point through `𝒵_x` (3.4) ⇒ `ℐ·A ⊆ 𝔪_A` ⇒ `(ℐ·A)^{n+1} = 0` ⇒ factors through `V(ℐ^{n+1})` by 0.4 | holds |
| 7.2 normal space and weights | `[𝔸¹/𝔾_m]` at `0`; `BG`; `[𝔸ⁿ/GLₙ]`; `𝔸²`; chart `W = U ×_𝒳 𝒵_x` | `(λ·t)(a) = t(λ⁻¹a) = λ⁻¹a`: `ℐ/ℐ² = k·t` of weight `−1`, `N_0` weight `1`; `0`; coordinates the dual of the standard representation, `N_0 = kⁿ`; `k²` trivial; `J = ℐ·O_U` since `U → 𝒳` is flat, `u^*(J/J²) = x^*(ℐ/ℐ²)`; finite-dimensional as `ℐ` is coherent on a locally Noetherian stack | holds |
| 7.3 (headline) `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0`, `θ_x` iso iff `G_x` smooth | `Bμ_p/𝔽_p`; `B𝔾_m`; `[𝔸¹/𝔾_m]` at `0`; cusp; `𝔾_m × μ_p ⊆ GL₂`; characteristic 0 | `(b + cε)^p = b^p`, `μ_p(k) = 1`: `T = {1 + aε} ≅ k`, `N = 0`, `0 → k → k → 0 → 0`; `𝔾_m(k[ε]) → 𝔾_m(k)` onto: `T_{B𝔾_m} = 0`; `0 → 0 → k → k → 0` of weight one; trivial `G_x`, `T = N = (𝔪/𝔪²)^∨` of dimension 2; `dim Lie − dim = 2 − 1 = 1`; Cartier: every `G_x` smooth, `T_{BG_x} = 0` | holds |
| 7.3 chart step | `W = U ×_𝒳 BG_x`, `u ∈ U(k)` after a finite separable extension | `U_x = U ×_𝒳 Spec k` smooth nonempty over `k`, so it has a point over a finite separable extension; `W → BG_x` smooth (base change), `BG_x → Spec k` smooth (2.3), `W = Spec P/J` smooth, `exists_lift` lifts `id` along `P/J² → P/J`, the retraction splits `J/J² → (P/J) ⊗ Ω_{P/k}`, tensoring with `k(u) = k` keeps injectivity into `𝔪_u/𝔪_u²`; kernel of `T_{U,u} → N_x` is the annihilator of `J/J² ⊗ k`, that is `T_{W,u}`; `U_x ⊆ W` so `T_{U_x,u} ⊆ T_{W,u}`, and `T_{W,u}/T_{U_x,u} ≅ T_{BG_x}` by the sequence for the smooth representable `W → BG_x`; injectivity of `T_{BG_x} → T_{𝒳,x}` from full faithfulness of the monomorphism `i` | route correct |
| 7.3 `dim T_{BG_x} = dim Lie(G_x) − dim G_x` (repaired route) | `μ_p ⊆ GL₁`; `𝔾_m ⊆ GL₁`; `1 ⊆ GLₙ`; `α_p ⊆ GL₂` | `Q ×_{BG_x} Spec k`: `T`-points `(t : T → Q, trivialisation of t^*GLₙ)` = lifts `T → GLₙ`, so the fibre product is `GLₙ` with projection `π`; `q` smooth by descent along `Spec k → BG_x` (2.2, gap); fibre `π⁻¹(ē) = G_x`, `ker dπ_e = Lie(G_x)`; `Q = 𝔾_m` via `t ↦ t^p`, `dπ = p t^{p−1} dt = 0`, cokernel `k`, `1 − 0 = 1` (the `Bμ_p` Check); `Q = Spec k`, `0 = 1 − 1`; `π = id`, `0`; `Q` of dimension `4`, image of `dπ_e` of dimension `4 − 1 = 3`, cokernel `1 = 1 − 0`; `dim Lie ≥ dim` always, equality iff smooth at the pin | holds |
| gap:homogeneous-quotient-scheme | `𝔾_m/μ_p` (any `p`, incl. `𝔽₂`); `𝔾_a/α_p`; `GL₂/B`; `H = 1`, `H = G`; `(ℤ/2)_k/1`; `μ_p/1` | `𝔾_m` via `t ↦ t^p`, `1 = 1 − 0`; `𝔾_a` via `x ↦ x^p`, `1 = 1 − 0`; `ℙ¹`, `1 = 4 − 3`; `G`, `Spec k`; two points of dimension `0`, separated; `μ_p/1 = μ_p` not smooth: the smoothness clause needs `G` smooth, which the gap assumes and `GLₙ` satisfies | holds; SGA 3 (iv)(b) read |
| 7.4 quotient stacks | `GLₙ` on `𝔸ⁿ` at `0`; `𝔾_m` on `𝔸¹` at `1`; `SL₂` on binary forms at `uv`, char `≠ 2` | orbit `{0}`, `N = kⁿ`, `G_x = GLₙ`; orbit `𝔾_m` not closed, `1` open; `uv ↦ ac u² + (ad + bc) uv + bd v²`, stabilizer `ac = bd = 0`, `ad + bc = 1 = ad − bc` forces `b = c = 0`: the diagonal torus; antidiagonal gives `bc·uv = −uv`; orbit `{disc = 1}` (`disc = (ad − bc)² = 1`), dimension `3 − 1 = 2`, closed; `d(disc)_{(0,1,0)} = (−4r, 2q, −4p) = (0, 2, 0) ≠ 0`, `N_x ≅ k` trivial; `W = V ×_{[V/G]} [G·x/G] = G·x` smooth by 7.3's chart, so reduced | holds |
| Convention 5 (action direction) | `[𝔸¹/𝔾_m]` at `0`, ahr2020 line 482 | the source acts by precomposition `α ↦ α ∘ g` (a right action); the README's left action `α ∘ g⁻¹` is its inverse, and the weight witness (`N_0` and `T_0` of weight one) pins it; Alper's `g ∘ α` does not typecheck (round-3 erratum) | consistent |

Context and generality: Layer 7's standing hypotheses (field `k`, `𝒳` locally of finite type over `k`,
`x ∈ 𝒳(k)` closed with `p ∘ x = id`, `G_x` affine) are what 7.2–7.4 use ("affine" is needed for the
`GLₙ`-embedding; `B(𝔸¹/ℤ)` is the excluded instance); every target states its hypotheses in the
sentence and carries a locator (all 38, script-checked in `plan.json` and by reading the README);
every definition has an API list and at least three Checks (129 Checks, equal to the plan's 129 tests,
per target); every layer ends with Examples and Dependencies (8 of each); the README's 38 subsections
and the plan's 38 targets coincide.

**Duplication and ownership** (`roadmaps grep --fixed -i`, main and 470 open heads): "residual gerbe"
occurs only in the consumers LanglandsParameterStacks (§1.16 Checks, lines 521–522) and
FunctionFieldArithmeticPartII (lines 53, 7366, 7786 and later; its gap:zero-dimensional-dm-residual-gerbes
is declared on SchemeAndStackFoundations §1.20 and is answered by this roadmap's worked example; the
intake may repoint it when this design is accepted); "finite type point", "decent algebraic stack" and
"fppf image" occur nowhere else; "normal space" elsewhere is Riemannian, seminormal, Fisher-normal or
a tubular neighbourhood; "closed substack" elsewhere is used, never defined
(AlgebraicModuliForArithmeticGeometry §5.4 line 8928 uses closed substacks of DM stacks without defining
them, as the Scope says); "infinitesimal neighbourhood" elsewhere is for schemes and formal schemes
(SchemeAndStackFoundations §4, `V(I^{n+1})` of a scheme, which 0.4 cites as the scheme case);
"homogeneous-quotient-scheme" only in FlagVarieties (above). No roadmap cites
StackPointsAndResidualGerbes yet. This roadmap is the owner of every object it states.

**Shape and style.** Headings in upstream form (Summary, Scope and ownership, Conventions, Exact
supplier contracts, How to read the build, Layers 0–7 with `### k.n` prose, Downstream consumers,
Worked examples, References); Unicode mathematics and no LaTeX delimiters (grep); no pull-request
numbers, dates, job ids, hand-off words, "optional", "deferred", "(removed)" or machine paths (grep;
the only hits of "round" are inside "ground" and "background"); proposed names in italics per
Convention 10 (37 italic names), so no backticked name of this roadmap's own is claimed as a
declaration (the five backticked `Stacks.*` names are SchemeAndStackFoundations' §§1.18, 1.20, 1.22);
cross-roadmap citations by roadmap and section; sources cited by theorem number with cached-line
locators. The `sources.toml` parses: 14 entries unchanged from round 3 plus `sga3-vi-a` (author-page
copy of the re-edition, with a `version_note` on the editorial items (ii′) and (iv), and `cited_for`);
every work the README cites has an entry; nothing was added this round.

**Elaboration.** Not available (this lane does not elaborate; the design has no `Suggested.lean`).
Headline theorems from the Summary: characterisation of finite type points (1.1, 4.1); existence of
residual gerbes (4.2–4.4); `𝒵_x` a gerbe over `Spec κ(x)` with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2,
6.3); `𝒵_x ≃ BG_x` at rational points (6.4); the closed-immersion criterion (4.5); the exact sequence
`0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` (7.3). Each is planned with hypotheses, locator and route, and
recomputed above; statability at the pins is decided at the package stage (the carriers
`IsAlgebraicStack`, `inertia`, `Stacks.points` are SchemeAndStackFoundations targets, not pinned
declarations, so most headlines will be named in the module docstring as not statable).

## Not verifiable

- `lmb2000` Chapter 11, Définition 11.2 and `olsson2016` Chapter 11: paywalled, settled as
  uncertified; cited by locator only (5.5 and background). rydh2011 lines 1236–1245 describe the
  Laumon–Moret-Bailly definition and its error.
- Stacks, Morphisms of Spaces, Lemma 67.10.8 (rigidity of a monomorphism into a field, used in 0.2 and
  3.4) and Bootstrap, Lemma 80.11.7 (used inside the proof of Proposition 101.28.9 for 2.4): cited by
  the Stacks Project inside the proofs the README follows; the chapters are not in the manifest and
  were not opened this round (the statements are standard and the round-3 report opened the Morphisms
  of Spaces chapter).

## Source issues

- **Gap** in stacks-04XE at Lemma 100.10.1, printed page 23: the source omits the proof of unicity
  of the reduced closed substack with given support; it should pass through the presentation
  correspondence and the uniqueness of the reduced induced structure on the atlas (or Lemma 100.10.2
  on the fibre product of two candidates); affects nothing (the README's route supplies it).
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: the proof leaves to the reader that the
  reduced closed substack and the base of the dense open gerbe are locally Noetherian; it should cite
  Lemma 101.17.5 for the former and smooth descent along the gerbe (Lemma 101.33.8) for the latter;
  affects the proof (R03 adds the step to the roadmap's route).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3f218e374f3ba12521b7cf92df3c55906b4b15b5", "job": "REV-DESIGN-StackPointsAndResidualGerbes~4", "model": "fable", "worker": "chris-x17"} -->
