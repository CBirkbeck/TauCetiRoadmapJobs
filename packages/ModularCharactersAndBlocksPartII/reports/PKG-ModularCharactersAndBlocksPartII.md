# PKG-ModularCharactersAndBlocksPartII

Package written from the accepted design (`packages/ModularCharactersAndBlocksPartII/design/`) and
its accepting review: `packages/ModularCharactersAndBlocksPartII/README.md` (1730 lines),
`Suggested.lean` (16 headline theorems, 4 definitions), `metadata.toml` (`topic = "math.RT"`),
`sources.toml` (15 entries, one locator extended). `design/plan.json` is unchanged: its single
supplier gap `clifford-multiplicity-dvd-index` (InductionRestriction, Layer 7) still holds and is
stated in the README under *Exact supplier contracts*, InductionRestriction subsection, as
`What InductionRestriction must provide (gap:clifford-multiplicity-dvd-index): …`. No new gap.

## Headline theorems

Listed from the design's final targets T1–T9 and its *How to read the build*, then checked against
the pins. Every headline is statable; all are stated.

| Headline (README) | Status | Lean name |
|---|---|---|
| Canonical extension, existence and uniqueness (§2.2, T1) | stated | `existsUnique_canonicalExtension` |
| Values of the canonical extension: `ℚ(χ̂) = ℚ(χ)`, `χ̂(s) ∈ ℤ` (§2.3, T1) | stated | `canonicalExtension_values` |
| Gallagher's correspondence (§2.4, T1) | stated | `gallagher_bijOn` |
| Brauer's permutation lemma for a coprime solvable action, `|Irr_S(Γ)| = |Irr(C)| = #` invariant classes (§4.4, T4) | stated | `ncard_invariantIrreducibleCharacters` |
| `p`-group case: unique constituent of multiplicity prime to `p`, `≡ ±1 (mod p)` (§4.5, T3) | stated | `existsUnique_restrict_pairing_not_dvd` |
| The Glauberman family: its laws (§4.5, T4) | definition | `IsGlaubermanFamily` |
| Existence of the Glauberman family (§4.5, T4) | stated | `exists_isGlaubermanFamily` |
| Uniqueness of the Glauberman family (§4.5, T4) | stated | `IsGlaubermanFamily.apply_eq` |
| Cyclic case: `χ̂(a t) = ε θ*(t)` (§§3.2, 4.5, T2) | stated | `IsGlaubermanFamily.exists_sign_of_isCyclic` |
| Constituent law `[θ|_C, θ*] ≠ 0` (§4.6 (d), T4) | stated | `IsGlaubermanFamily.restrict_pairing_ne_zero` |
| Fields of values `ℚ(θ*) = ℚ(θ)` (§4.6 (c), T4) | stated | `IsGlaubermanFamily.adjoin_range_eq` |
| Degree bound `θ(1) ∣ |Γ : C| θ*(1)` (§5.1, T5) | stated | `IsGlaubermanFamily.index_mul_degree_eq` |
| Brauer's theorem on heights (§6.2, T6) | stated | `brauer_height` |
| Fong–Reynolds: characters and defect groups (§7.4, T7) | stated | `fongReynolds` |
| Fong–Reynolds: bijection on blocks (§7.4, T7) | stated | `existsUnique_fongReynolds` |
| Reynolds' height formula (§8.3, T7) | stated | `reynolds_heights` |
| Reynolds' theorem (§8.4, T9) | stated | `reynolds` |

Definitions added to make these statable, each with a real body on native carriers:
`invariantIrreducibleCharacters` (a `Set (Γ → ℂ)`), `IsGlaubermanFamily` (a `Prop` on a family of
maps), `IsBlockDefectGroup` (Sambale's Definition 1.4 with the Brauer projection written as "a
nonzero coefficient on the centraliser"), `blockCharacters` (characters of irreducible
`K`-representations on `Fin n → K` on which the block idempotent acts as `1`).

Not stated, and said so in the module docstring: three propositions that the roadmap defines but
whose general validity it only cites — Glauberman degree-divisibility (§5.2; geck, hartley-turull),
Brauer's height zero property and the Alperin–McKay property (Layer 9; kessar-malle, mnst,
ruhstorfer). Their proved instances are stated (`reynolds` for normal defect groups, which
contains defect zero, `p`-groups and abelian groups) or follow in a step from a stated theorem
(§5.2's `θ* = θ|_C` when `θ|_C` is irreducible, from
`IsGlaubermanFamily.restrict_pairing_ne_zero`), and stay in the README.

