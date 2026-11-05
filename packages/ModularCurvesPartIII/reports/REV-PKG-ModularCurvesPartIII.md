<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2311#issuecomment-6665379322 -->
Review (claude) of 5f0b592

Verdict: rejected

1. **F01** (P1) The roadmap is vacuous: it owns nothing and cannot be repaired by fixes

   - **Location.** `packages/ModularCurvesPartIII/README.md` line 3: "This roadmap therefore owns no definition and no theorem: it records, result by result, where each step of the route is developed, and it adds nothing to that development." Line 7: "This roadmap owns no targets." Line 46: "There are no layers here."
   - **Claim.** The package is a complete roadmap in TauCetiRoadmap form.
   - **Witness.** `packages/ModularCurvesPartIII/Suggested.lean` lines 24–26 declare nothing; `design/plan.json` has `nodes: []` and a `restructure` entry `"action": "merge"` with `"roadmaps": ["ModularCurvesPartIII", "GeometricFreyMazur"]`; GeometricFreyMazur (merge order line 101, board package at head `77cce8f`) owns all 67 targets of the route (its §§0.1–10.5 all exist and match every row of the crosswalk, checked below).
   - **Why no fix repairs it.** The README shape requires layers with dependencies, definitions with API and Checks, theorems with hypotheses and locators; every candidate target is owned by GeometricFreyMazur, and the principles forbid re-planning it. The only mathematics of the route without an owner is Hermann's general-type theorem for `Z(p)` with `p > 11` and uniqueness of its minimal model (BT16 line 31; BT16 line 1414), together with the Kani–Schanz classification; `roadmaps grep` for Hermann, Kani–Schanz, Frey–Mazur and Bakker–Tsimerman across main and all open heads finds no owner (only ModularCurvesPartII §4.7, for the projective level curve). Planning that needs a new design, not a fix round.
   - **Repair (for a human).** Either apply the design's merge proposal, keep GeometricFreyMazur as sole owner and retire ModularCurvesPartIII; or commission a new design whose scope is the Hermann and Kani–Schanz surface theory of the diagonal quotient `Z(p)` (general type for `p > 11`, uniqueness of the minimal model, the classification of its curves of low genus), written as a Part II of GeometricFreyMazur with the quotient surface and its resolution imported from GeometricFreyMazur §§0.2 and 10.3.

2. **F02** (P3) Hecke-operator locator cites BT16 §§2.3–2.4; the Hecke correspondences are §2.5

   - **Location.** `packages/ModularCurvesPartIII/README.md` line 10: "… and the cyclic Hecke images `H_m` with degree `ψ(m)` are GeometricFreyMazur §§0.1–0.6 (BT16 §§2.3–2.4)."
   - **Claim.** BT16 §§2.3–2.4 cover the frames, `Z(p)`, the CM strata, the bicusps and the Hecke images.
   - **Witness.** BT16 line 249 (§2.3, the diagonal quotient surface), line 262 (§2.4, (anti-)Heegner CM points and singular bicusps), line 294 (§2.5, Hecke operators, with the cyclic correspondence `T_n` at line 296).
   - **Repair.** Replace "(BT16 §§2.3–2.4)" by "(BT16 §§2.3–2.5)". Tested: §2.5 at line 294 contains the Hecke correspondence that the row's last clause cites.

3. **F03** (P3) The summary attributes the k-uniform quantifier order to BT16 Theorems 1–2

   - **Location.** `packages/ModularCurvesPartIII/README.md` line 3: "for every gonality bound `N` there is `M_N` such that, over an algebraically closed field of characteristic zero, two nonisotrivial elliptic families … are isogenous over the same base (BT16, Theorems 1–2; BT16 lines 51–63)."
   - **Claim.** BT16 Theorems 1–2 state `M_N` before the field `k`.
   - **Witness.** BT16 line 51: "Let k be an algebraically closed field of characteristic 0. For any N > 0, there exists M_N …": `k` is fixed first and `M_N` may a priori depend on it. The uniform form is GeometricFreyMazur §9.5 (descent to a finitely generated subfield embedded in ℂ) and §9.7, which the summary does not cite at that sentence; `geometric_frey_mazur` in GeometricFreyMazur's `Suggested.lean` line 75–76 quantifies `∃ M` before `k`.
   - **Repair.** Either cite the uniformity where it is proved, "(BT16, Theorems 1–2, BT16 lines 51–63; uniformity in `k`: GeometricFreyMazur §§9.5 and 9.7)", or state the sentence with `k` fixed first as BT16 does. Tested against the two quantifier orders: for fixed `k = ℂ` both agree; the uniform order needs GeometricFreyMazur §9.5's descent argument, which the README's row for §§9.1–9.8 (line 19) already cites.

