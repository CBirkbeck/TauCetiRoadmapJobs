# Review of StackPointsAndResidualGerbes (design, round 5)

**Verdict:** needs changes

One P2 finding (R01) and six P3 notes (R02–R07). The three round-4 findings are repaired (checked
passage by passage below). R01–R03 are supplier drift: the READMEs of SchemeAndStackFoundations and
ReductiveGroups on main were both revised on 2026-11-10, after the round-4 review resolved the
citations, and the pinned Tau Ceti already holds part of what one gap asks for. The other fifteen
declared supplier gaps are contracts, not findings. The fifteen sampled targets, the headline
theorems and every passage the round-5 repair changed were read at their locators and recomputed in
the adversarial table.

## R01 (P2) — gap:reduced-regular-smooth-local asks SchemeAndStackFoundations for what the pinned Tau Ceti provides

Location: `packages/StackPointsAndResidualGerbes/design/README.md` lines 357–362 ("§4.13 must prove
that reducedness and regularity of schemes are local in the smooth topology and descend along flat
surjective, respectively flat surjective locally finitely presented, morphisms"), lines 268–269
("§4.13 (`IsRegular`, *IsRegular.of_smooth*)"), 0.1 lines 421–422 and 433–434; `design/plan.json`
gap `reduced-regular-smooth-local` and the prerequisites of 0.1.

Claim: regular schemes and the smooth-locality and flat descent of regularity for schemes are
missing and must come from SchemeAndStackFoundations §4.13.

Witness: at the Tau Ceti pin `2fd255d9`, `TauCeti/AlgebraicGeometry/Scheme/Regular/Scheme.lean:68`
(`TauCeti.AlgebraicGeometry.IsRegular`), `:90` (`IsRegular.of_smooth`, smooth source of a regular
scheme), `Scheme/Regular/Descent.lean:56` (`IsRegular.of_flat_of_surjective`).
`TauCetiRoadmap/SchemeAndStackFoundations/README.md` line 5947 on main now reads "Regular schemes …
are Tau Ceti's".

Repair: (1) under "From Tau Ceti" add the three declarations with file and line, saying what each
includes: `IsRegular` extends `IsLocallyNoetherian`; `of_flat_of_surjective` assumes the target
locally Noetherian. (2) In the SchemeAndStackFoundations contract delete "(`IsRegular`,
*IsRegular.of_smooth*)" and in 0.1 write "regular (Tau Ceti `TauCeti.AlgebraicGeometry.IsRegular`)".
(3) Narrow the gap in the README and in `plan.json` (`needs`, and 0.1's prerequisite
`tauceti:TauCeti.AlgebraicGeometry.IsRegular` in place of the §4.13 declaration) to what is absent:
"§4.13 must prove that reducedness of schemes is local in the smooth topology and descends along
flat surjective morphisms (Descent, Lemmas 35.18.1, 35.19.1), that reducedness and regularity of
algebraic spaces are smooth local and descend in the same way (Descent on Spaces, Lemmas 74.9.2,
74.9.4), and that a smooth algebraic space over a field is regular (Spaces over Fields, Lemma
72.16.1); for schemes, regularity is Tau Ceti's `IsRegular.of_smooth` and
`IsRegular.of_flat_of_surjective`." Tested on the instances that use the gap: for `Bμ_p` (0.1 Check)
with atlases `U = 𝔾_m` and any `V`, a scheme `W` étale over `U ×_𝒳 V` is regular by `of_smooth`
over `U`, and `V` is regular by `of_flat_of_surjective`, `V` being locally Noetherian by §1.20's
atlas independence; for 3.4 (`𝒵_x` regular) the atlas pulled back to a flat point is smooth over a
field, regular by `of_smooth`, and regularity descends to the locally Noetherian atlas. Reducedness
has no pinned counterpart (only smooth over a field, `Morphisms/Smooth/GeometricallyReduced.lean`),
so that clause stays.

## R02 (P3) — four cited SchemeAndStackFoundations names no longer exist at its head

Location: `design/README.md` line 152 and line 265 ("the supplier's Check `test_BG_representations`"),
line 704 ("§1.21's `test_real_points`"), lines 1164–1165 ("§1.7's `points.test_no_residue_field`"),
line 248 ("`Stacks.StackInGroupoids`"). `design/plan.json` does not carry these names and needs no change.

Claim: these are names of the supplier.

Witness: `TauCetiRoadmap/SchemeAndStackFoundations/README.md` on main (`9897cdb`, file last changed
2026-11-10): its Checks are unnamed prose now (line 2330, the generic point of `𝔸¹_ℚ/ℤ`; lines
3084–3085, `B(ℤ/2)(ℝ)`; lines 3111–3113, `QCoh(BG)` as comodules), and line 2851 defines
*StackInGroupoids* with no `Stacks.` prefix. Grep for the four strings: no hit.

