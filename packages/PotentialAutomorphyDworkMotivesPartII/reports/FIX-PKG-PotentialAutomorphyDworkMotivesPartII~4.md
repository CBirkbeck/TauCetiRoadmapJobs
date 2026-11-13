# FIX-PKG-PotentialAutomorphyDworkMotivesPartII~4

Repair round for the review REV-PKG-PotentialAutomorphyDworkMotivesPartII~3 (findings F01–F09). All nine findings were verified against the cited sources, the supplier roadmaps and the pins, and all nine were applied. Files edited: `packages/PotentialAutomorphyDworkMotivesPartII/README.md`, `packages/PotentialAutomorphyDworkMotivesPartII/sources.toml` (new entry DICKSON01), `packages/PotentialAutomorphyDworkMotivesPartII/design/plan.json` (top-level `gaps` only: the `needs` of `curve-crystalline-companions`). `Suggested.lean` and `metadata.toml` are unchanged: no finding touches a Lean statement.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F01 (P2) — applied

Verified. BLGGT14 line 2828 asks for a member at every prime of `M`. BCGNT25 line 2006 defines `V_λ` for every `λ`. ModularityAndLanglandsExtensions §2.9 covers only `λ ∤ N`.

Change: the Conventions now separate integral coefficients (`λ ∤ 2N`) from rational coefficients (every finite place). New `V^ℚ_λ` (§2.3), rational real forms (§2.5) and `W^ℚ_λ` (§3.6). §§2.4, 2.7, 3.4–3.5, 6.8, 7.1, 7.4–7.7, 7.11 and 7.13 are extended accordingly.

Other places repaired in the same pattern:
- the Scope bullet and the "Kept variants" paragraph;
- the §2.9 contract, which now says `λ ∤ N`;
- §6.8, which now has its own trace argument at `λ | N` (twisted forms, IG.0.T3, EtaleDualityAndPerverseSheaves §4.3(a),(d));
- §7.5, whose avatar is now stated at every place;
- the Layer 7 example, §9.10's `R_aux` and `S_UA`, and the Check of §7.11.

New Checks: the N = 401, t = 0 system has members at `λ | 2` (crystalline at good reduction, §7.7 Check) and at `λ | 401` (de Rham although those places lie in S, §7.11 Check).

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F02 (P2) — applied

Verified. EtaleDualityAndPerverseSheaves §4.3(c),(e), read at its head, supplies integral torsion-freeness for smooth complete intersections over any separably closed field with ℓ invertible, together with the family form.

Change: the old §2.2 "Integral cohomology of smooth hypersurfaces is torsion-free" (proved by integral Lefschetz) is replaced by the Betti corollary "Integral Betti cohomology of smooth complete intersections is torsion-free". Its proof combines finite generation, the Artin comparison for every ℓ and §4.3(c). Dimension zero is handled directly.

§4.3 is imported in Scope and in the supplier contract. Consumers §§2.3, 2.4 and 2.7 and the Layer 2 dependencies now cite §4.3 for étale coefficients and §2.2 only for Betti lattices.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F03 (P2) — applied

Verified against BCGNT25 lines 2139–2146, where U is taken inside V.

Change in §7.13: "take `U = T_{1,k(v)}[1/u]` pulled back" becomes `U = V ∩ g⁻¹(T_{1,k(v)}[1/u])`. Here V is §7.12's generic-slope open with gaps ≤ 1, and `g : T_{0,k(v)} − {0} → T_{1,k(v)}` is finite étale and surjective. U is nonempty as the intersection of two nonempty opens of an irreducible curve. The deduction `sᵢ = n − i` is spelled out.

The statement now names U as this intersection. A new Check uses slopes (3/2, 3/2, 0) against the generic (2, 1, 0). The use of §7.13 in §9.7 is unaffected, since §9.7 needs only an ordinary point.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F04 (P2) — applied

Verified: S_aux is defined at BCGNT25 line 3318, B at line 3238, B′ at line 3248, and the hypotheses on R at lines 3164–3165.

