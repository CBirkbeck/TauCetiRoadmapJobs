# Repair of SurfaceGroupCharacterVarieties (design, round 7)

Review settled: the comments of `REV-DESIGN-SurfaceGroupCharacterVarieties~6` (four findings: F01 and
F02 at P2, F03 and F04 at P3). I checked each one against the texts the roadmap tool serves now:
MappingClassGroupsAndCanonicalRepresentations, LanglandsParameterStacks, MordellLawrenceVenkatesh
and ArithmeticGaloisRepresentations at the heads of their open pull requests. I also checked the
pinned Tau Ceti and the cached Sikora2012 text. All four findings hold, and all four are applied.
F02 also fixes a Check whose citation did not say what the Check claimed (details below).

Files edited:
- `packages/SurfaceGroupCharacterVarieties/design/README.md`
- `packages/SurfaceGroupCharacterVarieties/design/plan.json`
- `packages/SurfaceGroupCharacterVarieties/sources.toml` (only `cited_for` of `Goldman1984`)

## F01 (P2) — applied

Old: §2.3 owned `σ`, its surjectivity and `PMod` of index `n!`; §2.4 the presentation; §2.5 pure
Birman.
New: §2.3 identifies MappingClassGroupsAndCanonicalRepresentations §0.2's permutation action with
`[h] ↦ h̄|_P` and cites §0.2 for surjectivity and index. §0.1 and §0.3 are cited; §2.5 is deleted,
§2.6 becomes §2.5, and the consumer bullet is gone.

## F02 (P2) — applied

Old: §7.2 defined `Hom(Γ, G)//G` only in characteristic zero, with fibres restricted from
`G^S//G`.
New: the quotient is defined over any field and LanglandsParameterStacks §2.2 is cited for finite
type, images, separation and the unique closed orbit. The characteristic-zero closed immersion into
`G^S//G` stays here. There is a new `𝔾_m`/`𝔽₂` Check and a corrected negative control.

## F03 (P3) — applied

Old: "For an oriented surface, … index at most two in `Mod^±(X)`".
New: "For a connected oriented surface `X`, …". New §2.1 Check: `S² ⊔ S²` gives
`|Mod^±| = 2·2·2 = 8` with two orientation-preserving classes, index `4`; for `S²` the index is
`2`. Mirrored in `plan.json` target 2.1.

## F04 (P3) — applied

Old: Goldman1984 appeared only in References.
New: §7.1 cites it after the definition of `𝒳(Γ, G^ℝ)`: "(Goldman1984, §1, for the topology of
`Hom(π, G)/G` for a surface group `π`)". The manifest entry stays `uncertified`. Its `cited_for` now
reads "7.1: background for the topology of Hom(π, G)/G for a surface group π; no proof step rests
on it".

## Details of the repairs

### F01: verification

- MappingClassGroupsAndCanonicalRepresentations, at the head of its open pull request, owns these
  in its Scope: the identification of the presented surface group with `π₁(Σ_{g,b,p})`, the
  algebraic pure mapping class group, and the pure Birman sequence.
  - §0.1 proves the presentation `surfaceGroup g (b + p) ≃* π₁(Σ_{g,b,p}, x)`, with peripheral loops
    around the punctures and boundary circles, and freeness of rank `2g + b + p − 1` for `b + p ≥ 1`.
  - §0.2 defines `PMod(g, b, p)` as the kernel of the permutation action on the punctures, of index
    `p!`, every permutation being realized.
  - §0.3 proves `1 → π₁(Σ_{g,b,p}, x) → PMod(g, b, p + 1) → PMod(g, b, p) → 1` for
    `χ(Σ_{g,b,p}) < 0`.
  - With `b = 0`, each of these contains this design's statement. `Σ_{g,0,n}` is
    MordellLawrenceVenkatesh §5.1's `Σ_g ∖ P`, the carrier of our `Σ_{g,n}`.
- That roadmap does not name this one (grep of its README: 0 hits). It is merge-order line 292, in
  the list of permitted suppliers, so citing it creates no cycle.
- No roadmap on main or in any open pull request cites SurfaceGroupCharacterVarieties
  (`roadmaps grep`: no match). Renumbering therefore breaks no citation.

### F01: what changed

- **Summary, "How to read the build", Scope (owns).** These now name what Layer 2 still owns: the
  group of ambient isotopy classes, punctures versus marked points, the permutation homomorphism
  `σ` and its identification with §0.2's permutation action, the standard model, and changes of
  model. `PMod`, the presentation and the pure Birman sequence are gone from "owns".