`reynolds_heights`, and the "abelian ⇒ height zero" direction of `reynolds`, depend on the supplier
gap `clifford-multiplicity-dvd-index`, as in the design.

## Corrections to the design, and what changed

1. **Generality of the block strand (README = Lean).** The design stated Layers 6–9 only at the
   system of base §1.1 at a place `v` of `ℚ(ζ_{exp G})`. The sources state these theorems for an
   arbitrary `p`-modular system (sambale line 312: a complete discrete valuation ring with
   algebraically closed residue field), and the base's own Lean statements use an arbitrary
   complete DVR. The Lean headlines are stated for every splitting `p`-modular system (`O` a
   complete DVR, `CharZero O`, `ζ : FractionRing O` a primitive `exp(G)`-th root of unity,
   residue characteristic `p`). To make the README as general: Conventions now define the
   splitting system and say each statement of Layers 6–9 is made for every one of them; §6.1
   gains a **change of system** bullet (the closure of `ℚ(ζ_{exp H})` in `K'` is a copy of `K_w`
   at the place below, and blocks, central lifts, `Irr`, `IBr`, decomposition numbers, defect
   groups, covering, stabilisers, induction and Brauer correspondents are carried over, from base
   Conventions, §§1.3, 2.3, 2.4, 6.2, 7.1, 8.2 and CharacterTheory §4.5), with two Checks (the
   `𝔽₄(T)` system for `S₃`; `(ℚ₂, ℤ₂, 𝔽₂)` for `C₃` as a negative control); §6.3 gains the matching
   heights bullet; §§6.2, 9.1, 9.2 say how they reach arbitrary systems. It sits in §6.1, not
   §6.3, so that §6.2 can use it without a §6.2 ↔ §6.3 cycle. The design's place-based statements,
   change of place and change of level are unchanged.
2. **Gallagher Check, `N = 1`.** The design said `N = 1` "gives the identity of `Irr(G)`". The
   hypothesis `χ̂|_1 = θ = 1` only makes `χ̂` linear; the map is multiplication by `χ̂`. For `G = C₂`,
   `χ̂ = sgn` it exchanges `1` and `sgn`. Corrected in §2.4.
