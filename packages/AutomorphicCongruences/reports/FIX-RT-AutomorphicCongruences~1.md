# FIX-RT-AutomorphicCongruences~1

Merged findings: pass a (F01–F14, the first fourteen sections) and pass b (F01–F06, the six sections after them). In the body, a-Fnn and b-Fnn name a finding of pass a or pass b. Pass a F06 and pass b F05 are the same three dangling identifiers and are settled once, under pass a F06; pass b F05 refers to it.

## F01 (P1) — applied

§0.7 (ii): "in particular ≥ ord_P(J) when N′ = 0" → the bound needs N′ = 0 together with orbit spanning, ℒ ⊗_A Frac(A) = M (SU Lemma 4.3.10(iii), SU line 2031). (iii) now needs that spanning or the hypothesis of SU Lemma 4.3.11, with the faithfulness proof (Ann_A(N) ⊆ J). New negative-control Check uses the split datum over ℚ(i), p = 5. §1.9 now cites SU Thm 7.3.1 for Lemma 4.3.11, as SU's proof of Thm 7.3.3 does (SU line 4152).

## F02 (P1) — applied

§2.19 Yager module: coefficients Ẑ_p^ur → Ô_∞, the completion of ⋃ O_(K_m) (FW line 2605; LZ14 Prop. 3.6 and Lemma 3.1, LZ14 lines 444–455). Changed: S ⊆ Ô_∞[[U]] and ρ(d) ∈ Aut(F ⊗ Ô_∞). New Check: Frobenius has order 2 on W(𝔽₉), so a pro-3 U cannot act; a Teichmüller a ∉ ℤ₃ would give augmentation outside ℤ_p.

## F03 (P3) — applied

§5.3 domain-of-β Check: "vanishes exactly when … W = 0" → "vanishes whenever w(κ0) = 0; exactly then when T is a surviving anticyclotomic variable (β(T) = T ≠ 0); for T = γ_cyc − c the product vanishes with w(κ0) = p ≠ 0."

## F04 (P2) — applied differently

§2.15 now lists CW's standing hypotheses: p > 3, 𝕀 regular, D_K prime to Np, ρ̄ irreducible and p-distinguished, trivial tame character (CW lines 44–52, 335–343, 549–550). It also records KLZ17's p ≥ 5 from §7.2 (KLZ17 line 2142). The FW route (p = 3, weight k, K ramified at ℓ) is registered as an "FW form" owned here, without a separate adapter subsection. Added Checks for 11a1 at p = 5 and for p = 3. §2.17 is updated to match.

Reason for the different form: FW §4.8 (FW lines 4005–4013) asserts the extension without proof. So the general statements are targets of this roadmap, not new sections. The finite-slope analytic family remains in §2.20.

## F05 (P2) — applied differently

§2.10/§2.11 are applied as asked. §2.10 now ends with the rational function. The factorization consequence, the integrality via FW Lemma 7.22 (two-denominator proof, API bullet, disjoint-support Check) and the source line moved to §2.11. §2.13's Needs gained §2.11.

§5.3/§5.4 are not renumbered. HeegnerPointEulerSystems (open roadmap pull request) cites this roadmap's Layer 5 by number ("L5w.3 … primitive periods", "L5w.10"), and a swap would silently retarget it. The edge §5.3 → §5.4 has no cycle: §5.4's Needs are §§1.1, 1.2, 5.2 plus suppliers. §5.3's statement now names §5.4 as the construction of L^Σ, states that the construction does not use §5.3, and §5.3's Needs list §5.4.

## F06 (P3) — applied

Also settles b-F05. In §4.2, "integrality-of-universal-trivialization" → §4.1. In §4.3, "fw-pointwise-theorem" → the parity argument recorded in the Layer 3 Examples and applied in §4.5. In §4.5, "GenMC.point_iff_kato" → "the determinant/characteristic criterion of §3.4, as applied in §3.10". Same pattern fixed in §§3.1–4.5: the labels T51, T17, A21, A35, A37 → T5.1, T1.7, A2.1, A3.5, A3.7, as §3.1 defines them.

