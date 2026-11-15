<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13792#issuecomment-6898356532 -->
Review (claude) of 1486445

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §§3.1, 3.3 and 4.1 use `Ad(lieExp X) = exp(ad X)` and the conjugation formula, which their *Needs:* lines and Layer 3's Dependencies omit

   **Location.** `packages/LieGroupsPartII/design/README.md` §3.1, step 1: "`θ(l)⁻¹ l = lieExp(2X) ∈ L`. So `e^{2 ad X}` fixes `𝔰`"; its *Needs:* ends "LieGroups Layer 2 (…), Layer 9 (…)". §3.3, sketch for (c): "unbounded `lieExp(−tH₀)`-conjugates"; *Needs:* "LieGroups Layer 2 (…), Layer 9 (`iwasawaDecomposition`)". §4.1: fixed points of `t ↦ lieExp(tH₀)`; *Needs:* "§§2.4–2.5, 3.3; RealSemisimpleLieGroups §1.2". Layer 3 Dependencies: "LieGroups Layers 0, 2, 9". `design/plan.json` targets 3.1, 3.3 and 4.1 have no `roadmap:LieGroups Layer 1`.

   **Claim.** A target's *Needs:* line lists what its statement and its route need, item by item.

   **Witness.** §§2.2, 2.4, 4.2, 5.1 and 6.2 list "LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`)" for the same step; the round-9 repair added it to §5.1 on exactly this ground. Layer 4's Dependencies list Layer 1, Layer 3's do not.

   **Exact repair.** Append to the *Needs:* lines of §3.1 and §3.3 "LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, `g·lieExp X·g⁻¹ = lieExp(Ad g X)`)", and to §4.1 "LieGroups Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)`)". Write Layer 3's Dependencies as "LieGroups Layers 0, 1, 2, 9". Add `roadmap:LieGroups Layer 1` to plan targets 3.1, 3.3 and 4.1. Tested on the witness: after the change every section that turns `lieExp(2X) ∈ L` into `e^{2 ad X}` or conjugates by `lieExp(tH₀)` names Layer 1; LieGroups is on main, so no edge is upward and the plan graph gains no `target:` edge.

2. **F02** (P3) the plan names a target "6.2b" that does not exist

   **Location.** `packages/LieGroupsPartII/design/plan.json`, target 7.3d, `hypotheses`: "𝔞, H₀, LinearComponentCondition as in 6.2b"; target 7.3g, `statement`: "𝔞, H₀, M, N, P as in 6.2b", and its `hypotheses`, the same words.

   **Claim.** The hypotheses of 7.3d and 7.3g are those of an earlier target.

   **Witness.** The 33 target ids are 1.1 … 6.3, 7.1, 7.1b, 7.1c, 7.2, 7.2b–d, 7.3, 7.3b–d, 7.3f, 7.3g, 8.1; "6.2b" is none of them. The hypotheses meant (`𝔞` maximal abelian in the symmetric part, `H₀` regular, `LinearComponentCondition G 𝔞`) are those of 7.3b, `minimalParabolic_langlands`.

   **Exact repair.** Replace "6.2b" by "7.3b" in the three places. Tested: 7.3b precedes 7.3d and 7.3g in the plan and is already a `target:` prerequisite of both, and its hypothesis list is the one the README's §7.3 states before "Assume now `LinearComponentCondition G 𝔞`".

Two findings, both P3 (no P1, no P2). Each carries a repair, so the verdict asks for changes: a fix round applies R01 and R02, and nothing else in the design needs to change. All three round-8 findings are repaired. No statement was found false, vacuous or over-claimed: the repaired passages, the 15 sampled targets and the six pinned headline statements were recomputed (table below). The dependency gate shows no UPWARD or CYCLE line. Every supplier citation was resolved again at main or at the supplier's open head, and every cited library declaration at the pins. No gap is declared and none is needed. Elaboration: not available (this lane does not elaborate); the design stage has no `Suggested.lean`. Only the two review deliverables were written; `packages/LieGroupsPartII/sources.toml` is unchanged and no request file was written.

## Previous findings, checked individually

Identifiers are those of round 8. None was marked "not actionable in this package".

