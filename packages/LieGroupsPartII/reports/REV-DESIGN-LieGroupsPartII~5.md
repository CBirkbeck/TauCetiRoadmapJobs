<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13792#issuecomment-6850450606 -->
Review (claude) of 93d4bf7

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) §2.2 imports `K⁰`-conjugacy of maximal abelian subspaces from LieGroups Layer 9, which does not state it

   **Location.** `packages/LieGroupsPartII/design/README.md` §2.2: "Use LieGroups Layer 9's maximal-abelian conjugacy and exhaustion: maximal abelian `𝔞, 𝔞' ⊆ 𝔭` are `Ad(K⁰)`-conjugate and `𝔭 = ⋃_{k ∈ K⁰} Ad(k)𝔞`." The same attribution is in "Scope and ownership" ("Layer 9 owns … conjugacy and exhaustion by maximal abelian subspaces of `𝔭`") and in the LieGroups contract ("maximal-abelian conjugacy and exhaustion are consumed directly"). `design/plan.json` has no target 2.2.

   **Claim.** Both statements, with `K⁰`, are supplied by LieGroups Layer 9, so §2.2 needs no target.

   **Witness.** `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` line 1361 (main `42813dd`): "First prove Ad(K)a=p by the maximal-abelian symmetric-pair argument." That is the only statement on the subject in Layer 9: the group is `K`, not `K⁰`, and no conjugacy of two subspaces is stated. `Suggested.lean` there has no such declaration. RealSemisimpleLieGroups §1.3 (its README line 512) treats the conjugacy as its own target, for semisimple `𝔤₀` under `K_θ ⊆ Int(𝔤₀)`, deriving it from `Ad(K)𝔞 = 𝔭`.

   The `K⁰` form is what the design uses: §2.4 ("any two choices are `K⁰`-conjugate"; proof: "`K = N_K(𝔞)·K⁰`"), §2.5, §3.1 step 2, §3.4 and §4.2 step 1. With the statement Layer 9 actually makes, `K = N_K(𝔞)·K` is all that follows, and the equivalences of §2.4 lose their input. The statement is true and two steps from what is owned, but no layer, supplier section or pinned declaration states it.

   **Exact repair.**

   1. Rewrite §2.2 as a target: "LieGroups Layer 9 proves `Ad(K)𝔞 = 𝔭` for a base Cartan datum. Prove, for every reductive Cartan datum: (a) `𝔭 = ⋃_{k ∈ K⁰} Ad(k)𝔞`, by Layer 9 applied to the restriction of the datum to `G⁰` (§1.1), whose fixed group is `K⁰` and whose `𝔭` is unchanged; (b) maximal abelian `𝔞, 𝔞' ⊆ 𝔭` are `Ad(K⁰)`-conjugate: choose `H' ∈ 𝔞'` off the root hyperplanes of `Σ(𝔤, 𝔞')`, so `Z_𝔭(H') = 𝔞'`, and `k ∈ K⁰` with `Ad(k)H' ∈ 𝔞`; then `𝔞 ⊆ Z_𝔭(Ad(k)H') = Ad(k)𝔞'` and maximality gives equality." Keep the sentence on `𝔷_𝔭 ⊆ 𝔞`. Add one clause: RealSemisimpleLieGroups §1.3 proves the Lie-algebra form for semisimple `𝔤₀`; this is the group form under `K⁰`, with centre.
   2. *Needs:* §1.1 (restriction to `G⁰`); LieGroups Layer 9 (`Ad(K)𝔞 = 𝔭`, the restricted root decomposition for `𝔞'`).
   3. In "Scope and ownership" and in the LieGroups contract replace "conjugacy and exhaustion by maximal abelian subspaces" by "`Ad(K)𝔞 = 𝔭`"; add the `K⁰` form to the "owns" list.
   4. Add plan target 2.2 (theorem, prerequisites `target:1.1`, `roadmap:LieGroups Layer 9`, locator `knapp2002` Ch. VI §5) and `target:2.2` to the prerequisites of 2.3, 2.4, 2.5, 3.1, 6.3 and 7.3b, whose README `*Needs:*` lines already cite §2.2.

   **Repair test.** `GL_2(ℝ)`: `𝔞' = ℝ·1 ⊕ ℝ·S`, `S = ((0,1),(1,0))`; `Z_𝔭(S) = {((a,b),(b,a))} = 𝔞'`; for the rotation `R` through `π/4`, which lies in `SO(2) = K⁰`, `RᵀSR = diag(1, −1) ∈ 𝔞`, and `Z_𝔭(diag(1,−1))` is the diagonal `𝔞`. `O(1,1)`: `K⁰ = 1` and `𝔭 = 𝔞`, so (a) and (b) hold with `k = 1`, and `K = N_K(𝔞)·K⁰` reads `K = K·1`. Compact `G`: `𝔭 = 0`.

