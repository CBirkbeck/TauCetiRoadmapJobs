# Review of IgusaVarietiesAndTorsionConcentrationPartII (pull request #2439 at 744b2d9)

**Verdict:** accepted

## Previous findings

- R01 — repaired: "`F = 𝒦 = ℚ(i)` (`F⁺ = ℚ`) with `B = F` is not a Case 2 datum … the ramification condition alone excludes `F⁺ = ℚ` … The converse fails: `F⁺ = ℚ(√5)` and `𝒦 = ℚ(i)` give `F⁺ ≠ ℚ`, but … `2 ∉ Spl_{F/F⁺}`." (README line 216)
- R02 — repaired: "`θ` is the automorphism of `𝒢_n⃗` of EndoscopicTransferAndUnitaryTraceComparison §6.6(d), `θ(λ, g) = (λ^c, λ^c g^♯)` with `g^♯ = Φ_n⃗ ᵗ(g^c)⁻¹ Φ_n⃗⁻¹`." (README line 437)

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result |
|---|---|---|---|
| §8.1 Check: ramification condition excludes `F⁺ = ℚ` | `F = 𝒦 = ℚ(i)`; `F = 𝒦 = ℚ(√−3)` | `2`, resp. `3`, ramifies in `𝒦`, so it is not split in `𝒦/ℚ` and is not in `Spl`. CS17 line 3293 (footnote 27, printed p. 730): (2) implies (1) | true |
| §8.1 Check: converse fails | `F⁺ = ℚ(√5)`, `𝒦 = ℚ(i)` | `x²+x+1` is irreducible over `𝔽₂`, so `2` is inert in `F⁺`; `e_F(2) = 2`, so `(2) ∉ Spl`. `5`: `−1 = 2²` mod 5, so `(√5)` splits and `5 ∈ Spl` | true |
| §8.1 Check: no admissible `ϖ` for `ℚ(√5, i)` | `ϖ₂` on `ℤ₂^×` | `ϖ₂ = η₂` on `ℚ₂^×`, and `η₂(−1) = (−1,−1)₂ = −1`. So `2 ∈ Ram_ℚ(ϖ)` but `2 ∉ Spl`, and the gap's condition `Ram_ℚ(ϖ) ⊂ Spl` cannot hold | true |
| §8.1 Check: `F⁺ ≠ ℚ` in Layer 9's form (supplier §6.15) | `[F⁺:ℚ] = 2`, `Res_{F/ℚ}GL₁`; `F⁺ = ℚ` | Real split centre has rank 2 and the ℚ-split centre rank 1, so the Levi is not cuspidal. For `F⁺ = ℚ`, `(R_{F/ℚ}𝔾_m)^s × G_{N−2s}` is cuspidal | matches citation |
| §9.1 `θ` (supplier §6.6(d)) | `n⃗ = (1)`, `Φ₁ = 1` | `θ(λ,g) = (λ^c, λ^c/g^c)`. Fixed points: `λ ∈ ℚ^×` and `g g^c = λ`, which is `G_(1)(ℚ)` | true |
| §9.1 `θ² = id` | `n⃗ = (2)`, `Φ₂ = [[0,1],[−1,0]]`, `g = diag(2,3)` | `g^♯ = diag(1/3, 1/2)` and `g^♯♯ = diag(2,3)`. In general `ᵗΦ_m = (−1)^{m+1}Φ_m`, so `g^♯♯ = DgD⁻¹` with `D` central in `GL_n⃗` | true |
| §9.1 wrong model (CS17 line 3535, no inverse) | `g, h ∈ GL₂` not commuting | `(gh)^♯ = Φ ᵗh^c ᵗg^c Φ⁻¹ = h^♯g^♯`: an anti-homomorphism, so it is not an automorphism. The head uses the inverse | excluded |

The rows for the statements the diff leaves untouched stand as in the previous review, of `b96db01`.

- Source locators checked against the text: 3, all in CS17. Line 3262–3266 gives the definition of `Spl_{F/F⁺}` and conditions (1)–(3), line 3293 is footnote 27 on printed p. 730, and line 3535 is `θ` on printed p. 736. No library declaration is touched by the diff, so none was opened.
- Cross-roadmap citations resolved: 4 sections of EndoscopicTransferAndUnitaryTraceComparison at its open head `1af544e`. §1.8 defines `Φ_n⃗ = diag(Φ_{n_i})`, §6.3 defines `Ram_ℚ(ϖ)`, §6.6(d) gives the formula for `θ` as the README cites it, and §6.15 assumes `[F⁺:ℚ] ≥ 2`. No supplier is added or dropped.
- Gate at 744b2d9: every check passed (`OK`). Depcheck: `depcheck: 256 roadmaps, 2433 edges, 0 problem(s)`. Nothing changes outside the roadmap folder.
- Elaboration of `Suggested.lean`: two `sorry` warnings (lines 83 and 98) and nothing else. The diff touches only README.md, so the `#check @` comparison of the 4 declarations stands as in the previous review.
- Declared gaps: the same 3 slugs appear in `design/plan.json` and in the README. The new Check's use of gap:auxiliary-character-finite-avoidance agrees with its needs sentence at README line 91.
- Pull request text: the title and description were read against this head. No sentence is contradicted. The repair removes or renumbers no section, headline, declaration or supplier.
- Overlap check: read EndoscopicTransferAndUnitaryTraceComparison (§§1.8, 6.3, 6.6, 6.15). It owns `θ`, which §9.1 now cites instead of restating. IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, TorsionCohomologyInfrastructure, PotentialAutomorphyInfrastructure and ArithmeticLocallySymmetricSpaces: the diff changes no ownership, and their owners stand as in the previous review. `overlaps.md` lists no dropped ids.
- Source independence: changed passages only. 2 passages were compared with 1 source (CS17 lines 3262–3293 and 3535) and with the supplier's §6.6(d). Nothing is shared beyond the formula for `θ`, which the mathematics forces. Largest share: CS17, 128 of 160 locators at `b96db01`, and the diff adds one CS17 locator. The diff adds, removes and reorders no layer, so the arrangement was not compared again.

## Not verifiable

- none

## Source issues

- **Misprint** in CS17 at §5.3, printed p. 736: the source writes `g^♯` as `Φ_n⃗ ᵗg^c Φ_n⃗⁻¹`, without an inverse, which reverses products; it should be `Φ_n⃗ ᵗ(g^c)⁻¹ Φ_n⃗⁻¹`, as in [Shin11] p. 1676; affects nothing.

## For the human reviewers

- none
