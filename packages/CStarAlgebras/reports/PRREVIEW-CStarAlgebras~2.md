# Review of CStarAlgebras (pull request #860 at d09f240)

**Verdict:** needs changes

Incremental re-review of the 133 lines changed since 1d4e2ed: the file
`MatrixOrderSuggested.lean` was deleted, its contents were appended to `Suggested.lean` as a
`MatrixOrder` section (four definitions, six sorried theorems, an instance-priority override and
four more submodule imports), and README line 106 now links `Suggested.lean` instead of the
deleted file. Nothing else in the folder changed and nothing outside it. The change answers only
the previous R10, and only by moving the padding rather than removing it. Every other finding of
the previous report stands; one of them (the VonNeumannAlgebras cycle) has changed shape because
the sibling roadmap moved in the meantime. The gate still fails (imports, blob links,
pull-request numbers), the targeted build and the elaboration pass.

## R01 (P1) — Supply cycle with HilbertModules (carried)

**Location.** `TauCetiRoadmap/CStarAlgebras/README.md` line 450: "Consume HilbertModules
H5.CommutativeFiberExample … for the compact commutative pullback example".

**Claim.** HilbertModules is a supplier of C2.MatrixFields.

**Witness.** HilbertModules at its open head today (5476fe8d), README line 47 "CStarAlgebras
C1–C2 supplies ideals, approximate …", line 281 "using CStarAlgebras C7–C9", line 552
"CStarAlgebras C2's pure-state/irreducible-GNS". Both directions are stated: a cycle. The
dependency check cannot see it (HilbertModules is in the merge order at line 11, before this
roadmap, but its own README is not on main, so its edges are invisible to the check).

**Repair.** As in the previous report: delete the citation at line 450 and the sentence after
it, and state the fiber-norm formula as a C2 target with its own route if it is wanted. Tested:
with the citation gone, the only edges between the two roadmaps run HilbertModules →
CStarAlgebras.

## R02 (P2) — Mutual citation with OperatorTheory and a placement conflict on main (carried)

**Location.** README lines 59–60: "OperatorTheory supplies Hilbert-space geometry, adjoints,
compact operators, polar decomposition and spectral theory."

**Witness.** On main (a0ad405), `TauCetiRoadmap/OperatorTheory/README.md` line 67 and its
dependency table line 83 cite `CStarAlgebras C1/C5/C8`;
`OperatorTheory/ToeplitzOperators/README.md` lines 24, 193, 195 cite C8, C5, C1;
`OperatorAlgebraDynamics/README.md` line 40 and `FreeProbability/README.md` line 55 consume
CStarAlgebras C1–C7. The merge order lists none of OperatorTheory, OperatorAlgebraDynamics,
FreeProbability, so the check reports nothing.

**Repair.** As in the previous report: cite the sub-roadmaps actually used
(`OperatorTheory/PolarDecomposition`, `OperatorTheory/SelfAdjointSpectralTheory`) and Mathlib
directly for adjoints and compact operators; never the umbrella or `ToeplitzOperators`.

## R03 (P2) — Supplier drift: V13b no longer consumes C5, and now owns the spatial norm C5 builds

**Location.** README lines 47–48: "V13b owns injectivity versus semidiscreteness and consumes
C5's minimal tensor construction"; lines 548–551: "Construct the algebraic star algebra A⊙B and
its minimal and maximal C*-completions. The minimal norm is the operator norm in faithful spatial
representations on H⊗₂K; prove independence of the representations."

**Claim.** C5 owns the minimal (spatial) C*-norm, representation independence and slice maps,
and V13b consumes them.

