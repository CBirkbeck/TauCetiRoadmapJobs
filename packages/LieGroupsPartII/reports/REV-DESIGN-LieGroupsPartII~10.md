<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13792#issuecomment-6899038765 -->
Review (claude) of 1498333

Verdict: accepted

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

No findings (no P1, no P2, no P3). Both round-9 findings are repaired, and the repair's wider edits (eleven further *Needs:* lines, three Dependencies lines, the LieGroups contract bullet, nine plan targets) were recomputed and resolved against LieGroups on main and the Tau Ceti pin. The fifteen sampled targets and the six pinned headline statements were recomputed (table below). The dependency gate shows no UPWARD or CYCLE line. No gap is declared and none is needed. Elaboration: not available (this lane does not elaborate); the design stage has no `Suggested.lean`. Only the two review deliverables were written; `packages/LieGroupsPartII/sources.toml` is unchanged and no request file was written. No maintainer notes exist for this roadmap.

## Previous findings, checked individually

Identifiers are those of round 9. Neither was marked "not actionable in this package".

| Round-9 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P3), §§3.1, 3.3, 4.1 use `Ad(lieExp X) = exp(ad X)` and the conjugation law without naming LieGroups Layer 1 | §3.1 *Needs:*: "LieGroups Layer 1 (`Ad(lieExp X) = exp(ad X)`, for step 1 and for `Lie(L) = Z_𝔤(𝔰)`; `g·lieExp X·g⁻¹ = lieExp(Ad g X)` …)". §3.3: "LieGroups Layer 1 (… for the `lieExp(−tH₀)`-conjugates in (c))". §4.1: "LieGroups Layer 1 (`g·lieExp X·g⁻¹ = lieExp(Ad g X)`: `lieExp(tH₀)` fixes `gP` iff `lieExp(t·Ad(g⁻¹)H₀) ∈ P`)". Layer 3 Dependencies: "LieGroups Layers 0, 1, 2, 3, 9; Tau Ceti `map_lieExp`". Plan 3.1, 3.3, 4.1 carry `roadmap:LieGroups Layer 1`. | Repaired |
| F02 (P3), the plan names a target "6.2b" that does not exist | Plan 7.3g `statement`: "𝔞, H₀, M, N, P as in 7.3b"; 7.3d and 7.3g `hypotheses`: "𝔞 maximal abelian in the symmetric part of linearLieAlgebra G (as in 7.3b)", "H₀ ∈ 𝔞 regular (as in 7.3b)", "LinearComponentCondition G 𝔞". The string "6.2b" no longer occurs. | Repaired |

**The repaired patterns elsewhere.** F01 pattern: every section whose route conjugates by `lieExp`, turns `lieExp(2X) ∈ L` into `e^{2 ad X}`, or uses triviality of `Ad(G⁰)` on `𝔷` now names Layer 1 (§§1.1, 1.2, 2.2, 2.4, 2.5, 3.1, 3.2, 3.3, 3.4, 4.1, 4.2, 5.1, 6.2, 6.3, 7.1); §§2.1, 2.3, 2.6, 3.5, 6.1, 7.2, 7.3, 8.1 do not use either identity directly (their routes go through cited sections, `Matrix.exp_conj` or abstract Tits systems). Each layer's Dependencies line covers the union of its sections' *Needs:* lines (checked layer by layer: Layer 1 {0,1,2,3,9}, Layer 2 {1,4,6,7,9}, Layer 3 {0,1,2,3,9}, Layer 4 {1,2,9}, Layer 5 {1,3,9}, Layer 6 {1,7}, Layer 7 {0,1,2,9}). F02 pattern: a script over the plan finds 33 target ids, no `target:` prerequisite that is missing or forward, no `gap:` prerequisite; every bare `§d.d` of the README outside the RealSemisimpleLieGroups contract bullets names one of its 23 `###` sections.

