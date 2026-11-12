# FIX-DESIGN-ModularCharactersAndBlocksPartII~5

Findings of `REV-DESIGN-ModularCharactersAndBlocksPartII~4`: two P1 (R01, R05), three P2 (R02,
R06, R07) and two P3 (R03, R04). Files edited: `packages/ModularCharactersAndBlocksPartII/design/README.md`,
`packages/ModularCharactersAndBlocksPartII/design/plan.json`, `packages/ModularCharactersAndBlocksPartII/sources.toml`.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R01 (P1) — applied

Conventions, valuations: "`q ∈ m` exactly when `ν_p(q) > 0`", with `ν_p` undefined → `ν_p = padicValRat p`
(both `padicValNat` and `padicValRat` send `0` to `0`); "`q ∈ O` exactly when `ν_p(q) ≥ 0`, and `q ∈ m`
exactly when `q = 0` or `ν_p(q) > 0`". The witness now covers `0 ∈ m` (`ν_p(0) = 0`), `3/2 ∉ O`
(`ν_p = −1`) and `2/3 ∈ m` (`ν_p = 1`).

Pattern: every other use of a valuation (§§6.2, 6.3, 7.4, 8.2–8.4) applies `ν = padicValNat p` to a
positive degree, class size or index, so nothing else changes. The only rational membership tests,
in the §6.2 route (`|𝒞|/χ(1) ∉ m`), have nonzero arguments. The criterion holds in ramified `K` as well, because
`O ∩ ℚ = ℤ_(p)` and `m ∩ ℚ = pℤ_(p)`.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R02 (P2) — applied

LocalFiniteGroupTheory L1/L3 → InverseGaloisAndArithmeticFundamentalGroups IG.3.4, target
*Conjugacy of coprime complements*, plus Mathlib `Subgroup.exists_right_complement'_of_coprime`. §1.2
now proves Glauberman's lemma inside its route: the point stabiliser `M ≤ X ⋊ S` has normal Hall
subgroup `M ∩ inl(X)` with quotient `S`; a complement of it is conjugated to `inr(S)` (fixed point),
and IG.3.4 inside `M` gives one `C_X(S)`-orbit. §3.1 conjugacy goes through IG.3.4.

Also changed: the Scope import, the supplier section (renamed), the `*Needs:*` of §§1.2 and 3.1, the
Layer 1 and Layer 3 Dependencies, and the plan's 1.2 and 3.1 prerequisites and `suppliers`. Two Checks
were extended: A₅ on `𝔽₇⁵` (`M ∩ inl(H) = 1`) and the four `Q₈`-conjugate complements in `SL(2,3)`.
The Downstream sentence that named the prohibited roadmap now says "character-theoretic local
analysis of finite groups". Both solvability alternatives survive. In `Γ ⋊ S` the normal subgroup
is `inl(Γ)` and the quotient is `S`. In `M` the normal subgroup is `M ∩ inl(Γ)`, solvable when `Γ`
is, and the quotient is `≅ S`. In `H ⋊ S` the group `H ≤ Γ` is solvable when `Γ` is.

Correction to the review: IG.3.4 is not on main. It is at the head of the open pull request that
adds the InverseGaloisAndArithmeticFundamentalGroups folder (a new roadmap, not a revision). That
roadmap comes earlier in the merge order, so it is a permitted supplier; the gate places this
roadmap after it. OddOrderTheorem cites the same target in the same way.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R03 (P3) — applied

The §4.1 Check "`C₆ = C₂ × C₃` on `Q₈ × C₅`" (`gcd(6, 40) = 2`) → `C₁₅ = C₃ × C₅` on `Q₈ × C₁₁`.
Here `C₃` acts on `Q₈` as in `SL(2,3)` and `C₅` acts by `r ↦ r³` (powers `3, 9, 5, 4, 1`). The
series through `C₃` gives `sgn → sgn × 1 → χ₂ × 1`; the series through `C₅` gives
`sgn → χ₂ → χ₂ × 1`. The §4.3 Check, plan tests 4.1 `c15_two_series` and 4.3 `c15` changed with it,
and the old pair is kept as an explicit out-of-domain control.

Pattern: no other Check uses a non-coprime acting group inside the coprime theorems. The remaining
non-coprime instances (§§1.2, 2.1, 3.1, 4.5) are labelled negative controls.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R04 (P3) — applied

