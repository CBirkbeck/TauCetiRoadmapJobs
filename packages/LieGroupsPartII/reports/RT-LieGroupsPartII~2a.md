<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17225#issuecomment-6904383773 -->
Red team round 2 pass a (claude) of 6666358

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §2.3 and §2.4 each list the other under *Needs:*

   - **Location.** `packages/LieGroupsPartII/README.md:277`: "*Needs:* §1.1; §2.2 (step 1 […]); §2.4 (first
     statement: the reflection representatives in `K⁰`, which does not use this section)".
     `README.md:302`: "*Needs:* §§1.1, 2.1–2.2, 2.3 (for `G⁰`)".
   - **Claim.** The sections of Layer 2 can be built in the order printed, each from earlier ones.
   - **Witness.** §2.3 needs the later §2.4, and §2.4 needs §2.3. `design/plan.json` gives target 2.4
     the prerequisite `target:2.3` and target 2.3 none on 2.4, so the README and the plan disagree and
     the section graph has a cycle. One *Needs:* line of §2.4 covers statements with different needs.
   - **Repair.** Move the statement down; no section number, Lean name or plan entry changes.
     1. In §2.2 add, after (d): "(e) For each `β ∈ Σ` and non-zero `X ∈ 𝔤^β` there is `c ∈ ℝ` such that
        `k = lieExp(c(X + dθX)) ∈ K⁰` normalizes `𝔞` and acts on it as the reflection `s_β`." Add proof
        step 5 with the first bullet of §2.4's proof sketch, unchanged, and the sentence "`⁅X, dθX⁆` lies
        in `Z_𝔭(𝔞) = 𝔞` and is a negative multiple of the `B`-dual of `β`". Add "LieGroups Layer 4
        (`exists_monoidHom_of_lieHom`, for (e))" to the §2.2 *Needs:* line, and move the two `SL_2(ℝ)`
        sentences on `c = −π/2` and `c = −π/4` from the §2.4 Checks to the §2.2 Checks.
     2. In §2.4 replace the first bullet by: "The reflections have representatives in `K⁰`, by §2.2 (e);
        the base representatives lie in `N_K(𝔞)`, possibly outside `K⁰`." Delete the last sentence of
        its *Needs:* line ("The first statement needs only …").
     3. In §2.3 replace "(§2.4, first statement)" by "(§2.2 (e))", and in its *Needs:* line replace
        "§2.2 (step 1, …); §2.4 (first statement: …, which does not use this section)" by "§2.2 (step 1,
        the decomposition of `𝔤` into the joint eigenspaces of `ad 𝔞`, and (e), the reflection
        representatives in `K⁰`)".
     4. At `README.md:109` replace "those in `K⁰` of the first statement of §2.4, which does not use
        §2.3" by "those in `K⁰` of §2.2 (e)". At `:27` replace "§2.4 places the reflection
        representatives in `K⁰` and compares" by "§2.2 (e) places the reflection representatives in `K⁰`,
        §2.4 compares".
     Tested on the instance: after the move §2.3 needs §§1.1, 2.2 only and §2.4 needs §§1.1, 2.1–2.3, an
     acyclic order that agrees with `design/plan.json`. On `GL_2(ℝ)`, `H = diag(0, 1)`: (e) with
     `X = E₁₂`, `c = π/2` gives `k = ((0, 1), (−1, 0)) ∈ SO(2)` and `k·diag(0, 1)·k⁻¹ = diag(1, 0)`, in
     the chamber `h₁ ≥ h₂`, as the §2.3 Check says.

