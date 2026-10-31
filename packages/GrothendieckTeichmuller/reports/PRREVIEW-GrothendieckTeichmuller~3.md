# Review of GrothendieckTeichmuller (pull request #1058 at 70b2046)

**Verdict:** accepted

Incremental re-review of the 66 changed lines since 4495ce1 (README 60 lines, `Suggested.lean` 6
lines of docstring). Gate at this head: OK (every check passed; build=0, depcheck=0, set_option=0,
prnum=0, tex=0, residue=0, readme-ids-missing=0, stray-files=0). Dependency check run again on this
head (`gate --depcheck … --movable`): `depcheck: 205 roadmaps, 1418 edges, 0 problem(s)`, no UPWARD
or CYCLE line; the merge order lists GrothendieckTeichmuller at line 368. The diff outside the folder
(`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GrothendieckTeichmuller'`) is empty; the
folder holds `README.md`, `Suggested.lean`, `metadata.toml`. Elaboration of `Suggested.lean` with
`lake env lean` at the pins: exit 0, fifteen `declaration uses 'sorry'` warnings (lines 98, 102, 106,
110, 114, 130, 167, 201, 205, 219, 242, 250, 272, 277, 283) and nothing else. No P1 or P2 finding;
two P3 notes. Ownership against the open pull requests listed in the brief was checked with
`roadmaps grep` (below).

