# Review of DifferentialGeometry (pull request #886 at cd5e804)

**Verdict:** needs changes

A full review: the folder changed by 234 lines since `c6bc13d`. First, finding by finding against the previous review:

- **R01 (folder builds at neither pin's contract; conflict with main) — not repaired.** `lake-manifest.json` still pins Tau Ceti `358314d4` with Lean `v4.35.0-rc3`; `Suggested.lean:9–10` still import two modules main's pin does not have; `git merge-tree --write-tree HEAD origin/main` still reports "CONFLICT (content)" in `Suggested.lean`. One part is repaired: the docstring no longer has the "are stated here once the build is against …" clause; `Suggested.lean:80–88` now reads "Four further headlines are not statable against the Tau Ceti modules this file can import, each for want of the carriers its README statement names". Re-raised as R01.
- **R02 (layer 4 and 5.4a plan what Tau Ceti has; second leaf with no comparison) — repaired in the README (steps 1–6).** README 551–586 and 1382–1396 list the six further files; 4.1 names the transport and annihilator declarations and keeps two targets ("Two statements remain targets. Restriction … Local annihilating coframes in any corank", 1417–1425); 4.2 reads "The unbundled predicate and the bundled data are Tau Ceti's … Nothing about them is planned here" (1447–1453); 4.3 names the three flat-model steps (1512–1518); 4.4 adds the comparison target and cites the partition ("is not proved a second time", 1572–1574); 5.4a names the insertion and its two laws (1794–1801). Step 7 (use `TauCeti.IntegralManifold` itself) needs the merge of R01; this head does what is possible before it: `Distribution.IntegralManifold` now has the native field names and the `nonempty` field (`Suggested.lean:787–799`). It is folded into R01.
- **R03 (description: no order against #334 and #1187, nine modules) — not repaired.** Re-raised as R02.
- **R04 (3.4 locator) — repaired.** README 1292: "forms via flows [Lee, Prop. 12.36]".

No new finding. The gate passes (every scanner `0`, build `OK`). `Suggested.lean` elaborates from the worktree with 32 `declaration uses sorry` warnings and no other diagnostic. The dependency check reports 0 problems. No file outside the folder changes.

## R01 (P2) — The folder builds at neither pin's contract and still conflicts with main

Re-raised: H01. The recorded reason ("a repair job may not touch `lake-manifest.json` and `lean-toolchain`") says who must act; it does not change the state of the head. The pull request cannot be merged as it stands, and the Lean file does not build at the pin its README is written against.

**Location.**

- `lake-manifest.json`: Tau Ceti `358314d4…`, Lean `v4.35.0-rc3`; main (`3090489`): Tau Ceti `2fd255d9…`, Lean `v4.36.0-rc2`.
- `Suggested.lean:9` `public import TauCeti.Geometry.Manifold.Orientation`, `:10` `… Riemannian.Sphere`.
- `Suggested.lean:80–88` (the four headlines "not statable against the Tau Ceti modules this file can import") and `:787–799` (`structure IntegralManifold`).

**Claim.** (a) The README's *From Tau Ceti* contract names declarations of `2fd255d9`; this head adds the layer-4 and 5.4a ones, and most of the contract does not exist at the pin the folder builds against. (b) At main's pin both imports are gone, so the file does not build there. (c) At main's pin four headlines (triviality of the orientation cover and `d` commuting with averaging; `H^n_c ≃ ℝ` and Poincaré duality; the degree formula) are statable and absent, and `Distribution.IntegralManifold` is a second copy of `TauCeti.IntegralManifold`.

**Witness.**

- `git merge-tree --write-tree HEAD origin/main`: stages 1–3 for `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, "CONFLICT (content)".
- Elaborating the file against main's packages fails on the missing object file of `TauCeti/Geometry/Manifold/Orientation`.
- Tau Ceti `2fd255d9`, `Geometry/Manifold/Distribution/IntegralManifold.lean:139–159`: the same eight fields under the same names.

**Repair.** Unchanged from the previous review:

1. Merge main into the branch (or bump `lake-manifest.json` and `lean-toolchain` to main's pins), resolve `Suggested.lean` to the branch side, rename the two imports to `TauCeti.Geometry.Manifold.Orientation.OrientedAtlas` and `TauCeti.Geometry.Manifold.Riemannian.Sphere.Basic`, and rebuild the six targeted modules.
2. State the four headlines on `TauCeti.poincarePairing`, `TauCeti.compactlySupportedDeRhamCohomology.integral`, `TauCeti.degreeAtRegularValue` with `TauCeti.integralTopForm`, and `TauCeti.invariantPart` / `TauCeti.Manifold.OrientationCover`, and delete the sentences at `Suggested.lean:80–88`.
3. Delete `Distribution.IntegralManifold`, add `public import TauCeti.Geometry.Manifold.Distribution.IntegralManifold`, and state the six layer-4 theorems on `TauCeti.IntegralManifold`. With the field names already aligned the statements do not change; README 1405–1408 and 1446 then name only the native structure.

The finding is repaired when `git merge-tree` reports no conflict and the targeted build passes at main's pins.

## R02 (P3) — The description states no order against #334 and #1187, and still describes nine Lean modules

Re-raised: H03. The recorded reason, that the description is outside a repair job's files, fails because the author can edit it.

**Location.** The pull-request description: 0 matches for `334` and `1187`; "The nine Lean modules retain the full existing programme …", "330 intentional admission warnings", "PlanarPrimitiveTargets.lean".

**Claim.** #334 replaces this folder and #1187 bumps Tau Ceti to an ancestor of main's pin; both conflict with this head and no order is stated. The description says "The folder holds one Lean file" and then describes nine modules and a companion file the head does not contain.

**Witness.** The overlap report at this head: "#334 and #886 conflict in `…/README.md`, `…/Suggested.lean`"; "#886 and #1187 conflict in … `TauCetiRoadmap/DifferentialGeometry/Suggested.lean`, … `lake-manifest.json`". The folder holds one `.lean` file with 32 admissions.

**Repair.** In the description, add "This head supersedes #334; for this folder #1187 is subsumed by main's Tau Ceti pin, and its conflict disappears once this branch merges main." and replace the paragraphs about nine modules, 330 and 392 admissions and `PlanarPrimitiveTargets.lean` by "The folder holds one Lean file with 32 admitted theorems."

## Previous findings

- R01 — not repaired (pin, imports, merge conflict); the docstring clause is repaired. Re-raised as R01.
- R02 — repaired in the README; its Lean step waits on R01 and is R01 step 3.
- R03 — not repaired (description). Re-raised as R02.
- R04 — repaired.

## Verified sound

**Gate.** The worker's run at this head: every scanner `0`, build `OK`. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/DifferentialGeometry'` is empty.

**Dependency check** (`--movable`, with the board's `ORDER.txt`):

    depcheck: 235 roadmaps, 2266 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

**Elaboration.** `lake env lean TauCetiRoadmap/DifferentialGeometry/Suggested.lean` from the worktree (Tau Ceti `358314d4`): exit 0, 32 `declaration uses sorry` warnings, nothing else. No `set_option`, no admitted `def`, `instance` or `example`; imports are `Mathlib` and ten `TauCeti.*` modules.

**Signatures.** `#check @…` on the layer-4 structure and its six theorems (the declarations this head changes), compared with README 4.2–4.4; nothing changed beyond the field rename. All six carry `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [T2Space M]`; `isInvolutive_iff_forall_mextDeriv` has no boundaryless hypothesis and the other five have it; `exists_contMDiff_factor` carries `[SecondCountableTopology N.carrier]` and, for the source, finite dimension, Hausdorff, second countable and boundaryless, as 4.3 says. The other 75 declarations are unchanged since the head whose signatures the previous review compared.

**Padding probe.** On a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | (simp; done) | (intros; rfl)`: 32 replacements, an error at each of the 32 lines; none closes.

**Tau Ceti declarations opened at `2fd255d9`** (under `Geometry/Manifold/`), hypotheses compared with the README's sentences:

- `Distribution/IntegralManifold.lean:74` `IsIntegralManifold` (nonempty source, `C^n` immersion, range of the differential equal to `D`), `:98`, `:103`, `:114`, `:124`, `:139` `IntegralManifold`.
- `Distribution/Diffeomorph.lean:86` and `:107` (frame transport), `:124` `IsContMDiffDistribution.comap_mfderiv` (`m + 1 ≤ n`), `:217` `IsInvolutiveDistribution.diffeomorph` (regularity at least `minSmoothness 𝕜 2`, i.e. `C²` over `ℝ`; differential identifies the two families).
- `Distribution/Annihilator.lean:57` (`k + 1 = finrank 𝕜 E`, `[IsManifold I (n + 1) M]`, finite-dimensional model: the README's "corank one on a `C^(n+1)` finite-dimensional manifold").
- `Distribution/Splitting.lean:54` (flat model; takes involutivity as a hypothesis and returns it, with rank and regularity, in the product coordinates `D_p × T`).
- `Distribution/Transverse.lean:72` (rank `finrank E` on `E × F`, fibre at the point disjoint from `0 × F`), `:133` (involutive, `C^(n+1)`, real finite-dimensional factors).
- `Foliation/Leaf.lean:82, 90, 94` (curves `C¹` on `[0, 1]` with velocity in the distribution; the generated equivalence; the leaf as a set), `:162`, `:167`, `:179`, `:214`, `:281` (`{y | y − x ∈ S}`).
- `DifferentialForm/Interior.lean:304` `mpullback_interior` (pointwise relatedness `df(X x) = Y (f x)`), `DifferentialForm/Wedge/Interior.lean:69` (degrees `k + 1` and `l + 1`, sign `(−1)^(k+1)`).
- Not named by the README and not duplicated by a target: `Distribution/{Submersion,VectorBundle,Levi,Complex}.lean`, and the set-level `IsInvolutiveDistributionOn` (`Distribution.lean:359`), which is not the restriction to an open submanifold that 4.1 keeps as a target.
- Sample names: `Analysis/Green/Examples/CurveArea/Green.lean:45, 59, 71, 104, 119, 131`, `Shoelace.lean:54`, `BowTie.lean:203`, `WeakField.lean:30`; `Analysis/BoxIntegral/Examples/GaugeFTC.lean:81, 192`; `TwoForm/Basic.lean:37`; `Geometry/Symplectic/Manifold/TwoForm.lean` (`SmoothTwoForm.IsSymplectic`); `Analysis/Contour/Winding/Number/Basic.lean:76`. Mathlib at the pin: `BoxIntegral.IntegrationParams.Henstock` (`Partition/Filter.lean:244`), `IntegrableOn.hasBoxIntegral` (`Integrability.lean:198`), `curveIntegral_eq_intervalIntegral_deriv` (`CurveIntegral/Basic.lean:148`), `HasFDerivWithinAt.curveIntegral_segment_source` (`:546`).

**Seeded sample (8 targets).**

- "Smooth 2-forms" (README 530–538): the carrier and predicates above exist; the migration is a target.
- "Canonical interfaces and reuse" (1372–1408): every file and declaration named exists at `2fd255d9` with the hypotheses stated.
- "Acceptance examples" (layer 4, 1597–1607): `S(x,y,z) = (y,x,z)` gives `S^*(dz − x dy) = dz − y dx`. "Acceptance examples" (5.6, 2289–2312): the eleven names resolve in the namespaces written.
- "Conventions and existing inputs" (2026–2046) and "Henstock–Kurzweil" (2181 ff.): the declarations above.
- "Flat punctured-plane family" (2314–2327): values in the table; no native, so it stays a target.
- "Ownership and ordering" (2329–2343): the linked roadmaps exist on main.
- The README flags no locator as unverified. Lee, cached text: Lemma 19.5 (line 23040: rank-`k` distribution smooth iff locally the common kernel of `n − k` smooth 1-forms), Prop. 12.36 (14896), Thm. 12.37 (14922), Thm. 19.12 (23201), Prop. 19.16 (23356), Thm. 19.17 (23383), Thm. 19.21 (23456).

**Overlaps.** §5.5 → 5.5a/5.5b is mapped at README 37–39 (ConvexityToric, LocalVariationalFieldTheory and StringOrientation cite §5.5). No cited id is dropped by an open pull request and none is defined only by an open revision. The citation resolver reports no cross-roadmap citation found nowhere; its seven Lean-name leads are this roadmap's own declarations, each in `Suggested.lean`. The two conflicting pull requests are R02. DeRhamCohomologyAndDuality, the closest open roadmap, is named as a consumer on both sides (README 109–120); its head was not re-read this round.

**Headline theorems** (README 13–18). Stated: Banach flows (3.1–3.2), Frobenius and leaves (4, six theorems), the hairy ball theorem (11, two forms), the divergence theorem with boundary (12.5). Cited to Tau Ceti: half-space Stokes (5.3), Green for AC cycles and for finite type-I/type-II divisions (5.6). Not statable for want of a construction at either pin: corner Stokes (5.5b), the de Rham theorem (8.5). Statable at main's pin only, and absent: Poincaré duality (9.3), the degree formula (10.4), top cohomology (9.2), the 2.4 pair (R01).

**Adversarial table.** Rows marked "carried" are for statements unchanged since the heads where they were computed.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 4.4 comparison, image of the leaf `= F.leaf x` | rank `0`; rank `dim M`; irrational slope on `ℝ²/ℤ²`; constant family `S` on `E` | `{x}` and `{x}`; connected component and `C¹`-path component; dense line on both; `x + S` and `{y \| y − x ∈ S}` | holds; both inclusions of the sketch checked (push-forward of a path; open and closed set of parameters via plaques) | none |
| 4.4 on `[0, ∞)`, full tangent family | boundary point `0` | no boundaryless 1-manifold maps onto a neighbourhood of `0` with surjective differential; the comparison and `exists_leaf` assume boundaryless | excluded by hypothesis | none |
| `IntegralManifold` with `nonempty` | empty carrier in each of the six theorems; `P = ∅` in `exists_contMDiff_factor` | `x ∈ range N.map` and `ConnectedSpace` force nonempty; `P = ∅`: `g` the empty map, `N.map ∘ g = f` | no statement changes | R01 step 3 |
| `exists_contMDiff_factor`, second-countable carrier | `k = 0`, `N = ℝ` discrete, `f = id` on `ℝ` | without the hypothesis: `g = id : ℝ → ℝ_discrete` not continuous; with it: `N` countable, `f` locally constant, `g` continuous | hypothesis needed and present | none |
| 4.1 coframes in any corank | `span(e₁)` on `ℝ³`; contact family; `k = d`; `k = 0` | `dy, dz` (2 forms; `ker dy` alone has rank 2); `dz − y dx` (1 form, the native case); empty coframe, kernel `T M`; full coframe, kernel `0` | holds; `C^n` case by the dual of a completed `C^n` frame on a `C^(n+1)` manifold | none |
| 4.1 restriction to open `U` | `span(e₁)` on the unit disc; `U = ∅` | rank 1 with frame `e₁`; vacuous at every rank | holds | none |
| 5.4a `p = id`: naturality pair vs `mpullback_interior` | `p = id`, `h = f`; `p = id`, `q = f`, `df∘X = Y∘f` | `C_(f, Y∘f)ω = f^*(ι_Y ω)` and `ι_X(f^*ω) = C_(f, df∘X)ω`; equal | the two equations give the native law | none |
| 5.4a wedge law vs `interior_wedgeWith_apply` | `φ = dx`, `ψ = dy`, `X = e₁` | `ι_X(dx∧dy) = dy`; `(ι_X dx) dy + (−1)¹ dx·(ι_X dy) = dy − 0` | sign `(−1)^(deg φ)` agrees | none |
| 3.4 derivative of `ψ_s^*α` (Prop. 12.36) | `Z = ∂ₓ` on `ℝ`, `α = x dx` | `ψ_s^*α = (x + s) dx`, derivative `dx`; `L_Z α = dx`, `ψ_t^* dx = dx` | holds; locator now right | none |
| Contact family (4.2 Checks) | `X = ∂x + y ∂z`, `Y = ∂y` | `[Y, X] = ∂z`, `(dz − y dx)(∂z) = 1 ≠ 0` | not involutive | none |
| Punctured family (5.6) | symbolic; `α = 0`; `α = 1`; unit circle | `∂ₓQ − ∂ᵧP = 2ρ^(−α) − 2αρ^(−α−1)(x² + y²) = 2(1−α)ρ^(−α)`; `2`; `0`; `∮ = ∫₀^{2π} (sin² + cos²) dt = 2π` | holds; non-exact for every `α` | none |
| Ellipse, gauge FTC (5.6 examples) | `a = 2, b = ½`; `h = t² sin t⁻²` | `½∮(x dy − y dx) = ab·π = π`; `h(1) − h(0) = sin 1 ≈ 0.8415` | holds; native | none |
| carried: 1.4 Cartan; 3.5 time-dependent flow arguments; 5.6.2 one-cell identity and division signs; 5.6.1 kernel estimate; 2.2 `prod_neg_left`; 11.1 parity; 12.5 half-line | as in the previous review | `dy = dy + 0`; `x + (t − s)`; `−1 = −1`; `∫_D (R_Q − R_P)`; `2π ≤ 4π`; `det = −1`; `(−1)^(n+1) = −1, +1, −1`; `−1 = ⟪X, −∂ₜ⟫(0)` | holds | none |

## Not verifiable

- [Lee] GTM 218 was read from the text already in the worker's sources cache (recorded as `uncertified`); printed page numbers were not checked, only theorem numbers and statements. [Tu] GTM 275, [Bott–Tu] GTM 82 and [Milnor]: no legal open copy; standard theorems carried by their locators.
- The statements owed after the merge (R01 steps 2–3) were decided by reading the library at `2fd255d9`; they were not elaborated, because the worktree's packages are at `358314d4`.
- Ownership against open pull requests other than those listed with a path in the brief was not checked.

## Source issues

- none