| Round-8 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), §5.1 uses §§2.2, 2.5, 3.1 without naming them | §5.1 *Needs:*: "for the component-condition clause, §2.2(d) (`V ⊆ 𝔞_L`) and §2.5 (the condition); for the comparison with RealSemisimpleLieGroups §§4.1, 4.3, §3.1 (the datum and the condition on `L_{Π'}`) and §3.5". Layer 5 Dependencies: "Layers 1–3 (Layers 2–3 for the component-condition clause and the comparison only)". Plan 5.1 has `target:2.2`, `target:2.5`, `target:3.1`, `target:3.5`. | Repaired |
| F02 (P3), consumers state uses the named roadmaps do not make | "**Archimedean representation theory.** The minimal parabolic `P = MAN` of §§3.3 and 3.5 … is the subgroup from which principal series are induced"; "**Rank-one geometry.** … the group `P` of §3.3 is the stabilizer of a point of the boundary sphere `K/M`". The orbit-method bullet is gone from the README and from the plan's `consumers` (three entries). | Repaired |
| F03 (P3), §6.1 does not say how it differs from RealSemisimpleLieGroups §4.4 | §6.1: "RealSemisimpleLieGroups §4.4 states the uniqueness of the type of a parabolic subgroup, which with the self-normalization of its §4.2 is the second statement for the Tits system `(P, N_G(𝔞))` … the first and third statements … are not stated there". Contract bullet for §4.4 and the Scope paragraph carry the same clause; an `SL_3(ℝ)` Check was added. | Repaired (in a sharper form than proposed: `g ∈ P_J` does follow there from §4.2, and the text says so) |

The passages the repair added, recomputed: rows "§5.1", "§6.1" and "Consumers" of the table. The sentence on AutomorphicSpectralTheoryPartII was resolved at its open head: its §1.5 begins "For a minimal parabolic P=MAN" and its *Needs:* line names AutomorphicFormsOnReductiveGroups §§2.1–2.4, 2.7; AutomorphicFormsOnReductiveGroups §2.3a defines `M=Z_K(𝔞)`, `A=lieExp 𝔞`, `N=lieExp 𝔫`, `P=MAN`. The repaired patterns elsewhere: the F01 pattern gives R01; for F02, `roadmaps grep --fixed LieGroupsPartII` still finds no citing roadmap and no other sentence asserts a use; for F03, each other kept variant (§§1.2, 2.2, 2.4, 2.6, 3.2, 3.3, 4.2, 5.1, 6.2, 6.3, 7.3) carries its one-clause difference.

## Verified sound

### Coverage

All 776 lines of the README, the 33 plan targets (8 layers, `gaps: []`) and the 8 manifest entries were read. No maintainer notes exist. Pattern search over the README: no process word, pull-request number, date, machine path, HTML anchor, LaTeX delimiter, `lemma`, `set_option`, "optional" or "deferred"; "Lemma" occurs once, in the References locator. No sentence says the roadmap follows a source; the eight layers are named by their mathematics and each ends with Examples and Dependencies. Checks per definition in the README: §1.1 (8), §2.1 (3), §2.5 (6), §3.2 (4), §3.4 (3), §5.1 (7), §6.2 (4), §6.3 (6), §7.1 (6), §7.2 (9), §7.3 (5). Plan graph: 33 targets, no forward and no missing `target:` prerequisite, no `gap:` prerequisite. No route-specific shortcut, algorithm, copied passage, sorry'd data or re-planned roadmap.

### Adversarial table