Repair: cite the Checks by section and content, without a name ("the Check of §1.22 that `QCoh(BG)`
is the category of `O(G)`-comodules", "the Check of §1.21 that `B(ℤ/2)(ℝ)` has two isomorphism
classes", "the Check of §1.7 on the generic point of `𝔸¹_ℚ/ℤ`"), and write §1.18's
*StackInGroupoids*. Tested: each replacement resolves at the lines quoted;
the mathematics of Convention 9, of 1.2's Check and of 4.2's Check is unchanged.

## R03 (P3) — 7.4 cites ReductiveGroups Layer 3A at a generality that layer excludes

Location: `design/README.md` lines 384–385 ("Layer 3A (orbits of algebraic actions)"), line 1648
("*Needs:* … ReductiveGroups Layer 3A (orbits)"), line 1672; `plan.json` 7.4 prerequisites.

Claim: Layer 3A supplies the orbit `G·x` of 7.4, for a smooth affine `G` over an arbitrary field `k`.

Witness: `TauCetiRoadmap/ReductiveGroups/README.md` lines 1360–1367 on main (changed 2026-11-10):
the orbit geometry is the pinned library "consumed at its own hypotheses: an algebraically closed
field `k`"; over a nonclosed field one applies it after the algebraic closure.

Repair: 7.4 already defines `G·x` itself (the reduced image of the orbit map) and its route uses
only 7.3's chart (`W = V ×_{[V/G]} BG_x` is a closed subscheme with the orbit as support, smooth
over `k`, hence reduced). Remove Layer 3A from 7.4's `*Needs:*`, from Layer 7's Dependencies and
from `plan.json` 7.4, and in the ReductiveGroups contract say that Layer 3A's orbits (over an
algebraically closed field) agree with 7.4's after base change to `k̄` and are not an input. Tested:
`𝔾_m` on `𝔾_m` by `t·x = t^p x` over `𝔽_p(s)` at `x = 1`: the orbit is all of `V`, closed;
`W = V` is smooth; `N_x = T_V/T_V = 0`, as for `Bμ_p` in 7.3; nothing from Layer 3A is used.

## R04 (P3) — 0.4's ideal of a closed substack is a kernel in `QCoh(𝒳)`, not on the fppf site

Location: `design/README.md` lines 549–551: "`𝒵 ↦ ℐ_𝒵 := ker(O_𝒳 → i_* O_𝒵)` and `ℐ ↦ V(ℐ)` are
inverse inclusion-reversing bijections between closed substacks of `𝒳` and quasi-coherent ideals
`ℐ ⊆ O_𝒳`"; `plan.json` 0.4 `closedSubstackEquivIdeal`.

Claim: the kernel of `O_𝒳 → i_*O_𝒵` is a quasi-coherent ideal.

Witness: stacks-sheaves-on-stacks lines 1072–1073 (Lemma 96.15.1 (3)): the inclusion of
quasi-coherent modules into all modules on the fppf site is not exact. Instance: `𝒳 = 𝔸¹_k`, `𝒵`
the origin; on `T = 𝔸¹` the sheaf kernel is `(t)`, on `T = Spec k` at the origin it is `0 ⊆ k`,
while the pullback of `(t)` is `k`: not cartesian.

Repair: write "`ℐ_𝒵` is the kernel of `O_𝒳 → i_*O_𝒵` in the abelian category `Stacks.QCoh 𝒳`
(Sheaves on Stacks, Lemma 96.15.1 (2)–(3)); under *QCoh.presentationEquiv* it is the `R`-invariant
ideal of `U ×_𝒳 𝒵` in `O_U`. The kernel among all modules on the fppf site is not quasi-coherent,
and `ℐ → O_𝒳` is a monomorphism in `QCoh`, not on every test scheme", and restate the plan entry
the same way. Tested: on `𝔸¹_k` the kernel in `QCoh` is the module of `(t)`, whose value on
`Spec k` is `k·t` mapping to zero in `k`, in agreement with 0.4's own criterion "the image of
`x^*ℐ → O_T` is zero"; the Check `V((t²))` has ideal `(t²)` holds; 7.1–7.3 use `ℐ` only through the
atlas.

## R05 (P3) — 5.3's existence citation omits 4.4

Location: `design/README.md` lines 1324–1325 (5.3, API bullet 4): "The residual gerbe of a
quasi-separated stack, of a locally Noetherian decent stack, or of a decent stack at a finite type
point is a gerbe over `Spec κ(x)` (with 4.1, 4.3)."

Claim: 4.1 and 4.3 give existence in the three cases.

Witness: existence on a locally Noetherian stack is 4.4 (stacks-06RD lines 3096–3097, Lemma
101.31.3). 4.3 assumes a gerbe or quasi-compact inertia and 4.1 a finite type point; neither
hypothesis follows from "locally Noetherian and decent" by any target of the roadmap.

Repair: write "(with 4.1, 4.3, 4.4)"; add 4.1, 4.3, 4.4 to 5.3's `*Needs:*` line as "for the last
API bullet" and `target:4.1`, `target:4.3`, `target:4.4` to `plan.json` 5.3. Tested: quasi-separated
⇒ quasi-compact diagonal ⇒ quasi-compact inertia and decent (4.3, 5.1); locally Noetherian decent
(4.4); finite type point of a decent stack (4.1): the three cases are covered and no cycle arises,
4.x not using Layer 5.

