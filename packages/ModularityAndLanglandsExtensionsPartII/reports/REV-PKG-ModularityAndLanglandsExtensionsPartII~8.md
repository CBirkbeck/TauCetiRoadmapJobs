<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13054#issuecomment-6901603589 -->
Review (claude) of 9734b6e

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §13.8: the cyclotomic Check places the image in `k^× SL_2(𝔽_{p^b})`, which fails for `PGL_2`-type images

   - **Location:** `packages/ModularityAndLanglandsExtensionsPartII/README.md:4934–4939` (§13.8, last
     Check): "contains a conjugate of `SL_2(𝔽_{p^a})` and lies between `SL_2(𝔽_{p^b})` and
     `k^× SL_2(𝔽_{p^b})` for some `b ≥ a` … is then a quotient of a subgroup of `k^×/{±1}`".
   - **Claim:** every subgroup of `GL_2(k)` containing a conjugate of `SL_2(𝔽_{p^a})` lies in
     `k^× SL_2(𝔽_{p^b})`.
   - **Witness:** `H = {g ∈ GL_2(𝔽_{7^a}) : det g = ±1}`, `a` odd (the group the preceding Check of §13.8
     uses). Its projective image is `PGL_2(𝔽_{7^a})`, of order `q(q² − 1)`, `q = 7^a`; that of
     `k^× SL_2(𝔽_{7^b})` is `PSL_2(𝔽_{7^b})`, of order `7^b(7^{2b} − 1)/2`. Containment both ways forces
     `b = a` and then the orders differ by `2`. The slip is in th24 lines 1896–1900 (proof of Lemma 7.3, p. 43).
     It occurs for `r̄(G_{F(ζ_p)})` when `det r̄ = ε̄^{−1}χ̄` with `χ̄` quadratic and not cyclotomic.
   - **Repair:** replace the two clauses by: "…and lies between `SL_2(𝔽_{p^b})` and `k^× GL_2(𝔽_{p^b})` for
     some `b ≥ a`, its projective image being `PSL_2(𝔽_{p^b})` or `PGL_2(𝔽_{p^b})`
     (ArithmeticGaloisRepresentations §§4.4, 7.9; th24 Lemma 7.3(3), pp. 42–43, whose proof prints the
     sandwich with `k^× SL_2(𝔽_{p^b})`, valid only in the first case). A quotient of `p`-power order kills
     the perfect group `SL_2(𝔽_{p^b})` and is then a quotient of a subgroup of
     `k^× GL_2(𝔽_{p^b})/SL_2(𝔽_{p^b})`, an abelian group of order dividing `(|k| − 1)(p^b − 1)`, prime to
     `p`, hence trivial." Tested on the witness: `H/SL_2(𝔽_{7^a}) ≅ {±1}`, of order `2`, prime to `7`; the
     conclusion of the Check (no nontrivial quotient of `7`-power order) holds, and the rest of the Check
     is unchanged.

2. **F02** (P3) three page locators

   - **§8.1, README:3128:** "(nt21 Lemma 8.4 and proof, p. 95)". The proof ends on p. 96 (nt21 line 4662
     is the page marker; lines 4663–4665 are its last sentence, which the sketch's principal-series case
     uses). Repair: "pp. 95–96".
   - **§4.1, README:1435–1436:** "(nt21, Notation, pp. 8–9; §1, standard assumptions and the pure inner
     twist, pp. 9–10)". `Φ_n` and `θ_n` are defined at nt21 lines 327–338, on p. 7, and `U_n`, its pinning,
     `L`-group and Levi subgroups on p. 8 (lines 341–371); nothing of the Notation is on p. 9. §1 and the
     list of standard assumptions start on p. 8 (lines 372–385); the data are on p. 9 and the base-change
     compatibility on p. 10. Repair: "(nt21, Notation, pp. 7–8; §1, standard assumptions and the pure
     inner twist, pp. 8–10)". The earlier locator of the same section, "the data fixed under the standard
     assumptions, p. 9", is correct.

   Both are the pattern of round 7's F03 (a range one page short). The other single-page proof locators
   were checked and are right: nt21 Lemma 3.3 (p. 54), Lemma 3.6 (p. 56), nt26 Proposition 3.14 (p. 24),
   th24 Theorem 7.5 (p. 44, proof p. 45).

