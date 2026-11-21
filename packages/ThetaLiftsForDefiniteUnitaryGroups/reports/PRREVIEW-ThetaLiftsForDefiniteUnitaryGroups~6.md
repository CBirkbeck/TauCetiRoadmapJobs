# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #2897 at 7cda043)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every Check, worked example and formula that could be recomputed was recomputed and agrees with the statements (the table is on the board), the 13 literature locators that carry a theorem or page match the texts, and the supplier sections cited say what they are cited for. Of the previous review's three small corrections two are repaired and one partly; there are two small corrections and three format notes now, none blocking. Left for a human: the 60 file locators into the formal proof announced on 20 November 2026 could not be opened, so none of the "form of the formal proof" statements was checked against it.

## C01 — For `n = 0` the sign in the inert-place Check of 2.3 is `+`, not `±`

The Check of 2.3 (line 922) gives the base-change parameter of `χ̃_V ∘ det` for `n = 0`, `d = 2` as "`χ_{V,v}(ϖ_v)(q_w^{1/2}, q_w^{−1/2})`, that is `±(q_v, q_v⁻¹)`", and the Examples paragraph of Layer 2 (line 1035) repeats `±(q_v, q_v⁻¹)`. A reader takes both signs to occur. By the route of the same section `χ_{V,v}(ϖ_v) = η_v(ϖ_v)^n = (−1)^n`, which is `+1` for `n = 0` (`χ_V` is trivial on `𝔸_F^×` and `ϖ_v ∈ F_v`), so the parameter is `(q_v, q_v⁻¹)`.

The smallest change: write `(q_v, q_v⁻¹)` in both places. The point of the Check, that `q_w = q_v²` and not `q_v`, is unaffected.

## C02 — 6.7, 6.8 and 6.9 describe "the form of the formal proof" without a file or declaration

Every other statement attributed to [FormalProof] names a file and a declaration (60 file locators in all: 6.3a, 6.4, 6.5, 6.6, 6.10, 6.11, 6.12 among them). The three paragraphs *The form of the formal proof* in 6.7 (line 2134), 6.8 (line 2186) and 6.9 (line 2247) state hypotheses and ranges of that proof ("with `𝒮` replaced by the set of the places … over a rational prime splitting completely in `E`", "translated by an element of `K_{W,∞} × U(W)(𝔸_f)`") and give none, so a reader cannot find what is being described, and the claim that the wider ranges are "this roadmap's extension" has nothing to be compared with. Add the file and declaration to each, as in 6.6.

## N01 — Two letters carry two meanings in 1.8

Unchanged from the previous review: in 1.8 `E` is the CM field and the Riemann form `−Tr_{F/ℚ} ∘ B` ("`E` acting `ℂ`-linearly", "a semicharacter of `E`"), and `B` is the symplectic form, an abelian variety (`B^{nd}`) and, as `B⁻¹`, the inverse Bargmann transform. Another letter for the Riemann form and for the CM abelian variety would remove the ambiguity.

## N02 — Two supplier headings name a path that is not there, and three cited roadmaps have no contract

Unchanged from the previous review: the headings `From TauCetiRoadmap.CompactGroups` and `From TauCetiRoadmap.ClassicalGroups` point at roadmaps that live under `RepresentationTheory/`. PotentialAutomorphyInfrastructurePartII §3.5 (2) (used in 2.4 and 4.3: every `π` has a weak base change for the standard space) is in no `*Needs:*` line and has no subsection in the supplier contracts; the same holds for EndoscopicTransferAndUnitaryTraceComparison §6.3 (route of 0.2). The parenthesis of 6.3 uses the density statement of 6.8, which 6.3's `*Needs:*` does not list.

## N03 — Most literature entries still have no theorem or page

The attribution of 4.2 to Li is now made through GQT §1.7, which checks. About eighteen entries of the References remain without a locator (Finis for 1.9, Kashiwara–Vergne for 2.1, Li for 3.3 and 4.1, Labesse for 2.4 and 4.3, Gross for Layer 1 are the ones a reader looks for first). No stated result rests on them: the routes go through supplier sections.

## Questions for the author