3. **Source misprint.** martinez line 725 compares `d(B)` with `χ(1)_p` where `p^{a−d(B)}` is
   meant (the accepting review's source issue); §6.3 now says so at the locator.
4. **Mathlib name.** `IsSolvable` is deprecated at the pin in favour of `Group.IsSolvable`; the
   README's library list and the Lean use the latter.
5. **How to read the build.** It listed "the `p`-group characterisation (§4.2)" and "the two
   predicates (Layer 9)" as `Suggested.lean` headlines; the `p`-group statement is §4.5 and the
   predicates are definitions with cited validity, so they are not in the Lean file. Rewritten to
   list exactly what `Suggested.lean` states.
6. **Covering and stabiliser.** Conventions now state covering as `e_B e_b ≠ 0` (sambale line 483,
   Definition 1.16), readable in `O[G]` because an idempotent in `m O[G]` is `0`, and the
   stabiliser of a block as the centraliser of its idempotent; §7.4 gains a Check that the
   stabiliser of the idempotent, not the inertia group of a character, is meant.
7. Lean names added at the sections that state them (§§1.1, 2.2, 2.3, 2.4, 4.4, 4.5, 4.6, 5.1,
   6.2, 7.4, 8.3, 8.4, Conventions) and in the Summary; locators to sambale lines 312, 341, 350,
   483, 499, 509 added and recorded in `sources.toml`.

The README was rewrapped to 98 columns by a script that moves line breaks only outside code
spans (the whitespace-normalised text was compared before and after: identical; no line has an
unbalanced backtick).

## What the README could not support

Nothing of the design was dropped. The only conditional statements are those on
`gap:clifford-multiplicity-dvd-index`, as accepted.

## Notions moved down from later roadmaps

None. Every supplier is on main (CharacterTheory, InductionRestriction), earlier in the merge
order (InverseGaloisAndArithmeticFundamentalGroups, IG.3.4), or an open pull request adding a new
roadmap folder (ModularCharactersAndBlocks, the base). LocalFiniteGroupTheory is not cited as a
supplier. InductionRestrictionPartII, later in the merge order, states nothing this roadmap uses.

## Duplication sweep (by object)

Removals: **none**; the design had already deferred what exists elsewhere. What was checked:

- **Pinned Mathlib and Tau Ceti** (grep of `RepresentationTheory/` and `GroupTheory/` for
  Glauberman, Gallagher, canonical extension, permutation lemma, defect group, Fong, Reynolds,
  Osima, coprime action, `IsDefect`): no declaration of any object owned here. The only hit,
  `GroupExtension.ofSurjective` ("canonical extension by the kernel"), is another object.
  Consumed instead of rebuilt: `TauCeti.IsPrimitiveIdempotent`, `Subgroup.indClassFun`,
  `TauCeti.irreducibleCharacters`, Mathlib's quotient action
  `MulDistribMulAction (G ⧸ H) (FixedPoints.subgroup H α)` (`Mathlib/GroupTheory/GroupAction/OfQuotient.lean:62`),
  `IsMulCommutative`, `Group.IsSolvable`.
- **Main and the open heads** (`roadmaps grep`): "Glauberman correspondence", "Fong–Reynolds",
  "theorem on heights", "Osima", "Alperin–McKay", "normal defect group", "extended first main",
  "Brauer correspondent": no match anywhere. "canonical extension": only automorphic and
  arithmetic-geometry roadmaps, other objects. "Gallagher": only Gallagher's zero-one law
  (ProbabilisticAndMetricNumberTheory). "Reynolds": only the Reynolds operator. "height zero":
  arithmetic heights only. "permutation lemma": FiniteGroupInvariants §6.2, the Galois version,
  which the README already defers to (its §1.3 is the automorphism version; read at the head:
  §6.2 counts Galois orbits).
- **The base** (ModularCharactersAndBlocks at its head): owns defect groups, `λ_B`, defect classes
  and their Sylow characterisation (§6.2), covering (§8.2), domination for normal `p`-subgroups
  (§8.1); it states no heights, no Fong–Reynolds, no Reynolds, no existence or `p`-regularity of
  defect classes. `IsBlockDefectGroup` and `blockCharacters` restate the base's §6.2 defect group
  and §4.2 block membership as local definitions of the acceptance file, because `Suggested.lean`
  may not import a roadmap module; they carry names distinct from the base's (`IsDefectGroup`,
  `SameBlock`), and the README says what they mirror.
- **InductionRestriction** (main) Layer 7 owns the module-level equivalence between
  representations of the inertia group over a simple `V` and projective representations of the
  quotient; §2.4 here owns only its character form for an ordinary extension. This is now said in
  *Scope and ownership*.
- Ownership against open pull requests was checked with the `roadmaps` tools (they read the open
  heads); the overlap report lists no pull request changing this roadmap and no dropped id.

## The mechanical binder check

All 20 declarations were `#check @name`-ed in one scratch copy and each elaborated type compared
with its README statement. The file uses no section `variable`s; every binder is in the
declaration's own signature, so nothing was dropped. No change was needed. The only fix during
elaboration was `IsSolvable S` (a deprecated alias, not a class) → `Group.IsSolvable S`.

## Elaboration

`lake env lean packages/ModularCharactersAndBlocksPartII/Suggested.lean`, run from the content
checkout: exit 0, **16** warnings `declaration uses 'sorry'` (one per theorem), no other message.
Imports: `Mathlib`, `TauCeti.RepresentationTheory.CharacterTable.Table`,
`TauCeti.RepresentationTheory.Induction.ClassFunction`,
`TauCeti.RingTheory.Idempotents.Primitive.Basic` (object files present at the pin; nothing
built). First line `module`; no `set_option`, `lemma`, `#eval`, sorry'd data.

## Dependency check

