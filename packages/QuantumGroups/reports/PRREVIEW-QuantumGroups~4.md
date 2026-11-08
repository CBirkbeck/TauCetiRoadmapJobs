# Review of QuantumGroups (pull request #1705 at cb48124)

**Verdict:** needs changes

:robot: Independent AI review of the whole folder at `cb48124c127cf813cd250d61e83b69cf57b3728d` (a full review: 668 lines changed since `f852474`, the head the previous review read). No file of the pull request was changed. Nine findings, two blocking. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with `sorry` as its only warning. The blocking findings are structural: this head and the same author's open pull request #1649 (accepted at `968db79`) are two competing revisions of the same roadmap folder, and two headline theorems that are statable at the pins (and are stated in #1649) are absent here. The ribbon section Q9 named in the pull request's title no longer exists at this head, and no Part II folder was added in its place.

**Status of the previous review's findings (f852474 → cb48124).**

| Previous | Passage at this head | Status |
| --- | --- | --- |
| R01 (P1) admitted coproduct and PBW data | `Suggested.lean:247`, `:266`: `quantumSL2_existsUnique_comul` and `quantumSL2_exists_pbwBasis` are existential theorems; no `def` has a `sorry` body (gate `sorry-data=0`) | Repaired |
| R02 (P1) ribbon extension needs a Part II after its consumers of Q8 | Q9 is deleted from the README (title line 1 now says "rank-one representations"); no `QuantumGroupsPartII` folder exists in the pull request | Repaired by deletion; the pull request's own description still describes Q9 |
| R03 (P1) nonexistent KacMoody KM5 contract | No KacMoody or KM5 citation remains | Repaired by deletion |
| R04 (P1) TemperleyLiebOperatorAlgebras A1–A6 | Row deleted; the positive quotient is Q0.4 (`README.md:177`), algebraic inputs cite TemperleyLieb Layers 0–7 on main | Repaired (R04 below on its scope and locator) |
| R05 (P1) import header | `Suggested.lean:5`–`:9`: `module`, `public import Mathlib`, two `TauCeti.*` modules; gate `build=0` | Repaired (R07 below on one of the two modules) |
| R06 (P2) four upward edges | The four rows are gone; the dependency check prints `0 problem(s)` (output below) | Repaired |
| R07 (P2) missing headlines | Domain, centre, classification (three theorems) and finite complete reducibility are stated; the docstring names the unstatable Q1, Q2, Q4, Q6, Q7, Q8.5, Q8.6 items | Partly: R02 below |
| R08 (P3) API, Checks and dependencies per definition | Q0.1–Q0.5 have `*Needs:*` and `**Checks.**`; Q1–Q8 still have neither, and no layer ends with Examples and Dependencies | Partly: R08 below |
| R09 (P3) claim-level locators | Q0 carries locators; the new references (Murphy, Takesaki, Neshveyev–Tuset, Lance, Jones, Wenzl) are not in the references section | Partly: R06 below |
| R10 (P3) historical and process links | No blob or pull-request link remains (gate `blob=0`, `prnum=0`); AmenableGroups cited by Layers 1, 5, 7 | Repaired |
| R11 (P3) padding | `FiniteHopfModuleCat`, the forgetful functors and the zigzag theorem are gone | Repaired (R09 below on two proved API theorems) |
| R12 (P3) namespace, docstrings, names | `namespace TauCetiRoadmap.QuantumGroups`, a docstring on every declaration, layer comments; every Lean name appears in the README (26 of 26) | Repaired |

Locations are in `TauCetiRoadmap/QuantumGroups/` unless another roadmap is named. Sources are cited as `<id> line N` in the worker's cache: `bmt` (2f20dbc6, arXiv:math/0010248v1), `banica` (52e7df76, arXiv:math/9806063v5), `malacarne` (83cb08ae, arXiv:1602.04807v1), `virelizier` (8e108248, author page), `hiai` (a287a327, arXiv:2004.02383v1), `nt` (4789632e, Neshveyev–Tuset, author's university page, fetched by this review).

## R01 (P2) — One roadmap folder, two open revisions

**Location:** the whole folder; `README.md:75` ("## Q0. Operator-algebraic and unitary tensor-categorical inputs") and `Suggested.lean:47` ("namespace TauCetiRoadmap.QuantumGroups").

**Claim:** this head is the revision of the roadmap on main that owns the five analytic inputs and states the roadmap's acceptance test.

**Witness:** pull request #1649 (same author, same folder, accepted at `968db79`) already does both: its Layer 0 (`QuantumGroups/README.md:127`–`:378` at that head) owns the same five notions as Q0.1–Q0.5, it reflows Q1–Q8 into house shape, and its `Suggested.lean` declares 23 names in the same namespace. Nine fully qualified names are declared by both files with different statements or roles: `AlgebraicHaar`, `QuantumSL2`, `QuantumSL2Relation`, `SL2Generator`, `StarCompatibleHopf`, `quantumSL2Casimir`, `quantumSL2Generator`, `quantumSL2KUnit`, `schur_orthogonality`. Whichever merges second conflicts on every section of the README.

**Repair:** make the two revisions one. Rebase this pull request onto QuantumGroups as it stands at #1649's head and keep only what that head lacks (its Layer 8 already states the simple-module classification as `quantumSL2_simple_classification`, so the three classification theorems here are also covered; see R02 for what it has that this head lacks). If this pull request is meant to carry the ribbon extension its title names, add the `QuantumGroupsPartII` folder and leave the base roadmap's repairs to #1649. Tested on the instance that refuted the original: after the rebase the folder has one Q0/Layer 0 and one declaration per name.

## R02 (P2) — Two statable headlines are absent, and the docstring does not name them

**Location:** `Suggested.lean:26`–`:42` (the "Not statable at the pins" list) and `:330`–`:338` (`quantumSL2_isSemisimpleModule`); `README.md:868`–`:874` (Q8.4, "an arbitrary locally finite module is an algebraic direct sum of the signed finite simples") and `:461`–`:464` (Q4, "the equivalence between a normalized positive Haar integral, all finite comodules unitarizable, spanning by finite unitary coefficients").

**Claim:** the file states every headline statable at the pins and names the rest.

