# Review of AdelicAlgebraicGroups (pull request #792 at a107311)

**Verdict:** needs changes

Incremental re-review of the 37 lines changed since 872269e (README only; `Suggested.lean` is byte-identical). The change repairs the two overstated locators of the previous R10 (Sutherland §23.3, Arthur §7), refines the `GL₁` logarithmic lattice to totally positive congruence units, and fixes the torsor action convention; each of these was recomputed and read against the cached text, and none introduces a new defect. Every blocking finding of the previous review is untouched by the change and is carried below. The targeted build and direct elaboration pass; the gate fails (`prnum=8`, `residue=9`, `depcheck=7`). No change was made to the pull request.

## R01 (P1) — Quaternionic supplier and consumer still form a cycle

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:295–296`, “Reduced norm on quaternion units … [QuaternionicModularForms], §0.1” and “§0.2 … §0.3 … `DefiniteQuaternion.finite_stab`”.

Claim: QuaternionicModularForms §§0.1–0.3 supply AA's reduced norm, class sets and stabilizers.

Witness: QuaternionicModularForms at its open head (read with `roadmaps show`) consumes “`GL_1(D)(𝔸_F^f)` of AdelicAlgebraicGroups §§1.1–1.2” and says its interfaces “are what AdelicAlgebraicGroups AA.5.3 and §§2.4–2.6 consume”; it is absent from the merge order, so it is placed after AA, its supplier.

Repair: unchanged from the previous review. Make QuaternionicModularForms a consumer only: move the compact-stabilizer-modulo-centre target into AA.5.3, derive class finiteness from AA.3.4 (`Reduction.finite_classes`), take the reduced norm from the earlier algebraic owner (pinned `TauCeti.QuaternionAlgebra.normForm`, `TauCeti/Algebra/Quaternion/NormForm.lean:78`), and delete the two supplier rows. Test on Hamilton/ℚ (24 Hurwitz units, one class) and on a totally definite algebra over a real quadratic field (infinitely many central units, finite quotient).

## R02 (P1) — The height contract still cites pinned declarations that do not exist

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:259`, “use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2` … from TauCeti/NumberTheory/Height/Arakelov/Basic.lean”; consumed in §3.5.

Witness: the pinned Tau Ceti (`a91d3aaf`) has no directory `TauCeti/NumberTheory/Height` and no occurrence of `height2` or `arakelovMulHeight` anywhere; the citation leads list all three as found nowhere.

Repair: cite DiophantineApproximationAndTranscendence §2.5 (on main, README:1357–1372) as the sole supplier of the tuple-height contract and delete the three `TauCeti.` names and the file link. Normalization test: `(2, 1/2)` over ℚ has height √17, relative height 17 after a quadratic extension, absolute height √17; the empty tuple has projective height 1.

## R03 (P2) — LFunctions is an upward supplier

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:261`, “[LFunctions, Layer 5 for continuation and Layer 7 for nonvanishing]”; also :110, :506, :2317.

Witness: `UPWARD: AdelicAlgebraicGroups (#31) -> LFunctions (#301) at README lines [110, 261, 506, 2317]`; LFunctions is not on main (its folder is only in its open pull request) and sits at position 302 of the merge order against AA's 32. Its Layer 5 (README:929) and Layer 7 (README:1440) and `heckeLFunction_ne_zero_of_one_le_re` (Suggested.lean:2680) do exist at that head, so the citation is accurate but points upward.

Repair: unchanged from the previous review. State the finite-order Hecke prerequisite (nonzero germ at `s = 1` for every nontrivial primitive finite-order ray-class character, with the finite Euler correction) as an AA.2.4 target or move it to a single earlier owner that LFunctions then consumes. The pinned `TauCeti.continuedLFunctionOfWeight_ne_zero_of_isTrivialOnGood_sq` (`TauCeti/NumberTheory/ArithmeticDirichletSeries/Cancellation/Nonvanishing.lean:134`) requires `s ≠ 1` and cannot supply it: for the quadratic character modulo 4, `L(1, χ) = π/4`.