2. **F02** (P3) §7.1 API states closure properties of `linearLieAlgebra G` without their hypotheses

   **Location.** `design/README.md` §7.1, API: "`linearLieAlgebra G` contains every `X` with `exp(tX) ∈ G` for all `t`. It is closed under sums, scalars, commutators and transposition."

   **Claim.** These hold for the `G` of the layer header, "a subgroup `G` of `GL (Fin n) ℝ`".

   **Witness.** `G = {((1,t),(0,1))}`: `linearLieAlgebra G = ℝE₁₂`, and `E₁₂ᵀ = E₂₁ ∉ ℝE₁₂`. Plan target 7.1b already says "when G is closed" and "when G is". The first sentence restates the definition.

   **Exact repair.** Replace the bullet by: "For closed `G`, `linearLieAlgebra G` is closed under sums, scalars and commutators and is the Lie algebra of `G` as an embedded Lie subgroup; when `G` is transpose-stable, so is `linearLieAlgebra G`." Delete the restating sentence. Test: for the unitriangular `G` only the first clause applies, and `ℝE₁₂` is a Lie subalgebra.

3. **F03** (P3) §6.3 assumes the component condition, which the criterion does not need

   **Location.** `design/README.md` §6.3: "Let `G` carry a reductive Cartan datum whose Iwasawa triple satisfies the component condition".

   **Claim.** The criterion (parabolic iff `𝔮 ⊇ 𝔷` and `𝔮 ⊗ ℂ ∩ [𝔤,𝔤]_ℂ` contains a Borel subalgebra) is stated only under that condition.

   **Witness.** `Aut(𝔰𝔩_3(ℝ))` (condition fails, §2.4): `Ad(σ)𝔮_{α₁}` is the block lower triangular algebra of type `(2,1)`; it is an `Ad(G)`-conjugate of `𝔮_{α₁}`, `𝔷 = 0`, and its complexification contains the lower triangular Borel. Every `Ad(g)` is an automorphism preserving `𝔷`, `[𝔤,𝔤]` and Borel containment.

   **Exact repair.** State §6.3 for every Iwasawa triple, defining a parabolic subalgebra as an `Ad(G)`-conjugate of some `𝔮_{Π'}` (Conventions). Replace the first proof bullet by: "`Ad(g)` is an automorphism of `𝔤` preserving `𝔷` and `[𝔤,𝔤]`, and it carries a Borel subalgebra of `[𝔤,𝔤]_ℂ` to one; so both sides are `Ad(G)`-invariant and it suffices to treat `Ad(G⁰)`-conjugates." Drop `target:2.4` from plan 6.3 and add the instance as a Check. Test: `O(1,1)` (condition fails): `𝔤 = 𝔷`, the only subalgebra containing `𝔷` is `𝔤 = 𝔮_∅`, and the zero algebra `[𝔤,𝔤]` has Borel `0`; both sides hold for `𝔤` and fail for `0`.

Three findings: one P2 (blocking) and two P3. Both round-4 findings are repaired, and the mathematics of the repaired passages and of the 15 sampled targets checks out. The blocking finding is a supplier citation: §2.2 imports from LieGroups Layer 9 a statement Layer 9 does not make, and the statement has no owner. Only the two review deliverables were written; no design, plan or manifest file was changed.

## Previous findings, checked individually

Identifiers are those of round 4. Neither was marked "not actionable in this package".