§1.3 Check: "each single element fixes four of each" → "each nonidentity element fixes four vectors
and four characters and the identity fixes eight of each … both orbit counts are
`(8 + 4 + 4 + 4)/4 = 5`". Plan test 1.3 `noncyclic_counterexample` changed the same way. The
whole-group counts `2` and `4` are kept.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R05 (P1) — applied differently

**Domination (applied as a target here).** §7.3 "Defect groups under domination", which assumed
domination from base §8.1, → "Domination modulo a normal subgroup". It defines domination for any
`N ⊴ G` and proves that every block of `G/N` has exactly one dominating block. It also gives
`π(e_B)` as the sum of the dominated `e_{B̄}` (`0` if none), the inflation of `Irr` and `IBr`, and
`λ_{B̄} ∘ π = λ_B`, and then the defect-group statement. Plan 7.3 is rewritten to match: statement,
hypotheses, API, tests, and prerequisites base §§0.2, 1.3, 4.1, 4.2, 6.1, 6.2 instead of §8.1. The
supplier contract for base §8.1 now limits it to normal `p`-subgroups, and the Scope, the Summary
and the Layer 7 Dependencies say so.

Why a target here rather than a gap: base §8.1 (its README line 939 at the head of its pull
request) puts domination inside "Normal `p`-subgroups". The general statement takes a few lines:
`π` is a surjective algebra map, and `e_{B̄} = Σ_B e_{B̄} π(e_B)` is a sum of orthogonal central
idempotents below a primitive one. Martínez states it for arbitrary `N ⊴ G` (martinez line 1895,
Corollary 8.2; line 1897, Definition 8.3; line 1907, Proposition 8.4; line 1928, Theorem 8.5). An
object search of main, the board and the open heads found no other owner, so this Part II of the
base owns the generalisation and imports the base's case. New Checks: `S₃ × C₂` with
`N = S₃ × 1` at `p = 2` (images `1, 0`), and `N = G` (the augmentation).

**Covering (disputed).** The base supplies covering for an arbitrary normal subgroup at its current
head. Base README line 954 reads "Block covering, for an arbitrary normal subgroup `N` of `G`". It
defines covering by orbit sums (Martínez, Definition 7.3) and requires Martínez Theorem 7.7 in both
the "some" and the "every" form, over `Irr(B) ∪ IBr(B)`. The review's line numbers (834, 848, 851) do not match the current head, where those lines fall in Layers 6–7. The covering paragraph is at line 954: it sits inside §8.2 but explicitly covers every normal subgroup. The contract text was tightened
to say exactly this. It adds the one-line consequence that `B` covers `b` exactly when
`e_B e_b ≠ 0`, because `e_B` is `G`-invariant.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R06 (P2) — applied differently

**Central characters (applied).** Conventions: "`ω_χ : Z(K[G]) → K` is `TauCeti.Representation.centralCharacter`"
→ `ω_χ(𝒞⁺) = |𝒞| χ(x)/χ(1) ∈ F = ℚ(ζ_e)`, which is the native map over `ℂ`. Over `K` it is the
`K`-linear map read through `F → K`. §6.1 now proves that this map is an algebra homomorphism with
values in `O`: the native map restricts to `Z(F[G]) → F` and is then extended to `K`. A new
`C₃`/`𝔽₄` Check and plan API `centralCharacter_algHom` were added.

**First main theorem (applied differently: neither a gap nor a descent target).** The design
consumed base `brauer_first_main`, whose statement is over an algebraically closed field (base
README line 851). The Brauer correspondent is now defined in Conventions as the block `b'` of
`k[N_G(D)]` with `e_{b'} = Br_D(e_B)`. It rests on base §6.2 (its README lines 790–792): for a block
`B` with defect group `D`, `Br_D(e_B)` is a block idempotent of `k[N_G(D)]` with defect group `D`,
and each such block arises from exactly one `B`. That bullet is stated over the base's residue
field `k`, with no algebraic-closure hypothesis. In Layers 6–8 the base marks that hypothesis
explicitly only on `brauer_first_main` and `brauer_third_main_local`. Base §7.1's formula
`Br_P(e_B) = Σ_{b^G = B} e_b` then gives `b'^G = B`. So the splitting residue field (for example
`𝔽₄`) is covered as stated, and no new contract or comparison target is needed. Updated: §6.4,
§9.2's `*Needs:*`, the Layer 9 Dependencies, the base §§6.2 and 7.1 contracts, plan 6.4 (statement
and test `s3_splitting_field`) and plan 9.2 (now also requires §6.2). The `S₃`, `p = 2`, `𝔽₄`
witness is in both Conventions and §6.4.

