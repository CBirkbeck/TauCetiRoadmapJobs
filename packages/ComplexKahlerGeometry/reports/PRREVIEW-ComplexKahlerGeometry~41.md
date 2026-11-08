# Review of ComplexKahlerGeometry (pull request #1398 at d4190f8)

**Verdict:** needs changes

Incremental re-review of the 150 lines changed since 20c666e: `README.md` only (74 insertions, 76 deletions); `Suggested.lean`, `metadata.toml` and `lake-manifest.json` are unchanged (`git diff --stat 20c666e HEAD -- Suggested.lean` is empty; the manifest still pins Tau Ceti 358314d and Mathlib f6090c7). Of the five findings of the previous review, one is partly repaired (R03), one is partly repaired on its typography and manifest items (R05), and three stand (R01, R02, R04). The repair added nine more Tau Ceti names that exist only at main's pin, cited two GeometricTopology ids that exist only at the head of its open revision, and left two typographical slips. Six findings: one P1, two P2, three P3.

## R01 (P1) — The Tau Ceti contract cites declarations absent at the branch pin; the repair added nine more

Location: `README.md:199–208` ("the homotopy operator on a cylinder `M × [0,1]` is `TauCeti.homotopyOperator` … Coefficient maps of forms and the scalar action of the coefficient field are `TauCeti.SmoothForm.mapCoeff` and `TauCeti.SmoothForm.instModule`"), `305–321` ("The complex scalars on the generic form carrier … are the pinned Tau Ceti's"), `1516`; and every location of the previous report's R01 (`33–38`, `191–203`, `207–235`, `330–341`, `358–359`, `385`, `627–631`, `649`, `1018–1026`, `1036–1047`, `1109`, `1432`, `1464–1466`, `1623–1628`, `1872`), all unchanged.