| Round-4 finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P2), fifteen sections also planned by RealSemisimpleLieGroups | Scope: "**Stated by RealSemisimpleLieGroups.** Its §0.2 proves conjugacy of the Cartan involutions … each variant kept here says in one clause how it differs." A `From TauCetiRoadmap.RealSemisimpleLieGroups` contract and a plan supplier entry (sections 0.2, 1.2, 2.3, 3.1–3.3, 4.1–4.4) exist. Old §§1.2, 4.3, 5.1–5.3, 6.1, 6.3, 7.2, 9.2 are gone; new §3.5 supplies the minimal parabolic datum. | Repaired |
| F02 (P3), a paper cited for the eigenspace description | Conventions: "*Standard parabolic subalgebras* use `Σ⁺ ∪ Σ_{Π'}` (Brown–Rodriguez Hertz–Wang 2022, equation (1), §1.2)". The paper is no longer a locator of any eigenspace or boundedness statement; manifest `cited_for = ["conventions", "7.3f", "consumers"]`. | Repaired |

Every kept variant was checked for its one-clause difference: §1.2 (centre, form of the conjugating element), §2.3 (no component condition), §2.5 (centre, disconnected, `G⁰`), §§3.2–3.3 (every Iwasawa triple), §4.2 (over `W_G`), §5.1 (components moving the split centre), §6.2 (part (i); derived clauses of (ii)), §6.3 (centre), `exists_titsSystem_linear` (disconnected, reductive). All present.

The repaired patterns were looked for in the rest of the design. The pattern of F01 (a statement attributed to, or duplicated from, another roadmap without checking what that roadmap states) recurs once, against LieGroups: R01. The pattern of F02 (a locator that does not support the sentence) was not found again in the four readable sources.

## Verified sound

### Coverage

I read all 739 lines of the README, the 32 plan targets (no missing id, no prerequisite in a later position, every definition with at least 3 tests) and the 8 manifest entries. No maintainer notes exist. No route-specific shortcut, algorithm, `set_option`, sorry'd data, pull-request number, local path, HTML anchor, LaTeX delimiter or process word was found (pattern search over the whole README). The eight layers are named by their mathematics; each ends with Examples and Dependencies. Every definition has an API and at least three Checks (§2.2 and §6.1, with two Checks each, are theorems).

### Adversarial table

