# Review of Poincare3D (pull request #1740 at 698262e)

**Verdict:** accepted

Incremental re-review of the 43 lines changed since b76a731 (the head the previous review
read). The four P3 findings of that review are repaired without introducing a new problem, the
push gate passes at this head (rerun here with the targeted build), the dependency check shows
no UPWARD or CYCLE line, and every value computed for the changed statements agrees with the
roadmap (table under *Verified sound*). No finding remains, new or carried.

## Previous findings

- R01 — repaired: `README.md` line 64 reads `[HopfRinow](../../Completed/HopfRinow/README.md),
  Layers 0–4`; on main (ffac513) `Completed/HopfRinow/README.md` exists with Layers 0–4 at its
  lines 229–495 and `TauCetiRoadmap/HopfRinow` does not.
- R02 — repaired: `README.md` lines 194–205 now consume "AlgebraicTopology Stage 6 item 3's
  compact-support local-homology lemma" (injectivity of `H₃(M,M∖K;ℤ)` into local images, vanishing
  for `i>3`), keep only the connected-noncompact step as built here, and line 229 adds the
  supplier item to the `*Needs:*` line. The supplier states exactly that lemma (witness below).
- R03 — repaired: `Suggested.lean` lines 70–76 state `poincare_3d_topological_homotopyEquiv` with
  the binders of the wanted `nonempty_homeomorph_sphere` at `n = 3`; `README.md` line 1598 names
  it in 15.2.
- R04 — repaired: `Suggested.lean` lines 33, 42 and 52 carry `/-! ## Layer 13: … -/`, `/-! ##
  Layer 14: … -/` and `/-! ## Layer 15: … -/`, whose titles equal the README headings at lines
  1385, 1442 and 1538, in README order.

## Verified sound

