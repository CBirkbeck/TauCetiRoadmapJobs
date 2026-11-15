<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6895842607 -->
Review (claude) of c1c9366

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §11.1 drops a property of `F_2` that §11.9 uses

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:3834–3836`: "over `F_2`,
     the places above `v_0` with `q ≡ 1` modulo `p^N` for an `N` with `p^N > n` and trivial residual
     representation there".
   - **Claim:** this list is the auxiliary data of nt26 Lemma 3.4, and §11.9 (README:4145–4146) then
     argues "because the base change of `π` to `F_2` is unramified above `v_0`".
   - **Witness:** nt26 line 752 (Lemma 3.4(3), p. 16) also requires the base change of `π` to `F_2` to be
     unramified above `v_0`. An unramified local extension of suitable even degree gives `q ≡ 1 mod p^N`
     and trivial `r̄`, but inertia still acts through a character of order `p ≠ 1`.
   - **Repair:** in §11.1 insert, after "over `F_2`,": "the base change of `π` unramified at every place
     above `v_0`,"; add the same clause to the API bullet on `F_1`, `F_2`. On the witness the added
     clause fails (inertial order `p`), so the instance is excluded and §11.9's step is supported.

2. **F02** (P2) two supplier citations name sections that do not exist at the supplier's head

   - **Location:** README:4844–4845 (§13.7 *Needs*): `Layer 1 ("Ordinary and Fontaine–Laffaille
     representations are potentially diagonalizable")`; README:4879–4880 (§13.8 *Needs*): `"The ANT
     finiteness theorem with weak primitivity"`.
   - **Claim:** both are sections of PotentialAutomorphyInfrastructurePartII.
   - **Witness:** at its open head, `TauCetiRoadmap/PotentialAutomorphyInfrastructurePartII/README.md`
     Layer 1 has §§1.1–1.5 and Layer 8 has §§8.1–8.16; neither title occurs. Its line 60 says
     ModularityAndLanglandsExtensions §2.1 owns the ordinary and Fontaine–Laffaille criteria.
     `roadmaps grep --fixed` finds both titles nowhere.
   - **Repair:** §13.7: replace the Layer 1 item by "ModularityAndLanglandsExtensions §2.1 (potential
     diagonalizability of ordinary and Fontaine–Laffaille representations)". §13.8: replace the title by
     "Finiteness of ordinary locally Steinberg deformation rings" (§8.7, the Allen–Newton–Thorne
     finiteness theorem). Both replacement targets were opened at the heads and exist.

3. **F03** (P3) page locators of nt26 §3 are one page late

   - **Location:** README:3809 "Newton–Thorne 2026 §3 (nt26 pp. 13–25)"; README:3837–3838 "(nt26 §3,
     standing hypotheses, pp. 13–14; …)".
   - **Witness:** nt26 line 554 (§3 heading) and lines 559–570 (hypotheses (1)–(5)) precede the marker
     of page 13 at line 571; page 12 begins at line 517. Only the normalisation of the image
     (lines 573–575) is on p. 13.
   - **Repair:** "nt26 pp. 12–25" and "standing hypotheses, pp. 12–13".

4. **F04** (P3) "its consequence for `Δ`" is not at the locator

   - **Location:** README:5049–5050 "(`symPowerEulerProduct_levelOne_entire`; nt21 Theorem A and its
     consequence for `Δ`, p. 2)"; `Suggested.lean:89–90`, the same words.
   - **Witness:** nt21 p. 2 (lines 43–89) has Theorem A, Theorem B and Corollary C (semistable elliptic
     curves, lines 71–73); neither `Δ` nor an `L`-function of a level-one form is mentioned on pp. 1–3.
   - **Repair:** in both files write "(nt21 Theorem A, p. 2; the entire continuation follows by
     Godement–Jacquet, as nt21 Corollary C, p. 2, records for semistable elliptic curves)".

