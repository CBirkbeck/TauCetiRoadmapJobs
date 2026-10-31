# Review of GrothendieckTeichmuller (pull request #1058 at 4495ce1)

**Verdict:** needs changes

Gate at this head: OK (every check passed; build=0, depcheck=0, set_option=0, prnum=0, tex=0,
readme-ids-missing=0). Dependency check (`gate --depcheck … --movable`): `depcheck: 205 roadmaps,
1418 edges, 0 problem(s)`, no UPWARD or CYCLE line; the merge order lists GrothendieckTeichmuller at
line 368, after its only cross-roadmap references. One P2 finding, three P3.

## The previous review's findings at this head

- R01 (P1, GeometricTopology `GT4` cited as supplier of the pure-braid generators): **repaired.**
  Scope lines 30–33 own "the six words `x_{ij} ∈ pureSubgroup 4` … and the theorem that they
  generate `pureSubgroup 4` (Lochak–Schneps 1994, §2 …; Drinfeld 1990, (4.6))"; 2.2 cites the same;
  no `GeometricTopology`, `GT4` or pull-request number remains in either file. The locators hold:
  lochakschneps94 lines 197–200 (generation and the formula), schneps97 line 104, drinfeld90 line 627.
- R02 (P2, `set_option`): **repaired.** None in `Suggested.lean`; the file uses `open scoped zHat` for
  `^ᶻ` only.
- R03 (P2, 3.4 stated (II) ⇔ `δ`-commuting unconditionally): **repaired.** 3.4 now reads "(I) holds
  if and only if `β_{λ,f}` commutes with `θ` …; if moreover (I) holds, then (II) holds if and only if
  `β_{λ,f}` commutes with `ω` …, equivalently with `δ`", with the explanation that (II) alone is not
  equivalent to `δ`-commuting. Matches schneps97 lines 215–218.
- R04 (P2, statable headlines absent): **repaired.** `GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`,
  `isClosed_setOf_isGT`, `GTHat.isClosedEmbedding_betaEquiv` are stated; the docstring names 3.5 as
  not stated (see R04 below for the wording).
- R05 (P3, padding): **repaired.** 43 declarations remain (57 before); `subst_zpowHat`, `beta_x`,
  `beta_y`, `subst_x_y`, `map_subst`, `subst_subst`, `conj_mem_pure`, `eq_neg_one_of_relII_one`,
  `isGT_complexConj`, `complexConj_mul_self`, `x_not_mem_commutatorClosure`,
  `existsUnique_two_mul_eq_sub_one`, `chi`, `beta_injective_on_GTHat` are gone; `conj_mem_pure` is
  inlined into `a13`, `a24`, `a14`.
- R06 (P3, pull-request numbers, TeX, name agreement, `chi` carrier): **repaired** (gate prnum=0,
  tex=0, readme-ids-missing=0; `χ` has no Lean name and lives on `GT̂₀` in 4.1).
- R07 (P3, shape): **repaired.** `## Scope and ownership`, `## Conventions`, `## Exact supplier
  contracts`, `## How to read the build`, `### k.n` targets with a `*Needs:*` line each (0.1–4.5, all
  checked), `### Examples` and `### Dependencies` per layer, `## Downstream consumers`; three Checks on
  every definition (0.2, 0.3, 0.4, 1.1, 1.2, 1.3, 1.4, 1.5, 2.1, 2.3, 2.4, 3.1, 3.2, 3.3, 3.5, 4.1–4.5);
  topological finite generation of `F̂₂` is target 0.1 and is listed in 3.3's and 4.5's `*Needs:*`.
- R08 (P3, roadmap-for-a-roadmap and provenance): **repaired.** Replaced by the Scope paragraph
  (lines 47–57); the folder 145 sentence stays under 4.3 with the archive URL.
- R09 (P3, attribution): **repaired** for Drinfeld's semigroup (3.3, *Source:* sentence, drinfeld90
  lines 717–721 confirm `λ ∈ 1 + 2ẑ` and no `F̂₂'` condition) and for the docstrings; the
  composition-law note was repaired as the previous review asked, but that review was wrong about
  Lochak–Schneps: see R03 below.

