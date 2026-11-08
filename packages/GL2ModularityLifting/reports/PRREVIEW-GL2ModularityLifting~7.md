# Review of GL2ModularityLifting (pull request #1071 at cd7fa5e)

**Verdict:** accepted

This is an incremental re-review of 16 changed lines since 4286b04. All three previous findings (R01–R03, all P3) are repaired as requested, and the repairs introduce no new problem. The new text of §8.9 was checked clause by clause against Dieulefait–Pacetti arXiv v2, pp. 8–15. The gate passes, the dependency check reports 0 problems, and `Suggested.lean` (unchanged) elaborates with exactly two `sorry` warnings. This report has no findings.

## Previous findings

- R01 — repaired: line 2372 now reads "in Paso 2, `q > 5` with Lemma 1.14 at weight two (a bad dihedral `ρ̄_q` needs `q ∈ {1, 3}`), after the same split; in Paso 3 and Lemma 2.3, the good-dihedral prime N (Lemma 2.1 …". Lines 2376 and 2378 say "§§2–3", and line 2388 adds "§3, p. 15".
- R02 — repaired: line 3022 now reads "§2, pp.10–15 (arXiv v2)". This agrees with line 2378's "(pp. 10–15)" and with dp lines 429 (p. 10) and 688 (p. 15).
- R03 — repaired: line 1121 now ends "DeformationAndDerivedPatchingAlgebra §3.3; DeformationAndDerivedPatchingAlgebra §3.9.". Line 1894 now reads "DeformationAndDerivedPatchingAlgebra §6.5; DeformationAndDerivedPatchingAlgebra §§6.4–6.5; …". A scan of every *Needs:* line finds no repeated item.

## Verified sound

**Gate, dependency check, diff.**
- The worker's gate at cd7fa5e reports every check 0 and `build=0 OK`.
- I re-ran `gate … --base origin/main` at this head. Every check is 0 (set_option, latex, prnum, sorry-data, imports, statement-hygiene, readme-ids-missing, depcheck, stray-files, outside-folder, source-material, …), and the result is `OK`.
- The dependency check with `--movable` prints `depcheck: 237 roadmaps, 2440 edges, 0 problem(s)`. It prints no UPWARD, CYCLE or `moved:` line.
- `git diff --stat 4286b04 HEAD` touches only `TauCetiRoadmap/GL2ModularityLifting/README.md` (9 insertions, 7 deletions).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GL2ModularityLifting'` is empty.
- The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.

**Lean.** `Suggested.lean` is unchanged since 5dd2828.
- `lake env lean` gives two `sorry` warnings (lines 48 and 87) and nothing else.
- I put a scratch copy with `#check @` for all five declarations through the same elaboration. The declarations are `odd_involution_descent`, `completionAt`, `completionAtField`, `completionAtAlgebra` and `cht_soluble_prescribed_completions`. The printed types are identical to `scratch/signatures.md`.
- The file has no `variable` block, so no binder can be lost.
- The signature file's "`-field` (class)" entry and its "line 104" error are artefacts of the tool, as r5 and r6 noted. "class-field" is text in the docstring, and the file ends at line 102.
- The one-tactic probe result of r5 stands for an unchanged file: neither theorem closes, so neither is padding.
- Headline theorems: §0.1 (odd-involution descent of a two-dimensional pseudo-character) and §1.7 (CHT soluble extensions with prescribed completions) are stated. The module docstring names the headlines of Layers 0–12 and §10.7a that are not statable at the pins, with the carrier each lacks. No change this round.

**The changed §8.9 text against Dieulefait–Pacetti (arXiv v2), clause by clause.**
- *Applications of Theorem 1.4.* There are seven:
  - at w: dp lines 448 and 454;
  - at q: lines 468 and 503;
  - at each odd `p_i`: line 556;
  - at 3 in Lemma 2.3: line 591;
  - at N: line 652;
  - at 5: line 670;
  - in §3, at an auxiliary prime greater than 3 in the residual-characteristic-2 case: lines 695–702.

  Theorem 1.5 is used instead in Paso 4, steps (1) and (3) (lines 614 and 633), and the paragraph correctly omits those steps.