**Witness.** VonNeumannAlgebras at its open head today (dee80881) has moved: V13b cites nothing
of this roadmap any more (no "C5" or "CStarAlgebras" between its lines 3690 and 4200), and
its target `V13b.SpatialNorm` (line 3744) defines the spatial norm on A⊙B, proves it is a
C*-norm, proves representation independence (Takesaki IV.4.9), the slice maps and isometric
functoriality for inclusions. Its line 4208 says "its C5 consumes V13b.SpatialNorm's spatial
norm, its representation independence, slice maps and inclusion functoriality, and adds the
maximal norm and the comparison of C*-norms", and line 72 leaves "C*-tensor norms other than
the spatial norm" to this roadmap. So the previous cycle C5 → V13b → C6 is gone on the
supplier's side, but this README now states a false fact about its supplier and plans the
spatial norm a second time (two owners for one object).

**Repair.** Replace lines 47–48 by: V13b owns the spatial norm on A⊙B with representation
independence, slice maps and inclusion functoriality (`V13b.SpatialNorm`) and injectivity versus
semidiscreteness; C5 consumes the former and adds the maximal norm, the comparison
`‖·‖min ≤ ‖·‖max ≤ every C*-cross norm`, units, associativity, flip, direct sums and
functoriality. Cut from C5 (lines 548–551, 556) the construction of the minimal norm, its
representation independence and the slice maps, citing `VonNeumannAlgebras V13b.SpatialNorm`
in their place; keep the C₀(X)⊗min A and C(X)⊗min C(Y) identifications (lines 566–569) as C5
targets since V13b does not state them. Line 59 ("Build missing interfaces in the owning
development and expose them for both roadmaps") goes. Tested: after the cut, every
VonNeumannAlgebras citation here (V0, V1, V2, V4, V5, V10, V11, V12.J, V13a, V13b) points at a
layer that cites nothing of this roadmap, and the spatial norm has one owner.

## R04 (P2) — `multiplicativeDomain` is sorry'd data (carried)

**Location.** `TauCetiRoadmap/CStarAlgebras/Suggested.lean` line 124: `def multiplicativeDomain
(φ : D →CP E) (hφ : φ 1 = 1) : StarSubalgebra ℂ D :=` with body
`(multiplicativeDomain_isClosedStarSubalgebra φ hφ).choose`.

**Witness.** The witness is chosen from a theorem whose proof is `sorry` (line 116); its axioms
include `sorryAx` (checked in the previous round, unchanged here).

**Repair.** Delete lines 124–131 (`multiplicativeDomain`, `isClosed_multiplicativeDomain`,
`mem_multiplicativeDomain`); the existence theorem states the mathematics.

## R05 (P2) — Statable headline theorems are absent; the docstring names none as unstatable (carried)

**Location.** `Suggested.lean` lines 17–22 (module docstring) and the declarations that follow.

**Witness.** Unchanged since the previous report: Stinespring dilation (unital form), Kadison
transitivity and Voiculescu's theorem are statable on the carriers the file already uses
(`→CP`, `StarAlgHom` into `K →L[ℂ] K`, `ContinuousLinearMap.adjoint`, `IsCompactOperator`,
`Submodule ℂ H`), and none is stated; the docstring does not say which headlines are
unstatable (those needing `A ⊗min B`, `A ⊗max B`, C*-quotients, `A**`). The new section adds
2×2 computations, not headlines.

**Repair.** As in the previous report: state Stinespring, Kadison transitivity and Voiculescu;
rewrite the docstring in the form "C*-algebras, operator spaces, and approximation: target
signatures", listing the tensor-dependent headlines as not statable with the missing carriers.

## R06 (P3) — The `MatrixOrder` section is padding that needs an instance override, and its names are absent from the README

**Location.** `Suggested.lean` lines 158–202: `attribute [local instance 1100]
Module.complexToReal Algebra.complexToReal` (line 161); `def swap`, `swapPositive`,
`diagonal`, `firstProjection` (167–173); theorems `swap_posPart`, `swap_le_diagonal`,
`positivePart_le_diagonal`, `order_counterexamples`, `compression_counterexample` (176–200).

**Claim.** These are acceptance-test statements with native interfaces (README line 106:
"Suggested.lean gives native interfaces").

**Witness.** (1) Each theorem computes a 2×2 value or a two-point counterexample and mirrors,
one for one, the Checks of README lines 87–101 (`q = a⁺`, `b ≥ a ⇔ st ≥ 1`, the shifted
minors, the (½,3) and (5/8,5) instances, `pTp ≰ T`): the rule classes these as padding, and
the four definitions exist only to state them. (2) The statement `swap⁺` elaborates only under
the override: a scratch copy with line 161 deleted fails at line 175 with "failed to synthesize
PosPart M₂" (the `Module.complexToReal` / `Algebra.complexToReal` instances are priority 900 at
the pin, `LinearAlgebra/Complex/Module.lean` lines 168 and 174). A statement that only
elaborates with an override is to be restated or dropped. (3) None of `swap`, `swapPositive`,
`diagonal`, `firstProjection` appears in the README, which calls them a, q, b, p; every Lean
name must appear in the README. One-tactic probe: `simp` closes none of the six (so they are
not trivial, but that is not the test for computations that mirror Checks).

