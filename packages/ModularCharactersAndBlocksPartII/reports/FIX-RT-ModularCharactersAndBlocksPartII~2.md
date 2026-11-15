# FIX-RT-ModularCharactersAndBlocksPartII~2

Red-team round 2, reviews `RT-ModularCharactersAndBlocksPartII~2a` and `~2b`, five findings. All
five hold and are repaired; only `packages/ModularCharactersAndBlocksPartII/README.md` changed.
`Suggested.lean`, `metadata.toml`, `sources.toml` and `design/plan.json` are untouched. No finding
overlaps another.

## RT-ModularCharactersAndBlocksPartII~2a/F01 (P3) — applied

Supplier contract "From Mathlib" and the `*Needs:*` line of §4.1: `` `IsSolvable` `` →
`` `Group.IsSolvable` ``. At the pin, `Mathlib/GroupTheory/Solvable.lean:145` declares the class
and line 150 makes `_root_.IsSolvable` a deprecated alias.

Pattern: a scan of all 202 backticked README names against every `@[deprecated]` declaration of
the pinned Mathlib and Tau Ceti finds no other deprecated name.

## RT-ModularCharactersAndBlocksPartII~2a/F02 (P3) — applied

§7.5 Checks: two bullets added that test regularity. `S₄`, `p = 2`: `B₀` is regular with respect
to `V₄` (sizes `6, 8, 6` outside `V₄`) and is `b^G`, but not with respect to `1` (double
transpositions, size `3`). `C₂`, `N = 1`: not regular, and `b^G` is undefined because the
coefficient-at-`1` map is not multiplicative.

Verified (pass table, rows 6–7): the class sizes of `S₄` are `1, 6, 3, 8, 6`; `C_{S₄}(D₈) =
⟨(13)(24)⟩ ≤ V₄`; and `λ_b((𝒞 ∩ V₄)⁺)` equals `λ_{B₀}(𝒞⁺)` on every class. Both new bullets agree
with the equivalence and the criterion stated in §7.5.

## RT-ModularCharactersAndBlocksPartII~2a/F03 (P3) — applied

Dependencies: Layer 3 + Mathlib semidirect products and cyclic groups, Tau Ceti Galois action;
Layer 4 + solvable groups, Tau Ceti character counts; Layer 7 "Clifford theory" → "Clifford theory
and induced class functions". Pattern: Layer 1 + conjugacy classes, `Subgroup.IsComplement'`;
Layer 2 + inertia, semidirect products, determinants, integrality of character values; Layer 6 +
`padicValNat`.

Method: I extracted all 35 `*Needs:*` lines and matched each item against its layer's
Dependencies paragraph. Layers 5, 8 and 9 were already complete. After the edit, every
`*Needs:*` item of every layer falls under its layer's Dependencies.

## RT-ModularCharactersAndBlocksPartII~2b/F01 (P2) — applied

§4.2 route: "last step §3.4 (b) for `S_{m−1}`" → induction through the first term `S₁ ⊴ S` of
index `p`. The hypothesis for `S₁` on `Γ` gives `ε₁`; §3.4 (b) with `B = 1` for `S/S₁` on
`C_Γ(S₁)` gives `ε₀`; adding gives `ε = ε₁ε₀`, nonnegative at `λ` by the congruence. The `D₈`
witness is recorded.

The witness holds: in the monomial `D₈` acting on `𝔽₃²`, `⟨diag(1, −1)⟩` is normal in `V₄` but
not in `D₈`, and the swap carries `𝔽₃ × 0` to `0 × 𝔽₃`. The statement of §4.2 (glauberman line 540)
is unchanged, and so is its `*Needs:*` line (§§3.4, 4.1). Pattern: §§4.3, 4.5, 5.1 and 5.2 already
induct through a normal subgroup: the first terms, a normal `T` of prime index, or the compatibility
law with `T ⊴ S`. No other route steps through a non-normal term.

