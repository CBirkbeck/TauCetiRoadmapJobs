# PKG-LieGroupsPartII — package report

Deliverables written: `packages/LieGroupsPartII/README.md` (845 lines), `packages/LieGroupsPartII/Suggested.lean` (12 theorems, 13 definitions), `packages/LieGroupsPartII/metadata.toml` (`topic = "math.RT"`, as `TauCetiRoadmap/ReductiveGroupsPartII/metadata.toml` on main), `packages/LieGroupsPartII/sources.toml` (`cited_for` extended by `7.4` for `knapp2002` and `wallach1988`; no new work). `packages/LieGroupsPartII/design/plan.json` is unchanged: no supplier gap is needed, `gaps` stays `[]`.

The README is the accepted design written out, with the corrections listed below. Every target, Check and worked example of the design is kept. The accepting review (`REV-DESIGN-LieGroupsPartII~10`) had no findings; its one note for the package stage (state §6.1 in `Suggested.lean`, inside `TauCetiRoadmap.LieGroupsPartII`) is applied.

## Headline theorems

| Headline (README) | Status | Lean name / what is missing |
| --- | --- | --- |
| Equality of conjugate standard parabolics in an arbitrary Tits system, with the containment forms (§6.1) | stated | `conj_standardParabolic_le_iff` (one equivalence; `J = ∅` gives the `B` form, `g` and `g⁻¹` give the equality form) |
| Langlands decomposition of the dynamic subgroups of a symmetric matrix (§7.2) | stated | `dynamicLevi_decomposition` |
| `P = MAN`: closed subgroup, unique `m·exp(H)·u` factorization, `G = KP`, `K ∩ P = M`, with no component condition (§3.3 (a), (b), (d), matrix form §7.3) | stated | `minimalParabolic_langlands` |
| Conjugacy of maximal abelian subspaces and of minimal parabolics under `K⁰` (§§2.2 (b), 3.4 for a fixed datum, matrix form) | stated | `exists_conj_minimalParabolic` |
| Bruhat decomposition over `W_G = N_K(𝔞)/Z_K(𝔞)`, no component condition (§4.2) | stated | `bruhat_decomposition_linear` |
| Regular dynamical description over `W_G` (§6.2 (i)) | stated | `dynamicParabolic_eq_iUnion_doubleCoset` |
| Classification of the subalgebras containing the minimal parabolic subalgebra (RealSemisimpleLieGroups §4.1 through §3.5, matrix form) | stated | `exists_eq_nonnegEigenspaces_of_le` |
| The component condition and its equivalents (§2.5, §3.3 (f)) | stated | `linearComponentCondition_iff` (stabilizer-of-`Σ⁺` form and strong self-normalization form) |
| Subgroups containing `P` are dynamic parabolics; `Q(H₀) = P` (§6.2 (ii), RealSemisimpleLieGroups §§4.2, 4.4) | stated | `eq_dynamicParabolic_of_le` (under the component condition) |
| Tits system `(P, N_G(𝔞))` for disconnected reductive linear groups (§4.2) | stated | `exists_titsSystem_linear` (under the component condition) |
| `⁰L` and the split component, components moving the split centre (§5.1) | stated in matrix form | `positiveCharacterKernel_mul_exp` |
| Real points of connected reductive `ℝ`-groups are self-adjoint linear with the component condition (§8.1) | stated in matrix form | `isSelfAdjointLinearGroup_of_zeroLocus` |
| Conjugacy of Cartan involutions with equal split centre, by `lieExp(X)lieExp(Z) ∈ G⁰` (§1.2); conjugacy of Iwasawa triples of different data (§2.6) | not statable | needs LieGroups' `CartanInvolution` (with `FiniteCartanMatrixModel`) and `IwasawaData`, planned by LieGroups, absent at the pins; in the matrix model the involution is fixed, so only the fixed-datum form is stated |
| Abstract (Lie-group carrier) forms of §§2.4–2.5, 3.3–3.5, 4.2, 5.1, 6.2 | not statable | same carrier; their matrix forms are the stated theorems above |
| Complexification criterion with centre (§6.3) | not statable | no base change of a Lie subalgebra at the pins (`LieSubmodule.baseChange` only); `TauCeti.borelSubalgebra` needs a Killing algebra with splitting Cartan subalgebra and base, none attached to the complexified derived algebra of a real matrix Lie algebra; stating it would need a long ad hoc encoding |

