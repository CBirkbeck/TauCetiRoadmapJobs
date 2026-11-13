# FIX-RT-PadicFamiliesPartII~2 — repair report

Twelve findings from two reviews (`RT-PadicFamiliesPartII~2a`, `~2b`), none overlapping. Every finding was checked against the cached sources, the supplier roadmaps and the pins; all twelve hold on the mathematics. Edited files: `packages/PadicFamiliesPartII/README.md` and the `gaps` list of `packages/PadicFamiliesPartII/design/plan.json` (one `needs` text). `Suggested.lean`, `metadata.toml` and `sources.toml` are unchanged.

## RT-PadicFamiliesPartII~2a/F01 (P1) — applied

§6.3: "the subgroups `π(H_v)` for `v ≠ w`" → level transported by `j_v : Ã[v^∞] = A[v^∞]/A[v] → A[v^∞]` (multiplication by p), `H̃_v = [p]^{−1}(H_v)/A[v]`, flags likewise. Added an isotropy argument, a basic property, a Check (real quadratic F, `p = 3`: orders 1 against 3, 9 against 9) and a Source issue.

Evidence: BCGP21 line 6131 prints `H̃_v = πH_v`, and `A[v] ⊂ L̃_w` (lines 6123–6124).

## RT-PadicFamiliesPartII~2a/F02 (P1) — applied

§7.1b: deleted "with `lim_μ N^{≤μ} = N^fs`". Added: the slope order is HigherHidaAndColemanTheory §1.2's, so central components agree; `N^fs` is recovered only through the affinoid exhaustion `𝒵_n`. Added the central-`𝔾_m` annulus Check and a Source issue. Evidence: BCGP25 line 4257 states the limit, and line 4206 puts the central `ℤ^s`, inverses included, in `T⁺`.

## RT-PadicFamiliesPartII~2a/F03 (P2) — applied

§2.8: "the cusps lying in the multiplicative tube" → both kinds of cusp occur: `μ_p ⊂ Tate(q)` (δ = 1) and the étale subgroup of `Tate(t^p)` (δ = 0). The target now includes the estimates and gluing on both boundary charts. Added a `Γ₀(3)` Check (degrees 1 and 0; `du/u` pulled back to `3du/u` and `du/u`).

Evidence: BPS Remark 5.3.2 (lines 1353–1356) names this route without carrying it out.

## RT-PadicFamiliesPartII~2a/F04 (P3) — applied

§2.3: the two tautological Checks (empty `V_1`; one bad complement in `V_1 ∖ V_2`) → computed counts at `p = 3`: supersingular lift, `N = 3` at `β = 3/4` (4 counting H) and `N = 0` at `β = 1/2` (3 if reversed); split ordinary `μ₃ ⊕ ℤ/3` with `H = ℤ/3`, `N = 1`.

Evidence: the counts follow BPS Definition 4.3.3 and Remark 4.3.4 (lines 893–902).

## RT-PadicFamiliesPartII~2a/F05 (P2) — applied

§9.7: "on which the centre acts by `|·|²`" → `M^{|·|²}` is defined as the submodule where `(z_ℓ)` acts by `z_p^{−2}`, which is not the norm character. It equals the `∏_{ℓ≠p} ℤ_ℓ^×`-invariants; `ZK^p` is defined; Lemma 7.3.8(2) is cited with the normality hypothesis. Added a Check (`z_3 = 4` acts by `1/16`; `z_2 = 3` by `1/9`; −1 acts by 1).

Evidence: BCGP25 lines 7637–7649 and Remark 7.3.7.

## RT-PadicFamiliesPartII~2a/F06 (P1) — applied

New §7.1c builds `D̃^la` (BCGP25 Definition 3.2.38) and `C^la` (Definition 3.2.41). It covers the equivariant structure, the fibre, `∗₂`, the `D̃^la`-module structure, `𝔲⁰_P`-acyclicity, `∗₂(ιz) = Θ_hor(HC(z))` (Lemma 3.2.43), three Checks and a proof route. §7.2 and §7.4 now cite it. `VB⁰(C^la) = O^la` moved from gap:solid-vb-sen into §7.4 (see the maintainer notes).