**Witness:** Q8.4's semisimplicity of locally finite modules is in the roadmap's summary (`README.md:9`–`:11`) and is statable now: a scratch file with the hypothesis `∀ v, FiniteDimensional ℂ ((Submodule.span (QuantumSL2 q) {v}).restrictScalars ℂ)` and conclusion `IsSemisimpleModule (QuantumSL2 q) V` elaborated at the pins with only a `sorry` warning. Q4's algebraic compact-type equivalence is stated at the same pins by #1649 as `compactType_iff` with a two-line definition `unitaryCoefficientSet` (`QuantumGroups/Suggested.lean:110`–`:122` at `968db79`). Neither is stated here, and the docstring names neither; it is also silent on Q3's modular identity, Woronowicz characters and Kac equivalences on the Hopf core, which are algebraic statements on `AlgebraicHaar`.

**Repair:** state `quantumSL2_isSemisimpleModule_of_locallyFinite` with the hypothesis above (no finite-dimensionality on `V`), and the compact-type equivalence on native comodules as in #1649; for Q3's modular statements either state them on `AlgebraicHaar` or name them in the docstring with what they lack (complex powers `F^z` of a positive matrix as a functional on the core). Checked on the instances: `V = 0` and `V = L₀⁻ ⊕ L₁⁺` (dimensions 0 and 1+2) satisfy the local-finiteness hypothesis and are semisimple; the Verma module of highest weight 1 at `q = 1/2` has `K`-weights `4^j` and infinite cyclic span, so it is excluded by the hypothesis, as it must be.

## R03 (P3) — A rescaled standard solution with |λ| = 1 is still standard

**Location:** `README.md:167`–`:170` (Q0.3, first Check: "a rescaled solution (λR, λ⁻¹R̄) with λ ≠ 1 still solves the conjugate equations but is not standard").

**Claim:** every rescaling by λ ≠ 1 destroys standardness.

**Witness:** standardness is `R*(ι⊗T)R = R̄*(T⊗ι)R̄` (`nt` line 1512, Theorem 2.2.14). Replacing `(R, R̄)` by `(λR, λ⁻¹R̄)` multiplies the left side by `|λ|²` and the right side by `|λ|⁻²`, so the rescaled pair is standard exactly when `|λ| = 1`. For `λ = −1` the pair `(−R, −R̄)` is standard; for `λ = i` likewise.

**Repair:** write "with |λ| ≠ 1 (for instance real λ > 1)". Tested: for `λ = 2` on `ℂⁿ` the two sides are `4n` and `n/4`, not standard, while `‖2R‖‖R̄/2‖ = n` is unchanged, which is the point the Check makes.

## R04 (P3) — Q0.4 states the root-of-unity range Q1–Q7 never use, and its locators are imprecise

**Location:** `README.md:181`–`:184` (Q0.4: "for δ ≥ 2 or δ = 2cos(π/(k+2)) with k ≥ 1 … its Bratteli diagram is the path model on ℕ, respectively on {0,…,k} (Jones; Wenzl; Neshveyev–Tuset Chapter 2)") against `README.md:77`–`:78` ("stated at the generality Q1–Q7 use them").

**Claim:** Q0.4 is stated at the generality the later layers use.

**Witness:** the only consumer is Q7 (`README.md:729`–`:741`), where the loop parameter is `d(u) ≥ n ≥ 2` (`‖E(1)‖²/|c| ≥ n`, `README.md:598`–`:599`); the range `δ = 2cos(π/(k+2))` is never used. Neshveyev–Tuset treat the Temperley–Lieb category in §2.5, not "Chapter 2" at large: `nt` lines 2488–2491 (printed p.54) state the admissible range as `d ≥ 2` or `d = 2cos(π/k)`, `k ≥ 4`, under their standing assumption `‖R‖ > 1` (line 2432), and lines 2556–2567 (p.55) define `TL_{d,τ}` with `d_i(U_{1/2}) = d`; the Bratteli-diagram and positivity statements are attributed there to Goodman–de la Harpe–Jones (`nt` line 5744). "Jones" and "Wenzl" carry no title, theorem or page.

**Repair:** restrict Q0.4 to `|δ| ≥ 2`, which is all Q7 needs, and leave the root-of-unity quotients to the Temperley–Lieb positivity roadmap in the scope paragraph (without supplier words); or keep the range and say so at `README.md:77`. Locate: Neshveyev–Tuset §2.5, pp.54–55, for the category and its sign `τ`; Jones, *Index for subfactors* (Invent. Math. 72, 1983), §4 for the admissible values (uncertified, paywalled); Wenzl, *On sequences of projections* (C. R. Math. Rep. Acad. Sci. Canada 9, 1987) for the Bratteli diagram, or Goodman–de la Harpe–Jones Chapter 2. Checked: at `n = 2`, `δ = 1` the Gram determinant `δ²(δ² − 1) = 0` and the quotient is one-dimensional as the Check says, so the `k = 1` case is consistent with Jones's range and is simply unused.

## R05 (P3) — Q3 consumes a canonical-weight comparison that Q0.2 does not state

**Location:** `README.md:449`–`:451` ("Consume Q0.2's Tomita theorem and canonical-weight comparison, and prove its recovered weight is this Haar vector state").

**Claim:** Q0.2 supplies a canonical weight on the left von Neumann algebra of a full left Hilbert algebra and its recovery.

**Witness:** Q0.2 (`README.md:118`–`:131`) defines the left Hilbert algebra, its left von Neumann algebra, `S = JΔ^(1/2)` and the full left Hilbert algebra, and proves Tomita's theorem and KMS uniqueness for a faithful normal state; no weight is defined or recovered. The sentence is a residue of the deleted VonNeumannAlgebras V11 row.

**Repair:** delete "and canonical-weight comparison, and prove its recovered weight is this Haar vector state"; the identification Q3 needs follows from what Q0.2 does state: the Haar vector state is faithful and normal on the von Neumann closure (`README.md:446`), `σ_t` extends to normal automorphisms and satisfies KMS (`:451`–`:454`), so KMS uniqueness identifies it with `Δ_h^(it)(·)Δ_h^(−it)`. Checked on the matrix model of Q0.2's first Check (`ρ = diag(1/3, 2/3)`, `x = e₁₂`, `y = e₂₁`): `φ(xy) = 1/3 = φ(y σ_(−i)(x))`, so the state-level KMS statement already pins the group.

