# Review of QuasiregularMaps (pull request #2134 at a1b21d8)

**Verdict:** accepted

Full review of the head the previous review read (the folder is unchanged). The folder has no finding. One matter outside the pull request is recorded for whoever maintains the board, under "Board record" below; it asks nothing of the author.

## Previous findings

- R01 of the previous review (P2, the board's `packages/QuasiregularMaps/design/plan.json` still declares the gap `orientation-descent`) — not a finding of this folder, and not raised again. The folder is as that review wanted it: `TauCetiRoadmap/QuasiregularMaps/README.md:89–90`, "No roadmap plans the orientation of the quotient manifold of a general free, properly discontinuous action; it is owned here (§7.5)", and the README declares exactly six contracts, all of SobolevMapsBetweenManifolds (README:380–405). Four repair reports in a row answered that nothing in the folder changes and that the plan needs a maintainer's edit on the board; that reason is correct, so the finding is settled as not actionable in this pull request. See "Board record".

## Board record (for the board's maintainers; no change to the pull request)

`packages/QuasiregularMaps/design/plan.json` on the board's main still has a seventh entry in `gaps`, `orientation-descent` (supplier DifferentialGeometry), the prerequisite string `gap:orientation-descent` (line 1769) and the clause "gap orientation-descent for the missing descent section" (line 1868). README §7.5 plans that object itself, from pinned Mathlib and Tau Ceti declarations, so the gap is obsolete. Each of the last four repair rounds removed the `gaps` entry in its own checkout of the board and none of those removals reached the board's main (the parsed file still lists seven slugs). A repair of this pull request cannot close it; a maintainer's commit on the board can: delete the `gaps` entry and the two leftover references. If the gap was announced on a DifferentialGeometry job, that announcement is obsolete too.

## Verified sound

**Gate, build, dependency check (run on this head).**

    gate QuasiregularMaps: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK

    depcheck: 235 roadmaps, 2133 edges, 0 problem(s)

- No UPWARD, CYCLE or `moved:` line. SobolevMapsBetweenManifolds is line 402 of the merge order and QuasiregularMaps line 403.
- `lake env lean` on `TauCetiRoadmap/QuasiregularMaps/Suggested.lean`: five `declaration uses sorry` warnings (lines 90, 106, 160, 177, 191), nothing else.
- Nothing outside the folder changes; the worktree is clean.

**Principles.** No `set_option`, no sorry'd data, one `import Mathlib` and one Tau Ceti module (`TauCeti.Analysis.Sobolev.WeakDeriv.Basic`). No algorithm, no copied passage found in the three readable sources. The layers are named by their mathematics. The general statements are kept: §6.4 and §7.7 do not assume compactness, §7.5 is for any free, properly discontinuous orientation-preserving action.

**Seeded sample (15 targets).** Read against the cached texts:

- §1.2: MartioRickmanVaisala1969 lines 411–416 are (2.21) and (2.22), the outer and inner inequalities with the least constants `K_O`, `K_I`. Agrees.
- §1.3 and §3.2: line 438 is (2.25), first `K_O ≤ K_I^{n−1}`, second `K_I ≤ K_O^{n−1}`; line 439 says both are best possible. The two docstrings of `Suggested.lean` name "second" and "first" in that order, correctly.
- §1.4: lines 426–430 are the Callender–Reshetnyak form (2.23) with `n^{n/2} K`; line 435 is (2.24).
- §2.8: HeikkilaPankka2025 lines 1255–1260 are Lemma B.2 (closed `M`, conclusion `W^{1,∞}`), as the README says; the README's statement is wider and is its own, with a route from pinned lemmas.
- §3.3: MartioRickmanVaisala1969 lines 423–425, the projection satisfies (2.22) with `K = 1` and is not quasiregular.
- §4.2, §7.3: HeikkilaPankka2025 lines 20–27 define quasiregular maps between oriented Riemannian manifolds and ellipticity; line 18 is Theorem 1.1 for a closed manifold with no metric fixed; lines 32–34 speak of quasiregularity "with respect to smooth structures". The README presents metric independence as its own theorem through §4.1, not as the source's.
- §5.1: MartioRickmanVaisala1969 lines 332–340 are 2.16 (open `n`-intervals with closure in `U`, exceptional sets of `(n−1)`-measure zero, `p ≥ 1`); lines 118–121 the formal derivative. The README states the two differences (closed boxes, every `p`).
- §5.3: lines 409–411 are Definition 2.20 with (2.21); line 124 the Jacobian; lines 412–419 the dilatations, with `∞` off the class; line 418 "`K`-quasiregular" means `K(f) ≤ K`.
- §6.2: HeikkilaPankka2025 lines 1247–1251 are Proposition B.1 (closed, `n ≥ 2`); lines 1322–1327 build the local diffeomorphisms `ϕᵢ`.
- §7.7: lines 32–34 and 85–91 are the branched coverings by tori and the composition with a locally isometric covering `ℝ⁴ → T⁴`; closedness of `N` is in the source and the README says so.
- §2.7, §4.3, §4.4 (Rickman1993, Ch. I) and §5.2 (Vaisala1971, Ch. 3; Rickman1993, Ch. I): texts not readable, see "Not verifiable"; the mathematics was recomputed instead (table).

Outside the sample, also read: Prywes2019 lines 22–27, 28–30, 33–36, 41–53, 59–61; HeikkilaPankka2025 lines 56–57, 94–96, 271–273, 1236–1245, 1317–1339; MartioRickmanVaisala1969 lines 127, 420–422, 440–444. All agree with the README's use of them.

**Adversarial table** (values computed for this review).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §1.1 minimal stretch, Lean `minimalStretch` | `diag(3, 1/2)`; shear `[[1,1],[0,1]]`; `V = 0` | index `n − 1 = 1` gives `1/2`, index `0` gives `3`; `AᵀA` eigenvalues `(3 ± √5)/2`, `ℓ = (√5 − 1)/2`; `finrank − 1 = 0`, value `0` | Pass | None |
| §1.2 `q_O`, `q_I`, submultiplicativity (sample) | `diag(2,1)`; `R = diag(−1,1)`; `0`; `R ∘ R`; `A = 0` with `J(B) ≤ 0` | `4/2 = 2`, `2/1 = 2`; `∞`, `0`; `0`, `0`; `q_I(id) = 1 > 0 · 0`; `q_O(BA) = 0 ≤ ∞ · 0 = 0` | Pass; sign hypotheses used | None |
| §1.3 equivalences and (2.25) pointwise (sample) | `K = −1`, `R`; `diag(2,1,1)`; `diag(1,1,1/2)`; `diag(3,2,1)`; `n = 1`, `A ≠ 0`, `J < 0` | `1 ≤ 1` holds, `q_O = ∞`; `4 = 2²`; `4 = 2²`; `9/2 < 36`, `6 < 81/4`; `q_I = 0 ≤ ∞⁰ = 1`, `q_O = ∞ ≤ 0⁰ = 1` false | Pass; `K ≥ 0` and `J > 0` used | None |
| §1.4 `q_S ≤ q_O ≤ n^{n/2} q_S` (sample) | `diag(2,1)`; `diag(1,ε)`; `diag(1,ε,ε)` | `5/4 ≤ 2 ≤ 5/2`; ratio `2/(1+ε²) < 2`; ratio `3^{3/2}/(1+2ε²)^{3/2}` | Pass | None |
| §2.7 `C¹` maps (sample) | `(x³, y)`; `−x` on `ℝ²`, `ℝ³`; `z²` | `q_O = max(3x²,1)²/(3x²) → ∞`, at `x = 0` `‖df‖ = 1`, `J = 0`; `J = +1`, `−1`; `‖df‖² = 4|z|² = J` | Pass | None |
| §2.8 locally Lipschitz maps (sample) | winding map; fold; `|x|^{1/2}` on `ℝ` | singular values `2,1,1`, `K_O = 8/2 = 4`, `K_I = 2/1 = 2`; `J = −1` on `x₁ < 0`; derivative in `L^p` near `0` iff `p < 2` | Pass | None |
| §3.2 Lean `det_le_pow_mul_minimalStretch_pow` (headline 1) | `n = 0`; `n = 1`, `Du = a ≥ 0`; radial `a = 1/2` in `ℝ³` | `det = 1 ≤ K⁰ · 0⁰ = 1`; `a ≤ |a|`; `|x|^{−3/2}/2 = 4 · |x|^{−3/2}/8` | Pass | None |
| §3.2 Lean `of_det_le_mul_minimalStretch_pow` (headline 1) | `n = 0`; `n = 1`; radial `a = 2` in `ℝ³`; projection of `ℝ²` | `K^{0} = 1`, `1 ≤ 1 · 1`; `K⁰ = 1`, `|a| ≤ a` from `hf`; `8|x|³ = 4 · 2|x|³`; `hI` holds (`0 ≤ 0`) but `hf` fails (`1 > K' · 0`) | Pass; `hf` used | None |
| §3.3 (sample) | `P` in `ℝ³`; `n = 1` | `J = 0 = ℓ³`, `‖DP‖ = 1`; `P = 0`, `K_O = 1` | Pass | None |
| §4.1 comparison, used by §7.3 | `T²`, `g' = dx² + 4dy²`; `g' = dx² + e^{2x}dy²` | `‖dπ‖' = 2`, `J' = 2`, `q' = 2 ≤ 4`; `q' = max(1, e^{2x})/eˣ = e^{|x|}`, unbounded | Pass | None |
| §4.2 orientations (sample) | identity for `(o,o)`, `(−o,−o)`, `(o,−o)`; reflection `(std) → (−std)` | `J = 1, 1, −1`; `J = −det R = 1` | Pass | None |
| §4.3 precomposition (sample) | torus projection; shear `(x, y + x³/3)`; reflection | `K_π = 1`; `‖dθ‖ = (x² + √(x⁴+4))/2`, `J = 1`, `K_θ = ∞`; `J = −1` | Pass; both hypotheses used | None |
| §4.4 postcomposition (sample) | `z² ∘ z²`; radial `a = 2` after `a = 1/2` in `ℝ³` | `z⁴`, `K = 1`; `|x|^{1/2} · |x|^{−1/2} x = x`, `K_O = 1 ≤ 4 · 2` | Pass | None |
| §5.1 definitions, Lean `formalDeriv`, `IsACLOn`, `IsACLpOn` (sample) | `u = (x₂, 0)`; Cantor function; `|x|^{1/2}` on `ℝ²`; `n = 0` | columns `e₁ ↦ 0`, `e₂ ↦ e₁`; not absolutely continuous on `[0,1]`; `∫ r^{1−p/2} dr < ∞` iff `p < 4`; all quantifiers over `Fin 0` vacuous | Pass | None |
| §5.2 Lean, both theorems (headline 2, sample) | `|x|^{1/2}`; `p = 1/2` series `Σ 2^{−k} χ_k(y) sin(16^k x)`; `|x₁|` | both sides iff `p < 4`; `∫|∂₁u|^{1/2} ≈ Σ 8^{−k/2} < ∞`, `∫|∂₂u|^{1/2} ≈ Σ 4^{−k}`, `∫|∂₁u| ≈ Σ 2^{−k} 16^k 8^{−k} = Σ 1 = ∞`; `Du = (sign x₁, 0)` off a null line | Pass; `1 ≤ p` used | None |
| §5.3 Lean `isQuasiregularOn_iff_isACLpOn` (headline 2, sample) | `n = 0`; `K = 0`, constant `f`; `max(0, t)`; `−t` on `ℝ` | `1 ≤ K · 1` on both sides, `MemLp` at `p = 0` is measurability; right side `0 ≤ 0` holds, left fails `1 ≤ 0`; both hold with `K = 1`; both fail (`1 ≤ −K`) | Pass; `hK` used | None |
| §6.1 triangulations | inscribed triangle edge; infinite star | `|p(t)|² = 1 − 3t + 3t² ∈ [1/4, 1]`, `dθ/dt = (√3/2)/|p|² ∈ [√3/2, 2√3]`; not locally finite, not a manifold | Pass | None |
| §6.2 simplicial maps (sample) | fold on a symmetric triangulation; one identified vertex pair on a triangle | non-degenerate, `J = −1` on `x₁ < 0`; rank `1` | Pass | None |
| §6.4 (headline 3) | torus doubling; strip map `h`; partial collapse; eight-sector map | `4/2 = 2`; `q_O = k²/k = k`, `K_p = ∞`; `1 > K · 0`; `L = [[1,−1],[0,√2]]`, `LᵀL` eigenvalues `2 ± √2`, `q_O = (2+√2)/√2 = 1 + √2` | Pass; `K_p < ∞` and non-degeneracy used | None |
| §7.2 (headline 4) | `f ∘ R` | Jacobian for `(std, −o_N)`: `−(J_f(Rx) · (−1)) = J_f(Rx) ≥ 0`, same `K` | Pass | None |
| §7.3 (headline 4, sample) | `α = β = 1`; `g' = c² g`; `T²` with `dx² + 4dy²`; `α = 0` | factor `1`; `(c/c)ⁿ = 1`; bound `4`, true value `1`; no denominator, excluded by `0 < α` | Pass | None |
| §7.5 orbit orientation | translations; glide `(x+1, −y)`; antipodal map on `S¹`, `S²`; trivial group | `det = 1`; `det = −1`, Möbius band; degrees `+1`, `−1`; `o_X/Γ = o_X` | Pass | None |
| §7.6 (headline 5) | `ℝⁿ/ℤⁿ`; Klein bottle; screw motion `(−x, −y, z + 1/2)` | `‖dπ‖ = J = 1`; glide has `det = −1`, no orientation, outside the statement; rotation part `det = 1`, local isometry gives `K = 1` | Pass | None |
| §7.7 (headline 6, sample) | doubling `∘ π`; `T = N = ℝ²`, `s = id`, `π = id` | `K_π = 1`, `K_p = 2`, bound `2`; `K = 1`, `N` not compact | Pass | None |

**Lean file.**

- `#check @name` for all ten declarations, elaborated on a scratch copy: each type carries the binders its README statement names. The two §3.2 theorems have `[FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`, the hypothesis `IsQuasiregularOn`, and the converse has `1 ≤ K`; the §5.2 theorems have `[FiniteDimensional ℝ F]` and `ContinuousOn u Ω`, the equivalence `1 ≤ p`; §5.3 has `1 ≤ K` and the exponent `↑n`. Nothing differs from the README.
- Padding probe on scratch copies, each of the five theorems with `rfl`, `infer_instance`, `simp`, `simp` with the five definitions unfolded, and `exact?`: none closes (five errors each time). The five definitions have real bodies and each is needed by a stated headline.
- Headlines: the six of the Summary. Headlines 1 (Euclidean form) and 2 are stated; the manifold form of 1 and headlines 3–6 need `W^{1,n}_loc(M, N)`, absent at the pins, and the docstring names each with the missing carrier. Nothing is stated in their place.

**Library declarations opened at the pins.** All 120 library names of the supplier contracts and of §6.1 and §7.5 were looked up by declaration in the pinned sources (`o_X` and a README-local symbol aside, none missing). Read at file and line: `TauCeti.HasWeakFDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`, a weak line derivative in every direction; sealed, with `HasWeakFDerivOn.completeSpace` at :263); `TauCeti.HasWeakLineDerivOn.absolutelyContinuousOnInterval` and `.ae_hasDerivAt` (`…/WeakDeriv/Interval.lean:302`, :318; hypotheses: weak derivative on `Ioo a b`, integrable, a representative continuous on `Icc a b`, as the §5.2 route uses them); `LinearMap.abs_singularValues_sub_singularValues_le` (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/EckartYoung.lean:106`); `LinearMap.singularValues_smul` (`TauCeti/Analysis/InnerProductSpace/SingularValues.lean:602`); `TauCeti.instIsManifoldQuotient`, `TauCeti.isLocalDiffeomorph_quotientMk`, `TauCeti.mfderiv_quotientMk_smul_apply` (`TauCeti/Geometry/Manifold/Instances/Quotient.lean:242`, :253, :264); `IsLocalDiffeomorphAt.eventually_mapOrientation_eq` (`…/Orientation/Pullback.lean:255`); `TauCeti.VectorBundleOrientation.ofEventually` (`TauCeti/Topology/VectorBundle/Orientation/Basic.lean:289`); `TauCeti.Manifold.Orientation.eq_or_eq_neg` (`…/Orientation/Basic.lean:172`, with `PreconnectedSpace`); `AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact` and `compactSpace_realization_iff_finite` (`…/Realization/Compact.lean:87`, :97); `TauCeti.exists_contMDiff_not_isSmoothTriangulation_trans` (`…/SmoothTriangulation/Basic.lean:365`); `TauCeti.not_absolutelyContinuousOnInterval_cantorFunction` (`…/CantorFunction.lean:245`); `LinearMap.normDet_eq_abs_det` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:389`); `measureSpaceOfInnerProductSpace` (`Mathlib/MeasureTheory/Measure/Haar/OfBasis.lean:310`).

