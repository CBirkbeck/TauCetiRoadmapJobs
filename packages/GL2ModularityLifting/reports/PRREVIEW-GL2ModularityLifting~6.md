# Review of GL2ModularityLifting (pull request #1071 at 4286b04)

**Verdict:** needs changes

This is an incremental re-review of 12 changed lines since 5dd2828. The previous R01 is repaired as requested. The new §8.9 sentence assigns ownership correctly, and the new *Needs:* entries resolve at the supplier's head. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with exactly two `sorry` warnings.

§8.9 is in this round's seeded sample, and the diff changes one of its paragraphs. Checking it against Dieulefait–Pacetti found one misattributed locator (R01). §12.8 is a changed target, and its page range for DP §2 is wrong (R02). A scan of every *Needs:* line, prompted by this diff's removal of a duplicate from §12.8, found two more repeated items (R03). All three are P3.

## R01 (P3) — §8.9 credits Lemma 2.1 for hypothesis (i) in Paso 2, and puts the final step in §2

**Location.** `TauCetiRoadmap/GL2ModularityLifting/README.md` line 2372 (§8.9): "For (i) the source supplies: … in Pasos 2–3 and Lemma 2.3, the good-dihedral prime N (Lemma 2.1)". Line 2376: "The list of uses is read from Dieulefait–Pacetti §2". Line 2378: "List every appeal to Theorem 1.4 in §2 (pp. 10–15)".

**Claim.** In Paso 2, DP apply Theorem 1.4 at q to `ρ^{(1)}_q` and `ρ^{(2)}_q`. Lemma 2.1 cannot supply hypothesis (i) there, for two reasons:
- Lemma 2.1 assumes a system whose local type at N is the dihedral type. `{ρ^{(1)}_ℓ}` is not ramified at N yet.
- Lemma 2.1 concludes only for primes in `S₁ ∪ {2, 3}`, and q is chosen larger than every prime of `S₁` and larger than 5.

In Paso 2 the source gets (i) from Lemma 1.14 at weight two together with the split on solvable residual image, exactly as in Paso 1. Separately, the "final step", in odd characteristic, is in DP §3 ("The case p = 2"), not §2. So a reader who uses the paragraph as "a table of locators" (line 2376) looks in the wrong place twice.

**Witness.** dp lines 465–472: Lemma 1.14 at q, then the case split "solvable ⇒ modular by Theorems 1.3, 1.4, 1.6; else non-solvable". dp lines 503–504: Theorem 1.4 at q. dp lines 507–512: Lemma 2.1 needs the N-type and covers `p ∈ S₁ ∪ {2,3}`. dp lines 689–703: §3, Theorem 1.4 in odd characteristic.

**Repair.** In line 2372, replace "in Pasos 2–3 and Lemma 2.3, the good-dihedral prime N (Lemma 2.1)" with:

> "in Paso 2, `q > 5` with Lemma 1.14 at weight two (a bad dihedral `ρ̄_q` needs `q ∈ {1, 3}`) and the split on solvable residual image; in Paso 3 and Lemma 2.3, the good-dihedral prime N (Lemma 2.1); in the final step (§3), Lemma 1.14 at weight two with an auxiliary prime greater than 3"

Then make three locator changes:
- Line 2376: change "Dieulefait–Pacetti §2" to "Dieulefait–Pacetti §§2–3".
- Line 2378: change "in §2 (pp. 10–15)" to "in §§2–3 (pp. 10–15)".
- Line 2386: add "[DP] §3, p. 15 (arXiv v2)".

Tested on the refuting instance. In Paso 2, `q ≡ 1 mod 4` and `q > 5`, so `q ≥ 13`. With k = 2, Lemma 1.14's bad-dihedral primes are `2k−3 = 1` and `2k−1 = 3`, so `ρ̄_q` is not bad dihedral. The solvable case ends the argument and the remaining case is non-solvable, which gives (i) by §7.5. In the final step, `p > 3 = 2·2 − 1` (dp line 698).

## R02 (P3) — §12.8 gives DP §2 as pp. 9–14; in arXiv v2 it is pp. 10–15

