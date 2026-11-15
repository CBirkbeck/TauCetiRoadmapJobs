<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6902351327 -->
Review (claude) of eee0a12

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §1.1: the third Check claims classicality that the theorem does not give

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:783–784` (§1.1, third
     Check): "Taking `𝒞` to be the component itself and `z_2` any of its classical points recovers
     hypothesis (2) at that point; the content is the passage to non-classical points."
   - **Claim:** at every classical point `z′_2` of `𝒞`, the conclusion gives a refined automorphic
     `(π′_n, χ′_n)` with `(σ_n ∘ i_2)(z′_2) = i_n(γ_n(π′_n, χ′_n))`.
   - **Witness:** the conclusion only puts `(σ_n ∘ i_2)(z′_2)` in `i_n(ℰ_n(τ̄_n))`. §1.4 of the same
     README needs non-critical triangulations and `n`-regularity of `χ′_2` (or ordinarity) to make that
     point classical; nt21 line 1966 notes `δ_n` need not be numerically non-critical.
   - **Repair:** replace the bullet by: "At `z_2` itself the conclusion is hypothesis (2). At another
     classical point `z′_2` of `𝒞` it gives only a point of `ℰ_n(τ̄_n)` with Galois pseudocharacter
     `Sym^{n−1}` of that of `z′_2`; that this point is classical, hence automorphic, is not part of the
     statement and needs the further hypotheses of §1.4 (for `n = 3`, a point `z′_2` with Frobenius
     ratio `−1` is not covered)." Tested on the witness: it now agrees with §1.4 and its second Check.

2. **F02** (P3) §5.5: the third Check says `μ μ^c = 1` "is not required", but it always holds

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md` §5.5, third Check:
     "`μ^2` restricted to `𝔸_F^×` is trivial, and `μ μ^c = 1` on `𝔸_E^×` is not required."
   - **Claim:** a character with the two stated properties need not satisfy `μ μ^c = 1`.
   - **Witness:** for `x ∈ 𝔸_E^×`, `μ(x) μ(c x) = μ(N_{E/F} x) = ε_{E/F}(N_{E/F} x) = 1`, since
     `μ|_{𝔸_F^×} = ε_{E/F}` is trivial on norms. At a complex place, `(z/|z|)(z̄/|z|) = 1`. So every
     `μ` of the statement is conjugate self-dual.
   - **Repair:** replace the bullet by: "`μ²` restricted to `𝔸_F^×` is trivial, and `μ μ^c = 1` on
     `𝔸_E^×` follows: `μ(x) μ(c x) = ε_{E/F}(N_{E/F} x) = 1`; at a complex place
     `(z/|z|)(z̄/|z|) = 1`. A character with `μ|_{𝔸_F^×} = 1` instead (conjugate-orthogonal) also
     satisfies `μ μ^c = 1`, so that identity does not distinguish the two; the restriction to `𝔸_F^×`
     does." Tested on the witness above.

3. **F03** (P3) three page locators

   Read against the page markers of the cached texts.

   - **§12.6, README:4515:** "Proposition 4.9, p. 35". Items (5)–(7) of the proposition (the free
     torus action, `δ`, the lifts to both modules), which the target states, are on p. 36 (nt26 lines
     1665–1672, after the page marker at line 1663). Repair: "pp. 35–36".
   - **§12.7, README:4547:** "proof and component argument, pp. 34–37". The proof ends at nt26 line
     1706; the marker of p. 37 is line 1707. Repair: "pp. 34–36".
   - **§9.1, README:3247:** "reductions (6)–(11), pp. 5–6". The reduction paragraph and all of
     (6)–(11) are on p. 6 (nt21b lines 239–255, after the marker at line 237). Repair: "p. 6".

   The first is the pattern of round 8's F02 (a range one page short); the other two overshoot by a
   page. The other sampled locators are right (table below).