**The new contract sentence.** "the conjugation law … (native as `TauCeti.Lie.conj_lieExp`), the identity `Ad(lieExp X) = exp(ad X)` (native on the tangent carrier as `TauCeti.Lie.tangentAd_mulInvariantExp_apply`, transported to `𝔤` in Layer 1)": `conj_lieExp` is at `TauCeti/Geometry/Lie/Adjoint/Exponential/Basic.lean:110` and states `g * lieExp X * g⁻¹ = lieExp (Ad g X)`; `tangentAd_mulInvariantExp_apply` is at `TauCeti/Geometry/Lie/Adjoint/Exponential/Formula.lean:164` and states the formula on `GroupLieAlgebra I G`. LieGroups (main), Layer 1, "Conjugation and the exponential (native up to a transport)" says the same and registers the derivation-carrier form as a target. The matrix shadows: LieGroups Layer 1 cites `unitsLieAlgebraEquiv_Ad` (`Ad g X = g X g⁻¹` on `Rˣ`), Layer 0 says "The matrix/unit/circle coincidences are applications of this common derivation-based carrier", and its worked example "`GL_n(ℝ)` and the matrix exponential" states both. §4.1's "for the closed `P`, `lieExp(tY) ∈ P` for all real `t` iff `Y ∈ Lie(P)`" is LieGroups Layer 2, first bullet (native `mem_lieSubalgebraOfSubgroup` for closed `H`).

## Verified sound

### Coverage

All 776 lines of the README, the 33 plan targets (8 layers, `gaps: []`) and the 8 manifest entries were read. Pattern search over the README: no process word, pull-request number, date, machine path, HTML anchor, LaTeX delimiter, `lemma`, `set_option`, "optional" or "deferred" ("Lemma" occurs once, in a References locator). No sentence says the roadmap follows a source; the eight layers are named by their mathematics, each ends with Examples and Dependencies, and every definition has at least three Checks (§1.1: 8, §2.1: 3, §2.5: 6, §3.2: 4, §3.4: 3, §5.1: 7, §6.2: 4, §6.3: 6, §7.1: 6, §7.2: 9, §7.3: 5). No route-specific shortcut, algorithm, copied passage, sorry'd data or re-planned roadmap.

Remark for the package stage (no change to the design): §6.1 is statable at the pins (`TauCeti.TitsSystem`, `standardParabolic` exist), so the package's `Suggested.lean` states it, inside `TauCetiRoadmap.LieGroupsPartII`; the plan's name for it begins with `TauCeti.TitsSystem.`, which is its intended library home, not the namespace of the acceptance file.

### Adversarial table

