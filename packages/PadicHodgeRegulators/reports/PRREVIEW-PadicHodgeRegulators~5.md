# Review of PadicHodgeRegulators (pull request #1498 at aada6bb)

**Verdict:** accepted

No findings. This is an incremental re-review of the 91 README lines changed since 13305d8. `Suggested.lean` is unchanged since that head (`git diff 13305d8 HEAD -- TauCetiRoadmap/PadicHodgeRegulators/Suggested.lean` is empty), and nothing outside the folder changed.

## Previous findings

- R01 — repaired: README.md:1159, §5.4a “(a) for every z ∈ L ∖ {0, 1}, D_L(z) − β_L(z, 1 − z) ∈ p²O_L”. Also README.md:1276, §5.9 “c₂·p²O_L = c₂·λ_L(K_3(L; Z_p)) = D_L(K_3(L; Z_p)) = p²O_L by §5.8 (1), so v_p(c₂) = 0”. And README.md:1047, §4.7 “uses only c₂ ≠ 0”.
- R02 — repaired: packages/PadicHodgeRegulators/design/plan.json now has `"gaps": []`, and the README declares no `gap:` slug.
- R03 — repaired: README.md:7 “HabiroNumberFields §3.0 and its PadicHodgeRegulators supplier contract, and HabiroNahmSeries §6.3, consume these”. The same wording is at :1449 and :2751, and “3.0a–3.0b” no longer occurs for HabiroNumberFields.
- R04 — repaired: README.md:51 “§4.9 supplies the finite condition H¹_f(K,V), its preimage on T and image on V/T, the local-condition structure L^BK_v and its propagation to discrete quotients”.
- R05 — repaired: README.md:1331 “Moreover, by the cyclotomic clause of §4.3 (BdJ2003 Theorem 1.12, p. 6), which needs no special-unit hypothesis: (a) for every root of unity ζ ≠ 1 of F, of any order and at every prime p”.
- R06 — repaired: README.md:2284 “See LLZ2011 §3A, equation (1), p. 1116, and Lemma 3.3, p. 1117.”
- R07 — repaired: packages/PadicHodgeRegulators/sources.toml now records `id = "dJ1995"` (numdam, certified, the six §4.7 locators) and `id = "Nakamura2014"` (arXiv 1201.6475v2, certified, with a version note).

## Verified sound

:robot: Independent AI incremental re-review of the changes since 13305d8. They cover the scope and supplier paragraphs (:7, :51, :61), §4.7, the new §5.4a, §§5.8–5.9, §§6.1, 6.2, 6.5, the Layer 5 and Layer 6 dependencies, §9.15 and the downstream consumers. Everything that cites or depends on them was also read: §§3.1, 4.3, 5.4–5.7, 6.6, Layer 4 dependencies and the Suggested.lean docstring.

R01 was repaired by a proof rather than by the supplier gap the previous review proposed. The proof in §5.4a does the job: with it, the c₂ = 1/5 model of the previous R01 is refuted (table below), and no Needs edge leads from Layer 4 into Layer 5.

**Gate, dependency check, elaboration.**
- The gate rerun from the worktree prints `set_option=0 blob=0 latex=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` and exits 0. The worker's gate at this head also has build=0.
- The dependency check prints `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/PadicHodgeRegulators'` is empty.
- `lake env lean TauCetiRoadmap/PadicHodgeRegulators/Suggested.lean` exits 0. Its only warnings are the three `declaration uses 'sorry'` at lines 43, 81 and 102.
- The seven elaborated types in signatures.md are unchanged and still match README §§5.1–5.2, 5.5, 9.1 and 9.7–9.11. The previous round's `#check @name` comparison and one-tactic probes therefore stand for an unchanged file.

**Headlines.**
- The new and restructured statements are not statable at the pins: §5.4a(a)–(b), §5.8(2) (completed Coleman dilogarithm), §5.9 (D_L = D^Bl_L, and c₂ a p-adic unit).
- A grep of pinned Mathlib and Tau Ceti for dilog/polylog/Coleman/antisymSquare/preBloch finds only a docstring mention of Li₂ (Mathlib/Analysis/SpecialFunctions/Integrals/Log.lean:18) and `ChabautyColeman` power-series names.
- The module docstring already names the completed local K₃ isomorphism as not statable.