## F07 (P1) — applied

§5.3: (NV2) now concerns the primitive v-restricted function L^(−)_v = L^(Σ,−)_v ∏(E⁻_(q,v))⁻¹. At a nonsplit q, E⁻_(q,v) is a constant (Frobenius fixed by c); at a split q it has μ = 0. Consequence added: μ(L^(Σ,−)_v) is the sum of the nonsplit ord_ϖ E⁻, and the function is ϖ-indivisible iff every nonsplit factor is a unit.

The witness (11a1, p = 7, q = 113) was recomputed: a_113 = 9, the factor is 12915/12769 with v_7 = 1, and it reduces to 4 − a² ≡ 0 mod 7. It is now a Check. Also checked: §5.9 already applies Wan 87 to the primitive normalization, §5.10 makes no imprimitive μ = 0 claim, and the gap:anticyclotomic-rankin-selberg contract already retains the nonsplit factors.

## F08 (P2) — applied

§3.7 API: "Base change … commutes with Iwasawa cohomology (perfect complexes)" → derived base change. The specialized map is z ⊗ A composed with H¹(C) ⊗ A → H¹(C ⊗ᴸ A). That map is injective with cokernel H²(C)[f] for one nonzerodivisor; otherwise the spectral sequence is kept. Added the k[[X]] witness as a Check. Same pattern fixed in §4.8's definition of the residual map and its proof paragraph (Nakamura (91), NAK line 3591).

## F09 (P3) — applied

§5.2 Checks: three scope reminders were moved into the "Assume" paragraph. Two period Checks were added. With numerator 10 and η = 5 the period is 2, and the unit rescaling 2η gives 1. The wrong direction (multiplying by η) gives 50. The nonunit change η = 25 gives 2/5, which changes the ideal. The ℤ₅[x]/(x(x−5)) Check is kept.

## F10 (P3) — applied

Locators corrected against NAK lines 3151–3239, 3413, 3590–3600 and 3656:
- "§4.4, (68)–(78)" → "(68)–(76), pp. 71–74" in §3.8;
- "change-of-Σ formula (79)" → "(77), p. 78" in §3.8;
- "Nakamura (92)" → "(93), p. 84" in §4.10, twice;
- "residual comparison (91)" → "(91)–(92), pp. 82–83".

## F11 (P1) — applied

The Betina–Williams function is now a supplier gap, gap:bianchi-p-irregular-l-functions on PadicFamilies, Layer 4 (after §4.9). It is added to plan.json `gaps` and under "From TauCetiRoadmap.PadicFamilies", with BW Theorems A–C, pp. 2–4 (BW lines 65–129, 166). §2.20 now imports the function from this gap, and its Needs list it.

PadicFamilies §4.9 (open roadmap pull request head) needs distinct Hecke roots and noncritical refinement, so it does not cover α = β. The ownership search (`roadmaps grep` for Betina, p-irregular and Bianchi) found no other owner.

## F12 (P3) — applied

The `Suggested.lean` module docstring now names the owned deep intermediate theorems that are not statable at the pins, each with what it lacks: §0.7, §§2.4/2.6/2.12, §2.19, §3.2 and §3.7. No declarations were added.

## F13 (P3) — applied

Changes in the 30 listed Checks blocks:
- Scope reminders moved into each section's "Assume" or statement paragraph. Reminders that only repeated the statement, or named a consumer, were dropped.
- Computed Checks added in place of the reminders.

Every value was recomputed. Two of the reviewer's proposals were corrected:
- §2.18: 13 is a real discriminant, so the inert example is D_K = −3 (≡ 5 mod 8). A p-splitting example was added: −91 splits 5, and −7 does not.
- §2.5: the excluded prime is (ϖ), the prime that meets Ô^ur_L.

§2.2 gained a computed torus-algebra Check: p − 1 components, 4 at p = 5.

## F14 (P3) — applied