**Repair.** Delete lines 158–202 and the four imports they brought (lines 6, 8, 13, 14, which
R07 removes anyway). The README keeps the 2×2 computations as Checks of C1 (they are correct,
see the table). `compression_le_iff_commute` (lines 204–209) is a genuine C1 theorem on native
carriers and may stay, moved out of the `MatrixOrder` section so that it does not sit under the
override; change README line 106 to say that `Suggested.lean` states the compression theorem.
Tested: the file without lines 158–202 and with the single `import Mathlib` is the file the
previous report elaborated (eleven `sorry` warnings after R04's deletion, no error).

## R07 (P3) — Gate: `Suggested.lean` imports (carried, now eleven lines)

**Location.** `Suggested.lean` lines 5–15: eleven `import Mathlib.<submodule>` lines and no
`import Mathlib`.

**Witness.** Gate rules `imports`, `mathlib-subimports` (11) and `no-import-mathlib` (1) fail;
the change added four lines (6, 8, 13, 14).

**Repair.** Replace lines 5–15 by the single line `import Mathlib`.

## R08 (P3) — Gate: supplier links pinned to commits that are not on main (carried)

**Location.** README lines 32, 34, 41, 450: links of the form
`github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…`.

**Witness.** Gate rule `blob` (4). Unchanged since the previous report.

**Repair.** Cite by roadmap name and section (`BanachSpaceTheory B1`, `BanachAlgebras A1`,
`VonNeumannAlgebras V0`), with relative links to `../<Name>/README.md` where a link is wanted.

## R09 (P3) — Gate: pull-request numbers, process narrative, undefined labels (carried)

**Location.** README lines 1001, 1003, 1005, 1012 (`PR #42095`, `PR #42100`, `PR #24106`,
`Physlib PR #1191`); lines 104–108 ("all six Preventive Medicine questions … Retain the source
solution's strict/non-strict boundary wording and its insufficient square-root justification");
lines 443–445 and 454–457 (Rieffel "main" / "archive" indexing); lines 1009–1010, 1016–1017;
line 76 ("QF2"); line 59.

**Witness.** Gate rule `prnum` (4). The passages are unchanged since the previous report.

**Repair.** As in the previous report: delete the pull-request paragraph and the process
sentences; replace "QF2" by the VonNeumannAlgebras section name or drop the sentence.

## R10 (P3) — README shape: no supplier contracts, no `*Needs:*` lines, no Checks, no locators (carried)

**Location.** Whole README (headings `## C1.` … `## C9.`, no `## Scope and ownership`,
`## Conventions`, `## Exact supplier contracts`, no `### k.n`, `### Examples`,
`### Dependencies`, no `**Checks.**` lists, no `*Needs:*` lines, no `sources.toml`).

**Witness.** Unchanged since the previous report; the sampled targets
C1.AlgebraicLeftIdealApproximation, C1.CompactOperatorIdeals, C1.CommutativeMultiplierMorphisms,
C2.CompactRepresentationModels, C2.PureStateQuotientAndBaire and C2.AnnHull still carry no
locator.

**Repair.** As in the previous report.

## R11 (P3) — Padding in `Suggested.lean` (carried)

**Location.** `Suggested.lean` lines 33–40 (`norm_leftMultiplication`,
`norm_rightMultiplication`), 60–61 (`IsHereditary`), 127–131
(`isClosed_multiplicativeDomain`, `mem_multiplicativeDomain`).

**Witness.** The first two are proved by one library lemma each
(`ContinuousLinearMap.opNorm_mul_apply`, `opNorm_mul_flip_apply`); `IsHereditary` is used by no
declaration; the last two are projections of a `choose_spec`. Unchanged.

**Repair.** Delete the five declarations; the README keeps the norm identities as C1 facts.

## R12 (P3) — C2.CompactRepresentationModels: a hypothesis lives in the previous sentence (carried)

**Location.** README lines 298–300: "If irreducible ρ has kerρ=kerπ, prove ρ and π unitarily
equivalent, without a separability or global GCR hypothesis."

**Witness.** False without `π(A) ∩ K(H) ≠ 0`: the CAR algebra is simple with inequivalent
irreducible representations, all of kernel 0. Unchanged.

**Repair.** "If π(A) contains a nonzero compact operator and ρ is irreducible with ker ρ =
ker π, then ρ ≅ π."

## R13 (P3) — Sources: mirrors and unidentifiable locators (carried)

**Location.** README line 984 (Arveson, Tsinghua "archive" link), line 990 (Haagerup, personal
"collected works" link), lines 445 and 454–455 (Rieffel "main" / "archive 0210_001",
"0210_026" with no bibliographic entry).

**Witness.** Unchanged since the previous report.

**Repair.** Cite Arveson and Haagerup by DOI (publisher open archives) and drop the mirror
links; give the Rieffel notes a bibliographic entry or replace the locators by Dixmier/Blackadar
section numbers.

## Previous findings

- R01 — not repaired: line 450 still "Consume HilbertModules H5.CommutativeFiberExample … for
  the compact commutative pullback example"; HilbertModules at 5476fe8d still cites C1–C2, C2,
  C7–C9 (this report's R01).
- R02 — partly repaired, by the supplier: VonNeumannAlgebras at dee80881 no longer consumes C5,
  so the cycle is gone; lines 47–48 still say "V13b … consumes C5's minimal tensor construction"
  and C5 still builds the spatial norm V13b.SpatialNorm now owns (this report's R03).
- R03 — not repaired: line 124 `def multiplicativeDomain … := (… ).choose` (this report's R04).
- R04 — not repaired: docstring lines 17–22 unchanged, no Stinespring, Kadison or Voiculescu
  statement (this report's R05).
- R05 — not repaired: lines 59–60 "OperatorTheory supplies Hilbert-space geometry, adjoints,
  compact operators, polar decomposition and spectral theory" (this report's R02).
- R06 — not repaired, worsened: eleven `import Mathlib.<submodule>` lines, four of them new (this
  report's R07).
- R07 — not repaired: blob links at lines 32, 34, 41, 450 unchanged (this report's R08).
- R08 — not repaired: pull-request numbers at lines 1001–1012 and the process sentences at lines
  104–108 unchanged (this report's R09).
- R09 — not repaired: README shape unchanged (this report's R10).
- R10 — partly repaired: `MatrixOrderSuggested.lean` is deleted and line 106 now links
  `Suggested.lean`; its 2×2 theorems, definitions and instance override were moved into
  `Suggested.lean` lines 158–202 instead of being left to the README's Checks (this report's R06).
- R11 — not repaired: `norm_leftMultiplication`, `norm_rightMultiplication`, `IsHereditary`,
  `isClosed_multiplicativeDomain`, `mem_multiplicativeDomain` all present (this report's R11).
- R12 — not repaired: lines 298–300 "If irreducible ρ has kerρ=kerπ, prove ρ and π unitarily
  equivalent" (this report's R12).
- R13 — not repaired: lines 984, 990, 445, 454–455 unchanged (this report's R13).

## Verified sound

**Gate and builds at d09f240.** The worker's gate: build passed; failures only `imports`,
`mathlib-subimports` (11), `no-import-mathlib`, `blob` (4), `prnum` (4); `stray-files` 0 (the
second Lean file is gone), `set-option` 0, `sorry-data` 0 (literal bodies only; R04 is the
non-literal case), `outside-folder` 0, `dirty` 0. `lake env lean` on `Suggested.lean` from the
worktree: exit 0, sixteen `declaration uses sorry` warnings (lines 43, 50, 77, 85, 91, 100,
105, 110, 116, 146, 176, 180, 185, 191, 198, 205), nothing else. `git diff --stat
origin/main...HEAD` excluding the folder: empty.

**Dependency check** (run as the brief gives it, `--movable`):

```
depcheck: 209 roadmaps, 1726 edges, 0 problem(s)
```

No UPWARD, CYCLE or NOT IN ORDER line: the merge-order candidate now lists CStarAlgebras (line
375) after VonNeumannAlgebras (line 5) and HilbertModules (line 11). The cycles of R01 and R02
are invisible to it because HilbertModules' README and the OperatorTheory sub-roadmaps' edges
are not in what it reads (HilbertModules is not on main; OperatorTheory, OperatorAlgebraDynamics
and FreeProbability are not in the order file).

**Signature check.** The worker's `signatures.md` has the elaborated type of all 28
declarations; each of the ten new ones agrees with its README statement (`a`, `q`, `b = diag(s,t)`,
`p = diag(1,0)` at README lines 87–101; the compression theorem at lines 101–102 with the
hypotheses "positive T and star projection p in a unital C*-algebra" = `[CStarAlgebra D]`,
`IsStarProjection p`, `0 ≤ T`). The one flagged lead, `IsHereditary` without
`StarOrderedRing`, is as in the previous report: its type mentions only `≤`, so `PartialOrder`
is all it needs. Changed by the check: nothing.

**Pinned Mathlib declarations opened for the changed material** (file and line under
`Mathlib/`): `CStarMatrix.ofMatrix` (Analysis/CStarAlgebra/CStarMatrix.lean:54), the
square-matrix `PartialOrder` (same:803), `posPart` as `cfcₙ (·⁺)`
(Analysis/SpecialFunctions/ContinuousFunctionalCalculus/PosPart/Basic.lean:31),
`IsStarProjection` (Algebra/Star/StarProjection.lean:26), `Module.complexToReal` and
`Algebra.complexToReal` at priority 900 (LinearAlgebra/Complex/Module.lean:168, 174),
`CFC.sqrt_le_sqrt` (…/Rpow/Order.lean). The declarations the untouched sections use were opened
in the previous report at the same pin (the manifest is unchanged).

**Cross-roadmap citations resolved at the heads of today.** VonNeumannAlgebras (dee80881):
V0.SeparableFaithful line 321; V13a line 3690; V13b line 3740 with V13b.SpatialNorm 3744 and
injectivity iff semidiscreteness 3830 and the commuting-representation minimal-norm criterion
3831; V12.J.Maps 3477, V12.J.Frame 3511, V12.J.Scalar 3545, V12.J.Dye 3571; its consumer
statement about this roadmap at lines 64–72 and 4208–4211. HilbertModules (5476fe8d): H5 line
354, H5.CommutativeFiberExample 377, H7 750. OperatorTheory, ToeplitzOperators,
OperatorAlgebraDynamics, FreeProbability on main (a0ad405) at the lines in R02. Ownership
against open pull requests was checked only for the sibling checkouts the brief lists.

**Seeded sample.** Of the nine seeded targets only C1.MatrixOrderExamples (README lines 87–106)
falls in the changed passages; its values are recomputed below. The others are untouched by the
diff; their rows are carried from the previous report, and the ownership deferral of
CStar.WStarJordanBoundary to V12.J was re-resolved at the new VonNeumannAlgebras head (lines
3477–3571).

**Adversarial table.** Rows marked (r1) carry the previous report's values for statements the
diff leaves untouched; the others were recomputed for the changed declarations.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| `swap_posPart`: `swap⁺ = swapPositive`, `swapPositive² = swapPositive` | a = [[0,1],[1,0]] | eigenvalues ±1; +1-eigenvector (1,1)/√2; spectral projection ½[[1,1],[1,1]] = q; q² = ¼[[2,2],[2,2]] = q | holds | delete (R06) |
| `swap_le_diagonal`: `swap ≤ diag(s,t) ↔ 1 ≤ st` with s,t ≥ 0 | (1,1), (½,3), (0,t), (−1,−1) | b−a = [[s,−1],[−1,t]], det st−1: (1,1) 0 ≥ 0 ✓; (½,3) ½ ✓; (0,t) det −1 ✗ and 1 ≤ 0 false ✓; (−1,−1): st = 1 but b−a = −[[1,1],[1,1]] ≤ 0, so `hs`, `ht` are needed and present | holds | delete (R06) |
| `positivePart_le_diagonal`: `q ≤ diag(s,t) ↔ s,t ≥ ½ ∧ (s−½)(t−½) ≥ ¼` (no sign hypotheses) | (1,1), (10,½), (½,3), (5/8,5) | b−q = [[s−½,−½],[−½,t−½]]: (1,1) ¼ ≥ ¼ ✓; (10,½) product 0 < ¼ and det −¼ ✗ consistent; (½,3) ✗; (5/8,5) 9/16 ≥ ¼ ✓; the diagonal conditions already force s,t ≥ ½ so no extra hypothesis is needed | holds | delete (R06) |
| `order_counterexamples` at (½,3) and (5/8,5) | — | (½,3): st = 3/2 ≥ 1, (0)(5/2) = 0 < ¼; (5/8,5): (1/8)(9/2) = 9/16 ≥ ¼, b² = diag(25/64, 25), 25/64 < ½ so b² ≱ q = q² | holds | delete (R06) |
| `compression_counterexample`: `¬ p q p ≤ q`, p = diag(1,0) | — | pqp = diag(½,0); q − pqp = [[0,½],[½,½]], det −¼ < 0 | holds | delete (R06) |
| `compression_le_iff_commute`: `pTp ≤ T ↔ Commute p T` (p star projection, T ≥ 0, unital) | D = ℂ (p ∈ {0,1}); p = e₁₁, T = q; commuting diagonal p, T | D = ℂ: both sides true; (e₁₁, q): pTp ≰ T and e₁₁q ≠ qe₁₁ (both false); diagonal: pTp = pT ≤ T since (1−p)T(1−p) ≥ 0 (both true); forward: X = T − pTp ≥ 0, pXp = 0 ⇒ X^{1/2}p = 0 ⇒ Xp = 0 ⇒ Tp = pTp = pT | holds | keep, move out of the override section (R06) |
| the four `def`s `swap`, `swapPositive`, `diagonal`, `firstProjection` | — | real bodies on `CStarMatrix (Fin 2) (Fin 2) ℂ`; not sorry'd data; used by no headline; absent from the README | padding | delete (R06) |
| `attribute [local instance 1100]` override | file with line 161 deleted | `swap⁺` fails: `PosPart M₂` not synthesised; with the override, elaborates | needs override | delete the section (R06) |
| one-tactic probe (`simp`) on the six new sorries | lines 177, 182, 187, 194, 200, 209 | "simp made no progress" ×4, unsolved goals ×2 | none closes | — |
| (r1) C1.AlgebraicLeftIdealApproximation: `e ∈ L` | L nonclosed, L = 0 | (δ+b)⁻¹b with b ∈ L; L = 0: e = 0 | holds | none |
| (r1) `‖x − xe‖² ≤ δ/4` | f(t) = δ²t/(δ+t)² | f′ = 0 at t = δ, f(δ) = δ/4 | holds | none |
| (r1) C1.CompactOperatorIdeals: ideals of B(H) are 0, K, B(H) | H = ℓ², H = ℂⁿ | cutoff p ∈ J with pH infinite-dimensional, isometry v with pv = v gives 1 ∈ J; ℂⁿ: K = B | holds | none |
| (r1) Pedersen ideal examples | K(H), C₀(X), unital A | finite rank; C_c(X); A | holds | none |
| (r1) M(C₀(X)) = C_b(X), M(K(H)) = B(H) | X = ℝ, H = ℓ² | compact-uniform; strong-* | holds | none |
| (r1) C1.CommutativeMultiplierMorphisms: h ↔ nondegenerate φ | X = ∅; Y = ∅; h proper | X = ∅: one map, one hom; Y = ∅: nondegenerate hom exists iff X = ∅; proper ⇔ f∘h ∈ C₀(X) | holds | none |
| (r1) recovering h from characters | x ∈ X | f ↦ φ(f)(x) nonzero character = ev at a unique point | holds | none |
| (r1) C2.CompactRepresentationModels: K(H) ⊆ π(A) | π(A) ∩ K ≠ 0 | Dixmier 4.1.10 route | holds | none |
| (r1) ρ ≅ π when ker ρ = ker π | CAR algebra, K(H) | CAR: two inequivalent faithful irreducibles; K(H): holds | fails as a standalone sentence | R12 |
| (r1) simple ∞-dim unital ⇒ compact-free image | K(H)⁺ | A = K(H) unital ⇒ dim H < ∞, contradiction | holds | none |
| (r1) pure states of K(H) ↔ P(H) | H = 0, H = ℂ² | H = 0: no states; ℂ²: vector states equal iff rays equal | holds | none |
| (r1) Prim(K(H)⁺) = {0, K(H)} | — | closure{0} = all; closure{K} = {K} | holds | none |
| (r1) C2.PureStateQuotientAndBaire: open continuous surjection | A = 0, A = ℂ | both spaces empty; one point to one point | holds | none |
| (r1) Prim(A) Baire for separable A | — | P(A) Polish ⇒ Baire; open continuous image of Baire is Baire | holds | none |
| (r1) C2.AnnHull: Ann(I) = ⨅_{P ∈ U_I} P | I = 0, I = A, A = 0 | U = ∅ ⇒ meet = A = Ann(0); I = A ≠ 0 ⇒ 0; A = 0 ⇒ 0 | holds | none |
| (r1) left = right annihilator | — | z ∈ I ∩ J ⇒ zz* = 0 ⇒ z = 0 | holds | none |
| (r1) hull(Ann I) = closure(U_I); essential ⇔ U_I dense | — | complement of closure(U_I) = interior(hull I) | holds | none |
| (r1) C2.MatrixFields: ideals = I_K | K = ∅, {0}, [0,1] | fibers M₂, ℂ, ℂ simple; hull(I_K) = K; I_∅ = A, I_{[0,1]} = 0 | holds | none |
| (r1) diagonal case extra ideals | K = {0}, {0} ∪ [½,1], [0,1] | 0 isolated: two extra ideals; K = [0,1]: none | holds | none |
| (r1) centers | four D | scalar C([0,1]) for full, diagonal, scalar; corner: C₀((0,1]) | holds | none |
| (r1) Prim(A_diag) topology | {0⁺}, (0,ε), 1/n | {0⁺} ∪ (0,ε) basis; 1/n → 0⁺ and 0⁻ | holds | none |
| (r1) B_X analogue | X = {0} ∪ {1/n} | isolated 1/n; 0± closed with cofinite-tail bases | holds | none |
| CStar.WStarJordanBoundary (ownership note) | — | V12.J.Maps, V12.J.Frame, V12.J.Scalar, V12.J.Dye at VNA dee80881 lines 3477–3571; "QF2" undefined here | holds as a deferral | R09 |
| (r1) `scalar_norm_le_unitizationLeftAction` | A = 0; A = C₀(ℝ), c = 1, a = 0 | A = 0 has unit e = 0, excluded by `hA`; C₀(ℝ): ‖I‖ = 1 ≥ 1 | holds | none |
| (r1) its proof route | ‖cI + L_a‖ < |c| | Neumann series gives a left unit e = L_a⁻¹a, then two-sided | holds | none |
| (r1) `unitization_norm_eq_leftAction` | x = (c, 0) | `Unitization.norm_def` max(|c|, ‖cI + L_a‖); the first theorem removes the max | holds | none |
| (r1) `exists_quasicentral_approximateUnit` | I = 0; A = 0 | l = pure 0 works; commutators 0 | holds | none |
| (r1) `closed_ideal_isHereditary` | I = A, I = 0 | trivial; 0 ≤ a ≤ 0 ⇒ a = 0 | holds | none |
| (r1) `IsNuclearContraction` | n = 0; φ = 0 | zero algebra; ‖φ‖ ≤ 1 forced | holds | none |
| (r1) `completelyPositive_matrix_bound` | n = 0; φ = id | 0 ≤ 0; ‖x‖ ≤ ‖1‖‖x‖ | holds | none |
| (r1) `schwarz` | φ = id, state on M₂ | a*a ≤ a*a; Cauchy–Schwarz | holds | none |
| (r1) `multiplicativeDomain_iff` | φ = id; diagonal expectation on M₂, a = e₁₂ | both sides true; E(e₂₁e₁₂) = e₂₂ ≠ 0, both sides false | holds | none |
| (r1) `cp_radonNikodym` | H = 0; ψ = φ; ψ = 0 | T = 0 unique; T = 1 unique on the minimal space; T = 0 | holds | none |
| (r1) Stinespring `‖V‖² = ‖φ‖` | φ = state | GNS: ‖V‖² = ω(1) | holds | none |
| (r1) Choi matrix and Kraus operators | φ = id on M₂ | Choi matrix rank 1; one Kraus operator | holds | none |
| C5 spatial norm `‖a⊗b‖min = ‖a‖‖b‖`, representation independence | A = 0; φ = 0 | both sides 0; V13b.SpatialNorm at dee80881 line 3744 states the same with Takesaki IV.4.9 | holds, duplicated | R03 |
| (r1) mapping cone section `a ↦ (a, tφ(a))` | — | lands in C_φ, CP, contractive | holds | none |
| (r1) C6 Grothendieck estimate | u = f·g, states | |f(a)g(b)| ≤ f(a*a)^{1/2} g(b*b)^{1/2} | holds | none |
| (r1) C7 Phillips ⇒ c₀ not complemented | μ_n = (P1_E)_n | Σ_k|μ_n({k})| = 1 ↛ 0 | holds | none |
| (r1) C8 Toeplitz extension | S forward shift | S*S = 1 ≠ SS* | holds | none |
| (r1) Voiculescu hypotheses | π faithful essential | ρ arbitrary allowed | holds | none |
| (r1) C9 D_I(B) norm and star closed | T_n = E_{0,n} | T_n → 0 strongly, T_n* e₀ = e_n no limit | holds | none |
| (r1) D_I(B)/ker q ≅ B** | B = 0, B unital | zero algebra; q unital | holds | none |
| (r1) C9 AF subquotient route | B = CA | E exact, RFD; CE ↪ AF | holds | none |

## Not verifiable

- The changed passages cite no source; the carried items of the previous report stand as
  there: Blackadar (Springer, paywalled, `uncertified`), Brown–Ozawa, Paulsen, Pisier, Runde
  (paywalled books, theorem numbers not checked), Arveson Acta Math. 123 (DOI paywalled, the
  Tsinghua mirror not used), Haagerup Adv. Math. 56 (DOI paywalled, the personal-page mirror
  not used), Rieffel "main" / "archive" notes (no bibliographic entry, nothing to fetch; the
  C2.MatrixFields and 2×2 statements were checked by direct computation instead).

## Source issues

- none