Each "not statable" item is named in the module docstring of `Suggested.lean`.

## Corrections to the design (what changed and why)

1. **Generality of the matrix Langlands statement.** The design's `minimalParabolic_langlands` put the unique factorization and `G = K·P` under `LinearComponentCondition`, although §3.3 proves them for every Iwasawa triple. Split: `minimalParabolic_langlands` now has no component condition (adds `P` closed subgroup and `K ∩ P = M`); `dynamicParabolic G H₀ = P` moved to `eq_dynamicParabolic_of_le` (condition), and self-normalization moved into `linearComponentCondition_iff`, in the stronger form "`gPg⁻¹ ⊆ P` implies `g ∈ P`", which is equivalent to the condition (O(1,1) and `Aut(𝔰𝔩_3(ℝ))` violate it, as they must).
2. **Statable headlines that were absent from the pinned list.** Added `exists_conj_minimalParabolic` (§§2.2, 3.4), `dynamicParabolic_eq_iUnion_doubleCoset` (§6.2 (i)), `linearComponentCondition_iff` (§2.5), `positiveCharacterKernel_mul_exp` (new §7.4, matrix form of §5.1) and `isSelfAdjointLinearGroup_of_zeroLocus` (§8.1 in polynomial form). Each has its README paragraph, API and Checks; README §7.3 was restructured to define the predicates these need (`IsMaximalAbelianSymmetric`, `IsRegularElement`, `orthogonalCentralizer`, `orthogonalNormalizer`, `minimalParabolic`, `nonnegEigenspaces`), each with API bullets and at least three Checks.
3. **§6.1 proof route.** The design's one-line sketch ("the multiplication axiom along a reduced word") is replaced by the length induction `BwBw⁻¹B ⊇ BsBsB = B ∪ BsB`, with the Tau Ceti lemmas it uses named and checked at the pin (`bruhatCell_mul_eq_of_wordLength_le`, `…_right`, `bruhatCell_mul_self_eq_union_of_mem_simple`, `bruhatCell_subset_standardParabolic_iff`, `standardParabolic_le_standardParabolic_iff`, `standardParabolic_empty`).
4. **A wrong library claim.** The design said `Mathlib/Analysis/CStarAlgebra/CStarMatrix.lean` "records" the missing `Bornology` on `Matrix`; that file only says its norm bornology is not defeq to `Pi.instBornology`. Replaced by the verified reason: the matrix norms of `Mathlib/Analysis/Matrix/Normed.lean` are scoped (`Matrix.Norms.Elementwise`, `.Frobenius`, `.Operator`), and `#synth Bornology (Matrix (Fin 2) (Fin 2) ℝ)` fails at the pin.
5. **Matrices are not a Lie ring by instance at the pin.** `LieRing.ofAssociativeRing` is a `def` used as a local instance (`Mathlib/Algebra/Lie/OfAssociative.lean:47, 63`); the first elaboration failed with `failed to synthesize LieRing (Matrix (Fin n) (Fin n) ℝ)`. `nonnegEigenspaces` uses `LinearMap.mulLeft ℝ Y − LinearMap.mulRight ℝ Y`, and the classification quantifies over submodules closed under commutators; the contract says so.
6. **Ownership of `P = MAN` against AutomorphicFormsOnReductiveGroups.** The design said AutomorphicFormsOnReductiveGroups §2.3a "owns" `P = MAN` for its class. That roadmap is later in the merge order (line 63; this roadmap is line 62), and Layer 3 here contains its class. Scope and ownership now says Layer 3 owns `P = MAN` for every reductive Cartan datum and that the real-algebraic class of §2.3a is a special case; the minimal-parabolic Borel–Tits comparison stays with RealSemisimpleLieGroups §4.5 / AutomorphicFormsOnReductiveGroups. This agrees with the original target (`packages/RealReductiveGroupsStructure/target.md`, "Ownership note"). Note for that roadmap's author: §2.3a should cite this roadmap's Layer 3.
7. **Worked example.** "`O(1,1)` … the identification of `dynamicParabolic G H₀` with `P`" fails: for `O(1,1)` the dynamic parabolic of `Y` is `P` (only `±1 ∈ N_K(𝔞)` commute with `Y`). Corrected to say this fails for `Aut(𝔰𝔩_3(ℝ))` only.
8. **Title** now names the Part II ("Lie groups, part II — …"); the vestigial sentence on NoncompactQuantumSymmetry (neither supplier nor consumer) was dropped.

