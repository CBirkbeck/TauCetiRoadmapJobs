<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7629#issuecomment-6716008476 -->
Review (claude) of 572e1ca

Verdict: needs_changes

1. **F01** (P3) 7.3's homogeneous-space step names a supplier that does not commit to it

   Location: `packages/StackPointsAndResidualGerbes/design/README.md` lines 1536–1537: "Embedding `G_x` in
   some `GLₙ`, `BG_x = [(GLₙ/G_x)/GLₙ]` gives `dim T_{BG_x} = dim Lie(G_x) − dim G_x`, which vanishes
   iff `G_x` is smooth (ReductiveGroups Layers 2–3)"; `design/plan.json` 7.3 prerequisites
   `roadmap:ReductiveGroups Layer 2`, `Layer 3`.

   Claim: ReductiveGroups Layers 2–3 provide that `GLₙ/G_x` is a scheme (or space) smooth over `k` of
   dimension `n² − dim G_x`, with `dim T_e(GLₙ/G_x) = n² − dim G_x`, and that `[(GLₙ/G_x)/GLₙ] ≃ BG_x`.

   Witness: `TauCetiRoadmap/ReductiveGroups/README.md` on main, lines 238–240: the quotient `G/H` "is
   first the fppf sheaf quotient; whether it is represented by a scheme … is a theorem with
   hypotheses, not automatic"; line 303 (3A.2): "no representability theorem for G/H is a premise";
   line 369: "It does not assume an algebraic quotient G/H was already represented". No bullet of Layer
   2 or 3 states smoothness or the dimension of `G/H`. The computation itself is right: for
   `μ_p ⊂ 𝔾_m`, `𝔾_m/μ_p ≅ 𝔾_m` through `t ↦ t^p`, `dπ_e = 0`, `T_{Bμ_p} = k/0 = k` and
   `dim Lie(μ_p) − dim μ_p = 1 − 0 = 1`, the value of the 7.3 Check; for `G` smooth, `dπ_e` is onto
   `T_e(GLₙ/G)` of dimension `n² − dim G` and `T_{BG} = 0`.

   Repair: in 7.3 list the inputs of this step item by item in the `*Needs:*` line: "ReductiveGroups
   Layer 3 (`GLₙ/G_x` is a quasi-projective scheme, smooth over `k`, of dimension `n² − dim G_x`, and
   `GLₙ → GLₙ/G_x` is a `G_x`-torsor), Layer 2 (`dim Lie(G_x) = dim G_x` iff `G_x` smooth); 2.2 (the
   gerbe `[(GLₙ/G_x)/GLₙ] → Spec k` with the section `e` has automorphism group `G_x`, so it is
   `BG_x`)", and the same in `plan.json`. At the package stage, if ReductiveGroups Layer 3 still does
   not state the quotient clause, declare it as a gap on ReductiveGroups Layer 3 (one sentence: the
   fppf quotient of an affine group scheme of finite type over a field by a closed subgroup scheme is
   a quasi-projective scheme, smooth when the group is, of dimension the difference of dimensions,
   the projection being a torsor). Tested: with the clause named, the `μ_p` and smooth instances above
   compute as before; nothing else in 7.3 changes.

2. **F02** (P3) three `*Needs:*` lines and their `plan.json` prerequisites disagree

   Location: `design/README.md` line 434 (0.2 `*Needs:*`: §1.18, §1.19, §1.8 and two gaps) against
   `design/plan.json` 0.2 `prerequisites` (adds `roadmap:SchemeAndStackFoundations §1.20`); README
   line 619 (1.1 `*Needs:*`: §1.20, Mathlib, one gap) against `plan.json` 1.1 (adds `target:0.5`);
   README line 1017 (3.4 `*Needs:*`: "0.1, 0.2, 2.1, 2.3, 2.4, 2.5, 3.1–3.3") against `plan.json` 3.4
   (has `target:3.3` only, not 3.1 and 3.2).

   Claim: every `*Needs:*` line lists what the statement and route need, and agrees with the plan.

   Witness: script comparison of the 38 targets (gap slugs agree everywhere; targets and sections
   differ exactly for 0.2, 1.1, 3.4). 1.1's second API bullet says "the proof uses the reduced induced
   locally closed substack of 0.5", so 0.5 is a route input of 1.1; 0.2's API uses `|f|` and `I_𝒳`
   (§1.20); 3.4's route uses 3.1 (Lemma 100.11.3's flat finitely presented point) and 3.2.

   Repair: add "0.5" to 1.1's `*Needs:*` and "§1.20 (`Stacks.points`, `inertia`)" to 0.2's
   `*Needs:*`; add `target:3.1` and `target:3.2` to `plan.json` 3.4 `prerequisites`. Tested: the
   script then reports no difference for any target.

Needs changes: two P3 findings (R01, R02), nothing blocking; a fix round applies them before the
package stage. The fifteen declared supplier gaps are contracts the review relies on (listed under
`## Verified sound`), not findings. The round-2 findings are all repaired; the repaired passages, the fifteen
sampled targets and every statement a finding touches were recomputed below.