5. **F05** (P3) extraction line numbers used as locators in the roadmap text

   - **Location:** README:1418 "(nt21 lines 408–410, p. 9)"; README:1710 "(ct17 lines 167–170, p. 4;";
     README:1718 "(ct17 lines 264–268, p. 6)"; README:1908 "(ct17 lines 269–274, p. 6)".
   - **Claim/witness:** these are line numbers of a private text extraction; no reader of the roadmap
     has them. The pages are right (nt21 page 9 is lines 386–432; ct17 page 4 is 139–190, page 6 is
     242–294).
   - **Repair:** "(nt21 §1, standard assumptions, p. 9)"; "(ct17 §2.1, p. 4;"; "(ct17 §2.1, p. 6)" twice.

6. **F06** (P3) a cited Mathlib name is a deprecated alias at the pin

   - **Location:** README:162, 1199, 1211, 1389: `padicValNat.pow_two_sub_one`.
   - **Witness:** `Mathlib/NumberTheory/Multiplicity.lean:401` at the pin:
     `@[deprecated (since := "2026-10-28")] alias padicValNat.pow_two_sub_one := Nat.multiplicity_pow_two_sub_one`;
     `#check` prints the deprecation warning. The theorem is at line 359 and is stated with `multiplicity 2`.
   - **Repair:** cite `Nat.multiplicity_pow_two_sub_one` in the four places; the statement in the
     contract (`v₂(x^n − 1) + 1 = v₂(x + 1) + v₂(x − 1) + v₂(n)`, odd `x > 1`, even `n ≠ 0`) is unchanged.

7. **F07** (P3) §12.6: an unsupported constraint on `q` for odd `p`

   - **Location:** README:4485–4486: "For odd `p`, `q ≥ 0` with `2q ≥ |S ∪ S_∞|`."
   - **Witness:** nt26 line 1586 (Proposition 4.8, p. 34) asks only for an integer `q ≥ 0`; the
     inequality has no locator and no use, and §12.6 does not say what `q` is for odd `p`. (With `q` as in
     §9.5 it holds: `q ≥ [F : ℚ] + 3|S|`.)
   - **Repair:** replace the sentence by "For odd `p`, `q ≥ 0` is the common size of the Taylor–Wiles
     sets, as in §9.5 (nt26 Proposition 4.8)."

8. **F08** (P3) undefined symbols `y` and `ω` in §§11.1, 11.3

   - **Location:** README:3836–3837 "characters `X`, `Y` of `K_1` of type `A_0` with `X X^c = ε`,
     `Y Y^c = ω`, `X̄ = Ȳ`"; README:3920 "`⊗ y^{1−r}`"; README:3932–3933 "`y y^c = ω`".
   - **Witness:** `y` is never defined; `ω` is the character written `ω_p` in §11.2 (README:3873). nt26
     line 760 defines `x = r_ι(X)`, `y = r_ι(Y)`. Recomputing §11.3: `s^c ≅ s^∨ ⊗ ε^{1−2r} ω_p^{r−1} (y y^c)^{1−r}`,
     so `y y^c = ω_p` is what is needed.
   - **Repair:** in §11.1 write "characters `X`, `Y` of `K_1` of type `A_0` whose `p`-adic characters
     `x = r_{X,ι}`, `y = r_{Y,ι}` satisfy `x x^c = ε`, `y y^c = ω_p`, `x̄ = ȳ` and have Hodge–Tate weight `0`
     at `u_0`"; in §11.3 write `ω_p` for `ω`.

9. **F09** (P3) headings that name a source's section instead of the mathematics

   - **Location:** README:3807 "## Layer 11: the untwisted tensor product of Newton–Thorne 2026";
     README:2079 "### 5.1 The data of Newton–Thorne I §4 for level raising to types"; README:2290,
     3216, 3817, 4606 (§§5.7, 9.1, 11.1, 13.2), each ending in "of <source> §k".
   - **Claim/witness:** the principle asks that layers be named by their mathematics and that sources
     appear as locators at the claims. nt26 §3 is titled "Automorphy of an untwisted tensor product"
     (nt26 line 554); the five subsection headings carry a source section number.
   - **Repair:** "Layer 11: the untwisted tensor product `r_π ⊗ Sym^{r−1} r_σ`"; "5.1 The level-raising
     datum: places, types and levels"; "5.7 Places, levels and algebraic modular forms for level
     raising at a ramified place"; "9.1 The setting: congruent non-ordinary weight-two forms with large
     projective image"; "11.1 Standing hypotheses and auxiliary data"; "13.2 The hypotheses `S5-global`
     and `S5-local`". Section numbers do not change; the locators already in each paragraph stay.