`θ` is transpose-inverse in matrix examples; `S = ((0,1),(1,0))`, `J = ((0,1),(−1,0))`, `d = diag(1,−1)`, `R_φ = ((c,−s),(s,c))` with `c = cos φ`, `s = sin φ`.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 datum, Checks (sampled) | `SU(2)`, `θ = Ad(diag(i,−i))`; `GL_2`; compact `G` | entry (1,2) of `diag(i,−i)·J·diag(−i,i)` is `i·1·i = −1`, so `J ∈ 𝔭`, `exp(πJ) = −1 ∈ K`: polar map not injective; `tr(J²) = −2 < 0`, `tr(d²) = 2 > 0`; compact `G` with polar map forces `𝔭 = 0`, `K = G` | Holds; negative control fails the base datum |
| §1.1 `dθ` Cartan on `[𝔤,𝔤]` | general | `X ∈ 𝔭 ∩ [𝔤,𝔤]`: `ad X` symmetric, `tr((ad X)²) = 0` iff `X ∈ 𝔷 ∩ [𝔤,𝔤] = 0`; `X ∈ 𝔨`: skew, `tr ≤ 0` | Holds |
| §1.2 conjugacy with equal split centre | `ℝ ⋊ ℤ/2`; `ℝ × S¹`; steps 1–3 | `θ_a` multiplicative: `ε = ε' = 1` gives `0 = a − a`; `g = (a/4, 0)`: `c_gθ₀c_g⁻¹(t,1) = (−t + a/2 + a/2, 1) = θ_a(t,1)`; `θ_c²(t,s) = (t, s − 2ct + 2ct)`; `−1`-eigenspace `y − 2cx = −y`, `y = cx`; maximal compact of `Z(G⁰)⁰` has Lie algebra `𝔷 ∩ 𝔨` (a compact one-parameter group has bounded `𝔭`-coordinate `tX_𝔭`); `k' ↦ k` is a homomorphism `K' → K` bijective on `π₀`, so the cocycle is defined on `K/K⁰` | Holds; converse holds since `Ad(G⁰)` is trivial on `𝔷` |
| §2.2 (sampled) | `GL_2`; scalar `H` | `R_φSR_φᵀ = ((−2sc, c² − s²),(c² − s², 2sc))`; `tr(·d) = −2 sin 2φ`, maximum at `φ = −π/4` with value `d ∈ 𝔞`; `tr S = 0` constant for `H = 1` | Holds; regularity needed |
| §2.3 (sampled) | `SL_2`; `GL_2`; `Σ = ∅` | `1 + 1 + 2 = 4 > 3` for `𝔫` from all of `Σ`; chamber `h₁ ≥ h₂` contains `±1`; `Σ = ∅`: chamber `= 𝔞`, spans | Holds; LieGroups `IwasawaData` fields `Nplus`, `chamber_span`, `chamber_normalizer_cover`, `chamber_split_center` are at `Suggested.lean:567–587` |
| §2.4 (sampled) | normalizer; `O(1,1)` | `e^{2 ad X}` positive symmetric preserving `𝔞` ⇒ its logarithm does, `[X, 𝔞] ⊆ 𝔞 ∩ 𝔨 = 0`, `X ∈ Z_𝔭(𝔞) = 𝔞`; `(|W_G|, |W(Σ)|) = (2, 1)` | Holds |
| §2.5 equivalences | `Σ = ∅`; compact `O(2)`; general | `W_G = W(Σ)` ⇒ `N_K(𝔞) = N_{K⁰}(𝔞)M` ⇒ `K = N_K(𝔞)K⁰ = MK⁰`; conversely `n = mk₀`, `k₀ = m⁻¹n ∈ N_{K⁰}(𝔞)`; `W_G = W(Σ) ⋊ Stab(Σ⁺)`; with `Σ = ∅` the stabilizer is all of `W_G` and `W(Σ) = 1` | Both directions hold |
| §3.1 (sampled) | `𝔰 = 0`, `𝔰 = 𝔞`; component clause | `Ad(g)s = s` iff `dπ(Ad(g)s) = dπ(s)` iff `Ad(π(g))dπ(s) = dπ(s)`; `L = G`, `L = MA`; `k₁⁻¹k₀ ∈ N_{K⁰}(𝔞) ∩ L` acts by an element of `W(Σ)` fixing a generic point of `𝔰`, a product of `s_β`, `β|_𝔰 = 0` | Holds |
| §3.2 (sampled) | `SL_2`; cover | `(−1)·diag(2, ½)·((1, −3/2),(0,1)) = ((−2, 3),(0, −½))`; `π|_N` covers the simply connected `N_H`, so is an isomorphism | Holds |
| §3.3 (sampled) | `GL_2`; `Σ = ∅` under the condition; (f) | `B(𝔤^β, 𝔤^γ) = 0` unless `β + γ = 0`, so `Lie(P)^⊥ = 𝔫`; nilradical of `𝔟` is `ℝ·1 ⊕ ℝE₁₂`, dimension 2 against `dim 𝔫 = 1`; `Σ = ∅`: `𝔨 = 𝔪`, `K⁰ ⊆ M`, `K = MK⁰ = M`, `P = MA = G`; `g = kan ∈ N_G(𝔫)` ⇒ `k` fixes `Σ⁺` ⇒ `k ∈ M` | Holds; (f) needs the condition (`O(1,1)`: `[G:P] = 2`) |
| §3.4 (sampled) | rank one; `ℝ × S¹` | a minimal parabolic containing `A` is `n_wPn_w⁻¹`, determined by `wΣ⁺ ∈ {Σ⁺, −Σ⁺}`: `P` or `θ(P)`; all `θ_c` give `P = G` | Holds |
| §3.5 (sampled) | `GL_2`; `O(1,1)` | `man ∈ G⁰` iff `m ∈ G⁰`; `M ∩ G⁰ = M ∩ K⁰`: `{±1}` of 4; `P ∩ G⁰ = A = G⁰` | Holds; conjugacy clause is restricted to equal split centres, as stated |
| §4.2 (sampled) | general; `SL_3`; `SU(2,1)` | `Lie(N ∩ n_wN̄n_w⁻¹)`: `β = −wγ`, `γ ∈ Σ⁺`, so `w⁻¹β ∈ −Σ⁺`; `PnP = NnP = N_n n (n⁻¹(N ∩ nNn⁻¹)n)P`; `a_tua_{−t} = exp(e^{tβ(H₀)}Y) → 1` as `t → −∞`; `dim P = 0 + 2 + 3 = 5`; `1 + 1 + 3 + 3 = 8` | Holds over `W_G` |
| §5.1 (repair) | `ℝ ⋊ C₂`; `ℝ² ⋊ C₂`; general | invariant `ℓ` on `V` equals `ℓ ∘ pr_F`; `exp(v) ∈ L_der` has polar form `k exp X` with `k = 1`, `v = X ∈ V ∩ [𝔩,𝔩] = 0`; `ℓ(−t) = ℓ(t)` gives `ℓ = 0`, `F = 0`; `(3,1) ↦ (2,2)`, residual `(1,−1)` | Holds; needs now complete |
| §6.1 (sampled, repair) | from statement 1; `SL_3` | `gBg⁻¹ ⊆ gP_Jg⁻¹ ⊆ P_{J'}` ⇒ `g ∈ P_{J'}` ⇒ `P_J ⊆ P_{J'}` ⇒ `J ⊆ J'`; `Σ⁺ ∪ Σ_{{e₁−e₂}}` adds `e₂ − e₁`: `Q_{{α₁}} = {g₃₁ = g₃₂ = 0}`, `Q_{{α₂}} = {g₂₁ = g₃₁ = 0}`; a lower triangular matrix with `g₂₁g₃₂ ≠ 0` is in neither | Holds; `Parabolic/Normalizer.lean:77` and `Classification.lean:146` have only overgroup and normalizer statements |
| §6.2 (sampled) | regular `X`; `Aut(𝔰𝔩_3)` | block `E_μ → E_λ` scaled by `e^{t(μ−λ)}`; `exp(−tX)n_w exp(tX) = n_w exp(t(X − w⁻¹X))`; `g = un_wp ∈ N(X)` ⇒ `wX = X`, `n_w = (ma)⁻¹ ∈ K ∩ MA = M`, `u ∈ N ∩ N̄ = 1`, `ma = 1`; `−w₀(1,0,−1) = (1,0,−1)`, `−w₀(3,1,−4) = (4,−1,−3)` | Holds |
| §6.3 (sampled) | `[𝔤,𝔤] = 0`; compact; `𝔤𝔩_2` | Borel of the zero algebra is `0`: criterion reads `𝔮 ⊇ 𝔷`; compact: `𝔮_ℂ ⊇ 𝔟 + 𝔟̄ = 𝔤_ℂ`; trace-zero upper triangular: dimension 2 against 3 and 4, `1 ∉ 𝔮` | Both directions agree |
| §7.1 (sampled) | closed transpose-stable `G` with `m` components; `{e^tR_t}` | `p = gᵀg = exp(2X)`: `p^m ∈ G⁰ = K⁰exp 𝔭`, unique symmetric logarithm gives `2mX ∈ 𝔭`; without finiteness `{diag(2^k, 2^{−k})}` has `𝔭 = 0`; `(e^tR_t)ᵀ = e^tR_{−t} ∉ G` | Holds; all three fields needed |
| §7.2 (sampled), `dynamicLevi_decomposition` | eigenbasis; non-symmetric `X = ((1,1),(0,0))`; `OᵀSL_2(ℤ)O` | entry `g_ij e^{−t(x_i − x_j)}`: bounded iff `g_ij = 0` for `x_i < x_j`; `gX = Xg = ((2,2),(0,0))`, `θ(g) = ((½,0),(−½,1))`, `S⁻¹XS = diag(1,0)`, `S⁻¹θ(g)S = ((0,1),(−½,3/2))`, entry `e^t`; `OgOᵀ = ((2,3),(1,2))`, `det = 1`; `(OlOᵀ)₁₂ = (√3/4)(a − b) = (√3/4)(2√3) = 3/2 ∉ ℤ` | Holds; symmetry, transpose stability and normalization each needed where stated |
| `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le` | `O(1,1)`; finite `G`; general | `G = P ⊔ dP`, `P ∩ K = {±1}`; finite `G`: all spaces `0`; sum `⊇ 𝔮₀` iff `β(X) ≥ 0` on `Σ⁺`; `β = Σc_αα` sign-coherent, `β(X) = 0` iff support in `Π'`, so equal sums iff equal centralizers | Hold with no component condition |
| `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le`, `exists_titsSystem_linear` | `O(p,q)`; `O(1,1)`; compact `G` | `M = {diag(ε, k', ε)}`, block determinants `(Πε·det k', Πε)`: 4 of 4 for `p > q ≥ 1`, 2 of 4 for `p = q ≥ 1`; `N ⊆ Q(X)` iff `β(X) ≥ 0`; `O(1,1)`: `N/(B ∩ N) = ℤ/2` needs one simple `s`, and `sPs⁻¹ = P`; compact: `B = N = G`, `simple = ∅`, `closure ∅ = ⊤` in the trivial quotient | Hold under the condition; fail on `O(1,1)` as the negative control says |
| §8.1 | `SO(2,1)` | `k = diag(A, ε)`, `det A = ε`, commuting with `E₂₃ + E₃₂`: `A = diag(a, ε)`, `aε = ε`, `a = 1`; `M = {1, diag(1,−1,−1)}` | Holds |
| Consumers (repair) | `SL_2`; `PU(1,1)`; `SO₀(1,1)` | stabilizer of `∞` is `c = 0`; `K/M = U(1)/{±1} = S¹ = S^{2·1−1}`; `n = 1` in `SO₀(n,1)`: `P = G`, hence `n ≥ 2` | Holds |
| Sign conventions | `GL_2` | `[H, E₁₂] = (h₁ − h₂)E₁₂`; `λ(t)gλ(t)⁻¹ = ((a, tb),(t⁻¹c, d))`, `λ(e^{−s}) = exp(−sX_λ)`; RealSemisimpleLieGroups Conventions: "`{g | exp(−tX) g exp(tX), t ≥ 0, is bounded}`" | The three conventions agree |

