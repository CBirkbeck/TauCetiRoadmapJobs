# Review of CharacteristicClasses (pull request #1807 at d227a81)

**Verdict:** needs changes

This is an incremental re-review of the 97 README lines changed since 7fa7fe9. `Suggested.lean` is unchanged. Both previous findings are repaired. The repair of the old R01 (missing locators) introduced two P3 problems. Neither blocks.

## R01 (P3) — C6.5 cites a wedge-convention pushforward for an identity that holds only for the dual-Koszul one

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:2794–2802`: "`ch(f!_K a)=f!_H(ch(a)·Td(ν)^−1)` … (Landweber, *K-theory and elliptic operators*, §2.2, p. 16, for the K-theory pushforward of an embedding), so the identity is C6.4's Thom comparison for ν (the same source, §1.7, pp. 13–14)".

Claim: Landweber's pushforward `i! = h∘ϕ` (`landweber-k-theory-elliptic` lines 721–725) uses the Thom class `λ_E` of §1.7. Its zero-section restriction is `Σ(−1)^i Λ^i E` (line 592), which is the wedge convention. C6.4 (lines 2768–2769) gives the factor `(−1)^r exp(c₁(ν)) Td(ν)^−1` for that class, not `Td(ν)^−1`. The displayed identity is true for the pushforward this roadmap actually uses: TopologicalKTheory T5 item 5, built from the dual-Koszul class (TopologicalKTheory README lines 1148–1151 and 1214–1216; Scope line 288 here). But C6.5 never names that class. Its new locator points to the construction for which the identity fails, and §1.7 does not state the `Td^−1` form.

Witness: take the embedding of a point in ℂ, ν trivial of rank 1, a=1. Landweber's correction is `(1−e^x)/x` at x=0, which is −1, so ch(i!1) = −Thom_H(1). The README formula, with Td(ν)=1, gives +Thom_H(1). The same sign appears in Landweber's own setting (a point in ℝ, normal bundle `TN = ℂ`).

Repair: in C6.5 write "for the pushforward f!_K of TopologicalKTheory T5 item 5, the Thom map of the dual-Koszul class of ν followed by open extension". Then replace the parenthesis with "(Landweber §2.2, p. 16, builds the same composite with the wedge class of §1.7, for which the factor is C6.4's `(−1)^r exp(c₁(ν)) Td(ν)^−1`)". Tested on the point in ℂ: the dual-Koszul zero-section class is `1−e^(−x)`, so the factor is `(1−e^(−x))/x`, which is 1 at x=0, matching +Thom_H(1); the wedge factor `(−1)¹exp(0)·1=−1` matches Landweber.

## R02 (P3) — Two Dupont locators misdescribe what is cited

Location (a): `README.md:1520–1524` (C2.6): "The Euler-integral input, a closed top-degree form on the fibre with nonzero integral and the transfer `T(φ)=π_*(Ψ∧φ)` built from it, is Dupont, … Lemma 8.30". Location (b): `README.md:3126` (References): "Theorem 8.1 and Lemma 8.30, pp. 125–129".

Claim:
- (a) Any volume form on G/T is a closed top-degree form with nonzero integral, so that is not what Lemma 8.30 supplies. The lemma gives a closed 2m-form Ψ on the whole simplicial manifold N(G;G/T) whose restriction Ψ₀ to the fibre G/T has nonzero integral. Only such a global Ψ makes `π_*(Ψ∧φ)` a chain map; the README leaves Ψ undefined.
- (b) Theorem 8.1 is stated on p. 114, not on pp. 125–129. The step C5.3 cites (the disconnected case) begins on p. 129 and ends on p. 130.

Witness: `dupont-ccc` line 3848 (Lemma 8.30: Ψ is a form on N(G;G/T), and (ii) concerns its restriction to G/T); line 3859 (the chain-map property uses (i) for that Ψ). Line 3514 is on PDF page 122, which is printed p. 114 (Theorem 8.1). Lines 3954–3988 run from printed p. 129 to p. 130 (the disconnected step).

Repair:
- (a) Write "a closed 2m-form Ψ on the simplicial manifold N(G;G/T) whose restriction to the fibre G/T has nonzero integral, and the transfer `T(φ)=π_*(Ψ∧φ)` built from it".
- (b) In References write "Theorem 8.1, p. 114, with its proof on pp. 123–130; Lemma 8.30, pp. 125–129". In C5.3 (line 2154) write "the last step of its proof, pp. 129–130".

Tested against the cited lines above: the "Proof of Theorem 8.1" heading (line 3781) is on printed p. 123.

## Previous findings

- R01 — repaired: every listed target now has a locator at the claim, for example C7.3 "(Cohen, *The Topology of Fiber Bundles*, Theorem 1.16, p. 25, … and formula (4.1), p. 103, for the total Chern class)". The C6.5 and C2.6/References locators introduced R01 and R02 above.
- R02 — repaired: `README.md:964–966` "Compare BU(1) and BO(1) with these CP∞ and RP∞ carriers, and RP∞ with the quotient S∞/{±1} of T1.6's universal double cover, by the universal-bundle maps."

## Verified sound

**Gate and dependency check.**
- The worker's gate at d227a81 passes every check, including `build=0`.
- I re-ran the gate command myself. It reports `outside-folder=26` and stops before the build. All 26 files are in the 13 other folders this pull request owns (2 files each: AlgebraicCurves through TopologicalKTheory). The brief names each of them as the pull request's own, so this is not a finding.
- `git diff --stat origin/main...HEAD` outside the 14 listed folders is empty.
- The dependency check prints:

      depcheck: 229 roadmaps, 2155 edges, 0 problem(s)

**Lean.**
- `Suggested.lean` is byte-identical to 7fa7fe9.
- `lake env lean` on it gives five `sorry` warnings (lines 148, 172, 188, 212, 244) and nothing else.
- The elaborated types in `signatures.md` match README C2.1 (lines 1212, 1216), C2.2 (1285), C2.3 (1328) and C7.3a (2960). `[FiniteDimensional ℝ F]` survives in the three bundle theorems.
- The two extra "declarations" that file lists (`ContMDiffConstSMul`, line 58; `of`, line 211) are words inside docstrings, not declarations.
- The one-tactic probe and the headline list from the previous review stand, since the file is unchanged. Stated headlines: C2.1 (two theorems), C2.2, C2.3, C7.3a. The docstring names the remaining headlines as not statable.

**Locators read at this head (20).** Printed pages are the PDF page minus 4 for `hatcher-vbkt`, minus 8 for `dupont-ccc` and minus 6 for `cohen-fiber-bundles`.
- C1.4, `mueller-wockel-smoothing`:
  - Proposition I.13 (line 225: finite-dimensional K, manifold with corners, smooth representative and smooth ⇔ continuous equivalence);
  - Theorem II.11 (line 461: relative to closed C, M connected paracompact);
  - Theorem II.12 (line 686: equivalences relative to C).
  - The reference entry's arXiv v3 numbering is the version read.
- C3.3: `hatcher-vbkt` p. 94, line 3649 (`p_i=(−1)^i c_(2i)(E_C)`).
- C6.2: p. 109, lines 4191–4217 (Newton-polynomial definition, ch₀=dim E); Proposition 4.2, p. 110, line 4220.
- C4.3: `dupont-ccc` Theorem 6.13 a)–d), lines 2977–2995 (printed pp. 94–95, on NG).
- C2.6: Lemma 8.30 and proof, lines 3848–3952 (pp. 125–129). See R02 (a).
- C5.3: the disconnected step of Theorem 8.1, lines 3954–3988 (pp. 129–130). It works with real coefficients, and the transfer is multiplication by |G/G⁰|, so it also works over ℚ.
- C5.5: Corollary 8.37(i), line 4028 (p. 131), and (7.39), line 3441 (p. 111).
- C6.4: `landweber-k-theory-elliptic` §1.7, lines 549–630 (pp. 13–14). The roots formula `∏(1−e^(x_i))/x_i` (lines 613–617) is the README's class. See Source issues for the source's final line.
- C6.5: §2.2, lines 698–728 (p. 16; done for the embedding TX⊂TY). See R01.
- C7.2: `atiyah-hirzebruch-rr-1959` §4, line 200 (p. 281).
- C7.3: `cohen-fiber-bundles` Theorem 1.16, line 946 (p. 25); (4.1), line 3492 (p. 103).
- C7.3a:
  - Theorem 1.15, line 929 (p. 24);
  - Theorem 3.22, line 3480 (p. 103);
  - Proposition 3.27, line 3583 (p. 105);
  - Corollary 3.28, line 3596 (p. 106).
  - Chapter 1 §2.2 and Chapter 3 §4 (subsections 4.1–4.2) match the References entry.

**Cross-roadmap citations resolved (6).**
- TopologicalKTheory at this head:
  - Conventions, lines 258–264 (dual-Koszul class, and the wedge comparison `(−1)^r[π*det E]·u_dual`, consistent with C6.4's wedge factor);
  - T5 items 1, 3 and 5 (lines 1148, 1196, 1214);
  - T1.5a, T1.6a and T6.4 are still present;
  - T7 item 4 (doubled-space formula) is now at line 1834.
- The diff of TopologicalKTheory since 7fa7fe9 deletes no heading.
- `citations.md` lists no unresolved citation. `overlaps.md` lists no dropped id. #1808 and #1854 conflict in this folder, and the description fixes the order "this pull request → #1808 → #1854".
- The changed passages add no new object and no new supplier, so there is no new ownership question.

**Adversarial table.** Rows marked r67 are carried from the previous report for statements this diff leaves untouched.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_singularCohomology_thomPair_fiber` (r67) | point base with ω, −ω; rank 0 on two components | u=g and u=−g; u=(1,−1) | holds | none |
| C2.1 `exists_isThomClass_of_orientation` (r67) | Möbius line; rank 0 | no orientation, hypothesis empty; constant 1 a unit per fibre | holds | none |
| C2.2 `eulerClass_eq_zero_iff_exists_ne_zero` (r67) | TS²; S¹×ℝ²; su(F) on S⁴; n=1; B=∅ | 2≠0 and no section; 0 and a section; excluded by `hdim`; both true; both true | holds | none |
| C2.3 `eval_eulerClass_tangent_eq_eulerChar` (r67) | S², T², S³, reversed o | 2=2; 0=0; 0=0; same value | holds | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` | k=1,2; natural subtraction | k=2: w(RP⁴)=(1+a)⁵=1+a+a⁴, w̄=1+a+a²+a³, w̄₃=a³≠0 vs normal rank 2 in ℝ⁶; 2^(k+1)−2≥2, no truncation; Cohen Cor. 3.28 has the same N≤2^(k+1)−2 | holds | none |
| C1.1a oriented covers | ℝ¹⊕ℝ¹; full rank n; line added last vs first | 4 pairs onto 2 orientations, fibres {(+,+),(−,−)}, {(+,−),(−,+)}; 2 points; sign (−1)^(n−1)=−1 at n=2 | holds | none |
| C1.2a compact support | ℝ; compact X | colim over K=[−n,n] of H*(ℝ,ℝ∖K): ℤ in degree 1, 0 in degree 0; K=X cofinal so H_c=H | holds | none |
| C1.4 smooth representatives | U(1)-bundles on S²; MW hypotheses | continuous and smooth classes both ℤ via c₁; II.11/II.12 need M connected and C closed, so apply per component | holds; locator supports | none |
| C1.5 comparison sentence | γ on RP∞; O(−1) on CP∞ | w₁(γ)=a, nonzero on RP¹ (Möbius); c₁(O(−1))=−h | complete, holds | old R02 repaired |
| C2.4 embedding Gysin | diagonal of S²; point in Sⁿ | Δ*Δ_!(1)=e(TS²)=2 equals [Δ]·[Δ]=χ(S²)=2; i*i_!(1)=e(ε)=0 | holds | none |
| C2.5 fibre integration | S²×B→B | p!(e(Tp)∪p*a)=2a=χ(S²)a; p!(pr*[S²]*)=1 | holds | none |
| C2.6 transfer | SU(2), U(3) | ∫Ψ₀=χ(S²)=2=\|W\|; χ(Fl(ℂ³))=6=\|S₃\|; Ψ global on N(G;G/T) | holds; description of Ψ loose | R02 |
| C3.3 Pontryagin sign | TCP² | c(TCP²⊗ℂ)=(1+h)³(1−h)³=1−3h²+…; p₁=−c₂=3h², signature p₁/3=1; without the sign −1 | holds | none |
| C4.3 universal map | U(1) on CP¹ (r67 values) | −a/(2π)↦−h, pairing −1; Dupont 6.13 a)–d) on NG | holds | none |
| C5.3 disconnected G | O(2) | ℤ/2 sends e↦−e on ℚ[e]; invariants ℚ[e²]=ℚ[p₁]=H*(BO(2);ℚ) | holds | R02 (page) |
| C5.4 rational rings | BO(1), BO(2), BSO(2) | ℚ (⌊1/2⌋=0); ℚ[p₁]; ℚ[e] with p₁=e² | holds | none |
| C5.5 Euler = Pfaffian | γ_ℝ on CP¹ | Dupont (7.38) e=−h; C1.5 gives c₁(O(−1))=−h; agree | holds | none |
| C6.1 series | Td, Â, L | x/(1−e^(−x))=1+x/2+x²/12; (1+x/2+x²/8)(1−x²/24)=1+x/2+x²/12; L=1+x²/3−x⁴/45 | holds | none |
| C6.2 Chern character | TCP²; O(1)⊗O(1) | ch₂=(c₁²−2c₂)/2=(9−6)/2·h²=3h²/2; (1+h+h²/2)²=1+2h+2h²=ch O(2) | holds | none |
| C6.4 statement | rank r, wedge | ∏(1−e^(x_j))/x_j=∏(−e^(x_j))(1−e^(−x_j))/x_j=(−1)^r e^(c₁)Td⁻¹; point value (−1)^r | holds | none |
| C6.4 new Checks | rank 1 both conventions; rank 0 | (1−e^x)/x=−1−x/2−x²/6; without exp(c₁): −1+x/2; (1−e^(−x))/x=1−x/2+x²/6=Td⁻¹; rank 0: 1 | all three true and discriminating | none |
| C6.5 Riemann–Roch for embeddings | point in ℂ, ν trivial, a=1 | dual-Koszul: factor 1, +Thom_H(1)= formula; Landweber's wedge i!: factor −1, −Thom_H(1)≠ formula | true only for the dual-Koszul pushforward | R01 |
| C7.1 L₃ | CP⁶, HP³; q₃ | (2170−1911+686)/945=1; (496−624+128)/945=0; 2⁶·(1/42)/720=2/945 | holds | none |
| C7.2 half-spin difference | r=1 | e^(x/2)−e^(−x/2)=x+x³/24+…, leading term e=x | holds | none |
| C7.3 CPⁿ | n=1,2 | c₁(TCP¹)=2h, pairing 2=χ(S²); c₂(TCP²)=3h², 3=χ(CP²); c₁(γ*)=+h since γ=O(−1) | holds | none |
| C7.5 adjoint bundle | roots 0, x−y, y−x; S⁴ with c₂=k | p₁=(x−y)²=c₁²−4c₂; p₁=−4k≠0 while w=1 and e∈H³(S⁴)=0 | holds | none |
| C1.1b, C1.1d, C1.3, C1.5a, C2.3a, C3.1, C3.2, C3.3 (`p_r=e²`), C3.4a, C3.5, C3.6, C4.1, C5.1, C5a.1–C5a.3, C6.3 (r67) | as in r67 | values as recorded in r67 (e.g. C5.1: tr ad(e₁)²=−8, λ=1/4; C3.5: c₁(TCP²)=3h odd) | hold | none |

**Remark on untouched text.** The C7.3a docstring in `Suggested.lean` still cites Milnor–Stasheff §4, while the README now cites Cohen Corollary 3.28. Both are valid sources for the statement.

## Not verifiable

- C2.4 and C2.5: Bott–Tu §6 is uncertified (no legal open copy). I did not read it, so the attached contents (Thom isomorphism, normal Thom class as Poincaré dual, projection formula, integration along the fibre) are unconfirmed. The two statements were checked in the table.
- C3.3: Milnor–Stasheff Theorem 15.3 is uncertified and was not read. The README describes it only as the product formula modulo 2-torsion.
- `tomdieck-at`, `may-concise`, `hatcher-at`, `dupont-ln`, `alekseev-meinrenken-chern-weil` and `zentner-instanton-sheet2` are cited only in passages this diff leaves untouched. I did not re-read them.
- No README locator is flagged as unverified.

## Source issues

- **Error** in landweber-k-theory-elliptic at §1.7, p. 14: the source says the correction factor equals (−1)^n td(E)^−1; it should be (−1)^n exp(c₁(E)) td(E)^−1, which equals its own roots formula ∏(1−e^(x_i))/x_i; affects a stated result.