10. **F10** (P3) consumed supplier sections missing from the supplier contracts

   - **Location:** `## Exact supplier contracts`, README:319–325 (IntegralHeckeAndGaloisDeterminants) and
     README:339–346 (GlobalGaloisDeformations), README:288–294 (PotentialAutomorphyInfrastructurePartII
     Layer 8).
   - **Witness:** *Needs* lines and routes cite IntegralHeckeAndGaloisDeterminants §1.4 (README:1136,
     3333, 4374), GlobalGaloisDeformations §8.4 (README:2552) and §§5.3–5.5 (README:3331, 3460), and
     PotentialAutomorphyInfrastructurePartII §8.5 (README:4089); none is in the contracts. All four exist
     at the suppliers' heads (§1.4 "Reducibility ideals and quotient extensions"; §8.4 "Presentations of
     polarized deformation rings"; §§5.3–5.5; §8.5 "Connectedness").
   - **Repair:** add to the contracts: "§1.4 (reducibility ideals; uniqueness of the decomposition of a
     residually multiplicity-free determinant)"; "§8.4 (presentations of polarized deformation rings),
     §§5.3–5.4 (dyadic Taylor–Wiles sets), §5.5 (inertia at Taylor–Wiles places and the `Δ_Q`-structure)";
     "§8.5 (connectedness: the bound from local and global presentations)".

Ten findings, two blocking (R01, R02). All seven repairs of round 5 are present and correct. The
mathematics of the 110 targets was read in full and recomputed where it computes; no false
statement was found. What remains is one dropped condition in the auxiliary data of Layer 11, two
supplier citations that name sections which do not exist at the supplier's head, and locator,
notation and style points. `Suggested.lean` elaborates with `sorry` as its only warning and is not
padded. No package file was changed.

## Verified sound

### Round-5 findings, checked first

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P1) | repaired | §14.5 API: "`ψ′ = DirichletCharacter.changeLevel h ψ` for `h : M ∣ MM′`"; Check: "`changeLevel` gives `ψ′(3) = 0` and `ψ′(7) = χ_{−4}(3) = −1`". `#check` at the pin: `changeLevel : n ∣ m → DirichletCharacter R n →* DirichletCharacter R m`; `changeLevel_eq_one_iff` needs `[NeZero m]`, and `M, M′ > 0` gives it. |
| F02 (P2) | repaired | §12.1(13): "if `Σ_π ∩ S_p ≠ ∅` then `p > 2`"; layer introduction: "the exclusion of `p = 2` concerns `Σ_π ∩ S_p` only". Witness `p = 2`, `N_π = 0`, `rank N_σ = r − 1 ≥ 1`: now allowed. No other passage uses `Σ ∩ S_p`. |
| F03 (P2) | repaired | §10.5: "irreducible because `t > n − 1` … adequate: … `t > 8n(n − 1) ≥ 2n + 2`". Supplier clause opened: ArithmeticGaloisRepresentations §7.9 at its head, "(3) for finite image with `SL₂(F_p) ⊆ r̄(Γ')` and `p ≥ 2n + 2`". §10.8 carries the same input (`4n(n−1) = 24 ≥ 8` at `n = 3`). |
| F04 (P2) | repaired | §4.2: "`π̃(f̃_v^H) = ϵ(v, ℰ, φ_H) σ_v(f_v)` for every matrix coefficient … `= ϵ` when `f_v` is normalised by `σ_v(f_v) = 1`"; §5.3 names "the normalised archimedean coefficients of §4.2 (trace `1`)". |
| F05 (P3) | repaired | §0.2 Check: "the profinite completion `ℤ_p^× × ℤ̂` of `ℚ_p^×`"; `Hom(·, C_5)`: `5` against `1`. ClassFieldTheory Layers 7 and 8 exist on main with the cited content. |
| F06 (P3) | repaired | §6.9 Checks: "Condition (4) is ordered and sufficient, not necessary" with `2·2 = 4 ≠ 1`, `3·2 = 6 = 1` in `𝔽_5`; "ratios `3` and `5`, neither of which lies in `{2, 4}`" in `𝔽_7`. |
| F07 (P3) | repaired | §13.4: "a case Layer 12 covers because its set `S` and its unitary level contain the ramification of `σ`". A search for "repaired", round labels, job ids, pull-request numbers and machine paths in README and Lean file finds none. |

