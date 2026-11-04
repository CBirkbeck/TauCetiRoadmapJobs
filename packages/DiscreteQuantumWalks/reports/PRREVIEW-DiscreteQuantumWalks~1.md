# Review of DiscreteQuantumWalks (pull request #259 at 7904ea4)

**Verdict:** needs changes

The push gate fails at this head (sorry'd data, three import rules, no targets, no `metadata.toml`; the targeted build itself passes). Two blocking principle findings (sorry'd data, computational procedures as targets), six P2 findings, three P3 notes. The mathematics that is stated is correct where it is checkable; the problem is that almost nothing is stated precisely enough to check, and what Suggested.lean states is not the roadmap's headlines.

## R01 (P1) — `szegedyWalk` is sorry'd data

Location: `TauCetiRoadmap/DiscreteQuantumWalks/Suggested.lean` lines 29–30, "noncomputable def szegedyWalk (P : Matrix.rowStochastic ℝ V) : Matrix (V × V) (V × V) ℂ := sorry".

Claim: the roadmap's only genuine object in the acceptance test is a `def` whose body is `sorry`; `szegedyWalk_unitary` (line 33) mentions it, so the headline is vacuous (any body would do). The gate rule `sorry-data` fails on it.

Witness: gate.md, rule sorry-data, line 29. The body is not heavy: every ingredient exists at the pin. On a scratch copy I elaborated, with `import Mathlib` and no errors,

```lean
noncomputable def sqrtIsometry (P : Matrix.rowStochastic ℝ V) : Matrix (V × V) V ℂ :=
  fun xy x' => if xy.1 = x' then (Real.sqrt ((P : Matrix V V ℝ) xy.1 xy.2) : ℂ) else 0
def swap : Matrix (V × V) (V × V) ℂ := fun ab cd => if ab = cd.swap then 1 else 0
noncomputable def reflA (P : Matrix.rowStochastic ℝ V) : Matrix (V × V) (V × V) ℂ :=
  2 • (sqrtIsometry P * (sqrtIsometry P)ᴴ) - 1
noncomputable def szegedyWalk (P : Matrix.rowStochastic ℝ V) : Matrix (V × V) (V × V) ℂ :=
  (swap * reflA P * swap) * reflA P
```

This is Szegedy's `µ = (2R − I)(2C − I)` (szegedy2004 line 194–195) with the README's Convention 1 order (second reflection on the left). Numerically `Wᴴ W − 1` has entries `0` for the three chains in the table below.

Repair: give `szegedyWalk` this body (or an equivalent one with a real body), and then also state the discriminant as `(sqrtIsometry P)ᴴ * swap * sqrtIsometry P` or keep the entry formula and make `D = Aᴴ S A` a README target (Convention 6 says the discriminant "is computed from the two isometries", but line 37–38 defines it by the entry formula).

## R02 (P1) — Layer 6 plans computational procedures

Location: `TauCetiRoadmap/DiscreteQuantumWalks/README.md` lines 181–183, "Add computable finite constructors, exact small-matrix evaluation and decision procedures for fixed-step transfer/periodicity. Prove soundness of the procedures".

Claim: decision procedures and exact evaluation routines are algorithms, which the roadmap contract excludes ("Mathematics, not algorithms: no executable procedures, certificates, implementations or large computations").

Witness: the quoted sentence; nothing else in Layer 6 depends on it (the family theorems in lines 176–179 are mathematics).

Repair: delete lines 181–183. The small evaluations (identity, swap, phase diagonal, three-cycle, two-state chains) belong in `**Checks.**` bullets of the definitions they test, not as procedures.

## R03 (P2) — objects owned elsewhere are planned again

Location: README line 144, "strong lumpability of a stochastic matrix and its quotient row-stochastic matrix"; line 87, "invariant subspaces, compressions and exact reduction of all powers through an intertwiner"; Suggested.lean line 19, `IsUnitary`; README line 47, "prove the finite-square converse `UUᴴ=1`"; line 85, "doubly-stochastic probability matrices".

Claim: each of these is already owned.