## R01 (P2) — 2.3: injectivity of `toHat` rests on an unowned, uncited theorem

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` line 384–385: "Prove that `toHat` has
dense image …, that it is injective (`P₄` is residually finite), and …". `*Needs:* 2.1, Mathlib
`ProfiniteGrp.ProfiniteCompletion`.`

Claim: `P₄ → P̂₄` is injective because `P₄` is residually finite.

Witness: the residual finiteness of the pure braid group (or of `B₄`) is a theorem (Artin's faithful
representation `B_n → Aut(F_n)` together with Baumslag's theorem that `Aut` of a finitely generated
residually finite group is residually finite, or linearity of `B_n` with Mal'cev's theorem). Nothing
provides it: the pinned Tau Ceti braid library is `Braid/Basic.lean` and `Braid/Word.lean` (no
residual finiteness, no Artin representation); Tau Ceti has only `FreeGroup.instResiduallyFinite`
(`GroupTheory/FreeGroup/ResiduallyP.lean` line 352); Mathlib at the pin has the reduction
`ProfiniteGrp.ProfiniteCompletion.etaFn_injective_iff_residuallyFinite`
(`ProfiniteGrp/Completion.lean` line 97) but no instance for braid groups; no roadmap on main or at
an open head states it (`roadmaps grep 'residually finite'` returns only free groups, in
FreeGroupsAndLimitGroups). The README gives no locator and the `*Needs:*` line names nothing that
implies it.

Repair (either): (a) make it a target of 2.3 with a legal locator, e.g. "Prove that `B₄`, hence
`P₄`, is residually finite: Artin's representation `B₄ → Aut(F₄)` is faithful (Artin 1947, Annals,
cited by locator, uncertified; or Bigelow, arXiv math/0001038, linearity), and `Aut` of a finitely
generated residually finite group is residually finite (Baumslag 1963, Bull. AMS 69, Theorem 1,
open access); conclude injectivity of `toHat` by Mathlib
`ProfiniteCompletion.etaFn_injective_iff_residuallyFinite`", listing these in `*Needs:*`; or (b)
delete the injectivity clause (nothing else in the roadmap uses it: 3.5's route goes through the map
`P̂₄ → K̂(0,5)`, not through injectivity) and reword 2.4's third Check, which currently says the two
readings of (III) agree "because `toHat` is injective".

## R02 (P3) — `(3, 1)` is not a parameter with unit exponent; four Checks rest on it

Location: README line 311 (1.3 Checks: "`(3, 1)` has a unit exponent, but is not a unit of
`Param`"), line 456 (3.2: "`(3, 1)` fails `IsGT0` although `3` is a unit"), line 479 (3.3), lines
599–600 (4.5: "The parameters `(λ, 1)` with `λ ∈ ẑˣ` … contains `(1, 1)` and `(−1, 1)` and not
`(3, 1)`"), and lines 565–566 (4.3: "Units `λ ≡ 1 (mod 4)` are not covered: `m` is even and the
dihedral quotient says nothing").

Witness: `3 ∈ ẑ = ∏ ℤ_ℓ` has `3`-adic component `3`, which is not a unit of `ℤ_3`, so `3 ∉ ẑˣ`
(Tau Ceti `zHat.isUnit_iff_component`, `ZHat/Units.lean` line 51); the only integers that are units
of `ẑ` are `±1`. So 1.3's and 3.2's Checks are false as stated, 3.3's reason is the wrong one (`(3,1)`
fails the first condition, not only (II)), and 4.5's set does not contain `(3, 1)` for a trivial
reason. Moreover, for a unit `λ`, `β_{λ,1}` is always surjective: its image is the closed subgroup
generated by `x^λ` and `y^λ`, which contains `x = (x^λ)^{λ⁻¹}` and `y`; so no parameter `(λ, 1)` with
unit exponent can witness "unit exponent but `β` not bijective". For the 4.3 remark: with `m` even,
`x^m ↦ 1`, `y^m ↦ 1`, `z^m ↦ r^{−m}` in the dihedral group of order `2N`, so (II) at `f = 1` forces
`N ∣ m` for every `N`, i.e. `m = 0`, `λ = 1`: the dihedral quotient decides the case, and
`(λ, 1) ∈ GT̂^{mon}` iff `λ = ±1` (in agreement with drinfeld90 lines 655–660 and ihara91 line 9697 for
discrete `f`).

Repair: in 1.3 and 3.2 use `(1, [y, x])`: `λ = 1` is a unit and `[y, x] ∈ F̂₂'`, but under
`x ↦ (12)`, `y ↦ (13)` in `𝔖₃` the word `[y, x]` maps to `(132)`, and `β_{1,[y,x]}(y) = [y,x]⁻¹ y [y,x]`
maps to `(132)⁻¹(13)(132) = (12)`, so the image of `β_{1,[y,x]}` lies in `⟨(12)⟩ ≠ 𝔖₃`: `β` is not
surjective, `(1, [y, x])` is not a unit of `Param` and fails `IsGT0` (it satisfies (I), since
`[x,y][y,x] = 1`, and fails (II): the image of `[x,z][z,y][y,x]` in `𝔖₃` is `(132)`). In 3.3 say
`(3, 1) ∉ GT̂^{mon}` because `3 ∉ ẑˣ`. In 4.5 replace "and not `(3, 1)`" by "and no other `(λ, 1)`
(4.3, Checks)". In 4.3 replace the last sentence by the even case: `m` even forces `m = 0`, so
`(λ, 1)` satisfies (II) exactly for `λ = ±1`.

## R03 (P3) — Lochak–Schneps's composition law is this roadmap's, not the opposite one

