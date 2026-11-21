# Review of ThetaSeries (pull request #2725 at e7d0eeb)

**Verdict:** accepted

**Summary.** Accepted: no finding. The folder is unchanged since the review of `e7d0eeb`, and this round read the pull request's description against the head and against the README on main: every sentence of it agrees with both, and the one sentence the previous review corrected (on §6.2) is now right. There is one format note (coarse locators, carried over), not blocking. For the humans: no cited source could be read legally, so wording and arrangement were compared with no source.

## N01 — Locators are coarse or missing

Layers 1, 2 and 4 and §§3.1–3.3, 3.5, 5.1, 5.4, 6.1, 6.4, 7.1, 7.2, 7.6, 8.1–8.5 name no source, and apart from Turaev §1.3, Miyake §4.9, Serre Ch. VII §6 and Conway–Sloane Ch. 2 §2.3 every locator is a whole chapter or appendix. A theorem or page number at each claim would let a reader check the hypotheses.

## Previous findings

The previous review, of the same head `e7d0eeb`, had no finding, one small correction and one format note.

- C01 (description: "each in the form the pinned library proves it", with §6.2 open) — repaired. The description now reads "each except §6.2 in the form the pinned library proves it; §6.2 is an open target, and the parts of its route that the pinned library proves (the intermediate asymptotic and the direct side) assume no coprimality". At the pin, `ZLattice.tendsto_pow_mul_thetaCoset_comap_S` (`TauCeti/NumberTheory/ModularForms/ThetaSeries/Asymptotics.lean` line 78) has no `a`, `c` at all, and `ZLattice.IsEven.tendsto_pow_mul_thetaSeries_nhdsGT` (line 173) takes `(a : ℤ) (c : ℕ) [NeZero c]` with no coprimality.
- N01 (locators) — not repaired; N01 above.

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| §6.2 reciprocity (`gaussSum_eq_mul_dualGaussSum`), the statement the corrected sentence of the description is about | `√2ℤ²` at `(a, c) = (2, 2)`, not coprime; the realised direct side at the same pair | `G_L(2,2) = ∑ e(u²+v²) = 4`; right side `1·½·i·(∑_{u mod 4} e(−u²/4))² = ½·i·(2−2i)² = ½·i·(−8i) = 4`. Direct side: `G/(c^{2k} covol) = 4/(4·2) = ½ = (covol L)⁻¹`, the limit of `t Θ_L(1+it) = t Θ_L(it)` | true; description's sentence correct | none |

The rows for the other statements stand as in the previous review, of `e7d0eeb`: the folder has not changed since.