```
depcheck: 245 roadmaps, 2237 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

## Citations and library names

`roadmaps resolve` on the README: no cross-roadmap citation and no roadmap Lean name found nowhere.
Library names (outside the roadmaps) were checked at the pins: Mathlib names and the Tau Ceti
names in built modules by `#check` in a scratch file; the Tau Ceti names in modules without
object files (`FDRep.characterField`, `FDRep.cliffordCorrespondence`,
`FDRep.clifford_restrict_dvd_finrank`, `FDRep.clifford_restrict_inertia_eq_top_of_coprime`,
`IsPrimitiveRoot.cyclotomicIrreducibleCharacterAction(_apply)`, `TauCeti.inertia`,
`TauCeti.le_inertia`, `TauCeti.mem_inertia_iff`, `TauCeti.IsProjectiveInertiaExtension` and its
`tensorRep`, `tensorRepEquiv`, `isIrreducible_tensorRep_iff`, `tmulIntertwining_bijective`,
`TauCeti.exists_isProjectiveInertiaExtension`, `TauCeti.clifford_restrict_character`,
`TauCeti.Representation.isSemisimpleRepresentation_comp_subtype`,
`TauCeti.Representation.primitiveCentralIdempotent`, `SemidirectProduct.range_monoidHomSubgroup`,
`Representation.nonempty_equiv_of_character_eq`) by reading their declarations in the pinned
source. All exist. Cross-roadmap citations re-read: base sections at its head (Conventions,
§§0.2–8.2), IG.3.4 *Conjugacy of coprime complements* at its head, CharacterTheory §§2.1, 3.5,
3.6, 4.3, 4.4, 4.5 and InductionRestriction Layers 1, 2, 5, 7 on main.

## Sources

No new work cited, nothing fetched, no `needs-references.toml`. `sources.toml`: the `sambale`
locator now lists lines 312, 341–351, 483, 499, 509, and its `cited_for` adds Conventions. Lines
read this run: glauberman 84–98, 530–548, 598–650; martinez 95–135, 715–735, 1815–1872,
2125–2135, 2318–2350; reynolds 525–548; sambale 300–362, 395–420, 480–512.

## Adversarial pass