### Sources and the seeded sample

| Target | Outcome |
| --- | --- |
| 1.1, 2.2, 2.3, 2.4, 3.1, 3.2, 3.3, 3.4, 3.5, 4.2, 6.3, 7.1, 7.2 | Locators are `knapp2002`, `warner1972`, `wallach1988` by chapter and section: settled as uncertified, not readable. The statements were checked mathematically (table). |
| 6.1 | `borel-tits1965` line 1930–1932: Corollaire 5.18, part (ii) at line 1931, scan page 48, printed 101 (manifest: printed = scan + 53). It is the statement for rational points, derived at line 1933–1934 from the abstract theorems; the abstract form is the uncertified `bourbaki-lie4-6` Ch. IV §2. As cited. The OCR of the inclusion between the two index sets is not legible; the README's direction is fixed by statement 1 (table). |
| 6.2 | `borel-tits1965` line 1488–1497: Théorème 4.15, printed pp. 90–91: the two opposite parabolics of an ordering of the roots of a split torus, with its centralizer as common Levi. An analogue, as the README says. |
| Conventions | `brown-rodriguezhertz-wang2022` lines 136–141 (formula (1), span of `Π'`), 142–144 (classification); `brown-fisher-hurtado2022` lines 513–519 (span of `−Π'`). As cited. |
| Consumers | `bradlow-collier-garciaprada-gothen-oliveira2024` lines 71–74. As cited. |

