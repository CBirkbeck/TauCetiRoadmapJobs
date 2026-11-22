# Review of RowTowerAndRallisIdentities (pull request #2919 at 4f9be71)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/RowTowerAndRallisIdentities/`
**Verdict:** needs changes

**Summary.** Changes are needed for one point of mathematics: the Bessel functionals `ℬ_a` of 5.8e are defined on `e(w)`, while the new targets 5.8f and 5.8i, from which their joint injectivity is deduced, and the formal statement they cite, concern the complex conjugate `conj(e(w))`; so the separation of 5.8e, on which headline (2) rests, is not supported as written. The four corrections of the previous review are repaired (one partly). There are three small corrections and three format notes, none blocking. The standing of the formal proof as main source, and the family pull request #2954 that now carries this folder, are for the human reviewers.

## R01 (P2) — 5.8e defines the functionals `ℬ_a` on `e(w)`, but 5.8f and 5.8i, which are steps (B) and (E) of its route, prove nonvanishing for `conj(e(w))`, so the joint injectivity of 5.8e does not follow

An implementer who proves 5.8f–5.8i as stated obtains a different family of functionals from the one 5.8e, 5.8 and headline (2) use. In 5.8e the definition is `ℬ_a(e) := B⁺(⟨ℓ⁺, y_{κ,i}⟩, Θ^{(0)}_{𝐩,𝐜}(e(w)))` (line 1356), step (B) of the outline is the bilinear period `∫ y(h)e(w)(h)dh ≠ 0` (line 1436) and step (E) is `B⁺(⟨ℓ⁺, y⟩, Θ^{(0)}_{𝐩,𝐜}(e(w))) ≠ 0` (line 1454); the outline says that (B)–(E) are 5.8f–5.8i. But 5.8f states `∫ conj(e(w)(h))·y(v)(h) dh ≠ 0` (line 1499) and 5.8i states `B⁺(⟨ℓ⁺, y′⟩, Θ^{(0)}_{𝐩,𝐜}(ē(w))) ≠ 0` with `ē(w) := conj(e(w))`, "the function to which [FormalProof] applies the functionals of 5.8e" (lines 1549–1550). The two are not equivalent: `B⁺(φ, Θ(conj u))` is the complex conjugate of the functional of the conjugate Weil data and the conjugate character `ψ⁺` at `u`, not `B⁺(φ, Θ(u))`. I opened the formal statements: `FunctionalsSeparate` and `WeakSep` apply `fPsiPhi … (t w)` to the proof's own rows `t` with no conjugation (`…/DivisorBase/LevelPlusSubgroup.lean`, lines 65–67 and 83; `…/TwistedInnerProducts/OffQOfSizeRows.lean`, line 130), and 5.8f says those rows are the complex conjugates of the rows of 5.1; so in the notation of this roadmap the formal separation is the one of 5.8i, not the one of 5.8e. By the Check of 5.2 ("The conjugation is needed") a linear theta integral of a form of the wrong archimedean type vanishes identically; if that applies along column `0`, the `ℬ_a` of line 1356 are zero on `ℋ^♮` and the Statement of 5.8e is false, and in any case nothing here proves it.

Smallest change: in 5.8e define `ℬ_a(e) := B⁺(⟨ℓ⁺, y_{κ,i}⟩, Θ^{(0)}_{𝐩,𝐜}(conj(e(w))))` (conjugate-linear in `e`) and write steps (A), (B), (E), (F) of the outline for `conj(e(w))`; then say in 5.8 that `ℬ_a` is conjugate-linear (`𝔼_𝕃` is still an `𝕃`-subspace, since `c_𝕃` preserves `𝕃`, and the argument for `𝔼_𝕃 ⊗ ℂ = 𝔼^♮` is unchanged), and check the side of the conjugation in the identity `ϱ_ξ·∏c(i, j, ξ)·ℬ_a(ι_ξx) = κ_G·v(ξ, x, a)` against `Formula2K`, whose `psiK` is applied to the proof's descent. If instead `e(w)` is meant throughout, 5.8f and 5.8i must be restated for it and can no longer cite `PeriodNe` and `WeakSep`.

## C01 — The identity of 5.8 is stated for the grid with any `C_F ≥ 6510` and without the gaps of 5.9; the formal statement cited for it has an unspecified threshold for `C_F` and the gap hypotheses

