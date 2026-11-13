# FIX-PKG-PadicFamiliesPartII~4

Repair of the four findings of REV-PKG-PadicFamiliesPartII~3 (one P1, three P2). All four were verified against the cached sources and the sibling packages; all four are applied. Files changed: `packages/PadicFamiliesPartII/README.md`, `packages/PadicFamiliesPartII/sources.toml` (locators only). `Suggested.lean`, `metadata.toml` and `design/plan.json` are unchanged: no Lean name, gap or headline changed.

## REV-PKG-PadicFamiliesPartII~3/F01 (P1) — applied

Verified: an exact contravariant functor applied termwise reverses degrees, so `Hⁱ(F(M)) = F(H⁻ⁱ(M))`. With the reversal, BCGP25 Theorem 4.7.2 yields Theorem 4.7.5's index `2p+q−d` (line 4491); the printed index gives `H^{q+d}`.

Changed (§7.1b): "i-th cohomology sheaf `VB⁰HCS(Hⁱ(M))`" → reversed termwise complex with `VB⁰HCS(H⁻ⁱ(M))` and `HC(M[n]) = HC(M)[−n]`. Item (1) is now stated for objects in degree 0. Added: complex bounds `[−b, ℓ(w)−a]` and `[ℓ(w)−b, d−a]`, Checks for V[1] and for a Verma at w=1, a §7.5 Check clause, and a Source-issues entry.

## REV-PKG-PadicFamiliesPartII~3/F02 (P2) — applied

Verified: BCGP25 line 2502 takes λ ∈ X*(M_Q)_E; lines 2537–2543 and 2562–2566 use the M_Q^ab-action.

Changed: §7.1 "λ ∈ X^*(M)_E" and §7.1a "λ ∈ X^*(T)_E" (general Q) → λ ∈ X*(M_Q)_E, inflated through `Q → M_Q → M_Q^ab`; Q = B keeps all of X*(T)_E. Added: the Q-twist law, `M_Q` named apart from the Shimura Levi in the standing hypotheses, GL₂ negative controls (§§7.1, 7.1a), and a §8.3 Check that η is a Klingen-Levi character.

## REV-PKG-PadicFamiliesPartII~3/F03 (P2) — applied

Verified: `packages/LocallyAnalyticDistributionsPartII/README.md` §2.5 (ORDER.txt line 199 < 256) owns 𝒰(𝔤), its Fréchet–Stein structure, coadmissible modules and exact completion. LocallyAnalyticRepresentationsOfLocalGroups §4.2 owns O^p. Its §3.10 owns LB_𝔤(E), an extra earlier owner found by the object search.

Changed: the Scope claim "§7.1 proves Û(𝔤) is Fréchet–Stein" → imported from LADPII §2.5, LARLG §§3.10, 4.2; §7.1 keeps only O_{λ-alg}, integration, O ≃ Ô and the realization. Contracts, Needs and Dependencies updated; Û(𝔤) renamed 𝒰(𝔤).

## REV-PKG-PadicFamiliesPartII~3/F04 (P2) — applied

Verified: BCGP21 (5.6.6) (line 6206), (5.7.7) (lines 6376–6394), Propositions 5.7.3–5.7.9; the δ⁻¹ label at lines 6306–6307 reverses the direction.

Changed: §5.3 now defines L, A, the twisted trace and `γ₁ : F_{w,*}L → L⊗A^{p−1}`. §5.4 now defines δ, `δ_D : A → A^{p²}` with inverse and `γ₂ : F_{w,*}(L⊗A^{p−1}) → L`, and states `γ₂∘F_{w,*}γ₁ : (F_w²)_*L → L`. APIs added; §5.3 gains two Checks and §5.4 has four new or rewritten (the false "unit" Check replaced). The §5.7 route and the Layer 5 ω notation were fixed.

## Checks

- `lake env lean packages/PadicFamiliesPartII/Suggested.lean`, run from the pinned content checkout: exit 0, no output (no errors, no warnings). No `TauCeti.*` import, so no module build was needed.
- `#check @name` pass: `Suggested.lean` declares nothing (its docstring names each headline and the missing carrier), so there are no elaborated signatures to compare; nothing changed.
- Dependency check (`gate --depcheck … --movable`):