The author flagged no locator as unverified. All eight works the README cites are in the manifest, and every `cited_for` id is a plan target or one of "conventions", "consumers".

### Library declarations opened at the pins

Pins of `lake-manifest.json`: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, equal to the README's baseline. Mathlib: `LinearMap.IsSymmetric.directSum_isInternal_of_pairwise_commute` (`Analysis/InnerProductSpace/JointEigenspace.lean`), `Matrix.exp_transpose`, `Matrix.exp_conj` (`Analysis/Normed/Algebra/MatrixExponential.lean:113, 185`), `unitarySubgroup` (`Algebra/Star/Unitary.lean:273`), `Matrix.orthogonalGroup` (`LinearAlgebra/UnitaryGroup.lean:318`), `Matrix.symplecticGroup` (`LinearAlgebra/SymplecticGroup.lean:102`), `DoubleCoset.doubleCoset`, `DoubleCoset.Quotient` (`GroupTheory/DoubleCoset.lean:37, 79`), `RootPairing.Base` (`LinearAlgebra/RootSystem/Base.lean:68`), `RootPairing.weylGroup` (`LinearAlgebra/RootSystem/WeylGroup.lean:55`), `Module.End.eigenspace` (`LinearAlgebra/Eigenspace/Basic.lean:423`), `connectedComponentIn` (`Topology/Connected/Basic.lean:505`). `Analysis/CStarAlgebra/CStarMatrix.lean:733` reads "we are missing `Bornology (Matrix m n A)`", as the contract says.