The Conventions promise that where a target names [FormalProof] its "hypotheses, ranges and constants are those of the proof", and that a wider form is marked as this roadmap's own. 5.8 says "[FormalProof] states the identity … as `GlobalTheory.RowClaim.Formula2K` …, for an `𝕃` containing (L1)–(L7)" (lines 1621–1624) under "`x ≥ x₀` and `Size_□` … for the grid of the chain (5.8e)". I opened the file: `Formula2K`, `SumRatK`, `RatioK` and `ConstK` are of the shape `Big Q`, that is `∃ CF0, ∀ ε CF, CF0 ≤ CF → ∃ x₀, …` (`…/Statements/HeckeThetaIntegrals/FormulaAt.lean`, lines 68–72, 78, 88–92), so the threshold for `C_F` is existential and not `6510`; and the standing record `HidaSetting` of that file (lines 22–28) has, beside `SizeRows`, the field `host : HostHyp D`, whose clauses `gapR`, `cloudGap` are the gaps `100r⁴` of 5.9 (`Formalism/LocalToGlobal/IndefiniteReal/LinksLemmas.lean`, line 496). The statement of 5.8 and headline (2) assume neither.

Either record the formal form in the parenthesis ("for `C_F` beyond a threshold and under the gap hypotheses of 5.9"), marking the form for every `C_F ≥ 6510` without those gaps as this roadmap's own, or add the two hypotheses to 5.8.

## C02 — The description says the suppliers "still in open pull requests merge first"; seven of them are closed in favour of #2954, which also carries this folder

