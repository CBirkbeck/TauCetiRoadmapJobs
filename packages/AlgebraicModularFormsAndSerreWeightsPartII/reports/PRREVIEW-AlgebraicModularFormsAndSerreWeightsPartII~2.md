# Review of AlgebraicModularFormsAndSerreWeightsPartII (pull request #1822 at 8b4efa8)

**Verdict:** needs changes

Incremental re-review of the 62 lines changed since c6dbce7. The three findings of the previous review are repaired; the gate passes, the dependency check shows no UPWARD or CYCLE line, and the one Lean statement is unchanged and elaborates. One residue of the gap-slug repair remains: four prose sentences still name the contracts by the titles the repair removed, so those names now resolve nowhere in the README.

## R01 (P3) — Four prose references to contracts by titles the README no longer declares

Location: `TauCetiRoadmap/AlgebraicModularFormsAndSerreWeightsPartII/README.md` line 434 ("the paramodular model is that of the Siegel parahoric models contract"), line 991 ("with the Siegel parahoric models contract; the fundamental class and trace require the lci fundamental class contract"), line 1018 ("including the lci fundamental class contract") and line 1272 ("requested by the Siegel Igusa full frames contract").

Claim: the eight contract sentences under `## Exact supplier contracts` (lines 93, 101–105, 111, 117–121) and every `*Needs:*` and `### Dependencies` line now label the gaps `gap:siegel-parahoric-models`, `gap:lci-fundamental-class`, `gap:siegel-igusa-full-frames` and so on, but these four sentences still refer to "the Siegel parahoric models contract", "the lci fundamental class contract" and "the Siegel Igusa full frames contract", phrases that occur nowhere else in the README since the repair.

Witness: "Siegel parahoric models contract" occurs twice (lines 434, 991) against 14 occurrences of `gap:siegel-parahoric-models`, and no sentence defines the title phrase; the same for "lci fundamental class contract" (lines 991, 1018; 5 slug occurrences) and "Siegel Igusa full frames contract" (line 1272; 6 slug occurrences).

Repair: in those four sentences replace each title by the slug reference used everywhere else, for example at line 434 "the paramodular model is that of gap:siegel-parahoric-models", at line 991 "imported from ShimuraCompactifications Layer 7 with gap:siegel-parahoric-models; the fundamental class and trace require gap:lci-fundamental-class", at line 1018 "including gap:lci-fundamental-class", and at line 1272 "requested by gap:siegel-igusa-full-frames". No needs sentence changes.

## Previous findings

- R01 — repaired: all eight contract sentences read "What <Supplier> must provide (gap:<slug>): …" with the slugs of `plan.json` (`siegel-parahoric-models`, `siegel-rank-one-deformations`, `siegel-isogeny-trace-ideals`, `siegel-logarithmic-de-rham`, `open-formal-milnor`, `lci-fundamental-class`, `reduced-section-propagation`, `siegel-igusa-full-frames`); every `*Needs:*` and `### Dependencies` line cites them as `gap:<slug>`. The needs sentences are unchanged and agree with the plan entries. The four prose remnants are the new R01 above.
- R02 — repaired: Scope and ownership line 15 now states that this roadmap owns the secondary Hasse section with extension, duality and root (Layer 3), the formal operators with corrected Q₂ (Layer 5), the neighbor multisets with oriented reciprocity (Layer 6) and the theta operators with nonvanishing and injectivity (Layer 8), and that GSp4NonregularModularityLifting §§3.2, 4.1–4.2, 4.4 and 4.7 import them, keeping only the (j,2) and tame-level specialisations. Those five sections exist at the consumer's open head (`TauCetiRoadmap/GSp4NonregularModularityLifting/README.md` lines 630, 724, 750, 810, 866) and are the sections the previous review identified. The consumer still names this roadmap nowhere; that is its own repair, as the previous review said.
- R03 — repaired: §8.2 line 1098 now says the det(Q) factor printed in CG20 Proposition 8.9(2) is a misprint because the Gauss–Manin computation at the Mumford cusp of Y16 Proposition 3.12 has all c_ij=0 and gives con_d(a(F,Q)⊗Q). Verified: CG20 line 2417 prints det(Q)·con(a_Q⊗Q); Y16 lines 1318–1319 state that the Hasse matrix at the Mumford cusp is the identity, b₁₁(q)=0, so all c_ij(q) vanish, and lines 1323–1327 give the coefficient (1/N)ΣA_{F_n}(T)δ_n⊗T with no determinant. The Checks at lines 1115–1118 (y² at Q=x² gives 1/3=5 at p=7 while det Q=0) agree with the adopted formula.