Tau Ceti: `map_lieExp` (`Geometry/Lie/Functor.lean:315`, on `ContMDiffMonoidMorphism`, both sides finite-dimensional), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`, `[PreconnectedSpace G]`), `TitsSystem` with fields `subgroupB`, `subgroupN`, `simple`, `closure_simple` (`GroupTheory/TitsSystem/Basic.lean:50–64`), `bruhatCell` (`Bruhat/Basic.lean:100`), `standardParabolic`, `mem_standardParabolic_iff` (`Parabolic/Basic.lean:48, 152`), `normalizer_standardParabolic` (`Parabolic/Normalizer.lean:77`), `standardParabolicOrderIso` (`Parabolic/Classification.lean:146`), `coxeterSystem` (`Coxeter.lean:178`), `stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`), `glTitsSystem` (`…/Diagonal/TitsSystem.lean:195`, on `GL (Fin (n + 1)) k`), `upperTriangularGroup`, `upperUnitriangularGroup`, `posDiagonalSubgroup`, `iwasawaHomeomorph`, `existsUnique_iwasawa`, `unitaryNormalizerPosDiagonalQuotientMulEquivPerm`, `GL2Borel.mem_doubleCoset_weyl_iff`, the KAK, polar and maximal-compact theorems in the files the contract names, `Cocharacter.parabolic`, `Cocharacter.limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`). No conjugation statement for standard parabolics exists under `GroupTheory/TitsSystem/Parabolic/`.

### Suppliers, ownership and overlap

- **LieGroups (main).** `Suggested.lean`: `exists_monoidHom_of_lieHom` (196), `isConj_of_isMaximalTorus` (266), `weylGroup` (286), `FiniteCartanMatrixModel` (459), `CartanInvolution` (484, fields `global_model`, `compact_fixed`, `reductive_compl`, `derived_semisimple` at 490–495), `IsRealReductive` (499), `IwasawaData` (509), `IsIwasawaTriple` (592), `iwasawaDecomposition` (598), `kakDecomposition` (605), `cartan_polar_decomposition` (612). README headings "Layer 0" … "Layer 9" exist; Layer 9 has the adjoint model of a connected semisimple group with finite centre, the central period lattice, the nonreduced restricted root system and `Ad(K)a=p`.
- **RealSemisimpleLieGroups (open, new folder).** Read at its head: Scope, Conventions, "From other roadmaps", §§0.2, 1.2, 1.3, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3, 4.4, the opening of §5.4, and `exists_conj_cartanInvolution`, `dynamicalParabolic`, `nonnegEigenSubmodule`, `exists_titsSystem` in its `Suggested.lean` (lines 84, 228, 235, 214). Each contract bullet matches its section: §2.3 "`W_G = W(Σ)` when `M` meets every connected component"; §3.1 "Package the result as a **minimal parabolic datum**"; §4.1 `nonnegEigenSubmodule X`; §4.2 "`Q_{Π'} = N_G(𝔮_{Π'})`"; §4.3 "`M_{Π'} = ⋂_χ ker |χ|`"; §4.4 type, criterion and `dynamicalParabolic`. Its conventions (`Σ⁺ ∪ Σ_{Π'}`, positive systems by a regular `H₀`, the sign of the dynamical parabolic) agree with this README's. It does not name this roadmap: no cycle.
- **RootSystems (main).** "Exact supplier contracts" is a heading (README line 123).
- **ArithmeticLocallySymmetricSpaces (open).** Headings ALS.F.1, ALS.0.1, ALS.0.2, ALS.0.3 exist, with `LocallySymmetric.realPoints_lieGroup`, its `maximalCompact` clause, `IsCartanInvolution.conj` and `LocallySymmetric.IsCartanInvolution.transposeInverse`.
- **AutomorphicFormsOnReductiveGroups (open).** §2.3a exists, for "a real reductive group in the supplied class (ALS.0.1–ALS.0.3)"; cited for ownership only.
- **Own objects.** `roadmaps grep` finds no other owner of `linearLieAlgebra`, `IsSelfAdjointLinearGroup`, `dynamicParabolic`, `dynamicUnipotent`, `LinearComponentCondition`, "reductive Cartan datum", "self-adjoint linear group" or "conjugate standard parabolic". "Split component" occurs in ArithmeticLocallySymmetricSpaces and EndoscopicTransferAndUnitaryTraceComparison for the algebraic `A_G` of a reductive group over a field, another object than the `A_L` of a Cartan datum in §5.1. Ownership against open pull requests was checked through the `roadmaps` index of 2026-11-15.
- **Overlap list.** No other pull request changes this roadmap, no dropped id, no id defined only by a revision, no second copy (`roadmaps overlaps`: no roadmap of this name on main or in an open pull request).
- **Gaps.** None declared; none needed.

Overlap check: read RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces, ShimuraData, RootSystems, LieGroups, FlagVarieties and ReductiveGroups; shared with RealSemisimpleLieGroups: the parabolic theory of a minimal parabolic datum under the component condition, owner RealSemisimpleLieGroups (imported), the conjugacy of maximal abelian subspaces, owner RealSemisimpleLieGroups §1.3 for the Lie-algebra form and this roadmap §2.2 for the `K⁰` group form, the minimal parabolic `P = MAN`, owner RealSemisimpleLieGroups §3.1 for connected groups with semisimple Lie algebra and finite centre and this roadmap Layer 3 for every reductive Cartan datum, and the uniqueness of the type of a parabolic, owner RealSemisimpleLieGroups §4.4 for its Tits system and this roadmap §6.1 for an arbitrary one; shared with LieGroups: `Ad(K)𝔞 = 𝔭`, the restricted Weyl quotient and chamber coverage, owner LieGroups; shared with AutomorphicFormsOnReductiveGroups: the minimal parabolic of its real-algebraic class, owner AutomorphicFormsOnReductiveGroups §2.3a; nothing shared with ArithmeticLocallySymmetricSpaces, ShimuraData, RootSystems, FlagVarieties or ReductiveGroups.

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line. `roadmaps resolve` on the README lists no cross-roadmap citation and no Lean name as found nowhere.

### Headlines and the Lean file

There is no `Suggested.lean` at the design stage, so no elaboration, no `#check` comparison and no one-tactic probe was run. Headline theorems of the README's Summary: conjugacy of involutions and of Iwasawa triples with equal split centre; the component condition and its equivalents; `P = MAN` with its Langlands decomposition; the Bruhat decomposition over `W_G`; `⁰L`; the regular dynamical description; the complexification criterion with centre. Their pinned forms on subgroups of `GL (Fin n) ℝ` are `dynamicLevi_decomposition`, `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le`, `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le` and `exists_titsSystem_linear`, with `IsSelfAdjointLinearGroup`, `linearLieAlgebra`, `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi` and `LinearComponentCondition` as definitions with real bodies on carriers that exist at the pins. By reading, none of the six closes with one tactic or one library lemma, and each names the roadmap's objects. The backticked names of this roadmap's own in the README are these twelve and agree with the plan. For the package: plan target 6.1 is named `TauCeti.TitsSystem.mem_standardParabolic_of_conj_le`; in `Suggested.lean` it sits under `TauCetiRoadmap.LieGroupsPartII`.

