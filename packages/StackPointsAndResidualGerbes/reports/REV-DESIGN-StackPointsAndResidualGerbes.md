<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/7629#issuecomment-6701197143 -->
Review (claude) of 54a30e1

Verdict: needs_changes

1. **F01** (P2) 6.3: "neutral iff some representative has `Spec k ≅ 𝒵_x^♭`" fails without decency

   Location: `design/README.md` lines 1286–1288: "Call `𝒵_x` *neutral* … when it has an object over its
   base; this holds iff some representative satisfies these conditions".

   Claim: for every algebraic stack whose residual gerbe exists, `𝒵_x` has an object over `𝒵_x^♭` iff some
   representative `x : Spec k → 𝒳` has `Spec k → 𝒵_x^♭` an isomorphism.

   Witness: the README's own `X = Spec ℚ(t)/ℤ` (3.4 Check, line 947). Its residual gerbe is `X`, its base
   `X^♭ = X` (a sheaf is its own moduli sheaf), and the identity `X → X` is an object over the base, so `𝒵_x`
   is neutral. No representative `Spec k → X` has `Spec k → X^♭ = X` an isomorphism, since `X` is not a
   scheme (3.4 Check). The "only if" direction is false.

   Repair: state the equivalence for decent `𝒳` only (then `𝒵_x^♭ = Spec κ(x)` by 5.3, an object over
   the base is a representative over `κ(x)`, and both directions hold), or define neutrality as "some
   representative induces `Spec k ≅ 𝒵_x^♭`" and record that for decent `𝒳` this is an object over
   `Spec κ(x)`. Add `Spec ℚ(t)/ℤ` as the negative-control Check. Tested: with the decency hypothesis
   the instance is excluded; on `[Spec ℂ/(ℤ/4)]_ℝ` (decent) the statement reads as before.

2. **F02** (P2) 1.4 Check: `G_x` is not finite étale on every Deligne–Mumford stack

   Location: `design/README.md` line 669: "On a Deligne–Mumford stack `G_x` is a finite étale group
   scheme over `k`."

   Claim: DM implies `G_x` finite étale.

   Witness: the README's own worked example, line 1489: "`Bℤ` over `K` is Deligne–Mumford, of finite
   type and one-point, and `G_x = ℤ` is not finite." Computed: `Bℤ` has étale atlas `Spec K → Bℤ`
   (`ℤ_K → Spec K` is étale, so the diagonal is unramified), and `G_x = ℤ_K = ⊔_ℤ Spec K` is étale, a
   scheme, and not quasi-compact. The roadmap contradicts itself.

   Repair: replace by "On a Deligne–Mumford stack `G_x` is an étale group scheme over `k` (unramified
   diagonal; a scheme by the quasi-DM case), finite when the diagonal of `𝒳` is quasi-compact; `Bℤ` has
   `G_x = ℤ_k` étale and not finite." Tested on `Bℤ` (étale, not finite) and `B(ℤ/2)` (finite étale).

3. **F03** (P2) The point of Stacks Example 100.11.6 is `Spec ℚ̄`, not `Spec ℚ`

   Location: `design/README.md` lines 407, 869, 889, 891, 1067, 1083 (Checks of 0.2, 3.1, 3.2, 4.4,
   4.5): "`Spec ℚ → X` is a monomorphism …", "its locally Noetherian core is `Spec ℚ`", "the residual
   gerbe … is `Spec ℚ`", "`𝒵_x = Spec ℚ → X`".

   Claim: `X = U/G` with `U = Spec(ℚ̄ ⊗_ℚ ℚ̄)` has a finite type point `Spec ℚ → X` which is its
   residual gerbe.

   Witness: stacks-06ML line 1250 is an OCR rendering that drops overlines; the Stacks Project page for
   tag 06MS reads `x : Spec(ℚ̄) → U → X` and "As `X` is an algebraic space over `ℚ̄` it follows that `x`
   is a monomorphism." Computed: every point of `U` has residue field `ℚ̄`, and `X → Spec ℚ̄` (first
   factor) shows no morphism `Spec ℚ → X` exists (it would give a ring map `ℚ̄ → ℚ`). The residual gerbe
   is `Spec ℚ̄ → X`; `Spec ℚ̄ → U` is a closed immersion with non-finitely-generated ideal, so it is flat
   (local rings of `U` are `ℚ̄`), locally of finite type and not locally of finite presentation, as the
   3.1 Check needs; `U ×_X Spec ℚ̄ = G × Spec ℚ̄` is not quasi-compact, as the 5.1 Check needs.

   Repair: write `Spec ℚ̄` for this point in all five Checks (and in the 3.2 Check "core is `Spec ℚ̄`",
   the 4.4 Check "is `Spec ℚ̄`", the 4.5 Check "`𝒵_x = Spec ℚ̄ → X`"). Tested: every Check then holds by
   the computation above.

