# Review of UniformWildKernelBounds (pull request #2892 at dbea552)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** accepted

**Summary.** Accepted: no finding remains. The one finding of the previous review is settled in substance: the Hilbert modular forms of 3.22(e)–(h) are now the forms of GL2AutomorphicRepresentationsAndTransfer R16.1.6, the coefficient formula is cited to its owners, and the route of 3.22(g) names the finite free module on which the Deligne–Serre lemma acts; the central-character dictionary, the action on constant terms and the hypotheses of the lemma were recomputed and hold. There are two small corrections (the comparison with the classical forms in degree at least two has no owner, and the description still names a supplier the head no longer cites) and one format note, none blocking. The scope and licence questions about [FormalProof] remain for the human reviewers.

## C01 — For `[F : ℚ] ≥ 2` the dictionary of 3.22 rests on a comparison that no supplier and no target states, so the two facts the route of (g) takes from NoncommutativeAndEquivariantIwasawa §F.5 are not supplied there

An implementer of the route of (g) over a field of degree at least two finds, for the determination of a form by its coefficients (line 2491) and for the coefficient formula in weight `k + 1` (line 2341), a citation "through the dictionary", and the dictionary says of its own comparison that it "is the usual one and is not given here" (line 2352). GL2AutomorphicRepresentationsAndTransfer R16.1.6 gives, for every number field, the restriction to the components `Γᵢ\GL₂(F_∞)`, but the passage to holomorphic functions on the product of half-planes with the normalized ideal coefficients is written there over `ℚ` only. The statement (g) is not affected: it is a theorem of [FormalProof], cited by declaration, and the README says openly that the comparison is not given.

Either of two changes closes it. State the comparison as a statement of the conventions (its map, and that it carries `c(𝔪)` and `c₀(y)` to the normalized ideal coefficients and standard constants of §F.5). Or drop the detour in degree at least two and say that both facts come from the adelic expansion directly, as the text already does in weight one: the forms are holomorphic, and `GL₂(𝔸_F^∞) = ⊔ GL₂(F)⁺·diag(yᵢ, 1)·K₁(𝔫)` over the narrow class group because `det K₁(𝔫) = 𝒪̂_F^×`, so the expansions at the `diag(y, 1)` determine `φ`; and the coset computation that gives the action on constant terms (line 2493) gives the coefficient formula in every weight.

## C02 — The description names HilbertModularForms as the owner of the comparison in degree at least two and as a supplier that merges first, and the README at this head does not cite that roadmap

A reader of the description would look in the README for HilbertModularForms §§2.7, 6.2 and find neither. The description says "of HilbertModularForms §6.2 over fields of degree at least two; in HilbertModularForms §2.7 they are the space of the character `ω⁻¹`", and, under Dependencies, "HilbertModularForms among them, merge first". At this head the comparison "is the usual one and is not given here" (line 2352) and HilbertModularForms occurs nowhere in the README.

Text that would be right: "…through the classical–adelic comparison of R16.1.6 over `ℚ`; over fields of degree at least two the comparison is not given", without the clause on §2.7, and "Sub-roadmaps of the family that are still in open pull requests merge first". The description also leaves unstated two suppliers the head adds for the route of (g): ArithmeticLocallySymmetricSpaces ALS.F.6(i) and the Conventions of ModularForms.

## N01 — The coefficient formula over `ℚ` is cited to "the Conventions of ModularForms" (line 2341 and the contract at line 4142). Those Conventions fix the normalisation (`T_p = U_p` at `p | N`, `χ(p) = 0` at bad primes, `a(m/p) = 0` unless `p | m`) and the recurrence, but do not display the formula; it is in the pinned Tau Ceti as `HeckeRing.GL2.qExpansion_coeff_heckeRingHomCharSpace_heckeTGeneratorGamma0_of_not_dvd` and the theorem after it (`TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime/Power.lean`, line 84). Naming it beside the Conventions would give the reader the statement.

## Questions for the author

- Carried, the text being unchanged: in the Check of 4.3 and the Example that follows it, is `diag(Ψ′, 1, Ψ′⁻¹)`, `Ψ′ = ψχ_ℓ^{−28}`, a point of the ring `R_ℓ = 𝔘/P` of 4.1 at `ℓ = 29`? What stopped the check: 4.1 (local chart)(ii) characterises only the points that reduce to the diagonal lift over a finite local algebra, and this point does not.
- Carried: in 3.15(c₀) the point `ρ` is asked to satisfy (N1); the declaration cited (`UpperTheory.V.Pa.b1abs`) has no hypothesis by that name. Is (N1) part of what a normalized point of a frame is there? The structure of normalized points was not opened.