**New mathematics: §5.4a, checked by hand and by a scratch script with exact p-adic arithmetic.**
- Case (ii) is right for p ≥ 5 and fails at p = 3.
  - The valuation bound k − 2v_p(k) ≥ 2 for k ≥ 2 holds for p ≥ 5 (k = p gives p − 2 ≥ 3) and fails at p = 3, k = 3.
  - ½·log_p(u)·log_p(1 − z) ∈ p^(a+1).
  - −a·log_p(1 − z) ≡ a·z mod p^(2a).
- Cases (iii) and (iv) follow from the two-term relations of §3.1 (README:807–808) and ColemanIntegration §L2.18, and from bilinearity of β with log_p(−1) = 0.
- The four cases exhaust L ∖ {0, 1} for L unramified.
- (b) follows because K3BlochGroups §3.1 lifts every antisymmetric biadditive map to `antisymSquare ℤ (Additive Lˣ)`, and §3.5 makes B(L) the kernel of ∂.
- The definition of D^0 in §3.1 (README:800) is the one the proof uses.

**Cross-roadmap citations resolved at their heads.**
- ColemanIntegration (c35168f):
  - §L2.Fb (its README:1469–1490): `dilogEvaluation`, and `branchPair(u ∧ v) = (v_p(u)log_a v − v_p(v)log_a u)/2`, so β_L = −2·branchPair as stated.
  - §L2.18(d) (its README:1755–1767): D^a − D^b = (a − b)(v(z)log(1 − z) − v(1 − z)log z)/2. Hence D² = D⁰ − β, as the third bullet of §5.4a says.
  - §L2.25(b) (its README:1830): Li_k(ζ) ∈ p^k ℤ_p[ζ] for ζ of order prime to p.
- K3BlochGroups (d0c9190): §3.1 `antisymSquare` with its lift of antisymmetric bilinear maps (its README:534–573); §3.5 boundary and Bloch kernel (:715–757).
- HabiroNumberFields (84e120a): §3.0 heading (:839), its PadicHodgeRegulators supplier contract (:87), and its ownership paragraph (:9), which cites §§4.7, 5.6–5.9, 6.1 and 6.3 here. Its “a p-adic unit for p>3” reading of c₂ stays covered, because it consumes §4.7 together with §§5.6–5.9.
- HabiroNahmSeries (d526e66): §6.3 (:1634).
- SelmerIwasawaCohomology (ebadda3): §4.9 (its README:1924–1945): H¹_f, the T-preimage, the A = V/T image and L^BK_v.
- Both leads in citations.md are benign. FontaineBPR1994 is a source key (README:635, :2772). `KTheoryQ.dvr_localization_iso` is a target of ColemanIntegration §L3.Fa.1 (its README:2418).

**Library declarations opened at the pin** (cited in §5.4a and the Layer 5 dependencies):

| Name | File:line | Content |
|---|---|---|
| `TauCeti.unitFiltrationZeroEquivProd` | TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean:281 | `unitFiltration K 0 ≃ₜ* rootsOfUnity (Nat.card 𝓀[K] − 1) K × unitFiltration K 1` |
| `TauCeti.deepUnitExpLogEquiv` | TauCeti/NumberTheory/LocalField/DeepUnits/Basic.lean:117 | Under `absoluteRamificationIndex K p < (p − 1) * i`, `unitFiltration K i ≃ₜ* Multiplicative (𝓂[K] ^ i)` by the logarithm. With e = 1 and i = 1 this needs p > 2. |

**Ownership and duplication.** `roadmaps grep` over main and the open heads finds the Bloch-group p² integrality of the dilogarithm, the pairing β and the completed Coleman dilogarithm only here. `branchPair` itself is ColemanIntegration's, and is cited, not restated. overlaps.md lists no pull request changing this roadmap and no dropped id.

**Seeded sample.**
- §9.15 is the only seeded target in the changed text. LLZ2011 equation (1) is at line 950–965 on printed p. 1116, and Lemma 3.3 at line 973–991 on p. 1117, both as the new locator says.
- New locators in the changed text:
  - GSWZ2024 Lemma 3.1 is at line 1975 (p. 38), and Theorem 9 with (183) and its proof at line 2015–2026 (p. 39).
  - BdJ2003 (1.2)–(1.4) are at line 107–125 (p. 3), and Theorem 1.12 at line 231–233 (p. 6).