- At which branch or commit of the repository named in the References do the 60 file paths resolve? A request for `Development/AbelianVarietyTheory/BlockTheory/DivisorBase/WeilTensorModels.lean` (6.1, 6.11, 6.12) on the branches `main` and `master` returned "not found" through the project's sources service, and the repository's landing page is on a host the service does not classify; I therefore read none of the formal proof.
- In 6.3 four steps of the square-integrability route are marked "route not given here". I recomputed the exponents that are written (`k(d/2 − n + k)`, `−k(d − n − k)`, the bound `dΣs_i + nΣt_j`) but not the last step, where `2n ≤ d` and `2·max(r_X, r_W) + 1 < n` enter. Are these two hypotheses sharp for the inequality between the two linear forms, or sufficient only?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, sign `ε_v` | `δ = −i/2`, `V`, `W^♭` positive | `B(x, ix) = −2 Im τ(δ)·h(x,x) = |x|²`; `J = τ(i)`, `ε = −1`; `B(1, i) = Tr(1/2) = 1` | holds | none |
| 0.1 Definite dual pairs (sample) | Witt index at `d = 2n+1`, `2n+2`; exchanged pair; rank-one homomorphism pair | `⌊d/2⌋ = n`; `d/2 − 1 = n`; `(V^δ)^♭ = V`; `hxg⁻¹ = hḡx` against `ghx` | holds | none |
| 0.2 Splitting data (sample) | `n` odd, `n` even; extension from `𝔸_F^× E_∞^×` | `sgn^m = η_v^n` forces `m ≡ n (2)`; `E^× ∩ 𝔸_F^×E_∞^× = F^×`, where `η^n = 1` | holds | none |
| 0.3 Lattice vectors | lift `ψ(−½B(x,y))` at `p = 2` | cocycle defect `ψ(−B(x, y′)) = 1` on self-dual `A` | holds | none |
| 0.4 Check | `ℚ(√−2)`, `n = d = 2`, `δ = −√−2` | `B(e⊗f, δe⊗f) = Tr(δ²) = −4`; dual of `X(ℤ̂)` is `¼δX(ℤ̂)` | holds | none |
| 1.2 Class-set formula (sample, headline 1) | one class, `Γ = {±1}`; `F = 1` | weight `vol/2`; Schur factor `(dim σ_λ)⁻¹⟨ℓ, v⟩`; mass-weighted average for `F = 1` | holds | none |
| 1.5 Levels | trace `K₁ → K` | `θ_φ(R(k)F) = θ_{ω(k⁻¹)φ}(F) = θ_φ(F)`; sum `[K:K₁]θ_φ(F)` | holds | none |
| 1.6 Integrality (headline 1) | `ℚ(i)`, `ℚ(√−3)`; kernel `1` | `4`, `6` divide `minkowskiBound(2) = 24`; rank of `L_c` over `ℤ` is `2n[F:ℚ] = n[E:ℚ]`; `1 ↦ 1/2` | holds | none |
| 1.7 Fock pairing (sample) | `T = δ_0`, `P = z²` | `‖z^κ‖² = κ!π^{−|κ|}`; `π⁻²∂²(2^{1/4}e^{−πz²/2})(0) = −2^{1/4}/π` | holds | none |
| 1.8 Theta line (headline 1) | `ℤ[i]`, `α = (−1)^{xy}` | `E(ℓ,ℓ′) ≡ xy′ + x′y (2)`; `ϑ(z+1) = e^{πz+π/2}ϑ(z)`; `ϑ(0) = 1.29198`; norm² `1 + 0.8315 − 0.1729 + 0.0106 = 1.6692` | holds | N01 |
| 1.9 Induced CM types (sample) | `𝔞 = ℤ[i]`, `D = 4`, `𝔟 = 4ℤ[i]` | covolume `N𝔞√D/2` gives `H = 2r√D ww̄′`, `r = 1/4`, `H = |w|²`; `rDN(𝔟) = 16`; `𝔞 ⊂ 𝔟^* = ¼ℤ[i]`; `rN(D𝔞) = D` | holds | none |
| 2.1 Weights (sample, headline 2) | `n = d = 1`, both signs; vacuum; `(n,d) = (2,1)`, `m_W = 3`; trivial weight | both signs `−w + (m_V − m_W)/2`; vacuum `n(m_W − d)/2`; `a = −1`: two parts; `a ≤ 0 ⟺ εm_W ≤ −d` | holds | none |
| 2.2 Split places (headline 2) | `n = 0`; `n = d = 1` | segment `χ_V(ϖ)q^{(d−1)/2−i}` = parameter of `χ_V ∘ det`; `χ̃_V((t, t⁻¹)) = χ_{V,w}(t)`; lift `κμ⁻¹(χ_V/χ_W)~` has `c_wμ_w(ϖ)⁻¹` | holds | none |
| 2.3 Inert places | `n = 0`, `d = 2` | `χ_{V,v}(ϖ_v) = (−1)^0 = +1`; parameter `(q_w^{1/2}, q_w^{−1/2}) = (q_v, q_v⁻¹)`; text has `±` | holds, sign determined | C01 |
| 2.4, 2.5 Constituents, homomorphism pair (headline 2) | `n = d = 1`; `δ = ±δ′` | base change `μ̃⁻¹χ_V/χ_W`; `a_v = (d + m^Φ_W)/2` for both signs; lifted weight `λ − a + b = λ` for equal types | holds | none |
| 3.1–3.2 Rallis formula (headline 3) | `n = 0`; supplier §6.13a (i), last bullet | both sides `2|φ(0)|²`; factor `2` if `d > n`, `1` if `d ≤ n`; linear lift: `BC(π) ⊗ χ`, unconjugated coefficient | holds | none |
| 3.3 Convergence, Rallis operator (sample, headline 3) | trivial `π`; `d = 2n+1`; `d = 2n`; `d^S` | factors `L_w(s+n/2−i)`, lowest `s−n/2+1 > 1 ⟺ s > n/2`; `s₀ = (n+1)/2`; `L(1, χ_W)`; `d_n` lowest factor at `2s+1` | holds | none |
| 4.1–4.3 Nonvanishing, existence (headline 3) | `d = 2n+1`; occurrence of `σ_λ^∨`; GQT §1.7 | Witt index `≥ n`; `σ_{λ^*} = σ_{ι_ε(μ+a)} ⟺ μ = ι_{−ε}(λ) − a`; GQT line 141 lists Li for Weil's range | holds by the roadmap's route | none |
| 5.1 Theta integral (sample) | `λ = 0`; `n = 0` | `μ = (−a)^n`, `Λ(0) = ι_ε((b − a)^n, b^{d−n})`; `n = 0`: `χ̃_V(det h)φ(0)`, volume `1` | holds | none |
| 5.2–5.3 Norm, nonvanishing (headline 4) | `(n,d) = (1,2), (1,3), (2,3)`; `d` even, `|m_W| ≥ d` | arguments `1`; `3/2`; `3/2, 1/2`; `k ≥ d/2 − n + 1 > −|m|/2`, `Γ_ℂ(k + |m|/2)` finite; local pole only if `i = d/2 ≤ n − 1` | holds | none |
| 5.4 Genus theta series (sample, headline 4) | `ℚ(√−3)`, `L = O_E²`, `k = 1`; unitary `A`; `F ≠ ℚ` | `|U(L)| = 6²·2 = 72`; `r(L,1) = 12`; `E = (c/2)·2·Θ_gen`; `(m−n)/2 + (m+n)/2 = m`; dual `𝔇_F L^#` | holds | none |
| 6.1 Complementary triples (sample) | signatures; `W` split; (P2) | signature `(N−p−q, p+q)`; Witt index `≤ p+q < N/2`; `V ≅ V′ ⊕ H^{ε₀}`; the three excluded classes of places split | holds | none |
| 6.3 Theta integrals of a triple (sample) | existence of `v₁`; `α = β`; criteria on `(V,W)`, `(V′,W)` | `ν_w(ϖ)^{hk} = 1` forces `∏σ_v(𝔭)^{e_v} = ∏cσ_v(𝔭)^{e_v}`, distinct primes; `a − p > N/2 ⟺ ε₀ > p`; `a+p+q < N ⟺ p+q < a′` | holds | none |
| 6.3a Factorisation | triples of the induction | from `V′`: `2(p+q) − 1 < min(ε₀+1, a′−2)`; from `V`: `2p − 1 < ε₀ − 1` | holds | none |
| 6.4 Constant terms | `(4,2,1,1)`; `(7,3,0,2)`; `f′ = f + 2w − 2e` | `ε₀ = 1 < 1 + p`; signatures `(2,1)`, `(7,1)`, minima `1`; `⟨f′,f′⟩ = 4−2−2 = 0`; `⟨f′, w−2e⟩ = 0` | holds | none |
| 6.5 Descent of matching (sample) | constant at `T`; `ϖ → uϖ`; `(8,2)` | `g(ϖ^{−c}) = Nv^{−c}G`; `c_v = ν(−1)Nv^{−c(1−z)}ν(ϖ)^cG`; `ν(u)^{±c}` cancel; `|c_v| = Nv^{c(1/2−n)}`; `χ_β` gives `(6,4)` | holds | none |
| 6.6 Nonvanishing up the tower | `p = 0`; `q = 0` | `dim V′_j = a′−2j ≥ 3`; `N−2q > a ⟺ a′ > 2q`; `N−2p > a′ ⟺ a > 2p`; `κ ≤ −dim W₀` | holds | none |
| 6.7 Orthogonal differences (sample) | `f = Σ(I_V(Φ_i) − I_{V′}(Φ′_i))` | `⟨f, f⟩ = Σ(⟨f, I_V(Φ_i)⟩ − ⟨f, I_{V′}(Φ′_i)⟩) = 0`; rapid decay against moderate growth converges | holds | C02 |
| 6.8 Good split places, constancy | Fejér kernel; character trivial at density one | `F_K(1) = K + 1`, `F_K ≥ 0`: upper density `≤ 1/(K+1)`; `μ̃_w(t) = μ((t,1)/(1,t)) = 1` forces `μ̃ = 1` | holds | C02 |
| 6.9 Cuspidality and purity (sample) | `(8,4,1,1)` | `|l| = r^{(a′ − a + 2)/2} < 1 ⟺ ε₀ > 1`; smaller triple has gap `ε₀ − 1 = 1`, outside 6.4 | holds | C02 |
| 6.10 Compact case (sample) | both pairs; `L`-values; exchanged pair | `ε = −1`, `+1`, `εm_W = κ` for both; arguments down to `1 − ε₀`, `k + |κ|/2 > 0`; `s₀ = (a′−N)/2 < 0`, `C = 1` | holds | none |
| 6.11 Identity (headline 4) | `F = ℚ(√69, √37)`, `E = F(√−3)` | `−23 ≡ 37 ≡ 1 (3)`; `69 ≡ 37 ≡ 5 (8)`; `14`, `32` nonresidues mod `23`, `37`; `−18 < −16`; `(±1)⁴ = 1` | holds | none |
| 6.12 Recursion (headline 4) | against 6.5 and 6.11, steps 2 and 4 | `c(G₁) = (C′₁/C₀)c_β c(G)`; `c(G) = (C₁/C′₀)c_α c(G₁)`; `ν_{w̄}(ϖ)⁻¹ = ν_w(ϖ)` gives `ν_w(ϖ)^{2k}` | holds | none |
| Headlines in `Suggested.lean` | carriers at the pins | file declares nothing; docstring names the four headlines and the carriers each lacks, with the hypotheses of the README | none statable | none |