**Duplication by object.** The pinned Mathlib and Tau Ceti have no quasiregular or quasiconformal map, no `ACL` class, no `n`-dimensional theorem relating weak derivatives to absolute continuity on lines (the Sobolev directory has only the interval lemmas above), and no named smallest singular value. No roadmap on main or at an open head defines quasiregular maps, `ACL^p` maps or the orientation of an orbit space (the other uses of "quasiregular" are algebraic: GeometryOfNumbersAndQuadraticArithmetic, CrystallineCohomology). Planar quasiconformal maps stay with TeichmullerGeometry §7.4, which §2.10 cites. No declaration of `Suggested.lean` shares a fully qualified name with another roadmap.

**Cross-roadmap citations resolved (9).** On main: DifferentialGeometry Layers 2 and 12 (2.1–2.2, 12.1, 12.4); RiemannianGeometry R4 item 7 (Killing–Hopf and the quotient by free, properly discontinuous isometries); GeometricTopology 11.1 and 11.3; PDE §1.1 (the absolutely continuous representative on an interval); PseudoholomorphicCurveAnalysis §4.1 (`kp > 2`); Orbifolds (orientation local systems). At open heads: TeichmullerGeometry §7.4 (Wirtinger derivatives, Beltrami equation; earlier in the merge order); FourManifolds (intersection forms; named only for Part III). SobolevMapsBetweenManifolds: every section the README cites (1.2, 3.1, 3.3, 4.2–4.6, 5.1–5.3, 6.1–6.3, 7.1) exists under that number in its accepted design on the board. The resolver's three leads are these and the two `IsQuasiregularOn.*` names, which `Suggested.lean` declares. PDE §1.1 appears in a *Needs:* line without a subsection of its own in the supplier contracts; what is assumed of it is exactly the two interval lemmas, which the Tau Ceti contract states, and the Scope paragraph says so, so nothing is left unstated.

