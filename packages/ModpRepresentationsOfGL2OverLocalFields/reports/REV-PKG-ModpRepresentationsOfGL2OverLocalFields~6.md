<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13474#issuecomment-6849923020 -->
Review (claude) of a938c9e

Verdict: needs_changes

1. **F01** (P1) The Barthel–Livné classification for `F ≠ ℚ_p` is consumed from a section that does not state it

   **Location.** `packages/ModpRepresentationsOfGL2OverLocalFields/README.md` l. 1023–1025 (§2.4 route):
   "for `F ≠ ℚ_p` exclude supersingular constituents by PadicLocalLanglandsForGL2Qp §2.9 and the
   Barthel–Livné classification (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5.15)". Same citation
   at l. 1056–1057 (§2.4, last Check) and in the contract at l. 299–300.

   **Claim.** R07.5.15 supplies, for every finite `F/ℚ_p`, that a non-supersingular irreducible with
   central character is a character, a twist of Steinberg or a principal series `Ind_B^G(χ₁ ⊗ χ₂)`.
   §2.4 (CDN23 Lemme 1.29) needs exactly this, and §2.5 then applies §2.2, which computes `Ord_B` and
   `R¹Ord_B` only on `χ∘det`, `St ⊗ χ∘det` and `Ind_{B̄}^G U`. §2.5 and the Layer 2 Examples also use
   that `Ind_{B̄}^G` of a finite `T`-module lies in `𝒞` for `F ≠ ℚ_p` (CDN23 line 916), i.e. that
   principal series are finitely presented.

   **Witness.** FiniteFlatGroupsAndIntegralPadicHodgeTheory at the head of its open pull request,
   `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md` l. 8208–8210: "the quotient
   `I(σ)/(T − λ) ⊗ (χ∘det)` is irreducible unless `(r, λ) ∈ {(0, ±1), (p − 1, ±1)}`, where it has
   length `2` with constituents a character and a twist of the Steinberg". The whole of R07.5.15
   (l. 8196–8262) contains no principal series and no finite-presentation statement, and the clause is
   written in the `ℚ_p` labels `(r, λ)`. PadicLocalLanglandsForGL2Qp §§2.6–2.7 (l. 820, 854) are stated
   for `GL₂(ℚ_p)` only ("Here `F = ℚ_p`"). `roadmaps grep 'Barthel.{0,6}Livn'` finds no other owner on
   main or at an open head. The plan declares two gaps, neither of them this one.

   **Exact repair.** Declare the dependency instead of citing it as supplied (same slug in
   `design/plan.json` `gaps` and under `### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory`):

   - `What FiniteFlatGroupsAndIntegralPadicHodgeTheory must provide (gap:barthel-livne-ordinary-classification):`
     for every finite `F/ℚ_p`, every irreducible smooth `k̄[GL₂(F)]`-module with central character that
     is a quotient of some `I(σ)/(T − λ) ⊗ (χ∘det)` with `λ ≠ 0` is a character `χ∘det`, a twist
     `St ⊗ χ∘det` or a principal series `Ind_B^G(χ₁ ⊗ χ₂)` with `χ₁ ≠ χ₂` (Barthel–Livné, as recorded
     in CDN23, §1.2.1, pp. 11–12), in R07.5.15.
   - For membership in `𝒞`: add to §2.4 the target "for every finite `F/ℚ_p` the characters, the
     twists of Steinberg and the irreducible principal series are admissible and finitely presented
     (CDN23, §1.2.3, p. 12)", with a second single-conclusion gap on R07.5.15 for the input its route
     needs (the presentation of a principal series as a quotient of some `I(σ)` by a finitely generated
     subrepresentation), and add both to the `*Needs:*` lines of §§2.4–2.5.
   - Reword l. 299–300 so that the contract claims only what R07.5.15 states, and point l. 1024 and
     l. 1056–1057 at the new gap.

   I read CDN23 lines 485–497 (the four classes, for every `F`) and 534–535 (ordinary irreducibles are
   admissible and finitely presented, also for `F ≠ ℚ_p`); BARTHEL-LIVNE94 is waived, so I give no
   theorem number for it.

   **Test of repair.** `F = ℚ_{p²}`, `V = Ind_{B̄}^G(χ₁ ⊗ χ₂)`, `χ₁ ≠ χ₂`: with the first gap its
   constituents are in the list of §2.2, so `R¹Ord_B(V) = 0` and `Ord_B(V) = χ₁ ⊗ χ₂` (dimension `1`),
   as §2.5's first Check says; with the second, `V` is a quotient of a finitely presented `I(σ)` by a
   subrepresentation of finite type, hence finitely presented by §0.4, and lies in `𝒞`. For `F = ℚ_p`
   nothing changes: PadicLocalLanglandsForGL2Qp §§2.6–2.7 already state both.