Location: README lines 77–80: "Drinfeld 1990, (4.11), and Lochak–Schneps 1994 compose in the
opposite order; the two laws differ already at `(−1, 1)` and `(1, x)`".

Witness: lochakschneps94 lines 139–148 give `(λ₁, f₁)(λ₂, f₂) = (λ₁λ₂, f₂(f₁ x^{λ₁} f₁⁻¹, y^{λ₁}) f₁)`,
and `f₂(f₁ x^{λ₁} f₁⁻¹, y^{λ₁}) f₁ = f₁ · f₂(x^{λ₁}, f₁⁻¹ y^{λ₁} f₁) = f₁ · β_{λ₁,f₁}(f₂)`, which is
the law of the Conventions. On the witness: Lochak–Schneps give `(−1,1)(1,x) = (x)(x⁻¹, y⁻¹) = (−1, x⁻¹)`
and `(1,x)(−1,1) = (−1, x)`, the same values as here. Drinfeld's (4.11), drinfeld90 line 644,
`f = f₁(f₂ X^{λ₂} f₂⁻¹, Y^{λ₂}) · f₂ = f₂ · β_{λ₂,f₂}(f₁)`, is the opposite law and gives
`(−1,1)·(1,x) = (−1, x)`, `(1,x)·(−1,1) = (−1, x⁻¹)`. (The previous review's note attributing the
opposite order to Lochak–Schneps was wrong; this review corrects it.)

Repair: "Drinfeld 1990, (4.11), composes in the opposite order; Lochak–Schneps 1994, §1, write the
same law as here in the form `f₂(f₁ x^{λ₁} f₁⁻¹, y^{λ₁}) f₁`." Keep the witness for Drinfeld.

## R04 (P3) — routes and locators

- 0.1, third bullet: the application of Herfort–Ribes Theorem B (herfortribes85 line 39, for a free
  profinite product `A ∐ B`) needs `F̂(X) = ⟨of i⟩‾ ∐ F̂(X ∖ {i})`, the free-profinite-product
  decomposition of a free profinite group of finite rank. It is a standard fact without a locator
  here (Ribes–Zalesskii, *Profinite Groups*, §9.1, may be cited by locator, uncertified) and should be
  named in the route and in `*Needs:*`.
- 0.1, first bullet, is Tau Ceti `freeProfiniteGroup.dense_closure_range_of` (`Free/Basic.lean`
  line 94) plus finiteness of `X`; name that declaration in the `*Needs:*` line, since it is the whole
  proof.
- 4.5 has no source locator (every other target has one), and "Hence `GT̂^{mon}`, `GT̂₀` and `GT̂` are
  compact" skips two steps: `GT̂` carries the topology of the units of `GT̂^{mon}` (Mathlib
  `Units.instTopologicalSpaceUnits`, induced from `M × Mᵐᵒᵖ`), so its compactness is the closedness
  of `{(u, v) : uv = vu = 1}` in `GT̂^{mon} × GT̂^{mon}`, which uses the continuity of the product
  (1.5) and Hausdorffness; and `GT̂₀ ⊆ Param` is closed because bijectivity of `β_p` is the
  intersection over the finite quotients `F̂₂ → G` of the clopen conditions "`β_p(x), β_p(y)` generate
  `G`" (surjectivity suffices by 3.3). One sentence each, and a locator (Lochak–Schneps 1994 §1 or
  Harbater–Schneps 2000 §0, lines 72–75, for `GT̂` as a group of automorphisms of `F̂₂`).
- `Suggested.lean` lines 36–39: the reason given for not stating 3.5 ("needs the words in `σ₀, σ₁, σ₂`
  that represent `x₄₅` and `x₅₁`") describes definable data (`x₄₅ = σ₃²`,
  `x₅₁ = σ₃ σ₂ σ₁ σ₀² σ₁⁻¹ σ₂⁻¹ σ₃⁻¹` in `B₅`, then `M(0,5)`, `K(0,5)`, `ρ`, `f̃` as in the
  Conventions), not a missing carrier. Since 3.5 is not an end theorem of the Summary, it need not be
  stated; say so plainly ("3.5 is not a headline and is kept in the README") rather than giving a
  statability reason.

## Verified sound

**Principles.** No route-specific shortcut, no re-planned roadmap, no copied passage, no algorithm,
no sorry'd data (gate), no `set_option`, no `lemma`, no process words (grep for "so far", "removed",
"deferred", "optional", "checkpoint", "review": none outside source citations of "Lemma"). Ownership:
`roadmaps grep` over main and the 433 open roadmap pull requests for `Grothendieck–Teichm`,
`pure braid`, `Artin generator`, `A_{ij}`, `x_{ij}`, `GT̂`, `pentagon relation`: no second owner of
`GT̂`, `β_{λ,f}`, `P̂₄`, the six `x_{ij}` or the substitution calculus. BelyiMaps (main, line 4714)
lists Grothendieck–Teichmüller theory as an exclusion; Completed/PeripheralActions (lines 576, 645)
names the relations and does not build them; GeometricTopology at the head of #903 (lines 1417–1425)
proves `normalClosure {σ_i²} = pureSubgroup n` and defines no `x_{ij}` family. The outside-folder diff
(`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckTeichmuller'`) is empty. The
folder holds `README.md`, `Suggested.lean`, `metadata.toml` only.