Witness:
- EquitableOperatorReduction (open pull request, same author) Layer 5, line 187–188 of its README: "Mathlib row-stochastic and column-stochastic matrices, strong lumpability, and the induced quotient chain"; its Layer 3, line 154 and 160–161: `A^n E = E Q^n`, "stated for an arbitrary isometric intertwiner". This README even says it consumes that roadmap for "exact powers of intertwined matrices" (line 30–31) and then plans them in Layer 0.
- `IsUnitary U` is `star U * U = 1`, which is `Matrix.mem_unitaryGroup_iff'` at `Mathlib/LinearAlgebra/UnitaryGroup.lean:76`; on the scratch copy `rw [Matrix.mem_unitaryGroup_iff']; rfl` proves `IsUnitary U ↔ U ∈ Matrix.unitaryGroup V ℂ`.
- The converse `UUᴴ = 1` is `mul_eq_one_comm` through the `IsDedekindFiniteMonoid` instance for square matrices over a stably finite ring, `Mathlib/Data/Matrix/Mul.lean:583` (`ℂ` is a field, hence stably finite); `Matrix.unitaryGroup` already carries both equations.
- `Matrix.doublyStochastic` exists at `Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean:42`.

Repair: delete the lumpability and intertwiner-power targets and cite EquitableOperatorReduction Layer 5 and Layer 3 in `## Exact supplier contracts` and the `*Needs:*` lines; delete `IsUnitary` and state `szegedyWalk P ∈ Matrix.unitaryGroup (V × V) ℂ`; list `Matrix.unitaryGroup`, `Matrix.mem_unitaryGroup_iff'`, `mul_eq_one_comm`, `Matrix.doublyStochastic` under `From Mathlib`; keep only the statements that are new (the transition-probability matrix of a unitary is doubly stochastic is new and stays).

## R04 (P2) — suppliers cited by pull-request number, no section, no `*Needs:*` edge

Location: README lines 29, 72, 75 and the link target on line 218, "[equitable-roadmap]: https://github.com/TauCetiProject/TauCetiRoadmap/pull/257"; "the finite spectral quantum-walk roadmap" (line 75) is never named.

Claim: cross-roadmap citations must name the roadmap and its section, never a pull-request number; and the dependency must appear in `*Needs:*` lines so the dependency check can order this roadmap after its suppliers.

