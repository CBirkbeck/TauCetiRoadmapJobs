<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6903728438 -->
Review (claude) of 02c1f07

Verdict: needs_changes

**For the human reviewers:** this review raises 5 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §12.7 proof sketch gives the torus a rank that is the dimension of a component

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4568` (§12.7, proof
     sketch): "for `p = 2` the torus action of rank `n + 4|S ∪ S_∞|` and the formal `Ĝ_m^γ[2]`-torsor act
     transitively on components and lift to both patched modules".
   - **Claim:** the torus acting in the dyadic patching has rank `n + 4|S ∪ S_∞|`.
   - **Witness:** §12.6 of the same README and nt26 line 1647 give the torus `Ĝ_m^γ` with
     `γ = 2 − |S ∪ S_∞| + q`. nt26 line 1693 has `qn + 4|S ∪ S_∞|` as the dimension of the component `Z`
     of `Spec P_∞`. For `|S ∪ S_∞| = q = 3`, `n = 4`: `γ = 2`, against `16`.
   - **Repair:** replace the clause by: "for `p = 2` the free action of the torus `Ĝ_m^γ`
     (`γ = 2 − |S ∪ S_∞| + q`, §12.6) on `Sp R′_∞` and the `Ĝ_m^γ[2]`-torsor `Sp R_∞ = δ^{−1}(1)` make
     `Ĝ_m^γ[2](𝒪)` act transitively on the irreducible components of `Spec R_∞`, compatibly with its
     actions on `Spec P_∞` and on both patched modules; the component of `Spec P_∞` through `𝔭_∞` has
     dimension `qn + 4|S ∪ S_∞|` and lies in the support of `H_{G,∞}`, giving the same conclusion (§9.7)".
     Tested on the witness: the rank is now `γ = 2`, as in §12.6 and its third Check, and
     `qn + 4|S ∪ S_∞| = 24 = dim W′_∞` (`1 + nq + 4|S ∪ S_∞| − 1`), as a component of the support of a
     module finite free over `W′_∞` must have.

2. **F02** (P3) §4.3 proof sketch: the description of `θ`-discrete parameters omits a condition

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:1540` (§4.3, proof
     sketch): "For `θ`-discrete `π` (all `l_i = 1` and no `τ_k`) the existence and uniqueness of `π_τ`
     and the finiteness of fibres are Mœglin's".
   - **Claim:** a parameter of `A^θ_t(GL_n(F_ṽ))⁺` is `θ`-discrete when all `l_i = 1` and there is no
     `τ_k`.
   - **Witness:** nt21 line 646: discreteness needs `l_i = 1` and both index sets `J` and `K` empty.
     For `n = 2`, `φ = σ ⊕ σ` with `σ` of sign `(−1)^n = +1` has `m_j = 2` (even, so `φ` extends), no
     `ρ_i`, no `τ_k`, and centraliser containing `O_2(ℂ)` or `Sp_2(ℂ)`: infinite, not discrete.
   - **Repair:** replace the parenthesis by "(all `l_i = 1`, no `σ_j` and no `τ_k`)". Tested on the
     witness: `σ ⊕ σ` is now excluded and falls under "extended to all tempered `π` by parabolic
     induction"; `St_2(χ) ⊞ 1` of the third Check (two summands of sign `+1 = (−1)^{n−1}`, each once)
     is still `θ`-discrete, as its supercuspidal packet member requires.

