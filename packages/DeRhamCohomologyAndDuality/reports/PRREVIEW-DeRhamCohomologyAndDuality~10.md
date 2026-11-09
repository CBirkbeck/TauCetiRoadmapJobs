# Review of DeRhamCohomologyAndDuality (pull request #2085 at 573d243)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/DeRhamCohomologyAndDuality/` at 573d243. Since 48fa667 the folder changed by 247 lines: 186 in the README and 61 in `Suggested.lean`. Nothing outside the folder changes. The gate passes, the dependency check is clean, and `Suggested.lean` elaborates with only its six `sorry` warnings.

Three of the four findings of the review at 48fa667 are repaired. The fourth, about the pull request's text, is not. Two P3 findings remain and nothing blocks:

- the new manifold theorem of §5.3 overlaps TangentialBordism §2.1, and the README does not record this;
- the pull-request title and description still contradict the head.

## Findings of the review at 48fa667

| Id | Passage at this head | Status |
|---|---|---|
| R01 (P2) manifold form of §5.3 missing from `Suggested.lean` | `Suggested.lean:194–202` defines `IsTransverseAt`. `:204–222` states `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate`: "μ {p \| ¬ ∀ x, IsTransverseAt I J (relativeTranslate f β p) j x} = 0". The docstring at `:16–22` names it. README `:1049–1079` gives the definition, three API bullets and four Checks. | **Repaired.** The Haar-null form is stronger than the requested "∃ p with ‖p‖ < r", which follows because a Haar-null set contains no ball. Dropping `T2Space`/`SigmaCompactSpace` in favour of `SecondCountableTopology` is correct; see the table. |
| R02 (P3) §5.3's route used an unstated local form of §5.2 | `README.md:1011–1019`, "*Local form.* The same holds for `F` smooth on an open `O ⊆ E × P` and `j` smooth on an open `W₀ ⊆ W`". There is a Check at `:1027–1030`, the manifold route applies it at `:1102–1103`, and `:1109` now reads "`max_{a, l ≤ k} … ‖Dˡ(h ∘ φ_a⁻¹)‖`". | **Repaired.** |
| R03 (P3) §2.5 assumed finite-dimensional `V` | `:670`, "`V` a real normed space"; `:33–34`, "relative approximation into real normed spaces with collar data". | **Repaired.** Mathlib's `Continuous.exists_contMDiff_approx_and_eqOn` takes `F` with only `[NormedAddCommGroup F] [NormedSpace ℝ F]` (checked by `#check`). |
| R04 (P3) title and description contradict the head | Unchanged: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer". | **Not repaired.** It is R02 below. |

## R01 (P3) — §5.3's manifold theorem is an instance of TangentialBordism §2.1's parametric theorem, and the README does not say so

**Location.**

- `README.md:84–93`: "TangentialBordism §2.1 proves parametric transversality to a closed embedded submanifold … §5.2 here is the flat case of that theorem against a smooth map `j` … The relative perturbations of §5.3 move `f` and keep `j` fixed".
- The *Manifold sources* bullet, `:1083–1104`, has no locator.

**Claim.**

- The paragraph places only §5.2 against TangentialBordism. Its clause about §5.3 separates §5.3 from TangentialBordism's *relative* theorem, which perturbs a map to `Z`, but not from its *parametric* theorem.
- `addHaar_setOf_not_forall_isTransverseAt_relativeTranslate` is exactly that parametric theorem, applied as follows:
  - source `M × N`, a Lindelöf boundaryless manifold;
  - parameters `S = V`;
  - the boundaryless non-compact target `V × V`;
  - `Z` the diagonal;
  - `F((x, y), p) = (f(x) + β(x)p, j(y))`.
- Universal transversality of the family is transversality of `F` to the diagonal (`:1003–1006`). On a vector space a `TauCeti.IsNullSet` is Haar-null.
- This roadmap is on main, so it cannot consume the open TangentialBordism. Proving the theorem by its own route is therefore right, but the scope section must say how the kept variant differs, as it already does for §5.2.
- The manifold bullet also carries no locator or ownership clause, while the Lean docstring (`Suggested.lean:211–212`) cites Lee 6.36.

**Witness.** TangentialBordism `README.md:561–562, 567–576` at #942's head 42329d2 allows a non-compact boundaryless target. It requires a Lindelöf source, boundaryless `S` and a closed embedded `Z`. Its conclusion is that the bad `s` form a `TauCeti.IsNullSet` in `S`.