**Gate, diff and dependency check.** The gate rerun at 698262e with the targeted build:
`set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0
private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0
dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0
target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0
build=0 OK` (the worker's run agrees). `git diff --stat origin/main...HEAD -- .
':!TauCetiRoadmap/Poincare3D'` is empty; the folder holds `README.md`, `Suggested.lean` and
`metadata.toml` only. A scan of the README for process words, pull-request numbers, LaTeX
delimiters and "optional/deferred" finds none; `Suggested.lean` has no `lemma`, `set_option`,
`#eval` or `#print`. The dependency check with the candidate order and `--movable`:

    depcheck: 242 roadmaps, 2368 edges, 0 problem(s)

No UPWARD or CYCLE line. The candidate order lists Poincare3D (line 205) directly after
RicciFlow (line 204), its only supplier that is not on main.

**The changed supplier citation (1.1).** `TauCetiRoadmap/AlgebraicTopology/README.md` on main
(ffac513), Stage 6 item 3, lines 1244–1252: for a boundaryless `m`-manifold `U`, compact `K ⊂ U`
and every module-valued local system `L`, `H_i(U,U∖K;L) = 0` for `i > m` and the degree-`m`
group injects into its local images at points of `K`, proved by trivialization on coordinate
balls, twisted excision/Mayer–Vietoris and finite-cover induction (Hatcher Lemma 3.27); lines
1511–1513 derive `H_i(U;L) = 0` for `i > m` by the route of Proposition 3.29. Its standing
hypothesis (line 1006) is a Hausdorff, second-countable finite-dimensional Mathlib manifold
carrier; 1.1 meets it by applying the lemma on a finite union of coordinate balls around the
compact support (an open subset, charted by `TopologicalSpace.Opens.instChartedSpace` at the pin,
second countable as a finite union of second-countable open subspaces) and transporting by
excision (`K ⊂ W` open, so `M∖W` is closed inside the open `M∖K`), which is what lines 198–201
say. What AlgebraicTopology does not state (connected noncompact `M` gives `H_m(M) = 0`) is
exactly the step 1.1 keeps: Hatcher Proposition 3.29, hatcherAT lines 10370–10385 (PDF page 248
= printed p. 239, hypotheses "connected noncompact `n`-manifold", conclusion `H_i(M;R) = 0` for
`i ≥ n`, proof through the triple `(M, U∪V, V)` and Lemma 3.27 at lines 10255–10259).

**Elaboration and signatures.** A scratch copy of `Suggested.lean` with `#check @name` for the
five declarations, elaborated with `lake env lean` in 6 s: the only warnings are the four
`sorry`s (lines 36, 45, 66, 72 of the copy; `poincare_3d_topological` is proved from the other
two). Each elaborated type equals the worker's `signatures.md` entry and its README statement:
`poincare_3d_topological_homotopyEquiv : ∀ {M} [TopologicalSpace M] [T2Space M]
[ChartedSpace (EuclideanSpace ℝ (Fin 3)) M], M ≃ₕ 𝕊³ → Nonempty (M ≃ₜ 𝕊³)`, the binders of
`Wanted/Geometry/Manifold/PoincareConjecture.lean` lines 28–29 at Mathlib f6090c7 with `n = 3`
(`[T2Space M] (n : ℕ) [ChartedSpace ℝⁿ M] : M ≃ₕ 𝕊ⁿ → Nonempty (M ≃ₜ 𝕊ⁿ)`), and README lines
1589–1591 ("exactly the Hausdorff and chart hypotheses of Mathlib's homotopy-equivalence
contract"). No section binder is lost. One-tactic probes on the new theorem in a second scratch
file (`exact ⟨e.toHomeomorph⟩`, `exact ⟨e⟩`, `simp`, `infer_instance`, `exact ⟨Homeomorph.refl _⟩`
after `intro e`) all fail ("probe5 open"): not padding. The probes of the previous review on the
four untouched declarations stand (their text is unchanged).

**Headlines.** Unchanged list: the smooth Poincaré theorem (13.1), smoothing of closed
topological three-manifolds (14.1), the topological Poincaré theorem (15.1), Mathlib's two
homotopy-equivalence forms (15.2), surgery-flow existence (7.2), finite extinction (11.2),
reconstruction (12.1). The first four (five declarations) are now all stated; the last three are
named in the module docstring (lines 17–23) as not statable, with the carrier each lacks.

**Library declarations opened at the pins (Tau Ceti 358314d4, Mathlib f6090c70).**
`ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere` (printed: `∀ atlas, IsManifold (𝓡 n) ∞ M
→ M ≃ₕ 𝕊ⁿ → Nonempty (M ≃ₘ⟮𝓡 n, 𝓡 n⟯ 𝕊ⁿ)`); the three `proof_wanted` statements of
`Wanted/Geometry/Manifold/PoincareConjecture.lean` lines 28–40 (outside the `Mathlib` module,
which is why the worker's citation check lists two of their names as found nowhere: expected,
and README line 57 says `Wanted` supplies no proofs); `ContinuousMap.HomotopyEquiv.simplyConnectedSpace`
(`[SimplyConnectedSpace Y] (e : X ≃ₕ Y) : SimplyConnectedSpace X`); `Diffeomorph.toHomeomorph`;
`ChartedSpace.secondCountable_of_sigmaCompact`; `TopologicalSpace.Opens.instChartedSpace`
(`(s : Opens M) : ChartedSpace H s`, the charted structure of the finite union of balls in 1.1).

**Cross-roadmap citations resolved this round** (on main at ffac513): HopfRinow Layers 0–4
(`Completed/HopfRinow/README.md` lines 229–495); AlgebraicTopology Stage 6 item 3 (lines
1180–1514, the lemma at 1244–1252) and Stages 1–3 for excision and homotopy invariance (lines
289–471); the remaining citations are unchanged since the previous review, which resolved every
one (GeometricTopology Layers 1, 2, 7, 11 and the comparison section; DifferentialGeometry;
RiemannianGeometry; PDE; ComplexKahlerGeometry; GeometricMeasureTheory; RicciFlow at fff2322c,
whose head is unchanged).

**Ownership.** The new declaration `poincare_3d_topological_homotopyEquiv` states the `n = 3`
case of Mathlib's wanted `nonempty_homeomorph_sphere`; `roadmaps grep` for
`nonempty_homeomorph_sphere` in the previous review found only MorseTheory's two-critical-point
theorem (a different hypothesis), and no sibling checkout or main roadmap states a homeomorphism
with `𝕊³` from a homotopy equivalence; HomotopySpheres (open head) states the `n ≥ 5` recognition
theorem only. Ownership against open pull requests was checked through the sibling checkouts
and the grep index for the changed objects; nothing else changed.

**Seeded sample.** Of the fifteen sampled targets only 14.1 falls in the diff (a section
comment in `Suggested.lean` naming the Layer 14 heading, which matches README line 1442); its
locators (Moise 35.3/36.2 through the GeometricTopology extract, Cairns III unreadable) are
unchanged and were checked by the previous review. 1.1 is not in the sample but is the changed
passage: Hatcher Proposition 3.29 and Lemma 3.27 rechecked above. The other sampled locators are
untouched text and carry forward from the previous review's list.

**Adversarial table.** Rows marked † cover the passages this head changed, with values
recomputed; the other rows carry forward from the previous review (r6 at b76a731), whose text
is unchanged.

| Statement | Instances tried | Values | Result | Change |
| --- | --- | --- | --- | --- |
| † `poincare_3d_topological_homotopyEquiv` (`M ≃ₕ 𝕊³ → Nonempty (M ≃ₜ 𝕊³)`) | `M = S³`; `ℝ³`; `S¹×S²`; `∅`; `S³ ⊔ S³`; a point; the long plane `L × ℝ`; the line with two origins `× ℝ²` | identity homeomorphism; `H₃(ℝ³) = 0 ≠ ℤ = H₃(S³)`, no homotopy equivalence, premise false; `π₁(S¹×S²) = ℤ ≠ 0`, premise false; no map `S³ → ∅`; `π₀` has two elements; a point admits no `ChartedSpace ℝ³` (open subsets of `ℝ³` are empty or infinite); the long plane is connected noncompact Hausdorff and locally `ℝ³` (no countability), so `H₃ = 0` by Proposition 3.29, premise false; non-Hausdorff, excluded by `T2Space` | derivation: `HomotopyEquiv.simplyConnectedSpace` gives `SimplyConnectedSpace M` from `π₁(S³) = 0`; `H₃(M) ≅ ℤ` and 1.1 give `CompactSpace M`; then `poincare_3d_topological`; binders equal the wanted statement at `n = 3` | none |
| † 1.1 noncompact vanishing (`M` connected Hausdorff, locally `ℝ³`, noncompact ⇒ `H₃(M;ℤ) = 0`) | `ℝ³`; `S² × ℝ`; `S³ ∖ {pt}`; `S³` (compact); `S³ ⊔ ℝ³` (disconnected); the long plane | `H₃ = 0, 0, 0`; `H₃(S³) = ℤ` so compactness is needed; `H₃(S³ ⊔ ℝ³) = ℤ`, so connectedness is needed and line 194 states it; long plane `H₃ = 0`, so no countability is needed, as lines 200–201 say | the supplier lemma (AT 6.3) is applied to `W` = finite union of coordinate balls ⊃ support, second countable; excision `H₃(M,M∖K) ≅ H₃(W,W∖K)` is valid since `M∖W` is closed in the open `M∖K`; the step kept here is Hatcher 3.29's | none (R02 repaired) |
| † 15.2 compactness and simple connectedness from `M ≃ₕ 𝕊³` | `M ≃ₕ S³`; `ℝ³ ≃ₕ point` | `π₁(M) ≅ 0`, `H₃(M) ≅ ℤ`, so `M` compact by the row above; for the point, `H₃ = 0` on both sides and `ℝ³` noncompact, which is the third Check (lines 1614–1616) | both adapters now stated; sound | none (R03 repaired) |
| `poincare_3d_smooth` | as in r6 | as in r6 (`π₁ = ℤ, ℤ/2, I*` excluded; `∅`, `S³ ⊔ S³`, `ℝ³`, non-Hausdorff excluded) | carried from r6 | none |
| `smoothable_closed_three_manifold` | as in r6 | componentwise atlas; vacuous on `∅` | carried from r6 | none |
| `poincare_3d_topological` | the proof term | `Diffeomorph.toHomeomorph` on the 14.1 atlas | carried from r6; still proved, no `sorry` of its own | none |
| `poincare_3d_smooth_homotopyEquiv` | as in r6 | Cor 0.2(a) on any atlas of `S³`; `H₃(ℝ³) = 0`; `π₁(S¹×S²) = ℤ`; the long line | carried from r6 | none |
| 14.1 absolute smoothing, 14.2 PL compatibility | as in r6 | compact + charts ⇒ σ-compact ⇒ second countable ⇒ metrizable; Moise 35.3, Cairns III; Munkres 10.6, Moise 36.2 | carried from r6 (only a Lean section comment changed) | none |
| closed simply connected 3-manifold (1.1 first paragraph) | `H₁, H₂, H₃, π₂, π₃`; Poincaré sphere; `S²×S¹` | `H₁ = 0`, `H₂ ≅ H¹ = 0`, `H₃ ≅ ℤ`, `π₂ = 0`, `π₃ ≅ ℤ`; `I*` perfect; `π₁(S²×S¹) = ℤ` | carried from r6 (text unchanged) | none |
| 1.2, 1.3, 2.2, 2.3, 3.1, 3.3, 4.1, 4.2, 5.1, 6.1, 6.2, 7.1, 7.2, 8.1, 9.1–9.6, 10.1, 10.2, 11.1, 11.2, 12.1, 13.1, 15.1 | as in r6 | as in r6 (`R = 6` on unit `S³`; `−6/(1+4t)` exact; `(4π)^{n/2}` conversion; `dW₂/dt ≤ −4π − ½R_min W₂`; profile `G` identity; `c h³/δ`; `S³ # S³ = S³`) | carried from r6 (text unchanged) | none |

## Not verifiable

- S. Cairns, Ann. Math. 41 (1940), Theorem III, p. 797 (lines 1457–1461): JSTOR, paywalled; no
  legal copy found by the sources service in earlier rounds; cited by locator only.
- C. B. Morrey, Ann. Math. 49 (1948); J. Jost, J. reine angew. Math. 359 (1985); A. J. S.
  Hamilton, Q. J. Math. 27 (1976), Theorem 2(1): paywalled; cited by locator only.
- S. Hildebrandt, Arch. Rational Mech. Anal. 35 (1969): the manifest records it `uncertified`.
- E. Moise, GTM 47, Chapters 35–36; J. Munkres, Ann. Math. Studies 54, Theorems 10.5–10.6; M.
  Hirsch, GTM 33, Theorem 6.6: checked only through the GeometricTopology extracts on main.
- Chow–Knopf, Surv. 110; Chow et al., Surv. 144 and 163: AMS e-books, paywalled; chapter
  attributions not checked.
- Perelman's three arXiv papers, Kleiner–Lott, Topping: cited without locators; nothing to check.

None of these is touched by the diff.

## Source issues

- none new this round (the previous review's four entries on mt07, Corollary 9.50(1), Corollary
  18.28, Lemma 17.12 and Lemma 19.7, stand; the texts the diff touches, Hatcher §3.3 and
  AlgebraicTopology Stage 6, contain no mistake at the locators checked).