2. **F02** (P3) §9.2: the prime bound is off by one

   **Location.** `README.md` l. 2222: "The bounds force `p ≥ 15`, that is `p ≥ 17`."

   **Claim.** `5 < r_i < p − 7` has an integer solution only for `p ≥ 15`.

   **Witness.** `r = 6` needs `6 < p − 7`, i.e. `p ≥ 14`: at `p = 14` the range `5 < r < 7` contains
   `6`. The sibling Checks are computed correctly (§9.1: `3 < p − 4` gives `p ≥ 8`; §7.5: `p ≥ 7`).

   **Exact repair.** "The bounds force `p ≥ 14`, that is `p ≥ 17`." Tested: `p = 13` gives
   `5 < r < 6`, empty; `p = 17` gives `r ∈ {6, …, 9}`.

3. **F03** (P3) Two cited works have no entry in the References

   **Location.** `README.md` l. 576: "the amalgam decomposition from Serre's *Arbres, amalgames, SL₂*,
   Chapter II"; l. 303–304 and l. 689: "Barthel–Livné, Proposition 18".

   **Claim.** Every cited work is listed under `## References`.

   **Witness.** The References (l. 2326–2364) have 17 entries; `sources.toml` has 19 keys. The two
   without an entry are `SERRE-TREES` (certified, Numdam) and `BARTHEL-LIVNE94` (waived).

   **Exact repair.** Add `**SERRE-TREES** — Jean-Pierre Serre, *Arbres, amalgames, SL₂*, Astérisque 46
   (1977); Chapter II` and `**BARTHEL-LIVNE94** — L. Barthel, R. Livné, *Irreducible modular
   representations of GL₂ of a local field*, Duke Math. J. 75 (1994), 261–292; Proposition 18`, and
   write the keys at l. 576, 303 and 689. Tested: 19 entries against 19 manifest keys.

4. **F04** (P3) §2.4 uses `D₀(ρ̄)` outside the range in which the roadmap defines it

   **Location.** `README.md` l. 1047–1051: "Take `p > 2` … a generic irreducible `ρ̄` in the sense of
   BP12, Definition 11.7 … contains `⊕_{i∈ℤ} D₀(ρ̄)`".

   **Claim.** `D₀(ρ̄)` is a defined object at this point for every `p > 2`.

   **Witness.** The roadmap defines `D₀(ρ̄)` only in §3.5 (l. 1298), for tame `ρ̄` with `μ − η` 1-deep,
   i.e. `1 ≤ r_i ≤ p − 3`: empty at `p = 3`, which the Check allows. LE19 line 108–110 takes it from
   BP12, Theorem 13.8.

   **Exact repair.** Write "the finite-dimensional `KZ`-module `D₀(ρ̄)` that BP12, Theorem 13.8,
   attaches to `ρ̄` (for 1-deep tame `ρ̄` the module of §3.5)". Tested at `p = 3`: the Check then names
   an object that exists (LE19 line 107 gives generic `ρ̄` for `p > 2`), and for `p ≥ 5` agrees with §3.5.