## RT-ModularCharactersAndBlocksPartII~2b/F02 (P3) — applied

§3.4 remark: "for `|A| = 2` `ε'` may differ…" → for even `|A|`, `θ₀` is trivial or of order
`2`, then `ε' = −ε(χ)`; `|A| = 2` admits both, `|A| = 4` can force the second. New Check: `C₄` on
`3^{1+2}_+` with `ε(χ) = 1`, `ε' = −1`, `θ₀(a) = −1`.

The `|A| = 2` Check of §3.4 now computes `ε(χ) = −1` and shows that both choices of `(ε', θ₀)` fit
(a) and (b). Why "can be forced": with `B = 1` and `|A| = 4`, `a² ∈ A ∖ B` and `θ₀(a²) = 1`, so (a)
at `a²` fixes `ε'`. The values are in the pass table, row 3.

## Adversarial pass on the changed text

| # | Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | §3.4 remark, odd `|A|` | `|A| = 3`, `5` | a `θ₀` with `θ₀² = 1` has order dividing `gcd(2, |A|) = 1`, so `θ₀ = 1` | holds | none |
| 2 | §3.4 remark, `|A| = 2`, `B = 1` | `3^{1+2}_+` with `(x, y, z) ↦ (−x, −y, z)`, `χ` faithful of degree 3 | eigenvalues of `inr a` are `±1` with product `1` and `|χ̂(a)| = 1`, so `−1, −1, 1` and `χ̂(a) = −1`; `ε = −1`, `λ = ω`; `(1, θ₀ ≠ 1)`: `(3ω − ω)/2 = ω`; `(−1, 1)`: `(3ω + ω)/2 = 2ω` | both pairs satisfy (a) and (b) | Check rewritten with the values |
| 3 | §3.4 remark, `|A| = 4`; new Check | `C₄` on `3^{1+2}_+` by `(x, y, z) ↦ (−y, x, z − xy)` | automorphism: both sides give third coordinate `z + z' − xy − x'y − x'y'`; square `(−x, −y, z)`; fixed points `Z` for `a`, `a²`, `a³`; `inr a²` has eigenvalues `−1, −1, 1`; `inr a` has `i, −i, 1` (integer trace, determinant 1), so `χ̂(a) = 1`; coset norm `3 · 9 · 1 = 27 = |Γ|`; (a) at `a²` gives `ε' = −1`; at `a`, `θ₀(a) = −1`; at `a³`, `(−1)(−1) = 1 = χ̂(a⁻¹)`; (b): `4ω/4 = ω`, against `2ω/4 = ω/2` for `ε' = 1` | holds; pair forced | Check added |
| 4 | §4.2 route, base and length 1 | `S = 1`; `SL(2,3)` (`S₁ = 1`) | `ε = 1`, quotient `0`; `ε₁ = 1`, `ε₀ = −1`, `(2 sgn + sgn)/3 = sgn`, `ε = −1` | holds | route rewritten |
| 5 | §4.2 route, longer series | `D₈` on `𝔽₃²`, series through `V₄`; `C₄` on `3^{1+2}_+`, `C₄ ⊵ C₂ ⊵ 1` | `D₈`: `C_Γ(V₄) = 0 = C`, `λ = λ₁ = 1`, `ε₀ = 1`; in `V₄`, the `C₂` inverting `𝔽₃ × 0` gives `λ₂ = 1`, quotient `0`. `C₄`: `S/S₁` acts trivially on `C_Γ(a²) = Z = C`, so `λ₁ = ω`, `ε₀ = 1`; the hypothesis gives `(3ω − ω)/2 = ω` with `ε₁ = 1`, so `ε = 1` and the quotient is `ω` | holds; the last term `⟨diag(1, −1)⟩` is not normal in `D₈` | none |
| 6 | §4.2 route, sign of the multiplicity at `λ` | `ε₁ε₀ = 1`; `ε₁ε₀ = −1` at `p = 2`, `3` | `n ≡ 1 (mod p)`, `n ≥ 0`, so `n ≥ 1` and `(n − 1)/p ≥ 0`; `(n + 1)/p ≥ 1/p`, an integer, so `≥ 1` | holds | none |
| 7 | §7.5 Check, `S₄`, `V₄` | classes of `S₄` | sizes `1, 6, 3, 8, 6` (sum `24`); `λ_{B₀}` = size mod 2: `1, 0, 1, 0, 0`; outside `V₄`: `0, 0, 0`, so regular; `|𝒞 ∩ V₄|` mod 2 = `1, 0, 1, 0, 0` = `λ_{B₀}`, so `b^G = B₀`; `C(D₈) = ⟨(13)(24)⟩ ≤ V₄`; with `N = 1` the double transpositions give `1 ≠ 0` | holds; excludes the model "every block is regular" | Check added |
| 8 | §7.5 Check, `C₂`, `N = 1` | `G = ⟨t⟩` | `λ(t) = 1`, so not regular; candidate `t ↦ 0`, `1 ↦ 1`, `0 · 0 ≠ 1`, so `b^G` is undefined; `C_G(D) = C₂ ⊄ 1` is consistent with the sufficient criterion | holds | Check added |
| 9 | Dependencies, Layers 1–9 | the 35 `*Needs:*` lines | each item matched against its layer's paragraph; missing items: L1 `ConjClasses`, `IsComplement'`; L2 `SemidirectProduct`, `LinearMap.det`, `IsIntegral`, `isIntegral_character`, `TauCeti.inertia`; L3 `SemidirectProduct`, `IsCyclic`, `cyclotomicIrreducibleCharacterAction_apply`; L4 `Group.IsSolvable`, `card_irreducibleCharacters`; L6 `padicValNat`; L7 `Subgroup.indClassFun` | complete after the edit | 6 paragraphs |
| 10 | `Group.IsSolvable` | pinned `Solvable.lean` | class at line 145, deprecated root alias at line 150 | holds | 2 occurrences |

## Checks

- **Elaboration.** `lake env lean packages/ModularCharactersAndBlocksPartII/Suggested.lean`, run
  from the content checkout: exit 0, 16 warnings `declaration uses 'sorry'` (the 16 theorems), no
  errors. The three `TauCeti.*` object files were already built.
- **Binders.** One scratch file with `#check @name` for each of the 20 declarations, elaborated
  once. Every elaborated type equals the worker's `signatures.md` after whitespace and namespace
  normalisation (20 of 20 the same). No declaration has a `variable` or `include` binder.
  `Suggested.lean` did not change, so its README statements did not either.