## R06 (P3) — 6.4: the residual gerbe at a rational section always exists

Location: `design/README.md` lines 1494–1496: "`x ∈ 𝒳(k)` satisfies `p ∘ x = id`, and the residual
gerbe at `x` exists, then … if `𝒳` is locally of finite type over `k`, the residual gerbe exists";
`plan.json` 6.4 hypothesis "Z_x exists (automatic if X is locally of finite type over k)".

Claim: existence of `𝒵_x` is a hypothesis, discharged only when `𝒳` is locally of finite type.

Witness: stacks-06RD lines 1527–1528 (Lemma 101.17.8, no hypothesis on the second morphism):
`p ∘ x = id` is locally of finite type, so `x` is; `x` is a finite type point and 4.1 gives `𝒵_x`.
Instance: `𝒳 = Spec k[x₀, x₁, …]`, not locally of finite type over `k`, `x` the origin:
`𝒵_x = Spec k = BG_x`.

Repair: state "for every algebraic stack `𝒳` with `p : 𝒳 → Spec k` and `x` with `p ∘ x = id`: `x` is
locally of finite type (cancellation), the residual gerbe exists (4.1), `Spec k → 𝒵_x^♭` is an
isomorphism and `𝒵_x ≃ BG_x`; if moreover `𝒳` is locally Noetherian, for instance locally of finite
type over `k`, and `x` is closed, `BG_x → 𝒳` is a closed immersion (4.5)"; drop the existence
hypothesis in `plan.json` 6.4. Tested: on `[Spec k[x₀, x₁, …]/𝔾_m]` (weights `pⁱ`, 2.6) at the
origin, `𝒵 = B𝔾_m = BG_x`; the three Checks of 6.4 and Layer 7's standing hypotheses are unchanged;
the `*Needs:*` line already lists 4.1 and the cancellation law.

## R07 (P3) — 6.1 uses an undefined base `S`

Location: `design/README.md` lines 1414–1415: "the pullback of `R_x → Spec k ×_S Spec k` along the
diagonal of `Spec k`".

Claim: the stabilizer is formed over a base `S`.

Witness: Convention 1 (line 97): notions are absolute and no base is named; no `S` is introduced in
Layer 6.

Repair: write "`R_x → Spec k × Spec k`" (the absolute product). Tested: for `𝒳 = Spec κ` and `k/κ`
finite Galois, `R_x = Spec(k ⊗_κ k) → Spec(k ⊗_ℤ k)` pulled back along the diagonal is
`Spec k = ` the trivial group, as 6.1's Check says; the diagonal factoring through `Spec k ×_κ Spec k`,
any base gives the same pullback.