`θ` is transpose-inverse in matrix examples; `Y = ((0,1),(1,0))`, `d = diag(1,−1)`.

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 definition | `GL_2`; `SU(2)` with `Ad(diag(i,−i))`; `ℝ^n ⋊ O(n)` | `tr(diag(1,−1)²) = 2`, `tr(J²) = −2` for `J = ((0,1),(−1,0))`; `dθ(J) = −J` and `exp(πJ) = −1 ∈ K`; radical `ℝ^n` central only for `n ≤ 1` | Signs and non-examples as stated |
| §1.1 restriction to `G⁰` | `O(1,1)`, `ℝ^×` | `exp(tY)` orthogonal iff `sinh t = 0`: `K ∩ G⁰ = 1 = K⁰`, `|K| = 4`; `{±1} ∩ ℝ_{>0} = 1` | Holds |
| §1.2 theorem | `ℝ ⋊ C₂`; `ℝ × S¹`; general cocycle | `c_b θ_0 c_b⁻¹(t,1) = (−t + 4b, 1)`, so `b = a/4`; `θ_c²(t,s) = (t, s − 2ct + 2ct)`; `k·exp(Ad(k⁻¹)Z − Z) = exp(Z) k exp(−Z)` | Holds; `exp X` and `exp Z` commute since `Z ∈ 𝔷` |
| §2.1 | `BC₂`, `Π' = {e₂}`; `A₂`; `Π' = ∅` | `Σ ∩ span(e₂) = {±e₂, ±2e₂}`, `2e₂ = e₂ + e₂`; stabilizer of `v` with `α₁(v) = 0 < α₂(v)` has order 2 of 6; empty system, `W = 1` | Holds |
| §2.2 (R01) | `GL_2`, `O(1,1)` | `RᵀSR = diag(1,−1)` for the rotation through `π/4`; `K⁰ = 1`, `𝔭 = 𝔞` | True; unowned, see R01 |
| §2.3 normalizer | `O(1,1)`; general | `N_G(𝔞) = G = K·A`, `Z_G(𝔞) = ±A`, index 2; `⁅X, 𝔞⁆ ⊆ 𝔞 ∩ 𝔨 = 0` | Holds without the condition |
| §2.4 equivalences | `O(1,1)`, `GL_n` (`n ≥ 1`), `Aut(𝔰𝔩_3)`, `O(4)` | `(|W_G|, |W(Σ)|, condition)` = `(2,1,no)`, `(n!,n!,yes)`, `(12,6,no)`, `(1,1,yes)`; `Σ = ∅`: stabilizer of `∅` is `N_K(𝔞)`, equal to `M` iff `W_G = 1` | Both directions agree |
| §2.5 | `SL_3`; `ℝ^×` with forms `xy`, `2xy` | 6 positive systems, 6 signed permutations; `g = 1` although `1 ≠ 2` | Holds; forms not identified |
| §2.6 fields | `SL_2`; `GL_2`; compact | `𝔫` from all of `Σ`: `1 + 1 + 2 = 4 > 3`; chamber `{h₁ ≥ h₂}` contains `±1`; `𝔞 = 0`, chamber `{0}` | Every base field listed at `Suggested.lean` 509–590 of LieGroups is covered |
| §3.1 | `GL_3`, `𝔰 = ℝ·diag(1,1,−2)`, `0`, `𝔞` | `dim L = 5, 9, 3`; inheritance: `k = m·k₀`, `l k₀ ∈ N_{K⁰}(𝔞)` acts by reflections vanishing on `𝔰` | Holds |
| §3.2 | `SL_2`, `((−2,3),(0,−1/2))` | `(−1)·diag(2,1/2)·((1,−3/2),(0,1))`; `b/a = −3/2` | Order `m a n` as stated |
| §3.3 (e), (f) | `𝔤𝔩_2`; `O(1,1)` | `tr`-orthogonal of upper triangular: `a = d = c = 0`, so `ℝE₁₂` (dim 1), nilradical dim 2; `[G:P] = 2`, `N_G(P) = G` | Holds; condition needed in (f) |
| §3.5 | `GL_2`; `O(1,1)`; `ℝ × S¹` | `P ∩ G⁰` = upper triangular with `det > 0`, `Z_{K⁰}(𝔞) = {±1}`; `P ≠ N_G(𝔫) = G`, on `G⁰`: `P ∩ G⁰ = A = G⁰`; `𝔭_0 ≠ 𝔭_1` | Holds; conjugacy clause correctly limited |
| §4.1 | general; `SL_3`; `O(1,1)` | `X + dθX = 2m + n + dθn = 0` forces `m = n = 0`; 6 fixed flags; 2 fixed points for `|W_G| = 2` | Holds |
| §4.2 | `SL_3`; `SU(2,1)`; `O(1,1)`; step 3 | dims `5 + ℓ(w)`: `5,6,6,7,7,8`; `5 + 2 + 1 = 8`; two open cells, none dense; `a_t u a_{−t} → 1` as `t → −∞` for `u ∈ N` | Holds over `W_G` |
| §5.1 | `GL_n`; `ℝ ⋊ C₂`; `ℝ² ⋊ C₂` | `h = (log|det|/n)·1`, `n ≥ 1`; `ℓ(−t) = ℓ(t)` forces `F = 0`; `(3,1) ↦ (2,2)`, residual `(1,−1)` | Holds |
| §6.1 | third bullet from the first | `gBg⁻¹ ⊆ P_{J'}` gives `g ∈ P_{J'}`, then `P_J ⊆ P_{J'}` | Holds; not in Tau Ceti (see below) |
| §6.2 (i) | `Aut(𝔰𝔩_3)`, `X₀ = diag(1,0,−1)`, `X₁ = diag(3,1,−4)`; `O(1,1)` | `−w₀X₀ = X₀`; `−X₁` has entries `{−3,−1,4}`, not a permutation of `{3,1,−4}`; `Q(Y) = P`, `Q(0) = G` | Holds |
| §6.3 | `𝔤𝔩_2` trace-zero upper; `ℝ·1`; abelian `𝔤` | dims 2 against 3 and 4; no Borel; `[𝔤,𝔤] = 0`, criterion reads `𝔮 = 𝔤` | Holds; see R03 |
| §7.1 | discrete `{diag(2^k,2^{−k})}`; unitriangular | tangent algebras `0`, `ℝE₁₂`; `K = 1` in both | Fields needed; see R02 |
| §7.2 | `GL_2`, `X = diag(1,0)` | `((2,3),(0,5)) = diag(2,5)·((1,3/2),(0,1))`; `u·l` needs `3/5`; constant `det` keeps a bounded family inside `GL` | Holds |
| §7.3 headlines | `SL_3`; `O(p,q)`; `O(1,1)`; `𝔞 = 0` | eigenvalues of `ad diag(1,1,−2)`: `0,0,3,3,−3,−3`, sum of dim `2+2+2 = 6`; components met: 4 of 4 (`p > q ≥ 1`), 2 of 4 (`p = q ≥ 1`); `exp(−tY) d exp(tY) = exp(−2tY) d` unbounded; `H₀ = 0` regular, `𝔮₀ = 𝔤` | All five hold; both "iff" clauses checked in each direction |
| §8.1 | `𝔾_m × SO(2)`; `SO(2,1)` | lattice automorphisms commuting with Galois: `(±1, ±1)`, only `(−1, +1)` compact; `diag(1,−1,−1) ∈ M` in the other component | Holds |