Pattern: every consumed native or supplier declaration with an algebraic-closure binder was
checked:
- `card_irreducibleCharacters`, `finrank_dvd_card`, `cliffordCorrespondence`,
  `clifford_restrict_character`, `clifford_restrict_dvd_finrank` and `tensorRepEquiv` are used
  over `ℂ` only.
- The contracts now say this for `centralCharacter` and `clifford_restrict_dvd_finrank`, which
  were the two contracts missing the binder.
- `brauer_third_main_local` is not consumed.

## REV-DESIGN-ModularCharactersAndBlocksPartII~4/R07 (P2) — applied

Scope "defect classes, Brauer's theorem on heights, …" → "the central characters of blocks …,
Osima's formula, the existence and `p`-regularity of the defect classes of the base §6.2, …". The
Summary was changed in the same way. §6.1's "a **defect class** of `B` is …" → "the defect classes of `B` (base §6.2: …)
exist … and consist of `p`-regular elements". The base §6.2 contract now states the predicate and
says this roadmap does not redefine it. In the plan, 6.1's `IsDefectClass` definition entry is
deleted and the summary and the supplier `what` are updated.

Kept as this roadmap's own results, phrased on the imported object: existence, from
`λ_B(e_B) = 1` (martinez line 696), and `p`-regularity, from the Osima consequence, Proposition 2.5
(martinez line 760). The base plans neither; its characterisation (Martínez Definition 3.2 and
Theorem 4.3) only uses the defect classes.

## Checks run

**Dependency gate** (after the last edit):

```
candidate: ModularCharactersAndBlocksPartII is not in the merge order yet; checked as if placed after InverseGaloisAndArithmeticFundamentalGroups (the intake inserts it when its design is accepted)
note: supplier ModularCharactersAndBlocks of ModularCharactersAndBlocksPartII is not in the merge order; it must be inserted before ModularCharactersAndBlocksPartII
depcheck: 236 roadmaps, 2137 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. The insertion note concerns the base, which is not yet in the
merge order; it is not a defect at the design stage.

**Other checks:**
- **Citation resolver:** no cross-roadmap citation and no Lean name found nowhere. It cannot check
  names outside TauCetiRoadmap on this host, so each new library name was opened at the pins of
  `lake-manifest.json` (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`):
  - `MulAction.stabilizer`: `Mathlib/GroupTheory/GroupAction/Defs.lean` line 515, namespace `MulAction`.
  - `Subgroup.IsComplement'`: `Mathlib/GroupTheory/Complement.lean` line 53.
  - `Subgroup.exists_right_complement'_of_coprime`: `Mathlib/GroupTheory/SchurZassenhaus.lean` line 277.
  - `TauCeti.Representation.centralCharacter`: `RepresentationTheory/CharacterTable/CentralCharacter.lean`
    line 89, with `[IsAlgClosed k]` at line 82; `centralCharacter_classSumCenter_mul_character_one`
    at line 162 and `isIntegral_centralCharacter_classSumCenter` at line 180.
  - `TauCeti.classSumCenter`: `RepresentationTheory/CharacterTable/ClassSum/Basis.lean` line 76.
  - `FDRep.clifford_restrict_dvd_finrank`: `Induction/Clifford/Dimension.lean` line 113, with
    `[IsAlgClosed k]`.
- **Parsing:** `plan.json` parses and keeps its one-space JSON layout. `sources.toml` parses with
  15 entries.