Claim: `lake-manifest.json` at this head pins Tau Ceti 358314d (the worktree's `.lake/packages/TauCeti` is at that commit). The repair deleted K1's own construction of the complex scalar action (the 20c666e text at its lines 300–313) and replaced it with a contract on `TauCeti.SmoothForm.smul_eq_mapCoeff`, `smul_toRoughForm`, `instModule`, `mextDerivₗ_smul`, `mpullback_smul`, `wedgeWith_smul_left_of_map_smul`, `wedgeWith_smul_right_of_map_smul`, `mapCoeff_conj_smul` and `mapCoeff_conj_wedgeWith_mul`, said to be "the pinned Tau Ceti's". At 358314d none of the nine exists, nor `SmoothForm.mapCoeff`, `TauCeti.homotopyOperator` or `StarConvex.exists_contDiffOn_forall_extDeriv_eq`; so at the pin this branch declares, the complex vector-space structure on forms that the complex de Rham complex of §5.4 (`README.md:1441–1442`, "the pinned complex scalar action … that K1 cites") and the type calculus of K1 use has no owner.

Witness: `grep -rl` over `.lake/packages/TauCeti/TauCeti` at 358314d returns no file for each of the nine names, for `SmoothForm.mapCoeff`, `homotopyOperator` and `exists_contDiffOn_forall_extDeriv_eq`. At 2fd255d9 (the content checkout's package) every one resolves in `TauCeti/Geometry/Manifold/DifferentialForm/MapCoeff.lean`: `smul_toRoughForm` 253, `smul_eq_mapCoeff` 266 (`c • φ = mapCoeff (c • ContinuousLinearMap.id ℝ F) φ`), `instModule` 273, the `IsScalarTower ℝ S` instance 281 (unnamed), `mextDerivₗ_smul` 305 (needs `[IsManifold I 2 M]`), `mpullback_smul` 312, `mapCoeff_conj_smul` 322 (for `SmoothForm I M ℂ k`), `wedgeWith_smul_left_of_map_smul` 377, `wedgeWith_smul_right_of_map_smul` 389, `mapCoeff_conj_wedgeWith_mul` 402; `HomotopyOperator.lean:100` (on `M × Icc 0 1`, as the README now says); `Poincare.lean:393`.

Repair, route a (recommended): merge main into the branch so that `lake-manifest.json` pins Tau Ceti 2fd255d9 and Mathlib 1b1ccf4, re-run `lake env lean` on `Suggested.lean` and the gate at those pins, then apply R02. Tested at 2fd255d9: each of the nine clauses at `README.md:305–321` matches the pinned statement (the scalar as the coefficient map of `c • id`, pointwise action on the rough form, the module and scalar-tower instances, linearity of `mextDerivₗ` on a `C²` manifold, of `mpullback` along a `C^∞` map and of `wedgeWith` in the argument where the pairing intertwines `c` with `d`, conjugate-linearity and multiplicativity of coefficient conjugation on complex-valued forms). Route b, if the branch keeps 358314d: restore the K1 construction text of 20c666e and the other constructions the previous report's route b lists, and delete the contract lines.

## R02 (P2) — `Suggested.lean` and the README still disagree about the pins; on route a three statable headlines are absent

Location: `Suggested.lean:19–22, 36–40` (unchanged since 20c666e); `README.md:33–38, 330–341, 353–359, 1623–1628` (unchanged).

Claim: the module docstring says the Nijenhuis tensor, the type-form differential, the manifold form complexes and the Hodge star are not available at the pins; the README says the pinned Tau Ceti has them. At 358314d the docstring is right (R01); at 2fd255d9 the README is right and Newlander–Nirenberg (local form, `README.md:353–357`), the local Dolbeault–Grothendieck lemma and the de Rham Hodge decomposition are statable and absent, with the carriers the previous report names (`Nijenhuis.lean:158`, `Dolbeault/Basic.lean:95`, `AlmostComplexType.lean:201`, `Codifferential.lean:88`, `DeRham/Basic.lean`).

Witness: `git diff --stat 20c666e HEAD -- TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` is empty; `README.md:58–62` still defers "the other headline theorems and their missing geometric carriers" to a docstring that contradicts lines 33–38.

Repair: as in the previous report. On route a, add the three statements and rewrite the docstring bullets for Layers 1, 2 and 5 so they name only carriers still missing at 2fd255d9; on route b, delete the README contract.

## R03 (P2) — Every DifferentialGeometry id now resolves on main, but the open revision #886 drops all of them and no order is stated

Location: `README.md:1065` ("DifferentialGeometry §5.5's `RoughDensity` carrier"), `1109` ("*Needs:* DifferentialGeometry §§0.1–0.4 and 5.5"), `1437` ("DifferentialGeometry §5.5's agreement of the density integral"); `18, 139, 1433, 2074, 2114, 2215, 2698` ("§§8.3–8.5", "§8.4", "§8.5"); the pull-request description's "Depends on" block.

Claim: the repair moved the three density citations from "§5.5a" to main's "§5.5", so the citations are now consistent with one state of DifferentialGeometry (main). But the overlap facts, computed from the open heads, list exactly §5.5, §8.3, §8.4 and §8.5 as ids that #886 no longer defines at its head (5.5 becomes 5.5a/5.5b; Layers 6–11 are deleted). The `*Needs:*` line at 1109 and the contract at 139 are supplier citations, and the description still names only #1027 and #1028, so when #886 merges first every one of them breaks with nothing saying who owes the old → new map.

Witness: DifferentialGeometry on main `README.md:524` ("5.4 The homotopy operator"), `528` ("5.5 Densities, and Stokes with corners"), `836, 845, 852` (8.3–8.5); at the head of #886 (a565de6) `README.md:841` ("5.5a") and `850` ("5.5b"), no 8.3–8.5 (the previous report's witness, unchanged); `scratch/overlaps.md` lists the four ids at lines 1065, 1437, 2074, 2698, 1433, 2215.

Repair: keep the README's ids as they are and add one sentence to the description's merge-order paragraph: this pull request merges before #886, which then owes the old → new map for 5.5 and 8.3–8.5 (optionally "(5.5a at the head of its open revision)" at 1065, 1109 and 1437). No change to the mathematics; the depcheck is unaffected (DifferentialGeometry is on main).

## R04 (P3) — Four open pull requests change this folder and conflict with this head, with no stated order

Location: the pull-request description, "Depends on" block (`#1027`, `#1028`).

Claim: unchanged since the previous report. The overlap facts show #1234 and #1807 conflicting with this head in `README.md` and `Suggested.lean`, and #1808 and #1854 in `Suggested.lean`; the description names none of them and no rebase order. R03 adds #886 and R05 adds #903 to the pull requests the description must name.

Witness: `scratch/overlaps.md`, "Other open pull requests that change this roadmap", four entries computed from the heads at the index of 2026-11-08.

Repair: state which pull request rebases onto which (for example #1234 onto this one; this one before #886; before or after #1807/#1808/#1854), and do not restate here what #1234 changes.

## R05 (P3) — GeometricTopology Layers 1.7 and 1.7.1 exist only at the head of its open revision #903, which the description does not name

Location: `README.md:2430` ("[GeometricTopology Layer 1.7](../GeometricTopology/README.md)'s smooth classification of compact surfaces"), `2433` ("[GeometricTopology Layer 1.7.1](../GeometricTopology/README.md)'s polygon/CW model"), `2506` ("GeometricTopology Layers 1.7 and 1.7.1 for the genus comparison"), `2706`.

Claim: the repair replaced the PlanarTopology/SurfaceTopology citations (new roadmaps at #271, which the description named) by GeometricTopology Layers 1.7 and 1.7.1. GeometricTopology on main has a Layer 1 ("manifold-library buildout", `GeometricTopology/README.md:177–289`) with no subsection 1.7 and no surface classification; the string "1.7" occurs in that file once, at line 1069, in a reference key. "### 1.7 Compact smooth surfaces" and "### 1.7.1 Polyhedral surfaces and explicit Euclidean embedding models" exist at the head of #903 (091ed17f, `GeometricTopology/README.md:921, 982`), the only open head that defines them (`roadmaps grep --fixed '### 1.7 Compact smooth surfaces'`). #903 revises an existing roadmap, so its numbering is a dependency only when the description or the merge-order paragraph names it; neither does.

Witness: the content at #903 does support every claim made here, so only the citation's resolution is at issue: genus `(2 − χ(F) − b)/2` with `b` boundary components (`:941–942`), `rank H₁(F; ℚ) = 2g` for closed `F` (`:944`), the polygon/CW model with word `c₁c₁⋯c_qc_q [a₁,b₁]⋯[a_p,b_p] d₁e₁d₁⁻¹⋯` and counts `F=1, E=q+2p+2r, V=r+1`, "including the separate sphere case", compared with the standard surface (`:1018–1024`); for `q = r = 0` that is the README's one vertex, `2j` edges, one face and word `[a₁,b₁]⋯[a_j,b_j]`. The previous roadmaps' owner on main for this content does not exist: `roadmaps grep` for "classification of compact surfaces" on main finds only consumers (IndexTheory at #1077 cites "GeometricTopology Layer 1.7" too).

Repair: name #903 in the description's dependency block, as #271 was named before (the README text needs no change). If the author does not want #903 as a dependency, cite GeometricTopology by the content it has on main (there is none for surfaces) or SurfaceTopology Layer 8 at #271 as before; do not state the classification here.

## R06 (P3) — Typography the repair left or introduced, and one over-general clause

Location and claim, one line each:

- `README.md:1515–1516`: "For degrees one and two use the pinned / the pinned Tau Ceti homotopy operator" — "the pinned" is doubled (introduced by this head).
- `README.md:1182`: "smooth test equal near0 to `1/(1+2x)`" — the previous report's line 1176 ("near0"), the one fused digit the repair missed; every other item of its list is fixed (verified at 788, 790, 1129–1131, 1161, 1174, 1177, 1345, 1671, 1676, 2190–2200, 2213, 2444, 2612, 2698–2708).
- `README.md:318–319`: "coefficient conjugation is conjugate-linear, `conj(c • ω) = conj(c) • conj(ω)` (`TauCeti.SmoothForm.mapCoeff_conj_smul`)" is stated inside a paragraph about forms with values in an arbitrary normed complex space `F`; the pinned theorem (`MapCoeff.lean:322`) is for `SmoothForm I M ℂ k` only, and conjugation of `F`-valued coefficients is not defined. Say "for complex-valued forms" in that clause, as the wedge clause at 320 does.

Repair: delete one "the pinned", insert the space, add the three words.

## Previous findings

- R01 — not repaired, and extended: the manifest still pins 358314d; `README.md:305–321` adds nine `TauCeti.SmoothForm.*` names from `MapCoeff.lean` that exist only at 2fd255d9 ("are the pinned Tau Ceti's"). Written again as R01.
- R02 — not repaired: `Suggested.lean` is byte-identical to 20c666e; `README.md:33–38, 330–341, 353–359` unchanged. Written again as R02.
- R03 — partly repaired: `README.md:1065, 1109, 1437` now read "§5.5" (main's id); §§8.3–8.5 kept; but the description still names neither #886 nor an order. Written again as R03.
- R04 — not repaired: the description's "Depends on" block lists #1027 and #1028 only. Written again as R04.
- R05 — partly repaired: spaces inserted at every listed line but 1182 (R06); "[ComplexManifolds Milestone 4]" at 2612; "PDE §1.3 (A3)" at 997, 1323, 1653, 1942, 2684 and "PDE §2.2 (B9)" at 1335 match PDE on main (`PDE/README.md:769, 1148`); `packages/ComplexKahlerGeometry/sources.toml` records `raghunathan-discrete-subgroups` (`:173`, `uncertified`) and `griffiths-harris` (`:187`, `uncertified`). The leftover is R06.

## Verified sound

### Gate, build, signatures, padding

- Worktree at `d4190f87bf6ba22861847213744e100f0caaf88c`, clean; `git diff --stat origin/main...HEAD` outside the folder is empty; `scratch/changes.md` lists no file changed outside the folder since 20c666e.
- Gate rerun from the worktree (`gate … ComplexKahlerGeometry --base origin/main`): every counter 0, `OK`; the worker's run adds `build=0`.
- `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` at the branch pins: exit 0, exactly 7 warnings, all ``declaration uses `sorry` `` (lines 65, 85, 114, 128, 146, 163, 172), identical to the previous review.
- Movable dependency check on this head:

```text
depcheck: 244 roadmaps, 2465 edges, 0 problem(s)
```

- Signatures: `Suggested.lean` is unchanged, so the previous report's `#check @…` comparison stands; the worker's `scratch/signatures.md` lists the same 7 elaborated types with no dropped binder. The padding probe of the previous report (0 of 7 closed by one tactic) stands for the same reason.
- Header unchanged: `module`, `public import Mathlib`, `@[expose] public section`, no `set_option`, no `lemma`, no sorry'd data, no `example`.

### The changed passages

- `README.md:199–208` (Tau Ceti contract): at 2fd255d9, `TauCeti.homotopyOperator` is defined on forms on `M × Icc 0 1` with model `I.prod (𝓡∂ 1)` (`HomotopyOperator.lean:16–38, 100`), as "the homotopy operator on a cylinder `M × [0,1]`" says, and DifferentialGeometry main §5.4 (`:524`) describes exactly that operator, as `README.md:1516` says; `StarConvex.exists_contDiffOn_forall_extDeriv_eq` is at `Poincare.lean:393`; `SmoothForm.mapCoeff` at `MapCoeff.lean:200` and `instModule` at 273. Attribution is now Tau Ceti's, as the previous report asked; the only defect is the pin (R01).
- `README.md:305–321` (complex scalar action): each clause matched against `MapCoeff.lean` at 2fd255d9 (lines in R01); the hypotheses the pin adds that the README does not spell out are harmless here: `IsManifold I 2 M` for `mextDerivₗ_smul` (K1's manifolds are `C^∞`), `ContMDiff I I' ∞ f` for `mpullback_smul`, and the intertwining hypothesis `∀ a b, μ (c • a) b = d • μ a b` for the wedge, which a complex-bilinear pairing satisfies with `d = c`.
- `README.md:997, 1323, 1335, 1653, 1942, 2684` (PDE labels): PDE on main has "### 1.3 Agreement with the Bessel-potential scale (A3)" (`:769`) and "### 2.2 Interpolation (B9)" (`:1148`), and no "Lane".
- `README.md:1065, 1109, 1437` (DG §5.5): DifferentialGeometry main `:528` lists `RoughDensity` under 5.5; `:524` the homotopy operator under 5.4.
- `README.md:1441–1442` ("using the pinned complex scalar action and complex-linear `mextDeriv` that K1 cites"): consistent with 305–321; R01 applies.
- `README.md:2426–2448, 2506, 2706` (genus dictionary): the mathematics is checked in the table; the citation is R05. The PlanarTopology/SurfaceTopology citations are gone from the README entirely (`grep` finds none), so the description's dropping of #271 is consistent.
- `README.md:2612`: "[ComplexManifolds Milestone 4]" resolves on main (`ComplexManifolds/README.md:172–319`, previous report).
- `README.md:2698–2708`: "DifferentialGeometry §§8.3–8.5 and 12.1, AlgebraicTopology §§4.5, 4.7, 6.1 and 6.3 and GT Layer 11" — AT Stage 4.5/4.7/6.1/6.3 and GT Layer 11 (`GeometricTopology/README.md:831`) resolve on main as in the previous report; the DG ids are R03.

### Remarks on untouched text (no change requested)

- `README.md:78, 80, 277, 1472, 1478, 1510, 2134, 2144, 2236` use the shorthand "DG0.4", "DG2.1", "DG5.3", "DG0.3", "DG1", "DG12.1", "DG5" for DifferentialGeometry items; the previous review passed them.

### Library declarations opened at the pins

- Tau Ceti 358314d (worktree): none of `smul_eq_mapCoeff`, `smul_toRoughForm`, `SmoothForm.instModule`, `mextDerivₗ_smul`, `mpullback_smul`, `wedgeWith_smul_left_of_map_smul`, `wedgeWith_smul_right_of_map_smul`, `mapCoeff_conj_smul`, `mapCoeff_conj_wedgeWith_mul`, `SmoothForm.mapCoeff`, `homotopyOperator`, `exists_contDiffOn_forall_extDeriv_eq` (0 files each; the 43 `instModule` hits at 358314d are other structures').
- Tau Ceti 2fd255d9 (content checkout): `MapCoeff.lean:240–335, 370–410` read in full; `HomotopyOperator.lean:1–40, 100–124`; `Poincare.lean:393`. Statements as recorded in R01.
- The previous report's Mathlib f6090c7 and Tau Ceti 358314d/2fd255d9 lists stand (no statement of `Suggested.lean` changed).

### Cross-roadmap citations resolved this round

- GeometricTopology on main: Layer 1 at `:177`, Layer 11 at `:831`; no 1.7. At #903 (091ed17f): 1.7 `:921`, 1.7.1 `:982`, 1.7.2 `:1174`; ownership sentence `:137` ("This roadmap owns the smooth classification of compact surfaces (Layer 1.7)").
- PDE on main: `:769`, `:1148`. DifferentialGeometry on main: `:524`, `:528`, `:836–852`. ComplexManifolds Milestone 4 on main.
- `scratch/citations.md`'s three leads (`CompactFormPair.operatorDomainV`, `exists_compact_selfAdjoint_shifted_inverse`, `mem_operatorDomainV_iff_summable`) are VariationalMethods names at #1028 (`VariationalMethods/README.md:845, 849, 884`), resolved in the previous report; the README's lines 1591–1593 are untouched.
- Ids this pull request drops that others cite (`#k2-…`, `#k5-…`, `#k7-…` anchors): covered by the anchor map at `README.md:239–251`, untouched since the previous report.
- Ownership against open pull requests by object: the surface classification is consumed, not owned, here (GeometricTopology at #903 and SurfaceTopology at #271 both state it; that duplication is theirs, not this roadmap's). No new object is owned by the changed passages.

### Adversarial pass

Rows for the statements the diff leaves untouched are carried from the previous report (PRREVIEW-ComplexKahlerGeometry~35, "Adversarial pass", 69 rows: Weierstrass preparation/division, Runge, the mixed solver, the stalks, the §1.1–§8.2 conventions and Checks); they are not recomputed here. New rows for the changed statements:

| Statement / convention | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `c • ω = mapCoeff (c • id) ω` (305–308) | ω = dz on ℂ, c = i | left: i dz = i dx − dy; right: `L_i` applied to coefficients (1, i) of dz gives (i, −1): i dx − dy | Equal; pinned `smul_eq_mapCoeff` |
| `IsScalarTower ℝ ℂ` (310) | r = 2, c = i, ω = dz | (2 • i) • dz = 2i dz; 2 • (i • dz) = 2i dz | Equal; instance at `MapCoeff.lean:281` |
| `conj(c • ω) = conj(c) • conj(ω)` (318) | c = i, ω = dz (coefficients 1, i) | conj(i dz) = conj(i dx − dy) = −i dx − dy; conj(i) • conj(dz) = −i(dx − i dy) = −i dx − dy | Equal; pinned for ℂ-valued forms only (R06) |
| conj multiplicative on wedge (320) | φ = dz, ψ = dz̄ | conj(dz ∧ dz̄) = conj(−2i dx∧dy) = 2i dx∧dy; conj(dz) ∧ conj(dz̄) = dz̄ ∧ dz = 2i dx∧dy | Equal; `mapCoeff_conj_wedgeWith_mul` |
| `mextDerivₗ (c • ω) = c • mextDerivₗ ω` (311–313) | c = i, ω = x dy on ℝ² | d(i x dy) = i dx∧dy; i d(x dy) = i dx∧dy | Equal |
| homotopy operator on `D × [0,1]`, `H(z,t) = tz` (1516–1517) | φ = H*(dz) = z dt + t dz | ∂ₜ ⌟ φ = z; hφ = ∫₀¹ z dt = z; d(hφ) = dz = ι₁*φ − ι₀*φ = dz − 0 | Cochain identity holds; H¹_dR(D;ℂ) = 0 route sound |
| same, degree two | φ = H*(dx∧dy) = t² dx∧dy + t(x dt∧dy − y dt∧dx) | ∂ₜ ⌟ φ = x dy − y dx; hφ = ∫₀¹ t(x dy − y dx) dt = (x dy − y dx)/2; d(hφ) = dx∧dy | Equal to ι₁*φ − ι₀*φ; H²_dR(D;ℂ) = 0 |
| genus `(2 − χ)/2`, `rank H₁ = 2j` (2432) | ℂP¹ (χ=2); torus (χ=0); genus-2 curve (χ=−2) | (2−2)/2 = 0, rank 0; (2−0)/2 = 1, rank 2; (2+2)/2 = 2, rank 4; Hodge: h^(1,0) = 0, 1, 2 and b₁ = 0, 2, 4 | g = j in each case |
| polygon/CW model counts (2433–2436) | j = 0, 1, 2 | j=0: sphere, separate case; j=1: V=1, E=2, F=1, χ=0, word [a₁,b₁]; j=2: V=1, E=4, F=1, χ=−2 | Matches #903 `F=1, E=2p, V=1` at q=r=0 |
| cup pairing on the 2g polygon generators (2445–2447) | j = 1 | a₁ ⌣ b₁ = [Σ], b₁ ⌣ a₁ = −[Σ]: matrix ((0,1),(−1,0)), det 1 | Unimodular symplectic; unchanged claim |
| PDE labels (997 etc.) | A3; B9 | PDE main 1.3 = "Agreement with the Bessel-potential scale (A3)"; 2.2 = "Interpolation (B9)" | Match |
| DG §5.4/§5.5 (1065, 1516) | main `:524`, `:528` | 5.4 = `homotopyOperator` on `M × Icc 0 1`; 5.5 = densities incl. `RoughDensity` | Match |

### Sources sampled

The seeded targets (§§1.1, 2.1, 3.0, 3.2, 4.1, 5.1–5.8, 6.0, 8.2) are untouched by the diff except the citation edits above; their locators were opened in the previous report (`demailly-agbook`, `rainer-advanced-complex-analysis`, `lojasiewicz-triangulation`, `sakane-parallelisable`, `chevalley-eilenberg`, `angella-iwasawa`, lines listed there) and no changed passage cites a source. This round opened no further source line; the two sources R05 of the previous report asked for are now in `sources.toml` as `uncertified`.

## Not verifiable

- `webster-nn`, `hormander-alpdo1`, `wells-dacm`, `griffiths-harris`, `raghunathan-discrete-subgroups`: settled as uncertified, cited by locator, not requested.
- The statements of `Suggested.lean` and the R02 additions at main's pins (Tau Ceti 2fd255d9, Mathlib 1b1ccf4): not elaborated, because the worktree's packages are at 358314d/f6090c7 and `lake env lean` is allowed only there; the 2fd255d9 declarations were read in the content checkout's package.
- Ownership against #848, #1609 and #1231 by object: checked only through `roadmaps grep`; their files are not in this brief.

## Source issues

- none