2. **F02** (P3) a Check of §6.2 uses "root flow", which the roadmap never defines

   - **Location.** `packages/LieGroupsPartII/README.md:608`: "At `Y = 0` the root flow is `I`; at
     `Y = E₂₁` it is `I + e^t E₂₁`, unbounded. […] The zero-vector exception is necessary for both
     root-flow equivalences."
   - **Claim.** The Check tests named objects of the roadmap.
   - **Witness.** "root flow" and "root-flow equivalences" occur only on this line. The Check also
     announces `β = e₂ − e₁` and then uses `Y = E₁₂`, which lies in `𝔤^{e₁−e₂}`, not in `𝔤^β`.
   - **Repair.** Replace the bullet by: "For `GL_2(ℝ)` and `X = diag(1, 0)`, the conjugates
     `lieExp(−tX)·lieExp(Y)·lieExp(tX)` of Conventions (sign conventions, dynamical description) are
     `I + e^{t}E₂₁`, unbounded, for `Y = E₂₁ ∈ 𝔤^{e₂−e₁}`, where `(e₂ − e₁)(X) = −1`; `I + e^{−t}E₁₂ → I`
     for `Y = E₁₂ ∈ 𝔤^{e₁−e₂}`, where `(e₁ − e₂)(X) = 1`; and constantly `I` for `Y = 0` in either root
     space. So the hypothesis `Y ≠ 0` is needed in both equivalences stated there: `Y = 0 ∈ 𝔤^{e₂−e₁}`
     is bounded and convergent although the root is negative on `X`." Tested: `exp(−tX)(I + E₂₁)exp(tX)`
     has lower-left entry `e^{t}`, and `exp(−tX)(I + E₁₂)exp(tX)` has upper-right entry `e^{−t}`, as in
     the `GL_2` witness of Conventions.

Two P3 findings (S01, S02). No statement of `Suggested.lean` was found false, truncated or padded.
Four of the five round-1 findings are repaired; the fifth was marked not actionable, its reason
holds, and it is not re-raised. S01 is a build-order defect that the round-1 repair introduced.

## Round-1 findings at this head

| Id | State | Witness at `6666358` |
|---|---|---|
| 1a/F01 (§7.3 API bullet without hypotheses) | repaired | `packages/LieGroupsPartII/README.md:718`: "For closed `G` both groups are compact, being closed in the compact `K`. For a self-adjoint linear group `G` with `IsMaximalAbelianSymmetric G 𝔞`, the quotient is `W_G` (§2.4)." The two sibling bullets (`:719`, `:720`) now carry maximality. The three new Checks were recomputed (table below) and hold. |
| 1b/F01 (chamber coverage taken from a field) | repaired, with a new defect | `README.md:274`: "Each reflection `s_β` is `Ad(k)|_𝔞` for some `k = lieExp(c(X + dθX)) ∈ N_{K⁰}(𝔞)` (§2.4, first statement)". The mathematics is sound and no longer uses the field. The repair made §2.3 and §2.4 need each other: S01. |
| 1b/F02 (merge order through RealSemisimpleLieGroups) | not actionable; reason holds | `merge-order/ORDER.txt:62–63` still lists LieGroupsPartII, then AutomorphicFormsOnReductiveGroups. RealSemisimpleLieGroups is not in the file. No README statement depends on the placement. Not re-raised. |
| 1b/F03 (`Int(𝔰_ℂ)` without owner) | repaired | `README.md:328`: "RealSemisimpleLieGroups §§0.2 (`Int(𝔰_ℂ)` for the real Lie algebra underlying `𝔰_ℂ`, the identity component of its automorphism group, with its adjoint `CartanInvolution` datum for the Cartan involution `τ`), 1.2, 2.3". §0.2 at the open head defines exactly this (its second paragraph). |
| 1b/F04 (subspace stabilizer not what the pin proves) | repaired | `README.md:215`: "For a subspace `𝔰 ⊆ 𝔞`, choose `x ∈ 𝔰` off the kernels of the finitely many roots that do not vanish on `𝔰` […] so the two groups are equal." Recomputed on `A₁` (`𝔰 = 𝔞`: both groups `1`) and `A₂` (`𝔰 = ker α₁`: both `{1, s_{α₁}}`); `w⁻¹s_αw = s_{α∘w}` checked on `s₁s₂s₁ = s_{α₁+α₂}`. The hypotheses quoted at `:94` equal those of `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:148` plus `[P.IsRootSystem]` for the orbit theorem. |

