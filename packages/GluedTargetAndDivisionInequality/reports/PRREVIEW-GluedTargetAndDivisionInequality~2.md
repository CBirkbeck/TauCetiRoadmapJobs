# Review of GluedTargetAndDivisionInequality (pull request #2922 at 9aad1e2)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/GluedTargetAndDivisionInequality/`
**Verdict:** needs changes

**Summary.** Changes are needed for two findings, both missing hypotheses in headline results. First, the chain case of integrality after division (7.13, 7.14) and the height of the period pairing (8.9) apply SeesawForThetaChains §6.14 and §6.15 without §6.14's hypothesis that `P_u` is nonzero on the new forms. Second, 8.9 applies 8.6 without 8.6's bound on `(L′/L)(1, χ_K)`, and no size predicate supplies that bound. There are also four small corrections (a Check of 8.1 set outside its hypotheses, unused lattice hypotheses in the Lean theorem, a sentence of the description about the family index, missing source locators) and one format note, none of them blocking. The human reviewers have a scope question to decide: the roadmap rests on a formal proof of the Riemann hypothesis announced on 20 November 2026, whose text could not be read.

## R01 (P2) — The chain case of integrality after division (7.14), the clause of 7.13 that makes `B_u` a map into semilinear functionals, and 8.9 apply SeesawForThetaChains §6.14 (c) and §6.15 without the hypotheses of §6.14, in particular that `P_u` is nonzero on the new forms `M_u`.

As stated, 7.14 claims `B_u(N′_u) ⊂ R^∨` for every word under hypotheses that do not give the identity `P̃_ξ(φ, Υ) = ζ(u, ξ)·B_u(φ)(ι_ξΥ)` with `ζ(u, ξ)` a root of unity in `𝕃`. That identity is the only link between the pairing and the periods whose valuations LocalGainOfThetaChains §4.16 (ii) bounds. Without it, an implementer cannot prove 7.14 for a word at which the hypotheses of §6.14 fail. The same gap affects 8.9, whose heights at every embedding need `B_u` to be `𝕃`-rational (§6.15 (a)).

Here is how I know. SeesawForThetaChains §6.14 opens with "Let `m ≥ 4` be even and the data of Layers 2–5 of the chain be given […] with the hypotheses of RowTowerAndRallisIdentities §5.5 for every step, and assume that `P_u` is nonzero on the `T(u)`-new forms `M_u`". Its §6.15 assumes "those of 6.14". `P_u ≠ 0` is not automatic: BesselPoincareSeriesAndGramBounds §5.21 (v) proves it only under its own list of hypotheses, including `e_diag < 1 − δ_old(u)`. 7.14 (line 338) assumes LocalGainOfThetaChains §4.16 (ii) and §4.16b, RowTowerAndRallisIdentities §5.5 for every step, and RowTowerAndRallisIdentities §5.8 and §5.12. The only one of §6.14's hypotheses it carries is §5.5. RowTowerAndRallisIdentities §5.12 assumes 5.6, 5.8, 5.9 and a condition on `𝕃`, and neither it nor §5.8 contains `P_u ≠ 0`. The route's opening "if `B_u = 0` there is nothing to prove" (line 342) does not close the gap, because the dichotomy of §6.15 (b) is itself stated under §6.14's hypotheses. 8.9 (line 715) describes its hypotheses as those "on which SeesawForThetaChains §6.15 and 7.13 rest", but it lists only RowTowerAndRallisIdentities §5.8b, `x ≥ x₀` and `Size_□`.

The smallest change: add "and the hypotheses of SeesawForThetaChains §6.14 (among them that `P_u` is nonzero on `M_u`, BesselPoincareSeriesAndGramBounds §5.21)" to the definitions of 7.13 at the sentence that makes `B_u` an `𝕃`-linear map (line 299), and to the statements of 7.14 and 8.9. Add the same words to the corresponding bullets of the module docstring of `Suggested.lean`. Nothing downstream changes: ThetaChainsAndFrobeniusPrimeSums §§10.0, 10.9 already put the hypotheses of §6.14 into its chain data.

## R02 (P2) — 8.9 bounds `ht(B_u)` through 8.6 but does not assume 8.6's hypothesis `|(L′/L)(1, χ_K)| ≤ x^ε`, and no size predicate supplies it.

