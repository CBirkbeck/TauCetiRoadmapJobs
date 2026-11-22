# Review of UniformWildKernelBounds (pull request #2892 at bb1b42e)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** accepted

**Summary.** Accepted: no finding. The two small corrections of the previous review are repaired: the coefficient formula and the determination of a form by its constant terms and Fourier coefficients are now derived from the adelic expansion in every degree and weight, with strong approximation for `SL₂` cited to AdelicAlgebraicGroups §4.2, and both computations were redone and hold; the description of the pull request was read against this head sentence by sentence and agrees with it. One format note is carried, not blocking. The scope and licence questions about [FormalProof] remain for the human reviewers.

## N01 — The coefficient formula over `ℚ` is still cited to "the Conventions of ModularForms" alone (line 2343)

Carried from the previous review. Those Conventions fix the normalisation and the recurrence but do not display the formula `a(pm) + χ(p)p^{k−1}a(m/p)`; the pinned Tau Ceti states it as `HeckeRing.GL2.qExpansion_coeff_heckeRingHomCharSpace_heckeTGeneratorGamma0_of_not_dvd` and the theorem after it (`TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime/Power.lean`, line 84). Naming it beside the Conventions would give the reader the statement.

## Questions for the author

- Carried, the text being unchanged: in the Check of 4.3 and the Example that follows it, is `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`, a point of the ring `R_ℓ = 𝔘/P` of 4.1 at `ℓ = 29`? What stopped the check: 4.1 (local chart)(ii) characterises only the points that reduce to the diagonal lift over a finite local algebra, and this point does not.
- Carried: in 3.15(c₀) the point `ρ` is asked to satisfy (N1); the declaration cited (`UpperTheory.V.Pa.b1abs`) has no hypothesis by that name. Is (N1) part of what a normalized point of a frame is there? The structure of normalized points was not opened.

## Previous findings

The previous report had no finding (R); its small corrections and format note are accounted for.

- C01 — repaired: "in every weight, by translating the expansion on the right by the representatives `(ϖ_w b; 0 1)`" (line 2340) and "by strong approximation for `SL₂` (AdelicAlgebraicGroups §4.2), as `det K₁(𝔫) = 𝒪̂_F^×`" (line 2494); §F.5 is now cited for the dictionary only.
- C02 — repaired: the description reads "over fields of degree at least two that comparison is not given", no longer names HilbertModularForms, and names ArithmeticLocallySymmetricSpaces ALS.F.6(i), the Conventions of ModularForms and AdelicAlgebraicGroups §4.2.
- N01 — not repaired: "for `F = ℚ` and `k ≥ 2` this is the coefficient formula of the Conventions of ModularForms, through the dictionary below" (line 2342). Written again as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.22 conventions: Hecke action on Fourier coefficients, from the adelic expansion | cosets `(ϖ b; 0 1)`, `b mod ϖ`; weight `k`; `𝔪 = ξy𝔡` | `(1 yb; 0 1)` contributes `Σ_b ψ_w(ξyb) = Nw` or `0`; `Nw·(Nw)^{−k/2}·(Nw)^{k/2−1}c(w𝔪) = c(w𝔪)` | as stated |
| Same, second term, `w ∤ 𝔫` | `diag(1, ϖ) = ϖ·diag(ϖ⁻¹, 1)` | `ω(w)·|yϖ⁻¹|^{k/2}` gives `ω(w)(Nw)^{k/2}·(Nw)^{k/2−1}c(𝔪/w) = ω(w)(Nw)^{k−1}c(𝔪/w)` | as stated |
| Same: `ω(w)` is defined when `w ∤ 𝔫` | scalar `u ∈ 𝒪_w^×` | `u·1 ∈ K₁(𝔫)` at `w ∤ 𝔫`, so `ω_w(u) = 1`: unramified | holds |
| Same at `w | 𝔫` | `K₁(𝔫)diag(ϖ, 1)K₁(𝔫)` | only the `Nw` cosets `(ϖ b; 0 1)`; `diag(1, ϖ)` absent; result `c(w𝔪)` | second term omitted, as stated |
| Same, `F = ℚ`, `k ≥ 2`, `p ∤ N` | `ω(p) = χ(p)` (dictionary) | `a(pm) + χ(p)p^{k−1}a(m/p)`; equals the pinned Tau Ceti theorem at `Prime/Power.lean` line 84 | agrees |
| Route of (g): `GL₂(𝔸_F) = ⊔ᵢ GL₂(F)·GL₂(F_∞)⁺·diag(yᵢ, 1)·K₁(𝔫)` | `det g = α·t_∞·yᵢ·u`; `s = diag(α, 1)⁻¹g_f·diag(u, 1)⁻¹diag(yᵢ, 1)⁻¹` | `det s = 1`; `s ∈ SL₂(F)·U`, `U = diag(yᵢ, 1)(K₁ ∩ SL₂)diag(yᵢ, 1)⁻¹` open; `diag(u, 1) ∈ K₁(𝔫)`; classes separated by `det` | holds |
| Route of (g): index set is the narrow class group | `det` of `GL₂(F)·GL₂(F_∞)⁺·K₁(𝔫)` | `F^×·F_∞^{×,+}·𝒪̂_F^×`; quotient of `𝔸_F^×` is the narrow class group | holds |
| Route of (g): expansion at `diag(y, 1)` determines `φ` on `GL₂(F_∞)⁺diag(y, 1)` | `GL₂(ℝ)⁺ = N·A·Z⁺·SO(2)` at each real place | `N·A`: the expansion; `Z⁺`: `ω`; `SO(2)`: `(E₁₂ − E₂₁)φ = ikφ` on a connected group | holds |
| Contract for AdelicAlgebraicGroups §4.2 | `G = SL₂`, `S` archimedean | simply connected, absolutely almost simple, `SL₂(F_∞)` noncompact: sufficiency applies; §4.2 gives `G(𝔸_F^S) = G(F)U` for open `U` | supplied as cited |
| Route of (g): action on constant terms, weight `k + 1` | same cosets | `Nw·(Nw)^{−(k+1)/2}(Nw)^{(k+1)/2−1} = 1`; `(Nw)^{(k+1)/2}(Nw)^{(k+1)/2−1} = (Nw)^k` | `c₀(yϖ) + ω(w)(Nw)^kc₀(yϖ⁻¹)`, as stated |

