# Review of CStarAlgebras (pull request #860 at 1d4e2ed)

**Verdict:** needs changes

The gate fails (imports, blob links, pull-request numbers); the targeted build passes. The
mathematics of the sampled targets is sound (values below). The blocking defects are structural:
two supply cycles with open sibling roadmaps, a definition whose data is drawn from a `sorry`, and
headline theorems that are statable at the pins but absent from `Suggested.lean`.

## R01 (P1) — Supply cycle with HilbertModules

**Location.** `TauCetiRoadmap/CStarAlgebras/README.md` line 450: "Consume HilbertModules
H5.CommutativeFiberExample … for the compact commutative pullback example".

**Claim.** HilbertModules is a supplier of C2.MatrixFields.

**Witness.** HilbertModules at its open head (f192548, the very commit the link pins), README
line 39 "CStarAlgebras C1–C2 supplies ideals, approximate …", line 248 "using CStarAlgebras
C7–C9", line 439 "CStarAlgebras C2's pure-state/irreducible-GNS". This README line 331 also
sends its separation theorem to "HilbertModules H7". Both directions are stated: a cycle.

**Repair.** Delete the citation at line 450 and the sentence after it. C2.MatrixFields does not
use the commutative pullback example (the README itself says the layer "uses no C2 primitive
classification" and the matrix-field computation is self-contained). If the commutative fiber
formula `‖f_x‖ = sup_{y ∈ h⁻¹{x}} |f(y)|` is wanted here, state it as a target of C2 with its own
proof route (restriction, Tietze extension, Urysohn cutoffs); never cite HilbertModules. Tested on
the instance that refuted the original: with the citation gone the only edges between the two
roadmaps run HilbertModules → CStarAlgebras.

## R02 (P1) — Supply cycle with VonNeumannAlgebras through V13b

**Location.** README lines 46–48: "V13b owns injectivity versus semidiscreteness and consumes
C5's minimal tensor construction"; lines 626–628: "consuming V13b's explicit
commuting-representation minimal-norm criterion and its normal CP/predual approximation
equivalents".

**Claim.** C6 consumes V13b while V13b consumes C5.

**Witness.** VonNeumannAlgebras at its open head (87aeca1), README line 2533: "This layer consumes
V13a and CStarAlgebras C5's minimal tensor norm, representation independence, slice maps and
spatial completion", and lines 63–64 say the same in its conventions. C5 → V13b → C6 is a cycle
between the two roadmaps' layers, which the principle "single direction of supply" forbids.

**Repair.** Move ownership so that VonNeumannAlgebras is a supplier only. The three statements
that V13b builds on C5 (the commuting-representation minimal-norm criterion, Takesaki III
XV.3.1; its normal CP and predual approximation equivalents; injectivity iff semidiscreteness for
an arbitrary W*-algebra) become targets of C6 here, with `*Needs:*` V13a (Arveson extension,
Tomiyama, the projection definition of injectivity), V2 (spatial tensors), V4 (normality), and
C5. Lines 46–48 and the sentence "Build missing interfaces in the owning development and expose
them for both roadmaps" (line 59) go; C6 then cites only V13a. The sibling roadmap must drop its
C5 citation in its own pull request, but this roadmap's text must not wait for that. Tested: with
C6 owning those targets, every remaining VonNeumannAlgebras citation here (V0, V1, V2, V4, V5,
V10–V11, V12.J, V13a) points at a layer that cites nothing of this roadmap.

Note for the board: two open pull requests add a `VonNeumannAlgebras` folder (the 3036-line one
at 87aeca1 with V0–V13, and a 396-line one at 8b00f8a with V0–V4 only). The sections cited here
(V5, V10–V11, V12.J, V13a) exist only in the former.

## R03 (P2) — `multiplicativeDomain` is sorry'd data

**Location.** `TauCetiRoadmap/CStarAlgebras/Suggested.lean` lines 119–121: `def
multiplicativeDomain … := (multiplicativeDomain_isClosedStarSubalgebra φ hφ).choose`.

**Claim.** A real definition on native carriers.

**Witness.** The chosen witness comes from a theorem whose proof is `sorry` (line 117). A scratch
`#print axioms CStarAlgebras.multiplicativeDomain` elaborated at the pin reports `sorryAx` among
its axioms. The rule "no sorry'd data … and nothing that mentions one" is violated; the gate's
`sorry-data` scanner only sees literal `sorry` bodies.

**Repair.** Delete `multiplicativeDomain`, `isClosed_multiplicativeDomain` and
`mem_multiplicativeDomain` (lines 119–131). The existence theorem
`multiplicativeDomain_isClosedStarSubalgebra` already states the mathematics; the README keeps the
bundled subalgebra as a C4 target. Tested: the remaining file elaborates with the `sorry` warnings
only.

## R04 (P2) — Statable headline theorems are absent; the docstring names none as unstatable

**Location.** `Suggested.lean` lines 13–18 (module docstring) and the declarations that follow.

**Claim.** The file states the roadmap's headline theorems.

**Witness.** The README's principal results (line 5–8): Stinespring and Wittstock theory,
nuclearity characterizations, Choi–Effros lifting, Kirchberg's WEP/LLP, Voiculescu's theorem,
plus Kadison transitivity (C2). At the pin, `CompletelyPositiveMap` (Mathlib
`Analysis/CStarAlgebra/CompletelyPositiveMap.lean` line 50), `StarAlgHom` into `H →L[ℂ] H`,
`ContinuousLinearMap.adjoint` and `IsCompactOperator`
(`Analysis/Normed/Operator/Compact/Basic.lean` line 69) make at least these statable:

- Stinespring dilation: for `φ : D →CP (H →L[ℂ] H)` with `D` unital there exist a Hilbert
  space `K`, a `π : D →⋆ₐ[ℂ] (K →L[ℂ] K)` and `V : H →L[ℂ] K` with `φ a = V† ∘ π a ∘ V` and
  `‖V‖² = ‖φ 1‖` (the file already uses exactly these carriers as *hypotheses* of
  `cp_radonNikodym`; the nonunital form with `‖V‖² = ‖φ‖` needs the cb norm, which the
  `→CP` carrier does not carry, so it is stated after a unitization);
- Kadison transitivity, with irreducibility as the predicate "no closed invariant subspace other
  than `⊥` and `⊤`" on `Submodule ℂ H` and the bound `‖a‖ ≤ ‖T‖`;
- Voiculescu's theorem in the C8 form (unitaries `U_n : H ≃ₗᵢ[ℂ] H ⊕ K`, compact differences
  tending to zero in norm), with separability as `TopologicalSpace.SeparableSpace`.