4. **F04** (P3) The list of GeometricFreyMazur's suppliers omits one roadmap and the libraries

   - **Location.** `packages/ModularCurvesPartIII/README.md` line 22: "The surface-theoretic, analytic and abelian-scheme inputs of these sections (SchemeAndStackFoundations, AlgebraicCurves, FuchsianOrbifolds, ComplexKahlerGeometry, RiemannianGeometry, ComplexComparisonPartII, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties, CongruenceSpectralGap) are GeometricFreyMazur's suppliers".
   - **Claim.** These nine roadmaps are GeometricFreyMazur's suppliers.
   - **Witness.** GeometricFreyMazur README at head `77cce8f`, "Exact supplier contracts", lines 54–136: the subsections also include "From Mathlib" (line 54), "From Tau Ceti" (line 64), "From TauCetiRoadmap.ModularCurves and TauCetiRoadmap.ModularCurvesPartII" (line 68) and "From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups" (line 126; merge order line 49).
   - **Repair.** Add InverseGaloisAndArithmeticFundamentalGroups to the parenthesis (ModularCurves and ModularCurvesPartII are already named on line 9, and Mathlib and Tau Ceti on line 42).

The package is honest and internally consistent, but it is not a roadmap: it owns no target, no layer, no definition and no theorem. Its design plan (`packages/ModularCurvesPartIII/design/plan.json`) has `nodes: []`, `gaps: []` and a `restructure` entry of action `merge` into GeometricFreyMazur, and the package README is a result-by-result crosswalk from BT16, BTE and ABR96 to GeometricFreyMazur §§0.1–10.5. A fix round cannot repair an empty scope, and porting the package would put a roadmap folder with no layers, no Checks and no acceptance statements into the content repository. Under the brief, a package whose scope is wrong is `rejected` and a human decides. The findings below record what a human, or a later design, must settle; the P3 findings apply only if the folder is kept in some form.

## Verified sound