4. **F04** (P2) Compound gap contracts

   Location: `design/README.md` lines 228–236 (gap:stack-morphism-calculus), 238–242
   (gap:stack-separation-axioms), 249–259 (gap:flat-groupoid-quotients), 261–269
   (gap:decent-algebraic-spaces), 271–275 (gap:spaces-over-fields); `design/plan.json` `gaps`.

   Claim: each gap is one precise, minimal `needs`.

   Witness: gap:stack-morphism-calculus asks in one sentence for composition, base change, descent,
   agreement with `RepresentableProperty`, cancellation, openness of flat lfp morphisms, surjectivity,
   `QuasiCompactStack` and "the inertia is locally of finite type" (Lemma 101.5.1), eight lemma families
   across Stacks §§100.3, 101.5, 101.7, 101.17, 101.25, 101.27, 101.33. gap:decent-algebraic-spaces mixes
   Decent Spaces §§68.6–68.12 with the dense open subscheme of a quasi-separated space (Properties of
   Spaces 66.13.3) and the scheme lemma Morphisms 29.59.1–29.59.2. gap:spaces-over-fields joins "a group
   space over a field which is lqf/qs/locally separated is a scheme" with the unrelated Lemma 72.10.9.
   gap:flat-groupoid-quotients adds Lemma 101.5.7 (stabilizer = pullback of inertia) to the quotient
   statements. gap:stack-separation-axioms asks §1.20 to "define DM … stacks by the diagonal", but
   SchemeAndStackFoundations §1.19 already defines `IsDeligneMumford` with `.iff_unramified_diagonal`
   (README line 2832 of that roadmap on main), so that clause asks for what is provided.

   Repair: one gap per coherent cluster, each with a single `needs` sentence and its hypotheses:
   split stack-morphism-calculus into (a) the permanence calculus of `SmoothLocal`, surjective and
   `QuasiCompactStack` (composition, base change, fppf descent, agreement with `RepresentableProperty`,
   cancellation), (b) openness of flat locally finitely presented morphisms on `|·|`, (c) `I_𝒳 → 𝒳`
   locally of finite type; split decent-algebraic-spaces into decent spaces (68.6–68.12), the dense open
   subscheme (66.13.3) and the residue-field factorisation (29.59.1–2); split spaces-over-fields into its
   two lemmas; move Lemma 101.5.7 to its own gap or to (c); restrict stack-separation-axioms to DM,
   quasi-DM and quasi-separated *morphisms* and to quasi-DM and quasi-separated stacks, citing §1.19's
   `IsDeligneMumford` for DM stacks. Same slugs in `plan.json` and the README. Tested: each target's
   `*Needs:*` line then names only the cluster it uses (e.g. 1.1 needs only (a); 2.5 needs (a) and (b)).

5. **F05** (P3) Convention 5 inverts the supplier's reframing without saying so

   Location: `design/README.md` lines 113–121 (Convention 5) and 1389–1391 (7.3): "with the action of
   `G_x(k)` of `stabiliserActionOnDeformations` in the normalisation of Convention 5".

   Claim: the `G_x(k)`-action on `T_{𝒳,x}` is `g·(τ, α) = (τ, α ∘ g⁻¹)`.

   Witness: AlgebraicModuliForArithmeticGeometry §8.3 (`FramedDeformation` API, at its head): "Reframing
   by `g ∈ Aut(x₀)` … The new frame is `α∘g`", and ahr2020 line 482: "by precomposition on the
   2-isomorphism". The README's witness is correct as computed here: on `[𝔸¹/𝔾_m]` at `0` the framed
   deformations are `(aε, μ) ~ a/μ ∈ k`, `g·(τ, α∘g⁻¹)` sends `a/μ ↦ g·(a/μ)` (weight `1`), while `α∘g`
   gives weight `−1`; with functions transforming contragrediently `t` has weight `−1` and `N_0` weight
   `1`, so only the inverse convention makes `θ_0` equivariant. Nothing says that Convention 5 is the
   inverse of the supplier's action.

   Repair: in Convention 5 add one sentence: "AlgebraicModuliForArithmeticGeometry §8.3 reframes by
   `α ∘ g`; the left action used here is its inverse `g ↦ (τ, α ∘ g⁻¹)`", and in 7.3 cite that
   sentence. Tested: the Convention 5 witness and the 7.3 Check keep their values.

6. **F06** (P3) A downstream consumer that exists nowhere

   Location: `design/README.md` line 1473: "**VirtualFundamentalClasses**: residual gerbes as the
   zero-dimensional integral substacks …".

   Claim: a roadmap of this name consumes 4.2, 4.5 and 5.3.

   Witness: `VirtualFundamentalClasses` is absent from the content repository's main branch, from the
   merge order and from the open roadmap pull requests (`roadmaps list`); `EquivariantIntersectionTheory`
   and `GroupSchemesOverABase` (line 1475) are in open pull requests but not in the merge order.

   Repair: delete the `VirtualFundamentalClasses` bullet, or replace it by an existing roadmap; keep the
   other two only as named in their pull requests. Tested: the remaining consumers resolve
   (LanglandsParameterStacks at 61, MotivicStructuresInModuliOfCurves at 328,
   FunctionFieldArithmeticPartII at 367 in the merge order; the candidate is placed at 33, after
   AlgebraicModuliForArithmeticGeometry at 32, so all are downstream).

