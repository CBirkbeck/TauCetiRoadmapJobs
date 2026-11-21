# Review of ThetaLiftsForDefiniteUnitaryGroups (pull request #2897 at 112186a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaLiftsForDefiniteUnitaryGroups/`
**Verdict:** accepted

**Summary.** Accepted: no finding. Every Check, worked example and formula that could be recomputed was recomputed (the table is on the board) and agrees with the statements; the 13 source locators that carry a theorem or page number all match the texts, and the supplier sections cited say what they are cited for. There are three small corrections and two format notes, none blocking. Left for a human: the routes are attributed to a formal proof announced on 20 November 2026 that I could not read, and the attribution of 4.2–4.3 to Li (1992) could not be checked against the text.

## C01 — The existence of the auxiliary place `v₁` in 6.3 is asserted without the hypotheses under which it holds

A reader of 6.3 is told that a place `v₁` with `ν_{w₁}(ϖ_{w₁}) ≠ 1` always exists, and every statement of 6.3–6.5 starts by fixing one. The sentence (line 1589) reads: "Such places exist: `E` being Galois over `ℚ`, they are the places of `F` of degree one over an unramified rational prime that split in `E` and lie in `𝒮`". It uses (P0), which 6.3 does not assume, and the set `𝒮`, which is only defined later, in 6.8 (line 2026), and whose density-one statement there has the hypothesis `κ_v ≠ 0` at every real place. Without it the claim fails: a complementary triple with `a ≡ a′ (mod 2)` and `α = β` (allowed by 6.1) has `ν = 1`, `T = ∅`, and no place with `ν_w(ϖ_w) ≠ 1`.

The smallest change: write "Under (P0) and `κ_v ≠ 0` at every real place such places exist: they are … and lie in the set `𝒮` of 6.8", and add 6.8 (good split places) to what 6.3 points to. Hypotheses 1–4 of 6.11 give both, so nothing downstream changes.

## C02 — The published theorem to which 4.2 and 4.3 are attributed has no locator

4.2 says "This is the published stable-range criterion (J.-S. Li, References)" and 4.3 (line 1255) says "The threshold `2n + 1`, the converse and the components at the inert places are those of the published theorem", but the References entries for Li (1992) and Labesse (2011) give no theorem, section or page, so a reader cannot check that the published statement has this threshold and covers a pair in which both groups are compact at infinity. The roadmap's own route (3.2, 3.3, 4.1) proves 4.2 as stated, so no result depends on the attribution; it is the sentence about the literature that cannot be verified. Give the theorem numbers and pages, or weaken the sentence to "in the range of Li's theorem".

The same holds, with less at stake, for the other literature entries without a locator: of the 26, only seven (Harris–Kudla–Sweet, Howe, Serre, Rallis 1984, Mínguez, GQT, Zelevinsky) carry a theorem or page. Finis (1.9), Kashiwara–Vergne (2.1) and Gross (Layer 1) are the ones a reader of the sampled sections would look for first.

## C03 — The second case in the square-integrability sentence of 6.11 never occurs

6.11 (lines 2179–2180) says `I_V(Φ)` is square-integrable "by 6.3 when `q ≥ 1` or `a′ > p`, and when `q = 0` by the identity". Hypothesis 2 gives `a′ > 2(p + q) + 1 > p`, so the first case always applies, and 6.3 itself says its criterion applies "to `(V, W)` for the triple itself" (`ε₀ > p` and `p + q < a′`). A reader looks for the case `q = 0`, `a′ ≤ p` and finds it excluded. Shorten to "by 6.3", or say that the clause is kept for a wider range.

## N01 — Two letters carry two meanings in 1.8

In 1.8 `E` is the CM field and the Riemann form `−Tr_{F/ℚ} ∘ B` ("`E` acting `ℂ`-linearly", "a semicharacter of `E`"), and `B` is the symplectic form, an abelian variety (`B^{nd}`) and, as `B⁻¹`, the Bargmann transform. Another letter for the Riemann form and for the CM abelian variety would remove the ambiguity.

## N02 — Two supplier headings name a path that is not there, and one cited roadmap has no contract

The headings `From TauCetiRoadmap.CompactGroups` and `From TauCetiRoadmap.ClassicalGroups` point at roadmaps that live under `RepresentationTheory/` (the sibling ThetaKernelsForUnitaryDualPairs writes `TauCetiRoadmap.RepresentationTheory.CompactGroups`). PotentialAutomorphyInfrastructurePartII §3.5 (2) is used in 2.4 and 4.3 (every `π` has a weak base change for the standard space) but appears in no `*Needs:*` line and has no subsection in the supplier contracts.