- **Elaboration.** `lake env lean` on `packages/ModularCurvesPartIII/Suggested.lean` from the content checkout: exit 0, no output at all (no `sorry` warning, since the file has no declaration). The file has the single `import Mathlib`, no `TauCeti.*` import, no `set_option`, no `lemma`, no sorry'd data, one module docstring naming the headlines that are not statable and what each lacks. The one-tactic padding probe and the `#check @name` comparison apply to no declaration.
- **Dependency check.** Output of the gate: `depcheck: 226 roadmaps, 2225 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. The sole supplier, GeometricFreyMazur, is merge-order line 101; this roadmap is line 102.
- **Supplier drift.** GeometricFreyMazur is not on main and not in a content-repository pull request (the `roadmaps resolve` lead "GeometricFreyMazur §§0.1: no roadmap … on main or in an open pull request" is a false positive: it is a board package, merge order line 101, board pull request head `77cce8f`, byte-identical in README and `Suggested.lean` to the head `444c965` the author read). Every cited section exists there: §§0.1–0.6 (lines 144–285), §§1.1–1.8 (325–441), §§2.1–2.7 (463–545), §§3.1–3.6 (567–651), §§4.1–4.4 (675–737), §§5.1–5.8 (763–877), §§6.1–6.5 (901–1011), §§7.1–7.5 (1037–1087), §§8.1–8.4 (1111–1153), §§9.1–9.8 (1177–1295), §§10.1–10.5 (1323–1393); "Conventions" (line 17) and "Exact supplier contracts" (line 52). The three Lean names exist in its `Suggested.lean`: `gonality` (line 42), `full_monodromy` (line 54, hypotheses `5 < p` and `800 * N < 7 * p` at lines 57–58), `geometric_frey_mazur` (line 75, `∃ M` before `k K` at line 76). Each crosswalk row's content was compared with the section it names: §7.2 states the `6·n!·p` inertia bound (line 1051), §7.5 bounded-gonality rigidity over ℂ (line 1089), §8.1 the `7D/800` bound (line 1113), §8.3 full `SL₂(𝔽_p)` image for `p > max(5, 800N/7)` (line 1141), §9.5 uniformity over `k`, §9.7 the original-base form, §9.8 the function-field form, §10.5 existence of a minimal model by contracting known curves (line 1395, "no general-type classification or uniqueness"), §0.5 branch orders 2, 3, p (line 266), §1.6 the comparison `tanh²(r/2) h_Y ≤ h_X ≤ h_Y` (line 417), §1.7 injectivity radius `2 log p + O(1)` (line 429).
- **Other citations.** ModularCurves §0D (main, `TauCetiRoadmap/ModularCurves/README.md` line 375, "Finite étale schemes and Galois actions") and §5B (line 1313, "Full ordered bases and fixed pairing"); ModularCurvesPartII §4.7 at its open head (line 1490, "Projective full level in the Bakker–Tsimerman setting"). AlgebraicCurves, FuchsianOrbifolds, ComplexKahlerGeometry, RiemannianGeometry and SchemeAndStackFoundations are on main; ComplexComparisonPartII, AbelianSchemesAndArithmeticModuli, NeronModelsAndSemistableAbelianVarieties and CongruenceSpectralGap are merge-order lines 42, 46, 55 and 100, all before line 102.
- **Sources (seeded sample).** The roadmap has no targets, so the seeded sample of 15 is empty; instead every locator the README cites was opened. BT16: Theorem 1 (line 51), Theorem 2 (line 60), the remark on surjectivity onto `SL₂(𝔽_p)` and footnote 3 (lines 64–67, 91), Theorem 3 (line 69), Theorem 29 (line 1337), its proof with the `6n!` and `O(p)` inertia bounds (lines 1340–1400, the bound at line 1365), Corollaries 30, 31, 32 (lines 1403, 1406, 1415), Hermann's general-type statement (line 31), Lemma 5 (363), Lemma 6 (423), Proposition 7 with the `tanh²` comparison (430–432), Corollary 8 (442), Lemma 9 (490), Lemma 10 (510), Lemma 11 (551), Proposition 12 (588), Lemma 15 (677), Remark 16 (705), Proposition 17 (711), Proposition 18 (775), Propositions 25–27 (1132, 1145, 1175), Lemma 28 (1183); §2.3 (249), §2.4 (262), §2.5 (294), §3 (321); the left action `h ∘ φ = φ ∘ g⁻¹` (line 271). BTE: Propositions 2.1, 4.1, 4.2 (lines 47, 106, 139; its references at lines 176–181 show that its "[2, Prop. n]" labels are those of arXiv v1, so they do not contradict the manifest's note that v2 numbering agrees with the published version). ABR96: Theorem 0.1 with the constant `7/800` (lines 14–17). All three manifest entries are certified, with DOI or arXiv id, and no cited work is missing from `sources.toml`.
- **Ownership.** `roadmaps grep` (README only, case-insensitive) for Hermann, Kani, Frey–Mazur, Bakker–Tsimerman and `Z(p)` over main and all open heads: the only relevant matches are ModularCurvesPartII §4.7 and its citations of BT16 §§2.1–2.2 and §2.5 for the level curve and the cyclic correspondence; nothing on main mentions the route. GeometricFreyMazur is the sole owner of every routed result. Ownership against open pull requests whose files the brief does not give was not checked beyond that grep.
- **Principles.** No route-specific shortcut, no re-planned roadmap (the package deliberately plans nothing), no upward or cyclic supply, no copied passage (the README paraphrases and gives line locators), no algorithm, no sorry'd data, no `set_option`.
- **Style.** No LaTeX delimiters, no pull-request numbers, dates, job ids, hand-off notes or machine paths in README, Lean file or manifest; `metadata.toml` has the single `topic` line the other board packages carry.

### Adversarial table

The README states conventions and citations only; each displayed value was recomputed.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `ψ(m) = m ∏_(ℓ|m)(1 + 1/ℓ)` against `σ₁` (line 26) | m = 1, 4, 6 | ψ(1) = 1; ψ(4) = 4·3/2 = 6, σ₁(4) = 7; ψ(6) = 6·(3/2)(4/3) = 12, σ₁(6) = 12 | agrees with GeometricFreyMazur Conventions line 50; the m = 6 coincidence shows the m = 4 witness is the discriminating one |
| left action `g·φ = φ ∘ g̃⁻¹` (line 26) | composite g, h | g·(h·φ) = φ∘h̃⁻¹∘g̃⁻¹ = φ∘(g̃h̃)⁻¹ = (gh)·φ; `φ ∘ g̃` would give (hg)·φ | a left action; BT16 line 271 has the same inverse |
| `p > 5` for compact triangle uniformization (line 11, line 26) | p = 5, 7 | 1/2 + 1/3 + 1/5 = 31/30 > 1 (spherical); 1/2 + 1/3 + 1/7 = 41/42 < 1 (hyperbolic) | threshold correct; GeometricFreyMazur Conventions: "p > 3" suffices for the algebraic strata only |
| full-monodromy threshold `800N < 7p` (line 36) | N = 2; N = 1 | p = 227: 7p = 1589 < 1600 fails; p = 229: 1603 > 1600 holds; N = 1: gonality < 1 is impossible, statement vacuous | matches `full_monodromy` lines 57–58 and GeometricFreyMazur §7.5's remark that N ≤ 1 is vacuous |
| Abramovich constant `7/800` (line 18) | D = 1 | (21/100)·(π/3)/(8π) = 21/2400 = 7/800 | matches ABR96 line 17 and GeometricFreyMazur §8.1 line 1119 |
| local index bound `6·n!·p` (line 17) | n = 1; n = 2 | n = 1: 6p; n = 2: 12p; BT16 line 1365 gives `6n!` without a singular bicusp and O(p) with one | GeometricFreyMazur §7.2 line 1051 sharpens O(p) to one factor p |
| `tanh²(r/2) h_Y ≤ h_X ≤ h_Y` (line 11) | r → 0; r → ∞ | tanh²(r/2) → 0 (cusp metric dominates near the cusp); → 1 far from cusps | BT16 line 432 has exactly this comparison |
| injectivity radius `2 log p + O(1)` (line 11) | compact versus cusped | BT16 Corollary 8 (line 442): ρ_X = 2 log p + O(1); Lemma 5 (line 363): ρ_Y = 2 log p + O(1) | both cited; GeometricFreyMazur §1.7 line 429 distinguishes radius from length |
| `vol(C) = 2π Deg C` (line 15) | compact hyperbolic curve of genus g | Gauss–Bonnet: area = 2π(2g − 2) = 2π·deg K_C | normalisation consistent with curvature −1 |
| `Z(p) = (X(p) × X(p))/PGL₂(𝔽_p)` (line 3, 26) | scalar a ∈ 𝔽_p^× | (φ₁a⁻¹, φ₂a⁻¹) has the same φ₂∘φ₁⁻¹, so the diagonal GL₂ action factors through PGL₂ | BT16 line 258; BTE line 11 writes PSL₂, see Source issues |
| quantifier order of `geometric_frey_mazur` (line 35) | ∃M before k, K | GeometricFreyMazur `Suggested.lean` lines 75–76: `(N : ℕ) : ∃ M : ℕ, ∀ (k K : Type u) …` | README paraphrase matches the Lean; BT16's own order differs (R03) |
| `gonality` junk value (line 34) | K = k | defining set empty, sInf ∅ = 0 | README restricts the claim to one-variable function fields, as GeometricFreyMazur does |

Statements checked and found correct: 12. Findings: 4 (1 blocking).

## Not verifiable

- The published Annals pagination of BT16 (pp. 709–744) and the manifest's claim that arXiv v2 numbering agrees with it: the legal copy in the cache is arXiv v2, and the Annals copy was not fetched (the README cites theorem numbers and arXiv lines only, so nothing in the package depends on it).
- Ownership against open pull requests whose files the brief does not provide was checked only through `roadmaps grep` over their heads.

## Source issues

- **Misprint** in BTE at §1, printed page 1: the erratum writes the surface `Z(p)` as the quotient of `X(p) × X(p)` by `PSL₂(𝔽_p)`; it should be the quotient by `PGL₂(𝔽_p)` as in the corrected article's §2.3 (BT16 line 258), the `PSL₂` form being correct only on a fixed-pairing component; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5f0b59267dcc9b8dce258e2fe06fb8fd1deea305", "job": "REV-PKG-ModularCurvesPartIII", "model": "fable", "worker": "chris-x19"} -->
