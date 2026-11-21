# Review of ThetaChainsOnDefiniteUnitaryGroups (pull request #2918 at a226a26)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/ThetaChainsOnDefiniteUnitaryGroups/`
**Verdict:** needs changes

**Summary.** Changes are needed, and both findings concern what the Layer 3 statements rest on. R01: the CM theta family of 3.1d is stated for every prime `d ≡ 7 (mod 8)`. By the README's own account, though, [FormalProof] covers only the hosts with `d ≡ 7 (mod 16)`, and the route given here is incomplete. R02: where a route stops, [FormalProof] is cited with no declaration. Every Check and computation I redid holds, and the previous review's R01 and R03 are repaired (R02 partly). There is one small correction and one format note, and the human reviewers decide the scope and licence questions about the formal proof.

## R01 (P2) — The CM theta family of 3.1d is stated for every prime `d ≡ 7 (mod 8)`, but by the README's own account nothing proves it outside the hosts with `d ≡ 7 (mod 16)`

A reader takes 3.1d (o)–(f) as theorems for every host of Layer 2. Layer 3 assumes only "the hypotheses of Layer 2" (line 1392), and 3.1d recalls only `d ≡ 7 (mod 8)` (lines 1605–1606). The introduction of Layer 2 says that [FormalProof] proves the Layer 3 statements only for the hosts of FrobeniusRestrictedRieszSums §0.4 (`q ≡ 3 (mod 8)`, `d ≡ 7 (mod 16)`, `n ≥ 2`). It goes on: "The statements of this roadmap for a general prime `d ≡ 7 (mod 8)` are proved by the routes given with them" (lines 251–254). The route of 3.1d, however, gives none of the following (lines 1656, 1667–1671):
- (o), the consistency on which the definition of `Θ^{CM}_{L,L′}` for non-standard pairs rests;
- (a);
- the bound of (c);
- the eighth-power law for `c_ι` that (f) uses, and through (f) the integrality (d);
- the eigenframe at `d` that (e) uses.

The status line (line 1680) says *NEW* without the generality note that the Conventions promise for wider statements (lines 137–138). A concrete host shows the gap. Take `E_n(1, {3, 47})` with `n ≥ 3`. FrobeniusRestrictedRieszSums §0.4 (after (vi)) gives (i)–(vi) for `d ≡ 7 (mod 8)` from the layer `v₂(48) − 1 = 3` on. So this host satisfies `SplitRamification 47`, `σ_d ≠ c` and `HostSplitting E`: every hypothesis of Layers 2 and 3. But `47 ≡ 15 (mod 16)`, so it is not a host of [FormalProof], and there 3.1d (o)–(f) is asserted with no proof anywhere.

Smallest repair, either of:
- state 3.1d (o), (a), (c)–(f) for the hosts of FrobeniusRestrictedRieszSums §0.4, as line 251 already does for the chain, and give the wider form as a remark of this roadmap with no claim;
- or give the missing routes.

In either case, line 254 would name the statements it excepts.

## R02 (P2) — Where a route stops, [FormalProof] is cited with no module or declaration, so the statements it alone supports have no locator

This matters because these statements have no other source: a reader or implementer cannot find where the formal proof establishes them. The References make [FormalProof] "the reference of every target marked *NEW*" (line 2341), yet no target names a module or declaration of it. A sibling roadmap of the family shows the expected form: RieszSumsOverPrimesAndExceptionalZeros §2.9b (iv)(c′) names `card_primes_norm_one_mod_shortInterval_ge_of_discr_eq_neg_prime`.

The following remain without route or locator:
- in 3.1d: (o), (a), the bound of (c) and the eighth-power law used in (f) (lines 1656, 1667–1671);
- in 3.3 (i): the identification at a single split place of the moved section with the isogeny image (lines 1882–1885). Headline 2 rests on it through (ii) and (iii).
- in 2.1: the bound `rd_E ≤ (Q_S/2)·√(q·d)`, whose route is "not given here" (lines 290–293).

Since the last review, the routes of 2.2a (d) and of the four gaps in 2.6 have been written, and the inputs of 3.2 API (c) are now hypotheses. Repair: name the formal proof's declarations for each of these. Alternatively, give a published theorem with number and page, or complete the route.