The constant `C₁` in `h_u` is the constant of 8.6. The error term of 8.6 contains the Gaussian-growth constants, whose mean is at most `C·f·N_{j−1}N_j·(La + |(L′/L)(1, χ_K)|)` (8.6 route, line 582; ThetaChainsOnDefiniteUnitaryGroups §3.1d (c)). It is absorbed into `C₁·f·m³·N_m²·La` only when `(L′/L)(1, χ_K)` is of size `La`. If `L(s, χ_K)` had a real zero `β` near `1`, then `(L′/L)(1, χ_K) ≥ 1/(1 − β) − O(log d)`, and `log d` is bounded above only by `log f_E ≤ 2x^{ε/5}log²x` (`SizeN`). This family cannot exclude such zeros in advance, so `ht(B_u) ≤ h_u` is unsupported as stated.

Here is how I know. 8.6 is stated "under the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 (which give `log g₀, log g₁ ≤ C·La`) and `|(L′/L)(1, χ_K)| ≤ x^ε`" (line 573–574). 8.9 (line 715) assumes `SizeT_u`, RowTowerAndRallisIdentities §5.8b, `x ≥ x₀` and `Size_□`. The predicates of ThetaChainsOnDefiniteUnitaryGroups §2.1 (`SizeA` to `SizeTheta`) and the clauses (o)–(viii) of `Size_□` (RowTowerAndRallisIdentities §5.8e) contain no bound on `(L′/L)(1, χ_K)`. 8.22 assumes `|log Ω| ≤ La`, which gives the bound up to a constant, but 8.9 is the statement that ThetaChainsAndFrobeniusPrimeSums §9.6 cites for `ht(B_u) ≤ h_u`.

The smallest change: add "the size conditions of ThetaChainsOnDefiniteUnitaryGroups §2.1 and `|(L′/L)(1, χ_K)| ≤ x^ε` (the hypotheses of 8.6)" to the statement of 8.9. At present 8.9 carries the size conditions only through `Size_□` (o), whose list RowTowerAndRallisIdentities §5.8e does not give. Headline (2) of the Summary and its bullet in the docstring of `Suggested.lean` need the same words.

## C01 — The Check of 8.1 (and the first Example of Layer 8) takes `m = 0`, but then the hypothesis forces `ι^*ι` to be the single scalar `κ(σ)` on every `Q_π`, so the map `ι` with eigenvalues `1` and `4` is not an instance.

With `m = 0` the product `∏_j λ_j(π, σ)` is empty, so 8.1 asks `ι_σ^*ι_σ` to act by `κ(σ)` on each `Q_π`, the same scalar for every `π`. The Check then has no `λ_j` to which `min_π` or `max_π` could apply (lines 447 and 1379). The point of the Check is right, and it holds at `m = 1`: take `S_0 = S_1 = 𝕃`, `K_1 = id`, `κ = 1`, and `λ_1 = 1` on `Q_1` and `4` on `Q_2`. Then `‖B‖² = 1` meets the bound `‖Pt‖²/1`, and the `max_π` version would give `1/4`.

## C02 — The lattice hypotheses of `pairing_integral_of_localDivision` (and of 7.12) are not used.

Neither the route of 7.12 nor any proof uses `hN`, `hNspan`, `hR`, `hRspan`, `hM`, `hMspan` or the finite dimensionality of `V`, `W`. Integrality at every `𝔮` follows from `hRloc`, `hP`, `hζ`, `hσ` and `hτ` for arbitrary `𝓞 L`-submodules, since an element of `L` with nonnegative valuation at every height-one prime is integral. Stating 7.12 for arbitrary submodules would be the more general target. If the lattice case is the one meant, say so.

## C03 — The description says that every pull request of the family carries the family index with identical content, but the index here differs from the one at the heads of LocalGainOfThetaChains, ThetaChainsOnDefiniteUnitaryGroups and CongruenceModulesOfThetaLifts.