One row per statement written or changed. `a = ν(|G|)`, `d = ν(|D|)`.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `invariantIrreducibleCharacters` | `C₃` on `C₇` by `r ↦ r²`; `C₃` on `Q₈`; `S = 1` | `χ_j(r²) = χ_j(r)` iff `2j ≡ j (7)` iff `j = 0`: `{1}`; `Q₈`: three linear characters permuted, `{1, χ₂}`; `S = 1`: all of `Irr(Γ)`; `χ(s•g)` against `χ(s⁻¹•g)`: same fixed set as `s` runs over a group | holds | none |
| `existsUnique_canonicalExtension` | `SL(2,3)`; `Γ = 1`, `S = C₂`; trivial action; `Q₈` with `C₂` (noncoprime) | natural character, `det` at order `3` = `ω·ω² = 1`, twists `det = λ² ≠ 1`; extensions of `1_1` are `1, sgn`, `det = 1, −1`: unique `1`; `χ × β` has `det(s) = β(s)^{χ(1)}`, `gcd(χ(1), |S|) = 1` forces `β = 1`; `±√−1 ρ(i)` have `det = −1`: no extension | holds; coprimality needed | none |
| `canonicalExtension_values` | `SL(2,3)`; `C₂` trivial on `C₃`, `χ(r) = ζ₃`; non-canonical `χ̂ω` | values `2, −2, 0, −1, −1, 1, 1` ⊂ `ℚ`, `ℚ(χ₂) = ℚ`; `ℚ(χ×1) = ℚ(ζ₃) = ℚ(χ)`, `χ̂(s) = 1`; `χ̂ω(a) = −ω ∉ ℤ` | holds; determinant normalisation needed | added |
| `gallagher_bijOn` | `SL(2,3)` over `χ₂`; `N = G`; `N = 1`, `G = C₂`, `η = sgn`; `N = Z(Q₈)` | `3` characters of `C₃` ↦ `χ̂, χ̂ω, χ̂ω²`, the `3` members of `Irr(SL(2,3) | χ₂)`; `{1} ↦ {θ}`; `1 ↦ sgn`, `sgn ↦ 1`; linear characters of `Q₈` are `1` at `−1`, so no `η`, and `|Irr(Q₈|θ)| = 1 ≠ 4` | holds; design Check for `N = 1` was wrong | Check corrected |
| `ncard_invariantIrreducibleCharacters` | `SL(2,3)`; `C₂` on `C₇ ⋊ C₃` inverting `C₇`; `⟨t⟩` on `S₃` (noncoprime) | `2 = 2 = 2`; `3 = 3 = 3` (degree-`3` characters swapped, classes `{1}, sC₇, s²C₇` fixed); `|Irr_S(S₃)| = 3`, `|Irr(C_{S₃}(t))| = 2` | holds; coprimality needed | none |
| `existsUnique_restrict_pairing_not_dvd` | `SL(2,3)`, `p = 3`; `3^{1+2}_+` with `C₂`, `p = 2`; `S = 1` | `[χ₂|_C, sgn] = 2`, `2 + 1 ≡ 0 (3)`, `[χ₂|_C, 1] = 0`; `[χ|_Z, ω] = 3`, odd, `≡ 1 (2)`, others `0`; `[χ, χ] = 1` for every `p` | holds | none |
| `IsGlaubermanFamily` | swap on `C₃ × C₃`; law with `≡ 1 (mod p)` instead of `p ∤`; `T = 1`, `T = S` | without the `p`-group law any of the `3! = 6` bijections `{ψ_a × ψ_a} → Irr(diag)` passes, with it only `ψ_a × ψ_a ↦ ψ_{2a}`; `[χ₂|_C, sgn] = 2 ≢ 1 (3)`, so that law has no model; `T = 1`: `π(Γ,1)χ = χ|_⊤` forced; `T = S`: `π(C, 1)` is the identity | the laws pin the family | added |
| `exists_isGlaubermanFamily` | `SL(2,3)`; swap on `C₃ × C₃`; `S = C₆`, `T = C₃` | `1 ↦ 1`, `χ₂ ↦ sgn`; `ψ_a × ψ_a ↦ ψ_{2a}` (restriction to the diagonal is `ψ_{2a}`, multiplicity `1`); composition series through `T` gives `π(Γ,C₆) = π(C_Γ(C₃), C₂) ∘ π(Γ, C₃)` | holds | added |
| `IsGlaubermanFamily.apply_eq` | `S = 1`; prime index `T ⊴ S` | multiplicity of `ψ` in `χ|_⊤` is `δ`, so `π(Γ,1)χ = χ`; `π(Γ,S)(χ)(y) = π(C_Γ(T),S/T)(π(Γ,T)χ)(x)`, first factor fixed by the `q`-group law at `q = |S : T|`, second by induction | holds | added |
| `IsGlaubermanFamily.exists_sign_of_isCyclic` | `SL(2,3)`, `a`, `a²`; trivial `C₂` on `C₃`; `S = 1` | `χ̂(a) = −1`, `χ̂(−a) = 1`: `ε = −1`, `θ* = sgn`, same for `a²`; `χ̂(at) = χ(t)`, `ε = 1`; `ψ(inl t) = χ(t)`, `ε = 1`; without the sign no solution for `SL(2,3)` | holds | added |
| `IsGlaubermanFamily.restrict_pairing_ne_zero` | `SL(2,3)`; wrong image `1` | `Σ_{t=±1} χ₂(t) sgn(t⁻¹) = 2 + 2 = 4`; `Σ χ₂(t)·1 = 2 − 2 = 0` | holds; detects a wrong correspondent | added |
| `IsGlaubermanFamily.adjoin_range_eq` | `SL(2,3)`; swap on `C₃ × C₃`, `a = 1` | `ℚ(sgn) = ℚ = ℚ(χ₂)`; `ℚ(ψ₂) = ℚ(ζ₃) = ℚ(ψ₁ × ψ₁)` | holds | added |
| `IsGlaubermanFamily.index_mul_degree_eq` | `SL(2,3)`; `3^{1+2}_+`; `S = 1`; reverse divisibility | `4 · 1 = 2 · 2`, `q = 2`; `9 · 1 = 3 · 3`; `1 · θ(1) = 1 · θ(1)`; `θ = 1`: `|Γ:C| ∤ 1` | holds | added |
| `IsBlockDefectGroup` | `S₃`, `p = 2`; `C₃`, `p = 2`, without `IsPGroup`; minimal instead of maximal | `B₀ = 1 + r + r²`: coefficient `1` at `1 ∈ C(⟨t⟩)`, maximal: `⟨t⟩` (three conjugates); `r + r²`: coefficients `0` on `{1, t}`, defect group `1`; `C₃` would be maximal with coefficient at `r`; `1` would be "minimal" for `B₀` | holds; both clauses needed | added |
| `blockCharacters` | `S₃`, `p = 2`, `K = ℚ₂(ζ₃)`; `G = 1` | `(1 + r + r²)/3 = e_1 + e_sgn`: `{1, sgn}`; `(2 − r − r²)/3 = e_std`: `{std}`; `b = 1`: `{1}` | holds | added |
| `brauer_height` | `S₃`, `p = 2`; `A₅`, `p = 2`; `SL(2,3)`, `p = 3`; `G = 1`; `C₃` over `(ℚ₂, ℤ₂, 𝔽₂)` | `B₀`: `a − d = 0`, degrees `1, 1`; `{std}`: `a − d = 1`, `2 ∣ 2`, `ν = 1`; `B₀(A₅)`: `a = d = 2`, degrees `1, 3, 3, 5`, all `ν = 0`; `{χ₃}`: `3 ∣ 3`; `G = 1`: `p⁰ ∣ 1`; `C₃/ℚ₂`: block `(2 − r − r²)/3`, `D = 1`, `a − d = 0`, only character degree `2`, `ν = 1`: second clause false | holds; `hζ` needed | added; negative Check added |
| `fongReynolds` | `S₃`, `N = C₃`, `p = 2`, `b = e_α`; `p = 3` | `(12) e_α (12) = e_{α²}`: `T = C₃`, `B = e_α`, `λ^{S₃} = std`, `B' = e_std`, defect groups `1`, `1`, heights `0 = 0`; `p = 3`: `b = 1`, `T = S₃`, `indClassFun ⊤` the identity on class functions | holds | added |
| `existsUnique_fongReynolds` | `S₃`, `p = 2`, `b = e_1` | `T = S₃`; `e_{B₀} e_1 = e_1 ≠ 0`; `((2 − r − r²)/3)((1 + r + r²)/3) = 0`, so only `B₀` covers, and `B = B₀` | holds | added |
| `reynolds_heights` | `SL(2,3)`, `p = 2`; `D₈`; `A₄`; `D = 1` | `{0, 1} = {ν(1), ν(2)}`; `{0, 1}`; `{0}`, degrees of `V₄` all `1`; `{0} = {ν(1)}` | holds (conditional on the gap) | added |
| `reynolds` | `A₄`; `SL(2,3)`; `D = 1`; `D₈`; `C₂ × C₃`, `p = 2` | true ↔ `V₄` abelian; false (`χ₂` height `1`) ↔ `Q₈` nonabelian; true ↔ true; false ↔ false; heights `0` ↔ `C₂` abelian | holds | added |
| Conventions, splitting systems and the `𝔽₄(T)` system | `ℤ₂[ζ₃][T]` at `(2)` | quotient `𝔽₄[T]` a domain, so `(2)` prime of height one, localisation a DVR with residue field `𝔽₄(T)`, completion complete, contains `ζ₃` and `ζ₆ = −ζ₃²` (`exp(S₃) = 6`) | holds | rewritten |
| Conventions, covering read in `O[G]` | `S₃`, `N = C₃`, `p = 2` | `e_{B₀} e_1 = e_1`; `e_std e_1 = 0`; an idempotent `f ∈ mO[G]` has `f = fⁿ ∈ mⁿO[G]`, and `⋂ mⁿ O[G] = 0` for a free module of finite rank | holds | added |
| §6.1 change of system | `S₃` at `𝔽₄(T)`; `C₃` at `ℚ₂` | `w` the place of `ℚ(ζ₃)` over `2`, `k_w = 𝔽₄ ⊆ 𝔽₄(T)`, blocks `1 + r + r²`, `r + r²`, defect groups `⟨t⟩`, `1`, characters `{1, sgn}`, `{std}`, heights `0, 0, 0`; at `ℚ₂` no embedding of `ℚ(ζ₃)`, one block of two linear blocks over `𝔽₄` | holds; root of unity needed | added |
| §7.4 stabiliser Check | `S₃`, `N = C₃`, `p = 3` | `k[C₃]` local, `b = 1`, `T = S₃`; inertia model `T = C₃`: `1^{S₃}` has values `2, 2, 0` = `1 + sgn`, reducible | holds | added |
| §6.3 misprint note | martinez lines 723, 725 | line 723: `χ(1)_p = p^{a−d(B)+h}`; line 725 compares `d(B)` with `χ(1)_p`; for `S₃`, `p = 2`, `std`: `χ(1)_2 = 2 = p^{1−0}` while `d(B) = 0 ≠ 2` | the note is right | added |

## Questions for humans (carried from the accepting review)

- **Licence.** `martinez`, the source with the largest share of locators, is unpublished course
  notes read from an author page; `sources.toml` records it as certified, licence class
  author-page.

No suspicious instruction was found in any text read.
