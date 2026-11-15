<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13063#issuecomment-6895777959 -->
Review (claude) of 9d974d2

Verdict: needs_changes

1. **F01** (P2) Layer 9 uses the choice of `ϖ` with `Ram_ℚ(ϖ) ⊂ Spl_{F/F⁺}`, which only a declared gap provides, and does not record it

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:36` (Conventions): "`ϖ` is a Hecke character of `𝒦` extending the quadratic character of `𝒦/ℚ` and ramified only at primes of `Spl_{F/F⁺}`"; line 422 (§9.1): "the base-change transfer of §6.9 at `S′_fin ⊂ Spl_{F/F⁺}`"; line 83: "It is needed by §§11.5–11.8".

   **Claim:** Layer 9 works with `S′ = S ∪ {∞, p} ∪ Ram(ϖ)` and uses `S′_fin ⊂ Spl_{F/F⁺}`, so it needs a character `ϖ` with `Ram_ℚ(ϖ) ⊂ Spl_{F/F⁺}`. The only provider of that choice is `gap:auxiliary-character-finite-avoidance` (its instance `D = ∅`). The README says the gap is needed only by §§11.5–11.8, and neither the *Needs* lines of §§9.1, 9.3, 9.4, 9.6, 11.4 nor the Layer 9 Dependencies name it. The only other provider named is [Shin11] Lemma 7.1, and a citation is not a supplier.

   **Witness:** EndoscopicTransferAndUnitaryTraceComparison §6.3 at its head gives only "`Ram_ℚ(ϖ)` is finite" (its README lines 2120 and 2130); `Spl_{F/F⁺}` occurs nowhere in that README (0 matches). §9.1's *Needs* (line 424) lists §§1.8, 6.6–6.10, 6.15, 6.21, 6.25, 7.10, 8.1, 8.21 only.

   **Exact repair:** No statement changes; the dependency is recorded.

   1. Line 36, after "ramified only at primes of `Spl_{F/F⁺}`", add: "(such a `ϖ` exists by gap:auxiliary-character-finite-avoidance with `D = ∅`; EndoscopicTransferAndUnitaryTraceComparison §6.3 itself gives only finiteness of `Ram_ℚ(ϖ)`)".
   2. Line 83, replace the last sentence by: "It is needed with `D = ∅` by Layer 9 and by §11.4 in Case 2, where `S′_fin ⊂ Spl_{F/F⁺}` is used, and with `D ≠ ∅` by §§11.5–11.8, to eliminate `Ram(ϖ)` from the bad set of `ρ_𝔪` in Case 2."
   3. Line 22 (Scope), second gap: "the choice of the auxiliary Hecke character `ϖ` with ramification inside `Spl_{F/F⁺}` and avoiding a prescribed finite set".
   4. Line 410 (Layer 9 header), add: "The existence of `ϖ` depends on gap:auxiliary-character-finite-avoidance."
   5. Add "EndoscopicTransferAndUnitaryTraceComparison §6.3 (gap:auxiliary-character-finite-avoidance)" to the *Needs* line of §9.1 (the other targets of Layer 9 reach it through §9.1), to the Layer 9 Dependencies (line 490), and to the *Needs* line of §11.4.
   6. Line 651 (§11.6): "In Case 2 it passes through §9.6, which depends on gap:unitary-discrete-local-comparison and, with all of Layer 9, on gap:auxiliary-character-finite-avoidance."

   `design/plan.json` needs no change: the gap's `needs` sentence already contains `Ram_ℚ(ϖ) ⊂ Spl_{F/F⁺}`.

   **Repair tested:** With the gap at `D = ∅`: `S ⊂ Spl_{F/F⁺}` (Case 2 hypothesis), `p ∈ Spl_{F/F⁺}` (`p` split in `𝒦`, so every place of `F⁺` above `p` splits in `F = F⁺𝒦`), `Ram_ℚ(ϖ) ⊂ Spl_{F/F⁺}` (gap). Hence `S′_fin ⊂ Spl_{F/F⁺}`, which is what line 422 uses. With §6.3 alone, `Ram_ℚ(ϖ)` is an arbitrary finite set and the inclusion is not available.

2. **F02** (P3) "Shin's 2012 paper" is cited without a key and has no entry under References

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:500` (§10.1): "[CS17] follows Shin's 2012 paper, §6, which assumes `p` inert in `F⁺`"; lines 724–729 (References: four entries).

   **Claim:** The manifest records five works; the README's References list four. The fifth (`Shin12`, `cited_for = ["10.1"]`) is cited in §10.1 by a description only, so a reader cannot identify it.

   **Witness:** `sources.toml`, entry `id = "Shin12"` (*On the cohomology of Rapoport-Zink spaces of EL-type*, 2012). In the README the string "Shin12" does not occur; "2012" occurs once, at line 500. The assumption cited is condition (B2) at Shin12 line 981 (author p. 20).

   **Exact repair:** At line 500 write "[CS17] follows [Shin12] §6, whose standing condition (B2) (author p. 20, Shin12 line 981) takes `p` inert in `F⁺`. That assumption is not used." Add under References: "**[Shin12]** Sug Woo Shin, *On the cohomology of Rapoport–Zink spaces of EL-type*, American Journal of Mathematics 134 (2012), doi:10.1353/ajm.2012.0009. Locators refer to the author's copy." In the same pass key the two unkeyed mentions of *Counting points on Igusa varieties* (lines 80 and 508) as "[Shin09] Lemma 6.4, author p. 20, Shin09 line 879".