## R04 (P3) — The bibliography key `[PR94]` fails the gate

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3113, 3969, 3979, 3990, 3998, 4190, 4198, 5358`.

Witness: gate `prnum=8`, all eight on this key.

Repair: rename the displayed key to `[Platonov–Rapinchuk]` throughout; every locator stays.

## R05 (P3) — Nine HTML anchors fail the residue rule

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:587, 608, 846, 920, 1394, 4017, 4497, 4826, 5048`, `<a id="…"></a>`.

Witness: gate `residue=9`.

Repair: delete the nine tags; the target slugs in italics remain the cross-references.

## R06 (P3) — README names do not match the acceptance file

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:2719–2724`, “`RealSiegel.IsReduced e C b : Prop`”; also the names in the citation leads (`AdelicPoints.finiteProjection`, `levelUnits`, `principalLevel`, …).

Witness: `Suggested.lean:375` declares `IsReduced (C : ℝ) (b : Matrix (Fin n) (Fin n) ℝ)` with no basis argument; `infiniteDiagonal`, `levelUnits`, `principalLevel`, `level0`, `level1` and `CongrMod` are declared nowhere in the file.

Repair: write the README-only maps and predicates in prose (the basis version is the Gram matrix of `b` in `e`); keep the backticked names only where `Suggested.lean` declares them. Do not add API to the Lean file.

## R07 (P3) — Lean module form

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/Suggested.lean:12`, “headline targets”; no `/-! ## Layer k: … -/` comments; Layer 0's restricted Haar statements (:293–342) follow Layers 1, 3 and 4.

Repair: title “…: target signatures”, layer section comments in README order, declarations in README layer order; replace “deferred until” (:30) by the direct list of nonstatable headlines and their missing carriers. Re-elaborate after reordering.

## R08 (P3) — Supplier links identify forks and commits

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:258, 261, 295, 296`, links to `0stellensatz/…/c4f7f7be…`, `roed-math/…/e632e3a4…`, `WilliamCoram/…/f0be7f1`.

Repair: cite roadmap name and section only; the mathematics of the rows is unchanged except as R01 and R03 require.

## R09 (P3) — Paragraph-form Checks remain in §3.7

Location: `TauCetiRoadmap/AdelicAlgebraicGroups/README.md:3610, 3659, 3674, 3689, 3702, 3714, 3727, 3739, 3752`, “**Checks.** The identity embedding is …”, each a run-on paragraph.

Witness: the house shape is one bullet per test; these nine blocks put several tests in one paragraph. (Line 143 also now runs to 151 characters after the Sutherland edit; rewrap it.)

Repair: split each paragraph into bullets, one computed value per bullet; the tests themselves are correct and stay.

## Previous findings

- R01 — not repaired: README:295–296 still read “[QuaternionicModularForms] … §0.1 … §0.2 … §0.3”; that roadmap's head still consumes AA §§1.1–1.2 and AA.5.3. Re-raised as R01.
- R02 — not repaired: README:259 still reads “use `TauCeti.height2`, `TauCeti.arakelovMulHeight` and `TauCeti.arakelovMulHeight_eq_height2` … from TauCeti/NumberTheory/Height/Arakelov/Basic.lean”. Re-raised as R02.
- R03 — not repaired: README:261 still reads “[LFunctions, Layer 5 for continuation and Layer 7 for nonvanishing]”; depcheck still reports the UPWARD edge. Re-raised as R03.
- R04 — not repaired: eight `[PR94]` citations remain (README:3113–5358); gate `prnum=8`. Re-raised as R04.
- R05 — not repaired: nine `<a id=…></a>` tags remain (README:587–5048); gate `residue=9`. Re-raised as R05.
- R06 — repaired: the diff outside the four roadmap folders is empty and gate `outside-folder=0`; the three other folders are this pull request's own.
- R07 — not repaired: README:2719 “define `RealSiegel.IsReduced e C b : Prop`” against `Suggested.lean:375` `IsReduced C b`. Re-raised as R06.
- R08 — not repaired: `Suggested.lean:12` “headline targets”, no layer comments, Layer 0 after Layer 4. Re-raised as R07.
- R09 — not repaired: README:258, 261, 295, 296 still link fork commits. Re-raised as R08.
- R10 — partly repaired: README:141–143 now attributes the summable-error extension to this roadmap and cites Sutherland only for the box product; README:2556–2558 and :2569–2572 now cite Arthur §7, p. 32 in `mnk` order with the explicit substitution. Both locators verified below. The §3.7 paragraph Checks remain; re-raised as R09.

## Verified sound

**Scope of this pass.** The diff (31 insertions, 6 deletions, README only) touches four passages: the Sutherland sentence of the supplier contracts (:141–143), the two Iwasawa integration targets of §3.1 (:2556–2572), the coordinate/geometric torsor comparison of §4.1 (:3913–3917, :3942–3944) and the logarithmic torus of §5.1 (:4989–5005). Each was read in full with its citing and cited passages. No Lean statement changed.

**Build and signatures.** Built the eight imported `TauCeti.*` modules (4026 jobs, success), then `lake env lean` on `Suggested.lean`: exit 0, exactly 20 “declaration uses `sorry`” warnings and nothing else. A scratch copy with `#check @name` appended for all 66 declarations (42 definitions, abbreviations and structures, 4 scoped instances and 20 theorems) elaborated with 0 errors and 66 printed signatures; the binders match the previous report (number field, `Algebra.FiniteType`, compactness and `IsTopologicalGroup` hypotheses present where the README states them). Since the file is unchanged since 872269e, the one-tactic padding probe of the previous report (19 of 20 admitted theorems retain `sorry`; strong approximation reached the heartbeat limit under the search tactic but not under the plain tactics) stands; no `set_option`, admitted `example` or sorry'd data is in the file.