Four findings: one P1 (an unowned prerequisite written as if supplied) and three P3. The four
findings of the previous review are repaired. `packages/ModpRepresentationsOfGL2OverLocalFields/README.md`,
`Suggested.lean`, `metadata.toml` and `sources.toml` were not edited by this review; no source had
to be fetched.

## Previous findings (REV-PKG-ModpRepresentationsOfGL2OverLocalFields~5)

| Id | Repaired passage (README line) | Status | Independent check |
| --- | --- | --- | --- |
| F01 (P1) | §1.2, l. 751–755: "quotients of `I(χ|_K)` and of `I(χ⁵|_K)` respectively, and not of a common one" | repaired | In `𝔽₂₅ = 𝔽₅[t]/(t²−2)`: `t⁵ = t·(t²)² = 4t = −t`; a `K`-map `χ → χ⁵` is a scalar `c` with `tc = −tc`, `2t ≠ 0`, so `c = 0`. `Hom(χ,χ) = Hom(χ⁵,χ⁵) = 1`, mixed `= 0`. |
| F02 (P1) | §2.4, l. 1041–1059: "an admissible absolutely irreducible smooth `k[G]`-module `π` … is not in `𝒞`"; new negative control with Le's representation | repaired | LE19 lines 30–31 (Theorem 1.1), 46–47 (central character, Hecke eigenvalues), 118 (`K₁` trivial on `D₀`), 165–169, 231–237 (Theorem 3.2), 269–271 (Theorem 3.4). `λ₀ = 1 ≠ 2 = λ_i` for `p > 2`, both in `𝔽_q^×`; `dim π^{K₁} ≥ Σ_{i∈ℤ} dim D₀ = ∞`. See R04 for a notation remark on the new Check. |
| F03 (P2) | §1.1: the Check asserting infinite length of `I(σ)/T I(σ)` is gone; l. 692–694 now cite only Emerton's conjecture | repaired | CDN23 lines 702–705 (Remarque 1.18, p. 16) state the conjecture only; PadicLocalLanglandsForGL2Qp §2.9(iii) at its head says "not irreducible". No infinite-length claim remains (searched "infinite length": the remaining ones are `I(σ)` itself and its cosocle). |
| F04 (P3) | `sources.toml` VIGNERAS11 locator; README l. 630–631 and References l. 2347–2350 | repaired | "Théorème 6, pp. 19–21; Proposition 8 and Lemme 11, p. 21; Propositions 9–10, p. 22" in all three places. |

The repaired patterns were searched in the rest of the README: no other place makes two
Galois-conjugate characters quotients of one compact induction, asserts admissibility of
irreducibles away from `ℚ_p`, or attributes a length statement to PadicLocalLanglandsForGL2Qp §2.9.

## Verified sound

### Principles

All four files and all 60 numbered subsections were read in full this round. No route-specific
shortcut (the all-prime statements of Layer 1 keep `p = 2, 3` through the declared Ext gap; depth
bounds of Layers 3–9 are hypotheses of the structure theorems), no re-planned roadmap, no copied
passage, no algorithm, no sorry'd data, no `set_option`. Layer names are mathematical; the README
does not say it follows a source. Ten layers, each with Examples and Dependencies; definitions carry
API and at least three Checks; theorems carry hypotheses and locators (subject to R01).

### Seeded source sample (15 targets) and flagged locators

No locator is flagged unverified by the author. Each statement was compared with the cached text.