**Cross-roadmap citations resolved.** BelyiMaps Layer 12 on main (`### Layer 12: profinite powers,
the fundamental group, and the branch-cycle theorem`, line 3772) and its successor
`BelyiArithmeticActions` (main lines 76, 3774); InverseGaloisAndArithmeticFundamentalGroups at the
head of #850: `### IG.1.2 Tame quotients and tangential fibres` (line 990), `### IG.5.1 Configuration
spaces` (line 5317, `PConf_n`, `Conf_n`, identification with `TauCeti.BraidGroup`/`pureSubgroup` at
line 5359); Completed/ProfiniteArithmetic and Completed/ProfiniteProPGroups exist and the relative
links resolve. Both are deferrals, not suppliers; `*Needs:*` lines cite only Mathlib and Tau Ceti.

**Pinned declarations opened** (Tau Ceti `a91d3aa`, the pull request's pin; Mathlib `6b7abb3`):
`freeProfiniteGroup`, `of`, `dense_closure_range_of` (94), `hom_ext` (108), `lift` (124), `lift_of`,
`lift_unique`, `comp_lift` (146), `map`, `existsUnique_continuousMulEquiv` (206)
(`Profinite/Free/Basic.lean`); `zHat.lift` (`ZHat/Basic.lean` 140); `zHat.instCommRing`
(`ZHat/Ring.lean` 69), `IsTopologicalRing` (146); `zHat.isUnit_iff_component` (`Units.lean` 51),
`unitsEquivPiPadicInt` (79); `zpowHat_mul`, `map_zpowHat`, `conj_zpowHat`, `zpowHat_intCast`,
`continuous_zpowHat` (elaborated signatures in the probe); `ContinuousAut.conj` with
`conj g x = g * x * g⁻¹` (`ContinuousAut/Basic.lean` 181–192, so 0.4's `δ² = conj y` and
`δ = conj y ∘ ω ∘ θ` use the right direction), `ContinuousOut` (305), `ContinuousOut.mk`;
`congruenceTopology` is an instance (`Congruence.lean` 79; the probe confirms by `rfl` that the
instance on `ContinuousAut F2` is it); `ContinuousAut.compactSpace` (`Profinite.lean` 209),
`ContinuousOut.compactSpace` (229), `ContinuousOut.t2Space` (235), `ContinuousAut.t2Space`
(`Congruence.lean` 258), each with the hypothesis `IsTopologicallyFinitelyGenerated G`; `IsTopologicallyFinitelyGenerated` (`Generation.lean`
73), `bijective_of_surjective` (`Hopfian.lean`); `BraidGroup` (97), `sigma` (104), `permHom` (304),
`permHom_surjective` (312), `pureSubgroup` (394), its `Normal` instance (399),
`sigma_sq_mem_pureSubgroup` (418) (`Braid/Basic.lean`); no `isTopologicallyFinitelyGenerated` for
`freeProfiniteGroup` at either pin (only `_freeProP`, `_freeProC`), as 0.1 says. Mathlib:
`ProfiniteGrp.ProfiniteCompletion.completion` (73), `eta` (81), `lift` (147), `denseRange` (103),
`etaFn_injective_iff_residuallyFinite` (97) (`ProfiniteGrp/Completion.lean`);
`Units.instTopologicalSpaceUnits` (`Topology/Algebra/Constructions.lean` 100, induced from
`M × Mᵐᵒᵖ`); `Topology.IsClosedEmbedding` (`Topology/Defs/Induced.lean` 159).

**Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean` extended with the probe (exit
with only the expected `sorry` warnings on the original declarations and the probe's own errors):
`#check @` of the 43 declarations agrees with `signatures.md`; no binder is lost (`subst` carries its
five instance arguments; `eq_of_beta_eq` its three hypotheses; `GTHat.betaEquiv : GTHat →
ContinuousAut F2`; `TopologicalSpace GTHat` synthesises through the subtype and `Units` instances).

**One-tactic probe** (`first | rfl | simp | infer_instance | decide | simp [beta, Param.ext_iff] |
simp [IsGT, …] | simp [IsGT0, …] | continuity | fun_prop` on each sorried statement as an `example`):
`beta_mul`, `beta_one`, `param_mul_assoc`, `eq_of_beta_eq`, `closure_artin`, `isGT_one`, `IsGT.mul`,
`isUnit_iff_bijective_beta`, `isGT0_iff`, `GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`,
`isClosed_setOf_isGT`, `GTHat.isClosedEmbedding_betaEquiv` do not close. `param_one_mul` and
`param_mul_one` close by `simp`, but only through `one_mul`/`mul_one` of the `Monoid Param` instance,
whose fields are these very theorems: not padding. The monoid laws, `beta_mul`, `beta_one`,
`isGT_one`, `IsGT.mul` are the obligations of `Monoid Param`, `gtMonoid` and `GTHat.betaEquiv`, as the
docstring says. No declaration mirrors a Check or computes a value.

**Headline theorems** (Summary, lines 7–12): units of `GT̂^{mon}` are the bijective parameters
(`isUnit_iff_bijective_beta`); Guillot's `GT̂₀` is Drinfeld's (`isGT0_iff`); `GT̂ ⊆ GT̂₀`
(`GTHat.isGT0`); injectivity into `ContinuousOut F̂₂` (`GTHat.injective_mk_betaEquiv`); `GT̂` a
closed subgroup of `ContinuousAut F̂₂` (`isClosed_setOf_isGT`, `GTHat.isClosedEmbedding_betaEquiv`).
All five stated at the pins; 3.5 named as not stated.

**Seeded sample against the texts** (cache ids: guillot14 = arXiv 1309.1968v2, schneps97 = author
page `SchnepsGT.pdf`, lochakschneps94 = author page `Fls.pdf`, drinfeld90 = mathnet.ru Russian
original, ihara91 = ICM 1990 proceedings, herfortribes85 = GDZ OCR, harbaterschneps00 = AMS,
hmm22 = author page):
- 0.2 Substitution: `f(a, b)` notation and `f = f(x, y)`, schneps97 lines 120–123, ihara91 lines
  9572–9575, lochakschneps94 lines 127–130 ✓.
- 0.3 Closed commutator subgroup: kernel of the abelianization; route from Guillot's uniqueness
  argument (guillot14 lines 2974–2979, reduction to finite abelian quotients) ✓; `F̂₂'` as the
  topological derived group, schneps97 line 108, lochakschneps94 line 131 ✓.
- 1.1 `β_{λ,f}`: `x ↦ x^λ`, `y ↦ f⁻¹ y^λ f`: guillot14 lines 2964–2966, 2991–2992; ihara91 line 9637;
  schneps97 lines 127–130 ✓.
- 1.2 Product: `(λ, f)(μ, g) = (λμ, f F(g))`, schneps97 lines 130–134; Guillot composes the
  automorphisms (lines 3001–3002); Drinfeld (4.11) opposite (line 644) ✓; Lochak–Schneps: R03.
- 2.2 Generation: lochakschneps94 lines 197–200, schneps97 line 104, drinfeld90 lines 626–627 ✓.
- 2.4 Relation (III): drinfeld90 line 634 (4.10), lochakschneps94 line 155, with `x_{ij}` as in (4.6) ✓.
- 3.2 `GT̂₀`: guillot14 lines 2996–3000 (`(k, f) ∈ ẑˣ × [F̂₂, F̂₂]`, `β` an automorphism commuting
  with `δ` and `θ` in `Out`), Prop. 5.17 (2964–2967), Prop. 5.20 (3015) ✓.
- 3.3 `GT̂^{mon}`, `GT̂`: drinfeld90 lines 717–721 (semigroup, `λ ∈ 1 + 2ẑ`, units `GT̂`; line 657:
  `f` in the commutator subgroup is a consequence of (4.10)); schneps97 Lemma 2 and Corollary (lines
  168–206); ihara91 §3.3 lines 9635–9638 ✓.
- 3.4: schneps97 Theorem (i), (ii) lines 215–218 ✓; guillot14 Lemma 5.19 lines 3008–3011 (see Source
  issues).
- 3.5 Five-term: schneps97 lines 105–119 (`M(0,n)` relators, `K(0,5)`, `ρ`, `c`, `f̃`), line 139
  ((III) as `ρ⁴(f̃)…f̃ = 1`), lines 177–179 (`(c f̃)⁵`); ihara91 lines 9583–9587 (remark: equivalent to
  Drinfeld's `P₄` form; the cyclic product is a cyclic rotation of Schneps's, computed:
  `ρ(f̃) = f(x₄₅, x₅₁)`, `ρ²(f̃) = f(x₂₃, x₃₄)`, `ρ³(f̃) = f(x₅₁, x₁₂)`, `ρ⁴(f̃) = f(x₃₄, x₄₅)`);
  lochakschneps94 Prop. 2 (iii), (vi) lines 246, 252 (`K(0,5) ≅ K₄/Z`) ✓.
- 4.1: schneps97 lines 135–139 (`GT̂ ⊆ GT̂₀` by definition); guillot14 Thm 5.21 lines 3017–3020
  (projection to `ẑˣ`), remarks 3021–3024 ✓.
- 4.2: guillot14 Prop. 5.17 uniqueness (2974–2979), Prop. 5.20 (3012–3015) ✓.
- 4.3: `(−1, 1)`: ihara91 line 9569 (complex conjugation has `χ = −1`, `f = 1`); drinfeld90 lines
  655–656 ✓. Montpellier folder 145: not verifiable (below).
- 4.4: guillot14 §5.3 lines 2748–2765 (action of `Out(H_n)` on `K\G`, via `γ(N)`) ✓.
- 4.5: no locator (R04).
- Scope: harbaterschneps00 Main Theorem lines 76–77 (`Out♯₄ ≅ GT̂₀`, `Out♯ₙ ≅ GT̂`, `n ≥ 5`) ✓;
  hmm22 Definition 2.7 and Corollary 2.8 lines 1359–1391 (`GT^Σ × S_{n+3} ≅ Out(Πₙ)`), with
  Corollary 2.6's range `n ≥ 2`, `(r, n) ≠ (0, 2)` (line 1273), satisfied for `r = 3` ✓; Herfort–Ribes
  Theorem B line 39 ✓.

**Conventions.** (I) `f(y,x) f = 1`: schneps97 line 125, drinfeld90 (4.3) line 616, ihara91 line 9580
(`f(x,y)f(y,x) = 1`, equivalent); (II): drinfeld90 (4.4) line 618 with `X₁X₂X₃ = 1`, `m = (λ−1)/2`,
ihara91 line 9581, harbaterschneps00 line 66; (III) as above; `M(0,5)` relators `σ₃σ₂σ₁σ₀²σ₁σ₂σ₃`,
`(σ₀σ₁σ₂σ₃)⁵` are Schneps's `σ₄σ₃σ₂σ₁²σ₂σ₃σ₄`, `(σ₁σ₂σ₃σ₄)⁵` shifted by one; both map to `1` under
`permHom` ((12)² = 1, a 5-cycle to the fifth); `c = (σ₃σ₂σ₁σ₀)³`, `ρ(u) = c⁻¹uc`, `ρ(x_{i,i+1}) =
x_{i+3,i+4}` are lines 112–115; `δ(x) = x⁻¹y⁻¹`, `δ(y) = y` is Guillot's `δₙ` (lines 2839–2840).

**Adversarial table** (values computed on each side).

| statement | instances | values | result | change |
|---|---|---|---|---|
| `subst` | `f = 1, x, y, z`; `(a,b)` in `P` | `1(a,b)=1`, `x(a,b)=a`, `y(a,b)=b`, `z(a,b)=(ab)⁻¹`; `f(x,y)=f` by `hom_ext` on `![of 0, of 1]` | sound | none |
| 0.2 Check 2 | `𝔖₃`, `a=(12)`, `b=(23)` | `[a,b] = (12)(23)(12)(23) = (132) ≠ 1` | sound | none |
| 0.3 Check 3 | `x^a y^b`, abelianise | `(a,b) = 0` iff `a=b=0`; `y^c f ↦ (0,c)` | sound | none |
| 0.4 `θ², ω³, δ²`, `δ = conj y ∘ ωθ` | generators | `ω: x↦y↦z↦x`; `δ²(x) = (x⁻¹y⁻¹)⁻¹y⁻¹ = yxy⁻¹`, `δ²(y)=y`; `ωθ(x)=z=y⁻¹x⁻¹`, `y·z·y⁻¹ = x⁻¹y⁻¹ = δ(x)`; `ωθ(y)=y` | sound with Tau Ceti `conj g x = g x g⁻¹` | none |
| 1.1 `β` at `(1,1)`, `(0,f)`, `(−1,1)` | `x,y,z` | `id`; `x↦1`, `y↦f⁻¹f=1`; `x↦x⁻¹`, `y↦y⁻¹`, `z↦(x⁻¹y⁻¹)⁻¹=yx` | sound | none |
| 1.2 `β_{pq} = β_p∘β_q` | general | `β_p(β_q(y)) = β_p(g)⁻¹(f⁻¹y^λf)^μβ_p(g) = (fβ_p(g))⁻¹y^{λμ}(fβ_p(g))`; `β_p(β_q(x)) = x^{λμ}` | sound | none |
| 1.2 Check 1–2 | `(−1,1)`, `(1,x)` | here `(−1,1)(1,x) = (−1,x⁻¹)`, `(1,x)(−1,1) = (−1,x)`; Drinfeld (4.11): `(−1,x)`, `(−1,x⁻¹)`; Lochak–Schneps: `(−1,x⁻¹)`, `(−1,x)` | Drinfeld opposite, Lochak–Schneps equal | R03 |
| 1.3 "unit exponent necessary, not sufficient" | `(3,1)`; `(1,[y,x])` | `3 ∉ ẑˣ` (`3`-adic component `3`); `(1,[y,x])`: image of `β` in `𝔖₃` is `⟨(12)⟩` | claim true, Check false | R02 |
| 1.4 `eq_of_beta_eq` without `IsUnit` | `(0,1)`, `(0,[x,y])` | both `β` trivial; `[x,y] ↦ (132) ≠ 1` | hypothesis needed, present | none |
| 1.4 without `F̂₂'` | `(λ,f)`, `(λ,y^cf)` | same `β`; `y^cf ∉ F̂₂'` for `c ≠ 0` | hypothesis needed, present | none |
| 1.4 route | `λ` unit | `λ = μ` from `x^λ = x^μ` in `⟨x⟩‾ ≅ ẑ`; `gf⁻¹ ∈ C(y^λ) = ⟨y⟩‾` (Herfort–Ribes B, `y^λ ≠ 1`); `y^c ∈ F̂₂' ⇒ c = 0` | sound | R04 (free-product locator) |
| 1.5 Checks | `ẑˣ`; `λ_ℓ = ℓ` at `ℓ`, `1` elsewhere | `∏ℤ_ℓˣ` closed; `λ_ℓ → 1` in the product topology, `λ_ℓ ∉ ẑˣ` | sound | none |
| 2.1 Checks | `permHom`; `σ₀σ₂=σ₂σ₀`; `(σ₀σ₁)³` | squares and conjugates ↦ `1`; `σ₁σ₀σ₁⁻¹ ↦ (13)`; `x₁₂x₁₃x₂₃ = σ₀²σ₁σ₀²σ₁ = (σ₀σ₁)³` by `σ₁σ₀σ₁ = σ₀σ₁σ₀` | sound | none |
| 2.3 injectivity of `toHat` | — | needs `Group.ResiduallyFinite P4`; nothing provides it | unowned | R01 |
| 2.3 Check 3 | `ℤ/2` reading `x₁₃` | `x₁₂,x₂₃,x₃₄ ↦ 0`, `x₁₃ ↦ 1` | sound | none |
| 2.4 Check 2 | `f = x^a y^b`, abelianise `P̂₄` | left: `x₁₂`-coefficient `a`, `x₃₄`: `b`; right: `2a`, `2b`; so `a=b=0` | sound | none |
| 2.4 `RelIII 1` | — | both sides `1` | sound | none |
| 3.1 `RelI` Checks | `1`, `x`, `θ(g)⁻¹g` | `1`; `yx ≠ 1`; `θ(θ(g)⁻¹g)θ(g)⁻¹g = g⁻¹θ(g)θ(g)⁻¹g = 1` | sound | none |
| 3.1 `RelII` at `(1,1)`, `(−1,1)`, `(3,1)` | `𝔖₃` | `m=0`: `1`; `m=−1`: `(xyz)⁻¹ = 1`; `m=1`: `zyx ↦ (132)(23)(12) = (123) ≠ 1` | sound | none |
| 3.1 `RelII`, `λ` even `2`-adically | — | no `m` with `2m = λ−1` | false, as intended | none |
| 3.2 Check 3 | `(3,1)` | `3 ∉ ẑˣ`; for `λ ∈ ẑˣ` the image of `β_{λ,1}` contains `(x^λ)^{λ⁻¹} = x` and `y`: always surjective | Check false | R02 |
| 3.2 Check 2 | `c = (−1,1)` | `β_cθ = θβ_c` exactly; `β_cδ(x) = xy`, `δβ_c(x) = δ(x⁻¹) = yx = y(xy)y⁻¹` | sound | none |
| 3.3 `isUnit_iff_bijective_beta` ← | `p ∈ GT̂^{mon}`, `β_p` bijective | `β_p⁻¹(x) = x^{λ⁻¹}`; `β_p⁻¹(y) = g⁻¹y^{λ⁻¹}g` with `g = β_p⁻¹(f)⁻¹ ∈ F̂₂'` (`a^λ = b^λ ⇒ a = b`); `(λ⁻¹,g)` satisfies (I)–(III) by Schneps Lemma 2 applied to the inverse automorphism of `M̂(0,5)` (`Φ⁻¹(σ₁) = σ₁^{λ⁻¹}`, `Φ⁻¹(c) = c g̃`) | sound | none |
| 3.3 units of `Param` | `(λ,f)`, `β` bijective | inverse `(λ⁻¹, β⁻¹(f)⁻¹)`: `(λ,f)(λ⁻¹,g) = (1, fβ(β⁻¹(f)⁻¹)) = (1,1)`, `(λ⁻¹,g)(λ,f) = (1, β⁻¹(f)⁻¹β⁻¹(f)) = (1,1)` | sound | none |
| 3.4 (I) ⇔ `θ`-commuting | `(λ,f)`, `f ∈ F̂₂'` | `θβ(x) = y^λ`, `βθ(x) = f⁻¹y^λf`; `θβ(y) = f(y,x)⁻¹x^λf(y,x)`, `βθ(y) = x^λ`; conjugator `c` forced to `y^a f` and `f(y,x)⁻¹ = c x^b`; abelianise: `a = b = 0`, `f(y,x) = f⁻¹` | sound | none |
| 3.4 (II) given (I) | — | Schneps (ii); `δ ≡ ωθ` in `Out` and `θ`-commuting from (I) | sound as restated | none |
| 3.5 five-term vs (III) | `f = 1`; `ρ` order | both `1`; `ρ(x₁₂)=x₄₅`, `ρ(x₄₅)=x₂₃`, `3·5 ≡ 0 (5)`; `(cf̃)⁵ = c⁵ρ⁴(f̃)ρ³(f̃)ρ²(f̃)ρ(f̃)f̃` by induction `(cf̃)^k = c^k ρ^{k−1}(f̃)⋯f̃` | sound | none |
| 4.1 `GTHat.isGT0` | `g ∈ GT̂` | `β_g` bijective (3.3), (I),(II) ⇒ `θ`- and `δ`-commuting (3.4) | sound | none |
| 4.1 `χ` | `c`, `1`, `pq` | `−1`, `1`, `λμ`; `−1 ≠ 1` (`3`-adic components `2 ≠ 1`) | sound | none |
| 4.2 `injective_mk_betaEquiv` | `β_g = inn(c)β_h` | abelianise: `λ = μ`; `cx^λc⁻¹ = x^λ ⇒ c = x^a`; `x^ag⁻¹y^λgx^{−a} = f⁻¹y^λf ⇒ gx^{−a}f⁻¹ = y^b`; `f,g ∈ F̂₂' ⇒ a=b=0` | sound | none |
| 4.2 Check 3 | `(1,x)` | `β_{1,x}(y) = x⁻¹yx`, `β_{1,x}(x) = x`: `conj x⁻¹`; `x ∉ F̂₂'` | sound | none |
| 4.3 `(λ,1)` and (II) | dihedral `D_N`, `x↦s`, `y↦t`, `st = r` | `m` odd: `z^my^mx^m ↦ r^{−m}ts = r^{−(m+1)}`, so `m = −1`; `m` even: `↦ r^{−m}`, so `m = 0` | `(λ,1) ∈ GT̂^{mon}` iff `λ = ±1`; README's "says nothing" wrong | R02 |
| 4.4 action | `φ∘β_p⁻¹` | `(φ∘β_p⁻¹)(x) = φ(x^{λ⁻¹}) = a^{λ⁻¹}`; `p·(q·φ) = φ∘β_q⁻¹∘β_p⁻¹ = φ∘β_{pq}⁻¹`: a left action | sound | none |
| 4.5 `isClosed_setOf_isGT` | five conditions | `IsUnit λ` closed (`∏ℤ_ℓˣ`), `F̂₂'` closed, (I),(III) closed by continuity of `subst` (0.1), (II) closed by compactness of `ẑ` in the existential | sound | none |
| 4.5 compactness of `GT̂` | units topology | `GT̂ ≅ {(u,v) : uv = vu = 1} ⊆ GT̂^{mon} × GT̂^{mon}`, closed by continuity of the product | sound, route missing | R04 |
| 4.5 closed embedding | `GT̂` compact, `ContinuousAut F̂₂` Hausdorff (`t2Space` with 0.1) | continuous injection from compact to Hausdorff is a closed embedding; continuity: `β_g` on `F̂₂/N` depends on `λ mod exp(F̂₂/N)` and `f mod N` | sound | none |
| Scope, HMM Cor. 2.8 | `(g,r) = (0,3)`, `n ≥ 2` | Cor. 2.6 hypothesis `n ≥ 2`, `(r,n) ≠ (0,2)` holds | sound | none |

## Not verifiable

- Ihara 1994, LMS LNS 200 (Cambridge UP): paywalled, no author-page copy found; cited in Scope for
  the homomorphism `Gal(ℚ̄/ℚ) → GT̂`, which ihara91 §3.3 (lines 9635–9641) and drinfeld90 lines
  714–746 also state.
- Belyi 1979 (Izvestiya): not fetched; cited for injectivity in Scope only, as ihara91 line 9639
  reports it.
- Montpellier fonds, folder 145, p. 35 (handwritten scan, archive URL in 4.3): not read; cited as
  context only.
- Birman, *Braids, Links and Mapping Class Groups*: not cited at this head.
- Ribes–Zalesskii, *Profinite Groups*: not cited; suggested in R04 as an uncertified locator.

## Source issues

- **Error** in guillot14 at Lemma 5.19, proof, printed p. 57: the proof says Schneps's `ω` is an
  inverse of `δ` in `Out(F̂₂)`; `ω` has order 3 and `δ` order 2 there, and `δ = ωθ` modulo inner
  automorphisms; the lemma holds because Schneps's theorem (ii) is stated for pairs satisfying (I);
  affects the proof.
- none in schneps97, lochakschneps94, drinfeld90, ihara91, herfortribes85, harbaterschneps00, hmm22
  at the locators checked.