- The description against the head, sentence by sentence. Form paragraph: the section order (overview, *How to read the build*, *Conventions*, Layers 1–8, *Worked examples*, *Downstream consumers*, *Provenance*, *Scope and ownership*, *Exact supplier contracts* with its three subsections, *References*) is the head's; all 46 item headings end with a lettered id; the name table is in *How to read the build*; main's *Ordering* and *Acknowledgements* headings are gone and the content of the latter closes *Provenance* (lines 1736–1740).
- The record paragraph: *In Tau Ceti:* lines stand at §§1.1–1.6, 2.1–2.8, 3.1–3.5, 4.1–4.4, 5.1–5.4, 6.1–6.4, 7.2, 7.4, 7.6, 8.1–8.5 and nowhere at §§2.9, 6.5, 6.6, 7.1, 7.3, 7.5, 8.6; the partial ones are marked as the description says (§3.4 isometry and scaling only, §5.3 "the first two", §6.2 the intermediate target and the direct side, §6.3 "the corollaries", §7.4 "boundedness at every cusp", §7.6 the Fricke identities and "the constant term").
- The changed-statements list, each bullet read at the merge base and at the head: §1.2 (main: `ℤ^n` by `n` one-dimensional steps; head: any orthonormal basis, slices of `P × E`, AnalyticNumberTheoryPartII §5.3g cited), §2.1 ("preserved by" → "exactly when"), §2.5 (main: "Define `level L` for even `L`"), §3.3 (`> 0` → real and `≥ 1`), §4.3 (even → integral), §6.1 (`G_L(a + 2ct, c)`, `G_L(1,1)` → modulo `c`, `G_L(a,1)`), §6.2 (coprime → all positive), §6.4 (multiples of `N` prime to `a`), §7.6, §8.1 (`= E₈`), §8.3 (Eisenstein form, `r_L(4) + 24 r_L(2) = 196560`), §8.4 (Tau Ceti's Leech lattice). Each is as described.
- Library declarations opened at the pin for those bullets: `ZLattice.gaussSum_eq_of_modEq`, `ZLattice.gaussSum_one` (`TauCeti/Algebra/Module/ZLattice/GaussSum.lean` lines 220, 236), `ZLattice.level_ratModel`, `ZLattice.level_dvd_iff_gram` (`Level.lean` lines 262, 283, both under `IsIntegral`), `ZLattice.one_le_re_thetaSeries` (`ThetaSeries/Cusp.lean` line 204), `ZLattice.IsIntegral.thetaCoset_S_smul` (`ThetaSeries/Inversion.lean` line 159), and the two limits of §6.2 above.
- The paragraph on `Suggested.lean`: the file declares ten theorems and the definition `nebentypus`, exactly those the description lists (reciprocity, Milgram, the closed form, the conductor theorem, the nebentypus; the two spellings of Hecke–Schoeneberg and the two coset statements on `Γ(N)`; the `A₂` and `D₄` representation numbers). Additions: §2.9 and §8.6 are new headings; on main the `A₂`, `D₄` identification is a worked example (main README lines 1015–1034).
- Cross-roadmap citation resolved on main: AnalyticNumberTheoryPartII §5.3g. No other open pull request changes this roadmap, and none drops an id it cites.
- Automatic checks: all passed on this head. Nothing changes outside the folder. Dependency check: `depcheck: 172 roadmaps, 2005 edges, 0 problem(s)`.
- Elaboration: `lake env lean TauCetiRoadmap/ThetaSeries/Suggested.lean` gives 10 `sorry` warnings (lines 64, 77, 88, 102, 130, 141, 152, 161, 175, 184) and nothing else.

Overlap check: read HalfIntegralWeightModularForms, IntegralLattices (on main and its open revision), Rank24LatticeConstructions, SiegelModularForms, MaassForms, LatticePackingsAndPerfectForms, OrthogonalTamagawaAndLatticeMass, ModularForms, as the previous review did; the folder is unchanged and the list of closest roadmaps is the same. Theta series, Poisson summation on a lattice and the real model: owner ThetaSeries. The rank-16 pair and Milgram at every signature: owner IntegralLattices, cited here. Character Eisenstein series, Sturm bound, Fricke operators: ModularForms or Tau Ceti, cited here. Partial Fourier transforms: AnalyticNumberTheoryPartII §5.3g, cited here. Nothing has two owners.

Source independence: changed passages only; the folder has no changed passage, so 0 passages compared with 0 sources. Largest share Ebeling, *Lattices and Codes*, 6 of 19 locators; its text and table of contents could not be read legally, and the arrangement was not compared again (no layer added, removed or reordered).

Research link: Layers 6–7 are the Hecke–Schoeneberg theorem and its Gauss-sum arithmetic (Schoeneberg 1974, Ch. IX; Ebeling 2013, Ch. 3; Milnor–Husemoller 1973, App. 4; Turaev 1998). On main, LatticePackingsAndPerfectForms and QuaternionArithmetic consume Layer 7 and LFunctions consumes Layer 1. Rests on the README's references and those roadmaps' READMEs.

## Not verifiable

- Seeded sample, source side (§5.2: Serre Ch. VII §6; §6.2: Milnor–Husemoller App. 4 and Turaev §1.3; §6.3: Milnor–Husemoller App. 4; §6.5, §7.4: Ebeling Ch. 3, Miyake §4.9; the other sampled sections cite no source): as in the previous review, these works resolve only to publishers' paywalled pages or to no legal copy; nothing further was tried, and no sampled passage changed.

## Source issues

- none

## For the human reviewers

- Not tested: Ebeling, *Lattices and Codes*, has the largest share of the locators (6 of 19). Neither its text nor its table of contents could be read, nor any other cited source, so wording and arrangement were compared with no source.
