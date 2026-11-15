# FIX-RT-DimerModelsAndLozengeTilings~1

Repair of the six findings of the two red-team passes `RT-DimerModelsAndLozengeTilings~1a` and
`~1b`. The two F01 and the two F02 findings overlap and are settled once each. Files changed:
`packages/DimerModelsAndLozengeTilings/README.md`, `Suggested.lean` and `sources.toml` (one
locator added to `sheffield2005`). `metadata.toml` and `design/plan.json` are unchanged: no
supplier gap is needed.

## RT-DimerModelsAndLozengeTilings~1a/F01, RT-DimerModelsAndLozengeTilings~1b/F01 (P2) — applied

Right: README 5.2 gives `γ^w`'s Gibbs property as cylinder identities, so 5.3 is statable. Old:
the "Not stated separately" docstring paragraph and the sentence at README lines 32–34. New:
`IsDimerConfiguration`, `IsDimerGibbs`, `dimerGibbsInvariant_isExtreme` (Layer 5) on
`G.edgeSet → Bool`, with the action `τ : Γ →* (G ≃g G)`; the paragraph and the sentence are deleted.

Details. I followed the carrier of review b, which is README 5.1's `𝔛(G) ⊆ (G.edgeSet → Bool)`,
rather than review a's `Sym2 V → Bool`. Review a's hypothesis `hwΓ` (an invariant weight) is not
included: the face property holds for every positive `w`, which is the same pattern as F02. The
proof: a tail-measurable density `f` satisfies `f ∘ T = f` for the finite swap `T` between
`[ω]_E` and `[ω']_E`. I renamed the action from review b's `ρ` to `τ`, because the README already
uses `ρ` for the rotation and `τ` for translations; 5.4 then reads `τ` as the translations of
`hexGraph`.

README changes:
- 5.1 names `IsDimerConfiguration G ω`.
- 5.2 defines `IsDimerGibbs G w μ` and adds two Checks: the direction of the weights on a
  weighted `C₆`, and the null clause on `ℤ`.
- 5.3 states the Lean theorem, with its route (4.6(b) on `𝔛(G)`, Tau Ceti
  `isExtreme_setOf_measure_eq_zero`, `IsExtreme.trans`). It adds the Check that `Γ` must be
  infinite (trivial group on `C₆`).
- 5.4's route now applies `dimerGibbsInvariant_isExtreme` to `hexGraph` and transports it along
  the 1.2 bijection.
- Layer 5 Dependencies are updated.
- Supplier contracts: `SimpleGraph.edgeSet`, the group `G ≃g G` (`Mathlib/Algebra/Order/Group/End.lean`
  line 73) and `SimpleGraph.Iso.mapEdgeSet` (`Mathlib/Combinatorics/SimpleGraph/Maps.lean` line 669).

Ownership: `roadmaps grep` for `IsDimerGibbs|IsDimerConfiguration|dimerGibbsInvariant` and `-i
dimer` over main and the open heads finds no match. The board's packages mention dimers only in
this package. This roadmap already owns "perfect-matching configuration spaces of locally finite
countable graphs …, the weighted dimer specification, its cylinder-identity form" (Scope and
ownership), so it is the owner.

## RT-DimerModelsAndLozengeTilings~1a/F02, RT-DimerModelsAndLozengeTilings~1b/F02 (P3) — applied

Right: 4.6(b)'s route never uses equivariance (the densities are a.s. invariant because the
measures are, a.s. tail by 4.2, and (a) uses properness only). Old: `hγ` and `[DecidableEq I]` on
both Layer 4 theorems, and `def Specification.IsEquivariant`. New: all three deleted; the
docstrings say "any specification …, equivariant or not".

Details. README changes:
- 4.5 keeps equivariance as prose, without the Lean name, and defines `𝒢_inv(γ)` for every `γ`.
- 4.6(b) reads "For every specification `γ`, equivariant or not". It adds a sentence that no step
  uses equivariance, noting that sheffield2005 works with translation-invariant potentials (line
  354). That locator is added to the `sheffield2005` manifest entry.
- Two new Checks in 4.6: the Bernoulli midpoint `f·μ`, `(2 − f)·μ` as a negative control showing
  that invariance of the two measures is used; and a non-equivariant independent specification
  with `𝒢_inv = ∅`.
- Pattern: 5.3's "For `Γ`-invariant `w`" now covers every positive `w`. Invariance of `w` is
  needed only for `Γ`-invariance of `𝒢`.

## RT-DimerModelsAndLozengeTilings~1a/F03 (P3) — applied

Right: `w(s,t)` was defined only inside 9.5's route, yet 9.6 and 9.7 use it without listing 9.5.
Old: the definition in 9.5's route. New: a Conventions sentence defines the sine weights on `𝒯`
(positive, liquid, `θ_k = πs, πt, π(1−s−t)`), with witnesses; 9.5, 9.6 and 9.7 cite it.