**Sources opened for the changed passages** (cached line-numbered texts; nothing copied):

| Passage | Text, locator, result |
|---|---|
| Sutherland §23.3, p. 6 (README:141–143) | Sutherland line 203 opens §23.3 “The ring of adeles” (p. 4); lines 285–309 (p. 6) normalize `μ_v(O_v) = 1`, Lebesgue at real places, twice Lebesgue at complex places, then define the measure on boxes `∏ B_v` with `B_v = O_v` for almost all `v` and `μ_v(B_v) < ∞` as the product of the local masses and conclude it is Haar. This is exactly what the README now attributes to it; the summable-error extension is correctly claimed as AA's own deduction from the three pinned Mathlib lemmas. |
| Arthur §7, p. 32 (README:2556–2558, 2569–2572) | Arthur line 1631 opens §7 (p. 31); lines 1694–1727 (p. 32) give `∫_G f = ∫_K ∫_{M_P} ∫_{N_P} f(mnk) dn dm dk = ∫_K ∫_{M_P^1} ∫_{A_P^0} ∫_{N_P} f(mank) …` for `f ∈ C_c^∞(G(𝔸))`, with `K` and `N_P(ℚ)\N_P(𝔸)` of volume 1, over `ℚ`. The README's `mnk` attribution, the normalization remark and “Arthur works over ℚ” are accurate. |
| Arthur §4, pp. 21–24 (unchanged citations) | Carried from the previous report: lines 1271–1299 for the `GL₂` measures and `H_P`. |
| CG §8.2, pp. 78–79 (README:4989–4996) | CG lines 3567–3588: `Y`, `Y_Q`, `X_Q`, `K_∞ = (S¹)^{r₂}` from the complex places, fibres the components of the cokernel of `𝒪_F^× → ℝ^{×r₁} × ℂ^{×r₂}/K_∞`, which is `(S¹)^{r₁+r₂−1} × ℝ`. CG does not name the totally positive units; the README's `Γ_Q⁺` is its own refinement and is the correct lattice (row below). |

**Supplier citations resolved at this head** (main at `c994070`):

- SchemeAndStackFoundations `Suggested.lean:1166` `IsTorsor`, `:1175` `Torsor.trivial_iff_section`; the action is Mathlib's `ModObj G.obj X` with `act : G.obj ⊗ X ⟶ X` (`:1145–1150`), a left action, as the new README sentence states; README §1.15 (`:2502`) and §2.3 (`:3330`) carry `Torsor.baseChange`, `torsorClasses`, `torsorClasses.mk_eq_base_iff` and `GroupSpace.ofGroupScheme` (`:2427`) as targets.
- `*base-change-adelic*` is README:1290 in §1.4 (`:1269`), matching the new `*Needs:* AA.1.4`; `*gl1-XQ-components*` is README:5006; ReductiveGroupsPartII RG2.4 is its README:5475 at this head.
- LFunctions at its open head: Layer 5 (README:929), Layer 7 (README:1440), `heckeLFunction_ne_zero_of_one_le_re` (Suggested.lean:2680): exists, but upward (R03).
- FuchsianOrbifolds on main does not mention AdelicAlgebraicGroups; only its open revision does (README:133, 965 there). A revision of an existing roadmap is never a dependency, so the CYCLE line below is a false positive against this brief's rule.
- ClassFieldTheory, GlobalQuadraticForms, IntegralLattices, LocalFieldsRamification and RepresentationTheory are on main (`TauCetiRoadmap/<Name>`, IntegralLattices also under `Completed/`); the five UPWARD lines naming them are permitted main suppliers under this brief, reported as apparent false positives with their exact lines.
- Ownership against open pull requests: QuaternionicModularForms was read through `roadmaps show` (R01); no other open pull request was re-audited in this incremental pass.

