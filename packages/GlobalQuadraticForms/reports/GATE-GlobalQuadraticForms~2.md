# GATE-GlobalQuadraticForms~2: answers to human review

One review is answered here: CBirkbeck's review of `1bc4ccc`, nine findings
F01–F09, numbered H01–H09 below. This round commits `4fffe86`, "GlobalQuadraticForms: review
repairs (drop pinned headlines, module header, rank-zero fix, house-form README)". The commit
changes only `TauCetiRoadmap/GlobalQuadraticForms/README.md` and
`TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`. It is not pushed.

**Which pin.** The branch's `lake-manifest.json` pins Tau Ceti `358314d` and Mathlib `f6090c7`, and
the build in the worktree runs against those. Main pins Tau Ceti `2fd255d` and Mathlib `1b1ccf4`
(the bump in #1800), which is the pin this job is checked against. The reviewer's file:line
references are at `358314d`. The inventory below is checked at `2fd255d`. Several declarations
the README now cites exist only there: `SignPrescription.lean`, `ProductFormula.lean`,
`WittLocalization.lean`, `Existence.lean`, `Hyperbolicity.lean` and `WorkedExamples/Sqrt5.lean`.
`Suggested.lean` uses only declarations whose statements are the same at both pins (checked by
`diff`: `Localization`, `Predicates`, `Invariants`, `FormInvariants`, `Representation`, `Witt/Ring`,
`Witt/BaseChange`), so it builds at either pin. The branch must take main's manifest before it
merges; this job may not touch the manifest.

## H01 (CBirkbeck) — applied

`README.md` old line 360, "a positive rank `n`" → line 95: the record has an unrestricted rank
`n : ℕ`, with positivity and finite support as clauses of `IsAdmissible`. Old line 879,
"`I.IsAdmissible ↔ ∃ Q regular over K, globalInvariants Q = I`" → line 586: admissible exactly when
it is the record of a regular form **of positive rank**, with the zero-form record `(0, [1], s ≡ 1,
p ≡ 0)` as a negative-control Check (line 603). Old lines 770–772 ("no unit-valued discriminant
representative") are deleted; line 98 now says that the zero form's discriminant is `[1]`, that its
record is realized and that it is not admissible.

The Lean `exists_globalForm_of_isAdmissible` (`Suggested.lean:111`) keeps only the safe forward
direction. Its docstring now names the excluded zero form. `equivalent_iff_globalInvariants_eq`
holds in rank zero (two zero forms: equal records, isometric), and the README says so (8.1).

## H02 (CBirkbeck) — applied

`Suggested.lean` now opens with `module` / `public import Mathlib` / `public import TauCeti.…` /
`public section`, the form already used by 12 `Suggested.lean` files on main (for example
`TauCetiRoadmap/PrimitivePrimeDivisors/Suggested.lean`). The module-system warning for this file is
gone: `gate --build` reports `build=0 OK`, where the reviewer's run had `build=12 FAIL`.

The brief's two-target build still prints 11 module warnings. They come from files outside this
folder that `TauCetiRoadmap.IntegralLattices.Suggested` imports, listed under **Build** below, and
this job cannot edit them. The same commit removes the three `letI`s in signatures that the gate
flagged (`statement-hygiene=3` at `1bc4ccc` → `0`). The non-module consumer still resolves both
names it `#check`s (`TauCetiRoadmap/IntegralLattices/Suggested.lean:402–403` elaborate in the build).

## H03 (CBirkbeck) — applied differently

The rank-at-least-five step (old §§5.3–5.4) is in Tau Ceti. Its approximation lemma is
`QuadraticForm.exists_apply_ne_zero_locallyRepresentsScalar_neg`
(`TauCeti/NumberTheory/QuadraticForm/Global/ApproximateValue.lean:61`, whose conclusion includes
`U x ≠ 0`). So old §5.4 moves to the supplier contracts instead of being patched in place.

§5.5 (lines 412–420) now describes the step through that lemma. It uses the reviewer's instance
`U = ⟨1,1⟩`, `W = ⟨1,−1,1⟩`: `x = 0` gives `b = 0` and a singular `⟨0⟩ ⊥ W`, while `x = (1,0)` gives
`b = 1` with `y = (0,1,0)`, `W(y) = −1`.

## H04 (CBirkbeck) — applied

Everything at the pin is now cited by exact name and file in "Exact supplier contracts" (from
line 118) and listed in "Scope and ownership" (line 33), and is no longer a target. That covers
localization, the local predicates, complex automaticity, signatures, finite Hasse signs and their
support, local classification, the invariant record and admissibility, the real symbol, product
formula and sign prescription, quaternary descent, the conditional quaternary and higher-rank
steps, local realization, the 72:1 reduction, local hyperbolicity, the Witt global-to-local map and
the worked examples.

Repairing the pattern:
- `Suggested.lean` restated three theorems proved at `2fd255d`, and they are deleted:
  - `hilbertSymbol_localized_productFormula` = `TauCeti.hilbertSymbol_productFormula` with
    `TauCeti.hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace`;
  - `exists_hilbertSymbol_eq_neg_one_iff` = `TauCeti.NumberField.QuadraticForm.exists_hilbertSymbol_eq_ite`
    (`SignPrescription.lean:154`);
  - `exists_hilbertSymbol_eq_neg_one_iff_pair` = `exists_pair_hilbertSymbol_eq_ite`
    (`SignPrescription.lean:191`).
- The roadmap-name supplier tables are replaced by pinned Tau Ceti declarations: Class Field
  Theory's norm index and Hasse norm, Quadratic Form Invariants' local theory, and Global Number
  Fields' approximation and ideles. No roadmap supplier remains.
- The cited ids keep resolving. Layer numbers, the `#layer-4-global-square-norm-and-approximation-lemmas`
  anchor (cited by ClassicalArithmeticCompletion on main), 4.3, 6.1, 6.3 and Layers 5–6 are kept. A
  section and name map (lines 50–59) sends 4.4 and the old name exists_hilbertSymbol_eq_neg_one_iff_pair
  (cited by the open QuaternionArithmetic and GL2AutomorphicRepresentationsAndTransfer roadmaps) to
  the Tau Ceti names.

## H05 (CBirkbeck) — applied differently

The form-level theorem is `exists_globalForm_of_isAdmissible` composed with the pinned
`GlobalFormInvariants.IsLocalRealization.equivalent_atFinitePlace` and `equivalent_atRealPlace`
(`TauCeti/NumberTheory/QuadraticForm/Global/Classification.lean:187, :226`). Their hypotheses are
exactly `I.IsLocalRealization U R` and `Q.globalInvariants hQ = I`. Stating it in `Suggested.lean`
would add the kind of two-line corollary that H08 asks to remove.

The README promise (old lines 882–883) is therefore met in prose. §7.3 (lines 591–594) states the
form-level consequence with those exact names, and §7.2 does the same for 72:1, through
`isAdmissible_ofLocalForms` and `isLocalRealization_ofLocalForms`.

## H06 (CBirkbeck) — applied

The README now has the house shape: Summary, Scope and ownership, Conventions, Exact supplier
contracts (from Mathlib and from Tau Ceti), How to read the build, `## Layer k` / `### k.n`,
Downstream consumers and References. Every layer ends with `### Examples` and `### Dependencies`.
The Conventions and every retained target have a `**Checks.**` list of at least three computed
items with negative controls (14 lists).

The reviewer's isotropy Checks are in §5.5 (lines 428–441): rank 0 false, `H` true, `⟨1,1,−3⟩`
false. The admissibility Checks are in §7.3 (lines 599–610): `⟨1⟩` true, rank-zero record false,
rank-one two-sign record false with product 1. No definition of this roadmap's own remains; all
carriers are Tau Ceti declarations.

## H07 (CBirkbeck) — applied differently

- **Supplier locator:** "Layer 0.2" → the pinned
  `TauCeti.GlobalNumberFields.weakApproximation_denseRange`
  (`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`, line 196). The
  archimedean formula is located at `TauCeti.hilbertSymbol_real` (line 188) and at Serre, Ch. III,
  §1.2, Theorem 1.
- **Background books:** Lam, Cassels, Neukirch and Milnor–Husemoller are dropped. No retained claim
  cites them, and their inputs are now pinned declarations.
- **Printed pages:** not added. O'Meara and Serre are paywalled Springer books with no legal copy
  readable here, and pages may not be invented. O'Meara's numbered paragraphs are theorem-level
  locators, and these citations stand as uncertified.
- **Manifest:** the roadmap has no `sources.toml`, and this job may not create one.

## H08 (CBirkbeck) — disputed

`equivalent_of_locallyEquivalent` is `#check`ed by name at
`TauCetiRoadmap/IntegralLattices/Suggested.lean:403` on main, and named as a consumed contract in
that roadmap's README (lines 476, 978). Deleting it makes `lake build
TauCetiRoadmap.IntegralLattices.Suggested` fail, and this job cannot edit that folder. It is a
proved theorem, not an admitted one.

The pattern itself is applied where no consumer depends on it.
`equivalent_of_globalInvariants_eq`, which is `(equivalent_iff_globalInvariants_eq …).2`, is
deleted. Dropping 8.4 needs IntegralLattices to drop its `#check` first.

## H09 (CBirkbeck) — applied

- Old line 427, "Pin this proof. It is the one route this roadmap accepts." → line 284, "A route
  through the idele-class norm index:".
- Old line 800, "Pin the constructive proof route." → line 545, "Route:". Old line 516 left with
  §4.4, which is in Tau Ceti.
- Other route mandates are gone: Scope's "not an accepted proof route", §5.1's "not explanatory
  suggestions that an implementation may collapse", and the "Acceptance criteria" checklist.
- The mathematical warnings about invalid inferences stay as ⚠ notes (lines 296–301, 417–420).

## Further repairs found while repairing the pattern

- `Suggested.lean` drops 7.4's `equivalent_of_globalInvariants_eq`, a one-step corollary of 8.1 with
  no consumer.
- The second module of 6.2, 6.3, 8.1 and 8.4 is now `{W : Type w}` instead of sharing `V`'s
  universe. This is strictly more general, and the predicates and records already allowed it.
- The README's "Suggested name: `TauCeti.NumberField.QuadraticForm.hasseMinkowski_equivalent`" (the
  one unresolved name in the citation scan) is gone. The private migration and provenance ledger
  text is gone too (process narrative).
- §4.2's route now needs only the first inequality
  (`TauCeti.ClassFieldTheory.finrank_le_index_range_ideleClassNormMap`,
  `[E:K] ≤ [C_K : N(C_E)]`). Surjectivity of the norm on idele classes contradicts it, so the full
  norm index is not needed.

## Elaborated signatures

All nine declarations were elaborated in one scratch file of `#check @name` against the built
module. That file also `#check`s the consumer's spelling `GlobalQuadraticForms.hasseMinkowski_equivalent`
from inside `namespace TauCetiRoadmap.IntegralLattices`.

Every elaborated type matches its README statement. Each keeps `[NumberField K]`,
`[FiniteDimensional K V]` / `[FiniteDimensional K W]`, the regularity hypotheses and `a ≠ 0` (6.1).
`injective_wittRing_baseChange_places` now carries `[Invertible (2 : K)]` as a binder instead of a
`letI`. Its real component is `TauCeti.WittRing.baseChange` along
`(InfinitePlace.embedding_of_isReal w.2).toAlgebra`, which is the component of `TauCeti.WittRing.globalToLocal`.
The only changes are the universe generalization noted above; no binder disappeared.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 4.2 `isSquare_of_isSquare_unitAtFinitePlace_of_notMem` | ℚ: `a = 4`, `-1`, `2`, `-4`; eighth-power analogue | `4 = 2²` square everywhere ✓; `-1` nonsquare at all `p ≡ 3 (4)` (infinite), so hypothesis fails; `2` nonsquare at `p ≡ ±3 (8)`; `-4` like `-1`; `16` an 8th power at every odd `p` (one of `-1, 2, -2` a square mod `p`) and at `ℝ`, not in `ℚ` | holds; exponent 2 essential | Checks added |
| 4.2 route, step 5 | `E = K(√a)`, index | surjective idele-class norm gives index `1 < 2 = [E:K]` ≤ index | only the first inequality needed | route input narrowed to the pinned first inequality |
| 4.3 `⟨1,-d⟩` local-global | `(d,a) = (-1,5), (-1,3), (2,-1), (-1,-1)`, `d = 1` | `5 = 1²+2²` both true; `(-1,3)_{ℚ₃} = -1` both false; `1-2 = -1` both true; `(-1,-1)_ℝ = -1` real clause fails; `d = 1` excluded | holds | Checks added |
| 5.1 binary | `⟨1,1⟩` over `ℚ(i)` and `ℚ` | `d = [1] = [-1]` in `ℚ(i)`, isotropic `1+i² = 0`; over `ℚ` anisotropic at `ℝ`, `ℚ₃` | holds | Checks added |
| 5.1 ternary | `⟨1,1,-2⟩`, `⟨1,1,-3⟩`, `⟨1,1,1⟩` | `1+1-2 = 0`; `(-1,3)_v = -1` at `v = 2, 3`; `(-1,-1)_v = -1` at `v = 2, ∞` (even count) | holds | Checks added |
| 5.5 `hasseMinkowski_isotropic` | rank 0, `⟨a⟩`, `H`, `⟨1,1,-3⟩`, `⟨1,1,1,1,1⟩`, degenerate `Q` | zero space anisotropic: both sides false; `⟨a⟩` both false; `H` both true; `⟨1,1,-3⟩` both false; rank 5 anisotropic only at `ℝ`: both false; radical vector `r`: `Q(r) = 0` globally and at every `1 ⊗ r`: both true | holds; `hQ` not needed for truth (P3 note, kept: the source states it for regular forms) | none |
| 5.5 higher-rank step, `T = ∅` (H03) | `U = ⟨1,1⟩`, `W = ⟨1,-1,1⟩` over `ℚ` | `x = 0`: `b = 0`, `⟨0⟩ ⊥ W` singular; `x = (1,0)`: `b = 1`, `y = (0,1,0)`, `W(y) = -1`, `U(x)+W(y) = 0` | old text admitted `b = 0`; pinned lemma has `U x ≠ 0` | §5.5 text |
| 6.1 `represents_iff_locallyRepresents` | `⟨1,1⟩` with `a = 3, 5, -1`; `H`; rank 0; `a = 0` | 3: fails at `ℚ₃` both false; 5 both true; −1 fails at `ℝ`, `ℚ₂` both false; `H` universal; rank 0 both false; `a = 0`: `Q 0 = 0` both true | holds; `ha` not needed for truth (P3 note, kept: the route needs a regular `⟨-a⟩ ⊥ Q`; README says so) | README sentence |
| 6.2 `represented_iff_locallyRepresented` | rank `Q` > rank `R`; `⟨3⟩ → ⟨1,1⟩`; `⟨c⟩ → H`; `⟨1,1⟩ → ⟨1,1,1,1⟩` | `finrank_le` both false; fails at `ℚ₃`; `((1+c)/2)² - ((1-c)/2)² = c`; inclusion. Direction: `Q.IsRepresentedBy R` and `LocallyRepresents Q R` both mean `Q` into `R` (definitions read at the pin) | holds | `W : Type w` |
| 6.3 `hasseMinkowski_equivalent` | `H` vs `⟨2,-2⟩`; `⟨1⟩` vs `⟨-1⟩`; `⟨1,1,-3⟩` vs `⟨1,1,-1⟩`; different ranks | both true; fails at `ℝ`; same signature `(2,1)`, differ at `ℚ₃` (first anisotropic); both false | holds | `W : Type w` |
| 7.2 hypotheses of 72:1 | `ℚ`, rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s` = −1 only at 2; `⟨-1,-1,-1⟩`; rank 1 with `s = -1` | product `(-1)·1 = -1`, excluded (each local form exists); `s_2 = (-1,-1)_2³ = -1`, real sign `(-1)^3 = -1`, product 1 ✓; rank-one local Hasse sign is the empty product 1 | holds | Checks added |
| 7.2 correction planes | `a = b = -1` at `ℝ` | `P = ⟨1,1⟩`, `P' = ⟨-1,-1⟩`; `d = [1]` both; `s(P) = (1,1) = 1`, `s(P') = (-1,-1)_ℝ = -1 = (a,b)_ℝ` | identities hold | none |
| 7.3 `exists_globalForm_of_isAdmissible` / iff | `⟨1⟩` record; zero record; rank-one `s = -1` at two places; rank-two `d = [-1]`, `s = -1` at two places; `ℚ(√5)` record | admissible and realized; `1 ≤ 0` false, realized, not admissible; product `(-1)²·1 = 1` but rank-one clause fails; real `q = 1`, sign 1, product 1, rank-two clause fails; product `(-1)·1·(-1) = 1`, real discriminants `0•[-1] = [1]`, `2•[-1] = [1]` ✓ | old iff false at rank 0 | README iff gets positive rank; Lean forward only |
| 8.1 `equivalent_iff_globalInvariants_eq` | two zero forms; zero vs `⟨1⟩`; `⟨1,1,-1⟩` vs `⟨1,2,-2⟩`; `⟨1,1⟩` vs `⟨2,2⟩`; `⟨1,1,-3⟩` vs `⟨1,1,-1⟩`; `⟨1,1,1⟩` vs `⟨-1,-1,-1⟩` | equal and isometric; neither; `d = [-1]` both, `s = 1` both (`(2,-2) = 1`), `p = 2`: equal and isometric; `(2,2)` via `2 = 2² - 2·1²`, isometry `(x+y, x-y)`; `[-3] ≠ [-1]`: neither; `[1] ≠ [-1]`: neither | holds in every rank | `W : Type w`; 7.4 Lean corollary deleted |
| 8.2 global hyperbolicity | `⟨1,-1,2,-2⟩`; `⟨1,1⟩`; odd rank | hyperbolic everywhere and globally; `d = [1] ≠ [-1]`, anisotropic at `ℝ`; never hyperbolic | holds | Checks added |
| 8.3 `injective_wittRing_baseChange_places` | classes of `⟨1,1⟩`, `H`, `⟨1⟩` over `ℚ` | real signature `2 ≠ 0`; all components 0; `dimMod2 = 1` at every finite place. Map = `globalToLocal` (components `baseChange` along `algebraMap` and along `embedding_of_isReal.toAlgebra`, as `WittRing.atRealPlace_def`) | holds | `letI` → binder |
| 8.4 `equivalent_of_locallyEquivalent` | `H` vs `⟨2,-2⟩`; `⟨1⟩` vs `⟨-1⟩` | conclusion true; hypothesis false at `ℝ` | proved from 6.3 | `W : Type w` |
| Plain vs signed discriminant | `H`, `⟨1,1⟩` | plain `[-1]`, `[1]`; signed `[1]`, `[-1]` | convention pinned | Conventions Check |
| Hasse `i<j` vs `i≤j` | `H` over `ℝ` | `(1,-1) = 1` vs `(1,1)(1,-1)(-1,-1) = -1` | convention pinned | Conventions Check |
| Symbol convention | `(-1,-1)_ℝ`, `(-1,3)_v` | `-1`; `-1` at `ℚ₂`, `ℚ₃`, `1` at `ℝ` and other `p` (even count) | consistent with `TauCeti.hilbertSymbol` (`b = x² - a y²`) and the product formula | Conventions Check |
| Real Hasse sign | `⟨-1,-1⟩` | `(-1)^(2·1/2) = -1 = (-1,-1)_ℝ` | consistent | Conventions Check |

Duplication by object: every carrier and every theorem the README used to plan was searched for at
`2fd255d`, by declaration and by statement. Results are under H04, and the absent ones are kept as
targets: the global square theorem, the binary and ternary cases, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4.

Ownership against open work: the roadmaps on main and the 478 open roadmap pull requests (through
`roadmaps grep`) show no second owner of Hasse–Minkowski or of the global classification. Class
Field Theory, on main and in its open revisions, names this roadmap as the owner. The open
QuaternionArithmetic and GL2AutomorphicRepresentationsAndTransfer roadmaps cite 4.4, 5.5, 6.1 and
6.3, which the section map and the kept ids serve. No notion moves down, and no supplier is later
in the merge order. No `Suggested.lean` declaration reuses a fully qualified name from another
roadmap.

Sources: no `sources.toml` exists for this roadmap, and nothing was fetched. O'Meara (Springer) and
Serre (Springer, GTM 7) are cited by locator only, as uncertified; no `needs-references.toml` entry
was written. Suspicious text in the review: none.

## Build

`lake build TauCetiRoadmap.GlobalQuadraticForms.Suggested TauCetiRoadmap.IntegralLattices.Suggested`
(Tau Ceti `358314d`, the branch's manifest): `Build completed successfully (10260 jobs)`, exit 0.
- `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`: 8 `declaration uses 'sorry'` warnings
  (lines 51, 68, 76, 84, 93, 111, 120, 145) and nothing else.
- `TauCetiRoadmap/IntegralLattices/Suggested.lean:402–403` print the two `GlobalQuadraticForms`
  signatures.
- 11 module-system warnings ("imports `Mathlib` … consider adding `module`"), all in other folders:
  `Completed/IntegralLattices`, `TauCetiRoadmap/ProfiniteCohomology`,
  `Completed/ProfiniteProPGroups`, `Completed/LocalFieldsRamification`,
  `Completed/NumberFieldArithmetic`, `Completed/GlobalNumberFields`,
  `TauCetiRoadmap/ClassFieldTheory`, `TauCetiRoadmap/QuadraticFormInvariants`,
  `Completed/RestrictedProducts`, `Completed/OrthogonalSpinGroups` and
  `TauCetiRoadmap/IntegralLattices` (each `Suggested.lean`). At `1bc4ccc` there were 12; this file's
  is gone.

Gate (`gate … GlobalQuadraticForms --base origin/main`):

    gate GlobalQuadraticForms: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

With `--build`, the same line ends `… source-material=0 build=0 OK`.

Dependency check (`gate --depcheck … --movable`):

    depcheck: 244 roadmaps, 2466 edges, 0 problem(s)

No UPWARD, CYCLE or moved line.