```text
depcheck: 236 roadmaps, 2158 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line; exit 0.
- `roadmaps resolve` on the README lists three leads: HigherHidaAndColemanTheory §9.6, LocallyAnalyticDistributionsPartII §2.5 and LocallyAnalyticRepresentationsOfLocalGroups §4.2. All three are board packages earlier in ORDER.txt (lines 255, 199 and 253), and I opened each cited heading in `packages/<Name>/README.md`: HHCT §9.6 is line 1389, LADPII §2.5 line 248, LARLG §3.10 line 717 and §4.2 line 760. None is a real defect.
- No gate failures were listed for this round.

## Ownership

- Completed enveloping algebra: owner LocallyAnalyticDistributionsPartII §2.5 (earlier). Imported, not restated.
- BGG categories O and O^p: owner LocallyAnalyticRepresentationsOfLocalGroups §4.2 (earlier). Imported.
- Integrable LB representations of 𝔤: owner LocallyAnalyticRepresentationsOfLocalGroups §3.10 (earlier). Imported.
- Kept here: the λ-algebraic subcategory for a Levi character, the integration of its twists, Schmidt's equivalence O ≃ Ô, and the realization functor M ↦ M̂^∨. `roadmaps grep` found no Arens–Michael or Ô owner on main or at the indexed open heads. In the board packages only LADPII and LARLG mention the envelope; LADPII's scope lists category O as outside it, and LARLG lists Beilinson–Bernstein localization as outside it.
- The γ₁, γ₂ and δ maps are particular to the Hilbert–Siegel special fibre and stay here.
- Ownership against the open pull requests was checked through the `roadmaps grep` index and the sibling checkouts listed in the brief.

## Adversarial pass on added and changed statements

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §7.1b degree reversal | V in degree 0; V[1]; V[−1]; 0 | H¹(F(V[1])) = F(V) ≠ 0 vs unreversed F(H¹(V[1])) = F(0) = 0; V[−1] nonzero only in degree −1; zero gives 0 on both readings | Reversal required; applied |
| §7.1b reversal vs §§7.5–7.6 | Modular curve, gl₂ Verma, ⟨λ,α^∨⟩ = −1 and = 2 | e v_k = k(⟨λ,α^∨⟩−k+1)v_{k−1}: at −1 it is −k² ≠ 0, so H₀ = 0 and H₁ = 𝔲⊗Ev₀ sits in degree −1. E₁^{0,q} = H^{q−1}(HC(N)) = index 2p+q−d (p=0, d=1); unreversed gives H^{q+1}. At 2, e v₃ = 0 and H₀ ∋ [v₂] ≠ 0, so the hypothesis ⟨λ,α^∨⟩ ∉ ℤ_{≥0} is needed | Agrees with BCGP25 Thm 4.7.5; Check added with the hypothesis |
| §7.1b complex amplitude | a = b = 0; a = b = −1, modular curve; [−1,0] | (1) recovered at 0. At −1: cusp w=1 [1,1], full w=1 [1,2], cusp w=s [1,2], full w=s [2,2]. Trivial-coefficient complex [−1,0] at w=1: cusp [0,1], matching the degrees 0,1 of Loc(E) in §7.2 | Proved by truncation induction; property added |
| §7.1 λ ∈ X*(M_Q)_E | GL₂: Q=G with ε₁ and det; Q=B with ε₁; zero module | ε₁(diag(1,−1)) = 1 ≠ 0, excluded; det gives 1−1 = 0, admitted; at B, ε₁(diag(p,1)) = p; zero module gives 0 | Applied; Check added |
| §7.1a HCS_{Q,w,λ} domain | Modular curve, w=1, Q=G, trivial 𝔱-module | Weight test 0−ε₁ ∈ X*(T) passes, but a G_e-action through G^ab by ε₁ is impossible (value 1 on [e₁₂,e₂₁]) | Negative control added |
| §7.1a Q-twist law | Q=G, µ=det on GL₂ | det(diag(p,1)) = p, det(pI) = p²; µ ∈ X*(M_Q) is integral, so the λ-alg category is unchanged | Agrees with BCGP25 Remarks 3.3.15, 3.4.15 |
| §7.1 O ≃ Ô | 𝔤 = 𝔥 abelian; gl₂ Verma | Abelian case: both sides are finite-dimensional semisimple 𝔥-modules. Verma: weights λ−ℕα with one-dimensional weight spaces, and M̂^ss = M | Statement restated with BCGP25 Def. 2.2.38 |
| §7.1 imported 𝒰(𝔤) | 𝔤 = 0; 𝔤 = E·x; E[x]/(x−a) | 𝒰 = E; entire series Σaₙxⁿ with |aₙ|rⁿ→0 for all r; completion of E[x]/(x−a) is E | Same object as LADPII §2.5; imported |
| §8.3 η | ⟨χ,β^∨⟩ = −k₁ (from s_β) | η=(0,−1;1) gives 0; λ=(1,1;w) gives −1; λ−η = (1,2;w−1) with parity 3 ≡ w−1 mod 2 for w even (w=2: (1,2;1)) | η ∈ X*(M_Q), λ ∉; Check added |
| §5.3 γ₁ type | p = 3, 5 | Targets L⊗A², L⊗A⁴; F_w*ω⁻¹ = ω⁻¹⊗ω_w^{1−p}; K_D ≅ ω³⊗ω_w^{p−1}|_D, so L⊗A^{p−1} ≅ K_D⊗ω⁻¹ | Typed; API added |
| §5.3 trace | Frobenius f ↦ f³ on k[x,y] | Cartier trace: x²y²dx∧dy ↦ dx∧dy, xy dx∧dy ↦ 0; function trace of k(x,y)/k(x³,y³) = 0 | Dualizing trace required; Check added |
| §5.3 normalization | v(x_w) = 1 at w | v_p(Norm³/p³) = 3−3 = 0; without p⁻³ the valuation is 3, zero on the special fibre | Check strengthened |
| §5.4 δ direction | p = 3, 5 | δ_D ∈ A^{p²−1}: 8, 24; δ_D⁻¹: −8, −24; γ₂'s trace needs −8 at p=3; δ_D gives +8, a scalar gives 0 | Inverse required; source label slip recorded |
| §5.4 composite | p = 3, 5 | F_w*δ_D exponent p(p²−1) = 24, 120; target exponent 1−p³ = −26 = −2−24 and −124 = −4−120; degrees 9·9 = 81 = 3⁴ and 25·25 = 625 = 5⁴ | Agrees with Props 5.7.8–5.7.9 |
| §5.7 route | αβ ≠ 0, f|_D ≠ 0; and β = 0 | γ₂(γ₁(f|_D)) = αγ₂((Ha_w f)|_D) = 0, but this equals αβ f|_D ≠ 0, a contradiction; at β = 0 both sides are 0 | Route typed; hypothesis αβ ≠ 0 kept |

## Places repaired by pattern

- **Derived index.** I searched for every contravariant functor applied to complexes (Loc, CC_λ, M̂^∨, HCS, HC). Only §7.1b applied one termwise with an explicit cohomology index. §7.5's fourth Check was updated. §8.3's triangle (open stratum in degree 0, closed stratum shifted into degree 1) already used the reversed convention and needed no change.
- **Character space.** Every occurrence of a twist on a general parabolic is now covered: §7.1, §7.1a and §8.3's η. §7.2, §7.1b and §7.8 use only Q = B.
- **Notation.** Û(𝔤) became 𝒰(𝔤) in four places (Scope, contracts, §7.1, §7.1a).
- **Coefficients in Layer 5.** The coefficient of g in §5.7, "2 ⊗ ω^{1−p}", is now `ω²(−D) ⊗ ω_w^{1−p}`.

## For the maintainer

- No Lean names changed. No section ids were added, renumbered or dropped, so citations in other roadmaps (for example GSp4NonregularModularityLifting's citations through the former-numbering table) are unaffected.
- New supplier edges: LocallyAnalyticDistributionsPartII §2.5 and LocallyAnalyticRepresentationsOfLocalGroups §§3.10, 4.2. Both packages are earlier in ORDER.txt, and depcheck is clean.
- Two source slips were added to "Source issues": BCGP25 p. 88 (cohomology index of a contravariant functor on complexes) and BCGP21 p. 130 (δ/δ⁻¹ label).
- No `needs-references.toml` was needed: every locator used is in the cached BCGP21 and BCGP25 texts.