**Repair.** At `README.md:92`, before "The relative perturbations of §5.3", insert:

> The Haar-null theorem of §5.3 on manifold sources is likewise the instance of that parametric theorem with source `M × N`, parameters `V` and the diagonal of `V × V`, read through `IsTransverseAt` and Haar measure on `V`; it is proved here from the local form of §5.2 for the same reason.

Then change the next clause to "The relative perturbations of §5.3 move `f` and keep `j` fixed, unlike TangentialBordism's relative theorem, which perturbs a map to `Z`, and §2.5 here …".

At the end of the route in the *Manifold sources* bullet (`:1103`), add "[Lee, Thm. 6.35] for embedded submanifolds; the form against a map, with relative translation families, is this roadmap's".

**Tested on.** Take `M = ℝ`, `N` a point, `V = ℝ`, `f = x²`, `β = 1` and `j = 0`.

- The TangentialBordism instance `F((x, pt), p) = (x² + p, 0)` meets the diagonal iff `x² + p = 0`.
- At such a point `span{(2x, 0)} + span{(1, 1)} = ℝ²` iff `x ≠ 0`.
- So the bad set is `{0}`, the value of the README's manifold Check at `:1140–1144`.

## R02 (P3) — The pull-request title and description still contradict the head

**Location.**

- Title: "ComplexKahlerGeometry K6.1 is a supplier, not a consumer".
- Description: "the README no longer names K6.1 as a consumer and cites ComplexKahlerGeometry only as a supplier".

**Claim.**

- At this head `README.md:99–105` and `:1192–1199` name ComplexKahlerGeometry K6.1 as the consumer of §§2.4, 3.1–3.3 and 4.1.
- There is no ComplexKahlerGeometry supplier contract. The contract headings at `:146, 205, 328, 337` are Mathlib, Tau Ceti, DifferentialGeometry and AlgebraicTopology.
- The description says nothing of what the pull request now changes:
  - Layer 1 is rebuilt on `TauCeti.IsPrimitiveOn` and `TauCeti.PrimitiveSpace`;
  - §2.5 now takes a normed target;
  - §5.2 gains its local form;
  - `IsTransverseAt` and the manifold Haar-null theorem are new.
- CONTRIBUTING asks for "descriptions that reflect the work actually done".
- The folder agrees with main, where this roadmap names K6.1 as consumer, and with the human's ownership decision recorded in earlier rounds, so this stays P3.

**Witness.** The pull request's description against `README.md:1192`: "ComplexKahlerGeometry K6.1 (analytic cycles) consumes the boundaryless instances of §§2.4, 3.1–3.3 and 4.1".

**Repair.** Nothing in the folder changes. Rewrite the title and description to describe this head, for example "DeRhamCohomologyAndDuality: local primitives on Tau Ceti's covering space, manifold relative transversality". The description should list:

- K6.1 stays a consumer;
- Layer 1 is on `TauCeti.IsPrimitiveOn`/`PrimitiveSpace`;
- §2.5 has a real normed target;
- §5.2 has its local form;
- `IsTransverseAt` and the Haar-null theorem on boundaryless second-countable sources are new.

This is the fourth review to ask for it.

## Verified sound

**Gate, re-run on this head.**

```text
gate DeRhamCohomologyAndDuality: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check (`--movable`, board order, main).**

```text
depcheck: 235 roadmaps, 2259 edges, 0 problem(s)
```

- There is no UPWARD, CYCLE or moved line. The roadmap is at line 397 of 400 in the merge order.
- Its suppliers, DifferentialGeometry and AlgebraicTopology, are on main.
- The other roadmaps it cites are also on main: GeometricTopology §1.1, HeegaardFloer F0.S and ComplexKahlerGeometry K5a and K6.1.
- TangentialBordism is cited only as adjacent, never as a supplier.
- No gaps are declared: there is no readable `design/plan.json`, and the README has no gap contracts.

**Folder.**

- The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.DG"`). `git diff origin/main...HEAD` outside the folder is empty.
- All 13 Lean names appear backticked in the README.
- A grep for process words found none.

**Lean.**