## Questions for the author

- Does Li's theorem (J. reine angew. Math. 428, 1992) have the threshold `d ≥ 2n + 1` for unitary pairs, and does it state the converse through the occurrence of the weights when both groups are compact at every real place? I could not check: the text is not in the sources held for this roadmap, no legal open copy was found, and the References give no theorem number.
- In 6.3 four steps of the square-integrability route are marked "route not given here" (compact parts, the lattice-point count on the tori, the lower bound for a full-rank rational point, the inequality between the two linear forms). I recomputed the exponents that are written (`k(d/2 − n + k)`, `−k(d − n − k)`, the bound `dΣs_i + nΣt_j`) but could not derive the fourth step, which is where `2n ≤ d` and `2·max(r_X, r_W) + 1 < n` enter. Is the inequality sharp in these two hypotheses, or are they sufficient conditions only?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Conventions, sign `ε_v` | `δ = −i/2`, `V`, `W^♭` positive | `B(x, ix) = −2 Im(δ)·h(x,x) = |x|²`; `J = τ(i)`, `ε = −1`; `B(1, i) = Tr(1/2) = 1` | holds | none |
| 0.2 Splitting data | `n` odd, `n` even | `sgn(x)^m = η_v(x)^n` forces `m ≡ n (2)`; `n` even allows `χ_V = 1`; HKS §1 is pp. 950–957 | holds | none |
| 0.3 Lattice vectors | lift `q(x+y) = ψ(−½B(x,y))` at `p = 2` | cocycle defect is `ψ(−B(x, y′)) = 1` on a self-dual `A`; `q = 1` fails when `½B` not integral | holds | none |
| 0.4 Check | `ℚ(√−2)`, `n = d = 2`, `δ = −√−2` | `δ⁻¹ = i/√2`; `B(e⊗f, δe⊗f) = Tr(δ²) = −4`; dual of `X(ℤ̂)` is `¼δX(ℤ̂)` | holds | none |
| 1.2 Class-set formula (headline 1) | one class, `Γ = {±1}`; `n = 0` | weight `vol/|Γ_c|`; `n = 0`: `θ(1, h; φ)F(1)` with volume `1` | holds | none |
| 1.3 Lattice form | `n = 1` over `ℚ(i)`, `ℚ(√−3)`, `ℚ(√−m)` | `Γ = μ_4`, `μ_6`, `{±1}`; `4`, `6` divide `minkowskiBound(2) = 24` | holds | none |
| 1.4 Adjoint | Petersson against class-set products | `⟨Θf, g⟩_W = c_W⟨f, Θ†g⟩_K = (c_W/c_V)⟨f, Θ†g⟩_V`; exchanged sign `−sgn(W^♭)(−sgn V) = −ε` | holds | none |
| 1.5 Levels | trace from `K₁` to `K` | `θ_φ(R(k)F) = θ_{ω(k⁻¹)φ}(F) = θ_φ(F)`, sum `[K:K₁]θ_φ(F)` | holds | none |
| 1.6 Integrality (headline 1) | kernel `1`, `Γ = {±1}`; `M̂ = p𝒪̂` | `1 ↦ 1/2`, `D_K = 2` repairs; adjoint kernel `1` sends `𝒪` outside `p𝒪` | holds | none |
| 1.7 Fock pairing | `T = δ_0`, `P = z²` | `ϑ_T = 2^{1/4}e^{−πz²/2}`; `π⁻²∂²ϑ(0) = −2^{1/4}/π`; `⟨z^κ, z^κ⟩ = κ!π^{−|κ|}` | holds | none |
| 1.8 Theta line (headline 1) | `ℤ[i]`, `α = (−1)^{xy}`, `H = zw̄` | `ϑ(z+1) = e^{πz+π/2}ϑ`, `ϑ(z+i) = e^{−πiz+π/2}ϑ`; `ϑ(0) = 1.29198`; lattice sum `1.66926` | holds | N01 |
| 1.9 Induced CM types | `𝔞 = ℤ[i]`, `D = 4` | covolume `N𝔞√D/2` gives `H = 2r√D·ww̄′`, `r = 1/4`, `H = |w|²`; `rDN(4ℤ[i]) = 16`; `rN(D𝔞) = D` | holds; Finis not read | none |
| 2.1 Weights (headline 2) | `n = d = 1`, both signs; `n = 0`; `(n, d) = (2, 1)`, `m_W = 3` | weight `−w + (m_V − m_W)/2` for both; `det^{m_V/2}`; `a = −1`, `λ − a = (1, 1)`, two parts `> 1` | holds | none |
| 2.2 Split places (headline 2) | `n = 0`; `n = d = 1`; Mínguez Cor. 6.3 | segment `χ_V(ϖ)q^{(d−1)/2−i}` is the parameter of `χ_V ∘ det`; `χ̃_V((t, t⁻¹)) = χ_{V,w}(t)`; source: contragredient plus segment | holds | none |
| 2.3 Inert places | `n = 0`, `d = 2` | `χ_V(ϖ_v) = η_v(ϖ_v)^n = (−1)^n`; parameter `±(q_w^{1/2}, q_w^{−1/2}) = ±(q_v, q_v⁻¹)` | holds | none |
| 2.4 Constituents (headline 2) | `n = d = 1`; supplier 3.21a (iii) | `π_v^∨` of parameter `α⁻¹` gives `(cα⁻¹, segment)`; base change `μ̃⁻¹χ_V/χ_W` | holds; Labesse not read | N02 |
| 2.5 Homomorphism pair | `δ = δ′`, `δ = −δ′`; `n = d = 1` | `τ_v = c∘τ`, `ε = −1`; resp. `τ_v ∈ Φ`, `ε = +1`; `a_v = (d + m^Φ_W)/2` both | holds | none |
| 3.1–3.2 Rallis formula (headline 3) | `n = 0`; GQT Thm 7.1 | both sides `2|φ(0)|²`; `E = cτ/[E:F]·I` gives `∫θ = (2/c)E`: `2` for `d > n`, `1` for `d ≤ n` | holds | none |
| 3.3 Convergence, Rallis operator (headline 3) | trivial `π`; `d = 2n + 1`; `d = 2n` | factors `L_w(s + n/2 − i)`; convergence iff `Re s > n/2`; `s₀ = (n+1)/2`; `d = 2n`: `L(1, χ_W)`; `d_n` from `2s + 1` | holds | none |
| 3.4 Injectivity | Iwahori level, `n = 2` | `‖θF‖² = ⟨θ*θF, F⟩`; `θ_φ = θ_φ∘e` kills vectors orthogonal to the spherical line; Rallis Thm 1.6 is p. 156 | holds | none |
| 4.1–4.3 Nonvanishing, existence (headline 3) | `d = 2n + 1`, `d = 2n + 2`; trivial `π`; `n = 0` | Witt index `⌊d/2⌋` or `d/2 − 1`, both `≥ n`; occurrence `a_v ≤ 0 ⟺ ε_v m_W ≤ −d` | holds by the roadmap's route | C02 |
| 5.2–5.3 Norm, nonvanishing (headline 4) | `(n, d) = (1,2), (1,3), (2,3)`; `d` even, `|m_W| ≥ d` | arguments `1`; `3/2`; `3/2, 1/2`; `k + |m|/2 ≥ 1`, no pole of `Γ_ℂ`; pole only if `i = d/2 ≤ n − 1` | holds | none |
| 5.4 Genus theta series (headline 4) | `ℚ(√−3)`, `L = O_E²`, `k = 1`; `n = k = 1` | `|U(L)| = 6²·2 = 72`; `r(L, 1) = 12`; `k₊^{(m−1)/2}k₋^{(m+1)/2} = det^{(m+1)/2}k₊⁻¹`; dual `𝔇_F L^#` | holds | none |
| 6.1 Complementary triples | `p = q = 0`; `W` split; (P2) | Witt index of `W ≤ p + q < ε₀ < N/2`; three excluded classes of places all split | holds | none |
| 6.3 Theta integrals of a triple | `j` planes removed; `q = 0`; `α = β` | `ε₀ + j > p`; sums `k(d/2 − n + k)`, `−k(d − n − k)`; `ν = 1`: no `v₁` | statements hold | C01 |
| 6.3a Factorisation, injectivity | triples of the induction | `|a − 2p| + |a′ − 2q| = N − 2(p + q) ≤ N < −κ_v`; unchanged by `(N − 2, q − 1)` | holds | none |
| 6.4 Constant terms | `(4,2,1,1)`; `(7,3,0,2)`; `f′ = f + 2w − 2e` | `ε₀ = 1 < 1 + p`; signatures `(2,1)`, `(7,1)`, minima `1`; `⟨f′, f′⟩ = 4 + 4 − 4 − 4 = 0` | holds | none |
| 6.5 Descent of matching | constant at `T`; `(a, a′) = (8, 2)` | `c_v = ν(−1)Nv^{−c(1−z)}ν(ϖ)^cG`; `ϖ → uϖ` cancels; `|c_v| = Nv^{c(1/2−n)}`; `χ_α` gives `(8,2)`, `χ_β` `(6,4)`; Zelevinsky 4.2 is p. 184 | holds | none |
| 6.6 Nonvanishing up the tower | `q` steps, `p = 0` | `dim V′_j = a′ − 2j ≥ 3`; `dim W₀ = N − 2q > a ⟺ a′ > 2q`; `κ ≤ −dim W₀` | holds | none |
| 6.8 Good split places | Fejér kernel | `F_K(1) = K + 1`, `F_K ≥ 0`: exceptional upper density `≤ 1/(K + 1)` | holds | none |
| 6.9 Purity | `(8,4,1,1)` | `|l| = r^{(a′ − a + 2)/2} < 1 ⟺ ε₀ > 1`; smaller triple `(6, 4)` has gap `1` | holds | none |
| 6.10 Compact case | signs; exchanged pair | `ε = −1`, `+1`; `ε_v m_W = κ_v` for both; `s₀ = (a′ − N)/2 < 0`, `C = 1`; `N > a` | holds | none |
| 6.11 Identity (headline 4) | `F = ℚ(√69, √37)`, `E = F(√−3)` | `−23`, `37` squares in `ℚ_3`; `69, 37 ≡ 5 (8)`; `14`, `32` nonresidues mod `23`, `37`; `3 < 4`; `−18 < −16`; `(±1)⁴ = 1` | holds | C03 |
| 6.12 Recursion (headline 4) | against 6.5 and 6.11, steps 2 and 4 | `c(G₁) = (C′₁/C₀)c_β c(G)`; `c(G) = (C₁/C′₀)c_α c(G₁)`; `ν_{w̄}(ϖ)⁻¹ = ν_w(ϖ)` gives `ν_w(ϖ)^{2k}` | holds | none |
| Headlines in `Suggested.lean` | carriers at the pins | no adelic unitary group, Weil representation, Fock space or algebraic modular forms in Mathlib or Tau Ceti; file declares nothing | none statable | none |