## Dependency check

    depcheck: 235 roadmaps, 2231 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. RealSemisimpleLieGroups is not in the merge order, so the check
has no edge through it (1b/F02, settled).

## Adversarial pass

Notation: `Y = ((0,1),(1,0))`, `d = diag(1,−1)`, `J = ((0,1),(−1,0))`, `R_φ` the rotation through
`φ`. "LCC" is `LinearComponentCondition`. `O(1,1)` has `K = {±1, ±d}`, `𝔞 = ℝY`, `M = {±1}`, `N = 1`,
`P = {±exp tY}`. Every Lean declaration lies in `namespace TauCetiRoadmap.LieGroupsPartII`; the
only section variable is `{n : ℕ}` (section `Linear`), and every hypothesis is an explicit binder.

### `Suggested.lean` (26 declarations: 13 definitions, 13 theorems)

| Declaration | Instances | Values computed on each side | Result |
|---|---|---|---|
| `conj_standardParabolic_le_iff` | `S = ∅`; rank one, `J = J' = ∅`, `g ∈ BsB`; `J = ∅`, `J' = S`, `g = 1` | `B = G`, both sides true; left false by the field `exists_conj_not_mem`, right false since `g ∉ B`; both true, and `J' ⊆ J` would be false | true; not a consequence of `normalizer_eq_of_subgroupB_le`, which needs `gPg⁻¹ = P` |
| `IsSelfAdjointLinearGroup` | `GL_n`; `{diag(2^k, 2^{−k})}`; `{((1,t),(0,1))}` | 2 components (1 at `n = 0`); infinitely many, third clause fails; second clause fails | determines its object |
| `linearLieAlgebra` | `G = 1 ≤ GL_2`, `X = 2πJ` | `exp X = 1`, `exp(X/4) = J ∉ G`, so `X` is excluded | determines its object |
| `IsMaximalAbelianSymmetric` | `GL_2` diagonal; `ℝd`; compact `G` | accepted; rejected (`1` symmetric, commutes, not in it); only `𝔞 = 0` | determines its object |
| `IsRegularElement` | `GL_2`: `diag(1,0)`, `1`; `GL_2`, `𝔞 = 0`, `H₀ = 0` | regular; not (`E₁₂` commutes with `1`, not with `diag(1,0)`); regular | determines its object; needs maximal `𝔞` to mean "no root vanishes" |
| `orthogonalCentralizer`, `orthogonalNormalizer` | `SL_2`; `O(1,1)`; rational rotations, `𝔞 = 0` | `R_φ d R_φᵀ = ((cos 2φ, sin 2φ),(sin 2φ, −cos 2φ))`: `M = {±1}`, `N_K = {±1, ±J}`; `M = {±1}`, `N_K = K`; both equal `G`, dense in `SO(2)` since `arccos(3/5)/π` is irrational | determine their objects |
| `dynamicParabolic`, `dynamicUnipotent`, `dynamicLevi` | `GL_2`, `X = diag(1,0)`; `X = J`; `X = 0` | entries `a, e^{−t}b, e^{t}c, d`: upper triangular, unitriangular, diagonal; `G`, `1`, `{aI + bJ}`; `G`, `1`, `G` | sign pinned |
| `minimalParabolic` | `SL_2`, `H₀ = d`; `GL_2`, `𝔞 = 0`, `H₀ = 0` | `((−2,3),(0,−1/2)) = (−1)·diag(2,1/2)·((1,−3/2),(0,1))`; `O(2)`, which misses `2·1` | sign pinned |
| `LinearComponentCondition` | `GL_n`, `n ≥ 1`; `O(1,1)`, `𝔞 = ℝY` and `𝔞 = 0`; `O(p,q)`; `SO(p,q)` | holds (`diag(−1,1,…)`); fails (2 of 4 components) and holds (`M = K`); block determinants `(Πε·det k', Πε)`, four values iff `p ≠ q`; `(Πε, Πε)` with `det k' = 1`, both components | determines its object |
| `nonnegEigenspaces` | `Y = diag(1,0)`; `diag(1,1,−2)` | eigenvalues `1, −1, 0, 0`: upper triangular; `0,0,3,3,−3,−3`: meets `𝔰𝔩₃` in dimension 6 | sign pinned |
| `positiveCharacterKernel` | `GL_1`; `O(1,1)`; swap-extended positive diagonal group | `{±1}`; `χ(exp tY) = χ(d exp(tY) d) = χ(exp(−tY))`, so `G`; `swap·diag(b,a)` has `h = (log(ab)/2)·1`, so `{det = ±1}` | determines its object |
| `dynamicLevi_decomposition` | `GL_2`, `diag(1,0)`; `X = J`; `G = OᵀSL_2(ℤ)O`, `O = R_{π/6}`, `g = ((2+√3, 2),(0, 2−√3))` | `((2,3),(0,5)) = diag(2,5)·((1,3/2),(0,1))`; parabolic `G`, unipotent `1`, excluded by `hX`; `OgOᵀ = ((2,3),(1,2))` and `(O·diag(2+√3, 2−√3)·Oᵀ)₁₂ = cs·2√3 = 3/2`, so the limit leaves `G` and the last clause is rightly conditional | true |
| `minimalParabolic_langlands` | `O(1,1)`; compact `G`; `n = 0` | `G = K·P`, `K ∩ P = {±1} = M`; `𝔞 = 0`, `P = M = K = G`; trivial group | true |
| `exists_conj_minimalParabolic` | `SL_2`, `(ℝd, ±d)`; `O(1,1)`, `(ℝY, ±Y)`; `GL_2`, diagonal versus `ℝ1 ⊕ ℝY` | `k = ((0,−1),(1,0)) ∈ SO(2)`; same `P`, `k = 1`; `R_{−π/4} Y R_{−π/4}ᵀ = d` | true |
| `bruhat_decomposition_linear` | `O(1,1)`; `Aut(𝔰𝔩₃(ℝ))`; `Σ = ∅` | `G = P ⊔ dP`; 12 cells, `M ≅ (ℤ/2)² ⊆ G⁰`; one cell per class of `N_K(𝔞)/M` | true without LCC |
| `doubleCoset_cell_coordinates` | `SL_2`, `k = ((0,−1),(1,0))`, `g = ((a,b),(c,d))`, `c ≠ 0` | `u = ((1,a/c),(0,1))`, `k⁻¹uk = ((1,0),(−a/c,1))`, `u·k·((c,d),(0,1/c)) = ((a,(ad−1)/c),(c,d)) = g` | true |
| `dynamicParabolic_eq_iUnion_doubleCoset` | `O(1,1)`, `H₀ = Y`; `H₀ = 0` with `Σ = ∅` | `exp(−tY) d exp(tY) = exp(−2tY) d` unbounded, union over `{±1}` is `P`; both sides `G` | true |
| `exists_eq_nonnegEigenspaces_of_le` | `GL_2`: `Y = 0`, `1`; `𝔰𝔩₃`: `diag(1,1,−2)`, `diag(2,2,−4)`, `diag(1,0,−1)` | `𝔤`, `𝔤`, same centralizer; same sum, same centralizer; different sum, different centralizer | true |
| `linearComponentCondition_iff` | `O(1,1)`; `GL_2` | LCC false, `d` normalizes `N = 1` with `d ∉ M`, `dPd⁻¹ = P` with `d ∉ P`: all three false; all three true | true |
| `eq_dynamicParabolic_of_le` | `O(1,1)` without `hc`; `ℝ^×` | `0` and `Y` have centralizer `𝔤`, parabolics `G ≠ P`; `P = G` for every `X` | true; `hc` needed |
| `exists_titsSystem_linear` | compact `G`; `O(1,1)` | `B = N = G`, `simple = ∅`, admitted by the pinned structure; `P` normal, excluded by `hc` | true |
| `positiveCharacterKernel_mul_exp` | `GL_n`, `n ≥ 1`; swap group; `O(1,1)` | `g = (|det g|^{−1/n} g)·exp((log|det g|/n)·1)`; `diag(e³, e) = diag(e, e⁻¹)·exp(2·1)`; `F = 0`, `⁰G = G` | true |
| `isSelfAdjointLinearGroup_of_zeroLocus` | `S = ∅`; `SO(1,1)`; `O(1,1)`; `SO(2,1)`; a non-zero constant in `S` | `GL_n`; `Gℂ ≅ ℂ^×` connected, `M = {±1}` meets both real components; `Gℂ = O(2,ℂ)` disconnected, excluded; `M = {1, diag(1,−1,−1)}` from `Ae₂ = εe₂`, `det A = ε`; no subgroup `Gℂ`, vacuous | true |