- `lake env lean` on `Suggested.lean` takes 19 s and gives exactly six warnings, all `declaration uses 'sorry'`, at lines 62, 82, 121, 157, 171 and 213.
- `#check @` on all 13 declarations in one scratch copy gives types identical, after namespace normalisation, to the worker's signature listing. I compared each with its README statement:
  - §1.3 has `[IsManifold I 1 M] [SimplyConnectedSpace M]` only.
  - §§2.2 and 2.4 carry `[FiniteDimensional ℝ E] [T2Space] [SigmaCompactSpace]`, and §2.4 has `X : Type`.
  - §§5.2 and 5.3 (flat) carry every `FiniteDimensional` the README states.
  - The manifold theorem carries `BoundarylessManifold`, `SecondCountableTopology` and `IsManifold ∞` on both `M` and `N`, `FiniteDimensional` on `EM`, `EN` and `V`, and no `T2Space`. That is the README's `:1083–1088` statement exactly.
  - The binders that look dropped from `incidenceEquation` are harmless: its body uses only subtraction in `V`.
- I changed nothing.
- Padding probe: I replaced each `sorry` by `by first | rfl | simp | infer_instance | trivial | aesop`, and all six theorems fail (`aesop` made no progress, or unsolved goals).
- The flat §5.3 theorem is a corollary of the manifold one, but not a one-tactic corollary: it needs `mfderiv_eq_fderiv`, a ball of positive Haar measure and translation of the transversality hypothesis. It is the README's named §5.3 target, so it stays.
- `IsTransverseAt` has a real body and is needed by the manifold headline. There is no `set_option`, `lemma` or sorry'd data. The four `TauCeti.*` imports all exist with object files.

**Headline theorems.**

- The Summary lists §§1.3, 2.2, 2.4, 3.3, 4.1, 4.2 and 5.3.
- Stated: §§1.3, 2.2, 2.4 and 5.3 (flat and manifold), plus §5.2.
- Named in the docstring as not statable: §§3.3, 4.1 and 4.2. The reasons hold at the Tau Ceti pin 1b1ccf4:
  - `SmoothSingular/` has only `Basic.lean` and `Integral.lean`.
  - `Integral.lean:86–196` has `integral` and its linearity, naturality and degree-0 lemmas, but no Stokes theorem for simplices and no cochain map.
  - No declaration converts a `Manifold.Orientation` into a `HomologicalOrientation`. The only constructor is `HomologicalOrientation.ofSimplyConnectedSpace` (`Orientation/Homological.lean:168`).
- The compact-with-corners form of §5.3 is a corollary of §2.5 and the manifold theorem, so it is not required as a separate headline.

**Library declarations, checked at the pins.**

- 150 backticked names went through one `#check @` file over Mathlib and 48 built Tau Ceti modules. 124 elaborate.
- The other 26 lie in unbuilt modules, and I read each in source:
  - `MappingCocone/Relative.lean:54, 76, 103, 113, 136`;
  - `Collar/Brown.lean:459`;
  - `DeRham/Period.lean:90, 104, 121, 148, 162, 197, 313, 351, 405`;
  - `HomotopyInvariance.lean:105`, `SimplyConnected.lean:69`, `ExtendByZero.lean:75` and `Exhaustion.lean:71`;
  - `Integration/Stokes.lean:37`, `OpenSubset.lean:71`, `ZeroDim.lean:34, 67`, `Path.lean:74` and `ChangeOfVariables.lean:228`;
  - `Geometry/Manifold/Topology.lean:36`.
- `SmoothSimplex.integral_mextDeriv` is DifferentialGeometry 8.4's (main `README.md:848`). This resolves the citation tool's lead.
- The new contracts hold as stated:
  - `mfderiv_eq_fderiv` (`MFDeriv/NormedSpace.lean:786`).
  - `ChartedSpace.secondCountable_of_sigmaCompact` takes `[SecondCountableTopology H] [SigmaCompactSpace M]`. `ModelWithCorners.secondCountableTopology` takes `[SecondCountableTopology E]`.
  - `exists_contMDiff_zero_iff_one_iff_of_isClosed` takes `[FiniteDimensional ℝ E] [IsManifold I ∞ M] [SigmaCompactSpace M] [T2Space M]` and gives values in `[0, 1]`, `0` exactly on `s` and `1` exactly on `t`.
  - `TauCeti.IsRegularParameter` (`GlobalParametric.lean:63`) is surjectivity of `fderiv f (x, l) ∘ inl` at every solution.
  - `TauCeti.levelSetChart` needs only `HasStrictFDerivAt` at the centre, a surjective derivative and a complemented kernel.
  - `TauCeti.addHaar_image_criticalPoints_eq_zero` asks for `ContDiffAt` only at the points of `U` and needs `finrank² + 1 ≤ n`. This is what the local form of §5.2 says.