- Source locators checked against the text: 13 with a theorem or page, all agree. HarrisKudlaSweet1996 line 445 (§1, p. 950) to line 730 (§2, p. 957), line 774 (Proposition 2.2, p. 958), line 2490 (Proposition 8.4 (iii), p. 994); GQT line 1619 (Theorem 7.1), line 263 (Theorem 1.3), line 233 (Theorem 1.2 (ii)), line 1629 (Ichino's range); Rallis1984Injectivity line 345 (Proposition 1.1, pp. 149–150), line 535 (Theorem 1.6, p. 156; injectivity stated at line 162); Minguez2008 line 73 (Théorème 1, p. 718), line 1119 (Corollaire 6.3, p. 734); Zelevinsky1980 line 775 (Theorem 4.2, p. 184); Howe1989 lines 35, 71 (Theorem 1 and Remark (b), pp. 535–536); Serre2007 line 85 (Theorem 1, §1.1, p. 3).
- Library declarations opened at the pins: `Matrix.unitaryGroup` (Mathlib/LinearAlgebra/UnitaryGroup.lean:105), `NumberField.AdeleRing` (Mathlib/NumberTheory/NumberField/AdeleRing.lean:56), `IsCMField` (Mathlib/NumberTheory/NumberField/CMField.lean:70), `FiniteAdeleRing` (Mathlib/RingTheory/DedekindDomain/FiniteAdeleRing.lean:95), `HeckeCharacter` (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70), `ZLattice.thetaSeries` (TauCeti/NumberTheory/ModularForms/ThetaSeries/Basic.lean:102). A search of both libraries for Weil or oscillator representations, Schwartz–Bruhat spaces, Fock or Bargmann, theta kernels and algebraic modular forms found none.
- Cross-roadmap citations resolved: every cited section heading found, in 24 roadmaps (on main or at the open head). Opened and compared in content: ThetaKernelsForUnitaryDualPairs §§3.21a, 3.46 (iii), 6.13a (i) and its scope; MetaplecticAutomorphicForms §§6.4, 6.10a, 6.14 and four named statements; AutomorphicLFunctionsAndLocalFactorsPartII §§2.2, 2.3, 3.4; HermitianFormsAndLattices §5.2 (c); LocalFactorsOfTwistsAndTypes §§7.1, 7.2 (as restated); AbelianSchemesAndArithmeticModuli A5.2 (`H` linear in the first variable); PotentialAutomorphyInfrastructurePartII §3.5 (2); AutomorphicSpectralTheory §§3.2, 3.4; FiniteGroupInvariants 10.2.
- Automatic checks: all passed at this head. Dependency check: `depcheck: 171 roadmaps, 2004 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: exit 0, no message (the file declares nothing, so there is no `sorry` warning, nothing for the one-tactic probe and no signature to compare).
- The pull request's text against the head: the title and the prose agree with the change (a new folder, the family index, `Suggested.lean` declaring nothing); nothing outside the folder and the family index is changed.
- Duplication by object: searched the open heads and main for the class-set formula, Fock pairing, complementary triple, Rallis operator and definite theta lift; each is stated here only and cited elsewhere. The Rallis inner product formula is imported from ThetaKernelsForUnitaryDualPairs §6.13a (i); 3.2 adds measures, cross terms, orthogonality and the local factor.
- Wording: 18 passages put beside the sources (the 13 above; Announcement lines 158–169; GQT lines 258–262; Minguez2008 lines 49–62; Rallis1984Injectivity lines 136–163; Serre2007 lines 14–32); no shared sentence.

Overlap check: read ThetaKernelsForUnitaryDualPairs, RowTowerAndRallisIdentities, ThetaChainsOnDefiniteUnitaryGroups, SeesawForThetaChains, CongruenceModulesOfThetaLifts, MetaplecticAutomorphicForms, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicSpectralTheory; nothing shared (each of the open ones names this roadmap as owner of definite pairs, class-set lifts, complementary triples and the recursion; the Rallis formula and local complementary data are owned by ThetaKernelsForUnitaryDualPairs and cited here).

Source independence: 18 passages compared with 8 sources, none shared; largest share HarrisKudlaSweet1996 and GQT, 3 each of 13 locators; contents compared with both: independent; [FormalProof], named as the source of most routes, was not read.

Research link: Layers 3–4 specialise the Rallis inner product formula and stable-range nonvanishing (Rallis 1984; Li 1992; Gan–Qiu–Takeda 2014) to definite unitary pairs; Layer 2 uses Mínguez 2008; Layer 6 is the non-split counterpart of GQT's second term identity and feeds the theta chains of Alpöge's 2026 announcement. Rests on the README's References, GQT and Announcement lines 158–169.

## Not verifiable

- Every statement headed "The form of the formal proof" (4.2, 4.3, 6.2, 6.3a, 6.4, 6.6) and every "not on the path of the formal proof" (1.4, 1.6, 6.3): [FormalProof] is not among the texts held for this roadmap and is cited without file or declaration; the four-page Announcement states none of them.
- J.-S. Li (1992) for 3.3, 4.1, 4.2 and Finis (2006) for 1.9: asked of the sources service, no legal copy found; no locator in the README.
- Labesse (2011), Weil (1964), Kudla (1994), Gross (1999), Bargmann (1961), Kashiwara–Vergne (1978), Mumford, Rogawski (1992), Piatetski-Shapiro–Rallis (1987), Kudla–Rallis (1994), Ichino (2007), Yamana (2014), Rallis (LNM 1245), Shalika (1974), Godement–Jacquet (1972), Tate (1950): not held, no locator given, not opened.
- The steps of 6.3 and 6.5 marked "route not given here", and the local statements imported from ThetaKernelsForUnitaryDualPairs §§3.47–3.47c, 5.7a–5.7e, which have their own review: read for consistency with their use here, not rederived.

## Source issues

- none

## For the human reviewers

- **Scope.** The routes of 1.2, 1.7–1.9, 4.2–4.3, 5.2–5.3 and Layer 6 are attributed (README, References) to [FormalProof], a Lean formalization announced on 20 November 2026 with no refereed publication; the statements themselves sit in the published theta-correspondence literature (Rallis 1984, Li 1992, GQT 2014).
- **Licence.** [FormalProof] is a public repository whose licence I did not read; `Suggested.lean` declares nothing, so no formal statement is taken from it. The Announcement is held as an operator-local text.
- **Not tested.** The arrangement of the layers was compared with HarrisKudlaSweet1996 and GQT only; [FormalProof], the source named for most routes, was not read, so parts 1 and 2 of the source comparison were not made against it.