## C01 — The classical attributions still carry no theorem or page

The *KNOWN* lines name several classical works, and the References (lines 2343–2345) list them without locators:
- Weil 1955 (2.4, line 831);
- Gross 1999 (3.1, line 1484);
- Kashiwara–Vergne and Howe (3.3 and 3.4, lines 1887 and 1909);
- Shimura and Mumford (3.1a, 3.1c and 3.1d, lines 1540, 1600 and 1680).

The routes stand on supplier sections, so these are credits. A theorem or section number with a page would still let a reader find them.

## N01 — The paragraph "Statements of the formal proof" (line 234) sits under the heading "Table of symbols"; it belongs beside the "Routes" paragraph of the Conventions (line 137).

## Questions for the author

- Does [FormalProof] state the CM theta family for a general prime `d ≡ 7 (mod 8)`, or only for the cyclic hosts? If it states the general case, naming that declaration settles R01 and R02 together. I could not look: the copy held here is a kernel export with no source text.

## Earlier findings

- R01 (headline claims): **repaired**. Line 8 now reads "Up to a nonzero constant it is the class-set theta lift", and line 9 restricts the twisted tuples to residue characteristics below no twist place. `Suggested.lean` lines 39 and 48–49 say the same.
- R02 (open routes without locator): **partly repaired**. The routes of 2.2a (d) (lines 497–499) and of 2.6 (lines 978–990, 1004–1009) are now given, and 3.2 API (c) states its inputs as hypotheses (lines 1803–1806). Still open: 3.1d (o), (a), (c), (f) and 3.3 (i), carried as R02 above.
- R03 (Summary host sentence): **repaired**. Line 3 adds "the inertia group at `d` has order `2` and does not contain complex conjugation", and the description repeats it.
- C01 (Kummer step bound): **repaired** (lines 995–998: the relative different divides `k`).
- C02 (citations of FrobeniusRestrictedRieszSums §0.4 (iii)): **repaired**. 2.1 cites API (c) and derives `c(ψ) | o` (lines 346–353).
- C03 (charts): **repaired**. Charts are attributed to SeesawForThetaChains' section on charts (lines 1363, 1747, 1947), and its §6.7 states the levels quoted.
- C04 (CM type in 2.4 (a)): **repaired** (lines 726–728).
- C05 (classical locators): **not repaired**; it is C01 above.
- C06 (ExplicitNumberFields in the generated blocks): **moot**. The class-number bound of 2.6 now uses Mathlib's Minkowski bound, and ExplicitNumberFields is no longer cited.
- N01 (order 2.3b, 2.3c, 2.3a): unchanged. Line 583 now explains the order, so no remark.

## Verified sound