Two findings, both P3, none blocking. All five repairs of round 7 are present and correct; the new
supplier gap is precise and declared in both places. `Suggested.lean` elaborates with `sorry` as its
only warning and is not padded. The fifteen sampled targets agree with their sources. What remains is
one inaccurate step inside a Check that the last repair added to §13.8 (taken over from a slip in the
source), and three page locators. No package file was changed by this review.

## Verified sound

### Round-7 findings, checked first

| Id | Status | Repaired passage (quoted) and check |
|---|---|---|
| F01 (P1) | repaired | §13.8: "(PotentialAutomorphyInfrastructurePartII, gap:auxiliary-place-reducible-lifting, which is th24 Theorem 7.5; the form of ModularityAndLanglandsExtensions §4.2 does not apply…)"; contract line and `design/plan.json` entry identical (script). th24 lines 1965–1998 read: hypothesis (7) has the place `w` and "no quotient of order `p`" for `ρ̄(G_F)`; the gap's hypothesis on `G_{F(ζ_l)}` implies it (index prime to `l`). Supplier §8.16 and parent §4.2 opened at their heads. One step of the added Check is R01. |
| F02 (P3) | repaired | §6.2: "the level at `v` is Iwahori, as for the unipotent ring (nt21 §6, p. 79), so forms unramified at `v` contribute to `𝕋_D`, and their Galois representations need not be points of `R^{St}_v`"; the instance agrees with the Check of §6.3 (README:2601–2606). |
| F03 (P3) | repaired | §3.3 "writes `z ∈ X_{i′}`; the twin `z′` is meant" (nt21 line 2657 reread); §5.2 "pp. 61–62"; §9.4 "pp. 10–11"; §13.8 "pp. 49–50" (nt26 page marker at line 2327 inside the proof); §14.2 "Theorem 8.1, p. 91". The pattern recurs twice more: R02. |
| F04 (P3) | repaired | §12.6: "Since `q ≥ |S ∪ S_∞|`, `γ ≥ 2`: for `q = |S ∪ S_∞| = 3`, `γ = 2 − 3 + 3 = 2`…". Recomputed; `γ = 0` remains only in §9.6, where nt21b line 789 has `q ≥ |S ∪ S_∞| − 2`. |
| F05 (P3) | repaired | Contract: "§3.2 (supersingular residual local form: `a_p = 0` gives an irreducible local residual representation)". A scan for bracketed keys and author-plus-theorem citations finds only the 18 manifest works. |

### Source sample (15 targets, each read at the lines given)

| Target | Text read | Outcome |
|---|---|---|
| §0.2 | nt21 lines 1432–1488 (§2.11.1, Lemma 2.13, pp. 30–31) | polarization `τ∘c = τ^∨ ⊗ ε^{1−n}`, Azumaya algebra, Henselian splitting agree |
| §1.4 | nt21 lines 2088–2125 (Corollary 2.28, pp. 43–44) | conditions (1)–(5) and (1ord)–(4ord) agree; `n ≥ 3` is the README's restriction |
| §2.4 | nt21 lines 2448–2536 (Theorem 2.33 and proof, pp. 50–51) | both sets of conditions and the route (con99 twice, Labesse descent, soluble descent) agree |
| §3.7 | nt21 lines 2745–2782 (Lemma 3.7, pp. 56–57) | six conclusions, `m_π`, `k′`, `i′` agree |
| §4.1 | nt21 lines 327–445 (Notation, §1, pp. 7–10) | `Φ_n`, `θ_n`, twist, cocycle (odd and even `n`), `μ`, `ι_v`, `ι_w` agree; pages R02 |
| §5.1 | nt21 lines 2921–2954, 3017–3030 (pp. 59–60, 62) | (1)–(3)(a)–(d), orders `6`, `2`, `n − 2`, level and types agree |
| §5.4 | nt21 lines 2955–2967 (Theorem 4.1, Remark 4.2, p. 60), 3196–3212 (p. 65) | agrees; the printed `n_2` in item (4) is as the README says |
| §5.6 | ct17 lines 1478–1513 (Theorem 3.8, Remark 3.9, pp. 28–29), Theorem 3.10 (pp. 31–32) | counts `4^{s+1}/2`, `4^{s+1}`, `2^s`, `2^{s+1}` and hypotheses (a)–(c) agree |
| §7.3 | nt21 lines 4124–4160 (Corollary 7.3, pp. 84–85) | four conclusions and the route agree; the rank-`n` hypothesis is the README's |
| §8.1 | nt21 lines 4640–4665 (Lemma 8.4, pp. 95–96) | agrees; page R02 |
| §9.7 | nt21b lines 572–620 (pp. 12–13), 785–862 (pp. 17–18) | dimensions `q + 4|S ∪ S_∞|` and `− 1`, both cases agree |
| §11.8 | nt26 lines 1060–1067 (Proposition 3.12, p. 23), 1110–1122 (Proposition 3.13, p. 24) | agree |
| §12.5 | nt26 lines 1547–1580 (Lemma 4.7, pp. 33–34) | agrees |
| §13.10 | nt26 lines 2296–2310 (Corollary 6.2), 2335–2340 (Theorem 6.4, p. 50) | agrees; `SP_{r−1}` at `r = 1` is as the README says |
| §14.3 | nt21b lines 34–36 (Theorem A, p. 1), 913–914 (Theorem 3.1, p. 20) | agree |

