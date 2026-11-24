# Review of EtaleCohomologyFoundations (pull request #3027 at 7e87b98)

**Verdict:** accepted

**Summary.** Accepted. This is an incremental re-review of the 58 lines changed since `477bb48`. The head repairs all five points of the previous review. §§F.2.5a and F.10.4a are now stated over every algebraically closed field. The Illusie–Zheng locator now separates the theorem from the formulas in its proof. The torsor and quotient steps of both routes cite the pinned Tau Ceti declarations and SGA 1 V 2.3 and 2.6 instead of Mumford. The pull request's description and the list of consumers now match the head. No new finding, small correction or format note. One fact about the sources of §F.2.5a is left for the human reviewers.

## Previous findings

- R01 — repaired: "Let `k` be an algebraically closed field of characteristic exponent `p`" now opens both §F.2.5a (line 1704) and §F.10.4a (lines 2232–2233). Dudas–Michel stays as the locator of the `𝔽̄_q` case, and the section adds "the route below does not use the finite field".
- C01 — repaired: "Theorem 3.2 (b), for `RΓc(X, ℤ_ℓ)` over `ℤ_ℓ[Γ]`, over an algebraically closed field and for separated algebraic spaces of finite type; its proof gives (3.2.1)–(3.2.2) for `RΓ` and says … that the case of `RΓc` is analogous" (lines 2240–2244).
- C02 — repaired: the routes, the *Needs:* lines and the Tau Ceti row of the supplier table name `isFinite_projection_of_finiteType`, `exists_comp_specComap_eq`, `isFinite_projection_of_free`, `etale_projection` and `isPullback_of_free` (lines 1721–1729, 2247–2251, 2268–2271).
- C03 — repaired: the description now reads "in EtaleCohomologyFoundations §F.2.5a over every algebraically closed field, with the proof in the section, and §F.10.4a for quasi-projective schemes rather than separated algebraic spaces of finite type".
- N01 — repaired: the consumer list (line 2315) adds EtaleDualityAndPerverseSheaves, ReductiveGroups and FiniteReductiveGroups, and a new bullet (line 2323) names §7.6, 3.2, 4.1 and Layer 9F.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §F.2.5a existence, any algebraically closed `k` | `k = ℂ`, `𝔾_m`, `x ↦ −x` | `ℂ[x^{±1}]^{μ₂} = ℂ[x^{±2}]`, so `X/Γ = 𝔾_m` via `x ↦ x²`; finite of degree 2 | holds in characteristic 0 | none |
| §F.2.5a formula, characteristic 0 | `k = ℚ̄`, `𝔾_m`, `x ↦ x⁻¹` | `H¹_c = ℚ̄_ℓ²/diagonal`, swap acts by `−1`; invariants `(0, 0, 1)` = `H_c(𝔸¹)`, `X/Γ = Spec k[x + x⁻¹]` | holds | none |
| §F.2.5a, wild action | characteristic `p`, `ℤ/p` on `𝔸¹` by `x ↦ x + 1` | quotient `𝔸¹` via `t = x^p − x`; `H_c(𝔸¹)^Γ = ℚ̄_ℓ(−1)[−2] = H_c(X/Γ)` | holds with `p ∣ |Γ|` | none |
| §F.2.5a, action with a fixed point | `μ₂` on `𝔸¹` by `x ↦ −x`, `p ≠ 2` | quotient `𝔸¹` via `x²`; `Γ` trivial on `H²_c(𝔸¹)`; both sides `ℚ̄_ℓ(−1)[−2]` | holds | none |
| §F.10.4a over `ℚ̄` (the case R01 raised) | Kummer `μ_ℓ` on `𝔾_m`, `Λ = 𝔽_ℓ` | `RΓc ≃ [𝔽_ℓ[C_ℓ] →(σ−1) 𝔽_ℓ[C_ℓ]]` in degrees 1, 2: `H¹ = 𝔽_ℓ·N`, `H² = 𝔽_ℓ`, dimensions `(0, 1, 1)` | perfect, now covered | none |
| §F.10.4a freeness translation | `μ₂` on `𝔸¹` and on `𝔾_m`, `p ≠ 2` | `𝔸¹`: `g•a − a` generate `(x)` ≠ `(1)`, origin fixed. `𝔾_m`: `−2x` is a unit, so `(1)`, no fixed closed point | the stated equivalence holds both ways | none |
| §F.10.4a derived reduction | `ν = 2`, `μ = 1`, `N = 𝔽_ℓ[Γ]` | `N ⊗_{(ℤ/ℓ²)[Γ]} π_*(ℤ/ℓ²) = π_*𝔽_ℓ` (flat over `Λ[Γ]`), so `RΓc(X, 𝔽_ℓ)` | holds | none |
| §F.10.4a `ℤ_ℓ` reduction via (3.2.2) | `M = Λ[Γ]`, illusie-zheng-odds-and-ends line 813 | `π_*ℤ_ℓ ⊗_{ℤ_ℓ[Γ]} Λ[Γ] = π_*Λ`; `M` is finitely generated over `ℤ_ℓ[Γ]` | holds | none |
| Illusie–Zheng locator | illusie-zheng-odds-and-ends lines 790–818 | 3.1: algebraically closed `k`, separated algebraic space of finite type; 3.2 (b): `RΓc` and `RΓ`; (3.2.1)–(3.2.2) for `RΓ`; `RΓc` "analogous" (line 817) | matches the text | none |
| SGA 1 V 2.3, 2.6 (torsor step) | sga1 lines 3849–3851, 3925–3934 | 2.3: trivial inertia, `X` finite over locally Noetherian `Y`, so étale. 2.6: finite, `Y = X/G`, trivial inertia ⇔ principal covering | supports the step | none |
| SGA 1 V 1.1, 1.8 (quotient) | sga1 lines 3634–3643, 3710–3713 | 1.1: integral, surjective, fibres are orbits, quotient. 1.8: quotient exists iff `X` has a cover by invariant affine opens | supports the existence clause | none |
| Tau Ceti declarations at `2fd255d` | `Quotient/FiniteGroup/Affine.lean` 78, 112; `Free.lean` 46, 54; `Torsor.lean` 94; `Quotient/Affine.lean` 61 | finiteness from `FiniteType R A` with `SMulCommClass G R A`; domain-valued points; `Ideal.span (g•a − a) = ⊤` for free | match the README's descriptions | none |
| Consumer bullet (line 2323) | the citing roadmaps at this head | EtaleDualityAndPerverseSheaves §7.6 lines 7466–7486; FiniteReductiveGroups 3.2 (line 1150 ff.), 4.1 (1295–1308); ReductiveGroups §§9F.4, 9F.8 | holds | none |
| Seeded: §F.3 finiteness (used by §F.10.4a) | `𝔾_m`, `ℙ¹`, `Λ = ℤ/ℓ` | `H_c(𝔾_m)` in degrees 1–2 ⊂ `[0, 2]`; `H²(ℙ¹) ≠ 0` at `2 = 2 dim` | holds; SGA 4½ locator not readable | none |

