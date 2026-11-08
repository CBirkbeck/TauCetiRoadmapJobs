# Review of ComplexKahlerGeometry (pull request #1398 at 4f5ca96)

**Verdict:** needs changes

Incremental re-review of the 40 lines changed since d4190f8: three README lines (the three items of the previous R06) and the module docstring of `Suggested.lean` (its lines 16–50); no Lean statement changed, and `lake-manifest.json` still pins Tau Ceti 358314d and Mathlib f6090c7. Of the six findings of the previous review, R06 is repaired, R02 is partly repaired, and R01, R03, R04 and R05 stand. The repaired docstring is accurate at the branch pin, but it now records in writing that the README's Tau Ceti contract names carriers the pin lacks, which is the unrepaired R01. Five findings: one P1, two P2, two P3. R03, R04 and R05 are about the pull-request description only; the folder's files need no edit for them.

## R01 (P1) — The Tau Ceti contract still cites declarations absent at the branch pin

Location: `lake-manifest.json` (Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`); `README.md:198–208` ("`TauCeti.deRhamCohomology` … `TauCeti.homotopyOperator` … `TauCeti.SmoothForm.mapCoeff` and `TauCeti.SmoothForm.instModule`"), `235–238` ("`TauCeti.SmoothForm.hodgeStar` … `TauCeti.SmoothForm.codifferential`"), `305–321` ("the pinned Tau Ceti's"), `339–343` ("the type calculus and the Nijenhuis tensor are Tau Ceti's"), `366–367` ("`TauCeti.SmoothAlmostComplexStructure.ofComplexManifold`"), `1516`, `1632` ("the pinned `TauCeti.SmoothForm.codifferential`"); unchanged since the previous review.

Claim: unchanged from the previous two reports. At the pin this branch declares, none of the Tau Ceti declarations the K1 scalar action, the type calculus, the Hodge star, the codifferential and the de Rham cohomology are contracted to exists, so those objects have no owner in this roadmap's build. This head adds a docstring (`Suggested.lean:17–18`) that says exactly that: the carriers are ones "the README's Tau Ceti contract names and that the Tau Ceti revision this file is built against does not have".

Witness: `grep -rl` over `.lake/packages/TauCeti/TauCeti` at 358314d returns no file for `SmoothAlmostComplexStructure.nijenhuis`, `ofComplexManifold`, `SmoothForm.IsOfType`, `delBar`, `SmoothForm.hodgeStar`, `SmoothForm.codifferential`, `deRhamCohomology`, `mapCoeff_conj_smul`, `mapCoeff_conj_wedgeWith_mul`. At 2fd255d9 (main's pin) each resolves: `Geometry/Symplectic/Manifold/Nijenhuis.lean:158`, `Geometry/Manifold/Complex/AlmostComplexStructure.lean:76`, `Geometry/Manifold/DifferentialForm/AlmostComplexType.lean:201`, `Geometry/Manifold/DifferentialForm/Dolbeault/Basic.lean:95`, `Geometry/Manifold/Riemannian/HodgeStar.lean:296`, `Geometry/Manifold/Riemannian/Codifferential.lean:88`, `Geometry/Manifold/DeRham/Basic.lean:127`, `Geometry/Manifold/DifferentialForm/MapCoeff.lean:322, 402`.

Repair: route a (recommended): merge main so that the manifest pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4, re-run the elaboration and the gate at those pins, then apply R02's route a. Route b: keep 358314d, restore the constructions the 20c666e text owned (the previous reports' route b) and delete the contract lines above. Tested: every contract clause at `README.md:305–321`, `339–343` and `1632` matches the statement at 2fd255d9 (the previous report's R01 and the table below), so route a needs no change to the mathematics.

## R02 (P2) — The docstring now names the missing carriers correctly, but the file and the README still describe two different pins; on route a three statable headlines are absent

Location: `Suggested.lean:16–28` ("Three of them are statable on carriers that the README's Tau Ceti contract names and that the Tau Ceti revision this file is built against does not have"); `README.md:58–62` ("The other headline theorems and their missing geometric carriers are listed in the module docstring"), `339–343`, `353–367`, `1630–1632`.

Claim: the repair replaced the old Layer 1/2/5 bullets by three bullets that name, with their fully qualified names, exactly what the Newlander–Nirenberg local form, the local Dolbeault–Grothendieck lemma and the de Rham Hodge decomposition need; each name is absent at 358314d and present at 2fd255d9 with that name (witness in R01), so the bullets are true at the branch pin. But the sentence introducing them makes the file say that the README's supplier contract is not satisfied by the pin the file is built against: `README.md:62` sends the reader to the docstring for the "missing geometric carriers", and the docstring sends the reader back to a README contract it says is unmet. The folder still contradicts itself about which Tau Ceti is pinned; the docstring now documents the contradiction instead of resolving it. On route a the three headlines are statable and not stated, which is the P2 of the previous report.

Witness: `Suggested.lean:17–18` versus `README.md:339` ("are Tau Ceti's") and `:305` ("the pinned Tau Ceti's"); `git diff d4190f8 HEAD -- Suggested.lean` touches only lines 13–50 (docstring), so no statement was added.

Repair: on route a, state the three theorems against the named carriers (Newlander–Nirenberg local form on `TauCeti.SmoothAlmostComplexStructure` with `nijenhuis = 0`; the local Dolbeault–Grothendieck lemma for `SmoothForm.IsOfType` and `delBar` on a polydisc; the Hodge decomposition of `TauCeti.deRhamCohomology` on a compact oriented Riemannian manifold with `SmoothForm.codifferential`), and delete lines 16–28 and the "built against" sentence. On route b, delete the README contract lines of R01 and rewrite lines 16–18 to say only that the three theorems are not statable at the pins and what each lacks, without reference to the README's contract.

## R03 (P2) — The open revision #886 of DifferentialGeometry drops §5.5, which this roadmap cites as a supplier, and no order is stated

Location: `README.md:1066` ("DifferentialGeometry §5.5's `RoughDensity` carrier"), `1438` ("DifferentialGeometry §5.5's agreement of the density integral"), and the `*Needs:*` line of §5.1 listing "§§0.1–0.4 and 5.5"; the pull-request description's "Depends on" block (#1027, #1028 only).

Claim: unchanged since the previous report, and narrower: at the head of #886 (6f270bfe) Layers 6–11 are back, so §§8.3–8.5 resolve there, and only 5.5 is gone (split into 5.5a and 5.5b). The three citations resolve on main, but when #886 merges first every one of them breaks with nothing saying who owes the old → new map. `scratch/overlaps.md` lists §5.5 at lines 1066 and 1438 as the one id #886 drops.

Witness: DifferentialGeometry on main `README.md:524` ("5.4 The homotopy operator"), `:528` ("5.5 Densities, and Stokes with corners", listing `RoughDensity`), `:836, 845, 852` (8.3–8.5); at 6f270bfe `README.md:1186` ("5.5a Densities, for every finite-dimensional real model"), `:1216` ("5.5b Smooth faces, abstract boundary and corner Stokes"), `:1748, 1792, 1821` (8.3–8.5 kept).

Repair: description only. Add one sentence to the description's merge-order paragraph: this pull request merges before #886, which then owes the old → new map for 5.5 (optionally "(5.5a at the head of its open revision)" at 1066, 1438 and the §5.1 `*Needs:*` line). No change to the mathematics; the dependency check is unaffected.

## R04 (P3) — Four open pull requests change this folder and conflict with this head, with no stated order

Location: the pull-request description's "Depends on" block.

Claim: unchanged since the previous report. `scratch/overlaps.md` lists #1234 and #1807 conflicting with this head in `README.md` and `Suggested.lean`, #1808 in both, and #1854 in `Suggested.lean`; the description names none of them and no rebase order.

Witness: `scratch/overlaps.md`, "Other open pull requests that change this roadmap", four entries computed from the heads at the index of 2026-11-08.

Repair: description only. State which pull request rebases onto which (for example #1234 onto this one; this one before or after #1807, #1808 and #1854), and do not restate here what the others change.

## R05 (P3) — GeometricTopology Layers 1.7 and 1.7.1 exist only at the head of its open revision #903, which the description does not name

Location: `README.md:2431` ("[GeometricTopology Layer 1.7](../GeometricTopology/README.md)'s smooth classification of compact surfaces"), `2434` ("Layer 1.7.1 … polygon/CW model"), `2507`, `2707`; unchanged since the previous review.

Claim: unchanged. GeometricTopology on main has no heading "1.7" (`grep '^### 1\.7'` returns nothing); at the head of #903 (8bd98718) "### 1.7 Compact smooth surfaces" is at `GeometricTopology/README.md:921` and "### 1.7.1 Polyhedral surfaces and explicit Euclidean embedding models" at `:982`. #903 revises an existing roadmap, so its numbering is a dependency only when the description or the merge-order paragraph names it; neither does. The content at #903 supports every claim made here (checked in the previous report's table: genus `(2 − χ)/2`, the one-vertex `2j`-edge polygon model).

Witness: as above; the description's "Depends on" block lists #1027 and #1028.

Repair: description only. Name #903 in the description's dependency block, as #271 was named before. If the author does not want #903 as a dependency, cite an owner on main (there is none for the surface classification) or SurfaceTopology Layer 8 at #271 as before; do not state the classification here.

## Previous findings

- R01 — not repaired: the manifest still pins 358314d; `README.md:305` still reads "are the pinned Tau Ceti's", `:339` "are Tau Ceti's". Written again as R01.
- R02 — partly repaired: `Suggested.lean:20–28` now names the seven missing carriers exactly, and each is absent at 358314d and present at 2fd255d9 with that name; but `:17–18` says they are carriers "the README's Tau Ceti contract names" and the pin "does not have", and no statement was added. Written again as R02.
- R03 — not repaired, narrowed: the description still names #1027 and #1028 only; #886 at 6f270bfe now keeps 8.3–8.5 and drops only 5.5 (→ 5.5a/5.5b). Written again as R03.
- R04 — not repaired: the description's "Depends on" block is unchanged. Written again as R04.
- R05 — not repaired: `README.md:2431, 2434, 2507, 2707` unchanged; #903 (now 8bd98718, 1.7 at `:921`, 1.7.1 at `:982`) is not named. Written again as R05.
- R06 — repaired: `README.md:1515–1516` now reads "For degrees one and two use / the pinned Tau Ceti homotopy operator" (one "the pinned"); `:1183` "equal near 0 to `1/(1+2x)`"; `:316–317` "conjugate-linear on complex-valued forms, `conj(c • ω) = conj(c) • conj(ω)`", matching `mapCoeff_conj_smul` at `MapCoeff.lean:322` for `SmoothForm I M ℂ k`. No new slip introduced (the three passages re-read in full).

## Verified sound

### Gate, build, signatures, padding

- Worktree at `4f5ca9647c75b046959a87e28658740d5f137403`, clean; `git diff --stat origin/main...HEAD` outside the folder is empty; `scratch/changes.md` lists no file changed outside the folder. One commit since d4190f8 (4f5ca964).
- Gate rerun from the worktree (`gate … ComplexKahlerGeometry --base origin/main`): every counter 0, `OK`; the worker's run adds `build=0`.
- `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` at the branch pins: exit 0, exactly 7 warnings, all ``declaration uses `sorry` `` (lines 76, 96, 125, 139, 157, 174, 183; the line numbers moved by 11 because the docstring grew, the statements are byte-identical).
- Movable dependency check on this head:

```text
depcheck: 236 roadmaps, 2420 edges, 0 problem(s)
```

- Signatures: `git diff d4190f8 HEAD -- Suggested.lean` touches only the docstring, so the `#check @…` comparison of the previous reports stands; the worker's `scratch/signatures.md` lists the same 7 elaborated types with 0 dropped binders.
- Padding: the one-tactic probe of PRREVIEW-ComplexKahlerGeometry~35 (0 of 7 closed) stands for the same reason.
- Header unchanged: `module`, `public import Mathlib`, `@[expose] public section`, no `set_option`, no `lemma`, no sorry'd data, no `example`.

### The changed passages

- `Suggested.lean:20–28` (the three "statable" bullets): each named carrier opened at 2fd255d9 with its fully qualified name as the docstring writes it: `TauCeti.SmoothAlmostComplexStructure.nijenhuis` (`Nijenhuis.lean:158`, inside `namespace TauCeti … namespace SmoothAlmostComplexStructure`), `TauCeti.SmoothAlmostComplexStructure.ofComplexManifold` (`AlmostComplexStructure.lean:76`), `TauCeti.SmoothForm.IsOfType` (`DifferentialForm/AlmostComplexType.lean:201`, `namespace SmoothForm`; the alternating-form predicate of the same name at `Topology/Algebra/Module/Alternating/AlmostComplexType.lean:240` is a different object), `TauCeti.SmoothAlmostComplexStructure.delBar` (`Dolbeault/Basic.lean:95`, `namespace SmoothAlmostComplexStructure`), `TauCeti.SmoothForm.hodgeStar` (`Riemannian/HodgeStar.lean:296`, `namespace SmoothForm`; `RoughForm.hodgeStar` at `:73`), `TauCeti.SmoothForm.codifferential` (`Codifferential.lean:88`), `TauCeti.deRhamCohomology` (`DeRham/Basic.lean:127`). At 358314d: 0 files for each.
- `Suggested.lean:30–33, 46–50` ("constructions that no pinned library has"): at 2fd255d9, 0 files match `dolbeaultCohomology|DolbeaultCohomology`, `holomorphicFormSheaf|HolomorphicForm\b|holomorphicForms`, `KahlerManifold|IsKahler|kahlerMetric|IsKahlerMetric`, `lefschetzOperator|LefschetzOperator`, and no `codifferential` occurs in `Riemannian/HodgeStar.lean` or `Riemannian/Sobolev.lean` (the codifferential is on `SmoothForm` only). So "a codifferential on finite-regularity forms, not only on smooth ones" and the Dolbeault/Kähler bullets hold at both commits.
- `README.md:316–317` (conjugation scope): matches `mapCoeff_conj_smul (c : ℂ) (φ : SmoothForm I M ℂ k)` at `MapCoeff.lean:322` and `mapCoeff_conj_wedgeWith_mul` at `:402`, both for ℂ-valued forms; the pin defect is R01.
- `README.md:1182–1184` (delta series): computed in the table.
- `README.md:1515–1518` (disk regression): only the duplicated "the pinned" was removed; the homotopy-operator rows of the previous report carry.

### Library declarations opened at the pins

- Tau Ceti 358314d (worktree package): none of the nine names of R01 (0 files each).
- Tau Ceti 2fd255d9 (content checkout's package): the seven files and lines listed above, plus `MapCoeff.lean:319–322, 399–402`, `HodgeStar.lean:60–73, 290–296`, `Dolbeault/Basic.lean:75–95`, `Nijenhuis.lean:79–81, 158`, `DeRham/Basic.lean:37, 127`.
- Mathlib f6090c7: no statement changed; the previous reports' list stands.

### Cross-roadmap citations resolved this round

- DifferentialGeometry on main `:524, 528, 836, 845, 852`; at #886 (6f270bfe) `:1186, 1216, 1748, 1792, 1821` (R03).
- GeometricTopology on main: no "### 1.7"; at #903 (8bd98718) `:921, 982, 1174` (R05).
- Anchor map for the ids this pull request drops that others cite: `README.md:248` (`#k2-…` → §2.1), `:251` (`#k5-…` → §§5.1–5.8), `:255` (`#k7-…` → §§7.1–7.2), unchanged.
- `scratch/citations.md`'s three leads are VariationalMethods names at #1028 (`VariationalMethods/README.md:845, 849, 884`, resolved in the previous reports); `README.md:1592–1594` is untouched.
- Ownership against open pull requests by object: the changed passages own nothing new (a docstring and three typographical lines). The closest roadmaps in vocabulary (#946, #848, #992, #886, #1609) were compared in the previous reports; nothing in the diff changes that comparison.

### Adversarial pass

Rows for the statements the diff leaves untouched are carried from PRREVIEW-ComplexKahlerGeometry~35 ("Adversarial pass", 69 rows) and PRREVIEW-ComplexKahlerGeometry~41 (11 rows: the scalar action, the conjugation clauses, the homotopy operator on `D × [0,1]` in degrees one and two, the genus dictionary, the polygon model, the cup pairing, the PDE and DG labels); they are not recomputed here. New rows for the changed statements:

| Statement / convention | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `conj(c • ω) = conj(c) • conj(ω)` on complex-valued forms (`README.md:316–317`) | c = i, ω = dz = dx + i dy | left: conj(i dx − dy) = −i dx − dy; right: (−i)(dx − i dy) = −i dx − dy | Equal; the scope "complex-valued" now matches `mapCoeff_conj_smul` (`SmoothForm I M ℂ k`); an `F`-valued form has no conjugation at the pin, so the earlier clause was over-general. Repaired |
| `⟨δ^(n)/n!, φ⟩ = 2^n` for φ = 1/(1+2x) near 0 (`README.md:1183–1184`) | n = 0, 1, 2, 3 | φ = Σ (−2x)^k, so φ^(n)(0)/n! = (−2)^n = 1, −2, 4, −8; with ⟨δ^(n), φ⟩ = (−1)^n φ^(n)(0): 2^n = 1, 2, 4, 8; partial sums 1, 3, 7, 15 | Holds with the standard sign of the distributional derivative; the wrong model (no `(−1)^n`) gives the alternating `(−2)^n`, still divergent. Support in `(−1/4, 1/4)` lies inside the disc of convergence `|x| < 1/2`. No change |
| same, divergence in D′ | the test φ itself | Σ_{n≤N} ⟨δ^(n)/n!, φ⟩ = 2^{N+1} − 1 → ∞ | The partial sums are unbounded on one test, so they do not converge weakly. No change |
| homotopy operator on `D × [0,1]`, `H(z,t) = tz`, degrees one and two (`README.md:1515–1518`) | φ = H*(dz); φ = H*(dx∧dy) | carried from ~41: hφ = z, d(hφ) = dz; hφ = (x dy − y dx)/2, d(hφ) = dx∧dy | Cochain identity holds in both degrees; only a duplicated word was deleted here. No change |
| docstring bullets "statable … does not have" (`Suggested.lean:20–28`) | each of the seven names at 358314d and 2fd255d9 | 358314d: 0, 0, 0, 0, 0, 0, 0 files; 2fd255d9: 1 definition each at the lines listed above | True at the branch pin, false at main's pin; the folder's own contradiction is R01/R02 |
| docstring bullets "no pinned library has" (`Suggested.lean:30–59`) | Dolbeault cohomology, holomorphic-form sheaf, Kähler metric, Lefschetz operators, rough codifferential at 2fd255d9 | 0 files for each pattern | True at both commits. No change |

### Headline theorems

From `README.md:58–62`: the seven acceptance statements (`finite_rank_runge_approximation`, `mixed_parameter_solver`, `weierstrass_preparation`, `weierstrass_preparation_unique`, `weierstrass_division`, `holomorphicStalk_noetherian`, `holomorphicStalk_factorial`) are all stated. The other headlines (Newlander–Nirenberg, Dolbeault–Grothendieck, the Dolbeault theorem, the Nullstellensatz, Hartogs, Oka and Cartan coherence, Chern uniqueness, Koszul–Malgrange, the de Rham and Dolbeault Hodge theorems, Serre duality, the Kähler identities, the ∂∂̄ lemma, Hodge decomposition, Hard Lefschetz, Hodge–Riemann, the projective/torus/Hopf computations, Nomizu/Sakane, Frölicher) are named in the docstring with what each lacks. At 358314d none is statable; at 2fd255d9 three are (R02).

### Sources sampled

The seeded targets (§§3.0, 3.1, 3.2, 4.1, 5.1, 5.2, 5.4–5.8, 6.1, 7.1, 8.1, 8.2) are untouched by the diff except the three typographical lines (§1.1 at 316, §5.2 at 1183, §5.4 at 1515), none of which carries a source locator; their locators were opened in PRREVIEW-ComplexKahlerGeometry~35 (`demailly-agbook`, `rainer-advanced-complex-analysis`, `lojasiewicz-triangulation`, `sakane-parallelisable`, `chevalley-eilenberg`, `angella-iwasawa`). This round opened no further source line.

## Not verifiable

- `webster-nn`, `hormander-alpdo1`, `wells-dacm`, `griffiths-harris`, `raghunathan-discrete-subgroups`: settled as uncertified, cited by locator, not requested.
- The statements of `Suggested.lean` and the R02 additions at main's pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4): not elaborated, because the worktree's packages are at 358314d/f6090c7 and `lake env lean` is allowed only there; the 2fd255d9 declarations were read in the content checkout's package.
- Ownership against #848, #1609, #946 and #992 by object: checked only through `roadmaps grep` in the previous reports; nothing in this diff touches it.

## Source issues

- none