Witness: `roadmaps list` resolves these to EquitableOperatorReduction (#257) and SpectralQuantumWalks (#258); neither appears in the merge order (grep of the candidate order finds only `DiscreteQuantumWalks` at line 353). The dependency check output is `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`: zero problems because this README contributes zero edges, so nothing stops it being merged before either supplier.

Repair: in `## Exact supplier contracts`, subsections `From TauCetiRoadmap.EquitableOperatorReduction` (Layer 0 normalized cell embedding, Layer 2 compression `Eᴴ A E`, Layer 3 powers of an intertwined operator, Layer 5 stochastic adapters) and `From TauCetiRoadmap.SpectralQuantumWalks` (Layer 7 families: cycles, complete graphs, hypercubes), and `*Needs:*` items "EquitableOperatorReduction Layer 3" etc. on every target that uses them. Remove the two URL footnotes.

## R05 (P2) — PST equivalence stated without unitarity

Location: README lines 44–45, "PST from `u` to `v` at step `n` means `U^n e_u = γ e_v` for a unit phase, with the unit-amplitude formulation proved equivalent"; Suggested.lean lines 25–26, `HasPSTAt U u v n := ‖evolution U n v u‖ = 1` for an arbitrary `U : Matrix V V ℂ`.

Claim: the two formulations are equivalent only for norm-preserving `U`; the Lean predicate is the amplitude form on arbitrary matrices.

Witness: `U = Matrix.of fun _ _ : Fin 2 => (1 : ℂ)`, `n = 1`. On the scratch copy `simp [HasPSTAt, evolution]` proves both `HasPSTAt U 0 0 1` and `HasPSTAt U 0 1 1`, but `U e_0 = (1, 1)` is no multiple of a basis vector, so phase-equality PST fails for both pairs. SpectralQuantumWalks Convention 3 states the same equivalence "using unitarity"; this README dropped the hypothesis.

Repair: state the equivalence as "for `U ∈ Matrix.unitaryGroup V ℂ`, `HasPSTAt U u v n ↔ ∃ γ, ‖γ‖ = 1 ∧ (U ^ n) *ᵥ Pi.single u 1 = γ • Pi.single v 1`", and add the all-ones matrix as a negative-control Check.

## R06 (P2) — "the Joukowsky/cosine spectral map" names two different maps and states neither

Location: README line 116, "the Joukowsky/cosine spectral map from discriminant eigenvalues to walk eigenphases"; line 133, "the invariant two-dimensional block and full spectral mapping, including exceptional spaces"; line 117, "the exceptional `±1` eigenspaces with correct multiplicities".

Claim: no formula, hypothesis or multiplicity is given, and the two layers need different formulas. For the coined one-step walk `U = S C` with Grover coin the eigenphases are `e^{±iθ}` with `cos θ = λ` an eigenvalue of the discriminant; for the Szegedy step `W = R_B R_A = (S R_A)²` of Convention 1 they are `e^{±2iθ}` with `cos θ = λ_D` (Szegedy's Theorem 1, szegedy2004 line 260–263, for the product of two reflections), and the exceptional eigenvalue is `+1` on `(A + B)^⊥` and `−1` on `A ∩ B^⊥` plus `B ∩ A^⊥`.

Witness (computed with the body of R01): complete-mixing two-state chain `P = [[1/2,1/2],[1/2,1/2]]`, `D = [[1/2,1/2],[1/2,1/2]]`, eigenvalues of `D`: `1, 0`. Traces of `W, W², W³, W⁴` are `0, 4, 0, 4`, i.e. spectrum `{1, 1, −1, −1}`: `λ = 0` gives `θ = π/2` and `e^{±2iθ} = −1` twice, `λ = 1` gives `1` on `A ∩ B`, and `(A+B)^⊥` has dimension `4 − 3 = 1` with eigenvalue `+1`. The one-step map `e^{±iθ}` would predict `{1, 1, i, −i}` with traces `2, 0, 2, 4`. Second check: `P = [[3/4,1/4],[1/2,1/2]]`, `D` eigenvalues `1, 1/4`; traces `1/4, 49/16, …` agree with eigenvalues `1, 1, −7/8 ± i√15/8` (`cos 2θ = 2/16 − 1`). Third: the three-cycle permutation, `D = 0` (szegedy2004 line 323–324 says the same), spectrum `−1` with multiplicity `6` and `+1` with multiplicity `3`, traces `−3, 9, −3, 9`.

Repair: state each map as a theorem with its formula and hypotheses: Layer 2 (coined, Grover coin, regular or arbitrary finite graph via `D = Aᴴ S A`): `U` has eigenvalues `λ ± i√(1−λ²)` for each eigenvalue `λ` of the discriminant with `|λ| < 1`, plus `±1` with stated multiplicities in terms of `|E|`, `|V|` and bipartiteness; Layer 3 (Szegedy): `W` has eigenvalues `2λ² − 1 ± 2iλ√(1−λ²)`, plus `+1` on `(A+B)^⊥`. Add the complete-mixing chain above as the Check that separates the two maps.

## R07 (P2) — no targets, hypotheses, locators or Checks anywhere

Location: README lines 78–183 (every layer), lines 210–216 (References).

Claim: the README is a list of topics, not a specification. There is no `### k.n` subsection, no `*Needs:*` line, no `**Checks.**` list, no hypothesis on any theorem, and no theorem number or page anywhere (the five references carry no locators, there is no `sources.toml`). The gate's `target-ids` rule fails for this reason. Also missing against the house shape: a `**Summary.**` paragraph, `## Scope and ownership`, `## Conventions` (present), `## Exact supplier contracts`, `## How to read the build`, `### Examples` and `### Dependencies` per layer, `## Downstream consumers`.

Witness: gate.md rule target-ids, line 78: "layered README states no targets". Compare `TauCetiRoadmap/AbhyankarLemma/README.md` on main (lines 130–160: `### 0.1 …`, prose with locators, `*Needs:*`, `**Checks.**`). Concrete instances of missing hypotheses: line 118 "characteristic-polynomial and spectrum formulas for finite regular graphs" (which coin, connected or not, which multiplicity formula); line 134 "the reversible-chain specialization and relation to the symmetrized Markov operator" (the relation is `D = Π^{1/2} P Π^{−1/2}` only when `P` is reversible with respect to a strictly positive stationary `π`; two-state witness: `π = (2/3, 1/3)` for `P = [[3/4,1/4],[1/2,1/2]]` gives `√(π₁/π₂) P₁₂ = √2 · 1/4 = √(1/8) = D₁₂`); line 132 "norm bound" (which norm, `≤ 1`: szegedy2004 Lemma 5, line 891).

Repair: rewrite every layer in the house shape: one `### k.n` per definition or theorem, each definition with its API bullets and at least three discriminating Checks, each theorem with its hypotheses and a locator (Szegedy 2004 Def. 1, Def. 2, Section 6 and Theorem 1 for Layer 3; Kempe or Portugal with chapter and page for the coined walk; a primary source for the coined spectral mapping), and a `sources.toml` recording each cited work.

## R08 (P2) — the statable headline theorems are absent from Suggested.lean

Location: Suggested.lean lines 4–10 (module docstring) and 33–34 (the only theorem that is not padding).

Claim: the roadmap's headlines are the Szegedy spectral mapping theorem, the coined Grover-walk spectral mapping, the cell-uniform PST/mixing equivalence with the compressed walk, and the search/hitting theorems. With the body of R01 the Szegedy spectral mapping is statable at the pins (`Matrix.IsHermitian.eigenvalues` at `Mathlib/Analysis/Matrix/Spectrum.lean:60`, `Module.End.HasEigenvalue` on `Matrix.toLin' (szegedyWalk P)`); it is not stated. The others are not statable without EquitableOperatorReduction's carriers or a coined-walk definition, and the docstring does not say so.

Witness: the file's only sorried theorems are `szegedyWalk_unitary` (about a sorry'd body) and the one-tactic `szegedyDiscriminant_isHermitian`.

Repair: after R01, state for `hD : (szegedyDiscriminant P).IsHermitian` and every `x : V`: `Module.End.HasEigenvalue (Matrix.toLin' (szegedyWalk P)) (2λ² − 1 + 2 i λ √(1 − λ²))` with `λ = hD.eigenvalues x`, and the exceptional statement `∀ v, (sqrtIsometry P)ᴴ *ᵥ v = 0 → (sqrtIsometry P)ᴴ *ᵥ (swap *ᵥ v) = 0 → szegedyWalk P *ᵥ v = v`. Name the coined mapping, the cell-uniform equivalence and the hitting theorem in the module docstring as not statable, each with the carrier it lacks. Give the docstring the form "…: target signatures" with the sentence that the roadmap is README.md.

## R09 (P3) — padding

Location: Suggested.lean lines 21–22 (`evolution`), 40–42 (`szegedyDiscriminant_isHermitian`).

Witness: on the scratch copy `szegedyDiscriminant_isHermitian` closes with `ext i j; simp [szegedyDiscriminant, Matrix.conjTranspose_apply, mul_comm]`; `evolution U n` is `U ^ n` by definition and no headline uses it.

Repair: delete both from `Suggested.lean` (the README keeps Hermiticity as a target and `U^n` as Convention 2); write `(U ^ n) v u` in `HasPSTAt` if it is kept.

## R10 (P3) — gate: imports, missing `metadata.toml`

Location: Suggested.lean lines 1–2; the folder `TauCetiRoadmap/DiscreteQuantumWalks/`.

Witness: gate.md rules imports, mathlib-subimports, no-import-mathlib (lines 1–2) and metadata ("metadata.toml missing"). Every roadmap on main carries one, e.g. `TauCetiRoadmap/OptimalTransport/metadata.toml` with the line `topic = "math.OC"`.

Repair: replace lines 1–2 by the single line `import Mathlib`; add `metadata.toml` with `topic = "quant-ph"` or the MSC class the project uses for the folder (`math.CO` is the other candidate).

## R11 (P3) — process narrative and non-timeless text

Location: README lines 6 ("currently lacks"), 15–16 ("Suggested home: …" paths), 196–208 ("The Graphplay author is coordinating this roadmap and permits adaptation", "intentionally excluded"), 218 (pull-request URL).

Repair: keep provenance as a `## Provenance` sentence naming the repository and commit without the coordination narrative; drop "currently", "Suggested home" and "intentionally"; the licence remark belongs in the pull request, not the roadmap.

## Verified sound

Adversarial table (every statement of the file and the checkable README claims; `W` is the walk of R01, `D = szegedyDiscriminant P`):

| statement | instances tried | values on each side | result | change |
|---|---|---|---|---|
| `IsUnitary` (l.19) | `V` empty; `V = Fin 1`, `U = [i]`, `U = [2]` | empty: `1 = 1` both sides; `[−i]·[i] = [1]` holds; `[2]·[2] = [4] ≠ 1` excluded | correct; equals `U ∈ Matrix.unitaryGroup V ℂ` by `mem_unitaryGroup_iff'` + `rfl` | R03: delete, cite |
| `evolution` (l.22) | `n = 0`; swap matrix, `n = 2` | `U^0 = 1`; `swap² = 1` | restates `U ^ n` | R09 |
| `HasPSTAt` (l.25) | swap, `u=0,v=1,n=1`; swap `u=v=0`; `diag(1,i)`, `u=v=1`, `n=1`; all-ones 2×2, `n=1` | `|U 1 0| = 1` holds; `|U 0 0| = 0` fails; `|i| = 1` holds; all-ones: `|U 0 0| = |U 1 0| = 1` both hold while `U e_0 = (1,1)` | orientation `(v,u)` matches Convention 2 and SpectralQuantumWalks Convention 1; equivalence with phase form false without unitarity | R05 |
| `szegedyDiscriminant` (l.37) | `P = [[3/4,1/4],[1/2,1/2]]`; `P` = 3-cycle; `V = Fin 1` | `D = [[3/4, √(1/8)],[√(1/8), 1/2]]`, eigenvalues `1, 1/4`; `D = 0`; `D = [1]` | matches szegedy2004 line 316–318 (`√(P ∘ Pᵀ)`) and line 324 (zero for a cyclic permutation); wrong model `D = P` excluded (`P₁₂ = 1/4 ≠ √(1/8)`) | none |
| `szegedyDiscriminant_isHermitian` (l.41) | one-tactic probe | `ext; simp [..., mul_comm]` closes | true, padding | R09 |
| `szegedyWalk_unitary` (l.33) | `W` of R01 on the three chains | `max |(WᴴW − 1)ᵢⱼ| = 0` for all three | true for the R01 body; vacuous for the `sorry` body | R01 |
| discriminant norm bound (README l.132) | two-state `P` with `a, b` | eigenvalues `1` and `1 − a − b ∈ [−1, 1]` | agrees with szegedy2004 Lemma 5 (line 891) | R07: state the norm and cite |
| reversible specialization (l.134) | `P = [[3/4,1/4],[1/2,1/2]]`, `π = (2/3,1/3)` | `√(π₁/π₂) P₁₂ = √(1/8) = D₁₂`, `√(π₂/π₁) P₂₁ = √(1/8) = D₂₁` | agrees; needs `π > 0` and reversibility as hypotheses | R07 |
| Szegedy spectral map (l.133) | complete mixing; nonsymmetric; 3-cycle | traces `0,4,0,4` ↔ `{1,1,−1,−1}`; `1/4, 49/16` ↔ `{1,1,−7/8 ± i√15/8}`; `−3,9,−3,9` ↔ `{+1×3, −1×6}` | double-angle `e^{±2iθ}`, `cos θ = λ_D`, `+1` on `(A+B)^⊥` | R06 |
| coined map (l.116) vs Szegedy map | same chains | one-step prediction `{1,1,i,−i}`, traces `2,0,2,4` ≠ observed | the two layers need different formulas | R06 |
| `D = Aᴴ S A` entry formula (l.132) | symbolic, `A (x,y) x' = δ_{x x'} √P_{xy}`, `S (a,b),(c,d) = δ_{(a,b),(d,c)}` | `(AᴴSA)_{x x''} = √P_{x x''} √P_{x'' x}` | agrees with l.37–38 | none |
| Convention 4 "zero rows impossible" | `mem_rowStochastic_iff_sum` (Stochastic.lean:46, 60) | every row sums to `1` | holds; `V` empty allowed (vacuous) | none |
| Convention 3 converse `UUᴴ = 1` | `mul_eq_one_comm`, instance `Data/Matrix/Mul.lean:583` | Mathlib has it for square matrices over a stably finite ring | duplicate | R03 |
| Layer 4 lumpability / Layer 0 powers | EquitableOperatorReduction README lines 154, 160, 187 | owned there | two owners | R03 |

Library declarations opened at the pin: `Matrix.unitaryGroup`, `Matrix.mem_unitaryGroup_iff` (line 72), `Matrix.mem_unitaryGroup_iff'` (line 76) in `Mathlib/LinearAlgebra/UnitaryGroup.lean`; `Matrix.rowStochastic` (line 46) and `Matrix.mem_rowStochastic_iff_sum` in `Mathlib/LinearAlgebra/Matrix/Stochastic.lean`; `Matrix.IsHermitian` (`Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44`); `Matrix.IsHermitian.eigenvalues` (line 60) and `spectral_theorem` (line 136) in `Mathlib/Analysis/Matrix/Spectrum.lean`; `Matrix.kroneckerMap` (`Mathlib/LinearAlgebra/Matrix/Kronecker.lean`); `SimpleGraph.Dart` (`Mathlib/Combinatorics/SimpleGraph/Dart.lean:27`); `Matrix.doublyStochastic` (`Mathlib/Analysis/Convex/DoublyStochasticMatrix.lean:42`); `mul_eq_one_comm` (`Mathlib/Algebra/Group/Defs.lean:373`) with the matrix instance at `Mathlib/Data/Matrix/Mul.lean:583`. Tau Ceti at the pin has nothing on quantum walks, Szegedy walks, stochastic matrices or lumpability (grep of `TauCeti/` for those words: only `ContRepresentation.IsUnitary`, a different object).

Signatures: the seven elaborated types in the worker's signature file were compared with the README; none lost a binder (`V`, `Fintype V`, `DecidableEq V` are the only section variables and all appear).

Cross-roadmap citations resolved: "equitable operator-reduction roadmap" → EquitableOperatorReduction at the head of its open pull request (read with `roadmaps show`); "finite spectral quantum-walk roadmap" → SpectralQuantumWalks at the head of its open pull request. Ownership: `roadmaps grep` for Szegedy, quantum walk, rowStochastic and unitaryGroup over main and all open heads finds no other owner of discrete-time walks; SpectralQuantumWalks line 40 explicitly disowns coined and Szegedy walks, so this roadmap is the owner of the unitary-step dynamics. StructuredBlockOperators (#260) could not be read beyond its grep hit and was not checked for overlap with Layer 0.

Dependency check output: `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)` (no UPWARD or CYCLE line; see R04 for why zero problems is not reassuring here).

Gate: FAIL at this head, rules sorry-data, imports, mathlib-subimports, no-import-mathlib, target-ids, metadata; build passes.

Source checked: szegedy2004 (arXiv quant-ph/0401053, fetched from arXiv): Definition 1 (line 194–195), Definition 2 (line 202–208), Section 6 half discriminant (line 309–324), Theorem 1 (line 260–263), Lemma 5 (line 891). All Layer 3 claims that can be matched to it agree.

## Not verifiable

- Seeded sample: the README has no `### k.n` targets and no locators, so the worker's sample of 15 is empty; every checkable claim was checked instead as above.
- Kempe, *Quantum random walks: an introductory overview*; Ambainis et al.; Doliwa et al.: cited without locator (no theorem, section or page), so nothing could be checked against them.
- Portugal, *Quantum Walks and Search Algorithms*: a paywalled book, cited without locator; not read.
- The Graphplay repository (provenance only): not read; its correctness is not a review input.
- Ownership against open pull requests whose files the brief does not give: checked only through `roadmaps grep`/`roadmaps show` for #257, #258, #260.

## Source issues

- none