The index README at this head describes the formal proof in a new paragraph ("The theorems of that proof are the two statements […]; the statement for Dedekind zeta functions […] are not statements of the formal proof"). The heads of #2915, #2918 and #2921 still carry the earlier paragraph ("the last roadmap of the family states and proves these theorems", 16–25 changed lines). The heads of #2880, #2923 and #2924 agree with this one. Either bring the other heads into line, or say in the description which head the others are rebased on.

## C04 — No source carries a theorem or page locator, and the clauses whose routes are "not given here" rest on [FormalProof] cited only as a whole repository.

A reader cannot find what supports 8.19e (c), 8.20 (o) and (vii), step (3) of 8.20a, the gauge point of 8.24a (b), 8.24b (i) and term (4) of 8.24 (a). Give the file or declaration of the formal proof for each. The classical references (Bost, Bargmann, Frame–Robinson–Thrall, Chowla–Selberg, Gaudron–Rémond) also need locators: the slope inequality the README attributes to Bost is Bost 1996, Prop. 4.3 (1), p. 131.

## N01 — The route of 8.7 (line 632) writes `\overline{∏_τ(t_τg_τ)^{−n_τ}}` in TeX inside a code span; `conj(∏_τ(t_τg_τ)^{−n_τ})` would follow the house style.

## Questions for the author

