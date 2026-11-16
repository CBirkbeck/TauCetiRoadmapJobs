# Review of ArithmeticLocallySymmetricSpacesPartII (pull request #2401 at 1ef5333)

**Verdict:** accepted

Incremental re-review of the 27 lines changed since 568b4e2 (README only; `Suggested.lean` and `metadata.toml` are unchanged). No finding.

## Previous findings

- R01 — repaired: §4.1 now states and routes the injection `ι_{K_f}` of `⊕_ε Hom(π^ε_κ, L²_cusp^{K_f})` into H^q(SL₂(F) ∩ K_f, V_κ) at every level; §5.5 defines H_bc¹ through it at SL₂(Ô_F); *Needs:* lines and Layer 4 Dependencies extended.
- R02 — repaired: §3.4 passes from rank zero over ℤ_p[[G]] (CompletedCohomologyPartII §§5.5, 5.7, U = K₀ = G) to rank_A M_j = 0 by the torsion criterion of gap:skew-rank; *Needs:* and Layer 3 Dependencies carry §5.5, §§0.5, 0.8 and the gap.

## Verified sound

| Target | Instance | Roadmap value | Computed / source value | Result |
| --- | --- | --- | --- | --- |
| §4.1 injection at every level | F = ℚ, K_f = SL₂(Ẑ): κ = 12, 4, 2; ℚ(i), n = 0 | Σ_ε m_ε ≤ dim H^q(Γ, V_κ) | 2 ≤ 3 (Sym¹⁰: 2·1+1); 0 ≤ 1; 0 ≤ 0; 0 ≤ 0 = dim H¹(SL₂(ℤ[i]), ℂ) | holds |
| §4.1 route, `ι_{K_f} = [K_f:K′_f]⁻¹ π_* ∘ ι_{K′_f}` | Q = ℤ/2 swapping ℂ²; K′_f ↔ Γ(3), Q = SL₂(ℤ/3) | `π^* ι_{K_f} = ι_{K′_f}` on Q-invariants | ½(1 + swap)(1,1) = (1,1); on (1,−1) it is 0, so only invariants; \|Q\| = 24, S₁₂(Γ(3))^Q = S₁₂(SL₂(ℤ)), dimension 1 | holds |
| §4.1 restriction onto Q-invariants | π_* π^* = \|Q\|, π^* π_* = Σ r_k^* (ArithmeticLocallySymmetricSpaces §ALS.3.6, stated for every compact open K′ ⊂ K) | isomorphism H^q(Γ) → H^q(Γ′)^Q over ℂ | π^* injective; x invariant gives π^*(π_* x/\|Q\|) = x; r_k^* π^* = π^* since r_k^* = id on X_K (§ALS.1.8) | holds |
| §4.1 trivial coefficients | κ = (2,…,2); −I ∈ Γ | "every admissible κ" | §ALS.5b.5 has no dim V > 1 hypothesis; D^±₂ and π_{2,0} have one-dimensional degree-q cohomology; −I acts by (−1)^{κ_v−2} = 1 | holds |
| §3.4 rank step | G = ℤ_p: H̃ = Λ/(γ−1), Λ/p, Λ | rank_A M = 0, 0, 1 | γ−1 ≠ 0 in A kills A/A(γ−1); ℚ_p ⊗ Λ/p = 0; A free of rank 1; r·(m/p^k) = (rm)/p^k as p is central | holds |
| §5.5 H_bc¹ through §4.1 | ℚ(i), n = 0, 1; 𝒟 ∩ {±1, ±i} = {1} | 0; Z − ½; level group SL₂(ℤ[i]) | ν_{ℚ(i),0} = 0, ν_{ℚ(i),1} = 1; GL₂(F) ∩ K(𝒟) has determinant 1; a form with central character is fixed by its restriction to SL₂(ℂ) | holds |
| `bianchi_groupCohomology_linear_growth` (lower bound cites §4.1 through §5.5) | ℚ(i), n = 100 | ≥ c(n+1) | (5/24 − 1/8)·101 = 8.4, injected by `ι` at SL₂(Ô_F) and restricted to Γ with cor ∘ res = index | holds |
| Scope, variant against BianchiModularForms §§3.2, 3.4 | Γ₀(𝔫,𝔞) at its open head | GL₂ groups with unit determinants | its Conventions: `det γ ∈ 𝓞_Kˣ`; §3.2 and §3.4 state S_k(Γ₀(𝔫,𝔞)) ≅ H¹_cusp(Γ₀(𝔫,𝔞), E_k) for imaginary quadratic K only | variant stated correctly |

