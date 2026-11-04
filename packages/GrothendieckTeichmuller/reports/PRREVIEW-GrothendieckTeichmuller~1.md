# Review of GrothendieckTeichmuller (pull request #1058 at b01b540)

**Verdict:** needs changes

Gate at this head: FAIL (set_option=2, tex=1, prnum=1, readme-ids-missing=9; depcheck=0, build=0). No
acceptance while it fails. Findings most important first.

## R01 (P1) — Layer 2 is supplied by a GeometricTopology section that does not exist

Location: `TauCetiRoadmap/GrothendieckTeichmuller/README.md` lines 47–50, 181–188 ("GeometricTopology
(#903, GT4)", "the generation of the pure braid group by the `A_(i,j)` belongs with that development"),
and `Suggested.lean` lines 153–155.

Claim: the six generators `x_{ij}` are "GeometricTopology's `A_(i,j)` at `n = 4`, read through its
zero-based dictionary", and the generation of the pure braid group by the `A_(i,j)` is stated for all
`n` there; Layer 2.2 only uses the `n = 4` case.

Witness: GeometricTopology on main (`TauCetiRoadmap/GeometricTopology/README.md`) contains no `GT4`,
no `A_(i,j)`, no pure-braid generators (grep for `GT4`, `A_{ij}`, `A_(i`, `Artin generator`, `pure
braid` returns nothing beyond the Birman reference line 1062). At the head of #903 the only braid
material is §4.2.1 "Strand permutations and square quotients of braid groups" (lines 1407–1489),
which proves `normalClosure {σ_i²} = pureSubgroup n` and the Coxeter comparison; it defines no
`A_(i,j)` family, no dictionary and no generation theorem. And #903 revises a roadmap that is on
main, so it is never a dependency: GeometricTopology is cited as it is on main.

So the generation theorem of 2.2 and the generator dictionary of 2.1 are unowned, and the citation
names a section that exists nowhere.

Repair (tested on the instance: `Suggested.lean` already defines `a12`…`a34` by the words of the
Conventions and states `closure_artin`, so this roadmap can own them): in Scope say that this
roadmap owns the six words `x_{ij} ∈ pureSubgroup 4` of the Conventions and the theorem that they
generate `pureSubgroup 4`, with locator Lochak–Schneps 1994 §2 (the formula
`x_{ij} = σ_{j−1}⋯σ_{i+1}σ_i²σ_{i+1}⁻¹⋯σ_{j−1}⁻¹` and the generation statement, lochakschneps94
lines 196–200) and Drinfeld 1990 (4.6); delete every `GT4`/`#903` citation and the sentence "stated
for all `n` with #903's generators". If the author prefers the general `A_(i,j)` to live in
GeometricTopology, declare it as a gap: `What GeometricTopology must provide
(gap:pure-braid-generators): …` in the supplier subsection, with the same slug in `design/plan.json`.

## R02 (P2) — `set_option` in `Suggested.lean`

Location: `Suggested.lean` line 8 (`set_option autoImplicit false`) and line 36 (`set_option
quotPrecheck false in` before the scoped notation `ẑ`).

Claim: none; this is the binding rule "never `set_option` of any kind", and the gate fails on it.

Witness: gate.md, rule set_option (2).

Repair: delete line 8 (every binder in the file is explicit, so nothing changes), delete lines
36–39 and write `Additive zHat` where `ẑ` is used (eleven places), or keep a notation that needs no
precheck override. The `#check @…` list I elaborated (scratch, 57 declarations) shows no binder
depends on the notation.

## R03 (P2) — 3.4 states "(II) iff `β` commutes with `δ`" without relation (I); the source has (I) as a hypothesis

Location: README lines 212–215: "(I) holds iff `β_{λ,f}` commutes with `θ` in `ContinuousOut F̂₂`,
and (II) holds iff it commutes with `δ`. … *Source:* Guillot 2014, Lemma 5.19, citing Schneps 1997,
§1.2."

Claim: two independent equivalences, the second unconditional.

Witness: Schneps 1997 §1.2, Theorem (schneps97 lines 215–218): (i) an invertible pair satisfies (I)
iff `F` and `θ` commute in `Out(F̂₂)`; (ii) *given an invertible pair satisfying (I)*, it satisfies
(II) iff `F` and `ω` commute in `Out(F̂₂)`. Guillot's Lemma 5.19 (guillot14 lines 3008–3011) only
asserts that his definition of `GT̂₀` (both commutations) agrees with Drinfeld's (both relations).
Moreover `δ = ωθ` modulo inner automorphisms (`δ(x) = x⁻¹y⁻¹ = y·ωθ(x)·y⁻¹`, `δ(y) = y = y·ωθ(y)·y⁻¹`),
so for `F` commuting with `ω`, commuting with `δ` is equivalent to commuting with `θ`, i.e. to (I):
the unconditional "(II) iff `δ`-commuting" would make (II) carry (I) along, which no source claims.

Repair: state 3.4 as the source does: (a) for `(λ, f) ∈ ẑˣ × F̂₂'` with `β` bijective, (I) iff `β`
commutes with `θ` in `ContinuousOut F̂₂`; (b) if moreover (I) holds, (II) iff `β` commutes with `δ`
(equivalently with `ω`); hence Guillot's `GT̂₀` equals Drinfeld's. The Lean `isGT0_iff` is a
conjunction and is already of this form; only the prose changes. (The two-term witness: `c = (−1, 1)`
satisfies (I) and (II); `β_c θ = θ β_c` exactly and `β_c δ(x) = x y`, `δ β_c(x) = δ(x⁻¹) = y x`, which
differ by conjugation by `y`.)

## R04 (P2) — statable headline theorems absent from `Suggested.lean`; the docstring names none as not statable

Location: `Suggested.lean` module docstring lines 10–29; README Summary lines 7–9 and 4.1, 4.2, 4.5.

Claim (Summary): the roadmap delivers `GT̂ ⊆ GT̂₀`, the injection of `GT̂` into `ContinuousOut F̂₂`,
and "the profinite topology of `GT̂` inside the congruence topology of `ContinuousAut F̂₂`".

Witness: none of these is in the file, and the docstring does not say which headline is not
statable. All three are statable at the pins: `TauCeti.ContinuousOut` and `ContinuousOut.mk` exist
(`ContinuousAut/Basic.lean` lines 305, 313); the congruence topology on `ContinuousAut G` is an
instance (`ContinuousAut/Congruence.lean` line 79) and its compactness for topologically finitely
generated `G` is `ContinuousAut/Profinite.lean` line 209; `IsGT0` and `GTHat` are in the file. The
five-term relation of 3.5 (in the completion of `P₄ / Z(P₄)`) is statable with Mathlib's
`Subgroup.center` and quotient, or must be named in the docstring as not stated and why.

Repair: state (a) `∀ g : GTHat, IsGT0 (g : Param)`; (b) injectivity into outer automorphisms in
the form `(∃ c, ∀ w, beta g w = c * beta h w * c⁻¹) → g = h` for `g h : GTHat`; (c) with the
instance `TopologicalSpace Param` induced from `Additive zHat × F2` (one simple definition),
`IsClosed {p : Param | IsGT p}` and that `fun g : GTHat => betaEquiv g` is a closed embedding into
`ContinuousAut F2`, or, if the author keeps the topology out of the acceptance test, say so in the
docstring; (d) name 3.5 in the docstring as stated or not stated.

## R05 (P3) — padding in `Suggested.lean`

One-tactic probe on a scratch copy (elaborated with `lake env lean`): `subst_zpowHat` closes by
`exact (map_zpowHat _ _ _).symm`; `beta_x`, `beta_y` by `simp [beta, x, y]` (`lift_of`);
`subst_x_y`, `map_subst`, `subst_subst` each by one `freeProfiniteGroup.hom_ext` on `![…]` applied
with `DFunLike.congr_fun`. `conj_mem_pure` is a proved one-liner restating `Normal.conj_mem`.
`eq_neg_one_of_relII_one` mirrors the Check of 4.3 (its docstring says so); `isGT_complexConj`,
`complexConj_mul_self` compute the example `c = (−1, 1)`; `x_not_mem_commutatorClosure` is the
first Check of 0.2. `existsUnique_two_mul_eq_sub_one`, `beta_one`, `beta_mul` and the three monoid
laws are API, not headlines; the monoid laws and `isGT_one`/`IsGT.mul` are needed by the `Monoid
Param` instance and `gtMonoid`, so they may stay, but note that `GTHat` and `chi` then rest on
sorried closure proofs.

Repair: delete the padding from `Suggested.lean` (the README keeps each as an API bullet or Check);
inline `conj_mem_pure` into `a13`, `a24`, `a14`.

## R06 (P3) — gate text rules and README/Lean name agreement

- Pull-request numbers in the README: lines 48 and 182 (`#903`), 52 (`#850`), 188 (`#903`), 325
  (`#1685`, the one the gate flags); and in `Suggested.lean` line 154 (`#903`). Cite by roadmap
  name and section only.
- TeX fragment, line 408: `M_{g,ν}` outside a code span.
- Nine backticked names the README presents as its own but the file does not declare:
  `beta_one_one`, `beta_subst`, `beta_z`, `subst_eq_of_dense`, `subst_inv`, `subst_mul`,
  `subst_of_one`, `subst_of_zero`, `subst_one` (also `continuous_subst`, `Param.toEnd`,
  `Param.lam`). State the facts in prose without the names.
- The converse rule: 41 of the 57 Lean names never appear in the README (`F2`, `commutatorClosure`,
  `beta`, `eq_of_beta_eq`, `P4`, `P4hat`, `toHat`, `closure_artin`, `IsGT`, `gtMonoid`, `GTHat`,
  `isUnit_iff_bijective_beta`, `IsGT0`, `isGT0_iff`, `chi`, `beta_injective_on_GTHat`, …). Name
  each kept declaration once where its target is stated.
- `chi` is on `GTHat` in Lean, on `GT̂₀` in README 1.3 and 4.1 (and on `GT̂` in the Summary): pick
  one carrier.

## R07 (P3) — README shape and completeness

The README does not follow the house shape: no `## Exact supplier contracts` (the list "What Mathlib
and Tau Ceti already have" is not per supplier and names no cross-roadmap sections), no `## How to
read the build` (an `## Ordering` paragraph instead), targets are bold run-ins (`**0.1 …**`) rather
than `### k.n` headings (the board reads only `### k.n` targets), no `### Examples`/`###
Dependencies` per layer, no `## Downstream consumers`. Definitions with fewer than three Checks:
`subst` (0.1, none), `β_{λ,f}` (1.1, none), `Param` (1.2, none), `P̂₄` (2.3, none), `RelIII` (2.4,
one), the predicates of 3.1 (none), `GT̂₀`/`GT̂^{mon}` (3.2, 3.3, none). Targets without a
`*Needs:*` line: 1.3, 1.4, 2.1–2.4, 3.1–3.5, 4.1–4.5. Locators missing: 0.2 (abelianization,
kernel), 2.2 cites "Birman's book, Lemma 1.8.2" which is not in the References (and is a paywalled
book: cite it `uncertified`, or cite Lochak–Schneps 1994 §2 which states the generators), 4.1. The
relative link `../ProfiniteArithmetic/README.md` (line 43) is dead: that roadmap is under
`Completed/`. Line 84 "Checked at this repository's Tau Ceti pin `358314d4`" is process narrative and
names main's pin; the pull request's `lake-manifest.json` pins Tau Ceti at `a91d3aa`. 3.3's use of
the Hopf property needs `IsTopologicallyFinitelyGenerated F̂₂` (`Profinite/Hopfian.lean` line 87
takes it as a hypothesis); no pinned lemma gives it for `freeProfiniteGroup (Fin 2)` (only
`isTopologicallyFinitelyGenerated_freeProP`/`_freeProC`), so list it in 3.3's `*Needs:*` or as a
Layer 0 target.

## R08 (P3) — the "Roadmap for a roadmap" and "Provenance" sections are deferred content on unrefereed sources

Location: README lines 10–11, 260–335, 380–418.

Seventy lines headed "Do not implement this section", plus a Provenance section, record: equivariant
Picard groups of `[M_{0,n}/𝔖ₙ₋₁]` and `H¹(𝔖₃, O(U_{0,3})^*)` (objects of no layer of this roadmap),
a MathOverflow answer "not refereed", a Lean appendix on an external GitHub repository, "private
communication, October 2026", an "unrefereed OpenAI preprint" (line 71), and page-by-page
descriptions of handwritten folders. The house rules ask for a timeless README with every item in
some layer, nothing "for later", and statements with exact locators into legal, refereed sources.
The mathematics that is this roadmap's (the Galois homomorphism, Ihara's question, Harbater–Schneps,
Hoshi–Minamide–Mochizuki) is a deferral.

Repair: replace both sections by a Scope paragraph: "The homomorphism `Gal(ℚ̄/ℚ) → GT̂` (Ihara
1994; Drinfeld 1990 §4 after (4.14); injective by Belyi 1979), its image (Ihara 1991, Question
3.3.3), `Out♯ₙ ≅ GT̂` for `n ≥ 5` (Harbater–Schneps 2000, Main Theorem) and
`Out(Πₙ) ≅ GT̂ × 𝔖ₙ₊₃` (Hoshi–Minamide–Mochizuki 2022, Corollary 2.8) are left to the successor of
BelyiMaps Layer 12 (`BelyiArithmeticActions`) and to InverseGaloisAndArithmeticFundamentalGroups
§IG.1.2 (tangential base points) and §IG.5.1 (configuration spaces)". Drop the equivariant Picard
material, the MathOverflow, GitHub and private-communication citations, and the OpenAI preprint
sentence. The folder 145 exercise can stay as one sentence of context under 4.3 if a legal locator
(the Montpellier archive URL and page) is given.

## R09 (P3) — attribution and locator precision

- 3.3 (line 209): "Drinfeld 1990, where `GT̂` is the group of invertible elements of the semigroup
  `GT̂^{mon}`". Drinfeld's profinite semigroup (drinfeld90 lines 717–721) has `λ ∈ 1 + 2ẑ` and no
  condition `f ∈ F̂₂'`; the README's `GT̂^{mon}` (`λ ∈ ẑˣ`, `f ∈ F̂₂'`) is a subsemigroup with the
  same group of units (Ihara 1991 §3.3, ihara91 lines 9635–9638; Schneps 1997 §1.1, lines 124–139).
  Say so.
- Conventions (line 109): the product is Ihara/Guillot's; Drinfeld's (4.11) and Lochak–Schneps
  (lines 139–148) use the opposite composition. Note it with the witness
  `(−1,1)·(1,x) = (−1, x⁻¹)` versus `(1,x)·(−1,1) = (−1, x)`.
- Line 322: Edidin–Hu Theorem 1.3 is over an algebraically closed field of characteristic not
  dividing `2g + 2`, for `g ≥ 2` (edidinhu lines 63–64, 86–87); the README drops both.
- `Suggested.lean`: most theorems have no docstring (`subst_x_y` … `param_mul_one`, `closure_artin`,
  `existsUnique_two_mul_eq_sub_one`, `isUnit_iff_bijective_beta`, …); the module docstring should
  say the file states the headline theorems and which are not statable (see R04) rather than
  "suggests Lean forms for particular milestones".

## Verified sound

**Principles.** No route-specific shortcut; no re-planned roadmap (grep of main and the 433 open
roadmap pull requests for `Grothendieck–Teichm`: only BelyiMaps' exclusion line and
PeripheralActions' "which Layer 5 names and this roadmap does not build"; no other roadmap owns
`GT̂`, `β_{λ,f}`, `P̂₄` or the substitution calculus); no copied passages; no algorithm; no sorry'd
data (gate sorry-data=0). `set_option` is R02.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 205 roadmaps, 1417 edges, 0
problem(s)`; no UPWARD or CYCLE line. The merge order lists GrothendieckTeichmuller at line 368,
after InverseGaloisAndArithmeticFundamentalGroups (line 43). Cross-roadmap citations resolved:
InverseGaloisAndArithmeticFundamentalGroups §IG.5.1 (head of #850, `### IG.5.1 Configuration
spaces`, identifies `π₁(Conf_n 𝔻)` with `TauCeti.BraidGroup n` and `π₁(PConf_n)` with
`pureSubgroup`) and §IG.1.2 (`### IG.1.2 Tame quotients and tangential fibres`); BelyiMaps Layer
12 and 12.6 on main (`#### 12.6 The comparison isomorphism`, line 3959) and its named successor
`BelyiArithmeticActions` (main line 76); ProfiniteProPGroups and ProfiniteArithmetic under
`Completed/`; EquivariantIntersectionTheory §3.4 at the head of #1685 states
`Pic [M_{0,n}/𝔖ₙ₋₁] ≅ ℤ/(n − 1)(n − 2)` in characteristic 0 with `T_∞ = O(χ⁻¹)` as in the README.
GeometricTopology `GT4`: R01.

**Pinned declarations opened** (Tau Ceti `a91d3aa`, the pull request's pin; Mathlib at the
manifest): `freeProfiniteGroup`, `of`, `lift`, `lift_of`, `lift_unique`, `hom_ext`, `comp_lift`,
`map`, `existsUnique_continuousMulEquiv` (`Profinite/Free/Basic.lean` lines 60–206); `zpowHat`,
`zpowHat_mul`, `map_zpowHat`, `conj_zpowHat`, `zpowHat_intCast`, `continuous_zpowHat`
(`ZHat/Pow.lean` lines 77–217); `instCommRing` on `Additive zHat` (`ZHat/Ring.lean` 69);
`isUnit_iff_component`, `unitsEquivPiPadicInt` (`ZHat/Units.lean` 51, 79); `ContinuousAut`,
`conj`, `ContinuousOut`, `mk` (`ContinuousAut/Basic.lean` 83, 183, 305, 313); `congruenceTopology`
(`Congruence.lean` 79), `compactSpace` (`Profinite.lean` 209); `BraidGroup`, `sigma`, `lift`,
`permHom`, `permHom_surjective`, `pureSubgroup`, `sigma_sq_mem_pureSubgroup`
(`Braid/Basic.lean` 97–418); `bijective_of_surjective` (`Hopfian.lean` 87, hypothesis
`IsTopologicallyFinitelyGenerated`); `exponentSum : freeProP p X →ₜ* Multiplicative (X → ℤ_[p])`
(`Free/Abelianization.lean` 83: pro-`p` only, as the README says); Mathlib
`ProfiniteGrp.ProfiniteCompletion.completion`, `eta`, `lift`, `denseRange`
(`ProfiniteGrp/Completion.lean` 73–147). Elaborated signatures (scratch `#check @` list, 57
declarations): none lost a binder; `subst` carries the five instance arguments on `P : Type`
(universe 0, as the Conventions say).

**Sources read** (cache ids): guillot14 (arXiv 1309.1968v2), schneps97 (author page), lochakschneps94
(author page), drinfeld90 (mathnet.ru, Russian original), ihara91 (ICM 1990 proceedings,
mathunion.org), harbaterschneps00 (AMS), hmm22 (author page), hmt25 (author page), edidinhu (arXiv
2208.00556v2), collas26 (arXiv 2603.02848v1), herfortribes85 (GDZ, OCR), minamidenakamura22 (arXiv
1904.06749v2).

**Seeded sample.** "In scope": no locators. "Out of scope, with owner": Herfort–Ribes 1985 Theorem B
(herfortribes85 line 39: the centraliser of a nontrivial element of a free factor of a free
profinite product lies in that factor; with `F̂₂ = ⟨x⟩‾ ∐ ⟨y⟩‾` this is the centraliser statement of
0.3/1.4) ✓; Tau Ceti `exponentSum` ✓ (above); BelyiMaps Layer 12 ✓; IG §IG.1.2, §IG.5.1 ✓;
GeometricTopology GT4 ✗ (R01); OpenAI preprint: not a source (R08). "Do not implement this section":
Ihara 1994 not readable (below), but Ihara 1991 §2.3 and §3.3 (ihara91 lines 9564–9641) state the
construction `σ ↦ (χ(σ), f_σ)`, `f_σ = p⁻¹·σ(p)` with `x, y` the loops at `0` and `1`, `GT` as the
automorphisms `x ↦ x^λ, y ↦ f⁻¹y^λf` with (I)–(III), and injectivity by Belyi ✓; Guillot Theorem
5.21 (lines 3017–3020) ✓ including the cyclotomic character; Harbater–Schneps Main Theorem
(harbaterschneps00 lines 76–77): `Out♯₄ ≅ GT̂₀`, `Out♯ₙ ≅ GT̂` for `n ≥ 5`, with `Out♯ₙ` as the
README defines it (lines 13–20, 52–55) ✓; Hoshi–Minamide–Mochizuki Corollary 2.8 (hmm22 lines
1376–1391): `Out^{gF}(Πₙ) ≅ GT^Σ`, `Out(Πₙ) ≅ GT^Σ × S_{n+3}`, `n ≥ 2`, `(g, r) = (0, 3)` ✓, and
Definition 2.7 (lines 1359–1375) with the remark that for `Σ = Primes` it is the classical `GT̂` ✓;
Edidin–Hu Theorem 1.3 (lines 86–87): `A^*([M_{0,2g+2}/S_{2g+1}]) = ℤ[l]/(2g(2g+1) l)`, so
`Pic ≅ ℤ/2g(2g+1) = ℤ/(n−1)(n−2)` at `n = 2g+2` ✓ (hypotheses: R09); Collas §4.3.3 (collas26 lines
874–884): a group `GT_NF` with `G_ℚ ≤ GT_NF ≤ GT̂` "defined using suitable classes of Belyi maps" ✓;
Hoshi–Mochizuki–Tsujimura abstract (hmt25 lines 10–18) ✓; Minamide–Nakamura Theorem A (lines
27–31): `Out(B̂ₙ) ≅ GT̂ × (1 + n(n−1)ẑ)ˣ` for `n ≥ 4` (the README says `Aut(B̂ₙ)`; adjust to `Out`
or cite Theorem B) ✓ as context.

**Conventions against the sources.** (I) `f(y,x) f = 1`: Schneps §1.1 `θ(f) f = 1` ✓, Drinfeld (4.3)
`f(Y,X) = f(X,Y)⁻¹` ✓, Ihara (3.1.1)(I) ✓. (II) `f(z,x) z^m f(y,z) y^m f x^m = 1`, `2m = λ − 1`:
Drinfeld (4.4) with `X₁X₂X₃ = 1` ✓, Ihara (3.1.1)(II) ✓, Harbater–Schneps (II) ✓; Schneps's form
`ω²(f x^m) ω(f x^m) f x^m = 1` expands to the same word since `ω(f x^m) = f(y,z) y^m`,
`ω²(f x^m) = f(z,x) z^m` ✓. (III) `f(x₁₂, x₂₃x₂₄) f(x₁₃x₂₃, x₃₄) = f(x₂₃, x₃₄) f(x₁₂x₁₃, x₂₄x₃₄)
f(x₁₂, x₂₃)` in `K̂₄ = P̂₄`: Drinfeld (4.10) ✓, Lochak–Schneps (III) line 155 ✓. `x_{ij} =
σ_{j−1}⋯σ_{i+1}σ_i²σ_{i+1}⁻¹⋯σ_{j−1}⁻¹`: Drinfeld (4.6), Lochak–Schneps line 200, Schneps line 104 ✓;
the zero-based table `x₁₂ = σ₀²`, `x₁₃ = σ₁σ₀²σ₁⁻¹`, `x₁₄ = σ₂σ₁σ₀²σ₁⁻¹σ₂⁻¹`, `x₂₄ = σ₂σ₁²σ₂⁻¹` is
that formula with indices shifted by one ✓. `θ`, `ω` (Schneps lines 110–111) ✓; `δ(x) = x⁻¹y⁻¹`,
`δ(y) = y` is Guillot's `δₙ(σ) = σ⁻¹α⁻¹`, `δₙ(α) = α` (guillot14 lines 2839–2840) ✓. Guillot's
`GT̂₀` = pairs `(k, f) ∈ ẑˣ × [F̂₂, F̂₂]` with `β` an automorphism commuting with `δ` and `θ` in
`Out(F̂₂)` (lines 2996–3000) = `IsGT0` ✓. Composition `(λ,f)·(μ,g) = (λμ, f·β_{λ,f}(g))`: computed
`β_{λ,f}(β_{μ,g}(y)) = (f β_{λ,f}(g))⁻¹ y^{λμ} (f β_{λ,f}(g))` ✓ and `beta_mul` is in the right
order; `isGT_one`/`IsGT.mul` are Schneps §1.2 (lines 140–206) ✓. `K(0,5) = P₄/Z(P₄)`:
Lochak–Schneps Proposition 2 (iii), (vi) (lines 246, 252) ✓; the presentation for 3.5 is Schneps
lines 105–107.

**Adversarial table** (values computed on each side).

| statement | instances | values | result | change |
|---|---|---|---|---|
| `subst` | `f = 1, x, y, z`; `(a,b)` in any profinite `P` | `1(a,b) = 1`, `x(a,b) = a`, `y(a,b) = b`, `z(a,b) = (ab)⁻¹`; `f(x,y) = f` by `hom_ext` | sound | none |
| `β_{λ,f}` at `(1,1)`, `(0,f)`, `(−1,1)` | `x`, `y`, `z` | `id`; `x ↦ 1, y ↦ f⁻¹f = 1`; `x ↦ x⁻¹, y ↦ y⁻¹`, `z ↦ (x⁻¹y⁻¹)⁻¹ = yx` | sound | none |
| `beta_z` | general | `β(z) = (β(x)β(y))⁻¹ = (x^λ f⁻¹ y^λ f)⁻¹` | sound | none |
| `Param` product, non-commutativity | `(−1,1)`, `(1,x)` | `(−1,1)(1,x) = (−1, x⁻¹)`; `(1,x)(−1,1) = (−1, x)` | sound; Drinfeld's law is the opposite | R09 note |
| `eq_of_beta_eq` without `IsUnit` | `(0,1)`, `(0,[x,y])` | both `β` trivial; `[x,y] ↦ (132) ≠ 1` in `𝔖₃` under `x ↦ (12), y ↦ (23)` | hypothesis needed, present | none |
| `eq_of_beta_eq` without `F̂₂'` | `(λ,f)`, `(λ, y^c f)` | same `β`; `y^c f ∉ F̂₂'` for `c ≠ 0` (abelianise to `(0,c)`) | hypothesis needed, present | none |
| `eq_of_beta_eq` route | `λ` unit | `g f⁻¹ ∈ C(y^λ) = C(⟨y⟩‾) = ⟨y⟩‾` (Herfort–Ribes Thm B), then `∈ F̂₂'` forces exponent `0` | sound | none |
| `x ∉ F̂₂'`; `x^a y^b ∈ F̂₂' ⇔ a = b = 0` | `ℤ/2` quotient `x ↦ 1, y ↦ 0`; `ẑ²` | `x ↦ 1 ≠ 0`; `(a,b) = 0` | sound | none |
| `θ² = 1`, `ω³ = 1`, `δ² = inn(y)` | generators | `ω: x↦y↦z↦x`; `δ²(x) = (x⁻¹y⁻¹)⁻¹y⁻¹ = y x y⁻¹`, `δ²(y) = y` | sound | none |
| `δ` versus `ω`, `θ` | generators | `ωθ(x) = z = y⁻¹x⁻¹`, `y·ωθ(x)·y⁻¹ = x⁻¹y⁻¹ = δ(x)`; `ωθ(y) = y` | `δ ≡ ωθ` in `Out`; `ω` has order 3, `δ` order 2 | R03; source issue below |
| (I) ⇔ `θ`-commuting | `(λ,f)`, `f ∈ F̂₂'` | `θβ(x) = y^λ`, `βθ(x) = f⁻¹y^λf`; `θβ(y) = f(y,x)⁻¹x^λf(y,x)`, `βθ(y) = x^λ`; with `c = f`: equal iff `f(y,x) = f⁻¹` after abelianising `c = y^a f`, `f(y,x)⁻¹ = c x^b` | sound (no bijectivity needed) | none |
| (II) ⇔ `δ`-commuting | — | source states it given (I) | R03 | restate |
| `RelII` at `λ` even | any `f` | no `m` with `2m = λ − 1` (`2`-adic component odd) | predicate false, as intended | none |
| `RelII` at `(1,1)`, `(−1,1)`, `(3,1)` | `𝔖₃`: `x ↦ (12)`, `y ↦ (23)` | `m = 0`: `1`; `m = −1`: `z⁻¹y⁻¹x⁻¹ = (xyz)⁻¹ = 1`; `m = 1`: `z y x = (132)(23)(12) = (123) ≠ 1` | sound; `(3,1)` fails, as Check 4.3 predicts | none |
| Check 4.3 / `eq_neg_one_of_relII_one` | dihedral `D_N`, `x ↦ s`, `y ↦ t`, `st = r` of order `N`, `m` odd | `z^m y^m x^m ↦ r^{−m} t s = r^{−(m+1)}`; `= 1` for all `N` iff `m = −1` iff `λ = −1` | sound | padding (R05) |
| `existsUnique_two_mul_eq_sub_one` | `u = 1`, `u = −1`; uniqueness | `m = 0`; `m = −1`; `2` is a non-zero-divisor in `∏ ℤ_ℓ` | sound | none |
| `RelIII` at `f = 1` | — | both sides `1` | sound | none |
| `x_{ij} ∈ pureSubgroup 4`; Checks 2.1 | `permHom` | squares and conjugates of squares map to `1`; `x₁₂x₃₄ = x₃₄x₁₂` (`σ₀σ₂ = σ₂σ₀`); `x₁₂x₂₃ ≠ x₂₃x₁₂` (`P₃ ≅ F₂ × ℤ`) | sound | none |
| `closure_artin` | `n = 4` | Artin's generation (Lochak–Schneps §2; Birman Lemma 1.8.2 unread) | sound, owner missing | R01 |
| `isUnit_iff_bijective_beta` | `p ∈ GT̂^{mon}` | `→`: `β_pβ_q = id = β_qβ_p`; `←`: inverse pair `(λ⁻¹, β_p⁻¹(f)⁻¹)` has `β_p⁻¹(y) = g⁻¹y^{λ⁻¹}g` since `a^λ = b^λ ⇒ a = b` for `λ` a unit, lies in `F̂₂'`, and satisfies (I)–(III) by Schneps Lemma 2 | sound | none |
| `isGT0_iff` | conjunction | Guillot lines 2996–3011 and Schneps §1.2 Theorem (i), (ii) | sound as a conjunction | R03 (prose) |
| `beta_injective_on_GTHat` | `g, h` units | `λ_g = λ_h` from `x^{λ_g} = x^{λ_h}` (`⟨x⟩‾ ≅ ẑ`), then `eq_of_beta_eq` | sound | none |
| `chi` | `c`, `1`, product | `χ(c) = −1`, `χ(1) = 1`, `χ(pq) = λμ` by `rfl` on `lamHom` | sound | carrier note R06 |
| 4.4 action formula | `φ ∘ β_p⁻¹` | `(φ ∘ β_p⁻¹)(x) = φ(x^{λ⁻¹}) = a^{λ⁻¹}` | sound (exact, not only up to conjugacy) | none |
| `K(0,5) = P₄/Z(P₄)` | — | Lochak–Schneps Prop. 2 (iii) | sound | none |
| 3.5 five-term ⇔ (III) | — | Ihara 1991 Remark after (3.1.1) (lines 9586–9587) | sound as cited | docstring (R04) |
| Edidin–Hu / EIT at `n = 4, 5, 6` | — | `ℤ/6`, `ℤ/12`, `ℤ/20`; `H¹(𝔖₃, O^*) = ℤ/6` agrees at `n = 4` | consistent | hypotheses R09; section R08 |

**One-tactic probe:** run twice on scratch copies (`Probe.lean`, `Probe2.lean`, each elaborated
with `lake env lean` from the worktree, exit 0); closures listed in R05; everything else did not
close (`beta_mul`, `beta_one`, the monoid laws, `isGT_one`, `complexConj_mul_self`,
`x_not_mem_commutatorClosure`, `eq_of_beta_eq`, `closure_artin`, `existsUnique_…`,
`isUnit_iff_bijective_beta`, `isGT0_iff`, `beta_injective_on_GTHat`, `isGT_complexConj`,
`eq_neg_one_of_relII_one`).

**Ownership against open pull requests:** checked by object with `roadmaps grep` over the 433 open
roadmap pull requests and main (`Grothendieck–Teichm`, pure braid generators, free-profinite
abelianisation): no second owner. The PeripheralActions roadmap (Completed) names the
Grothendieck–Teichmüller relations and explicitly does not build them.

## Not verifiable

- Ihara 1994, "On the embedding of Gal(ℚ̄/ℚ) into GT̂", LMS LNS 200: Cambridge University Press,
  paywalled; no author-page copy. Cited for the homomorphism and injectivity, which Ihara 1991 §3.3
  and Drinfeld 1990 §4 (line 774) also state.
- Lochak–Schneps 1994 was read (author page); Schneps 1997 was read (author page).
- Birman, *Braids, Links and Mapping Class Groups*, Lemma 1.8.2: Princeton UP book, paywalled, not
  in the References. The generator formula and generation are confirmed from Lochak–Schneps §2 and
  Drinfeld (4.6).
- Hatcher–Lochak–Schneps 2000 (Crelle, De Gruyter): paywalled; cited for context only.
- Belyi 1979 (Izvestiya), Grothendieck's *Esquisse*, Edidin–Graham 1998: not fetched; cited for
  context only.
- Montpellier fonds folders 119, 140-1, 142, 144, 145, 146, 147 and the "transcription project"
  Lean appendix: handwritten scans and a GitHub repository; not roadmap sources (R08). Not read.
- The OpenAI preprint on the Deligne–Drinfeld conjecture: unrefereed; not a source (R08). Not read.
- MathOverflow answer 516350: not refereed; not read as a source (R08).

## Source issues

- **Error** in guillot14 at Lemma 5.19, proof, printed p. 57: the proof says Schneps's `ω` is an
  inverse of `δ` in `Out(F̂₂)`; `ω` has order 3 and `δ` order 2 in `Out(F̂₂)`, and `δ = ωθ` modulo
  inner automorphisms; the conclusion (the two definitions of `GT̂₀` agree) holds because Schneps's
  theorem (ii) is stated for pairs already satisfying (I); affects the proof.
- none in schneps97, lochakschneps94, drinfeld90, ihara91, harbaterschneps00, hmm22, edidinhu,
  collas26, herfortribes85, minamidenakamura22 at the locators checked.