- **Dependency check.** Output of the brief's `gate --depcheck` command:
  `depcheck: 244 roadmaps, 2239 edges, 0 problem(s)`. No UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve packages/ModularCharactersAndBlocksPartII/README.md`: no
  cross-roadmap citation and no Lean name found nowhere. The four names the worker listed
  (`IsGlaubermanFamily.*`) are declarations of `Suggested.lean`.
- **Form.** No added line is longer than 100 characters (lines 1 and 492 already were). The added
  text has no LaTeX delimiters, process words, pull-request numbers or machine paths.

## For the maintainer

- No name that another roadmap could cite changed: no section, layer or target was renumbered, and
  no Lean declaration was added, renamed or removed.
- No supplier changed and no gap was added. `gap:clifford-multiplicity-dvd-index` is unchanged in
  `design/plan.json` and in the README.
- Ownership: no new construction was introduced (only a route, a remark, Checks and Dependencies
  lists), so no ownership question arises against main, the board packages or the open pull
  requests.
- No sources were fetched and `needs-references.toml` was not created.
- No suspicious instruction was found in the reviews.
- Both reviews' "Source issues" note that glauberman's proof of Theorem 4 (a) (line 546) applies
  its induction hypothesis to the last term of the series. The README route no longer takes that
  step; the locator of the statement, glauberman line 540, is still correct.