Elaborated types: the 26 entries of the worker's `signatures.md` were compared with the README
statements. No binder is lost and no type differs from the README. I ran no Lean.

### README targets and Checks changed or added since round 1, and further recomputations

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §1.2, Check `ℝ × S¹` | shear `φ(t,s) = (t, s − ct)` | `φ⁻¹θ₀φ(t,s) = (−t, s − 2ct) = θ_c`; `θ_c² = 1`; `−1`-eigenspace `y = cx` | holds |
| §1.2, Check `ℝ ⋊ ℤ/2` | conjugation by `(s, 0)` | `c_gθ₀c_g⁻¹(t, 1) = (−t + 4s, 1)`, so `s = a/4` | holds |
| §1.2, step 2 | `k' = k·lieExp Y` | `θ'(k) = k·lieExp(2Y)`, `e^{2 ad Y} = 1` with `ad Y` symmetric gives `ad Y = 0` | holds |
| §2.3, coverage | `GL_2`, `H = diag(0,1)`; `γ = wβ ∈ Σ⁺` | `k = exp((π/2)(E₁₂ − E₂₁)) = ((0,1),(−1,0))`, `kHk⁻¹ = diag(1,0)`; `γ(wH) = β(H) ≥ 0` | holds |
| §2.4, first statement | `X ∈ 𝔤^β` | `⁅X + dθX, H⁆ = −β(H)(X − dθX)`, zero on `ker β`; a rotation of `span{H_β, X − dθX}`; `BC₁` included | holds; independent of §2.3 |
| §2.5, axiom (v), step 3 | `U = a + ib ∈ 𝔲` commuting with `𝔱_𝔲` | `⁅a, H⁆ ∈ 𝔭`, `⁅b, H⁆ ∈ 𝔨` both zero, so `a ∈ 𝔪`, `b ∈ 𝔞`; `𝔱 = (𝔱 ∩ 𝔰) ⊕ (𝔷 ∩ 𝔨)` | holds |
| §3.1, component condition for `L` | `k ∈ K ∩ L`, `k = mk₀` | `k₀ ∈ K⁰ ∩ L ⊆ (K ∩ L)⁰·M` by §§2.1, 2.2, 2.4 in `L` | holds |
| §3.2, `Z(G) ⊆ MA` | `z = k·lieExp X` | `θ(z)⁻¹z = lieExp(2X)` central, so `X ∈ 𝔷_𝔭 ⊆ 𝔞` and `k ∈ M` | holds |
| §4.1 | `X = m + a + n ∈ 𝔭` | `2m + n + dθn = 0` in `𝔤₀ ⊕ 𝔫 ⊕ 𝔫̄` | holds |
| §4.2, disjointness | `u ∈ N`, `t → −∞` | `a_t u n P = (a_t u a_{−t})·nP → nP` | holds |
| §5.1 | `ℝ² ⋊ C₂`; `GL_n` | `(3,1) ↦ (2,2)`, residual `(1,−1)`; `h(g) = (log|det g|/n)·1` | holds |
| §6.2 (i), regular case | `g = u n_w p` | `lieExp(−tX) n_w lieExp(tX) = n_w·lieExp(t(X − w⁻¹X))`, bounded iff `wX = X` | holds |
| §7.2, transport without symmetry | `X = ((1,1),(0,0))`, `g = I + X` | `θ(g) = ((1/2,0),(−1/2,1))`, `S⁻¹θ(g)S = ((0,1),(−1/2,3/2))` | holds |
| §7.3 API, three repaired bullets | rational rotations; `GL_2`, `𝔞 = 0`; `O(1,1)`, `𝔞 = 0` | not compact; `P = O(2) ∌ 2·1`; `M = K` meets all four components | negative controls hold |
| §7.4, `ℝ^× × ℝ^×` | `diag(2, 1/2)` | `⁰G = {diag(±1, ±1)}`, exponent `diag(log 2, −log 2) ≠ 0`; rational split component is the positive scalars | holds |
| §8.1, `SO(2,1)` | `k = diag(A, ε)` commuting with `E₂₃ + E₃₂` | `A = diag(1, ε)`, so `M = {1, diag(1,−1,−1)}` | holds |