The repaired patterns were searched in the rest of the package: no other raw ring composite of a
Dirichlet character; no other adequacy claim from an irreducibility bound (§§6.7, 7.7, 13.5 cite
`a₀(p)` or assume adequacy); no other unnormalised coefficient.

### Source sample (15 targets; every text was read at the lines given)

| Target | Text read | Outcome |
|---|---|---|
| §0.2 | nt21 lines 1432–1488 (§2.11.1, Lemma 2.13, pp. 30–31) | spaces, irreducible locus, Azumaya algebra and local splitting agree; the README's "`ρ_v` over `E`" is the source's hypothesis |
| §0.3 | nt21 lines 1446–1474 (Lemma 2.12, pp. 30–31) | statement agrees; the README's correction (conjugate, not equal) is right, see Source issues |
| §1.1 | nt21 lines 1928–1962, 2010–2017 (Theorem 2.24, Remark 2.25, pp. 40–42) | `n ≥ 3`, hypotheses (1)–(3), conclusion over `ℂ_p` agree |
| §1.3 | nt21 lines 2140–2197 (Lemma 2.29, pp. 44–46) | hypotheses and both cases (`N ≠ 0`, `N = 0`) agree; determinant `∏(i − j)` |
| §4.12 | ct17 lines 1096–1122, 1278–1281, 1345–1393, 1396–1441 (pp. 21, 24, 26–27) | sign table, Lemma 3.6, (3.7)–(3.9), Proposition 3.7 agree; both printed slips the README names are in the text |
| §6.6 | ct17 lines 2105–2146 (Lemmas 5.5, 5.6, pp. 41–42) | five conditions and three conclusions agree; `n_1 ≠ n_2`, `n_1 n_2` even at line 2128 |
| §7.6 | nt21 lines 4390–4428 (Theorem 7.6, pp. 90–91); line 151 (Theorem E, p. 4) | statement and route agree (`k ≡ 3 mod 4`, odd slope, level 4) |
| §7.7 | ct17 lines 2242–2262, 2301 (Theorem 6.2, pp. 45–46) | three hypotheses agree, `a > 1`, both adequacy conditions kept |
| §8.1 | nt21 lines 4638–4661 (Lemma 8.4, p. 95) | principal ideal, iff, dimension drop, both cases of the proof agree |
| §8.2 | nt21 lines 4510–4637 (Proposition 8.3, pp. 92–95) | five conclusions; `g = q + |T| − 1` at line 4632; `T`-framing in `4|T| − 1` variables |
| §9.2 | nt21b lines 308–336 (Lemma 2.2, p. 7; `P → R`, p. 8) | statement agrees; quotient is `A²`, dual is the group scheme, as the README says |
| §11.1 | nt26 lines 559–575, 711–766 (pp. 12–13, 15–16) | hypotheses, Lemma 3.3, `X_0`, `K_0`, Lemma 3.4 agree except R01 (dropped clause), R03 (pages), R08 (notation) |
| §11.5 | nt26 lines 820–832, 912–918 (Lemmas 3.6, 3.8, pp. 18, 20) | agree |
| §11.10 | nt26 lines 584–595, 1144 ff. (Theorem 3.2, p. 13; completion, p. 25) | agree |
| §14.4 | nt21 lines 43–89 (p. 2); nt21b lines 34–50 | Theorem A supports the route; the "consequence for `Δ`" is not there (R04) |

No locator is flagged by the author as unverified.

