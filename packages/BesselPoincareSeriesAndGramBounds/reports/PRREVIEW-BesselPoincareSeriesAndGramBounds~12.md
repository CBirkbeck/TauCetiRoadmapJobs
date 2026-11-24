# Review of BesselPoincareSeriesAndGramBounds (pull request #3027 at 71bbefa)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 431 changed lines since `aecb53a`. I checked the new `*Origin:*` and `*Method of the formal proof:*` labels of all 29 sections against the statements and routes they describe, every source locator the change adds, the fifteen sections of the seeded sample, the README at the merge base item by item, and every cross-roadmap id the README cites at this head. There is no finding: the labels agree with the mathematics of their sections, and no layer, item or id is removed or renumbered. Accepted with four small corrections (one section labelled published that its own label shows is adapted, two imprecise locators, and new attributions that name an author but no work) and one format note, none blocking; the standing of the formal proof that the labels describe is left to the human reviewers.

## C01 — 5.13c is labelled `published:`, but its own label and its body say that (c) and (d) differ from the published statements, which is the `adapted from` form

A reader who uses the labels to decide what can be cited from the literature will take 5.13c as citable as stated, and it is not. The family index defines `published:` as "with the source" and `adapted from` as "with what is changed" (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 57–58). The label of 5.13c (lines 249–256) goes on to say what is changed: "Here (c) is stated for Sobolev-continuous Bessel maps of every unitary representation, and (d) for discrete series with a large gap". The body (lines 279–282) says what (d) adds to the published form in GanGrossPrasadUnitaryGroups §3.3. The cited Lemma 7.3.1 of Beuzart-Plessis (2020) is for tempered representations, and it gives a growth bound by `Ξ^{H\G}·σ^d`, not boundedness (BeuzartPlessis2020 lines 6990–6994). Clause (c) asserts boundedness for every unitary representation.

The smallest repair: begin the label "*Origin:* adapted from Jiang, Sun and Zhu (2010) …" and keep the rest as written.

## C02 — The rank-one clause is attributed to Theorem 7.2.1 of Beuzart-Plessis (2020), which states only the nonvanishing criterion

In the label of 5.13c (lines 250–251), the regularised Bessel form "has rank at most one and is nonzero exactly when a Bessel functional exists" is credited to Theorem 7.2.1. That theorem states only `L_π ≠ 0 ⇔ m(π) ≠ 0` for tempered `π` (BeuzartPlessis2020 lines 6813–6814). The bound on the rank is the remark after it, which applies to irreducible `π` and rests on Theorem 6.3.1 (lines 6825–6826). The repair is to write "Theorem 7.2.1 and the remark after it (from Theorem 6.3.1)", or "§7.2".

## C03 — The locator §§2, 4 for Gerasimov, Kharchev and Lebedev (2002) leaves out §6, where the Capelli generating function is matched with an entry of the Toda monodromy

The label of 5.18a (line 1155) and the References entry (line 2609) cite §§2, 4 for "the Capelli generating function as an entry of the Toda monodromy". In that paper (arXiv math/0204206v3), §2 introduces the Capelli generating function `A_n(λ)` (lines 364–372) and §4 gives its Gelfand–Zetlin form (Proposition 4.1, lines 823–827). The monodromy matrix `T_n(λ)` with entry `A_n(λ)`, and its match with the operators of §4, are in §6 (lines 1278–1306). The locator should read §§2, 4, 6.

## C04 — Several new Origin labels name an author but no work, and the label of 5.23 names no source at all

The labels in question:

- 5.13 (line 408): "Jacquet; Wallach".
- 5.14 (line 471): "Godement".
- 5.15 (line 553): "Jacquet".
- 5.17c (line 939) and 5.18d (line 1351): "Jacquet and Ye".
- 5.23 (line 2348): adapted "from the statistics of factorisation types of random polynomials over a finite field", with no source given.