3. **F03** (P3) AlgebraicModularFormsAndSerreWeights R15.5 is cited by a title that is not a heading there

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:165`: "R15.5 «The lifting lemma and its sharp limits»: Deligne–Serre eigenvalue lifting"; also lines 629 and 631.

   **Claim:** Every other «…» citation in the README names a heading of the supplier (the AG2 targets, SR.5.2 «Modular generic segments», AL.3 «Strong multiplicity one»). This one names no target.

   **Witness:** At the head of AlgebraicModularFormsAndSerreWeights, R15.5 is "## Layer 5: Deligne–Serre eigenvalue lifting" (README line 1214, identifier map at line 17). The words "the lifting lemma and its sharp limits" occur once, in prose describing §§5.10–5.13 (line 1216). The target used is "### 5.10 Deligne–Serre eigenvalue lifting" (line 1308).

   **Exact repair:** At lines 165, 629 and 631 write "AlgebraicModularFormsAndSerreWeights R15.5, §5.10 «Deligne–Serre eigenvalue lifting»". The statement consumed is unchanged: a commuting family on a finite free module over a DVR, a nonzero residual eigenvector, and lifted eigenvalues with the prescribed residues, which is what §11.4(4) applies to the lattice `H^{d_b}_c(I^b_{Mant,m}, ℤ_ℓ)_{𝔪^∨}`.

4. **F04** (P3) §8.9 has no source locator

   **Location:** `packages/IgusaVarietiesAndTorsionConcentrationPartII/README.md:366` (§8.9): "This is the setting in which SV3 may fail, and nothing below uses it. Prove the following."

   **Claim:** §8.9 is the only one of the 29 targets whose statement carries no locator. Two of its assertions do have sources, and the rest are the roadmap's own deductions; the text says neither.

   **Witness:** Lines 364–373 contain no `[CS17]` or `[Shin…]` citation. The one-point Kottwitz set for central `μ_i` (item 3) is CS17 lines 4030–4032 (proof of Theorem 5.5.7, p. 748). The PEL datum that asks for positivity and not for SV3 is Shin09 lines 570–575 (Definition 5.2, author p. 13), already cited in §11.4.

   **Exact repair:** After "Prove the following" add: "(for the one-point set `B(G_i, μ_i⁻¹)` when `μ_i` is central, [CS17] proof of Theorem 5.5.7, p. 748, CS17 lines 4030–4032; for the PEL datum without SV3, [Shin09] Definition 5.2, author p. 13, Shin09 lines 570–575; the finiteness, cohomology and Igusa-pullback statements are deduced here from the supplier sections of the *Needs* line and are not stated in [CS17])". Add "8.9" to `cited_for` of the `CS17` and `Shin09` entries of `sources.toml`.

Four findings: one P2 and three P3. The one finding of round 5 is repaired. The mathematics of the 29 targets, the Lean file, the source sample and the supplier direction pass. The P2 is a dependency on a declared gap that Layer 9 uses but does not record. The three P3 are a citation without a reference entry, a supplier target cited by a title that is not its heading, and a target without a source locator. None is a re-raised finding: no repair report marked anything "not actionable in this package".

## Verified sound

### Previous finding and its repair

| Round-5 finding | Status; repaired passage | Verification |
|---|---|---|
| F01 (P2), reciprocal roots need `q` invertible | **Repaired.** README line 286: "Let `v` lie above `q ∈ Spl_{𝒦/ℚ} ∖ (S ∪ {ℓ})`, and suppose `q ∉ 𝔪`, so that `q_v` is a unit modulo `𝔪`." Line 297 (API) carries the same hypothesis; line 307 is the negative control. | Recomputed below (rows 8.5). The involution, maximality of `𝔪^∨` and the residue isomorphism `ῑ` stay unrestricted; only the root rule has the hypothesis. |

The repair changed §8.5 only (statement, proof paragraph, two API bullets, three Checks). I ran the adversarial pass on each changed passage and looked for the same pattern elsewhere: §8.4 (constant term stated in `𝕋^S[X]`, correct), §8.7 API (representations in characteristic `ℓ`), the Layer 8 Examples and Worked examples (`q = 7`, `ℓ = 11`), §§11.4–11.6 (ideals in the support of `𝔽_ℓ`-cohomology, hence containing `ℓ`). No further instance.

### Principles

- General library: both cases, every rank and signature, wholly definite data included (§8.9), no restriction to good cohomological primes; `ℓ ∈ S` and `ℓ = 2` are not excluded anywhere I could find.
- Part II of an existing roadmap: the introduction says where the parent stops (README line 5), and the four kept variants are explained in one clause each (line 11).
- Single direction of supply: depcheck below.
- No copied passage, no algorithm, no sorry'd data, no `set_option`, no process residue (searched for pull-request numbers, round labels, dates, machine paths, HTML anchors, LaTeX delimiters, `lemma` as a keyword: none).

### Source sample (15 seeded targets; all texts readable)

| Target | Locator read | Result |
|---|---|---|
| 8.2 | CS17 lines 3288–3297 (§5.1, pp. 730–731); CS17 line 3236 (Theorem 4.4.4, p. 729); CS17 lines 4363–4379 (pp. 756–757) | Good integral models at `p` unramified in `F` and compactness as stated. Properness and Hecke extension are proved here from PELModuli and ShimuraCompactifications; the source asserts them. |
| 8.3 | CS17 lines 3678–3713 (§5.4, pp. 740–741); CS17 lines 3978–4036 with footnote 30 (pp. 747–748) | Decomposition of `G_{ℚ_p}`, `b`, `J_b`, `π_p`; sets `S_i`; singleton for central `μ_i`. The source identifies the two Kottwitz sets with no central translation (line 4034); the README's `p^{c_i}` is its own correction, computed below. |
| 8.5 | CS17 lines 4465–4478 (proof of Theorem 6.3.1, p. 759) | The source uses the dual eigensystem only for `𝔽_ℓ`-cohomology; the README's rule now has the matching hypothesis. |
| 8.7 | CS17 line 149 (Definition 1.9, p. 652); line 4326 (Definition 6.2.1, p. 755); lines 4409–4413 (Theorem 6.3.1(2), p. 757) | Both excluded ratios `{1, q}`, arithmetic Frobenius, `ℓ ≠ p`; "at most one `τ ∈ S_i`" and genericity only at those `𝔭_i`. |
| 8.9 | no locator in the text (R04); Shin09 lines 570–575; CS17 lines 4030–4032 | Statement is the roadmap's own; the two sourced parts agree with the texts. |
| 9.1 | CS17 lines 3419–3422, 3485–3498 (Theorem 5.2.3, Corollary 5.2.5, Remark 5.2.6, pp. 734–735); lines 3551–3562, 3588–3594 (Proposition 5.3.1, Theorem 5.3.2, pp. 737–738) | Formula, `|ker¹|`, `τ(G)`, `ε_n⃗ = 1/2` for `(n/2, n/2)`, acceptable `φ_p`, `[F⁺:ℚ] ≥ 2`. |
| 9.2 | CS17 lines 3638–3656 (definition of `Red`, p. 739); lines 3714–3734 (Lemma 5.4.3, p. 741) | Hypotheses and conclusion agree; the README's note on the printed `Red(π_p)` (line 3722) is correct. |
| 9.3 | CS17 lines 3740–3803 (Lemma 5.5.1, pp. 741–743); lines 3804–3833 (Corollary 5.5.2, Remark 5.5.3, p. 743) | Three-trace terms, `θ`-stable isobaric `n-Ind(Π_M)_ξ`, arbitrary `φ_p` by the Frobenius twist, both directions of the corollary. The README states (2) for the total coefficient, which is what linear independence gives. |
| 9.6 | CS17 lines 3978–4036 (Theorem 5.5.7, pp. 747–748); lines 3950–3966 (Remark 5.5.6, p. 746) | Hypotheses (i), (ii), conclusion; local–global step is the declared gap. |
| 10.1 | CS17 lines 4059–4072 (Proposition 5.6.1, p. 749); Shin12 line 981 | Formula as stated; the source's proof is a citation, the README's local-index argument is its own (computed below). |
| 10.2 | CS17 lines 4073–4078 (p. 749); Shin09 line 879 (Lemma 6.4) | Identity with nonzero constants `ε_G`, `d(G_ℝ)`; the lemma is in Shin09, as the README says. |
| 10.3 | CS17 lines 4082–4090 (Corollary 5.6.2, p. 749) | Formula and index set agree; the explicit `c(π_f)` is the README's, consistent with §10.2 (computed below). |
| 10.6 | CS17 lines 4102–4111 (Corollary 5.6.3, p. 750) | Hypotheses and conclusion agree. |
| 11.3 | CS17 line 3236 (Theorem 4.4.4); lines 4442–4448 and 4491–4497 (proof, pp. 758–760) | Stalks, vanishing and the degree bound through Leray. |
| 11.7 | CS17 lines 84–115 (Theorem 1.1, footnote 2, Remarks 1.2–1.5, p. 651); lines 4422–4434 (Remarks 6.3.2–6.3.3, p. 758) | Both forms of the hypothesis; the passage to auxiliary pairs. |

Further locators opened: CS17 lines 101, 131 (Remarks 1.3, 1.7.1), 124–130 (Remark 1.7), 3258–3287 (§5.1), 4244–4248 (Corollary 6.1.4), 4339–4360 (Lemma 6.2.2), 4380–4408 (Hecke algebra, Theorem 6.3.1(1)), 4435–4441 (Hochschild–Serre step); Shin11 lines 3470–3474 (Lemma 7.1, p. 1722); Shin-BCU lines 13–20 and 41–54 (setting, Theorem 1.1). No locator was flagged unverified by the author. No source had to be fetched; the manifest was not edited.

### Adversarial pass (values computed this round)

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 8.2 smooth proper model | anisotropic `G^ad`; `n = 1` torus; `n = 3`, signature `(1,2)` at every `τ`; `d = 0` | proper `ℚ`-parabolics: 0, 0, ≥ 1 (isotropic vector exists, excluded by §8.1); relative dimension `d = 0` gives a finite étale scheme | holds; none |
| 8.3(5) central translation | `n = 2`, `S_i = {(1,1), (2,0)}`; `n = 3`, `S_i = {(1,2), (3,0)}`; `S_i = {(1,2), (0,3)}` | `κ` after Shapiro `−(p_τ + n·c_i)`: `−3`, `−4`, `−1`; after `p^{c_i}`: `−3 + 2 = −1`, `−4 + 3 = −1`, `−1 + 0 = −1`; target `−p_τ = −1` in all three | holds; none |
| 8.3 Newton average | `((0,−1), (−1,−1))` and its average, `2ρ = (1,−1)` | `1 + 0 = 1`; `1/2 + 1/2 = 1`; `p_τq_τ + p_{τ′}q_{τ′} = 1 + 0 = 1` | holds; none |
| 8.4 Satake image of `P_v` | general `i`; `n = 2`, trivial representation, `q = 7` | exponent `i(i−1)/2 + i(n−i)/2 = i(n−1)/2`; `X² − 8X + 7 = (X−7)(X−1)` | holds; none |
| 8.5(1)–(2), repaired rule | `n = 2`, `q = 7`, `ℓ = 11`, roots `{1,2}`; `n = 3`, same `q, ℓ`, roots `{1,2,3}` | `n = 2`: `T = (3, 5)`, dual `(5, 9)`, `X² − 5X + 8`, roots `{7, 9} = 7·{1, 2⁻¹}`. `n = 3`: `T = (6, 0, 3)`, `ι(T) = (0, 2, 4)`, dual polynomial `X³ + 3X + 3`; predicted roots `49·{1, 6, 4} = {5, 8, 9}`: `e₁ = 22 ≡ 0`, `e₂ = 157 ≡ 3`, `e₃ = 360 ≡ 8`, constant `−8 ≡ 3` | holds; none |
| 8.5 exponent identity | `(n, i) = (3, 2), (4, 2), (4, 4)` | `1 + 3 − 0 = 4 = 2·2`; `1 + 6 − 1 = 6 = 2·3`; `6 + 6 − 0 = 12 = 4·3` | holds; none |
| 8.5 hypothesis `q ∉ 𝔪` | degree character, `n = 2`, `q = 5`, modulo 5, 3 and 2 | mod 5: `X² − X`, roots `{0, 1}`, rule undefined (excluded, `5 ∈ 𝔪_5`); mod 3: `X² + 2`, `{1, 2} ↦ {2, 1}`; mod 2: `X² + 1`, `{1, 1} ↦ {1, 1}` | holds exactly when `q ∉ 𝔪`; none |
| 8.5 transport `ῑ` | `n = 1`, `χ : 𝕋^S → 𝔽_9`, `χ(T_{1,v}) = a`, `a² = −1` | `χ ∘ ι = χ³`, so `𝔪^∨ = 𝔪` and `ῑ` is Frobenius; root through `ῑ⁻¹`: `a⁻¹ = a³ = −a` (`a·(−a) = 1`); through the identity: `a ≠ −a` | Check is correct and discriminating; none |
| 8.5(3) twist | `ε̄(Frob_v) = q_v⁻¹`, `n = 2`, `q = 7` | `ε̄^{1−n} = 7`; roots of `ρ^∨ ⊗ ε̄^{−1}`: `7λ⁻¹`; arithmetic convention would give `7⁻¹λ⁻¹ = {8, 4} ≠ {7, 9}` | holds; none |
| 8.7 `IsStrongGenericAt` | `n = 0`; `n = 1`; `{3,3}`, `{1,2}`, `{1,7}` at `q = 7`, `ℓ = 11`; `q = 23 ≡ 1` mod 11 | `n = 0`: charpoly 1, no pairs, true; `n = 1`: no pairs; ratios `1` (false), `{2, 6}` (true), `{7, 8}` (false); excluded set `{1, 23} = {1}` in `𝔽_11` | definition determines the predicate; none |
| 8.8(a) Lean headline | `F = L = ℚ(i)`, `k = 𝔽_3`, `n = 1`, `p₀ = 13`; `n = 2`, `r` trivial | Rank one: class of 13 in `Gal(ℚ(i, ζ_3)/ℚ) ≅ (ℤ/2)²` is trivial, density `1/4 > 0`. `n = 2` trivial: eigenvalues `{1, 1}`, ratio `1`, predicate false at every prime, set empty, so the hypothesis `h` cannot be dropped | true; not vacuous; none |
| 8.8(a), `p₀` ramified in `L` | `r` with kernel, `L ≠ L_r` | inertia of `Q` maps onto inertia in `Gal(L_r/F)`, trivial when `v` is unramified in `L_r`; so `r(I_Q) = 1` although `v` ramifies in `L` | route through `L_r` is right; none |
| 8.8(b) Lean headline | `v₀ = (7) ⊂ ℤ[i]`, norm 49, `ℓ = 3` | `49 ≡ 1` mod 3: trivial class in `Gal(ℚ(i, ζ_3)/ℚ(i))`, density `1/2`; degree-two primes have density 0; prime norms `p ≡ 1` mod 12 | true; none |
| 8.9 finite moduli | `N` points; 4-cycle, `ℓ = 5` | `H⁰ = Λ^N`, `H^{i>0} = 0`; on the `−i`-line `T + 2` acts by `2 − i`, divisible by 5 (`i ≡ 2`) and nonzero, so ordinary localization keeps `ℚ_5` | holds; none |
| 9.1 constants | `n⃗ = (n)`, `(n₁, n₂)` with `n₁ ≠ n₂`, `(n/2, n/2)` | `ι(G, G_n⃗)·τ(G_n⃗) = τ(G)·|Out|⁻¹ = τ(G)·{1, 1, 1/2}`; `φ_p = 0`: both sides 0 | holds; none |
| 9.2 Newton reduction | `GL_2`, `J_b = D^×`: `Ind`, `St`, `1` | Langlands–Jacquet images `0`, `1_D`, `−1_D`; modulus twist times 0 is 0 | "generic principal series" cannot be weakened to "unramified"; none |
| 9.3(2) | two terms, coefficients `1` and `−1`, same eigensystem | total `0`, each term nonzero | hypothesis on the total is needed and stated; none |
| 9.6 | characters with ratio `ε`; ratio unramified of value `≠ q^{±1}` | first: linked, excluded by (ii); second: unlinked, irreducible generic, `Red = 0` on a non-quasi-split factor | holds, conditional on the two gaps (R01); R01 |
| 10.1 local index | `n = 6`, indices `2, 3`, `n₁ ∈ {5, 4, 3}`; `(d, e) = (2,1), (2,2), (4,2), (2,3)` | `2 ∤ 5`, `3 ∤ 4`, `2 ∤ 3`; index `d/gcd(d,e) = 2, 1, 2, 2`; `m·e` multiple of `lcm(d, e) = 2, 2, 4, 6`; central `γ`: `(X − γ)⁶`, factor degree 1, isotypic degree 6 | holds; isotypic degrees, not factor degrees; none |
| 10.1 non-split places | `v = v^c` | corestriction preserves invariants, so `inv_v(B) = 0`, `d_v = 1`; a place with `d_v ∤ n₁` is split over `F⁺` and the factor is `GL_{n/d_v}(D_v)` | holds; none |
| 10.2–10.3 coefficient | general; `n = 1`; Harris–Taylor `n = 2` | `(−1)^{q}·(−1)^{q}(ε_G d)⁻¹ Σ m·ep = (ε_G d)⁻¹ Σ m·ep`, the coefficient §10.2 gives; `n = 1`: `ep = 1`, `q(G) = 0`; full pair: `1 − 1 = 0`; `dim G(ℝ)/K_∞ = 3`, `q(G) = 1 = d` | holds; none |
| 10.6 | `n = 1`; definite `G_ℝ` | `B(G, μ⁻¹)` has 1 element, 0 non-ordinary classes | empty case consistent; none |
| 11.2(a) | `K_p = ℤ_7^×`, `ℓ = 3` | `dim H¹_cts = 1`, so only "some `j ≤ i`" follows | holds; none |
| 11.3 | all stalks 0; stalks in degrees `≥ d` | `E₂ = 0`; `a ≥ 0`, `b ≥ d` gives `a + b ≥ d` | holds; none |
| 11.5 | fixed `q ∉ S ∪ {ℓ}` | `p ≠ q`, `Ram(ϖ) ∩ {q} = ∅` (gap with `D = {q}`): `q` is not in the bad set | holds, conditional on the gaps; none |
| 11.6 step 4 | `d_b = d` for the minimal `b` | any `b′` in the support has `d ≤ d_{b′} ≤ d`, so is `μ`-ordinary; `d = 2`: degrees `0, 1` vanish, dual degrees `4, 3` vanish | holds; none |
| 11.7 worked example | `F⁺` real quadratic, `p` split in `𝒦` | `p` split in `F⁺`: `(e, f, g) = (1, 1, 4)`; inert: `(1, 2, 2)`, not completely split | holds; none |
| 11.8(1) | `O^r[−d]`; `(O →ℓ O)` in degrees `d−1, d` | reductions: degree `d` only; degrees `d − 1` and `d` (excluded by the hypothesis) | holds; none |

Context and generality: the Lean definitions take `[Field k] [Finite k]`, so the zero ring and characteristic 0 cannot occur; `Fin n` covers `n = 0`; `Nat.card (𝓞 F ⧸ v)` is finite for maximal `v`. The README statement of §§8.7–8.8 has the same generality as the Lean signatures.

### Lean file

- `lake env lean` on `packages/IgusaVarietiesAndTorsionConcentrationPartII/Suggested.lean`, from the content checkout: exit 0; the only output is `declaration uses 'sorry'` at lines 79 and 91. One `import Mathlib`, no `TauCeti.*` import, no `set_option`, no sorry'd data, 99 lines.
- `#check @name` on all four declarations in one scratch copy: every type keeps `[NumberField F] [NumberField L] [Algebra F L] [IsGalois F L] [Field k] [Finite k] {n : ℕ}` and `r`; the two theorems keep their existential hypotheses. They agree with README §§8.7–8.8. Nothing changed.
- One-tactic probe on both sorried theorems (not a sample), eight tactics each: `simp`, `rfl`, `infer_instance`, `exact Set.infinite_univ`, `simpa using h`, `exact Set.infinite_of_not_bddAbove (by simp)`, `aesop`, and `simp_all` unfolding both definitions. All 16 fail. No padding.
- Headline theorems of the README: Galois representations for torsion eigensystems (§11.5), middle-degree concentration (§11.6), the main theorem (§11.7), integral and coefficient forms (§11.8), the two `μ`-ordinarity theorems (§§9.6, 10.6) with their trace identities, and the auxiliary-prime existence theorems (§8.8). Only §8.8 is statable at the pins and both parts are stated. The module docstring names each of the others with the missing carriers (PEL Shimura varieties and their cohomology, Igusa varieties, `B(G, μ⁻¹)`, Grothendieck groups, the PEL datum for the auxiliary-pair condition). No stand-in.
- Backticked names of the roadmap's own in the README: `IsStrongGenericAt`, `IsCompletelySplitStrongGenericPrime`, `infinite_setOf_isCompletelySplitStrongGenericPrime`, `infinite_setOf_isStrongGenericAt_degree_one`. All four are declared.

