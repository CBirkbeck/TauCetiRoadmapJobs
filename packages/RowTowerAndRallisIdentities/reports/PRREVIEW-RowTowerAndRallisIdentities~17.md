# Review of RowTowerAndRallisIdentities (pull request #3027 at 374b9ce)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** A review of the change against `main`: 403 changed lines since `74a09b7`. The review covers the new `*Origin:*` and `*Method of the formal proof:*` labels of 5.1–5.12, the two `*Corollary of:*` lines (5.2a, 5.10a), the corrected supplier lines (ThetaLiftsForDefiniteUnitaryGroups 3.2, MetaplecticAutomorphicForms §§5.6, 6.13, 6.14, SeesawForThetaChains §6.14 (c)) and the new references, checked against the cited texts at their locators. The ranges the labels assign to J.-S. Li (1992) and to Gan–Qiu–Takeda, Propositions 11.1 (ii) and 11.2, were computed against the chain's ranks and are correct. No section, layer or declaration is removed, and no statement changes. Accepted, with two small corrections (5.2a describes its supplier VonNeumannAlgebras V9.IntegrableDiscreteSeries without that section's second-countability hypothesis; the "Weil's convergent range" wording in three labels is imprecise) and two format notes, none blocking. Two things are left for the human reviewers: a licence question on Barnes (1980), and the formal proof, which is the main source and was not compared.

## C01 — The 5.2a label, its `*Corollary of:*` line and the supplier contract say VonNeumannAlgebras V9.IntegrableDiscreteSeries holds for every unimodular locally compact group; at this head it assumes second countability, as 5.2a does.

A reader is told that 5.2a is a special case of the supplier and that the supplier covers groups that are not second-countable. Neither is true at this head. V9.IntegrableDiscreteSeries (`TauCetiRoadmap/VonNeumannAlgebras/README.md`, line 2534) opens with "a unimodular second-countable locally compact group". It attributes the case without second countability to Barnes but does not state it. The Origin of 5.2a (lines 507–508) nevertheless says that the supplier "states it, with its source, for every unimodular locally compact group, and this section is its case of a second-countable group". The parenthesis of the `*Corollary of:*` line (line 518) and the contract line under From TauCetiRoadmap.VonNeumannAlgebras (line 2636) also leave out second countability. The deduction is unaffected, because the two statements coincide.

Smallest change: say that V9.IntegrableDiscreteSeries states it in the same generality (Barnes proves it without second countability), and add "second-countable" at lines 518 and 2636.

## C02 — In the Origin labels of 5.5, 5.6 and 5.8g, "in Weil's convergent range, that of the step `i = 0`" reads as if only the first step met Weil's condition. Every step meets it; what separates the first step is `dim Y_1 > 2 dim Y_0`.

5.5 assumes Weil's condition for `Y_{i+1}` at every `i` (line 767: Witt index `⌊(m−i−1)/2⌋ < t`). That is Gan–Qiu–Takeda's "Weil's convergent range", `r = 0` or `m − r > n` (GanQiuTakeda14 line 141, with `d(n) = n` for unitary pairs, line 353). The Proposition 11.1 (ii) that the same labels cite for `i ≥ 1` is exactly the convergent case inside `n < m ≤ 2n` (GanQiuTakeda14 lines 2580–2602).

Example: for `k = 8`, `m = 4`, `t = 13`, `r = 11`, step 1 has `(n, m, Witt index) = (24, 37, 1)`, and `37 − 1 > 24`. What J.-S. Li (1992) supplies and Gan–Qiu–Takeda do not is the range `m > 2n`: step 0 has `24 > 22`, and the first step of the core column has `28 > 24`.

Suggested wording: "J.-S. Li (1992), in the range `dim Y_1 > 2 dim Y_0` of the step `i = 0`" in 5.5 and 5.6, and "of the first step of the column" in 5.8g.

## N01 — "*Sources:* ingredients (Rallis; Hecke)" (5.6, line 960) and "*Sources:* ingredients (Shimura; …)" (5.11, line 2287) keep the word "ingredients" from the former tag. Dropping it, or writing "(…), for the ingredients", would match the other sections.

