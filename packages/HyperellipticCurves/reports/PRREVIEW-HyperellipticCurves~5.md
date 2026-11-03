# Review of HyperellipticCurves (pull request #1707 at bc48fea)

**Verdict:** accepted

Incremental re-review of the 75 lines changed since `8792f4d` (all in `TauCetiRoadmap/HyperellipticCurves/README.md`; `Suggested.lean` is unchanged). The four findings of the previous review are all repaired; one P3 note remains, which the author may take or leave.

## R01 (P3) — State the kernel of the odd-degree `x − T` map over an arbitrary field, since 5.2(c) uses it over `K_v`

**Location:** `TauCetiRoadmap/HyperellipticCurves/README.md:2045–2051` (item (a): “over a number field `K` … a homomorphism with kernel `2J(K)`”) and `:2062–2063` (item (c): “the local descent map has kernel `2J(K_v)`, so the image has order `#(J(K_v)/2J(K_v))`”).

**Claim:** The kernel statement of (a) is stated for a number field, and (c) applies it to the completion `K_v` (including `ℝ` and `ℂ`).

**Witness:** The argument behind (a) is field-generic: for odd degree `J[2] = ker(N : Res_{L/K} μ₂ → μ₂)` and `H¹(K, J[2]) → H¹(K, Res_{L/K} μ₂) = L^×/L^{×2}` is injective because `N(−1) = (−1)^{2g+1} = −1` makes `H⁰(Res μ₂) → H⁰(μ₂)` surjective; nothing uses that `K` is global. The values of (c) are then exactly heights §1.17 (`card_quotient_two_padic`, the real and complex quotients), as the text now says. But as written, (a) is the only place the kernel is a target, and it is over a number field.

**Repair:** In (a) write “over a field `K` of characteristic different from two (in particular a number field or one of its completions)” for the kernel statement, keeping the number field for the unramified-outside-`S` and Selmer parts; then (c) is literally (a) over `K_v`. No value changes.

## Previous findings

- R01 — repaired: 4.7 now reads `H¹_t = ⊕_{𝔰 ∈ A/G_K} Ind ε_𝔰 ⊖ [ℛ übereven]·ε_ℛ` with `A` the even non-übereven clusters other than `ℛ`; convention 12 says a cotwin `ℛ` has `ε_ℛ = ε_{ℛ^*} ≠ 0` but nothing is subtracted; the witness is the first Check of 4.7; the DDMM slip is recorded in the references entry.
- R02 — repaired: 2.6 proves the lift criterion as the roadmap's own lemma (`Y ↦ u + vY`, `v² + v = 0`, `v = 1`, `B = u`, two lifts differing by the involution) and cites Liu 1993 §4.1 only for the `J`-conditions of `C₀`, `C₁` in odd characteristic.
- R03 — repaired: 5.2(c) names heights §1.17 as the owner of `#(J(K_v)/2J(K_v))`, quotes its three values, keeps Poonen–Schaefer Lemma 12.10 as the source, and the `*Needs:*` line and the supplier contract list §1.17.
- R04 — repaired: “Proposition 12.4 and following remark, p. 25”.

## Verified sound

The worktree was not edited. `git diff --stat origin/main...HEAD` outside the folder is empty. No repair report marks a finding “not actionable”.

