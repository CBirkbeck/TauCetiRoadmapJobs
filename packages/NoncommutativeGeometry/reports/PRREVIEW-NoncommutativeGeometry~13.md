# Review of NoncommutativeGeometry (pull request #1143 at c3b1ee2)

**Verdict:** needs changes

Full review of the folder at c3b1ee21. Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9, the same as r12. The gate passes and the dependency check gives 0 problems. `Suggested.lean` elaborates with only the `sorry` warning, and every computed value in the adversarial table matches the README.

r12's R02, R05, R07, R08 and R09 are repaired. Three ownership defects remain, and one of them has changed shape since r12:
- #864 has merged to main, and main's NoncommutativeIntegration now names N3–N4 as consumers of the B(H) classes that N3–N4 build (R02). The dependency check accepts that citation now.
- `A_θ` keeps a second claimant in OperatorKTheory and gains a third in OperatorAlgebraDynamics' open revision (R01).
- The real locally convex projective tensor has two owners, because SmoothBanachRepresentations' head was not changed to match N1.Tensor's new ℝ case (R03).

## R01 (P2) — `A_θ` has three claimants: N6, OperatorKTheory 7.4 and OperatorAlgebraDynamics' twisted group C*-algebras

Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md`:
- 50–55: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` … its universal presentation … faithful tracial state … which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The N6 targets at 1170–1183 and Downstream 1460–1464.

Claim: N6 is the single owner of `A_θ`, its universal presentation, its faithful trace and its 𝕋² gauge action.

Witness:
- OperatorKTheory at 1377338a, lines 1782–1798, still builds `A_θ`, τ and the presentation.
- OperatorAlgebraDynamics at b15a0d4c, lines 70–77 and 3444–3453, claims sole ownership of the scalar `C*(G,ω)` with its universal property, trace and gauge action.
- HeisenbergImprimitivity at a9eeb6ec, line 492, calls the `L=ℤ²` instance `A_θ`.

Why these are the same object:
- At `c((m,n),(m′,n′))=exp(2πiθnm′)` one has `c((0,1),(1,0))=exp(2πiθ)` and `c((1,0),(0,1))=1`. So `W_(0,1)W_(1,0)=exp(2πiθ)W_(1,0)W_(0,1)`, which is N6's relation `U₂U₁=exp(2πiθ)U₁U₂`, and the twisted algebra's universal property is N6's presentation.
- OperatorKTheory's own line 48–51 already defers `C*(L,c)` to OperatorAlgebraDynamics and identifies the rotation algebras among them in its 7.5.

Only one direction is acyclic:
- OperatorAlgebraDynamics supplies N6: its D1–D2 are in N6's *Needs:* (1304), and its Downstream 3494 lists this roadmap. So it cannot cite N6 back.
- Citing OperatorKTheory from here is UPWARD: a scratch copy with `OperatorKTheory §7.4` in N6's *Needs:* gives `UPWARD: NoncommutativeGeometry (on main) -> OperatorKTheory (#9) at README lines [1304]`.

Repair:
- **N6, 1170–1183:** consume OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists at `L=ℤ²`, trivial action, with the cocycle above, for:
  - the universal presentation;
  - the faithful canonical trace;
  - the 𝕋² gauge action.
- **What N6 keeps:** the identification of that instance with D1's crossed product `C(𝕋)⋊_αℤ` (`U₁=v`, `U₂=u`), which carries the coordinate copy of C(𝕋) and `τ=∫_𝕋∘E`.
- **Scope 50–55 and Downstream 1460–1464:** say this.
- **Description:**
  - Name #1137 as merging first; D1.CentralTwists and D2.CentralTwists exist only at its head.
  - State that #866 replaces 1782–1784 and the 1796–1798 bullet by a citation, and corrects 2324–2326.
- **Test:** `roadmaps grep -i 'universal unitary presentation'` then returns no target outside OperatorAlgebraDynamics. Today it returns OperatorKTheory 1796.

## R02 (P2) — N3–N4 rebuild what NoncommutativeIntegration on main owns and hands to them