### Adversarial table (values computed in this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §0.2 character space | `p = 3`, target `C_5` | `|Hom(ℤ_3^× × ℤ̂, C_5)| = 5`; `|Hom(C_2 × ℤ_3², C_5)| = 1`; pro-3 quotient `ℤ_3²`, dimension `2` | sound |
| §0.3 injectivity | two extensions with scalar discrepancy `λ` at `c` | conjugation by `(α, 1)` multiplies `J` by `α²`; `α² = λ^{−1}` solvable since `2 ∈ A^×` | conjugate, not equal; README right |
| §0.4 | `n = 2`, `H² = 0` | `1 + 0 + 4 = 5` | sound |
| §1.1 `n`-regular | `n = 3`, ratio `−1`; ratio `2` | `Sym²`: `(1, −1, 1)` repeats; `(1, 2, 4)` distinct | sound |
| §1.3 determinant | `I = {0, 2}`; `I = {0, 1, 3}` | `[[1,1],[0,2]]`, det `2`; rows `(1,1,1),(0,1,3),(0,0,6)`, det `6 = 1·3·2` | equals `∏_{i<j}(j − i)` |
| §2.1 weight valuation | `p = 2`, `η(5) = −1` | `v_2(−2) = 1 < 2 ≤ v_2(5^{k−2} − 1)` | sound |
| §3.4 | `2` in `𝔽_5^×`, `𝔽_7^×` | orders `4`, `3`; `X² − X + 3 = (X − 2)(X − 4)` mod 5 | incompatible orders, sound |
| §3.7 | `i = 1` | `m_π = 2`, `k′ = 9`, `2i = 2 < 7/2`, `i′ = 3` | sound |
| §4.4 | `q = 3`, `p = 7` | `q(q−1) = 6`; `(q+1)(q²−1) = 32 = −1 + 6 + 27`; `|C| = 28` | sound |
| §4.10 homology | `n = 7, 9, 11` | `2+2+4 = 8 = 1+7`; `4+2+8 = 14 = 1+11+2`; `6+2+14 = 22 = 1+16+5` | sound |
| §4.12 signs | `m = 5`; `m = 3` | `jY − jX + jZ = 4[2,1,1,0]+2[2,1,0,1]+2[1,2,1,0]+2[1,2,0,1]+2[1,0,2,1]` = twice the 6 shuffles; `2[1,0,1]+4[1,1,0]` = twice the 3 shuffles | sound |
| §5.10 localisation | `q ≡ −1 mod l` | `[1,0,−1] ≡ [1,0,1]`, `[1,1,0]` differs: `dim Y(χ̄) = 3`; `2(a+b) ≤ a+3b ⇔ a ≤ b` | sound |
| §6.6 (3) | two equal eigenvalues | relation `a = (1, −1, 0, …)` | condition fails, as the Check says |
| §7.1, §7.2 | `a_5`; `p = 577`, `n = 3` | `(2+i)⁴ + (2−i)⁴ = −14`; `(p−1)/8 = 72 > 12`; `ε^{3(n−1) − 4(n−1)} = ε^{1−n}` | sound |
| §7.4 defect | `n − 1 = 2k` | `r^c ≅ r^∨ ⊗ ε^{6k − 8k} δ = ε^{−2k} δ`; twist by `(n−2)/2` gives `ε^{−1} δ` | defect `δ ≠ 1`, as stated |
| §7.6 | weight 5 Steinberg at `q`; `k = 7` | Newton slopes `3/2, 5/2` against Hodge slopes `0, 4`: no admissible line; `(k−1)/2 = 3` odd | irreducible; odd slope excluded |
| §7.7 ranks | `l = 5, 7` | `7 = 4 + 3`, `9 = 4 + 5` | sound |
| §8.1 | `n = 3`; `(α, β) = (1, −1)`, `(1, 2)` | discriminants `0` and `(1−2)²(1−4)²(2−4)² = 36` | iff sound |
| §8.2 bound | `n = 3`, `k = 2` | `p > max(8, 4)`; `(n−1)(k−1) = 2 ≤ p − 2` | sound |
| §9.2 | `1 ⊕ ε^{−1}` and its dual, `n = 3` | weights `{0,1,2}` against `{0,−1,−2}` | the quotient, not the dual |
| §10.5 | `t = n = 13`; `n = 3`, `t = 53` | `tr I_{13} = 0`; `53 > 48`, `53 ≥ 8` | sound |
| §11.1 (R01) | unramified extension, tame dihedral type of order `p` | residually trivial and `q ≡ 1`; inertial order `p` | listed conditions do not give unramified |
| §11.1 Lemma 3.3 | `p = 5`, `a = 4`, `r ≤ 4` | `5⁴ − 1 = 624 > 16 = 4r` | element of order `> 4r` exists |
| §11.3 (R08) | multiplier of `s` | `(r_π ⊗ Sym^{r−1} r_σ)^∨ ≅ (·) ⊗ ε^{2r−1} ω_p^{1−r}` | needs `y y^c = ω_p` |
| §11.5, §11.6 | `n = 4`; `𝔽_7`, `q = 3`, `Φ = diag(1, 2)` | `1 + n² = 17`, fibre `16`; `3, 3, 6, 5` | sound |
| §11.10 | `r = 2` | weights `{0,1} + {0,2} = {0,1,2,3}` | regular |
| §12.4 | `r = 1`, `(α, β, γ) = (2, 3, 5)` | `η = (10, 15)`, `η_1 η_2 = 150`; printed formula `30` | README's correction right |
| §12.6 (R07) | `q = h¹(ad⁰ r̄(1))`, `r̄` trivial on `S` | `q ≥ [F:ℚ] + 3|S|` (Euler characteristic and local `H²`) | true but unsourced |
| §13.4 | `r = 4`, `q = 17`, `x = 2`, `y = 3` | forbidden `{1,2,4,8,9,13,15,16}`; eigenvalues `7,6,10,11,14,12,3,5` | distinct |
| §13.10 | `n = 6, …, 12` | primes `5; 5; 5,7; 5,7; 7; 7; 7,11`, always `p ≥ 5`, `0 < r < p`, indices `< n` | sound |
| §14.4 headline | `Δ`, `n = 2`; `n = 0` | `α² + αβ + β² = 576 − 2048 = −1472`; `|α^jβ^{n−j}p^{−s}| < p^{−1}` on the half-plane; `n = 0` gives `ζ(s)` | sound, `1 ≤ n` needed |
| §14.5 headline | `y² = x³ − x`, `n = 4` and `n = 2`; `Δ` | `Sym⁴ ∋ ε^{−2}`: `ζ(s−2)`, pole at `3`; `Sym² ∋ ε^{−1}χ_{−4}`: entire; `252·(−1) ≠ 252` | hypothesis needed and discriminating |
| §14.5 predicate | `M = 0`; `M = 4 → 12` | `Nat.Coprime p 0 ⇔ p = 1`; values `0, −1` at `3, 7` | `M > 0` needed; `changeLevel` right |