### Copyright, licences and scope

Six passages were put beside their sources: the positive-system and simple-root convention (`brown-rodriguezhertz-wang2022` lines 130–135; the README defines by a regular `H₀` and by sums of two positive roots), the formula for `𝔮_{Π'}` (same source, lines 138–141; a formula), the remark on the span of `−Π'` (`brown-fisher-hurtado2022` lines 513–519), the three statements of §6.1 (`borel-tits1965` lines 1930–1932; another language and form), the sentence on §6.2 (`borel-tits1965` lines 1488–1497) and the consumer bullet on `P_Θ` (`bradlow-collier-garciaprada-gothen-oliveira2024` lines 71–74). No run of words is shared beyond the formula. No table, figure or list is taken over. The prose of the other sections cites the four uncertified books and could not be compared.

Arrangement: `knapp2002` has 20 of the 35 locators. Its contents page was not read. By the README's own locators the layers cite Ch. VII §2 and Ch. VI §2 (Layer 1), Ch. VI §§4, 5 and Ch. VII §§2, 5 (Layer 2), Ch. VII §§2, 7 and Ch. VI §§4, 5 (Layer 3), Ch. VII §4 (Layer 4), Ch. VII §2 (Layer 5), Ch. VII §7 (Layer 6), Ch. VII §§2, 4–5, 7 (Layer 7): not monotone, and no layer corresponds to one section.