**Location.** `TauCetiRoadmap/GL2ModularityLifting/README.md` line 3020 (§12.8 sources): "§2, pp.9–14 (arXiv v2)".

**Claim.** Both ends of the page range are off by one, and the range disagrees with the README's own line 2378, "§2 (pp. 10–15)".

**Witness.** The heading "2. The proof of Serre's modularity conjecture for p ≠ 2" is at dp line 429, after the marker for page 10 (dp line 423). The section's last sentence, "This concludes the proof … odd characteristic", is at dp line 688, on page 15 (marker at dp line 683).

**Repair.** Replace "§2, pp.9–14 (arXiv v2)" with "§2, pp.10–15 (arXiv v2)". Checked: dp line 429 is on page 10 and dp line 688 is on page 15. The other locators of §12.8 are correct (rows below).

## R03 (P3) — two *Needs:* lines still repeat an item

**Location.** Line 1121 (§4.2): "DeformationAndDerivedPatchingAlgebra §3.9; DeformationAndDerivedPatchingAlgebra §3.9". Line 1894 (§6.14): "DeformationAndDerivedPatchingAlgebra §6.5; DeformationAndDerivedPatchingAlgebra §6.5".

**Claim.** This diff removed a repeated "ArithmeticGaloisRepresentations §1.9" from §12.8's *Needs:* line. The same defect remains in two other targets.

**Witness.** Splitting every `*Needs:*` line of the README on ";" and comparing items finds repeats at lines 1121 and 1894, and nowhere else. Line 3022 now has none.

**Repair.** Delete the second copy in each line. Checked: after the deletion, the same scan reports no repeats.

## Previous findings

- R01 — repaired: line 3004 now reads "The family hypotheses are the `RankTwoFamily` data of the Conventions with their common arithmetic good polynomials; no existence theorem, strict or almost-strict compatibility, or all-member de Rham predicate is invoked." It agrees with lines 31, 33, 67 and 2992. No new problem.

## Verified sound

**Gate, dependency check, diff.**
- The worker's gate at 4286b04 reports every check 0 and `build=0 OK`.
- My re-run of `gate … --base origin/main` reports every check 0 and `OK`.
- The dependency check with `--movable` prints `depcheck: 245 roadmaps, 2483 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat 5dd2828 HEAD` touches only the README (6 insertions, 6 deletions).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GL2ModularityLifting'` is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean.** `Suggested.lean` is unchanged since 5dd2828.
- `lake env lean` gives two `sorry` warnings (lines 48 and 87) and nothing else.
- A scratch copy with `#check @` on all five declarations (`odd_involution_descent`, `completionAt`, `completionAtField`, `completionAtAlgebra`, `cht_soluble_prescribed_completions`) prints types identical to the signature file. The file has no `variable` block, so no binder can be lost.
- The signature file's `-field` "class" and its "line 104" error are artefacts of the tool, as in r5: "class-field" is text in the docstring, and the file ends at line 102.
- The module docstring's Layer 12 bullet already names the `RankTwoFamily` carrier, consistent with the diff.
- The one-tactic probe result of r5 stands for an unchanged file: neither theorem closes, so neither is padding.
- Headline theorems: §0.1 descent and §1.7 CHT are stated. The docstring names the headlines of Layers 0–12 and §10.7a that are not statable, with the carriers each lacks.