### Lean acceptance test

- `lake env lean` on `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean`, from the
  content checkout: exit 0, two warnings, both "declaration uses `sorry`" (lines 97, 116). No
  `TauCeti.*` module needed building. Header: `import Mathlib` and the one Tau Ceti module used, in
  the module form 47 roadmaps on main use.
- `#check @name` for the four declarations in a scratch copy: the elaborated types equal those of
  `scratch/signatures.md` and the README statements (`1 ≤ n`, the Satake hypotheses, and for the
  general level `[NeZero N]`, `2 ≤ k`, `¬HasQuadraticSelfTwist f`, product over `p ∤ N`). Nothing lost.
- One-tactic probe on both sorried theorems, six tactics each (`simp`, `rfl`, `infer_instance`,
  `exact?`, `aesop`, `trivial`): all twelve fail. No padding. The one proved `example` is the
  reindexing symmetry of the kept definition.
- Pinned declarations opened with `#check` (24): the four above; `DirichletCharacter.changeLevel`,
  `changeLevel_injective`, `changeLevel_eq_one_iff`, `changeLevel_eq_cast_of_dvd'`, `ZMod.unitsMap`,
  `MulChar.map_nonunit`, `ZMod.χ₄`, `Polynomial.discr`, `GaussianInt`,
  `Nat.exists_prime_lt_and_le_two_mul`, `NumberField.abs_discr_gt_two`, `UpperHalfPlane.qExpansion`,
  `Complex.cpow`, `HeckeRing.GL2.Newform`, `Newform.satakeParameters`,
  `Newform.exists_satakeParameters_eq_pair`, `Newform.LSeries_eulerProduct_hasProd_satakeParameters`,
  `Newform.prod_map_one_sub_mul_satakeParameters`, `CuspForm.hasEntireExtension_qExpansion_coeff`
  (all exist); `padicValNat.pow_two_sub_one` exists as a deprecated alias (R06).
