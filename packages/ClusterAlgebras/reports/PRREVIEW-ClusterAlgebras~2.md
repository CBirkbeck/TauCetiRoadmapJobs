# Review of ClusterAlgebras (pull request #1858 at 12cdb38)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/ClusterAlgebras/README.md` (1908 lines) and `TauCetiRoadmap/ClusterAlgebras/Suggested.lean` (364 lines, 38 declarations) against Mathlib `1b1ccf4b` and Tau Ceti `2fd255d9`. The worker's gate passes on this head (every counter 0, build OK). One blocking finding (R01) and four P3 findings, all of them structural; the mathematics of the sampled sections §§2.1–2.6 and of the six stated headlines checks out against the texts and by computation (tables under *Verified sound*).

**Repair status of the previous review (at 1f1a405).**
- R01 (no headline theorem): repaired. `Suggested.lean` lines 177–235 now state the Laurent phenomenon, Somos-4 integrality, the finite-type classification (1⟺2 and 2⟺3), Laurent positivity and sign-coherence of `c`-vectors, on `clusterMutation`/`seedMutationWord`/`matrixMutationWord`, exactly as the previous witness proposed; all six elaborate (only `sorry` warnings). The docstring's list of unstatable headlines is the new defect R01 below.
- R02 (sorry'd data): repaired. `ExchangeMatrix.mutate` has the proved `matrixMutation_symmetrized` (line 90) and `latticeCocycle_isFactorSet` (line 247) is proved.
- R03 (imports): repaired. Header is `public import Mathlib` plus two `TauCeti.*` modules.
- R04 (padding): partly repaired. Six of the nine declarations were deleted; `mutate_involutive` (line 127), `CompatibleData.independentColumns` (line 292) and `PolynomialFrame.exchangeCoordinate_ne_zero` (line 343) remain sorried, and `torusMonomial_mul` (line 268) was proved in place instead of deleted. See R04.
- R05 (README form): not repaired. The only change is the conversion of the supplier bullets into `### From TauCetiRoadmap.X` headings (lines 78–139); see R02.
- R06 (no supplier edge): partly repaired. The `### From TauCetiRoadmap.X` headings are now read by the dependency check; there is still no `*Needs:*` line. See R03.
- R07 (supplier drift): repaired. "RootSystems, Layers 1–3" at lines 90 and 1554; `MonoidAlgebra.tensorAlgEquiv` dropped at line 1384.

## R01 (P2) — a statable headline is absent: upper-bound invariance under full column rank

**Location.** `TauCetiRoadmap/ClusterAlgebras/Suggested.lean` lines 31–33: "Upper-bound invariance (§2.1) needs the upper cluster algebra of §1.4", listed among the headlines "not stated here".

**Claim.** The README's Layer 2 is built around Q3 (`README.md` lines 779–815): with full column rank, `UB(s) = UB(μ_k s)` for every `k`, hence `U = UB(s)` (lines 884–893 for the classical instance: "full column rank additionally gives `U=UB`"; line 866: "identify the full-column-rank corollary with the `u=1`, `Λ=0`, `w=0` instance of Q1–Q3"). This is BFZ III Corollary 1.9 (text line 232: `B̃` of rank `n` with skew-symmetrizable principal part ⇒ `U(Σ)` depends only on the mutation class), the theorem through which this roadmap proves the Laurent phenomenon. It is statable at the pins with the file's own definitions: the upper bound is an intersection of subalgebras of `F`, which needs no carrier from §1.4.

**Witness.** On a scratch copy of the file I appended, after `clusterVariables`, the definitions `laurentSubalgebra x := Algebra.adjoin ℤ (Set.range x ∪ Set.range fun i ↦ (x i)⁻¹)` (a `Subalgebra ℤ F`) and `upperBound row B x := laurentSubalgebra x ⊓ ⨅ k : K, laurentSubalgebra (clusterMutation row B x k)`, and the theorem

```lean
theorem upperBound_seedMutationWord {I K F : Type*} [Fintype I] [DecidableEq I]
    [DecidableEq K] [Field F] {row : K ↪ I} (B : ExchangeMatrix row)
    (c : LaurentChart ℤ I F)
    (hrank : LinearIndependent ℚ fun k ↦ fun i ↦ (B.matrix i k : ℚ)) (w : List K) :
    upperBound row (seedMutationWord row (B.matrix, c.coordinate) w).1
        (seedMutationWord row (B.matrix, c.coordinate) w).2 =
      upperBound row B.matrix c.coordinate := by
  sorry
```

`lake env lean` on the copy: only `sorry` warnings; `#check @upperBound_seedMutationWord` elaborates with `(LinearIndependent ℚ fun k i => ↑(B.matrix i k)) → ∀ (w : List K), upperBound … = upperBound …`. All coordinates along a word are nonzero under full column rank (no zero column, so each exchange binomial is the image under the injective chart of a Laurent polynomial with two distinct monomials), so the inverses are not junk.

**Repair.** Add the two definitions and the theorem above to `Suggested.lean` (Layer 2 section), name the theorem in README §2.1 at Q3's full-column-rank corollary, and delete the sentence of the docstring that calls upper-bound invariance unstatable. The quantum Laurent phenomenon, §5.1 and §6.3 may stay in the unstatable list: their carriers (the mutated toric frame in an Ore division ring, the completed wall group, `G^{u,v}` and `Δ_{uω_i,vω_i}`) are indeed absent at the pins.

## R02 (P3) — the README is not in TauCetiRoadmap form (previous R05, unrepaired)

**Location.** `README.md` line 1 (`# Cluster algebras`, no `# Roadmap:` and no `**Summary.**`); line 30 `## Scope and dependency boundaries` (the `### From TauCetiRoadmap.X` headings at lines 78–131 and `### Boundary with QuantumGroups` at line 133 sit under it; there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`); lines 141 and 175 (`## Ownership and proof dependencies`, `## Library interfaces and conventions`); 26 bold paragraphs `**0.1 …**` … `**6.3 …**` in Layers 0, 1, 3–6 (only Layer 2 has `### 2.1`–`### 2.6`); no `### Examples` or `### Dependencies` in any layer; line 1819 `## Completion criteria`; 13 ```` ```math ```` fences with LaTeX (`\begin{cases}`, `\frac`, `\sum`, `\prod`) at lines 440, 482, 604, 714, 730, 750, 782, 962, 1007, 1019, 1204, 1322, 1332.

**Claim.** The README shape rules (headings as upstream uses them; prose `### k.n` subsections; Unicode mathematics, never LaTeX delimiters or display blocks; `### Examples` and `### Dependencies` per layer; `**Checks.**` per definition with three discriminating checks) are not met. Compare `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` on main for the shape.

**Witness.** `grep -c '^```math'` = 13; `grep -c -E '^\*\*[0-9]\.[0-9]+ '` = 26; `grep -c '^### Dependencies'` = 0.

**Repair.** As in the previous review: `# Roadmap: cluster algebras` + `**Summary.**`; `## Scope and ownership`; `## Conventions` (lines 175–206 moved there); `## Exact supplier contracts` holding the existing `### From TauCetiRoadmap.X` headings plus `### From Mathlib` and `### From Tau Ceti`; `## How to read the build` (the layer table at lines 19–27); every layer with `### k.n` subsections, `### Examples` and `### Dependencies`; `## Downstream consumers`; fold `## Completion criteria` into the layers or the summary. Replace each ```` ```math ```` block by an inline code span or an indented code block in Unicode, e.g. line 440: `b'_ij = −b_ij` if `i = k` or `j = k`, else `b_ij + [b_ik]_+[b_kj]_+ − [−b_ik]_+[−b_kj]_+`; line 604: `X'_k = Σ_{l=0}^{r_k} h_{k,l} M(−e_k + l[β_k]_+ + (r_k−l)[−β_k]_+)`.

## R03 (P3) — no target has a `*Needs:*` line (previous R06, partly repaired)

**Location.** `README.md`: `grep -c 'Needs:'` = 0. Supplier consumption is stated only in the `### From TauCetiRoadmap.X` paragraphs (lines 78–131) and in trailing "Sources: … ; RootSystems, Layers 1–3" sentences (line 1554).

**Claim.** Every target's `*Needs:*` line lists what its statement and route need, item by item, so that the per-target supplier order is checkable; the dependency check reads edges from `*Needs:*` lines, the `### From` headings and `### Dependencies` sentences. The headings now give roadmap-level edges (the check reports `240 roadmaps, 2432 edges, 0 problem(s)`), but §5.1's use of ScatteringDiagrams §3.3 `exists_outgoingCompletion` and §3.4 `outgoingCompletion_unique`, §5.2's use of §5.6 `cylinderBrokenLineLift`/`principalTheta_eq_projectedMonomialSum` and §7.7 `theta_coefficients_nonnegative`, §6.1's use of ReductiveGroups Layers 7, 7C, 10, §6.3's use of SchemeAndStackFoundations §0.6 and §3.3's use of AnalyticToricGeometry Layer 0 are not attached to their targets.

**Repair.** With R02, end each `### k.n` subsection with a `*Needs:*` line, e.g. §5.1: "*Needs:* Layer 3 §§3.1–3.4, ScatteringDiagrams §4.2 `SkewLatticeDatum`, §3.3 `exists_outgoingCompletion`, §3.4 `outgoingCompletion_unique`, §4.4, §1.4 sweep identity"; §6.3: "*Needs:* §6.2, §2.1 full-column-rank corollary, SchemeAndStackFoundations §0.6". Rerun the dependency check; expect no UPWARD/CYCLE line.

## R04 (P3) — `Suggested.lean` still carries an interface catalogue beside the headlines (previous R04, partly repaired)

**Location.** `Suggested.lean` lines 55 (`CoefficientSemifield`), 120–131 (`ExchangeMatrix.mutate`, `mutate_involutive`, sorried), 138–152 (`YSeed`, `ClassicalSeed`), 240–273 (`latticeCocycle`, its instance, `BasedTorus`, `torusMonomial`, `torusMonomial_mul`), 278–364 (`CompatibleData`, `independentColumns` sorried, `ExchangeFrame`, `PolynomialData`, `PolynomialFrame`, `dividedColumn`, `exchangeCoordinate`, `exchangeCoordinate_ne_zero` sorried, `polynomialSubalgebra`, `PolynomialRealization`); the module docstring lines 12–25 ("selected interfaces", "The statements here suggest Lean forms for particular milestones; discharging all of them finishes neither a layer nor the roadmap", "These interfaces specify coefficient semifields, faithful charts, exchange data, polynomial exchange and realization").

**Claim.** No headline mentions any of these 18 declarations (the headlines use only `LaurentRing`, `LaurentChart`, `LaurentChart.coordinate`, `ExchangeMatrix`, `matrixMutation`, `matrixMutationWord`, `clusterMutation`, `seedMutationWord`, `clusterVariables`, `cartanCompanion`, `principalExtension`). The file's rules allow definitions only to make a headline statable; API lemmas (`mutate_involutive`, `independentColumns`, `exchangeCoordinate_ne_zero`, `matrixMutation_symmetrized`, `torusMonomial_mul`) are padding whatever their proof status, and the previous repair asked for deletion, not for a proof in place. The docstring is not in the required form ("<title>: target signatures"; the roadmap is README.md; which headlines are not statable and what each lacks).

**Witness.** One-tactic probes on a scratch copy: `mutate_involutive` fails under `simp [ExchangeMatrix.mutate, matrixMutation]` (goal is a structure equality) and `rfl`; `independentColumns` and `exchangeCoordinate_ne_zero` fail under `simp`: they are genuine API lemmas of §§1.1, 1.5, not headlines. `grep -c` of each of the 18 names in the headline statements (lines 177–235) is 0.

**Repair.** Delete the 18 declarations listed above together with `matrixMutation_symmetrized` and `ExchangeMatrix.mutate` (no headline uses `mutate`; `matrixMutationWord` folds `matrixMutation`), keep the 11 the headlines use, and rewrite the docstring as "Cluster algebras: target signatures", stating that the roadmap is `README.md`, that the file states the headline theorems against the pinned APIs, and which headlines are not statable and what each lacks (the list at lines 31–36, minus upper-bound invariance per R01). The README keeps every deleted statement in §§0.1, 0.4, 1.1, 1.2, 1.5, 1.6.

## R05 (P3) — the README names none of the Lean declarations

**Location.** `README.md` line 206: "Declaration names are illustrative; the mathematical statements specify the targets." None of the 38 declaration names of `Suggested.lean` occurs in the README (`grep -c` of each backticked name = 0; the only hits for `coordinate` and `mutate` are English words).

**Claim.** README and Lean agree only when every Lean name appears in the README at the target it formalises; a reader of §2.1, §2.4, §4.1, §5.2 or §5.3 cannot tell that the file states those targets.

**Repair.** At each headline's target write its Lean name once: §2.1 Q3/L8 `exists_laurentExpansion` (and `upperBound_seedMutationWord` after R01), §2.4 `somos4_exists_pos_nat`, §4.1 `finite_clusterVariables_iff` and `exists_isFiniteType_iff_forall_le_three`, §5.2 `exists_nonneg_laurentExpansion`, §5.3 `cVector_signCoherent`; and name the kept definitions where they are defined (§1.1 `ExchangeMatrix`, `matrixMutation`, `matrixMutationWord`; §0.2 `LaurentRing`, `LaurentChart`; §1.2 `clusterMutation`, `seedMutationWord`, §1.3 `clusterVariables`; §4.1 `cartanCompanion`; §2.2 `principalExtension`). Delete the sentence at line 206.

## Verified sound

**Gate and build.** Worker's gate at 12cdb38: every counter 0, `build=0`, OK. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ClusterAlgebras'` is empty. `metadata.toml` has `topic = "math.RA"`. `lake env lean` on the scratch copy of `Suggested.lean` with the R01 witness appended: 7 `sorry` warnings, no error in the original declarations.

**Dependency check** (`gate --depcheck … --movable`): `depcheck: 240 roadmaps, 2432 edges, 0 problem(s)`; no UPWARD or CYCLE line. ClusterAlgebras is at position 392 of the merge order; ScatteringDiagrams (open pull request #1134, new folder, same author, named in the description's depends-on) is not in the order yet, which is not a defect.

**Signatures.** The 38 elaborated types in the worker's `signatures.md` agree with the README statements; none lost a section binder. `#check` on `clusterVariables`, `exists_nonneg_laurentExpansion`, `cVector_signCoherent` and the witness reproduced them.

**Pinned declarations opened** (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b): `TauCeti.IsFiniteType` (`TauCeti/LinearAlgebra/RootSystem/FiniteType/Basic.lean:129`: `Finite B ∧ diag 2 ∧ offdiag ≤ 0 ∧ symmetric vanishing ∧ ∃ d > 0, (d_i A_ij) PosDef`, i.e. a symmetrizable positive-definite generalized Cartan matrix, which is §4.1's condition 2); `TauCeti.DynkinType.cartanMatrix` (`DynkinType.lean:219`, entry `⟨α_i, α_j^∨⟩` in Bourbaki numbering, `G₂` as `CartanMatrix.G₂ᵀ`, so §4.2's "FZ II's matrix is the transpose" is right); `TauCeti.twistedMonoidAlgebra`, `TauCeti.IsFactorSet`, `TwistedMonoidAlgebra.of`/`of_mul_of` (`Twisted/Basic.lean`); `Matrix.fromRows`; `MonoidAlgebra.scalarTensorEquiv`. No cluster-algebra object (exchange matrix, mutation, Somos sequence, `c`-vectors) exists in Mathlib or Tau Ceti at the pins (`grep -ril 'cluster algebra\|exchange matrix\|skew-symmetrizable\|somos'` finds nothing; the only `mutation` hits are knot-theory Conway mutation).

**Ownership.** `roadmaps grep` over main and the 467 open heads for "cluster algebra", "double Bruhat", "generalized minor", "Somos", "sign-coheren", "Laurent phenomenon": only this roadmap and ScatteringDiagrams #1134, whose scope (its README lines 22–30) excludes "seeds, mutation, cluster monomials, `c`- and `g`-vectors and the comparison of theta functions with cluster variables". `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped ids. Ownership against open pull requests without files was not checked beyond this grep.

**Cross-roadmap citations resolved.** ScatteringDiagrams at the #1134 head: §0.8 (line 502), §1.4 (732), §3.3 (1137), §3.4 (1222), §4.2–4.4 (1322, 1392, 1451), §5.1–5.6 (1504–1865), §7.1–7.7 (2103–2427), and `SkewLatticeDatum`, `AdaptedBasis`, `QuantumMonoidAlgebra`, `principalGradingDictionary`, `principalProjectionComparison`, `exists_outgoingCompletion`, `outgoingCompletion_unique`, `theta_presentationInvariant`, `cylinderBrokenLineLift`, `principalTheta_eq_projectedMonomialSum`, `theta_coefficients_nonnegative` each present. On main: RootSystems `## Layer 1`–`## Layer 3` (lines 248, 432, 504); ReductiveGroups `### Layer 7` (627), `#### Layer 7C` (652), `### Layer 8` (1023), `### Layer 10` (1731); SchemeAndStackFoundations `### 0.6 … Hartogs` (678); `Completed/AnalyticToricGeometry` `## Layer 0` (186); InductionRestriction Layer 7 and `TauCeti.twistedMonoidAlgebra` (721, 797); QuantumGroups σ-derivation Ore extension / PBW (609, 858); SchubertGeometry on main.

**Sources at their locators** (arXiv/Numdam texts in the worker's cache; line numbers are of the extracted texts).
- BZ: Thm 5.1 l.593, Cor 5.2 l.606 (quantum Laurent phenomenon), Lemma 5.4 l.660, Lemma 5.5 l.669, Lemma 5.6 l.694 (`c_{−r}` divisible by `P^{rb_1,+}`, via (5.12)–(5.13), the README's `α_k`), Prop 5.7 l.705 (commuting case through Prop 11.2 and relative primality from full rank, Prop 3.3), Lemma 5.8 l.733, Prop 6.2 l.823 (bar involution preserves `U`), Prop 11.1 l.1734 (Ore), Prop 11.2 l.1749 (center spanned by `X^f`, `f ∈ ker Λ`; `Tz_1 ∩ Tz_2 = Tz_1z_2` for relatively prime central `z_i`), Prop 4.7 l.498, Def 4.3 l.423: §§2.1, 2.5 attributions right.
- BFZ III: Def 1.4 l.175, Thm 1.5 l.178 (both seeds coprime ⇒ equal upper bounds), Cor 1.7 l.202, Prop 1.8 l.229 (full rank ⇒ all mutation-equivalent seeds coprime), Cor 1.9 l.232, Lemma 3.1 l.1114, Lemma 3.2 l.1152 (rank invariance, factorisation (3.2) with `e_ik = max(0, −εb_ik)`, `f_kj = max(0, εb_kj)`: §1.1's `E_ε`, `F_ε`), Lemma 4.1 l.1178, Lemma 4.2 l.1210; Thm 2.10 l.668 (p. 16), Lemma 2.12 l.714, Lemma 2.13 l.759 (p. 17), Cor 2.17 l.803 (p. 18); i-exchangeable indices l.460 (`k` and `k⁺` in `[1, ℓ(u)+ℓ(v)]`, §6.2's "positive positions with a successor"). The References' page ranges are right.
- FZ IV: Def 2.1 l.220 (`Qsf` = subtraction-free expressions, which are the ratios of `ℕ`-coefficient polynomials of §0.1), Def 2.2 l.227, Def 2.3 l.257, Def 2.4 l.283, Thm 3.5 l.624, Thm 3.7 l.650 ((3.5), §2.3's separation), Cor 6.3 l.1081 ((6.5)), Prop 6.6 l.1174 ((6.12) is §2.2's `g'_k` recurrence; (6.14) l.1205).
- BCDX: Def 2.3 l.174 ((2.3), the polynomial exchange of P1), Thm 3.1 l.222, coprimality l.756, Lemma 4.1 l.781, Prop 4.2 l.812, Prop 4.6 l.938, Prop 4.7 l.945, Thm 4.9 l.1143 (coprime ⇒ upper bound invariant): §2.6's attributions right.
- NR: §3 l.238–262 (monic `Z_i` with `z_{i,0} = z_{i,d_i} = 1`, reversed polynomial, Def 3.1 (3.1)): reversal mutation without reciprocity, as §2.6 states. Rupel: Thm 5.1 l.1641 on the page whose running footer is journal p. 1266, proof continuing on p. 1267. GLS: specialization of upper quantum cluster algebras l.46–74, cited only for the distinction.
- FZ I Thm 3.1 l.405. FZ II Thm 1.8 l.274 ((ii) finitely many variables, (iii) `|b_xy b_yx| ≤ 3` at every seed, (iv) bipartite with finite-type Cartan counterpart), Cartan counterpart l.232, convention `s_i(α_j) = α_j − a_ij α_i` l.289, Thm 7.1 l.1208, Thm 8.6 l.1411, (5.3) l.962, Lemma 5.2 l.983 (over any domain `S`, as §4.2 says), Prop 11.2 l.1848 (polynomial in frozen variables: the headline's nonnegative frozen exponents). NZ Thm 1.2 l.155, Prop 1.3 l.185, (2.7) l.242. GHKK Thm 1.24 l.1102 (under the Injectivity Assumption, as §5.1 applies it on the principal seed), Thm 4.9 l.1873, Thm 4.10 l.1893 (positivity), Cor 5.5 l.2036 (sign-coherence), Thm 5.11 l.2197, Prop B.11 l.4716.

**Headline statements against the sources.** `exists_laurentExpansion` = FZ I Thm 3.1 + FZ II Prop 11.2 (geometric type, frozen exponents ≥ 0); `somos4_exists_pos_nat` = §2.4; `finite_clusterVariables_iff` = FZ II Thm 1.8 (ii)⟺(iv) with (iv) read through Thm 8.6 (any orientation of a Dynkin diagram is mutation equivalent to a bipartite one); `exists_isFiniteType_iff_forall_le_three` = (iv)⟺(iii); `exists_nonneg_laurentExpansion` = GHKK Thm 4.10; `cVector_signCoherent` = GHKK Cor 5.5.

**Adversarial table** (values computed on both sides).

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `matrixMutation` vs FZ rule | `(b_ik,b_kj) = (1,1),(−1,−1),(1,−1)` | `[b_ik]_+[b_kj]_+ − [−b_ik]_+[−b_kj]_+` = `1, −1, 0` | FZ (1.4) | agree |
| `ExchangeMatrix.symmetrized` on the diagonal | `i = j` | `s_i b_ii` | `−s_i b_ii`, `s_i > 0` | `b_ii = 0` forced (§1.1) |
| §2.4 Somos-4 matrix pattern | 8 mutations at `k_n = n mod 4` | column `k_n` = `(0,1,−2,1)` at `(k_n,k_{n+1},k_{n+2},k_{n+3})`; entry `(i,j)` after `n` steps | initial `(i−n, j−n)` | agree at all 8 steps |
| §2.4 Somos-4 values | `clusterMutation` iterated from `x = (1,1,1,1)` | `1,1,1,1,2,3,7,23,59` | recurrence `a_{n+4} = (a_{n+1}a_{n+3}+a_{n+2}²)/a_n` | agree; `somos4_exists_pos_nat` consistent |
| §2.3 coefficient-free `A₂` | `B = ((0,1),(−1,0))`, all words ≤ 6, `x = (2,5)` | reached values `{2, 5, 3, 4/5, 3/5}` | `x₁, x₂, (1+x₂)/x₁, (1+x₁+x₂)/(x₁x₂), (1+x₁)/x₂` | 5 variables, `finite_clusterVariables_iff` ⇐ `A(B)` = `A₂` |
| `cVector_signCoherent` | `B = ((0,1),(−2,0))`, `((0,2),(−2,0))`, 3-cycle `((0,1,−1),(−1,0,1),(1,−1,0))`; 300 random words of length ≤ 7 each | columns of `C_t` | sign-coherent | 0 violations |
| §5.3 duality check | `B = ((0,1),(−2,0))`, `D_s = diag(2,1)`, `μ_1` | `C' = ((−1,1),(0,1))`, `g'_1 = −e_1 + G[b_{•1}]_+ − B₀[c_1]_+ = (−1,2)`, `G' = ((−1,0),(2,1))` | `G'ᵀD_sC' = diag(2,1)` | agree |
| §2.1 pairwise-independence check | 3-cycle matrix, `μ_1` | `μ_1B = ((0,−1,1),(1,0,0),(−1,0,0))` | columns 2, 3 = `(−1,0,0)`, `(1,0,0)` | opposite, as claimed; BFZ Lemma 3.1 confirms coprimality fails exactly for odd-ratio proportional columns |
| `(0,2;−2,0)` infinite type | word `1,2,1,2,…` at `x = (2,3)` | `5, 26/3, 137/9, 725/27, 3842/81, …` | distinct | infinitely many variables while `[B] = {±B}` is finite, as §4.2's Check says |
| §2.6 reversal check | `u = 1`, `B = ((0,3),(−3,0))`, `H = 1+2T+T³`, `β_1 = (0,−1)` | `x' = x⁻¹Σ_l h_l y^{3−l} = (y³+2y²+1)/x`; reversed `H' = 1+2T²+T³`: `x'' = (1+2y²+y³)/x' = x` | unreversed: `x'' = x(y³+2y+1)/(y³+2y²+1)`, `gcd(y³+2y+1, y³+2y²+1) = 1` (difference `2y(1−y)`, neither vanishes at `0, 1`) | agree, not Laurent |
| §2.6 endpoint check | `B = ((0,1),(−1,0))`, `H_1 = 1+T`, `H_2 = 1+2T`, word `1,2,1` | `x' = (1+y)/x`, `y' = (x'+2)/y`, `x''' = (y'+1)/x' = (1+y+2x+xy)/(y(1+y))` | `1/y + x(y+2)/(y(y+1))` | agree, not Laurent |
| §2.1 Q1 `u`-powers | `(u^νM(β))^lM(α)` | exponent `lν − lΛ(β,e_k) + lrΛ(β,[−β]_+)` | `Λ(β,[−β]_+) = (w_k/r)([−β]_+)_k = 0` (`b_kk = 0`) | `X'_k = H(u^νM(β))M(α)` |
| §2.1 `r_kν_k = w_k` | compatibility `Σ_i b_ik Λ_il = w_k δ_{l,row k}` | `r_kΛ(β_k,e_k) = Λ(b_{•k},e_k)` | `w_k` | agree |
| §2.1 rank-one quantum | `Λ = ((0,−1),(1,0))`, `B̃ = (0,1)ᵀ` | `B̃ᵀΛ = (1,0) = (w_1, 0)`; `X_1X'_1 = 1 + v^{Λ_12}X_2`, `X'_1X_1 = 1 + v^{Λ_21}X_2` | `1 + v⁻¹X_2`, `1 + vX_2` | agree |
| §1.5 principal pair | `Λ_pr = ((0,−D),(D,BᵀD))` | `B̃_prᵀΛ_pr = (D, −BᵀD + BᵀD)` | `(D, 0)`; `BᵀD = −DB` skew | compatible, alternating |
| §2.6 degree-compatible pair | `V = diag(d_k/r_k)` | `(Bᵀ, D_r)Λ_pr = (D_rV, −BᵀV + BᵀV) = (D_d, 0)`; block entry `(i,j)` = `b_ji(d_j/r_j)/r_i` | integral by `r_i ∣ b_ji`, `r_j ∣ d_j`; skew by `d_jb_ji = −d_ib_ij` | agree |
| §0.5 one-exchange check | `xz = v²zx`, `E = 1+z`, `y = Ex⁻¹` | `y² = Eσ⁻¹(E)x⁻²`, `σ⁻¹(z) = x⁻¹zx = v⁻²z` | `(1+z)(1+v⁻²z)x⁻²` | agree |
| §0.6 separated-factor intersection | `f = g = 2` over `ℤ/4` | `(2)∩(2) = (2)` | `(fg) = 0` | fails without unit leading coefficient, as the Check says |
| §0.6 ideal-criterion check | `D = ℤ[√−5]`, `E = 2`, `F = 1+√−5` | `6 = 2·3 = (1+√−5)(1−√−5) ∈ (E)∩(F)` | `6/(EF) = (1−√−5)/2 ∉ D` | agree |
| §3 lattice check | `d = (1,2)`, `{e_1,e_2} = −1` | `ε = ((0,−2),(1,0)) = Bᵀ`, `s = L/d = (2,1)`, `p_1^*(e_1) = {e_1,d_2e_2}f_2 = −2f_2` | `T_1(f_1) = f_1 − 2f_2`, `T_1(−f_1) = −f_1`; `s_1b_12 = 2 = −s_2b_21` | agree |
| §3.4 Poisson check | `λ((0,e_1),(e_1^*,0))` | `⟨e_1,e_1^*⟩ − 0 − β(e_1,0)` | `1` | agree even with `β = 0` |
| §4.1 `D_sA(B)` symmetric | `a_ij = −|b_ij|` | `s_i|b_ij|` | `s_j|b_ji|` | agree from `s_ib_ij = −s_jb_ji` |
| §4.2 counts | `A₂, B₂, G₂, A₁×A₁` | `n + |Φ_+|` | `5, 6, 8, 4` | agree |
| §5.3 `F`-recurrence with sign | `ε = sign(c_{k;t})`, both signs | `u^{[c]_+}∏F^{[b]_+} + u^{[−c]_+}∏F^{[−b]_+}` | `u^{|c|}∏F^{[εb]_+} + ∏F^{[−εb]_+}` | agree in both cases |
| §1.2 zero-column admissibility is mutation invariant | zero column `k` | `y'_k = y_k⁻¹`, `φ(y_k⁻¹)+1 ≠ 0 ⟺ φ(y_k)+1 ≠ 0`; row `k` zero so `y'_j = y_j`, other columns unchanged | invariant | agree |
| Lean headlines in characteristic 2 with a zero column | `K = Unit`, `B = 0`, `F = 𝔽₂(x)` | `x' = 2/x = 0`, never used again (row `k` zero) | `f = 0` witnesses every expansion; `{x, 0}` finite; `A(0)` finite type | statements hold, no junk reaches another coordinate |
| Lean headlines in rank 0 | `K` empty | `clusterVariables = ∅`, `cartanCompanion` empty, `IsFiniteType` vacuous, condition 3 vacuous | both sides true | agree |
| `CoefficientSemifield` torsion-free | `p^n = 1` | `(1⊕p⊕…⊕p^{n−1})p` | same sum | `p = 1`, §0.1's claim |

**Headline/padding probe.** One-tactic probe on the 3 sorried API lemmas and 2 sampled headlines: none closes (`simp`, `rfl`); see R04.

## Not verifiable

- none in the sample: every text cited in §§2.1–2.6 was readable from arXiv or Numdam. Ownership against open pull requests was checked through `roadmaps grep` over all 467 heads and the sibling checkouts; `scratch/overlaps.md` lists ScatteringDiagrams #1134 as the only close roadmap.

## Source issues

- none