`θ` is transpose-inverse in matrix examples; `S = ((0,1),(1,0))`, `J = ((0,−1),(1,0))`, `d = diag(1,−1)`. Rows for the repaired passages, the sampled targets and the headlines; values were computed in this round.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 datum and Checks (sampled) | `SU(2)`; `𝔟 ⊂ 𝔤𝔩_2`; trace identity | entry (1,2) of `diag(i,−i)·Y·diag(−i,i)` is `i·1·i = −1`, so `Y ∈ 𝔭`, `exp(πY) = −1 ∈ K`; adjoint of `ad E₁₂|_𝔟`: `E₁₁ ↦ −E₁₂`, `E₂₂ ↦ E₁₂`, so `E₁₂ ↦ E₂₂ − E₁₁`; `tr(Y[Xᵀ,Z]ᵀ) = tr(YZᵀX) − tr(YXZᵀ) = tr([X,Y]Zᵀ)` | Holds; negative control fails the hypothesis and the conclusion |
| §1.1 criterion: abelian ideal of `𝔷^⊥` is zero | general | `[𝔟, 𝔟^⊥] ⊆ 𝔟 ∩ 𝔟^⊥ = 0`, `[𝔟,𝔟] = 0`, `[𝔟,𝔷] = 0` ⇒ `𝔟 ⊆ 𝔷 ∩ 𝔷^⊥ = 0` | Holds |
| §1.2 (sampled) | `ℝ ⋊ ℤ/2`; `ℝ × S¹`; `SL_2` | `θ_a` multiplicative: `(ε,ε') = (1,1)` gives `0 = a − a`; `g = (a/4,0)`: `c_g⁻¹(t,1) = (t − a/2,1)`, `θ₀ ↦ (−t + a/2,1)`, `c_g ↦ (−t + a,1) = θ_a(t,1)`; `θ_c²(t,s) = (t, s − 2ct + 2ct)`; `−1`-eigenspace `y − 2cx = −y`; `c_hθc_h⁻¹ = c_{hhᵀ}θ`, `hhᵀ = diag(4,¼)`; step 2: `τ(k) = k·lieExp(2Y)`, `τ(k₁k₂)` gives `Y(k₁k₂) = Ad(k₂⁻¹)Y(k₁) + Y(k₂)` | Holds; split-centre hypothesis needed (`θ_c ≠ θ_{c'}` on an abelian group) |
| §2.1 (sampled) | `BC₁`; `BC₂`; `A₂`; `Σ = ∅`; `Π' = ∅` | `2λ = λ + λ` not simple, `Π = {λ}`; coroot of `2λ` is `λ^∨/2 ∉ ℕλ^∨` and `λ ∉ ℤ·2λ`, so neither candidate is a `RootPairing.Base` (fields `root_mem_or_neg_mem`, `coroot_mem_or_neg_mem`, `Base.lean:73–76`); `Σ ∩ span(e₂) = {±e₂, ±2e₂}`; stabilizer of `v`, `α₁(v) = 0 < α₂(v)`: `{1, s₁}`; `Σ ∩ {0} = ∅`, `W_∅ = 1` | Holds; subspace form follows from a generic point of the subspace |
| §2.2, §2.4 Checks (repair) | `GL_2`, `SL_2` | `Ad(R_{−π/4})S = diag(1,−1)`; `exp(−(π/2)(E₁₂ − E₂₁)) = ((0,−1),(1,0))`; at `c = −π/4` the image of `diag(1,−1)` is `S ∉ 𝔞` | Holds |
| §2.3 (sampled) | `SL_2`; `GL_2`; compact | `1 + 1 + 2 = 4 > 3` with `𝔫` from all of `Σ`; chamber `h₁ ≥ h₂` contains `±1`; `𝔞 = 0`: chamber `{0}` spans. Fields checked against LieGroups `Suggested.lean` 509–587 (`N_exp`, `iwasawa_compl`, `Nplus_positiveRootGeneration`, `chamber_span`, `chamber_normalizer_cover`, `chamber_split_center`) | Holds; every listed field is a field of the base structure |
| §2.5 (sampled) | `Σ = ∅` compact; `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))`; `O(4)` | `G = MG⁰` ⇒ `K = MK⁰` ⇒ `n = mk₀`, `k₀ ∈ N_{K⁰}(𝔞)`; conversely `K = N_K(𝔞)K⁰ = MK⁰`; `W_G = W(Σ) ⋊ Stab(Σ⁺)`; `O(1,1)`: `Stab = K` (4) `≠ M` (2); `σAd(w₀)`: `H ↦ −(h₃,h₂,h₁)`, `(e₁−e₂) ↦ h₂ − h₃`, `|W_G| = 2·6`; step 3: `𝔱 = (𝔷∩𝔨) ⊕ (𝔱∩𝔰)` | Both directions hold; strictly weaker than (v) |
| §2.6 (sampled) | `SL_2`; `O(1,1)`; `ℝ^×` | `Ad(J)diag(1,−1) = diag(−1,1)`, `J ∈ K⁰` carries `{α}` to `{−α}`; `O(1,1)`: the coset is all of `K` (4 elements), `M` has 2, as "under the component condition" allows; forms `xy`, `2xy`: `g = 1` | Holds |
| §3.1 (sampled, repair) | `GL_3`, `𝔰 = ℝdiag(1,1,−2)`; component clause | kernel of `ad diag(1,1,−2)`: entries `(i,3),(3,i)` scaled by `±3`, dimension `9 − 4 = 5`; `l = mk₀`, `k₁k₀ ∈ N_{K⁰}(𝔞) ∩ L`, `k₂k₁k₀ ∈ M`, so `l ∈ M(K∩L)⁰` | Holds |
| §3.2 (sampled, repair) | `SL_2`; centre | `(−1)·diag(2,½)·((1,−3/2),(0,1)) = ((−2,3),(0,−½))`; `z = k·lieExp X` central ⇒ `lieExp(2X)` central ⇒ `X ∈ 𝔷_𝔭 ⊆ 𝔞`, `Ad(k) = 1` ⇒ `k ∈ M` | Holds |
| §3.3 (repair) | `SL_2`; `GL_2`; `O(1,1)` | `exp(−tH₀)(I + E₂₁)exp(tH₀) = I + e^{2t}E₂₁`; nilradical of `𝔟` has dimension 2 against `dim 𝔫 = 1`; `[G:P] = 2` | Holds; (f) needs the condition |
| §3.4 (sampled, repair) | `SL_2`; `ℝ × S¹` | `JPJ⁻¹` lower triangular `= P(θ, 𝔞, {−α})`; all `θ_c` give `P = G` | Holds |
| §3.5 (sampled) | `GL_2`; `O(1,1)`; `ℝ × S¹` | `M ∩ G⁰ = {±1}` of 4; `P ∩ G⁰ = A = G⁰`; `θ_0, θ_1` not conjugate. RealSemisimpleLieGroups §3.1's datum lists the conjugacy of all triples among its conclusions; the README says which clause it supplies and consumes single-datum statements only | Holds as stated |
| §4.1 (repair) | `SL_2`; general | `X = m + a + n ∈ 𝔭` ⇒ `2m + n + dθn = 0`; `Ad(k⁻¹)H₀ ∈ Lie(P) ∩ 𝔭 = 𝔞` and regularity ⇒ `Ad(k⁻¹)𝔞 = 𝔞`; `J⁻¹diag(e^t,e^{−t})J = diag(e^{−t},e^t) ∈ P` | Holds |
| §4.2 (repair) | `SL_3`; `SU(2,1)`; `O(1,1)` | `β = wγ > 0`, `γ < 0` ⇔ `w⁻¹β < 0`; dimensions `5 + ℓ(w)`: `5,6,6,7,7,8`; `1 + 1 + 3 + 3 = 8`; open cells ⇔ `w⁻¹Σ⁺ = −Σ⁺`, with `Σ⁺ = ∅` both cells | Holds over `W_G` |
| §5.1 (sampled) | `ℝ ⋊ C₂`; `ℝ² ⋊ C₂`; `GL_n`; `n = 0` | `ℓ(−t) = ℓ(t)` ⇒ `F = 0`; `(3,1) ↦ (2,2)`, residual `(1,−1)`; `g = k·exp X`: `log|det g| = tr X`, central part `(tr X/n)·1`; `n = 0`: all spaces `0` | Holds; `lieExp F` central because `F` is `Ad(L)`-fixed |
| §6.1 (sampled) | from statement 1; `S = ∅`; `SL_3` | `gP_Jg⁻¹ ⊆ P_{J'}` ⇒ `gBg⁻¹ ⊆ P_{J'}` ⇒ `g ∈ P_{J'}` ⇒ `P_J ⊆ P_{J'}` ⇒ `J ⊆ J'`; equality: `P_J = g⁻¹P_{J'}g = P_{J'}`; `B = G`: trivial; lower triangular with `g₂₁g₃₂ ≠ 0` lies in neither `{g₃₁ = g₃₂ = 0}` nor `{g₂₁ = g₃₁ = 0}` | Holds |
| §6.2 (i) | regular `X`; `Aut(𝔰𝔩_3)` | `exp(−tX)n_w exp(tX) = n_w exp(t(X − w⁻¹X))`; `−w₀(1,0,−1) = (1,0,−1)`, `−w₀(3,1,−4) = (4,−1,−3)` | Holds |
| §6.3 (sampled, repair) | `[𝔤,𝔤] = 0`; compact; `𝔤𝔩_2`; `Aut(𝔰𝔩_3)` | criterion reduces to `𝔮 ⊇ 𝔷`; `dim(𝔟 + τ𝔟) ≥ 2 dim 𝔟 − rank = dim 𝔤_ℂ`; trace-zero upper triangular: `2 < 3 < 4`, `1 ∉ 𝔮`; `σ{X₃₁ = X₃₂ = 0} = {X₁₃ = X₂₃ = 0} = Ad(w₀){X₂₁ = X₃₁ = 0}` | Both directions agree |
| §7.1 (sampled, repair) | `{diag(2^k,2^{−k})}`; unitriangular group | `linearLieAlgebra = 0`; `E₁₂ᵀ ∉ ℝE₁₂` | All three fields needed |
| §7.2 (sampled), `dynamicLevi_decomposition` | non-symmetric `X = ((1,1),(0,0))`; `OᵀSL_2(ℤ)O` | `gX = Xg = ((2,2),(0,0))`; `θ(g) = ((½,0),(−½,1))`; `S⁻¹θ(g)S = ((0,1),(−½,3/2))`, entry `e^t`; `OgOᵀ = ((2,3),(1,2))`; `(OlOᵀ)₁₂ = 1.5`; `diag(2,5)·((1,3/2),(0,1)) = ((2,3),(0,5)) = ((1,3/5),(0,1))·diag(2,5)` | Holds; symmetry, transpose stability, normalization each needed where stated |
| `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le` | `O(1,1)`; finite `G`; `SL_3` | `G = P ⊔ dP`, `P ∩ K = {±1}`; finite `G`: `𝔞 = 0`, `N = 1`, `P = G`; eigenvalues of `ad diag(1,1,−2)`: `0,0,3,3,−3,−3`, sum of dimension `2 + 2 + 2 = 6` | Hold with no component condition |
| `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le`, `exists_titsSystem_linear` | `O(p,q)`; `O(1,1)`; compact | block determinants `(Πε·det k', Πε)`: 4 values for `p > q ≥ 1`, 2 for `p = q ≥ 1`; `exp(−tY)d·exp(tY) = exp(−2tY)d` unbounded; compact: `B = N = G`, `simple = ∅` | Hold under the condition; fail on `O(1,1)` as the negative control says |
| §8.1 | `SO(2,1)` | `diag(A,ε)`, `det A = ε`, commuting with `E₂₃ + E₃₂` ⇒ `A = diag(a,ε)`, `a = 1`; `M = {1, diag(1,−1,−1)}` | Holds |
| Sign conventions | `GL_2` | `[H,E₁₂] = (h₁ − h₂)E₁₂`; `λ(t)gλ(t)⁻¹ = ((a,tb),(t⁻¹c,d))`; RealSemisimpleLieGroups `dynamicalParabolic` uses `lieExp(−tX)·g·lieExp(tX)`, `t ≥ 0`, compact closure | The three conventions agree |

