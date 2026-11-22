# Review of RowTowerAndRallisIdentities (pull request #2919 at 51a5443)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** accepted

**Summary.** Accepted: the full review of this head finds nothing that makes a stated result false or unsupported. The passages added since the previous review were recomputed and hold: the minors `Δ^±` and the weights of `Δ_j` in 5.7 (weight `−Λ_j(τ)`, lowest `K`-type `λ + ρ_n − ρ_c`, Harish-Chandra parameter of `𝒲_j`), the conjugate rows of 5.8a/5.8e, and the hypotheses of 5.8, which now agree clause by clause with the record of [FormalProof]. There is one format note (carried over) and two questions, none blocking. The standing of the formal proof as main source and the route of this folder to main (#2954 or #2919) remain for the human reviewers.

## N01 — R. Godement ("square-integrable representations") is still credited without a title, and S. Kudla, *Seesaw dual reductive pairs* (1984), without a venue; every other name-only credit in the References has both.

## Questions for the author

- Step (A) of the outline of 5.8e (line 1480) says that the `n`-fold lift of `ē(w)` is `F′_n(vec_n(𝐩, w))`. `vec_n` occurs only here and is not defined. Since `w ↦ ē(w)` is conjugate-linear, is `vec_n(𝐩, w)` conjugate-linear in `w` (so that `F′_n` is a linear `(𝔤, K)`-map from a discrete series), or is `F′_n` conjugate-linear? Step (F) uses only the factorisation, so nothing stated depends on the answer; I could not decide it from the text.
- 5.7 now gives the highest weight and the Harish-Chandra parameter of `𝒲_j` (lines 953–959). CongruenceModulesOfThetaLifts, at its open head and in the family pull request, still says in its Layer 7 that "RowTowerAndRallisIdentities §5.7 does not give the highest weight of `𝒲_j`". Is that sentence to be brought up to date there? It is outside this folder, so it is not a remark on this pull request.

## Previous findings

- The previous review (of `8879eae`) had no finding and no small correction.
- N01 of that review — not repaired: line 2288 still reads "R. Godement (square-integrable representations)", line 2296 "S. Kudla, *Seesaw dual reductive pairs* (1984)" (N01 above).
- Its question on `vec_n` — the passage is unchanged (first question above).

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.1 row spaces | `j = 0`, `j = m`, parity of `dim Y_j` | `⌊(m−j)/2⌋` negative entries; shift `−½` exactly for odd `j`; `r` entries | count of odd `i−j` in `(j, m−1]` is `⌊(m−j)/2⌋`; `(k−1)+m = r`; `r + jt` even iff `j` odd | holds | — |
| 5.2 row step | `j = 1`; parity; descent on conjugate rows (5.8a) | `μ_1η̃^{−1}` on `Y_0`; descent `∫ conj θ_j(P ⊗ conj φ_j)·F` | `dim Y_{j−1} ≡ j (mod 2)`; conjugating the descent gives `∫ θ_j(P ⊗ conj φ_j)·conj F`, the formula of 5.8a | holds | — |
| 5.3 goodness (Checks) | `r = 15`, types `(1,3,11)`, `(2,2,11)`; `r = 7`; `r = 8…16` | (4) fails at `a = 4`; no good tuple for `r = 7`; prime in `(r/2, r−3]` for `r ≥ 8` | subset sums `{1,3,4}`, `{2,4}`; `(3.5, 4]` empty; primes `5,5,7,7,7,7,11,11,11` | holds | — |
| 5.4 row descent | level `(P_1, χ_{P_1})`; adjoint | `vol_f(K^{rt}) = \|P_1\|·vol_f(K^{pr})`; `Q = ι^*(𝔼)` | `\|P_1\|` equal translates; `ι^*(𝔼_{(P,χ)}) = (𝒰^{(P,χ)} ∩ ker ι)^⊥` in `𝒰^{(P,χ)}` since `e_{P,χ}`, `Π_good` self-adjoint | holds | — |
| 5.5 inner product of up-lifts | `i = 0, r = 1, t = 3, q = 2`; general `idx·‖Φ‖²`; convergence | `15·(1/16) = 1 − 2^{−4}`; factor `∏_{n=t+1}^{t+n_i}(1−q^{−n})`; needs `t > r` | `#ℙ³(𝔽_2) = 15`; `\|GL_r\|q^{−r²} = ∏_{n≤r}(1−q^{−n})`; `(t+1)/2 − (r−1)/2 > 1 ⟺ t > r`, and (R5) gives `t ≥ 7r + 4` | holds | — |
| 5.6 adjoint identity (headline 1) | split place `B(w) = {β}`, `μ(ϖ_w) = u`; wrong family `B(w̄) = B(w)` | product of the two factors `\|1 − βūNw^{−s}\|^{−2} > 0` | factor at `w̄` is `(1 − β̄uNw^{−s})^{−1}`, the conjugate; wrong family gives a non-real product | holds | — |
| 5.7 model lifts: weights of `Δ_j` (new) | torus of `U(r+t)`; both blocks of `K`; `ρ`-shift | weight `−Λ_j`; `K`-weight `(a⁺_n + x₁; x₂ − a⁻_n)`; `λ + ρ_n − ρ_c`; parameter `(λ ∪ S(−w_j, t)) − ½` | column `b` of `Z₊` scales by `u_b^{−1}`: exponent `a⁺_{b−1}`; `x₃ = −d_j`; `a⁺_n + x₁ = λ_n + n + (q−p+1)/2`; `Λ_j + ρ`: `λ_n − ½`, `−w_j − ½ + (t−1)/2 − l` | holds | — |
| 5.7 `a⁻_n` "non-increasing" (changed) | `a^±_n − a^±_{n+1}` | non-negative | `λ_n − λ_{n+1} − 1 ≥ 0` for integers strictly decreasing; equality possible, so "decreasing" was too strong | holds | — |
| 5.7 (ii′) | `f_H` normalised and unnormalised | factor `\|H\|`; `\|H\|²` without `\|H\|^{−1/2}` | `θ_{f_H} = \|H\|^{1/2}e∘θ_{f_1}`, `e` idempotent commuting with `θθ^*` | holds | — |
| 5.8a grid | signatures, ranks | complement of `X^c_i` rank `i − 1`, `⌊i/2⌋` negative; total `m/2`; `C⁺` rank `m − 1` | `r + is − (r+1) − i(s−1) = i − 1`; `⌊(m−i+1)/2⌋ + ⌊i/2⌋ = m/2` for both parities; `2n⁺ + 1 = m − 1` | holds | — |
| 5.8b squares | rank arithmetic; spacing | `(t+s)/2 > 2(p+q)+1`; `a′ > 2(p+q)+1`; `2e_j + 2c_{m−i} > a + a′` | `(t+s)/2 ≥ (5m+9)/2 > 2m−1`; `a′ ≥ 2m+2`; left side `> 3h_c − 1 > 2N_□`, ranks `≤ N_□ − 1` | holds | — |
| 5.8c square constant | formal form | `c(i, j, ξ) ≠ 0`; big-route factor nonzero only in [FormalProof] | `ConstK`: `SquareNonzero … ∧ ch.c i j t ≠ 0`; README marks unitarity of the factor as its own | agrees | — |
| 5.8d constants in the tuple | telescoping; Gauss sums | `q − p ∈ {0, 1}`; `0 ≤ v_𝔭(G) ≤ c·v_𝔭(N)` | `q − p = ⌊(m−j)/2⌋ − ⌊(m−j−1)/2⌋ ∈ {0,1}`; `G·G(ν^{−1}) = ν(−1)N^c` with both integral | holds | — |
| 5.8e separation; conjugate rows (new) | number of functionals; type of `ē(w)` | `N(𝔪_□)^{Σ(r+is)(r+(i+1)s)}·#Cl⁺·dim V_{Λ⁺}`; parameter `(−v; e′)`, same blocks | `Hom(Λ_{i+1,0}, Λ_{i,0})` has rank `(r+is)(r+(i+1)s)` at one place; conjugate of a unitary representation is its contragredient, parameter negated blockwise | holds | — |
| 5.8f bottom period | centres; signature of `𝒟^c_0` | `c_i = ⌊(a_{i−1}+a_i)/2⌋`; `k + m` entries, `m/2` negative | `(a_{i−1}+a_i)/2 = v_0 + ½ + (m−i+3/2)h_c`, the centre of 5.8a; `l` odd: `m/2 = ⌊(m+1)/2⌋`; entries in `½ + ℤ` | holds | — |
| 5.8g, 5.8h core column, ascent | formal declarations | `CoreOnto`, `Ascent` with the stated ranges | both found in `OffQOfSizeRows.lean` with the theorems named in the two `Proofs/TwistedOperators` files | agrees | — |
| 5.8 rational structure (headline 2; changed) | hypotheses against `HostHyp`, `Big` | `∃ C_F⁰`, `∀ ε`, `∀ C_F ≥ C_F⁰`, `∃ x_F`; gaps `(t+3)/2`, `100r⁴`, `max(256r⁴, 4N_m³+2t+6)` | `∃ CF0, ∀ ε CF, CF0 ≤ CF → ∃ x₀`; fields `interlace`, `gap`, `gapR`, `cloudGap`, `nodeGap (4N³+2t+6)`, `nodeGapR (256r⁴)` | agrees | — |
| 5.8 semilinearity (new) | `λ ∈ 𝕃`; lattice `R`, place `𝔭` | `v(ξ, λx, a) = c_𝕃(λ)v(ξ, x, a)`; localisation at `𝔭` goes to `c_𝕃(𝔭)` | `ℬ_a(ι(λx)) = conj σ₀(λ)·ℬ_a(ιx) = σ₀(c_𝕃λ)·…`; `Φ(R ⊗ 𝒪_{(𝔭)}) = Φ(R)·c_𝕃(𝒪_{(𝔭)})` | holds | — |
| 5.9 multiplicities | supplier statement | odd `r`, parameters in `ℤ^r`, gaps `100r⁴`, nonempty `S` of split places | BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a: `r` odd, `λ_τ ∈ ℤ^r`, `λ_i − λ_{i+1} ≥ 100r⁴`, isometries carrying lattices | agrees | — |
| 5.10 descent constant (headline 1) | `𝔪_j ↦ c𝔪_j` | `ιι^*`, `𝔫₀`, `𝔫` scale by `c^{−2}`; `λ_j` unchanged | `io_j ↦ c^{−1}io_j`; `𝔫_j`, `𝔫_{j+1}` each `↦ c^{−1}` (product of `𝒞_j` scales by `c^{−1}`) | holds | — |
| 5.11 positivity | `σ = σ₀`; `σ\|_K ≠ ι₀\|_K` | reduces to 5.7 (iii); `λ_j(1, 𝔥, σ) = λ_j(1, 𝔥, σ̄)` | `𝔲 = 1`, `ζ = 1`; Gram form at `σ` is the conjugate of that at `σ̄`, scalar real | holds | — |
| 5.12 Gram matrix (headline 3) | level `(H, χ_H)`; `H = {1}` | `⟨ιx, ιy⟩ = \|H\|·𝔫∏λ_j·X_ξ(x, y)` | `⟨ιx, ιy⟩ = 𝔫∏λ_j⟨x, y⟩` on `ι^*(𝔼)[𝔥]`, and `X_ξ = ⟨,⟩/\|H\|` | holds | — |
| 5.2a projector | `𝐆` compact; `SL₂(ℝ)` weight 2 | projection onto the `w`-line of the isotypic part; not claimed | Schur orthogonality with `d·conj⟨w, σ(g)w⟩`; weight-2 coefficient not integrable | holds | — |

- Source locators checked against the text: 7 classical (Rallis84Injectivity line 345, Proposition 1.1, printed p. 149; Rallis84Howe lines 435 and 520, pp. 345 and 351; BernsteinZelevinsky77 line 329, 2.12, p. 448; GanGrossPrasad12 lines 1528, 2229, 3029, pp. 43, 63, 86), all at their locators with the stated ranges.
- [FormalProof], read in the copy the operator holds: all 81 distinct files and 109 declaration names cited exist where cited; opened and compared: `HostHyp`, `D7.NodeGap`, `HidaSetting`, `Big`, `FormulaAt`, `Formula2K`, `SumRatK`, `RatioK`, `ConstK`, `RowsFinDim`, `IoExt`, `PrimRows3`, `SEEIso`, `OneMapRowR`.
- Library declarations at the pin: `NumberField.IsCMField` (CMField.lean:70), `NumberField.AdeleRing` (AdeleRing.lean:56), `Matrix.unitaryGroup` (UnitaryGroup.lean:105), `HeckeRing` (HeckeRing/Defs.lean:189), `DirichletCharacter.LFunction` (DirichletContinuation.lean:60), `TauCeti.GlobalNumberFields.HeckeCharacter` (HeckeCharacter/Basic.lean:70, with InfinityType.lean and Conductor.lean); no Weil representation, discrete series or theta kernel in either library.
- Cross-roadmap citations: 145 section ids of 28 roadmaps resolved to headings (18 roadmaps on main; the 9 family suppliers and SeesawForThetaChains at the head `c1ef475` of the family pull request #2954, whose copy of this README is identical to this head). Statements opened: AutomorphicFormsOnReductiveGroups §§2.2, 3.5; SmoothRepresentationsOfLocalGroupsPartII §2.6; GanGrossPrasadUnitaryGroups 2.6; BaseChangeAndGaloisRepresentationsForUnitaryGroups §13.8a; ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3.
- Dependency check: `depcheck: 132 roadmaps, 1476 edges, 0 problem(s)`. Automatic checks: all passed. Changes outside the folder: none beyond the family index.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message. It declares nothing, so there is no `#check` comparison and no one-tactic probe; no `set_option`, no `sorry`, one `import Mathlib`.
- Headlines: (1) Rallis identities 5.5/5.6/5.10, (2) rational structure 5.8, (3) descent on rational coordinates 5.12. None is statable at the pins (no unitary groups over the adeles, cusp forms, discrete series, Weil representation, partial `L`-functions of Hecke characters); the docstring names each with what it lacks, and its wording of (2) carries the new thresholds and gaps.
- Pull request text: adds a new roadmap; `Suggested.lean` declares nothing; the route through #2954 is as described; every cited roadmap outside the family is on main. No sentence contradicted by the head.

Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, BesselPoincareSeriesAndGramBounds, ThetaKernelsForUnitaryDualPairs, GluedTargetAndDivisionInequality, CongruenceModulesOfThetaLifts (open) and GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups, AutomorphicLFunctionsAndLocalFactorsPartII (main); nothing shared: each open one cites §§5.1–5.12 here as not its own, the Rallis inner product formula and doubling integrals stay with MetaplecticAutomorphicForms and ThetaKernelsForUnitaryDualPairs, Bessel multiplicity one with GanGrossPrasadUnitaryGroups. The family pull request #2954 carries this same folder (identical README).

Source independence: 9 passages compared with 4 sources (Rallis84Howe, Rallis84Injectivity, GanGrossPrasad12, and the statements of [FormalProof], which has no prose), none shared beyond a run of 5 words in the one-line description of Rallis84Howe Theorem 1.1.1 (line 431), a statement of a dozen words; largest share [FormalProof], 103 of 110 locators; contents compared with the directory tree of [FormalProof] (it has no table of contents): independent, the sections 5.1–5.12 cite files of unrelated directories in no common order.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004: README References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- That the rows of [FormalProof] are the complex conjugates of the rows of 5.1 (5.8e, 5.8f, 5.8): I checked that its functionals are applied to its own row with no conjugation, not the comparison of the two definitions of a row.
- [FormalProof] beyond the statements listed above: no proof was read, and "follows from" was checked only as far as the named declaration existing with a statement of that subject.
- The works cited by name, title and venue without a locator (Kudla, Li, Ichino, Paul, Harris and others) were not opened.
- The family suppliers were read at the head of #2954, which the roadmap tools do not index; the separate pull requests of FrobeniusRestrictedRieszSums, ThetaLiftsForDefiniteUnitaryGroups, FiniteReductiveGroups, DiscreteSeriesCoefficientsAndAutomorphicMetrics and HermitianFormsAndLattices are closed.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as a public verification setup.
- Licence: the copy of [FormalProof] read here carries no licence file. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with statements and the arrangement with its directory tree only.
- Process: #2954 (open, draft) carries this folder with an identical README; five supplier pull requests the description's generated dependency list shows as open (#2920, #2897, #2881, #2909, #2882) are closed. Which of #2919 and #2954 merges this folder is to be decided.
