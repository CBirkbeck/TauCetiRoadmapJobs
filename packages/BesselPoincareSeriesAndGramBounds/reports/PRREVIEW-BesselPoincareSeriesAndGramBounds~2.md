# Review of BesselPoincareSeriesAndGramBounds (pull request #2916 at 2e29c07)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/BesselPoincareSeriesAndGramBounds/`
**Verdict:** needs changes

**Summary.** Changes are needed. On the mathematics, there are two findings:
- The Check of the headline 5.15a uses test functions that the projector `R(e_σ)` annihilates, so they do not satisfy the hypotheses the Check claims they satisfy (R01).
- The uniqueness and existence of Bessel models in 5.13c (d) and 5.13d (e) restate GanGrossPrasadUnitaryGroups §2.6 and §3.9 without citing them (R02).

Two further findings concern statements and sources: the overview states the Gram bounds under fewer hypotheses than 5.20 and 5.21 need (R03), and no target has an exact locator, so none of the fifteen sampled targets could be checked against a source (R04). Every other value I recomputed holds, including the explicit primes of 5.23, the local densities of 5.17 and the mass ratios of 5.20a. There are four small corrections and no format notes. The human reviewers decide on scope and licence: 26 of the 28 targets rest only on a formal proof announced on 20 November 2026.

## R01 (P2) — The Check of 5.15a and the second Example use test functions that the projector `R(e_σ)` does not fix, so they do not satisfy the hypotheses of 5.15a

This Check is the equality case offered for the headline 5.15a. As written, its test functions are coefficients of the conjugate representation, and `R(e_σ)` annihilates those unless `σ` is self-conjugate. A reader who builds the example therefore gets a function outside the theorem.

Here is a computation in the README's convention (conjugate-linear in the first variable). Take `𝐆 = U(1)` with Haar probability measure, `σ(θ) = e^{inθ}` with `n ≠ 0`, `d = 1` and `w = b = 1`. Then:
- `e_σ(θ) = conj⟨1, e^{inθ}⟩ = e^{−inθ}`;
- the Check's `W(x) = ⟨σ(x)w, b⟩ = e^{−inx}`;
- `R(e_σ)W(x) = ∫e^{−inθ}e^{−in(x+θ)}dθ = e^{−inx}∫e^{−2inθ}dθ = 0 ≠ W`.

In general, `R(e_σ)W` integrates a product of two coefficients of `σ`, and that integral vanishes by Schur orthogonality whenever `σ ≇ σ̄`. With the opposite inner-product convention the same example again gives `R(e_σ)W = 0`. By contrast, 5.13 (f) correctly uses `W = l(D(·)w)`, which is linear in `D(·)w`. The Check is at line 476 and the Example at line 1694.

The smallest repair is to take `W = √d·⟨b, σ(·)w⟩` and `W′ = √d·⟨b′, σ(·)w⟩`. Then `R(e_σ)W = W` and `∫|W|² = 1`. Schur orthogonality gives `O(γ) = ⟨b, σ(γ)b′⟩` and `∫|O(γ)|²dγ = 1/d`, so the Check still exhibits equality.

## R02 (P2) — The uniqueness clause of 5.13c (d) and the existence statement 5.13d (e) restate GanGrossPrasadUnitaryGroups §2.6 and §3.9 without citing them

This gives archimedean multiplicity one and the existence of Bessel models two owners. In addition, 5.13d (e) has neither a route nor a supplier, only an attribution to He and Xue, so an implementer has nothing to import.

GanGrossPrasadUnitaryGroups is earlier in the merge order and is already this roadmap's supplier for 1.2 and 4.1. At its head it states two relevant results:
- §2.6: for every relevant pair of odd codimension over a local field, ℝ with Casselman–Wallach representations included, the Bessel model has dimension at most one.
- §3.9: the real tempered theorem for ℂ/ℝ in every odd codimension, namely `m = 1` exactly for the distinguished pair (Xue).

The pair here, `z′^⊥ ∩ (X_0 ⊕ ⟨z⟩) ⊂ Y_0`, has complement `ℍ^{r_S} ⊕ ⟨z′⟩`, so it is relevant, and a Bessel map `D^∞ → V_π` is an element of that model.