| Target | Text read | Result |
| --- | --- | --- |
| §0.2 | SHOTTON20 lines 301–349 (Proposition 3.2, Lemmas 3.3, 3.5), 350–399 (Lemma 3.6, Proposition 3.8); CDN23 lines 421–427 (§1.1.1, p. 10) | Algebra structure, independence of `U`, freeness (hence flatness) over `A[[K]]`, unique module extension: as stated. Shotton's `A` is complete local noetherian over `W(𝔽)`; `𝒪_L` qualifies. |
| §2.1 | EMERTON1 lines 686, 753–767, 780–788 (Definitions 3.1.3, 3.1.9, Lemma 3.1.7, (3.1.8), pp. 15–17), 1759 (Theorem 4.4.6); CDN23 lines 865–879 (§1.5.2, p. 20) | `Ord_P(V) = Hom_{A[Z_M^+]}(A[Z_M], V^{N₀})_{Z_M-fin}`; for the torus `Z_M = T`, `Z_M^+ = T⁺`. Adjunction from the opposite parabolic, no modulus. |
| §2.4 | CDN23 lines 823–839 (Théorèmes 1.26–1.27, Remarque 1.28, p. 19), 855–864 (Lemme 1.29, p. 20) | Statements match; the proof of Lemme 1.29 (line 860) is where R01's input enters. |
| §2.6 | CDN23 lines 917–920 (Corollaire 1.34, p. 21), 894–916 (Lemmes 1.31–1.32, Proposition 1.33) | Lattice with reduction in `𝒞`, `σ` of finite type over `𝒪_L`, kernel and cokernel of finite type; standing `F ≠ ℚ_p` from line 841. |
| §3.4 | BHHMS23 lines 612–648 (Definition 2.3.1, p. 14), 702–721 ((14), Proposition 2.4.2, p. 16) | `α′_j = s₁⁻¹⋯s_j⁻¹(μ_j + η_j)`: the README's input `ν = μ + η`, no extra `η`. `W(ρ̄) = {F(t_{μ−η}(sω))}` with `μ − η` 1-deep. Geometric Frobenius normalisation, line 621. |
| §3.5 | BP12 lines 3036–3064 (Proposition 13.1, Corollary 13.2, pp. 75–76); page markers 2998, 3032 | Maximal module with multiplicity-one socle weights, decomposition by socle. |
| §4.7 | BHHMS23 lines 2817–2834 (Corollary 5.3.5, pp. 54–55) | Hypothesis for each `χ` with `Hom_I(χ,π) ≠ 0`; conclusion `dim_I = dim_{I/Z₁} ≤ f`; the annihilation by the ideal is in the proof. `p > 3` standing (line 2882 for §6; §5.3 for the valuation). |
| §5.3 | BHHMS23 lines 2992–3007 (Lemma 6.2.1, p. 58); BP12 line 986 (Corollary 3.12, p. 26) | Bounds `0 < r_i < p−1` for (i), `0 < r_i < p−2` for (ii)–(iii); length `2^{#{a_i ≠ 0}}`. |
| §6.1 | BHHMS23 lines 3037–3047 (Proposition 6.2.2, p. 59); HU10 line 902 (Lemme 2.13, p. 14) | `B_i ≡ (1 − ε_{i−1})/2`, the two range conditions with `(1 + ε_{i−1})/2`: equal to the README's `d_i`. Existence, not uniqueness. |
| §6.3 | BHHMS23 lines 3138–3208 (Lemmas 6.3.1, 6.3.3–6.3.5, pp. 61–63) | Each bound (`0 < r < p−3`, `2 < r < p−3`) on the clause that needs it. |
| §6.5 | BHHMS23 lines 3235–3250, 3277–3287, 3373–3385 (Lemmas 6.3.7–6.3.9, Proposition 6.3.10, pp. 63–67) | `2 < r < p−4` for constituents and socle; 4-deep (`3 < r < p−5`) for the filtration; 5-deep for the adjacent pairs; direct sum when `ε_j = 0`. |
| §7.5 | BHHMS23 lines 3711–3723 (conditions (a), (b)), 3778–3813 (Proposition 6.4.6, p. 75), 3668–3671 (Definition 6.4.2) | Hypotheses (a)–(c) and `2 < r_i < p−3` as in §§7.4–7.5; the order of the two Ext conditions agrees. |
| §8.4 | BHHMS23 lines 4074–4103 (§7.3, (56), pp. 81–82), 354 ((7), p. 8) | `R₁`, `R₂ = sl₂(𝒪_F) ⊗ P̃_σ`, 3-deep, `ι` diagonal, `R₂′` the preimage. |
| §9.1 | BHHMS23 lines 4232–4255 (Proposition 7.4.1, pp. 84–85) | `2 < r_i < p−4`; dimension `2^f(f+1)` from the proof. |
| §9.3 | BHHMS23 lines 4256–4300 (Lemma 7.4.2, Proposition 7.4.3, Remark 7.4.4, pp. 85–86) | `5 < r_i < p−7`; every quotient and subquotient; relative projectivity. |