- **Scope (leaves to named owners).** New bullet: MappingClassGroupsAndCanonicalRepresentations
  §§0.1–0.3, used with `b = 0`. "Van Kampen and the wedge of circles: AlgebraicTopology Stage 1" is
  deleted, since only the deleted presentation proof used it.
- **Scope: kept-variant clauses** (one sentence each), as the review asked:
  - §0.2's outer action of `PMod(g, 0, n)` is the restriction of `Ψ_x` (§3.3).
  - §2.1's MCG-finiteness is finiteness of an orbit of §3.5's action for `H = GL_r(ℂ)`.
  - §1.4's `R_r(Γ)` and `M_r(Γ)` are the case `G = GL_r`, `k = ℂ` of §§4.1 and 7.2.
- **Conventions.**
  - "Commutators" now says that §0.1's `surfaceGroup g n` is `S⁺(g, n)` transported along
    `aᵢ ↦ aᵢ⁻¹`, `bᵢ ↦ bᵢ⁻¹`, `p_j ↦ c_j`. Witness: `a⁻¹b⁻¹ab p₁ ↦ aba⁻¹b⁻¹ c₁`, recomputed.
  - "Surfaces" now defines `PMod_{g,n}` as §0.2's `PMod(g, 0, n)`, identified by §2.3 with `ker σ`.
- **Supplier contracts.**
  - New subsection *From TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations* (§§0.1, 0.2,
    0.3). It states what is assumed: §0.2's permutation action is the action on the punctures,
    whether read on ends or on `P`, and §§2.2–2.3 show that the two readings agree.
  - MordellLawrenceVenkatesh §5.23 is dropped from the contract and from `plan.json`: only the
    deleted presentation sketch used it.
  - AlgebraicTopology Stage 1 items 4–5 are dropped for the same reason.
- **§2.3, "The permutation of the punctures".**
  - It proves that `[h] ↦ h̄|_P` is a well-defined homomorphism: `h̄` preserves `P`, extension is
    multiplicative by uniqueness, and extended isotopies fix `P` pointwise.
  - It proves that `σ` is §0.2's permutation action: `h(U ∖ {p}) = h̄(U) ∖ {h̄(p)}`, so ends go to ends.
  - Surjectivity and the index `n!` are cited from §0.2.
  - The three Checks are kept, restated as Checks of the comparison. For `(0, 2)`, `σ` of the
    end-swapping class is the transposition of `{N, S}`.
- **§2.4.** The heading is now "The standard model of a closed surface", and the standard-model
  target is unchanged. The presentation target, its sketch, Checks and Needs are replaced by one
  paragraph citing §0.1 with `b = 0`, with the convention sentence.
- **§2.5 (pure Birman).** Deleted. Layer 2 Examples now cite MappingClassGroupsAndCanonicalRepresentations
  §0.3 for `PMod_{0,4} ≅ F₂`. Old §2.6 "Changes of model" is now §2.5.
- **§3.5 and §4.3.**
  - §3.5: the `PMod` index now cites §0.2 and §2.3, and §0.2 is added to its *Needs*.
  - §4.3 now goes through §0.1 and the inversion (Conventions), not §2.4. Its *Needs* swap §2.4 for
    §0.1, so Layer 4 no longer depends on Layer 2. That makes the existing sentence "Layers 1–3 and
    Layers 4–6 are independent" literally true.
- **Dependencies.**
  - Layer 2: MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3 added; MordellLawrenceVenkatesh
    §§5.19, 5.20, 5.23, AlgebraicTopology Stage 1 and TeichmullerGeometry §4.3 dropped (no Layer 2
    target uses them now); "supplies Layers 3 and 7".
  - Layer 3: §0.2 added.
  - Layer 4: §0.1 and FreeGroupsAndLimitGroups §§6.1–6.2 replace "Layer 2 §2.4".
- **Downstream consumers.** The MappingClassGroupsAndCanonicalRepresentations bullet is deleted.
- **`plan.json`.**
  - Summary updated.
  - Target 2.3 restated, renamed from `MappingClass.permutation_surjective` to
    `MappingClass.puncturePermutation`, prerequisites and tests updated.
  - Target 2.4 (presentation) and target 2.5 (pure Birman) deleted.
  - Ids renumbered: 2.4a → 2.4 and 2.6 → 2.5. Prerequisites of 3.4 (`target:2.4`), 4.3
    (`roadmap:… §0.1`) and 3.5 (`roadmap:… §0.2`) updated. Both textual "2.4a" mentions in 3.4's
    statement are fixed.
  - Supplier MappingClassGroupsAndCanonicalRepresentations added with §§0.1–0.3.
  - Consumer entry deleted.