### Sources and the seeded sample

| Target | Outcome |
| --- | --- |
| 1.1, 1.2, 2.3, 2.5, 2.6, 3.1, 3.2, 3.4, 3.5, 5.1, 6.3, 7.1, 7.2 | Locators are `knapp2002`, `wallach1988` by chapter and section (2.1: `bourbaki-lie4-6`): settled as uncertified, not readable. The statements were checked mathematically (table). |
| 6.1 | `borel-tits1965` line 1930–1932: Corollaire 5.18, part (ii) at line 1931, scan page 48, printed 101. The corollary is derived at lines 1933–1934 from the abstract Tits-system theorems, which are the uncertified `bourbaki-lie4-6` Ch. IV §2. As cited. |
| 6.2 (cited beside 6.1) | `borel-tits1965` line 1488–1497: Théorème 4.15, printed pp. 90–91 (page marker at line 1491–1492). An analogue, as the README says. |
| Conventions | `brown-rodriguezhertz-wang2022` lines 136–141 (formula (1)), 142–144; `brown-fisher-hurtado2022` lines 513–519. As cited. |
| Consumers | `bradlow-collier-garciaprada-gothen-oliveira2024` lines 71–74. As cited. |

The author flagged no locator as unverified. All eight works the README cites are in the manifest; every `cited_for` id is a plan target or one of "conventions", "consumers".