| Statement | Instances | README value | Computed value | Result | Change |
|---|---|---|---|---|---|
| 2.1 lemma, construction | `ε₀ = 1/52`, `x = 32`, first bound of `SizeW` | `A_max = 28/13`; margin `x^{0.30ε}`; `r ≥ 100` at `x = 32` | `2 + 8/52 = 28/13`; `x^{ε/100}m⁵fx^{2ε} ≍ x^{9/2+9.6975ε}`; `32^{4/3} = 101.6` | holds | — |
| 2.1 `c(ψ)`, `S_small`, `SizeDep` | `ψ` even, conductor 32, order 8 | `c(ψ) = o/\|𝔛_n ∩ ⟨ψ⟩\|` divides `o`, equality for `n + 2 ≥ v₂(f_ψ)` | `𝔛_n ∩ ⟨ψ⟩ = ⟨ψ⟩`, `c = 1`, `\|A\| = 2^n` from `n = 3`; matches FRRS §0.4 Check | holds | — |
| 2.2a law (a), Checks (i), (ii) | ranks 1/1; ranks 2/3, `m_S = −20`, `m_T = −21` | `a = b = ½ − w`; `a = b = −9`; descent HC `(9/2, −7/2)` | `(1 − 2w)/2`; `(3 − 21)/2 = (2 − 20)/2 = −9`; `(5, −3) − ½`; `φ(0)` law at `x = 0` | holds | — |
| 2.3b Lemma (f) | top place; window | `λ_0 = a_τ`, `λ_{k−1} = −a⁻_τ`; `η_w ≤ 2ϑ + t + 1` | `u_0 − (k−1)/2 = a_τ`; `u_{k−1} + (k−1)/2 = −a⁻_τ`; `(w₀+ϑ+1) − (w₀−ϑ)` | holds | — |
| 2.6 (a)(iii), (v), `h_E` | `y² = x³ − x + 1`, `x³ + 2x + 3`, `x³ − 35x + 98`; `f = 1` | `(√−3(x₁−x₂)(x₃−x₄))³ = ±Δ`; Minkowski constant `< 1` | `−368 → ±368`, `−4400 → ±4400`, `−1404928 → ±1404928`, all pairings; `(4/π)(2/4) = 0.637` | holds | — |
| 2.6 sizes | `L ≥ 4`, `f ≥ 8`, `r ≥ 62` | `log h* ≤ 51fL`; `log[𝕂:ℚ] ≤ 19fr²L + 198f²L` | `10fL + 2f(20L + 2) ≤ 51fL`; `(f+2)·51fL + fr²(18L+2) + O(fL)` within bound | holds | — |
| 2.7 exceptional sets, disjointness count | `𝔅(3, 11)`, `𝔅(3, 19)` | `{2,5,7,11,19}`, `{2,3,5,19,127}`; excluded `≤ (3N+1)(1 + 2N²(Y^{3/4}+1))` | `10, 120, 1330 = 2·5·7·19`; `18, 360, 6858 = 2·3³·127`; `≤ 10r³Y^{3/4} < Y^{9/10}/2` | holds | — |
| 2.8 rank window; supplier (c′) | general `T` | `1/2 ≤ ď^{all}Γ₀²/D* ≤ e`, `3/8 ≤ ď_uΓ₀²/D* ≤ e` | `(T/T*)^{fk} ∈ (1, e]`, `(1−T^{−k})^f ≥ ½`, factor `≥ ¾`; RieszSums §2.9b(iv)(c′) at `h = 1/V` | holds | — |
| 2.9 Check | type-prime vector, `h = (A B; 0 D)` | `ω(1, h)Φ = χ(A)^{−1}c(det D)^{−1}Φ` | `c(det A det D)^{−1}·χ(A)^{−1}c(det A)·Φ` | holds | — |
| 2.9a Lemma (a), (c) | `k = m = 2` (`r = 3`) | exponent `m(2k+m−1)/2 = 5`; quotients have order `> g^{1/4}` | `g²(g³−1) = g⁵(1−g^{−3})`; `(g−1)/(4m) > g^{1/4} ≥ ℓ^{v_ℓ(g−1)}` | holds | — |
| 2.9c Check | parahoric `(r, n−r)`; chart levels | `ω̄(g,1)Φ^Q = c(det g₄)Φ^Q`; levels `p^{j+1}`, `p^{2m}` | `c(det g)c(det g₁)^{−1} = c(det g₄)`; SeesawForThetaChains §6.7 states both and `(κ−1)z ∈ p^aL` | holds | — |
| 3.1a Check (i) | `E = K`, `ω = (1+√−d)/2` | `Q_A = N(x)`; `Im H_A = ±1`; semicharacter product `−1` | `\|a\|²`; `Im ω̄/(√d/2) = −1`; `((9+d) − 4 − (1+d))/4 = 1` | holds | — |
| 3.1d (o)–(f), generality | `E_n(1, {3, 47})`, `n ≥ 3` | stated for all `d ≡ 7 (mod 8)` | hypotheses of Layers 2–3 hold; outside [FormalProof]'s hosts (line 251); routes not given (1667–1671) | unsupported | R01 |
| 3.3 (iii) scaling; (i) | `\|s_Λ\|²`, `π^{−1}∂_w` | `\|s_Λ\|² = area/π`; `π^{−1}∂_w = π^{−1/2}\|s_Λ\|∂_z` | `\|δ_K\|²√d/(2π) = (\|δ_K\|²√d/2)/π`; split-place identification "not given here" (1885) | identity holds; route missing | R02 |
| 3.4 weights | Check | `s_div − s♯ = (t+1)/2`; new top entry `−w_j + t/2` | `(w − N_{j−1}/2) − (w − N_j/2)`; `−w + N_{j−1}/2 + (N_j−1)/2 − N_{j−1}` | holds | — |
| 3.5 API (d), (e) | unramified `ξ`; index `ι` | `col_ξ = (m^{(m)})^s col (m^{(0)})^{−s}`; composite times `ι` | `ρ^ξ/ρ¹ = ξ̃^{−s}`, `ρ′^ξ/ρ′¹ = ξ̃^{s}`, middle factors cancel; class sum over `K′` is `ι` times | holds | — |
| 3.7 Check | `q_v = 3`, `N_j = 1` | `Gs_v` acts by `ζ₃ − ζ₃^{−1}`; `Σ\|FF*φ\|² = 6` | `\|ζ₃ − ζ₃^{−1}\| = √3`; `\|χ(−f) − χ(f)\|² = 3` at `f = ±1` | holds | — |
| 3.9 branching | `N = 6`, `λ = (1⁵,0)`, `σ = (1⁵)`; `GL₂ ↓ GL₁` | `c_Br = −120`, `> 64`, `< 7⁵`; `(−1)^{D₀}D₀!` | `∏_{j=0}^{4}(j−5) = −120`; `2⁶ = 64`; `7⁵ = 16807`; `∏_{v=Λ₁}^{σ₀−1}(v − σ₀)` | holds | — |
| 3.10 | `GL₂`, `σ = (2,0)` | `∇`-values pair to `1/2`; bound `−e_𝔭v_p(D_Γ)` | `⟨xy,xy⟩ = 1!1!/2! = 1/2`; `Δ = ℤx²+2ℤxy+ℤy²`; values in `D^{−1}𝒪_𝕃` | holds | — |
| H1 (2.4 (a)) | `x ∈ F^×`; `x = −1`; `E = K` | criterion `(★)`; Checks (i)–(iii) | product formula; `(−1)^f`; `χ_K` nontrivial on `ℤ_d^×`, so ramified at `d` | holds | — |
| 2.4 (b), `η̃` route | `ζ ≠ ±1`, `x = 1 + ζ` | phases multiply to `1` | `1 + e^{iθ} = 2cos(θ/2)e^{iθ/2}`; `Σθ_τ = 0` via `g ∈ Φ` acting as `c` on `ℚ(ζ)` | holds | — |
| H2 (3.3, 3.4) | ThetaLifts §2.5 (a), `m^Φ = −2w_j` | `a_v = −s♯_j`, `b_v = −s_div,j`; nonzero constant | `(N_j − 2w_j)/2`, `(N_{j−1} − 2w_j)/2`; `c_K(j)·∏(√πc_τ/\|s_Λ\|)^{\|ν\|} ≠ 0` | holds; rests on 3.3 (i) | R02 |
| H3 (3.6, 3.10) | `Γ = {±1}`; primes of `D_Γ` | `K_j1 = 1/2`; primes `≤ 2fN_m + 1 < T(u)` | `Σ\|Γ\|^{−1}·1 = 1/2`; `p \| M(n)` iff `p − 1 ≤ n`; `T(u) > b^{16m}` | holds | — |
| H4 (3.8) | `T = 3`, one orbit | rank `1`; slope `−log 2` | `2(3−2)/(3−1) = 1`; squared covolume of `ℤ(1,−1)` is `2`; `μ = 2μ̂ = −log 2` | holds | — |
| Summary host sentence | `E = ℚ(ζ₇)`, `K = ℚ(√−7)` | requires `c ∉ I_d` | `I_7 = Gal(E/ℚ) ∋ c`: excluded, as needed | holds | — |