- Headlines: component propagation (§§2.4, 3.8), level raising (§§5.4, 5.10, 6.4, 6.7–6.9), seeds and
  Theorems A, B, E (§§7.5–7.7, 8.3, 14.1–14.2), lifting (§§9.8, 12.7), tensors (§§11.10, 13.5–13.6),
  `SP_n` (§13.10) and §14.3 are named in the module docstring with the missing carrier; §§14.4–14.5
  are stated. No statable headline is absent, none goes through a stand-in.

### Suppliers, order, gaps, overlaps

- Dependency check output: `depcheck: 245 roadmaps, 2257 edges, 0 problem(s)`; no UPWARD, CYCLE or
  `moved:` line.
- All 110 `*Needs:*` lines read. Every numbered section cited for 30 suppliers was matched against a
  heading at the supplier's main or open head; every quoted section title (75) was searched, and two
  are missing (R02). Content opened for: ArithmeticGaloisRepresentations §7.9;
  SerreWeightAndLevelOptimisation §6.9 (totally definite quaternion algebras over totally real `F`,
  `p > 2`, which covers its use in §14.1); PotentialAutomorphyInfrastructurePartII §§1.4, 5.3, 8.6,
  8.16 and its scope; ClassFieldTheory Layers 7, 8, 11–14; GL2AutomorphicRepresentationsAndTransfer
  §§R16.1.7, R16.4.4, R16.4.6; AutomorphicLFunctionsAndLocalFactors AL.2.4, AL.3.7.1;
  ModularityAndLanglandsExtensions §§4.12, 4.29.
- Gaps: the 13 slugs agree verbatim between README and `design/plan.json`, each with a named earlier
  supplier. `gap:geometric-weak-primitive-auxiliary-finiteness` matches the supplier's §8.16, which
  says "the variant without it is not claimed". `gap:dyadic-definite-unitary-forms` is not met by
  OrdinaryAutomorphicFormsAndModularityLiftingPartII (ordinary forms over a weight algebra at `p = 2`
  only). One remark, not a finding under the rule for declared gaps: `gap:tensor-taylor-wiles-primes`
  writes "nt26 pp. 29–30, Propositions 4.8–4.9"; the data are on pp. 29–30 and the propositions on
  pp. 34–35, as §12.6 says.
- Duplication by object: `roadmaps grep` for "seasoned", "Buzzard–Kilford", "twin involution",
  `HasQuadraticSelfTwist`, `symPowerEulerFactor`, "symmetric power L-function" finds only this package
  and the statements of ModularityAndLanglandsExtensions that it proves; no `Suggested.lean` declares
  the four names. ModularityAndLanglandsExtensions §4.12 has a one-sentence remark on `Δ`; §14.4 is
  the general statement on native newforms and is not a restatement.
- Kazhdan–Lusztig classification: SmoothRepresentationsOfLocalGroupsPartII §§7.1, 7.3 at its open
  head still state it without citing §4.9 here. The repair report of round 4 marked this "not
  actionable in this package" (F03) with the reason that the later roadmap must cite the earlier
  one; the merge order (this roadmap at line 284, that one at 294) confirms the reason. Not re-raised.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined
  only by an open revision.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII (open), SmoothRepresentationsOfLocalGroups, ReductiveGroupsPartII (main); statements of symmetric power functoriality: ModularityAndLanglandsExtensions, proofs here; potential diagonalizability criteria: ModularityAndLanglandsExtensions §2.1; residually reducible lifting and finiteness: PotentialAutomorphyInfrastructurePartII; Iwahori–Matsumoto presentation: SmoothRepresentationsOfLocalGroups SR.1.5; Kazhdan–Lusztig classification: this roadmap §4.9.

### Shape

15 layers, each with Examples and Dependencies; 110 numbered targets, 110 `*Needs:*` lines, 110
Checks lists with at least three bullets each; definitions carry prose API lists; the four
backticked names of the roadmap's own are declared in `Suggested.lean`. No LaTeX delimiters, no
target tables, no process words. Organisation: Layers 4–6 are independent of Layers 0–3, Layers
11–13 use Layers 6 and 9 only, and the order within each group is forced by the Dependencies lines
except that of Layers 11 and 12, which are independent of each other.

### Copyright, wording and arrangement