**Changed passages, resolved at the heads.** Supplier and consumer heads were read through `roadmaps show`; the line numbers are those of the dumps.
- **Line 2374, the Khare–Wintenberger predicates.** PotentialModularityAndCompatibleSystems (#1075) owns them. Its line 31 reads "It adds what those do not contain: the Khare–Wintenberger rank-two predicates", and its §1.2 (line 117) defines KW plain and KW almost-strict compatibility.
- **Line 2374, families through a given lift.** That roadmap's §12.5, "Families through given lifts" (line 1886), constructs the DP almost-strict family through a given ρ. It is at merge-order line 171, after this roadmap (line 170), so naming it is a deferral to a consumer, not a supplier citation. `roadmaps grep` for KW almost-strict finds no other owner.
- **Line 2374, the eigenform families.** AutomorphicGaloisRepresentations (#1007) §7.3, "The fixed-eigenform compatible family", is at line 3615.
- **Line 2374, the applications of Theorem 1.4.** ClassicalSerreModularity (#1020) applies Theorem 1.4 to members of systems through `R33.1/dp-modularity-lifting-inputs` (line 1323), in R33.2–R33.5 (*Needs:* at lines 1384, 1409, 1434, 1481 and 1508).
- **Lines 2965, 2988, 3022 and 3030.** SmallRamificationAndAbelianVarietyBaseCases (#970) §5.0d, "Minimal lifts and their compatible families", is at line 1981, and its raw carrier at line 1994. That roadmap is at merge-order line 116, earlier than this one. The Layer 12 Dependencies line now lists it, matching the three *Needs:* lines.
- **Line 3022.** "ArithmeticGaloisRepresentations §1.9" now occurs once, and AutomorphicGaloisRepresentations §1.5 is retained.
- **Citation leads.** The four `HeckeGaloisDatum` leads in `citations.md` resolve at GlobalGaloisDeformations (#920): its lines 1634, 1635, 1672 and 1688.
- **Overlaps.** `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The diff introduces no new object.

**Seeded sample.** §8.9 falls in the changed passages and was checked against DP arXiv v2:
- Lemma 1.14 is on p. 8 (dp line 367).
- Paso 1 is on p. 10 (dp lines 438–454), and Paso 2 on pp. 10–11 (dp lines 460–506).
- Paso 3 is on p. 12 (dp lines 543–558). The proof of Lemma 2.3 is on p. 13 (dp lines 574–592).
- Pasos 5–6 are on p. 14 (dp lines 637–682), and the §3 step on p. 15 (dp lines 689–703).
- The application points (w, q, the odd `p_i`, 3, N, 5, odd characteristic) and Checks 1–3 agree with the source. The exception is the Paso 2 attribution and the §2/§3 split (R01).

§§8.8 and 12.2 were compared with DP Theorems 1.4 and 1.5 (dp lines 140–164): the hypotheses match. The other sampled targets (1.6, 1.7, 2.2, 3.4, 4.2, 5.7, 6.5, 6.6, 7.8, 8.3, 9.3, 10.14) lie outside the changed lines. Their locators were not re-read, and their statements have computed rows below. The README flags no locator as unverified.

**§12.8 locators** (a changed target):
- DP Theorems 1.4–1.7 are on pp. 4–5 (dp lines 140–181).
- DP Definition 1.10 is on pp. 6–7 (dp lines 273–292) and Remark 4 on p. 7 (dp line 308).
- Pan Theorem 1.0.2 is on p. 3 (pan line 100).
- The SW99 main theorem is on printed p. 6, PDF p. 3 (sw99 lines 63 and 93).
- The §§12.6–12.7 locators, Definition 1.10 and Remark 4 on pp. 6–7, are correct.
- The only bad locator is the §2 page range (R02).

**Adversarial table.** The first block holds the changed statements, this round's sampled targets and the findings, with computed values. Rows marked "(r5)" are carried unchanged from the previous report, for statements the diff leaves untouched.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.9 (i), Paso 2 attribution | `q ≡ 1 mod 4`, `q > 5`, k = 2; `{ρ^{(1)}_ℓ}` before N is added | Lemma 1.14 bad-dihedral primes are `{2·2−3, 2·2−1} = {1,3}`, and `q ≥ 13`. Lemma 2.1 needs the N-type and `p ∈ S₁∪{2,3}`; q exceeds both | source uses Lemma 1.14 and the solvable split, not Lemma 2.1 | R01 |
| §8.9 (i), Paso 1 | k = 3, w = 7 > 2k | bad dihedral needs w ∈ {3, 5}; 7 ∉ {3, 5}. Reducible case: `w > 2k ≥ 4` gives `w ≥ 5`, Theorem 1.6's range | sound | none |
| §8.9 (i), Paso 3 and Lemma 2.3 | `p_i ∈ S₁`; p = 3 | Lemma 2.1 covers `S₁∪{2,3}`; dp lines 549–551 cite it for the `ℚ(ζ_{p_i})` hypothesis; Lemma 2.3 is at 3 | sound | none |
| §8.9, Pasos 5–6 and final step | level 1, `N ≡ 1 mod 4`; p = 5; §3 auxiliary p > 3 | Paso 5 case (3) is excluded by Lemma 1.14 and Remark 5; Paso 6 case (2) is excluded because `5 ≢ 3 mod 4`; final step `p > 3 = 2·2−1` | sound as mathematics; the final step is in §3 | R01 |
| Line 2374, the owners named | 11a1 at λ = 5: `ρ̄₅^{ss} = 1⊕ω₅` (rational 5-torsion), `5 ∉ S = {11}`, `a₅ = 1` | KW almost-strict (PMCS §1.2) at `ℓ ≠ 2` with an unramified parameter asks only crystalline weights {0,1}. DP (AGR §7.1) asks the full comparison, Frobenius polynomial `X² − X + 5`. The two differ, so the KW predicates are a separate object, owned by PMCS §1.2; the family through a given lift is PMCS §12.5 | sound | none |
| Line 3004 (§12.8) against lines 31, 33, 67, 2992 | B = the 11a1 system, `P₂ = X²+2X+2`, `P₃ = X²+X+3`; a semisimple member with these traces at all good q | the hypotheses touch only `ρ_{A,λ_A}` and `ρ_{B,λ_B}`. Chebotarev and Brauer–Nesbitt make any such member ≅ `ρ_{g,λ}`, which is de Rham, so dropping the all-member predicate loses nothing. Line 31: a view of §5.0d; line 33: good-polynomial predicate only; line 67: §5.0d consumed by §§12.6–12.8; line 2992: `𝓕_i : RankTwoFamily` | consistent under all four | previous R01 repaired |
| *Needs:* lines 2965, 2988, 3022; Dependencies line 3030 | merge-order positions; §5.0d at the #970 head | SRAVBC is at line 116 and this roadmap at 170; §5.0d is at dump line 1981; depcheck reports 2483 edges and 0 problems | sound | none |
| §12.8, DP §2 page range | page markers | heading at dp line 429 on p. 10; end at dp line 688 on p. 15; the README says pp. 9–14 | off by one at both ends | R02 |
| §12.8, other locators | DP Theorems 1.4–1.7, Definition 1.10, Remark 4; Pan 1.0.2; SW99 | pp. 4–5, 6–7 and 7; Pan p. 3; SW99 printed p. 6 / PDF p. 3 | as stated | none |
| *Needs:* repeats | every *Needs:* line split on ";" | repeats at lines 1121 (§4.2) and 1894 (§6.14); line 3022 has none | two leftovers | R03 |
| §2.2 | Q = ∅; Q = {v} with `N(v) − 1` of p-adic valuation n | `Δ_∅ = 1`, so `O[Δ_Q] = O` and the image is `𝕋_ψ(U)`; `Δ_v` = p-part of `(O_F/v)^×`, of order `p^n` | sound | none |
| §4.2 | Savitt's `O⟦T₁…T₅⟧/(T₁T₂−p)`; r = 0; `O[[x]] → O` on M = O | the special fibre `k⟦T⟧/(T₁T₂)` has two minimal primes, so the ring is not formally smooth and §3.7 applies; r = 0 gives the empty regular sequence; kernel (x) ≠ 0 while the target action is faithful | sound | none |
| §5.7 | F = ℚ(√2), p = 3; p = 5 with image PGL₂(𝔽₅) | 2 is a non-square mod 3, so 3 is inert with residue field 𝔽₉, and the 𝔽_p condition fails at a non-potentially-ordinary place. `|PGL₂(𝔽₅)| = 120 = |S₅|`; its index-2 subgroup `PSL₂(𝔽₅) ≅ A₅` is the case over `F(ζ₅)` that the extra condition addresses | sound | none |
| §6.5 | s = 1; h = 1, j = 4, s = 2 | `M∞ ≅ S∞`; `M∞/(y₁…y₅) ≅ O²`, an O-free M of rank 2; quotienting by J and then the framing variables equals quotienting by all y | sound | none |
| §6.6 | t = 1 over ℤ₂: λ = −1 and λ = 3 ∈ 1 + 2ℤ₂ | `(−1)² = 1` preserves d = 1; `3² = 9 ≠ 1` does not; `T[2] = μ₂` | sound | none |
| §8.3 | `|R| = 0, 1`; `R̄∞/π` with two reduced components | factor `2^{−|R|}` = 1 and 1/2. M of generic rank 2 on both components: `e(M/π) = 4` and `4/2 = 2 = e(R̄/π)`, faithful. M on one component: `2/2 = 1 < 2`, not faithful | sound | none |
| §8.8 against DP Theorem 1.4 | dp lines 140–155 | odd p; odd, finitely ramified; `ℚ(√p*)`-irreducible; de Rham `{0,k−1}`, k > 1; residually modular; p = 3 via Tung (dp line 155). The same list as §8.8 | sound | none |
| §10.14 | p = 3; F = ℚ(√5) at p = 11 and p = 3 | `ω₃` has order 2, so `ω = ω^{−1}` and there is one exclusion; `5 ≡ 4² mod 11`, so 11 splits; 5 is a non-square mod 3, so 3 is inert and outside the hypothesis | sound | none |
| §12.2 against DP Theorem 1.5 | residual images SL₂(𝔽₂) and SL₂(𝔽₄) | `|SL₂(𝔽₂)| = 6` (≅ S₃, solvable): excluded; `|SL₂(𝔽₄)| = 60` (≅ A₅): admitted. The hypotheses match dp lines 157–164 | sound | none |
| Line 31, `RankTwoFamily` as a view of the raw carrier | two base-`ℚ` data that differ only in Hodge multisets {0,−1} and {0,−2} | same E, S, `P_q`, `ρ_λ`, `L_λ`; identified by the quotient | sound (r5) | none |
| Line 65, Frobenius adapter | elliptic `X² − (a_q/q)X + 1/q`; cyclotomic `X − q⁻¹` | `X² − a_qX + q`; `X − q` | sound (r5) | none |
| Line 67, arithmetic compatible family not an input | §§12.6–12.8 hypotheses | no `E_λ`-model assumed | sound (r5) | none |
| Line 185, OAFML §5.8 | `R = k[[t,x]]`, `T = R/(x)` | `ker = (x) ⊄ (0)` | sound (r5) | none |
| Lines 125, 1242, 1314, AMFSW titles | AMFSW headings | verbatim | sound (r5) | none |
| Line 1302, lifting to characteristic zero | `[[0,p],[1,0]]` on `ℤ_p²`; `H¹(X₁(N)_κ, ω^k(−C))` | `λ² = p`; `H¹` torsion-free | sound (r5) | none |
| §0.3 Check 2 | `Γ = C₂`, `1 ⊕ sign` | every stable lattice is `L⁺ ⊕ L⁻` | sound (r5) | none |
| §0.3 Check 3 | `!![1,t;0,1]` over `k[[t]]` | p-th power is 1 | sound (r5) | none |
| §§2.4, 2.12 at Q = ∅ | `Δ_Q = 1`, h = 0 | `π_Q = π`; `M_n = M^□` | sound (r5) | none |
| §3.7, domain hypothesis | `𝒪[[x,y]]/(xy)` | kernel (y) is not p-power torsion | sound (r5) | none |
| §4.1 avoidance pair | p = 3, `ζ₃`; p = 2 | difference `3X ≡ 0`; `ζ = ζ⁻¹` at 2 | sound (r5) | none |
| §5.6 Check 3 | `ℤ_p[[x,y]]/(x² − cy²)` | two components over `ℚ_p(√c)` | sound (r5) | none |
| §6.8 last Check | η with `η(Frob) = ζ₃` over `ℚ₂` | `ζ̄₃ ≠ ζ̄₃²` in 𝔽₄ | sound (r5) | none |
| §6.14 Check 1 | `R̄` 𝒪-flat | `R̄ ≅ 𝕋^□` | sound (r5) | none |
| §§6.15–6.16, oddness at 2 | `−1`; `diag(1,−1)` | determinants 1 and −1 | sound (r5) | none |
| §8.9 (iii) | `det ρ = ψε^{k−1}`, k = 2, 3 | `ψ(c) = (−1)^k` | sound (r5) | none |
| §12.5 Check 1 | weights 2, 4 at p = 3 | `ω₃³ = ω₃` | sound (r5) | none |
| §10.7a unit-logarithm rank and kernel; Check `F = ℚ, p = 3, S = {3,7}` | as in r5 | `d − 1`; torsion kernel; rank 1, torsion ℤ/3 | sound (r5) | none |
| LL1 case split; LL2; LL3 | as in r5 | as in r5 | sound (r5) | none |
| §8.8, §9.3, §10.15, §§12.1–12.3 against the R33.1 targets | hypotheses side by side | the same clauses | sound (r5) | none |
| §1.6 persistence of (α), (β) | inert quadratic; Steinberg | unramified stays unramified; conductor exponent 1 | sound (r5) | none |
| §3.1 radius; §3.2 shift; §3.4 at h = 0; §3.4a dimensions | as in r5 | `r_m = 18`; exponent 8; `R∞/(y) ≅ R̄^ψ_S`; `4#T + r` | sound (r5) | none |
| §5.13 projectors and acceptable type | `w_ℓ`; `τ′` | `(1 ± w_ℓ)/2`; `σ_{τ′}(ℓ^s) = 1` | sound (r5) | none |
| §7.8 exclusions and (ii) at p = 3 | `1 ⊕ ω` at p = 3, 5; irreducible | Hu–Tan / Tung / Kisin; `ω⁻¹ = ω` | sound (r5) | none |
| §9.3 against Paškūnas (iv); §9.2 total oddness | `(χ ∗; 0 χ)`; `ρ(c) = 1` vs `diag(1,−1)` | Tung Theorem A; determinants 1 and −1 | sound (r5) | none |
| §10.1; §10.6; §10.7; §§10.8–10.9; §10.11; §10.15 at p = 3 | as in r5 | as in r5 (`h¹ − h² = 2d`; dimensions 5 and 5; `7 > 5`; `ω = ω⁻¹`) | sound (r5) | none |
| §11.1; §11.2 | β unramified at 3; k ∈ {2,4} | `ψη⁻²ε^{k−1}`; `ω₃^{k−1} = ω₃` | sound (r5) | none |
| §§12.6, 12.7 against DP Definition 1.10 | clauses (4)–(6), the exception | as in r5; Definition 1.10 (4)–(6) re-read at dp lines 282–292 | sound | none |
| §12.3 Check | `V₅(11a1) ⊗ ε₅` | `ω₅ ⊕ ω₅²`; `det = ε³` | sound (r5) | none |
| §0.1 trace identity and descent | `g = h = k = 1`; G = 1; char 2 | 0; `T(c) = 2 ≠ 0`; h2 excludes char 2 | sound (r5) | none |
| §1.7 Lean form | S = ∅; real/complex v; `F = ℚ, S = {3}` | `E = ⊥`; `ℝ ⊗ E ≅ ℂⁿ`; `ℚ(√6)` | sound (r5) | none |
| §1.8 quadratic clause (5) | odd z, non-square unit | `F(√d)` inert at z | sound (r5) | none |
| §6.2; §6.7a; §6.11; §§7.6, 7.9; §7.11; §8.6 | as in r5 | as in r5 (k = 5; m = 0; 8 points, `a₇ = 0`) | sound (r5) | none |
| Worked example 3; Conventions `p*` | as in r5 | regular after inverting 2; −3, 5, −7 | sound (r5) | none |

## Not verifiable

- The locators of the sampled targets outside the changed lines (1.6, 1.7, 2.2, 3.4, 4.2, 5.7, 6.5, 6.6, 7.8, 8.3, 9.3, 10.14) were not re-read. An incremental review checks the sample only where it falls in the changed passages. The texts the previous reports could not read are unchanged: Kisin's *Moduli of finite flat group schemes, and modularity* and *Modularity for some geometric Galois representations* (DVI only, or paywalled). They bear on §§5.7 and 8.3.
- Supplier and consumer heads without a checkout in this brief (SmallRamificationAndAbelianVarietyBaseCases, AutomorphicGaloisRepresentations, PotentialModularityAndCompatibleSystems, ClassicalSerreModularity, GlobalGaloisDeformations) were read through `roadmaps show`. The line numbers above refer to those dumps.

## Source issues

- none