What the README says at these places:
- 5.13c (d) (lines 193–194) asserts that every Sobolev-continuous Bessel map `D^∞ → V_π` is a multiple of `l`.
- 5.13d (e) calls the existence "a case of the local Gan–Gross–Prasad conjecture … proof not given here" (lines 235–236).
- It concludes that "(e) rests on the known theorem above" (lines 259–260).

Neither the *Needs* lines, nor the Scope section, nor the supplier contracts name §2.6 or §3.9. RowTowerAndRallisIdentities already cites GanGrossPrasadUnitaryGroups 2.6 for multiplicity one of these same discrete series (its README, lines 1195 and 1714).

The repair has three parts:
- In 5.13c (d), cite GanGrossPrasadUnitaryGroups §2.6 for "at most one Bessel map up to scalars". Keep as this roadmap's own the rank-one form of `be` and the statement that `be` detects the model.
- In 5.13d (e), cite §3.9 for existence. State the remaining step, with its locator in Xue: that the distinguished member is the interlacing pattern of 5.13a.
- Add both sections to the *Needs* lines, the Scope paragraph and the GanGrossPrasadUnitaryGroups supplier contract.

## R03 (P2) — The Summary's third headline, and the docstring of `Suggested.lean`, state the Gram bounds under (St) and the rank window only, but 5.20 and 5.21 need further hypotheses

The overview is the one place where the headline is stated. A reader of it would conclude that the Gram bounds hold for every host, every pair of level primes and every pair of words that differ at a letter.

The Summary (line 5) states the bound "under the standing size conditions (St) of 5.20a and the rank window" for "two words `u ≠ u′` that differ at one letter". 5.20 also assumes the following, none of which is among the conditions (St) lists (lines 1257–1265):
- `E/F` unramified at all finite places;
- the hypotheses of 5.20b, among them that `T(u)`, `T(u′)` are primes `≥ 3`, split completely in `E`, prime to `g₀g₁` and congruent modulo `g₀g₁`, and that `g₀ ≠ g₁`;
- `m ≥ C_m`;
- that the two types differ by exactly `Δ_w` at the letter at every `τ`.

5.21 likewise assumes the hypotheses of 5.20b, including that `T(u)` is a prime split completely in `E`. Line 44 of `Suggested.lean` repeats the shorter list.

The repair is to say in both places "under the hypotheses of 5.20 (the conditions (St) of 5.20a, those of 5.20b, `E/F` unramified at the finite places, and the rank window), two words whose types differ by `Δ_w` at a letter …", and "for one word, under the hypotheses of 5.21, …".

## R04 (P2) — No statement in the README carries an exact locator

Without locators, none of the fifteen sampled targets, including the three headlines, can be checked against a source. Where the README says a step is not given here, an implementer also has no proof to fall back on.

The References assign [FormalProof] to "every *NEW* target" (line 1815), which is 26 of the 28 targets, with no declaration or file named. The KNOWN attributions name papers but give no theorem or page, for example:
- Sun–Zhu and Jiang–Sun–Zhu at 5.13c;
- He, Beuzart-Plessis and Xue at 5.13d;
- DeGeorge–Wallach, Clozel, Savin and Langlands at 5.16;
- Gan–Hanke–Yu, Siegel, Shimura and Weil at 5.17–5.20.

The README contains no theorem number and no page anywhere. Several routes say their proof is not given here: 5.13d (e), 5.20c (a), 5.21 (i), and 5.23 (v) (1) and (vi). For these, the locator is the only support.

The repair is to name, at each NEW target, the declarations of the formal proof that state it, starting with the headlines and the sampled targets, and to give a theorem and page at each KNOWN attribution. For example, the `r_S = 0` multiplicity one in the Checks of 5.13 is Sun–Zhu, Theorem B (arXiv 0903.1413v2, p. 2).

## C01 — 5.17c uses the symbols `Kp` and `Ns`, which are defined nowhere

They appear in the statement of (b-v) (line 664) and in its route (line 690). From 5.17b they mean `K^{loc}` and `N^{loc}`; write those.

## C02 — AutomorphicSpectralTheory §4.5 is cited for trace class, but on main it is "Finite multiplicity in the discrete spectrum"

The citation appears in the Scope section (line 1718) and in the supplier contract (line 1780). AutomorphicSpectralTheory has no trace-class statement for the cuspidal spectrum of a general group; its trace-class material is §§0.9, 0.10 and the compact-quotient §6.17. The trace class that 5.16 uses is DiscreteSeriesCoefficientsAndAutomorphicMetrics §9.1, which the README also cites. Relabel §4.5 as finite multiplicity, or drop it.