## Deferred findings

- D01 — resolved: the family index, line 10, now reads "The results that the family states are those of the formal Lean proof".

## Previous findings

- R01 — partly repaired: "an automorphic form `φ` on `GL₂(𝔸_F)` of the space of GL2AutomorphicRepresentationsAndTransfer R16.1.6 with `K_f = K₁(𝔫)` and central character `ω`"; the module `M` is named (line 2489). The comparison in degree at least two is unowned: C01.
- C01 — partly repaired: the description has the new list of unrouted statements and the suppliers of 3.22(d₂), (f); it now names HilbertModularForms, which the head does not cite: C02.
- N01 — repaired: "are stated as targets in Layers 1–7" (line 4195); the index sentence was deferred (D01) and is changed.
- N02 — repaired: "The same definition gives `Ш¹(F, ℓ, e)` for every integer `e`, and 1.1 uses it for every `e ≠ 0`" (line 94).
- N03 — repaired: "`AV/` abbreviates its directory `Development/AutomorphicArithmetic/AutomorphicVarieties/`".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| 3.22 dictionary over `ℚ`: `ω(p) = χ(p)`, `ω = χ⁻¹` on finite units | `ϖ_p = p·(p⁻¹ away from p)`; `ω` trivial on `ℚ^×`, `ℝ_{>0}` | `ω(ϖ_p) = χ⁻¹(p⁻¹) = χ(p)`; agrees with R16.1.6 ("`χ⁻¹` on finite units") | holds |
| 3.22 dictionary: `f_𝔟|γ = ω_𝔫(d)⁻¹f_𝔟` | `F = ℚ`, `𝔫 = N` | `ω_N(d)⁻¹ = (χ⁻¹(d))⁻¹ = χ(d)`, the classical law | consistent |
| Hecke operator on Fourier coefficients | `F = ℚ`, weight `k`, `p ∤ N`; `p | N` | `a(pm) + χ(p)p^{k−1}a(m/p)`; `a(pm)`; equals the pinned Tau Ceti theorem and §F.5's transported formula | holds |
| Route of (g): action on constant terms | cosets `(ϖ u; 0 1)`, `(1 0; 0 ϖ)` at `diag(y, 1)`; factor `(Nw)^{k′/2−1}`, `k′ = k + 1` | `Nw·|yϖ|^{k′/2}c₀(yϖ) + ω(w)|yϖ⁻¹|^{k′/2}c₀(yϖ⁻¹)`, normalised: `c₀(yϖ) + ω(w)(Nw)^k c₀(yϖ⁻¹)` | as stated |
| Route of (g): `c₀` depends on the narrow class | `y ↦ yu`, `u ∈ 𝒪̂^×`; `y ↦ ξy`, `ξ ≫ 0` | `diag(u, 1) ∈ K₁(𝔫)`; `∏ξ_v·|ξ|_fin = 1`, so the factor is unchanged | holds |
| Route of (g): `M` finite free | `d = dim` (ALS.F.6(i)); `d` coefficient functionals | `M ↪ O^d`, `O` a discrete valuation ring: finitely generated, torsion free, free | holds |
| Route of (g): hypotheses of Deligne–Serre (§5.10) | product `GH`; `(T − a)GH` | `c(1) ≡ 1`, so `GH ∉ ϖM`; `(Nw)^k ≡ 1` as `(ℓ−1) | k`, `w ∤ ℓ`; coefficients in `ϖO`, quotient in `M` by saturation | eigenvector in `M/ϖM` |
| Route of (g): parity and Hasse lift | weight `k + 1`, `(ℓ − 1) | k`; IntegralIwasawaTheory §9.3 | `k` even, `ω_v(−1) = −1 = (−1)^{k+1}`; `V_w ∈ M_w(1, 1, ℤ_(p))`, `w` divisible by `(p−1)p^{N₀}` | consistent |
| Conventions: `Ш¹(F, ℓ, e)` for every integer `e` | `e < 0`; `e = 0` | `ℚ_ℓ/ℤ_ℓ(−e)` and the local conditions are defined for every integer; 1.1 excludes `e = 0` | consistent with 1.1 |

