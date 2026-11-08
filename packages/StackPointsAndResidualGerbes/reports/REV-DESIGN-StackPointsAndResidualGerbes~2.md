<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7629#issuecomment-6714078387 -->
Review (claude) of 0555065

Verdict: needs_changes

1. **F01** (P2) 6.3: "neutral iff it has an object over `Spec κ(x)`" is false

   Location: `design/README.md` lines 1363–1365: "For decent `𝒳`, where `𝒵_x^♭ = Spec κ(x)` (5.3), the
   converse holds: `𝒵_x` is neutral iff it has an object over `Spec κ(x)`, iff some representative …";
   `design/plan.json` line 1724, API `neutral_iff`: "for decent X, Z_x is neutral iff it has an object
   over Spec kappa(x)".

   Claim: for decent `𝒳`, the gerbe `𝒵_x → Spec κ(x)` has a section iff `𝒵_x(Spec κ(x))` is nonempty.

   Witness: `K = ℚ(t)`, `σ : K → K`, `t ↦ t²` (a non-surjective field endomorphism), `A` the quaternion
   algebra `(t, −1)` over `K`, `𝒵` the gerbe of trivialisations of `A` (objects over `T`: pairs
   `(E, φ : End(E) ≅ A_T)`, `E` locally free of rank 2; `𝒵 = [P/GL₂]` with `P = Isom(M₂, A)` the
   `PGL₂`-torsor and `GL₂` acting through `PGL₂`). Computed: `𝒵` is an algebraic stack with affine
   diagonal, hence decent, reduced, locally Noetherian and one-point, so `𝒵` is its own residual gerbe
   with `κ = K`. It is not neutral: `[A] ≠ 0` in `Br(K)`, since the tame residue of `(t, −1)` at
   `t = 0` is `−1 ∈ ℚ^×/ℚ^{×2}`, nonzero. It has an object over `Spec K`: the morphism `Spec K → 𝒵`
   lying over `σ` given by `(K², M₂(K) ≅ A ⊗_{K,σ} K)`, which exists because `σ_*[A] = (t², −1) = 0`
   (`t²` is a square). So "has an object over `Spec κ(x)`" holds and "neutral" fails. An object of
   `𝒵_x` over `Spec κ(x)` is a section only when its image in `𝒵_x^♭ = Spec κ(x)` is the identity, and
   Convention 7 makes that image an arbitrary field homomorphism `κ(x) → κ(x)`.

   Repair: delete the clause "iff it has an object over `Spec κ(x)`" from README 6.3 and from
   `plan.json` `neutral_iff` (the chain then reads: neutral iff some representative has `κ(x) → k` an
   isomorphism iff `𝒵_x ≃ BG_x` for a representative with `κ(x) → k` the identity), or qualify it as
   "an object over `Spec κ(x)` whose image in `𝒵_x^♭` is the identity, that is a section". Make the
   same qualification in "`𝒵_x ≃ BG_x` for a representative defined over `κ(x)`": "defined over
   `κ(x)`" must mean `κ(x) → k` is the identity, since for the witness `y : Spec K → 𝒵` lies over
   `σ` and `BG_y → 𝒵` is not an equivalence (`σ` is not an isomorphism). Tested: with the
   qualification the witness object is excluded (it lies over `σ ≠ id`); on `[Spec ℂ/(ℤ/4)]_ℝ`,
   `B(ℤ/2)_ℝ`, `𝔸¹_ℚ` at `t² + 1` and `Spec ℚ(t)/ℤ` every Check keeps its value (`ℝ` has only the
   identity endomorphism; `ℚ(i)` only automorphisms).

2. **F02** (P3) 6.3's descent of an isomorphism is cited to a gap that does not contain it

   Location: `design/README.md` line 1370: "*Needs:* … gap:stack-morphism-permanence (fppf descent of
   isomorphisms along `𝒵_x → 𝒵_x^♭`)"; `design/plan.json` 6.3 `prerequisites`.

   Claim: gap:stack-morphism-permanence supplies "being an isomorphism descends along `𝒵_x → 𝒵_x^♭`".

   Witness: README lines 244–254, the gap's `needs` sentence: it covers flat, locally of finite
   presentation, locally of finite type, smooth, surjective and `QuasiCompactStack` only; "isomorphism"
   is not among them. The step is: `BG_x → 𝒵_x` is the base change of the morphism of algebraic spaces
   `Spec k → 𝒵_x^♭` along the gerbe; if it is an equivalence, its further base change along a flat
   locally finitely presented point `Spec k' → 𝒵_x` is the isomorphism
   `Spec k' ×_{𝒵_x^♭} Spec k → Spec k'`, and `Spec k' → 𝒵_x^♭` is an fppf covering of algebraic spaces;
   so `Spec k → 𝒵_x^♭` is an isomorphism by gap:isomorphism-fpqc-local-spaces (§1.2), already declared.

   Repair: in 6.3's `*Needs:*` and `plan.json` prerequisites replace the parenthetical by
   "gap:isomorphism-fpqc-local-spaces (after base change along a flat locally finitely presented
   `Spec k' → 𝒵_x`, the composite `Spec k' → 𝒵_x^♭` being an fppf covering)"; keep
   gap:stack-morphism-permanence for the composition and base change of flat locally finitely presented
   morphisms used in the same sentence. Tested: on `Spec ℚ(t)/ℤ` with the representative `Spec ℚ(t)`
   the base change `Spec ℚ(t) ×_X Spec ℚ(t) = ⊔_ℤ Spec ℚ(t) → Spec ℚ(t)` is not an isomorphism and
   `Spec ℚ(t) → X` is not one either: consistent.