**Overlaps.** No open pull request changes this roadmap, drops an id it cites, or is the only definer of one. The closest roadmaps in vocabulary (TeichmullerGeometry, SobolevDifferentialForms, DifferentialGeometry, CalibratedGeometry, TangentialBordism) own none of this roadmap's objects.

**Declared gaps.** The six SobolevMapsBetweenManifolds contracts (README:380–405) match the plan slug for slug, each with one supplier and its hypotheses; none asks for what the pins provide (the pins have no Sobolev class of maps between manifolds, no weak differential on manifolds and no oriented Jacobian of a map between two oriented spaces). The acceptance is conditional on those six. The seventh entry of the plan is the board matter above.

**Description.** Agrees with the head: the six gaps, §7.5 owned locally, the suppliers named with their sections, the Lean file's contents. The generated blocks were not reviewed as prose.

## Not verifiable

- Rickman1993 (Ch. I, cited for §2.4–§2.7, §4.1, §4.3, §4.4, §5.2; Ch. VI), Vaisala1971 (Ch. 3, §5.2), Ahlfors2006 (Ch. I, §1.5, §2.10), Lee2012 (Ch. 15, §7.5), Reshetnyak1989, IwaniecMartin2001, BonkHeinonen2001, Gromov1981 and Gromov1999: settled as uncertified in the manifest, cited by locator only; not requested again. For the four sampled targets among them (§2.7, §4.3, §4.4, §5.2) the statements were checked by computation and by their routes from pinned declarations.
- Ownership against board packages that are still under review was checked only through the index of three such packages, none of which touches these objects.

## Source issues

- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24 (line 1328): the source composes the Nash embedding before the manifold map; it should compose the embedding after it, giving `ι ∘ p : M → ℝᵐ`; affects the proof.
- **Misprint** in HeikkilaPankka2025 at the proof of Proposition B.1, p. 24 (lines 1333 and 1338): the determinant in the denominator drops the simplex index; it should be the minimum over `κ(σᵢ)` of `det Dϕᵢ`; affects the proof.