## What the README could not support

- No abstract (Lie-group carrier) statement is in `Suggested.lean`; see the table. The README states them as targets on LieGroups' carriers.
- §6.3 has no Lean form (above).
- Layer 8's Lean form describes `𝐇` by real polynomials with connected, transpose-stable complex zero locus; the identification with ALS.F.1's algebraic-group carrier is argued in the README (§8.1), not encoded.

## Notions moved down from later roadmaps

None. No `*Needs:*` line, contract row or "supplied by" names a roadmap later than this one; AutomorphicFormsOnReductiveGroups, AutomorphicSpectralTheoryPartII, KleinianGroups and FuchsianOrbifoldsPartII appear only in Scope and ownership or Downstream consumers.

## Duplication sweep and removals

Searched by object with `roadmaps grep` (main and all open heads), the board's packages and the pinned Mathlib and Tau Ceti.

| Object | Found | Action |
| --- | --- | --- |
| Identification of the Lie algebra of a closed matrix group with `{X : exp(tX) ∈ G ∀t}` (the design's "own the adapter … intertwining `lieExp` with `NormedSpace.exp` and `Ad` with conjugation") | Tau Ceti `TauCeti.Lie.unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff` (`TauCeti/Geometry/Lie/Subgroup/Units.lean`), `TauCeti.Lie.unitsLieAlgebraLieEquiv` and `TauCeti.Lie.unitsLieAlgebraEquiv_Ad` (`TauCeti/Geometry/Lie/Adjoint/Units/Basic.lean:182, 160`), `TauCeti.expUnit_coe` (`TauCeti/Geometry/Lie/Exponential/Units/Basic.lean:64`), for finite-dimensional real normed algebras (matrices with a scoped norm) | **Removed** as an owned item: §7.1 and Scope now apply these; contract bullet added. `linearLieAlgebra` stays as the definition the statements need (matrix reading, no norm instance), its docstring cites the Tau Ceti theorem |
| Self-adjoint linear groups, `linearLieAlgebra`, dynamic parabolic/unipotent/Levi of a matrix, the component condition, `⁰G` for matrix groups, conjugation into standard parabolics | nowhere on main, in open heads, board packages or at the pins | kept, owned here |
| Maximal abelian subspaces of `𝔭`, `nonnegEigenSubmodule`, `dynamicalParabolic` (abstract carriers) | RealSemisimpleLieGroups (open, `#2229`'s folder) §§1.1, 4.1, 4.4 | not restated; Scope now says the Layer 7 matrix predicates are their readings, and §§7.2–7.3 state the comparisons |
| Closed transpose-stable matrix groups with finitely many components as Cartan models | LieGroups Layer 9 (main), "Global real-reductive inputs" | consumed (identity cover), not restated |
| `P = MAN` for the real-algebraic class | AutomorphicFormsOnReductiveGroups §2.3a (open, later in the order) | ownership settled here (correction 6) |
| `packages/RealReductiveGroupsStructure` | the original target of this roadmap (`Name: LieGroupsPartII`), no README | not a second owner |

No declaration of `Suggested.lean` has the fully qualified name of a declaration in a roadmap I could read (all live in `TauCetiRoadmap.LieGroupsPartII`).

## Ownership against open pull requests, overlaps, gaps

- Open pull requests were checked through the `roadmaps` index of 2026-11-15 (all 475 heads), plus RealSemisimpleLieGroups, ArithmeticLocallySymmetricSpaces, AutomorphicFormsOnReductiveGroups and AutomorphicSpectralTheoryPartII read at their heads.
- Every cross-roadmap citation was resolved at the current copy: LieGroups (main) Layers 0–9 and its `Suggested.lean` names (`CartanInvolution`, `IwasawaData`, `IsIwasawaTriple`, `cartan_polar_decomposition`, `chamber_span`, `chamber_normalizer_cover`, `global_model`, `exists_monoidHom_of_lieHom`, `isConj_of_isMaximalTorus`); RealSemisimpleLieGroups §§0.2, 1.2, 1.3, 2.3, 3.1–3.3, 4.1–4.5, 5.4 and `exists_conj_cartanInvolution`, `exists_titsSystem`, `dynamicalParabolic`, `nonnegEigenSubmodule`; ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–ALS.0.3 with the planned names `LocallySymmetric.realPoints_lieGroup`, `IsCartanInvolution.conj`, `LocallySymmetric.IsCartanInvolution.transposeInverse` (the two "found nowhere" leads of the worker's citation list are these planned names, present in that roadmap's README); AutomorphicFormsOnReductiveGroups §2.3a; AutomorphicSpectralTheoryPartII §1.5; ReductiveGroups Layers 7, 7C; RootSystems "Exact supplier contracts". `roadmaps resolve` on the package README: no cross-roadmap citation and no Lean name found nowhere (it did not check library names on this host; I checked every library identifier of the README against the pins by grep, all present).
- Overlaps: no other open pull request changes this roadmap; no dropped id; no id only a revision defines; no second copy.
- Gaps: none. Everything consumed is stated by its supplier (RealSemisimpleLieGroups contracts re-read at its head; LieGroups Layer 9 states the identity-cover polar theorem for closed transpose-stable matrix groups with finitely many components).

## Adversarial pass

`J = ((0, −1), (1, 0))`, `S = ((0, 1), (1, 0))`, `Y = S` in `O(1,1)`, `d = diag(1, −1)`. Values computed in this run (plain arithmetic, recorded).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `conj_standardParabolic_le_iff` | `S = ∅`; rank one `SL_2` with `g = J`, `b = ((1,1),(0,1))`; `GL_3` with `J = {s₁}`, `J' = {s₂}`; `J = ∅`, `J' = S`, `g = 1` | `JbJ⁻¹ = ((1,0),(−1,1)) ∉ B` (axiom `sBs ≠ B`); `{s₁} ⊄ {s₂}` so no `g` conjugates `P_{s₁}` into `P_{s₂}` (plane vs line stabilizers); `∅ ⊆ S` and `1 ∈ G` both sides true, while the reversed inclusion `J' ⊆ J` fails | holds both directions | new Check (rank one, reversed-inclusion control) |
| §6.1 proof step 2 | `w = s₁s₂` in `S₃` | `B w B w⁻¹ B = Bs₁B·(Bs₂B·Bs₂B)·Bs₁B ⊇ Bs₁B·Bs₁B = B ∪ Bs₁B` | holds | route rewritten |
| `IsSelfAdjointLinearGroup`, `linearLieAlgebra` | `{diag(2^k,2^{−k})}`; unitriangular; trivial group with `X = 2πJ`; `n = 0` | Lie algebra of the discrete group `0`, polar map not onto; `exp(2πJ) = I` but `exp((1/4)·2πJ) = J ∉ {1}`; `GL_0` trivial, closed, one component | definitions determine the object; `t = 1`-only variant refuted | new Check (all `t`) |
| `dynamicLevi_decomposition` | `GL_2`, `X = diag(1,0)`; skew `X`; `OᵀSL_2(ℤ)O`; non-symmetric `X = ((1,1),(0,0))` | conjugate entries `a, e^{−t}b, e^t c, d`; `diag(2,5)·((1,1.5),(0,1)) = ((2,3),(0,5))`; `OgOᵀ = ((2,3),(1,2)) ∈ SL_2(ℤ)` and `(OlOᵀ)₁₂ = 1.5`, so the limit leaves `G`; `S⁻¹θ(g)S = ((0,1),(−1/2,3/2))`, entry `e^t` | holds under its hypotheses; each hypothesis needed where stated | Checks rephrased without Lean names |
| `IsMaximalAbelianSymmetric` | `GL_2` diagonal; line `ℝ·diag(1,−1)`; `SL_2` with `S`; `G ≤ O(n)` | `1` symmetric, commutes, not in the line; `[diag(1,−1), S] = ((0,2),(−2,0)) ≠ 0`; skew Lie algebra gives `𝔭 = 0` | determines maximal abelian subspaces of `𝔭` | new |
| `IsRegularElement` | `GL_2`: `diag(1,0)`, `1`; `SL_3`: `diag(1,1,−2)`, `diag(1,0,−1)`; `O(1,1)`: `0` | `E₁₂` commutes with `diag(1,1,−2)` (true) but not with `diag(1,−1,0)` (false); `0` regular iff `Σ = ∅` | correct | new |
| `orthogonalCentralizer`, `orthogonalNormalizer` | `SL_2`; `GL_n`; `O(1,1)` | `R_φ diag(1,−1) R_φᵀ = ((cos2φ, sin2φ),(sin2φ, −cos2φ))`, so `M = {±1}`; `J diag(1,−1) Jᵀ = diag(−1,1)`, `N_K(𝔞) = {±1, ±J}`; `|N_K(𝔞)| = 2^n n!` for `GL_n`; `O(1,1)`: `N_K(𝔞) = K`, quotient order 2 | correct; identity-component variant of `M` misses `−1` | new |
| `minimalParabolic`, `minimalParabolic_langlands` | `SL_2`; `O(1,1)`; compact; `n = 0` | `(−1)·diag(2,1/2)·((1,−3/2),(0,1)) = ((−2,3),(0,−1/2))`; `O(1,1)`: `P = {±exp(tY)}`, `d·exp(tY) = k·p` with `k = d`, `K ∩ P = {±1} = M`; compact: `N = {1}`, `P = M = K = G`; `n = 0`: all `{1}` | holds with no component condition | generality corrected (correction 1) |
| `exists_conj_minimalParabolic` | `SL_2`, `±H₀`; `O(1,1)`, `±Y`; `GL_2`, `𝔞` vs `ℝ·1 ⊕ ℝS` | `J((2,3),(0,5))J⁻¹ = ((5,0),(−3,2))` (upper to lower), `J ∈ SO(2) = K⁰`; `O(1,1)`: `K⁰ = {1}`, both `P` equal; `R_{π/4}` carries `diag(1,−1)` to `S` | holds without the condition | new |
| `bruhat_decomposition_linear` | `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))`; `GL_n` | `G = P ⊔ dP`, `P ∩ K = {±1}`; with the dynamic parabolic in place of `P`, `k = 1`, `k' = σAd(w₀)` share a cell and do not commute with `𝔞` | holds; needs `P = M·exp(𝔞)·N` | unchanged |
| `dynamicParabolic_eq_iUnion_doubleCoset` | `GL_2`, `H₀ = diag(1,0)`; `O(1,1)`; `Aut(𝔰𝔩_3(ℝ))`, `X₀ = diag(1,0,−1)` | stabilizer in `N_K(𝔞)`: signs only, union `= P` upper triangular; `O(1,1)`: `dY = −Yd`, only `±1`, union `= P`, and `exp(−tY)d exp(tY) = exp(−2tY)d` unbounded; `Aut`: stabilizer `{1, σAd(w₀)}`, union `P ⊔ σAd(w₀)P` | holds | new |
| `nonnegEigenspaces`, `exists_eq_nonnegEigenspaces_of_le` | `Y = diag(1,0)`; `SL_3`; `GL_2`, `0` vs `1` | `ad Y`: `E₁₂ ↦ E₁₂`, `E₂₁ ↦ −E₂₁`; `diag(1,1,−2)`: eigenvalues `0,0,3,3,−3,−3`, sum of dimension 6; four overgroups of `𝔮₀` in `𝔰𝔩_3` from `diag(1,0,−1)`, `diag(1,1,−2)`, `diag(2,−1,−1)`, `0`; `0` and `1` same centralizer, same sum `𝔤` | both clauses hold | new Checks |
| `LinearComponentCondition`, `linearComponentCondition_iff` | `GL_n`; `O(1,1)`; `O(p,q)`; compact | `O(1,1)`: `d` normalizes `N = {1}`, `d ∉ M`, `dPd⁻¹ = P`, `d ∉ P`: both right sides false, condition false; `O(p,q)`, `p > q ≥ 1`: determinants `(Πε·det k', Πε)` take 4 values, `p = q` only 2; compact: all three sides true | iff holds both directions on each | new |
| `eq_dynamicParabolic_of_le` | `GL_2`; `O(1,1)` without condition; `SL_3` | overgroups of upper triangular: itself and `G`, dynamic parabolics of `diag(1,0)` and `0`; `O(1,1)`: `0` and `Y` same centralizer, parabolics `G ≠ P` (negative control) | holds under the condition | absorbed `Q(H₀) = P` |
| `exists_titsSystem_linear` | `GL_n`; `O(1,1)`; compact; `n = 0` | `glTitsSystem ℝ (n−1)`; `O(1,1)`: `P` normal, `sBs ≠ B` fails; compact: `B = N = G`, no simple reflections | holds under the condition | unchanged |
| `positiveCharacterKernel`, `positiveCharacterKernel_mul_exp` | `ℝ^×`; `GL_2` with `g = ((2,3),(0,5))`; `O(1,1)`; swap group; compact; `n = 0` | `x = sgn x·exp(log|x|)`; `|det g| = 10`, `X = (ln 10/2)·1 ≈ 1.1513`, `det(g/√10) = 1`; `O(1,1)`: `dYd = −Y`, `F = 0`, `⁰G = G`; `diag(e³,e) = diag(e,e⁻¹)·exp(2·1)`; `K` alone fails at `diag(2,1/2)` | holds; only `F`, not `V`, splits off | new §7.4 |
| `isSelfAdjointLinearGroup_of_zeroLocus` | `GL_n` (`S = ∅`); `SO(1,1)`; `O(1,1)`; `SO(2,1)` | `SO(2,ℂ) ≅ ℂ^×` by `a + b` since `(a+b)(a−b) = 1`, connected; real `SO(1,1)` two components, `M = {±1}` meets both; `O(2,ℂ)` two components so `O(1,1)` excluded; `SO(2,1)`: `M = {1, diag(1,−1,−1)}` meets both | holds; connectedness of `Gℂ`, not of `G`, is the right hypothesis | new |
| Scope: Layer 3 vs AutomorphicFormsOnReductiveGroups §2.3a | merge order | lines 62 (this) and 63 (that) | earlier roadmap owns the general statement | correction 6 |
| Contract: `Matrix` bornology | `#synth Bornology (Matrix (Fin 2) (Fin 2) ℝ)` | fails; norms scoped at `Analysis/Matrix/Normed.lean` lines 15, 23, 33 | claim true, reason corrected | correction 4 |
| Worked example `O(1,1)` | dynamic parabolic of `Y` | `= P` (see regular row) | design sentence false | correction 7 |

Context check: the only section variable of `Suggested.lean` is `{n : ℕ}`; every hypothesis of every declaration is in its own signature.

## Elaboration

`lake env lean packages/LieGroupsPartII/Suggested.lean`, run from the content checkout at the pins: exit 0, **12** warnings `declaration uses 'sorry'` (one per theorem), no other message. The first draft failed on `ᵀ` (needed `open Matrix`) and on `failed to synthesize LieRing (Matrix (Fin n) (Fin n) ℝ)` (correction 5); both fixed before the final run. Imports: `import Mathlib` and `import TauCeti.GroupTheory.TitsSystem.Parabolic.Basic` (exists and is built at the pinned Tau Ceti). No `set_option`, no sorry'd data, first line `module`.

`#check` comparison: a scratch file with `#check @name` for all 25 declarations was elaborated once; each elaborated type was compared with its README statement. All binders are as intended (no hypothesis lost to section variables); nothing changed after the comparison.

## Dependency check

```text
depcheck: 246 roadmaps, 2244 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

## Sources

No source was fetched or added: every cited work is already in the manifest (`borel-tits1965`, `brown-fisher-hurtado2022`, `brown-rodriguezhertz-wang2022`, `bradlow-collier-garciaprada-gothen-oliveira2024` certified; `bourbaki-lie4-6`, `warner1972`, `knapp2002`, `wallach1988` settled as uncertified and cited by locator). No `needs-references.toml` was written. No passage of a source was copied.

## For human attention

- RealSemisimpleLieGroups (open, new folder by another author) is this roadmap's main supplier but is absent from `merge-order/ORDER.txt`; its §§2.3, 3.1, 4.5 consume AutomorphicFormsOnReductiveGroups §2.3a, which the merge order places after this roadmap (line 63 vs 62). The depcheck does not see this transitive edge. Either RealSemisimpleLieGroups is inserted before this roadmap with its §2.3a dependency resolved, or the order moves.
- AutomorphicFormsOnReductiveGroups §2.3a states `P = MAN` for a special case of this roadmap's Layer 3; as the later roadmap it should cite Layer 3 (correction 6).
- No suspicious instruction was found in any text read (reviews, roadmaps, sources).