## Verified sound

- **Declarations read:** 26 of 26. **Targets read:** all sections 1.1–8.1, with every line of the
  README (854 lines) and of `Suggested.lean` (392 lines).
- **Checks tested:** 129 Check bullets read, about 75 recomputed, none false or vacuous. Every
  definition has at least three discriminating Checks.
- **Headlines and padding:** the 13 theorems are the statable headlines (§§6.1, 7.2–7.4, 8.1). None
  follows from one pinned declaration: `conj_standardParabolic_le_iff` was compared with every
  declaration of `TauCeti/GroupTheory/TitsSystem/Parabolic/`, and
  `doubleCoset_cell_coordinates` with `TauCeti.mem_doubleCoset_permutationGL_iff`, which is its
  case `G = GL_n`, `k` a permutation matrix. The module docstring names the abstract forms of Layers
  1–5 and §6.2, and §6.3, as not statable; both reasons hold at the pins.
- **Pinned declarations:** 39 Tau Ceti names resolved with their files; the fields of
  `TauCeti.TitsSystem` (`subgroupB`, `subgroupN`, `simple`, `exists_conj_not_mem`) read at
  `TauCeti/GroupTheory/TitsSystem/Basic.lean`; `map_lieExp` at `Functor.lean:315` and
  `lieMap_injective` at `Faithfulness.lean:50`; `[Field k] [Nontrivial kˣ]` of `glTitsSystem`;
  `unitriangularInversionGroup` is `U ∩ P_w B⁻ P_w⁻¹`, as `README.md:99` says. Mathlib:
  `directSum_isInternal_of_pairwise_commute`, `Matrix.exp_transpose`, `Matrix.exp_conj`,
  `unitarySubgroup`, `Matrix.orthogonalGroup`, `DoubleCoset.doubleCoset`, `DoubleCoset.Quotient`;
  `Matrix` has no `Bornology` instance (`Mathlib/Analysis/CStarAlgebra/CStarMatrix.lean:733`). The
  pins of the README equal those of `lake-manifest.json`.