**Gate, dependency check, elaboration.** My run of the gate on this head printed every counter at 0 and `OK` (the plain run prints no `build=` field; the worker's run records `build=0`). The dependency check with the brief's options returned

```text
depcheck: 204 roadmaps, 1617 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. `lake env lean` on `Suggested.lean` (unchanged since `8792f4d`) gave exactly 16 `declaration uses sorry` warnings and no error; the signature check (`#check @name` on all 35 declarations) and the one-tactic padding probe of the previous review carry over unchanged, since no Lean line changed.

**The changed passages, against the sources.**

| Passage | Locator inspected | Outcome |
| --- | --- | --- |
| Convention 12 (`ε_ℛ` for a cotwin) | ddmm lines 210–213 (Definition 1.11: a cotwin is a non-übereven cluster with a child of size `2g`; `𝔰^*` for a cotwin is that child), 214–221 (Definition 1.12: `ε_𝔰` for `𝔰` even or a cotwin, `0` otherwise), 222–226 (Remark 1.13) | Supported. `ℛ^*` is the unique child of size `2g` (two such children would make `ℛ` übereven for `g = 1` and are impossible for `g ≥ 2`), hence `G_K`-stable; its parent `ℛ` is not übereven and it is not a cotwin, so `(ℛ^*)^* = ℛ^*` and `ε_ℛ(σ) = σ(θ_{ℛ^*})/θ_{ℛ^*} = ε_{ℛ^*}(σ)`. |
| 4.7 toric formula | ddmm lines 293–300 (Theorem 1.19, p. 6–7), 2549–2553 (Theorem 10.1, p. 54), 2503–2513 (Corollary 9.6, p. 53), 2519–2531 (its proof, p. 54), 846 ((2.18), p. 19), 2699–2700 and 2716–2731 (proof of Theorem 11.3) | Supported. The printed statements subtract `ε_ℛ` after a sum over all even non-übereven clusters; the proof subtracts it exactly when `B ≠ ∅`, and the last isomorphism silently needs `ε_ℛ = 0` for odd `ℛ`, which fails for an odd cotwin. The proof of Theorem 11.3 drops the odd-cotwin `ε_ℛ` (it replaces it by `ε⁰_ℛ = 0`), so the conductor formula 4.9 quotes is unaffected. |
| 4.7 Check 1 (cotwin row of 4.6) | ddmm line 2327 (Theorem 8.5 table: `𝔰` principal, `𝔰 < 𝔱` cotwin, `2δ_𝔰` edges) | Supported; the row of 4.6 is the source's. |
| 2.6 lift lemma | liu1993 lines 506–521 (§4.1, printed pp. 210–212: “en car(k) ≠ 2”, items 4.1.1–4.1.4 on orders of automorphisms of `C₀`, `C₁`) | Supported: the locator is now used only for what the page contains; the lemma's proof is the roadmap's own and is checked below. |
| 5.2(b) locator | poonenschaefer lines 1178–1202 (page marker “EXPLICIT DESCENT 25”, Proposition 12.4 at line 1194, the remark at 1199–1202) | Supported: p. 25. |
| 5.2(c) index | poonenschaefer lines 1339–1348 (Lemma 12.10, p. 29: `#J(k_v)/φJ(k_v) = |p|_v^{−g[k_v:ℚ_ℓ]/(p−1)} #J(k_v)[φ]`); HeightsRationalPointsAndObstructions §1.17 on main (`card_quotient_two_padic`: `#(A(F)/2) = |2|_F^{−g} #A(F)[2]` with `|a|_F = q_F^{−ord_F a}`; real quotient `#A(ℝ)[2]/2^g`; complex quotient 1) | Supported; with `p = φ = 2` the lemma's three cases are the three values the README quotes, and §1.17 exists on main with exactly those statements. |
| Supplier contract and `*Needs:*` of 5.2 | heights README §1.17 heading on main | Resolved. |
| References entry for DDMM | the lines above | Accurate: statement printed unconditionally, proof conditional on übereven `ℛ`, Definitions 1.11–1.12 for the cotwin value. |

**Seeded sample.** Of the sampled targets, those the change touches are 2.6 (checked above), 4.2 and 4.4 (their vocabulary and criterion are what the new Checks of 4.7 evaluate: ddmm lines 580–596 for odd, übereven, twin, cotwin, principal and `𝔰^*`; Definition 1.7 as stated in 4.4), and 4.6 (the cotwin row). The other sampled targets (0.2, 1.5, 2.3, 2.7, 3.2, 3.7, 4.1, 4.11, 4.13, 5.3, 5.7) are untouched by the diff and were verified in the previous review's table, which stands.

**Adversarial calculations.** Rows for changed statements carry values computed this round; rows for untouched statements are the previous review's (cited as r4) and are unchanged by the diff.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| Convention 12, `ε_ℛ = ε_{ℛ^*}` for a cotwin | `y² = (x−1)(x−p)(x−2p)(x−3p)(x−4p)`, `p ≥ 5`: `ℛ` size 5 with child `𝔰₀` of size `4 = 2g`, complement `{1}` not a twin, so `ℛ` is a cotwin; `ℛ^* = 𝔰₀`, `𝔰₀^* = 𝔰₀` (parent `ℛ` not übereven); `θ_{𝔰₀} = √(1·(0 − 1)) = √(−1)` with centre 0; `ε_ℛ(Frob) = ε_{𝔰₀}(Frob) = (−1/p)` | Matches Definitions 1.11–1.12; the character is unramified since `v(c_f) + Σ_{r ∉ 𝔰₀} d_{r ∧ 𝔰₀} = 0` is even (Remark 1.13). |
| 4.7 Check 1 (odd cotwin root) | `d_ℛ = v(1 − p) = 0`, `d_{𝔰₀} = 1`, `δ_{𝔰₀} = 1`; `ν_{𝔰₀} = 0 + 4·1 + 0 = 4` (ancestor identity `0 + 4·1 = 4`); semistability: `K(ℛ) = K`, `𝔰₀` principal with `d ∈ ℤ`, `ν ∈ 2ℤ`, `ℛ` a cotwin hence not principal; `A = {𝔰₀}`, `B = ∅` (`𝔰₀^* = 𝔰₀ ≠ ℛ`); potential toric rank `1 − 0 = 1`; `Γ_{𝔰₀}`: `c_{𝔰₀} = (0 − 1) = −1`, `red(ip) = i`, so `y² = −(x−1)(x−2)(x−3)(x−4)` with centre 0 (the README's `−(x+1)(x+2)(x+3)(x+4)` is the same curve with centre `5p`, or under `x ↦ −x`), genus 1; loop of `2δ_{𝔰₀} = 2` edges, one inserted rational component, two components in all; pairing `2(d_{𝔰₀} − d_ℛ) = 2`; repaired formula `H¹_t = ε_{𝔰₀}`, dimension 1; unconditional subtraction `ε_{𝔰₀} ⊖ ε_{𝔰₀} = 0`; 4.9: `U` = five singletons (`λ̃_ℛ = 0`, `λ̃_{𝔰₀} = 2`, all `ξ = 0`), `V = {ℛ, 𝔰₀}`, `dim H¹^{I} = 5 − 2 − 0 = 3`, `n_C = 4 − 3 = 1`; 5.4 toric factor `1 − (−1/p)T` of degree 1 | Every value in the Check is reproduced; the repaired formula agrees with 4.5(7), 4.6, 4.9(ii)–(iii) and 5.4. |
| 4.7 Check 2 (good quintic, three twins, even cotwin sextic) | good quintic: `A = ∅`, `ℛ` odd, `H¹_t = 0`; three `G_K`-stable depth-one twins: `ℛ` übereven, `B = A`, `3 − 1 = 2`, and the quotient of `ℚ_ℓ[B, ε]` by its sum-zero part is `ε_ℛ` because `ε_𝔱 = ε_ℛ` for every `𝔱 ∈ B`; sextic `(x−1)(x+1)(x−p)(x−2p)(x−3p)(x−4p)`: `ℛ` even with children `{1}, {−1}, 𝔰₀`, a cotwin, not übereven, `ℛ ∈ E`, `ε_ℛ = ε_{𝔰₀}`; roadmap formula `ε_{𝔰₀}` (dimension 1), DDMM's printed form `ε_{𝔰₀} ⊕ ε_{𝔰₀} ⊖ ε_{𝔰₀} = ε_{𝔰₀}`, “subtract for every even `ℛ`” gives 0; geometric toric rank: `Γ_ℛ` of genus 0 joined to `Γ_{𝔰₀}` of genus 1 by two chains, one loop | All three values agree with the text; the two negative controls are genuinely wrong models. |
| 4.7 Check 3 (`g = 1`) | `y² = x(x−1)(x−p)`: `ℛ = {0,1,p}` odd with child `{0,p}` of size `2 = 2g`, a cotwin; `θ_{{0,p}} = √(0 − 1)`; `H¹_t = ε_{{0,p}}`, `ε(Frob) = (−1/p)`, split iff `p ≡ 1 mod 4`; reduction `y² = x²(x−1)`, tangents `y = ±√(−1)·x` at the node | Matches the elliptic-curve split/non-split criterion; unconditional subtraction gives 0, a wrong value for multiplicative reduction. |
| 4.7 relation “removes one copy of `ε_ℛ` exactly when `B ≠ ∅`” | `B ≠ ∅` iff `ℛ` übereven: if `ℛ` is übereven, descending through übereven children ends at an even non-übereven cluster (a twin at the latest), whose star is `ℛ`; if not, every `𝔰^* ≠ ℛ` | Matches ddmm line 2531. |
| 2.6 lift lemma | `Y ↦ u + vY` in characteristic 2 with `Y² = Y + F`: `(u + vY)² + (u + vY) = u² + v²F + u + (v² + v)Y`; comparing with `F∘A` in the basis `1, Y`: `v ∈ {0, 1}`, `v = 0` is not an automorphism, `v = 1` gives `u² + u = F∘A − F`; `B' − B ∈ {0, 1}` from `(B − B')² + (B − B') = 0`; sufficiency: `(Y + B)² + (Y + B) = F + (F∘A − F) = F∘A`; `F = x⁵`, `A = ζx`: obstruction 0, `B ∈ {0,1}`; `F = x⁵ + x³`: obstruction `(ζ³ − 1)x³` of odd degree 3, no polynomial `B` since `deg(B² + B) = 2 deg B` | Lemma and Checks correct (r4 row 2.6 values reconfirmed). |
| 5.2(c) kernel and index | odd degree: `H⁰(K_v, Res μ₂) → H⁰(K_v, μ₂)` is onto since `N(−1) = (−1)^{2g+1} = −1`, so `H¹(K_v, J[2]) ↪ L_v^×/L_v^{×2}` and `ker = 2J(K_v)`; §1.17 with `|2|_F = 2^{−[F:ℚ₂]}`: `2^{g[F:ℚ₂]} #J(F)[2]`; odd `p`: `#J(F)[2]`; `ℝ`: `#J(ℝ)[2]/2^g`; `ℂ`: `2^{−2g}·2^{2g} = 1`; the Checks' values `4·#J(ℚ₂)[2]`, `16·#J[2]`, `4/4 = 1`, `16·2^{−4} = 1` | Values match Lemma 12.10 and §1.17; the kernel statement is used over `K_v` while (a) is stated over a number field (R01, P3). |
| 0.1, 0.3, 0.5/3.5, 1.1, 1.2, 1.5, 2.1, 2.2, 2.5, 2.7, 3.1, 3.4, 3.5, 3.6, 3.7, 4.1, 4.2, 4.6 (descent action, scaling, lattice), 4.8, 4.9, 4.10, 4.11, 4.12, 5.1, 5.2 (normalisation), 5.3, 5.4, 5.5, 5.6, 5.7 | r4 table rows (untouched by the diff): e.g. discriminants `−169, 249, 277, 3125, −11664, −65536, −172032`; `I₂ = 8, −216, −256, 0, −960, −640, 135328`; Gram `[[4,2],[2,4]]`, determinant 12, components `6 + 1 − 2 = 5`; nineteen good Euler factors; Brumer–Kramer `(2,4,8,20), (3,2,0,10), (5,1,0,9), (7,0,0,4)` | Unchanged; the 4.7 and 5.4 rows of r4 that flagged the printed formula are now satisfied by the repaired text (`ε_{𝔰₀}`, degree 1, on the odd cotwin; `(1 − T)²` on three twins). |

**Cross-roadmap citations resolved this round.** HeightsRationalPointsAndObstructions §1.17 (“Local doubling indices”, `card_quotient_two_padic`) on main, newly cited in the supplier contract, 5.2(c) and its `*Needs:*`; NeronModelsAndSemistableAbelianVarieties §3.5, §3.13 (4.7's `*Needs:*`, unchanged, headings present at its head); the internal cross-references 4.5(7), 4.6 (cotwin row and lattice), 4.9(iii), 5.4 that the new text and Checks name all say what 4.7 attributes to them. The six leads of the citation scanner are unchanged: `Model.weierstrassForm` is declared at `Suggested.lean` line 135, the other five are LMFDB knowl identifiers.

**Shape and policy.** The new prose contains no process words, pull-request numbers, LaTeX or local paths (gate counters all 0); the Checks are prose with a value and a wrong model each; 4.7 now has a `**Checks.**` list (it had none before); the references entry records the source slip without copying a passage.

## Not verifiable

- **Schaefer 1995** (Elsevier) is cited for the odd-degree kernel statement of 5.2(a); not readable, as in the previous rounds. The cohomological argument above covers it independently.
- **Igusa 1960** §8 (JSTOR) behind the characteristic-2 normal forms that 2.6's lemma is applied to: not readable; the lemma itself is proved in the text and checked above.

## Source issues

- **Error** in ddmm at Theorem 10.1, p. 54, and Corollary 9.6(2), p. 53: the source subtracts `ε_ℛ` from the toric part for every root cluster; it should subtract it only when `ℛ` is übereven, as its own proof of 9.6 (`B ≠ ∅`) shows, since an odd cotwin `ℛ` has `ε_ℛ = ε_{ℛ^*} ≠ 0`; affects a stated result.