### Library declarations opened at the pins

Pins of `lake-manifest.json` equal the README's baseline. Opened this round: `TauCeti.Lie.conj_lieExp` (`Geometry/Lie/Adjoint/Exponential/Basic.lean:110`), `tangentAd_mulInvariantExp_apply` (`…/Exponential/Formula.lean:164`), `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `lieMap_injective` (`Geometry/Lie/Faithfulness.lean:50`), `TitsSystem` with `subgroupB`, `subgroupN`, `simple`, `closure_simple` (`GroupTheory/TitsSystem/Basic.lean:50–64`), `bruhatCell` (`Bruhat/Basic.lean:100`), `standardParabolic`, `mem_standardParabolic_iff` (`Parabolic/Basic.lean:48, 152`), `normalizer_standardParabolic` (`Parabolic/Normalizer.lean:77`), `standardParabolicOrderIso` (`Parabolic/Classification.lean:146`), `coxeterSystem` (`Coxeter.lean:178`), `stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`), `glTitsSystem` (`…/Diagonal/TitsSystem.lean:195`, on `GL (Fin (n + 1)) k`), `existsUnique_iwasawa` (`…/GeneralLinearGroup/Iwasawa.lean:280`), `unitaryNormalizerPosDiagonalQuotientMulEquivPerm` (`…/RestrictedWeylGroup.lean:230`), `GL2Borel.mem_doubleCoset_weyl_iff` (`…/Bruhat.lean:218`), the KAK, maximal-compact and polar theorems (`…/Cartan.lean:65`, `…/MaximalCompact.lean:158`, `Analysis/Matrix/Polar.lean:76`), `Cocharacter.parabolic`, `Cocharacter.limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`); Mathlib `directSum_isInternal_of_pairwise_commute` (`Analysis/InnerProductSpace/JointEigenspace.lean:137`), `Matrix.exp_transpose`, `Matrix.exp_conj` (`…/MatrixExponential.lean:113, 185`), `RootPairing.Base` (`LinearAlgebra/RootSystem/Base.lean:68`). No conjugation statement for standard parabolics exists under `GroupTheory/TitsSystem/Parabolic/`. The remaining Mathlib names of the contract are unchanged since round 9, whose report lists their files and lines.