**Adversarial pass.** New rows carry computed values; rows for statements the diff leaves untouched are carried from the previous report (PRREVIEW-AdelicAlgebraicGroups~3, “Computed adversarial pass”, 122 rows), with their values repeated for the headline theorems and the finding witnesses.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| 3.1 Iwasawa integration, order and density (new) | `GL₂`, upper Borel, `m = diag(2,1)`, `n = [[1,x],[0,1]]` | `m n m⁻¹ = [[1,2x],[0,1]]`, so `d(mnm⁻¹) = 2 dn`, `δ_P(m) = 2`; substituting in Arthur's `∫ f(mnk) dn` gives `∫ f(n′mk) · (1/2) dn′`, the README's `δ_P(m)^{−1}` in `nmk` order; the wrong sign would give density 2 | Keep |
| 3.1 Iwasawa integration, degenerate parabolic (new) | `P = G` (`N = 1`, `M = G`) | `δ_P = 1`, formula reads `∫_G f = ∫_K ∫_G f(mk) dm dk` with `vol K = 1`: true by right invariance | Keep |
| 3.1 base change `ℚ → F` (new) | `F` quadratic, `G = GL₂/F`, `Res_{F/ℚ} G`, `m = diag(a,1)` | `δ_{Res P}(m) = |a|_{𝔸_ℚ}` computed on `Lie(Res N) = Res Lie N` equals `|a|_{𝔸_F}` by norm compatibility; `F`-parabolics of `G` and `ℚ`-parabolics of `Res G` correspond | Keep `*base-change-adelic*` route |
| 0.3 Sutherland box product (new) | Boxes over `ℚ`: all `B_p = ℤ_p`; one factor `2ℤ_2` | Product of masses `1`; with one factor `1/2` the product is `1/2`, finitely many non-unit factors keep it finite; a factor of mass `2` at infinitely many places would diverge and is outside Sutherland's hypothesis, which the README now reserves for AA's own summable-error extension | Keep |
| 4.1 torsor action convention (new) | Constant `S₃`, `g = (12)`, `h = (13)`, `x = 1` | Swapped rule: `(gh)·x = (12)(13) = (132)`, `g·(h·x) = x·h·g = (13)(12) = (123)`, unequal; inverse rule: `(gh)·x = (gh)⁻¹ = (13)(12)`, `g·(h·x) = (x·h⁻¹)·g⁻¹ = h⁻¹g⁻¹ = (13)(12)`, equal | Keep |
| 4.1 coaction of the inverse rule (new) | `f(g·x) = f(x·g⁻¹)` | `Σ f₍₀₎(x) f₍₁₎(g⁻¹) = Σ f₍₀₎(x) S(f₍₁₎)(g)`, so the left coaction is `f ↦ Σ S(f₍₁₎) ⊗ f₍₀₎`: right coaction, antipode on `H`, swap; on `G_m`, `t ↦ t⁻¹ ⊗ t` | Keep |
| 4.1 inversion identifies the trivial torsors (new) | `φ(x) = x⁻¹`, `G` on itself | `φ(g·x) = (x g⁻¹)⁻¹ = g x⁻¹ = g · φ(x)`: equivariant onto the owner's left trivial torsor; `φ(x) = x` would send `x g⁻¹` to `x g⁻¹ ≠ g x` on `S₃` | Keep |
| 5.1 `Λ_Q` totally positive (new) | `F = ℚ(√2)`, `Q = ∅`, `ε = 1 + √2` | `N(ε) = 1 − 2 = −1`, embeddings `2.414 > 0` and `−0.414 < 0`; `ε² = 3 + 2√2` with both embeddings positive; `Γ_∅⁺ = ⟨ε²⟩`, `log ε² = (2 log ε, −2 log ε)` since `|1 − √2| = ε⁻¹`; all units `⟨−1, ε⟩` map to `⟨(log ε, −log ε)⟩`, index 2 | Keep; the Check's values are right |
| 5.1 `Λ_Q` totally positive (new) | `F = ℚ(√3)`, `Q = ∅` | `N(2 + √3) = 4 − 3 = 1`, embeddings `3.73` and `0.27`, both positive; `Γ⁺ = ⟨2 + √3⟩`, `log Γ⁺` is the full unit lattice because `log` kills `±1` | Keep |
| 5.1 `Λ_Q` lattice is the identity component's (new) | Identity component of `X_Q` as `(F ⊗ ℝ)^{×,0} / (A_∞^0 · (F^× ∩ U_{Q,f} (F ⊗ ℝ)^{×,0}))` | `γ ∈ F^×` lies in `U_{Q,f}(F ⊗ ℝ)^{×,0}` iff `γ ∈ U_{Q,f}` and `γ` is positive at every real place: exactly `Γ_Q⁺`; using all congruence units would halve the circle for `ℚ(√2)` | Keep |
| 5.1 rank-zero torus (new) | `ℚ`; imaginary quadratic | `r₁ + r₂ − 1 = 0`; `Γ⁺` finite, `Λ = 0`, `W = 0`: a point | Keep |
| 5.1 logarithmic torus (Lean:574) | ℚ; imaginary quadratic; real quadratic | Unit ranks 0, 0, 1; components point, point, circle (carried, ~3) | Keep |
| 0.2 unique Haar product (Lean:314) | Finite `C₂ × C₃`, counting | Full box mass 6; six singleton masses sum to 6 (carried, ~3) | Keep |
| 0.3 convergent product (Lean:329) | `aₙ = 1 − 1/(n+2)²` | Partial products tend to 1/2; tail after the first factor 2/3; `(3/4)(2/3) = 1/2` (carried, ~3) | Keep |
| 1.2 restricted realization (Lean:163) | `G_a` over ℚ, exceptional prime 2 | Coordinate 1/2 at 2 and 0 elsewhere admitted; `1/p` at every prime excluded (carried, ~3) | Keep |
| 2.2 homogeneous integration (Lean:354) | `C₂ ⊂ C₄`, counting | `f = 1` gives 4; inner integral 2 times quotient mass 2 gives 4 (carried, ~3) | Keep |
| 2.4 nontrivial quadratic germ | `χ` modulo 4 | `L(1, χ) = π/4 > 0`; the pinned square-trivial lemma needs `s ≠ 1` (carried, ~3) | R03 |
| 3.2 reduced forms (Lean:371, 381) | `diag(4,1)` versus `diag(1,4)`, `C = 2` | `4 < 2` false; `1 < 8` true; integral permutation reduces (carried, ~3) | Keep; R06 |
| 3.4 class finiteness (Lean:213) | `G_a`, `GL₁` over ℚ, full level | Both class sets have one element (carried, ~3) | Keep |
| 3.4 volume and compactness (Lean:199, 222, 231, 241) | `G_m`, `SL₂`, definite `SL₁(D)` | Character ranks 1, 0, 0; `diag(t, t⁻¹)` noncentral in `SL₂`; compact, noncompact, compact (carried, ~3) | Keep |
| 3.5 heights | `GL₁` point 2 over ℚ and a quadratic extension | Relative √17 then 17; absolute √17 (carried, ~3) | R02 supplier |
| 4.1 weak approximation (Lean:271) | `SL₂`; trivial group | Elementary coordinates approximate independently; trivial source and target each one point (carried, ~3) | Keep |
| 4.2 strong approximation (Lean:281) | `SL₂`; `SL₂ × SL₁(D)`, `S = ∞` | `SL₂(ℝ)` noncompact; `SL₁(D)(ℝ)` compact factor fails the every-factor condition (carried, ~3) | Keep |
| 4.3 neat congruence (Lean:425) | `1 + 4ℤ₂`; `1 + 3ℤ₃` | Distances `≤ 1/4 < 1/2` and `≤ 1/3 < 3^{−1/2}` (carried, ~3) | Keep |
| 4.4 covering cardinality (Lean:467) | `GL₁` principal levels 3 and 9 | `φ(3) = 2`, `φ(9) = 6`; fibre index 3 (carried, ~3) | Keep |
| 4.5 quaternion stabilizer modulo centre | Totally definite `D/F`, `F` real quadratic | `ηⁿ` infinitely many central units; one class after the central quotient (carried, ~3) | R01 |
| 4.6 quaternion norms (Lean:493) | Split algebra; Hamilton | `Nrd(diag(−1,1)) = −1`; Hamilton norm a positive sum of four squares (carried, ~3) | Keep |
| 4.6 square-class compactness (Lean:503) | `C_F ≅ ℝ_{>0} × C_F¹` | `(t,k)² = (t², k²)`; positive factor collapses, compact factor stays compact (carried, ~3) | Keep |
| 4.6 Fourier limits (Lean:519, 530) | `C = ∏_ℕ {±1}`, coordinate characters | Kernel masses 1/2, normalized 1; `ψ_J` integral 1 iff `J = ∅` or `{n}`, else 0; repeated `χ₀` breaks injectivity (carried, ~3) | Keep |
| 5.2 `GL₂` components (Lean:624) | Full finite integral level over ℚ | Positive-determinant double-class count 1; component `SL₂(ℤ)\ℍ` (carried, ~3) | Keep |