3. **F03** (P3) the `needs` of gap:stack-morphism-permanence omits Lemma 101.17.5

   Location: `design/README.md` lines 244–254 and `design/plan.json` gap `stack-morphism-permanence`,
   `needs`: "composition, base change, descent …, agreement with RepresentableProperty, the implications
   smooth => lfp => lft, cancellation for lft and lfp, and fppf-local essential surjectivity".

   Claim: the sentence names everything this roadmap draws from the lemma range it cites.

   Witness: README line 567 (0.5 API: "Closed and locally closed substacks of a locally Noetherian
   stack … are locally Noetherian, an immersion being locally of finite type (… Lemmas
   101.17.4–101.17.5)"), line 1108 (4.3 *Needs:* "gap:stack-morphism-permanence (a stack locally of
   finite type over a locally Noetherian one is locally Noetherian …)") and 6.4 (a stack locally of
   finite type over a field is locally Noetherian, needed for 4.5). stacks-06RD line 1486, Lemma 17.5:
   `f` locally of finite type and `𝒴` locally Noetherian imply `𝒳` locally Noetherian. SchemeAndStack­Foundations §1.20 on main defines locally Noetherian stacks with atlas independence only (line
   2883 of its README). The lemma is inside the range "101.17.2–101.17.8" the gap cites, but the
   `needs` sentence, which the intake announces to the supplier, does not say it.

   Repair: append to the `needs` sentence, in both files: "and that an algebraic stack locally of finite
   type over a locally Noetherian algebraic stack is locally Noetherian (Lemma 101.17.5)". Tested: 0.5,
   4.3 and 6.4 then cite a clause the gap states; nothing else changes.

4. **F04** (P3) "locally separated" is used in 1.4 without a convention or a supplier citation

   Location: `design/README.md` lines 704–707: "`G_x` is a scheme if the diagonal of `𝒳` is
   quasi-separated or locally separated, … `I_𝒳 → 𝒳` is quasi-separated, locally separated or locally
   quasi-finite"; Convention 3 (line 100) defines quasi-compact and quasi-separated for these
   representable morphisms but not locally separated; 1.4's `*Needs:*` and Layer 1 Dependencies (line
   733) do not cite §1.9.

   Claim: every term is the literature's or Mathlib's name, or defined where it first appears, with its
   supplier cited.

   Witness: SchemeAndStackFoundations §1.9 on main, line 2303 of its README: "`LocallySeparatedSpace f`
   (immersion)" is the supplier declaration; stacks-06RD lines 1675–1681 (Lemma 101.19.1 (2), (5)) are
   the two locally separated cases.

   Repair: in Convention 3 add "locally separated, for a morphism representable by algebraic spaces, is
   `RepresentableProperty` of §1.9's `LocallySeparatedSpace`"; add "§1.9 (`LocallySeparatedSpace`,
   `QuasiSeparatedSpace`)" to 1.4's `*Needs:*`, to Layer 1 Dependencies and to the `plan.json`
   prerequisites of 1.4. Tested: the 1.4 Check `𝔸¹_k/ℤ` (diagonal neither quasi-separated nor locally
   separated: its image, infinitely many parallel lines in `𝔸²`, is not locally closed) reads unchanged.

5. **F05** (P3) algebraicity of `[u/R]` for `R` an algebraic space attributed to `quotientStack_algebraic`

   Location: `design/README.md` line 1056 (4.1): "the quotient is algebraic (SchemeAndStackFoundations
   §1.21's `quotientStack_algebraic`)"; the same attribution in 2.3, 3.2 and 4.2's `*Needs:*`
   ("§1.21 (`quotientStack_algebraic`)").

   Claim: §1.21's `quotientStack_algebraic` makes `[u/R]` algebraic for `R = u ×_𝒳 u`.

   Witness: SchemeAndStackFoundations README on main, lines 2964–2968: "`quotientStack (U, R)` for a
   groupoid scheme … Prove `quotientStack_algebraic`: `[U/R]` is algebraic for a flat locally finitely
   presented groupoid"; `R = u ×_𝒳 u` is an algebraic space (the diagonal of `𝒳` is representable by
   algebraic spaces), not a scheme, as the README's own gap:flat-groupoid-quotients says ("not only a
   groupoid scheme, for which §1.21 states `quotientStack_algebraic`"). The gap is listed in each of
   these `*Needs:*` lines, so nothing is unowned; the prose attributes the step to the wrong owner.

   Repair: in 2.3, 3.2, 4.1 and 4.2 attribute the algebraicity of the quotient to
   gap:flat-groupoid-quotients (Theorem 97.17.2 for groupoids in algebraic spaces) and keep
   `quotientStack_algebraic` only where the groupoid is a groupoid scheme (6.1's `R_x` when `𝒳` has
   schematic diagonal, and the Checks). Tested: 4.1's route is otherwise unchanged.