3. **F03** (P3) five page ranges

   Read against the page markers of the cached texts. These are the pattern of round 9's F03 in
   sections that round's sweep did not flag.

   - **§7.4, README:2993:** "(nt21 Proposition 7.4 and proof, pp. 85–89)". The proof ends at nt21 line
     4328; the marker of p. 89 is line 4329, and p. 89 opens with the proof of Theorem 7.1. Repair:
     "pp. 85–88".
   - **§7.4, README:3002:** "descend as in nt21 pp. 88–89". The descent (from `L_1 = L_0 K` to
     `F = L_1 M_1 M_2 M_3`) is nt21 lines 4312–4328, all on p. 88. Repair: "p. 88".
   - **§7.5, README:3029:** "(nt21 Theorem 7.1, p. 83; proof, p. 89; Remark 7.5, p. 90". The proof runs
     nt21 lines 4331–4384, and the marker of p. 90 is line 4376. Repair: "proof, pp. 89–90".
   - **§8.2, README:3168:** "(nt21 Proposition 8.3 and proof, pp. 92–95)". Lemma 8.4 sits inside the
     proof, which continues after it with the patching count (the `g` variables the README comments
     on) and ends at nt21 line 4685; the marker of p. 96 is line 4662. Repair: "pp. 92–96".
   - **Supplier contract `gap:tensor-taylor-wiles-primes`, README:363:** "Propositions 4.8–4.9,
     pp. 34–35". Proposition 4.9 runs nt26 lines 1643–1672 and the passage on the existence of
     Taylor–Wiles data that the contract asks for is lines 1677–1682, after the marker of p. 36 (line
     1663). Repair: "pp. 34–36", with the same three characters changed in the `needs` of this slug in
     `design/plan.json`, so that the two texts stay identical (they are compared word for word).

   The other locators of the sample are right (table below). A scripted comparison of the 38
   "statement and proof, pp. a–b" locators into nt21, nt21b, nt26 and th24 with the headings and
   end-of-proof marks of the texts printed six lines: the first and the fourth items above, and four
   that were read and are correct (nt21 Theorem 3.1 is cited with its statement and proof on separate
   pages; the proofs of nt21 Lemma 6.7 and nt26 Lemmas 3.1 and 5.8 are separated from their
   statements).

Three findings, all P3, none blocking. The four repairs of round 9 are present and correct.
`Suggested.lean` elaborates with `sorry` as its only warning and is not padded. Fourteen of the
fifteen sampled targets agree with their sources in statement, hypotheses and locator; the fifteenth
(§7.4) agrees in statement and has two page ranges one page too long. What remains is one wrong rank
in a proof sketch, one incomplete parenthetical definition in a proof sketch, and five page ranges.
No package file was changed by this review, and the sources manifest needed no addition.

## Verified sound

### Round-9 findings, checked first

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P3) | repaired | §1.1, third Check: "At `z_2` itself the conclusion is weaker than hypothesis (2) … that this point is classical … is not part of the statement and needs the further hypotheses of §1.4 on `z′_2`". Read against nt21 lines 1943–1953 (Theorem 2.24: the conclusion is a containment only) and 2088–2109 (Corollary 2.28: conditions (2), (3) on `z′_2`). Layer 1 Examples, first bullet, now lists conditions (1)–(3) and (5) of Corollary 2.28. |
| F02 (P3) | repaired | §5.5, third Check: "`μ μ^c = 1` on `𝔸_E^×` follows from the statement: `μ(x) μ(c x) = μ(N_{E/F} x) = ε_{E/F}(N_{E/F} x) = 1`". Recomputed (row below). |
| F03 (P3) | repaired | §12.6: "Proposition 4.9, pp. 35–36" (nt26 lines 1643–1672, marker 1663); §12.7: "pp. 34–36" (proof ends line 1706, marker of p. 37 at 1707); §9.1: "reductions (6)–(11), p. 6"; and the two further ranges the repair found (§9.6 "pp. 18–19", §9.7 "pp. 17–18"). The pattern recurs in four places the sweep missed: R03. |
| F04 (P3) | repaired | Summary table, Layer 14: "holomorphy of `L(s, Sym^n f)` in level one and, away from the level, for non-CM newforms of weight at least `2`"; agrees with §14.5 and the Summary. The other fourteen rows were compared with their layers: no omission. |

### Source sample (15 targets, each read at the lines given)