4. **F04** (P3) the summary table omits §14.5 from Layer 14

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:46`: "holomorphy of
     `L(s, Sym^n f)` in level one".
   - **Claim:** Layer 14 ends with the level-one holomorphy statement.
   - **Witness:** Layer 14 also has §14.5 (non-CM newforms of weight `≥ 2`, away from the level), one
     of the two statements of `Suggested.lean`; the Summary paragraph above the table names both.
   - **Repair:** end the row with "holomorphy of `L(s, Sym^n f)` in level one and, away from the level,
     for non-CM newforms of weight at least `2`".

Four findings, all P3, none blocking. Both repairs of round 8 are present and correct.
`Suggested.lean` elaborates with `sorry` as its only warning and is not padded. The fifteen sampled
targets agree with their sources in statement and hypotheses. What remains is two Checks that say
something inaccurate about their object, three page locators, and one row of the summary table. No
package file was changed by this review.

## Verified sound

### Round-8 findings, checked first

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P3) | repaired | §13.8, last Check: "lies between `SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})` for a finite field `k ⊇ 𝔽_{p^b}` … whose proof writes the upper bound as `k^× SL_2(𝔽_{p^b})`, valid only in the `PSL_2` case". Recomputed (rows below). The pattern `k^× SL_2` occurs nowhere else in the README. |
| F02 (P3) | repaired | §8.1: "(nt21 Lemma 8.4 and proof, pp. 95–96)"; §4.1: "(nt21, Notation, pp. 7–8; §1, standard assumptions and the pure inner twist, pp. 8–10)". The same pattern recurs once in a section round 8 did not sample: R03, first item. |

### Source sample (15 targets, each read at the lines given)

| Target | Text read | Outcome |
|---|---|---|
| §1.1 | nt21 lines 1928–2017 (Definition 2.23, Theorem 2.24 and proof, Remark 2.25, pp. 40–42) | hypotheses (1)–(3), conclusion and route agree; third Check is R01 |
| §4.3 | nt21 lines 630–706 (§1.8, Propositions 1.9–1.11, pp. 14–15) | sign criterion (`m_j` even), `esc`, `BC`, finite fibres, character identity agree |
| §4.6 | nt21 lines 816–853 (Proposition 1.16, pp. 18–19); kv12 lines 471–477 (Theorem 2.2.5, Remark 2.2.6(a)) | agrees; nt21 cites the published number 2.2.6, the README the arXiv number, as its References say |
| §5.5 | ct17 lines 1129–1144 (Lemma 3.4 and proof, pp. 21–22) | agrees; third Check is R02 |
| §6.4 | nt21 lines 3713–3761 (hypotheses (1)–(5), Theorem 6.1, pp. 75–76), 4019–4037 (end of proof, p. 82) | `n ≥ 3` odd, `p > 2n`, (1)–(5)(a)–(d), conclusions (1)–(3) agree |
| §9.1 | nt21b lines 211–261 (setting, Theorem 2.1, reductions, pp. 5–6) | agrees; page of the reductions R03 |
| §9.2 | nt21b lines 308–336 (Lemma 2.2 and proof, p. 7; `P → R`, p. 8) | agrees; the quotient is of `L` onto `A²`, as the README says |
| §10.3 | nt21b lines 1054–1067 (Definition 3.6, p. 23) | conditions (1)–(5) agree |
| §11.8 | nt26 lines 1060–1067 (Proposition 3.12, p. 23), 1110–1122 (Proposition 3.13, p. 24) | agree |
| §11.9 | nt26 lines 1093–1108 (diagram, p. 24), 1123–1141 (Proposition 3.14 and proof, p. 24) | agree |
| §12.4 | nt26 lines 1356–1385 (Taylor–Wiles datum, `P_Q`), 1460–1546 (pp. 31–33) | levels, `Δ′_Q`, Lemma 4.5, Proposition 4.6 agree; the README's correction of the printed generator is right (Source issues) |
| §12.6 | nt26 lines 1586–1610 (Proposition 4.8, p. 34), 1643–1672 (Proposition 4.9, pp. 35–36) | agree; page R03 |
| §12.7 | nt26 lines 1183–1202 (Theorem 4.1, pp. 25–26), 1611–1706 (proof, pp. 34–36) | hypotheses (1)–(9) agree; page R03 |
| §13.3 | nt26 lines 1875–1971 (Lemmas 5.6, 5.7 and proof, pp. 40–42) | agrees; the two supplements the README adds (irreducibility over `F(ζ_t)`, `v_1 ∤ p`) are indeed absent from the printed proof |
| §14.3 | nt21b lines 34–36 (Theorem A, p. 1), 913–914 (Theorem 3.1, p. 20); nt26 lines 2335–2340 (Theorem 6.4, p. 50) | agree |

No locator is flagged by the author as unverified.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §13.8 repaired sandwich | `H = {det = ±1} ⊂ GL_2(𝔽_q)`, `q = 7^a`, `a` odd | `|H| = 2q(q² − 1)`, scalars `±1`, projective order `q(q² − 1) = |PGL_2(𝔽_q)|`; `H ⊂ 𝔽_q^× GL_2(𝔽_q)`; `[H, H] = SL_2(𝔽_q)` | new form holds |
| §13.8 "no sandwich with `k^× SL_2`" | `b ≤ a` | `7^b(7^{2b} − 1)/2 ≤ q(q² − 1)/2 < q(q² − 1)` | holds |
| §13.8 `r̄(G_{F(ζ_7)}) = H` for `det r̄ = ε̄^{−1}χ̄` | `χ̄ = 1`; `χ̄` non-trivial on `G_{F(ζ_7)}` | index `≤ 2` in `H`, contains `[H, H] = SL_2(𝔽_q)`; determinant `1` resp. onto `{±1}`: image `SL_2(𝔽_q)` resp. `H` | both cases as stated |
| §13.8 no `p`-power quotient | `k^× GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b})` | `[λg, μh] = [g, h] ∈ SL_2`; order divides `(|k| − 1)(p^b − 1)`; for `H`: quotient `{±1}`, `7 ∤ 2` | trivial |
| §13.8 over the CM extension | `K(ζ_p)/F` abelian of degree `≤ 2(p − 1)` | image contains `[r̄(G_F), r̄(G_F)] ⊇ SL_2(𝔽_{p^a})`; `2(p − 1) < 2p`; a character twist leaves the commutator subgroup unchanged | "applies unchanged" holds |
| §13.8 auxiliary place | `ε̄(σ) = −1`, `(α/β)^i ≠ −1` | eigenvalues `−(α/β)^j`, `|j| ≤ p + r − 1`; `j = 0`: `−1 ≠ 1` | `H⁰ = 0` |
| §13.8 hypothesis (3) of §6.9 | `p = 5`, `a = 3` | `t` of order `124`, `t²` of order `62 > p + r − 1 ≤ 8` | element exists |
| §1.1 Check 1 | `n = 3` | `(α/β)^i ≠ 1`, `i = 1, 2` iff `α ≠ ±β` | sound |
| §1.1 Check 3 (R01) | classical `z′_2 ≠ z_2` | conclusion: point of `ℰ_n`; §1.4 needs four more conditions for classicality | overclaim |
| §4.3 Checks | `n = 2`, `σ ⊕ σ′` of sign `(−1)^n = +1` | `m_j = 1`, odd: no extension; `n = 1`: `z ↦ χ(z/c(z))`, trivial to trivial | sound |
| §4.6 Check | `n = 3`, `q = 3` | characteristic `3 > 3` false; Coxeter number of type `A_{n−1}` is `n` | sound |
| §5.5 Checks | `x ∈ ℝ^×`; `μ μ^c` | `x/|x| = sign(x)`; `μ(x)μ(cx) = ε_{E/F}(N x) = 1`, `(z/|z|)(z̄/|z|) = 1` | Check 2 sound; Check 3 is R02 |
| §6.4 Check | `n = 3` | `p > 6` so `p ≥ 7`; `3·2/2 + 1 = 4`; `n − 2 = 1` | sound |
| §9.1 Check | `n = 2`, `10` | `max(5, 3) = 5`: `7 > 5`, `5 ≯ 5`; `max(5, 19) = 19`: `23, 25 > 19`, `19 ≯ 19` | sound |
| §9.2 Checks | `1 ⊕ ε^{−1}` and its dual; `n = 3` | `Sym²`: `{0, 1, 2}` against `{0, −1, −2}`; `2 ≤ p − 2` iff `p ≥ 5` | sound |
| §10.3 Checks | `n = 3` | `8·3·2 = 48`; `49 = 7²`, `51 = 3·17`, `53` prime; `3·53 − 1 = 158` even, `4·53 − 1 = 211` prime | sound |
| §12.4 Checks | `r = 1`, `α = 2`, `β = 3`, `γ_1 = 5` | `η = (10, 15)`, `η_1η_2 = 150 = αβγ_1²`; printed formula gives `αβγ_1 = 30`; `q^{2(1−2)/2} = q^{−1}`; `C_2 × C_2` of order `4` against `2` | sound; correction right |
| §12.6 Checks | `n = 2r`; `q = 3 = |S ∪ S_∞|`; `q = 0` | `nq − q = (n − 1)q`; `γ = 2`; `γ = −1` | sound |
| §12.7 Check | weights `{0,1}` with `{0, 2, …, 2r − 2}` and with `{0, …, r − 1}` | `{0, …, 2r − 1}` distinct; `1 = 0 + 1 = 1 + 0` repeats for `r ≥ 2` | sound |
| §13.3 | element of order `t` in `PGL_2(𝔽_q)`, `t ≠ l` | `t ∣ q ± 1`, so `q ≥ t − 1 > 4r + 1`; `r = 2`: `Std ⊗ Std` on diagonal `SL_2` is `Sym² ⊕ 1` | sound |
| §14.3 headline | `n = 1, 2` | `Sym⁰` trivial, `Sym¹ = π` | sound |
| §14.4 headline | `n = 0`; `n = 1`; `Δ`, `p = 2` | `ζ(s)`; region `(k + 1)/2`; `(−24)² − 2^{11} = −1472`; `e_2 = αβ·e_1`, `e_3 = (αβ)³` | `1 ≤ n` needed; sound |
| §14.5 headline | `M = 0`; level `32` CM form, `n = 4`; `Δ`, `ψ = χ_{−4}`; weight one | `Nat.Coprime p 0` iff `p = 1`; `a_5 = 5 + 1 − 8 = −2`, `α²β² = p²` gives `ζ(s − 2)` and a pole at `3 = 4·1/2 + 1`; `252·(−1) ≠ 252`; pole at `1` | hypotheses needed; sound |
| `HasQuadraticSelfTwist` against nebentypus | `f` with character `χ_f`, twist by quadratic `ψ` | character of `f ⊗ ψ` is `χ_f ψ² = χ_f`; strong multiplicity one applies | predicate is the non-CM condition for `k ≥ 2` |

### Lean acceptance test

- `lake env lean` on `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` from the
  content checkout: exit 0; output is two "declaration uses `sorry`" warnings (lines 98, 117). No
  `TauCeti.*` module needed building. Header: Mathlib and the one Tau Ceti module used, in the form
  53 roadmaps on main use. No `set_option`, `lemma`, `#eval`, sorry'd data.