## Round-4 findings, checked one by one

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P2) 1.2's fibre bullet | repaired | README lines 696–699: "Two objects `x, y` over `Spec k` have the same image iff there are a field `Ω` and two field homomorphisms `a, b : k → Ω` with `(Spec a)^*x ≅ (Spec b)^*y` … the converse needs the two embeddings", with the Check of lines 706–712. Source read at stacks-04XE lines 341–350 (two independent morphisms from `Spec Ω`). Recomputed: `a = σ`, `b = id` gives `σ = σ`; one `ι` gives `ι(i)` against `−ι(i)`, different since `2ι(i) ≠ 0`. |
| F02 (P3) 1.1's vacuous bullet | repaired (as a Check) | README lines 668–674: "A definition asking every representative to be locally of finite type would have no finite type points at all: … `Spec k(t) → Spec k → 𝒳` … by cancellation `Spec k(t) → Spec k` would then be." Lemma 101.17.8 read at stacks-06RD lines 1527–1528; `k(t)` is not a finitely generated `k`-algebra; `plan.json` 1.1 has 5 tests for 5 Checks. |
| F03 (P3) 5.2's route | repaired | README lines 1272–1287, three numbered reductions: "`𝒳'` is decent when `𝒳` is (5.1, Lemma 101.48.3 …). It is locally Noetherian when `𝒳` is (0.5's API, Lemma 101.17.5)" and "`U` … is locally Noetherian when `𝒰` is, by 0.1's API applied to `π`, which is smooth and surjective (2.3, Lemma 101.33.8)". Source read at stacks-06RD lines 4850–4865 (the two "details omitted" are exactly these steps); 4.3 (lines 1175–1176) and 5.4 (lines 1345–1346) carry the matching base-change clauses, read against stacks-06RD lines 3050–3053. |

## Verified sound

**Dependency gate** (the command of the brief; no UPWARD or CYCLE line):

```
candidate: StackPointsAndResidualGerbes is not in the merge order yet; checked as if placed after AlgebraicModuliForArithmeticGeometry (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2034 edges, 0 problem(s)
```

**Overlaps** (`scratch/overlaps.md`, main `9897cdb`, 432 open heads): no open pull request changes
this roadmap, no cited id is dropped by an open pull request, none is defined only by an open
revision. The closest roadmaps in vocabulary are revisions of SchemeAndStackFoundations and the new
roadmap AlgebraicModuliForArithmeticGeometry, a supplier. **Citations** (`scratch/citations.md`):
no cross-roadmap citation found nowhere; the eleven Lean-name leads are supplier names, resolved by
hand below (two of them are in R02).

**Principles.** Statements are at the Stacks Project generality (absolute stacks, any base, no
restricted cases); no roadmap is re-planned; supply is downward (gate); statements are in the
author's words with theorem numbers and cached-line locators, and no passage is copied (compared in
the fifteen sampled targets); no algorithm; the design stage has no Lean file, so no sorry'd data
and no `set_option`. Nothing in the README, the supplier READMEs, the sources or the earlier reports
instructed anything.

**Sources: the seeded sample**, each read at the cited lines; number, hypotheses and statement agree
with the README unless a finding says otherwise.

| Target | Source lines read | Result |
|---|---|---|
| 0.4 | stacks-04XE 872–888 (Lemma 100.9.11); stacks-sheaves-on-stacks 953–955 (Prop 96.14.3), 1068–1076 (Lemma 96.15.1); ahr2020 248–252 (`I^{n+1}`) | correct in `QCoh`; wording R04 |
| 0.5 | stacks-04XE 1073–1091 (10.1, unicity omitted), 1092–1106 (10.2–10.3), 1107–1125 (Def 10.4, Remark 10.5); stacks-06RD 1484–1498 (17.4–17.5) | correct; scheme atlas in place of a space atlas |
| 1.1 | stacks-06RD 1545–1578 (18.1, Def 18.2, 18.3), 1579–1601 (18.4–18.6), 1527–1528 (17.8); alper-moduli 6983–6987 | correct |
| 2.5 | stacks-06QB 2821–2843 (Prop 28.11), 2862–2875 (28.13, openness by 27.15), 2876–2890 (28.14, descent by 27.16) | correct; the two gaps are the two inputs |
| 3.3 | stacks-06ML 1260–1286 (Lemma 11.7 with proof), 1288–1297 (Def 11.8 and footnote), 1300–1310 | correct |
| 4.3 | stacks-06QB 2893–2904 (28.15: `𝒵_x = (𝒳 ×_X Z_x)_red`); stacks-06RD 3048–3056 (31.1) | correct |
| 4.4 | stacks-06RD 3096–3129 (31.3 and proof: `u` with `{u}‾ ∩ E = {u}`, `R' = p⁻¹(Z)`) | correct |
| 5.1 | stacks-04XE 1453–1463 (14.1); stacks-06RD 4686–4735 (Def 48.1, 48.2–48.5); stacks-decent-spaces 567–573, 587–589 | correct; 48.3's hypothesis "representable by algebraic spaces and quasi-separated" is kept |
| 5.3 | stacks-decent-spaces 1542–1552 (13.7), 1225–1227 (Def 11.2); alper-moduli 6962–6965, 16528–16538 (Prop 7.4.39, Noetherian); rydh2011 1268–1277 | statement correct; citation R05 |
| 5.4 | rydh2011 1268–1305 (Theorem B.2 and proof) | correct; the route through 2.6 replaces B.1, the rest is Rydh's |
| 6.1 | stacks-06ML 1214–1237 (11.5), 1352–1368 (11.14); stacks-06RD 1609–1616 (18.7) | correct; `S` undefined: R07 |
| 6.2 | alper-moduli 16541–16549 (Exercise 7.4.40 (1): Noetherian, finite type point) | correct; the README's general form goes through 2.2 |
| 6.4 | alper-moduli 6994–6999 (Prop 4.5.16 (2): finite type, smooth affine `G_x`), 7017–7024; ahr2020 476–478 | correct; one hypothesis redundant: R06 |
| 7.2 | ahr2020 39–44, 475–480 (quasi-separated, lft, affine stabilizers; `N_x = (i^*I)^∨`) | correct |
| 7.4 | ahr2020 484–486 (`G` smooth, `G_x` not necessarily smooth), 55–58 (Theorem 1.2) | correct; supplier citation R03 |

Also read: stacks-04XE 341–350; stacks-06QB 2862–2875 (misprint below); stacks-06RD 445–456 (4.15–4.16), 4829–4878 (51.1–51.4);
stacks-decent-spaces 1500–1540 (13.5, Def 13.6); rydh2011 1236–1245.

**Library declarations at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, read from
`lake-manifest.json`). Every file-and-line citation of the README was opened and the name found at
its line: Mathlib `IsStack.lean:49`, `Sites/Fpqc.lean:54`, `ResidueField.lean:45`,
`ClosedImmersion.lean:44`, `Flat.lean:42`, `FiniteType.lean:42, 112`, `FinitePresentation.lean:46`,
`Smooth.lean:59`, `QuasiFinite.lean:72`, `Properties.lean:68`, `Noetherian.lean:54, 271`,
`IdealSheaf/Basic.lean:564`, `IdealSheaf/Subscheme.lean:453, 470`, `JacobsonSpace.lean:70`,
`Smooth/Kaehler.lean:324`, `Smooth/Basic.lean:125, 290`, and `finite_of_finite_type_of_isJacobsonRing`
(`RingTheory/Jacobson/Ring.lean:691`); Tau Ceti `Stack/Basic.lean:37`,
`AlgebraicSpace/Basic.lean:68, 74, 113, 195`, `Comodule/Basic.lean:50`, `Comodule/Cat.lean:50`,
`LinearlyReductive.lean:60`, `Representation/Embedding.lean:212` (namespace
`TauCeti.AffineGroupSchemeCat`, `[LocallyOfFiniteType G.obj.X.hom]`), `Tangent/Regularity.lean:112`
(outside the algebraically closed section, which ends at line 108), `Homogeneous/Basic.lean:217` and
`Homogeneous/Torsor.lean:154, 160` (root namespace `CommHopfAlgCat`, as the README writes).
Representability of the homogeneous quotient at the pin is only for linearly reductive subgroups and
for reductive ones in characteristic zero (`Homogeneous/Coinvariants.lean:219, 255`,
`Homogeneous/GeneralLinear.lean:56`), so gap:homogeneous-quotient-scheme asks for what is absent.
Tau Ceti has one file each under `AlgebraicSpace` and `Stack`: no algebraic stack, inertia or points
at the pin. Found in addition: `Scheme/Regular/Scheme.lean:68, 90` and `Scheme/Regular/Descent.lean:56`
(R01).

