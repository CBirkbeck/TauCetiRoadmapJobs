# FIX-RT-PadicFamiliesPartII~1 — repair report

Both red-team reviews were read in full; every finding was checked against the cached sources (BCGP21, BCGP25, P20, BPS), the sibling roadmaps at their heads and the board packages. Section numbers below are the new ones unless marked "old".

Renumbering made by this round (no other roadmap cites any of these ids; GSp4NonregularModularityLifting cites only E6, S7, F8, which are unchanged): old §2.8 ↔ old §2.9 swapped; old §3.1 deleted, old §§3.2–3.5 → §§3.1–3.4 (the K2 rows of the README's former-numbering table updated); old Layer 6 (Coleman families, §§6.1–6.7) → Layer 5 (§§5.1–5.7); old Layer 5 (doubling) → Layer 6, with old §5.1 → §6.1, new §6.2, old §§5.2–5.9 → §§6.3–6.10.

## RT-PadicFamiliesPartII~1a/F01 (P1) — applied

Verified: the §6.8 route used BCGP21 Proposition 5.4.2, Lemma 5.4.4, Proposition 5.4.3 and Corollary 5.4.5 (BCGP21 lines 5895–5958) with no owner. New target §6.2 "Hasse commutation and vanishing in nonpositive weight", items (1)–(4) with route and four Checks (`l_w(g) = 3 − p`: 0 at p = 3, −2 at p = 5). §6.8 Needs and route cite §6.2.

## RT-PadicFamiliesPartII~1a/F02 (P1) — applied

Verified: BCGP21 line 5800 puts `X^I_1` at level `K_p(I)` (Klingen/Iwahori, selected multiplicative `H_v`). Layer 6 standing paragraph now defines `X₁^I = X_{G₁,1,mix}^I`, `X₁^{I,=w2}`, `X₁^{I,=w1}` and their interiors, and says the spherical `X_{G₁,1}^I` is not used; §§6.8–6.10 use `X₁^I` and `X₁^{I,=w2}`.

## RT-PadicFamiliesPartII~1a/F03 (P2) — applied

§5.3 (old §6.3): "compact on a projective Banach complex … perfect over A" → "projective Banach `A[1/p]`-complex … perfect over `A[1/p]`; no integral lattice of a block is asserted". Added the Check `A = O_{ℂ_p}`, block `ℂ_p` with `U = 1`: rank one over `ℂ_p`, not finite over `O_{ℂ_p}`.

## RT-PadicFamiliesPartII~1a/F04 (P2) — applied

Verified (BPS lines 202, 1108, 1116). Layer 2 defines `J = {i : a_i b_i > 0}` (all i in type C), definite factors (δ_i constant, `n_i = 0`), `c_i` on J only; the §2.1 region is imposed on J; §2.9 adds the zero-dimensional case (`J = ∅`, proper GAGA) and the CM elliptic Check; BPS source issue added.

## RT-PadicFamiliesPartII~1a/F05 (P2) — applied

Verified against P20 lines 709–735 (pure relative dimension n, normal X, smooth open with codimension-two complement). gap:lci-fundamental-class rewritten in README and plan.json: same pure relative dimension, X normal, smooth V of complement codimension ≥ 2, invertible `f^!O_Y`, agreement with finite-flat trace, restriction compatibility, codimension-two extension; `P¹_{ℤ_p} → Spec ℤ_p` named as excluded.

## RT-PadicFamiliesPartII~1a/F06 (P3) — applied

§5.5 Check: weight (5,2) → (6,2): thresholds 5 and 2, minimum 2; k = 2 gives min(3,0) = 0. Same pattern in §5.4: gap-3 Check → gap 4 (`−3 + 5 = 2`); Klingen Check k = 3 → k = 4 (`2 = k − 2`, `5 = k + 1`, `−8`); both had odd gaps.

## RT-PadicFamiliesPartII~1a/F07 (P1) — applied

Verified at the head of LocallyAnalyticRepresentationsOfLocalGroups: §3.4 is for groups, §3.5 for a global character `λ : M → E^×`; BCGP25 line 3086 uses infinitesimal λ ∈ `X^*(T)_E`; no cube root of 4 in ℚ₃. Added gap:solid-positive-monoid (§3.4) and gap:infinitesimal-lambda-smooth (§3.5) in plan.json and the contracts; §7.1b, §7.3, Layer 7 Dependencies cite them.

## RT-PadicFamiliesPartII~1a/F08 (P2) — applied

§6.10 (old §5.9) now assumes `M ≠ 0`; Check added: for `M = 0`, `End(M)` is the zero ring, not local. Source issue added for BCGP21 Remark 5.8.7.

## RT-PadicFamiliesPartII~1a/F09 (P3) — applied

Verified BCGP25 lines 5068–5079 (extension of two potentially unramified twisted planes ⇔ de Rham). §8.6 Check replaced by the local negative control `U(−1) ⊕ U^∨(−2)`, `U = [[1, log χ_cyc],[0, 1]]`: Sen blocks `−1 + N`, `−2 − Nᵗ`, not semisimple, twisted planes not potentially unramified; labelled not an automorphic example.

## RT-PadicFamiliesPartII~1a/F10 (P3) — applied

§5.1 (old §6.1): "the line bundle `ω^κ(−D)`" → "the finite-rank algebraic vector bundle `ω^κ(−D)`, of rank `∏_v (k_v − l_v + 1)` and a line bundle only at scalar weights". The other "line bundle" uses (weight (2,2), `ω_v` as determinant in Layer 6) are scalar and correct.

## RT-PadicFamiliesPartII~1a/F11 (P2) — applied

Verified: HigherHidaAndColemanTheory §4.8 transports the second Λ-action (adjoint of t is `w₀(t⁻¹)`). §9.5 now defines τ, states the perfect pairing `𝓜_w ⊗_Λ τ^*𝓜_{w^*} → Λ` (equivalently `P([t]x, y) = P(x, [w₀(t⁻¹)]y)`); Checks give the inverted central character and the `z = 4·1`, p = 3 obstruction to bilinearity.

## RT-PadicFamiliesPartII~1a/F12 (P1) — applied

Verified: AlgebraicModularFormsAndSerreWeightsPartII §7.5 (open head, merge order 249 < 256) is Pilloni's T as `C_r` with the same factorizations. Old §3.1 deleted; the Layer 3 standing paragraph imports `C_r` with the dictionary `(j,k) = (k+r, r)` and names `T₁`, `T₂`; new contract and gap:spherical-composite-hecke (fan independence, prime-to-p Hecke commutation in all degrees). ShimuraCompactifications §§4.10, 6.16–6.17 dropped as unused.

## RT-PadicFamiliesPartII~1a/F13 (P3) — applied

§6.3 Checks replaced by computed ones: at F = ℚ, p = 3, `x_w = 3`, `π^*λ̃ = 3λ` gives `deg λ̃ = 81/81 = 1`, the printed 27 gives `3⁸`; for F real quadratic `F_w` has degree 27, not the 729 of absolute Frobenius, and 9 on `D_w`; tame marking `3⁻¹ = 2 mod 5`.

## RT-PadicFamiliesPartII~1a/F14 (P1) — applied

Verified: `|L̃_w| = p^{4d−2}`, `v_p Norm(p²x_w^{−1}) = 2d − 1`, so `Norm(p²x_w^{−1})⁴` has p-part `(deg π)²`; `p²x_w` leaves `p⁸`. §6.3: "descended from `p² x_w λ`" → "`π^*λ̃ = p² x_w^{−1} λ`", with the degree argument and the basic property; source issue for BCGP21 Definition 5.6.2 (line 6126). `Norm(x_w)³/p³` in §§6.4–6.5 unchanged.

## RT-PadicFamiliesPartII~1a/F15, RT-PadicFamiliesPartII~1b/F04 (P2) — applied differently

Verified: the scope paragraph tied Layers 4–6 to BCGP21 §§4–6, and doubling sat between Hida control and the Coleman comparison, unforced. Deleted the tie; swapped the layers (Coleman comparison, consuming §§4.4a, 4.6, 4.7, is Layer 5; doubling, using only §§4.1, 4.3, is Layer 6); rewrote "How to read the build". The proposed regroupings were not applied.

Why not regrouped further: the two proposed regroupings disagree, which shows neither is forced. 1b's merge of §§3.1–3.3 into the Hilbert layer would mix the Siegel Klingen-family hypotheses (Λ₁, HigherHidaAndColemanTheory §9) with Hilbert ones. Moving §5.5 to the PEL layer is impossible: its statement needs §§5.1, 5.3, 5.4. 1a's merge of §§4.1–4.3 with §§5.1–5.4 would put analytic Banach constructions before the integral control they do not need. Each layer is now one end theorem with what it needs.

## RT-PadicFamiliesPartII~1b/F01 (P2) — applied

Verified (BCGP21 lines 7472, 7497–7499; P20 lines 4207, 4237). §5.1 now takes `0 < ε_v ≤ 1/p`, the inclusion into the Hodge–Tate neighbourhood (P20 Lemma 14.1.2), restriction from it, the forgetful map via P20 Lemma 14.1.1, and `β_κ` as a map of colimits; two Checks and a BCGP21 §6.5.3 source issue added.

## RT-PadicFamiliesPartII~1b/F02 (P2) — applied

Verified (BCGP21 line 5150). §4.7: the projection `ω^κ → Ω^κ` induces a quasi-isomorphism `e(U^I)RΓ(𝔛^I_mix, ω^κ(−D)) → M_I ⊗^L ℤ_p` for classical κ (`l_v = 2` on I, `k_v ≡ l_v ≡ 2 mod p−1`); the `Ω^κ` fibre is said not to be the statement; rank-3-against-1 Check at p = 3, (4,2) added.

## RT-PadicFamiliesPartII~1b/F03 (P2) — applied

Verified at the head of PadicLocalLanglandsForGL2Qp §0.1 (compact H, `D(H, L)` only; LocallyAnalyticRepresentationsOfLocalGroups requests gap:frechet-stein-general from it). The scope paragraph, the left-to-others list and the §0.1 contract bullet now say "Fréchet–Stein distribution algebras `D(H, L)` of compact groups, used for `D(G_r)`", with `𝒰(𝔤)` attributed to LocallyAnalyticDistributionsPartII §2.5 (verified there).

## RT-PadicFamiliesPartII~1b/F05 (P2) — applied

§6.9 route rewritten in own terms: `Δ ∘ C = U_Iw ∘ Δ`; an eigenvector `Cv = ξv`, `U_{w,2}v = uv` gives `g = −ξ⁻¹f`, `Zf = ξf`, `U_Iw f = ξ⁻¹uf`, so §6.8 applies with `(α, β) = (ξ⁻¹u, ξ)`; dictionary Check added. §6.10 restated from §6.7's algebra, with its own route (Hensel; determinant `(β̃ − α̃)/(α̃β̃)`).

## RT-PadicFamiliesPartII~1b/F06 (P3) — applied

The dimension-one case is now §2.8, self-contained (proper case by §2.7 and GAGA), and the classicality theorem §2.9, which needs §2.8. Summary, Suggested.lean docstring, Examples and worked examples were updated. The pattern at §5.1 is also fixed: the sheaf inclusion no longer cites the later §5.4 and keeps HigherHidaAndColemanTheory §6.6 and BCGP21 Proposition 6.4.2.

## RT-PadicFamiliesPartII~1b/F07 (P3) — applied

Verified (BCGP21 lines 6443–6446; P20 line 1785). §6.7 cites "the matrix before Lemma 5.8.2, p. 133, and the inverse in the proof of Lemma 5.8.3(2), pp. 133–134". The P20 citation, moved with old §3.1 into the Layer 3 standing paragraph, reads "Lemmas 7.1.1 and 7.1.2"; the sources.toml P20 locator likewise.

## RT-PadicFamiliesPartII~1b/F08 (P3) — applied

Verified P20 lines 4867–4869. Layer 3 standing paragraph: "N is the product of the primes `ℓ ≠ p` at which `K^p` is not hyperspecial, that is `K_ℓ ≠ GSp₄(ℤ_ℓ)` (P20 §15.2, p. 107)".

## Checks

- Elaboration: `lake env lean packages/PadicFamiliesPartII/Suggested.lean` from the content checkout: exit 0, no output (≈40 s). The file has no declaration and no `TauCeti.*` import, so no module was built. A `#check @name` scratch file was unnecessary: there are no names. Only the module docstring changed: new section numbers, and §6.7 for the companion operator.
- Dependency check, final run: `depcheck: 239 roadmaps, 2176 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- Citation resolver: one lead, `HigherHidaAndColemanTheory §§9.6` (line 7). HigherHidaAndColemanTheory is a board package earlier in the merge order, with no pull request in the index, and it was cited the same way before this round. Not a defect of this round.
- Gap consistency: 18 slugs in `design/plan.json`, 18 in the README, and 18 "What … must provide" lines; the three sets are equal.
- Overlap input: no dropped ids, no second copy. Ownership was searched by object for the new statements: Corollary 5.4.5, Proposition 5.4.3, partial Frobenius, doubling, U_Kli, positive-monoid algebras. That turned up only AlgebraicModularFormsAndSerreWeightsPartII §7.5, handled under F12. Ownership against open pull requests was checked through the provided tool index and sibling checkouts.
- No gate failures were listed for this round.

## Adversarial pass (new or changed statements)

| Statement | Instances | Values computed | Result / change |
| --- | --- | --- | --- |
| Layer 2 J, dimension `Σ n_i` | type A (1,1),d=1; (0,1); (2,1); type C a=2,d=1 | n = 1, 0, 2, 3; dims 1, 0, 2, 3 | Agrees; J = ∅ iff dim 0 |
| §2.1 region on J | (0,1) factor; (n,c,s) = (3,4,0) | no `k_{i,j,0}`; ε < 1/4 | No condition at definite i; Check added |
| §2.8 dim one | modular curve k = 2; compact Shimura curve | s < 1; no cusps | Self-contained, no forward Needs |
| §2.9 dim zero | CM datum, F imag. quadratic, p split, (0,1) | a = n = 0, δ ≡ 0, `X_Iw^rig = X_Iw(0)` | Classical by GAGA; Check added |
| Layer 3 import | k = 0, r = 2, p = 3; (j,k) = (2,2) | divisors 3⁴ and 3; scalar `p^{3−r}` = 3 | Same as AMFSWII §7.5 |
| Layer 3 fibre of p₁ | superspecial `A[F] = α_p²`; a = 1 surface | ℙ¹ of α_p's; one α_p | "infinitely many" restricted to superspecial |
| N | `K_5 ≠ GSp₄(ℤ_5)` only | N = 5 | Defined |
| §4.7 fibre | p = 3, (4,2) at v ∈ I; (2,2) | ranks 3 vs 1, kernel 2; identity | ω^κ is the statement |
| §5.1 convention | p = 3, ε = 1/3; ε = 2/3 | deg ≥ 2/3 (covered); deg ≥ 1/3 (not) | Range `0 < ε ≤ 1/p` |
| §5.1 forgetful bound | p = 3, n = 4, ε = 7/2; n = 1, ε = 1/2 | ε′ = 1/2; ε′ = 2 (vacuous) | ε′ = 2/n → 0 at p = 3 |
| §5.1 rank | (4,2); (2,2); F quadratic (4,2),(6,2) | 3; 1; 15 | "vector bundle" |
| §5.3 | `A = O_{ℂ_p}`, block `ℂ_p`, U = 1 | rank 1 over ℂ_p, `p^{−n}` unbounded | Perfect over `A[1/p]` only |
| §5.4 Checks | gap 4; gap 2; Klingen k = 4 | −3+5 = 2; 0; 2 = k−2, 5 = k+1, −8 | Even gaps only |
| §5.5 Check | (6,2); k = 2; k = 0 | min(5,2) = 2; min(3,0) = 0; −2 | First even k = 4 |
| Layer 6 carrier | F = ℚ, I = {p}, p = 3 | 4 multiplicative lines at spherical level vs 1 selected | Mixed level used |
| §6.2(4) weight | p = 2, 3, 5 | `l_w(g)` = 1, 0, −2 | Applies for p > 2 |
| §6.2 normalization | p = 3, multiply by `Ha_w ∈ H⁰(ω_w²)` | `3^{−l−1}` vs `3^{−l−3}`, ratio 9 | Weight-dependent normalization needed |
| §6.2 Z = U_Kli | l_w = 0; l_w = 2 | `p²U_Iw + Z`; `U_Iw + Z` | Only l_w < 2 |
| §6.3 polarization | F = ℚ, p = 3, x_w = 3; d = 2, p = 3 | 81/81 = 1 vs 3⁸; `3^{12} = (3⁶)²` | `p²x_w^{−1}` |
| §6.3 degree | d = 2, p = 3 | 27 vs 729; 9 on `D_w` | Partial, not absolute Frobenius |
| §6.3 marking | p = 3, level 5 | `3⁻¹ ≡ 2` | `2πη ≠ πη` |
| §6.9 route | T = 5, U = 6, ξ = 3, u = 6 | v = (3,−1): C v = (9,−3); Z = 3, U_Iw = 2, `U_Iw Z = 6` | α = 2, β = 3 consistent with §6.6 |
| §6.10 | M = 0; M = 𝔽̄₇, U_Kli = 5, U_{w,2} = 6 | End = 0 ring; det `[[1,1],[−1/2,−1/3]]` = 1/6; `Δι_α` = 1 − 3/2 | M ≠ 0 needed; otherwise holds |
| §8.6 control | w = 0 | blocks −1+N, −2−Nᵗ, N² = 0 ≠ N | Not de Rham; planes not pot. unramified |
| §9.5 τ | p = 3, z = 4·1 | 16 ≡ 1 mod 3, z² ≠ 1; `[z] − [z⁻¹] = [z⁻¹]([z²] − 1)` | Bilinear on inherited modules impossible |
| lci gap | `P¹ → Spec ℤ_p`; `p₁ : X_Kli(p) → X` | rel. dims 1 vs 0; 3 vs 3 | Excluded; included |
| λ-smooth gap | E = ℚ₃, λ = 1/3 | unit cubes mod 9 ∈ {1, 8}, 4 ∉ | No global character |
| monoid gap | GL₂ | `T⁺ = T(ℤ_p) × ℤ × ℤ_{≥0}`, r = 2, s = 1 | Matches BCGP25 §4.6.46 |

## For the maintainer

- AlgebraicModularFormsAndSerreWeightsPartII (open) becomes a supplier: §7.5, plus the new gap:spherical-composite-hecke. LocallyAnalyticRepresentationsOfLocalGroups receives two new gaps (§3.4, §3.5). SchemeAndStackFoundations' gap:lci-fundamental-class now states the equal-dimension hypothesis; AlgebraicModularFormsAndSerreWeightsPartII §7.5 cites the same slug and is unaffected.
- External citations of this roadmap (E6, S7, F8, and the horizontal-control contract) are unchanged. The K2 rows of the former-numbering table were updated for §§3.1–3.4 and the import.
- No source was fetched; no `needs-references.toml` request was made. No suspicious instruction was found in the reviews or the fetched texts.
- The P20 author PDF numbers the Hasse-functoriality lemma 6.3.4.2 (p. 34); BCGP21 cites it as Lemma 6.2.4.1 in the journal numbering. The README uses the author-PDF locator, as for every P20 citation.