Also read: CDN23 lines 686–817 (§1.4, pp. 16–19: Propositions 1.17, 1.19–1.20, Théorèmes 1.21, 1.24,
Lemmes 1.22–1.23, 1.25), 441–470 (§1.1.2, Propositions 1.2–1.3), 500–527 (Lemmes 1.6–1.7, Remarque
1.8); SHOTTON20 lines 112–221 (Definition 2.3, Lemmas 2.4–2.8); BHHMS23 lines 3673–3710 (Lemma 6.4.3),
3816–3828 (Theorem 6.4.7); LE19 in full. Page numbers of 40 BHHMS23 locators were checked against
the page markers; all agree.

### Adversarial table

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.1 torsion admissibility | `L/𝒪`, `⊕_ℕ k`, zero | `(L/𝒪)[p^j]` has length `je`; `⊕_ℕ k`: `V[p]` infinite; `0`: length `0` | pass |
| §0.2 crossed product | `ℤ_p ⋊ C₂` | `sTs⁻¹ = (1+T)⁻¹ − 1 = −T + T² − …`; mod 2 the `T` coefficients agree and `T²` differs (`1` vs `0`) | pass |
| §0.3 Check | `k[ℚ_p/ℤ_p]` over `k[ℚ_p]` | finitely many `[x_i] − 1` cut out `k[ℚ_p/⟨x_i⟩] ≠ k[ℚ_p/ℤ_p]` | pass |
| §0.5 headline `isFinitelyPresented_ker` | `ϖ = 0`; index of `G₀` | `Matrix.scalar 0` is not invertible, set empty, quotient `= G`; `det(ϖI) = ϖ²`, `[G′ : G₀] = 2` | pass; `Irreducible ϖ` in scope |
| §1.2 repaired Check | `𝔽₂₅/𝔽₅` | see F01 row: Hom dimensions `1, 1, 0` | pass |
| §1.3 headline | `I(σ)`; trivial character | presentation with zero relations, length `∞`; length `1` | pass |
| §1.4 | `p = 5`, `δ(u) = ū` | `δ(z²)` at `z = 2`: `δ(4) = 4 ≠ 1`; `δ² ≠ 1` exists iff `p − 1 > 2` | pass |
| §1.5 headline | `I(1)/(T−1)`, `π ⊕ π` | augmentation has `T ↦ q + 1 = 1`, so the trivial character is the quotient: cosocle length `1`, length `2`; `π ⊕ π`: bound `2` | pass |
| §1.6 headline | `1`, `St`, `I(1)/(T−1)` | smooth dual dimensions `1`, `0`, `1` (left exactness on `0 → St → V → 1 → 0`) | pass |
| §2.1 convention | `χ∘det`; `Ind_B(χ₁⊗χ₂)` | Hecke scalar `q^m χ(det t) = 0`; `Ord_B = χ₂ ⊗ χ₁` | pass |
| §2.2 Hecke operator on `H¹(N₀, χ∘det)` | `ℚ_p`, `ℚ_{p²}`, `ℚ_p(√p)`, `ℚ₅(√5)` with `t = diag(2ϖ,1)` | transfer `= ×q`, conjugation `= ÷c`: multiplier `q/c` equals `1`, `p ≡ 0` on `𝒪_F/p`, `ϖ` (square zero), and `ϖ/2`: `ℓ(3ϖ) = 3`; `(q/c)² = 5/4 ∈ 5𝒪_F` | pass |
| §2.4 headlines | `k²` trivial, `St`, `c-Ind σ` | lengths `2`, `1`, `∞`; the last is not admissible | pass |
| §2.4 Le control | `p = 5`, `λ = (1, 2, 2, …)` | `2 ≠ 1` in `𝔽₁₂₅`; `dim π^{K₁} = ∞`; `δ` has orbits of sizes `6` and `2`, no fixed weight | pass (R04 on notation) |
| §2.5–2.6, R01 | `Ind_{B̄}(χ₁⊗χ₂)` over `ℚ_{p²}` | needs: constituents in the §2.2 list; finite presentation. Supplier text at l. 8208–8210 gives neither | R01 |
| §2.6 headline | `ℚ_p`, `ℚ_{p²}`, `ℚ_p(√p)`; `Θ = 𝒪` trivial | `(e,f) = (1,1), (1,2), (2,1)`: excluded only the first; `M = 0` gives kernel `0`, cokernel `𝒪` | pass |
| §3.2 | `p = 17`, `λ = (5,0)`, `ω = ∓1`; `f = 2`, `ω = (1,0)` | `(0,−11)`: `Sym¹¹ ⊗ det⁵`; `(−1,−10)`: `Sym⁹ ⊗ det⁶`; `((6,0),(−1,−10))` | pass |
| §3.3 | `p = 3`, `f = 1`; `p = 2` | `Λ = {0,1}`, `t(1) = (−1,−1) = det`; `|GL₂(𝔽₃)| = 48`, `P₁` uniserial `1, det, 1`, `Ext¹(det,1) = 1`, `Ext¹(1,1) = Hom(C₂, 𝔽₃) = 0`; `(2,1)`: `Hom(S₃, 𝔽₂) = 1` | pass |
| §3.4 | `s = 1`, `μ = (6,0)`; `s = −1` | `ω⁶ ⊕ 1`, weights `Sym⁵`, `Sym⁹ ⊗ det⁶`; `a₁ = s(6,0) = (0,6)`: `ω₂⁶ ⊕ ω₂^{102}` | pass |
| §3.5 | `p = 17`, `r = 5` irreducible | dimensions `6 + 10 + 12 + 4 = 32`; characters at `diag(3,1)`: `3⁵ = 5`, `1`, `3¹⁵ = 6`, `3⁴ = 13` | pass |
| §4.3–4.4 | `u`, `l`, commutator; degree counts | `ulu⁻¹l⁻¹ = (1+p+p², −p; p², 1−p)`, value `1`; `gr²`: `f(2f+1) + f`; `dim W_{χ,3} = 1 + 4f + 2f²`, `7` at `f = 1` | pass |
| §4.7 | `V = 0`; `C^∞(I/Z₁)` | `−∞ ≤ f`; `7` against `1` at `χ = 1` | pass |
| §5.1 | `p = 5, f = 1`; `p = 5, f = 2`; `p = 7` | `α² = α⁻²` (order 4): multiplicity 2; mod 24 the exponents `±1, ±5, ±2, ±10, ±6, ±4` are 12 distinct classes; order 6: `α^{±1}, α^{±2}` distinct | pass; `p > 5` suffices |
| §5.3 | `p = 17`, `r = 5`; `r = p−3` | `Ind_I^K χ^s`: `Sym⁵`, `Sym¹¹ ⊗ det⁵`; `dim P_σ = 2p = 2(p−2) + 1 + 3` | pass |
| §6.1 | `ε = (+1,−1)` | `d = (0,1)`: `B₀` odd, `B₁` even | pass |
| §6.5 | 4-deep | `4 ≤ r ≤ p−6` equals `3 < r < p−5` | pass |
| §7.1 | `{1, α²}`, `{1, α, α²}` | socle of `W_{χ,3}` is degree 2 (`e·(ae + bf) = ae² + b·ef = 0` forces `a = b = 0`); first set has no middle; second: pairs `(1,α²)`, `(α²,1)` both have middle `α` | pass |
| §7.5 | `p = 7` | `2 < r < 4`: `r = 3` | pass |
| §8.3 | `e ⊗ v_λ`; trace | `ψ(e⊗v) = [e,2e]⊗fv + [e,rh]⊗v = −2r·e⊗v`; `−2r(r+3) + 4(r+1) + 2(r+2)(r−1) = 0`; `p = 11, r = 3`: `5, 4, 10` | pass |
| §8.4 | ranks | `1 + 3f` copies: `rank R = (1+3f) dim P_σ` | pass |
| §9.1 | `f = 1, 2` | `[R/pR : σ] = 2 + 2 = 4`; `4 + 2·4 = 12 = 2²·3` | pass |
| §9.2 Check, R02 | `p = 13, 14, 17` | `5 < r < 6` empty; `r = 6`; `r ∈ {6,…,9}` | R02 |
| §9.3 | `Q = σ` | `Hom(σ,σ) = 1 = Hom(T_σ,σ)` | pass |