**Cross-roadmap citations resolved now.** SchemeAndStackFoundations on main `9897cdb`: §1.2 (line
2166), §1.7 (2306), §1.8 (2333), §1.9 (2401), §1.12 (2512), §1.13 (2521), §1.14 (2561), §1.15 (2604),
§1.16 (2693, `twistingBijection` 2699), §1.17 (2728), §1.18 (2849), §1.19 (2923), §1.20 (2949),
§1.21 (3055), §1.22 (3092), §1.23 (3124), §4.12 (5915), §4.13 (5945); 38 of the 44 cited names are
present at their sections (`opensEquiv` 2315, `Spaces.EtaleLocal` 2397, `Groups.GroupSpace` 2557,
`Groups.IsTorsor` 2689, `artinBootstrap` 2756, `twoFiberProduct` 2886, `RepresentableProperty` 2927,
`IsDeligneMumford` with `.iff_unramified_diagonal` 2934–2935, `inertia.representable` 2951,
`SmoothLocal.atlas_independent` 2957, `Stacks.points` with `.pullbackSurjective` 2966,
`QuasiCompactStack` 2985, `stack_presentation` 2993, `Stack.quotient` 3058,
`actionQuotient.torsorEquiv` 3069, `quotientStack_algebraic` 3071, `Stacks.QCoh` 3094,
*QCoh.presentationEquiv* 3097, *QCoh.pushforward* 3100, `toModuliSheaf` 3126, `generic_flatness`
5917, and the rest); the four absent ones are R02, and `IsRegular`, *IsRegular.of_smooth* are R01. §1.22 defines `QCoh` on
the fppf site by Stacks, Definition 96.11.1, which R04 relies on. AlgebraicModuliForArithmeticGeometry
at the head of its pull request (`e5f9c4c`): §4.1 (line 1863) with `IsGerbe.equivalence_iff` (1887),
`relativeGerbe` (1895), `relativePullback` (1913), `relativeComposition` (1921), `relativeDescent`
(1929, "locally essentially surjective"); §8.1 (9650) with `deformationGroupoid` (9652),
`deformationFunctorOfPoint` (9670, "under (RS)"), `stabiliserActionOnDeformations` (9674); §8.3
(9726) with `FramedDeformation`, `framedDeformation_twoFibre` (9748), `framedTangent_exactSequence`
(9788, "satisfying RS"); §5.4 (8675) uses closed substacks of DM stacks (8711) without defining them.
ReductiveGroups on main: Layer 1 (1030), Layer 3 (1262; lines 1295–1300: the quotient is first the
fppf sheaf, representability "a theorem with hypotheses"), Layer 3A (1358; R03). FlagVarieties on
main (lines 49, 69) declares the same slug `homogeneous-quotient-scheme` on the same supplier
section; both hand the object to ReductiveGroups, so it has one owner.

**Declared gaps** (16): the same sixteen slugs in `plan.json` and in the README's contracts (script;
the seventeenth slug in the README, `zero-dimensional-dm-residual-gerbes`, is
FunctionFieldArithmeticPartII's, named under Downstream consumers), each with a named supplier and
section. Fifteen ask for something absent at the supplier and at the pins (stacks, algebraic spaces
beyond `AlgebraicSpace/Basic.lean`, decent spaces, (RS) for algebraic stacks, the general homogeneous
quotient); the sixteenth is R01.