The rows of the previous review, of `a598d4f`, for the statements this change does not touch stand as written there.

- Seeded sample: none of the fifteen sampled sections lies in the changed passages (Conventions, the conventions and route of 3.22, the Dependencies of Layer 3, Scope, four supplier contracts, References); they stand as verified at `a598d4f`.
- Cross-roadmap citations resolved on main: GL2AutomorphicRepresentationsAndTransfer R16.1.6 (README line 278), NoncommutativeAndEquivariantIwasawa §F.5 (line 2418), ArithmeticLocallySymmetricSpaces ALS.F.6(i) (line 629), AlgebraicModularFormsAndSerreWeights §5.10 (line 1249), IntegralIwasawaTheory §9.3 with its level-one Hasse lift (lines 1278, 1298), ModularForms Conventions (line 89). Each says what the contract assumes of it, with the reservation of N01.
- Library declarations opened at the pin: 1 (`TauCeti/NumberTheory/ModularForms/HeckeSlash/Nebentypus/Prime/Power.lean`, line 84).
- Dependency check: `depcheck: 133 roadmaps, 1502 edges, 0 problem(s)`; no UPWARD or CYCLE line. The roadmap is not yet in the merge order and is placed after its last supplier.
- Automatic checks: all passed. Outside the folder the pull request changes only the family index (`README.md`, `Suggested.lean`, `metadata.toml` of the family), which is its own.
- Elaboration of `Suggested.lean`: no message. It declares nothing (66 lines, `import Mathlib` only, no `set_option`), so there is no signature to compare and no one-tactic probe to run; the headlines 7.3 (with 7.2), 7.4 with 7.6, and 7.5 are named in its docstring as not statable, unchanged.
- No layer, heading or Lean declaration is added, removed or renumbered by the change.

Overlap check: read GL2AutomorphicRepresentationsAndTransfer, NoncommutativeAndEquivariantIwasawa, IntegralIwasawaTheory, ArithmeticLocallySymmetricSpaces, ModularForms (main) and HilbertModularForms (open) for the changed passages; HeckeIdealsAndTaylorWilesRelations, BernoulliBoundsForClassGroupEigenspaces, BaseChangeAndGaloisRepresentationsForUnitaryGroups, CongruenceModulesOfThetaLifts, PotentialAutomorphyInfrastructurePartII, OrdinaryAutomorphicFormsAndModularityLifting stand as read at `a598d4f`. Shared: the adelic carrier of Hilbert modular forms and its finite Hecke action, owned by GL2AutomorphicRepresentationsAndTransfer R16.1.6; the classical forms of parallel weight at least two, their coefficients, lattices and Hecke operators, owned by NoncommutativeAndEquivariantIwasawa §F.5; the Hasse lift, owned by IntegralIwasawaTheory §9.3; each is now cited and none restated. No open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 6 passages compared with the 6 supplier sections they cite, none shared; the change adds no source locator; largest share [FormalProof], 285 of about 295 locators, as at `a598d4f`; the arrangement was not compared again, the change adding, removing and reordering no layer.

Research link: an unconditional substitute for Vandiver-type vanishing of `K_{2e}(𝒪_F){ℓ}` (Soulé 1979, 2003), through Ferrero–Washington (1979), Kato (2004) and residually reducible automorphy lifting (Skinner–Wiles 1999, Thorne 2015, Allen–Newton–Thorne 2020, Newton–Thorne 2023); the "weakening of Vandiver" of the announcement. Rests on the README's Summary and References.

## Not verifiable

- [FormalProof] was not opened again: the change alters no locator into it and no statement taken from it.
- The published theorems named in the References (Kato 2004, Deligne–Serre 1974 and the others) were not opened: none is in the changed text.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an unpublished, unrefereed Lean development announced on 20 November 2026 (README line 4195). No refereed source states the bounds 7.3–7.6.
- Licence: the family index (line 16) records that the repository of [FormalProof] says the proof was published without a license and is mirrored for verification only. The README cites 274 of its declaration names with file paths.
- Licence: 3.15(c₀), (c₀′), 3.20(d₁)–(d₅) and 3.22(b′)–(h) restate declarations of [FormalProof] hypothesis by hypothesis, in prose; whether that is reuse of its expression is for a human to judge.