### Lean file

- Elaboration, as prescribed, from the content checkout: exit 0; seven `declaration uses 'sorry'`
  warnings at lines 104, 121, 133, 151, 166, 180, 202; nothing else. Single `import Mathlib`.
- `#check @name` for all 12 declarations on a scratch copy: exit 0; each type equals the worker's
  `signatures.md` and the README statement (finite `k`, `CharP`, smoothness, finite generation, the
  uniform `N`, `hF`, `hϖ`, `hB`, openness, boundedness, joint continuity, `hS`, `hadm`, `hfp` all
  present). No binder lost; nothing changed.
- One-tactic probe on all seven theorems (`first | simp | rfl | infer_instance` in place of each
  `sorry`): seven errors, none closes. No padding. No same-name or same-statement library hit
  (`library-matches.md` leads inspected; `grep` of both pins for the five definition names: none).
- Headlines: coherence, the three `ℚ_p` criteria, finite length and subobjects in `𝒞`, and the
  Banach approximation are stated; the GK bound, the Iwahori criterion, the lattice statements, the
  counit and the exclusion of supersingular constituents are named in the docstring with the missing
  carrier. Every backticked name of the roadmap's own in the README is declared; every Lean name
  occurs in the README.

### Library declarations opened at the pins

Mathlib: `RepresentationTheory/Continuous/Basic.lean:55` (`ContRepresentation`), `:81`
(`ContIntertwiningMap`), `:541` (`coindV`), `:548` (`f (φ g * h) = π g (f h)`), `:558` (`coind`);
`RepresentationTheory/Induced.lean:59`, `:77`; `Intertwining.lean:36`, `:138`;
`Subrepresentation.lean:54`, `:114`; `Stabilizer.lean:27`; `NumberTheory/LocalField/Basic.lean:46`;
`NumberTheory/Padics/LocalField.lean:28`; `Topology/Algebra/Module/ModuleTopology.lean:133`;
`RingTheory/KrullDimension/Polynomial.lean:120`; `RingTheory/Regular/RegularSequence.lean:147`.
Tau Ceti: `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145`, `:161`, `:252`;
`.../Module.lean:99`, `:112`, `:134`, `:143`, `:322`; `Algebra/Module/ProjectiveCover/Existence.lean:195`;
`Algebra/Module/Projective/Lift.lean:89`; `Algebra/Module/Projective/Reduction.lean:73`;
`RepresentationTheory/Homological/ContCohomology/Coinduced/Acyclic.lean:328`. All exist as cited.