Reviewed read-only: `packages/StackPointsAndResidualGerbes/design/README.md` (1613 lines, 8 layers, 38
subsections), `packages/StackPointsAndResidualGerbes/design/plan.json` (38 targets, 128 tests, 15 gaps)
and `packages/StackPointsAndResidualGerbes/sources.toml` (14 entries), at the head that applied the
round-1 repairs. Suppliers read as they are now: SchemeAndStackFoundations on main (eaf17b1),
AlgebraicModuliForArithmeticGeometry at the head of its open pull request (a new roadmap, merge order
32), ReductiveGroups on main. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (from `lake-manifest.json`).

## Round-1 findings, checked one by one

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P2) 6.3 neutrality | repaired, but the repair added a false clause (R01) | README 6.3: "Call `𝒵_x` *neutral* … when the gerbe `𝒵_x → 𝒵_x^♭` has a section. If some representative has `Spec k → 𝒵_x^♭` an isomorphism, `𝒵_x` is neutral. For decent `𝒳` … the converse holds"; negative control `Spec ℚ(t)/ℤ` added as the fourth Check. The converse direction and the decency hypothesis are correct; the middle clause "iff it has an object over `Spec κ(x)`" is not. |
| F02 (P2) 1.4 Check | repaired | README 1.4: "On a Deligne–Mumford stack `G_x` is an étale group scheme over `k`, and it need not be finite … `G_x` is finite when moreover `I_𝒳 → 𝒳` is quasi-compact"; `Bℤ` (étale, not quasi-compact) and `B(ℤ/2)` (finite étale) as witnesses. Recomputed below. |
| F03 (P2) `Spec ℚ̄` | repaired | 0.2, 3.1, 3.2, 4.4, 4.5 Checks and the four `plan.json` tests now read `Spec ℚ̄`; 0.2 defines `U`, `G`, the point, and says why no `Spec ℚ → X` exists. Recomputed below. |
| F04 (P2) compound gaps | repaired | 15 gaps, each with one `needs` sentence and a named supplier section; same 15 slugs in README and `plan.json` (checked by script). See R03 for one clause the `needs` sentence of gap:stack-morphism-permanence still omits. |
| F05 (P3) Convention 5 | repaired | Convention 5: "AlgebraicModuliForArithmeticGeometry §8.3 (`FramedDeformation`) reframes by `g` through `α ↦ α ∘ g`, a right action; the left action used here is its inverse". Matches the supplier's "The new frame is `α∘g`" at its head. |
| F06 (P3) VirtualFundamentalClasses | settled (disputed with a correct reason) | `packages/VirtualFundamentalClasses/target.md` exists on the board; its item 5 takes the residual gerbe and `Aut(x̄)` "from StackPointsAndResidualGerbes" and its Boundaries paragraph leaves residual gerbes to this roadmap. The consumer bullet stays. (That target cites "T4–T9", a numbering this README does not use: a note for that package, not for this one.) |
| F07 (P3) 7.2 via a supplier Check | repaired | Convention 9 and 7.2: "*QCoh.presentationEquiv* for the presentation `BG_x = [Spec k/G_x]`, whose descent data along `G_x ⇉ Spec k` are the `O(G_x)`-comodule structures"; `test_BG_representations` named only as the supplier's Check. |

## Verified sound