Ownership: no roadmap on main, on the board, or at an open head constructs these sheaves. PerfectoidShimuraVarieties §3.6 is the Levi-torsor pullback; the `C^la(G, K)` of LocallyAnalyticDistributionsPartII §§4.1–4.4 is the function space; SpringerResolutionAndCharacteristicCycles §10.2 is algebraic Beilinson–Bernstein on `G/B`. This roadmap owns them because §7.2 is their only consumer.

## RT-PadicFamiliesPartII~2b/F01 (P2) — applied

§6.1 now proves both commutations. On `H⁰(X₁^I, ω^κ(−D))`, `U_Kli` commutes with `U_{w,2}`. On sections over `X₁^{I,=w2}`, `U_Iw`, Z and `U_{w,2}` commute pairwise, with a kernel-filtration route. Two Checks added (matrices; filtrations at `p = 3`). §§6.6, 6.9, 6.10 now cite §6.1 instead of "(§4.3)" / bare "commutation". A Source issue was added for Lemma 5.8.1/Remark 5.8.7.

Evidence: BCGP21 Lemma 4.5.15 (line 5081) puts the Klingen operator in its commuting family; Lemmas 4.5.17 and 5.8.1 (lines 5114, 6432) give only `U_Iw Z = U_{w,2}`; the other order is the kernel count in §6.1.

## RT-PadicFamiliesPartII~2b/F02 (P2) — applied

§1.3 route rewritten in this roadmap's notation: `δ_i(y) = d_i a_i − deg L`, replacing BPS's undefined `f l` (BPS line 704). §1.4 route restructured in our own words (closed band avoiding integers, gain positive by §1.3, infimum attained on a quasi-compact domain, `N > (ν − η)/ε`, then place by place). Neither keeps BPS's clause sequence (lines 729–734).

## RT-PadicFamiliesPartII~2b/F03 (P3) — applied

Added contract rows PELModuli §M0.21 and ShimuraCompactifications §6.12. Consumed rows now appear in *Needs*: §M2.8/§M2.9 (§1.1), §M0.27 (Layer 2, §2.1), §M4.6 (§2.9), §M5.1 (§3.1), §M2.10 (§6.4), HodgeTate §0.15 (§§4.6, 6.2), §R3.6 (§5.3), AutomorphicBundles §3.3 (§4.2), AutomorphicFormsOnReductiveGroups §6.4 (§3.4), HigherHidaAndColemanTheory §1.2 (§7.1b). Deleted unused rows: ShimuraCompactifications §7.26, AutomorphicBundles §12.15, IntegralHeckeAndGaloisDeterminants §2.3, PadicFamilies §2a.15–2a.16.

## RT-PadicFamiliesPartII~2b/F04 (P3) — applied

Deleted "From TauCetiRoadmap.LieHighestWeight" and all four "LieHighestWeight Layer 3" citations (§§7.1, 7.1a, 7.2, Layer 7 Dependencies). Added Mathlib `UniversalEnvelopingAlgebra` (UniversalEnveloping.lean:65) and Tau Ceti `TauCeti.irreducibleQuotient` (Verma.lean:525, same hypotheses as `TauCeti.VermaModule`, checked by `#check`). Evidence: `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 13–24 on main.

## RT-PadicFamiliesPartII~2b/F05 (P3) — applied

§4.2 torus `T_I = T_fin × T₀` → `𝒯_I = 𝒯_fin × 𝒯₀`, `Λ_I = ℤ_p[[𝒯₀]]`, and §5.1 `ℤ_p[[𝒯_I]]`; `T_I` stays the Hecke operator of §4.4. Contract formula → `C_r = p^{3−r}(T_{p,1} + (1+p+p²+p³)T_{p,0})`, noting the supplier's letters. Same pattern repaired in the §3.3 Check: `(q, T₀, T₁, T₂)` → eigenvalues of `T_{ℓ,0}, T_{ℓ,1}, T_{ℓ,2}`.

## RT-PadicFamiliesPartII~2b/F06 (P3) — applied

§2.7 Check: "`max_i d_i a_i` wall crossings at place i" → "`d_i a_i` crossings at each `i ∈ J`, walls `d_i a_i − 1, …, 0`", with the instance `(d₁, d₂) = (1, 2)`. §5.1 Check: "`= 1 + 9ℤ₃`" → "`= 1 + 3^{⌈u_v⌉}ℤ₃ ⊂ 1 + 9ℤ₃`" (`1 + 27ℤ₃` at `u_v = 3`). Conclusions unchanged.

## Checks run

- `lake env lean packages/PadicFamiliesPartII/Suggested.lean` (from the content checkout): exit 0, no messages (20 s). The file is unchanged and has zero declarations, so there is no `#check @name` to compare against README statements. Instead a scratch file ran `#check` on the cited library declarations: `UniversalEnvelopingAlgebra`, `LinearMap.prod`, `LinearMap.coprod`, `Module.End.genEigenspace`, `Polynomial.aeval`, `Module.Projective`, `LinearMap.eventually_isCompl_ker_pow_range_pow` (with `[IsArtinian R M] [IsNoetherian R M]`), and `TauCeti.VermaModule` / `TauCeti.irreducibleQuotient`, which share the hypotheses `CharZero`, `IsKilling`, `FiniteDimensional`, a Cartan subalgebra and triangularizability. All agree with the contracts; nothing changed as a result.
- Dependency check:

      depcheck: 239 roadmaps, 2175 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line (one edge fewer than before: LieHighestWeight).