### Suppliers, duplication and overlap

Resolved at the current heads: PadicLocalLanglandsForGL2Qp §§0.1, 0.3, 2.1–2.3, 2.6, 2.7, 2.9, 5.1,
5.3 (l. 206, 268, 649, 687, 717, 820, 854, 903, 1689, 1750); FiniteFlatGroupsAndIntegralPadicHodgeTheory
R07.5.15 (l. 8196; R01 on its content); SmoothRepresentationsOfLocalGroups SR.0.1–0.4, SR.0d.1, SR.2.1
(l. 589, 668, 766, 870, 1676, 1917) and all 14 cited target slugs; NoncommutativeAndEquivariantIwasawa
§§0.3, 0.5, 0.7, 0.8, F.1, 0.10, 0.11, 0.13 (l. 210–569); CompletedCohomologyPartII F.1, §5.8 (l. 184,
1400); PotentialAutomorphyInfrastructure §§3.7, 3.12 (l. 1270, 1322); CompletedCohomologyAndLocalGlobalCompatibility
§0.1 (l. 234); DeformationAndDerivedPatchingAlgebra §3.4 (l. 627); GL2AutomorphicRepresentationsAndTransfer
R17.5.11 (l. 2928); on main ClassFieldTheory Layer 7 (`geometricArtinMap`, l. 1229),
SchemeAndStackFoundations, RepresentationTheory/QuiverRepresentations. All are earlier in the merge
order (positions 26–251 against 263). The 22 identifiers by which the open roadmaps cite this one
are all rows of the README's former-identifier table.