## Round-2 findings, checked one by one

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P2) 6.3 "neutral iff object over `Spec κ(x)`" | repaired | README 6.3 lines 1386–1389: "`𝒵_x` is neutral iff some representative `x : Spec k → 𝒳` has `κ(x) → k` an isomorphism, and then `𝒵_x ≃ BG_x` for that representative; iff some representative `Spec κ(x) → 𝒳` induces the identity `κ(x) → κ(x)`, that is, comes from a section"; line 1390: "An object of `𝒵_x` over `Spec κ(x)` is a section only when its field homomorphism … is the identity"; the quaternion witness is the fifth Check (lines 1413–1422) and `plan.json` test `object_not_section`. Recomputed below. |
| F02 (P3) descent of isomorphisms cited to the wrong gap | repaired (by a different route) | 6.3 lines 1393–1397: forward direction through 2.1's uniqueness of the base ("`Spec k = (BG_x)^♭ ≅ 𝒵_x^♭` under `BG_x`; it is the given `Spec k → 𝒵_x^♭`, since `BG_x → 𝒵_x^♭` factors through `Spec k` uniquely"); `*Needs:*` ends at "6.2"; `plan.json` 6.3 drops gap:stack-morphism-permanence. The route is sound: the composite `BG_x → 𝒵_x → 𝒵_x^♭` equals `BG_x → Spec k → 𝒵_x^♭` by construction of 6.2, and 2.1's API gives both the uniqueness of the base and the unique factorisation of a morphism to an algebraic space. Instances below. |
| F03 (P3) gap omits Lemma 101.17.5 | repaired | README lines 259–263: "…and that an algebraic stack locally of finite type over a locally Noetherian algebraic stack is locally Noetherian (… 101.17.2–101.17.8 with 101.17.5 for the last clause …)"; the same sentence also now carries Lemmas 100.3.1 and 100.3.3 (lines 255–259), cited by 0.2 and 0.3; `plan.json` `needs` identical in content; `neededBy` adds 7.2. |
| F04 (P3) "locally separated" undefined | repaired | Convention 3 lines 100–105: "…are `RepresentableProperty` of §1.9's `QuasiCompactSpace`, `QuasiSeparatedSpace` or `LocallySeparatedSpace` … stable under base change and fppf local on the target (stacks-04XE lines 142–206, items (1), (2) and (31))"; 1.4 `*Needs:*` line 722 cites §1.9; Layer 1 Dependencies line 749; `plan.json` 1.4 has §1.9. Items (1), (2), (31) verified at stacks-04XE lines 144, 146, 205. |
| F05 (P3) `quotientStack_algebraic` for groupoids in spaces | repaired | 2.3 line 825, 3.2 line 959, 4.1 line 1075, 4.2 line 1105, 4.4 line 1148 now attribute algebraicity of `[u/R]`, `[U'/R']`, `[Spec k/R]`, `[U/G]` to gap:flat-groupoid-quotients (Theorem 97.17.2, Lemma 97.18.3); supplier contract §1.21 (lines 235–238) states the scheme case only for `quotientStack_algebraic`. Witness recomputed: `BG` with `G = 𝔸¹_k/ℤ`, `u ×_𝒳 u = G` not a scheme. |

## Verified sound