## R01 (P3) — 4.5: the locator for "profinite" is Schneps 1997, §1.3, not Lochak–Schneps §1 or Harbater–Schneps §0

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` lines 603–604: "*Source:* `GT̂` as a
profinite group of automorphisms of `F̂₂`: Lochak–Schneps 1994, §1; Harbater–Schneps 2000, §0."

Claim: the two cited passages say that `GT̂` is a profinite group of automorphisms of `F̂₂`.

Witness: harbaterschneps00 lines 71–75 give `GT̂₀`, `GT̂` as sets of pairs inducing automorphisms of
`F̂₂`, with "a natural group structure" — no topology. lochakschneps94 §1 (lines 16–155) presents
`GT̂` as a subgroup of `Aut(B̂ₙ)` (lines 19–21) and as a semigroup of pairs (lines 139–149), never as a
profinite group. The statement that `GT̂` is profinite, with exactly the route the roadmap's 4.5
Checks use (inverse limit of its images in the finite automorphism groups of `F̂₂/N`, `N`
characteristic of finite index), is Schneps 1997, §1.3, remark (3), printed pp. 189–190
(schneps97 lines 278–284, attributed to Pop); Ihara 1991, §3.3 (ihara91 lines 9635–9638) defines
`GT̂` as a subgroup of `Aut F̂₂`.

Repair: "*Source:* `GT̂` as a group of automorphisms of `F̂₂`: Ihara 1991, §3.3; Harbater–Schneps 2000,
§0; `GT̂` profinite as the inverse limit of its images in `Aut(F̂₂/N)`: Schneps 1997, §1.3, remark
(3)." Optionally add one clause to the `GT̂₀` sentence: the remaining conditions of `IsGT0` are closed
by 3.4 (`isGT0_iff`) and the argument of the first sentence, so that the closedness of `GT̂₀` does not
rest on bijectivity alone.

## R02 (P3) — style: an unwrapped line and a manifest status word in the prose

- README line 604 is 137 characters long: the sentence "Prove `GTHat.isClosedEmbedding_betaEquiv`:
  …" was appended to the *Source:* sentence without re-wrapping. Start it on a new line and wrap at
  the width of the rest of the file.
- README line 185 ("Ribes–Zalesskii 2010, §9.1, uncertified") and line 655 ("Uncertified: paywalled
  book, cited by locator"): `uncertified` is the manifest status of a citation (`sources.toml`), not a
  word of the mathematics; no README on main uses it. Cite the book by locator in the prose and in
  the References ("Ribes–Zalesskii 2010, §9.1") and record the status in `sources.toml` when the
  manifest is created. A readable locator for the same decomposition exists: Herfort–Ribes 1985,
  proof of Theorem C′, printed p. 160 (herfortribes85 lines 258–260 use `F(X) = F(Y) ∐ F(X ∖ Y)` and
  `F = ⟨a⟩ ∐ ⟨b⟩` with `⟨a⟩ ≅ ẑ` as known facts), which may be cited beside it.

## Previous findings

- R01 — repaired: 2.3 reads "Prove that `toHat` has dense image (Mathlib `denseRange`), and that a
  homomorphism from `P₄` to a profinite group extends uniquely"; no "injective" or "residually finite"
  remains (grep). 2.4's third Check now says that for discrete `f`, (III) in `P₄` gives (III) in `P̂₄`
  by applying `toHat` (the direction that needs no injectivity).
- R02 — repaired: 1.3 and 3.2 use `(1, [y, x])` (computed below: image of `β` in `𝔖₃` is `⟨(12)⟩`,
  (I) holds, (II) gives a 3-cycle); 3.3 says `(3, 1) ∉ GT̂^{mon}` because `3 ∉ ẑˣ`; 4.3 treats the even
  case (`m = 0`), concluding `(λ, 1)` satisfies (II) exactly for `λ = ±1`; 4.5's Check gives the
  intersection `{(1, 1), (−1, 1)}`.
- R03 — repaired: Conventions line 78–81: "Lochak–Schneps 1994, §1, write the same law in the form
  `f₂(f₁ x^{λ₁} f₁⁻¹, y^{λ₁}) f₁`. Drinfeld 1990, (4.11), composes in the opposite order … while
  Drinfeld's law gives `(−1, x)` and `(−1, x⁻¹)`" — lochakschneps94 lines 139–148 and drinfeld90 line
  644 confirm both.
- R04 — repaired: 0.1 names the free-product decomposition with a locator (Ribes–Zalesskii 2010,
  §9.1) in the route and in `*Needs:*`, and `freeProfiniteGroup.dense_closure_range_of` for the first
  item; 4.5 gives the closedness of `GT̂₀` (surjectivity as an intersection of clopen conditions), the
  compactness of `GT̂` through `Units.instTopologicalSpaceUnits`, and a source; the docstring says
  plainly that 3.5 is not a headline. The new source sentence's locator for "profinite" is R01 above.

## Verified sound

**The changed passages.** Conventions (product law): `f₁ · β_{λ₁,f₁}(f₂) = f₁ f₂(x^{λ₁}, f₁⁻¹ y^{λ₁}
f₁) = f₂(f₁ x^{λ₁} f₁⁻¹, y^{λ₁}) f₁` (conjugate both arguments by `f₁`), which is the display at
lochakschneps94 lines 139–148; Drinfeld's (4.11), drinfeld90 line 644, is
`f = f₁(f₂ X^{λ₂} f₂⁻¹, Y^{λ₂}) · f₂`, giving `(−1,1)·(1,x) = (−1, x)` and `(1,x)·(−1,1) =
(−1, x⁻¹)` as the README says. 0.1: `dense_closure_range_of` at `Profinite/Free/Basic.lean` line 94
states `Dense (closure (range of))`, so with `X` finite the subgroup generated by the `of i` is dense:
the first item. The third item's route: Herfort–Ribes Theorem B (herfortribes85 line 39: `G = A ∐ B`,
`1 ≠ a ∈ A` gives `C_G(a) ⊆ A`) applied to `A = ⟨of i⟩‾`, `B = F̂(X ∖ {i})`; `A ≅ ẑ` is abelian, so
`C(g) = A` for `g ≠ 1` in `A`; injectivity of `zHat.lift (of i)` from the continuous homomorphism
`F̂(X) → ẑ`, `of i ↦ 1`, `of j ↦ 0`, which is a left inverse. 2.3 and 2.4: nothing in the file uses the
injectivity of `toHat` (grep for "injectiv": lines 11, 48, 183, 548, 550, 559, 634, none about
`toHat`); 2.3's first Check uses only finite quotients of `P₄`, which factor through `P̂₄`. 4.5: the
closedness of `GT̂₀` (values in the table); `Units.instTopologicalSpaceUnits` is
`Mathlib/Topology/Algebra/Constructions.lean` line 100, induced along `embedProduct : Mˣ →* M × Mᵐᵒᵖ`
(`isEmbedding_embedProduct`, line 107); a continuous injection from a compact space to a Hausdorff
space is a closed embedding (`Continuous.isClosedEmbedding`, `Topology/Separation/Hausdorff.lean`
line 685); `ContinuousAut.t2Space` (`ContinuousAut/Congruence.lean` line 258) and
`ContinuousAut.compactSpace` (`ContinuousAut/Profinite.lean` line 209) take
`IsTopologicallyFinitelyGenerated G`, which 4.5's `*Needs:*` supplies as 0.1;
`IsTopologicallyFinitelyGenerated.bijective_of_surjective` is `Profinite/Hopfian.lean` line 87;
`zHat.isUnit_iff_component` is `ZHat/Units.lean` line 51 (so `3 ∉ ẑˣ`: its `3`-adic component is not a
unit). `Suggested.lean`: only the docstring changed (lines 36–39); the 43 declarations and their
elaborated types are those of `signatures.md`, which the previous review compared with the README
statement by statement; no binder is lost (`eq_of_beta_eq` carries `IsUnit p.lam` and the two
membership hypotheses; `subst` its five instance arguments).

**Seeded sample.** Targets of the sample that the diff touches were re-read at their locators: 0.1
(above), 1.2 (lochakschneps94 139–148, drinfeld90 644, and Guillot's §5.6 / Schneps §1.1 as in the
previous review), 2.4 (the third Check only; the relation itself is unchanged, drinfeld90 line 634,
lochakschneps94 line 155), 3.2 (the third Check, computed below; Guillot's definition at guillot14
lines 2996–3000 is unchanged), 3.3 (third Check; drinfeld90 lines 717–721 for the semigroup), 4.3
(first Check, computed below), and 4.5 (R01). The untouched targets 0.3, 0.4, 1.5, 2.1, 3.1, 3.5, 4.1,
4.2, 4.4 stand as verified in the previous review.

**Ownership.** `roadmaps grep` over main and the 433 open roadmap pull requests for "free profinite
product" and "Herfort" returns only this roadmap; "Ribes" returns ProfiniteCohomology (Prop. 2.2.2,
Cor. 6.5.6, 7.2.5, Thm 6.10.5, continuous sections and cohomology, nothing on free products or
centralizers). The pinned Tau Ceti has no free profinite product and no centralizer theorem for
free profinite groups (`Topology/Algebra/Group/Profinite/` and `ContinuousAut/`: the only
`centralizer` is the kernel of `conjNormal`, `ContinuousAut/Basic.lean` line 290); main has no
roadmap stating either (grep of `TauCetiRoadmap/` and `Completed/`). So 0.1 owns them, as its Scope
says. The second owners checked in the previous review (BelyiMaps exclusion, Completed/
PeripheralActions, GeometricTopology at #903) are unchanged.

**Adversarial table.** Rows for statements the diff leaves untouched are carried from the previous
report (marked "r2"); rows for changed statements give the values computed now.

| statement | instances | values | result | change |
|---|---|---|---|---|
| Conventions, LS form of the law | `(λ₁,f₁)(λ₂,f₂)` | `f₁ f₂(x^{λ₁}, f₁⁻¹y^{λ₁}f₁) f₁⁻¹ f₁ = f₂(f₁x^{λ₁}f₁⁻¹, y^{λ₁}) f₁`; at `(−1,1),(1,x)`: `x(x⁻¹,y⁻¹)·1 = x⁻¹`, so `(−1,x⁻¹)`; reversed: `1·x = x`, `(−1,x)` | equal to the roadmap's law | none |
| Conventions, Drinfeld (4.11) | same pair | `f = f₁(f₂X^{λ₂}f₂⁻¹, Y^{λ₂}) f₂`: `(−1,1)·(1,x)`: `1·x = x`; `(1,x)·(−1,1)`: `x(X⁻¹,Y⁻¹)·1 = x⁻¹` | `(−1,x)`, `(−1,x⁻¹)` as stated | none |
| 0.1 centralizer route | `X = {i}`; `X = Fin 2`, `g = y` | rank one: `B` trivial, `A = F̂` abelian, `C(g) = A` ✓; rank two: Theorem B gives `C(y) ⊆ ⟨y⟩‾`, and `xy ∉ C(y)` (`(123)`, `(23)` in `𝔖₃`) | sound | none (locator note in R02) |
| 0.1 injectivity of `zHat.lift (of i)` | `a ∈ ẑ` | `π_i(lift a) = a` for `π_i : F̂(X) → ẑ`, `of i ↦ 1`, `of j ↦ 0` | sound | none |
| 1.3 Check 3 | `(1,[y,x])`; `(λ,1)`, `λ ∈ ẑˣ` | image of `β_{1,[y,x]}` in `𝔖₃` is `⟨(12)⟩` (next row), so not surjective, not a unit; image of `β_{λ,1}` ∋ `(x^λ)^{λ⁻¹} = x`, `y`: surjective, Hopf gives bijective, inverse `(λ⁻¹,1)` | sound | none |
| 3.2 Check 3 | `x ↦ (12)`, `y ↦ (13)`, both composition conventions | `[y,x] ↦ (132)` resp. `(123)`; `[y,x]⁻¹ y [y,x] ↦ (12)` in both; `[x,y][y,x] ↦ id`; `[x,z][z,y][y,x] ↦ (132)` resp. `(123)` | sound: not surjective, (I) holds, (II) fails | none |
| 3.3 Check 3 | `(3,1)`, `(0,1)` | `3`-adic component of `3` is `3 ∉ ℤ_3ˣ`; integers in `ẑˣ`: `n` with `n ∈ ℤ_ℓˣ` for all `ℓ`, i.e. `n = ±1`; `0 ∉ ẑˣ` | sound | none |
| 4.3 Check 1, odd `m` | `D_N`, `x ↦ s`, `y ↦ t`, `st = r` | `z ↦ r⁻¹`; `z^m y^m x^m ↦ r^{−m} t s = r^{−(m+1)}`; computed for `N = 2..7`: solutions are the odd `m ≡ −1 (mod N)` | `m = −1`, `λ = −1` | none |
| 4.3 Check 1, even `m` | same | `t^m = s^m = 1`, `z^m ↦ r^{−m}`; solutions for `N = 2..7`: the even `m ≡ 0 (mod N)`; all `N` forces `m = 0` | `λ = 1`; `(λ,1)` satisfies (II) iff `λ = ±1` | none |
| 4.5 Check 1 | `{(λ,1) : λ ∈ ẑˣ} ∩ GT̂^{mon}` | (I), (III) hold at `f = 1`; `1 ∈ F̂₂'`; (II) iff `λ = ±1` (previous rows) | `{(1,1),(−1,1)}` | none |
| 4.5 `GT̂₀` closed | `p ↦ β_p` surjective | closed image `H`; `H = F̂₂` iff `HN = F̂₂` for every open normal `N` iff images of `x^λ`, `f⁻¹y^λf` generate `F̂₂/N`; each condition depends on `λ mod exp(F̂₂/N)` and `f mod N`: clopen; intersection closed; (I), (II), unit, `F̂₂'` closed as for `GT̂^{mon}` (via `isGT0_iff`) | sound | R01 (one clause) |
| 4.5 `GT̂` compact | units topology | `embedProduct` embeds `GT̂` onto `{(u,v) : uv = vu = 1} ⊆ GT̂^{mon} × GT̂^{mon}`, closed since the product is continuous (1.5) and `Param` is Hausdorff; closed in compact is compact | sound | none |
| 4.5 closed embedding | `GT̂` compact, `ContinuousAut F̂₂` Hausdorff with 0.1 | `Continuous.isClosedEmbedding` from continuity (second Check) and injectivity (4.2) | sound | none |
| 2.4 Check 3 | discrete `f`, `(a,b) ∈ P₄` | `toHat(f(a,b)) = f(toHat a, toHat b)` since both sides are homomorphisms in `f` agreeing on `x, y`; (III) in `P₄` ⇒ (III) in `P̂₄` | sound; converse not claimed | none |
| `subst`, 0.2–0.4, 1.1, 1.2, 1.4, 1.5, 2.1, 2.3 Check 3, 2.4 Check 2, 3.1, 3.2 Check 2, 3.3 units, 3.4, 3.5, 4.1, 4.2, 4.4, Scope HMM | as in the previous report | values as in the previous report's table (r2) | sound (r2) | none |