Pinned declarations opened:

| File and line at the pin | Declaration |
|---|---|
| `Mathlib/NumberTheory/NumberField/CMField.lean:70` | `NumberField.IsCMField` |
| `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:126` | `NumberField.maximalRealSubfield` |
| `Mathlib/NumberTheory/HeckeRing/Defs.lean:183`, `:189` | `HeckeCosetModule`, `HeckeRing` |
| `Mathlib/RingTheory/Frobenius.lean:41` | `IsArithFrobAt` (group-action form over `AlgHom.IsArithFrobAt`) |
| `Mathlib/RingTheory/Ideal/Defs.lean:154` | `Ideal.inertia`, an abbreviation of `I.toAddSubgroup.inertia G`, the form the Lean file writes |
| `Mathlib/RingTheory/Ideal/Over.lean:128`, `:379` | `Ideal.LiesOver`, `Ideal.primesOver` |
| `Mathlib/LinearAlgebra/FreeModule/Basic.lean:44` | `Module.Free` |
| `TauCeti/NumberTheory/HeckeRing/Associativity.lean:484` | `HeckeCosetModule.instRingHeckeRing` |
| `TauCeti/NumberTheory/HeckeRing/Commutativity.lean:51–52` | `HeckeAntiInvolution.ofAmbient`, `HeckeAntiInvolution.onHeckeCoset` |
| `TauCeti/NumberTheory/Chebotarev/Density/Chebotarev.lean:74` | `NumberField.Chebotarev.infinite_frobeniusPrimeSet`: infinitude of one Frobenius class, not either headline |