**Duplication and ownership** (`roadmaps grep --fixed -i --readme-only`, main and 432 open heads):
"finite type point", "decent algebraic stack", "decent stack", "fppf image", "reduced induced closed
substack", "monomorphism of algebraic stacks", "infinitesimal neighbourhood of a closed substack",
"gerbe over an algebraic", `IsGerbeOver`: no match anywhere. "residual gerbe": only the consumers
LanglandsParameterStacks and FunctionFieldArithmeticPartII. "closed substack": used, never defined
(HeckeStacksAndLocalShtukas, ModularCurvesPartII, AlgebraicModuliForArithmeticGeometry,
LocalGaloisDeformationRings, VirtualFundamentalClass, StableReductionPartII). "normal space"
elsewhere is topological or Riemannian. No roadmap cites StackPointsAndResidualGerbes. This roadmap
is the owner of every object it states.

**Adversarial pass** (values computed on each side: the sampled targets, the headline theorems and
every target a finding touches).

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.1 regular stacks through the pin (R01) | `Bμ_p/𝔽_p`; `Spec k[x,y]/(xy)`; `[Spec k[t]/(t²)/𝔾_m]` | atlas `𝔾_m` regular, `μ_p = Spec 𝔽_p[λ]/(λ−1)^p` flat lfp over it and nonreduced, so only smooth atlases are tested; reduced, local ring at `0` of embedding dimension 2 and dimension 1, not regular; atlas nonreduced | holds; citation and gap: R01 |
| 0.4 closed substacks ↔ ideals | `𝔸¹`, `(t)`, `(t²)`; `Spec k[ε]`; `T = Spec k` at `0` | `V((t²)) = Spec k[t]/(t²)`, ideal `(t²) ≠ (t)`; `ℐ² = 0`, `𝒳^{[1]} = 𝒳`, `𝒳^{[0]} = Spec k`; sheaf kernel on `T` is `0`, pullback of `(t)` is `k` | holds in `QCoh`; R04 |
| 0.5 reduced induced substack | `T = ∅`; `Spec k[ε]`; `[𝔸¹/𝔾_m]` at `{1}`; `Spec k[ε] → 𝔸¹`, `t ↦ ε` | `∅`; `Spec k`; `T̄ ∖ T = {0}`, open substack `Spec k`; `ε ≠ 0` so no factorisation through `t ↦ 0` | holds |
| 1.1 finite type points | generic point of `Spec ℤ_(p)`; of `𝔸¹_k`; `Spec ℚ̄ → Spec ℚ` | `ℚ = ℤ_(p)[1/p]` finitely generated; `k(t)` not finitely generated over `k[t]` (finitely many generators invert finitely many irreducibles, `k[t]` has infinitely many); `ℚ̄` not finitely generated, the point still of finite type through `id` | holds |
| 1.2 fibre bullet (repaired) | `Spec ℚ(i)`: `id`, `σ`; `B(ℤ/2)_ℝ` | two embeddings `(σ, id)` identify; one embedding: `ι(i) ≠ −ι(i)`; `H¹(ℝ, ℤ/2)` has 2 classes over 1 point, both trivial over `ℂ` | holds |
| 2.5 diagonal criterion, homeomorphism, diagonal | `Spec k → B𝔾_m`; `Spec k → Spec k[ε]`; `Bℤ → Spec k` | `Δ` is the unit section of `𝔾_m`, codimension 1, not flat; `(ε) ⊗ k → k` is zero, not flat, yet a universal homeomorphism; `Δ_{Bℤ}` pulls back to `⊔_ℤ Spec k`, not quasi-compact, while `Δ_{Spec k}` is | holds |
| 2.6 Check (non-reduced) | `[Spec k[ε]/𝔾_m]` | stabilizer `k[ε][λ^{±1}]/((λ−1)ε)`; `λ − 1` kills `ε` and `λ − 1 ∉ εB` since `B/εB = k[λ^{±1}]`; not flat | holds |
| 3.3 residual gerbe | scheme point; `[𝔸¹/𝔾_m]`; `Spec k → BG`; `Spec k[ε]` | `Spec κ(x)`; `B𝔾_m`, `Spec k`; `Spec k ×_{BG} Spec k = G ≠ Spec k`; `Spec k`, the reduced one | holds |
| 3.4 Check | `Spec ℚ(t)/ℤ` | free: equaliser of `σ^n`, `σ^m` is `V(n − m) = ∅` in characteristic 0; one point, étale atlas a field; not `Spec F`, since `Spec(ℚ(t) ⊗_F ℚ(t))` is quasi-compact and `ℤ × Spec ℚ(t)` is not | holds |
| 4.3 gerbes; quasi-compact inertia | `[𝔸¹/𝔾_m]`; `Bℤ`; `B(𝔸¹/ℤ)` | `𝒵_1 = Spec k`, the dense open gerbe of `|𝒳|`; inertia `ℤ_k` not quasi-compact, gerbe clause; `𝔸¹/ℤ` quasi-compact, diagonal `⊔_ℤ 𝔸¹ → 𝔸²` not quasi-compact; `(𝒳 ×_X Z_x)_red`: smooth over a reduced base, already reduced | holds |
| 4.4 locally Noetherian | `Spec ℚ(t)/ℤ`; `[Spec k[x₀, …]/𝔾_m]`; `U/G` of Example 100.11.6 | exists, itself; stabilizer closed in `𝔾_m × U`, affine, 4.3 applies; `Spec ℚ̄ → X` lft, 4.1 applies | holds |
| 4.5 (headline) closed ⇔ closed immersion | `[𝔸¹/𝔾_m]`; DVR; `U/G` | `B𝔾_m` closed, `Spec k` open; `Spec R/𝔪` closed, `Spec K` open; closed point, `Spec ℚ̄ → X` a monomorphism, not closed: `U ×_X Spec ℚ̄ = G × Spec ℚ̄` discrete, `U` profinite | holds |
| 5.1 decency | `B𝔾_m`; `Spec ℚ(t)/ℤ`; monomorphism into a decent stack | affine diagonal; `⊔_ℤ Spec ℚ(t)` not quasi-compact; diagonal an isomorphism, so 48.3 applies | holds |
| 5.2 (repaired route) | `[𝔸¹/𝔾_m]` at `0` and `1`; `id_{𝔸¹}`; `Spec ℚ(t)/ℤ` | `𝒳' = B𝔾_m`, `𝒰 = 𝒳'`, `U = Spec k`; at `1`: `𝒳' = 𝒳`, `𝒰 = Spec k ∋ 1`; image `𝔸¹ ⊄ {η}`; `U = 𝒳` locally Noetherian, not decent, 68.13.9 applies | holds |
| 5.3 (headline) gerbe over `Spec κ(x)` | `𝔸¹_ℚ` at `t² + 1`; `[Spec ℂ/(ℤ/4)]_ℝ`; `Spec ℚ(t)/ℤ` | `ℚ(i)`; base `Spec ℝ`, `H¹(ℝ, ℤ/4) = {0, 2}`, both map to `0` in `H¹(ℝ, ℤ/2)`, no real object; not decent, base not a field | holds; R05 |
| 5.4 algebraicity | `[𝔸¹/𝔾_m]` at `0`, `1`; generic point of `𝔸¹` | `B𝔾_m` over `Spec k`; `Spec k`; `Z = 𝔸¹`, `Spec k(t) → 𝔸¹` affine, not an immersion; the base is irreducible (`|𝒰| ≅ |U|`) and reduced, a nonempty open contains its generic point | holds |
| 5.5 fppf image | `Spec κ(t) → Spec κ`; `k/κ` finite; `BG_k` at `k̄` | not lfp; a `κ`-map `κ(t) → L` with `L/κ` finite is impossible; lfp by cancellation along the gerbe; `k̄ → L'` with `L'/k` finite impossible | holds |
| 6.1 presentation | `BG_k`; `Spec κ`, `k/κ` Galois with group `Γ`; `[𝔸¹/𝔾_m]` at `0` | `R_x = G`, equal projections; `Γ × Spec k`, stabilizer trivial, quotient `Spec κ`; `R_x = 𝔾_m`; `R_x → Spec k` is a base change of the lft `x`, so flat lfp over a field | holds; R07 |
| 6.2 (headline) `𝒵_x ×_{𝒵_x^♭} Spec k ≃ BG_x` | `BG_k`; `[Spec ℂ/(ℤ/4)]_ℝ` over `ℂ`; `Spec κ` | `BG`, whereas `𝒵_x ×_𝒳 Spec k = G`; `B(ℤ/2)_ℂ` (kernel of `ℤ/4 → ℤ/2`); `Spec k = B1`; automorphisms of `(x, id)` are `G_x(T)`, the base being a sheaf | holds |
| 6.3 Check (quaternions) | `(t, −1)` over `ℚ(t)`, `σ : t ↦ t²` | residue at `t = 0` is `−1 ∉ ℚ^{×2}`, nonsplit; `(t², −1) = (1, −1)` split; `σ` not surjective | holds |
| 6.4 (headline) rational points | `Bμ_p/𝔽_p(t)`; `Spec κ` with `k ≠ κ`; `Spec k[x₀, x₁, …]` at `0` | `Bμ_p = BG_x`, `μ_p` not smooth; `𝒵 = Spec κ ≠ Spec k`; `x` lft by 17.8, `𝒵_x = Spec k` although `𝒳` is not lft over `k` | holds; R06 |
| 7.2 normal space | `[𝔸¹/𝔾_m]` at `0`; `[𝔸ⁿ/GLₙ]`; `𝔸²` | `(λ·t)(a) = t(λ⁻¹a)`: weight `−1` on `ℐ/ℐ²`, `+1` on `N_0`; coordinates dual to the standard representation, `N_0 = kⁿ`; `k²` trivial | holds |
| 7.3 (headline) `0 → T_{BG_x} → T_{𝒳,x} → N_x → 0` | `Bμ_p`; `Bα_p`; `B𝔾_m`; cusp; `μ_p ⊆ GL₁` | `{1 + aε} ≅ k`, `N = 0`; `k[ε]/k[ε]^p ⊇ εk`, dimension `1 = 1 − 0`; `0`; `T = N = (𝔪/𝔪²)^∨`, dimension 2; `Q = 𝔾_m` by `t ↦ t^p`, `dπ = 0`, cokernel of dimension `1 − 0 = 1` | holds |
| 7.4 quotient stacks | `GLₙ` on `𝔸ⁿ` at `0`; `𝔾_m` on `𝔸¹` at `1`; `SL₂` on binary quadratic forms at `uv`; `𝔾_m` on `𝔾_m` by `t^p` | `N = kⁿ`; orbit not closed; stabilizer `ac = bd = 0`, `ad + bc = 1 = ad − bc` forces `b = c = 0`, orbit `disc = 1` of dimension `3 − 1`, `d(disc)` at `(0, 1, 0)` is `(0, 2, 0) ≠ 0`; orbit `= V`, `N = 0`, stabilizer `μ_p` | holds; R03 |
| Worked example (zero-dimensional DM) | `Bℤ/K`; `B(ℤ/2)` | `G_x = ℤ` not finite, excluded by the diagonal hypothesis; a finite type representative has `k` finite over `K = K̄`, so `k = K` | holds |