The References entries that the change adds for these authors (lines 2605–2608) give no titles. The family index asks that an `adapted from` label name the published result it adapts, and as written a reader cannot find it. The repair is to name each work, with a locator, in the References. For 5.23 that means a published treatment of the factorisation statistics of polynomials over finite fields, or a textbook if the fact is standard.

## N01 — The rewritten `*Sources:*` lines keep the words "method", "ingredients" and "frameworks" from the former tags

At lines 538, 857, 1140, 1248, 1294, 1494 and 1590 the lines read "*Sources:* method (…)", "*Sources:* ingredients (…)" and "*Sources:* frameworks (…)". These no longer parse as sentences, and they repeat the Origin label. Drop the leftover word, or fold the parenthesis into the Origin label.

## Questions for the author

- In 5.22 (a), lines 2305–2307, the change removes the upper bound `wt_v(𝔣) ≤ ∏_j(1 + g^{−d_j})·wt_GG(𝔣)` from the results called this roadmap's own, but it still gives [FormalProof]'s form as `(1 + 1/g)^r`. The Method label of FiniteReductiveGroups §5.8 says that the formal proof has `Σ_j c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. Is the product bound now meant as a statement of [FormalProof]? If it is, the sentence would say so. If it is not, the Conventions make it this roadmap's own and the earlier wording was right. I did not open the formal proof's source, so I could not settle this.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 5.13a big cell, sign of `Gr` | `r_S = 0`, `U(k,1)` | `Gr = |⟨xz″,z′⟩|² − TT′ = −det Gram(z′, xz″)`; two negative vectors span a (1,1)-plane, so `det ≤ 0`, `Gr ≥ 0`; weight `(|𝔷|²−TT′)^{k−1}` | consistent with its Method label |
| 5.13c rank one, uniqueness | BP2020 Thm 7.2.1, Lemma 7.3.1; JSZ Thm A; SZ Thm B | 7.2.1: `L_π≠0⇔m(π)≠0` only; 7.3.1: tempered, bound `Ξσ^d`; JSZ A: `dim ≤ 1`; SZ B: codimension one | C01, C02 |
| 5.13 Bessel function | `r_S = 0`: `S = U(k)`, `ψ = 1` | uniqueness by multiplicity one of `π` in `D|U(k)`; He Thm 0.1 (line 97): occurrence exactly under interlacing | label matches route |
| 5.13b majorant, regularised form | BP2020 §7.1 real case, Lemma 6.5.1(iii) | elliptic regularity in the torus `a(t)` with `λ(a(t)ha(t)^{−1}) = tλ(h)`; integrability against `(1+|λ|)^{−δ}` | label accurate |
| 5.13d existence, walk | BP Thm 12.4.1; Xue Thm 2.2; KS L2.7, T2.5, T3.2; HKS T5.3 | 12.4.1: exactly one member with `m = 1`, no root numbers; Xue: root numbers; KS/HKS: codimension one only | label accurate |
| 5.14 lattice count | Method against route | route: `∏_v‖x_v^{−1}δy_v‖ ≥ (τ₁(x)τ₁(y))^f`; Method states the same norm product | consistent; Muić (2009) not read |
| 5.15 identity, degenerate terms | `u ≠ u′` | 5.15 (b): identity terms sum to `0`, degenerate terms vanish; Method: Schur's lemma kills the identity cell | consistent |
| 5.15a relative Schur (headline) | `S = S′ = {1}`, `V = ℂ` | `O(γ) = ⟨b, σ(γ)b′⟩`, `∫|O|² = 1/d`: equality; Origin calls this the nearest published case | consistent |
| 5.16 limit multiplicity (headline) | Origin against Summary (2) | error `exp(−c·nf log n)`, uniform in rank, field, level and weight in both | consistent; Savin (1989) not read |
| 5.17a Gelfand–Graev bound | `q = 3`; `q = 2, k = 3` | `∏_{i≥1}(1−3^{−i})^{−1} ≈ 1.785 ≤ 2`; `8/3 > 5/2`; Method's `∏_{i<k}(q^i−1)` matches route | true |
| 5.17d local density | inert, `m = 1`, `r = 1` | `N(x) = a` has `q+1 = q^0(q+1)` solutions; density `1 − (−1)^r q^{−r} = α(r)/α(r−1)` | true |
| 5.17 mean value formula | Check `⟨3,3⟩` over `ℚ_3(i)` | `|U_2(𝔽_3)| = 3·4·8 = 96`; Method's mass of the rank-`(k−1)` complement = route's `mass(k−1)` | consistent |
| 5.18a transfer matrix | Molev 2002 Thm 1.3; GKL §§2, 4, 6 | Thm 1.3: homomorphism `Y(m)→Y(n)` with qdet identity (lines 326–329); monodromy entry only in §6 | C03 |
| 5.18c Fourier majorants | Method against route | top coefficient = frequency `s` times the slice; divided difference over `2j+1` nodes | consistent |
| 5.18d blocks | phase `Σx_k + D/∏x_k` | critical points `x_j = z`, `z^d = D` (d of them); Hessian `(I+J)/z`, `det = d·z^{−(d−1)}`; value `dz` | matches route and label |
| 5.18e level zero | Markov's inequality | `sup|p′| ≤ (2d²/L)sup|p|`; at `L = 2` it gives `d²`; Method's absorption of defects = route | true |
| 5.20b loops | lemma, `c = 0` case | `|a| = 1`, `T ≥ 3`: `|(a−1)/T| ≤ 2/3` at every conjugate, so `0`; determinant in `g^{s−1}𝒪_E`, Hadamard bound | consistent |
| 5.20d type bound | Method against route | amplitude bound × pair count = route "product of two inequalities"; (b) gives `j(t) ≥ 1` | consistent |
| 5.20 distinct words (headline) | `u ≠ u′` | Method "identity and degenerate terms contribute nothing" = 5.15 (b) | consistent |
| 5.21 equal words (headline) | Method against (ii), (v) | degenerate part `≤ d_u^{all}e^{−kf log k}`; nonzero when `e_diag < ((T−2)/(T−1))^f` | consistent |
| 5.22 weights | `k = 1`, `r = 2` | split: `c₁ = 2`, `(1−1/g)+2/g = 1+1/g ≤ (1+1/g)²`; irreducible: `1−1/g`; term `(g^k−g^{k−1})/g^k = 1−1/g` | true; question above |
| 5.23 (v)(1) embedding | `H` trivial | group determinant is `u`; `V·u² ⊂ V₂` injective, so `dim V ≤ dim V₂` | true; C04 for source |

- 23 source locators checked against the cached texts in 12 sources: BeuzartPlessis2020 (Thm 7.2.1, Lemma 7.3.1, Lemma 6.5.1, §7.1, Lemma B.1.1, Thm 12.4.1), Xue2023 (Thm 2.2, Cor 2.5), He2017 (Thm 0.1), JiangSunZhu2010 (Thm A), SunZhu2012 (Thm B), Kobayashi–Speh 2025 (Lemma 2.7, Thms 2.5, 3.2), Harris–Kobayashi–Speh 2025 (Thm 5.3), Beuzart-Plessis 2018 (§3.2, Prop. 3.2.1, Lemma 3.2.1), Ichino–Lapid–Mao (introduction), Molev 2002 (Thm 1.3), Gerasimov–Kharchev–Lebedev 2002 (§§2, 4, 6).
- Record against the merge base: one layer (Layer 5) and 29 sections at both ends, no heading removed or retitled, no item deleted; the diff only adds labels, replaces the former tags and extends the References.
- Labels: all 29 sections 5.13a–5.23 carry both labels (16 particular to the proof, 12 adapted, 1 published); no section carries `*Corollary of:*`.
- Cross-roadmap ids resolved at this head: 62 ids in nine family roadmaps and 29 in general roadmaps (GanGrossPrasadUnitaryGroups §§1.2, 1.3, 2.6, 3.3, 3.9, 4.1; RealSemisimpleLieGroups; AdelicAlgebraicGroups; AnalyticNumberTheoryPartI §2.15; AnalyticNumberTheoryPartII §5.3k; ClassicalGroups §§6.1, 6.3–6.6; GeometryOfNumbersAndQuadraticArithmetic §4.4.14; the cited Layers of VonNeumannAlgebras, LieGroups, CompactGroups, LieHighestWeight). All present; FiniteReductiveGroups §2.6 has the "Wider form (c)" that 5.22 now cites.
- Library: the pinned Tau Ceti and Mathlib were searched for square-integrable representations and formal degrees (none) and for `IsUnitary` (`TauCeti/Analysis/CStarAlgebra/Action/Covariant/Basic.lean` line 40). This is consistent with the unchanged module docstring.
- Automatic checks: all passed. Dependency check: `depcheck: 1 roadmaps, 8 edges, 0 problem(s)`, with no UPWARD or CYCLE line. The diff touches only folders the brief names as this pull request's own.
- Elaboration of the unchanged `Suggested.lean` (namespace only, no declaration) with `lake env lean`: exit 0, no messages.
- Overlap check: I read the scope of ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities, SeesawForThetaChains and ThetaChainsAndFrobeniusPrimeSums (main), FiniteReductiveGroups, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups and ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (this head), QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups, and GanGrossPrasadUnitaryGroups. Nothing is shared: the change adds labels and citations, not objects. The regularised Bessel form stays GanGrossPrasadUnitaryGroups §3.3's and is cited at 5.13c.

Source independence: changed passages only; 14 passages compared with 11 sources (BeuzartPlessis2020, Xue2023, He2017, JiangSunZhu2010, SunZhu2012, Kobayashi–Speh 2025, Harris–Kobayashi–Speh 2025, Beuzart-Plessis 2018, Ichino–Lapid–Mao, Molev 2002, Gerasimov–Kharchev–Lebedev 2002). No wording is shared beyond standard names ("interlacing", "quantum Sylvester theorem"). The largest share of locators is [FormalProof], 123 Lean-file locators of about 150. Contents were not compared, because no layer is added, removed or reordered.

Research link: 5.13c–5.13d make explicit, for gapped discrete series, the archimedean uniqueness and existence of Bessel models (Jiang–Sun–Zhu 2010, Sun–Zhu 2012, Beuzart-Plessis 2020, Xue 2023, He 2017). 5.16 is a uniform form of limit multiplicity (DeGeorge–Wallach 1978, Savin 1989). The Gram bounds feed the announced formal proof of GRH for Dirichlet L-functions (Alpöge 2026). This rests on the README's Summary and References and on the sources read.

## Not verifiable

- Muić (2009), Math. Ann. 343, cited in the label of 5.14: the sources service resolves it only to a paywalled page.
- Petersson (1930), Math. Ann. 103, cited for 5.14 and 5.15: the service resolves it only to a paywalled page.
- Gelfand and Graev (1962), Dokl. Akad. Nauk SSSR 147, cited for 5.17a: not opened; no open copy is recorded.
- Siegel (1935) and Shimura (1997), cited for 5.17d and 5.17: not opened (journal on JSTOR; book).
- Savin (1989), DeGeorge and Wallach (1978) and Clozel (1986), cited for 5.16: not opened.
- Krob and Leclerc (1995) and Zuckerman (1977): not opened. Theorem 5.6 of Harris–Kobayashi–Speh and §2 of Ichino–Lapid–Mao: fetched, not read beyond the parts cited above.
- [FormalProof], the Lean source: the Method labels were checked against the routes in the README, not against that source.

## Source issues

- none

## For the human reviewers

- Scope: 16 of the 29 sections are labelled particular to [FormalProof] and every Method label describes it. It is a Lean formalisation announced on 20 November 2026 (README References; family index lines 14–23), not a refereed publication.
- Licence: the family index (lines 20–23) says the formal proof was published without a licence. The new Method labels paraphrase its arguments section by section (README 5.13a–5.23).
- Not tested: [FormalProof], the source with the largest share of locators, is Lean code. The wording and arrangement checks were not run against it.