None is stated; instead the file carries C1 norm comparisons and C4 API lemmas. The docstring
does not say which headlines are unstatable and why (nuclearity ⇔ min = max, Kirchberg's tensor
characterizations and Choi–Effros need C*-tensor products and C*-quotients that the pin lacks).

**Repair.** State Stinespring (with the minimal-dilation uniqueness if wanted), Kadison
transitivity and Voiculescu's theorem; rewrite the docstring in the form "C*-algebras, operator
spaces, and approximation: target signatures", listing the tensor-dependent headlines as not
statable and naming the missing carriers (`A ⊗min B`, `A ⊗max B`, C*-quotients, `A**` as a
W*-algebra). Tested: a scratch copy of the file with the single `import Mathlib`, the deletions
of R03 and R11, and the unital Stinespring statement above appended elaborates with eleven
`sorry` warnings and no error.

## R05 (P2) — Mutual citation with OperatorTheory and a placement conflict on main

**Location.** README line 60: "OperatorTheory supplies Hilbert-space geometry, adjoints, compact
operators, polar decomposition and spectral theory."

**Claim.** OperatorTheory is a supplier.

**Witness.** `TauCetiRoadmap/OperatorTheory/README.md` on main (4d14cbd) is an umbrella: line 67
"CStarAlgebras C8 owns its scalar shift extension", and its dependency table (line 83) lists
`CStarAlgebras C1/C5/C8` as a prerequisite of its `ToeplitzOperators` sub-roadmap;
`OperatorTheory/ToeplitzOperators/README.md` lines 24, 193, 195 cite C8, C5 and C1. The merge
order lists `OperatorTheory` at position 251 as one unit, so the two roadmaps cite each other.
Also on main, `OperatorAlgebraDynamics` (position 246, before OperatorTheory) line 40 and
`FreeProbability` line 55 consume CStarAlgebras C1–C7; inserting this roadmap after
OperatorTheory puts it after a consumer.

**Repair.** Cite the sub-roadmaps actually used, by name and section:
`OperatorTheory/PolarDecomposition` (polar decomposition, operator modulus),
`OperatorTheory/SelfAdjointSpectralTheory` (bounded Borel calculus, used by
C1.CompactOperatorIdeals for the spectral cutoff), and Mathlib directly for adjoints and compact
operators (`ContinuousLinearMap.adjoint`, `IsCompactOperator`). Never cite the umbrella or
`ToeplitzOperators`. The board then places this roadmap before `OperatorAlgebraDynamics` and
`FreeProbability`, which the depcheck cannot see because neither is in the merge-order file. The
dependency check output at this head:

```
NOT IN ORDER: CStarAlgebras (insert it after its last supplier)
depcheck: 155 roadmaps, 1063 edges, 1 problem(s)
```

No UPWARD or CYCLE line; the cycles in R01, R02 and R05 are invisible to it because
HilbertModules, VonNeumannAlgebras and the OperatorTheory sub-roadmaps are not in its order
file.

## R06 (P3) — Gate: `Suggested.lean` imports