- Signatures: the four elaborated types of the worker's list were compared with README §§14.4–14.5;
  `1 ≤ n`, the Satake hypotheses, `[NeZero N]`, `2 ≤ k`, `¬HasQuadraticSelfTwist f` and the product
  over `p ∤ N` are all present. The file is unchanged since round 8.
- One-tactic probe on both sorried theorems with `simp`, `rfl`, `infer_instance`, `trivial`,
  `simp [symPowerEulerFactor]`, `aesop` and the constant-zero witness
  `exact ⟨fun _ => 0, differentiable_const _, by simp⟩`: all fourteen attempts fail. No padding. The
  one proved `example` is the symmetry of the kept definition.
- Pinned declarations opened: `HeckeRing.GL2.Newform`
  (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`; it carries a nebentypus, newness
  and `a_1 = 1`), `satakeParameters` (`…/Newforms/Satake.lean:91`, roots of
  `X² − a_p X + χ(p)p^{k−1}`), `exists_satakeParameters_eq_pair` (line 117),
  `prod_map_one_sub_mul_satakeParameters` (line 161),
  `LSeries_eulerProduct_hasProd_satakeParameters` (line 191),
  `CuspForm.hasEntireExtension_qExpansion_coeff` (`…/LFunction/Basic.lean`),
  `UpperHalfPlane.qExpansion` (`Mathlib/NumberTheory/ModularForms/QExpansion.lean:172`),
  `DirichletCharacter.changeLevel_injective` (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:79`),
  `ZMod.unitsMap` (`Mathlib/Data/ZMod/Units.lean:29`), `ZMod.χ₄`
  (`Mathlib/NumberTheory/LegendreSymbol/ZModChar.lean:42`),
  `Nat.multiplicity_pow_two_sub_one` (`Mathlib/NumberTheory/Multiplicity.lean:359`); and by `#check`
  in a scratch file (no error): `DirichletCharacter.changeLevel_eq_one_iff`,
  `changeLevel_eq_cast_of_dvd'`, `NumberField.abs_discr_gt_two`,
  `Nat.exists_prime_lt_and_le_two_mul`, `Polynomial.discr`, `MulChar.map_nonunit`.