| Target | Text read | Outcome |
|---|---|---|
| §0.1 | nt21 lines 1124–1133 (§2.1, Lemma 2.2, p. 24); 1954–1959 (use of con99 Theorem 3.4.2, p. 41) | statement, hypothesis (affinoid neighbourhood in the preimage) and route agree |
| §2.2 | nt21 lines 2535–2578 (Lemma 2.34 and proof, pp. 51–52) | agrees; the README's added surjectivity is what the proof constructs; `L` is `χ^{−1}` on the conjugate places, as written |
| §3.7 | nt21 lines 2745–2782 (Lemma 3.7 and proof, pp. 56–57), 2630–2640 (Theorem 3.2), 2656–2665 (Lemma 3.3) | items (1)–(6), `m_π`, `k′`, slopes and `i′` agree |
| §3.8 | nt21 lines 2618–2622 (Theorem 3.1, p. 53), 2784–2789 (proof, p. 57), 92 (Theorem D, p. 3) | agrees |
| §4.2 | nt21 lines 553–613 (Propositions 1.6, 1.7, pp. 12–13) | agrees: odd `n`, archimedean sign, inert unramified with spherical normalisation, split bounded with Whittaker normalisation |
| §4.3 | nt21 lines 614–706 (§1.8, Propositions 1.9–1.11, pp. 14–15) | statement agrees; the parenthesis of the proof sketch is R02 |
| §5.4 | nt21 lines 2921–2967 (data, Theorem 4.1, Remark 4.2, pp. 59–60), 3192–3237 (proof, pp. 64–65) | agrees; the printed `n_2` in item (4) is as the README says (Source issues) |
| §5.8 | ct17 lines 1766–1806 (Proposition 4.1 and proof, pp. 34–35) | agrees: ι-ordinary, semistable, cases 1 and 2, cuspidality in case 2 |
| §6.7 | ct17 lines 1903–1927 (set-up and Theorem 5.1, pp. 37–38), 2167–2198 (end of proof, p. 43) | hypotheses 1–4 and the three conclusions agree; the proof does use primitivity of `r_{𝔭_0}` without deriving it (line 2196) |
| §7.4 | nt21 lines 4164–4328 (Proposition 7.4 and proof, pp. 85–88), 4054–4071 (Theorem 7.1) | construction agrees; the defect of the rank-two block was recomputed (row below); two page ranges are R03 |
| §10.3 | nt21b lines 1054–1067 (Definition 3.6, p. 23) | conditions (1)–(5) agree |
| §11.3 | nt26 lines 745–813 (Lemma 3.4(5), `π_1`, `π_2`, `s`, Lemma 3.5 and proof, the `𝒢_n`-extension and the sets, pp. 16–17), 1144–1152 (p. 25) | agrees |
| §12.3 | nt26 lines 1356–1385 (Taylor–Wiles datum, `Δ_Q`, `P_Q`, `Δ′_Q`, `P_Q → R_Q`, pp. 29–30) | agrees |
| §12.7 | nt26 lines 1183–1202 (Theorem 4.1, pp. 25–26), 1643–1706 (Proposition 4.9 and the dyadic end of the proof, pp. 35–36) | hypotheses (1)–(9) agree; the rank in the proof sketch is R01 |
| §13.7 | nt26 lines 2127–2244 (Proposition 6.1 and the intermediate claim, pp. 45–48), 2296–2310 (Corollary 6.2, p. 49) | agrees; the two printed slips the README names are there (Source issues) |