## R06 (P3) — New references are not listed, and two Q0.3 locators point to the wrong section

**Location:** `README.md:1002`–`:1061` ("## Sources and API evidence"); `README.md:158`–`:162` (Q0.3, "(Neshveyev–Tuset, … Chapter 2, §2.2)" for `d(X) ≥ 1 with equality exactly for invertible X` and for the sign `ε`).

**Claim:** every cited work is in the references, and §2.2 supports every Q0.3 statement.

**Witness:** Murphy, Takesaki II, Neshveyev–Tuset, Lance, Jones and Wenzl are cited in Q0 and appear nowhere in the references section. In Neshveyev–Tuset, standard solutions and the intrinsic dimension are indeed §2.2 (`nt` lines 1427–1431 Definition 2.2.10, 1446–1454 Definition 2.2.12, 1501–1512 Theorem 2.2.14, 1596–1600 Theorem 2.2.17, printed pp.32–35), but the sign of a self-conjugate simple object is §2.5 (`nt` lines 2426–2431, p.52: `R̄ = −τR`, `τ = ±1`) and `d(U) ≥ 1` is §2.7 (`nt` lines 3236–3241, Definition 2.7.1, p.70), with the equality clause a consequence (`1 ⊂ U⊗Ū` and additivity).

**Repair:** add the six works to the references with the locators used in Q0 (Murphy §§3.3, 4.1; Takesaki II VI.1 and VIII.1; Neshveyev–Tuset §§2.2, 2.5, 2.7; Lance Chapters 2 and 4; Jones 1983; Wenzl 1987), and split the Q0.3 locator as above. In the same section, `README.md:1025` cites Malacarne "Lemmas 1.2,2.1,3.1–3.2": the text has Lemma 3.1 (`malacarne` line 235) and then Theorem 4.1 (line 285), no Lemma 3.2; cite "Lemmas 1.2, 2.1, 3.1 and the proof of Theorem 1.1, preprint pp.2–5". Note the sign convention: Neshveyev–Tuset normalise to `R̄ = −τR`, so their `τ` is `−ε` for the roadmap's `R̄ = εR`; the SU(2) Check (`ε = −1`) is `τ = +1` there.

## R07 (P3) — The second Tau Ceti import is not the module actually used

**Location:** `Suggested.lean:9` ("public import TauCeti.Algebra.Coalgebra.Comodule.LinearlyReductive").

**Claim:** the header imports only the individual Tau Ceti modules the file uses.

**Witness:** the file uses nothing from that module; it needs `TauCeti.Subcomodule` and its order (`schur_orthogonality`, `:131`), which live in `TauCeti/Algebra/Coalgebra/Subcomodule/Basic.lean` (`structure Subcomodule` at line 70, `PartialOrder` at 100, `BoundedOrder` at 232) and reach the file only through that module's transitive `public import`s. A scratch file importing `Mathlib` and `…MatrixCoefficient.FromMatrix` alone reports `Unknown identifier TauCeti.Subcomodule`.