The rows of the previous reviews for the statements this change does not touch stand as in the previous review, of `dbea552`.

- Seeded sample: of the fifteen sampled sections only 3.22 lies in the changed passages; the change adds no source locator there, and its one new supplier citation (AdelicAlgebraicGroups §4.2) was read on main. The other fourteen stand as verified earlier.
- Cross-roadmap citations resolved on main: AdelicAlgebraicGroups §4.2 (README lines 3813–3823, the definition and `G(𝔸_F^S) = G(F)U`; lines 4073–4076, sufficiency; Check at line 3837 for `SL_n` over every number field). All 36 roadmaps with a supplier contract outside the family are on main (three of them among the completed roadmaps).
- Library declarations opened at the pin: none new; the declaration of N01 stands as opened at `dbea552`.
- Dependency check: `depcheck: 133 roadmaps, 1503 edges, 0 problem(s)`; no UPWARD or CYCLE line. AdelicAlgebraicGroups is on main and earlier in the merge order.
- Automatic checks: all passed. Outside the folder the pull request changes only the family index (`README.md`, `Suggested.lean`, `metadata.toml` of the family), which is its own; since `dbea552` only this README changed.
- Elaboration of `Suggested.lean`: no message. It declares nothing (66 lines, `import Mathlib` only, no `set_option`), so there is no signature to compare and no one-tactic probe to run; the headlines 7.3 (with 7.2), 7.4 with 7.6, and 7.5 are named in its docstring as not statable, unchanged.
- The pull request's text: title and description read against the head. Checked and found as described: a new roadmap (4330 lines added, none removed); the headlines 7.3–7.6 and the layer guide; 5.1 through ExplicitNumberFields §§0.3, 5.3 (lines 3485–3488); the list of statements without a route (equal to the README's Summary); the Hilbert modular paragraph (lines 2340–2343, 2351–2353, 2491–2496); the suppliers of 3.22(d₂), (f); the docstring of `Suggested.lean`; the family index among the changed files. That the aggregate pull request carries this folder was confirmed from the list of open pull requests.
- No layer, heading or Lean declaration is added, removed or renumbered by the change; one supplier (AdelicAlgebraicGroups) is added, with its contract, its entry in the Dependencies of Layer 3 and in the `*Needs:*` line of 3.22, and the description states it.

Overlap check: read AdelicAlgebraicGroups (main) for the changed passages; HeckeIdealsAndTaylorWilesRelations, BernoulliBoundsForClassGroupEigenspaces, BaseChangeAndGaloisRepresentationsForUnitaryGroups, CongruenceModulesOfThetaLifts, PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLifting stand as read earlier. Shared: strong approximation, owned by AdelicAlgebraicGroups §4.2 and cited, not restated; the adelic carrier of Hilbert modular forms (GL2AutomorphicRepresentationsAndTransfer R16.1.6) and the classical forms (NoncommutativeAndEquivariantIwasawa §F.5), as before. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 4 passages compared with the 1 supplier section they newly cite, none shared; the change adds no source locator; largest share [FormalProof], 285 of about 295 locators, as found earlier; the arrangement was not compared again, the change adding, removing and reordering no layer.

Research link: an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}` (Soulé 1979, 2003), through Ferrero–Washington (1979), Kato (2004) and residually reducible automorphy lifting (Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020, Newton–Thorne 2023); the "weakening of Vandiver" of the announcement. Rests on the README's Summary and References.

## Not verifiable

- [FormalProof] was not opened again: the change alters no locator into it and no statement taken from it.
- The published theorems named in the References (Kato 2004, Deligne–Serre 1974 and the others) were not opened: none is in the changed text.
- The description's sentence that the aggregate pull request "takes its revisions from this pull request" describes a process between two pull requests and cannot be read from this head.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed Lean development announced on 20 November 2026 (README, References). No refereed source states the bounds 7.3–7.6.
- Licence: the family index (line 16) records that the repository of [FormalProof] says the proof was published without a license and is mirrored for verification only. The README cites 274 of its declaration names with file paths.
- Licence: 3.15(c₀), (c₀′), 3.20(d₁)–(d₅) and 3.22(b′)–(h) restate declarations of [FormalProof] hypothesis by hypothesis, in prose; whether that is reuse of its expression is for a human to judge.