### Sources and the seeded sample

| Target | Outcome |
| --- | --- |
| 1.1, 2.2, 2.4, 2.5, 2.6, 3.1, 3.2, 3.3, 3.5, 4.1, 5.1, 7.1, 7.2, 7.3 | Locators are Knapp, Warner and Wallach by chapter and section: uncertified, not readable. Statements checked mathematically in the table. |
| 2.1 | Bourbaki VI §1: uncertified. Checked on `BC₂`, `A₂`, the empty system. |
| Conventions | `brown-rodriguezhertz-wang2022` lines 136–141 (p. 3): formula (1) with `Σ⁺ ∪ Span(Π′)`; lines 142–144: the classification. `brown-fisher-hurtado2022` lines 515–521 (p. 11): `Span(−Π′)`. Both as cited. |
| 6.1, 6.2 | `borel-tits1965` line 1488 (Théorème 4.15, pp. 90–91) and line 1930 (Corollaire 5.18, p. 101). Both as cited. |
| Consumers | `bradlow-collier-garciaprada-gothen-oliveira2024` line 72 (p. 2) and line 197 (p. 5). As cited. |

No locator was flagged as unverified by the author. No source was fetched and no request file was written.

### Library declarations opened at the pins

Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`, as in `lake-manifest.json`. Opened this round: `TauCeti.TitsSystem.bruhatCell` (`GroupTheory/TitsSystem/Bruhat/Basic.lean:100`), `standardParabolic` and `mem_standardParabolic_iff` (`Parabolic/Basic.lean:48, 152`), `coxeterSystem` (`Coxeter.lean:178`), `normalizer_eq_of_subgroupB_le` (`Parabolic/Normalizer.lean:66`), `standardParabolic_eq_of_subgroupB_le` (`Parabolic/Classification.lean:114`), `stabilizer_eq_closure_wallReflections` (`LinearAlgebra/RootSystem/FundamentalDomain.lean:201`, with `[IsStrictOrderedRing R] [Finite ι] [P.IsCrystallographic] [P.IsReduced] [P.flip.IsReduced]` at line 148), `borelSubalgebra` (`Algebra/Lie/Weights/Borel.lean:439`, base of `IsKilling.rootSystem H`), `map_lieExp` (`Geometry/Lie/Functor.lean:315`), `Cocharacter.parabolic` and `limit` (`Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154, 208`), the matrix declarations of the contract (`Iwasawa.lean:224, 280`, `RestrictedWeylGroup.lean:230`, `Bruhat.lean:218`, `UpperTriangular/Basic.lean:55`), and Mathlib `DoubleCoset.doubleCoset` and `Quotient` (`GroupTheory/DoubleCoset.lean:37, 79`). The remaining names are those of the round-4 list, at unchanged pins.

Duplication by object: the Tits-system folder has the normalizer and overgroup theorems only for a subgroup already containing `B`; nothing there concludes `g ∈ P_J` from `gBg⁻¹ ⊆ P_J`. §6.1 is not a restatement.

### Suppliers, ownership and overlap

- **RealSemisimpleLieGroups (open, head `9a938c5`).** Every cited section was read: §0.2 (line 361), §1.2 (479), §2.3 (641), §3.1 (805), §3.2 (842), §3.3 (867), §4.1 (913), §4.2 (936), §4.3 (959), §4.4 (986), §4.5 (1032), §5.4 (1169). Each contract bullet matches the text. `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic` and `nonnegEigenSubmodule` are declared in its `Suggested.lean` (lines 84, 214, 228, 235); `dynamicalParabolic` uses compact closure of the family over `t ≥ 0` with the sign of the design. Its §3.1 datum lists conjugacy of all triples under `G`; the design says it supplies the datum with conjugacy only for equal split central parts and consumes single-datum statements only, which holds for every use I traced (§§4.2, 6.2, 6.3, 7.3).
- **No cycle.** RealSemisimpleLieGroups does not cite this roadmap. §2.3 here uses its §2.3 only for `G⁰`, through §2.6, which needs Layers 1 and LieGroups only.
- **LieGroups (main).** Layers 0–4, 7, 9 exist (README lines 252–1199). `FiniteCartanMatrixModel`, `CartanInvolution`, `IsRealReductive`, `IwasawaData`, `iwasawaDecomposition`, `kakDecomposition`, `cartan_polar_decomposition` are at `Suggested.lean` 459–612. Layer 9 states the normalizer quotient, the reflection representatives, chamber coverage and `Ad(K)a = p` (lines 1354–1361). The one mismatch is R01.
- **RootSystems (main).** `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` has "Exact supplier contracts" (line 123).
- **ArithmeticLocallySymmetricSpaces (open).** ALS.F.1 (line 580), ALS.0.1 (1167), ALS.0.2 (1246), ALS.0.3 (1287) and the three cited names exist.
- **AutomorphicFormsOnReductiveGroups (open).** §2.3a exists (line 373); cited for ownership only.
- **Consumers.** AutomorphicSpectralTheoryPartII, QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups and FuchsianOrbifoldsPartII are in the merge order; none is cited as a supplier.
- **Gaps.** None declared, and none needed after R01 (the statement becomes a target here).
- **Own objects.** `roadmaps grep` for `IsSelfAdjointLinearGroup`, `linearLieAlgebra`, `dynamicParabolic`, "self-adjoint linear/matrix group" and `LieGroupsPartII`: no match on main or at any open head. FlagVarieties' `conjugate_eq_of_borel_le` is about algebraic groups over an algebraically closed field, not abstract Tits systems.
- **Overlap list.** No other pull request changes this roadmap, no dropped id, no id defined only by a revision.

Overlap check: read RealSemisimpleLieGroups, FlagVarieties, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces and LieGroups; shared with RealSemisimpleLieGroups: the parabolic theory of a minimal parabolic datum with the component condition, owner RealSemisimpleLieGroups (imported), and conjugacy of maximal abelian subspaces, owner RealSemisimpleLieGroups §1.3 for the Lie-algebra form and this roadmap for the `K⁰` group form (R01); shared with LieGroups: `Ad(K)𝔞 = 𝔭`, the restricted Weyl quotient and chamber coverage, owner LieGroups; shared with AutomorphicFormsOnReductiveGroups: the minimal parabolic of its algebraic class, owner AutomorphicFormsOnReductiveGroups; nothing shared with the others. ShimuraData and RootSystemsPartII (last in their lists) were not read this round.

Dependency gate, verbatim:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after ArithmeticLocallySymmetricSpaces (the intake inserts it when its design is accepted)
depcheck: 207 roadmaps, 1900 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The gate does not see the RealSemisimpleLieGroups edge, because that roadmap is not in the merge order (see the last section).

### Headlines and the Lean file

There is no `Suggested.lean` at the design stage. Elaboration: not available (this lane does not elaborate). No Lean command was run and no one-tactic probe was possible.

Headline theorems of the README: conjugacy of involutions and Iwasawa triples with equal split centre; the component condition and its equivalents; `P = MAN` and its Langlands decomposition; the Bruhat decomposition over `W_G`; `⁰L`; the regular dynamical description; the complexification criterion with centre. Their pinned forms are `dynamicLevi_decomposition`, `bruhat_decomposition_linear`, `exists_eq_nonnegEigenspaces_of_le`, `minimalParabolic_langlands`, `eq_dynamicParabolic_of_le` and `exists_titsSystem_linear`, on `Subgroup (GL (Fin n) ℝ)` with four simple definitions and two predicates. All are statable at the pins on native carriers. None is closed by a definition or a single library lemma, by reading: each needs the Layer 3–6 theory. The twelve backticked names of this roadmap's own agree with the plan.

### Copyright, licences and scope

Six passages were put beside their sources: the positive-system and simple-root convention and the formula for `𝔮_{Π'}` (`brown-rodriguezhertz-wang2022` lines 130–141), the `span(−Π')` remark (`brown-fisher-hurtado2022` lines 506–519), the three statements of §6.1 (`borel-tits1965` line 1931), the boundedness sentence of §6.2 (`borel-tits1965` lines 1488–1497) and the consumer bullet on `P_Θ` (`bradlow-collier-garciaprada-gothen-oliveira2024` lines 72–74). The longest shared run is the formula itself; the simple-root definition here ("not sums of two elements") differs from the paper's. No table, figure or list is taken over.

Arrangement: Knapp has 20 of the 36 locators. Its text and contents page could not be read. From the README's own locators, the layers cite Ch. VII §2 and Ch. VI §2 (Layer 1), Ch. VI §§2, 4, 5 and Ch. VII §5 (Layer 2), Ch. VI §§4, 5 and Ch. VII §§2, 7 (Layer 3), Ch. VII §4 (Layer 4), Ch. VII §2 (Layer 5), Ch. VII §7 (Layer 6), Ch. VII §§2, 4–5, 7 (Layer 7): the sequence is not monotone and no layer corresponds to one section, so the layers are not a run of that book's sections.

Source independence: 6 passages compared with 4 sources, none shared beyond a formula; largest share knapp2002, 20 of 36 locators; contents compared with knapp2002 through the README's section locators only, since its text and contents page could not be read: independent as far as that shows.

## Not verifiable

- **knapp2002**, **bourbaki-lie4-6**, **warner1972**, **wallach1988**: settled as uncertified. Their sections, pages and hypotheses were not read; 14 of the 15 sampled targets have only these as locators.
- The contents page of knapp2002: the publisher's page redirected to a sign-in handshake, which I did not follow.
- Lean elaboration, the `#check` comparison and the padding probe: not available in this lane, and there is no Lean file.
- RealSemisimpleLieGroups was read at head `9a938c5`; a later head may renumber the cited sections.
- The scopes of ShimuraData (open list, score 0.10) and RootSystemsPartII (main list, score 0.11) were not read this round; round 4 found nothing shared with ShimuraData.

## Source issues

- **Misprint** in brown-rodriguezhertz-wang2022 at §1.2, arXiv v2 printed p. 3 (lines 133–134): the source says a simple root is a positive root that is not a linear combination of other positive roots; it should be not a sum of two positive roots; affects nothing.

## For the human reviewers

- **Not tested.** knapp2002 carries 20 of 36 locators; neither its text nor its contents page was read, so wording and arrangement were not compared with it directly.
- **Merge order.** RealSemisimpleLieGroups (open, another author) is a supplier but is not in `merge-order/ORDER.txt`; the gate placed this roadmap after ArithmeticLocallySymmetricSpaces. It must go after RealSemisimpleLieGroups, which itself consumes AutomorphicFormsOnReductiveGroups §2.3a.
- **Ownership.** The division with RealSemisimpleLieGroups follows the round-4 repair (that roadmap owns the parabolic theory under the component condition; this one what lies beyond). No maintainer note records it (`design/README.md`, "Scope and ownership").

<!-- tauceti-roadmap-review {"agent": "claude", "head": "93d4bf7cd89b91107bb39ae06b47d32588498dd1", "job": "REV-DESIGN-LieGroupsPartII~5", "model": "fable", "worker": "chris-x29"} -->