§4.5: the BSD consequence (FW Cor. 5.4) is now marked as a source consequence outside scope; only Cor. 5.3 and the main conjecture are targets. The BSD Check in §3.10 is rewritten in the same way. The scope sentence in "Downstream consumers" is unchanged and now agrees with both.

## F01 (P3) — applied

Layer 1 introduction "(SU §2, SU line 469)" → "(SU §2, author-copy p. 13)". In gap:hilbert-cm-unit-congruence, "Wan-2015 lines 4061–4069" → "the proof of Wan-2015 Proposition 96, p. 80". Both the README and plan.json `needs` were changed (Wan-2015 lines 4021 and 4059).

## F02 (P3) — applied

§2.6 "(SU Thm 7.5, …)" → "(SU Thm 7.3.1, p. 103, cited by CLW as [SU14, Theorem 7.5] in the journal numbering; …)". Verified at SU lines 4010 and 4028.

## F03 (P3) — applied

§0.9: "HT94 Theorems 0.1–0.2 prove the opposite divisibility" → only HT94 Thm 0.2 (with HT93 Thm I) does that. HT94 Thm 0.1 is the rational divisibility of the anticyclotomic characteristic series by the Katz function (HT94 lines 114–115, 145–146).

## F04 (P3) — applied

§4.9 now cites condition (a) as NAK-v2 Thm 5.2, p. 75, and condition (b) as NAK-v2 Thm 5.10(4), p. 79, with X(ρ̄)_b after Conj. 5.12, p. 80. The §4.10 reference and the source line are updated the same way (NAK lines 3296–3300, 3473–3478, 3492).

## F05 (P3) — applied

Same identifiers as a-F06; settled there.

## F06 (P3) — applied

**CGS23 v2.** arXiv:2303.04373v2 was fetched through the sources service (open repository). It confirms the README's CGS-v2 statements: the same normalization and the missing √|D_K| factor (CGS-v2 lines 390–401), and the "Remark 2.3.2" misreference (line 420). v2 is recorded on the existing CGS23 key (`locator`, `version_note`); the References entry links v2.

**Published NAK.** The published version was not read, so every claim about it is deleted:
- the reversed tilde notation;
- the bare-c coefficient;
- the published page numbers in §§3.7, 3.8 and 4.7;
- the numbering correspondences and the additional conjecture in §§4.8–4.10.

Only arXiv-v2 locators remain. The NAK `locator` now lists the equations cited.

## Checks run

- `lake env lean packages/AutomorphicCongruences/Suggested.lean` (from the content checkout): exit 0, no output. The file declares nothing. The `#check @name` comparison is therefore vacuous, as there is nothing to elaborate and no binder can be lost. The file still has a single `import Mathlib`, no `set_option` and no `sorry`.
- Dependency check, exact output:

```text
depcheck: 56 roadmaps, 672 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or moved line.
- `roadmaps resolve` reports one lead: "KatoEulerSystems, §§0.1". KatoEulerSystems is a board package (the last entry of the merge order) and is not a pull request, so this is a false lead.
- `sources check sources.toml`: 0 problems.
- Gap consistency: 17 slugs in plan.json, 17 in the README and 17 "What … must provide" lines, with no mismatch.
- No gate failures were listed for this round.

## Adversarial pass on changed statements

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §0.7(ii) spanning case | split σ = χ′⊕ρ⊕χ, K = ℚ(i), p = 5, I = (5) | N = N′ = 0. (1+i)⁴ = −4 = 1 − 5, so v₅(log) = 1. Selmer = 0 (valuations kill 2±i; 1+i is injective locally) and ord_P(J) = 1, so 0 < 1 | the old claim is false; the new one needs spanning |
| §0.7(iii) via Lemma 4.3.11 | N = (A/ϖ²) ⊕ (A/ϖ), J = (ϖ²) | Ann(N) = (ϖ²) ⊆ J, ℓ(N) = 3 ≥ ℓ(A/Ann) = 2 ≥ ord(J) = 2 | holds |
| §2.19 coefficients | p = 3, W(𝔽₉) | Frobenius has order 2, prime to 3, so U cannot act; Ô_∞^U = ℤ₃ | fixed |
| §5.3 β Check | w = p, T = γ_cyc − c | β(WT) = p·0 = 0 although w ≠ 0 | "exactly" is restricted |
| §5.3 (NV2) | 11a1, p = 7, q = 113 inert | a = 9 ≡ 2. Factor at weight 2: 12915/12769, v₇ = 1. At any weight, 4 − a² ≡ 0 mod 7 | imprimitive μ ≥ 1; primitive (NV2) unaffected |
| §5.3 consequence | factors E₁ (split, μ = 0) and E₂ (nonsplit, ord 1) | μ(product) = 0 + 1 = 1 | holds |
| §3.7 base change | A = k[[X]], C = [A →X A] in degrees 1–2 | H¹(C) = 0, H¹(C ⊗ᴸ k) = k, cokernel = H²(C)[X] = k | the API now says the map is not an isomorphism |
| §5.2 period | numerator 10, η ∈ {5, 10, 25} | periods 2, 1 and 2/5; ratios 1, 2 (a unit at 5) and 5 (a nonunit) | the Checks discriminate |
| §2.15 CW form | 11a1, p = 5 | rational 5-torsion makes ρ̄ reducible, so the hypothesis fails | excluded |
| §2.15 FW form | p = 3 | KLZ17 §7.2 assumes p ≥ 5 | the extension is owned here |
| §2.18 Check | D = −7, −3, −4, −91 | mod 8: 1, 5, 4 → split, inert, ramified. (−91/5) = 1 and (−7/5) = −1 | correct |
| §3.2 Check | B = O[[x,y,z]][t]/(t² − x²) | rank 2, reduced, embedding dimension 5 > 4 | singular, as stated |
| §4.5 Check | p = 5, k = 2 | 2a ≡ 1 mod 4: no solution. p = 3: 2a ≡ 1 mod 2: none | holds |
| §7.3 Check | M = A/(p, Y) | Ch_A = (1), char(M/YM) = (p), (1) ⊇ (p) | direction confirmed |
| §2.13 Check | L = X + Y and X − p | the Y-coefficient of X + Y is 1; X − p ∈ (X − p) | correct |
| §2.21 Check | [[1,1],[0,1]] and [[1,p],[0,1]] | (σ − 1)-cokernels ℤ_p and ℤ_p ⊕ 𝔽_p | correct |
| §7.5 Check | valuations (1,2,0,3) and (2,2,1,3) | sums 6 and 8, so 8 ≥ 6 | correct |
| §2.2 Check | ℤ₅[[ℤ₅^×]] | ℤ₅[μ₄] ≅ ℤ₅⁴ gives 4 components | correct |

## Ownership and citations

- **New supplier gap.** gap:bianchi-p-irregular-l-functions names PadicFamilies, Layer 4, an open roadmap pull request read at its head. No other roadmap on main, among the open heads or in the board packages owns a Bianchi p-irregular construction.
- **Notions moved down.** None.
- **Citations re-checked:** PadicFamilies §4.9 (distinct-root hypothesis); HeegnerPointEulerSystems' Layer 5 citations; KLZ17 §7.2, p ≥ 5.

## For the maintainer

- **Section numbers.** Layer 5 is not renumbered, because HeegnerPointEulerSystems cites L5w.3 and L5w.10. If a later review insists on swapping §5.3 and §5.4, that roadmap's citations must change with it.
- **For ModularIwasawaMainConjectures.** It cites §§2.21, 4.3 and 4.5:
  - the scope of §2.21 is unchanged;
  - the FW form in §2.15 is now an owned target, so the p = 3 endpoint rests on this roadmap proving the KLZ/CW extension;
  - §4.5 no longer asserts the BSD corollary.
- **Source issues in pass a.** Its list (SU Prop. 4.5.6(ii), Wan-2015 Def. 85/Thm 86, NAK and CGS misprints) is consistent with the repairs above. No source file or passage was copied.
- **No suspicious instructions** were found in the reviews.