### Suppliers, ownership and overlap

- **LieGroups (main).** Headings "Layer 0" … "Layer 9" exist. Layer 1 has the conjugation law and the `Ad(lieExp X) = exp(ad X)` transport target; Layer 2 the `lieSubalgebraOfSubgroup` membership statement; Layer 9 the separately constructed root-generated `N₊`, the restricted Weyl group as the actual normalizer quotient, reflection representatives and chamber coverage, and `Ad(K)a=p`. `Suggested.lean`: `CartanInvolution` (484), `IwasawaData` (509), `IsIwasawaTriple` (592), `iwasawaDecomposition` (598), `kakDecomposition`, `cartan_polar_decomposition`.
- **RealSemisimpleLieGroups (open, new folder).** Read at its head: Conventions, §§0.2, 1.2, 1.3, 2.3, 3.1, 3.2, 3.3, 4.1, 4.2, 4.3, 4.4, the opening of 4.5, §5.4, and `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule` in its `Suggested.lean` (84, 214, 228, 235). Each contract bullet matches: §0.2 "there is `Z ∈ 𝔭_θ` with `θ' = e^{ad Z} θ e^{−ad Z}`" and `Int(𝔤₀)` with its adjoint datum; §1.2 the reductive clause on `[𝔤₀, 𝔤₀]`; §2.3 "`W_G = W(Σ)` when `M` meets every connected component"; §3.1 "Package the result as a **minimal parabolic datum**"; §3.2 `N_G(𝔞) = N_K(𝔞)·A`; §4.1 `nonnegEigenSubmodule X`; §4.2 `Q_{Π'} = N_G(𝔮_{Π'})`; §4.3 `M_{Π'} = ⋂_χ ker |χ|`; §4.4 type, criterion and `dynamicalParabolic`; §5.4 conjugacy of data for semisimple `𝔤₀`. It does not name this roadmap: no cycle.
- **RootSystems (main).** "Exact supplier contracts" is a heading (line 123).
- **ArithmeticLocallySymmetricSpaces (open).** Headings ALS.F.1, ALS.0.1, ALS.0.2, ALS.0.3 exist, with `LocallySymmetric.realPoints_lieGroup`, its `maximalCompact` clause, `IsCartanInvolution.conj` and `LocallySymmetric.IsCartanInvolution.transposeInverse`. The two leads of the worker's citation list are these names: they are that roadmap's planned API, cited as such, not library declarations.
- **AutomorphicFormsOnReductiveGroups (open)** §2.3a, **AutomorphicSpectralTheoryPartII (open)** §1.5 ("For a minimal parabolic P=MAN"), **KleinianGroups** and **FuchsianOrbifoldsPartII** (open) exist; they are cited for ownership or as consumers only. ReductiveGroups (main) has "Layer 7" and "Layer 7C".
- **Own objects.** `roadmaps grep` finds no other owner of "conjugate standard parabolic", `IsSelfAdjointLinearGroup`, "self-adjoint linear group", "reductive Cartan datum", `LinearComponentCondition`, `dynamicParabolic` or `linearLieAlgebra`, and no roadmap cites LieGroupsPartII. Ownership against open pull requests was checked through the `roadmaps` index of 2026-11-15.
- **Overlap list.** No other pull request changes this roadmap, no dropped id, no id defined only by a revision, no second copy.
- **Gaps.** None declared; none needed.

