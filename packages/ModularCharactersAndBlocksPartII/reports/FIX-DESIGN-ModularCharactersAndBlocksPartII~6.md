# Repair of ModularCharactersAndBlocksPartII (design, round 6)

Findings of `reports/REV-DESIGN-ModularCharactersAndBlocksPartII~5.md` (one review, so the ids are
unqualified). Each was checked against the base ModularCharactersAndBlocks at the head of its open
pull request (read with `roadmaps show`), the pinned Mathlib, and the roadmap's own text.

## R01 (P2) — applied

Verified: base §1.1 fixes the system `F_v` at a chosen place of `F = ℚ(ζ_e)` over `p` and says that
all later layers use it, and base §7.2 passes the second main theorem only to that system ("the
residue field `k` of `K` is finite, hence perfect"). The README's Conventions admitted every
complete DVR with `ζ_e` in its fraction field, so §8.1 cited base §7.2 at a generality the base
does not state. The review's main repair was taken.

Old → new: Conventions "a splitting `p`-modular system … in the sense of the base §1.1: `O` a
complete DVR …" → "the system of base §1.1 at a finite place `v` of `F` over `p`; every place
allowed", with witnesses (`S₃`: one place, `𝔽₄`; `C₇ × C₂`: two places, `𝔽₈`) and the excluded
`𝔽₄(T)` system. §6.3 "do not depend on the splitting system (base §2.4)" → a change-of-place
statement with a new Check; §§9.1–9.2 quantify over places.

Other places repaired for the same pattern: Scope (Layer 6 bullet), the "Planned by other roadmaps"
bullet, the base §1.1 and §7.2 contract bullets, §6.1's opening sentence, §7.2's route (the residue
field is finite, not merely "need not be algebraically closed"), the Layer 6 Dependencies, the
Mathlib contract (adds `Ideal.exists_smul_eq_of_isGaloisGroup`), and in `plan.json` the
hypothesis on all 14 targets of Layers 6–8, the 6.3 API (`height_changeOfPlace`) and test, the 9.1
statement, API (`brauerHeightZero_indep_system` → `brauerHeightZero_iff_one_place`) and test, the
9.2 statement and API (`alperinMcKay_iff_one_place`), and the base supplier description.

The change of place, as stated in §6.3: for `σ ∈ Gal(F/ℚ)`, `σ` is an isometry from the
`𝔭_v`-adic to the `σ(𝔭_v)`-adic valuation, so it extends to an isomorphism `F_v → F_{σv}` of the two
systems. Applied to coefficients it carries blocks, central characters, defect classes, `Br_P` and
defect groups of every `k_v[H]` to those of `k_{σv}[H]`, and acts on characters by `χ ↦ σ ∘ χ`.
So heights, `Irr₀` and Brauer correspondents are transported, and Galois transitivity on the
primes over `p` (Mathlib `Ideal.exists_smul_eq_of_isGaloisGroup`,
`Mathlib/NumberTheory/RamificationInertia/Galois.lean` line 127, with the instance
`IsGaloisGroup G ℤ (𝓞 L)` at `Mathlib/FieldTheory/Galois/IsGaloisGroup.lean` line 56) makes the
Layer 9 properties hold at one place exactly when they hold at every place. No generality is lost
on the character side: every prime of `O_F` over `p` is the prime of some place, so every
congruence class `SameBlock M` of base §4.2 is covered.

## R02 (P3) — applied

Verified: in the uniqueness statement of §4.5 the family is arbitrary. `π(C_Γ(T), S/T)` is defined
only on `Irr_{S/T}(C_Γ(T))`, and only §4.4 gives the invariance, for the constructed family alone.
Old → new: "`π(Γ,S)(χ) = π(C_Γ(T),S/T)(π(Γ,T)(χ))` for every `T ⊴ S`, where `π(Γ,T)(χ)` is
`S/T`-invariant by §4.4" → "for every `T ⊴ S` and `χ ∈ Irr_S(Γ)`, `π(Γ,T)(χ)` is `S/T`-invariant
and [the identity]; for the constructed family the invariance holds by §4.4". Mirrored in plan 4.5
(statement, `glauberman_compat`, `glauberman_family_unique`). Added a Check for the law's end
cases. No other occurrence: §§4.6, 5.1 and 5.2 use the law for the constructed family only.

## R03 (P3) — applied

Verified at the base head: §6.2 introduces "a central character `λ_B : Z(k[G]) → k`" over a
splitting field. The second bullet of §7.1 states the first main theorem over every field of
characteristic `p` that splits `G` and all its subgroups. Old → new: Conventions "(base §7.1)" →
"(base §6.2)". `λ_B` moved from the §7.1 contract bullet to the §6.2 bullet. The sentence "the
product form … over an algebraically closed field and is not consumed" now reads: `brauer_first_main` is over
an algebraically closed field, while its splitting-field form (base §7.1) agrees with the Brauer
correspondent of §6.2, with the one-line reason. Also dropped base §7.1 from §6.1's *Needs:* and
plan 6.1, where it stood only for `λ_B`. The `S₃`, `p = 2`, `𝔽₄` witness is unchanged.

## Checks

**Dependency gate** (run after the edits):

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after InverseGaloisAndArithmeticFundamentalGroups (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 245 roadmaps, 2233 edges, 0 problem(s)
```

No UPWARD and no CYCLE line. The note concerns the base, an open new-roadmap pull request that is
not yet in the merge order; it is not a defect at the design stage.

**Citations** (`roadmaps resolve` on the edited README): no cross-roadmap citation and no Lean name
found nowhere. `Ideal.exists_smul_eq_of_isGaloisGroup` was opened at the pin by hand (namespace
`Ideal`, line 127); `brauer_first_main` is a target of base §7.1 at the base head.

**Lean**: the package is at the design stage and has no `Suggested.lean`, so there was nothing to
elaborate and no `#check @name` comparison to run; no Lean command was run.

**Ownership**: `roadmaps grep` for the Galois transport of blocks between places (by object: Galois
conjugate blocks, blocks at a place, change of place) found no match on main or at any open head.
The base §4.2 only remarks that `SameBlock` over all `M` covers every place. This roadmap is
therefore the owner of the §6.3 statement, which its Layer 9 needs. The overlap report
lists no pull request changing this roadmap and no dropped id; nothing changed there.

**Sources**: no new source is cited; `sources.toml` is unchanged. No text is missing, and no
`needs-references.toml` was written.

## Adversarial pass on the new and changed statements

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions, system at a place | `S₃`, `p = 2`; `C₇ × C₂`, `p = 2`; `G = 1`; `S₃`, `p = 3`; `𝔽₄(T)` system | `e = 6`, `F = ℚ(ζ₃)`, `2` inert (order `2 = φ(3)`): one place, `k = 𝔽₄`; `e = 14`, `F = ℚ(ζ₇)`, `ord₇(2) = 3` (`2, 4, 1`): `g = 6/3 = 2`, `k = 𝔽₈`; `F = ℚ`, `k = 𝔽_p`; `3` ramified in `ℚ(ζ₃)`: one place, `k = 𝔽₃`; residue field infinite, so not a §1.1 system | holds; the witness system is excluded | Conventions witnesses |
| §6.3 change of place | `C₇ × C₂`, `p = 2`, `σ = σ₃`, `σ₂`, `id`; `S₃`, `p = 2`, complex conjugation; `A₅`, `p = 2` | decomposition group `⟨2⟩ = {1, 2, 4} ⊆ (ℤ/7)ˣ`; `3 ∉` it, so `σ₃` moves the place, `σ₂` fixes it; blocks `{ψ_a × 1, ψ_a × sgn}` ↦ `{ψ_{3a} × 1, ψ_{3a} × sgn}`, defect group `1 × C₂`, heights `0 − (1 − 1) = 0` on both sides; `S₃`: one place, rational characters fixed; `A₅`: `ord₁₅(2) = 4`, `φ(15) = 8`, two places, `σ₂` (in the decomposition group) swaps `3, 3′` inside `B₀ = {1, 3, 3′, 5}`, `|Irr₀(B₀)| = 4` at both places | holds; `χ(1) ∈ ℤ` is fixed by `σ`, so `h_{σv}(σ ∘ χ) = h_v(χ)` | new API bullet and Check |
| §6.3 route: `σ` is an isometry | `x ∈ 𝔭_v^n O_{F,𝔭_v}` | `σx ∈ σ(𝔭_v)^n O_{F,σ(𝔭_v)}`, so `v_{σ𝔭}(σx) = v_𝔭(x)`; extends to completions, maps `O_v → O_{σv}`, `m_v → m_{σv}` | holds | — |
| §6.3: Brauer correspondent transported | `Br_D` on coefficients | `Br_D(σ̄(e_B)) = σ̄(Br_D(e_B))` since `Br_D` keeps the coefficients on `C_G(D)`; `S₃`, `p = 2`: `Br_{⟨t⟩}(1 + r + r²) = 1` at the single place | holds | — |
| §9.1 quantifier over places | `C₇ × C₂`, both places; `S₄`, `p = 2`; `G = 1` | defect group `C₂` abelian, all heights `0`; `F = ℚ(ζ₁₂)`, `e = f = 2`, one place, height `1` and `D₈`; one block | holds | statement, bullet, Check |
| §9.2 quantifier over places | `A₅`, `p = 2`, two places; `S₃`, `p = 2` | `4 = 4` at both places (`N_G(V₄) = A₄`, all four characters of height `0`); `2 = 2` | holds | statement, bullet |
| §4.5 law as a conjunction | `T = 1`; `T = S`; `S = C₆`, `T = C₃`; uniqueness induction | `π(Γ, 1)(χ) = χ` (multiplicity `1`), `S`-invariant for `χ ∈ Irr_S(Γ)`; `π(C, 1) = id`, invariance under `S/S = 1` trivial; `C₆/C₃ ≅ C₂` a `2`-group and `C₃` a `3`-group fix both factors; another family `π′` agrees with `π` on `T` of prime index by induction and on `S/T` by the `p`-group property, its invariance clause makes `π′(C_Γ(T), S/T)(π′(Γ, T)(χ))` defined | existence (from §4.4 equivariance with `B = S`) and uniqueness both hold | statement, plan, Check |
| R03: `λ_B` from base §6.2 | `S₃`, `p = 2`, `k = 𝔽₄` | on `1, R, T`: `1, 2 ≡ 0, 3 ≡ 1` for `B₀`; `1, −1 ≡ 1, 0` for `{std}` | matches base §6.2 | citation |
| R03: §7.1 sentence | `S₃`, `p = 2`, `D = ⟨t⟩`; `D = 1` | `N_G(D) = D`, one block `b′`, `Br_D(e_{B₀}) = 1 = e_{b′}`, `b′^G = B₀`, `Br_D(r + r²) = 0`; `N_G(1) = G`, `Br_1 = id`, `b′ = B` | the bijection of base §7.1 sends `b′` to `B` | contract sentence |
| §7.2 route, residue field | `S₃`, `p = 2`; `S₄`, `p = 2` | `k = 𝔽₄` in both (`e′ = 3`), finite | "finite, so not algebraically closed" is exact | wording |

## For the maintainer

- Plan-only API names changed: `brauerHeightZero_indep_system` → `brauerHeightZero_iff_one_place`.
  New: `height_changeOfPlace`, `alperinMcKay_iff_one_place`. None is a `Suggested.lean` name
  (there is no acceptance file at this stage), and no other roadmap cites them.
- Section numbering is unchanged; no id that other roadmaps could cite moved.
- The block strand now uses the base's convention: one system per place over `p`, all places
  quantified. A consumer that needs another splitting system has a route: the base §6.2 scalar
  extension (for `k[G]`-level statements) and the base §4.2 congruence (for `Irr(B)`). No such
  consumer exists, so no comparison target was added.
- Nothing in the review was suspicious as an instruction; no untrusted text was acted on.