7. **F07** (P3) 7.2 rests on a supplier *Check* rather than a supplier target

   Location: `design/README.md` lines 1362–1363 and 220–222: "`QCoh(BG_x) ≃ Rep(G_x)`
   (SchemeAndStackFoundations §1.22's `test_BG_representations`)".

   Claim: SchemeAndStackFoundations §1.22 supplies the equivalence `QCoh(BG) ≃ Rep(G)` for affine `G`
   over a field.

   Witness: on main, SchemeAndStackFoundations §1.22 lists `test_BG_representations` under
   **Checks** ("for an affine group scheme `G` over a field, `QCoh(BG)` is the category of comodules of
   `O(G)`"); its target is *QCoh.presentationEquiv* (Proposition 96.14.3, verified at
   stacks-sheaves-on-stacks lines 953–955).

   Repair: cite *QCoh.presentationEquiv* for the presentation `Spec k → BG` with `R = G` (descent data
   along `G ⇉ Spec k` are `O(G)`-comodule structures, Convention 9), and mention
   `test_BG_representations` only as the supplier's Check of that instance. Tested: 7.2's definition of
   `N_x` is unchanged.

Reviewed read-only: `packages/StackPointsAndResidualGerbes/design/README.md` (1523 lines, 8 layers, 38
subsections), `packages/StackPointsAndResidualGerbes/design/plan.json` (38 targets, 9 gaps, 127 tests)
and `packages/StackPointsAndResidualGerbes/sources.toml` (13 entries). No previous review. Suppliers
read as they are now: SchemeAndStackFoundations §§1.7–1.23, 4.12–4.13 on main (eaf17b1);
AlgebraicModuliForArithmeticGeometry §§4.1, 5.4, 8.1, 8.3 at its open head; ReductiveGroups Layers
1–3A on main. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (from `lake-manifest.json`).

## Verified sound

**Dependency gate.** Output of the mechanical check (no UPWARD or CYCLE line):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2352 edges, 0 problem(s)
```

**Principles.** No route-specific shortcut (every statement is at the Stacks Project generality,
absolute, any base); no re-planned roadmap (ownership greps below); supply is downward (suppliers
SchemeAndStackFoundations on main, ReductiveGroups on main, AlgebraicModuliForArithmeticGeometry at
merge-order 32 < 33); no copied passages (locators only; spot-checked 0.3, 2.4, 3.3 against the text);
no algorithm; no Lean file at the design stage, so no sorry'd data or `set_option`. Untrusted text:
nothing in the README, the supplier READMEs or the sources instructed anything.

**Library declarations at the pins** (all 19 Mathlib and 8 Tau Ceti names opened at the cited file and
line): `CategoryTheory.Pseudofunctor.IsStack` (Sites/Descent/IsStack.lean:49),
`AlgebraicGeometry.Scheme.fppfTopology` (Sites/Fpqc.lean:54), `Scheme.residueField`
(ResidueField.lean:45), `IsClosedImmersion` (:44), `Flat` (:42), `LocallyOfFiniteType` (:42),
`LocallyOfFinitePresentation` (:46), `Smooth` (:59), `LocallyQuasiFinite` (:72), `IsReduced`
(Properties.lean:68), `IsLocallyNoetherian` (Noetherian.lean:54), `IdealSheafData.vanishingIdeal`
(IdealSheaf/Basic.lean:564), `.subscheme` (Subscheme.lean:453), `.subschemeι` (:470),
`LocallyOfFiniteType.jacobsonSpace` (FiniteType.lean:112), `JacobsonSpace` (JacobsonSpace.lean:70),
`retractionKerCotangentToTensorEquivSection` (Smooth/Kaehler.lean:324; its section variables carry no
smoothness of `P`, as the README says), `Algebra.FormallySmooth.exists_lift` (Smooth/Basic.lean:125),
`Algebra.FormallySmooth.iff_split_injection` (Smooth/Basic.lean:290, inside `section iff_split` with
`variable [Algebra.FormallySmooth R P]` at line 273, confirming the README's reason for not using it),
`finite_of_finite_type_of_isJacobsonRing` (RingTheory/Jacobson/Ring.lean:691). Tau Ceti:
`SchPseudofunctor` (Stack/Basic.lean:37), `SchemePresheaf` (:68), `Spaces.RepresentableDiagonal`
(:74), `Spaces.EtaleAtlas` (:113), `Spaces.IsAlgebraicSpace` (:195), `TauCeti.Comodule`
(Comodule/Basic.lean:50), `TauCeti.ComoduleCat` (Comodule/Cat.lean:50),
`linearlyReductiveAffineGroupSchemeProperty` (LinearlyReductive.lean:60). No Mathlib lemma factors a
reduced scheme with one-point image through `Spec` of the residue field (grep of
`Mathlib/AlgebraicGeometry`), so gap:decent-algebraic-spaces does not ask for what Mathlib has.

**Supplier citations resolved** (every backticked SchemeAndStackFoundations name found in its README on
main; the 11 leads of `scratch/citations.md` are all supplier README names, not pinned declarations,
and all resolve): §1.7 `points`, `opensEquiv`, `points.test_no_residue_field`; §1.8 `Spaces.EtaleLocal`;
§1.9 the four separation predicates; §1.12 `𝔸¹/ℤ`, folded line; §1.13 `Groups.GroupSpace`; §1.14
`Groupoid`, `.restrict`, `stabilizer`, `stabilizerAt`; §1.15 `Groups.IsTorsor`; §1.16 twisting; §1.17
`artinBootstrap`; §1.18 `Stacks.StackInGroupoids`, `twoFiberProduct`, `Stack.stackification`; §1.19
`IsRepresentableBySpaces`, `RepresentableProperty`, `IsAlgebraicStack`, `IsDeligneMumford`,
`.iff_unramified_diagonal`; §1.20 `inertia`, `inertia.representable`, `automorphismGroup`,
`setoid_criterion`, `SmoothLocal`, `.atlas_independent`, `Stacks.points` with `.map`,
`.pullbackSurjective`, `.atlasOpenSurjective`, `.ofSpace`, `QuasiCompactStack`, `IsSeparatedStack`,
locally Noetherian stacks, `stack_presentation`; §1.21 `Stack.quotient`, `quotientStack`, `.π`,
`actionQuotient`, `.torsorEquiv`, `quotientStack_algebraic`, `test_real_points`; §1.22 `Stacks.QCoh`,
*QCoh.presentationEquiv*, `test_BG_representations` (see R07); §1.23 `moduliFunctor`,
`toModuliSheaf`; §4.12 `generic_flatness` (schemes, integral base: the gap is needed); §4.13
`IsRegular`, *IsRegular.of_smooth*. AlgebraicModuliForArithmeticGeometry at its head: §4.1 `IsGerbe`,
`IsGerbe.equivalence_iff`, `relativeGerbe`, `relativePullback`, `relativeComposition`,
`relativeDescent` (all present, Stacks 8.11.x); §8.1 `deformationGroupoid`,
`deformationFunctorOfPoint`, `stabiliserActionOnDeformations` (present; (RS) is assumed, not proved:
gap:algebraic-stacks-satisfy-rs is correctly declared); §8.3 `framedDeformation_twoFibre`,
`framedTangent_exactSequence` (present, with the six-term sequence). ReductiveGroups on main: Layer 1
(comodules), Layer 2 (`Lie(G)`, smoothness and dimension tools), Layer 3 (quotients by closed
subgroups), Layer 3A (orbits) exist. The cited SchemeAndStackFoundations revisions (#1276, #1656,
#1807, #1808, #1854) are revisions of a roadmap on main, hence not dependencies; the README cites
main.

**Declared gaps.** Each has a named supplier and section, the same slug in `plan.json` and the README,
and asks for something the supplier lacks today (checked each item against the supplier on main or at
its head). Beyond R04, nothing asks for what is provided. The gaps are contracts, not findings.

**Sources: the seeded sample and the rest**, each read at the cited lines of the cached text, theorem
numbers, hypotheses and statements agreeing with the README:

| Target | Source lines read | Result |
|---|---|---|
| 0.1 | stacks-04XE 625–665 (Lemma 7.1, Def 7.2, Remark 7.3) | correct; reduced/regular/loc. Noetherian in the list |
| 0.2 | stacks-04XE 707–762; stacks-06RD 445–451 (4.15), 591–608 (5.6) | correct |
| 0.3 | stacks-04XE 765–894 (Def 9.1, 9.9; Lemmas 9.2–9.12) | correct; 9.6 and 9.10 have omitted proofs, as the README says |
| 0.4 | stacks-sheaves-on-stacks 953–955 (Prop 14.3); ahr2020 248–252 | correct |
| 0.5 | stacks-04XE 1073–1125 (10.1–10.5) | correct; the source omits unicity in 10.1 (the README's route supplies it) |
| 1.1 | stacks-06RD 1545–1601 (18.1–18.6) | correct |
| 1.2 | stacks-04XE 399–423 (Def 4.2) | correct |
| 1.3 | stacks-06RD 1667–1674, 1690–1725, 497–618 | correct; 19.2 "Proof omitted" as the README notes |
| 1.4 | stacks-06RD 1675–1689 (19.1) | correct, six cases and the proof route |
| 2.1, 2.2 | stacks-06QB 2613–2695 (Def 28.1, 28.2–28.6) | correct |
| 2.3 | stacks-06QB 2696–2721 (28.7–28.8); stacks-06RD 3335–3357 (33.7–33.8) | correct, incl. "even if `G` is not smooth" |
| 2.4 | stacks-06QB 2722–2820 (Prop 28.9, 28.10) | correct, incl. the `R/G` route |
| 2.5 | stacks-06QB 2821–2890 (Prop 28.11, 28.13, 28.14) | correct |
| 2.6 | stacks-06QB 2919–2953 (Prop 29.1, Ex 29.2) | correct |
| 3.1 | stacks-06ML 1135–1198 (11.1–11.3) | correct |
| 3.2 | stacks-06ML 1199–1237 (11.4–11.5) | correct |
| 3.3 | stacks-06ML 1260–1303 (11.7, Def 11.8) | correct |
| 3.4 | stacks-06ML 1306–1337; 06RD 452–456, 4831–4839; 06QB 2846–2861; decent-spaces 1500–1540 | correct |
| 3.5 | stacks-06ML 1338–1368 (11.13–11.14) | correct |
| 4.1 | stacks-06RD 1609–1665 (18.7) | correct |
| 4.2 | stacks-06RD 3059–3095 (31.2 proof); decent-spaces 1500–1531 (13.5) | correct |
| 4.3 | stacks-06QB 2893–2904 (28.15); 06RD 3048–3056 (31.1) | correct |
| 4.4 | stacks-06RD 3096–3129 (31.3) | correct, incl. the choice of `u` |
| 4.5 | stacks-06RD 4866–4878 (Remark 51.3, 51.4) | correct |
| 5.1 | stacks-06RD 4686–4735 (Def 48.1, 48.2–48.5); 04XE 1453–1461; decent-spaces 567–589 | correct |
| 5.2 | stacks-06RD 4842–4865 (51.2); decent-spaces 1565–1616 (13.9–13.11) | correct; hypothesis is `{x}`, not its closure |
| 5.3 | decent-spaces 1214–1227, 1542–1552; alper-moduli 16528–16537; rydh2011 1268–1277 | correct |
| 5.4 | rydh2011 1268–1305 (Thm B.2) | correct |
| 5.5 | rydh2011 1236–1245; stacks-06ML 1293–1297 | correct |
| 6.1 | stacks-06RD 1617–1665; 06ML 1214–1237, 1364–1368 | correct |
| 6.2, 6.3 | alper-moduli 16539–16549 (Ex 7.4.40), 6998–6999 | correct (see R01 for 6.3's iff) |
| 6.4 | alper-moduli 6993–7024 (Prop 4.5.16); ahr2020 476–478 | correct; the source assumes finite type and smooth affine `G_x`, the README's wider statement is proved by its own route (checked below) |
| 7.1–7.4 | ahr2020 39–43, 55–60, 248–252, 476–486; alper-moduli 6859–6881, 6948–6951 | correct |

Example 100.11.6: the cached text (stacks-06ML 1238–1256) drops overlines; the live page of tag 06MS
was read and gives `Spec(ℚ̄)` (R03). The `lmb2000` and `olsson2016` entries are settled uncertified and
are cited by locator only; nothing was requested.

**Adversarial pass** (values computed on each side; rows for the sampled targets, the headline
theorems and every target a finding touches):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conv. 5 left action `(τ, α∘g⁻¹)` | `[𝔸¹/𝔾_m]`, `x = 0`, `k[ε]` | framed deformations `(v = aε, μ ∈ k^×)` modulo `β ∈ k[ε]^×`: class `a/μ`; `g·` sends `a/μ ↦ g(a/μ)`: weight `1`; `(τ, α∘g)`: weight `−1`; `t` contragredient weight `−1`, `N_0` weight `1` | consistent; R05 |
| Conv. 6 `ℐ^{n+1}` | `𝔸¹`, origin, `n = 0, 1` | lengths `1, 2`; `ℐ^n` would give `𝒳^{[0]} = 𝒳` | correct |
| 0.1 smooth-local `P` | `Bμ_p/𝔽_p` | smooth atlas `𝔾_m → Bμ_p` (fibre over `Spec 𝔽_p` is the Kummer torsor `𝔾_m`, smooth): regular; flat test `μ_p` nonreduced | flat-test definition refuted; correct |
| 0.2 rigidity mono into a field | `Spec k → Spec k[ε]`; `W` étale atlas | `W ×_T W = W ×_k W`, `W → Spec k` étale by fpqc descent, `T = W/(W ×_k W) = Spec k` | route correct |
| 0.3 mono vs immersion | `Spec k(t) → 𝔸¹_k` | `{η}` not locally closed: `𝔸¹ ∖ {η}` = closed points, not closed | correct |
| 0.4 ideals | `(t²) ⊆ k[t]`; `Spec k[ε]` | ideal of `V(t²)` is `(t²)`; `ℐ² = 0`, `𝒳^{[n]} = 𝒳` for `n ≥ 1` | correct |
| 0.5 reduced induced | `Spec k`, `Spec k[t]/(t²)` in `𝔸¹` | same support, one reduced | correct |
| 1.1 finite type points | `Spec ℤ_(p)` generic; `𝔸¹_k` generic | `ℚ = ℤ_(p)[1/p]` finite type; `k(t)` not f.g. over `k[t]` but flat | correct |
| 1.2 `π₀𝒳(k) → |𝒳|` | `B(ℤ/2)_ℝ`; `𝔸¹_ℝ` | 2 classes → 1 point; `t² + 1` not hit | correct |
| 1.3 `G_x` | `Bμ_3/ℚ` | `μ_3(ℚ) = 1`, `μ_3(ℚ(ζ_3)) = ℤ/3` | "`G_x(k)` trivial" not a point property; correct |
| 1.4 `G_x` scheme | `B(𝔸¹_k/ℤ)`; `B𝔾_m`; `Bℤ` | `𝔸¹/ℤ` not a scheme, inertia not qs; `𝔾_m` scheme, affine diagonal; `ℤ_k` étale, not finite | R02 |
| 2.1 gerbe | `[𝔸¹/𝔾_m] → Spec k` | objects `0`, `1` over `k̄` not locally isomorphic | correct |
| 2.2 section ⇒ `[U/G] ≃ 𝒳` | `[𝔸¹/𝔾_m]`, section `1` | `Isom(1,1) = {λ : λ·1 = 1} = 1`; `Spec k ≄ [𝔸¹/𝔾_m]` | gerbe hypothesis needed; correct |
| 2.3 smooth gerbes | `Bμ_p → Spec 𝔽_p` | `W = U ×_{Bμ_p} Spec 𝔽_p` smooth over `Spec 𝔽_p`; `Spec 𝔽_p → Bμ_p` flat lfp not smooth (fibre `μ_p`) | correct |
| 2.4 inertia criterion | `[𝔸¹/𝔾_m]`; `[Spec k[ε]/𝔾_m]` | fibres `𝔾_m` over `0`, `1` over `1`: not flat; `B = k[ε][λ^{±1}]/((λ−1)ε)`: `λ−1 ∈ ann(ε)`, `λ−1 ∉ εB`, not flat | correct |
| 2.5 diagonal criterion; qc diagonal | `Spec k → B𝔾_m`; `Bℤ → Spec k` | `Δ` = unit section `Spec k → 𝔾_m`, not flat; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k` | correct |
| 2.6 dense open gerbe | Example 101.29.2 | stabiliser on `x₀ ≠ 0`: `{t : t x₀ = x₀} = 1`; strata `μ_{pⁱ}`, `𝔾_m` | correct |
| 3.1 one-point criteria | `U/G` of Ex. 100.11.6 | `Spec ℚ̄ → U` closed immersion, ideal not f.g.: lft, flat (local rings `ℚ̄`), not lfp | correct with R03 |
| 3.2 rigidity | `Spec k → BG` | not a mono; `Spec k ×_{BG} Spec k = G` | correct |
| 3.3 residual gerbe | scheme; `Spec k[ε]`; `[𝔸¹/𝔾_m]` | `Spec κ(x)`; `Spec k`; `B𝔾_m`, `Spec k` | correct |
| 3.4 base of `𝒵_x` | `X = Spec ℚ(t)/ℤ` | free (`ι∘σⁿ = ι ⇒ n = 0`), étale relation, one point, reduced, loc. Noetherian; `X ≅ Spec F` would make `⊔_ℤ Spec ℚ(t) = Spec(ℚ(t) ⊗_F ℚ(t))` finite: contradiction | base not a field; correct |
| 4.1 | `𝔸¹_k` generic point | `Spec k(t) → 𝔸¹` exists, not lft | existence ⇏ finite type; correct |
| 4.2–4.4 | `Bμ_p`; `Bℤ`; `B(𝔸¹/ℤ)`; `Spec ℚ(t)/ℤ` | quasi-DM atlas `Spec 𝔽_p`; inertia `ℤ_k` not qc, gerbe; inertia qc not qs; loc. Noetherian, gerbe = itself | correct |
| 4.5 closed points | `U/G`, DVR | `Spec ℚ̄ → U/G` mono, not closed immersion (else `= X` by 0.5); `Spec(R/𝔪)` closed, `Spec K` open | correct with R03 |
| 5.1 decent | `Spec ℚ(t)/ℤ`; `U/G` | `Spec ℚ(t) ×_X Spec ℚ(t) = ⊔_ℤ Spec ℚ(t)`; `U ×_X Spec ℚ̄ = G × Spec ℚ̄`, `G` infinite | not decent; correct |
| 5.2 factorisation | `id_{𝔸¹}` at `η`; `Spec k[ε] → 𝔸¹` | image `= 𝔸¹ ⊄ {η}`; nonreduced | hypotheses needed; correct |
| 5.3 residue field | `[Spec ℂ/(ℤ/4)]_ℝ` | base `[Spec ℂ/(ℤ/2)] = Spec ℝ`; lifts of the class of `Spec ℂ`: `Hom(ℤ/2, ℤ/4) = {0, 2}`, both `↦ 0 ∈ Hom(ℤ/2, ℤ/2)`: no real object | correct |
| 5.4 algebraicity | `[𝔸¹/𝔾_m]`; `𝔸¹_k` generic | `𝒵 = B𝔾_m`, `Spec k`; `Spec k(t) → 𝔸¹` affine, not an immersion; route: reduced closure, dense open gerbe, base qs by 2.5, dense open affine `Z` integral with generic point `π(ξ)`, `𝒵` quasi-compact (fppf chart `[U'/G]`, `U'` affine), `𝒵 ×_Z Spec κ(ξ)` quasi-affine | correct |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `k̄/k` infinite | lfp ⟺ `k` finitely generated ⟺ finite (Zariski); an fppf cover through `Spec k` gives `k ↪` a residue field finite over `κ(x)` | correct |
| 6.1 `R_x` | `Spec κ`, `k/κ` Galois with `Γ` | `R_x = Spec(k ⊗_κ k) = Γ × Spec k`, `G_x = 1`, `[Spec k/R_x] = Spec κ` | correct |
| 6.2 base change to `BG_x` | `BG_k` trivial torsor; `[Spec ℂ/(ℤ/4)]_ℝ` | `𝒵_x ×_{Spec k} Spec k = BG` vs `𝒵_x ×_𝒳 Spec k = G`; `𝒳 ×_ℝ ℂ = [(Spec ℂ ⊔ Spec ℂ)/(ℤ/4)] = B(ℤ/2)_ℂ` | correct |
| 6.3 neutrality iff | `Spec ℚ(t)/ℤ` | neutral (identity section of base `X`), no representative with `Spec k ≅ X` | R01 |
| 6.4 rational points | `Bμ_p/𝔽_p(t)`; `Spec k → Spec κ`, `k/κ` finite | route: `Spec k → 𝒵_x^♭ → Spec k = id`, section is a mono, 3.2 ⇒ iso, 2.2 ⇒ `BG_x`; `G_x = μ_p` nonsmooth, holds; no section: `𝒵_x = Spec κ ≠ Spec k = BG_x` | correct, wider than Alper 4.5.16 (2) |
| 7.1 | `𝔸²_k`, origin, `n = 1` | `k[x,y]/(x,y)²`, length 3 | correct |
| 7.2 `N_x` | `[𝔸ⁿ/GLₙ]` at `0`; `BG` | `ℐ/ℐ² = ` span of coordinates = `(kⁿ)^∨`, `N_0 = kⁿ`; `N = 0` | correct |
| 7.3 exact sequence | `[𝔸¹/μ_p]/𝔽_p` at `0` (direct and by chart) | direct: framed deformations `(a, b)` (torsor `z^p = 1 + aε`, map `bεz`), `dim T = 2`; chart `V = Spec k[s^{±1}, w]`, `s ↦ t^p s`, `w ↦ t⁻¹w`, `W = {w = 0}`, `U_x = 𝔾_m → V` with `d(t^p) = 0`: `T_𝒳 = k²`, `N = k`, kernel `T_{Bμ_p} = k`; `θ(a,b) = (t ↦ b)` | `0 → k → k² → k → 0` exact; correct |
| 7.3 `dim T_{BG} = dim Lie G − dim G` | `μ_p`; `𝔾_m` | `T_{Bμ_p} = {1 + aε} ≅ k`, `1 − 0 = 1`; `T_{B𝔾_m} = 0`, `1 − 1 = 0`; `Lie(GL₁) → T_e(𝔾_m/μ_p)` is `d(λ^p) = 0`, kernel `Lie(μ_p)` | correct |
| 7.3 Mathlib inputs | `retractionKerCotangentToTensorEquivSection`, `exists_lift` | no `FormallySmooth R P` in scope (Kaehler.lean:45–50); `exists_lift` needs `FormallySmooth R A` only; `iff_split_injection` is under `variable [FormallySmooth R P]` (Basic.lean:273) | route correct |
| 7.4 quotient stacks | `SL₂` on binary quadratic forms, `x = uv`, char `≠ 2` | `diag(a, a⁻¹)` fixes `uv`; antidiagonal sends `uv ↦ −uv`; `disc = b² − 4ac`, `d(disc)(0,1,0) = (0, 2, 0) ≠ 0`; orbit `= {disc = 1}` (closed, dim 2); `N` 1-dimensional trivial | correct |
| Worked example (zero-dim DM) | `Bℤ/K` | DM, finite type, one point, `G_x = ℤ` infinite | qc diagonal needed; stated |

Context and generality: Layer 7's standing hypotheses (`𝒳` lft over `k`, `x ∈ 𝒳(k)` closed,
`p∘x = id`, `G_x` affine) are stated at the head of the layer and are what 7.2–7.4 use; 7.1 carries
its own (locally Noetherian, `x` closed). Every target states its hypotheses in the sentence and has
a locator; every definition has an API list and at least three Checks (counts: 0.1–0.5: 4,4,4,4,4;
1.1: 4; 1.2: 3; 1.3: 4; 2.1: 3; 3.3: 4; 5.1: 3; 5.3: 3; 5.5: 3; 6.1: 3; 6.3: 3; 7.1: 3; 7.2: 4); every
layer ends with Examples and Dependencies; the layer order 0–3 linear, 4 and 5 on 3, 6 on 4–5, 7 on
0, 4, 6 matches the `*Needs:*` lines (checked for all 38 targets against `plan.json` prerequisites).