- Source locators checked: [Announcement] read in full (190 lines). The README has no locator into a readable external text. Supplier sections checked against their texts: FrobeniusRestrictedRieszSums §§0.1, 0.3, 0.4; RieszSumsOverPrimesAndExceptionalZeros §§1.7b (iii), 2.9b (iv)(c′); ThetaLiftsForDefiniteUnitaryGroups §§0.3, 2.5; ThetaKernelsForUnitaryDualPairs §3.46a; IntegralWeylModulesOfGeneralLinearGroups §1.1; FiniteReductiveGroups §2.7 (b); HermitianFormsAndLattices §5.2; GanGrossPrasadUnitaryGroups §4.1; SeesawForThetaChains §6.7; BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a.
- Library declarations opened at the pins: `NumberField.exists_ideal_in_class_of_norm_le` (Mathlib/NumberTheory/NumberField/ClassNumber.lean:78, bound `M K` at :52); `Matrix.unitaryGroup` (Mathlib/LinearAlgebra/UnitaryGroup.lean:105). There is no CM type in Mathlib or Tau Ceti. Mathlib's `minkowskiBound` (Units/DirichletTheorem.lean) is the convex-body bound, not that of FiniteGroupInvariants §10.2.
- Cross-roadmap citations resolved: every cited section at the heads of 13 open roadmaps and on main, including FiniteGroupInvariants §10.2, ShimuraVarieties §5.9, ArithmeticLocallySymmetricSpaces ALS.F.7, ReductiveGroups 10B, AbelianSchemesAndArithmeticModuli A1.3a, A1.5, A4.7a, A5.3, A5.4, AdelicAlgebraicGroups §4.2, MetaplecticAutomorphicForms §3.3 and the three Completed roadmaps.
- Automatic checks: all passed. Dependency check output: `depcheck: 171 roadmaps, 1996 edges, 0 problem(s)`. The only changes outside the folder are to the family index, which is the pull request's own.
- Elaboration: `lake env lean` of `Suggested.lean` exits 0 with no messages. With no declarations there is no `#check` comparison or one-tactic probe to run.
- Numerical work (pure Python): the 2.6 (iii) identity on 6 curves, the 2.7 exceptional sets, and the constants of 3.9 and 3.7.
- Ownership: each of the closest open roadmaps names this roadmap, in its Scope and ownership section, as the owner of the chain data, step operators, chain lift, source lattices and periods.