The rows for the untouched statements (the headline theorems of `Suggested.lean`, the Checks of §§F.2.5a and F.10.4a, §F.4.4) stand as in the previous review, of `477bb48`.

- Source locators checked against the text: 7. They are illusie-zheng-odds-and-ends 3.1, 3.2 (b), (3.2.1) and (3.2.2); sga1 V 1.1, 1.8, 2.3 and 2.6; and dudas-michel-2015 13.6 (i), lines 2636–2643, unchanged.
- Library declarations opened at the pinned Tau Ceti `2fd255d`: six. They are `TauCeti.AffineInvariantQuotient.projection`, `isFinite_projection_of_finiteType`, `exists_comp_specComap_eq`, `isFinite_projection_of_free`, `etale_projection` and `isPullback_of_free`, each with its hypotheses read.
- Cross-roadmap citations resolved: 5 at this head, namely the four consumer sections and SchemeAndStackFoundations §1.17, which is unchanged.
- Record: no heading or layer removed or retitled since the merge base. `Suggested.lean` has not changed since the merge base. Mumford is gone from the text and the references, and no remaining citation uses it.
- Automatic checks: all passed. Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`. Against the merge base, every file the pull request changes lies in one of its own folders.
- Elaboration: `lake env lean` of `Suggested.lean` gave six `declaration uses 'sorry'` warnings and nothing else.
- Seeded sample: two of its targets fall in or under the change. "Free finite group actions on quasi-projective schemes" is §F.10.4a itself, and "Constructible compact-support finiteness and perfectness" (§F.3) is used by §F.10.4a's route. Both were checked. The rest lie in untouched text.
- Overlap check: the review read ClassicalAdicEtaleCohomology, EtaleDualityAndPerverseSheaves, LefschetzPencilsAndVanishingCycles and InverseGaloisAndArithmeticFundamentalGroups on main, SchemeAndStackFoundations on main and at its open heads, and SheafTheoreticSmithTheory at its open head. SchemeAndStackFoundations §1.17 owns projective quotients by finite groups, and the pinned Tau Ceti has the affine invariant quotient; both are cited. This roadmap owns the compact-support quotient formula and free-action perfectness. InverseGaloisAndArithmeticFundamentalGroups (line 6461, a route on curves) and SheafTheoreticSmithTheory (Tate localization for `C_p`, a different object) own neither. Nothing else is shared.

Source independence: changed passages only. Six passages were compared with four texts:
- the §F.2.5a locator against dudas-michel-2015 lines 2636–2643 and sga1 lines 3634–3643 and 3710–3713;
- the §F.10.4a locator against illusie-zheng-odds-and-ends lines 790–818;
- the §F.10.4a torsor sentences against sga1 lines 3849–3851 and 3925–3934 and the docstring of Tau Ceti's `Free.lean`;
- the derived-reduction sentences against illusie-zheng-odds-and-ends lines 811–814;
- the parentheticals of the §F.2.5a route, and the quotient entry of the supplier table, against the Tau Ceti docstrings.

The longest run shared with a published source is 3 words ("`RΓc` is analogous"). The freeness condition repeats Tau Ceti's 8-word wording of a condition that can only be written that way, and Tau Ceti is the project's own library. In the changed passages the largest share is sga1, 4 of 8 locators. The arrangement was not compared: no layer was added, removed or reordered.

Research link: the roadmap builds the foundations that Deligne's Weil II (1980) rests on, from SGA 4, SGA 4½ and Bhatt–Scholze (2015). §§F.2.5a and F.10.4a are cohomological inputs of Deligne–Lusztig character theory (Deligne–Lusztig 1976, through EtaleDualityAndPerverseSheaves §7.6), and §F.10.4a is Theorem 3.2 (b) of Illusie–Zheng (2013). This rests on the README's references and illusie-zheng-odds-and-ends lines 796–818.

## Not verifiable

- SGA 4½ [Th. finitude] §§1–2, the locator of §F.3's finiteness, which §F.10.4a uses: it is settled as uncertified and no text is held. The values in the table were computed instead.
- The published version of Illusie–Zheng (Int. Math. Res. Not. 2013) is behind a paywall. The review read arXiv v3, which is the version the README links.

## Source issues

- none

## For the human reviewers

- §F.2.5a's cohomological clause (README lines 1708–1715) is now stated over every algebraically closed field. Its one locator, Dudas–Michel's 2015 lecture notes (dudas-michel-2015, an author's page, not refereed), covers only `𝔽̄_q`. The general case rests on the section's own route.