Neither pinned library contains "DecomposedGeneric" or "StrongGeneric" (searched by object). The library near-match leads were opened; none states either theorem.

### Duplication and ownership

- AutomorphicGaloisRepresentationsPartII `Suggested.lean` declares `FiniteModelDecomposedGenericPrime` and `infinitelyManyDecomposedGenericPrimes` (lines 73–95 at its head). That predicate excludes only the ratio `p`; this roadmap's excludes `1` as well, and the README says so (line 11). I checked the implication claimed there: strong at every `v | p` gives `p ≠ ringChar k`, trivial inertia and ratio `≠ p` at every `Q | p`. Different statements, different fully qualified names.
- The parent's §§0.4, 5.1, 5.2, 5.4, 7.6 are for the rank-`2n` datum; §§8.4, 8.5, 8.6(2), 11.4, 11.8 here are for rank `n` and say so. Parent §5.1 at its head has `ι(T_{i,v}) = T_{2n,v}⁻¹T_{2n−i,v}` and factor `q_v^{2n−1}`, consistent with §8.5 at rank `n`.
- No roadmap on main is named IgusaVarietiesAndTorsionConcentrationPartII (no second copy). `scratch/overlaps.md` lists no competing change, no dropped id and no revision-only id; I found none either.
- The board's package index (AnalyticNumberTheory, LawrenceVenkateshMethod) holds no package on these objects.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicGaloisRepresentationsPartII, TorsionCohomologyInfrastructure, EndoscopicTransferAndUnitaryTraceComparison, PotentialAutomorphyInfrastructurePartII; the local strong genericity predicate is owned by AutomorphicGaloisRepresentationsPartII AG2.7 and cited; the rank-`2n` Hecke algebra, dual ideal and Igusa duality are owned by the parent and the rank-`n` forms here are stated as variants; nothing else shared.