Context and generality: Layer 7's standing hypotheses (a field `k`, `𝒳` locally of finite type over
`k`, `x` closed with `p ∘ x = id`, `G_x` affine) are what 7.2–7.4 use; every target states its
hypotheses in its sentence and carries a locator.

**Shape and style** (script and grep): 38 subsections against 38 plan targets; every subsection has
a `*Needs:*` line; 131 Checks against 131 plan tests, equal per target, at least three per target;
every layer ends with Examples and Dependencies; headings in upstream form; no LaTeX delimiters; no
pull-request numbers, job ids, round labels, hand-off words, "optional", "deferred" or machine
paths (the two dates in References identify the versions read); proposed names in italics
(Convention 10), so no backticked name of this roadmap's own claims a declaration. `sources.toml`
parses: 15 entries (13 certified; `lmb2000`, `olsson2016` uncertified and settled), no local path;
every work the README cites has an entry; nothing was fetched this round, and there is no
`needs-references.toml`.

**Elaboration.** Not available (this lane does not elaborate; the design has no `Suggested.lean`).
Headline theorems from the Summary: finite type points (1.1, 4.1); existence of residual gerbes
(4.2–4.4); the residual gerbe over its residue field with `𝒵_x ×_{κ(x)} k ≃ BG_x` (5.3, 6.2, 6.3);
`𝒵_x ≃ BG_x` at rational points (6.4); the closed-immersion criterion (4.5); the tangent–normal
sequence (7.3). Statability is decided at the package stage: algebraic stacks, inertia and
`Stacks.points` are roadmap targets, not pinned declarations, so these headlines will be named in
the module docstring as not statable. Padding and the one-tactic probe do not apply at this stage.