Changes: §9.7's "in the setting of the proof" becomes explicit independent hypotheses, with K⁺ from PotentialModularityAndCompatibleSystems §2.16. New standing data open §9.8 (R with weights {0, m} and determinant ε^{−m}, n, m, v₀, p₀, F_iq, F₁, E, L_j, M_R, Ψ₀). §9.9 defines B and B′. §9.10 defines S_aux (§1.7 operations) and s̄_aux,𝔭 with its rank, determinant, weights and Hermitian structure.

Other places: §9.11's opening; §9.9 now fixes `ρ̄_{A,q} = H¹` (determinant ε̄⁻¹) and requires N ≠ p₀, both needed to meet §9.7's hypotheses. New Checks in §9.10: (n, m) = (2, 3) gives weights {0, 3} + {0, 1, 2} = {0, …, 5}; the sign of the induced form depends on n.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F05 (P2) — applied

Verified: PadicDifferentialEquationsAndRigidCohomology §RD.5.8 (line 8781 at its head) states Kedlaya's full faithfulness for smooth separated finite-type schemes, and §RD.3.37 constructs the restriction functor. No crystalline-companion target exists in that roadmap, so the gap remains.

Change: in both the README contract line and the plan's `gaps` entry, the slug `curve-crystalline-companions` is narrowed to the companion (ℓ ≠ p, a fixed ℚ̄_ℓ ≅ ℚ̄_p, Frobenius polynomials at closed points). The full-faithfulness clause is deleted. §§RD.3.37 and RD.5.8 are now cited in the contract, in Scope, in §7.12's Needs and proof sketch, and in the Layer 7 dependencies.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F06 (P2) — applied

Verified: PotentialModularityAndCompatibleSystems §2.14 assumes `C ⊆ B ⊆ A`, `C ⊆ D`. The review's counterexample `C = D = ℚ`, `A = ℚ(√2)`, `B = ℚ(√3)` gives `A ∩ BD = ℚ ≠ B`.

Change: the contract now carries the common overfield and both tower inclusions. §9.1(e) names its two instances, (B, A, D) = (M, F₀, L) and (F, G, ℚ(ζ_N)). §9.3 (iv)–(v) names a chain of four instances and a chain of three. A new §9.1 Check gives the counterexample and the positive case B = A = ℚ(√2).

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F07 (P3) — applied

Verified: 7237 is prime and 7237 = 12·603 + 1; gcd(603, 3) = 3; the centre of SL₃(𝔽₇₂₃₇) has order gcd(3, 7236) = 3; SL₃ is perfect (Tau Ceti `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`, `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Perfect.lean:116`).

Change: the §5.5 Check "could stop at a normal subgroup of index dividing d" is replaced by the N = 603, l = 7237 Check distinguishing central factors from cyclic quotients. The §5.5 proof now uses perfectness; gcd(N, n) = 1 is kept because §4.4 needs it.

Same pattern repaired in §5.8 (SU_n is perfect, §0.9(2)) and in §5.6, where the false claim "both prime to N" for the order 3 is gone: Sp₂(𝔽₃) never occurs.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F08 (P3) — applied

DICKSON01 was fetched through the sources service from the public-domain 1901 University of Toronto scan. Chapter XII §249 starts on printed p. 269 (DICKSON01 line 9509). The §260 summary is DICKSON01 lines 10079–10112, printed pp. 285–286, and lists icosahedral subgroups for s ≡ ±1 (mod 10).

Change in §0.11: "Dickson's classification …" becomes "Dickson, *Linear groups*, Chapter XII, §§249–260, pp. 269–286, the summary §260, pp. 285–286". The lifting argument is made explicit (index ≤ 2 in ±G; perfectness). A References entry and the manifest fields are added.

## REV-PKG-PotentialAutomorphyDworkMotivesPartII~3/F09 (P2) — applied

