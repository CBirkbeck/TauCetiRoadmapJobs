<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1764#issuecomment-6637145515 -->
Red team round 2 pass b (claude) of b7087c1

Verdict: needs_changes

1. **F01** (P3) VectorBundlesAndIsocrystals layer labels and the Banach–Colmez anchor do not exist at the supplier's current head

   Location: `packages/RelativeFarguesFontainePartII/README.md` lines 7, 13, 53–59, 589 ("VB0 fixes the different coefficient field"), every `*Needs:*` line citing "VB−1", "VB1", "VB2" or "VB3" (37 occurrences), line 2240 "(banach-colmez-space-definition)", and `design/plan.json` gap `positive-degree-two-obstruction`, section "VB3 banach-colmez-space-definition".

   Claim: the supplier's layers are named VB−1, VB0, VB1, VB2, VB3, and the Banach–Colmez section carries the anchor `banach-colmez-space-definition`.

   Witness: VectorBundlesAndIsocrystals at its current head (pull request #1205, read with `roadmaps show`) has no occurrence of any of those labels; its layers are "Layer 0: relative coefficient and curve foundations" … "Layer 6" (its lines 89, 210, 381, 760, 964, 1062, 1648), and its anchors are heading slugs such as `#banachcolmez-section-and-hypercohomology-sheaves` (its lines 1104, 1144). The round-1 repair (r1a-F05 / r1b-F04) was made against an earlier head that still carried those labels; the supplier has since renumbered. Every cited section name still exists, so this is a locator defect only. Mapping at the current head: VB−1 → Layer 0 (Ramified coefficient rings line 93; Relative annuli 107; Marked untilt Cartier divisors 147; Completed local period rings 162; Rank-one Frobenius twists 176; Homogeneous section ring 188); VB0 → Layer 1 (finite isocrystals); VB1 → Layer 2 (Annular Frobenius descent 411; Finite projective Frobenius modules and integral models 444; Slope-sensitive cohomology 550; Classical points and annular Dedekind rings 568; Regular noetherian geometric curve 604); VB2 → Layer 3 (Norm topology on twisted Frobenius invariants 831) and Layer 4 (Classification and Hom/Ext calculations 992), so "VB2" names two layers; VB3 → Layer 5 (Banach–Colmez section and hypercohomology sheaves 1068; Lubin–Tate universal cover and sections of O(1) 1096; The fundamental untilt sequence and degree-one divisors 1106).

   Repair: replace each "VB−1" by "Layer 0", "VB0" by "Layer 1", "VB1" by "Layer 2", "VB2 Norm topology…" by "Layer 3, Norm topology on twisted Frobenius invariants", "VB2 Classification" by "Layer 4, Classification and Hom/Ext calculations", "VB3" by "Layer 5", and "VB3 Lubin–Tate universal cover" by "Layer 5, Lubin–Tate universal cover and sections of O(1)"; delete "(banach-colmez-space-definition)" at line 2240; in `design/plan.json` set the gap's section to "Layer 5 Banach–Colmez section and hypercohomology sheaves". Test on the instance that refuted the original: with these labels every citation resolves to a heading at the #1205 head, and the gap section names an existing heading.

2. **F02** (P3) The per-layer Dependencies summaries disagree with the Needs lines

   Location: `README.md` lines 330, 905, 1212, 1360, 1562, 1682, 1882, 1974, 2128, 2248 ("Earlier layers: …. Suppliers: ….").

   Claim: each summary lists the earlier layers and the suppliers that the layer's Needs lines use.

   Witness (computed from the 109 `*Needs:*` lines): Layer 2 lists "0, 1" but uses only Layer 0; Layer 4 lists "0, 1, 2, 3" but uses 0, 2, 3; Layer 5 lists "3, 4" but §5.1 needs §1.3 and §5.5 needs §0.6; Layer 6 omits 2 (§6.9 needs §2.10); Layer 7 omits 2 (§7.3 needs §2.11); Layer 8 lists 4 but no §8.x needs a Layer 4 target; Layer 9 omits 0, 1, 5 (§9.1 needs §0.1 and §5.1; §9.5 needs §1.15); Layer 10 omits 1, 2 (§10.6 needs §1.3; §10.8 needs §2.11); Layer 11 lists 10 but no §11.x needs a Layer 10 target, and omits 3 (§11.4 needs §3.3). Suppliers: Layer 0 omits NewtonPolygons (§0.4) and PadicDifferentialEquationsAndRigidCohomology (§0.1); Layer 8 omits LocallyAnalyticDistributions (§8.4).

   Repair: Layer 2 "Earlier layers: 0."; Layer 4 "0, 2, 3."; Layer 5 "0, 1, 3, 4."; Layer 6 "0, 1, 2, 3, 4, 5."; Layer 7 "2, 4, 5, 6."; Layer 8 "0, 1, 5."; Layer 9 "0, 1, 4, 5, 8."; Layer 10 "0, 1, 2, 4, 5, 6, 7, 8, 9."; Layer 11 "1, 2, 3, 6, 7."; Layer 0 suppliers add "TauCetiRoadmap.NewtonPolygons, TauCetiRoadmap.PadicDifferentialEquationsAndRigidCohomology"; Layer 8 suppliers add "TauCetiRoadmap.LocallyAnalyticDistributions". Tested: with these lists every layer's summary equals the union of its Needs lines.

3. **F03** (P3) Five definitions have only two Checks

   Location: `README.md` §2.11 (the proximity on (V∖{0})/O_E×, Checks at lines 861–862), §4.5 (K_y and the marked pair, 1120–1121), §6.5 (the class Π₋(b), 1460–1461), §6.6 (Π(b), 1475–1476), §10.6 (deg and Pic⁰, 2085–2086).

   Claim: each definition has at least three discriminating Checks.

   Witness: each of the five blocks has two bullets.

   Repair: add one Check to each, tested on the computed instance:
   - §2.11: "For ε₂ = ε₁^q = π·ε₁ every a·ε₂ has valuation at least q·v_F(ε₁), so sup_a v_F(ε₁ − a·ε₂) = v_F(ε₁) is finite although y_{ε₂} = φ(y_{ε₁}); the proximity separates a point from its Frobenius translate, as the O_E×-quotient, not the E×-quotient, must."
   - §4.5: "Changing the marking ι: F → K_y^♭ by the Frobenius of F leaves the field K_y unchanged and moves the point to its Frobenius translate; points classify marked pairs, not fields."
   - §6.5: "For b = π − [a], v_F(a) = 1, q = 2, the zeros of the normalized solution are at the radii 2^(−2^n), n < 0 (2^(−1/2), 2^(−1/4), …), accumulating only at 1 and none below 1/2, so it extends to radius 0 and lies in Bᵇ; a model with the forward translates (radii 1/4, 1/16, …) could not extend to radius 0."
   - §6.6: "For b ∈ M_0, Π(b) ∈ P_0 = E is a nonzero scalar, so Π(ub) and Π(b) agree modulo E× for u ∈ M_0; for d = 1, q = 2 and ‖y‖ = 1/2 the divisor of Π(b) has one point at each radius 2^(−2^n), n ∈ ℤ, and weighted degree 1 on (1/4, 1/2]."
   - §10.6: "For c ∈ F× the line with Φ(fe) = φ(f)[c]⁻¹e has degree −v_π([c]⁻¹) = 0; over C its fixed line is E·[u]e with u^(q−1) = c, and its character is σ ↦ σ(u)/u ∈ μ_(q−1) = 𝔽_q× ⊂ E×, trivial exactly when c ∈ (F×)^(q−1); a model reading the character off the multiplier itself would give a nontrivial class to c = 1."

Round 2. The round-1 repairs were verified finding by finding at this head (table below); every one is repaired or settled, and no repair introduced an error. The full pass was then run again on all 109 targets, all 321 Check bullets and the three declarations of `Suggested.lean`. Three new findings, all P3.

## Round-1 findings at this head

| Id | Status | Witness at b7087c1 |
|---|---|---|
| r1a-F01 | repaired | README line 572 "natural inclusion in the single-radius ring B_ρ⁺ (§1.5); it is not a subring of B"; Check line 580 computes v₂((2n)!/2ⁿ) = 0,1,1,3 and the zero at radius 1/4. Recomputed: v_p((pn)!/pⁿ) = (n − s_p(n))/(p−1) ✓. |
| r1a-F02 | repaired (different route) | Lines 1716–1718: positive pieces sum on compact J ⊆ I_minus∖{0} and extend across 0 by §1.2 (N = 0); Check line 1726 (f_k = a^k, radius-zero norm 1, limit a/(1−a)). §1.2 route line 355 is the coefficientwise construction. Sound. |
| r1a-F03 | repaired | Line 511 "Choose γ₀ in Γ with γ₀>0 and put T₀=[t^γ₀]… Bᵇ=A[1/π,1/T₀]"; Check line 526 (Γ = √2·ℤ[1/2]). |
| r1a-F04 | repaired | Line 35 "root-namespace `surjective_fontaineTheta`"; pin line 195 is the root theorem. |
| r1a-F05 / r1b-F04 | repaired against the round-1 head; superseded by S01 | Line 2240 and plan.json name the section that existed then; the supplier has since renumbered (S01). |
| r1a-F06 | repaired | Line 513 "the ultrametric inequality makes its term value equal … (the coefficients themselves may differ)". |
| r1a-F07 | repaired | Line 251; FF17 line 3047 Corollaire 1.6.17 (printed 73), line 3053 Définition 1.6.18 (74), line 3094 Définition 1.6.21 (75). |
| r1a-F08 | repaired | Line 1777 defers the sheaf identification to §8.9; line 1847 states it as a corollary; §8.9 Needs §8.1, §8.3, §8.5 and nothing cites §8.9 before it. |
| r1a-F09 / r1b-F06 | repaired | §2.12 Needs (line 879) "§2.8; §2.9"; Layer 6 is §6.3 divisors, §6.4 Π₊, §6.5 Π₋, §6.6 Π, §6.7 factoriality, §6.8 divisors of eigenvectors; a scan of all 109 Needs lines finds no forward or self reference. |
| r1a-F10 / r1b-F08 | repaired | `Suggested.lean` line 79 `exists_hahnSeries_automorphism_rescaling_order`; README line 2213; docstring keeps the orbit theorem as not statable. |
| r1a-F11 | repaired | Line 1368 imports the Banach topology from "Norm topology on twisted Frobenius invariants" (exists at the VB head, its line 831; label drift S01). |
| r1a-F12 | repaired | Line 529 "{1−p^(−n): n≥0}, … order type ω". |
| r1a-F13 / r1b-F11 | repaired | Line 2016 cites FF17 Proposition 7.6.1 only; manifest and References have exactly FF17, KT16, Berger08, ST02, Poonen93. |
| r1a-F14 | repaired | Line 1299 "for nonzero f … the zero function has no divisor"; line 1325 "B={0}∪{f in M(Y)×: div(f)≥0}". |
| r1a-F15 / r1b-F03 | repaired | Lines 1267, 1278 cite §RD.0.29 and §RD.0.24; at the PadicDifferentialEquationsAndRigidCohomology head these are its lines 1446 and 1318 with the stated titles. |
| r1a-F16 | repaired | Line 1090: characteristic-3 example, σ(a)/a = (1−s)/(1+s), unchanged by −1. Recomputed ✓. |
| r1a-F17 | repaired | §0.9 Check line 304 (values (0,1), (0,−1), reversed for f⁻¹; recomputed ✓); §1.5 Check line 415 (π^n); the four commentary bullets are gone. |
| r1b-F01 | repaired (with 0 < v p added) | `Suggested.lean` line 64; the added hypothesis excludes K = ℂ_p^♭ (char p: v(p) = 0). README line 2180 proves a continuous isomorphism is a homeomorphism; the overring argument checked (rank-one valuation ring has no proper overring other than the field). Mathlib contract line 41 verified at the pin (Complex.lean 137/145/244/251, Perfection.lean 633, Untilt.lean 49). |
| r1b-F02 | repaired | §4.7 line 1152 states the DVR target with ord_y = ord_z; §3.6 line 998 restricts the import to algebraically closed F; §5.2 and §5.6 Needs list §4.7. Length-2 Check line 1162 ✓. |
| r1b-F05 | disputed, dispute correct | FF17 line 5794 prints "|z_i| = ‖y‖^d"; Définition 3.4.1 (line 5720–5723) gives ‖y‖ = |a₀|^(1/d) = |z_i|; with |z_i| = ‖y‖ the linear term of w − π^d has |·|₁ up to ‖y‖, so the source's displayed chain yields only ρ^(−d)‖y‖^(1/2). The Check at line 1176 describes this accurately. |
| r1b-F07 | repaired | Line 55 dictionary; recomputed on [a]πⁿ, v_F(a) = v: VB q^(−(n+v/r)) = n_ρ ✓; point actions inverse ✓. |
| r1b-F09 | settled (option 2) | Docstring line 28 names B⁺ as the missing carrier and `PreTilt 𝓞_ℂ_[p] p` as the tilt. |
| r1b-F10 | repaired | Line 39 "(lines 228 and 278)"; pin: `isOpenMap` 228, `exists_nonlinearRightInverse_of_surjective` 278. |
| r1b-F12 | repaired | Lines 1890, 1920 "endpoints in |F|∩[0,1), the endpoint 0 allowed". |
| r1b-F13 | repaired (reviewer's witness corrected) | Line 868 quotes the absolute value and identifies d with δ; FF17 line 4742 defines d(y₁,y₂) = v_{y₁}(θ_{y₁}(a₂)), the valuation-type quantity; line 4955 prints the inequality, which f = 1 refutes as 0 ≥ δ. |
| r1b-F14 | repaired | Line 13 names §0.1 and §2.10 as owners and RelativeFarguesFontaine's coefficient layer as consumer. |

No repair introduced a new error: each repaired passage was recomputed (table under "Adversarial pass").

## Verified sound

- Declarations read: 3 of 3, against the elaborated signatures in the job's `signatures.md` (no section binder lost; no `def`, `instance`, `set_option`, `lemma`, `True`, sorry'd data, `#eval`; single `import Mathlib`; one module docstring; namespace `TauCetiRoadmap.RelativeFarguesFontainePartII`). All three README names (§11.2, §11.3, §11.5) are declared; every other backticked name is a pinned Mathlib or Tau Ceti declaration, checked at the pin.
- `exists_strict_laurentClosure_endomorphism`: the hypothesis forces ‖·‖ = c^(ord) on k((t)) with c = ‖t‖ < 1 (strict monotone multiplicative map ℤ → ℝ_{>0}), and the extension of an absolute value from a complete field to an algebraic extension is unique, so `UniformSpace.Completion K` is the completed algebraic closure; the statement is KT16 Theorem 1.2 (KT16 line 34–36, arbitrary field k of characteristic p). Identity and Frobenius are surjective, hence excluded; no pinned lemma proves it. Not padding.
- `exists_untilt_padicComplex_not_continuouslyIsomorphic`: 0 < v p < 1 forces characteristic 0, residue characteristic p and a nontrivial rank-one valuation; the ring isomorphism of `PreTilt`s is an isomorphism of the tilted valuation rings, hence of the tilts as valued fields; KT16 Theorem 1.3 (line 64–66) supplies K, algebraically closed because its tilt is. The trivial model K = ℂ_p^♭ is excluded (v(p) = 0). The `Fact (¬IsUnit (p : 𝓞_ℂ_[p]))` binder has no pinned instance (Complex.lean has none; BDeRham.lean takes it as a variable), so carrying it is correct.
- `exists_hahnSeries_automorphism_rescaling_order`: Poonen93 Theorem 2 (line 395–400: L Mal'cev–Neumann with divisible value group and algebraically closed residue field, E ⊆ L, (F,w) ⊇ (E,v) with value group in G and residue field in R, embedding F → L over E) applied to (F, s·v) ⊇ 𝔽̄_p(x) ≅ 𝔽̄_p(y) gives σ with σ(x) = y, v∘σ = s·v, fixing 𝔽̄_p; the image is maximally complete with value group sℚ = ℚ and residue 𝔽̄_p, so equality follows (Corollary 6, line 500–503). Junk order of 0 agrees on both sides. Not padding.
- Headline inventory: of the 20 headline groups in the module docstring, the three with native carriers are stated; the other 17 each lack a carrier that does not exist at the pins (ramified annuli, period rings B⁺/B, marked untilts, the curve, the weak topology on W(O_F)). The A[1/p] half of §11.1 is settled by r1b-F09.
- Targets read: 109 of 109, with their 109 Needs lines (no forward or self reference; no cycle), 321 Check bullets, 9 worked examples, the scope, conventions, contracts and references.
- Locators verified this round: FF17 — 58 labelled items opened at their line with the printed page recomputed from the page markers (pdf page − 10), including every Préface item (Remarque 2.32 p. 25, Théorème 2.35 p. 26, Corollaire 3.3 and note 26 pp. 32–33, Remarque 3.10 p. 35, Remarque 4.4 p. 40, note 8 p. 3, note 11 pp. 4–5), Corollaire 2.2.23 p. 114, Proposition 2.3.12 p. 118, Théorème 6.5.2 p. 255, Propositions 7.1.2, 7.2.4, 7.5.1, 7.6.1, 7.7.2, 7.8.1–2, 7.9.1, Corollaire 7.9.2 (pp. 262–276), Définition 5.1.3 p. 203, Proposition 11.2.5 p. 370, Lemme 11.2.10 p. 372, Proposition 11.2.12 p. 373, Proposition 11.2.15 p. 374, Remarques 11.2.16–17 and Proposition 11.2.18 p. 376, Remarque 11.1.11 p. 366; KT16 lines 34, 64, 101, 105, 169, 210; Poonen93 lines 395, 489, 500; Berger08 line 428 (Remarque 1.1.3, f and g at line 432); ST02 line 293 (definition), 324/326 (Theorems A and B), 348–416 (Corollaries 3.1–3.5), 430 (Lemma 3.6). Mathlib: all 26 cited file-and-line pairs open on the named declaration; Tau Ceti: the 4 WeilDivisor/VectorBundle lines and the three FarguesFontaine modules (`spaY` Y.lean 116, `spaX` Quotient.lean 56, `isOpenQuotientMap_quotientMap` Quotient.lean 107).
- Checks tested: 52 computed instances (table), all correct.
- Sibling citations checked at the current heads: VectorBundlesAndIsocrystals #1205 (16 section names, all present; labels drifted, S01; the Gauss-norm and point-Frobenius dictionary recomputed; "Finite projective Frobenius modules and integral models" has the invertible-linearization convention used in §10.5; "Norm topology on twisted Frobenius invariants" is per-twist as §6.1 says; no degree-two nonrepresentability statement exists there, so the gap is minimal); PerfectoidSpaces P1.19–P1.22, P3.7, P3.11, P3.12 (main, lines 4727–8688); CrystallineCohomology CR.1.1; DerivedDeRhamCohomology PD.1, PD.2, PD.4–PD.7 (PD.3 has no heading at its head; the range "§§PD.1–PD.7" is cited as a range only); LocallyAnalyticDistributions §0.0, §0.2; PadicDifferentialEquationsAndRigidCohomology RD.0.10, RD.0.18–RD.0.23, RD.0.24, RD.0.29, RD.0.54; PadicHodgeTheory §1.2, §1.4; OptimalTransport Layer 5 (no infimal-convolution target there: the gap is minimal); SchemeAndStackFoundations §0.3, §1.23 (its `test_torsor_quotient` is a Check on fine moduli spaces, not the finite étale torsor theorem: the gap is minimal); AdicSpaces §§6.1–6.4 (Completed); AdicSpacesPartIII §R3.2 with the four italic names (its lines 307, 658, 9670, 9696); NewtonPolygons §§0.1–0.6, 2.1–2.3; AdicEtaleGeometry A4.2a; LubinTate design LT.0–LT.2 with slugs analytic-log, lt-module, tate-module-comparison. All six gap slugs agree between `design/plan.json` and the README; each supplier is named; each `needs` is one precise sentence; none asks for what a supplier already provides.
- Ownership by object (`roadmaps grep` over main and the 446 open pull requests): the general Fréchet–Stein interface is stated only here (PadicLocalLanglandsForGL2Qp §0.1 proves it for D(H,L) only; OverconvergentAutomorphicForms consumes that); Kedlaya–Temkin's theorems occur nowhere else; the Hahn-field automorphism theorem occurs nowhere else; "maximally complete" occurs only in DiamondSixOperations and PadicDifferentialEquationsAndRigidCohomology as vocabulary. The §4.7 completion at degree-d points is owned here (VB supplies geometric points only, its lines 162–175).
- Policy: `git diff --stat origin/main...HEAD` touches only `packages/RelativeFarguesFontainePartII/`; no pull-request numbers, process words, `lemma`, `set_option` or machine paths in README or Lean; every target has a locator; no computational algorithm.
- Dependency check output, run read-only: `depcheck: 207 roadmaps, 1783 edges, 0 problem(s)` — no UPWARD, CYCLE or moved line. Merge order: VectorBundlesAndIsocrystals 139, this roadmap 140, RelativeFarguesFontaine 143 (cited only as a consumer).

## Not verifiable

- No Lean was run (read-only pass); the elaborated signatures were taken from the job's `signatures.md` and the round-1 repair report's `#check` comparison.
- Ownership against open pull requests other than those the brief names and those read through `roadmaps show`/`roadmaps grep` was not checked.
- The six declared supplier contracts are future inputs; their eventual proofs cannot be certified from the suppliers as they stand.
- The internal routes that correct the source (§1.2 and §8.2 coefficientwise extension, §8.6 uniform generation, §9.4 arbitrary-compact descent) are targets of this roadmap; they were checked for consistency on instances, not proved.

## Adversarial pass

Standing context: p prime, q = p^f, E as in Conventions, F perfect complete rank-one of characteristic p; G = F algebraically closed. Each row inherits the section's stated hypotheses.

| Statement | Instances tried | Values computed | Result / change |
|---|---|---|---|
| `exists_strict_laurentClosure_endomorphism` hypothesis | x = t, y = 1; reversed iff; trivial norm; k = 𝔽₂(u) imperfect | v(t) = ofAdd(−1) < 1 so ‖t‖ < 1; ‖·‖ = c^ord with c = ‖t‖; trivial norm gives ‖t‖ = 1 = ‖1‖ but v t < v 1, excluded; C_k = C_{k̄} | sound |
| same, conclusion | f = id; f = Frobenius on the perfect completion; k = 𝔽₄ | id surjective; Frobenius surjective and moves a cube root of unity | both excluded; theorem is KT16 1.2 |
| `exists_untilt_…` | K = ℂ_p^♭; (ℂ_p, v∘τ) for discontinuous τ; valuation rescaled v^2 | char p: v(p) = 0, fails 0 < v p; τ: a continuous isomorphism exists, excluded; v² keeps 0 < v² p < 1 and the same O_K | hypotheses tight |
| continuous iso is a homeomorphism (line 2180) | e(O_K) = V ⊇ O_{ℂ_p} | x ∈ O_{ℂ_p}∖V ⇒ x⁻¹ ∈ m_V ⊆ m_{ℂ_p}, contradiction; overrings of a rank-one ring: O or the field | sound |
| `exists_hahnSeries_…` | x = t, y = t²; x = y; z = 0; z = t^(1/2) | s = 2, σ = id when x = y; order 0 = 2·0; order σ(t^(1/2)) = 1 | sound |
| Poonen application | E = 𝔽̄_p(y) ⊂ L; (F, 2v) over 𝔽̄_p(x) | valuation on 𝔽̄_p(x): v(x)·ord_x since constants have v = 0; sℚ = ℚ; residue 𝔽̄_p | Theorem 2 hypotheses met |
| §0.1 diagonal | Δ(π); x ↦ [x] | ghosts (π, π); wrong model (π, π^q) | Check correct |
| §0.1 ghost non-injectivity | p = 2, A = 𝔽₂, (0,0,…) vs (0,1,0,…) | w₁ = 0+2 = 0, w₂ = 0 on both | Check correct |
| §0.2 product | [a]π², [b]π³, |a| = 1/2, |b| = 1/4 | index 5, norm ρ⁵/8; N₁(πx) = N₀(x) = 0 | correct |
| §0.3 limits | [a]π², v(a) = 3 | v_r = 3+2r; /r → 2; → 3; radius-zero q⁻² | correct |
| §0.4 transform | π−[a], v(a) = 2 at r = 1, 3; [a]π² | min(r,2) = 1, 2; 2+2r, −∞ for r < 0 | correct |
| §0.8 bound | min(5r, 11.2−3r) on [0.5,1.5] | 2.5, 6.7, max 7 at 1.4 | correct |
| §0.9 rank-two | f = π[a], v(a) = −r; f⁻¹ | (0,1)/(0,−1); reversed; both power-bounded | neither valuation in Spa(B_I,B_I°) ✓ |
| §0.10 zero-endpoint norm | e = 2, f = 1, q = 2 | 1/4 = (1/2)² = (1/2)^[E′:E] | correct |
| §1.1 | π⁻¹+[a] | lowest index −1, radius-zero norm q | correct |
| §1.5 topology | πⁿ | ρⁿ → 0; |πⁿ|₁ = 1 | bijection not continuous ✓ |
| §1.6 | π⁻¹; [a]⁻¹, v(a) = 2 | heights 0 and −2 | correct |
| §1.9 ramified carries | p = 2, e = 2 | faces (0,1),(2,1/2),(4,1/4); slopes 1/4, 1/8, lengths 2; Σ e(p−1)/(ep^m) = 1 | consistent |
| §1.10 | u²v³, r = 2 | 7 and 3.5 | topological, not isometric ✓ |
| §1.11 term values | q = 2, ρ = 1/2: π⁻¹; T₀; a_n = π^(−n²); π^(−n) | 2; 2^(−γ₀); 2^(n²−n) → ∞; 1 with v_π = −n | criteria correct |
| §1.11 threshold set | a_n = 1 at 1−p^(−n) | values q^(−1+p^(−n)) > 1/q; set {0,1/2,3/4,…} at p = q = 2 | correct |
| §1.13 | p = 2, ρ = 1/2, z = [a]²/2 | v₂((2n)!/2ⁿ) = 0,1,1,3; zero of 2−[a²] at radius 1/4 | B_cris,ρ⁺ ⊄ B ✓ |
| §1.14 k ⊂ O_F | x ≠ 0 in k | x⁻¹ ∈ k ⊂ O_F so |x| = 1 | trivial valuation ✓ |
| §2.1 | p = 2, (1,−1,i,…) | coordinatewise sum (2,−2,…): (−2)² ≠ 2 | addition must be transported ✓ |
| §2.6 | E = 𝔽_q((π)), a = π−c, b = π² | (π+c)(π−c) + c² = π² | correct |
| §2.7 | y = (π−c), v(c) = 2 | v_y(π) = 2, |π|_y = q⁻² | correct |
| §2.10 | q = 2, v(ε) = 4 | ‖ε‖_V = 1/4; πε = ε², ‖·‖ = 1/8; u_ε mod π = ε^(1−1/q); v_{y_ε}(π) = (1−1/q)v(ε) | correct |
| §2.11 inequality | q = 2, equal characteristic, a = 1 | δ(y_{ε₁},y_{ε₂}) = v(ε₁^(1/2) − ε₂^(1/2)) = v(ε₁−ε₂)/2; LHS ≥ v(ε₁−ε₂) = (q/(q−1))δ | consistent |
| §2.12 | f = 1, finite δ | min(0,δ) = 0 both; printed 0 ≥ δ false | Check correct |
| §4.3 | char 3, a = (1+s)(π−t), s² = t | σ(a)/a = (1−s)/(1+s); ×(−1) unchanged | correct |
| §4.6 | d = 2, |a₀| = q⁻⁶ | ‖y‖ = q⁻³; slope 3 | correct |
| §4.7 completion | deg 2, n = 2; deg 3, ord 2 | length 2 chain; Newton jump 6 = 2+2+2 | correct |
| §4.8 | s = 2⁻⁸, ρ = 1/4, d = 1, 100 | max(√s, s/ρ) = 1/16; ρ^(−d)√s = 1/4, 2^196; |e_k([z])|₁ ≤ s^k ≤ s | source bound unsupported, roadmap's correct |
| §4.9 outer factor | degree-d a, ρ ≤ ‖y‖ | |a_n/a₀|ρⁿ ≤ (ρ/s)ⁿ ≤ ρ/s | bound correct |
| §5.1 field case | F = ℂ_p^♭, I = {p^(−√2)}; singleton ρ = |c|^(1/d), (d,p) = 1 | no point, (0) maximal; π^d − [c] has points of radius ρ | dichotomy correct |
| §5.6 | 0; 1; 1/a_y | ord(0) = +∞ excluded; 0; −1 | correct |
| §6.4 M_d | b with b_m ∈ m_F for m ≠ d, b_d ≡ 1 | φⁿ(b)/π^d − 1 has terms |b_m|^(qⁿ)ρ^(m−d) → 0 on compact J ⊂ (0,1) | convergence ✓ (needs b_m ∈ m_F for m > d too, which M_d gives) |
| §6.5 divisor | φ(div x) − div x = D | div x = Σ_{n<0}φⁿD; radii ‖y‖^(qⁿ) → 1 | locally finite ✓ |
| §6.6 | d = 1 | φ(Π₊Π₋) = π Π₊Π₋; coefficient 1 at every translate | correct |
| §6.8 injectivity | x ∈ P_d, x′ ∈ P_{d′}, equal divisors | u = x/x′ ∈ (Bᵇ)×, v_π(φu) = v_π(u) forces d = d′, then u ∈ E | correct |
| §6.10 d = 0; repeated point | empty product ideal; (ξ²) | 0→E→E→0; length 2 | correct |
| §6.11 graded fibre; t = 0 | m ≥ 1; c = √π | P_m/tP_{m−1} ≅ K_y; (cT)² = T·(πT) inequivalent mod E× | correct |
| §6.11 overlapping tails | y₂ = φ⁻¹y₁ | supremum 1 at each backward point, sum would be 2 | correct |
| §7.1 | ν = 2, 3 | ν(ab) = 5; remainder bound allows 3 | weak division ✓ |
| §7.5 | characters χ, ψ | χψ; χχ⁻¹ = 1 | correct |
| §7.6 | p = 2 | X²+πX+π: derivative π ≠ 0 | separable ✓ |
| §8.1 covers | {[a,c),[c,b]}; {[0,2/3],[1/3,1]} | no finite compact refinement; overlap [1/3,2/3] | correct |
| §8.2 | E = 𝔽₂((π)), f_k = a^k | norms 2^(−k); radius-zero 1; sum a/(1−a) | Check correct |
| §8.4 flatness | K[ε]/(ε²) → K | Tor₁ ≠ 0 | not flat ✓ |
| §8.8 | Z = diag(T,T⁻¹) | ZE₂₁Z⁻¹ = T⁻²E₂₁; expansion 1+U+ZVZ⁻¹+UZVZ⁻¹ | correct |
| §8.9 Tate | J = [0,ρ], {0} | |πⁿ|₀ = q⁻ⁿ, ρⁿ → 0; π a unit | Tate rings ✓ |
| §9.3 | σ(e) = [σc/c]e | fe fixed ⇔ f[c] invariant | correct |
| §10.1 | ρ₂ = 1/2, q = 2 | [1/4,1/2] ⊇ (ρ₂^q, ρ₂] | faithfully flat ✓ |
| §10.6 / §10.7 | Φ(e) = π⁻¹e; Φ(e) = λ⁻¹e | deg 1; deg v_π(λ) > 0, fixed vectors B^(φ=λ) | signs agree |
| §10.8 | |b| = 1/4; dominance window | π/[b] vs π[b] factor 16; n = 0 term dominates iff ρ₂^(q/(q−1)) < |ε| < ρ₁^(1/(q−1)), possible iff ρ₂^q < ρ₁ | hypothesis I ∩ I^q = ∅ exactly right |
| §11.1 | β_j → √2 | v_F(h mod p) ≤ β_j and ≥ √2 ⇒ = √2 ∉ ℚ | correct |
| §11.2 d_n | p = 2 | 3, 7, 17, 39; differences 1, 3, 5; d_n/2ⁿ → 3; all odd | KT conditions met |
| §11.4 closed primes | prime p ∌ π containing some [a], a ∈ m_F∖0 | p ∋ [b] for all |b| ≤ |a|, hence all of m_F by radicality; closure gives W(m_F) ⊆ p | matches FF17 Corollaire 3.3 (line 1364–1379) |
| §11.5 stabilizer | σ with σ(y) = φ^k y | σφ^(−k) fixes y; φ commutes with every σ; Stab(y) ∩ φ^ℤ = 1 | product decomposition ✓ |
| VB dictionary (line 55) | [a]πⁿ, v(a) = v | q^(−(n+v/r)) both; π−[a] ↦ π−[a^q], r ↦ qr; precomposition ρ_VB ↦ qρ_VB | inverse actions ✓ |

## Source issues

- **Misprint** in FF17 at Lemma 3.4.5, printed page 143 (FF17 line 5794): the source says each geometric conjugate z_i has norm ‖y‖^d; it should be ‖y‖, by Definition 3.4.1, so the displayed bound (‖y‖^(1/2)/ρ)^(deg y) is not justified; affects the proof.
- **Misprint** in FF17 at Proposition 2.3.2, printed page 115 (FF17 line 4742–4744): the source calls the proximity v_{y₁}(θ_{y₁}(a₂)) an ultrametric distance; it should be q raised to its negative, which is the distance; affects a stated result.
- **Misprint** in FF17 at the proof of Proposition 2.3.16, printed page 120 (FF17 line 4955): the source says |v_{y₁}(f) − v_{y₂}(f)| is at least the proximity; for f = 1 this reads 0 ≥ δ; it should be the truncated equality of Proposition 2.3.2; affects the proof.
- **Misprint** in Berger08 at Remark 1.1.3, printed page 96 (Berger08 lines 429–436): the source starts the convex sequence at β₁ but uses β₀ in the elements f and in the correction Y^(β₀−β₁); it should start at β₀; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b7087c18acf65ea298e54b2a59292b4a8141e4de", "job": "RT-RelativeFarguesFontainePartII~2b", "model": "fable", "worker": "chris-x17"} -->
