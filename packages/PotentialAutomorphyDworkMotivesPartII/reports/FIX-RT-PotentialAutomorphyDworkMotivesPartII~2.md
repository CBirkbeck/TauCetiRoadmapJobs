# FIX-RT-PotentialAutomorphyDworkMotivesPartII~2

Repair of red-team round 2 (passes a and b). Twelve findings, all verified; eleven applied as asked or with a corrected wording, one (2a/F07) applied as a mix of replacement and supplement. No finding is disputed and none is out of scope. Files changed: `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, `Suggested.lean` (module docstring only) and `design/plan.json` (one `gaps[].needs` string).

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F01 (P2) — applied

Verified: `V_B` is over `O = ℤ[1/(2N), ζ_N]`, so `V_B/λV_B = 0` at `λ | 2`. New in §2.3(5): `V_{B,1} = e_χR^{N−2}π̃_*O₁` and `V′_{B,1}`, with `⊗O = V_B` and the comparison with `τ*V_λ` at every prime of `O₁` (API bullet). The `O₁` forms are used at `λ | 2` in §§2.7, 4.1, 4.7, 5.5 and the Conventions. New Check: dimension 0 versus 3.

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F02 (P3) — applied

§5.1 Check: "`h∞` and `h₁` are involutions" became "`h₁` is an involution and `h∞` has order four". The new text proves that `h∞` is a single block: a two-dimensional fixed space would meet the fixed plane of `h₁` in a vector fixed by `h₀⁻¹ = h₁h∞`. So `J³ = 0 ≠ J²` and `h∞² = 1 + J²`. The rank-two dihedral Check in §9.1 is correct (`J² = 0`) and is unchanged.

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F03 (P3) — applied

The Checks in §5.11 and §5.12 used `n = 3`, `l = 7 ≡ 1 (mod N)`, which is impossible since `N > 400`. Both now use `N = 401` and `l = 3209 = 8·401 + 1` (prime: trial division up to 56). The degree and the component count are `3209³(3209² − 1)(3209³ − 1) = 11244954294664821990509324160`. I searched for the same pattern elsewhere and found no other Check with a residue field the datum cannot realise (the §6.6 `𝔽₄₉` Check is about two finite fields only).

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F04 (P3) — applied

§5.10 Check: "repeating the prime above `3` … `1320`" is now "repeating one prime above `11` (where `ζ₅ + ζ₅⁻¹ ↦ 3`) … `11(11² − 1) = 1320`". The Check also notes that the prime above `3` has residue field `𝔽₉` (`X² + X − 1` is irreducible mod 3), so its diagonal has order `720`.

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F05 (P2) — applied

Verified: LocalGaloisDeformationRings §6.19 assumes `p > nm`. §9.6 keeps the inertia description `θ₂^m ⊕ θ₂^{pm}` and irreducibility for all `1 ≤ m ≤ p − 1`; the comparison with `ρ̄_{2,m,0}` now needs `p > 2m`. New Check for `p = 3`, `m = 2`. The §6.19 contract now says "for `p > nm`" and lists each use, every one within that range.

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F06 (P3) — applied

The `Suggested.lean` module docstring now lists among the theorems not statable at the pins Kantor's characteristic-two classification (§0.11(3)). The missing carriers are the exceptional natural representations of cases (T 5) `3·A₆ < SL₃(𝔽₄)` and (T 7) `3·PΩ⁻₆(3) < SL₆(𝔽₄)` (KANTOR79 lines 261–263). No weakened stand-in is stated.

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F07 (P3) — applied differently

§2.5: the first Check only restated the API and is replaced. New Checks: the projector `½[[I, I], [I, I]]` (`S² = 2S` without `½`), the residue fields `𝔽₉` and `𝔽₈₁` at `λ | 3`, and the twist `11³·11⁻² = 11`. §7.1: the restating Checks are replaced by computed ones: Qian grades `198–200` and `201–199`, `gr²` of rank two, and `dim_E V = 3` against `dim_{ℚ_l} D_dR = 6`.

## RT-PotentialAutomorphyDworkMotivesPartII~2a/F08 (P2) — applied

Verified: EtaleDualityAndPerverseSheaves §4.3(a) requires `0 ≤ q ≤ 2m`. Clause (a) now has that range and generation by `h^{q/2}` for `q < m`. Vanishing for `q > 2m` is attributed to EtaleCohomologyFoundations §F.3.0, with the example of a line in `ℙ²`. §F.3.0 is added to that supplier's contract, the scope list and the *Needs:* of §§6.1 and 6.8. The scope wording and §6.8's sentence are corrected the same way.

## RT-PotentialAutomorphyDworkMotivesPartII~2b/F01 (P2) — applied

Confirmed at the Tau Ceti pin: `ker_projective_toPermHom` (Symplectic/Projective.lean:66), `mem_center_iff` (Center.lean:112), the pretransitivity instance (Transitivity.lean:83), `projectiveSymplecticEquivGroup` (TypeB/Two.lean:124), `Matrix.unitaryTransvection` and `unitaryTransvectionHom`. These are now cited in scope, in the Tau Ceti and CFSGBasicProperties contracts and in §0.9. Only primitivity for `Sp₄(𝔽₃)` is proved here; odd `q ≥ 5` is imported through `B₂(q)`.

## RT-PotentialAutomorphyDworkMotivesPartII~2b/F02 (P2) — applied

Verified against BLGGT14 lines 1951–1983, which take `F′ ⊇ F(ζ_N)⁺`. §9.4 now reads "`F′ ⊇ K`, Galois over `F₀`, linearly disjoint from `L` over `K`". Taking `L ⊇ F^avoid K` gives disjointness from `F^avoid` over `F`, by `NumberField.finrank_eq_one_of_unramified`, PotentialModularityAndCompatibleSystems §2.14 and a degree count; both are added to *Needs:*. New negative-control Check: `N = 5`, `l = 11`.

## RT-PotentialAutomorphyDworkMotivesPartII~2b/F03 (P2) — applied

Verified: §7.12 consumes only DK17 Theorem 1.1.5; Theorem 2.2.3 is used only inside the supplier's own proof (DK17 lines 124–126). The clause "together with the full faithfulness … Theorem 2.2.3, p. 6" was deleted from the README contract line `gap:slopes-of-indecomposable-convergent-isocrystals` and from the same `needs` in `design/plan.json`. The remark in §7.12's proof sketch is kept.

## RT-PotentialAutomorphyDworkMotivesPartII~2b/F04 (P3) — applied

DK17 §5 starts at line 540 (p. 11) and ends at line 654, after the `=== page 13 ===` marker at line 609. §7.12's locator "proof in §5, pp. 11–12" became "pp. 11–13".

## Checks run

- **Elaboration.** `lake env lean packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean` (from the content checkout) gives seven `declaration uses 'sorry'` warnings, at lines 78, 107, 162, 181, 201, 220 and 255, and no errors.
- **Signatures.** I elaborated `#check @name` for all twelve declarations in one scratch file and compared each type with its README section. Only the module docstring changed, and no type differs from the supplied signatures. No binder was lost.
- **Dependency check.** Exact output: `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`. There are no UPWARD, CYCLE or `moved:` lines.
- **Citations.** `roadmaps resolve` reports no cross-roadmap citations and no Lean names found nowhere.