Source independence: 6 passages compared with 4 sources, none shared beyond a formula; largest share knapp2002, 20 of 35 locators; contents compared with knapp2002 through the README's section locators only, its text and contents page not having been read: independent as far as that shows.

## Not verifiable

- **knapp2002**, **bourbaki-lie4-6**, **warner1972**, **wallach1988**: settled as uncertified; their sections, pages and hypotheses were not read. Thirteen of the fifteen sampled targets have only these as locators.
- `borel-tits1965` line 1931: the OCR does not show which of the two index sets contains the other; the statement was checked mathematically instead.
- Lean elaboration, the `#check` comparison and the padding probe: not available in this lane, and there is no Lean file.
- RealSemisimpleLieGroups, ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheoryPartII were read at the heads the tools index holds (2026-11-15); a later head may renumber the cited sections.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p. 3 (lines 133–134): the source says a simple root is a positive root that is not a linear combination of other positive roots; it should be not a sum of two positive roots; affects nothing.

## For the human reviewers

- **Not tested.** `knapp2002` carries 20 of 35 locators; neither its text nor its contents page was read, so wording and arrangement were not compared with it directly.
- **Merge order.** RealSemisimpleLieGroups (open, new folder) is a supplier but absent from `merge-order/ORDER.txt`; its §2.3 and §3.1 need AutomorphicFormsOnReductiveGroups §2.3a (line 59). The gate placed this roadmap after line 58 and saw neither edge.
- **Ownership.** The division with RealSemisimpleLieGroups (it owns the parabolic theory under the component condition, this roadmap what lies beyond) is stated only in `design/README.md`, "Scope and ownership"; no maintainer note records it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1486445703fb21a25ee97fc0d4d9a55ffdc8137d", "job": "REV-DESIGN-LieGroupsPartII~9", "model": "fable", "worker": "chris-x55"} -->