Details. The sentence presents the weights as `sin π(1−s−t)` times the sides `|1−ξ|`, `|ξ|`, `1`
of the triangle `0, 1, ξ`. Witnesses: `(√3/2)³` at `(1/3,1/3)`, and `(0.8090, 0.9877, 0.7071)` at
`(0.3,0.45)`. In 9.5's third Check, "`w(s,t)`" at an edge slope becomes "the sine formula", since
the convention defines the weights on `𝒯` only.

## RT-DimerModelsAndLozengeTilings~1b/F03 (P3) — applied

Right: on `R = {W(0), W(−e₁)}` the free tiling `{(0,3),(0,2)}` has two lozenges sharing
`B(0) ∉ R`. Old: Aggarwal cited for free tilings of every region. New: a Conventions sentence (an
overlap is possible in general; on `Faces(V)` the notions agree), the review's Check in 1.4, and
the 1.4 and 2.6 locators scoped to `Faces(V)`.

Details. A brute force over this `R` finds 9 free tilings, matching 9 height functions, and this
`M` is the only one with an overlap. The README's notion is still the right one for 2.6, which holds for it. Only the citation of
Aggarwal needed scoping. For `R = Faces(V)` an outside face has a vertex outside `V`, so at most one
edge in `E(R)`, and the lozenges are disjoint. A brute force over 176,224 free tilings of random
`Faces(V)` regions found no overlap.

The new 1.4 Check also gives the height function: `0` at `0, e₁, e₃, −e₁` and `1` at `e₂`.
Pattern: the 2.6 locator `aggarwal2023 lines 380–401` is the other place that cites Aggarwal for
free tilings, and it is scoped the same way.

## Checks run

- **Elaboration.** `lake env lean packages/DimerModelsAndLozengeTilings/Suggested.lean` from the
  content repository exits 0. It gives 18 warnings, each "declaration uses `sorry`", at lines 113,
  166, 182, 196, 232, 243, 322, 334, 372, 403, 415, 437, 450, 481, 518, 531, 551 and 581, and no
  other message. That is the 17 earlier theorems plus `dimerGibbsInvariant_isExtreme`.
- **Signatures.** I made a scratch copy of `Suggested.lean` with `#check @name` appended for all 59
  named declarations (18 `theorem`, 36 `def`, 1 `abbrev`, 4 `structure`; there are also 4
  instances) and elaborated it once: no error. I compared each elaborated type with its README
  statement:
  - `gibbsInvariant_isExtreme` and `gibbsInvariant_extreme_iff_ergodic` now carry exactly the
    standing hypotheses that README 4.6 lists. Those are `Group`, `Countable` and `Infinite` on
    `Γ`; `MulAction Γ I` and `Countable I`; `Finite S`, `DiscreteTopology S` and
    `DiscreteMeasurableSpace S`; and properness. `DecidableEq I` and `hγ` are gone.
  - `dimerGibbsInvariant_isExtreme` elaborates with `[Countable V]`, `Γ` countable and infinite,
    `[G.LocallyFinite]`, `τ : Γ →* G ≃g G`, properness through `(τ g).mapEdgeSet`, and `0 < w e`.
    That is README 5.3's list.
  - No other signature changed. Every binder is in the declaration's own signature, and the file
    has no `variable` line.
- **Names.** Every Lean name occurs in the README, and `Specification.IsEquivariant` occurs in
  neither file. `roadmaps resolve README.md` reports "Cross-roadmap citations found nowhere: None.
  Lean names found nowhere: None."