**Dependency gate** (no UPWARD or CYCLE line):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 244 roadmaps, 2392 edges, 0 problem(s)
```

**Citation resolver** on the README: no cross-roadmap citation and no Lean name found nowhere (the
11 leads in the worker's earlier run are SchemeAndStackFoundations README names; each resolves, see
below). **Overlaps**: no open pull request changes this roadmap; no cited id dropped or defined only
by an open revision; the closest roadmaps in vocabulary are five revisions of SchemeAndStackFoundations
(#1276, #1656, #1807, #1808, #1854), revisions of a roadmap on main, not dependencies; the README
cites main.

**Principles.** Every statement is at the Stacks Project generality (absolute, any base, no
"good" cases); no roadmap is re-planned (ownership greps below); supply is downward
(SchemeAndStackFoundations and ReductiveGroups on main at `65930ba`;
AlgebraicModuliForArithmeticGeometry is a new-roadmap pull request at merge-order position 32,
before the candidate's place); statements are the author's own words with theorem numbers and
cached-line locators, no passage copied (spot-checked 1.3, 2.1, 3.4, 4.1, 4.2, 6.3 against the
text); no algorithm; no Lean file at the design stage, so no sorry'd data or `set_option`.
Untrusted text: nothing in the README, the supplier READMEs, the sources or the board package
instructed anything.

**Sources: the seeded sample**, each read at the cited lines; theorem number, page, hypotheses and
statement agree with the README:

| Target | Source lines read | Result |
|---|---|---|
| 1.3 | stacks-06RD 497–543 (Remark 101.5.2, Def 101.5.3), 544–564 (Lemma 5.4 (4), pseudo-torsor), 591–618 (Lemmas 5.6, 5.7), 1667–1674 (`G_x`, base change), 1690–1697 (19.2, "Proof. Omitted"), 1698–1706 (Remark 19.3), 1707–1725 (19.4 via Descent on Spaces 11.15; Remark 19.5) | correct |
| 1.4 | stacks-06RD 1675–1689 (Lemma 19.1, six cases; proof through Lemma 6.1, Decent Spaces §6 and 15.2, More on Groupoids in Spaces 9.4 and 10.3, Spaces over Fields 10.8) | correct; the README's route is the source's |
| 2.1 | stacks-06QB 2613–2617 (Def 28.1), 2624–2640 (28.2, base = sheafification of isomorphism classes), 2641–2663 (28.3–28.5) | correct; uniqueness of the base is the proof of 28.2 |
| 2.3 | stacks-06QB 2696–2721 (28.7–28.8); stacks-06RD 3335–3357 (33.7 "even if G is not smooth", 33.8) | correct |
| 2.5 | stacks-06QB 2821–2843 (Prop 28.11), 2862–2875 (28.13, openness from 27.15), 2876–2890 (28.14) | correct |
| 2.6 | stacks-06QB 2919–2938 (Prop 29.1; "we omit the proof that W exists"), 2943–2953 (Ex 29.2) | correct |
| 3.4 | stacks-06ML 1306–1310 (Ex 11.9), 1312–1337 (11.10–11.12); stacks-06RD 452–456 (4.16), 4831–4839 (51.1); stacks-06QB 2846–2861 (28.12); stacks-decent-spaces 1500–1540 (13.5, Def 13.6) | correct |
| 4.1 | stacks-06RD 1609–1665 (Lemma 18.7 with its proof: `u`, `R = u ×_𝒳 u`, Theorem 97.17.2, Lemma 97.17.1, descent along `u ×_𝒳 U → 𝒵 ×_𝒳 U`) | correct |
| 4.2 | stacks-06RD 3059–3095 (Lemma 31.2 and proof: `U'`, `R'`, Spaces over Fields 10.9, Morphisms of Spaces 28.7, Theorem 97.17.2, Groupoids in Spaces 25.1); stacks-decent-spaces 1500–1531 (13.5) | correct; the README's statement is the content of the proof |
| 4.3 | stacks-06QB 2893–2904 (28.15: `𝒵_x = (𝒳 ×_X Z_x)_red`, Lemma 17.5); stacks-06RD 3048–3056 (31.1) | correct |
| 5.5 | rydh2011 1236–1245 (the error of LMB Déf. 11.2, finite extensions); stacks-06ML 1293–1297 (footnote) | correct |
| 6.3 | stacks-06QB 2664–2695 (28.6); alper-moduli 6998–6999 (4.5.16 (2)), 16539–16540 | correct |
| 6.4 | alper-moduli 6993–7024 (Prop 4.5.16: Noetherian stack, finite type point; (2) finite type over `k`, smooth affine stabiliser), 16539–16540; ahr2020 476–478 (quasi-separated, affine stabilisers) | correct; the README's wider statement is proved by its own route, instances below |
| 7.1 | ahr2020 248–252 (`X^{[n]}_Z` by `I^{n+1}`; neighbourhoods of a closed point through the residual gerbe) | correct |
| 7.2 | ahr2020 39–43 (`N_x = (I/I²)^∨`), 477–480 (`i^* I`, `G_x`-representation) | correct |

Also read: stacks-04XE 105–125 and 140–250 (Lemmas 100.3.1–100.3.4 and the list of fppf-local
properties, items (1), (2), (14), (17), (23), (29), (30), (31) used by Conventions 3 and Layer 0),
765–800 and 853–894 (Definitions 9.1, 9.9, Lemmas 9.2–9.6, 9.10–9.12); stacks-06ML 1199–1286
(11.4–11.7, Example 11.6), 1338–1368 (11.13–11.14); stacks-06RD 4842–4878 (51.2–51.4);
stacks-decent-spaces 1565–1616 (13.9–13.11); stacks-sheaves-on-stacks 953–955 (Prop 96.14.3);
rydh2011 1268–1305 (Theorem B.2 and proof); alper-moduli 16526–16552 (7.4.39, Exercise 7.4.40).

**Gap locators opened in the chapters fetched this round** (nine Stacks chapters added to
`sources.toml`, each recorded with authors, title, year, locator and `cited_for`; no entry of the
author's was changed): stacks-spaces-over-fields lines 834–846 (72.10.8: locally quasi-finite over
`k` iff a scheme locally quasi-finite over `k`), 847–853 (72.10.9: a monomorphism into a space
locally quasi-finite over `k` is locally quasi-finite; the gap's "to a disjoint union of spectra of
fields" is this lemma componentwise, as in the proof of 101.31.2), 1213–1219 (72.16.1);
stacks-descent-spaces 424–429 (74.9.2), 442–447 (74.9.4), 739–741 (74.11.15);
stacks-artin-axioms 292–294 (98.5.2), 393 (Section 98.8, "Tangent spaces");
stacks-morphisms-spaces 904–909 (67.10.8), 2688–2693 (67.28.7), 3050–3057 (67.32.1: `f` of finite
type over reduced `Y`, dense open over which `f` is flat, locally of finite presentation and
quasi-compact: the gap's hypotheses); stacks-groupoids-spaces 1490–1495 (78.25.1), 1663–1667
(78.27.1), 1680–1685 (78.27.2); stacks-more-groupoids-spaces 373–378 (79.9.4), 570–572 (79.10.3,
footnote: decent suffices); stacks-algebraic-stacks 908–914 (94.16.1), 1028–1031 (Remark 94.16.3);
stacks-descent 2277 (35.18.1), 2306 (35.18.4), 2320–2325 (35.19.1–35.19.2);
stacks-properties-spaces 799–802 (66.13.3). Every number agrees with its gap sentence.

**Supplier citations resolved now** (SchemeAndStackFoundations on main at `65930ba`, line of first
occurrence in its README): §1.2 `quasiFiniteDescent`, `spaceFppfDescent` (2093–2096); §1.7 `points`,
`opensEquiv` (2236), `points.test_no_residue_field` (2247); §1.8 `Spaces.EtaleLocal` (2295);
§1.9 `IsSeparatedSpace`, `QuasiSeparatedSpace`, `LocallySeparatedSpace` ("immersion"),
`QuasiCompactSpace` (2301–2303), `IsProperSpace` (2305); §1.12 `translationQuotient_space`
(`𝔸¹_ℚ/ℤ`, 2412); §1.13 `Groups.GroupSpace` (2454); §1.14 `Groupoid.restrict` (2473),
`stabilizerAt` (2479); §1.15 `Groups.IsTorsor` (2585); §1.16 `twistingBijection` (2595, the
"twisting bijection" of the 2.2 Check); §1.17 `artinBootstrap` (2652); §1.18 `StackInGroupoids`
(2747), `Stack.stackification` (2758), `twoFiberProduct` (2780); §1.19 `IsRepresentableBySpaces`
(2819), `RepresentableProperty` (2821), `IsAlgebraicStack` (2824), `IsDeligneMumford` and
`.iff_unramified_diagonal` (2828–2829); §1.20 `inertia`, `inertia.representable`,
`automorphismGroup`, `setoid_criterion`, `SmoothLocal`, `SmoothLocal.atlas_independent`,
`IsSeparatedStack` (2845–2852), `Stacks.points.ofSpace`, `.atlasOpenSurjective`,
`.pullbackSurjective` (2857–2860), `QuasiCompactStack` (2879), `stack_presentation` (2887);
§1.21 `Stack.quotient` (2954), `actionQuotient.torsorEquiv` (2965), `quotientStack.π` (2966),
`quotientStack_algebraic` (2967, groupoid schemes), `test_real_points` (2981); §1.22 `Stacks.QCoh`
(2991), *QCoh.presentationEquiv* for `[U/R]` (2993–2994, Proposition 96.14.3),
`test_BG_representations` (3008, a Check); §1.23 `moduliFunctor`, `toModuliSheaf` (3023); §4.12
`generic_flatness` (5615, integral base); §4.13 `IsRegular` (5645), *IsRegular.of_smooth* (5647).
AlgebraicModuliForArithmeticGeometry at the head of #853: §4.1 `IsGerbe` (1877),
`IsGerbe.equivalence_iff` (1897), `relativeGerbe` (1905), `relativePullback` (1923),
`relativeComposition` (1931), `relativeDescent` (1939); §8.1 `deformationGroupoid` (9870, `S`
locally Noetherian, `k` of finite type), "Change of residue field pulls back the object and framing"
(9878), `deformationFunctorOfPoint` (9888, "under (RS)"), `stabiliserActionOnDeformations` (9892);
§8.3 `FramedDeformation` (9946), "The new frame is `α∘g`" (9955, Convention 5's right action),
`framedDeformation_twoFibre` with "A representable formally smooth morphism induces a smooth
morphism of predeformation categories" (9966–9968), `framedTangent_exactSequence` (10006, the
six-term sequence under RS). (RS) for algebraic stacks is assumed there, not proved:
gap:algebraic-stacks-satisfy-rs is correctly declared. ReductiveGroups on main: Layer 1
"representations = comodules" (176), Layer 2 `Lie(G)` and "the smoothness criterion" (227–231),
Layer 3 quotients (234–240, see R01), Layer 3A orbits, orbit map, scheme-theoretic stabiliser and
the reduced locally closed orbit (249–303; its geometric statements assume `k` algebraically closed
and `X` separated of finite type, which 7.4 does not need: 7.4 assumes the orbit closed and uses the
reduced induced structure of 0.5, so only 3A's vocabulary is consumed).

**Library declarations at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, from
`lake-manifest.json`; opened at file and line): `CategoryTheory.Pseudofunctor.IsStack`
(Sites/Descent/IsStack.lean:49, a `Prop` class), `AlgebraicGeometry.Scheme.fppfTopology`
(Sites/Fpqc.lean:54), `Scheme.residueField` (ResidueField.lean:45),
`Scheme.IdealSheafData.vanishingIdeal` (IdealSheaf/Basic.lean:564), `.subscheme` and `.subschemeι`
(IdealSheaf/Subscheme.lean:453, 470), `LocallyOfFiniteType.jacobsonSpace`
(Morphisms/FiniteType.lean:112), `LocallyOfFinitePresentation.iff_locallyOfFiniteType`
(Noetherian.lean:271, `[IsLocallyNoetherian Y]`), `retractionKerCotangentToTensorEquivSection`
(Smooth/Kaehler.lean:324, surjective `P →ₐ[R] S`, no smoothness of `P`),
`Algebra.FormallySmooth.exists_lift` (Smooth/Basic.lean:125, `[FormallySmooth R A]`, nilpotent
ideal), `finite_of_finite_type_of_isJacobsonRing` (Jacobson/Ring.lean:691, `[IsJacobsonRing R]
[Field S] [Algebra.FiniteType R S]`, a field is Jacobson); Tau Ceti `SchPseudofunctor`
(Stack/Basic.lean:37), `SchemePresheaf`, `Spaces.RepresentableDiagonal`, `Spaces.EtaleAtlas`,
`Spaces.IsAlgebraicSpace` (AlgebraicSpace/Basic.lean:68, 74, 113, 195; no separation axiom),
`TauCeti.Comodule` (Comodule/Basic.lean:50), `linearlyReductiveAffineGroupSchemeProperty`
(LinearlyReductive.lean:28–31).

**Declared gaps** (15): the same slugs in `plan.json` and the README (script-checked), each with a
named supplier and section and one `needs` sentence; each asks for something absent at the supplier
today (SchemeAndStackFoundations §§1.2, 1.7, 1.8, 1.9, 1.13, 1.19, 1.20, 1.21, 4.12, 4.13 on main
state none of them: §1.20 defines locally Noetherian stacks with atlas independence only, §1.2 has
fppf descent of spaces only, §4.12 `generic_flatness` is over an integral scheme, §4.13 has regular
schemes only; AlgebraicModuliForArithmeticGeometry §8.1 assumes (RS)). gap:stack-morphism-permanence
is one long sentence, but every clause is a permanence property of the same `SmoothLocal`
predicates and the intake announces it to one section; not compound in the sense of mixing
suppliers. The review relies on the declared gaps: stack-morphism-permanence, flat-lfp-open,
inertia-of-presentations, stack-separation-axioms, quasi-dm-flat-presentation,
flat-groupoid-quotients, decent-algebraic-spaces, quasi-separated-space-schematic-locus,
reduced-scheme-residue-field-factorisation, group-spaces-over-fields, quasi-finite-over-fields,
isomorphism-fpqc-local-spaces, generic-flatness-spaces, reduced-regular-smooth-local,
algebraic-stacks-satisfy-rs.

**Adversarial pass** (values computed on each side: the repaired passages, the sampled targets, the
headline theorems and the targets the findings touch; rows of round 2 with computed values were
reused where no repair touched the text):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 6.3 forward: `BG_x → 𝒵_x` equivalence ⇒ `Spec k ≅ 𝒵_x^♭` (new route) | `[Spec ℂ/(ℤ/4)]_ℝ` at `ℂ`; `B(ℤ/2)_ℝ`; `Spec ℚ(t)/ℤ`; quaternion gerbe at `y` over `σ` | bases `(B(ℤ/2)_ℂ)^♭ = Spec ℂ ≠ Spec ℝ`: neither side; `Spec ℝ = Spec ℝ`: both; `G_x = 1`, `BG_x = Spec ℚ(t) ≠ X = X^♭`: neither; `σ` not onto, `σ^*𝒵 ≃ B𝔾_m ≄ 𝒵`: neither | holds |
| 6.3 neutral ⇔ representative with `κ(x) ≅ k` ⇔ representative over `κ(x)` inducing `id` | quaternion gerbe `(t, −1)/ℚ(t)`; `B(ℤ/2)_ℝ`; `𝔸¹_ℚ` at `t² + 1`; `[Spec ℂ/(ℤ/4)]_ℝ` | residue at `t = 0` is `−1 ∉ ℚ^{×2}`, no section; `σ_*(t, −1) = (t², −1)` split, object over `σ ≠ id`: all three false; trivial torsor: all true; `t ↦ ±i`, both automorphisms of `ℚ(i)`: all true; lifts `Hom(ℤ/2, ℤ/4) = {0, 2} ↦ 0`: all false | holds; F01 repaired |
| 6.3 "object over `Spec κ(x)` need not be a section" (new Check) | the quaternion gerbe | `[P/GL₂]`, `P = Isom(M₂, A)` affine: affine diagonal, decent; one point (`GL₂` transitive on `P_{K̄} ≅ PGL₂`); smooth over `K`; gerbe over `Spec K` (locally isomorphic objects via `PGL₂ ← GL₂`), so `κ = K`; non-neutral, object over `σ` | Check correct |
| 5.3 Check `[Spec ℂ/(ℤ/4)]_ℝ` (reason added) | objects over `Spec ℝ` | `End(ℝ) = {id}`; `[Spec ℂ/(ℤ/4)] → [Spec ℂ/(ℤ/2)] = Spec ℝ` is a `ℤ/2`-gerbe (kernel acts trivially); a real object lifts `[Spec ℂ] ≠ 0 ∈ H¹(ℝ, ℤ/2)` to `H¹(ℝ, ℤ/4) = {0, 2}`, both ↦ 0 | holds |
| Worked example: representative with `p ∘ x = id` | `K = K̄`, closed point, finite type representative `Spec k` | `k` finitely generated field over `K` ⇒ finite ⇒ `K = k`; `x' = x ∘ φ⁻¹` has `p ∘ x' = φ ∘ φ⁻¹ = id` | holds |
| Lemmas 100.3.1/100.3.3 clause (gap) | 0.2 (4) ⇒ (1), `P` = monomorphism; 0.3 with (open, closed) immersions | item (29) line 201; items (14), (17), (30) lines 170–204: fppf local on the target and stable under base change | holds |
| Convention 3: quasi-compact, quasi-separated, locally separated via `RepresentableProperty` | `B𝔾_m`; `B(𝔸¹_k/ℤ)`, char 0 | items (1), (2), (31) at stacks-04XE 144–206; affine diagonal ⇒ all three, `G_x = 𝔾_m` a scheme; `𝔸¹ ×_G 𝔸¹ = ⊔_ℤ 𝔸¹ → 𝔸²`, `x ↦ (x, x + n)`: not quasi-compact; image `⋃_n {y = x + n}` is dense (a polynomial vanishing on infinitely many distinct lines is 0) and omits the generic point, hence not locally closed; in char `p` the action is not free (`n = p` acts trivially), so "characteristic zero" is needed | holds; F04 repaired |
| 1.4 `G_x` a scheme in six cases | `Bℤ`; `B(ℤ/2)`; `Bμ_p/𝔽_p`; `B𝔾_m`; `B(𝔸¹/ℤ)` | `ℤ_k = ⊔_ℤ Spec k` étale, not quasi-compact; `(ℤ/2)_k` finite étale; `μ_p` not unramified so `Bμ_p` not DM, but quasi-DM (`μ_p` quasi-finite) and `μ_p` a scheme; `𝔾_m` not quasi-finite so `B𝔾_m` not quasi-DM, diagonal affine so (1) applies; `𝔸¹/ℤ` not a scheme and no case applies | holds |
| 1.3 `G_x` and invariance | `B(μ_3)_ℚ`; `Bμ_p/𝔽_p`; `[𝔸¹/𝔾_m]` | `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ_3)) = ℤ/3`: "`G_x(k)` trivial" is not a property of the point; `μ_p(𝔽̄_p) = 1` while `μ_p ≠ 1`; `G_0 = 𝔾_m`, `G_1 = 1`; Lemma 19.2's omitted proof: two representatives have a common extension `K` with `G_{x_i} ⊗ K` isomorphic, and `P` transfers both ways | holds |
| 2.1 gerbe, base, descent | `BG → Spec k`; `[𝔸¹/𝔾_m]`; `Spec k → BG`; an algebraic space `X` | base `Spec k`; objects `0`, `1` over `k̄` have stabilisers `𝔾_m`, `1`, not locally isomorphic; automorphisms `G(T)` of the trivial torsor do not lift to `Spec k`; `X^♭ = X` | holds |
| 2.3 smooth gerbes | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p`; `B𝔾_m/ℤ` | `[Spec 𝔽_p/μ_p]` with Lemma 33.7 (`X = Spec 𝔽_p` smooth) is smooth; the atlas has fibre `μ_p`, flat finitely presented, not smooth; base change to `𝔽_p` is `B𝔾_{m,𝔽_p}` | holds; attribution F05 repaired |
| 2.5 diagonal criterion, universal homeomorphism, quasi-compact diagonal | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ → Spec k` | `Δ` = unit section `Spec k → 𝔾_m`, a closed immersion with fibre dimension drop, not flat; `k` is not flat over `k[ε]` (`(ε) ⊗ k → k` is zero, `(ε) → k[ε]` injective) while `|Spec k| → |Spec k[ε]|` is a universal homeomorphism; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` | holds |
| 2.6 dense open gerbe | `[𝔸¹/𝔾_m]`; Example 101.29.2; `[Spec k[ε]/𝔾_m]` | stabiliser `V(a(λ − 1)) ⊂ 𝔸¹ × 𝔾_m` flat exactly over `a ≠ 0`: gerbe `Spec k`, largest; strata `μ_{pⁱ}`, `𝔾_m`; `B = k[ε][λ^{±1}]/((λ − 1)ε)`: `λ − 1 ∈ ann(ε)`, `λ − 1 ∉ εB` (nonzero in `B/εB = k[λ^{±1}]`), not flat; the only dense open is the whole one-point stack | holds |
| 3.4 base of `𝒵_x`; pullback formula | `Spec ℚ(t)/ℤ`; `[𝔸¹/𝔾_m]`; non-gerbe `[𝔸¹/𝔾_m] → Spec k` | free (`t + n = t ⇒ n = 0`), étale relation `⊔_ℤ Spec ℚ(t)`, one point, reduced, atlas Noetherian; `Spec F` with étale cover `Spec ℚ(t)` would make `ℚ(t) ⊗_F ℚ(t) = ∏_ℤ ℚ(t)` finite over `ℚ(t)`; `𝒵_0 = B𝔾_m` over `Spec k`; `𝒵_y ×_{Spec k} [𝔸¹/𝔾_m]` is the whole stack | holds |
| 4.1 finite type points and `[u/(u ×_𝒳 u)]` | `𝔸¹_k` generic; `Spec ℤ_(p)` generic; `BG`, `G = 𝔸¹/ℤ` | `Spec k(t) → 𝔸¹` exists, not of finite type; `ℚ = ℤ_(p)[1/p]` finite type; `u ×_𝒳 u = G` not a scheme, so only the gap covers it | holds; F05 repaired |
| 4.2 flat quasi-finite presentations | `Bμ_p/𝔽_p`; `𝔸¹_ℚ/ℤ` generic; `B𝔾_m` | atlas `Spec 𝔽_p → Bμ_p` flat, finitely presented, fibre `μ_p` finite: quasi-DM, not DM; `U' = Spec ℚ(t)`, `R' = ℤ × Spec ℚ(t)`, residual space `Spec ℚ(t)/ℤ`, not a field (consistent with 3.4); `𝔾_m` not quasi-finite: hypothesis sufficient, not necessary (4.3 applies) | holds |
| 4.3 gerbes and quasi-compact inertia | `Bℤ`; `B(𝔸¹/ℤ)`; `[𝔸¹/𝔾_m]` | `(Bℤ ×_{Spec k} Spec k)_red = Bℤ`, inertia `⊔_ℤ Spec k` not quasi-compact: first statement only; `G → Spec k` quasi-compact (image of `𝔸¹`), not quasi-separated: both; `𝒵_1 = Spec k` is the dense open gerbe of `|𝒳|` | holds |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; finite `k/κ`; `BG_k` at `k̄` | `κ(t)` not finitely generated ⇒ not lfp; cancellation (lfp along the gerbe) gives lfp of `Spec k → 𝒵_x` ⟺ `k` finite over `κ(x)` by `finite_of_finite_type_of_isJacobsonRing`; a representative over `κ'` finite over `κ(x)` (closed point of an fppf cover) that is locally a pullback of `x` gives a `κ(x)`-linear `k ↪ κ(t')` finite: contradiction for `k̄/k` infinite | holds |
| 6.4 rational points | `Bμ_p/𝔽_p(t)`; `Spec k → Spec κ`, `k/κ` finite nontrivial; `k = k̄` | section of `𝒵_x^♭ → Spec k` is a mono, 3.2 (via 3.1's flat finitely presented point of the reduced locally Noetherian one-point base) makes it an iso, 6.3 gives `BG_x`; `μ_p` not smooth and the statement holds; `𝒵_x = Spec κ ≠ Spec k = BG_x` without the section; closed points have `k`-representatives | holds |
| 7.1 neighbourhoods | `𝔸²_k` at `0`; `[𝔸¹/𝔾_m]`; `BG`; Artinian `A`, `𝔪^{n+1} = 0` | `k[x, y]/(x, y)²` of length 3; `[Spec k[t]/(t^{n+1})/𝔾_m]`; ideal `0`; closed point in `𝒵_x` ⇒ `ℐ·A ⊆ 𝔪_A` ⇒ `(ℐ·A)^{n+1} = 0`, 0.4's factorisation | holds |
| 7.2 normal space | `[𝔸¹/𝔾_m]`; `BG`; `[𝔸ⁿ/GLₙ]`; `𝔸²` | `λ·t = λ⁻¹t` (functions contragredient), `ℐ/ℐ² = k·t` weight `−1`, `N_0` weight `1`; `0`; coordinates = dual of standard, `N_0 = kⁿ`; `k²` trivial; `x^*(ℐ/ℐ²)` finite-dimensional since `ℐ` is coherent on a locally Noetherian stack | holds |
| 7.3 exact sequence (headline) | `Bμ_p/𝔽_p`; `B𝔾_m`; `[𝔸¹/𝔾_m]`; cusp | `(b + cε)^p = b^p`, `μ_p(k) = 1`: `T = {1 + aε} ≅ k`, `N = 0`, kernel `k`; `𝔾_m(k[ε]) → 𝔾_m(k)` onto: `T_{B𝔾_m} = 0`; `0 → 0 → k → k → 0`; `T = N = (𝔪/𝔪²)^∨` of dim 2 | holds; owner note R01 |
| 7.3 chart argument | `W = U ×_𝒳 BG_x`, `u ∈ U(k)` | `W → BG_x` smooth (base change), `BG_x → Spec k` smooth (2.3): `W` smooth, `A = P/J` formally smooth, `exists_lift` lifts `id_A` along `P/J² → A`, the retraction splits `J/J² → A ⊗ Ω_{P/k}`, tensoring with `k(u)` keeps injectivity, `Ω_{P/k} ⊗ k(u) = 𝔪_u/𝔪_u²` at a rational point; kernel of `T_{U,u} → N_x` is `T_{W,u}`; `T_{U_x,u} → T_{W,u} → T_{BG_x} → 0` from the smooth `W → BG_x` | route correct |
| 7.4 quotient stacks | `GLₙ` on `𝔸ⁿ`; `𝔾_m` on `𝔸¹` at `1`; `SL₂` on binary forms, `x = uv`, char `≠ 2` | orbit `{0}`, `N = kⁿ`; orbit `𝔾_m` not closed, `1` open; `diag(a, a⁻¹)` fixes `uv`, the antidiagonal sends `uv ↦ −uv`, orbit `= {disc = 1}` of dim 2, `d(disc)_{(0,1,0)} = (0, 2, 0) ≠ 0`; `[G·x/G]` is reduced, locally Noetherian, one-point (every point of `G·x` is a translate of `x` over an extension) and a closed substack (0.3), so it is `𝒵_x`, with `W = G·x` in 7.3's chart | holds |

Context and generality: Layer 7's standing hypotheses (field `k`, `𝒳` locally of finite type over
`k`, `x ∈ 𝒳(k)` closed with `p ∘ x = id`, `G_x` affine) are what 7.2–7.4 use; every target states
its hypotheses in the sentence and has a locator; every definition has an API list and at least
three Checks (Checks per target counted: 129, equal to the plan's tests, 38 targets); every layer
ends with Examples and Dependencies; the README's 38 subsections and the plan's 38 targets
coincide; gap slugs in every `*Needs:*` line agree with the plan, and every gap's `neededBy` is the
set of subsections citing it (script-checked); the only differences are R02.

**Duplication and ownership** (`roadmaps grep`, main and 476 open heads): "residual gerbe"
occurs only in the consumers LanglandsParameterStacks (§1.16 Checks, lines 521–522) and
FunctionFieldArithmeticPartII (#1831, lines 53, 7366, 7786 and after); "decent algebraic stack",
"finite type point" and "monomorphism of algebraic stacks" occur nowhere else; "normal space"
elsewhere is Riemannian, seminormal or Fisher-normal; "closed substack" elsewhere is used, never
defined (AlgebraicModuliForArithmeticGeometry §5.4 line 8928 defines a DM schematic closure using
closed substacks of DM stacks without defining them, as the Scope says). No roadmap cites
StackPointsAndResidualGerbes yet. This roadmap is the owner of every object it states. Remark, not
a finding: FunctionFieldArithmeticPartII declares its gap:zero-dimensional-dm-residual-gerbes on
SchemeAndStackFoundations (its README line 53); this roadmap's worked example answers it, and the
intake may repoint that gap here when this design is accepted; SchemeAndStackFoundations on main
states nothing about residual gerbes, so there is no second owner today.

**Shape and style.** Headings in upstream form; Unicode mathematics and no LaTeX delimiters
(grep); no pull-request numbers, dates, job ids, hand-off words, "optional", "deferred",
"(removed)" or machine paths (grep); proposed names in italics per Convention 10 (38 of them), so
no backticked name of this roadmap's own is claimed as a declaration; cross-roadmap citations by
roadmap and section; sources cited by theorem number with cached-line locators. The `sources.toml`
parses; its 14 original entries are unchanged and 9 Stacks chapters were appended (above).

**Elaboration.** Not available (this lane does not elaborate; the design has no `Suggested.lean`).
Headline theorems from the Summary: characterisation of finite type points (1.1, 4.1); existence of
residual gerbes (4.2–4.4); `𝒵_x` a gerbe over `Spec κ(x)` with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2,
6.3); `𝒵_x ≃ BG_x` at rational points (6.4); the closed-immersion criterion (4.5); the exact
sequence `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` (7.3). Each is planned with its hypotheses, locator and
route; statability at the pins is decided at the package stage (the carriers `IsAlgebraicStack`,
`inertia`, `Stacks.points` are SchemeAndStackFoundations targets, not pinned declarations, so most
headlines will be named in the module docstring as not statable).

## Not verifiable

- `lmb2000` Chapter 11, Définition 11.2 and `olsson2016` Chapter 11: paywalled, settled as
  uncertified; cited by locator only (5.5 and background). rydh2011 lines 1236–1245 describe the
  Laumon–Moret-Bailly definition and its error.
- Stacks, Morphisms, Proposition 29.28.2 (cited in gap:generic-flatness-spaces as the scheme
  background): the cached `stacks-morphisms-schemes` extraction has no statement under that number
  near its line 7102 range; not opened. The space-level Proposition 67.32.1, which the gap states,
  was opened.
- Descent on Spaces Lemma 74.8.4, Lemma 74.16.1 and Decent Spaces Lemma 68.19.1: cited only inside
  the Stacks Project's own proofs (33.7, 18.7, 72.10.9), not by the README; not opened.

## Source issues

- **Misprint** in alper-moduli at Exercise 4.5.11 (a), printed page 183: the source writes the
  stabiliser action on a framed tangent vector as composing `g` after the framing `α : x ≅ τ|_k`,
  which does not typecheck for `g ∈ Aut(x)`; it should be precomposition with `g` (or its inverse
  for a left action), as ahr2020 line 482 states; affects nothing.
- **Gap** in stacks-04XE at Lemma 100.10.1, printed page 23: the source omits the proof of unicity
  of the reduced closed substack with given support; it should argue through Lemma 100.10.2 applied
  to the fibre product of two candidates; affects nothing (the README's route supplies it).
- **Gap** in stacks-06RD at Lemma 101.19.2, printed page 36: the proof is omitted; it should apply
  the base-change formula for `G_x` to a common field extension of two representatives; affects
  nothing (the README's 1.3 API states the argument).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "572e1ca4f96fe28a92477a26f7ccf0389d28a100", "job": "REV-DESIGN-StackPointsAndResidualGerbes~3", "model": "fable", "worker": "chris-x10"} -->