## Not verifiable

- `lmb2000` Chapter 11, Définition 11.2 and `olsson2016` Chapter 11: paywalled, settled as
  uncertified, cited by locator only; rydh2011 lines 1236–1245 describe the definition and its
  error.
- The Stacks Project lemmas named inside the gap sentences from chapters outside the manifest
  (Morphisms of Spaces 67.10.8 and 67.32.1, Spaces over Fields 72.10.8–72.10.9 and 72.16.1, Descent
  35.18–35.19, Descent on Spaces 74.9 and 74.11.15, Groupoids in Spaces 78.25 and 78.27, More on
  Groupoids in Spaces 79.9.4 and 79.10.3, Algebraic Stacks 94.16, Artin's Axioms 98.5.2): not opened;
  they are the suppliers' locators, and the sampled proofs cite them at the lines read.
- Whether the downstream roadmaps (EquivariantIntersectionTheory, GroupSchemesOverABase,
  MotivicStructuresInModuliOfCurves, VirtualFundamentalClasses) will consume the targets named for
  them: none cites this roadmap yet.

## Source issues

- **Gap** in stacks-04XE at Lemma 100.10.1, printed page 23: the source omits the proof that the reduced closed substack with given support is unique; it should pass through the presentation correspondence and uniqueness of the reduced induced structure on the atlas; affects nothing.
- **Gap** in stacks-06RD at Lemma 101.51.2, printed page 102: the proof leaves to the reader that the reduced closure and the base of the dense open gerbe stay locally Noetherian; it should cite Lemma 101.17.5 and smooth descent along the gerbe (Lemma 101.33.8); affects the proof.
- **Misprint** in stacks-06QB at Lemma 101.28.13, printed page 61: the proof writes the map on points as going from the points of the target to those of the source, twice; it should be the map from the points of the gerbe to those of its base; affects nothing.