## C03 — The docstring of `Suggested.lean` says that neither library has unitary representations of a topological group on a Hilbert space, which is not true at the pins

The claim is at lines 17 and 21, and again in the 5.15a bullet. At the pins:
- Mathlib has `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean`, line 55).
- Tau Ceti adds `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean`, line 49) and strongly continuous orbits (`…/Unitary/StronglyContinuous.lean`).

The conclusion that 5.15a is not statable still holds: the quotient measures on `S\𝐆` and `S\𝐆/S′` and the formal degree are missing. Naming the existing carriers would stop an implementer from building a parallel one.

## C04 — Two sentences of the pull-request description do not match the heads

"The family index (…) is carried, with identical content, by every pull request of the family": the index at this head agrees with #2918, but not with three other heads:
- #2909 and #2903 lack the sentence on citations by section number and carry an older entry for the Chow forms roadmap;
- #2919 rewrites the paragraph on what the formal proof states.

The heads therefore conflict, and the description gives no order in which to reconcile them. A correct wording would be: "is carried by every pull request of the family; the versions at the heads differ and are reconciled before merge."

"the targeted Lake build succeeds with `sorry` as the only warning": `Suggested.lean` declares nothing, so elaboration gives no warning at all.

## Questions for the author

- 5.13d (e): is the interlacing `u_1 > hc_1 > ⋯ > hc_{k−1} > u_k > hc′_1`, with the alternating signs of RowTowerAndRallisIdentities §5.3, exactly the distinguished member of GanGrossPrasadUnitaryGroups §3.9 for this pair and both line signs? I could not check this because Xue's paper has no legal copy available.
- Which declarations of the formal proof state 5.15a, 5.16 and 5.20? In its export I found namespaces with matching vocabulary, for example `GlobalTheory.SchurOrthOnSubgroup`, `Development.WeilBound.RepresentationTheoryGL.LimitMultiplicityWeights` and `Formalism.L2.SG.ThmSOwn.TheoremSDistinctWords`. I could not decode their statements from the kernel terms.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 5.13c (d) rank one | equivariance of `be` | `be(D(s₀)v,v′) = ψ(s₀)π(s₀)be(v,v′)`; rank-one side gives the same with `l(D(s)v) = ψ(s)π(s)l(v)` | holds | none |
| 5.13c (d) uniqueness, `r_S = 0` | `U(k,1) ⊃ U(k)` | Sun–Zhu Thm B: `dim Hom ≤ 1`; README: `π` occurs once | holds | R02 (owner) |
| 5.13 (f) | half-integrality; `h_nv`; `R(e_D)W` | `(r−k)/2 = r_S+½`; `8√(2q_S)(N₁+2rq_S) = 64r²q_S+16√2rq_S^{3/2} = 32r²m+8rm^{3/2}`; `R(e_D)l(D(·)w) = l(D(·)w)` | holds | none |
| 5.13d (g) | sum rule | `Σ_s ϰ_s = T·(lead coeff) = T` for `r_S = 0`, `= 0` for `r_S ≥ 1` (`e_1` isotropic) | consistent | none |
| 5.14 | `S_u(F)`-invariance, adjoint | `Ph_T(sy) = Ph_T(y)` via `ψ_u(hnh⁻¹) = ψ_u(n)`, `T(π(h_∞)ξ)(1,h_fh) = T(ξ)(h)`; adjoint matches conjugate-first | holds | none |
| 5.15 / 5.13a `Gr` | `r_S = 0`, `r_S = 1` Gram determinants | `det = TT′−\|D₁\|²`; `det = \|D₂\|²−TT′\|D₁\|²`; signs `(−1)^{r_S+1}` match | holds | none |
| 5.15 Check | `v = (0,√T)`, `w = (a,b)` | `\|⟨v,w⟩\|²−TT′ = T\|a\|² ≥ 0`, zero iff `a = 0` | holds | none |
| 5.15a (headline) | compact `𝐆`, `S = S′ = 𝐆`, `W = σ(·)w` | `O = σ(γ)/d`, `‖O‖² = n/d²`, `dγ(pt) = 1/vol`: total `1/d` | equality, holds | none |
| 5.15a Check | `U(1)`, `σ = e^{inθ}`, `n ≠ 0` | `R(e_σ)W = 0` vs `W = e^{−inx}` | fails | R01 |
| 5.15a chain remark | dimension count | `2(r_S(2r_S+2k+1)+k²)+2r_S+2−(k−1)² = (k+2r_S+1)²` | holds | none |
| 5.16 (headline) | totally definite `V`; Langlands Check | near `γ` unipotent of finite order ⇒ `γ = 1`, `m = D*`; cocompact case `m = d·vol` | holds | none |
| 5.17a | `GL₂(𝔽_q)`; `q = 2, 3` | top eigenvalue `q/(q−1)` on cuspidals; `8/3 > 5/2`; `∏(1−3^{−i})^{−1} ≈ 1.785 ≤ 2` | holds | none |
| 5.17c (headline step) | exponents; Gauss factor; classification | `\|t\|^{−ℓ(ℓ+1)/2+ℓ/2} = \|t\|^{−ℓ²/2}`; `\|z\|^{ℓ²/2}`; `det H_ℓ(a) = (ℓ+1)a^{−ℓ}`; char-0 factor ⊇ ℤ, nondiscrete | holds | C01 |
| 5.17d | `m = 1` inert; `d_sup` | `q^{r−1}(q^r−(−1)^r)/q^{2r−1} = α(r)/α(r−1)`; `Σ_p p^{−j} ≤ 2.58·2^{−j}` (`j ≥ 2`) | holds | none |
| 5.17 Checks | `g = 3`, `T = 1`; `⟨3,3⟩` over `ℚ_3(i)` | `−99`, `−11`; `Gr = 2Tg²+g⁴`; `\|U₂(𝔽₃)\| = 96`, density `96` | holds | none |
| 5.18c | wave identity | `T(Y)U(s) = [[Y+p+cs,−c],[c⁻¹,0]]`; `e_s⁻¹pe_s = p+sc` | holds | none |
| 5.18 | site quantum determinant; `u = u′`; (i₁) gaps | `T(Y+1)ᵀ𝐉T(Y) = 𝐉` (with `pc⁻¹ = c⁻¹(p−1)`); `qdet ≤ 0`; gaps `≥ 99q₀+100`, `h/2 ≥ 240r³` | holds | none |
| 5.19 Check | `L = 0` | conclusion `(1+C(C/Θ)^f)(1+e₁)𝔧` | holds | none |
| 5.20a (a) | mass ratio; level index | ratio `= \|L(1−M,η^M)\|/2^f`; `Σ_{k<M≤r}M = (m−1)k+m(m−1)/2`; `g^k∏_{i>k}(g^i−1) ~ g^{km+m(m−1)/2}` | holds | none |
| 5.20b lemma | `γ*diag(T,−T′)γ` | `T²\|b\|² = T′²\|c\|²`; `c = 0` ⇒ `(a−1)/T = 0`; `∏\|c\|_w ≥ (T/g)^f` | holds | none |
| 5.20c | block `[[0,t],[t,0]]` | `D₁ = 0`, `D₂ = −t²` | holds | none |
| 5.20 (headline) | `η_off` at `b = 16` | `≤ 0.19b^{−6}+0.5b^{−6} < b^{−6}`; `log ε_N ≤ −(8C_n log 2−C₄)m⁵fL+(m+3)log 2` | holds | R03 (overview) |
| 5.21 (headline) | arithmetic of (iii), (v) | `2Γ₀d²/D* ≤ 2(C₀/Γ₀)d`; `dim ker P_u ≤ ‖K−1‖²_HS` | holds | R03 (overview) |
| 5.22 | `k = 1`, `r = 2` | cuspidal `(1−1/g)`, split `(1+1/g)`; `1 + (g−1)` copies | holds | none |
| 5.23 Check | `q = 19`, `d = 526679`, `g = 1136944064017` | primes; `g ≡ 1 (16qd)`; norm form `= g`; `p ≤ 19` split; `Σ1/∏P_j = 4.6·10⁻⁷ ≤ 1/76` | holds | none |