A reader of the description cannot tell where the suppliers are or which pull request merges this folder. The pull requests of FrobeniusRestrictedRieszSums, ThetaKernelsForUnitaryDualPairs, ThetaLiftsForDefiniteUnitaryGroups, DiscreteSeriesCoefficientsAndAutomorphicMetrics, FiniteReductiveGroups, LocalFactorsOfTwistsAndTypes and HermitianFormsAndLattices (#2920, #2907, #2897, #2909, #2881, #2889, #2882) were closed on 2026-11-22 "in favour of #2954", the family pull request; the `depends-on` block still lists them as open suppliers. At its head `eeece62`, #2954 has this folder's README byte for byte as at `4f9be71`. GanGrossPrasadUnitaryGroups, AutomorphicBundles, AutomorphicPadicLFunctionsPartII and ComplexMultiplicationAndExplicitReciprocity are now on main.

Text that would be right: "The sub-roadmaps of the family this one cites are carried by #2954, which also carries this folder with the same files; this pull request is merged after, or closed in favour of, #2954." A repair made here has to reach #2954 as well.

## C03 — The docstring of `Suggested.lean` says Tau Ceti lacks "Hecke characters of a number field with their partial `L`-functions"; the pinned Tau Ceti has Hecke characters

`TauCeti.GlobalNumberFields.HeckeCharacter` is declared at the pin (`TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean`, line 70, with conductors, infinity types and algebraicity in the same directory); I found no `L`-function of a Hecke character there. No headline becomes statable (the unitary groups, cusp forms, theta kernels and Satake parameters are still missing), but the sentence should name the declaration and say that only the partial `L`-functions are lacking.

## N01 — "The mathematics of this roadmap follows a complete formal proof" (line 161) still reads as a plan that follows a source; "the results stated here are those of [FormalProof], except where a target says otherwise" says what is meant.

## N02 — The References give [FormalProof] as the source of "5.1, 5.3–5.6, 5.8b–5.8i, the identity of 5.8 …", which still leaves out 5.2, 5.7 and 5.8a although each cites its declarations; and its files are cited as `Formalism/…`, `Development/…` where the linked repository has them under `src/`.

## N03 — Several credits are a name only (Rallis 1982, Kudla 1986 and 1994, Shimura, Deligne, Blasius, Gelfand–Graev, Godement, Paul, Petersson, Casselman, Wallach); a title and a theorem number would let a reader find them.

## Questions for the author

- Lemma (the gaps of the grid) of 5.8e gives `1000(r + 1)³` for `Y_0` and `X^c_0` and cites `GlobalTheory.SepPer.realInputPar`. That theorem states its conclusion through `GlobalTheory.SepReal.Par e ε lam ε′ mu (sc.b ^ 2)`; I did not unfold `Par`. Is `1000(r + 1)³` a clause of it?
- 5.7 says that the highest weight of `𝒲_j` is "not given here" while `Δ_j` is a lowest weight vector of weight `−Λ_j(τ)` with `Λ_j(τ)` dominant, and the formal record identifies `𝒲` with the module of the weights `Λ_j(τ)` on which `γ` acts through `γ^{−1}`. Is the highest weight then not determined (the contragredient of the module of highest weight `Λ_j`)? I did not work out the Fock action at the negative block.

## Verified sound

| Statement | Instances tried | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 5.2 gap (G); Check | `min(p,q) ≤ m`, `N_m ≥ 8m`; `j = 1` | `120·N_m·m² ≤ 2N_m³`; `μ_1η̃^{−1}` on `Y_0` | needs `N_m ≥ √60·m ≈ 7.75m`; `r + (j−1)t ≡ j (mod 2)`, `Y_0` odd | holds | — |
| 5.2 up-lift vector | level group of stage `j − 1`; twist place, `j = 1` | `ω(κ,1)(P ⊗ conj φ_j) = conj χ(κ)·…`; with `φ_j`: `c_v^{−2}` | `ω(κ)conj φ = conj(ω̄(κ)φ) = conj χ(κ)conj φ`; integrand `conj χ·χ = 1`; `ω̄ conj Φ^Q = c²` ⇔ `ωΦ^Q = c^{−2}Φ^Q` | holds | — |
| 5.2a | compact `𝐆`; `SL₂(ℝ)` weight 2 | `ρ(e_σ)` projects on the `w`-line; not integrable | `⟨u, σ(e_σ)v⟩ = ⟨u,w⟩⟨w,v⟩`; `e_σ(g^{−1}) = conj e_σ(g)`; integrable iff weight `> 2` | holds | — |
| 5.3 Checks | `r = 15`; `r = 7`; `r = 9, 11`; general | (4) fails at `a = 4`; no good tuple; a prime exists | sums `{1,3,4,11,…}`, `{2,4,11,…}`; `(3.5, 4]` empty; `5 ∈ (4.5, 6]`, `7 ∈ (5.5, 8]`; prime in `(n, 2n−2)` | holds | — |
| 5.3 Route against the supplier | `n = r`, `q₀ = q_S` | `h > npq + 1`, `h > 16√(2q₀)nq₀`, or `h ≥ 120nq₀^{3/2}` | DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (d): the same three thresholds | agrees | — |
| 5.4 identity | level `(P_1, χ_{P_1})` | `c_I(j) = 𝔪_j·vol_f(K^{rt})`; `c_I(ξ)·idx = c_I(1)` | `\|P_1\|·𝔪_j·vol_f(K^{pr})`; `vol(K(ξ))·[K(1):K(ξ)] = vol(K(1))` | holds | — |
| 5.5 twist places; thresholds | `(i, r, t, q) = (0, 1, 3, 2)`; general; `q₀ ≤ m/2` | `15·(1/16) = 15/16`; `∏_{n=(i+1)t+1}^{(i+1)t+r}`; both `< 2N_m³` | `#ℙ³(𝔽₂) = 15`, `1 − 2^{−4}`; Gaussian binomial × `\|GL_r\|q^{−r²−r(i+1)t}`; `8m^{3/2}N_m`, `n³/4 + 1` | holds | — |
| 5.6 (headline 1) | split place; surjectivity | factors `> 0`; `e = ι(ι^*e)/s_c` | `\|1 − βūN w^{−s}\|^{−2}`; `ιι^* = s_c ≠ 0` on each part | holds | — |
| 5.7 model lift; weights | `h ↦ hu`, `h ↦ γh`; parities | integrand invariant; `x₃, x₁, d_j ∈ ℤ`; weight `−Λ_j` | `ω(u)I(e ⊗ u^{−1}ỹ) = I(e ⊗ ỹ)`, `ỹ(γh) = ỹ(h)`; `p − q` odd, `r + t` even; `x₃ = −d_j`, entry `n`: `−a⁺_n − d_j` | holds | — |
| 5.8a | `i` even, odd; ranks; `r′` | `⌊(m−i+1)/2⌋ + ⌊i/2⌋ = m/2`; complement `i − 1`; `p_□ − 1 > #μ_E` | `m/2` both parities; `r + is − (r+1) − i(s−1)`; `r′ ≥ 3`, `3N_E > 2N_E ≥ #μ_E`; core ranks even | holds | — |
| 5.8b | `t ≥ 3m+1`, `s = r+6`; spacing | `(t+s)/2 > 2(p+q)+1`; left side `> 3h_c − 1 > 2N_□` | `(5m+9)/2 > 2m−1`; `p+q = m−j−1`; `a − a′ = t+s`; ranks `< N_□`; §6.11 hypotheses 1–4 as quoted | holds | — |
| 5.8e `Size_□`, statement | formal `SizeRows`, `SizesAt`, `FunctionalsSeparate` | (o), (i)–(viii), `ccK = 𝒪_K`; 23 names; `C_F ≥ 6510` | same conjuncts; the 23 predicates named are those of `SizesAt` plus `11 ≤ splitBound`; `6510 ≤ CF` | agrees | — |
| 5.8e lemmas | depth; level; gaps at `V(m, 0)` | losses ≤ half of `log N(𝔪_□)`; `1840(50C_F+3)b log b`; `120(r+ms)³` | `(2σ)^{1/m}·e^Q r²f g₀g₁rd_E = ½`; `size_le`: same bound; `fit_gap`: `120·rank³` | holds | — |
| 5.8e `ℬ_a` against 5.8f, 5.8i | argument of the functional | `e(w)` in 5.8e; `conj(e(w))` in 5.8f, 5.8i | formal: applied to its own rows, the conjugates of those of 5.1 | inconsistent | R01 |
| 5.8f | parameter of `𝒟^c_0` | `c_i = ⌊(a_{i−1}+a_i)/2⌋`; `m/2` negative entries; `r + 1` entries | `v_0 + ½ + (m−i+3/2)h_c`; `l = m−1, m−3, …, 1`; `(m+1) + (k−1)` | holds | — |
| 5.8g, 5.8h, 5.8i | formal `CoreOnto`, `Ascent`, `WeakSep` | gap constant 1 and sizes; one host condition; all rows | `Gap` (`cGap = 1`, `Sizes`); `All` (`OffQ`: `p_δ, p′_δ` prime to `Q_S·q`); `Ev` (`6510`, `SizeRows`) | agrees | — |
| 5.8 (headline 2) | `𝔼_𝕃`; formal `Formula2K` | `𝔼_𝕃 ⊗ ℂ = 𝔼^♮`; `C_F ≥ 6510`, `Size_□` | injective into `𝕃^A` and spanned by `ι_1(x)`; formal: `∃ CF0`, `HidaSetting` with `HostHyp` | holds; formal form narrower | C01 |
| 5.9 | BaseChange §13.8a at its head; FRRS §0.4 (i) | CM extension unramified at finite places; gap `100r⁴`; nonempty `S` | the same; cyclic hosts have `d ≡ 7 (mod 16)`, so `d ≡ 7 (mod 8)`; `E/F` unramified | agrees | — |
| 5.10 | `𝔪_j ↦ c𝔪_j`, `1 ≤ j < m` | `ιι^*`, `𝔫` by `c^{−2}`; `λ_j` fixed | `io_j ↦ c^{−1}io_j`; `𝔫_j`, `𝔫_{j+1}` each by `c^{−1}` | holds | — |
| 5.11 | places of `𝕃`; `𝔫 > 0` | one embedding over `K` per place; from `ι_1ι_1^* ≥ 0` | `K` imaginary quadratic; `𝔫∏λ_j > 0`, `λ_j > 0` | holds | — |
| 5.12 (headline 3) | Gram matrix; rational points | `\|H\|·𝔫·∏λ_j·X_ξ`; bijection | `⟨ιι^*e, ιy⟩ = s⟨ι^*e, y⟩`; `⟨x,y⟩ = \|H\|X_ξ`; equal `𝕃`-dimensions | holds | — |

- Source locators checked against the text: 7 in 4 classical sources (Rallis84Injectivity line 345; Rallis84Howe lines 429–435 and 518–526; BernsteinZelevinsky77 lines 329–337; GanGrossPrasad12 lines 1528, 2229, 3029), all correct. [FormalProof]: all 76 cited files exist in a local clone of the linked repository and all 100 cited declarations are declared in the file cited beside them; statements read for `SizesAt`, `SizeRows`, `FunctionalsSeparate`, `PeriodNe`, `CoreOnto`, `Ascent`, `WeakSep`, `Formula2K`, `HidaSetting`, `HostHyp`, `fit_gap`, `size_le`; no proof read.
- Previous review: C01 repaired (Conventions lines 72–75, 5.9, Scope, the contract entry; §6.13c now "for all `r, t, N ≥ 0`"); C02 repaired ("a cyclic host"); C03 repaired (the twenty-three names, lines 1369–1379, which are those of `SizesAt`); C04 partly (the identity now names `Formula2K`, `SumRatK`, `RatioK`, `ConstK`; see C01 and N02); N01, N03 unchanged, N02 unchanged.
- Cross-roadmap citations resolved: every cited section heading of the nine family suppliers at the head of #2954 (79 sections) and of the eighteen suppliers on main; none missing. Statements read: BaseChange §13.8a, FrobeniusRestrictedRieszSums §0.4, DiscreteSeriesCoefficientsAndAutomorphicMetrics §2.4a (d), ThetaLiftsForDefiniteUnitaryGroups §6.11, ThetaChainsOnDefiniteUnitaryGroups §2.3 Lemma (h), ThetaKernelsForUnitaryDualPairs §6.13c.
- Library declarations opened at the pin: `NumberField.IsCMField` (CMField.lean), `NumberField.AdeleRing` (AdeleRing.lean:56), `Matrix.unitaryGroup` (LinearAlgebra/UnitaryGroup.lean), `HeckeRing` (NumberTheory/HeckeRing/Defs.lean:189), `DirichletCharacter.LFunction` (DirichletContinuation.lean:60), `TauCeti.GlobalNumberFields.HeckeCharacter` (HeckeCharacter/Basic.lean:70).
- Dependency check: `depcheck: 136 roadmaps, 1532 edges, 0 problem(s)`. Automatic checks: all passed. Changes outside the folder: none beyond the family index.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no message; the file declares nothing, so there is no `#check` comparison and no one-tactic probe.
- Headlines: (1) 5.5/5.6/5.10, (2) 5.8, (3) 5.12; none statable at the pins (no adelic unitary groups, cusp forms, theta kernels or Satake parameters); the docstring names each with what it lacks (C03 on one clause).
- Pull request text: a new roadmap, `Suggested.lean` declaring nothing, as described; the sentence on open suppliers is out of date (C02).

Overlap check: read ThetaChainsOnDefiniteUnitaryGroups, CongruenceModulesOfThetaLifts, BaseChangeAndGaloisRepresentationsForUnitaryGroups, SeesawForThetaChains, GluedTargetAndDivisionInequality (open) and GanGrossPrasadUnitaryGroups, AutomorphicLFunctionsAndLocalFactorsPartII, AutomorphicFormsOnReductiveGroups (main); the open ones name 5.1–5.12 as this roadmap's and it names theirs; nothing shared. #2954 carries this same folder (C02).

Source independence: 7 passages compared with 4 classical sources and 12 statements of [FormalProof] (Lean code, no prose), none shared (longest common run 5 words, at Rallis84Howe line 431); largest share [FormalProof], 100 of 107 locators; it has no table of contents, and its 76 cited files lie in several directories in no order matching 5.1–5.12: independent. [Announcement] was not opened.

Research link: 5.5–5.7 are Rallis inner product identities for theta lifts between unitary groups (Rallis 1984; Li 1992; Ichino 2004, per the README's References and Rallis84Injectivity), assembled into the row side of the chain of theta lifts of Alpöge's formal proof of the Riemann hypothesis for Dirichlet L-functions (2026; README Conventions and References).

## Not verifiable

- [FormalProof] beyond the statements listed: no proof was read; the constants of 5.5, 5.7, 5.8d and the bound `1000(r + 1)³` of the gap lemma of 5.8e were not compared with it.
- Which of `e(w)` and `conj(e(w))` has a nonzero lift along column `0`: it needs the archimedean correspondence for the right pairs of 5.8a, which I did not work out (R01 rests on the two statements disagreeing and on the formal declarations).
- The works credited by name or title only (N03), and Li 1992, Ichino 2004, Arthur–Clozel, Labesse, Milne, Harris, Katz: no locator, not opened. [Announcement]: not opened.

## Source issues

- none

## For the human reviewers

- Scope: the *NEW* targets rest on [FormalProof] alone (README References), a Lean formalisation by one author announced on 2026-11-20 with no paper; the linked repository describes itself as mirrored for verification.
- Licence: the repository linked for [FormalProof] shows no licence. The roadmap restates mathematics and cites file and declaration names; it copies no code.
- Not tested: [FormalProof], the source with the largest share of locators, has no prose and no table of contents; wording was compared with twelve statements and the arrangement with its directory tree only.
- Process: #2954 (the family in one piece) carries this folder with identical content, and seven supplier pull requests were closed in its favour; which of #2919 and #2954 merges this folder is to be decided.