## Adversarial pass on changed statements

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.9(3), `m = 2` | `q = 3`; `q = 5` | `B₂(3)` invalid, order `25920`; `B₂(5)` valid, `#PSp₄(𝔽₅) = 625·24·624/2 = 4680000` | import for odd `q ≥ 5`; Iwasawa for `q = 3` (faithful quotient, transitive, primitive, `Nontrivial` instance at the pin) |
| Centre via `mem_center_iff` | odd char.; char. 2 | `c² = 1` gives `c = ±1`; in char. 2, `c = 1` | `{±1}` claimed only in odd characteristic |
| Unitary transvection vs Conventions | Gram `A = Q` | `σ(v)ᵀQx = v†Qx = ⟨x, v⟩` | same map |
| §9.4 disjointness | `F = ℚ`, `N = 5`; general | `ℚ(ζ_N) ∩ F^avoid` unramified everywhere, so `= ℚ`; `[F′F^avoid : F′] = [KF^avoid : K] = [F^avoid : F]` | holds |
| §2.3(5) `V_{B,1}` | `λ | 2`, `(401, 3)` | `V_B/λ = 0`; `V_{B,1}/λ` has dimension 3; `#H₀ = 401^{399}` odd | holds |
| §5.1 Check | `n = 3`, char. 2 | `J³ = 0 ≠ J²`, `h∞² = 1 + J²`, `h∞⁴ = 1`; `h₁² = 1` | order 4 / 2 |
| §§5.11–5.12 Checks | `N = 401`, `l = 3209` | `3209 = 8·401 + 1`, prime; `≈ 1.12·10²⁸` | realisable |
| §5.10 Check | `N = 5`, primes above 11 and 3 | roots 3, 7 mod 11; `#SL₂(𝔽₁₁) = 1320`, `#SL₂(𝔽₉) = 720` | corrected |
| §9.6 | `p = 3, m = 2`; `p = 5, m = 1` | exponents `{6, 2}` mod 8, distinct; `p > 2m` holds for `m = 1` | inertia holds on the full range, model only for `p > 2m` |
| §2.5 projector | `N = 5`, `n = 2` | `(½S)² = ½S` since `S² = 2S`; rank 2 (4 without `ς`) | holds |
| §2.5 residue field | `λ | 3` | disc `5 ≡ 2` is a non-square mod 3, so `𝔽₉`; order of 3 mod 5 is 4, so `𝔽₈₁`; `5 ∤ 8` | holds |
| §2.5 twist | `q = 11` | `11³·11⁻² = 11` on `O⁺(−1)` | holds |
| §7.1 grades | `(401, 3)`, `σ = id, c` | `80601 − 806 + 4 = 79799 = 401·199`; `80200`; `80601`; complements `201, 200, 199` | holds |
| §7.1 dimension | `E = ℚ₃₂₀₉`, `[K : E] = 2` | `3/2 ∉ ℕ`; `dim D_dR = 3` over `K`, 6 over `ℚ_l` | holds |
| Contract (a) | line in `ℙ²`, `q = 4` | `H⁴ = 0` | the range now excludes it |

## Ownership and sources

- **Ownership.** No new object is introduced beyond the `O₁`-forms of this roadmap's own Betti local systems. No supplier target was invented. `VanishingCycles.etaleCohomologicalDimension` is EtaleCohomologyFoundations §F.3.0 on main.
- **Sources.** No new source key was added and `needs-references.toml` was not written. The `sources.toml` locator of DK17 does not list Theorem 2.2.3, so it needs no change.

## For the maintainer

- No Lean name changed.
- Other roadmaps' citations of this one are unaffected: no section was renumbered.
- The `gap:slopes-of-indecomposable-convergent-isocrystals` requirement on PadicDifferentialEquationsAndRigidCohomology is narrower: Theorem 1.1.5 only.