- Source locators: the README has none. I read the Announcement (lines 9–13 and 45–53) and SunZhu2012, Theorem B (line 66, p. 2). JiangSunZhu2010 is paywalled, so it is recorded as uncertified; Xue (Duke 2023) has no legal copy.
- Formal proof: I searched the operator's kernel export of it by declaration name (7.1 million name entries). There are vocabulary matches, but I decoded no statement.
- Library declarations opened at the pins:
  - Mathlib: `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:55`), `IsFoelner` (`MeasureTheory/Group/FoelnerFilter.lean:91`), `IsMulLeftInvariant` (`MeasureTheory/Group/Defs.lean:77`).
  - Tau Ceti: `ContRepresentation.IsUnitary` (`TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:49`), `…/Unitary/StronglyContinuous.lean`, and `…/Integrated/Basic.lean` (additive monoids only).
- Cross-roadmap citations resolved:
  - every section id of the nine family suppliers, at their heads;
  - GanGrossPrasadUnitaryGroups 1.2, 2.6, 3.9 and 4.1, at its head;
  - ten roadmaps on main, including GeometryOfNumbersAndQuadraticArithmetic 4.4.14 and ClassicalGroups §6.6;
  - one label is wrong (C02).
- Supplier thresholds rechecked:
  - DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (c), (d) and §2.4b (b) against 5.13, 5.13d (g) and 5.18 (i₁);
  - the §8.2 conventions of PositivityOfDirichletSeriesWithKernels against 5.17c;
  - the type-level index lemma of ThetaChainsOnDefiniteUnitaryGroups §2.9a against 5.20a (a).