- `roadmaps resolve` on the edited README: its one lead is "HigherHidaAndColemanTheory §§9.6". That roadmap is a board package earlier in the merge order, read at `packages/HigherHidaAndColemanTheory/README.md`, so the lead is a false positive. No Lean name was unresolved.
- Overlaps: the only open pull request changing this roadmap is its own content pull request. No cited id is dropped, and no id was renumbered (§7.1c is new; the former-numbering table is unaffected).
- No source was fetched; every locator is in the six cached texts, and no `needs-references.toml` was written.

## Adversarial pass (statements added or changed)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §6.3 `H̃_v = [p]^{−1}(H_v)/A[v]` | F real quadratic, `p = 3`, `|H_v| = 3`; Iwahori member of order 9; `F = ℚ` | direct image order 1; preimage `3⁵`, quotient 3; 9 ↦ 9; `F = ℚ` has no `v ≠ w` | holds; direct image fails |
| §6.3 isotropy | `π = j_v^{−1}∘[p]` | `π^*λ̃ = p²(j_v^{−1})^*λ̃ = p² x_w^{−1}λ` ⇒ pullback `x_w^{−1}λ`, `v_v(x_w) = 0` | unit multiple, isotropy kept |
| §6.1 `[U_Kli, U_{w,2}] = 0` | BCGP21 L4.5.15; eigenline `α = 2, β = 3` | `U_Kli = 5`, `U_{w,2} = 6` | in source family |
| §6.1 `[U_Iw, Z] = 0` | `N = μ₃⊕ℤ/3⊕ℤ/9` | `|N| = 81`, `|N[3]| = 27`; étale first step `ℤ/3⊕3ℤ/9` unique; mixed first step `μ₃⊕3ℤ/9` unique; normalizations `3^{−3}·3^{−3} = 3·3^{−5}` | both orders reach N once |
| §6.1 Check, non-commuting witness | `diag(1,2)`, `[[1,1],[0,1]]` | `[[1,1],[0,1/2]]` vs `[[1,1/2],[0,1/2]]` | differ at (1,2) |
| §6.6 quadratic, both orders | `α = 2, β = 3` | `4 − 5·2 + 6 = 0` | holds |
| §6.9 `ker Δ` stable under `U_{w,2}` | `Z U_{w,2}` vs `U_{w,2} Z` | `Z U_Iw Z = U_Iw Z Z` given `[Z, U_Iw] = 0` | holds |
| §6.10 `Δι_α` | `T = 5, U = 6`, `α̃ = 2, β̃ = 3` | `Zα̃^{−1} = U_Iw^{−1}·6·½ = 3U_Iw^{−1}` | `(1 − 3U_Iw^{−1})f`, as stated |
| §7.1b no μ-limit | central `𝔾_m`; annulus `E⟨X, pX⁻¹⟩`; `SL₂` | circles `|X| = |p|^μ` disjoint; family 0/1 not from N (Laurent injectivity); `SL₂`: `{|X| ≥ |p|^μ}` increasing | central case fails; none asserted |
| §7.1c `C^la`, 𝔲 vs 𝔭 | `G = P = 𝔾_m`; `G = 1` | `C^la = O_{𝔾_m,1}` (∞-dim) vs E; `G = 1`: `C^la = D̃^la = E` | 𝔭⁰ version excluded |
| §7.1c left invariance | `GL₂`, B, `u = [[1,a],[0,1]]` | `(ug)₁₁ = g₁₁ + a g₂₁`, `(ug)₂₁ = g₂₁`; right: `(gu)₁₂ = a g₁₁ + g₁₂` | `g₂₁` in, `g₁₁` out |
| §7.1c (3) acyclicity | `𝔾_m` (`𝔲 = 0`); `GL₂`, `𝔲` 1-dim | trivial; antiderivative of a germ converges on a smaller radius ⇒ `H¹ = 0` | holds |
| §7.1c (4) sign | `𝔾_m`, `f = g` | `∗₁X f = −f`, `∗₂X f = f`, `Θ_hor X f = −f`, `∗₂(ιX) f = −f` | holds; without ι fails |
| §7.4 `VB⁰(C^la) = O^la` | CM torus, `P = G = T` | `VB⁰(O_FL) = O^sm` vs `O^la` (infinite-order analytic character) | constants excluded |
| §2.8 cusps | `Γ₀(3)`; compact Shimura curve | δ = 1 and 0; `du/u ↦ 3du/u` and `du/u`; no cusps | both kinds kept |
| §2.3 Checks | `p = 3`, ss and ordinary | `N = 3, 0, 1`; alternatives 4, 3 | discriminating |
| §1.3 route | modular curve `p = 3`; `μ₃⊕ℤ/3` with `H = μ₃, L = ℤ/3` and `H = ℤ/3, L = μ₃` | `3/4 > 1/4`; equality at 1 and at 0, both integers | holds |
| §1.4 route | `n = 0, ν = ½, η = ¼`, `p = 3` | canonical H: gain `w(1 − 1/p) ≥ 1/6`; `N > 1.5` | `N = 2` suffices |
| §9.7 normalization | `p = 3, z₃ = 4`; `p = 2, z₂ = 3`; −1 | `1/16`, `1/9`, `1`; literal reading forces `(−15/16)m = 0` | algebraic reading kept |
| §2.7 Check | type C, `a = 1`, `(d₁,d₂) = (1,2)` | 1 and 2 walls | corrected |
| §5.1 Check | `u = 3/2, 3, 1` | `1+9ℤ₃`, `1+27ℤ₃`; `u = 1`: `1+3ℤ₃ ∋ 4`, `χ(4) ≠ 1` | corrected |
| §3.3 Check (renamed) | `q = 1`, eigenvalues 1, 4, 4 | `1 − 4X + 6X² − 4X³ + X⁴ = (1−X)⁴` | unchanged |
| gap:solid-vb-sen (new clause) | `𝔾_m`, `P = G` | `VB(O_{G,e}) = O^{Rla}`, `C^la = O_{G,e}` | consistent with §7.4 |

