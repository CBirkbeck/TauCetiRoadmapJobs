# Review of ComplexKahlerGeometry (pull request #1398 at 1038b16)

**Verdict:** needs changes

Incremental re-review of the 8 lines changed since b55cf4d (the head the previous review read): three citations of DifferentialGeometry §5.5 in `README.md` now also name item 5.5a of that roadmap's open revision. Nothing else in the folder changed; `Suggested.lean` is byte-identical to b55cf4d. Paths are relative to `TauCetiRoadmap/ComplexKahlerGeometry/` unless they are library paths. "Branch pin" means this head's `lake-manifest.json`: Tau Ceti 358314d4, Mathlib f6090c70. "Main's pin" means the content repository's manifest: Tau Ceti 2fd255d9, Mathlib 1b1ccf4b.

The change is correct as far as it goes: the cited content exists under both ids, and the three sentences still say what the suppliers state. It closes the README half of the previous R03 and nothing else. Five findings remain, all carried: one P1, one P2, three P3. No new defect was introduced.

## R01 (P1) — The README's supplier contract is written against main's pin; the head still pins 358314d4 and still conflicts with main in `Suggested.lean`

**Location.** `lake-manifest.json` (Tau Ceti 358314d4, Mathlib f6090c70). `README.md:195–345` (From Tau Ceti) and the layer citations, including the changed line `:1236` ("Tau Ceti `Orientation.formHodgeStar`, `Orientation.complexHodgeStar`, `Orientation.barHodgeStar`, `TauCeti.alternatingFormEquiv` and `TauCeti.RoughForm.hodgeStar`").

**Claim.** Unchanged since the previous review. The README cites about 115 Tau Ceti declarations that exist only at main's pin, while the Lean file and the gate run against the branch pin. The five names on the changed `*Needs:*` line are among them. The pull request cannot merge as it stands.

**Witness.** At the branch pin no file under `TauCeti/` contains `formHodgeStar`, `complexHodgeStar`, `barHodgeStar`, `alternatingFormEquiv` or a `hodgeStar` definition (grep of the whole tree, rerun at this head). At main's pin they are `Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`, `HodgeStar/Complex.lean:57, 126`, `Analysis/InnerProductSpace/AlternatingForm.lean:71`, `HodgeStar/Basic.lean:194` and `Geometry/Manifold/Riemannian/HodgeStar.lean:73`. `git merge-tree --write-tree origin/main HEAD` at this head: "CONFLICT (content): Merge conflict in TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean" (merge base a0ad405).

**Repair.** Merge `origin/main`, resolving `Suggested.lean` by keeping this head's file; the manifest then pins 2fd255d9 and 1b1ccf4b. The previous review elaborated this head's `Suggested.lean` (unchanged since) at main's pins: exit 0, exactly ten `sorry` warnings. Then apply R02.

## R02 (P2) — Three headlines statable at main's pin are absent, the docstring describes the wrong pin, and three statements re-encode library objects