Location: README:
- 74–84: "Hölder's inequality with constant one, the quasi-ideals S_p for 0<p<1, the cyclicity of Tr on dual Schatten classes and the weak Schatten ideals are stated in N3–N4 for B(H)".
- N3 769–795, N4 963–970, the supplier row 308, How to read 322–327 and Downstream 1465–1470.

Claim: NoncommutativeIntegration's statements on B(H) are its comparison with N3–N4 and are not an input here.

Witness: main b3d628f (#864 merged as 58901ec4), `TauCetiRoadmap/NoncommutativeIntegration/README.md`:
- 1474–1478: "NoncommutativeGeometry N3–N4 consume Layer 1 (I1) on B(H) … and do not rebuild it".
- §1.5, 375–380: these laws "are not proved again on a sequence model".

What main's NoncommutativeIntegration plans, read at main:
- §1.3 (286–296): S_p for 0<p<1, with the p-triangle inequality and completeness of the p-metric.
- §1.4 (321–325): Hölder with constant one for all positive exponents, and the product log-submajorization (Fack–Kosaki 4.2(i)–(iii)).
- §1.5 (360–380): the identification `Lp(B(H),Tr)=S_p`, with the ideal and adjoint bounds.
- §1.6 (406–413): the weak Schatten classes and `S_(1,∞)`, with their quasi-norm, adjoint and ideal estimates.
- §2.1 (462): `τ(xy)=τ(yx)` for conjugate exponents. On B(H) this is exactly N3's new target "cyclicity on dual Schatten classes" (790–795).

Why the head disagrees with main:
- r12's obstacle is gone: a scratch copy with "NoncommutativeIntegration §1.4, §1.5, §1.6, §2.1" in N3's *Needs:* gives `depcheck: 237 roadmaps, 2342 edges, 0 problem(s)`.
- The branch's merge base eaf17b10 predates 58901ec4, so the head has never seen the merged text.

Repair (rebase on main first):
- **Supplier table:** add a row "NoncommutativeIntegration §1.3–§1.6, §2.1 at M=B(H)", listing what it supplies:
  - S_p for 0<p<1 as `Lp(B(H),Tr)`, with the p-triangle inequality, the ideal and adjoint bounds and completeness;
  - Hölder with constant one and the log-submajorization;
  - the weak Schatten classes and `S_(1,∞)`, with their quasi-norm, adjoint and ideal bounds;
  - cyclicity for conjugate exponents.
  In the OperatorIdeals row (308), drop "N3 adds … ; N4 the weak ideals and".
- **N3, 769–795:** consume these. Keep:
  - the B(H)-only inclusions `S_p⊆S_q` with `‖T‖_q≤‖T‖_p` (NoncommutativeIntegration §1.5 asserts no inclusion for an infinite trace);
  - the V4.Core trace sentence.
  Delete the dual-Schatten cyclicity target.
- **N4, 963–970:** consume §1.6 for `L^(p,∞)` and `S_(1,∞)` and their gauges. Keep:
  - the logarithmic ideal;
  - the partial-sum norm with constants `p/(p−1)` and 1 (Connes IV, Appendix C);
  - the example in `L^(1,∞)∖S_(1,∞)`.
- ***Needs:* lines:** add the NoncommutativeIntegration sections at 951 and 1056, and drop Fack–Kosaki from 951.
- **Prose:** rewrite Scope 74–84 and How to read 322–327 accordingly. Delete the Downstream bullet 1465–1470, since that roadmap is now a supplier. The Checks at 798–832 stay as Examples of the consumed classes.

## R03 (P2) — The real completed locally convex projective tensor has two owners

Location: README:
- 16–23: "over 𝕜=ℝ or ℂ (`RCLike 𝕜`), with the same targets for both fields".
- N1.Tensor 342–343.
- Downstream 1442–1446: "§7.3 consumes N1.Tensor's … at both fields …, its §7.2a owns only the two scalar-comparison maps".

Claim: N1.Tensor alone states the real case.

Witness: SmoothBanachRepresentations at 41f719f2 (#1145):
- Line 10: "§7.2a owns the same construction for real spaces … and assumes nothing of N1 beyond its complex construction".
- Line 459: "Build the same object here for real Hausdorff locally convex spaces".
- Line 480: §7.3 consumes "§7.2a when 𝕜=ℝ".

This is the second half of r12's R06: this README now states the real case, but #1145 was not changed. The description's sentence "#1145 consumes N1.Tensor in SB7" therefore describes no existing head, and neither does Downstream 1442–1446.

Repair (the README needs no edit): in the description, state that #1145 rebases after this pull request and at its head:
- changes line 10 to cite N1.Tensor for both fields;
- cuts §7.2a (459–467) to the two scalar-comparison maps;
- has 480–482 and 506 consume N1.Tensor at `𝕜=ℝ`.

Test: `roadmaps grep 'Build the same object here for real'` then returns nothing. Today it returns #1145 line 459.

## R04 (P3) — The description describes an earlier head and states no order

Location: the pull-request description. This is carried from r12 R04, r11 R02, r10 R05 and r9 R03.

Claim: the description says only the README changes and `Suggested.lean` is unchanged, that the swapped reduction is `x×_K5 y`, and that N2 retains AlgebraicKTheory as its A0–A3 supplier.

Witness:
- `git diff --stat origin/main...HEAD` shows `Suggested.lean | 145 +-`.
- README 895–896 writes `x⊠_s y`.
- N2's *Needs:* (728) and the supplier table (304–311) cite no AlgebraicKTheory.
- `scratch/overlaps.md`: #1187 conflicts in this folder's `Suggested.lean`.

Repair:
- Rewrite the description to match this head.
- Add the ordering paragraphs of R01 (#1137 first; the changes #866 makes) and R03 (#1145 after).
- State that #1187's copy of this `Suggested.lean` is superseded and that #1187 rebases after this pull request.
- Drop "which merge first: #864": it has merged.

## R05 (P3) — N1.Tensor cites no source, and four headline targets carry their locators only in References

Location: README:
- 341–369: N1.Tensor's targets (the cross property, associativity, the scalar unit, Fréchet completeness and metrizability, the Banach comparison) cite no source.
- Four headline targets carry no parenthetical locator: N4 1036–1040 (the Tauberian bridge), N5 1137–1142 (the Hochschild-class theorem), N6 1273–1290 (the periodic and Hochschild computations) and N7 1333–1349 (the Heisenberg module and connection).

Witness:
- References (1472–1517) name no locally convex tensor text.
- The four locators exist only in References: Connes IV §2 Prop. 4, p. 313; Theorem 8, p. 315; III §2 Prop. 5 and Theorem 7, pp. 217–218; IV §6, pp. 356–357.

Repair:
- At each of the four claims, add the locator in parentheses, e.g. "(Connes IV.2, Proposition 4, p. 313)" at 1039.
- For N1.Tensor, cite a locally convex tensor text at its theorem numbers, read at the text. Two candidates:
  - Grothendieck, Ann. Inst. Fourier 4 (1952), 73–112, open at Numdam (doi:10.5802/aif.46);
  - Trèves 1967, Part III.
  Add it to References and `sources.toml`.

## Previous findings

| r12 finding | Status | Evidence at this head |
|---|---|---|
| R01 (`A_θ` two owners) | Not repaired | Scope 50–55 and Downstream 1460–1464 are unchanged in substance, and the description is silent. OperatorKTheory is still at 1377338a. OperatorAlgebraDynamics #1137 is a new claimant. Carried as R01. |
| R02 (N3 restates V4.Core's trace) | Repaired | Scope 71–74: "The canonical trace Tr … is VonNeumannAlgebras V4.Core's and is consumed in N3–N4". Supplier row 309. N3 784–789 consumes it. N4 993–1001 now restricts normality to `L^(1,∞)` through V4.Core's trace-class duality. *Needs:* 951 and 1056 cite V4.Core. |
| R03 (B(H) quasi-ideals) | Not repaired | Scope 74–84 still claims the classes. #864 merged with its "consume … do not rebuild" text, and the dependency check now accepts the citation. Carried as R02. |
| R04 (description) | Not repaired | The description text is unchanged. Carried as R04. |
| R05 (comparisons assigned to OperatorKTheory; CompactQuantumMetricSpaces understated) | Repaired | Scope 47 ends "belong to OperatorKTheory."; the comparison sentence is gone from Downstream. 1452–1456 lists N5, N6 and N7, matching CompactQuantumMetricSpaces at 7db4c193, 288–292 and 1523–1539. |
| R06 (N1.Tensor restricted to ℂ) | Partly repaired | 16–23 and 342–343: "Fix 𝕜=ℝ or ℂ (`RCLike 𝕜`); every statement of this section is made for both fields". #1145 is unchanged. Carried as R03. |
| R07 ("only `traceFreePart`") | Repaired | README 269–273 and `Suggested.lean` 25–28: "the trace only in finite dimension (`LinearMap.trace`, `TauCeti.traceCLM`)". `traceCLM` is at `Topology/Algebra/Module/Trace.lean` 41 under `[FiniteDimensional 𝕜 V]`. |
| R08 (Connes section labels) | Repaired | References 1480–1489: "Chapter IV, introduction: … Proposition 2 (cited in §1 as Proposition 0.2), p. 295"; Proposition 3, pp. 312–313; Proposition 4, p. 313. N3 884–885 likewise. Checked at `connes94` lines 11082, 11371–11379, 11765 and 11789. |
| R09 (Morita generality) | Repaired | README 513–534 and `Suggested.lean` 57–61 say Corollary 24 is the case R=M=ℂ (Part II, p. 94), and give the route for general R and M: corner restriction, the Hochschild homotopy, the five lemma along SBI, and `quasiIsoAt_cyclicCochainComplexToTotal`. |

The route's pinned names all exist (see Verified sound).

## Verified sound

**Gate and dependency check, run this round at c3b1ee2.**
- `gate … --base origin/main`: every scanner reports 0, `OK`, as in `scratch/gate.md`.
- `gate --depcheck … --movable`: `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- Scratch copies with one extra *Needs:* item:
  - NoncommutativeIntegration in N3: `2342 edges, 0 problem(s)` (R02);
  - `OperatorKTheory §7.4` in N6: `UPWARD: NoncommutativeGeometry (on main) -> OperatorKTheory (#9) at README lines [1304]` (R01).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- Policy scan for process words, PR numbers, LaTeX, `lemma` and "optional"/"deferred": the only hits are the mathematical names "Whitehead's lemma", "five lemma" and "Lemma 14".
- No gaps are declared, and none are needed.

**Lean at the pins.**
- `lake env lean` on `Suggested.lean`: exit 0, with the single warning `declaration uses sorry` at line 62.
- Scratch `#check @`: `cyclicCohomology.matrixExtension` takes `[CommRing R] [Module R M] [Ring A] [Algebra R A] [DecidableEq ι]`. The theorem adds `[Algebra ℚ R]` and `[Nonempty ι]`, which matches `signatures.md` and README 509–513. No binder is lost and nothing changed.
- One-tactic probe (`first | simp | rfl | infer_instance | exact?`): `exact?` fails on bijectivity and on injectivity alone, so the headline is not padding.
- Form: a `module` header, `import Mathlib` plus `TauCeti.RingTheory.CyclicCohomology.Matrix`, `theorem`, and no `set_option`, data or `lemma`.
- The docstring's non-statable headlines (N3, N5, N6 periodic and Hochschild, N7) each name a carrier that is absent at the pin.
- `roadmaps grep bijective_matrixExtension` finds only this pull request, so there is no name collision.

**Library declarations opened at the pins (35).**
- Tau Ceti `RingTheory/CyclicCohomology/Matrix.lean`: `matrixCochainExtension_single` 275, `…_injective` 292, `…_hochschildCoface` 413, `…_hochschildCoboundary` 434, `matrixExtension` 497, `…_cyclicOperator` 522, `…_cyclicNorm` 543, `…_barContraction` 551, `…_connesB` 588.
- Tau Ceti `RingTheory/CyclicCohomology/Bicomplex.lean`: `quasiIsoAt_cyclicCochainComplexToTotal` 781 (needs `IsUnit (q+1)`, true over ℚ).
- Tau Ceti `Topology/Algebra/Module/Trace.lean`: `traceCLM` 41.
- Tau Ceti `Analysis/Normed/Module/PiTensorProduct/`:
  - `Projective/Completion.lean`: `CompletedProjectiveTensorProduct` 54 under `[NormedField 𝕜]` (31), `lift` 100, `map` 139, `map_id` 156, `map_comp` 167.
  - `Reindex/Completion.lean`: `reindex` 41, `reindex_refl` 90, `reindex_trans` 97, `map_comp_reindex` 111.
  - `Projective/Topology.lean`: `instFirstCountableTopology` 180, under `[NontriviallyNormedField 𝕜]` and `Countable (σ i)`.
  - `UniversalProperty.lean`: `liftEquiv` 66 and 122, under `[NontriviallyNormedField 𝕜]`.
  - `Projective/Seminorm.lean`: `projectiveSeminormOf_tprod_le` 57, so the pin has only ≤, as README 358 says.
- Tau Ceti, other: `cycleCocycle_trace` (`UniversalDifferential/Cycle.lean` 305), `traceDerivationPairCocycle` (`Derivation.lean` 209), `SmoothNoncommutativeTorus` (`SmoothTorus/Basic.lean` 230), `AlgebraicK1` (`Stable.lean` 314), `ExactK0` (`GrothendieckGroup/Exact.lean` 179), `evenPairingK0` (`EvenPairing/AlgebraicK0.lean` 141), `oddPairing` (`OddPairing/Basic.lean` 106), `AlgebraicK1.oddPairing` (`OddPairing/AlgebraicK1.lean` 77), `LinearPMap.HasCompactResolvent` (`Resolvent/Compact.lean` 68).
- Mathlib:
  - `exists_dual_vector''` (`Analysis/Normed/Module/HahnBanach.lean` 85, `[RCLike 𝕜]` on a seminormed space), which supports the cross-property route;
  - `projectiveSeminorm_tprod_le` (`…/PiTensorProduct/ProjectiveSeminorm.lean` 134, ≤ only).

**Cross-roadmap citations resolved now.**
- On main b3d628f:
  - VonNeumannAlgebras V4.Core (972–1057): the trace, `Tr|x|=‖x‖₁`, basis independence, cyclicity, B(H) as the dual of S₁ and M_* as the quotient. Its open head c0dc59f6 keeps V4.Core (1010).
  - NoncommutativeIntegration §1.3–§1.6 and §2.1 and its Downstream 1474–1478 (R02).
  - OperatorIdeals: OI-A17 (150), A20 (156), A22 (159), A30 (196), B29–B30 (349–350).
  - BanachSpaceTheory B4 (239).
  - SelfAdjointSpectralTheory SA-E01–E13 (1202–1230). These are spectral projections only; there is no unbounded Borel calculus, so N5's eigenbasis calculus duplicates nothing.
  - OperatorAlgebraDynamics D1–D2 and D4.
- At open heads:
  - OperatorKTheory 1377338a (44–56, 1773–1830, 2324–2326).
  - OperatorAlgebraDynamics b15a0d4c (44–80, 859–1030, 1367–1440, 3436–3494).
  - HeisenbergImprimitivity a9eeb6ec (15, 52, 183, 492, 786, 794).
  - CompactQuantumMetricSpaces 7db4c193 (176–179, 288–292, 330–335, 1523–1539, 1578): matches Downstream 1452–1456.
  - SpectralManifolds b1e8fb72 (7, 21): N1–N2 and N4–N5.
  - SmoothBanachRepresentations 41f719f2 (10, 12, 71–73, 459–467, 480–482, 506): line 12 matches Scope 86–91 on N6; for R03 see above.
  - LocallyConvexDuality 7bdf7f3 (36–41, 113–117): consumes N1 over ℝ and ℂ, as Downstream 1447–1448 says.
  - PadicLocalLanglandsForGL2Qp 84416ad §0.1 (206–218) and LocallyAnalyticDistributions 473fb50 §0.0 (892–960): the nonarchimedean completed tensors, as Scope 23–26 says.
  - AutomorphicSpectralTheory (330, 344, 366), AutomorphicSpectralTheoryPartII (14), GanGrossPrasadUnitaryGroups (98–100) and RefinedTraceMethods (60) consume N1, as Downstream 1449–1451 says.
- `roadmaps resolve`: nothing missing. `overlaps.md`: no dropped ids, and no ids that only a revision defines; #1187 is covered in R04.

**Sources.** The scratch directory does not list the worker's seeded sample of 15, so I read every distinct locator in the README and `Suggested.lean` (28 targets) at the cache:
- `connes85`:
  - Part II, p. 94 (line 1884): cochains are complex-valued (n+1)-linear functionals on an algebra over ℂ.
  - Corollary 24, p. 113 (2592–2594; cache page 74 is printed 113).
  - Part I, Appendix 2, Proposition 5, p. 91 (1802–1808; cache page 52).
- `connes94`, Chapter III:
  - III.1: Propositions 3–4 (6905, 6933; p. 190), Theorem 12 (7223; p. 197), Lemma 14 (7274; p. 198), Theorem 26 (7650; p. 208).
  - III.2: Proposition 5 (7980; p. 217), Theorem 7 (7998; p. 218).
  - III.3: Proposition 2 (8469; p. 229); Proposition 3 (8493–8496; p. 230), with the constant `(2i)^(−1/2)2^(−n)Γ(n/2+1)⁻¹`, and its proof with the smooth-path transgression (8501–8533; pp. 230–231).
- `connes94`, Chapter IV:
  - Introduction: Proposition 2 (11082–11100; p. 295), Definition 3 (11135–11148; p. 296).
  - IV §1: Proposition 1 and `Tr′` (11242–11252; p. 299); cyclicity for `1/p₁+1/p₂=1` (11262; p. 300); Proposition 2 (11282; p. 300); Definition 3 (11343–11347; p. 302); Proposition 4, citing "Proposition 0.2" (11371–11379; p. 303).
  - IV §2: Definition 2 (11754; p. 312); Proposition 3 (11765–11771; pp. 312–313); Proposition 4 (11789–11793; p. 313); Theorem 8 (11865–11873; p. 315, with hypotheses `D⁻¹∈L^(n,∞)`, `Sign D=F` and δ-regularity, as in N5 1134–1136).
  - IV §6: the module and connection (13549–13560; pp. 356–357); the index formula, Theorem 3 (13613–13727; pp. 358–361, Theorem 3 on p. 360), cited for comparison only.
  - Appendix C (17381–17404; p. 453).
- `fack-kosaki`: Theorem 4.2(i)–(iii) (605–609; cache page 19 is printed 286); Theorem 4.9(iii) (863–871; printed 294–295).

Every page and hypothesis matches the README's use.

**Adversarial pass.** I recomputed the values this round with a pure-Python script (`scratch/py/adv13.py`) and exact rational linear algebra for the headline row.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 62; README 509–534) | ι=∅; ι=Fin 1; A=M=R=ℚ, ι=Fin 2, n=0,1,2 | ι=∅: `M_∅(A)=0`, so `HC⁰=0≠ℚ` and `[Nonempty ι]` is needed and present. Fin 1: φ#Tr=φ. M₂(ℚ): cyclic cochain dims 4, 6, 24; `HC⁰⁻²(M₂(ℚ);ℚ)` dims 1, 0, 1 = `HC(ℚ;ℚ)`. `σ₁#Tr` is a cocycle; rank of `b(C¹_λ)` is 3, and 4 with `σ₁#Tr` adjoined, so its class is nonzero. Probe fails. | true, not padding | none |
| Morita route (513–534) | corner `a↦aE_rr` | `matrixCochainExtension_single`: (φ#Tr) on `single r r (x j)` equals `φ x`, a left inverse. Five-lemma window `HH^n→HC^(n−1)→HC^(n+1)→HH^(n+1)→HC^n`, starting from `HC⁰=HH⁰` and `HC^(−1)=0`. | sound | none |
| Ground-ring contract (232–234) | constants c on (1,…,1) | b even→odd has coefficient `Σ_(j≤2k)(−1)^j+(−1)^(2k+1)=0`; b odd→even has coefficient 1, so its image is `M[2]`. Hence `HC^(2k)=M⧸M[2]` (k≥1), `HC^odd=0` and `HC⁰=M`. | true | none |
| N1.Tensor Checks (373–400) | ℓ¹, ℓ², ℂ over ℂ and ℝ | `e₀⊗e₀=(e₀+e₁)⊗e₀−e₁⊗e₀` costs 2·1+1·1=3 against 1. Rank-n element: projective n, Hilbert √n. Over ℂ, 1⊗i=i⊗1 while x·ȳ gives −i and i. Over ℝ, `ℂ⊗ℂ` has dimension 4. | true | none |
| N1.Tensor cross property (358–361) | norming f, g | `p(x)q(y)=|f(x)g(y)|≤Σ|f(x_i)||g(y_i)|≤Σp(x_i)q(y_i)`. The pin has only ≤ (`Seminorm.lean` 57). | true | R05 (no source) |
| N1.Tensor over ℝ (342–343) | SmoothBanachRepresentations 459 | both plan the real construction | two owners | R03 |
| N1.Cyclic Checks (546–575) | M₂(ℂ), circle, ℂ | `(b Tr)(e₁₂,e₂₁)=0`; with `φ=a₁₁`, `(bφ)=1`. `ψ(z⁻¹,z)=1`, `ψ(z,z⁻¹)=−1`. `abcd−abcd+abcd−dabc=0`. `S^mτ(1,…,1)=m!`. | true | none |
| N2 circle and Bott (637–648) | k=3; z=0.6−0.8i | pairing `0.84628−0.84628i` on both sides. `Tr(p dp∧dp)` coefficient `0.5i=2i(1+|z|²)⁻²`. `∫r(1+r²)⁻²=1/2`, giving pairing `(2πi)⁻¹·2i·2π·½=1`. | true | none |
| N3 Hardy calibration (857–862) | F=2P−1, forward shift, window k∈[−6,6) | `[F,u]` is nonzero only at e₋₁, so `τ₁=2`. README λ₁ gives −1.000 = `ind(PuP)`; Connes' sign gives +1.000. | README true | source issue |
| N3 Clifford reductions (893–920) | Pauli matrices; A=(0.3+0.2i, −1.1+0.5i), B=(0.7−0.4i, 0.25+0.9i) | W²=1, Wσ₁W=−σ₂, Wσ₃W=−σ₃. `Tr₂(σ₃[D,a][D,b])=0.94+0.93i=2i(A₁B₂−A₂B₁)`. `((1+i)√π)²/(2πi)=1.000`. `(−1)(2i)/(4π)=−0.159155i=1/(2πi)`. | true | none |
| N3 point cycle (926–930) | `e=[[1,a],[0,0]]` | `π(e)H⁺=eℂ²` has dimension 1 and `π(e)H⁻=0`, so the index is 1; `Tr′(γπ(e))=Tr e=1` | true | none |
| N3 S_p, Hölder, majorization (769–783) | Checks 801–813 | `‖S+T‖_(1/2)=9>5` with p-th powers 3≤3. `μ(ST)=(2.921,0.685)` against `μ(S)μ(T)` at index 1, `0.618`. `‖ST‖₁=4≤5`, `‖I₂‖₁=2`. | true | R02 (owner) |
| N3 dual-Schatten cyclicity (790–795, Check 824–832) | weighted shifts | S∈S₃∖S₂ (6/5>1, 4/5<1); T∈S_(3/2)∖S₁ (21/20>1, 7/10<1), T∈S₂. ST=diag(0, 1, 0.4665, 0.2987, …) and TS=diag(1, 0.4665, 0.2987, …), both of trace ζ(1.1)=10.584. The weakened variant's partial sums are 15.47 at 10³ and 45.56 at 10⁵, diverging. | true | R02 (owner) |
| N4 weak ideals (963–970) | block operator, N<65536 | non-increasing: true; `(j+1)μ_j` at j=2N_k−1 is 2, 4, 6; max `σ_N/log(1+N)` is 2.4853 | true | R02 (owner) |
| N4 ω-dependence (1022–1034) | 60 blocks | `r_k` tends to 0.666667 and 0.833333. Tr_ω along N_even is 0.743683 = `2/3+log2/9`; along N_odd 0.756317 = `5/6−log2/9`. | true | none |
| N4 non-normality (993–1001) | rank-one ξ⊗η*; dim H<∞ | `⟨η,ρξ⟩=0` for all ξ, η gives ρ=0, while `Tr_ω(diag(1/(j+1)))=1`. When dim H<∞, `σ_N` is bounded and `Tr_ω=0` is the ρ=0 functional. | true | none |
| N4 Tauberian bridge (1036–1040) | Connes IV.2 Prop. 4 | (1)⇔(2) for 0≤T∈L^(1,∞) (11789–11791). `log N` against `log(1+N)` gives the same limit. | true | R05 (inline locator) |
| N5 Checks (1095–1118) | D=diag(0,1,−1); D=diag(j) | `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)`, K=diag(1,½,½), `F_D=diag(0,0.7071,−0.7071)`. `Σj/(j+1)³<∞` while `Σ(1+j²)/(j+1)³=∞`. | true | none |
| N5 Hochschild class (1134–1142) | Theorem 8 hypotheses | `D⁻¹∈L^(n,∞)`, `F=sign D` and δ-regularity are the same on both sides | true | R05 (inline locator) |
| N6 `A_θ` (1170–1183) | twisted algebra at ℤ² | `c((0,1),(1,0))=e^(2πiθ)` and `c((1,0),(0,1))=1` give the same relation as `uvu*=e^(2πiθ)v`, so the universal properties coincide | true | R01 (owner) |
| N6 Checks (1242–1271) | θ=½; a=U₁, b=U₂U₁⁻¹; e at a=1 | `a_(0,1)(ab)=e^(−2πiθ)` against 1. `ev₁∘E` gives `e^(2πiθ)` against 1. `((e+e*)/2)²=[[1.25,0.5],[0.5,0.25]]`, `ee*=diag(2,0)`. `z=diag(1+aa*,1+a*a)`, `p=diag(1,0)`. `Q₀=1`, `P₀=2`. | true | none |
| N6 cohomology (1273–1290) | Connes III.2 | dims 1, 2, 1, 0 under the Diophantine condition, and HP is ℂ² in both parities (7980–8008) | true | R05 (inline locator) |
| N7 Fourier triple (1316–1324, 1403–1411) | r²=0,1,2,5,25; mode (2,−3) | lattice counts 1, 4, 4, 8, 12, so spin multiplicities 2, 8, 8, 16, 24. `D²=513.219=4π²·13`. D⁺ entry `12.566+18.850i=2π(m−in)`. `N≈2πR²` and `σ≈(1/π)log R` give 1/(2π). | true | none |
| N7 odd modules (1369–1380, 1412–1420) | compression on k<0 | `V₊S` and `e^(2πiθ)SV₊` agree on e_k. Kernel e₋₁ (dimension 1), cokernel 0: index +1. | true | none |
| N7 Heisenberg (1343–1349, 1421–1426) | Gaussian | `(−d/ds−2πs/θ)e^(−πs²/θ)=0`. `[∇₁,∇₂]ξ=(2πi/θ)ξ`. The adjoint kernel `e^(πs²/θ)∉L²`. | true | R05 (inline locator) |
| N7 `CStarModule` Check (1388–1394) | e₁₂, e₁₁ | `x*y=e₂₁`, while Mathlib's `y x*` gives 0 | true | none |

## Not verifiable

- Elaboration of `Suggested.lean` at #1187's Tau Ceti pin (ab00ba392), which is not checked out in this worktree (R04).
- The worker's seeded list of 15 targets is not in the scratch directory. I covered every locator instead.
- The OCR of `connes85` Corollary 24 garbles the cohomology symbol. The setting on p. 94 (line 1884) is legible, and that is what R09's repair cites.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3, p. 302 (odd case), with Proposition 4, p. 303: the source says its odd normalisation √(2i)Γ(n/2+1), paired through III.3 Proposition 3, equals the index of `EuE`; it should carry an extra factor −1, since the Hardy module with the forward shift gives +1 against index −1; affects a stated result.