**Dependency gate.** Output of the mechanical check (no UPWARD or CYCLE line):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2369 edges, 0 problem(s)
```

**Citation resolver** on the README: no cross-roadmap citation and no Lean name found nowhere (the 11
leads of the worker's earlier run were supplier README names; all resolve, see below).

**Principles.** Every statement is at the Stacks Project generality (absolute, any base); no
re-planned roadmap (ownership greps below); supply is downward (SchemeAndStackFoundations and
ReductiveGroups on main; AlgebraicModuliForArithmeticGeometry is a new-roadmap pull request at
merge-order 32, before the candidate's place at 33); no copied passages (locators, theorem numbers
and the author's own wording; spot-checked 0.1, 0.2, 2.1, 2.4, 3.3, 5.3, 6.4 against the text); no
algorithm; no Lean file at the design stage, so no sorry'd data or `set_option`. Untrusted text:
nothing in the README, the supplier READMEs, the board package or the sources instructed anything.

**Supplier citations resolved now.** SchemeAndStackFoundations on main, every backticked name found
in its README (line of first occurrence): §1.2 `quasiFiniteDescent`/`spaceFppfDescent` (2091–2102:
fppf descent of spaces only, so gap:isomorphism-fpqc-local-spaces asks for what is absent); §1.7
`points`, `opensEquiv` (2236), `points.test_no_residue_field` (2247); §1.8 `Spaces.EtaleLocal`
(2295); §1.9 `IsSeparatedSpace`, `QuasiSeparatedSpace`, `LocallySeparatedSpace`, `QuasiCompactSpace`
(2301–2303), `IsProperSpace` (2305); §1.13 `Groups.GroupSpace` (2454); §1.14 `Groupoid.restrict`
(2473), `stabilizerAt` (2479); §1.15 `Groups.IsTorsor` (2585); §1.17 `artinBootstrap` (2652);
§1.18 `StackInGroupoids` (2747), `Stack.stackification` (2758), `twoFiberProduct` (2780); §1.19
`IsRepresentableBySpaces` (2819), `RepresentableProperty` (2821), `IsAlgebraicStack` (2824),
`IsDeligneMumford` with `.iff_unramified_diagonal` (2832); §1.20 `inertia`, `inertia.representable`,
`automorphismGroup`, `setoid_criterion`, `SmoothLocal`, `SmoothLocal.atlas_independent`,
`IsSeparatedStack` (2845–2852), `Stacks.points.ofSpace`, `.map`, `.atlasOpenSurjective`,
`.pullbackSurjective` (2857–2860), `QuasiCompactStack` (2879), locally Noetherian stacks (2883),
`stack_presentation` (2887); §1.21 `Stack.quotient` (2954), `actionQuotient.torsorEquiv` (2965),
`quotientStack.π` (2966), `quotientStack_algebraic` (2967), `test_real_points` (2981); §1.22
`Stacks.QCoh` (2991), *QCoh.presentationEquiv* (2993), `test_BG_representations` (3008, a Check);
§1.23 `moduliFunctor`, `toModuliSheaf` (3023); §4.12 `generic_flatness` (5615, integral base,
schemes); §4.13 `IsRegular`, *IsRegular.of_smooth* (5645–5647). AlgebraicModuliForArithmeticGeometry
at its head: §4.1 `IsGerbe` (1877), `IsGerbe.equivalence_iff` (1897), `relativeGerbe` (1905),
`relativePullback` (1923), `relativeComposition` (1931), `relativeDescent` (1939), all on a site
`(C, J)` with groupoid fibres; §5.4 uses closed substacks of DM stacks without defining them (8929);
§8.1 `deformationGroupoid` (9870), `deformationFunctorOfPoint` (9888, "under (RS)"),
`stabiliserActionOnDeformations` (9892); §8.3 `FramedDeformation` (9946), "The new frame is `α∘g`"
(9955), `framedDeformation_twoFibre` (9966), `framedTangent_exactSequence` (10006, six-term
sequence under RS). (RS) for algebraic stacks is assumed there, not proved: gap:algebraic-stacks-satisfy-rs is correctly declared. ReductiveGroups on main: Layer 1 "representations = comodules"
(line 176), `Lie(G)` and the smoothness criterion, quotients and orbits in Layers 2–3A.

**Library declarations at the pins** (opened at the file and line): Mathlib
`AlgebraicGeometry.LocallyOfFinitePresentation.iff_locallyOfFiniteType` (Noetherian.lean:271,
inside `namespace AlgebraicGeometry`, hypothesis `[IsLocallyNoetherian Y]`),
`retractionKerCotangentToTensorEquivSection` (Smooth/Kaehler.lean:324, no `FormallySmooth` in
scope), `Algebra.FormallySmooth.exists_lift` (Smooth/Basic.lean:125, `[FormallySmooth R A]` only),
`Algebra.FormallySmooth.iff_split_injection` (Basic.lean:290, under `variable
[Algebra.FormallySmooth R P]` at line 273, as the README says), `finite_of_finite_type_of_isJacobsonRing`
(Jacobson/Ring.lean:691), `Scheme.residueField` (ResidueField.lean:45). Tau Ceti `SchPseudofunctor`
(Stack/Basic.lean:37), `Spaces.IsAlgebraicSpace` (AlgebraicSpace/Basic.lean:195, an fppf sheaf
condition, no separation axiom), `TauCeti.Comodule` (Comodule/Basic.lean:50),
`linearlyReductiveAffineGroupSchemeProperty` (LinearlyReductive.lean:60). Gap minimality against the
pin: no Mathlib lemma descends `IsReduced` along flat surjections (grep of
`AlgebraicGeometry/Morphisms` and `Properties.lean`), and the only `fromSpecResidueField` range
lemma is `range_fromSpecResidueField` (ResidueField.lean:276), not a factorisation of reduced
schemes; so gap:reduced-regular-smooth-local and gap:reduced-scheme-residue-field-factorisation ask
for what is absent.

**Declared gaps** (15): each has a named supplier and section, the same slug in `plan.json` and the
README (script-checked), one `needs` sentence, and asks for something the supplier lacks today
(checked against §§1.2, 1.7, 1.8, 1.9, 1.13, 1.19, 1.20, 1.21, 4.12, 4.13 on main and §8.1 at the
AlgebraicModuliForArithmeticGeometry head). Beyond R03 nothing is vague, compound or already
provided. Gap locators opened: Lemma 101.27.15 (stacks-06RD 2560), Lemma 101.5.1 (463), Lemma 101.6.1
(637), Lemma 101.4.11 (337), Theorem 101.21.3 (1839), Lemma 101.17.5 (1486), Decent Spaces Definition
68.6.1 (stacks-decent-spaces 567), Lemma 68.7.2 (710), Lemma 68.8.3 (816), Lemma 68.11.1 (1214),
Proposition 68.12.4 (1364), Lemma 68.15.2 (1754, "A locally separated algebraic space is decent"),
Morphisms Lemmas 29.59.1–29.59.2 (stacks-morphisms-schemes 7102–7111; 29.59.1 has no hypothesis on
the target, as the gap now states).

**Sources: the seeded sample**, each read at the cited lines, theorem number, hypotheses and
statement agreeing with the README:

| Target | Source lines read | Result |
|---|---|---|
| 0.1 | stacks-04XE 625–665 (Lemma 7.1, Def 7.2, Remark 7.3) | correct; reduced (5), regular (8), locally Noetherian (1) in the list |
| 0.2 | stacks-04XE 707–762 (Def 8.1, Lemmas 8.2–8.6); stacks-06RD 445–451 (4.15), 591–608 (5.6); stacks-06ML 1204 (Morphisms of Spaces 10.8 used) | correct |
| 0.5 | stacks-04XE 1073–1125 (10.1–10.5) | correct; the source omits unicity in 10.1 ("We omit the proof of unicity"), the README's route supplies it |
| 1.1 | stacks-06RD 1545–1601 (18.1–18.6) | correct, incl. "affine schemes smooth over `𝒳`" in 18.3 |
| 2.1 | stacks-06QB 2613–2663 (Def 28.1, 28.2–28.5) | correct |
| 2.3 | stacks-06QB 2696–2721 (28.7–28.8); stacks-06RD 3335–3357 (33.7–33.8) | correct, incl. "even if `G` is not smooth" |
| 2.4 | stacks-06QB 2722–2820 (Prop 28.9, 28.10) | correct, incl. the `R/G` route and 28.10 (3)–(4) |
| 2.6 | stacks-06QB 2919–2953 (Prop 29.1, Ex 29.2) | correct; the source omits the existence of `W` ("we omit the proof that `W` exists") |
| 3.1 | stacks-06ML 1135–1198 (11.1–11.3) | correct |
| 3.2 | stacks-06ML 1199–1237 (11.4–11.5) | correct; 11.5's uniqueness is "strictly full subcategory", Convention 4 |
| 3.4 | stacks-06ML 1306–1337 (Ex 11.9, 11.10–11.12); stacks-06RD 452–456 (4.16), 4831–4839 (51.1); stacks-06QB 2846–2861 (28.12); stacks-decent-spaces 1500–1540 (13.5, Def 13.6) | correct |
| 4.4 | stacks-06RD 3096–3129 (31.3) | correct, incl. the choice of `u` with `{u}‾ ∩ E = {u}` |
| 6.1 | stacks-06RD 1617–1665 (proof of 18.7); stacks-06ML 1214–1237, 1364–1368 | correct |
| 6.3 | stacks-06QB 2664–2695 (28.6); alper-moduli 6998–6999, 16539–16540 | correct for the equivalence and for "`Gx = BGx`" at a `k`-point; the false clause of R01 is the README's own addition, not in the sources |
| 6.4 | alper-moduli 6993–7024 (Prop 4.5.16 (2), with "finite type over `k`" and "smooth affine stabilizer"); ahr2020 476–478 | correct; the README's wider statement is proved by its own route (checked below) |

Also read for the findings: stacks-06RD 1667–1725 (Section 19, Lemma 19.1, 19.2 "Proof. Omitted",
19.4 with "Descent on Spaces, Lemma 11.15"), 3048–3060 (31.1–31.2), 4686–4735 (48.1–48.5),
4842–4878 (51.2–51.4), 1484–1500 (17.4–17.5); stacks-06QB 2862–2904 (28.13–28.15);
stacks-decent-spaces 1565–1616 (13.9–13.11), 1225–1227 (Def 11.2); alper-moduli 6859–6881
(Def 4.5.7), 6948–6951 (Ex 4.5.11), 6955–6965, 6983–6987, 16528–16537 (Prop 7.4.39); ahr2020
39–60, 248–252, 480–486; rydh2011 1236–1245, 1268–1305 (Thm B.2). The `lmb2000` and `olsson2016`
entries are settled uncertified and cited by locator only; nothing was requested.

**Adversarial pass** (values computed on each side; rows for the repaired passages, the sampled
targets, the headline theorems and every target a finding touches):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 6.3 "if": representative with `Spec k ≅ 𝒵^♭` ⇒ neutral | `𝔸¹_ℚ` at `t²+1`; `B(ℤ/2)_ℝ` | `κ = ℚ(i)`, `Spec ℚ(i) → 𝒵 = Spec ℚ(i)` is the identity; trivial torsor is a section of `B(ℤ/2) → Spec ℝ` | holds |
| 6.3 decent "neutral iff object over `Spec κ(x)`" | gerbe of `(t, −1)` over `ℚ(t)`, `σ : t ↦ t²` | `∂_{t=0}(t, −1) = −1 ≠ 0` in `ℚ^×/ℚ^{×2}`: not neutral; `σ_*(t, −1) = (t², −1) = 0`: object `(K², M₂(K) ≅ A ⊗_σ K)` over `Spec K` exists | **fails: R01** |
| 6.3 decent "neutral iff some representative has `κ(x) ≅ k`" | same gerbe; `[Spec ℂ/(ℤ/4)]_ℝ`; `U/G` of Ex. 100.11.6 (not decent) | a representative with `κ(x) → k` iso composed with the inverse is a section, and a section is such a representative: both sides false for the gerbe (no section, `σ` not iso) and for `[Spec ℂ/(ℤ/4)]_ℝ` (lifts `Hom(ℤ/2, ℤ/4) = {0, 2} ↦ 0`); for `U/G` the base is `Spec ℚ̄` and the point is a section: both true | holds |
| 6.3 `BG_x → 𝒵_x` equivalence iff `Spec k → 𝒵^♭` iso | `Spec ℚ(t)/ℤ`; gerbe of `(t, −1)` with `y` over `σ` | `Spec ℚ(t) ×_X Spec ℚ(t) = ⊔_ℤ Spec ℚ(t) ≠ Spec ℚ(t)`, neither side; `BG_y ×_{𝒵} Spec k'` vs `Spec k' ×_{σ} Spec K ≠ Spec k'`: neither side; descent step is fpqc-locality of isomorphism on `𝒵^♭` (R02) | holds; R02 |
| 6.3 converse without decency | `Spec ℚ(t)/ℤ` | base `X`, identity section; a representative iso onto `X` would make `⊔_ℤ Spec ℚ(t) = Spec(ℚ(t) ⊗_F ℚ(t))` finite | fails without decency, as the Check says |
| 1.4 Check: DM ⇒ `G_x` étale | `Bℤ/k`; `B(ℤ/2)/k`; `Bμ_p/𝔽_p`; `B𝔾_m` | unramified inertia ⇒ `G_x → Spec k` unramified ⇒ étale (flat over a field); `ℤ_k = ⊔_ℤ Spec k` étale, not quasi-compact; `(ℤ/2)_k` finite étale; `μ_p` not unramified so `Bμ_p` not DM; `𝔾_m` not unramified | holds; "finite" iff quasi-compact inertia |
| 1.4 Check: `Bℤ` is DM | atlas `Spec k → Bℤ` | base change along a `ℤ`-torsor `P → T` is `P → T`, étale-locally `ℤ_T → T`, étale | holds |
| 1.4 locally separated case | `𝔸¹_k/ℤ` | diagonal image: lines `{y = x + n}` in `𝔸²`, not locally closed; inertia of `BG` not quasi-separated; `G` not a scheme | hypothesis needed; vocabulary R04 |
| Ex. 100.11.6: `Spec ℚ̄ → X` mono, not iso | `U = Spec(ℚ̄ ⊗_ℚ ℚ̄)`, `G = Gal` on `|U| ≅ G` | section of `X → Spec ℚ̄` ⇒ mono; `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete while `|U|` profinite without isolated points | holds |
| Ex. 100.11.6: flat, lft, not lfp | ideal of the multiplication point | local rings of `U` are `ℚ̄` (absolutely flat): flat; closed immersion: lft; ideal `(a⊗1 − 1⊗a)` f.g. would make the point open in `|U|` | holds |
| Ex. 100.11.6: no `Spec ℚ → X` | first-factor map | `X → Spec ℚ̄` is `G`-invariant; a map `Spec ℚ → X` gives `ℚ̄ → ℚ` | none exists |
| Ex. 100.11.6 in 3.2, 4.4, 4.5 | core; existence; closed immersion | `R = Spec ℚ̄ ×_X Spec ℚ̄ = Spec ℚ̄` (mono); `Spec ℚ̄ → U → X` lft so 4.1 applies; a closed immersion with all points would equal `X` by 0.5 but is not an iso | holds |
| Conv. 5 left action | `[𝔸¹/𝔾_m]`, `x = 0`, `k[ε]` | framed deformations `(aε, μ)` modulo `β`: class `a/μ`; `α ∘ g⁻¹`: `a/μ ↦ g·a/μ`, weight 1; §8.3's `α ∘ g`: weight −1; `t` weight −1, `N_0` weight 1 | consistent; inverse of the supplier's, as stated |
| Conv. 9 / 7.2 via *QCoh.presentationEquiv* | `G = 1`, `𝔾_m`, `μ_p` | descent data along `G ⇉ Spec k` = comodule structures: `Vect`, `ℤ`-gradings, `ℤ/p`-gradings | consistent |
| 0.1 smooth-local `P` | `Bμ_p/𝔽_p`; open substack `Spec k ⊂ [𝔸¹/𝔾_m]` | atlas `𝔾_m → Bμ_p` regular; flat test `μ_p` nonreduced; open subscheme of the atlas inherits `P` | correct |
| 0.2 rigidity route | `W → T` étale atlas, `W` affine nonempty | `W ×_T W = W ×_k W`; `pr₁ : W ×_k W → W` étale; fpqc descent along `W → Spec k` gives `W → Spec k` étale; `W/(W ×_k W) = Spec k` | route correct |
| 0.5 reduced induced | `Spec k`, `Spec k[t]/(t²)` in `𝔸¹`; `Spec k[ε] → 𝔸¹` | same support, one reduced; nonreduced source does not factor | correct |
| 1.1 finite type points | `Spec ℤ_(p)` generic; `𝔸¹_k` generic | `ℚ = ℤ_(p)[1/p]` finite type; `k(t)` not f.g. over `k[t]`, flat | correct |
| 2.1 gerbe and base | `BG → Spec k`; `[𝔸¹/𝔾_m] → Spec k`; `Spec k → BG` | base `Spec k`; objects `0`, `1` over `k̄` not locally isomorphic; automorphisms of the trivial torsor do not lift to `Spec k` | correct |
| 2.3 smooth gerbes | `Bμ_p → Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p` | `W = U ×_{Bμ_p} Spec 𝔽_p` smooth over `𝔽_p`; fibre `μ_p` nonsmooth | correct |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]` | fibres `𝔾_m` over `0`, `1` over `1`: not flat; `B = k[ε][λ^{±1}]/((λ−1)ε)`: `λ − 1 ∈ ann(ε)`, `λ − 1 ∉ εB` (nonzero in `B/εB = k[λ^{±1}]`): not flat | correct |
| 2.4 converse route | `R/G`, `U/(R/G)` | `R' = R/G` by `artinBootstrap`; `[U/R']` algebraic by gap:flat-groupoid-quotients, then `setoid_criterion` | inputs owned |
| 2.5 diagonal criterion; qc diagonal | `Spec k → B𝔾_m`; `Bℤ → Spec k` | `Δ` = unit section `Spec k → 𝔾_m`, not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` | correct |
| 2.6 dense open gerbe | `[𝔸¹/𝔾_m]`; Example 101.29.2 | stabiliser on `x₀ ≠ 0`: `{t : t x₀ = x₀} = 1`; strata `μ_{pⁱ}`, `𝔾_m` | correct |
| 3.1 one-point criteria | `Spec k[ε]`; `U/G` | one point, not reduced; `Spec k → Spec k[ε]` not flat; lft flat point without lfp point | correct |
| 3.4 base of `𝒵_x` | `Spec ℚ(t)/ℤ` | free (`ι∘σⁿ = ι ⇒ n = 0`), étale relation, one point, reduced, locally Noetherian; base not a field | correct |
| 4.1 | `𝔸¹_k` generic point; `Spec ℤ_(p)` | `Spec k(t) → 𝔸¹` exists, not lft; `Spec ℚ → Spec ℤ_(p)` finite type | correct; attribution R05 |
| 4.3 | `Bℤ`; `B(𝔸¹/ℤ)` | gerbe with non-qc inertia: first statement; qc inertia, not qs: both | correct; R03 for the locally Noetherian input |
| 4.4 | `Spec ℚ(t)/ℤ`; `[Spec k[x₀,…]/𝔾_m]` | locally Noetherian, gerbe = itself; not locally Noetherian, exists by 4.3 | correct |
| 4.5 closed points | `[𝔸¹/𝔾_m]`; DVR; `U/G` | `B𝔾_m` closed, `Spec k` open; `Spec(R/𝔪)` closed, `Spec K` open; non-Noetherian: mono not closed immersion | correct |
| 5.1 decent | `Spec ℚ(t)/ℤ`; `U/G`; `B𝔾_m` | `⊔_ℤ Spec ℚ(t)` not qc; `G × Spec ℚ̄` not qc; affine diagonal ⇒ decent | correct |
| 5.3 residue field | `[Spec ℂ/(ℤ/4)]_ℝ`; `𝔸¹_ℚ` at `t²+1` | base `Spec ℂ/(ℤ/2) = Spec ℝ`; lifts `{0, 2} ↦ 0`: no real object; `κ = ℚ(i)` | correct |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `k̄/k` infinite | lfp ⟺ `k` f.g. ⟺ finite (Zariski); an fppf cover through `Spec k` gives a `κ(x)`-linear `k ↪ κ(t)` with `κ(t)` finite over `κ(x)` | correct |
| 6.1 `R_x` | `Spec κ`, `k/κ` Galois with `Γ`; `BG_k` | `R_x = Spec(k ⊗_κ k) = Γ × Spec k`, `G_x = 1`; `R_x = G` | correct |
| 6.2 base change to `BG_x` | `[Spec ℂ/(ℤ/4)]_ℝ`; `BG_k` | `𝒳 ×_ℝ ℂ = [(Spec ℂ ⊔ Spec ℂ)/(ℤ/4)] = B(ℤ/2)_ℂ`; `𝒵_x ×_{Spec k} Spec k = BG` vs `𝒵_x ×_𝒳 Spec k = G` | correct |
| 6.4 rational points | `Bμ_p/𝔽_p(t)`; `Spec k → Spec κ`, `k/κ` finite; worked example over `K = K̄` | section of `𝒵^♭ → Spec k` is a mono, 3.2 ⇒ iso, 2.2 ⇒ `BG_x`; `μ_p` nonsmooth, holds; no section: `Spec κ ≠ Spec k`; closed point of a finite type stack over `K̄`: `k` finite over `K` so `k = K` | correct, wider than Alper 4.5.16 (2) |
| 7.3 exact sequence and `T_{BG}` | `Bμ_p`; `B𝔾_m`; `[𝔸¹/μ_p]` | `T_{Bμ_p} = {z^p = 1 + aε} ≅ k` (`(b + cε)^p = b^p`, `μ_p(k) = 1`), `1 − 0 = 1`; `T_{B𝔾_m} = 0` (`𝔾_m(k[ε]) → 𝔾_m(k)` onto), `1 − 1 = 0`; `0 → k → k² → k → 0` | correct |
| 7.3 `dim T_{BG} = dim Lie G − dim G` via `[(GLₙ/G)/GLₙ]` | general `G ⊂ GLₙ` | `T_e(GLₙ/G)` of dim `n² − dim G` (homogeneous spaces smooth); image of `Lie GLₙ` of dim `n² − dim Lie G` (kernel `Lie G`); difference `dim Lie G − dim G`, zero iff smooth | correct |
| 7.3 Mathlib inputs | `retractionKerCotangentToTensorEquivSection`, `exists_lift` | no `FormallySmooth R P` in scope; `exists_lift` needs `FormallySmooth R A` only (`A = P/J`, smooth over `k`) | route correct |
| 7.4 quotient stacks | `SL₂` on binary quadratic forms, `x = uv`, char `≠ 2` | `diag(a, a⁻¹)` fixes `uv`; antidiagonal `uv ↦ −uv`; `d(disc)(0,1,0) = (0, 2, 0) ≠ 0`; orbit `= {disc = 1}`, dim 2; `G·x = G/G_x` smooth (immersion of the orbit), `T_{G·x} = Lie G/Lie G_x` | correct |

Context and generality: Layer 7's standing hypotheses are stated at its head and are what 7.2–7.4
use; every target states its hypotheses in the sentence and has a locator; every definition has an
API list and at least three Checks (counts unchanged from round 1, 6.3 now 4); every layer ends with
Examples and Dependencies; the `*Needs:*` lines agree with the `plan.json` prerequisites (38 targets,
script-checked) except as R02 and R04 say.

**Duplication and ownership.** `roadmaps grep` (main and 472 open heads): "residual gerbe" occurs
only in the consumers LanglandsParameterStacks (§1.16 Checks) and FunctionFieldArithmeticPartII
(gap and targets); "decent algebraic", "finite type point", "monomorphism of algebraic stacks"
occur nowhere else; "quasi-DM" only in FunctionFieldArithmeticPartII; "reduced induced" elsewhere is
the scheme case (AdicSpacesPartIII, RigidAnalyticGeometry, CountingBundlesAndHallAlgebrasOfCurves);
"normal space" elsewhere is Riemannian, rigid-analytic or seminormal; "residual space" elsewhere is
unrelated (modular forms, Eisenstein residues). SchemeAndStackFoundations on main defines no
substacks, monomorphisms, immersions, gerbes of algebraic stacks or residual gerbes;
AlgebraicModuliForArithmeticGeometry §4.1 is site-level and §5.4 uses closed substacks of DM stacks
without defining them, as the Scope says. This roadmap is the owner of every object it states.
Overlaps (`scratch/overlaps.md`): no open pull request changes this roadmap, no cited id is dropped
or defined only by an open revision; the closest roadmaps are revisions of SchemeAndStackFoundations
(#1276, #1656, #1807, #1808, #1854), revisions of a roadmap on main, hence not dependencies, and the
README cites main. The consumers EquivariantIntersectionTheory (#1685) and GroupSchemesOverABase
(#1522) are open new-roadmap pull requests; VirtualFundamentalClasses is a board package in triage.

**Shape and style.** Headings in upstream form; Unicode mathematics, no LaTeX delimiters (grep); no
pull-request numbers, dates, job ids, hand-off words or machine paths in the README (grep); proposed
names in italics per Convention 10, so no backticked name of this roadmap's own is claimed as a
declaration; cross-roadmap citations by roadmap and section. Remark, not a finding: the README cites
the cached extractions by line ("stacks-04XE lines 625–653", 111 occurrences) next to every theorem
number; round 1 accepted this, and the theorem numbers are the locators a reader uses.

**Elaboration.** Not available (this lane does not elaborate; the design has no `Suggested.lean`).
Headline theorems from the Summary (1.1/4.1, 4.2–4.4, 4.5, 5.3/6.2/6.3, 6.4, 7.3) are all planned
with hypotheses and locators; statability at the pins is decided at the package stage.

## Not verifiable

- `lmb2000` Chapter 11, Définition 11.2 and `olsson2016` Chapter 11: paywalled, settled as uncertified
  in the manifest; cited by locator only (5.5 and background). Rydh's description of the
  Laumon–Moret-Bailly definition (rydh2011 lines 1236–1245) was used instead.
- Stacks Project statements cited only inside the gap contracts and not in the cached chapters
  (Spaces over Fields 72.10.8–72.10.9, 72.16.1; More on Groupoids in Spaces 79.9.4, 79.10.3; Groupoids
  in Spaces 78.25.1, 78.27.1–2; Algebraic Stacks 94.16.1; Descent 35.18–35.19; Descent on Spaces 74.9,
  74.11.15; Morphisms of Spaces 67.32.1; Properties of Spaces 66.13.3; Artin's Axioms 98.5.2, 98.8):
  supplier obligations, cited by number as the cached chapters cite them (the citing lines were
  read), not opened.

## Source issues

- **Misprint** in alper-moduli at Exercise 4.5.11 (a), printed page 183: the source writes the
  stabiliser action on a framed tangent vector as composing `g` after the framing `α : x ≅ τ|_k`,
  which does not typecheck for `g ∈ Aut(x)`; it should be precomposition with `g` (or its inverse
  for a left action), as ahr2020 states; affects nothing.
- **Gap** in stacks-04XE at Lemma 100.10.1, printed page 23: the source omits the proof of unicity of
  the reduced closed substack with given support; it should argue through Lemma 100.10.2 applied to
  the fibre product of two candidates; affects nothing (the README's route supplies it).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0555065e7f0e768ed1ee4630d2d7f69b394eaf9c", "job": "REV-DESIGN-StackPointsAndResidualGerbes~2", "model": "fable", "worker": "chris-x17"} -->