The review's other settlement, keeping this roadmap as owner and restating §§2.3–2.5 for type
`(g, b, p)`, would need an edit to MappingClassGroupsAndCanonicalRepresentations, so it is not taken.

### F02: verification

- LanglandsParameterStacks §2.2 (merge-order line 80, a permitted supplier) extends three things
  "to arbitrary affine schemes of finite type over a field …, allowing reducible and nonreduced
  schemes":
  - finite generation of the invariants;
  - closed images and separation of invariant closed subsets;
  - the unique closed orbit in every geometric fibre.
- Its contract also lists universal submersiveness.
- `Hom(Γ, G)` is such a scheme over every field (§4.1). The old §7.2 excluded §4.1's own Check
  `Γ = ℤ/2`, `G = 𝔾_m` over `𝔽₂`.

### F02: what changed

- **§7.2 restated.**
  - `Hom(Γ, G)//G := Spec O(Hom(Γ, G))^G` for a connected reductive `G` over any field `k` and a
    finitely generated `Γ`. Finite type, images, separation and the unique closed orbit are cited
    from LanglandsParameterStacks §2.2.
  - Kept as targets here, with routes in the sketch:
    - the affine universal property, by the Spec–global-sections adjunction;
    - surjectivity on `k`-points over algebraically closed `k`, by closed and dense image plus the
      Nullstellensatz;
    - `k`-points ↔ closed orbits;
    - "same image ⇔ orbit closures meet", which also uses ReductiveGroups Layer 3A (every orbit
      closure contains a closed orbit), added to *Needs* and to `plan.json`;
    - the characteristic-zero surjectivity `O(G^S)^G → O(Hom(Γ, G))^G`, hence a closed immersion
      into `G^S//G`;
    - the complex comparison, unchanged in substance.
  - The sketch now says where the closed-immersion clause enters the complex comparison: the
    quotient map of `Hom` is the restriction of that of `V`.
- **Checks.** The `GL_n` and `F₂`/`SL₂` Checks are kept. There are two new or corrected Checks:
  - **New:** `ℤ/2`, `𝔾_m`, `𝔽₂`: `Hom = Spec 𝔽₂[t]/((t − 1)²) = Hom//G`. It is covered by
    LanglandsParameterStacks §2.2 and not by the integral case of ArithmeticGaloisRepresentations
    §1.11. Also `𝔽₂[t^{±1}] → 𝔽₂[t]/((t − 1)²)` is surjective, since `𝔾_m` is linearly reductive.
  - **Corrected negative control.** The old Check said "characteristic zero is needed … as in
    ArithmeticGaloisRepresentations §1.11's `C₂` Check". That Check (AGR head, line 1493) is about
    non-flat base change `ℤ₂ → 𝔽₂` of invariants, not about restricting invariants to a closed
    invariant subscheme. So the citation did not support the claim.
    - The new Check computes the phenomenon directly. For `C₂` over `𝔽₂` swapping the coordinates
      of `𝔸²`, `𝔽₂[x + y, xy]` restricts on the invariant line `{x = y}` to `𝔽₂[2x, x²] = 𝔽₂[x²]`.
      Meanwhile `O(Y)^{C₂} = 𝔽₂[x]`. Over `ℚ`, averaging gives invariant lifts.
    - It is phrased as a Check of the input the route uses (linear reductivity), not as a
      counterexample for connected reductive `G`. I know no such counterexample of the form
      `Hom(Γ, G) ⊂ G^S`, and the clause holds for tori in every characteristic (previous Check).
- **Scope.**
  - "Owns" now reads "the affine quotient … by a connected reductive group over any field, its
    closed immersion into `G^S//G` over fields of characteristic zero and its complex comparison".
  - "Leaves" has a new LanglandsParameterStacks §2.2 bullet.
- **Contract, Needs, Dependencies.** New contract subsection *From TauCetiRoadmap.LanglandsParameterStacks*
  (§2.2). LanglandsParameterStacks §2.2 is added to §7.2's *Needs* and to Layer 7's Dependencies.