**Duplication and ownership.** `roadmaps grep` (main and 466 open heads): "residual gerbe" occurs
only in consumers (LanglandsParameterStacks §1.16 Checks, FunctionFieldArithmeticPartII's gap and
targets at its lines 53, 7366, 7985, 8101); "closed substack" is used, never defined, in
AlgebraicModuliForArithmeticGeometry §5.4 (schematic image of DM stacks), HeckeStacksAndLocalShtukas,
ModularCurvesPartII and others; "finite type point", "quasi-DM", "decent algebraic stack/space" and
"monomorphism of algebraic stacks" occur nowhere else; "reduced induced" on main is the scheme case
(AdicSpacesPartIII, Mathlib's `vanishingIdeal`, cited here); "normal space" elsewhere is Riemannian
or rigid-analytic. SchemeAndStackFoundations on main defines no substacks, monomorphisms or
immersions of stacks (grep). This roadmap is the owner of every object it states. Overlaps
(`scratch/overlaps.md`): no open pull request changes this roadmap, no cited id is dropped or defined
only by an open revision; the closest roadmaps are revisions of SchemeAndStackFoundations, whose
§§1.7–1.23 headings this roadmap cites by number from main. FunctionFieldArithmeticPartII's
gap:zero-dimensional-dm-residual-gerbes names SchemeAndStackFoundations as supplier for what this
roadmap's worked example states (with the needed quasi-compact-diagonal hypothesis); that is a note
for that roadmap, not a dependency here.

**Shape and style.** Headings in upstream form; Unicode mathematics, no LaTeX delimiters; no
pull-request numbers, dates (the only date is the version of Alper's draft in References, which is
part of the citation), job ids or machine paths in the README; proposed names in italics per
Convention 10, so no backticked name of this roadmap's own is claimed as a declaration; cross-roadmap
citations by roadmap and section only.

**Elaboration.** Not available (this lane does not elaborate; the design has no `Suggested.lean`).
Headline theorems from the Summary (1.1/4.1, 4.2–4.4, 4.5, 5.3/6.2/6.3, 6.4, 7.3) are all planned
with hypotheses and locators; the package stage decides statability at the pins (the carrier is
Tau Ceti's `SchPseudofunctor` with Mathlib's `IsStack`, both present at the pins).

## Not verifiable

- `lmb2000` Chapter 11, Définition 11.2 and `olsson2016` Chapter 11: paywalled, settled as uncertified
  in the manifest; cited by locator only (5.5 and background). Rydh's description of the LMB
  definition (rydh2011 lines 1236–1245) was used instead.
- Stacks Project statements cited only inside the gap contracts (Spaces over Fields 72.10.8–72.10.9,
  More on Groupoids in Spaces 79.9.4, 79.10.3, Groupoids in Spaces 78.25.1, 78.27.1–2, Algebraic
  Stacks 94.16.1, Descent 35.18–35.19, Descent on Spaces 74.9, Morphisms of Spaces 67.32.1, Morphisms
  29.59.1–2, Artin's Axioms 98.5.2) are not in the cached chapters; they are supplier obligations, cited
  by number as the cached chapters cite them, and were not opened.

## Source issues

- **Misprint** in alper-moduli at Exercise 4.5.11 (a), printed page 183: the source writes the
  stabiliser action on a framed tangent vector as composing `g` after the framing `α : x ≅ τ|_k`, which
  does not typecheck for `g ∈ Aut(x)`; it should be precomposition with `g` (or its inverse for a left
  action), as ahr2020 states; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "54a30e17ffc861ca75a495d79432ce0159978bba", "job": "REV-DESIGN-StackPointsAndResidualGerbes", "model": "fable", "worker": "chris-x10"} -->