Read in addition for the repairs: th24 lines 1855–2086 (Theorem 7.1, Corollary 7.2, Lemma 7.3,
Proposition 7.4, Theorems 7.5, 7.6 with proofs); nt26 lines 2311–2334 (Proposition 6.3). No locator
is flagged by the author as unverified.

### Adversarial table (values computed this round)

| Statement | Instances | Values on each side | Result |
|---|---|---|---|
| §13.8 auxiliary place | `ε̄(σ) = −1`, ratio `α/β` of order `> 2(p + r − 1)` | eigenvalues on `ad(Sym^{p+r−1} r̄)(1)`: `−(α/β)^j`, `|j| ≤ p + r − 1`; `j = 0`: `−1 ≠ 1`; `(α/β)^j = −1` forces order `∣ 2|j|` | `H⁰ = 0` |
| §13.8 existence of `σ` | `g = diag(1, −1)`, `h = diag(x, x^{−1})` | ratio of `gh` is `−x²`; orders reach `(q − 1)/2` (`q ≡ 1 mod 4`) or `q − 1`; `q ≥ 5³`: `62 > 4p − 4 = 16` | ratio exists |
| §13.8 negative control | `p = 7`, `a` odd, image `{det = ±1}` | `7^a ≡ 3 mod 4`, `λ² = −1` insoluble, scalars `±1` of determinant `1`, `ε̄ = 1` on `ker ad r̄`; projective image of index `2` over `PSL_2` | clause of §4.2 fails |
| §13.8 kernel equality | `r̄(σ) = diag(α, β)`; `α(1 + N)` | scalar value forces `α^p = β^p`, so `α = β`; then `φ_p(1 + N) ⊗ 1` not scalar | holds |
| §13.8 cyclotomic Check (R01) | `H = {det = ±1} ⊂ GL_2(𝔽_{7^a})` | `|PGL_2(𝔽_q)| = q(q² − 1)` against `|PSL_2(𝔽_{7^b})| = 7^b(7^{2b} − 1)/2`; `H/SL_2 = {±1}` | sandwich false, conclusion true |
| Gap hypotheses in §13.8 | `p ≥ 5`, `0 < r < p` | `p ∤ p + r`; ranks `p − r = 2r` only for `p = 3r`, excluded; `G_{F(ζ_l)}`-form implies th24's "no quotient of order `p`" | gap applies |
| §6.2 Check | `n = 3`, `p = 5`, `q_v = 11` | `11 ≡ 1 mod 5`; Frobenius `1`: ratios `1 ≠ 11` | sound |
| §12.6 Checks | `q = |S ∪ S_∞| = 3`; `q = 0`; `n = 2` | `γ = 2`; `γ = −1`; `nq − q = q` | sound |
| §0.2 Checks | `p = 3`, `C_5` | `Hom(ℤ_3^× × ℤ̂, C_5)`: `5`; `Hom(ℤ_3^× × ℤ_3, C_5)`: `1`; pro-`3` quotient `ℤ_3²` | sound |
| §1.4 Check | `n = 3` | `α², αβ, β²` distinct iff `α ≠ ±β` | sound |
| §3.7 | `i = 1`; general `i` | `2^{m+1} > 2i + 3` is the source's inequality; `m_π = 2`, `k′ = 9`, `v_2(5^7 − 1) = 2`, `s = 2 < 7/2`, `i′ = 3` | sound |
| §4.1 Checks | `Φ_2`; `𝔽₉/𝔽₃` | `Φ_2^t = −Φ_2 = Φ_2^{−1}`, `θ_2² = (−1)(−1) = 1`; `|𝔽₉^×/𝔽₃^×| = 4` | sound |
| §5.1 Checks | `n = 3`, `5` | order `n − 2 = 1`; twist `(2 − 5)/2 = −3/2`; `Θ^{q} = Θ^{−1} ≠ Θ` for `q ≡ −1`, `p` odd | sound |
| §5.6 | `s = 0` | `4/2 = 2`, `4`; `2⁰ = 1`, `2¹ = 2`; weight `(1,1,1,0,−1,−1,−1) + ρ = (4,3,2,0,−2,−3,−4)` | sound |
| §7.3 Check | `q ≡ 3 mod 4` | `a_q = 0`, `q³(q + 1)² ≡ 0` iff `q ≡ −1 mod p` | sound |
| §8.1 | `n = 2, 3`; Steinberg | `(α − β)²`; repeat iff `α = ±β`; `l^{±i} ≠ 1` | sound |
| §9.7 Check | — | `dim W_∞ = 1 + q + 4|S ∪ S_∞| − 1` | sound |
| §12.5 Check | `r = 2` | `{0,1} + {0,1} = {0,1,1,2}`; `{0,1} + {0,2} = {0,1,2,3}` | regularity needed |
| §13.9 | `p = 5, 7, 11` | `SP_4 ⇒ SP_6`, `SP_3 ⇒ SP_7`, `SP_6 ⇒ SP_8`, `SP_4 ⇒ SP_{10}`; `11 = 7 + 4` only; the printed list is not sharp (`p = 11`, `r = 2` gives `SP_{13}`) but true | sound |
| §13.10 | `n = 6, 7, 11, 12` | `(5,1)`: `1, 2, 4`; `(5,2)`: `1, 2, 3, 3`; `(7,4)`: `3, 4, 5, 3`; `(7,5)`: `4, 5, 6, 2`; `(11,1)`: `1, 2, 10`; `⌊n/2⌋ < p ≤ 2⌊n/2⌋` gives `n/2 < p < n` | sound |
| §14.4 headline | `n = 0`; weights | `ζ(s)`; `|α^jβ^{n−j}| = p^{n(k−1)/2}` gives convergence for `Re s > n(k−1)/2 + 1` | `1 ≤ n` needed |
| §14.5 headline | CM by `K`; `M = 0` | `ψ = δ_K`, `M = |d_K|`: `a_p = 0` at inert `p ∤ NM`, so CM implies the predicate; `Nat.Coprime p 0` iff `p = 1` | hypotheses needed |