- **`plan.json` target 7.2.** Statement, hypotheses (field `k`; characteristic zero only for the
  closed immersion; `ℂ` for the comparison), prerequisites (LanglandsParameterStacks §2.2,
  ReductiveGroups Layer 3A) and tests are updated. Supplier LanglandsParameterStacks §2.2 is added.

### F03 and F04

The same pattern was searched across the roadmap:

- **F03.** Every other "index two" use concerns the connected `Σ_g`: §3.4's proof, §3.4's torus
  Check, and §2.2's orientation clause. No other occurrence lacks connectedness.
- **F04.** Every other reference key occurs in a layer: LandesmanLitt2024 7 times, BCGGO2024 12,
  Sikora2012 11, BateMartinRohrle2005 7, BohmLafuente2021 7, Richardson1988 1,
  RichardsonSlodowy1990 4, FarbMargalit2012 11, Knapp2002 2, Goldman1984 now 1.

## Checks

Dependency check, on the final README:

```text
candidate: SurfaceGroupCharacterVarieties is not in the merge order yet; checked as if placed after MappingClassGroupsAndCanonicalRepresentations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2238 edges, 0 problem(s)
```

- No UPWARD or CYCLE line. The placement moved from "after TeichmullerGeometry" to "after
  MappingClassGroupsAndCanonicalRepresentations" (line 292), because that roadmap is now a supplier.
- `roadmaps resolve` on the final README: no cross-roadmap citation and no Lean name found nowhere.
- `plan.json` parses as JSON and `sources.toml` as TOML.
- House-style greps found nothing: no LaTeX delimiters, pull-request numbers, round labels,
  "optional/deferred/removed" or machine paths.

## Suggested.lean

There is no `Suggested.lean` at the design stage, and none was written. The `#check` comparison
does not apply. No README name was introduced that claims a `Suggested.lean` declaration: the new
backticked names are supplier names (`surfaceGroup`, `PMod`) or Tau Ceti declarations already in the
contract. I checked `TauCeti.Comodule.Hom.fixedMap_surjective_of_isLinearlyReductive` at the pin
(`Algebra/Coalgebra/Comodule/LinearlyReductive/Fixed.lean:184`: field `k`, coalgebra `C`,
`IsLinearlyReductive k C`, surjective `f`, conclusion `Function.Surjective f.fixedMap`), and it
matches §7.2's use.

## Ownership

- **Pure group, presentation, pure Birman.** MappingClassGroupsAndCanonicalRepresentations §§0.1–0.3
  is now the owner, and this roadmap cites it.
- **Kept here as more general variants** (Scope clauses):
  - `Ψ_x` on `Mod^±(X)` for any path-connected `X`;
  - §3.5's action for every group `H`;
  - §4.1 for every affine group scheme over a commutative ring;
  - §7.2 for every connected reductive `G` over a field.
- **Reductive quotients of nonintegral schemes.** LanglandsParameterStacks §2.2 is the owner, and
  this roadmap cites it.
- **The characteristic-zero closed immersion `Hom//G → G^S//G`.** It has no other owner: greps of
  LanglandsParameterStacks, ArithmeticGaloisRepresentations and MappingClassGroupsAndCanonicalRepresentations
  for invariant surjectivity onto closed invariant subschemes and for linear reductivity find
  nothing. It stays here.
- Ownership against the other open pull requests was not re-checked beyond the objects these
  findings touch.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §2.1 index bullet | `S²`; `S² ⊔ S²`; `T²` | `|Mod^±(S²)| = 2`, index `2/1`; `|Mod^±| = 2·2·2 = 8`, o.p. classes `{id, swap}`, index `4`; `GL₂(ℤ)/SL₂(ℤ)` index `2` | false without "connected" | hypothesis + Check |