Overlap check: read RowTowerAndRallisIdentities, ThetaChainsAndFrobeniusPrimeSums, GluedTargetAndDivisionInequality, CongruenceModulesOfThetaLifts, LocalGainOfThetaChains, SeesawForThetaChains (open) and HilbertModularVarietiesAndShimuraCurves (main). Each open one assigns Layers 2–3 objects to this roadmap; SeesawForThetaChains owns the charts and chart data, which this roadmap only points to; nothing shared.

Source independence: 7 passages (the Summary, the introduction of Layer 3, 2.8, 3.5, 3.9, 3.10 and the `Suggested.lean` docstring) compared with 1 source ([Announcement] lines 32–38 and 155–169), none shared beyond standard phrases ("theta lifts", "totally definite unitary groups"). Largest share: [FormalProof], the reference of 21 of 37 *NEW*/*KNOWN* attributions. Its contents are not readable here (kernel export only), so the arrangement was not compared.

Research link: Layers 2–3 build the chain of theta lifts between totally definite unitary groups on which Alpöge's announced formal proof of the Riemann hypothesis for Dirichlet L-functions (2026) rests ([Announcement] lines 32–38, 158–166). Its inputs are the theta correspondence (Howe 1989; Kashiwara–Vergne 1978) and Gross's algebraic modular forms (1999). This rests on the README's References and on [Announcement].

## Not verifiable

- [FormalProof]: held here only as a Lean kernel export with no source text, and the README gives no module or declaration. I did not open the linked repository or the author's archives. No sampled *NEW* target could be checked against it.
- Gross1999, KashiwaraVergne1978: settled as uncertified (paywalled) and cited without locators; not opened.
- Weil 1955, Howe 1989, Mumford, Shimura, Furtwängler, Kneser, Capelli: cited without locators; not opened.

## Source issues

- none

## For the human reviewers

- Scope: the 21 *NEW* targets rest on [FormalProof] alone (README line 2341). It is an unrefereed Lean formalisation by one author, announced 2026-11-20, with no accompanying paper; [Announcement] lines 45–49 and 77–78 say a write-up is to follow.
- Not tested: [FormalProof], the source with the largest share, is readable here only as a kernel export, so wording and arrangement were not compared. The README says its mathematics "follows" it (lines 137, 2341).
- Licence: the licence of [FormalProof] is not established. The README links a GitHub repository (line 2341); [Announcement] line 53 points to archives on the author's site.