### Lean acceptance test

- `lake env lean` on `packages/ModularityAndLanglandsExtensionsPartII/Suggested.lean` from the content
  checkout: exit 0; the only output is two "declaration uses `sorry`" warnings (lines 98, 117). No
  `TauCeti.*` module needed building. Header: Mathlib and the one Tau Ceti module used. No
  `set_option`, `lemma`, `#eval`, sorry'd data.
- `#check @name` for the four declarations in a scratch copy: types equal the worker's
  elaborated-signature list and the README (`1 ≤ n`; Satake hypotheses; `[NeZero N]`, `2 ≤ k`,
  `¬HasQuadraticSelfTwist f`, product over `p ∤ N`). Nothing lost, nothing changed.
- One-tactic probe on both sorried theorems with `simp`, `rfl`, `infer_instance`, `trivial`, `aesop`,
  `simp [symPowerEulerFactor]`: all twelve fail; `exact?` proposes only the sorried declaration
  itself. No padding. The one proved `example` is the reindexing symmetry of the kept definition.
- Pinned declarations opened with `#check` (18, all present): `Nat.multiplicity_pow_two_sub_one`
  (`Mathlib/NumberTheory/Multiplicity.lean:359`), `Polynomial.discr`
  (`Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:934`), `Nat.exists_prime_lt_and_le_two_mul`,
  `NumberField.abs_discr_gt_two`, `DirichletCharacter.changeLevel_injective`
  (`Mathlib/NumberTheory/DirichletCharacter/Basic.lean:79`), `changeLevel_eq_one_iff` (line 88),
  `changeLevel_eq_cast_of_dvd'`, `MulChar.map_nonunit`, `ZMod.unitsMap`, `ZMod.χ₄`, `Complex.cpow`,
  `GaussianInt`, `UpperHalfPlane.qExpansion` (`Mathlib/NumberTheory/ModularForms/QExpansion.lean:172`),
  `HeckeRing.GL2.Newform` (`TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean:104`), its
  `satakeParameters`, `exists_satakeParameters_eq_pair`,
  `LSeries_eulerProduct_hasProd_satakeParameters`, `prod_map_one_sub_mul_satakeParameters`, and
  `CuspForm.hasEntireExtension_qExpansion_coeff`.