**Repair:** replace the line by `public import TauCeti.Algebra.Coalgebra.Subcomodule.Basic` (the import #1649's file uses).

## R08 (P3) — Q1–Q8 still lack the per-target shape, and one process sentence remains

**Location:** `README.md:233`–`:1000` (Q1–Q8: no `*Needs:*` line, no `**Checks.**` block, no `### Examples`/`### Dependencies`); `README.md:1060` ("Integration of that external code requires author coordination; the definitions and theorem specifications here do not assume such integration").

**Claim:** the roadmap is in house shape.

**Witness:** only Q0.1–Q0.5 carry `*Needs:*` and Checks; Q8's seven items are a numbered list; the sentence at line 1060 is process narrative about a third-party repository.

**Repair:** as in the previous review's R08: reflow Q1–Q8 into `## Layer k` / `### k.n` prose with `*Needs:*` per target, at least three discriminating Checks per definition, and Examples and Dependencies per layer, without thinning the mathematics; delete the sentence at line 1060 (the mathematical comparison in the preceding sentences stays). #1649's head already has this shape for all of Q1–Q8, which is one more reason for R01's repair.

## R09 (P3) — Two proved API theorems are not acceptance tests

**Location:** `Suggested.lean:84`–`:98` (`coefficientMatrix_map_antipode_eq_star`) and `:103`–`:109` (`antipode_coefficient`).

**Claim:** these are headline statements the finished roadmap is tested against.

**Witness:** both are proved in place: the first in three `calc` steps from Tau Ceti's `Comodule.map_antipode_mul_coefficientMatrix` and `Unitary.mul_star_self_of_mem`, the second by one `simpa` from the first. Neither is a headline of Q3 (its headlines are Schur orthogonality, the Hopf core and the modular theory), and a theorem already proved tests nothing.

**Repair:** delete both from `Suggested.lean` and drop the two backticked names from `README.md:366`–`:367`, keeping the sentence "prove `S(u_ij) = u_ji*` from Tau Ceti's left-inverse equation `S(u)u = 1`" as a target. The four `sorry` statements of the Hopf-core section stay.

## Verified sound

**Scope, gate and build.** Head `cb48124c127cf813cd250d61e83b69cf57b3728d`; worktree clean; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/QuantumGroups'` is empty; `STATUS.md`, `PROGRESS.md`, `metadata.toml` unchanged from main. The content checkout equals its `origin/main` (`c9a16a04`); `.lake/packages` resolves to Mathlib `f6090c70` and Tau Ceti `358314d4`, the pins of `lake-manifest.json`. The worker's gate passes every check (`set_option=0`, `sorry-data=0`, `prnum=0`, `blob=0`, `readme-ids-missing=0`, `depcheck=0`, `build=0`, `stray-files=0`, `outside-folder=0`). `lake env lean TauCetiRoadmap/QuantumGroups/Suggested.lean` exits 0 with exactly 13 `declaration uses sorry` warnings (lines 66, 72, 130, 163, 185, 247, 266, 275, 283, 295, 313, 324, 333) and nothing else. No `set_option`, no `lemma`, no admitted `example`, no `#eval`, no copied passage, no computational algorithm, no LaTeX delimiter.

**Dependency check (unmodified output of the required command):**

```text
depcheck: 233 roadmaps, 2148 edges, 0 problem(s)
```

QuantumGroups is on main and is not listed in the merge order. Every supplier-table row and `*Needs:*` line names a roadmap on main (TemperleyLieb, RepresentationTheory/CompactGroups, RepresentationTheory/LieHighestWeight, OperatorAlgebraDynamics, FreeProbability, AmenableGroups, PivotalSpherical) or Mathlib, except CStarAlgebras, the new-folder pull request #860 by the same author, which is absent from the merge order and which the check therefore places after its last supplier (as the previous two reviews recorded; the brief lists no forbidden supplier).

**Padding probe and signatures.** A scratch copy with every `sorry` body replaced by `first | simp | infer_instance | rfl` produced 13 errors: no admitted statement closes in one tactic. The same copy carried `#check @name` for all 26 declarations; each elaborated type was compared with its README statement. The worker's six "dropped binder" leads are all `[StarModule ℂ A]`, omitted deliberately (`omit … in`) on `coefficientMatrix_map_antipode_eq_star`, `antipode_coefficient`, `AlgebraicHaar`, `freeOrthogonalRelation`, `suqMatrix`, `SUqRelations`: none of their statements uses scalar–star compatibility, and `schur_orthogonality`, `suqMatrix_unitary_iff` and `freeOrthogonalCup_invariant` retain it. The Q8 theorems retain `q ≠ 0`, the generic hypothesis, `IsScalarTower ℂ (QuantumSL2 q) V` and `FiniteDimensional ℂ V` where the README says finite-dimensional; `quantumSL2_exists_highestWeightVector` uses `finrank − 1` with `finrank ≥ 1` guaranteed by simplicity. `quantumSL2_existsUnique_comul` fixes `Δ(K⁻¹)` implicitly (an algebra map sends the unit `K⁻¹` to `(K⊗K)⁻¹`), so uniqueness holds among algebra maps.

**Headline coverage.**

| Headline (README) | At this head |
| --- | --- |
| Q0.1 finite-dimensional bicommutant | Statable (`#1649` states it as `weakClosure_eq_bicommutant`); an input, not an end theorem; not raised |
| Q1 Haar existence and uniqueness; Q2 decomposition and Peter–Weyl; Q4 completions and coamenability; Q5–Q7 universal C*-objects, fusion, Haar laws; Q6 reconstruction | Not statable (no `A ⊗_min A`, no free Hilbert module, no C*-tensor category at the pins); named in the docstring with the missing carrier |
| Q3 Schur orthogonality | Stated (`schur_orthogonality`) |
| Q3 modular identity, Woronowicz characters, Kac equivalences on the core | Neither stated nor named: R02 |
| Q4.1 algebraic compact-type equivalence | Statable (stated in #1649), absent: R02 |
| Q8.1 coproduct, PBW, domain; Q8.2 classification; Q8.3 centre, finite complete reducibility | Stated (eight theorems) |
| Q8.4 locally finite ⇒ semisimple; local-finiteness criterion | Statable (scratch elaboration), absent: R02 |
| Q8.5 Clebsch–Gordan, 6j, pivotal structure; Q8.6 SUq(2) comparison; Q8.7 classical comparison | Named in the docstring (need the monoidal/rigid structure the roadmap constructs); Q8.7 is a comparison with native `IsSl2Triple` data and could be stated, but it is a Check-level specialisation, not raised |

**Computed adversarial pass.** `q = 1/2` unless stated; `u = [[a, −qc*],[c, a*]]` with indices 0, 1; `F = [[0,1],[−2,0]]` for `O_F^+`. "Pass" means both sides agree on the instance; it certifies the instance, not the general theorem. Rows cover Q0 (new), every Lean statement, the seeded sample below and every passage a finding touches, plus recomputed rows for the unchanged Q1–Q8 statements that the Lean file or Q0 depend on.

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Q0.1 state space | `A = ℂ²`; without `φ(1)=1` | segment `{(t,1−t)}`, compact; cone `{(s,t): s,t ≥ 0}`, not compact | pass | none |
| Q0.1 bicommutant, unital star | diagonal `B ⊂ M₂` | `B′ = diag`, `B″ = diag = B` | pass | none |
| Q0.1 bicommutant, non-unital | `ℂ·e₁₁` | `(ℂe₁₁)′ = diag`, bicommutant `diag ⊋ ℂe₁₁` | pass | none |
| Q0.1 bicommutant, non-star | upper triangular `2×2` | commutant: `X` commuting with `e₁₁, e₂₂` is diagonal, with `e₁₂` forces `x₁₁ = x₂₂`: `ℂ·1`; bicommutant `M₂ ≠ B` | pass | none |
| Q0.2 modular data | `𝔄 = M₂`, `⟨x,y⟩ = Tr(ρx*y)`, `ρ = diag(1/3,2/3)`, `x = e₁₂`, `y = e₂₁` | `φ(xy) = Tr(ρe₁₁) = 1/3`; `σ_(−i)(x) = ρxρ⁻¹ = (1/3)(3/2)e₁₂ = e₁₂/2`, `φ(yσ_(−i)x) = (1/2)(2/3) = 1/3`; reversed group gives `ρ⁻¹xρ = 2e₁₂`, `φ = 4/3` | pass | none |
| Q0.2 trace case | `ρ = 1/n` | `Δ = 1`, `σ_t = id` | pass | none |
| Q0.2 non-separating vector | vector state at `e₁` on `M₂` | `e₁₂e₁ = 0`, `(e₁₂)*e₁ = e₂₁e₁ = e₂ ≠ 0`, so `xξ ↦ x*ξ` is ill-defined | pass | none |
| Q0.3 standard solution on `ℂⁿ` | `R(1) = Σ e_i⊗e_i` | `‖R‖ = ‖R̄‖ = √n`, `d = n`; `ϕ(1) = ψ(1) = n` | pass | none |
| Q0.3 rescaled solution | `λ = 2`; `λ = −1`; `λ = i` | left/right sides of standardness `|λ|²n` vs `|λ|⁻²n`: `4n ≠ n/4`; `n = n`; `n = n`; norm product `n` in all three | fail for `|λ| = 1` | R03 |
| Q0.3 signs | SU(2) fundamental; SO(3) vector | `ε = −1` (quaternionic); `ε = +1` (real) | pass | none |
| Q0.3 `d` versus rank | `ℤ/2`-graded `g`; SUq(2) fundamental | `d(g) = 1 = rank`; `d = q + q⁻¹ = 5/2`, rank 2 | pass | none |
| Q0.3 `d ≥ 1`, equality iff invertible | `1`; `g` with `g⊗g = 1`; `ℂ²` | `d = 1, 1, 2`; `1 ⊂ U⊗Ū` with `d(U⊗Ū) = d(U)²` gives `d(U)² ≥ 1` | pass | locator R06 |
| Q0.4 Gram matrix | `n = 2`, basis `{1, e}`, Markov trace with `tr(1) = δ²`, `tr(e) = δ` | `[[δ², δ],[δ, δ²]]`, det `δ²(δ²−1)`; at `δ = 1` radical `1−e`, quotient dimension `1` = paths `0→1→0` on `{0,1}` | pass | none |
| Q0.4 `δ = √2`, `n = 3` | paths of length 3 from 0 on `{0,1,2}` | `0101`, `0121`: 2 paths ending at 1, dimension `2² = 4`; generic `C₃ = 5` | pass | none |
| Q0.4 sign twist | `e ↦ −e` | `(−e)² = δe = (−δ)(−e)`; `e_i e_(i±1) e_i = e_i` preserved; identity on diagrams would force `δe = −δe` | pass | none |
| Q0.4 range used by Q7 | `n ≥ 2` | `d(u) ≥ ‖E(1)‖²/|c| ≥ n ≥ 2`; root-of-unity range unused | pass | R04 |
| Q0.5 `A = ℂ` | `H` infinite-dimensional | `L_A = B(H)`, `K_A = K(H)`, `M(K(H)) = B(H)`; `K(H) ≠ B(H)` | pass | none |
| Q0.5 `H = ℂ` | `A = M₂`, right multiplication by non-central `a` | `(xb)a ≠ (xa)b` at `x = 1`, `b = e₁₂`, `a = e₁₁`: `e₁₂e₁₁ = 0`, `e₁₁e₁₂ = e₁₂` | pass | none |
| Q0.5 non-adjointable inclusion | `J ⊂ C([0,1])` vanishing at 0 | adjoint would give `f = T*(1) ∈ J` with `x*f = x*` for all `x ∈ J`, so `f = 1` on `(0,1]`, contradicting `f(0) = 0` | pass | none |
| Q1 Haar on `C(C₂)` | `μ = (a,1−a)`, `ν = (b,1−b)` | `(μ*ν)(1) = ab + (1−a)(1−b)`; `h = (1/2,1/2)` has `μ*h = h*μ = h` | pass | none |
| Q1 cancellation negative control | monoid `{1,0}` with `0` absorbing | at second coordinate `0`, `Δf(x,0) = f(0)` independent of `x`; span dimension 3 of 4 | pass | none |
| Q3 `F̃` and both Schur forms / `schur_orthogonality` | `SU_(1/2)(2)`, `F̃ = diag(2,1/2)` | `Tr F̃ = Tr F̃⁻¹ = 5/2`; `h(a*a) = (1/2)/(5/2) = 1/5 = q²/(1+q²)`; `h(aa*) = 2/(5/2) = 4/5 = 1/(1+q²)`; `h(c*c) = 2/(5/2) = 4/5` | pass | none |
| Q3 `S²`, modular `θ`, KMS | `F = F̃ᵗ = diag(q⁻¹, q)` | `S²(c) = F₁₁cF₀₀⁻¹ = q²c = c/4` (matches `S(c) = −qc`); `θ(a) = 4a`; `h(aa*) = 4h(a*a) = 4/5` | pass | none |
| Q3 `StarCompatibleHopf`, `counit_star` | `ℂ[C₃]`, `a = iu` | `ε(a*) = ε(−iu⁻¹) = −i = conj(i)`; `Δ(a*) = −iu⁻¹⊗u⁻¹ = star(iu⊗u)` | pass | none |
| Q3 `antipode_star_antipode_star` | same `a` | `S(a*) = −iu`, `star = iu⁻¹`, `S(iu⁻¹) = iu = a` | pass | none |
| Q3 `antipode_coefficient` | circle, `u = [z]` | `S(z) = z⁻¹ = z*`; one-tactic consequence of its sibling | pass | R09 |
| Q3 `AlgebraicHaar` | `A = ℂ`, `h = id`; zero functional | `h(1) = 1`, both invariance equations `1 = 1·1`, `h(a*a) = |a|² ≥ 0`; zero functional fails `h(1) = 1` | pass | none |
| Q3 Schur guard | `H = 0` | `Subcomodule` lattice has one element, `IsSimpleOrder` fails; no `0/0` | pass | none |
| Q4 compact-type equivalence | `ℂ[C₂]` with `u* = u` | coefficients `1, u` span; `h(a₀ + a₁u) = a₀` positive invariant; both simples unitary | pass | R02 (statable) |
| Q5 `suqMatrix_unitary_iff` | general `a, c` | `u*u = 1` ⇔ `a*a + c*c = 1`, `c*a* = qa*c*`, `ac = qca`, `aa* + q²cc* = 1`; `uu* = 1` ⇔ `aa* + q²c*c = 1`, `ac* = qc*a`, `ca* = qa*c`, `cc* + a*a = 1`; together ⇔ the five relations | pass | none |
| Q5 `suqMatrix_unitary_iff` instances | `q = 1`, `a = 3/5`, `c = 4/5`; `a = c = 0` | orthogonal `u`, relations hold; `u*u = 0 ≠ 1`, `0 ≠ 1` | pass | none |
| Q5 `freeOrthogonalRelation` | `F = I`, real orthogonal `U`; `U = [i]` | `U = bar U` real; `i ≠ −i` fails | pass | none |
| Q5 SUq(2) as `O_F^+` | `F = [[0,1],[−2,0]]`, `F bar F = −2I` | `F bar u F⁻¹ = [[a, −c*/2],[c, a*]] = u` | pass | none |
| Q5 `freeOrthogonalCup_invariant` | same `F`, `u` | `(0,0)`: `−c*a/2 + ac* = 0 = F₀₀`; `(0,1)`: `−c*c/2 − 2aa* = −2(aa* + q²c*c) = −2 = F₁₀`; `(1,0)`: `a*a + cc* = 1 = F₀₁`; `(1,1)`: `a*c − 2ca* = 0 = F₁₁` | pass | none |
| Q5 cup invariance, general derivation | `u = F bar u F⁻¹`, `uu* = 1` | `Σ_l u_kl F_lj = Σ_a F_ka u_aj*`, then `Σ_j u_ij u_aj* = δ_ia`, giving `F_ki` | pass | none |
| Q7 Haar law | `f = 1, t` | `(1−q²)Σq^(2j) = 1`; `(1−q²)/(1−q⁴) = 1/(1+q²) = 4/5 = h(c*c)` above | pass | none |
| Q8 quantum integers | `r = 2, 0, −2` | `[2] = (1/4−4)/(1/2−2) = 5/2`, `[0] = 0`, `[−2] = −5/2` | pass | none |
| Q8.1 `QuantumSL2Relation` | `q = ±1` (junk) | `(q−q⁻¹)⁻¹ = 0` so `EF = FE`; the algebra is `ℂ[E,F,K,K⁻¹]`; excluded by `hgeneric` in every theorem | pass | none |
| Q8.1 coproduct preserves the relation | `ΔE = E⊗1 + K⊗E`, `ΔF = F⊗K⁻¹ + 1⊗F` | `ΔEΔF − ΔFΔE = (EF−FE)⊗K⁻¹ + K⊗(EF−FE) + (KF⊗EK⁻¹ − FK⊗K⁻¹E)`; last bracket `q⁻²q² − 1 = 0`; rest `(K⊗K − K⁻¹⊗K⁻¹)/(q−q⁻¹) = (ΔK − ΔK⁻¹)/(q−q⁻¹)` | pass | none |
| Q8.1 antipode | `S(E) = −K⁻¹E`, `S(F) = −FK` | `m(S⊗id)ΔE = −K⁻¹E + K⁻¹E = 0 = ε(E)`; `m(S⊗id)ΔF = −FKK⁻¹ + F = 0` | pass | none |
| Q8.1 PBW / `quantumSL2_exists_pbwBasis` | `(0,0,0)`, `(0,−1,0)`, `(1,1,1)` | `1`, `K⁻¹`, `FKE`; `KFE = q⁻²FKE` reorders into the basis | pass | note: PBW and domain hold for every `q² ≠ 1`, so `hgeneric` is stronger than needed (matches the README's standing hypothesis) |
| Q8.2 ladder `L₁⁺` / `quantumSL2_exists_ladderAction` | `m = 1`, `ε = +1` | `K = diag(1/2, 2)`, `Fv₀ = v₁`, `Ev₁ = v₀`; `(EF−FE)v₀ = v₀ = ((1/2−2)/(1/2−2))v₀`; on `v₁`: `−v₁ = ((2−1/2)/(1/2−2))v₁`; `Ev₀ = 0`, `Kv₀ = q·v₀` | pass | none |
| Q8.2 `L₀⁻` | `m = 0`, `ε = −1` | `E = F = 0`, `K = −1`, `(K−K⁻¹) = 0 = EF−FE`, irreducible (dimension 1) | pass | none |
| Q8.2 highest vectors / `quantumSL2_exists_highestWeightVector` | `L_m^ε` | `Ev = 0` for `v = Σc_jv_j` forces `c_j[m−j+1] = 0`, `j ≥ 1`, so `v ∝ v₀`, `Kv = εq^m v`, `m = finrank − 1` | pass | none |
| Q8.2 uniqueness / `quantumSL2_nonempty_linearEquiv_of_highestWeight` | `εq^m = ε′q^(m′)` | `q^(m−m′) = ±1` gives `q^(2|m−m′|) = 1`, so `m = m′`, `ε = ε′` under `hgeneric` | pass | none |
| Q8.3 `quantumSL2Casimir` | `EF = FE + (K−K⁻¹)/(q−q⁻¹)` | `EF + (q⁻¹K + qK⁻¹)/(q−q⁻¹)² = FE + (qK + q⁻¹K⁻¹)/(q−q⁻¹)²`: numerators `(K−K⁻¹)(q−q⁻¹) + q⁻¹K + qK⁻¹ = qK + q⁻¹K⁻¹` | pass | none |
| Q8.3 centrality | `EΩ` vs `ΩE` | `EFE + E(qK+q⁻¹K⁻¹)/(q−q⁻¹)² = FEE + [(K−K⁻¹)(q−q⁻¹) + q⁻¹K + qK⁻¹]E/(q−q⁻¹)² = ΩE` using `EK = q⁻²KE` | pass | none |
| Q8.3 Casimir scalars | `m = 0, 1, 2`, `ε = +` | `(q^(m+1) + q^(−m−1))/(q−q⁻¹)²`: `10/9`, `17/9`, `65/18`; on `L₁⁺`: `FE = diag(0,1)`, toral term `diag(17/9, 8/9)`, sum `(17/9)I` | pass | none |
| Q8.3 `quantumSL2_isSemisimpleModule` degenerate | `V = 0`; `L₀⁻ ⊕ L₁⁺` | zero module semisimple; dimensions `1 + 2`, Casimir blocks `−10/9`, `17/9` distinct | pass | none |
| Q8.3 commutator formula | `r = 2` on `L₂⁺`, `v₀` | `EF²v₀ = (5/2)v₁`; `[2]F(q⁻¹K − qK⁻¹)/(q−q⁻¹)v₀ = (5/2)v₁` | pass | none |
| Q8.4 locally finite | `L₀⁻`; Verma `λ = 1`; `V = 0` | cyclic span dimension 1; weights `4^j`, infinite span; both sides true | pass | R02 (statable, absent) |
| Q8.5 Clebsch–Gordan | `m = n = j = 1`, `δ = +` | `α₁ = −q[1]/[1] = −1/2`; `ΔE(v₀⊗v₁ − ½v₁⊗v₀) = ½v₀⊗v₀ − ½v₀⊗v₀ = 0` | pass | none |
| Q8.5 `Δ(E²)` | `r = 2` | `(E⊗1 + K⊗E)² = E²⊗1 + (1+q²)EK⊗E + K²⊗E²`; formula middle coefficient `q[2] = q² + 1 = 5/4` | pass | none |
| Q8.5 pivot and traces | `g = K⁻¹` | `K⁻¹EK = q⁻²E = S²(E)`; `tr K = tr K⁻¹ = 5/2` on `L₁⁺`, `−1` on `L₀⁻` | pass | none |
| Q8.6 compact form | `m = 1` | `h₁/h₀ = q`; `⟨E*v₀, v₁⟩ = ⟨KFv₀, v₁⟩ = q⁻¹h₁ = 1 = ⟨v₀, Ev₁⟩`; orthonormal entries `E₀₁ = q^(−1/2)`, `F₁₀ = q^(1/2)` match the pairing matrices | pass | none |
| Q8.7 classical specialisation | `v = 1`, `m = 1` | `E = [[0,1],[0,0]]`, `F = Eᵗ`, `H = diag(1,−1)`, `[E,F] = H` | pass | none |
| Q0.2 consumed by Q3 | KMS uniqueness for the faithful normal vector state | identifies `σ_t` with `Δ_h^(it)(·)Δ_h^(−it)` without any weight statement | pass | R05 |

**Pinned library declarations opened** (file and line at the pins). Mathlib: `PositiveLinearMap.gnsStarAlgHom` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean:246`), `CStarModule` (`Analysis/CStarAlgebra/Module/Defs.lean:72`), `WeakDual.isCompact_polar` (`Analysis/Normed/Module/WeakDual.lean:313`), `VonNeumannAlgebra` with field `centralizer_centralizer'` and `commutant` (`Analysis/VonNeumannAlgebra/Basic.lean:67`, `:70`, `:123`; line 23 still lists the double commutant theorem as to do, so the README's remark at `:86`–`:88` is right), `Set.centralizer` (`Algebra/Group/Center.lean:125`), `Analysis/InnerProductSpace/LinearPMap.lean` (exists), `Star (A ⊗[R] B)` (`Algebra/Star/TensorProduct.lean:28`, entrywise on pure tensors, as `StarCompatibleHopf` needs), `IsGroupLikeElem.antipode` and `GroupLike.toUnits` (`RingTheory/HopfAlgebra/GroupLike.lean:37`–`:50`), `HopfAlgebra.antipode_mul_antidistrib` (`RingTheory/HopfAlgebra/Convolution.lean:57`), `WithConv` (`RingTheory/HopfAlgebra/Basic.lean`), `SkewPolynomial` (`Algebra/SkewPolynomial/Basic.lean`), `Rep.equivalenceModuleMonoidAlgebra` (`RepresentationTheory/Rep/Iso.lean`), `IsSemisimpleModule` (`RingTheory/SimpleModule/Basic.lean:65`), `Transcendental` (`RingTheory/Algebraic/Defs.lean:49`), `RingQuot.mkAlgHom_rel` (`Algebra/RingQuot.lean:471`), `Unitary.mul_star_self_of_mem` (`Algebra/Star/Unitary.lean:63`). No star-compatible Hopf algebra and no Hopf integral exists in Mathlib or Tau Ceti at the pins (grep for `comul_star`, `StarHopf`, `StarBialgebra`, `LeftIntegral`, `IsLeftIntegral` empty), so `StarCompatibleHopf` and `AlgebraicHaar` duplicate nothing. Tau Ceti: `Comodule.coefficientMatrix` and `map_antipode_mul_coefficientMatrix` (`Algebra/Coalgebra/Comodule/MatrixCoefficient/Matrix.lean:68`, `:173`), `matrixCoact`, `matrixComodule` (`FromMatrix.lean:49`, `:166`), `Subcomodule` with its `PartialOrder` and `BoundedOrder` (`Algebra/Coalgebra/Subcomodule/Basic.lean:70`, `:100`, `:232`), `IsCompletelyReducible` (`Comodule/LinearlyReductive.lean:104`), `fixedSubcomodule` (`Comodule/Fixed.lean:57`), `convolutionAction` (`Comodule/Convolution.lean:49`), `HopfAlgebra.antipode_antipode` and `antipodeAlgEquiv` (`Algebra/HopfAlgebra/Antipode.lean:88`, `:97`), `FDRep.ofShrink`, `ofShrinkEquiv` (`RepresentationTheory/FDRep.lean:248`, `:254`), `Comodule/Finite/{Monoidal,RightRigid,Rigid}.lean` (exist).

**Supplier citations resolved** (main for roadmaps on main; the open head for CStarAlgebras).

| Citation | Resolved at |
| --- | --- |
| CStarAlgebras C2 state extension; C4 multiplicative domain; C5 minimal tensors and slices; C8 Toeplitz extension | open head #860 `CStarAlgebras/README.md:544` (C2.1), `:986` (C4.1), `:1112`–`:1169` (C5.1–C5.3), `:1676` (C8.4 The Toeplitz extension) |
| TemperleyLieb Layers 0–7 | main `TemperleyLieb/README.md:249`–`:915` |
| RepresentationTheory/CompactGroups, `su2Irrep` | main `README.md:196`, `:400`–`:413` |
| RepresentationTheory/LieHighestWeight, `IsSl2Triple`, `sl (Fin 2)` | main `README.md:5`, `:181`–`:188` |
| OperatorAlgebraDynamics D1–D2, Reiter P₁ | main `README.md:75`, `:143`, `:180` |
| FreeProbability F1, F3, F6 | main `README.md:127`, `:255`, `:532` |
| AmenableGroups Layers 1, 5, 7 | main `README.md:98`, `:289`, `:415` |
| PivotalSpherical Layers 0–2, 7, `leftTrace`/`rightTrace`, `FDRep k G` | main `README.md:257`–`:318`, `:477`, `:61` |
| Q3 → Q0.2, Q0.3; Q6 → Q0.1; Q7 → Q0.4; Q2 → Q0.5 | internal; all exist except the weight clause (R05) |

**Ownership.** Q0.1–Q0.5 state, as this roadmap's targets, notions that four open new-folder pull requests also build: the finite bicommutant (VonNeumannAlgebras #1041 §V1.3, `README.md:347`, whose line 1198 names QuantumGroups as its consumer; #889 Layer 1), left Hilbert algebras and Tomita theory (VonNeumannAlgebras #889 Layer 10, `:2247`), Hilbert-module operators (HilbertModules #861 H2, `:179`), C*-categories with standard conjugates (CategoricalOperatorAlgebras #888, which names QuantumGroups only as a consumer at `:54` and `:1624`) and positive Temperley–Lieb quotients (TemperleyLiebOperatorAlgebras #867 §§1.3, 2.1–2.2, 3.1–3.4, `:435`–`:1326`). Because QuantumGroups is on main it cannot cite them, so the notions move down; the same move was recorded and accepted for #1649 (report ~3), and this review treats it the same way. The one object with two owners among open pull requests is therefore this folder itself (R01). Downstream consumers checked: QuantumEnvelopingAlgebras on main consumes Q8 (`README.md:56`, `:88`, with the same coproduct `Δ(Eᵢ) = Eᵢ⊗1 + Kᵢ⊗Eᵢ`); HopfologicalAlgebra #222 consumes Q8 item 5 (`README.md:165`, still by the Lean name `FiniteHopfModuleCat k H`, which neither this head nor #1649 declares; that is the consumer's citation to update). Ownership against open pull requests whose files the brief does not list was not checked.

**Seeded sample (15 targets chosen by this review, none flagged unverified by the README).**

1. Q0.1 Murphy §3.3 state extension: uncertified (paywalled); the statement is standard (Hahn–Banach on the unital subalgebra).
2. Q0.1 Murphy §4.1 finite bicommutant: uncertified; checked by the three Checks above and `hiai` lines 93–96 (double commutant for unital *-subalgebras).
3. Q0.2 Takesaki II VI.1 Tomita: uncertified; the same statement at `hiai` lines 436–438 (Theorem 2.2: `JMJ = M′`, `Δ^(it)MΔ^(−it) = M`).
4. Q0.2 Takesaki II VIII.1 KMS uniqueness: uncertified; `hiai` lines 737–739 (Theorem 2.14: KMS at `β = −1` and uniqueness among weakly continuous groups) at exactly the state-level generality Q0.2 states.
5. Q0.3 Neshveyev–Tuset §2.2 standard solutions and intrinsic dimension: `nt` lines 1427–1431, 1446–1454, 1501–1512, 1596–1600 (pp.32–35) support the definitions and additivity/multiplicativity (Theorem 2.2.16, line 1571); the sign and `d ≥ 1` are elsewhere (R06).
6. Q0.4 Neshveyev–Tuset "Chapter 2" for Temperley–Lieb: §2.5, `nt` lines 2488–2491 and 2556–2567 (R04).
7. Q0.5 Lance Chapters 2 and 4: uncertified (Cambridge, no open copy); the Checks were computed directly.
8. Q3 Timmermann Theorem 3.2.12, Proposition 3.2.17 (`Suggested.lean:125`): uncertified (EMS, subscription); the formulas were checked on `SU_(1/2)(2)` above.
9. Q4 BMT Theorems 2.2, 2.8, 3.6, Corollary 2.9: `bmt` lines 257, 461–464, 858–861, printed pp.6, 10, 18, with the faithful-Haar hypothesis of Theorem 2.8 stated at line 462, as the README's intermediate-completion criterion requires.
10. Q6 Malacarne Theorem 1.1, Lemma 2.1, Theorem 4.1: `malacarne` lines 52, 183 (`A/I_F ≅ ℂ[O_F^+]`), 285–287; "Lemma 3.2" does not exist in the text (lemmas 1.2, 2.1, 3.1 only), a point report ~3 already made for #1649's README and which this head's `README.md:1025` repeats.
11. Q7 Banica Theorem 1: `banica` line 42 with the abstract's `n ≥ 2` at lines 9–11; the README's `n ≥ 2` restriction and `n = 1` boundary are right.
12. Q8 Virelizier §2.3: `virelizier` lines 348–352 (field, `q` not a root of unity, the four relations with `EF − FE = (K − K⁻¹)/(q − q⁻¹)`); its `(t)_q` convention differs from the roadmap's symmetric `[r]_q`, as the README says at `:1039`–`:1045`.
13. Q8.1 PBW/domain locators: none given beyond "specified here"; the Ore-tower route is standard and the Lean statements were checked above.
14. Q8.3 centre locator: none given; the statement (centre `= ℂ[Ω]`, `Ω` transcendental) is the standard theorem for `q` not a root of unity and was checked on the Casimir scalars.
15. Q5 `freeOrthogonalCup_invariant` (no locator): derived above from `uu* = 1` and `u = F bar u F⁻¹` in two lines; a locator is not needed for a two-line consequence.

## Not verifiable

- Murphy, *C*-Algebras and Operator Theory* §§3.3, 4.1; Takesaki, *Theory of Operator Algebras II* VI.1, VIII.1; Lance, *Hilbert C*-Modules* Chapters 2, 4; Timmermann, *An Invitation to Quantum Groups and Duality* (every locator in `README.md:1004`–`:1011` and `Suggested.lean:125`); Jones, *Index for subfactors* (1983); Wenzl, *On sequences of projections* (1987): no legal text found (paywalled publishers; Lance's Cambridge landing page is in no licence class). The sources service recorded `jones83` as uncertified and `nt` as fetched in `packages/QuantumGroups/sources.toml` while running the brief's fetch command; this review made no other manifest change. `needs-references.toml` in the scratch directory lists `lance` and the first two Neshveyev–Tuset URLs (the third fetch succeeded).
- The general theorems (nonseparable Peter–Weyl, Tannaka–Krein, Tomita for the Haar GNS algebra, complete reducibility with generalised weights, the Biedenharn–Elliott pentagon, local-finiteness semisimplicity) are certified only on the computed instances above and by their stated hypotheses, routes and located inputs.
- Tau Ceti's finite tensor-product entry convention (`U_13 V_23`) was not re-derived from `Comodule/Finite/TensorProduct.lean`; the README's Checks are consistent with it.

## Source issues

- **Error** in banica at Theorem 1, printed p.2: the source says the SU(2)-type classification holds for every n; it should be restricted to n ≥ 2 as in its abstract, since n = 1 gives C*(ℤ/2) with two irreducibles; affects a stated result.
- **Misprint** in virelizier at §2.3, printed p.8: the source says the displayed q-numbers lie in the unit group; it should exclude the index-zero number, which is zero; affects nothing.