Overlap check: read RealSemisimpleLieGroups, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces, LieGroups, FlagVarieties and ReductiveGroups; shared with RealSemisimpleLieGroups: the parabolic theory of a minimal parabolic datum under the component condition, owner RealSemisimpleLieGroups (imported), the conjugacy of maximal abelian subspaces, owner RealSemisimpleLieGroups §1.3 for the Lie-algebra form and this roadmap §2.2 for the `K⁰` group form, the minimal parabolic `P = MAN`, owner RealSemisimpleLieGroups §3.1 for connected groups with semisimple Lie algebra and finite centre and this roadmap Layer 3 for every reductive Cartan datum, and uniqueness of type, owner RealSemisimpleLieGroups §4.4 for its Tits system and this roadmap §6.1 for an arbitrary one; shared with LieGroups: `Ad(K)𝔞 = 𝔭`, the restricted Weyl quotient and chamber coverage, owner LieGroups; shared with AutomorphicFormsOnReductiveGroups: the minimal parabolic of its real-algebraic class, owner AutomorphicFormsOnReductiveGroups §2.3a; nothing shared with ArithmeticLocallySymmetricSpaces, FlagVarieties (algebraic flag varieties over a field) or ReductiveGroups (split and algebraic Bruhat theory).

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Headlines and the Lean file