- Layer 1's claim holds. `PrimitiveSpace.isCoveringMap_proj` (`LocalPrimitive.lean:280`) uses its section hypotheses only through `exists_contMDiff_isPrimitiveOn` (`:282`). The sheet argument uses `isOpen_image_graph` (`:204`) and `continuousOn_graph` (`:208`, `[IsManifold I 1 M]`), and `IsPrimitiveOn.isOpen_setOf_eq` (`:132`) needs only `[IsManifold I 1 M]`.
- `pathClassIntegral` (`Period.lean:90`) is `0` off closed `C¹` forms, as the §1.2 Check says.
- `relativeCoordinates_d` (`Relative.lean:76`) is `(da, f a − db)`, the §3.1 convention.
- No transversality predicate for a pair of maps exists in Mathlib or Tau Ceti at the pins. The Tau Ceti files that mention transversality concern Lie subgroups, contact and symplectic structure, and vector fields.

**Sources (seeded sample).**

- `hatcher`:
  - Prop. 1.30, homotopy lifting with a unique lifted homotopy, at line 2676, printed p. 60;
  - Prop. 1.33, the lifting criterion for path-connected, locally path-connected `Y`, at line 2723, p. 61;
  - Prop. 1.34, unique lifting on connected `Y`, at line 2758, p. 62.
  These support §1.2's and §1.3's uses as written.
- The sample targets marked "this roadmap's" carry no textual locator: §§1.1, 2.1, 2.3, 2.5, 3.2, 4.2, 5.1, the relative forms in 2.4 and 3.3, and the local form in 5.2. For these I checked their library inputs instead (above).

**Cross-roadmap citations, resolved.**

- On main (content 11b9f2e):
  - DifferentialGeometry 8.3: `README.md:836–844`, smoothing under `[IsManifold I ∞ M] [T2Space M] [SigmaCompactSpace M] [FiniteDimensional ℝ E]` with no boundaryless restriction;
  - DifferentialGeometry 8.4, `:845–851` (`chainIntegral`, `SmoothSimplex.integral_mextDeriv`, `deRhamHom`), 8.5, `:852` (`deRhamEquiv`), and 9.3, `:872` (duality only);
  - GeometricTopology §1.1, `:788–810`: the interior's inclusion is a homotopy equivalence;
  - AlgebraicTopology 6.3, `:1285`, the comparison with `Manifold.Orientation`;
  - HeegaardFloer F0.S is §2.1, `:71`;
  - ComplexKahlerGeometry K6.1 at `:1328, 1382, 1388, 1396` (DifferentialGeometry labels) and K5a at `:33`.
- At open heads:
  - TangentialBordism #942 (42329d2), `:567–576`, cited in R01;
  - AlgebraicTopology #1652 (946a78a), `:95–101`: its 8.13 owns transversality to closed embedded submanifolds of compact targets and says this roadmap's Layer 5 is an analogue by its own route;
  - DifferentialGeometry #886 (af91579), `:60–62`: it names this roadmap owner of Layers 1–5.

**Ownership against open pull requests.**

- `scratch/overlaps.md` lists no other pull request changing this roadmap and no dropped ids.
- `roadmaps grep` by object found no second owner of a transversality predicate for maps. The search covered `IsTransverse`, `transverseAt`, "parametric transversality" and "transversality theorem". The only `IsTransverse` hits are the scheme-theoretic `SNCData.IsTransverse`.
- The overlap with TangentialBordism §2.1 is R01.
- ComplexKahlerGeometry #1234's head d5ab208 is unchanged since the last review, and its K6.1 "owns these boundaryless open-pair statements" (`:1980`). This is the settled human decision of earlier rounds: this roadmap owns them, the revision cites it. I do not raise it again.