## For the maintainer

- **Supplier contract changed.** The `needs` of `gap:solid-vb-sen` (PerfectoidShimuraVarieties §3.6) no longer asks for `VB⁰(C^la) = O^la`. `C^la` is now constructed here (§7.1c), and a supplier earlier in the merge order cannot state a fact about it. The contract now asks for `VB(O_{G,e} ⊗̂ O_FL) = O^{Rla}` (BCGP25 Remark 4.5.2 and the proof of Theorem 4.5.20(4)), and §7.4 derives `VB⁰(C^la) = O^la` from it with §7.1c(3) and the Chevalley–Eilenberg compatibility. README and `design/plan.json` agree; the rest of `plan.json` is byte-identical.
- **New target, no renumbering:** §7.1c sits between §7.1b and §7.2. No id another roadmap cites was renumbered or removed; GSp4NonregularModularityLifting's former-numbering citations are unaffected.
- **Suppliers dropped:** LieHighestWeight (consumers cite the Tau Ceti declarations, as it asks). Contract rows dropped: ShimuraCompactifications §7.26, AutomorphicBundles §12.15, IntegralHeckeAndGaloisDeterminants §2.3, PadicFamilies §2a.15–2a.16. Each was cited nowhere else in the roadmap.
- **New Source issues:** BCGP21 Definition 5.6.2 (transport at `v ≠ w`); BCGP21 Lemma 5.8.1/Remark 5.8.7 (one-sided commutation); BCGP25 §4.6.46 (limit over slopes in central directions).
- The older copy of this roadmap in the content repository still has the former text; this package replaces it at merge.
- Ownership against open pull requests was checked through the roadmap index (`roadmaps grep`/`show`) at the heads it records.
