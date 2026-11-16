<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6907800158 -->
Red team round 1 pass b (claude) of 6697677

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) §13.3 builds the companion `σ′` of Hodge–Tate weights `{0, 2}` with a weight-two lifting theorem

   **Location.** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4732–4734` (sketch of §13.3):
   "construct `σ′` with an order-`t` dihedral type at `v_1` and the original local connections elsewhere
   (PotentialModularityAndCompatibleSystems §10.10)"; the same citation in the `*Needs:*` line of §13.3
   (README:4750).

   **Claim.** PotentialModularityAndCompatibleSystems §10.10 supplies a RAESDC `σ′` with
   `r̄_{σ′,ι_t} ≅ r̄_{σ,ι_t}`, the local components of `σ` away from `v_1`, and a tamely dihedral type at
   `v_1`.

   **Witness.** `σ` has `HT_τ = {0, 2}` and `det r_σ = ε^{−2}ω_p` (§11.2), and §13.4 needs
   `HT(Sym^{r−1} σ′) = {0, 2, …, 2r − 2}` (§12.7(7)). PotentialModularityAndCompatibleSystems §10.10
   (first sentence, at its open head) states only "weight-two lifts of determinant `ψχ_p`". A
   weight-two lift has weights `{0, 1}`; for `r = 2`, `{0, 1} + {0, 1}` repeats `1`.

   **Repair.** In the sketch replace the parenthesis by: "(ModularityAndLanglandsExtensions §2.25, lifts
   with prescribed potentially diagonalizable local components, applied over a quadratic CM extension and
   descended: above `t` the Fontaine–Laffaille crystalline component of weights `{0, 2}`, at `v_1` the
   tamely dihedral type of order `t`, elsewhere the component of `r_{σ,ι_t}`; automorphy of the lift by
   ModularityAndLanglandsExtensions §2.16 from that of `σ`)". In the `*Needs:*` line of §13.3 replace
   `PotentialModularityAndCompatibleSystems §10.10` by `ModularityAndLanglandsExtensions §§2.1, 2.16, 2.25`.
   Keep §10.10 in the Layer 13 Dependencies (§13.6 uses it in weight zero, where it applies). Tested on the
   refuting instance: §2.25 prescribes arbitrary regular labelled weights, so `{0, 2}` and determinant of
   Hodge–Tate weight `2` are allowed.

2. **F02** (P1) §11.6 raises the level of a Hilbert modular form with a criterion stated over `ℚ` at level prime to `ℓ`

   **Location.** README:4096 (sketch of §11.6): "raise the `GL_2`-level of `σ` at `v_2`
   (SerreWeightAndLevelOptimisation §2.4)"; the `*Needs:*` line of §11.6 (README:4120) and the Layer 11
   Dependencies (README:4258).

   **Claim.** SerreWeightAndLevelOptimisation §2.4 gives an ι-ordinary form congruent to `σ`, Steinberg
   at the place `v_2` of `F_2`.

   **Witness.** SerreWeightAndLevelOptimisation §2.4 (first sentence): "Let `ℓ≥3`, `2≤k≤ℓ+1`,
   `ℓ∤N`, and f a normalised eigenform of character ε in `S_k(Γ1(N))`". Here `σ` lives over the totally
   real `F_2` (`[F_1 : F]` even, so `F_2 ≠ ℚ`) and has `det r_σ = ε^{−2}ω_p`, ramified at `p`, so `p`
   divides its level. §6.9 there does not apply either (it asks hyperspecial level above `p`).

   **Repair.** Replace the clause by: "obtain, by the argument of §11.2 with the Steinberg component
   prescribed also at `v_2` (non-empty because `q_{v_2} ≡ 1` modulo `p` and `r̄` is trivial at `v_2`;
   PotentialModularityAndCompatibleSystems §9.2, PotentialAutomorphyInfrastructurePartII Layer 8, "Global
   lifts with prescribed local components (Schur form)", and Layer 5), an ι-ordinary companion congruent
   to `σ` with the same weights and an unramified Steinberg twist at `v_2`". In the `*Needs:*` line of
   §11.6 replace `SerreWeightAndLevelOptimisation §2.4` by `§11.2; PotentialModularityAndCompatibleSystems
   §9.2; PotentialAutomorphyInfrastructurePartII Layer 5, Layer 8 ("Global lifts with prescribed local
   components (Schur form)")`, and delete `SerreWeightAndLevelOptimisation §2.4` from the Layer 11
   Dependencies. Tested on the refuting instance: the §11.2 route is stated over a totally real field and
   for ordinary lifts of weights `{0, 2}` with level at `p`. (The uses of §2.4 in §7.3 are sound: `F = ℚ`,
   `k = 5 ≤ p + 1`, `N = 4`, `p ∤ 4`, `r̄_{σ_0}` irreducible.)

3. **F03** (P2) the convergence half-plane of §§14.4–14.5 is cited to a section that disclaims it

   **Location.** README:5168–5172 ("its Euler product converges absolutely for `Re s > 1`", cited to
   AutomorphicLFunctionsAndLocalFactors AL.2), README:5212–5213 (the same in §14.5), the contract row
   README:513–517, and README:209 ("No Ramanujan–Deligne bound is supplied; §§14.4–14.5 use it only
   through their proof routes").

   **Claim.** AL.2 gives absolute convergence of the standard Euler product of a unitary cuspidal `Π` of
   `GL_m` on `Re s > 1`; this is what makes both Lean statements hold on `Re s > n(k − 1)/2 + 1`.

   **Witness.** AutomorphicLFunctionsAndLocalFactors AL.2.4.1 (its hypotheses paragraph): "The initial
   matrix-integral construction gives a sufficiently far-right half-plane, which is all this target
   asserts for `n≥2`"; the sharp bound "is proved … in … (AL.3.6.1)". Neither proof sketch of §§14.4–14.5
   uses Deligne's bound.

   **Repair.** In both proof sketches write "its Euler product converges absolutely for `Re s > 1`
   (AutomorphicLFunctionsAndLocalFactors AL.3.6.1, the Jacquet–Shalika bound after the Rankin–Selberg pole
   criterion; entirety is AL.2.4.1)". In the contract row add "AL.3.6.1 (absolute convergence of the
   standard Euler product of a unitary cuspidal representation on `Re s > 1`), used for the half-plane of
   §§14.4–14.5", and write `AL.2.4.1` for the entirety statement. Add `AL.3.6.1` to the `*Needs:*` lines
   of §14.4 and §14.5 and to the Layer 14 Dependencies. Replace README:209 by "No Ramanujan–Deligne bound
   is supplied and none is used: the half-plane of §§14.4–14.5 comes from AL.3.6.1." Tested: with
   `|α_p^j β_p^{n−j} p^{−n(k−1)/2}| < p` and summability from AL.3.6.1, every factor is non-zero and the
   product is unconditionally convergent on `Re s > n(k − 1)/2 + 1`, which is the `HasProd` of the Lean
   statements.

4. **F04** (P2) two declared gaps are compound

   **Location.** README:388 (`gap:unobstructed-auxiliary-prime-and-slope-count`) and README:310
   (`gap:dyadic-definite-unitary-forms`).

   **Claim.** Each `needs` sentence says exactly what is missing for one consumer.

   **Witness.** The first joins two unrelated inputs with different consumers and sources: Weston's
   unobstructedness with the auxiliary prime `q_a` (for §8.2, nt21 pp. 92–96) and the slope-`(0, 1)`
   dimension count at level `U_0(p³)` (for §10.2, nt21b pp. 20–22). The second adds, to the Layer 3
   constructions at `l = 2`, potential diagonalizability of potentially Barsotti–Tate representations at
   `l = 2` (§1.4), which no target uses: the only uses of §1.4 are §9.1's `*Needs:*` line (its sketch does
   not use it) and §10.8 (`l > 2`).

   **Repair.** Shorten the first sentence to its first input ("in Layer 3, unobstructedness of the local
   deformation problems at the ramified primes for all but finitely many `p` (Weston, wes04) together with
   an auxiliary prime `q_a > p` with formally smooth local lifting ring, giving patched modules of full
   support (nt21 pp. 92–96)"), and add a new gap with supplier GL2ModularityLifting Layer 3,
   `gap:slope-zero-one-dimension-count`: "in Layer 3, the dimension count of the slope-`(0, 1)` part of
   quaternionic cohomology at level `U_0(p³)` used in Newton–Thorne II Lemma 3.4 (nt21b pp. 20–22)", cited
   from §10.2 instead of the old slug. In the second gap delete the clause "together with the potential
   diagonalizability … in Layer 1 (§1.4)" and delete the Layer 1 item from the `*Needs:*` line of §9.1.
   Make the same changes to the `gaps` list of `design/plan.json` so that slugs and sentences agree.

5. **F05** (P3) contract rows that no layer consumes

   **Location.** `## Exact supplier contracts`: SerreWeightAndLevelOptimisation §3.2 (README:417–418);
   EndoscopicTransferAndUnitaryTraceComparison §2.15, §6.9, §6.26, §13.4 (README:481–489);
   DeformationAndDerivedPatchingAlgebra §9.2 (README:370); GlobalGaloisDeformations §8.6 (README:355).

   **Claim.** The contracts list what the layers use.

   **Witness.** None of these ids occurs in any target, `*Needs:*` line or layer Dependencies after
   README:552 (searched by supplier name and id; the hits for "§2.15", "§6.9", "13.4" there are
   LocalGaloisDeformationRings §2.15 and this roadmap's own §§6.9, 13.4).

   **Repair.** Delete the seven items from the contracts (or, for each one kept, add it to the `*Needs:*`
   line of the target that uses it and say in the sketch where).

Five findings: two P1 (a proof plan cites a supplier section for a statement that section does not
make, and no other cited supplier makes it), two P2, one P3. No Lean statement was found false; the
two headline theorems of `Suggested.lean` survive every instance tried (table below).

## The adversarial pass: values computed

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `symPowerEulerFactor` (Lean:62) | `n = 0`; `n = 1`; `n = 2` for `Δ` at `2` | `n = 0`: `1 − x`; `n = 1`: `(1 − βx)(1 − αx) = 1 − a_p x + αβx²`; `n = 2`: `e_1 = (α+β)² − αβ = 576 − 2048 = −1472`, `e_2 = αβ·e_1`, `e_3 = (αβ)³` | agrees with README §14.4 | none |
| `HasQuadraticSelfTwist` (Lean:83) | `M = 0`; `M = 1, 2`; `Δ` with `χ_{−4}`; level `32`, `y² = x³ − x` | `M = 0`: `Coprime p 0 ⇔ p = 1`, no prime tested, sign character non-trivial, so `0 < M` is needed; `(ℤ/1)^×, (ℤ/2)^×` trivial; `252·(−1) ≠ 252`; `a_5 = −2`, `ψ(5) = 1`, `a_p = 0` for `p ≡ 3 (4)` | predicate true exactly for self-twists; wrong model "`M ≥ 0`" excluded | none |
| `…_levelOne_entire` (Lean:98) | `n = 0`; `n = 1`; weight with no forms; `N = 1` character | `n = 0` gives `ζ(s)`, pole at `1`, excluded by `hn`; `n = 1`: half-plane `(k+1)/2`, equal to Tau Ceti `LSeries_eulerProduct_hasProd_satakeParameters`; no `Newform 1 k` for `k < 12`: vacuous; `ZMod 1`: `χ(p) = 1` | true as typed | none |
| `…_of_not_hasQuadraticSelfTwist` (Lean:117) | CM form, `n = 4`; CM form, `n = 2`; weight one icosahedral; `n = 0`; `p ∣ N` | `α²β² = p²` gives `ζ(s − 2)(1 − 2^{2−s})`, pole at `3 = 4·1/2 + 1`; `n = 2`: `L(θ²)L(s − 1, ε_K)` entire; `k = 1`: `ζ(s)` factor, pole at `1`; `∏_{p∣N}(1 − p^{−1}) ≠ 0`; at `p ∣ N` parameters `{a_p, 0}`, omitted | every hypothesis needed; true as typed | R03 (citation only) |
| §0.2 character space | `p = 3`, `C_5` | `Hom(ℤ_3^× × ℤ̂, C_5)` has `5` elements, `Hom(ℤ_3^× × ℤ_3, C_5)` has `1` | Check holds | none |
| §0.3 scalar at `c` | conjugation by `(α, 1)` in `𝒢_n` | `(α,1)(A,μ)j(α,1)^{−1} = (α²A, μ)j` | bijection holds with `2` invertible | none |
| §0.4 dimension | `n = 2`, `H² = 0` | `1 + 0 + 4 = 5` | holds | none |
| §1.3 derivative matrix | indices `{0, 2}` | `[[1, 1], [0, 2]]`, determinant `2 = ∏(j − i)` | holds | none |
| §2.1 twin | `Δ` at `2`, `3`; `η(5) = −1` | `v_2(−24) = 3`, slopes `3 + 8 = 11`; `252 = 2²·3²·7`, slopes `2 + 9`; `v_2(ζ − 1) = 2^{1−m} ≤ 1 < 2` | holds | none |
| §2.2 modulus | `⟨2⟩ ⊃ ⟨4⟩`, modulus `3` | `2^a ≡ (−1)^a` | holds | none |
| §2.5 `Sym^6` test | `Q_8`; `S_4`; `A_5` | `Sym³` eigenvalues `−i, i, −i, i`; irreducibles of `S_4` have dimension `≤ 3`, of `A_5` `≤ 5 < 7` | holds | none |
| §3.2 boundary weights | `k = 3, 4, 6`; `k = 2, m = 1` | `w = 4, 24, 624`; `v_2 = 2, 3, 4`; `w = −2`, `v_2 = 1` | holds | none |
| §3.4 regularity | orders in `𝔽_5^×`, `𝔽_7^×` | `2³ = 3`, `2⁵ = 2` of order `4`; `2³ = 1`, `2⁵ = 4`, `2⁷ = 2` of order `1, 3, 3`; `τ(2) ≡ 1`, `2^{11} ≡ 3` mod `5` | incompatible, as claimed | none |
| §3.7 ping-pong | `i = 1` | `m_π = 2`, `k′ = 9`, `2 < 7/2`, `i′ = 4 − 1 = 3`, slope `6` | holds | none |
| §4.1 `Φ_2`, `μ` | `n = 2`; `𝔽_9/𝔽_3` | `Φ_2^t = −Φ_2 = Φ_2^{−1}`; `|𝔽_9^×/𝔽_3^×| = 4` | holds | none |
| §4.4 degrees | `q = 3`, `p = 7` | `q(q − 1) = 6`; `(q + 1)(q² − 1) = 32`; `−1 + 6 + 27 = 32`; `q³ + 1 = 28`; `3` has order `6` mod `7` | holds | none |
| §4.8 index, Kottwitz | `ζ = −1`, `n` odd; `q = 3`, `k = 3` | `det ζ = −1`, class `2k + 1 ≡ 1` in `ℤ/2`; `[K : B] = 4·40·364 = 58240` | holds | none |
| §4.9 pullback | `PGL_2`, `s = diag(i, −i)` | `zs = −s` is `W`-conjugate; restriction to `SL_2` is the order-two unramified series, `2 = 1 + 1` | (d) needed, holds | none |
| §4.10 homology | `n = 7, 9, 11` | `4 + 2 + 2 = 8 = 1 + 7`; `14 = 1 + 11 + 2`; `22 = 1 + 16 + 5`; `L_4 = [1,0,2,1] + [1,2,0,1]` | recursion consistent | none |
| §4.12 signs | `m = 5`, `m = 3` | `jY − jX + jZ` has `12 = 2·6` terms, the six shuffles of `(2,1)` with `(1,0)` doubled; `m = 3`: `2[1,0,1] + 4[1,1,0]` | holds | none |
| §5.2 sign at `T_1` | `St_2 ⊞ 1`, `n` odd | `sp(2) ⊗ 1` has sign `−1`, multiplicity `1`; twist by the unramified quadratic character gives `+1` | holds | none |
| §5.8 partitions | `n = 7` | dominating `3+3+1` with orthogonal parity: `3+3+1`, `5+1+1`, `7` | holds | none |
| §5.10 count | `q ≡ −1`, `n = 7, 9` | `[1,0,−1]`, `[1,0,1]` reduce to `(−1, 1, −1)`; `[1,1,0]` does not: `dim Y(χ̄) = 3`; `Z(χ̄) = 0`; `2(a + b) ≤ a + 3b ⇔ a ≤ b` | holds | none |
| §6.9 congruence | `q = 2`; `𝔽_5`, `𝔽_7` | `2·1·2 = 4 ≠ 1`, exchanged `3·2 = 1`; `{3, 1}`: ratios `3, 5 ∉ {2, 4}` | holds | none |
| §7.1 `σ_0` | `a_2`, `a_5` | `(1 + i)⁴ = −4`; `(2 + i)⁴ + (2 − i)⁴ = −14` | holds | none |
| §7.2 | `n = 3` | `48·6 = 288`, `577` prime, `(p − 1)/8 = 72 > 12`; `χ_iχ_i^c = ε^{3(n−1) − 4(n−1)}` | holds | none |
| §7.4 defect | `r = r_τ ⊗ ω_1ω_0^{2k}` | `r^c ≅ r^∨ ⊗ ε^{−2k}δ_{K/ℚ}` from nt21 lines 4222–4223, 4253, 4290 | defect confirmed | none |
| §9.3 characters | `n = 2, 3, 4` | exponents `1, −1`; `1, 0, −1`; cube-root ratio gives `α³ = β³` | holds | none |
| §9.5, §12.6 dimensions | `W_∞`, `W′_∞` | `1 + q + 4|S ∪ S_∞| − 1`; difference `(n − 1)q` | holds | none |
| §9.6 against §12.6 | bound on `q` | nt21b Proposition 2.8: `q ≥ |S ∪ S_∞| − 2` (`γ ≥ 0`); nt26 Proposition 4.9: `q ≥ |S ∪ S_∞|` (`γ ≥ 2`) | both as in the sources | none |
| §10.3 | `n = 3` | `t > 48`, `t = 53`; `158` not prime, `211` prime, `212 = 4·53` | holds | none |
| §10.5 | `t = n = 13` | `tr I_{13} = 0` in `𝔽_{13}`; `8·13·12 = 1248` | holds | none |
| §11.3 polarisation | `s` | `s^c ≅ s^∨ ε^{−1 − 2(r−1)} ω_p^{r−1}(yy^c)^{1−r} = s^∨ε^{1−2r}` | holds | none |
| §11.6 auxiliary place | `𝔽_7`, `q = 3`, `Φ = diag(1, 2)` | `3, 3, 6, 5` | holds | R02 (citation) |
| §12.4 | `r = 1`, `α = 2`, `β = 3`, `γ = 5` | `η = (10, 15)`, `U^{(2)} − q^{−1}·150` | holds | none |
| §13.4 eigenvalues | `r = 4`, `q = 17`, `x = 2`, `y = 3`; `q = 43` | forbidden set `{1,2,4,8,9,13,15,16}`; eigenvalues `7, 6, 10, 11, 14, 12, 3, 5`; `xy³ = xy^{−3}` when `y³ = 1` | holds | none |
| §13.8 cyclotomic clause | `p = 7`, `a` odd | `7^a ≡ 3 (4)`, scalars of determinant `±1` are `±1`; `|PGL_2(𝔽_q)| = q(q² − 1) > q(q² − 1)/2` | holds | none |
| §13.10 Bertrand | `n = 6, 7, 11, 12` | `p = 5`; `5`; `7` only; `7` or `11`; indices `r − 1, r, r + 1, p − r < n` | holds | none |
| §14.1 | `Sym^{n−1}(St ⊗ χ)` | `sp(n) ⊗ χ^{n−1}`; `T_v ≡ 2`, `(q_v + 1)² ≡ 4` | holds | none |

## Verified sound

- **Declarations read: 4** (and the one proved `example`), each against its README statement and the
  elaborated type in the worker's signature file; no binder is lost and the README's generality equals
  the Lean's (level one, any `k`; level `N`, `2 ≤ k`, no quadratic self-twist, `1 ≤ n`). I ran no Lean:
  this brief gives no Lean command. No declaration is padding by the one-tactic probe: `§14.4` is not a
  one-step consequence of `§14.5` at the pins (it needs `k ≥ 2` and the absence of self-twists in level
  one). The `example` tests the symmetry that makes `hαβ` independent of the ordering.
- **Targets read: 110** sections (all of Layers 0–14), with the supplier contracts, conventions,
  examples and references; every line of both files.
- **Headlines.** Stated: holomorphy in level one (§14.4) and for non-CM newforms away from the level
  (§14.5). Not statable and named in the module docstring: Theorem 2.33, Theorem D, the level-raising
  theorems, Theorems E and 7.1, the Clozel–Thorne powers, Theorem B, the two lifting theorems, the
  tensor theorems, `SP_n`, and the all-place form of §14.3. I found no further headline statable at the
  pins: Tau Ceti has newforms and Satake parameters but no automorphic representations, Galois
  representations of forms, eigencurve or Hilbert forms.
- **Locators verified: 161** against the cached texts (nt21 59, nt21b 20, nt26 34, th24 16, ct17 27,
  con99 1, bk05 2, kv12 1, and nt21 p. 2 footnote 1 for the CM condition). Statements compared in full
  for nt21 Theorems 2.33, 3.2, 4.1, 6.1, 7.1 and Lemmas 3.3, 2.34; nt26 Lemma 2.3, Theorem 4.1,
  Propositions 3.9, 4.9, 6.3, Theorem 6.4; th24 Theorems 6.11, 7.1, 7.5, 7.6, Corollary 7.2,
  Lemma 7.3; bk05 Theorem B and its corollary.
- **Checks tested: about 140** recomputed (those with numbers or a decidable instance); none false.
- **Sibling citations checked: 190** section ids resolved to headings at the cited roadmaps' current
  heads or on main (all found; `§8.17` of PotentialAutomorphyInfrastructurePartII is the alias row of
  its table, as the README says), and the statements read for 24 of them. The parent's §§4.5–4.12,
  4.20, 4.23, 4.29–4.32 agree with the targets that say they prove them.
- **Pinned declarations: 16** found at the pins with the stated content
  (`Nat.multiplicity_pow_two_sub_one`, `Nat.exists_prime_lt_and_le_two_mul`,
  `NumberField.abs_discr_gt_two`, `Polynomial.discr`, the three `changeLevel` lemmas,
  `MulChar.map_nonunit`, the Tau Ceti Satake and `L`-function lemmas).
- **Ownership.** No declaration of `Suggested.lean` shares a name or an object with the pinned
  libraries, a roadmap on main or an open roadmap pull request (searched for the Euler factor, the
  self-twist predicate and `satakeParameters`); the non-CM notion is cited to
  GL2AutomorphicRepresentationsAndTransfer §R16.4.6.
- **Gaps.** The 14 slugs of the README equal those of `design/plan.json`; each names a supplier.
- **Policy.** No pull-request number, process narrative, `lemma`, `set_option` or `True` placeholder;
  one module docstring; imports are Mathlib and one existing Tau Ceti module.
- **Direction of supply.** `depcheck: 248 roadmaps, 2354 edges, 0 problem(s)`.

## Not verifiable

- kl87, bbm82, kw09: settled as uncertified; cited by locator only.
- at20, chen14, moe07, dm18, ls20, wes04, ct15: locators not opened in this pass (16 locators in all).
- The corrections the README makes to ct17 (the `(10, 10)` matrix entry, the exponent of `X` for
  `m = 3`, the socle after (3.9)) and to nt26 (Lemma 3.4's field, the generator of `𝔪_{G,Q}`, Lemma 3.7's
  image equality, `SP_0` in Theorem 6.4): I checked the README's own arithmetic for each but did not
  compare the printed text line by line.
- The truth of the deep targets (the patching arguments, the trace-formula counts) beyond their
  consistency with the sources and with one another.
- Elaboration of `Suggested.lean`: not run here.

Source independence: 12 passages compared with 5 sources (nt21, nt21b, nt26, th24, bk05), none shared
beyond formulas and hypothesis lists that can be written in one way; largest share nt21, 93 of 260
locators; contents compared with nt21: independent (Layers 0–2 ↔ §2 split in three, Layer 3 ↔ §3,
Layer 4 ↔ §1 placed after them and merged with ct17 §§2–3, Layer 5 ↔ §4 with ct17 §§3–4, Layer 6 ↔ §6
with ct17 §5 and th24 §6, Layer 7 ↔ §7 with ct17 §6, Layer 8 ↔ §8, §5 not planned here; not one to one,
not in the same order).

## Source issues

- **Misprint** in nt21 at Lemma 3.3, p. 54: the source says the original point `z` lies on the second annulus; it should be its twin `z′`, as the proof says; affects nothing.
- **Misprint** in nt21 at Theorem 4.1(4), p. 60: the source says the block size of the type is `n_2` (`2` on `T_2`, `n − 2` on `T_3`); it should be `n_1`, the parameter of its §1.17; affects nothing.
- **Gap** in nt21 at Lemma 2.34, pp. 51–52: the source says only that the cover of the weight component is finite étale; it should also say surjective, which the proof of Theorem 2.33 uses to lift points; affects the proof.
- **Error** in nt21 at the proof of Proposition 7.4, p. 88: the source says the rank-two block built from the level-raised form of determinant `ε^{−8k}δ_{K/ℚ}` satisfies the hypotheses of Theorem 4.1; it should be conjugate self-dual, but differs from its polarized dual by `δ_{K/ℚ}` on `G_{F_0}`; affects the proof.
- **Misprint** in th24 at the proof of Corollary 7.2, p. 42: the source says Bertrand gives a prime with `n < p < 2n`; it should be `p < n < 2p`; affects nothing.
- **Error** in th24 at the proof of Lemma 7.3, pp. 42–43: the source says the group lies between `SL_2(𝔽_{p^b})` and scalars times `SL_2(𝔽_{p^b})`; it should be scalars times `GL_2(𝔽_{p^b})` when the projective image is `PGL_2`; affects the proof.

## For the human reviewers

- **Scope.** README:108–116 and §7.4 record that the printed odd-rank step of nt21 Proposition 7.4 fails by a quadratic character, and obtain Theorems 7.1 and E in all ranks from nt26 instead; I recomputed the defect from nt21 pp. 86–88.
- **Scope.** Layers 9–10 correspond in order to nt21b §§2–3 and Layers 11–13 to nt26 §§3, 4, 5–6; the lines §10.6 → §9.8, §13.3 → §11.10 and §13.4 → §12.7 force 9 before 10 and 11, 12 before 13.
- **Licence.** ct17, ct15, bk05 and con99 are read from authors' pages (`sources.toml`, `licence_class = "author-page"`); the published versions are not the texts whose pages the README cites.
- **Not tested.** `Suggested.lean` was not elaborated in this pass; the signature comparison used the worker's elaborated types of the file at this head.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "669767713bc133cf61b22bfa68680f88d2ba2c9a", "job": "RT-ModularityAndLanglandsExtensionsPartII~1b", "model": "fable", "worker": "chris-x55"} -->