**Adversarial table.** One row per statement; each row lists the instances tried and the values computed on each side.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1 local primitives | `dx`; `x dy`; angular form; `d(\|x\|^{3/2})`; `d(x² sin(1/x))` | `d Re = dx`. For `x dy`, `∂ₓ∂ᵧg = 1 ≠ 0 = ∂ᵧ∂ₓg`. Angular form: loop integral `2π`. `(3/2)sgn(x)\|x\|^{1/2}` is `C⁰` but not `C¹`. At `x = 1/(2πk)` the derivative is `−1`, and at `0` it is `0`. | holds | none |
| §1.2 covering and integral | circle once, twice, reversed; `0→3` split at `1`; `d(\|x\|^{3/2})` segments | `2π`, `4π`, `−2π`; `(1−0)+(10−8) = 3`; `1` and `0`, while `pathClassIntegral` gives its junk `0`. `isCoveringMap_proj` uses its section hypotheses only at `:282`. | holds | none |
| §1.3 headline | slit plane; `ℂ∖{0}`; `M` a point; `ℝ²` with `d(\|x\|^{3/2})` | `arg`; `2π ≠ 0`, so no primitive; a point forces `E = 0`, `φ = 0` and constant `g`; `\|x\|^{3/2} + c`. Mathlib's lifting lemma needs exactly `[SimplyConnectedSpace] [LocallyPathConnectedSpace]`. | holds | none |
| §2.1 strict inward cone | `[0,∞)` at `0` with `v = 1, 0, −1`; quadrant with `(1,0)`; interior anchor | `ball(t, t/2) ⊆ [0,∞)`; `−εt/2 ∉ C`; `(t, −εt/2) ∉ Q`; `y + t(q−x) + w = (1−t)y + t(q + (y−x) + w/t)` with `‖(y−x) + w/t‖ < 2ε₀` | holds | none |
| §2.2 headline | `[0,∞)`; `[0,1]` with `1/2 − x`; `[0,1)` with field `1`; `dim E = 0` | `Φ(0,x) = x+1`, `Φ(1,x) = x`; `r(0) ≈ 0.316`, `r(1) ≈ 0.684`; the unscaled flow escapes at `s = 1 − x`, and rescaling to `\|Xf\| ≤ 1/2` stops escape; for `dim E = 0`, interior `= M` and `r = id` | holds | none |
| §2.3 transfer | `j = r = id`; `[0,∞)` to `(0,∞)`; `S¹` with a point | `s`; `[1] − [0] = ∂(t ↦ t)`; `0` on `H₁(S¹) = ℝ`, so the homotopy `j∘r ~ id` is needed | holds | none |
| §2.4 headline | `W = ∅`, `W = X`; `(ℝ, ℝ∖{0})`; graph of a nowhere-differentiable function | absolute; `0 = 0`; `H₁ = ℝ` via `t ↦ 2t−1` with `∂ = [1] − [−1]`, `H₀ = 0`; smooth `H₁` is uncountable-dimensional against singular `0`, so `IsOpen W` is needed | holds | none |
| §2.5 theorem | `V = ℓ²`; error budget; image reserve with `f = 1+x²`; octant `Q` | every lemma's target is a normed space; `‖h−f‖ = ρ‖e−f‖ < ε/2` on `T` and `0` off `T`, so the total is `< ε`; tolerance `min(ε, 1+x²) > 0`; `Q(t,t,t) = −3t² < 0` | holds | none |
| §3.1 sign | `(ℝ, ℝ∖{0})`, `b = 1_{(0,∞)}`, `c = [−1,1]` | `∫_c 0 − (1−0) = −1`, so `δ[b] = −[(0,b)]` evaluates to `1 = b(∂c)`; the opposite sign gives `−1`. `relativeCoordinates_d` gives `(da, f a − db)`. | holds | none |
| §3.2 cocone | `ψ dx` pair; `K = ℝ²`, `L = ℝ` | `1 − 1 = 0 = d(Ψ,0)`; for every `t`, `((k₁,k₂),0) ↦ (0, k₂+tk₁)` is a chain map | holds | none |
| §3.3 (not statable) | `(ℝ², ℝ²∖{0})` | `H¹ = coker(ℝ ≅ ℝ) = 0`; `H² ≅ H¹(W) = ℝ`; `δ[dθ]` on a disc is `2π` | holds | none |
| §4.1 (not statable) | `S¹ ±`; two points; `ℤ` with `K = {0,1}`; `ℝ` with `t ↦ 4t−2` | `±2π`; `f(a) − f(b)`; `1+2 = 3` with no `Fintype ℤ`; `∂ = [2] − [−2]` and pairing `1` | holds | none |
| §4.2 (not statable) | `D¹` with `β = c±`; `[0,1]`, `α = dx`, `β = x` | `−(c₊ − c₋)`; `1 − (1−0) = 0` and `(dx, x) = d(x, 0)` | holds | none |
| §5.1 definitions | `x+p`, `j = id` at `((1,2),3)`; `x²+p` at `p = −1, 0, 1`; universal transversality | `2`; regular (`±2`), not regular (`0`), regular (empty); `(u,q) ↦ 2xu + q` is onto, and for `x²` the map `(u,q) ↦ 2xu` vanishes at `(0,p)` | holds | none |
| §5.2 headline | `x²+p`; `x²`; `V = 0`; `P = 0` | bad set `{0}`; every `p` is bad and `htotal` fails; empty; with `P = 0`, `htotal` makes `0` regular, so the bad set is empty | holds | none |
| §5.2 local form | `O = (−1,1)×ℝ`; `O = (1,2)×ℝ` | `{0}`; zeros `√(−p)` with `p ∈ (−4,−1)` and derivative in `(2,4)`, so `∅` | holds | none |
| §5.3 flat headline | `f = 0`, `β = x²`, `p = 1`, `x = 2`; `β ≡ 0`; `f = β = x²` | `4`; `p = 0`; `x²(1+p)` has derivative `0` at its zero, so `hgood` is needed | holds | none |
| `IsTransverseAt` | `g = 1, j = 0`; `g = 0, j = id`; `g = x², j = 0`; flat agreement | vacuous; `(u,v) ↦ −v` onto; at `0` the map is `0`; `p = −1` gives `±2`, `p = 0` fails at `0` | holds | none |
| §5.3 manifold headline | `M = ℝ`, `N` a point, `f = x²`, `β = 1`; `N` = discrete `ℝ`, `M` a point, `j = id`; `M` = discrete `ℝ`, `N` a point, `f = id`; line with two origins, `f = x²` | bad set `{0}`, null; bad set `ℝ`, measure `∞`, so `SecondCountableTopology N` is needed; bad set `ℝ` again, so `SecondCountableTopology M` is needed; bad set `{0}` still null, since the chart route never uses `T2` | holds; overlaps TangentialBordism §2.1 | R01 |
| §5.3 TangentialBordism instance | `F((x,pt),p) = (x²+p, 0)` against `Δ ⊆ ℝ²` | `span{(2x,0)} + span{(1,1)} = ℝ²` iff `x ≠ 0`, so the bad set is `{0}` | same value as the manifold Check | R01 |
| §5.3 compact, finite order | `‖βp‖_{C^k}` | `‖Dˡ(β∘φ⁻¹)·p‖ = ‖Dˡ(β∘φ⁻¹)‖‖p‖`, so `‖p‖ < ε/(1+‖β‖_{C^k})` suffices | holds | none |
| §5.3 compact with corners | `D = [0,1]`, `f = (x−1/2)²`, `j = 0`, `e = f` near `{0,1}` | `e(0) = 1/4 ≠ 0`, transverse vacuously; for `p < 0` the zeros `1/2 ± √(−p)` have derivatives `±2√(−p) ≠ 0`; `‖g−f‖ ≤ \|p\| < ε` | holds | none |
| Examples, two circles | `S¹ → ℝ³` with `β = 0` on an arc disjoint from `j(S¹)` | at the zeros of `β` the hypothesis is vacuous; `1 + 1 < 3` means transverse iff disjoint | holds | none |

## Not verifiable

`lee` and `bott-tu` are recorded as `uncertified` in the package's `sources.toml`: paywalled and cited by locator only. I did not read either text, so these locators remain unverified:

- Lee: Prop. 2.28 (§2.2); Thms. 9.24–9.26, pp. 222–223 (§2.2); Ch. 11, *Conservative Covector Fields* (§§1.2–1.3); Thms. 6.35–6.36 (§§5.2–5.3, including the "cutoff argument extends Thm. 6.36" attribution and the Thm. 6.35 locator proposed in R01); Thm. 18.7 (§2.4); Thm. 18.14 (§3.3).
- Bott–Tu: Ch. I §6 (§3.1) and §5 (§4.1).

## Source issues

- none