- Headlines: §§2.4, 3.8, 5.4, 5.10, 6.4, 6.7–6.9, 7.5–7.7, 8.3, 9.8, 11.10, 12.7, 13.5, 13.6, 13.10,
  14.1–14.3 are named in the module docstring with the missing carrier; §§14.4–14.5 are stated. No
  statable headline is absent. The four backticked names of the roadmap's own are declared.

### Suppliers, order, gaps, overlaps

- Dependency check output: `depcheck: 240 roadmaps, 2282 edges, 0 problem(s)`; no UPWARD, CYCLE or
  `moved:` line.
- `roadmaps resolve` leads: none. Headings opened at their heads this round (all present as cited):
  PotentialAutomorphyInfrastructurePartII §§0.9, 0.10, 0.11, 1.4, 3.2, 3.4, 3.5, 4.6, 7.11, 7.13,
  7.15, 7.19, 8.9, 8.15, 8.16, 9.1, 9.2, 9.4, 9.7 (by their quoted titles);
  EndoscopicTransferAndUnitaryTraceComparison §§2.11, 6.24, 6.29, 11.2, 13.5;
  ModularityAndLanglandsExtensions §§1.7, 2.16, 3.12, 3.15, 4.2, 4.13, 4.29–4.37;
  ArithmeticGaloisRepresentations §§4.4, 7.1, 7.6, 7.8, 7.9, 7.10;
  GL2AutomorphicRepresentationsAndTransfer §§R16.1.7, R16.3.7, R16.4.4, R16.4.6;
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.40, R07.4.20, R07.5.11; PadicFamilies §2a.14;
  PotentialModularityAndCompatibleSystems §10.10; AutomorphicGaloisRepresentations §§7.4, 7.5;
  AutomorphicGaloisRepresentationsPartII AG2.6; AutomorphicLFunctionsAndLocalFactors AL.2, AL.3.7.1;
  LocalGaloisDeformationRings §8.14; GlobalGaloisDeformations §4.11;
  DeformationAndDerivedPatchingAlgebra §5.6; SerreWeightAndLevelOptimisation §6.9;
  SmoothRepresentationsOfLocalGroups SR.1.5, SR.3; ClassicalSerreModularity R27.1; ClassFieldTheory
  Layer 11; Chebotarev Layer 10 (a completed roadmap on main).