**Location.** `Suggested.lean:19–31` ("Three of them are statable on carriers that the README's Tau Ceti contract names and that the Tau Ceti revision this file is built against does not have"); `:77–79` (`hRunge`), `:111–112` (the solver's `∂̄`), `:185` (`IsDomain … ∧`).

**Claim.** Unchanged since the previous review (the file is identical). At main's pin `TauCeti.SmoothAlmostComplexStructure.nijenhuis`, `ofComplexManifold`, `SmoothForm.IsOfType`, `delBar`, `SmoothForm.hodgeStar`, `SmoothForm.codifferential` and `deRhamCohomology` exist, so the local Newlander–Nirenberg theorem, the local Dolbeault–Grothendieck lemma and the de Rham Hodge decomposition are statable and absent. `hRunge` spells out the body of `TauCeti.IsFilledIn K Ω`; the solver's left side is `TauCeti.conjWirtingerDeriv (fun w ↦ u ((p, q), w)) z 1`; the `IsDomain` conjunct is an instance (`smoothStalkIsDomain`).

**Witness.** At 2fd255d9: `Symplectic/Manifold/Nijenhuis.lean:158`, `Complex/AlmostComplexStructure.lean:76`, `Dolbeault/Basic.lean:95`, `Riemannian/Codifferential.lean:88`, `DeRham/Basic.lean:127`, `Topology/FilledIn.lean:61–66`, `StructureSheaf/Domain.lean:93`. At the branch pin the one-tactic probe on `:185` fails with "failed to synthesize instance" for both conjuncts, which is the pin difference made visible.

**Repair.** After R01: state the three theorems on those carriers (the shapes the previous reviews proposed), delete `:19–31`, write `hRunge` as `TauCeti.IsFilledIn K Ω`, the solver's equation through `TauCeti.conjWirtingerDeriv`, drop the `IsDomain` conjunct, import the three modules, and add the new names to `README.md:65–70`.

## R03 (P3) — The README now cites item 5.5a, which only the open revision of DifferentialGeometry defines, and the description does not name that revision

**Location.** `README.md:1192` ("its densities part, §5.5a in that roadmap's open revision"), `:1236` ("5.5 (densities; 5.5a in its open revision)"), `:1564–1565`; the pull-request description (`scratch/pull-request.md`), whose dependency block names only UnboundedOperators and VariationalMethods.

**Claim.** The README half of the previous R03 is done: both ids now appear and both resolve (main `DifferentialGeometry/README.md:528` "5.5 Densities, and Stokes with corners" with `RoughDensity` and `integralTopForm_eq_integralDensity`; #886 at e7464d11 `:1250` "5.5a Densities, for every finite-dimensional real model" with `RoughDensity` and "its agreement with the integral of top forms"). Citing 5.5a makes #886's numbering a dependency, and the rule for an id that only an open revision defines is that the description or the merge-order paragraph names that revision. Neither does.

**Witness.** `scratch/pull-request.md` dependency block: "#1027 UnboundedOperators", "#1028 VariationalMethods", nothing else. #886 `DifferentialGeometry/README.md:38–39` itself states that citations of 5.5 refer to 5.5a and 5.5b, so the old id would also have survived the merge.

**Repair.** In the description only: add #886 (DifferentialGeometry) to the dependency block, or state there that this pull request merges before #886. Nothing in the folder changes; either dual citation or the bare "§5.5 (densities)" is acceptable, since #886 carries the 5.5 → 5.5a/5.5b map.

## R04 (P3) — Four open pull requests conflict with this head in this folder, no order is stated, and the description describes an earlier head

**Location.** The pull-request description (`scratch/pull-request.md`).

**Claim.** Unchanged since the previous review. `scratch/overlaps.md` lists #1234, #1807 and #1808 as conflicting in `README.md` and `Suggested.lean`, and #1854 in `Suggested.lean`. The description names none and gives no order. It still describes head b8db421 ("The new companion file … `PlanarHodgeTargets.lean`", "three theorem targets are explicitly admitted"); this head has no such file, rewrites both roadmap files and admits ten theorems.

**Witness.** `git diff --stat a0ad405 HEAD -- TauCetiRoadmap/ComplexKahlerGeometry`: `README.md` and `Suggested.lean` only; `ls` of the folder: `PROGRESS.md`, `README.md`, `STATUS.md`, `Suggested.lean`, `metadata.toml`.

**Repair.** In the description only: rewrite the summary for this head and state the order, for example "#1234 rebases onto this; this merges before #1807, #1808 and #1854".

## R05 (P3) — GeometricTopology 1.7 and 1.7.1 exist only at the head of open revision #903, which the description does not name

**Location.** `README.md:2559` ("GeometricTopology Layer 1.7 … smooth classification of compact surfaces"), `:2562` ("Layer 1.7.1 … polygon/CW model").

**Claim.** Unchanged since the previous review. The content supports what is claimed (standard genus-j model, `(2 − χ)/2`, `rank H₁ = 2j`, one-vertex polygon with word `[a₁,b₁]⋯[a_j,b_j]`), but only at #903's head. #903 revises an existing roadmap, so its numbering is a dependency the description must name.

**Witness.** Main `GeometricTopology/README.md` has no `### 1.7` heading. At #903's head 5859c0dc: `:1049` "### 1.7 Compact smooth surfaces", `:1101` "### 1.7.1 Polyhedral surfaces and explicit Euclidean embedding models".

**Repair.** In the description only: name #903 in the dependency block. Nothing in the folder changes.

## Previous findings

- R01 — not repaired: the manifest still pins 358314d4; `git merge-tree` still reports the `Suggested.lean` conflict; the folder diff since b55cf4d is 8 README lines. Re-raised as R01.
- R02 — not repaired: `Suggested.lean` is byte-identical to b55cf4d (`:19–31`, `:77–79`, `:111–112`, `:185` unchanged). Re-raised as R02.
- R03 — partly repaired: `README.md:1192, 1236, 1564–1565` now read "§5.5 (densities; 5.5a in its open revision)" and both ids resolve; the description still does not name #886. Re-raised as R03 at P3 for the description only.
- R04 — not repaired: `scratch/pull-request.md` is still the b8db421 description with the two-entry dependency block. Re-raised as R04.
- R05 — not repaired: `README.md:2559, 2562` unchanged; the description does not name #903. Re-raised as R05.

## Verified sound

### Gate, dependency check, build, signatures, padding

- **Worktree.** At `1038b1677f1475f5ca42eefcc53825d1430eca32`, clean. `git diff --stat origin/main...HEAD` outside the folder: empty. Folder diff since b55cf4d: `README.md | 8 ++++----`.
- **Gate, rerun from the worktree with `--base origin/main`** (the worker's run at this head additionally reports `build=0`):

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

- **Dependency check (movable).**

```text
depcheck: 238 roadmaps, 2322 edges, 0 problem(s)
```

  No UPWARD or CYCLE line. The changed `*Needs:*` line (`:1236`) names DifferentialGeometry, SmoothBundlesConnections, Tau Ceti and PseudodifferentialOperators, all on main; the dependency check parses the "5.5a in its open revision" parenthetical without a new edge.
- **Elaboration at the branch pin.** `lake env lean Suggested.lean`: exit 0 in 29 s, exactly ten ``declaration uses `sorry` `` warnings at lines 74, 94, 123, 137, 155, 172, 181, 195, 208, 226.
- **Signatures.** `#check @name` for all ten declarations in one scratch file importing the built module, elaborated once: each type equals `scratch/signatures.md` and the previous review's comparison with the README; no `def` or `instance` exists, so no section binder can be lost. Nothing changed.
- **Padding probe.** A scratch copy with every `sorry` replaced by `first | rfl | infer_instance | (simp; done) | (norm_num; done) | trivial | decide | (constructor <;> infer_instance)`: all ten fail (errors at lines 88, 114, 130, 147, 167, 177, 188, 200, 217, 235). The `IsDomain` conjunct that closes at main's pin is R02.
- **Form.** `module`, `public import Mathlib`, one module docstring, one namespace, `theorem` only; no `lemma`, `set_option`, `example`, `#eval`, `#print` or sorry'd data (unchanged file).

### The changed passages

- **`README.md:1192` (§5.1, K5a).** "Identify its smooth sections with chart-smooth values of DifferentialGeometry §5.5's `RoughDensity` carrier (its densities part, §5.5a in that roadmap's open revision)". Main `DifferentialGeometry/README.md:528` lists `RoughDensity` under 5.5; #886 `:1250–1252` lists it under 5.5a. Correct under both ids.
- **`README.md:1236` (§5.1 `*Needs:*`).** DifferentialGeometry §§0.1–0.4: main `:272, 282, 284, 294`; #886 `:468, 496, 499, 576`. §5.5/5.5a as above. SmoothBundlesConnections B2–B4: main `SmoothBundlesConnections/README.md:559–776` (B2.1–B2.4) and `:60` names this roadmap as the consumer of B2–B4. PseudodifferentialOperators P1.0: main `PseudodifferentialOperators/README.md:12, 94–96` (the density transpose is part of P1.0 and follows the density bundle, so the item-level order is as before). The five Tau Ceti names: R01.
- **`README.md:1564–1565` (§5.4).** "Combine the agreement, in DifferentialGeometry §5.5 (densities; §5.5a in its open revision), of the density integral with the top-form integral and §12.4's agreement of `TauCeti.riemannianVolume` with the density integral". Main `:528–529` (`integralTopForm_eq_integralDensity`) and `:923–927` (12.4, `integral_riemannianVolume_eq_integralDensity` on compactly supported continuous functions); #886 `:1251–1252` ("its agreement with the integral of top forms") and `:2120–2128` (12.4, "agreement with the integral of densities on compactly supported continuous functions"). The roadmap's step from compactly supported smooth functions to integrable f by L¹ density is its own, as the sentence says.
- **#886 and the 5.5 id.** #886 `:38–39` says that citations of the single section 5.5 refer to 5.5a and 5.5b, so DifferentialGeometry itself provides the old → new numbering; the dual citation here is consistent with it. The wording "in its open revision" is the form the previous review asked for; I did not re-open it.
- **Seeded sample in the changed passage.** "5.1 Real and complex analysis on real manifolds (K5a)" (`:1122–1251`) has no source locator, only library and roadmap citations, all resolved above or under R01. The other sampled targets are untouched; their locators were opened by the previous review (52 locators, all correct) and I did not re-open them.

### Adversarial pass

Rows 1–33 are the previous report's, for statements the diff leaves untouched; rows 34–36 are computed for the changed passages.

| # | Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|---|
| 1–33 | `ruckert_nullstellensatz`, `oka_coherence`, `cartan_coherence_reducedIdeal`, `finite_rank_runge_approximation`, `hRunge` versus `TauCeti.IsFilledIn`, filled exhaustion parity, `mixed_parameter_solver`, the solver's ∂̄ versus `conjWirtingerDeriv`, Cauchy–Green normalisation, `weierstrass_preparation`, `weierstrass_division`, stalk theorems, principal-part index, convolution Check, `d^c`/`dd^c`, planar star and δ, codifferential sign, Lefschetz, Hodge–Riemann sign, Nijenhuis conventions, Chevalley–Eilenberg factor, Iwasawa numbers, projective instances, contract names | as in the previous report | as in the previous report (review of b55cf4d, rows 1–33) | Carried unchanged; the Lean file and these README passages are identical |
| 34 | Density transition `\|det D(chart change)\|` (`:1189–1190`) | ℝ, chart change x ↦ 2x; x ↦ −x | density `\|dx\|` scales by `\|2\| = 2`; under x ↦ −x by `\|−1\| = 1`, while the top form `dx` picks up −1 | Holds; a transition `det` without the absolute value would be the orientation bundle, not the density bundle |
| 35 | `∫_M f dvol_g = ∫ f d(riemannianVolume I M)` (`:1567`) | ℍ with the Poincaré metric, f = indicator of [0,1]×[1,2] | Gram matrix diag(y⁻², y⁻²), chart density √det = y⁻², left side ∫₀¹∫₁² y⁻² dy dx = 1/2; right side `UpperHalfPlane.riemannianVolume_eq_volume` (`PoincareMetric.lean:181`, main's pin) gives Mathlib's `volume` with density y⁻², also 1/2 | Holds; `det` without the square root would give ∫₁² y⁻⁴ = 7/24 |
| 36 | Density integral versus top-form integral (`:1564–1565`) | S¹ with `circleAngularForm`; the unit square with `dx ∧ dy` and both orientations | `\|∫_{S¹} dθ\| = 2π` (DifferentialGeometry's own acceptance, main `:532`, #886 `:1257`); square: top-form integral ±1 by orientation, density integral 1, equal for the orientation `sign_o` the density `φ · sign_o` is formed with | Holds; the agreement needs the orientation built into the density, which both 5.5 and 5.5a state |

### Cross-roadmap citations resolved

- **On main (41f2872d).** DifferentialGeometry 0.1–0.4 (`:272–294`), 5.5 (`:528`), 12.4 (`:923`); SmoothBundlesConnections B2–B4 (`:559–776`); PseudodifferentialOperators P1.0 (`:12`). `scratch/citations.md` lists no cross-roadmap citation found nowhere; its three Lean names are VariationalMethods' `CompactFormPair.*`, in the description's dependency block.
- **At open heads.** DifferentialGeometry #886 at e7464d11: 5.5a (`:1250`), 0.1–0.4 (`:468–576`), 12.4 (`:2120`), the 5.5 map (`:38`). GeometricTopology #903 at 5859c0dc: 1.7 (`:1049`), 1.7.1 (`:1101`) (R05).
- **Overlaps.** `scratch/overlaps.md`: the dropped id DifferentialGeometry §5.5 is R03; the four conflicting pull requests are R04; the three dropped `#k…` anchors are mapped at `README.md:349–361` (unchanged, verified by the previous review).

### Ownership

Unchanged passages; the previous review's settlement stands: this roadmap, on main and earlier in the order, owns the Runge, solver and relative-integration targets against GlobalHolomorphicFunctions (#992) and DeRhamCohomologyAndDuality (#1768); the density bundle and its distributions are consumed from DifferentialGeometry 5.5/5.5a and PseudodifferentialOperators P1.0, not built here. No declaration of `Suggested.lean` carries the fully qualified name of a declaration in another readable roadmap except the other open copies of this same folder (R04).

## Not verifiable

- `webster-nn`, `hormander-alpdo1`, `wells-dacm`, `griffiths-harris`, `raghunathan-discrete-subgroups` are settled as uncertified and cited by locator; none is touched by the change.
- Ownership against the open pull requests the brief lists without files was not checked.
- The three headlines R02 asks for were not elaborated at main's pins in their final form in this round.

## Source issues

- none