- *Paso 1, "after the split on solvable residual image".* Lemma 1.14 gives "not bad dihedral" (line 443). The solvable case is split into reducible (Theorem 1.6) and irreducible solvable (Theorems 1.3 and 1.4) at lines 444–448.
- *Paso 2.* The source chooses `q ≡ 1 mod 4`, greater than the primes of `S₁` and greater than 5, at lines 463–464. It cites Lemma 1.14 at weight two at lines 465–467 and makes the same split at lines 467–472. This is exactly what the repair states.
- *The Lemma 2.1 paraphrase.* It agrees with dp lines 507–512 on four points:
  - the ramification set is contained in `S ∪ {2,3}`, with `S = S₁ ∪ {N}` (line 506);
  - the inertial type at N is `Ind κ` (lines 509–511);
  - the conclusion is non-solvable residual image at every `p ∈ S₁ ∪ {2,3}`;
  - `S₁` is the ramification set of `{ρ^{(1)}_ℓ}`, the weight-two system of Paso 1 (lines 457–459).

  "Almost strictly compatible" is defined right after Definition 1.10 (lines 297–301), as the README says. That Lemma 2.1 covers Paso 3 and Lemma 2.3 is stated at lines 538–542 and 604–605.
- *"which gives (i) by §7.5".* §7.5 (iii) at README line 2054 covers every odd p, including 3.
- *Pasos 5–6.* The case split "irreducible and not bad dihedral" is at dp lines 648 and 663.
- *Final step.* Lemma 1.14 at weight two with `p > 2·2 − 1 = 3` is at dp lines 697–698. In Check 5 (line 2386), "both bad-dihedral primes" means Lemma 1.14's two weight-two values `{1, 3}`. The condition `p > 3` avoids both, as the source says, so the Check is correct as written.
- *Theorem 1.6 sentence.* Theorem 1.6 requires `p ≥ 5` (dp line 166), which matches §7.3's range `p ≥ 5`. The three primes named are w ≥ 5, q ≥ 13 and the auxiliary prime ≥ 5.
- *Locators at line 2388.* Each was checked against the page markers:
  - Lemma 1.14 at dp line 367 is on p. 8 (marker at line 323).
  - Paso 1 at lines 438–459 is on p. 10 (marker at line 423).
  - Paso 2 and the statement of Lemma 2.1 at lines 460–512 are on pp. 10–11 (marker at line 469).
  - The proof of Lemma 2.3 at lines 574–592 is on p. 13 (marker at line 572).
  - §3 at lines 689–703 is on p. 15 (marker at line 683).
  - Line 2378's "§§2–3 (pp. 10–15)" covers dp lines 429–703.