## Verified sound

**Gate and dependency direction.** The worker's gate at 8b4efa8 passes every check (build=0, depcheck=0, outside-folder=0, stray-files=0, residue=0). Re-run of the dependency check with `--movable`:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

No UPWARD or CYCLE line. The new Scope sentence names GSp4NonregularModularityLifting (merge order line 268; this roadmap line 240) as a consumer only, in no `*Needs:*`, supplier-table or Dependencies line, and the check accepts it. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Suggested.lean.** Byte-identical to c6dbce7 (`git diff --stat c6dbce7 HEAD -- Suggested.lean` is empty). Elaborated with `lake env lean` at the pins: one warning, `declaration uses 'sorry'` at line 71. Header `module` / `public import Mathlib` / `public import TauCeti.LinearAlgebra.Matrix.GeneralLinearGroup.Diagonal.Basic`; no `set_option`, no `lemma`, no sorry'd data; 84 lines. The elaborated type of `relIndex_conj_diag_eq_tameIndex_mul` in the worker's signature file is the README §5.2 statement (p prime, p coprime to N, Γ(N)≤Γ, relative index of diag(p,1)Γ_ℚdiag(p,1)⁻¹ in Γ_ℚ equals (p+1) times the relative index of the conjugate of the mod-N image); no section binder is lost. The one-tactic probe (`simp` makes no progress) and the proof of truth are carried from the previous review, which read the same file.

**Headline theorems.** Unchanged since the previous review: only the arbitrary-tame-level degree identity (§5.2) is statable at the pins and it is stated; the geometric headlines (§§1.4, 2.3, 3.2, 3.4, 3.7, 4.3–4.4, 5.6–5.7, 6.3, 7.4–7.6, 8.4–8.7, 9.2–9.4) are named in the module docstring with the carriers they lack. No stand-in.

**Declared gaps.** The eight slugs in `plan.json` and the eight in the README coincide (occurrence counts in the README: siegel-parahoric-models 14, siegel-igusa-full-frames 6, siegel-isogeny-trace-ideals 6, lci-fundamental-class 5, open-formal-milnor 4, siegel-logarithmic-de-rham 4, siegel-rank-one-deformations 4, reduced-section-propagation 3). Each has a named supplier and section; the needs sentences are unchanged from the previous review, where precision, minimality and non-redundancy against the suppliers' open heads were checked.

**Seeded sample, where it falls in the changed passages** (the other sampled targets are untouched by the diff and were not re-read):
- 2.2 (dependency line changed): P20 lines 1532–1536, p. 35 (rank-r stratum dense open in its closure, dimension 3−r, so codimension-r in dimension 3, matching "pure dimension r+1"); Lemma 6.4.1 line 1544 (X₁ smooth, X_par,1 Cohen–Macaulay and normal); Lemma 6.4.2 line 1609, p. 36; CG20 lines 2443–2446, p. 62 (each supersingular component is a P¹ with p²+1 superspecial points, ω restricts to O(p−1)). Supported as written.
- 7.3 (dependency line changed): P20 Lemma 14.9.1 line 4702, p. 103 (T_{p,2} on RΓ(X^{≥1},Ω(k,2)(−D))); proof §14.9.2 lines 4738–4765, p. 104 (Σ=Σ″, p₁ finite over the rank-at-least-one locus, T′ lands in p³Ω, T=p⁻³T′, divisibility checked over the ordinary locus by normality, orders p^{k+4}, p², 1 against traces 1, p, p³). The README's d≥0, r≥2 range beyond P20's (k,2) rests on §7.2's order computation, checked by the previous review.
- 8.5 (dependency line changed): CG20 lines 2435–2446 and 2462–2468, pp. 62–63 (supersingular locus a Cartier divisor in the rank-one stratum cut out by a section of ω^{(p²−1)/2} for p>2; the exact sequence with twist by ω^{−m}, m=(p²−1)/2). Supported as written.
- 8.2 (prose changed; not in the sample but the substantive edit): CG20 Proposition 8.9 lines 2402–2419, p. 61; Y16 Proposition 3.12 lines 1243–1327, pp. 23–24, Remark 3.13 lines 1282–1303.