- Earlier remarks: C01 repaired (6.3: "Under (P0) and `κ_v ≠ 0` at every real place … such places exist", with the case `α = β`); C02 partly (4.2 now rests on GQT §1.7, 4.3 on 4.2; other entries still without locator, N03); C03 repaired (6.11: "by 6.3 (`ε₀ > p` and `p + q < a′`, from 2)"); N01, N02 unchanged.
- Source locators checked against the text: 13 with a theorem or page, all agree, plus GQT §1.7. GQT lines 137–141, 227, 263, 1616–1630; HarrisKudlaSweet1996 lines 445–730, 774, 2490; Rallis1984Injectivity lines 345, 535; Minguez2008 lines 73, 1119; Zelevinsky1980 line 775; Howe1989 lines 35, 71; Serre2007 line 85.
- Library: the file declares nothing; the claims of its docstring about `NumberField.IsCMField`, `NumberField.AdeleRing`, `IsDedekindDomain.FiniteAdeleRing`, `Matrix.unitaryGroup`, `HeckeCharacter`, `ZLattice.thetaSeries` were checked at the pins by the previous review and the docstring's wording on them is unchanged.
- Cross-roadmap citations: every cited heading resolves (on main or at the open head). Compared in content this round: ThetaKernelsForUnitaryDualPairs §§3.46 (iii), 3.47b, 5.7e, 6.13a (i) and its scope; NonordinaryCMSpecialValues §4.2; HermitianFormsAndLattices §5.2 (c); DiscreteSeriesCoefficientsAndAutomorphicMetrics §7.5b; LocalFactorsOfTwistsAndTypes §§7.1, 7.2 as restated.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 171 roadmaps, 2004 edges, 0 problem(s)`; no UPWARD or CYCLE line. GrossZagierAndArithmeticHeightsPartII §13.4 (5.4) is later in the order and is cited as a neighbouring statement, not as a supplier.
- Elaboration of `Suggested.lean`: exit 0, no message (no declaration, so no `sorry` warning, nothing for the one-tactic probe and no signature to compare). Nothing outside the folder and the family index is changed.
- The pull request's text against the head: title and prose agree with the change (a new folder, the family index, a `Suggested.lean` that declares nothing, the Rallis formula imported). The other open pull request that carries this folder merges cleanly with this one.
- Duplication by object: the class-set formula, the Fock pairing, complementary triples, the square-integrability criteria of 6.3 and the recursion are stated here only; the Rallis formula, local matching, convergence and constant terms are cited from ThetaKernelsForUnitaryDualPairs, which names this roadmap as their consumer.

Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, SeesawForThetaChains, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory; nothing shared (the Rallis inner product formula and the local complementary data are owned by ThetaKernelsForUnitaryDualPairs and cited here; the open theta-chain roadmaps cite §§0.1, 0.4, 1.2, 2.5, 6.1, 6.11, 6.12 of this one).

Source independence: 10 passages compared with 8 sources, none shared; largest share [FormalProof], 60 of 73 locators, not readable; contents compared with HarrisKudlaSweet1996 and GQT only: independent.

Research link: Layers 3–4 specialise the Rallis inner product formula and its nonvanishing consequences (Rallis 1984; Li 1992; Gan–Qiu–Takeda 2014) to definite unitary pairs; Layer 2 uses Mínguez 2008; Layer 6 is the non-split counterpart of GQT's second term identity and feeds the iterated theta lifts of Alpöge's 2026 announcement. Rests on the README's References, GQT and Announcement lines 158–169.

## Not verifiable

- Every [FormalProof] locator (60 file paths with declarations, among them those of the sampled 0.1, 0.2, 6.1, 6.3, 6.5, 6.10) and every statement headed "The form of the formal proof": the text is not held for this roadmap, and the sources service found no legal copy (one file path asked on two branches, both "not found"; the repository page is on an unclassified host).
- J.-S. Li (1992), Finis (2006), Labesse (2011), Kashiwara–Vergne (1978), Gross (1999) and the other References without a locator: not held, no locator given, not opened.
- The steps of 6.3 and 6.5 marked "route not given here", and the local statements imported from ThetaKernelsForUnitaryDualPairs §§3.47–3.47c, 5.7a–5.7e: read for consistency with their use here, not rederived.

## Source issues

- none

## For the human reviewers

- **Scope.** The routes of 1.2, 4.2–4.3, 5.2–5.3 and Layer 6 are attributed (README, References) to [FormalProof], a Lean formalization announced on 20 November 2026 with no refereed publication; the statements sit in the published theta-correspondence literature (Rallis 1984, Li 1992, GQT 2014).
- **Licence.** [FormalProof] is cited as a public repository whose licence I did not read; `Suggested.lean` declares nothing, so no formal statement is taken from it. The Announcement is held as an operator-local text.
- **Not tested.** [FormalProof] has the largest share of the locators (60 of 73) and could not be read: wording and arrangement were compared with HarrisKudlaSweet1996 and GQT only.