- In the second Check of 8.21, which valuation is "none at its conjugate"? For `L = 𝒪`, `e = (2 − i)^{−1}` in `ℚ(i)`, the Gram determinant `e·c_𝕃(e) = 1/5` has valuation `−1` at both `(2 + i)` and `(2 − i)`. The index of `⟨e⟩` is `0` at `(2 + i)` and nonzero at `(2 − i)`. I could not tell which of these the sentence means.
- The README cites 21 sections of ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, and the family index lists it before this roadmap. Yet the dependency list and the merge-order paragraph of the description omit its pull request (#2923). Is it meant to merge first? Those blocks are generated, so I did not raise this as a correction.

## Verified sound

| Statement | Instances tried | Values computed (both sides) | Result |
|---|---|---|---|
| 7.12 / `pairing_integral_of_localDivision` | Check (i): ℚ, `N = 6ℤ` | `σ₂ = σ₃ = 1`; `τ = (1,1)`: `N′ = ℤ`, values `ℤ`; `τ₂ = 2, τ₃ = 1`: `N′ = ½ℤ`, value `½` | holds; Lean matches README; probe (`simp`, `aesop`, `simp_all`) fails |
| 7.12 Checks (ii), (iii) | ℚ(i), `𝔭 = (2+i)` | `(2+i)/(2−i)`: `v_𝔭 = 1`, `v_{c𝔭} = −1`; `R = c(𝔭)^{−1} ⊂ 𝒪_(𝔭)`; `B(N,R) = 𝔭^{−1}` | holds |
| 7.13 | no twisted place; rank; duality | `R = Λ_1` (localisations of `Λ_1`); `rk N′_u = d_u`; `μ_min(R^∨) = −μ_max(R)` by Slopes §2.2 | holds; `B_u` clause → R01 |
| 7.14 | `τ_𝔭 = σ_𝔭 = ⌊e_𝔭𝔊_u(𝔭)⌋`, `c = c_𝕃` | `c^{−1}(𝔭) = c_𝕃(𝔭)`; `ξ_{c𝔭} = ξ_𝔭` (ThetaChains §2.5 Lemma (iii)); `𝔊_u` finitely supported (LocalGain §4.9f (g)) | route sound; `P_u ≠ 0` missing → R01 |
| 8.1 | Check `m = 0`; `m = 1`, `λ_1 = (1, 4)` | `m = 0`: one scalar `κ` on all `Q_π`; `m = 1`: bound `1`, max-version `1/4` | C01 |
| 8.2 | `N = 1`, `Th = e^{u²/2}`, `ū^{2n}`; (b) | `((2n)!/(2^n n!))² ∼ 2(2n/e)^{2n}`; RHS `e(4n+2)²(2n/e)^{2n}`; `(1+1/n)^{n/2} ≤ e^{1/2}`; `π^{−N}∫e^{−θ|u|²/2} = (2n+2)^N` | holds |
| 8.3 | constants, `ρ = √g` | `#(Λ∩B_{2ρ}) ≤ (1+4ρ/√(πh))^{2g}`; `e^g g!/(πg)^g ≤ (e/π)^g` | holds |
| 8.4 | `N = 1`, `n` even | `|c_n n!|² = ((n−1)!!)² ≈ √(2/(πn))·n!`; `n! ≈ √(2πn)·e^{ph(n)}` | holds |
| 8.5c | `E = K`; norms | `|d_E| = N(𝔡)D^{[E:K]}` ⇒ `log(rd_E/√D) = log N(𝔡)/[E:ℚ]`; `N(𝔞₀𝔡) = N(𝔡)^{1/2}` | holds, sign `−` |
| 8.7 (a) | `λ = (1,0)`, `σ = (0)`, `G′ = (a)` | `br∘br^* = 1`; rescaled highest-weight vector: `a` | holds |
| 8.8 | Fischer norm | IntegralWeyl §3.1: `‖∏Δ_k^{a_{k−1}−a_k}‖² = H(a)`; `SizeG` gives `g_i > (kb)⁸` | holds as cited |
| 8.9 | hypotheses against 8.6–8.8, Seesaw §6.14 | 8.6 needs `|(L′/L)(1,χ_K)| ≤ x^ε`; §6.14 needs `P_u ≠ 0` | R01, R02 |
| 8.10 | `μ = (2,2)`; `ph` | `∏μ_i! = 4 ≤ H = 3·2·2·1 = 12`; `ph(0) = 0 > ph(1) = −1` | holds |
| 8.19e (b) | `ν ≤ r·k` | `Z ↦ Z^ε` étale at `1` (`ℓ ∤ ε`): `ν = mult_{y=1}(g) ≤ deg g ≤ rk` | holds |
| 8.20 (vi), (P4) | numeric | `Σ_p 2 log p/p² = 0.98618 < 1`; (P4) LHS `≤ q_j f(1+vd/2)(2b+Sc) + q_j f η_w ≤ q_j(2+vd)f(2b+Sc+η_w)` | holds |
| 8.20a Check | `g = 13, T = 3, e_𝔩 = 12, e₁ = 2` | with `ν* = 1/12`: `E = 2⌈36+3⌉ = 78`, `78/24 = 13/4 ≤ 3 + 13/24` | holds (`ν*` not stated) |
| 8.21 (a)–(c) | weighted means; `δ_G`; Check | `(1+δ)/(1−δ) ≤ 1+3δ` (`δ ≤ 1/3`); `2sn/g = 4fr/g`; `(𝒪_𝕃, c|·|)`: `−μ = 2 log c`, sum-version `4 log c` | holds |
| 8.22 | (D4) | `p_j − q_j − k = 2j−1−m`; `Σ_{j=1}^m(2j−1−m) = 0`; remainder `≤ f m²(ϑ+1)La` | holds |
| 8.23 (b) | `ph` on `[1, M]` | `ph′ = log y ∈ [0, log M]` | holds |
| 8.24a | `p_□ + q_□` | `⌊(n−1)/2⌋ + ⌊n/2⌋` at `n = 1..4`: `0, 1, 2, 3` = `n − 1` | holds |
| 8.24b | (i) ⇒ (ii) | `v_𝔭 ≥ −(d+d+d)e_𝔭`; `Σ_𝔭 ϱ(𝔭)d(ℓ)e_𝔭 = Σ_ℓ d(ℓ) log ℓ` | holds; (i) declared unproved |
| 8.24 | slope test in `μ = 2μ̂` | `+(2/[𝕃:ℚ])Σ a(𝔭)log N𝔭 = 2Σϱ(𝔭)a(𝔭)`; `Σ log ℓ/ℓ² = 0.493`; `f = 2|A|` | holds |

- Source locators checked: Bost1996 (Numdam): Prop. 4.3, printed p. 131, and App. A.2, pp. 146–147, read in prose; their displayed formulas are missing from the text layer. Nothing else readable.
- Library declarations opened: `TauCeti.subspaceHeight` (TauCeti/NumberTheory/Height/Arakelov/Subspace/Basic.lean:292), `TauCeti.height2` and `TauCeti.arakelovMulHeight` (Arakelov/Basic.lean:65, 123). The pins have no Hermitian lattice with Arakelov degree, so the docstring's statability claims hold.
- Cross-roadmap citations: all sections cited from 19 suppliers exist at their heads or on main, checked by a script with false matches inspected. Read in full: Seesaw §§6.1, 6.14, 6.15; RowTower §§5.5, 5.8, 5.8e, 5.12; LocalGain §§4.9f (g), 4.16; ThetaChains §§2.1, 2.5, 2.7, 2.8; Slopes §§2.2, 2.4; FiniteReductive §2.8; IntegralWeyl §3.1; BesselPoincare §5.21; on main, ClassicalGroups §§5.1, 6.1, SchurWeyl Layer 5, SpecialFunctionsTheta Layer 7, AutomorphicFormsOnReductiveGroups §§7.4–7.6.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1991 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives only the `sorry` warning. The elaborated `@pairing_integral_of_localDivision` matches README 7.12 at the same generality; there are no section variables.
- One-tactic probe: `simp`, `aesop` and `simp_all` leave the goal open, so the theorem is not padding.

Overlap check: I read ThetaChainsAndFrobeniusPrimeSums, ThetaChainsOnDefiniteUnitaryGroups, LocalGainOfThetaChains, CongruenceModulesOfThetaLifts and RowTowerAndRallisIdentities (open; no roadmap on main is listed as close). Nothing is shared: the divided source, the glued target and the division inequality are owned here; their slope bounds (ThetaChainsAndFrobeniusPrimeSums §§9.1–9.2), the ledger (LocalGainOfThetaChains §4.9f) and the congruence bounds (CongruenceModulesOfThetaLifts §7.11) are owned there and cited.

Source independence: 7 passages compared with 1 readable source (Bost's 1996 exposé; the README's slope conventions, 8.1, 8.21 (a) route, 8.24 (a) route and attribution, the Layer 8 overview, the 8.22 Check); no shared wording. There are no exact source locators; of 13 mentions of outside sources, Bost has 5, [FormalProof] 3, Chowla–Selberg 2, and Bargmann, Frame–Robinson–Thrall and Zhelobenko/Gelfand–Tsetlin 1 each. Contents compared with Bost1996 (§§1–5, App. A–C): independent. [FormalProof] could not be read.

Research link: Layers 7–8 supply the integrality, the heights and the target slopes of the slope inequality for chains of theta lifts in Alpöge's announced formal proof (2026) of the Riemann hypothesis for Dirichlet L-functions, by Bost's slope method (Bost 1996, Prop. 4.3) with Rallis inner-product eigenvalues. This rests on the README's Conventions and References and on Bost1996.

## Not verifiable

- [FormalProof] (github.com/leanprover-community/riemann-hypothesis): its host is in no licence class of the sources service. None of the sampled targets (7.13, 7.14, 8.1, 8.3, 8.4, 8.5c, 8.8, 8.9, 8.10, 8.19e, 8.20, 8.22, 8.23, 8.24b, 8.24) gives a locator into it, so they were checked against the supplier sections they cite and by computation instead.
- [Announcement] (alpo.ge): host in no licence class; not read.
- Bargmann 1961, Frame–Robinson–Thrall 1954, Chowla–Selberg 1967, Gaudron–Rémond 2014: cited without locators for known ingredients; not fetched.
- Bost 1996: the normalisation `μ̂ = deĝ/([K:ℚ]·rk)` of App. A.2 and the inequality of Prop. 4.3 are display formulas missing from the text layer; the prose matches.

## Source issues

- none

## For the human reviewers

- Scope: every target states "what that proof establishes" for a formal Lean proof of the Riemann hypothesis announced on 20 November 2026 (README, Routes paragraph; References [FormalProof], [Announcement]). It is unrefereed, a day old at this review, and no published literature takes it up yet.
- Licence: [FormalProof] (github.com) and [Announcement] (alpo.ge) are on hosts the sources service does not classify; neither text nor its licence was read.
- Not tested: [FormalProof], the work the targets follow, was not readable, so neither wording nor arrangement was compared with it. The numbers 7.12–8.24b continue a numbering shared with ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties (§§8.5, 8.11–8.19d) and CongruenceModulesOfThetaLifts (§§7.1–7.16a), whose origin was not checked.