### Supplier resolution and direction

Every cited section was resolved at the supplier's current head (main for SchemeAndStackFoundations, the open head otherwise): 21 parent sections, 24 of EndoscopicTransferAndUnitaryTraceComparison, 6 of BunGAndNewtonStrata, 20 of PELModuli, 4 of ShimuraCompactifications, 2 of PerfectoidShimuraVarieties, 5 of SmoothRepresentationsOfLocalGroups, 3 of ArithmeticGaloisRepresentations, 4 of AutomorphicSpectralTheory, 4 of ArithmeticLocallySymmetricSpaces, 4 of IntegralHeckeAndGaloisDeterminants, 3 of ClassicalAdicEtaleCohomology, 2 each of ComplexComparisonPartII, DiamondEtaleCohomology and SchemeAndStackFoundations, 1 each of EtaleDualityAndPerverseSheaves, ArithmeticGaloisDuality, AutomorphicLFunctionsAndLocalFactors (AL.3.7) and AlgebraicModularFormsAndSerreWeights, and the ten named AG2 targets. All exist. The one title that is not a heading is R03. Content read in full where the README relies on a specific hypothesis: parent §§3.17, 4.5, 5.1, 5.5; Endoscopic §§6.3, 6.9, 6.25, 8.21, 10.32; BunG §§1.30, 1.32; ClassicalAdic §1.3 (profinite torsor, continuous `E_2` under its condition (★), which holds for pulled-back étale sheaves) and §8.2 (Huber 3.7.2); AG2.2 normalization, AG2.7 «Dual and character-twist Hecke comparison», «Unitary discrete-parameter export»; SR.5.2 «Modular generic segments» (characteristic zero included); AlgebraicModularFormsAndSerreWeights §5.10.