- **Sibling citations checked:** 31 section citations and 28 declaration names, all found.
  - LieGroups (main): Layers 0–9; 20 names; the fields of `IwasawaData` against the list of §2.3.
  - RealSemisimpleLieGroups (open head): §§0.2, 1.1–1.3, 2.3, 3.1–3.3, 4.1–4.4, 5.4, with
    `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule`.
    Its §1.1 has a route to the root-space decomposition that needs no `IwasawaData`, so §2.3 here
    does not depend on itself through its §1.2.
  - AutomorphicFormsOnReductiveGroups §2.3a (open head); AutomorphicSpectralTheoryPartII §1.5
    (open head; it takes `P = MAN` from AutomorphicFormsOnReductiveGroups §§2.1–2.4, as stated).
  - On main: ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–0.3 with their four names;
    AdelicAlgebraicGroups §2.1; FlagVarieties §§3.1, 3.2, 5.2; ReductiveGroups Layers 7 and 7C;
    RootSystems "Exact supplier contracts", which lists both Tau Ceti declarations.
- **Ownership:** no roadmap on main or at an open head cites LieGroupsPartII, so there is no cycle.
  The 26 Lean names were not searched again at the open heads in this pass (the name search of
  round 1 found none; the search tool rejected my pattern).
- **Locators verified against text:** 5 (listed under Source independence).
- **Policy:** the pull request changes only `packages/LieGroupsPartII/`; no `lemma`, `set_option`,
  `#eval`, pull-request number or process narrative in the README or the Lean file; imports are
  `import Mathlib` and one existing Tau Ceti module; `design/plan.json` has `"gaps": []` and the
  README declares none.