- **Sources:** no new source and no new key. Two existing entries changed:
  - `martinez` locator: the defect-class existence line (696) and the Lecture 8 domination lines
    (1895, 1897, 1907–1909, 1924, 1928–1931).
  - `isaacs`: `cited_for` gains §1.2 (Chapter 13, Glauberman's lemma); it stays uncertified.

  Every new locator was read in the cached martinez text. No `needs-references.toml` was written.
- **Lean:** this is the design stage and no `Suggested.lean` exists, so there was no `#check @name`
  comparison and no elaboration, and none is claimed.
- **Hygiene:** no LaTeX delimiters, local paths or process words in the edited files. The edited
  files never name LocalFiniteGroupTheory.

## Adversarial pass (changed or added statements)

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| Rational membership in `O` and `m` (Conventions) | `p = 2`: `q = 0, 3/2, 2/3, 1`; `p = 3`, `K = ℚ₃(ζ₃)` ramified, `q = 3` | `ν_p = 0, −1, 1, 0, 1`; in `O`: T, F, T, T, T, and `ν_p ≥ 0` gives the same; in `m`: T, F, T, F, T, and `q = 0 ∨ ν_p > 0` gives the same; the old `ν_p > 0` gave F at `0` | holds | repaired |
| Brauer correspondent `e_{b'} = Br_D(e_B)` | `S₃`, `p = 2`, `D = ⟨t⟩`; `A₅`, `p = 2`, `D = V₄`; `D = 1`; `D ⊴ G` (`SL(2,3)`, `p = 2`) | `Br(1 + r + r²) = 1`, `Br(r + r²) = 0`. `f_{B₀(A₅)}` coefficients: at `1`, `(1 + 9 + 9 + 25)/60 = 11/15 ≡ 1`; at involutions, `(1 − 3 − 3 + 5)/60 = 0`; so `Br_{V₄}(e_{B₀}) = 1`, the only block of `A₄`. `D = 1`: `Br_1 = id`, `b' = B`. `N_G(Q₈) = G`, `b' = B`. | agrees with §§6.4 and 9.2 Checks | new convention |
| `ω_χ` is an algebra homomorphism `Z(K[G]) → K` with `O`-values (§6.1) | `S₃` class sums `1, R, T`; `C₃`, `p = 2`, `K = ℚ₂(ζ₃)`; `G = 1` | `R² = 2 + R`: `(−1)² = 1 = 2 − 1` for `std`, `2² = 2 + 2` for `1`. `T² = 3 + 3R`: `9 = 3 + 6` for `1` and `sgn`, `0 = 3 − 3` for `std`. `C₃`: `ζ₃ · ζ₃² = 1 = ω({1}⁺)`; `ζ̄₃ ∈ 𝔽₄ ∖ 𝔽₂`. Without `|𝒞|`: `ω_std(R) = −1/2 ∉ O` | holds; wrong model excluded | Conventions, §6.1, new Check |
| Defect classes (base object) exist and are `p`-regular | `S₃`, `p = 2`, `B₀` and `{std}`; `S₃`, `p = 3` | `a·λ` on `{1}, R, T`: `B₀` `1, 0, 0`; `{std}` `0, 1, 0`; `p = 3` `1, 0, 0`. Selected classes `{1}`, `R`, `{1}` are `p`-regular. Sylow subgroups of the centralisers have orders `2`, `1`, `3`, matching the defect groups | holds | ownership moved to base |
| Glauberman's lemma from complements (§1.2 route) | `Q₈ ⋊ C₃`, `Ω = {−1}`; `C₇ ⋊ C₃` with `C₂` inverting `C₇`, `Ω = cl(c)`; `A₅` on a coset of `H ≤ 𝔽₇⁵`; inner `C₂` on `S₃`; `S = 1` | `M = SL(2,3)`, `M ∩ Q₈ = Q₈`, complement a Sylow 3-subgroup, fixed point `−1`. `cl(c) = c C₇` (7 elements); `S`-fixed points `cl(c) ∩ C₃ = {c}`, one `C₃`-orbit. `M ∩ H = 1`, `M ≅ A₅`, fixed point `3c` with `15c = c`. Inner `C₂`: `gcd(2, 6) ≠ 1`; the class `{r, r²}` is invariant with no fixed point. `S = 1`: trivial | holds where its hypotheses hold | route replaced |
| Conjugacy of complements in `Γ ⋊ A` (§3.1) | `S₃`; `SL(2,3)`; `D₈` (control) | 3 complements of `C₃`, one `C₃`-orbit. 4 complements of `Q₈`; their `Q₈`-orbit has size `8/|N_{Q₈}(C₃)| = 8/2 = 4`. `D₈`: 4 complements of `C₄` in two classes | holds; coprimality needed | supplier replaced |
| Two-series Check (§§4.1, 4.3) | `C₁₅` on `Q₈ × C₁₁` | `gcd(15, 88) = 1`; `3^k mod 11 = 3, 9, 5, 4, 1`. Centralisers: `|C_Γ(C₃)| = 22`, `|C_Γ(C₅)| = 8`, `|C| = 2`. Series 1: `ε = 1` then `ε = −1`. Series 2: `ε = −1` then `ε = 1`. Both end at `χ₂ × 1`. `|Irr_S(Γ)| = 2 = |Irr(C)|` | holds | Check replaced |
| Permutation Check (§1.3) | `1, a, b, ab` on `𝔽₂³` | Fixed vectors `8, 4, 4, 4` (no condition; `v₂ = 0`; `v₃ = 0`; `v₂ + v₃ = 0`). Fixed characters `8, 4, 4, 4` (`w₁ = 0` via the transposes). Common fixed sets `2` and `4`. Burnside `20/4 = 5` on both sides | holds | wording fixed |
| Domination for arbitrary `N ⊴ G` (§7.3) | `S₃`, `N = C₃`, `p = 2`; same with `p = 3`; `S₃ × C₂`, `N = S₃ × 1`, `p = 2`; `N = G`; `N = 1` | Images of the block idempotents: `(1, 0)`; `1 = e₊ + e₋`; `(1, 0)`; the augmentation `(1, 0)`; the identity. Exactly one dominating block in each case. A block dominates none in cases 1 and 3. Case 2 is not a bijection | holds | target generalised |
| `λ_{B̄} ∘ π = λ_B` (§7.3) | `S₃`, `N = C₃`, `p = 2` | On `{1}, R, T`: `λ_{B̄}∘π = 1, aug(2) = 0, aug(3t̄) = 1`; `λ_{B₀} = 1, 2 ≡ 0, 3 ≡ 1` | equal | API bullet |
| Defect groups under domination (§7.3) | `S₃ × C₂`, `p = 2`; `S₃`, `N = C₃`, `p = 3` | `D = ⟨t⟩ × C₂`, `|N : N ∩ D| = 3`, a unit; `DN/N = C₂`, which contains the quotient defect group `C₂`. `|N : N ∩ D| = 1`; `DN/N = 1`, which contains the defect groups `1` | holds | Checks added |
| Covering iff `e_B e_b ≠ 0` (base §8.2 contract) | `S₃`, `N = C₃`, `p = 2`, `k = 𝔽₄`; `N = 1`; `N = G` | `e₁ e_{B₀} = e₁`, `e_α e_{B₀} = 0`, `e_α (r + r²) = e_α`. `N = 1`: `e_B · 1 ≠ 0`. `N = G`: `e_B e_b = δ_{Bb} e_B` | both directions hold | contract text |

## Notes for the maintainer

- **Supplier change.** LocalFiniteGroupTheory is gone. InverseGaloisAndArithmeticFundamentalGroups
  IG.3.4 (*Conjugacy of coprime complements*) replaces it. It is cited at the head of the open
  pull request that adds that roadmap, which comes earlier in the merge order. It is a new roadmap,
  not a revision, so nothing goes under "only an open revision defines".
- **Heading renamed, number kept.** §7.3 is now "Domination modulo a normal subgroup" instead of
  "Defect groups under domination". Nothing on main, in an open roadmap pull request or in another
  board package names this roadmap, so no mapping is needed. No other heading or number moved, and no planned name of this roadmap
  that another roadmap could cite was renamed (plan test names changed only inside 4.1 and 4.3).
- **For the base (no action required here).**
  - The base's `brauer_first_main` (§7.1) is stated over an algebraically closed field, while its
    §6.2 bullet gives the same bijection over the residue field. This roadmap uses the §6.2 form.
  - Base §8.1 states domination only for normal `p`-subgroups. This roadmap owns the general form
    in §7.3.
- **Ownership against open pull requests.** Checked by object with the roadmap tools for block
  domination modulo a normal subgroup and for Glauberman's fixed-point lemma.
  - Domination: only the base has it, and only for normal `p`-subgroups.
  - Glauberman's lemma: only LocalFiniteGroupTheory has it, and that roadmap may not be a supplier.
    The lemma is therefore proved inside the §1.2 route and is not a separate target.
- **Unchanged.** The supplier gap `gap:clifford-multiplicity-dvd-index` (InductionRestriction
  Layer 7) is unchanged.