- Automatic checks: all passed, and none was set aside. The dependency check printed `depcheck: 171 roadmaps, 1998 edges, 0 problem(s)`. Nothing outside the folder and the family index changes.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with no output. The file declares nothing, so there were no signatures to compare with `#check`.

Overlap check: I read the scope of:
- the open roadmaps closest in vocabulary and in results: RowTowerAndRallisIdentities, ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, GluedTargetAndDivisionInequality and SeesawForThetaChains;
- the closest roadmaps on main: AutomorphicSpectralTheory, AnalyticNumberTheoryPartII and AutomorphicLFunctionsAndLocalFactorsPartII;
- the supplier GanGrossPrasadUnitaryGroups.

Two objects are shared:
- the Bessel–Poincaré series, which this roadmap owns; SeesawForThetaChains cites 5.14;
- multiplicity one and existence of Bessel models, which GanGrossPrasadUnitaryGroups §§2.6 and 3.9 own (R02).

Source independence: 8 passages compared with 3 sources, none shared.
- The sources were the Announcement; SunZhu2012 (its abstract and Theorem B against 5.13c (d) and the Checks of 5.13); and the formal proof's export, which carries names and no prose, against the overview, 5.15a, 5.16, 5.19 and 5.20.
- The README has no exact locators, so no share of locators can be computed. [FormalProof] is the only reference of 26 of the 28 targets.
- The contents were not compared, because the copy held has no table of contents: not tested.

Research link: 5.16 is a uniform-error form of the limit multiplicity theorems of DeGeorge–Wallach (1978), Clozel (1986) and Savin (1989). 5.13c–5.13d specialise the archimedean Gan–Gross–Prasad theory (Sun–Zhu 2012, Jiang–Sun–Zhu 2010, He 2017, Xue). 5.20–5.21 serve the theta-chain argument of Alpöge's announced formal proof (2026). This rests on the README's References and on SunZhu2012, Theorem B.

## Not verifiable

- The fifteen sampled targets and the headlines have no locator in [FormalProof]. The copy held is a kernel export without source text, so they were checked by computation instead (table above).
- [FormalProof] repository URL (line 1815): its host is unclassified, so I did not fetch it.
- Xue, *Bessel models for real unitary groups: the tempered case*: the Project Euclid landing page has no PDF. Jiang–Sun–Zhu (2010) is paywalled.
- The deep estimates beyond the values in the table were not rederived: 5.18b–5.18e, the counting in 5.20b and 5.20c, and the crude bound of 5.21 (i).

## Source issues

- none

## For the human reviewers

- Scope: 26 of the 28 targets are marked *NEW* and cite only [FormalProof], a Lean development announced on 20 November 2026 (Announcement lines 45–49 say that no readable write-up exists yet). No refereed text states these targets.
- Licence: the repository URL the README gives for [FormalProof] is on a host the sources service does not classify. The operator's copy of the formal proof is a kernel export with no stated licence.
- Not tested: [FormalProof], the reference of every *NEW* target, has no prose and no table of contents in the copy held, so neither the wording nor the arrangement was compared against it.