- §3.4's locator, BdJ2003 p. 3 (line 126–129: the unique n = 2 choice, Li₂ − ½·log·Li₁), was also reread and holds.
- §§1.7, 4.6, 6.3, 7.6, 7.7, 9.2, 9.4 and 9.8 lie outside the diff. 8.3, 8.4, 8.6, 8.17 and 9.26 carry the previous report's verified rows.

**Adversarial table.** First the changed statements, with values computed this round:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §5.4a(a), case (ii) | z = 10 at p = 5 | D(10) ≡ 110 and β(10, −9) ≡ 60 mod 125, difference 50 ∈ 25ℤ₅. With β of the opposite sign: 170 ≡ 20 mod 25. | Pass; the sign of β is pinned |
| §5.4a(a), all non-special z | Rationals n/d with \|n\| ≤ 60 and d ∈ {1, 2, 3, 4, p, p², 7p or 3p} | p = 5: 512 points; p = 7: 463; p = 11: 421; all with v_p(D − β) ≥ 2. p = 3: 160 failures, e.g. D(6) ≡ 3 against β(6, −5) ≡ 6 mod 9 | Pass; p > 3 needed, as the last Check says |
| §5.4a Checks 2–3 | z = −5, z = 5 at p = 5 | D(−5) ≡ 20 ≡ β(−5, 6) mod 25. D(5) ≡ 5 ≡ β(5, −4) mod 25, and β∘∂[5] ≠ 0, so [5] ∉ B(ℚ₅) | Pass |
| §5.4a(iii) identity | z = 5 | β(1/5, 4/5) = −v(1/5)·log 4 = log 4, and −β(5, −4) = log(−4) = log 4 | Pass |
| §5.4a(b) | Five-term elements at p = 5 with all five arguments non-special: (x, y) = (5, 25), (5, −20), (10, 1/5) | v₅(Σ ±D) ≥ 70 (series truncation) and v₅(Σ ±β) ≥ 198: both sums vanish, so D and β∘∂ both kill these relations | Pass |
| §5.4a β = −2·branchPair | 3 ∧ 4 over ℂ₃ | branchPair = log(4)/2 (ColemanIntegration Check), β(3, 4) = −log 4 | Pass |
| §5.4a third bullet (branch 2) | z = 10, p = 5 | D²(10) = D⁰(10) − β ≡ 50 mod 125. Wrong model “Li₂ for branch 2”: Li₂(10) ≡ 35, of valuation 1 | Pass; the bullet means §3.1's D, not Li₂ |
| §5.8(2) | L = ℚ₅; L = ℚ₂₅ × ℚ₅; L = 0 | D^Bl([ω(2)]) = Li₂(ω(2)) ≡ 25 mod 125 generates 25ℤ₅, and the source has rank 1 by (1). Ranks 3 = 3 for the product. 0 → 0 | Pass |
| §5.8 Check “(1) and (2) differ by a unit” | L = ℚ₅ | λ([ω(2)]) = −c₂⁻¹Li₂(ω(2)) against D^Bl = Li₂(ω(2)): the ratio −c₂ is a unit by §5.9 | Pass |
| §5.9: c₂ a unit, and D_L = D^Bl_L | c₂ = 1/5, 5, −2 at p = 5; L = 0 | Image of D_L = c₂·25ℤ₅: 5ℤ₅ for 1/5 (≠ 25ℤ₅), 125ℤ₅ ∌ Li₂(ω(2)) for 5, 25ℤ₅ for −2 (allowed). L = 0 gives no information, so the proof takes L = ℚ_p | Pass; the previous R01 model is excluded |
| §5.9 circularity | Needs graph | §4.7 needs no Layer 5 section. §5.7 uses c₂ ≠ 0. §5.8 needs §§1.10, 3.1, 5.4a, 5.5–5.7; §5.9 needs §§4.7, 5.5–5.8 | No cycle |
| §5.8 first API bullet | Hypotheses | completedBlochDilog inherits §5.8's standing p > 3, L unramified (its construction needs §5.4a's bound), as §5.6's rootClassK3 bullet inherits §5.6's | Consistent with the README's convention |
| §4.7 calibration paragraph | c₂ against −2c₂ and −c₂/2 | Equal valuation at every p > 3, so the unit property cannot detect the mixed coordinate, as the Check says. No Needs edge into Layer 5 | Pass |
| §6.2(a) | ζ₇ in ℚ(ζ₇) at p = 7 | v₇(1 − ζ₇) = 1/6, so not special; §4.3's cyclotomic clause (README:971) and BdJ2003 Theorem 1.12 give Li₂(ζ₇) | Pass |
| §§6.1, 6.5, 6.6 p² ranges | Needs lines | §6.1 needs §5.9; §6.5 needs §§5.8–5.9; §6.6 needs §§5.8–5.9. D_{F,p}(K₃F) ⊆ D_{F_p}(K₃(F_p; ℤ_p)) = p²(𝒪_F ⊗ ℤ_p) | Pass |