Dependency check:

```text
depcheck: 206 roadmaps, 1907 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `scratch/overlaps.md`: no other pull request changes this roadmap, no
cited id dropped, none defined only by a revision. Object searches (`Gelfand–Kirillov`, augmented
Iwasawa algebra, extension graph, Diamond modules, the five Lean definition names) found consumers
only; no `Suggested.lean` on main or at an open head declares one of this file's names.

Declared gaps: `ext1-finite-length-into-compact-induction` (PadicLocalLanglandsForGL2Qp §2.7) and
`barthel-livne-finite-codimension` (R07.5.15) have the same slug and sentence in `design/plan.json`
and the README, one conclusion each, a named earlier supplier, and ask for nothing already provided
(§2.7 and R07.5.15 at their heads state neither).

Overlap check: read HilbertModularVarietiesAndShimuraCurvesPartII, PadicLocalLanglandsForGL2Qp, ScholzeFunctorAndModpCohomologyOfTheLubinTateTower, SmoothRepresentationsOfLocalGroups, CompletedCohomologyAndLocalGlobalCompatibility; nothing shared (the first and third import this roadmap's targets; smooth categories and induction are owned by SmoothRepresentationsOfLocalGroups, the `ℚ_p` classification by PadicLocalLanglandsForGL2Qp, `Ord_B` for `GL₂(ℚ_p)` by CompletedCohomologyAndLocalGlobalCompatibility, all cited).

Policy: no process words, pull-request numbers, dates, anchors, machine paths or LaTeX delimiters in
the README or the Lean file; `theorem` only; the manifest records all 19 cited works.

## Not verifiable

- SERRE-LRFG, Part III, Chapters 14–15: settled as uncertified; not read.
- BARTHEL-LIVNE94, Proposition 18 and the classification: settled as waived; not read. R01 rests on
  the supplier's text and on CDN23, not on this source.
- The elaboration checks types, not the truth of the seven `sorry` statements.

## Source issues

- **Error** in BHHMS23 at Lemma 6.1.1(i), printed p. 56: the source says that for `p > 3` every character other than `χ` occurs at most once in the third truncation; it should assume `p > 5`, since for `p = 5`, `f = 1` the root character has order four; affects a stated result.
- **Gap** in CDN23 at Proposition 1.30(b), printed p. 21: the source says the Steinberg clause follows from a theorem of Emerton's second paper; it should give an argument for `F ≠ ℚ_p`, that theorem being in the section on `GL₂(ℚ_p)`; affects the proof.
- **Error** in BP12 at Proposition 13.1, proof, printed p. 76: the source says the idempotent cutting out an injective envelope of a socle weight is unique; it should say such an idempotent exists, since maps between the envelopes give others; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a938c9e8bb06e74d52528925b550ec967ff6cbe0", "job": "REV-PKG-ModpRepresentationsOfGL2OverLocalFields~6", "model": "fable", "worker": "chris-x57"} -->