No locator is flagged by the author as unverified.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §12.7 sketch, torus rank (R01) | `|S ∪ S_∞| = q = 3`, `n = 4` | `γ = 2 − 3 + 3 = 2`; README sketch `n + 4·3 = 16`; nt26 component dimension `qn + 12 = 24` | sketch wrong; §12.6 right |
| §4.3 sketch, `θ`-discrete (R02) | `n = 2`, `σ ⊕ σ`, sign `+1`; `St_2(χ) ⊞ 1`, `n = 3` | `m_j = 2` even: in `A⁺`, centraliser infinite; second: `χ|_{F⁺}` = `ε_{F/F⁺}` (sign `−1`) times `Sym¹` (sign `−1`) gives `+1`, trivial character `+1`, each once: discrete | parenthesis too wide |
| §4.3 Checks | `n = 1`; `n = 2`, `σ ⊕ σ′` distinct of sign `+1` | `z ↦ χ(z/c(z))`, trivial to trivial; `m_j = 1, 1` odd: no extension | sound |
| §4.2 normalised coefficient | `U_1(ℝ)`, `σ = z^m`; constant `2` | `∫ z^{−m} z^{m′} = δ_{m,m′}`; `dim σ · (1/dim σ) = 1` (Schur); trace of constant `2` on trivial is `2` | sound |
| §0.1 Checks | disc with `𝒳 = {0}`; two axes | `β^{−1}(𝒳) = {0}` contains no affinoid neighbourhood; at `y ≠ 0` on one axis only that axis is forced | sound |
| §2.2 Checks | `pℤ_p ⊂ ℤ_p`; `⟨2⟩ ⊃ ⟨4⟩`, modulus `3` | restriction `t ↦ t^p`, `p` preimages; `2^a ≡ (−1)^a mod 3`, `≡ 1` iff `a` even | sound |
| §3.7 | `i = 1`; general `i`, `m` | `2^{m+1} > 5` first at `m = 2`; `k′ = 2 + 8 − 1 = 9`; `(k′ − 2)/2 = 7/2 > 2`; twin slope `9 − 1 − 2 = 6 = 3·2`; `i′ = (2i + 2^{m+1} − 2)/2 − i = 2^m − 1` | sound |
| Layer 3 Examples | `Δ`, weight `16` | `v_2(−24) = 3`, slopes `{3, 11 − 3 = 8}`; `216 = 2³·27`, slopes `{3, 15 − 3 = 12}` | sound |
| §5.1 Checks | `n = 3`; `T_2` | order `n − 2 = 1`: `q_v ≡ 1`; `Θ^{q_v} = Θ^{−1} ≠ Θ` for `q_v ≡ −1`, `p` odd | sound |
| §5.8 Check | `n = 7` (`l = 5`, `m = 3`); `n = 9` | partitions `≥ (3,3,1)`: `331, 421, 43, 511, 52, 61, 7`; odd parts or even parts twice: `331, 511, 7`; for `(5,3,1)`: `531, 711, 9` | sound |
| §6.7 Checks | `l = 5`: `(n_1, n_2) = (4, 3)`; `l = 7`: `(5, 4)` | `12` even, `5 ∤ 84`, block `≥ 5`; `20` even, `7 ∤ 180`, block `≥ 6` so `7 + 1 + 1` or `9` | sound |
| §7.4 defect | `r = r_τ|_{G_{F_0}} ⊗ ω_1 ω_0^{2k}` | `r^c = r_τ ω_1 ε^{6k} ω_0^{−2k}` (`δ^{2k} = 1`); `r^∨ ε^{−2k} = r_τ ω_1 ε^{6k} δ ω_0^{−2k}`; quotient `δ_{K/ℚ}`; `r_τ ≇ r_τ ⊗ δ` as `τ_{q_1}` is Steinberg | defect confirmed; the rank `n − 2` block has no defect (its pieces are induced from `K`) |
| §7.5 | `TS_1`; step `n → 2n` | `Π = 1`: residual `ω̄^0 ⊗ Sym^0` trivial, unramified character is a rank-one Steinberg twist; `48(2n)!` is a multiple of `48 n!` | sound |
| §5.5 Check 3 (repair) | split place `x = (a, b)`; `z = i` | `x · cx = (ab, ab) = N x`, `ε(ab) = 1`; `(i)(−i) = 1` | sound |
| §1.1 Check 3 (repair) | `n = 3`, ratio `−1` | `(α/β)² = 1`: not `3`-regular | sound |
| §10.3 Checks | `n = 3` | `8·3·2 = 48`; `49 = 7²`, `51 = 3·17`, `53` prime; `3·53 − 1 = 158` even; `4·53 − 1 = 211` prime | sound |
| §11.3 | `s = (r_π ⊗ Sym^{r−1} r_σ) ⊗ y^{1−r}` | `s^∨ = (…) ε^{1 + 2(r−1)} ω^{1−r} y^{r−1}`, `s^c = (…) ω^{1−r} y^{r−1}`: quotient `ε^{1−2r}`; dimensions `(r + 1) + (r − 1) = 2r`; weights `{0,1} + {0, 2, …, 2r − 2} = {0, …, 2r − 1}` | sound |
| §12.3 Checks | `r = 1`; `α γ_1 = β γ_2` | condition `α_v ≠ β_v`; a repeated eigenvalue, not a datum | sound |
| §12.6 Checks | `q = |S ∪ S_∞| = 3`; `q = 0` | `γ = 2`, `{±1}²` of order `4`; `γ = −1` | sound |
| §13.7 Check | `Δ`, finite-order `χ` | Hodge–Tate weight of `χ² ε^{−11}` is `11 ≠ 1`; residually `2·5 − 11 = −1` | sound |
| §13.10 headline | `n = 6, 7, 11, 12`; Bertrand on `⌊n/2⌋` | `p = 5, r = 1`: `SP_1, SP_2, SP_4`; `p = 5, r = 2`: `SP_1, SP_2, SP_3, SP_3`; `p = 7, r = 4`: `SP_3, SP_4, SP_5, SP_3`; `p ∈ {7, 11}`; `n = 2m`: `m < p ≤ 2m`, `p ≠ n`; `n = 2m + 1`: `p ≤ 2m < n`; `p > 3` so `p ≥ 5` | sound; every index `< n` |
| §14.1 Check | `r̄` trivial at `v`, `q_v ≡ 1` | `T_v ≡ 2`, `(q_v + 1)² ≡ 4 = T_v²` | sound |
| §14.4 headline | `n = 0`; `n = 1`; `Δ`, `p = 2`, `n = 2` | `ζ(s)`; region `(k + 1)/2`; `576 − 2048 = −1472`, `e_2 = αβ·e_1`, `e_3 = (αβ)³`; `|α^j β^{n−j} p^{−s}| = p^{n(k−1)/2 − Re s} < p^{−1}` in the region | `1 ≤ n` needed; sound |
| §14.5 headline | `M = 0`; level `32` CM form, `n = 2` and `n = 4`; weight one | `p ⊥ 0` iff `p = 1`; inert `p`: `α = √(−p) = −β`, `Sym²` eigenvalues `{−p, p, −p}` = `Ind ψ²` (`±p`) plus `pδ(p)`: entire; `Sym⁴` eigenvalues `{p², −p², p², −p², p²}` = two inductions (`±p²` each) plus `p²`: `ζ(s − 2)`, pole at `3 = 4·1/2 + 1`; invariant of degree `12·|Z|` gives a pole at `1` | hypotheses needed; sound |
| `HasQuadraticSelfTwist` | `ψ ≠ 1`, `ψ² = 1` modulo `M > 0` | `a_p = 0` whenever `ψ(p) = −1`, a set of primes of density `1/2`; for `k ≥ 2` this is CM by the imaginary quadratic field of `ψ` | predicate is the non-CM condition |
| Worked examples | `n = 3`; `n = 11` | `48·3! = 288`, `577 = 2·288 + 1`; only prime in `(5.5, 11)` is `7`, `r = 4` | sound |