Then the rows carried forward from the previous report for statements the diff leaves untouched (values as computed there):
- `residueDilogValue_spans`: ranks at p = 3 are (0,0) and (1,1); at p = 5–13 they are (1,1) and (2,2). Needs 3 < p.
- §5.1 `finitePolylog`: li₂,₅(2) ≡ 1, li₂,₅(3) ≡ 3, li₂,₅(4) = 0; li₂,₃(1) = 2.
- §§3.4, 5.3: Li₂(ω(2)) ≡ 25 mod 125, and ℓ₂ ≡ −1 mod 5.
- `constraint_basis_and_determinant`: det X(X − 5); empty product 1.
- `evaluationConstraints_coordinate_image`: generators 1, X(X − 5) and g = 1.
- §1.10: ℚ₅ image 25𝒪; ℚ₃ is ℤ₃ ⊕ ℤ/3.
- §7.10: ker(1 − pφ) = 0 on twisted D₋₂.
- §§8.3–8.4: Q = −1 and [[−1, ½], [0, −½]].
- §8.5: −9/10 and 3/5.
- §8.6: 1, −1, ½.
- §8.10: ∇₁∇₀(t²v) = 2t²v.
- §8.12: ℓ_i(χ^(j+m)) = ℓ_(i−m)(χ^j).
- §8.17: δ_(1/6).
- §8.19: ℓ₀ℓ₁ with value 2.
- §8.22: 5^(−N) and ½ excluded.
- §9.17: 15/7.
- §9.26: det X(X − χ(γ) + 1).
- §9.32: k = −1 gives ∂⁻¹.
- §1.8: (0,1,1,2), (1,1,2,2), (1,1,1,1).
- §3.3: pairing value 1.
- §4.7 archimedean: Catalan 0.91597; 2P₂ ≈ 2.02988i.

Remark on untouched text (not a finding): §6.3's locator, GSWZ2024 §3.1 after (174), p. 38 (line 1968–1972), supports the factorwise combination behind (a). The transfer clause (b) rests on §1.7 and KTheoryFiniteLocalFields §7.6, which its Needs line already lists.

## Not verifiable

- Nothing new. The two items of the previous report concern §9.30a and RJ2018 Théorème I.10, which the diff does not touch, and they stand as recorded there: a factor in Nakamura2014 Theorem 3.10(2) that the extraction cannot render, and an inverse exponent that is not legible.
- Ownership against open pull requests was checked through `roadmaps grep` over main and the open heads, and through the sibling checkouts named in the brief. ColemanIntegration and SelmerIwasawaCohomology were read at their open heads through the roadmap tool.

## Source issues

- **Gap** in GSWZ2024 at Theorem 9, proof, printed p. 39: the source bounds the regulator image of completed K₃ in p²𝒪 by Lemma 3.1, which treats only z with z and 1 − z units; it should add the correction β(z, 1 − z), which is killed by the Bloch condition, or another argument covering non-special symbols; affects a stated result.
- **Misprint** in GSWZ2024 at Proposition 3.3, (179), printed p. 38: the source takes the span over all of μ(ℚ_{p^s}), including ζ = 1, where D_p is undefined; it should exclude ζ = 1, as Proposition 3.2 does; affects nothing.