**Gate and dependency output.** The worker's gate summary at this head:

```text
gate AdelicAlgebraicGroups: set_option=0 blob=0 latex=0 tex=0 prnum=8 sorry-data=0 sorry-examples=0 residue=9 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=7 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 FAIL
```

The dependency check rerun with `--movable`:

```text
not movable: AdelicAlgebraicGroups consumes LocalFieldsRamification (#328) and is consumed by OrthogonalTamagawaAndLatticeMass (#132), which comes first: moving AdelicAlgebraicGroups after LocalFieldsRamification would put a supplier after a consumer, a cycle through AdelicAlgebraicGroups
UPWARD: AdelicAlgebraicGroups (#31) -> ClassFieldTheory (#262) at README lines [109, 2317, 3974, 4942]
UPWARD: AdelicAlgebraicGroups (#31) -> GlobalQuadraticForms (#317) at README lines [3974, 4838, 4942]
UPWARD: AdelicAlgebraicGroups (#31) -> IntegralLattices (#242) at README lines [122]
UPWARD: AdelicAlgebraicGroups (#31) -> LFunctions (#301) at README lines [110, 261, 506, 2317]
UPWARD: AdelicAlgebraicGroups (#31) -> LocalFieldsRamification (#328) at README lines [119, 4413, 4428, 4444, 4479, 4942]
UPWARD: AdelicAlgebraicGroups (#31) -> RepresentationTheory (#180) at README lines [106, 260, 1372, 1427, 2033, 2317]
CYCLE among: AdelicAlgebraicGroups, FuchsianOrbifolds
depcheck: 163 roadmaps, 1188 edges, 7 problem(s)
```

The LFunctions line is R03. The five other UPWARD lines name roadmaps on main, which this brief permits; the CYCLE line arises from an open revision of FuchsianOrbifolds, not from main. These six are reported as apparent false positives against the brief's main-supplier rule, with their exact lines; the board, not this roadmap, settles them. No tooling or order file was edited. The diff outside the four roadmap folders of this pull request is empty.

## Not verifiable

- The changed passages cite only Sutherland, Arthur and CG, all read above. The previous report's unreadable texts (Platonov–Rapinchuk 1994, Platonov–Rapinchuk–Rapinchuk 2023, Borel–Harish-Chandra's image-only scan, Platonov's Mathnet articles, Schneider's Springer book) are not touched by the change and remain locator-only as recorded there.

## Source issues

- **Error** in CG at §8.2, printed p. 79: the source says the component group of `X_Q` is the maximal exponent-`pⁿ` quotient of the ray class group of conductor `Q`; it should keep the full narrow class group contribution, present already for `Q = ∅` (so for class group `C₃` and `p = 2` the components are 3, not 1); affects a stated result. (Already registered by the previous review; re-read at this head.)