**Location.** `Suggested.lean` lines 5–11: seven `import Mathlib.<submodule>` lines and no `import
Mathlib`.

**Witness.** Gate rules `imports`, `mathlib-subimports` (7) and `no-import-mathlib` (1) all fail.

**Repair.** Replace lines 5–11 by the single line `import Mathlib`. Tested: the file elaborates
under `import Mathlib` with the same ten `sorry` warnings (`CStarMatrix`, `→CP`, `Unitization`,
`TwoSidedIdeal` are all in the full import).

## R07 (P3) — Gate: supplier links pinned to commits that are not on main

**Location.** README lines 32, 34, 41, 450: links of the form
`github.com/TauCetiProject/TauCetiRoadmap/blob/<sha>/…`.

**Witness.** Gate rule `blob` (4). None of 8ec510e, 4ca3e99, a94eaf8, f192548 is an ancestor of
main (`git merge-base --is-ancestor` fails for each); the first two are commits of pull requests
that *revise* `BanachSpaceTheory` and `BanachAlgebras`, which are never dependencies: the roadmap
on main is. On main the cited material exists: BanachSpaceTheory B1 (line 41), B2 (74), B4 (167),
B7 local reflexivity (419); BanachAlgebras A1 annihilators and hull–kernel topology (122), A3
character comparison with the isolated augmentation (430–448), A4 Arens products (731), A6
virtual diagonals (845).

**Repair.** Cite by roadmap name and section (`BanachSpaceTheory B1`, `BanachAlgebras A1`,
`VonNeumannAlgebras V0`), with relative links to `../<Name>/README.md` where a link is wanted.
Same at line 450 (which R01 deletes).

## R08 (P3) — Gate: pull-request numbers, process narrative, undefined labels