**Cross-roadmap citations in the changed passages.** GSp4NonregularModularityLifting §§3.2, 4.1, 4.2, 4.4, 4.7 at the head of its open pull request (lines 630, 724, 750, 810, 866). The gap suppliers ShimuraCompactifications Layer 7, AbelianSchemesAndArithmeticModuli §§A4.3, A4.7, A4.9, A4.10–A4.11, SchemeAndStackFoundations §§0.6, 2.19–2.20, 4.9 and HodgeTateAndCanonicalSubgroups §§5.1–5.2 were resolved by the previous review and are cited unchanged. The citation lead `Lang.lang_surjective` is ReductiveGroupsPartII `Suggested.lean` on main, as before.

**Adversarial table** (rows for untouched statements carried from the previous review at c6dbce7, which computed them; new rows for the changed statements).

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| §8.2 vector coefficient, misprint sentence (new) | p=7, d=2, Q=x² (m=1,r=0,n=0), a(F,Q)=y² | README/Y16: con₂(y²⊗x²)=4/12=1/3≡5 mod 7; CG20 printed: det(Q)·con=0·5=0 | the two formulas differ on every degenerate Q; Y16 line 1319 (c_ij=0) decides for the README | none |
| same | Q=x²+y², det Q=1 | both formulas give con₂(a⊗(x²+y²)); they agree exactly when det Q=1 | the misprint is invisible on unimodular indices, so the Check at Q=x² is the right witness | none |
| §8.2 scalar coefficient (unchanged clause) | p=7, Q=x²+y², Q=x² | det Q=1, 0; Δ=−4≡3; scalar factor det Q, not Δ | matches CG20 Prop 8.9(1) line 2410 | none |
| Scope ownership sentence (new) | merge order | this roadmap 240, GSp4NonregularModularityLifting 268; consumer sections at its head lines 630/724/750/810/866 | consumer later; no supplier edge added; depcheck 0 problems | none |
| Gap slug declarations (new form) | 8 plan entries vs README | 8 = 8; every contract sentence and every Needs/Dependencies line uses the slug; 4 prose remnants | R01 above | repair R01 |
| Lean degree identity (§5.2), file unchanged | N=1 Γ=SL₂(ℤ); Γ₀(N),Γ₁(N),Γ(N); Γ(7)∩red₅⁻¹Stab, p=3; Γ(5)∩red₇⁻¹⟨A⟩, p=3; Γ₀(p) with N=p | p+1; (p+1)·1; 20; 12; left side p (hypothesis p∤N necessary) | previous review | none |
| §1.2, §5.2, §5.4–§5.7, §6.2–§6.3, §2.3, §3.1, §3.6–§3.7, §4.2, §4.4, §7.2, §7.5, §8.1, §8.3–§8.7, §9.1, §9.4 (untouched) | as in the previous review | as in the previous review (33 rows with values) | all matched | none |

**Not a finding, recorded.** The consumer GSp4NonregularModularityLifting still builds §§3.2, 4.1–4.2, 4.4 and 4.7 without citing this roadmap; the two-owner state is now resolved on this side by the Scope sentence and the remaining edit belongs to that roadmap.

## Not verifiable

None. CG20, P20 and Y16 were read from the sources cache at the lines above.

## Source issues

- none new in this round. The seven CG20/P20/Y16 items of the previous review stand (CG20 Lemma 8.4 symbol, Proposition 8.9(2) det(Q), Theorem 8.10 missing k≠p−1, Lemma 8.20 pM⁻¹, remark after Lemma 8.3; P20 Lemma 6.4.1 sign, Lemma 14.8.2 descent, Remark 6.4.1; Y16 Theorem 4.9 display (4.5)).