**Ownership and consumers of the changed text.**
- `roadmaps grep 'GL2ModularityLifting[^.]{0,40}8\.9'` finds no roadmap on main or at an open head that cites §8.9.
- The good-dihedral image lemma (Khare–Wintenberger I, Lemma 6.3, of which DP Lemma 2.1 is DP's form) is owned by ClassicalSerreModularity `R27.1/good-dihedral-implies-nonsolvable-image-and-is-preserved`. I read it in the `roadmaps show` dump of that roadmap's head (#1020). ClassicalSerreModularity is line 169 of the merge order, before this roadmap at line 174.
- §8.9 paraphrases DP's lemma only to say where (i) comes from. It states no target, and it already assigns "the verification at each use" to ClassicalSerreModularity. So no second owner arises.
- `overlaps.md` lists no open pull request that changes this roadmap and no dropped id. The diff introduces no new object.

**The two changed *Needs:* lines.**
- §4.2 goes from 11 items to 10 and §6.14 from 13 to 12. Only the exact duplicates were removed, and every remaining item is unchanged and still resolves (depcheck: 0 problems).
- Two overlapping citations remain: "DeformationAndDerivedPatchingAlgebra §3.3" beside "§§3.1–3.3" in §4.2, and "§6.5" beside "§§6.4–6.5" in §6.14. They name the subsection that a particular step uses, are harmless and need no change.

**Seeded sample.**
- §8.9 falls in the changed passages and was checked in full, as above.
- §8.8 is cited by §8.9 as "Theorem 1.4 (§8.8)". Its locator, DP Theorem 1.4 and its proof, p. 4, is correct: dp line 140, after the page-4 marker at line 137. Its hypotheses match dp lines 140–155.
- §6.12 is named in the changed §6.14 *Needs:* line. Its locator, KW II Lemma 9.6 on p. 88, is correct: kw2 line 4026, after the page-88 marker at line 4024. §6.14's own locator, Proposition 9.3 (II)–(III) on p. 84, is at kw2 lines 3871–3874, after the marker at line 3860.
- The other sampled targets (1.9, 2.10, 3.1, 4.1, 4.4, 5.16, 6.3, 6.16, 8.4, 10.10, 10.12, 12.6) lie outside the changed passages and are not cited by them. Their locators were not re-read. The README flags no locator as unverified.

**Adversarial table.** The first block holds the statements this diff changes, plus §§8.8 and 6.12, with values computed this round. Rows marked "(r6)" are carried unchanged from the previous report (PRREVIEW-GL2ModularityLifting~6), for statements the diff leaves untouched. Their values are those computed there and in r5.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.9 (i), Paso 1 "after the split" | k = 3, w = 7; k = 2, w = 5 | Bad-dihedral values `{2k−3, 2k−1}` are `{3,5}` and `{1,3}`, and `7 ∉ {3,5}`, `5 ∉ {1,3}`. Reducible case → Theorem 1.6 (w ≥ 5); irreducible solvable → Theorems 1.3 and 1.4 (dp 444–448) | sound | none |
| §8.9 (i), Paso 2 (repaired) | `q ≡ 1 mod 4`, `q > 5`; `{ρ^{(1)}_ℓ}` before N is added | Smallest such q is 13 (5 excluded, 9 not prime). At weight two the bad-dihedral values are `{1,3}`, so `13 ∉ {1,3}`. Lemma 2.1 needs ramification in `S₁∪{N,2,3}` with the N-type; `N ∉ S₁` (dp 476–477), and `q ∉ S₁∪{2,3}` | matches dp 463–472 | previous R01 repaired |
| §8.9, Lemma 2.1 paraphrase | p = 3 ∈ `{2,3}`; residual image GL₂(𝔽₃) vs SL₂(𝔽₉) | `|GL₂(𝔽₃)| = 8·6 = 48`, solvable, so the lemma rules it out. `|SL₂(𝔽₉)| = 9·80 = 720`, with projective image `PSL₂(𝔽₉) ≅ A₆`, is non-solvable. Its index-≤2 restriction to `ℚ(√−3)` is non-solvable, hence not in a Borel, hence (i) by §7.5 (iii). Clauses as in dp 507–512 | sound | none |
| §8.9, final step (§3) | auxiliary p = 5, 7; p = 3 | 5 and 7 are > 3 and outside `{1,3}`, and both are ≥ 5, in Theorem 1.6's range. p = 3 is the excluded value `2·2−1` (dp 698) | sound; now located in §3 | previous R01 repaired |
| §8.9, Theorem 1.6 sentence | w with k = 2; q = 13; auxiliary prime 5 | `w > 4 ⇒ w ≥ 5`; 13 ≥ 5; 5 ≥ 5. Theorem 1.6 requires p ≥ 5 (dp 166), and its endpoint 5 is included (§7.3 Check 2) | sound | none |
| §8.9, list of applications | the seven places | w (dp 448/454), q (468/503), odd `p_i` (556), 3 (591), N (652), 5 (670), §3 auxiliary prime (702); Theorem 1.5, not 1.4, at 614/633 | complete for Theorem 1.4 | none |
| §8.9, new Check 4 | q among primes ≡ 1 mod 4 | primes 5, 13, 17, 29 …; `q > 5 ⇒ q ≥ 13`; `{2·2−3, 2·2−1} = {1,3}` | true | none |
| §8.9, new Check 5 | p > 3 | p ≥ 5; `p ∉ {1,3}`; Theorem 1.6 range p ≥ 5 | true | none |
| §8.9 locators (line 2388); "§§2–3 (pp. 10–15)" | page markers | Lemma 1.14 p. 8; Paso 1 p. 10; Paso 2 and Lemma 2.1 pp. 10–11; proof of Lemma 2.3 p. 13; §3 p. 15; §§2–3 at dp 429–703 = pp. 10–15 | as stated | previous R01 repaired |
| §12.8, DP §2 page range | page markers | heading at dp 429 on p. 10; last sentence at dp 688 on p. 15; README now says pp. 10–15 | as stated | previous R02 repaired |
| *Needs:* lines 1121 and 1894 | every *Needs:* line split on ";" | §4.2: 11 → 10 items; §6.14: 13 → 12; 0 repeated items in the README | sound | previous R03 repaired |
| §8.8 (cited by §8.9) | p = 3; Tate curve at p, k = 2 | `p* = (−1)^{(3−1)/2}·3 = −3`, and `ℚ(√−3) = ℚ(ζ₃)` since `ζ₃ = (−1+√−3)/2`. The Tate curve has HT {0,1} and monodromy N ≠ 0 after every finite extension, so it is semistable but not potentially crystalline, hence not potentially Barsotti–Tate | sound | none |
| §6.12 (named in §6.14 *Needs:*) | `f = X₁² + X₂X₃ + 2X₁` over 𝒪⟦X⟧ | Mod 2, `f = X₁² + X₂X₃`, and all partials (0, X₃, X₂) vanish at the origin, so it is singular. After inverting 2, `∂f/∂X₁ = 2(1+X₁)` is a unit, so it is regular | sound | none |
| §2.2 | Q = ∅; Q = {v}, `v_p(N(v)−1) = n` | `Δ_∅ = 1`; `|Δ_v| = p^n` | sound (r6) | none |
| §4.2 | Savitt's ring; r = 0; `O[[x]] → O` | two minimal primes of `k⟦T⟧/(T₁T₂)`; empty regular sequence; kernel (x) ≠ 0 | sound (r6) | none |
| §5.7 | F = ℚ(√2), p = 3; PGL₂(𝔽₅) | 3 inert, residue field 𝔽₉; `|PGL₂(𝔽₅)| = 120`, `PSL₂(𝔽₅) ≅ A₅` | sound (r6) | none |
| §6.5 | s = 1; h = 1, j = 4, s = 2 | `M∞ ≅ S∞`; `M∞/(y₁…y₅) ≅ O²` | sound (r6) | none |
| §6.6 | λ = −1, 3 in 1 + 2ℤ₂ | `(−1)² = 1`; `3² = 9 ≠ 1`; `T[2] = μ₂` | sound (r6) | none |
| §8.3 | `|R| = 0, 1`; one vs two components | `2^{−|R|}` = 1, 1/2; `4/2 = 2` faithful, `2/2 = 1 < 2` not | sound (r6) | none |
| §10.14 | p = 3; ℚ(√5) at 11 and 3 | `ω₃ = ω₃⁻¹`; `5 ≡ 4² mod 11`; 3 inert | sound (r6) | none |
| §12.2 against DP Theorem 1.5 | SL₂(𝔽₂), SL₂(𝔽₄) | orders 6 (S₃, solvable) and 60 (A₅) | sound (r6) | none |
| Line 2374, owners named | 11a1 at λ = 5 | Frobenius polynomial `X² − X + 5`; PMCS §1.2 and §12.5 own the KW predicates and families | sound (r6) | none |
| Line 3006 (§12.8 family hypotheses) | 11a1 system, `P₂ = X²+2X+2`, `P₃ = X²+X+3` | Chebotarev and Brauer–Nesbitt identify any such member with `ρ_{g,λ}` | sound (r6) | none |
| Line 31, `RankTwoFamily` view | Hodge multisets {0,−1}, {0,−2} | identified by the quotient | sound (r6) | none |
| Line 65, Frobenius adapter | elliptic; cyclotomic | `X² − a_qX + q`; `X − q` | sound (r6) | none |
| Line 185, OAFML §5.8 | `R = k[[t,x]]`, `T = R/(x)` | `ker = (x) ⊄ (0)` | sound (r6) | none |
| Line 1302 | `[[0,p],[1,0]]` on `ℤ_p²` | `λ² = p`; `H¹` torsion-free | sound (r6) | none |
| §0.3 Checks 2–3 | `Γ = C₂`; `!![1,t;0,1]` over `k[[t]]` | `L⁺ ⊕ L⁻`; p-th power 1 | sound (r6) | none |
| §§2.4, 2.12 at Q = ∅ | `Δ_Q = 1`, h = 0 | `π_Q = π`; `M_n = M^□` | sound (r6) | none |
| §3.7 domain hypothesis | `𝒪[[x,y]]/(xy)` | kernel (y) not p-power torsion | sound (r6) | none |
| §4.1 avoidance pair | p = 3, `ζ₃`; p = 2 | `3X ≡ 0`; `ζ = ζ⁻¹` at 2 | sound (r6) | none |
| §5.6 Check 3 | `ℤ_p[[x,y]]/(x² − cy²)` | two components over `ℚ_p(√c)` | sound (r6) | none |
| §6.8 last Check | `η(Frob) = ζ₃` over `ℚ₂` | `ζ̄₃ ≠ ζ̄₃²` in 𝔽₄ | sound (r6) | none |
| §6.14 Check 1 | `R̄` 𝒪-flat | `R̄ ≅ 𝕋^□` | sound (r6) | none |
| §§6.15–6.16, oddness at 2 | `−1`; `diag(1,−1)` | determinants 1 and −1 | sound (r6) | none |
| §8.9 (iii) | k = 2, 3 | `ψ(c) = (−1)^k` | sound (r6) | none |
| §12.5 Check 1 | weights 2, 4 at p = 3 | `ω₃³ = ω₃` | sound (r6) | none |
| §10.7a | `F = ℚ, p = 3, S = {3,7}` | `d − 1`; torsion kernel; rank 1, torsion ℤ/3 | sound (r6) | none |
| LL1–LL3 | as in r5 | as in r5 | sound (r6) | none |
| §§8.8, 9.3, 10.15, 12.1–12.3 vs R33.1 | hypotheses side by side | same clauses | sound (r6) | none |
| §1.6 (α), (β) | inert quadratic; Steinberg | unramified stays unramified; conductor exponent 1 | sound (r6) | none |
| §§3.1, 3.2, 3.4, 3.4a | as in r5 | `r_m = 18`; exponent 8; `R∞/(y) ≅ R̄^ψ_S`; `4#T + r` | sound (r6) | none |
| §5.13 | `w_ℓ`; `τ′` | `(1 ± w_ℓ)/2`; `σ_{τ′}(ℓ^s) = 1` | sound (r6) | none |
| §7.8 | `1 ⊕ ω` at p = 3, 5 | Hu–Tan / Tung / Kisin; `ω⁻¹ = ω` at 3 | sound (r6) | none |
| §9.3; §9.2 | `(χ ∗; 0 χ)`; `ρ(c)` | Tung Theorem A; determinants 1, −1 | sound (r6) | none |
| §§10.1, 10.6–10.9, 10.11, 10.15 | as in r5 | `h¹ − h² = 2d`; dimensions 5 and 5; `7 > 5`; `ω = ω⁻¹` | sound (r6) | none |
| §11.1; §11.2 | β unramified at 3; k ∈ {2,4} | `ψη⁻²ε^{k−1}`; `ω₃^{k−1} = ω₃` | sound (r6) | none |
| §§12.6, 12.7 vs DP Definition 1.10 | clauses (4)–(6), the exception | dp 282–301 | sound (r6) | none |
| §12.3 Check | `V₅(11a1) ⊗ ε₅` | `ω₅ ⊕ ω₅²`; `det = ε³` | sound (r6) | none |
| §0.1 (Lean) | `g = h = k = 1`; G = 1; char 2 | 0; `T(c) = 2 ≠ 0`; `2 ≠ 0` excludes char 2 | sound (r6) | none |
| §1.7 (Lean) | S = ∅; real/complex v; `F = ℚ, S = {3}` | `E = ⊥`; `ℝ ⊗ E ≅ ℂⁿ`; `ℚ(√6)` | sound (r6) | none |
| §1.8 clause (5) | odd z, non-square unit | `F(√d)` inert at z | sound (r6) | none |
| §§6.2, 6.7a, 6.11, 7.6, 7.9, 7.11, 8.6 | as in r5 | k = 5; m = 0; 8 points, `a₇ = 0` | sound (r6) | none |
| Worked example 3; `p*` | as in r5 | regular after inverting 2; −3, 5, −7 | sound (r6) | none |

## Not verifiable

- The locators of the sampled targets outside the changed passages (1.9, 2.10, 3.1, 4.1, 4.4, 5.16, 6.3, 6.16, 8.4, 10.10, 10.12, 12.6) were not re-read. An incremental re-review checks the sample only where it falls in the changed passages or in what they cite.
- The texts earlier reports could not read are unchanged: Kisin, *Moduli of finite flat group schemes, and modularity*, and *Modularity for some geometric Galois representations* (DVI only, or paywalled). They bear on §§5.7 and 8.3, which this diff does not touch.
- ClassicalSerreModularity's head was read through `roadmaps show`, since this brief gives it no checkout. The `R27.1` citation above refers to that dump.

## Source issues

- none