- Gaps: 14 slugs; each README contract line equals the `needs` of `design/plan.json` (compared by
  script), each with a named supplier earlier in the order or on main. None vague, none asking for
  what is provided.
- Shape: 110 numbered targets, 110 `*Needs:*` lines, 110 Checks blocks; 15 layers with Examples and
  Dependencies; a scan for LaTeX delimiters, pull-request numbers, machine paths, HTML and process
  words finds none. All 18 cited works are in the manifest (15 certified, 3 uncertified).
- Duplication by object: `roadmaps grep` finds `symPowerEulerFactor` and a quadratic-self-twist
  predicate in no other Lean file, on main or open; "seasoned" and "Buzzard–Kilford" occur only in
  ModularityAndLanglandsExtensions (statements, proved here); "twin involution" nowhere else.
- Kazhdan–Lusztig classification: settled in round 4 as not actionable here; not re-raised.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined
  only by an open revision, no second copy.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems, GL2ModularityLifting (open), SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants, ModularForms (main); statements of symmetric power functoriality and of its steps: ModularityAndLanglandsExtensions, proofs here; residually reducible finiteness and its auxiliary-place variants: PotentialAutomorphyInfrastructurePartII; Chenevier determinants: IntegralHeckeAndGaloisDeterminants; newforms and Satake parameters: Tau Ceti, as ModularForms records; Iwahori–Matsumoto presentation: SmoothRepresentationsOfLocalGroups; Kazhdan–Lusztig classification: this roadmap §4.9.