- Headlines: §§2.4, 3.8, 5.4, 5.10, 6.4, 6.7–6.9, 7.5–7.7, 8.3, 9.8, 11.10, 12.7, 13.5, 13.6, 13.10,
  14.1–14.3 are named in the module docstring with the missing carrier; §§14.4–14.5 are stated. No
  statable headline is absent. The four backticked names of the roadmap's own
  (`symPowerEulerFactor`, `HasQuadraticSelfTwist` and the two theorems) are declared.

### Suppliers, order, gaps, overlaps

- Dependency check output: `depcheck: 242 roadmaps, 2275 edges, 0 problem(s)`; no UPWARD, CYCLE or
  `moved:` line.
- `roadmaps resolve` leads: none. Opened at their heads this round: ModularityAndLanglandsExtensions
  §§0.2, 1.1, 1.10, 1.12, 1.15, 2.1, 4.1, 4.2, 4.5, 4.12, 4.15, 4.20, 4.22, 4.23, 4.29–4.31, 4.35–4.36
  (headings present); PotentialAutomorphyInfrastructurePartII §§0.3, 0.9–0.11, 3.1, 3.4–3.6, 3.8, 3.12,
  7.1, 7.2, 7.11, 7.13, 7.15, 7.19, 8.5, 8.7, 8.16, 9.7 and its mapping row for the former §8.17;
  ArithmeticGaloisRepresentations §§4.4, 7.6, 7.8, 7.9, 7.10; AdicSpacesPartV Layer 1; Chebotarev
  Layer 10. All exist as cited.
- Gaps: 14 slugs, each README line equal to the `needs` of `design/plan.json` (compared by script),
  each with a named earlier supplier; none vague, none asking for what is provided. The new gap asks
  only for the lifting conclusion and keeps the supplier's own added hypothesis.
- Shape: 110 numbered targets, each with one `*Needs:*` line, a locator and at least three Checks
  (counted by script); 15 layers with Examples and Dependencies; no LaTeX delimiters, pull-request
  numbers, paths, HTML or process words.
- Duplication by object: `roadmaps grep` for `HasQuadraticSelfTwist`, `symPowerEulerFactor`,
  `symPowerEulerProduct` finds nothing outside this package; th24 Theorem 7.5 is named only by
  PotentialAutomorphyInfrastructurePartII §8.16 (finiteness form).
- Kazhdan–Lusztig classification: settled in round 4 as not actionable here; not re-raised.
- Overlap facts: no other pull request changes this roadmap, no cited id is dropped, none is defined
  only by an open revision.

Overlap check: read PotentialAutomorphyInfrastructurePartII, ModularityAndLanglandsExtensions, OrdinaryAutomorphicFormsAndModularityLiftingPartII, PotentialModularityAndCompatibleSystems, GL2ModularityLifting (open), SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants, ModularForms (main); statements of symmetric power functoriality and the Allen–Newton–Thorne lifting theorem: ModularityAndLanglandsExtensions, proofs here; residually reducible finiteness and its auxiliary-place variants: PotentialAutomorphyInfrastructurePartII; symmetric powers of Weil–Deligne parameters and the Iwahori–Matsumoto presentation: SmoothRepresentationsOfLocalGroups; Kazhdan–Lusztig classification: this roadmap §4.9.

### Copyright, wording and arrangement