- **Dependency check** (the brief's command, unchanged): `depcheck: 239 roadmaps, 2254 edges, 0
  problem(s)`. There is no UPWARD, CYCLE or `moved:` line.
- **Imports and form.** `import Mathlib` and `TauCeti.MeasureTheory.Group.ErgodicExtreme`, as
  before. There is no `set_option`, no `lemma` and no sorried data. The three new declarations
  have docstrings with locators.

## Adversarial pass on the new and changed statements

| Statement | Instances tried | Values on each side | Result / change |
| --- | --- | --- | --- |
| `IsDimerConfiguration` | path `ℤ`; `C₆`; `V = ∅`; vertices without edges | even and odd edge sets only (vertex `0` matched to `±1` forces the rest); `M_a`, `M_b`; the empty configuration (vacuous); none | sound |
| `IsDimerGibbs`, direction of weights | `C₆`, `w(e₀) = 2`, `F = E` = all edges, `ω = M_a`, `ω' = M_b` | `1·μ{M_a} = 2·μ{M_b}` gives `μ{M_a} = 2/3 = w(M_a)/(w(M_a)+w(M_b))`; the reversed reading gives `1/3` | correct direction; added as Check |
| `IsDimerGibbs`, null clause | `ℤ`, `δ` of the empty configuration | mass `1`; identities trivial since matchings agreeing off finite `F` are equal; `δ{¬dimer} = 1 ≠ 0` | excluded by the null clause only; Check added |
| `IsDimerGibbs`, neighbourhood condition on `E` | swap `T` on `[ω]_E` | for `η ∈ 𝔛 ∩ [ω]_E`, `Tη` agrees with `ω'` at each endpoint of `F` and with `η` elsewhere, so `Tη ∈ 𝔛`; identities for all `E ⊇ ∂F` imply those for all `E ⊇ F` by summing over refinements | definition equivalent to DLR under local finiteness |
| `IsDimerGibbs hexGraph 1` vs `IsLozengeGibbs` | edge `e` ↔ pair of faces | hexGraph edges meeting the pair are the edges of the two faces of `e`; `ofReal 1 = 1` | the two agree (5.4 route) |
| `dimerGibbsInvariant_isExtreme` | `ℤ`, `Γ = 2ℤ`; `ℤ`, `Γ = ℤ`; `V = ∅`; edgeless `V ≠ ∅`; `⊔_ℤ C₆` with shift; `C₆`, trivial `Γ` | segment `[δ_even, δ_odd]`, a face; `{(δ_e+δ_o)/2}`, extreme; `{δ} ⊆ {δ}`; Gibbs set `∅`; the product of uniforms, Bernoulli hence extreme; `(δ_a+δ_b)/2` is the midpoint of non-Gibbs `δ_a`, `δ_b`, so it fails | true; `Infinite Γ` needed (Check added) |
| same, non-invariant `w` | tail density `f`, swap `T` | `w(ω'∩F)∫_{[ω]_E} f dμ = w(ω∩F)∫_{[ω']_E} f∘T⁻¹ dμ` and `f∘T⁻¹ = f` | invariance of `w` not used; not assumed |
| same, left action | `(g•(h•ω))(e) = ω(τ(h⁻¹)τ(g⁻¹)e)` | `= ω(τ((gh)⁻¹)e)`, since `(f*g)x = f(g x)` in `RelIso` | left action |
| `gibbsInvariant_isExtreme` without `hγ` | independent kernels `δ₁` at `0`, `Bern(1/2)` elsewhere; `p_even = 1/3`, `p_odd = 2/3`; `X = ∅`; `I = ∅`; `X₀` | `μ{ω(0)=1} = 1 ≠ 1/2 = μ{ω(1)=1}`, so `𝒢_inv = ∅`; `𝒢_inv = ∅`; `∅ ⊆ ∅`; `{δ}`; segment | true; non-equivariant Check added |
| `gibbsInvariant_extreme_iff_ergodic` without `hγ` | `X₀` midpoint and endpoints | midpoint: `{1̄}` has mass `1/2`, neither ergodic nor extreme; endpoints both | true |
| 4.6 midpoint Check | `μ = Bern(1/2)^{⊗ℤ}`, `f = 2·1_{ω(0)=1}` | `½fμ + ½(2−f)μ = μ`; `fμ{ω(0)=1} = 1` against `fμ{ω(1)=1} = 1/2` | summands not invariant, not Gibbs |
| Sine weights (Conventions) | `(1/3,1/3)`; `(0.3,0.45)`; `(1/2,0)` | `(0.8660)³`, `|ξ| = 1`; `(0.8090, 0.9877, 0.7071)`, `w₂/w₃ = 1.3968 = |ξ|`, `w₁/w₃ = 1.1441 = |1−ξ|` (computed from `ξ`), liquid; `(1, 0, 1)` | sound; edge slopes excluded from the convention |
| Free tilings vs Aggarwal (Conventions, 1.4) | wedge `{W(0), W(−e₁)}`; random `Faces(V)` | 9 free tilings, 9 height functions, one overlap `{(0,2),(0,3)}` in `B(0)`; 176,224 free tilings, 0 overlaps | as stated |
| 1.4 new Check, heights | `M = {(0,3),(0,2)}`, `H(0) = 0` | `H(e₁) = 0` (`(0,1) ∉ M`), `H(e₃) = 0`, `H(−e₁) = 0` (`((−1,0),1) ∉ M`), `H(e₂) = 1` (`(0,2) ∈ M`), `H(e₂) − H(−e₁) = 1` (`((−1,0),3) ∉ M`) | consistent |
| 5.3 closedness, ergodicity with non-invariant `w` | quasilocality of `γ^w` (5.2) does not use invariance | — | statement extended to every positive `w`; `Γ`-invariance of `𝒢` kept for invariant `w` |

## For the maintainer

- `Specification.IsEquivariant` was deleted from `Suggested.lean`, and the README now names the
  notion only in prose. `roadmaps grep` finds no other roadmap on main or at an open head citing
  `DimerModelsAndLozengeTilings`, so no other roadmap is affected.
- There are three new Lean names: `IsDimerConfiguration`, `IsDimerGibbs` and
  `dimerGibbsInvariant_isExtreme`.
- `gibbsInvariant_isExtreme` and `gibbsInvariant_extreme_iff_ergodic` lost two binders
  (`[DecidableEq I]`, `hγ`), so they are strictly more general.
- No source was missing, and `needs-references.toml` was not written.
- The `## For the human reviewers` items of both reviews (the licence of gorin2021, the shape of
  `Specification` compared with the GibbsMeasure project, the scope of the corrections to sources)
  were not acted on, as instructed.