## N02 — Origin labels that call a statement published name works without a theorem number: Wallach (1984) and DeGeorge and Wallach (1978) in 5.3 (line 547), and Shimura, Deligne, Milne and Harris in 5.10a (line 2084). A theorem or section number for each, as 5.2a gives for Barnes and 5.3 for Muić, would let a reader check the claim.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.5 Origin: Li (1992) for step 0, GQT Props 11.1 (ii), 11.2 for `i ≥ 1` | `k=8, m=4, t=13, r=11` (R1, R2, `t>r`, `r,t` odd) | `n_i = 11, 24, 37, 50`; step 0: `24 > 22`; step 1: `37 ≤ 48`, `37−1 > 24` (convergent sub-case); step 2: Witt index 0 | holds | C02 wording |
| 5.6 Origin and Needs: MetaplecticAutomorphicForms §6.14 only for `i ≥ 1` | §6.14 = GQT Thm 11.7: `n < m ≤ 2n`, `r ≤ n` | `(24,37,1)` inside; `(11,24,1)` outside (`24 > 22`); base tuple has no twist places; real places by 5.5 Lemma (a) | holds | none |
| 5.8g Origin: first core-column step Li, later steps GQT | base rank `r+1 = 12`, step `s−1 = 16` | `n = 12, 28, 44`: `28 > 24`; `44 ≤ 56` | holds | C02 wording |
| 5.7 Origin: model identity in Weil's range | `θ_j^*` from `U(W_j)` (rank 11) to anisotropic `U(V_j)` (rank 24) | Witt index 0, so Weil range; `24 > 22` | holds | none |
| 5.2a Corollary of V9.IntegrableDiscreteSeries | hypotheses on each side; `G = 𝕋`, `σ = z^n`; `SL₂(ℝ)` weight 2 | V9 and 5.2a both second-countable; label says V9 general; `𝕋`: `ρ(e_σ)` projects onto `z^n`-isotypic part; weight 2 is `L²`, not `L¹` | deduction holds, description wrong | C01 |
| 5.2a Method: range of `ρ(e_σ)` equals `{T(w)}` | `ρ = σ^{⊕ℵ₀}` | `Hom(σ,ρ) ≅ ℓ²`; `{Σ c_i w_i : c ∈ ℓ²}` closed, equals range | holds | none |
| 5.2 Origin locators | Rallis84Howe lines 435, 520; Wu13 line 406 | Thm 1.1.1 p. 345 (constant terms along maximal parabolics); Corollary p. 351 (cuspidality); Prop 3.1 p. 9 (unitary tower property) | holds | none |
| 5.3 Origin: Muić Lemma 4-2 | Muic16 lines 733–736 | (i): Poincaré series of `L¹`, `Z`-finite, `K`-finite `φ` is a cuspidal automorphic form | holds | N02 (others) |
| 5.5 Origin: Rallis (1984b) Prop 1.1 | Rallis84Injectivity lines 345–348 | pp. 149–150; hypothesis `m > 2(k+k′)+2` (absolutely convergent range) | holds | none |
| 5.8h Origin | GanIchino16 lines 8–10; GanGrossPrasad12 lines 1528, 3029 | FJ case of local GP from Bessel case via local theta; §12 p. 43 Bessel data; §23 p. 86 global periods | holds | none |
| 5.8c Origin vs body | lines 1386–1403, 1414–1417 | unitary-character factor marked own in both; (iii) for non-regular vectors rests on ThetaLifts §6.3 in both | consistent | none |
| 5.10a Corollary of AutomorphicBundles and ShimuraVarieties §4.11 | sections at head; signature `(k+j−1, m−j)` | AutomorphicBundles 2.7, 3.1, 3.2, 4.3, 6.4, 11.2, 11.9, 11.18 present; SV §4.11 on main; `j=1`: `(8,3)`, `j=3`: `(10,1)`, reflex field `K` | holds | none |
| Contract edits: ThetaLifts 3.2, 1.4; Metaplectic §5.6 | base and head ThetaLifts headings; 5.11 Needs | 3.2 = RIPF at both; 3.3 = convergence; 1.4 absent from 5.11 Needs at base and head; §5.6 in 5.11 Needs | corrections true | none |
| Downstream: SeesawForThetaChains §6.14 (c) | Seesaw README line 403 at head | (c) defines `ζ_ℂ(u, ξ)` as a root of unity, `ζ_ℂ(u,1)=1` | holds | none |
| Headline (1), positivity of the factors (unchanged) | split place, `β = i`, `u = 1`, `Nw = 2`, `s = 2` | `|1 − i/4|^{−2} = 16/17 > 0`; with `B(w̄)=B(w)`: `(15/16 − i/2)^{−1}`, not real | holds | none |
| Headlines (1)–(3) in `Suggested.lean` | module docstring; elaboration | none statable; each named with its missing carriers; no declarations; elaborates with no message | holds | none |

