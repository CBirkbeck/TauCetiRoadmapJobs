# Review of CongruenceModulesOfThetaLifts (pull request #2921 at 632cb0a)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/CongruenceModulesOfThetaLifts/`
**Verdict:** accepted

**Summary.** Accepted: a full review of the folder found no statement that is false, unsupported or unowned. The worked Checks recompute to the values stated (7.1, 7.7a, 7.15, 7.16), the fifteen sampled targets agree with the declarations of [FormalProof] and the supplier sections they cite, and the one sentence changed since the previous head (7.4 (4): RowTowerAndRallisIdentities §5.7 gives the highest weight of `𝒲_j`) is true of that section. There are three small corrections and five format notes, none blocking; the scope and licence questions about [FormalProof], and which pull request merges the folder, are left to the human reviewers.

## C01 — ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties consumes only 7.8, not 7.5a, 7.5b and 7.15

Downstream consumers (line 1780) says that roadmap "consumes 7.5a, 7.5b, 7.8 and 7.15 in its Layer 8". At its open head it cites this roadmap in three places, each time §7.8 (the governing field `𝒢_M` of 7.8 (2) and twist selection, used in its 8.19d and in the *Needs:* of the target after it); its supplier contract "From CongruenceModulesOfThetaLifts" has the single entry §7.8. A reader who looks there for the consumers of 7.5a, 7.5b or 7.15 finds none. The sentence would read "consumes 7.8 (2) in its 8.19d".

## C02 — The family index says every roadmap's reference to the formal proof names the first commit; this one does not

The family index carried by this pull request (`TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/README.md`, lines 19–20) says "the reference to the formal proof in each roadmap names that commit". The entry [FormalProof] of this README (line 2044) gives the repository address only. The 126 locators of the README are file paths, and they are unambiguous only at that commit (the repository has changed since). Adding "at its first commit `40e56bab026552e089d7afcfeff08d2defb9c005`, under its directory `src/`" to the entry makes the index true of this roadmap; all 126 paths were checked there and resolve.

## C03 — The description says the family index is carried "with identical content" by every pull request of the family; the copy in #2954 differs