**Location.** README lines 1001, 1003, 1005, 1012 (`PR #42095`, `PR #42100`, `PR #24106`,
`Physlib PR #1191`); line 103 ("all six Preventive Medicine questions"); lines 106–108 ("Retain
the source solution's strict/non-strict boundary wording and its insufficient square-root
justification"); lines 443–445 ("retain that identification as an unresolved source claim");
lines 455–457 ("Their source indexing, cutoff estimates and tentative identifications remain
separate"); lines 1009–1010 ("adapt to that class design as it becomes available"); lines
1016–1017 ("Coordinate with those authors before integrating their code"); line 73 ("QF2");
line 59 ("Build missing interfaces in the owning development and expose them for both
roadmaps").

**Witness.** Gate rule `prnum` (4). The other passages are process narrative or commentary on a
source's solution, which a reader a year from now cannot place; "Preventive Medicine" is neither
standard vocabulary nor defined; "QF2" is a label internal to the VonNeumannAlgebras README and
is undefined here.

**Repair.** Delete the Mathlib and Physlib pull-request paragraph (keep, if wanted, one sentence
naming the Mathlib declarations to align with, by name). Delete the quoted process sentences; the
2×2 matrix-order Checks stand on their own. Replace "QF2" by the VonNeumannAlgebras section name
or drop the sentence. Replace "unresolved source claim" by a definite decision: either state the
operator `T` and the target `C*(T) ≅ B_X` as a theorem, or omit it.

## R09 (P3) — README shape: no supplier contracts, no `*Needs:*` lines, no Checks, no locators

**Location.** Whole README. Headings are `## C1.` … `## C9.` and `## References and design
evidence`; there is no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`,
`## How to read the build`, no `### k.n` subsections, no `### Examples` or `### Dependencies`,
no `**Checks.**` bullet lists and no `*Needs:*` lines.

**Witness.** Of the sampled targets, C1.AlgebraicLeftIdealApproximation, C1.CompactOperatorIdeals,
C1.CommutativeMultiplierMorphisms, C2.CompactRepresentationModels, C2.PureStateQuotientAndBaire
and C2.AnnHull carry no locator at all; C2.MatrixFields cites "Rieffel main pp104–108,129–136 and
archive 0210_001 pp2–6 / 0210_026 pp2–9", a text with no bibliographic entry. The folder has no
`sources.toml`. The brief's checklist (every theorem its exact hypotheses and a locator, every
definition at least three discriminating Checks, every layer its dependencies) is not met
anywhere.

**Repair.** Restructure in the TauCetiRoadmap shape: scope and ownership (the deferrals to
HilbertModules, OperatorAlgebraDynamics, OperatorKTheory, CStarClassification, FreeProbability
go there), conventions, exact supplier contracts (Mathlib declarations by name as now, plus
BanachAlgebras, BanachSpaceTheory, VonNeumannAlgebras sections), layers C1–C9 with `### k.n`
subsections, each theorem with its locator (Blackadar II.5.3.2 for the hereditary
correspondence, Dixmier 3.4.11 and 3.4.13 for the pure-state quotient and Baire, Arveson 1.4.2
for Radon–Nikodym, and so on), each definition with `**Checks.**`, each layer ending with
`### Examples` and `### Dependencies`; and a `sources.toml` with one key per work.

## R10 (P3) — A second Lean file that the gate does not build

**Location.** `TauCetiRoadmap/CStarAlgebras/MatrixOrderSuggested.lean` (72 lines), linked from
README line 105.

**Witness.** The gate's targeted build is `TauCetiRoadmap.CStarAlgebras.Suggested` only; the
file is not imported anywhere. It contains six sorried theorems that compute 2×2 examples
(`swap_posPart`, `swap_le_diagonal`, `positivePart_le_diagonal`, `order_counterexamples`,
`compression_counterexample`), i.e. declarations that mirror README Checks, plus an instance
priority override (`attribute [local instance 1100] …`) and submodule imports. It elaborates
(six `sorry` warnings), but nothing in the process holds it to the acceptance-test rules.

**Repair.** Delete the file and the link. The README keeps the 2×2 computations as Checks of
C1 (they are correct, see the table) and `pTp ≤ T ↔ Commute p T` as a C1 target.

## R11 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean` lines 29–36 (`norm_leftMultiplication`,
`norm_rightMultiplication`), 56–57 (`IsHereditary`), 123–131 (`isClosed_multiplicativeDomain`,
`mem_multiplicativeDomain`).

**Witness.** The first two are proved by one library lemma each
(`ContinuousLinearMap.opNorm_mul_apply`, Mathlib `Analysis/Normed/Operator/Mul.lean` line 122;
`opNorm_mul_flip_apply`, `Analysis/CStarAlgebra/Unitization.lean` line 34). `IsHereditary` is
used by no declaration (`closed_ideal_isHereditary` spells the condition out). The last two are
projections of a `choose_spec`. One-tactic probes (`rfl`, `simp`, `infer_instance`, `exact?`)
on scratch copies of the nine sorried theorems closed none of them, so those are not padding.

**Repair.** Delete the five declarations from `Suggested.lean`; the README keeps the norm
identities as C1 facts citing the Mathlib names. The remaining C1 and C4 lemmas
(`scalar_norm_le_unitizationLeftAction`, `unitization_norm_eq_leftAction`,
`closed_ideal_isHereditary`, `schwarz`, `multiplicativeDomain_iff`) are API statements rather
than headlines; keep them only if the author regards them as acceptance tests, after R04 adds the
headlines.

## R12 (P3) — C2.CompactRepresentationModels: a hypothesis lives in the previous sentence

**Location.** README lines 293–295: "If irreducible ρ has kerρ=kerπ, prove ρ and π unitarily
equivalent, without a separability or global GCR hypothesis."

**Claim.** Read alone, equal kernels force equivalence.

**Witness.** False without `π(A) ∩ K(H) ≠ 0`: the CAR algebra is simple, so every irreducible
representation has kernel `0`, and it has inequivalent irreducibles (the GNS representations of
the two Fock states for the two quasi-free gauge-invariant extremes). The intended hypothesis is
the "one nonzero compact in π(A)" of the preceding sentence.

**Repair.** "If π(A) contains a nonzero compact operator and ρ is irreducible with ker ρ = ker π,
then ρ ≅ π." Tested: on the CAR algebra the hypothesis fails, so the restated claim is not
refuted; on `K(H)` with π the defining representation it holds (both are the identity).

## R13 (P3) — Sources: mirrors and unidentifiable locators

**Location.** README lines 967–968 (Arveson, link to a Tsinghua "archive" copy), 976–977
(Haagerup, link to a personal "collected works" page), 443 and 455–456 (Rieffel "main" /
"archive 0210_001", "0210_026").

**Witness.** Neither link is the publisher's or an author's copy. The sources service resolves
Arveson (10.1007/BF02392388) and Haagerup (10.1016/0001-8708(85)90026-X) only to paywalled
publisher pages and records both as `uncertified`. The Rieffel texts have no author, title, year
or venue anywhere in the README.

**Repair.** Cite Arveson by its DOI and the Acta Mathematica open back-issue copy on Project
Euclid; cite Haagerup by its DOI (Advances in Mathematics open archive) and drop the mirror link.
Give the Rieffel notes a bibliographic entry (author, title, year, where held) or replace the
locators by Dixmier/Blackadar section numbers, which cover every statement of C2.MatrixFields.

## Verified sound

**Gate and builds.** `lake env lean` on `Suggested.lean` from the worktree: exit 0, ten
`declaration uses sorry` warnings (lines 39, 46, 73, 81, 87, 96, 101, 106, 112, 142), nothing
else. `MatrixOrderSuggested.lean`: exit 0, six `sorry` warnings. Gate at 1d4e2ed: build passed;
failures only `imports`, `mathlib-subimports`, `no-import-mathlib`, `blob`, `prnum`; depcheck
`NOT IN ORDER` (not a defect). No `set_option`, no literal sorry'd data, no edits outside the
folder (`git diff --stat origin/main...HEAD` excluding the folder is empty).

**Signature check.** A scratch file with `#check @name` for all 18 declarations elaborated once;
every elaborated type agrees with its README statement, and no `def` lost a section variable its
type needs (`IsHereditary` keeps only `PartialOrder`, which is all it mentions;
`IsCompletelyBounded` and `IsNuclearContraction` keep the order instances `→CP` needs). Changed
by that check: nothing, except the `sorryAx` dependency of `multiplicativeDomain` (R03).

**Pinned Mathlib declarations opened** (file and line under `Mathlib/`):
`ContinuousLinearMap.opNorm_mul_apply` (Analysis/Normed/Operator/Mul.lean:122),
`opNorm_mul_flip_apply` (Analysis/CStarAlgebra/Unitization.lean:34),
`CStarRing.instRegularNormedAlgebra` (same file:60), `Unitization.norm_def` and `splitMul`
(Analysis/Normed/Algebra/Unitization.lean:135, 79), `Unitization.starLift`
(Algebra/Algebra/Unitization.lean:804), `Unitization.fstHom` (same:661),
`Unitization.inrNonUnitalAlgHom` (same:676), `gelfandTransform_isometry`,
`gelfandTransform_bijective`, `gelfandStarTransform`
(Analysis/CStarAlgebra/GelfandDuality.lean:141, 156, 189), `CStarAlgebra.approximateUnit`
(Analysis/CStarAlgebra/ApproximateUnit.lean:214), `Filter.IsIncreasingApproximateUnit`
(same:142), `DoubleCentralizer` (Analysis/CStarAlgebra/Multiplier.lean:67),
`CompletelyPositiveMap` and `→CP` (Analysis/CStarAlgebra/CompletelyPositiveMap.lean:50, 72),
`CStarMatrix.ofMatrix`, `CStarMatrix.map`, the square-matrix `PartialOrder`
(Analysis/CStarAlgebra/CStarMatrix.lean:54, 69, 803), `CFC.sqrt_le_sqrt`
(Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Rpow/Order.lean:89), `posPart`
notation `⁺` (…/PosPart/Basic.lean:31), `TwoSidedIdeal.comap`
(RingTheory/TwoSidedIdeal/Operations.lean:122), `Ideal.toTwoSided` (same:392),
`Module.annihilator` with its `IsTwoSided` instance (RingTheory/Ideal/Maps.lean:866–878, as the
README's link says), `lp.inftyCStarRing` (Analysis/Normed/Lp/lpSpace.lean:892), `Circle`
(Analysis/Complex/Circle.lean:53), `NonUnitalCommCStarAlgebra`, `CommCStarAlgebra`
(Analysis/CStarAlgebra/Classes.lean:34, 42), `Module.complexToReal`, `Algebra.complexToReal`
(LinearAlgebra/Complex/Module.lean:168, 174), `IsStarProjection`
(Algebra/Star/StarProjection.lean:26), `IsCompactOperator`
(Analysis/Normed/Operator/Compact/Basic.lean:69). Mathlib has no quasicentral approximate unit
and no hereditary-subalgebra predicate at the pin (grep of `quasicentral`, `hereditary`), so
those targets are not duplicates.

**Cross-roadmap citations resolved.** BanachSpaceTheory B1, B2, B4, B7 (main, lines 41, 74,
167, 419); BanachAlgebras A1, A2, A3, A4, A6 (main, lines 75, 161, 407, 697, 801; annihilators
and hull–kernel at 122, isolated augmentation at 443–446, Arens at 731, virtual diagonal at 845);
VonNeumannAlgebras V0.SeparableFaithful, V1, V2, V4, V5, V10, V11, V12.J (with V12.J.Maps and the
type I₂ exception), V13a, V13b at head 87aeca1 (lines 149, 196, 268, 540, 784, 1385, 1808, 2366,
2368, 2440–2456, 2510, 2531); HilbertModules H5.CommutativeFiberExample and H7 at head f192548
(lines 345, 568); OperatorAlgebraDynamics D1 (main, line 75); FreeProbability (main, exists);
consumers OperatorKTheory K2 cone/mapping-cone (head d1b2465, line 183) and CStarClassification
C9 norm-perturbation (head a8c334e, lines 51, 93, 115) say what this README says they consume.
Ownership against open pull requests was checked only for the sibling checkouts the brief lists;
the HilbertModules path given for #1149 contains no HilbertModules folder (that pull request
carries other roadmaps), so HilbertModules was checked at #861 only.

**Duplication by object.** Hereditary subalgebras, quasicentral approximate units, CP ⇒ CB,
Schwarz, multiplicative domains, Radon–Nikodym: none at the pin (grep by object:
`quasicentral`, `hereditary`, `Schwarz`, `multiplicativeDomain`, `Stinespring` in Mathlib and
Tau Ceti return nothing relevant). The unitization-norm comparison restates
`Unitization.norm_def` plus the nonunital inequality `|λ| ≤ ‖λI + L_a‖`, which Mathlib does not
have.

**Adversarial table.** One row per statement; values computed on each side.

| Statement | Instances tried | Values | Result | Change |
|---|---|---|---|---|
| C1.MatrixOrderExamples: `q = a⁺`, `q² = q` | `a = [[0,1],[1,0]]` | eigenvalues ±1, eigenvector of +1 is (1,1)/√2; projection = ½[[1,1],[1,1]] = q; q² = q | holds | none |
| `b ≥ a ⇔ st ≥ 1` (s,t ≥ 0) | (1,1), (½,3), (½,1) | b−a = [[s,−1],[−1,t]]: det = st−1; (1,1): 0 ≥ 0 ✓; (½,3): ½ ✓; (½,1): −½ ✗ | holds | none |
| `b ≥ q ⇔ s,t ≥ ½ ∧ (s−½)(t−½) ≥ ¼` | (½,3), (5/8,5), (1,1) | (½,3): product 0 < ¼ ✗; (5/8,5): (1/8)(9/2) = 9/16 ≥ ¼ ✓; (1,1): ¼ ≥ ¼ ✓ | holds | none |
| `b ≥ a ≥ −1`, `b ≥ 0`, `b ≱ a⁺` at (½,3) | — | st = 3/2 ≥ 1; a has eigenvalue −1; b ≥ 0; (s−½)(t−½) = 0 | holds | none |
| `b ≥ a⁺ ≥ 0`, `b² ≱ (a⁺)²` at (5/8,5) | — | b² = diag(25/64, 25); 25/64 − ½ < 0 so b² − q has a negative diagonal entry | holds | none |
| squared region = replace s,t by s²,t² | (1,1) | b² = diag(s²,t²) ≥ q ⇔ s² ≥ ½, t² ≥ ½, (s²−½)(t²−½) ≥ ¼ | holds | none |
| `pTp ≰ T` for p = diag(1,0), T = q | — | pTp = diag(½,0); T − pTp = [[0,½],[½,½]], det = −¼ < 0 | holds | none |
| `pTp ≤ T ⇔ pT = Tp` (p star projection, T ≥ 0) | commuting diag p, T; p = e₁₁, T = q | X = T − pTp ≥ 0 and pXp = 0 ⇒ X^{1/2}p = 0 ⇒ Xp = 0 ⇒ Tp = pTp = pT; converse (1−p)T(1−p) = T − pTp ≥ 0 | holds | none |
| C1.AlgebraicLeftIdealApproximation: `e ∈ L` | L nonclosed, L = 0 | (δ+b)⁻¹b with b ∈ L and L a complex subspace, unitization acts; L = 0: b = 0, e = 0 | holds | none |
| `‖x − xe‖² ≤ δ/4` | f(t) = δ²t/(δ+t)² | f′ = 0 at t = δ, f(δ) = δ/4; x*x ≤ b_F gives ‖(1−e)x*x(1−e)‖ ≤ ‖b(1−e)²‖ | holds | none |
| C1.CompactOperatorIdeals: ideals of B(H) are 0, K, B(H) (H separable ∞-dim) | H = ℓ², H = ℂⁿ | noncompact positive S⁺ in J; cutoff p = S⁺·g(S⁺) ∈ J with pH infinite-dim; isometry v with pv = v gives 1 = v*pv ∈ J; ℂⁿ: K = B, quotient 0 | holds | none |
| Pedersen ideal examples | K(H), C₀(X), unital A | finite rank; C_c(X); A | holds | none |
| M(C₀(X)) = C_b(X), M(K(H)) = B(H), strict topologies on bounded sets | X = ℝ, H = ℓ² | compact-uniform; strong-* | holds | none |
| C1.CommutativeMultiplierMorphisms: h ↔ nondegenerate φ | X = ∅; Y = ∅; h proper | X = ∅: C₀(X) = 0, one map, one hom; Y = ∅: nondegenerate hom exists iff X = ∅, maps X → ∅ exist iff X = ∅; proper ⇔ f∘h ∈ C₀(X) | holds | none |
| recovering h from characters | x ∈ X | nondegeneracy gives φ(f)(x) ≠ 0 for some f, so f ↦ φ(f)(x) is a nonzero character = ev at a unique point | holds | none |
| C2.CompactRepresentationModels: K(H) ⊆ π(A) | π(A) ∩ K ≠ 0 | Dixmier 4.1.10 route; essential ideal K(H) of π(A) | holds | none |
| ρ ≅ π when ker ρ = ker π | CAR algebra (simple), K(H) | CAR: two inequivalent faithful irreducibles, kernels both 0; K(H): holds | fails as a standalone sentence | R12 |
| simple ∞-dim unital ⇒ compact-free image | K(H)⁺ unitization | K(H) ⊆ π(A) ≅ A simple ⇒ A = K(H), unital ⇒ dim H < ∞, contradiction | holds | none |
| pure states of K(H) ↔ P(H); H = 0 | H = 0, H = ℂ² | H = 0: no states; ℂ²: vector states, equal iff rays equal | holds | none |
| Prim(K(H)⁺) = {0, K(H)} | — | closure{0} = hull(0) = all; closure{K} = {K}; opens ∅, {0}, all | holds | none |
| C2.PureStateQuotientAndBaire: open continuous surjection | A = 0, A = ℂ | A = 0: both spaces empty; ℂ: one point to one point | holds | none |
| Prim(A) Baire for separable A | — | Q(A) compact metrizable, extreme points Gδ, remove 0 ⇒ P(A) Polish ⇒ Baire; open continuous image of Baire is Baire | holds | none |
| C2.AnnHull: Ann(I) = ⨅_{P ∈ U_I} P | I = 0, I = A, A = 0 | I = 0: U = ∅, meet = A = Ann(0); I = A ≠ 0: U = Prim, meet = 0 = Ann(A); A = 0: both 0 | holds | none |
| left = right annihilator | — | J = {a : aI = 0} two-sided; IJ ⊆ I ∩ J; z ∈ I ∩ J ⇒ zz* = 0 ⇒ z = 0 | holds | none |
| hull(Ann I) = closure(U_I); essential ⇔ U_I dense; U_{Ann I} = int(hull I) | — | closure S = hull(⋂S); complement of closure(U_I) = interior(hull I) | holds | none |
| C2.MatrixFields: ideals = I_K for full/corner/scalar | K = ∅, K = {0}, K = [0,1] | fibers simple (M₂, ℂ, ℂ); hull(I_K) = K by cutoff g·e₁₁; I_∅ = A, I_{[0,1]} = 0 | holds | none |
| diagonal case extra ideals | K = {0}, K = {0} ∪ [½,1], K = [0,1] | 0 isolated: two extra `{f : f|_{K∖0} = 0, f(0) ∈ ℂe_jj}`; K = [0,1]: none (0 not isolated) | holds | none |
| centers | four D | scalar C([0,1]) for full, diagonal, scalar; corner: h(0)I₂ ∈ ℂe₁₁ ⇒ h(0) = 0 ⇒ C₀((0,1]) | holds | none |
| Prim(A_diag) topology | {0⁺}, (0,ε), sequence 1/n | closure{0⁺} = hull(ker 0⁺) = {0⁺}; closed sets without 0⁺ are T or T ∪ {0⁻} with T not accumulating at 0, so {0⁺} ∪ (0,ε) is a basis; 1/n → 0⁺ and 0⁻ | holds | none |
| B_X analogue | X = {0} ∪ {1/n} | isolated 1/n; 0± closed with cofinite-tail bases | holds | none |
| CStar.WStarJordanBoundary (ownership note) | — | V12.J, V12.J.Maps, type I₂ exception exist at VNA head lines 2366, 2368, 2440–2456; "QF2" undefined here | holds as a deferral | R08 |
| `scalar_norm_le_unitizationLeftAction` | A = 0; A = C₀(ℝ), c = 1, a = 0 | A = 0 has a unit (e = 0), excluded by `hA`, and the bound |c| ≤ 0 would fail; C₀(ℝ): ‖I‖ = 1 ≥ 1 | holds | none |
| its proof route | ‖c I + L_a‖ < |c| | I − T/c = −L_a/c invertible by Neumann; e = L_a⁻¹a left unit; e* right unit; e = ee* = e* two-sided | holds | none |
| `unitization_norm_eq_leftAction` | x = (c, 0) | `Unitization.norm_def`: ‖x‖ = max(|c|, ‖cI + L_a‖); the first theorem removes the max | holds | none |
| `exists_quasicentral_approximateUnit` | I = 0; A = 0 | l = pure 0: NeBot, eventually e ∈ I, e·a → a for a ∈ I = {0}, commutators 0 | holds | none |
| `closed_ideal_isHereditary` | I = A, I = 0 | trivial; 0 ≤ a ≤ 0 ⇒ a = 0 | holds | none |
| `IsNuclearContraction` | n = 0; φ = 0 | n = 0 gives the zero algebra, so φ = 0 is nuclear; definition forces ‖φ‖ ≤ 1 (limit of contractions) | holds | none |
| `completelyPositive_matrix_bound` | n = 0; φ = id | 0 ≤ ‖1‖·0; ‖x‖ ≤ ‖1‖·‖x‖ with ‖1‖ = 1 in a nontrivial algebra, 0 ≤ 0 in the trivial one | holds | none |
| `schwarz` | φ = id, φ = state on M₂ | a*a ≤ a*a; |ω(a)|² ≤ ω(a*a) is Cauchy–Schwarz | holds | none |
| `multiplicativeDomain_iff` | φ = id; φ = conditional expectation onto diagonal of M₂, a = e₁₂ | id: both sides true; E(e₂₁e₁₂) = e₂₂ ≠ 0 = E(e₁₂)*E(e₁₂), and E(e₁₂b) ≠ E(e₁₂)E(b) = 0 for b = e₂₁: both sides false | holds | none |
| `cp_radonNikodym` | H = 0; ψ = φ; ψ = 0 | H = 0 forces K = 0 by minimality, T = 0 unique; ψ = φ: T = 1 unique on the minimal space; ψ = 0: T = 0 | holds | none |
| Stinespring `‖V‖² = ‖φ‖`, isometry when unital | φ = state | K = GNS space, V ξ = ξ ⊗ Ω, ‖V‖² = ω(1) = ‖ω‖ | holds | none |
| Choi matrix and Kraus `V_k : ℂ^m → ℂ^n` | φ = id on M₂ | Choi matrix Σ e_ij ⊗ e_ij rank 1; one Kraus operator V = 1 | holds | none |
| C5 `‖φ ⊗ ψ‖ = ‖φ‖‖ψ‖` on min | φ = 0 | both sides 0 | holds | none |
| mapping cone section `a ↦ (a, tφ(a))` | — | lands in C_φ since f(1) = φ(a); CP since each t ↦ tφ(·) is CP; contractive | holds | none |
| C6 Grothendieck estimate | u(a,b) = f(a)g(b), states f, g | |f(a)g(b)| ≤ f(a*a)^{1/2} g(b*b)^{1/2} ≤ RHS with f₁ = f, g₁ = g, ‖u‖ = 1 | holds | none |
| C7 Phillips ⇒ c₀ not complemented | μ_n(E) = (P1_E)_n | μ_n({k}) = δ_nk, Σ_k|μ_n({k})| = 1 ↛ 0 while μ_n(E) → 0 | holds | none |
| exactness not preserved by extensions (not asserted) | — | the README correctly refrains | holds | none |
| C8 Toeplitz extension | S forward shift | S*S = 1 ≠ SS*, so not stably finite, not QD; symbol z | holds | none |
| Voiculescu statement hypotheses | π faithful essential | ρ arbitrary allowed because ker π = 0 and π(A) ∩ K = 0 | holds | none |
| C9 D_I(B) norm closed and star closed; K(ℓ²) control | T_n = E_{0,n} | T_n ξ = ξ_n e₀ → 0, T_n* e₀ = e_n no limit; strong-* limit families Cauchy by ‖lim‖ ≤ liminf | holds | none |
| D_I(B)/ker q ≅ B** | B = 0, B unital | zero algebra; constant 1 unit, q unital; injective *-hom isometric | holds | none |
| C9 AF subquotient route | B = CA | E exact (ideal ⊕M nuclear, quotient B exact, locally split), RFD; CE ↪ AF; CE → E → CA → A surjective | holds | none |

Instances tried on every target of a finding are in the rows above (the two 2×2 families,
the CAR algebra, A = 0, I = 0, n = 0, H = 0).

**Checks on open sibling heads.** VonNeumannAlgebras V13b's dependency on C5 (R02) and
HilbertModules' dependency on C1–C2, C2, C7–C9 (R01) were read at the heads named in the brief,
not remembered.

## Not verifiable

- Rieffel "main pp104–108, 129–136" and "archive 0210_001 pp2–6 / 0210_026 pp2–9" (C2.MatrixFields
  and the 2×2 Checks): no author, title, year or venue in the README, no `sources.toml`; nothing to
  fetch. Checked instead by direct computation (table).
- Blackadar, *Operator Algebras* (II.4–II.9, III.5.2, IV.3, V.4): Springer, paywalled; the service
  records `uncertified`; no local copy. Section numbers II.5.2.4, II.5.3.2, II.6.4.8, IV.3.2.4 not
  checked against the text.
- Brown–Ozawa, Paulsen (Theorems 3.14, 3.18, 8.2–8.5, 9.1, 13.4), Pisier (Theorems 4.1, 5.1),
  Runde (Corollaries 6.4.27, 6.5.12): paywalled books, no local copy; theorem numbers not checked.
- Arveson, Acta Math. 123 (1969), Lemma 1.4.1 and Theorem 1.4.2 pp. 159–160: the DOI resolves to a
  paywalled page (`uncertified`); the README's Tsinghua mirror was not used. The statement matches
  the standard Radon–Nikodym theorem for CP maps.
- Haagerup, Adv. Math. 56 (1985), Theorem 1.1 p. 94: DOI paywalled (`uncertified`); the README's
  personal-page mirror was not used. The displayed inequality is the standard form.

## Source issues

- none