### Copyright, wording and arrangement

Eighteen passages were set beside the sources: the fifteen sampled targets, the repaired Check of
§13.8 (th24 Lemma 7.3 as read in round 8) and the two theorem docstrings. The hypothesis lists of
§§6.4, 9.1, 10.3 and 12.7 keep the source's items, which the mathematics forces; the sentences and
the proof sketches are the roadmap's own, and no run of shared words beyond standard phrases ("an
unramified twist of the Steinberg representation") was found. No table, figure or list of examples
is taken over. Contents of nt21 (§1 unitary groups, §2 eigenvarieties, §3 ping-pong, §4 and §6 level
raising, §5 finiteness, §7 level one, §8 higher levels) against Layers 0–8: §2 is split over Layers
0–2, §1 comes after §3 and is merged with ct17 §§2–3, §4 with ct17 §4, §6 with ct17 §5 and th24 §6,
§5 is left to a supplier; the order of Layers 4–8 is forced by their Dependencies lines. No
one-to-one run.

Source independence: 18 passages compared with 5 sources (nt21, nt21b, nt26, ct17, kv12), none shared beyond standard phrases; largest share nt21, 92 of 259 source references; contents compared with nt21: independent.

## Not verifiable

- kl87, bbm82, kw09: settled as uncertified; not read.
- th24, at20, ct15, bk05, con99, chen14, moe07, dm18, ls20, wes04 were not reopened this round: no
  sampled target rests on their text beyond a citation, and round 8 read th24 §7 for the passage the
  repair changed. Rounds 2–8 record their checks.
- The sections outside the sample and outside the repairs were not reread in full; for them this
  review relies on the computed rows of rounds 2–8.
- Whether a Hilbert modular form with the residual image of the `PGL_2` instance of §13.8 exists was
  not decided; the Check needs only the group-theoretic statement.

## Source issues

- **Misprint** in nt26 at §4, definition of the maximal ideal `𝔪_{G,Q}`, p. 32: the source says the generator for `r + 1 ≤ i ≤ n` has the product of `γ_{v,j}` over `j ≤ i − r` only; it should also carry the product over `j ≤ r`, the first `i` of the characters `χ_{v,j}` of p. 30; affects nothing.
- **Error** in th24 at Lemma 7.3, proof, p. 43: the source says a finite group containing `SL_2(𝔽_{p^b})` with projective image `PSL_2` or `PGL_2(𝔽_{p^b})` lies in `k^× SL_2(𝔽_{p^b})`; it should be `k^× GL_2(𝔽_{p^b})` in the `PGL_2` case; affects nothing.
- **Gap** in nt26 at Lemma 5.7, proof, pp. 41–42: the source says the residual tensors are irreducible over `F` and takes `v_1 ∤ t`; it should give irreducibility over `F(ζ_t)` and `v_1 ∤ p`, which the later steps use; affects the proof.

## For the human reviewers

- Ownership: SmoothRepresentationsOfLocalGroupsPartII (open; its §§7.1, 7.3) states the Kazhdan–Lusztig classification without citing §4.9 here, while README "Downstream consumers" says it consumes §4.9; the edit belongs to that roadmap.
- Arrangement: Layers 11, 12, 13 correspond to nt26 §3, §4, §§5–6 (the last merged with th24 §7); §13.4's *Needs* force 13 after 11 and 12, and 11, 12 are independent of each other.
- Licence: ct17, ct15, bk05, con99 were read from authors' pages (`sources.toml`, `licence_class = "author-page"`); kl87, bbm82, kw09 are cited by locator only.
- Scope: nt26 is cited by arXiv v2 pages with the venue "Ann. of Math. 203 (2026)"; the published pagination was not compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "eee0a12e4600516a69f1ece32d03491ed09f4bf7", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~9", "model": "fable", "worker": "chris-x89"} -->