The rows for the untouched statements stand as in the previous review, of 568b4e2.

- Source locators checked against the text: 2 in the changed passages. fgt10 lines 974–980 (§3.3, (3.9), p. 17, "for any lattice") for §4.1 and §5.5; fu24 lines 1165–1179 (§7, pp. 23–24, the torsion bullet and (38)) for §3.4. Of the seeded sample, §3.4, §4.1 and (through §5.5) §5.7 fall in the change; the README flags no locator as unverified.
- Cross-roadmap citations resolved, statements read: 13. ArithmeticLocallySymmetricSpaces §§ALS.0.7, 1.5 ("neat or not"), 1.8 (`r_k^* = id` for k ∈ K, commuting with pullback), 3.6 (both trace identities), 5b.1 ("compatible with level maps and translations"), 5b.4 (level maps), 5b.5 on main; AdelicAlgebraicGroups §4.2 on main; CompletedCohomologyPartII §§5.5, 5.7 and NoncommutativeAndEquivariantIwasawa §§0.5, 0.8 and BianchiModularForms §§3.2, 3.4 at their open heads.
- Library declarations: none added or changed by the diff; `TauCeti.groupCohomology.map_subtype_id_comp_corestriction` stands as opened in the previous review.
- Gate, re-run at this head: every check passes, the targeted build included. Dependency check: `depcheck: 238 roadmaps, 2248 edges, 0 problem(s)`, no UPWARD or CYCLE line; the merge order lists this roadmap at line 211, after BianchiModularForms (208) and LocallyAnalyticDistributionsPartII (210). Outside-folder diff: empty.
- Elaboration: `lake env lean` on `Suggested.lean` gives the two `sorry` warnings only (lines 75 and 94); the file is identical to the one read at 568b4e2, so the signatures, the one-tactic probe and the headline list stand.
- Pull-request text against this head: no sentence is contradicted. "BianchiModularForms is named only under Scope and ownership and in one Check of §5.2" still holds (README lines 38, 40, 613); the change adds no supplier, removes no section and no declaration.
- Declared gaps: `gap:skew-rank` is now also cited in §3.4 with the same slug and for the criterion its `needs` sentence states (rank zero exactly when every element is killed by a nonzero element), applied to ℤ_p[[G]] and to A, both left noetherian domains by NoncommutativeAndEquivariantIwasawa §§F.1, 0.5, 0.8.
- Remark, no change asked: `ι_{K_f}` depends on a generator of each one-dimensional H^q(𝔤, K_∞; π^ε_κ ⊗ V_κ); the statement fixes it by compatibility with the parent's map at neat normal subgroups.

Overlap check: read LocallyAnalyticDistributionsPartII, CompletedCohomologyPartII, AutomorphyLiftingBeyondTaylorWiles, QuaternionicModularForms, TorsionCohomologyInfrastructure (open, by vocabulary) and ArithmeticLocallySymmetricSpaces (main) as in the previous review, and BianchiModularForms for the new text; the list by named results is empty. Cuspidal comparison for Bianchi groups: BianchiModularForms §§3.2, 3.4 owns it for the GL₂ component groups Γ₀(𝔫,𝔞); the injection of §4.1 is kept as a stated variant (SL₂, every number field, every compact open level). Ore rank over O[[U]]: CompletedCohomologyPartII §5.5; skew rank over a noetherian domain: NoncommutativeAndEquivariantIwasawa §F.1 by gap:skew-rank; §3.4 now states the link. Nothing else shared.

Source independence: changed passages only; 4 passages compared with 2 sources (the §4.1 statement and its route and the §5.5 definition against fgt10 §3.3; the §3.4 route against fu24 §7), none shared; largest share fu24, 31 of 50 locators, unchanged; the diff adds, removes and reorders no layer, so the contents comparison with fu24 stands: independent.

## Not verifiable

- None in the changed passages. The two items of the previous review (fgt10 Lemma 4.19 at ℓ = 2; the sum over local types in fgt10 Theorem 4.17) are in untouched text and stand.

## Source issues

- **Misprint** in fgt10 at §3.3, before (3.9), p. 17: the source says the cohomology criterion holds for any unitary representation; it should say irreducible unitary, since a multiple of π_{2n+2,0} also has cohomology; affects nothing.

## For the human reviewers

- none