Seventeen passages were set beside the sources: the fifteen sampled targets and, further, the
description of the fixers `B` and `P` (§§4.8, 4.10; ct17 lines 264–274), the route of §13.9 (th24
lines 1864–1881), §12.6 (nt26 lines 1586–1610) and the two theorem docstrings of `Suggested.lean`.
The longest shared run is nine words ("is an Azumaya algebra over a Henselian local ring", nt21
line 1485), a phrase the mathematics forces. No table, figure or list is taken over. Contents of
nt21 (line 13 ff.): §1 unitary groups, §2 eigenvarieties, §3 ping pong, §4 level raising
(automorphic), §5 finiteness, §6 level raising (Galois), §7 level one, §8 higher levels. The roadmap
splits §2 into Layers 0–2, places §1 after §3 and merges it with ct17 §§2–3 (Layer 4), merges §4 with
ct17 §§3–4 (Layer 5) and §6 with ct17 §5 and th24 §6 (Layer 6), and leaves §5 to a supplier: no
one-to-one run.

Source independence: 17 passages compared with 5 sources (nt21, nt21b, nt26, ct17, th24), none shared beyond a nine-word forced phrase; largest share nt21, 90 of 252 source references; contents compared with nt21: independent (headings naming source sections are R09).

## Not verifiable

- kl87 (Theorem 7.12, §8), bbm82 (Théorème 3.1.1), kw09 (Proposition 9.3): settled as uncertified;
  the texts were not read. Their uses are §4.9, the gap `artinian-crystalline-quotients` and the gap
  `formal-torus-patching`; the accessible statements that quote them (ct17 §2.2, nt21b Lemma 2.2,
  nt21b Proposition 2.8) were read.
- Sources outside the sample (chen14, moe07, kv12, dm18, ls20, wes04, bk05, con99, at20, ct15) were
  not reopened this round; rounds 2–5 record their checks.
- Whether the induced representation after ct17 (3.9) has a non-simple socle, as §4.12 asserts
  against the printed text, was not decided here; it rests on the declared gap
  `explicit-tempered-unitary-packets`.

## Source issues

- **Gap** in nt21 at Lemma 2.12, proof, p. 31: the source says two extensions with the same restriction are equal by Schur's lemma; it should be that they differ by a scalar at complex conjugation and are conjugate; affects the proof.
- **Misprint** in nt21 at Theorem 7.6, proof, p. 90: the source says the symmetric power of `π` is automorphic in the list of properties of `σ`; it should be `σ`, `π` being constructed later; affects nothing.
- **Misprint** in ct17 at Theorem 3.3(i), p. 21: the source says `X` has exponent `[1, 0, 1]` for `m = 3`; it should be `[1, 0, −1]`, as Proposition 3.7's proof computes; affects a stated result.
- **Misprint** in ct17 at §3.5, p. 27: the source says `ε_1(X)` or `ε(Z)` equals `−1`; it should be `ε_1(Z)`; affects the proof.
- **Misprint** in ct17 at Lemma 5.6(3), p. 42: the source says characteristic-`l` eigenvalues satisfy no integer-linear relation; it should be no multiplicative relation; affects a stated result.
- **Misprint** in th24 at Corollary 7.2, proof, p. 42: the source says Bertrand gives a prime `p` with `n < p < 2n` and writes `n = p + r`; it should be `n/2 < p < n`; affects the proof.
- **Misprint** in nt26 at Lemma 3.4(5), p. 16: the source says the embedding is of an undefined field `K`; it should be `K_1`; affects nothing.

## For the human reviewers

- Ownership: SmoothRepresentationsOfLocalGroupsPartII (open, §§7.1, 7.3 of its README) states the Kazhdan–Lusztig classification that §4.9 here owns and does not cite it; the edit belongs to that roadmap.
- Licence: ct17, ct15, bk05 and con99 were read from authors' pages (`sources.toml`, `licence_class = "author-page"`); kl87, bbm82, kw09 are cited by locator only.
- Scope: nt26 is cited by its arXiv v2 pages with the venue "Ann. of Math. 203 (2026)"; the published pagination was not compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "c1c93660b0f0693a3b855bf23d5a6e6383a5a753", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~6", "model": "fable", "worker": "chris-x26"} -->