Source independence: 9 passages compared with 4 sources, none shared; largest share knapp2002, 22 of 40 locators; contents compared with knapp2002 by the cited section numbers only (its text could not be read): independent, since Ch. VII §2 feeds Layers 1, 2, 3 and 5 and Ch. VII §7 (Layers 3, 6) is used before Ch. VII §4 (Layer 4).

Passages compared: borel-tits1965 lines 1488–1497 (Théorème 4.15, printed pp. 90–91) with §6.2; lines 1930–1932 (Corollaire 5.18 (ii), printed p. 101) with §6.1 and the
docstring of `conj_standardParabolic_le_iff` (the source indexes by the complementary subset);
brown-rodriguezhertz-wang2022 lines 130–144 with Conventions (two passages);
brown-fisher-hurtado2022 lines 499–521 with Conventions and with the §7.3 route;
bradlow-collier-garciaprada-gothen-oliveira2024 lines 71–76 with Downstream consumers.

## Not verifiable

- knapp2002, warner1972, wallach1988 and bourbaki-lie4-6 are uncertified: their 32 locators were
  not read. Proposition 7.76 and Lemma 7.73 agree with the citations of them at
  brown-rodriguezhertz-wang2022 lines 143–144 and brown-fisher-hurtado2022 line 521.
- RealSemisimpleLieGroups §3.1 lists the conjugacy of all triples among the conclusions it packages
  as a minimal parabolic datum. §3.5 here supplies that clause only for equal split central parts
  (its own Check on `ℝ × S¹`). I found no consumed statement that needs the stronger clause; whether
  the supplier means it as part of the datum is not settled by its text.
- The elaboration of `Suggested.lean` was not rerun; the file is unchanged since the repair report's
  run.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, preprint p. 3: the source says a positive root is simple when it is not a linear combination of other positive roots; it should be when it is not a sum of two positive roots; affects nothing.

## For the human reviewers

- **Not tested.** knapp2002 has the largest share of the locators (22 of 40) and is uncertified in
  `packages/LieGroupsPartII/sources.toml`: wording and arrangement were not checked against its text.
- **Scope.** The statements without the component condition (README §§4.2, 5.1, 6.2 (i), 7.3
  `linearComponentCondition_iff`) cite Knapp and Wallach for the special case; I located no refereed
  source stating the general forms.
- **Scope.** The worker's overlap list scores RealSemisimpleLieGroups (open, another author) at 1.03
  of 2 against this roadmap; `README.md:43` divides ownership at the component condition.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "66663585c710950438646297e8a1267c87f74e89", "job": "RT-LieGroupsPartII~2a", "model": "fable", "worker": "chris-x30"} -->