### Lean acceptance test

- `lake env lean` on `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` from the
  content checkout: exit 0; the output is two "declaration uses `sorry`" warnings (lines 98, 117).
  No `TauCeti.*` module needed building. The header (`module`, `public import Mathlib`, the one Tau
  Ceti module used) is the form of 54 roadmaps on main. No `set_option`, `lemma`, `#eval`, sorry'd
  data. The file is unchanged since round 8.
- Signatures: `#check @name` for the four declarations in one scratch file; the types equal the
  worker's list and README §§14.4–14.5: `1 ≤ n`, the Satake hypotheses (with `¬p ∣ N` in §14.5),
  `[NeZero N]`, `2 ≤ k`, `¬HasQuadraticSelfTwist f`, the product over `p ∤ N`. Nothing lost.
- One-tactic probe on both sorried theorems: `simp`, `rfl`, `infer_instance`, `trivial`,
  `simp [symPowerEulerFactor]`, `aesop` each fail to close the goal; the constant witness
  `⟨fun _ => 0, differentiable_const _, by simp⟩` leaves `HasProd … 0` unsolved. No padding. The one
  proved `example` is the symmetry of the kept definition.
- Pinned declarations opened this round: `HeckeRing.GL2.Newform`
  (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`, extends `EigenformAwayFromLevel`,
  with `isNew` and `isNorm`), `satakeParameters` (`…/Newforms/Satake.lean:91`), with
  `exists_satakeParameters_eq_pair` (line 117), `card_satakeParameters` (125), `prod_satakeParameters`
  (153, product `χ(p) p^{k−1}`), `prod_map_one_sub_mul_satakeParameters` (161). The Mathlib names of
  the supplier contracts were opened in round 9 at the same pin and the file has not changed.
- Headlines: §§2.4, 3.8, 5.4, 5.10, 6.4, 6.7–6.9, 7.5–7.7, 8.3, 9.8, 11.10, 12.7, 13.5, 13.6, 13.10,
  14.1–14.3 are named in the module docstring with the missing carrier; §§14.4–14.5 are stated. No
  statable headline is absent. The four backticked names of the roadmap's own are declared.

### Suppliers, order, gaps, overlaps

- Dependency check output: `depcheck: 235 roadmaps, 2259 edges, 0 problem(s)`; no UPWARD, CYCLE or
  `moved:` line. The roadmap is the line after PotentialAutomorphyInfrastructurePartII and
  OrdinaryAutomorphicFormsAndModularityLiftingPartII in the merge order.
- `roadmaps resolve`: no cross-roadmap citation and no Lean name found nowhere. Opened at their heads
  this round: PotentialAutomorphyInfrastructurePartII §§0.9, 0.10, 0.11, 1.4, 7.15, 7.19, 8.15,
  8.16, 9.1, 9.2, 9.4, 9.7, 9.8 (titles as quoted) and its table row "§8.17, the ANT lifting theorem
  with weak primitivity"; GL2AutomorphicRepresentationsAndTransfer R16.1.7, R16.4.6; AdicSpacesPartV
  §§1.1, 1.4, 1.5; ArithmeticGaloisDuality R02.3.5; AutomorphicLFunctionsAndLocalFactors AL.2.4
  ("Global Godement–Jacquet theory"), AL.3.7.1. No cross-roadmap citation changed since round 9,
  which resolved the others.
- Gaps: 14 slugs; each README contract line equals the `needs` of `design/plan.json` (compared by
  script), each with a named supplier earlier in the order or on main. None vague, none asking for
  what is provided. One page range in one of them is R03 (last item).
- Shape: 110 numbered targets with `*Needs:*` and Checks; 15 layers with Examples and Dependencies;
  a scan for LaTeX delimiters, pull-request numbers, machine paths, HTML and process words finds
  none. All 18 cited works are in the manifest (15 certified, 3 uncertified).
- Duplication by object: `roadmaps grep` over the Lean files on main and at the open heads finds no
  `symPowerEulerFactor`, `HasQuadraticSelfTwist` or other self-twist predicate.
- Kazhdan–Lusztig classification: settled in round 4 as not actionable here; not re-raised.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined
  only by an open revision, no second copy.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems, GL2ModularityLifting (open), SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants, ModularForms (main); statements of symmetric power functoriality and of its steps: ModularityAndLanglandsExtensions, proofs here; residually reducible finiteness and its auxiliary-place variants: PotentialAutomorphyInfrastructurePartII; Chenevier determinants: IntegralHeckeAndGaloisDeterminants; newforms and Satake parameters: Tau Ceti, as ModularForms records; Iwahori–Matsumoto presentation: SmoothRepresentationsOfLocalGroups; Kazhdan–Lusztig classification: this roadmap §4.9.

### Copyright, wording and arrangement

Seventeen passages were set beside the sources: the fifteen sampled targets and the two theorem
docstrings of `Suggested.lean` (against nt21 Theorem A and Corollary C, lines 57–75, and nt21b
Theorem A). The hypothesis lists of §§5.1, 6.7, 10.3 and 12.7 keep the source's items, which the
mathematics forces; the sentences, the Checks and the proof sketches are the roadmap's own, and no
run of shared words beyond standard phrases ("an unramified twist of the Steinberg representation")
was found. No table, figure or list of examples is taken over. Contents of nt21 (§1 unitary groups,
§2 eigenvarieties, §3 ping-pong, §4 and §6 level raising, §5 finiteness, §7 level one, §8 higher
levels) against Layers 0–8: §2 is split over Layers 0–2, §1 comes after §3 and is merged with ct17
§§2–3, §4 with ct17 §4, §6 with ct17 §5 and th24 §6, §5 is left to a supplier; the order of Layers
4–8 is forced by their Dependencies lines. No one-to-one run.

Source independence: 17 passages compared with 4 sources (nt21, nt21b, nt26, ct17), none shared beyond standard phrases; largest share nt21, 92 of 259 source references; contents compared with nt21: independent.

## Not verifiable

- kl87, bbm82, kw09: settled as uncertified; not read.
- th24, at20, ct15, bk05, con99, chen14, moe07, kv12, dm18, ls20, wes04 were not reopened this
  round: no sampled target rests on their text beyond a citation (con99 Theorem 3.4.2 and moe07
  §§5.4, 5.5, 5.7 were read only as nt21 cites them). Rounds 2–9 record their checks.
- The sections outside the sample and outside the repairs were not reread in full; for them this
  review relies on the computed rows of rounds 2–9.
- §4.2, third Check (the sign is `+1` in the stable case): nt21 does not state it. The Kottwitz sign
  of the compact form was computed (`q(U(k + 1, k)) = k(k + 1)`, even, so `+1`), but the sign of the
  Whittaker-normalised twisted trace on the base change side was not derived from a text.
- nt26 proof of Proposition 6.1, p. 47 (the identity for `χ`): the extraction drops overlines, so
  whether the printed identity is residual, as the README's §13.7 requires, could not be read off.

## Source issues

- **Misprint** in nt21 at Theorem 4.1, item (4), p. 60: the source says the block size called `n_2` is `2` on `T_2` and `n − 2` on `T_3`; it should be `n_1`, the size of the cuspidal block, as in the hypotheses on p. 60; affects nothing.
- **Error** in nt21 at Proposition 7.4, proof, p. 88: the source says the rank-two twist of the base change of `τ` by `ω_1 ω_0^{n−1}` meets the hypotheses of Theorem 4.1; it should be conjugate self-dual, but differs from its polarized dual by the quadratic character of `K/ℚ`; affects the proof.
- **Misprint** in nt26 at Corollary 6.2, item (2), p. 49: the source says the `p`-adic places at which `π′` is Steinberg are places of `F`; it should be places of `E`, where `π′` lives; affects nothing.
- **Misprint** in nt26 at Proposition 6.1, proof, p. 47: the source says the auxiliary prime `t` is prime to the conductor of `π`; it should be prime to the conductor of `π_a`, the representation whose level is raised modulo `t`; affects nothing.

## For the human reviewers

- Ownership: SmoothRepresentationsOfLocalGroupsPartII (open; its §§7.1, 7.4) states the Kazhdan–Lusztig classification without citing §4.9 here, while README "Downstream consumers" says it consumes §4.9; the edit belongs to that roadmap.
- Arrangement: Layers 11, 12, 13 correspond to nt26 §3, §4, §§5–6 (the last merged with th24 §7); §13.4's *Needs* force 13 after 11 and 12, and 11, 12 are independent of each other.
- Licence: ct17, ct15, bk05, con99 were read from authors' pages (`sources.toml`, `licence_class = "author-page"`); kl87, bbm82, kw09 are cited by locator only.
- Scope: nt26 is cited by arXiv v2 pages with the venue "Ann. of Math. 203 (2026)"; the published pagination was not compared.
- Scope: README §7.4 and "Scope and ownership" record that the printed proof of nt21 Proposition 7.4 fails for its rank-two block; this review recomputed the defect (`packages/ModularityAndLanglandsExtensionsPartII/README.md:108–116`); no published correction was searched for.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "02c1f076a95f776b179817f44a4d2628149f62c8", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~10", "model": "fable", "worker": "chris-x89"} -->