- Source locators checked against the text: 11 (Rallis84Howe 2, Rallis84Injectivity 1, GanQiuTakeda14 4, Wu13 1, Muic16 1, GanIchino16 1, GanGrossPrasad12 1 for 5.8h).
- Cross-roadmap citations resolved at this head or on main: VonNeumannAlgebras V9.IntegrableDiscreteSeries; AutomorphicBundles §§2.7, 3.1, 3.2, 4.3, 6.4, 11.2, 11.9, 11.18; ShimuraVarieties §4.11; MetaplecticAutomorphicForms §§5.6, 6.12–6.14; ThetaLiftsForDefiniteUnitaryGroups 1.4, 3.2, 3.3; ThetaKernelsForUnitaryDualPairs §6.13a; SeesawForThetaChains §6.14; GanGrossPrasadUnitaryGroups 2.6.
- README at the merge base compared with the head: no heading, layer, section or Lean declaration removed or renumbered; labels added under every section, 5.1 with Origin only, as its Labels paragraph says.
- Library declarations opened: none needed (`Suggested.lean` declares nothing, and the diff names no library declaration).
- Dependency check: `depcheck: 132 roadmaps, 1482 edges, 0 problem(s)`; no upward or cyclic line.
- Elaboration: `lake env lean` on `Suggested.lean`, no output, exit 0.
- Worker's automatic checks: all passed. A rerun of the full gate failed only on the folder check (below).
- Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, GluedTargetAndDivisionInequality, BesselPoincareSeriesAndGramBounds, ThetaLiftsForDefiniteUnitaryGroups, ThetaKernelsForUnitaryDualPairs, ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, HodgeClassesForJacquetLanglands (grep for theta/Rallis only). The projector of 5.2a is owned by VonNeumannAlgebras V9.IntegrableDiscreteSeries, and the rational cusp forms of 5.10a by AutomorphicBundles §§11.2–11.18, both cited through the `*Corollary of:*` lines. Nothing else is shared.

Source independence: changed passages only; 11 passages compared with 7 sources, none shared beyond the standard name of a result (8 words: "the Fourier–Jacobi case of the local Gross–Prasad conjecture", GanIchino16 line 8); largest share [FormalProof], 93 of 114 locators, not read; arrangement not compared (no layer added, removed or reordered).

Research link: 5.5–5.7 and 5.8g are cases of the Rallis inner product formula (Rallis 1984; J.-S. Li 1992; Gan, Qiu and Takeda 2014), and 5.2 of Rallis's tower property (Rallis 1984; Wu 2013), here for the unitary theta chains of Alpöge's formal proof of GRH for Dirichlet L-functions (announced 2026). This line rests on the README's Origin labels and GanQiuTakeda14 §§1.7, 11.4.

## Not verifiable

- Barnes (1980), Lemma 1 and Proposition 1 (5.2a): the sources service found no legal copy; the DOI resolves to a Cambridge Core page in no licence class.
- J.-S. Li (1990) and (1992), Wallach (1984), DeGeorge and Wallach (1978), Kudla and Rallis (1994), Ichino (2004), Kashiwara and Vergne (1978), Arthur and Clozel (1989), Labesse (1999), Shimura, Deligne, Milne, Harris: cited in the Origin labels by work only, without a locator to check, and not fetched.
- Wu (2013): read as arXiv:1409.0770v1; its numbering was not compared with J. Number Theory 133.
- The `*Method of the formal proof:*` labels: statements about [FormalProof], a Lean repository not in the sources cache; checked only for consistency with each section's statement and route.
- The pull request's description, as quoted, is truncated and does not name this folder. Nothing in the quoted part is contradicted here: section numbers are unchanged, and labels and `*Corollary of:*` lines are added.

Automatic checks set aside as false positives: the check that a pull request changes nothing outside the roadmap folder under review (it guards against unreviewed edits to other roadmaps) listed 117 files, all in the other roadmap folders this same pull request adds or revises; those folders are the pull request's own and each has a review of its own, so none of the 117 is an edit outside the pull request's scope.

## Source issues

- none

## For the human reviewers

- The decisions recorded for this pull request concern sections that leave a family roadmap; this folder removes none, so neither decision was needed here.
- Licence: Barnes (1980), Proc. Edinburgh Math. Soc. 23, backs 5.2a and VonNeumannAlgebras V9.IntegrableDiscreteSeries; its Cambridge Core page could not be classified, so Lemma 1 and Proposition 1 were not checked.
- Not tested: the source with the largest share of locators is [FormalProof] (93 of 114), an unrefereed Lean formalisation announced 2026-11-20, not in the sources cache. The new Method labels were not compared with it, either for accuracy or for wording.