The description's third paragraph reads: "The family index (…) is carried, with identical content, by every pull request of the family". At the head of #2954 (`3b7b695`), which carries the whole family and this folder byte for byte, the index differs from this pull request's in its lines 17–22 (the clause quoted in C02 is absent there, and the sentence on the repository's later changes is worded differently). The description also does not say that #2954 carries this folder. Text that would be right: "The family index (…) is carried by every pull request of the family; #2954 carries the whole family, this folder included, and takes revisions of the folder from here."

## N01 — The route of 7.11 quotes the base-level bound of [FormalProof] without a locator

The route (lines 1464–1468) gives `D_0·C·x^ε·(B₀ + N_c)` as the bound [FormalProof] states, with no file or declaration. It is `Formalism.MainNotions.DIVinN_at` in `Formalism/SharpRestriction/GlobalTheoremInputs.lean`; naming it would let a reader check the form, as 7.10c does for its own.

## N02 — The route of 7.8 (3) (ii) is two lines from what the item already cites

"The route of (3) (ii) is not given here" (line 1084). ThetaChainsOnDefiniteUnitaryGroups §2.6a (d), already in the *Needs:* line, gives it: at `g𝔭` the character `ψ` defines what a power `ψ^a`, `a` prime to `ℓ`, defines at `𝔭`; the `T_s` and the conditions of `𝒞` are unchanged because `g` fixes their data; and (a)–(c) hold for `ψ^a` by 7.8 (2).

## N03 — In 7.8 the symbol `𝔭′` has two meanings

The setting (line 1003) uses `𝔭′` for an element of `{𝔭, c_𝕃(𝔭)}`; (3) (i) (lines 1041–1042) and its route use it for a place of the larger field `𝕃′` above `𝔭`. Another letter in one of the two would remove the doubt in "the lattices `T_s` at `𝔭′`".

## N04 — "Nine terms" counts the terms of 7.7b (i), not the summands of the declaration cited

Line 946 says the inequality at a point, "with its nine terms", is `GlobalLatticeIndexTheorem`. That definition has eight summands: the sums over `Col` and `Row` of 7.7b (i) are one sum there, over `row ∪ col`, of a function defined by cases. "with the nine terms of (i) (the sums over `Col` and `Row` written as one)" would match what a reader finds.

## N05 — The Check of 7.4 is in rank one, where the powers of `N(w)` in the Hecke polynomial are invisible

For `r + t = 1` both `N(w)^{k(k−1)/2}` and `N(w)^{(1−(r+t))/2}` equal `1`, so the Check pins the direction of Frobenius but not the normalisation of the `T_{w,k}`. A rank-two line would: with roots `β_iN(w)^{−1/2}` the formula gives `T_{w,1}(x) = (β₁ + β₂)·N(w)^{−1/2}` and `T_{w,2}(x) = β₁β₂·N(w)^{−2}`, which shows that the `T_{w,k}` of (1) are not the unnormalised double-coset operators of a uniformizer (those have eigenvalues `N(w)^{1/2}(α₁ + α₂)` and `α₁α₂` on the Satake parameters `α_i`).

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| 7.1, definition and Check | `𝕋 = M = {(a,b) : a ≡ b mod ℓ^n}`, `Z_good` the first point | `e_YM = O`, `M ∩ V_Y = ℓ^nO`; README `η = n`; mine `n`; split `M`: `0` | holds |
| 7.1 (2), against LengthBoundsInPadicFamilies §1.7a (4) | `Z′ = Z_good ∩ X_𝔪`, `Z = Z_good ∪ (X_𝔪 ∖ X_s)` | `X ∖ Z = X_s ∖ Z_good = X_s ∖ Z` (as `Z ∩ X_s ⊂ Z_good ⊂ Z`); `cc_Z(π) = c(π)`; `α = 0` on `Z ∖ Z′` | holds |
| 7.1, `etaLoc`, `adm1` of [FormalProof] | — | source: `η ≤ Σ mult·(vcc + v_ℓ(card))` at twisted non-type places; README (2) the same with `v_ℓ(\|G₀\|)` | holds |
| 7.4 (1), Hecke polynomial against `heckePol`, `pt_loc` | rank 1, rank 2 | source: `X^n + Σ(−1)^kN^{k(k−1)/2}T_kX^{n−k}`, roots those of the parameter twisted by `(1−n)/2`; README the same | holds; N05 |
| 7.4 (4), two forms of the weights | `κ_a = −λ_{n+1−a}`, `i = n + 1 − a` | `κ_a + n − a = i − 1 − λ_i`; RowTowerAndRallisIdentities §5.7 states the highest weight `(a⁻ − d_j, …, −d_j, …)` | holds; changed sentence true |
| 7.5 (1), twists | `n = r + t` | cuspidal block: `−(n − r)/2 = −t/2`; character `c`: `(t−1)/2 − (c−1) − (n−1)/2 = −r/2 − (c−1)` | holds |
| 7.5a (a) (i), Gan–Qiu–Takeda Theorem 7.3 (i) | `m = r + 2t`, `n = r + t` | `m′ = 2n − m = r`, `m > m′ > 0`; source: `A_{−1} = κ·B_*(Ik(π_Kφ))`, `κ ≠ 0`, `* = 0` if `r′ = 0`, `−1` otherwise (GanQiuTakeda2014 lines 1693–1700) | supports the route |
| 7.9 (a), Jordan step | pinned `alternatingGroup_le_of_isPreprimitive_of_isCycle_mem` | library: `p` prime, `p + 3 ≤ card`, a `p`-cycle in a primitive group; README `p ∈ (N/2, N − 3]` | holds |
| 7.7a, `v_δ` and Checks | `ℓ=3,t=3,s₀=1`; `ℓ=5,t=4,χ_cyc(g)≡2` | `v_δ = Σ_{0<i<t}(s₀ + v_ℓ(i)) = 2` (source `vdel` the same sum); `1 − 2^{−i}` = `−2, −3, −1` mod 5; `1 − 2^{−2} ≡ 0` mod 3 | holds |
| 7.7a, `E² = δE` | Cayley–Hamilton on the image of `e_B` | `X₀E = α₁E`, so `E² = ∏_{c≥2}(α₁ − α_c)E` | holds |
| 7.7b, cyclotomic level | `ℓ` odd, image of `1 + ℓℤ_ℓ` of order `ℓ^a \| n_w`; `ℓ = 2` | norm group `⊇ 1 + ℓ^{a+1}ℤ_ℓ`: `s_w ≤ a + 1 ≤ 2 + log_ℓ n_w`; `ℓ=2`: `a + 2`; `v(u^{−e} − 1) = s_w + v_ℓ(e)` | holds |
| 7.7c against `CongBound_at` | — | source: `ℓ > ℓ*`, not a type prime, `∉ Exc` ⟹ `vCC ≤ sPi + shaSum + vClass + epsQ`; README four terms | holds |
| 7.8 (1), (H3) and (H5) | weights `q ∉ [−1, t]`, `q ↦ t−1−q`; `o_δ = 15`, `ℓ = 3, 5` | `#(q<−1) + #(q>t) = r`; prime-to-`ℓ` part `n ≥ 3` gives order `n/gcd(n,2) ≥ 2`; ThetaChainsOnDefiniteUnitaryGroups §2.4 (b) states it | holds |
| 7.8a, second half of (TB) | Euler characteristic of `K_O(−e)`, `e ≥ 0` | corank `n_w + [e=0]`; `H¹/H¹_div` of length `s_w + v_ℓ(e+1)`; total `≤ (n_w + 2)c_B` | holds |
| 7.10a rows 2, 4, 5, 6 against `admA`, `MediumInertPrimeLengthBound`, `SmallPrimeLengthBound`, `RamifiedPrimeLengthBound` | term by term | row 2: `2Σlen ≤ Σ(2n_wm+1)e`; row 5: `C f m b log x + C x^C L²`; row 6: `C f(r(b/ℓ+Sc+t+η_s+L)+mb) + C(frt)^CL`; equal | holds |
| 7.10a, `j′`, order, row 4 at two thick letters | `jA`, `ordH`; §4.10d (4) with `n = 2`, `H ≤ 2h` | `j′ = max(1, ⌈log_{ℓ−1}ℓ_A⌉)`; order mod `2^{n+2}` up to sign; `3r·e + 8me′ + 3(rS + 2m((2h+1)/(ℓ−1)+1))`, `e ≤ 64h/ℓ² + …` | holds |
| 7.10b, `v_ℓ(\|G₀\|)` and `w_{tr}` | `ℓ = g_i`, `g_{i″} ≤ g_i²` | `f(r(r−1)/2 + r(r+1)) = f(3r²+r)/2 ≤ 2fr²`; `ℓ − 1 > tr` ⟹ `v_ℓ(w_{tr}(E)) = 0`; source `GeneratorPrimeEtaBound` has `gcost ≤ C x^C η_s` | holds |
| 7.10c against `aux₃`; constants | `D_*`, `ℓ*`, `ℓ_A` of ThetaChainsOnDefiniteUnitaryGroups §2.3c | source bracket `C(fmbL² + (log x)²N_c) + ΣV`; `ℓ*·B ≤ C f m b` since `r + t ≤ N_m + t`; `Σ ϱe = log ℓ` | holds |
| 7.11 | `B₀ = fmbx^ε`, `L = x^ε`; UniformWildKernelBounds §7.6 | `fmbL² = x^εB₀`; `V ≤ exp(x^ε) = b ≤ x^εB₀` gives `κ_W = 1`; `t ≤ ⌊x^κ⌋`, `κ = max(1, C_t)`; `q′ ≡ 7 (16)` ⟹ `≡ 7 (8)`; source `DIVinN_at`: `D0·C·x^ε·(B0 + Nc)` | holds |
| 7.15 (b), (c′) and Check | `M = 𝒪²`, `ℓ = 2`, `Z` diagonal | `PM = 𝒪(1,1)/2`, `M ∩ Z = 𝒪(1,1)`, `(PM)^∨ = 𝒪(1,1)`: `eη = 1`, `ℐ = ℐ⁺ = 1`; `v_𝔭(D_jℓ^𝔧) = e_𝔭(𝔧 + v_ℓ(D_j))` as HermitianFormsAndLattices §4.0a (c) needs | holds, bound attained |
| 7.16, statement and Check (ii) | `E = ℚ(i)`, `ℓ = 19` (inert), `λ = (44,0)`, `μ = (25,19)`, `h = 57` | shifted `{45,0}`, `{26,19}` ≡ `{7,0}` mod 19; `κ = 3`; `45 ≢ y`, `y ∈ [−3,3]`; at `τ∘σ_ℓ`: `12 ≢ [54,60]`; `i_W = 0`, `dp = 19`; `x^{19} ≡ x̄` mod 19 gives `ᾱ^{19} = β̄` | counterexample valid; hypothesis needed |
| 7.16, stabilisers; `mwCount`, `KapSum` | `n + 1 < ℓ`, `ℓ` unramified | `Φ_ℓ` irreducible over `E`, degree `ℓ − 1 > n`; source `\|Σkap\| ≤ mw·(t + 2κ)` under `t + 2κ < ℓ`, README the same | holds |
| 7.16a (3) | `\|Φ_th\| ≤ f/2`; source `lJ`, `kmax` | `30·(f/2)mbx^{2ε} + 2mb ≤ 16fmbx^{2ε} = 16x^εB₀`; `ℓ_𝔧 = mbL/(k(m+t)log 3h)`, `k_max = ⌊2b/ℓ*⌋`; `𝔧_j(ℓ) = 0` for `ℓ > h` in both branches | holds |

- Source locators checked against the text: all 126 into [FormalProof] (122 distinct) resolve at its first commit `40e56bab` under `src/` to a file containing the declaration named; statements read for 20 of them and for 5 neighbouring declarations they rest on (the table); Gan–Qiu–Takeda Theorem 7.3 (i) read at GanQiuTakeda2014 lines 1690–1708.
- Library declarations opened at the pin: 2 (`TauCeti/GroupTheory/Perm/Jordan.lean` line 154; `TauCeti/RepresentationTheory/Compact/SchurOrthogonality.lean` line 104). No declaration for congruence modules, algebraic modular forms, crystalline representations, Bloch–Kato classes or Wach lattices exists in the pinned Mathlib or Tau Ceti, as the docstring of `Suggested.lean` says.
- Cross-roadmap citations resolved: none of the README's citations is missing on main or at the open heads; sections opened and compared: RowTowerAndRallisIdentities §5.7, LengthBoundsInPadicFamilies §1.7a, UniformWildKernelBounds §7.6, HermitianFormsAndLattices §4.0a, SelmerLengthBoundsAndLocalLifting §4.10d (4) and the headings of §§3.22–4.10g, ThetaChainsOnDefiniteUnitaryGroups §§2.3c, 2.4 (b), and on main AL.3.3.8, AL.3.7.2, R02.2.3, R02.3.0d, AnalyticNumberTheoryPartI §0.11, ArithmeticStatisticsPartIII §2.1, ArithmeticGaloisRepresentations §5.10, AlgebraicModularFormsAndSerreWeights §5.10, Chebotarev (Completed).
- Dependency check: `depcheck: 133 roadmaps, 1488 edges, 0 problem(s)`; no UPWARD or CYCLE line. The ten pull requests of the description's task list are open.
- Automatic checks: all passed at this head. Elaboration of `Suggested.lean`: exit 0, no output; it declares nothing, so there is no signature to compare and nothing for the one-tactic probe.
- Headlines: the four of the Summary (7.10c–7.11, 7.8 (2), 7.7b, 7.16) are each named in the module docstring with the carriers they lack; none is statable at the pins.
- Changes outside the folder: only the three files of the family index. The roadmap is not on main; the folder at the head of #2954 is identical to this head.
- Duplication: PotentialAutomorphyInfrastructurePartII §§3.6, 3.7 own the Galois representations of definite unitary groups in a narrower setting; 7.4 cites them and says how it differs.

Overlap check: read GluedTargetAndDivisionInequality (scope, layers), SelmerLengthBoundsAndLocalLifting (§§3.22–4.10g), ThetaChainsAndFrobeniusPrimeSums (§§10.0–10.9 headings, its citations of this roadmap), ThetaChainsOnDefiniteUnitaryGroups (§§2.3c–2.9c), RowTowerAndRallisIdentities (§5.7), LengthBoundsInPadicFamilies (§1.7a, scope), PotentialAutomorphyInfrastructurePartII (Layer 3), and ModularityAndLanglandsExtensions and PotentialAutomorphyInfrastructure searched for congruence modules and for forms on definite unitary groups; nothing shared: congruence modules along an idempotent are owned by LengthBoundsInPadicFamilies and cited, the Galois representations by PotentialAutomorphyInfrastructurePartII and BaseChangeAndGaloisRepresentationsForUnitaryGroups and cited, §§7.12–7.14 by GluedTargetAndDivisionInequality.

Source independence: 26 passages compared with 2 sources (25 statements with the declarations of [FormalProof] they cite or rest on, the route of 7.5a (a) (i) with Gan–Qiu–Takeda §7.2), none shared; largest share [FormalProof], 126 of 127 locators; contents compared with [FormalProof] (its directory tree): independent, the sections 7.1–7.16a draw on files of `Formalism/SharpRestriction`, `Formalism/PieriBlockIdeals`, `Formalism/HermitianLattices`, `Formalism/LocalToGlobal` and four subtrees of `Development/` in no common order.

Research link: The targets are the congruence-module, Ribet-type and weight-elimination inputs of the formal proof of the Riemann hypothesis for Dirichlet L-functions (Alpöge, 2026), in the line of Ribet 1976, Hida 1981 and Bellaïche–Chenevier 2009, with Gan–Qiu–Takeda 2014 for 7.5a; README References and the two sources read.

## Not verifiable

- The proofs inside [FormalProof] were not traced: files, declarations and 25 statements were read, not that each proof is complete.
- The published works of the References cited without locators (Ribet, Hida, Labesse, Caraiani, Bloch–Kato and the others) are credits; their texts were not opened.
- The size inequalities quoted from ThetaChainsOnDefiniteUnitaryGroups §§2.1, 2.3b, 2.7 in the routes of 7.10a, 7.10c and 7.16a (3) were read for consistency with `D_*`, `ℓ*`, `ℓ_A`, not rederived from the size predicates.
- The sentence of 7.11 that the term `(log x)²·N_c` "is added only in its last step" of [FormalProof] was not checked.

## Source issues

- none

## For the human reviewers

- **Scope.** 126 of the README's 127 source locators point to [FormalProof], a Lean repository announced on 20 November 2026 (README References); it is not a refereed publication, and the consumers of the headline bounds are roadmaps of the same family.
- **Licence.** The family index states that [FormalProof] belongs to its author and was published without a licence. The README cites file paths and declaration names only and reproduces none of its text.
- **Which pull request merges.** #2954 carries this folder with content identical to this head, and its family index differs from this pull request's in six lines (C03); the description of #2921 does not say which of the two merges.