**Padding.** The one-tactic probe of the previous review applies unchanged (no Lean statement
changed); `param_one_mul`, `param_mul_one` close only through the `Monoid Param` instance whose
fields they are, as before. Headlines: the five end theorems of the Summary are stated
(`isUnit_iff_bijective_beta`, `isGT0_iff`, `GTHat.isGT0`, `GTHat.injective_mk_betaEquiv`,
`isClosed_setOf_isGT` with `GTHat.isClosedEmbedding_betaEquiv`); 3.5 is named as not a headline,
consistent with the Summary ("built on the way").

## Not verifiable

- Ribes–Zalesskii, *Profinite Groups*, 2nd ed., §9.1 (Springer, paywalled; cited by locator for the
  free-product decomposition of `F̂(X)`). Not read. Herfort–Ribes 1985, p. 160 (herfortribes85 lines
  258–260), uses the decomposition as known, which supports the citation's content.
- Ihara 1994 (LMS LNS 200), Belyi 1979, Montpellier folder 145: as in the previous review; cited in
  Scope and 4.3 as context only, none touched by this change.

## Source issues

- none at the locators checked this round (lochakschneps94 §1, harbaterschneps00 §0, herfortribes85
  Theorems B and C′, drinfeld90 (4.11), schneps97 §1.3, ihara91 §3.3); the previous review's entry on
  guillot14 Lemma 5.19 stands.