There is no `Suggested.lean` at the design stage, so no elaboration, no `#check` comparison and no one-tactic probe was run. Headline theorems of the Summary: conjugacy of involutions and of Iwasawa triples with equal split centre; the component condition and its equivalents; `P = MAN` with its Langlands decomposition; the Bruhat decomposition over `W_G`; `⁰L`; the regular dynamical description; the complexification criterion with centre; the equality of conjugate standard parabolics. The pinned forms the README names are `dynamicLevi_decomposition`, `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le`, `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le` and `exists_titsSystem_linear`, over the definitions `IsSelfAdjointLinearGroup`, `linearLieAlgebra`, `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi`, `LinearComponentCondition`, each with a real body on carriers present at the pins. By reading, none of the six closes with one tactic or one library lemma, and each names the roadmap's objects. The twelve backticked names of this roadmap's own agree with the plan.

### Copyright, licences and scope

Six passages were put beside their sources: the positive-system and simple-root convention (`brown-rodriguezhertz-wang2022` lines 130–135; the README defines by a regular `H₀` and by sums of two positive roots), the formula for `𝔮_{Π'}` (same source, lines 138–141; a formula), the remark on the span of `−Π'` (`brown-fisher-hurtado2022` lines 513–519), the three statements of §6.1 (`borel-tits1965` lines 1930–1932; another language and form), the sentence on §6.2 (`borel-tits1965` lines 1488–1497) and the consumer bullet on `P_Θ` (`bradlow-collier-garciaprada-gothen-oliveira2024` lines 71–74). No run of words is shared beyond the formula. No table, figure or list is taken over. The prose citing the four uncertified books could not be compared.

Arrangement: `knapp2002` has 20 of the 35 locators. Its contents page was not opened. By the README's own locators the layers cite Ch. VII §2 and Ch. VI §2 (Layer 1), Ch. VI §§4, 5 and Ch. VII §§2, 5 (Layer 2), Ch. VII §§2, 7 and Ch. VI §§4, 5 (Layer 3), Ch. VII §4 (Layer 4), Ch. VII §2 (Layer 5), Ch. VII §7 (Layer 6), Ch. VII §§2, 4–5, 7 (Layer 7): not monotone, and no layer corresponds to one section.

Source independence: 6 passages compared with 4 sources, none shared beyond a formula; largest share knapp2002, 20 of 35 locators; contents compared with knapp2002 through the README's section locators only, its text and contents page not having been read: independent as far as that shows.

## Not verifiable

- **knapp2002**, **bourbaki-lie4-6**, **warner1972**, **wallach1988**: settled as uncertified; their sections, pages and hypotheses were not read. Thirteen of the fifteen sampled targets have only these as locators.
- `borel-tits1965` line 1931: the OCR renders the inclusion between the two index sets as damaged glyphs (they read as the primed set inside the unprimed one, which is the README's direction); the statement was checked mathematically instead.
- Lean elaboration, the `#check` comparison and the padding probe: not available in this lane, and there is no Lean file.
- RealSemisimpleLieGroups, ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheoryPartII were read at the heads the tools index holds (2026-11-15); a later head may renumber the cited sections.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p. 3 (lines 133–134): the source says a simple root is a positive root that is not a linear combination of other positive roots; it should be not a sum of two positive roots; affects nothing.

## For the human reviewers

- **Not tested.** `knapp2002` carries 20 of 35 locators; neither its text nor its contents page was read, so wording and arrangement were not compared with it directly.
- **Merge order.** RealSemisimpleLieGroups (open, new folder) is a supplier but absent from `merge-order/ORDER.txt`; its §§2.3 and 3.1 need AutomorphicFormsOnReductiveGroups §2.3a (line 59). The gate placed this roadmap after line 58 and saw neither edge.
- **Ownership.** The division with RealSemisimpleLieGroups (it owns the parabolic theory under the component condition, this roadmap what lies beyond) is stated only in `design/README.md`, "Scope and ownership"; no maintainer note records it.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1498333c2c52987fd515b6ca859add85992c6789", "job": "REV-DESIGN-LieGroupsPartII~10", "model": "fable", "worker": "chris-x26"} -->