The three gap slugs agree between the README and `design/plan.json` (`division-algebra-unitary-base-change` → AG2.2; `auxiliary-character-finite-avoidance` → Endoscopic §6.3; `unitary-discrete-local-comparison` → AG2.7). Each is precise and asks for nothing already supplied: AG2.7's export is kept for a supercuspidal summand only; §6.3 gives finiteness only; Shin-BCU Theorem 1.1 is for a hermitian `F`-space. They are contracts, not findings. R01 is about where one of them is used, not about the gap.

Dependency check, complete output:

```text
depcheck: 245 roadmaps, 2248 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. `roadmaps resolve` reports no unresolved citation and no unknown Lean name; it did not check names outside TauCetiRoadmap, which I checked at the pins (table above).

### Shape

Four layers (8–11), 29 targets; each layer ends with Examples and Dependencies. Definitions with API and Checks: §8.1 (9 Checks), §8.3 (5), §8.4 (4), §8.5 (7), §8.7 (6), §9.4 (4), §10.3 (3), §10.5 (4); §8.9 has 6. Every theorem has its hypotheses in the sentence and a locator, except §8.9 (R04). No target-numbering tables, no field lists, no LaTeX.

Arrangement: the README's source locators are 70 to CS17, 4 to Shin-BCU, 2 each to Shin09 and Shin11. Set beside CS17's contents: Layer 8 draws on CS17 §§1, 5.1, 5.4, 5.5, 6.2, 6.3 and has no single counterpart; §§8.9, 11.1, 11.8 have none; Layer 9 spans §§5.2–5.5; Layer 10 is §5.6; Layer 11 is §6.3 with §1. The order 9, 10, 11 is forced: Layer 10's Dependencies name §§9.2 and 9.5, and Layer 11's name Layers 8–10. The split by case (endoscopy present or absent) is the mathematics. No one-to-one run of sections.

Source independence: 24 passages compared with 5 sources, none shared beyond hypothesis lists the mathematics forces (longest common run 6 words, "is a non-quasi-split inner form of", at CS17 line 3720); largest share CS17, 70 of 78 locators; contents compared with CS17: independent.

## Not verifiable

- None of the cited texts was unreadable. For supplier sections not listed as "read in full" above I resolved the heading and the one-line description, not every hypothesis; the previous round's table records those hypotheses, and I relied on it only where its rows carry values.

## Source issues

- **Misprint** in CS17 at Lemma 5.4.3, printed p. 741: the source says the reduction of an unlabelled local representation vanishes; it should name the labelled endoscopic representation of the hypothesis; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7 and Corollary 5.6.3, printed pp. 747 and 750: the source says a complex embedding is composed with the p-adic-to-complex isomorphism; it should use the inverse isomorphism; affects a stated result.
- **Misprint** in CS17 at Theorem 5.5.7, printed p. 747: the source says base change at p in the vanishing statement; it should be base change outside the finite set, as in its proof; affects a stated result.
- **Misprint** in CS17 at Theorem 6.3.1(1), printed p. 757: the source says the similitude factor at q is the p-adic units and numbers; it should be the q-adic ones; affects a stated result.
- **Misprint** in CS17 at §5.6, printed p. 749: the source says the acceptable-function extension is Lemma 6.4 of Shin's 2011 Annals paper; it should be Lemma 6.4 of Shin's Igusa point-counting paper; affects nothing.
- **Misprint** in CS17 at §5.2, printed p. 735: the source says the auxiliary character comes from Proposition 7.1 of Shin's 2011 paper; it should be Lemma 7.1 there; affects nothing.
- **Misprint** in CS17 at proof of Theorem 6.3.1, printed p. 759: the source says Theorem 5.5.5 gives the Galois representation; it should be Corollary 5.5.5; affects nothing.
- **Gap** in CS17 at §5.1, printed p. 730: the source says every such positive PEL datum is a Shimura datum in its own sense; it should exclude wholly definite data of rank at least two; affects the proof.
- **Gap** in CS17 at proof of Theorem 5.5.7, printed p. 748: the source says the restriction-of-scalars Kottwitz set equals that of the one noncentral embedding; it should include the central translation from the other embeddings; affects the proof.
- **Gap** in CS17 at proof of Theorem 6.3.1, printed p. 758: the source says nonvanishing at finite level in the least degree gives nonvanishing at infinite level in that degree; it should say in some degree no larger; affects the proof.
- **Gap** in CS17 at §5.6, printed p. 749: the source says the appendix base-change theorem gives Galois representations for the division-algebra group; it should justify the passage from hermitian spaces to division algebras; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9d974d24cecde6490ddeda7ba8249661d3f257da", "job": "REV-PKG-IgusaVarietiesAndTorsionConcentrationPartII~6", "model": "fable", "worker": "chris-x80"} -->