Verified: CEGS lines 225–230 (§1.4, p. 5) give `∏_σ ω_σ^e = ε̄`. For ℚ₅(√5), with u ≡ 2: ω = 2 and ε̄ = N(u) mod 5 = 4.

Change in Conventions: "direct fundamental characters … multiply to `ε̄_l`" becomes the general formula with `e`. The two-character identity is scoped to the unramified quadratic field, restrictions are used over ramified extensions, and the ℚ₅(√5) negative control is added.

Other places: §7.9 now records e = 1. §9.7(ii) uses restrictions to `I_{F_{4,v}}` (F₄,v may be ramified). §9.6 is unramified already.

## Checks run

- **Elaboration.** `lake env lean packages/PotentialAutomorphyDworkMotivesPartII/Suggested.lean`, run from the content checkout: exit 0, about 8 s. The only diagnostics are five `declaration uses 'sorry'` warnings, at lines 92, 111, 131, 150 and 185. No `TauCeti.*` import, so nothing needed building.
- **Signatures.** A scratch copy with `#check @name` for all eleven names elaborated with exit 0. The names are `qianIndexSet`, `selfDualIndexSet`, `ZeroShapedDatum`, `ZeroShapedDatum.indexSet`, `ZeroShapedDatum.injOn_nonzero`, `qian_hypergeometric_group_eq_SL`, `selfDual_hypergeometric_group_conj_Sp`, `qian_hypergeometric_group_conj_SU`, `qian_two_prime_hypergeometric_group`, `qianGauss` and `zeroShaped_gauss_product`. Every binder of the README statements is present: `[NeZero N]`, `[IsDomain R]`, `[CharP k l]`, `Odd N`, the bounds, the primitive roots, the generated fields and the rank conditions. Nothing changed, and nothing needed to.
- **Dependency check.** `tauceti-roadmap … gate --depcheck … --movable` printed exactly:

```text
depcheck: 236 roadmaps, 2153 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- **Citations.** `roadmaps resolve` on the README finds no unresolved cross-roadmap citation and no unresolved Lean name. The newly cited pinned declarations were grepped at the pin:
  - `Matrix.SpecialLinearGroup.commutator_eq_top_of_four_le_natCard`, `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Perfect.lean:102`;
  - `Matrix.SpecialLinearGroup.commutator_eq_top_of_three_le_card`, same file, line 116;
  - `FiniteField.unitsMap_norm_surjective`, `Mathlib/FieldTheory/Finite/GaloisField.lean:219`.
- **Overlaps.** No open pull request changes this roadmap or drops a cited id. No section of this roadmap was renumbered. Only §2.2's heading changed, and no roadmap cites §2.2: the citing roadmap PotentialAutomorphyInfrastructurePartII cites §§1.1–1.4, 5.12, 6.8, 7.4, 7.8, 7.10 and 9.4.

## Adversarial pass on changed statements

| Statement | Instances tried, values on both sides | Result, change |
|---|---|---|
| Conventions, fundamental characters | ℚ₅: e = 1, ω = 2, ε̄ = 2. ℚ₅(√5): e = 2, ω = 2, ε̄ = 4 ≠ 2. Unramified quadratic: θθᶜ = (ωωᶜ)⁻¹ = ε̄⁻¹ | Exponent e restored; negative control added |
| Conventions, coefficient places | N = 401, λ \| 401: denominator 401³⁹⁹ is a unit of the field M_λ, not of O_{M_λ}; λ \| 2: 2 ∉ O, but #H₀ is odd | Rational members at all places; integral ones at λ ∤ 2N |
| §2.2 Betti corollary | m = 0: H⁰ = ℤ^{#X}. Cubic: H¹ = ℤ², H² = ℤ. Quadric surface: H² = ℤ_ℓ² for every ℓ, so ℤ². Quintic threefold: rank 204 = (4⁵ − 4)/5. Enriques (ℤ/2 torsion) is not a complete intersection | Holds; supplier hypothesis m ≥ 1, with m = 0 handled directly |
| §2.3(5) V^ℚ_λ | λ \| 401 for N = 401: no prime of O lies under it, the rational projector exists. λ \| 2: equals the extension of §2.9's realization. Rank at t = 0 is #B = 3 for B = {1, 2, 398} | Defined at every λ |
| §2.5 rational real forms | N = 5, n = 2, λ above 2 in M⁺ = ℚ(√5): 2 is inert, M⁺_λ = ℚ₂(√5), and M ⊗ M⁺_λ is a product of fields over the places λ′ \| λ; denominator 2·5³ is a unit | Defined; pairing with values in M⁺_λ(1 − n) |
| §6.8 at λ \| N | Hesse pencil N = 3, trivial χ: tr(Frob \| H¹) = q + 1 − #Y_t(𝔽_q), an integer independent of ℓ ∈ {2, 3, …}. Twisted-form trace: Σ_{j=0}^{N−2} q^{rj} − #X^{(h)}(k_r) ∈ ℤ | λ-independence extended |
| §7.5 avatar at every λ | Weight N − n − 1 = 397 for (401, 3). At λ \| 2 the avatar is crystalline at v \| 2, since Ψ is unramified away from N | Holds at every place |
| §7.7 at l = 2 | N = 401, t = 0: t^N − 1 = −1 is a unit at v \| 2. PadicHodgeTheory §8.1 has no condition on p | Crystalline 2-adic member |
| §7.11 | N = 401, n = 3, t = 0: S = {v \| 401}. Required members at characteristics 2 and 401: 2. Constructed: 2 (before: 0) | Repaired |
| §7.13 U = V ∩ g⁻¹(…) | Generic (2, 1, 0) and special (3/2, 3/2, 0): totals 3 and 3, s₃ = 0 and 0, prefixes (2, 3, 3) ≥ (3/2, 3, 3), gaps 1 and 3/2. On V, s₃ = 0 with gaps ≤ 1 gives sᵢ ≤ 3 − i, so the sum is ≤ 3 with equality only for (2, 1, 0) | The intersection excludes the special point |
| §5.5 perfectness | N = 603, n = 3, l = 7237: cyclic quotient of order dividing 603; centre of order 3; abelianisation of order 1. n = 2 is outside §5.5 (SL₂(𝔽₃) has abelianisation 3) | gcd not needed here; kept for §4.4 |
| §5.6 composition factors | N = 9 (3 \| N), self-dual n = 2: k(λ) = 𝔽₃ would need 3 ≡ ±1 (mod 9), false. Sp₄(𝔽_q), q odd: factors PSp₄ and ℤ/2, and 2 ∤ 9 | False "prime to N" for 3 removed |
| §5.8 | SU₃(𝔽₉): perfect, centre of order gcd(3, 4) = 1; SU₃(𝔽_{l²}) is perfect for odd l | Perfectness argument |
| §9.1(e), §9.3(iv)–(v) towers | (B, A, D) = (M, F₀, L): B ⊆ A, F₀ ∩ L = ℚ. (F, G, ℚ(ζ_N)): G ∩ ℚ(ζ_N) is unramified everywhere, so ℚ. Counterexample C = D = ℚ, A = ℚ(√2), B = ℚ(√3): A ∩ BD has degree 1, B has degree 2. Positive B = A = ℚ(√2), D = ℚ(√3): [BD : ℚ] = 4, A ∩ BD has degree 2 | All instances satisfy B ⊆ A |
| §9.7 explicit data | Instantiation: N > 100nm + 100 ≥ 100k + 100; p > 2nm + 1 > k; p₀ ≠ N (now required in §9.9). 𝒦 = {nm} for m = 2, and ∅ if moreover n = 1 | Hypotheses met by §9.9 |
| §9.10 S_aux | (n, m) = (2, 3): {0, 3} + {0, 1, 2} = {0, …, 5}, det ε^{−15} = ε^{−6·5/2}. (3, 4): {0, 4, 8} + {0, 1, 2, 3} = {0, …, 11}. det formula: −m·n(n−1)/2·m − m(m−1)/2·n = −nm(nm − 1)/2. Multiplier −m(n−1) + 1 − m = 1 − nm. Sign (−1)^{n−1}·(−1) = (−1)^n. Trivial rank-six representation: det 1 ≠ ε̄^{−15} | Level datum well-defined |
| §0.11(2) lift | q = 9: inverse image of A₅ has order 120 in SL₂(𝔽₉), of order 720. SL₂(𝔽₃) has abelianisation ℤ/3 and no index-2 subgroup. SL₂(𝔽₅) is perfect | G equals the full preimage |
| Companion gap | Unit F-isocrystal on 𝔸¹: horizontal Frobenius endomorphisms K^σ on both sides (RD.5.8 Check). The companion of the trivial sheaf is the unit object | Gap narrowed to the companion |

## Ownership and suppliers

- **Ownership against open pull requests.** Checked with `roadmaps grep` and `roadmaps show` for EtaleDualityAndPerverseSheaves (§4.3), PadicDifferentialEquationsAndRigidCohomology (§§RD.3.37, RD.5.8; no companion target), PotentialModularityAndCompatibleSystems (§§1.3, 1.7, 2.14, 2.16), ModularityAndLanglandsExtensions (§2.9) and PadicHodgeTheory (§8.1), each at its head.
- **Rational eigensheaves at λ | N.** This roadmap is the owner: ModularityAndLanglandsExtensions §2.9 is explicitly restricted to `λ ∤ N` ("At residue characteristic dividing N this integral projector is unavailable"). The extension is a rational projector on this roadmap's own eigensheaves.
- **Betti corollary in §2.2.** It is the comparison corollary the review allows; the étale theorem itself is imported.
- **New supplier sections cited.** All suppliers are earlier in the merge order, and all were already suppliers of this roadmap: PotentialModularityAndCompatibleSystems §§1.3, 1.7, 2.16; EtaleDualityAndPerverseSheaves §4.3; PadicDifferentialEquationsAndRigidCohomology §§RD.3.37, RD.5.8. No upward edge was added and no notion was moved down.

## Sources

- **DICKSON01 added.** Licence class `institutional`, a public-domain 1901 work, fetched from the Internet Archive copy of the University of Toronto Libraries scan. The service refused the archive landing page, which has no licence class, so the mirror PDF was fetched with `--licence-class institutional` after checking that the work is public domain.
- **Bibliographic fields.** Authors, title, year, venue, locator and version note were filled in by hand.
- **Key reordering.** The service rewrote `sources.toml` with its keys reordered within several entries (`doi`, `authors`, `title`, `year`). Values are unchanged.
- **needs-references.toml.** The file that the first two failed fetches created was deleted once the text was obtained. No text is outstanding.

## Notes for the maintainer

- **Rational members (`V^ℚ`, `W^ℚ`).** The weakly compatible systems of §7.11 are now indexed by every finite place of M (or M⁺). The integral and residual objects (`V_λ`, `W_λ`, `W̄_λ`) remain restricted to `λ ∤ 2N`. Consumers that take members of the §7.11 systems, such as PotentialAutomorphyInfrastructurePartII through §§7.4, 7.8, 7.10 and 9.4, keep valid citations.
- **§2.2 heading.** It changed from "Integral cohomology of smooth hypersurfaces is torsion-free" to "Integral Betti cohomology of smooth complete intersections is torsion-free". No other roadmap cites it.
- **Notation in Layer 9.** The standing data of §9.8 introduce `M_R` for R's coefficient field, to keep it apart from `M = ℚ(ζ_N)`, and `F_{iq}` for the imaginary quadratic field, to keep it apart from §9.1's `F₀` and the local `K₀`. §9.1's existing local use of `M = F(ζ_N)` was left as it is: no finding concerns it.
- **No suspicious instructions** were found in the review text.