Nineteen passages were set beside the sources: the fifteen sampled targets, the rewritten sketch and
the two new Checks of §13.8 (th24 lines 1984–2086), the gap text (th24 lines 1965–1998) and the two
theorem docstrings. The hypothesis lists of §§1.4, 2.4, 5.1 and 5.6 keep the source's items, which the
mathematics forces; the sentences are the roadmap's own, and the longest shared run is the standard
phrase "an unramified twist of the Steinberg representation". No table, figure or list of examples is
taken over. Contents of nt21 (§1 unitary groups, §2 eigenvarieties, §3 ping pong, §4 level raising,
§5 finiteness, §6 Steinberg, §7 level one, §8 higher levels) against Layers 0–8: §2 is split over
Layers 0–2, §1 comes after §3 and is merged with ct17 §§2–3, §4 with ct17 §4, §6 with ct17 §5 and
th24 §6, §5 is left to a supplier; the order of Layers 4–8 is forced by their Dependencies lines
(Layer 5 on 4, Layer 6 on 4–5, Layer 7 on 2–6, Layer 8 on 2–3 and the seed). No one-to-one run.

Source independence: 19 passages compared with 5 sources (nt21, nt21b, nt26, th24, ct17), none shared beyond standard phrases; largest share nt21, 92 of 259 source references; contents compared with nt21: independent.

## Not verifiable

- kl87 (Theorem 7.12, §8), bbm82 (Théorème 3.1.1), kw09 (Proposition 9.3): settled as uncertified;
  not read.
- at20, ct15, bk05, con99, chen14, moe07, kv12, dm18, ls20, wes04 were not reopened this round; no
  sampled target rests on their text beyond a citation and no repair touched their locators. Rounds
  2–6 record their checks.
- The extraction of nt26 drops overlines, so that Proposition 6.3 (4)–(5) read as characteristic-zero
  isomorphisms; the README's residual reading is the only one consistent with the proof, but the
  printed bars were not seen.
- Whether a Hilbert modular form with the residual image of the witness of R01 exists was not
  decided; the finding rests on the group-theoretic statement, which the Check asserts for every
  subgroup.

## Source issues

- **Error** in th24 at Lemma 7.3, proof, p. 43: the source says a finite group containing `SL_2(𝔽_{p^b})` with projective image `PSL_2` or `PGL_2(𝔽_{p^b})` lies in `k^× SL_2(𝔽_{p^b})`; it should be `k^× GL_2(𝔽_{p^b})` in the `PGL_2` case; affects nothing.
- **Misprint** in th24 at Corollary 7.2, proof, p. 42: the source says Bertrand gives a prime `p` with `n < p < 2n` and then writes `n = p + r`; it should be `n/2 < p < n`; affects the proof.
- **Misprint** in nt21 at Lemma 3.3, statement, p. 54: the source says the original point `z` lies on the annulus component of index `i′`; it should be the twin `z′`, as its proof says; affects nothing.
- **Misprint** in nt21 at Theorem 4.1, item (4), p. 60: the source says the block size `n_2` is `2` on `T_2` and `n − 2` on `T_3`; it should be `n_1`, as in hypotheses (c) and (d); affects nothing.
- **Gap** in nt26 at Corollary 6.2, statement, p. 49: the source says `SP_{r−1}` is assumed for every `0 < r < p`, which for `r = 1` is `SP_0`, not a defined statement; it should assume `SP_{r−1}` only for `r > 1`; affects nothing.

## For the human reviewers

- Ownership: SmoothRepresentationsOfLocalGroupsPartII (open; its §7.4) states the Kazhdan–Lusztig classification citing kl87 and not §4.9 here, while README "Downstream consumers" says it consumes §4.9; the edit belongs to that roadmap.
- Arrangement: Layers 11, 12, 13 correspond to nt26 §3, §4, §§5–6 (the last merged with th24 §7); §13.4's *Needs* force 13 after 11 and 12, and 11, 12 are independent of each other.
- Licence: ct17, ct15, bk05, con99 were read from authors' pages (`sources.toml`, `licence_class = "author-page"`); kl87, bbm82, kw09 are cited by locator only.
- Scope: nt26 is cited by arXiv v2 pages with the venue "Ann. of Math. 203 (2026)"; the published pagination was not compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "9734b6ec892b3ddbc1cf1759af45c7239c5e34b6", "job": "REV-PKG-ModularityAndLanglandsExtensionsPartII~8", "model": "fable", "worker": "chris-x79"} -->