| §2.3 `σ` well defined | `n = 0`; `(0,2)`; `(0,3)` | `Sym(∅) = 1`, `σ` trivial, index `1 = 0!`; end swap `(θ,s) ↦ (−θ,−s)` ↦ rotation by `π`, `σ = (N S)`, index `2 = 2!`; `Mod_{0,3} ≅ S₃ → Sym(P)` bijective, index `6 = 3!` | consistent with §0.2's index `p!` at `b = 0` | restated as comparison |
| §2.3 ends comparison | `h̄` homeomorphism, `U` disc around `p` | `h(U ∖ {p}) = h̄(U) ∖ {h̄(p)}` | end at `p` ↦ end at `h̄(p)` | none |
| §2.4 convention sentence | `(1,1)`; `(0,3)` | `a⁻¹b⁻¹ab p₁ ↦ aba⁻¹b⁻¹ c₁`; `p₁p₂p₃ ↦ c₁c₂c₃`, `c₃ = (c₁c₂)⁻¹` | relators match word for word | none |
| §4.3 via §0.1 | `(0,0)`; `(1,1)`; `(1,0)`, `GL₁` | trivial group, `Hom` a point; `F₂`, `G²`; `ℤ²`, `𝔾_m²` | unchanged values | Needs changed |
| Scope clause: §0.2 outer action = `Ψ_x` restricted | `f ∈ Mod(S*)` | `f_const = map f x ∘ (equivOfPath const)⁻¹ = f_*` | equal | new clause |
| Scope clause: MCG-finite = finite §3.5 orbit | index `[Mod^± : PMod] = 2·n!` | orbit sets of `ρ∘φ` and `ρ∘φ⁻¹` equal; finite under PMod ⇔ under `Mod^±` | equal | new clause |
| Scope clause: `R_r`, `M_r` | finitely presented `Γ` | functor `B ↦ Hom(Γ, GL_r(B))` both sides; relator ideal generates `N`'s ideal | equal | new clause |
| §7.2 definition, any field | `Γ = 1`; `ℤ/2`, `𝔾_m`, `𝔽₂`; `ℤ`, `GL_n` | `Spec k`; `𝔽₂[t]/((t−1)²)`, trivial action, `Hom//G = Hom`; `𝔸^{n−1} × 𝔾_m` | covered (old text excluded the second) | restated |
| §7.2 same image ⇔ closures meet | `ℤ`, `SL₂(ℂ)`: `U = [[1,1],[0,1]]`, `1` | `tr U = tr 1 = 2`; `diag(t,t⁻¹) U diag(t,t⁻¹)⁻¹ = [[1,t²],[0,1]] → 1` | both directions hold | Layer 3A in Needs |
| §7.2 closed immersion, char 0 | `ℤ²`, `GL_n` over `ℚ`; `𝔾_m` over `𝔽₂`; `C₂` over `𝔽₂` | surjective by linear reductivity; `𝔽₂[t^{±1}] ↠ 𝔽₂[t]/((t−1)²)`; image `𝔽₂[x²] ≠ 𝔽₂[x] = O(Y)^{C₂}` | char 0 enough; linear reductivity is the input | Check corrected |
| §7.2 complex comparison | `ℤ`, `SL₂(ℂ)` | quotient map `tr`; naive `Hom/G` non-Hausdorff at `U`, `1`; `𝒳` = semisimple classes `≅ ℂ` | consistent with §7.1 Check | none |
| §7.1 Goldman citation | — | locator only (uncertified) | no claim rests on it | citation |

## Sources

- No new work is cited and nothing was fetched. `needs-references.toml` was not written.
- Sikora2012 lines 823–837 were re-read for §7.2's restated statement. The categorical quotient with
  the universal property for affine targets, the unique closed orbit in each fibre, and points as
  completely reducible classes all hold.
- Goldman1984 is `uncertified` and cited by locator only.

## For the maintainer

- **New suppliers.** MappingClassGroupsAndCanonicalRepresentations (§§0.1–0.3) and
  LanglandsParameterStacks (§2.2) are now suppliers. The intake will place this roadmap after
  MappingClassGroupsAndCanonicalRepresentations (merge-order line 292). Neither roadmap names this
  one, so there is no cycle.
- **Ids changed** in this design; no roadmap on main or in an open pull request cites them:
  - Layer 2's old §2.5 (pure Birman) is deleted.
  - Old §2.6 is now §2.5.
  - `plan.json` ids 2.4a → 2.4 and 2.6 → 2.5; old 2.4 and 2.5 are deleted.
  - Target name `MappingClass.permutation_surjective` → `MappingClass.puncturePermutation`.
- **The open owner keeps an implicit definition.** MappingClassGroupsAndCanonicalRepresentations
  §0.2 does not define how a class permutes the punctures. This roadmap's contract records the
  reading it assumes, and §2.3 proves that the end reading and the extension reading agree. If that
  roadmap later fixes a definition, §2.3's comparison is where the two meet.
- No suspicious instructions were found in the review text.
