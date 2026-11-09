# Review of NoncommutativeGeometry (pull request #1143 at 2e5c831)

**Verdict:** needs changes

This is a full review of the folder at 2e5c831, the head r22 read; the folder has not changed since then.

- The gate passes and `Suggested.lean` elaborates with its single `sorry`. The dependency check reports 0 problems.
- All 15 sampled locators verify against the cached texts.
- r22's two findings are unrepaired and are carried as R02 and R04.
- The full pass adds two findings:
  - **R01 (P1):** the README credits the pinned `dixmierTrace` with additivity on positive operators. The pin proves only subadditivity, so N4's linear Dixmier trace rests on an unowned step.
  - **R03 (P3):** N3's own Fredholm-module and character definitions have no bullet Checks.

## R01 (P1) — Additivity of the Dixmier trace is credited to the pin, which does not prove it

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 347–350, in the Tau Ceti contract: "`dixmierTrace` with its positivity, positive homogeneity, subadditivity, … the value 1 on `diag(1/(j+1))` and additivity on positive operators for dilation-invariant ω (`…/DixmierTrace`)".
- 1152–1156, in N4: "… vanishing on trace class and additivity on the positive cone under the dilation-invariance hypothesis; … Construct here the linear extension to a trace on L^(1,∞)".
- 1221, N4's *Needs:* line, which cites only `dixmierTrace`.

**Claim.** Tau Ceti already proves `Tr_ω(S+T)=Tr_ω(S)+Tr_ω(T)` for positive S, T in L^(1,∞) and dilation-invariant ω. N4 builds the linear extension on top of it.

**Witness.** Tau Ceti 2fd255d, `Analysis/OperatorIdeal/Family/DixmierTrace.lean` (295 lines): the only additivity theorem is `dixmierTrace_add_le` (187), which is subadditivity. `IsDilationInvariant` appears there only in the docstring (42), which says additivity "needs" it. No Tau Ceti file mentions both.

**Consequence.** No layer and no supplier owns additivity. Every N4 target after it depends on it:
- the linear extension;
- `Tr_ω(AT)=Tr_ω(TA)`;
- N5's cocycle φ_ω;
- N7's `Tr_ω(π(a)|D|⁻²)=τ(a)/(2π)`, which is linear in a.

No roadmap on main or at an open head plans it: `roadmaps grep` for Dixmier additivity hits only this README.

**Repair.**
1. At 349–350, replace "and additivity on positive operators for dilation-invariant ω (`…/DixmierTrace`)" by: "(`…/DixmierTrace`), and, for positive S and T, the Ky Fan superadditivity `ContinuousLinearMap.IsPositive.kyFanGauge_add_kyFanGauge_le`, `K_k(S)+K_l(T)≤K_(k+l)(S+T)` (`Analysis/OperatorIdeal/ApproximationNumber/Positive`)".
2. At 1154–1155, delete "and additivity on the positive cone under the dilation-invariance hypothesis". Before "Construct here the linear extension", insert: "Prove that Tr_ω is additive on the positive operators of L^(1,∞) when ω is dilation invariant. Subadditivity gives ≤. For ≥, combine `K_N(S)+K_N(T)≤K_(2N)(S+T)`, `log(1+2N)/log(1+N)→1` and invariance of ω under the dilation by 2 (`TauCeti.GeneralizedLimit.IsDilationInvariant.map_dilate`), applied to logarithmic means whose consecutive terms differ by o(1) (Connes IV.2, p. 312, after Definition 2)."
3. At 1221, add `TauCeti.GeneralizedLimit.IsDilationInvariant.map_dilate` and `ContinuousLinearMap.IsPositive.kyFanGauge_add_kyFanGauge_le` to the Tau Ceti list.

**Test.** On S=diag(1/(j+1))⊕0 and T=0⊕diag(1/(j+1)) on ℓ²⊕ℓ², at N=10⁶:

| Quantity | Value |
| --- | --- |
| `K_N(S)+K_N(T)` | 28.7855 |
| `K_N(S+T)=2H_(N/2)` | 27.3992 (strictly smaller) |
| `K_(2N)(S+T)` | 28.7855 (equal to the first row) |
| logarithmic means of the first two rows | 2.0836 and 1.9832, both tending to 2 |

So `Tr_ω(S+T)=2=Tr_ω(S)+Tr_ω(T)` holds only through the 2N comparison and the dilation. Both new names are at the pin (`Positive.lean` 114, `GeneralizedLimit.lean` 189). The source states the additivity at connes94 lines 11761–11762, derived from the inequalities at 11702–11712.

The three edits were applied to a scratch copy of the README:
- `roadmaps resolve` finds every cross-roadmap citation and Lean name;
- the dependency check gives `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`.

## R02 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r22 R01 (r21 R01, r20 R01); not repaired.

**Location.**
- README 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- README 1722–1725: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ.

**Witness.** OperatorKTheory #866 is still at 1377338a. In `TauCetiRoadmap/OperatorKTheory/README.md`:
- 1782–1784 define `A_θ=C(𝕋)⋊_αℤ` and `τ=HaarIntegral∘E`;
- 1796–1797 state the universal presentation and coordinate injectivity;
- 2324–2326 say this roadmap consumes "K7's rotation algebras with their K-groups".

**Repair.** Unchanged from r22. This roadmap is on main, so it is earlier than #866 and may not cite it; the README already takes the only admissible direction. So:
- no README edit;
- the description states that this pull request merges before #866;
- #866 replaces 1782–1784 and the bullet at 1796–1797 by a citation of NoncommutativeGeometry N6, and rewrites 2324–2326 as consumption of N6.
- Test: afterwards `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R03 (P3) — N3's Fredholm-module and character definitions have no Checks

**Location.** README 989–1028: N3's **Checks.** list has eight bullets. Every one concerns the consumed Schatten quasi-ideals, Hölder's inequality, trace cyclicity, or N3's inclusions S_p⊆S_q.

N3's own definitions have no bullet:
- Fredholm cycles and modules;
- the sine-and-doubling normalization;
- the conditional trace `Tr′`;
- `τ_n` and `Ch_n=λ_nτ_n`;
- the index pairing.

Their only computed tests are prose: 1054–1057 (Hardy calibration) and 1089–1094 (point cycle).

**Claim.** The section satisfies the rule that each definition carries at least three discriminating Checks.

**Witness.** No bullet in 990–1028 mentions F, `Tr′`, `τ_n`, `Ch_n` or a compression index. `Tr′` is tested nowhere beyond the trace class, the only place it differs from Tr.

**Repair.** Add to N3's **Checks.**:
- "The circle calibration of the character. On ℓ²(ℤ) with F=2P_Hardy−1, `[F,z]` is the rank-one map `e₋₁↦2e₀`, so `τ₁(z⁻¹−1,z−1)=Tr(z⁻¹[F,z])−Tr([F,z])=2−0=2`. The odd `λ₁=−(1+i)sqrt(π)/2` gives `⟨[z],Ch₁⟩=−1=ind(P_Hardy z P_Hardy)`; the coefficient printed in Connes IV.1, Definition 3 gives +1."
- "The point cycle. On ℂ²⊕ℂ² over M₂(ℂ), with π=id⊕0 and F the swap, `e=[[1,a],[0,0]]` compresses from eℂ² to π(e)H⁻=0 with index 1 = `Tr′(γπ(e))=Tr e`. The compression in the opposite direction, from π(e)H⁻ to π(e)H⁺, has index −1."
- "The conditional trace beyond the trace class. On ℓ²(ℤ) with F=2P_Hardy−1, the unitary `Te_k=e_(−k−1)` exchanges the two spectral halves, so `FT+TF=0` and `Tr′(T)=0`, although T is not compact. A trace defined only on S₁ does not apply to T."

**Test.** The three values were recomputed:
- `Tr(z⁻¹[F,z])=2` and `⟨[z],Ch₁⟩=(1+i)⁻¹(1/sqrt π)·λ₁·2=−1` (−1+0i numerically);
- index 1 against −1 for the two compression directions;
- `FTe_k=−TFe_k` on both halves.

## R04 (P3) — The description describes an earlier head and states no merge order

Carried from r22 R02 (r21 R03, r20 R03); the description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "which merge first: #864"; and a build report for head 84190a1e.

**Witness.**
- `git diff --stat origin/main...HEAD` gives `Suggested.lean | 147 +-`.
- README 1556–1557 writes the product classes `x⊠_u y`, `x⊠_s y`.
- README 105–106 says SmoothBanachRepresentations' inverse closure "is not an input here".
- No *Needs:* line names AlgebraicKTheory.
- #864 is not open.
- #1187 rewrites this folder's `Suggested.lean` (its head carries main's old file) and conflicts with this pull request.

**Repair.** Unchanged from r22.

Rewrite the description for this head:
- N1.Tensor consumes Tau Ceti's Banach and locally convex projective tensors and BanachSpaceTheory B4's norm comparison.
- N1.Cyclic consumes the pinned bounded coboundary, currying and dual actions.
- N3–N4 consume NoncommutativeIntegration and VonNeumannAlgebras V4.Core.
- N6 builds `A_θ` on Tau Ceti's full crossed product.
- N7 consumes HilbertModules H1–H3.
- `Suggested.lean` states only `bijective_matrixExtension`.

State the order:
- #866 merges after this pull request (R02);
- SmoothBanachRepresentations #1145 and LocallyConvexDuality #1782 merge after it;
- #1187 rebases after it.

Drop the #864 line and the build report for 84190a1e.

## Previous findings

- **r22 R01 — not repaired.** README 50–56 still reads "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ", and 1722 "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ". #866 is unchanged at 1377338a (1782–1784, 1796–1797, 2324–2326). Carried as R02.
- **r22 R02 — not repaired.** The description still reads "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged" and "which merge first: #864". Carried as R04.

No repair report marked a finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Gate, dependency check, build, signatures.**
- `gate … --base origin/main` at 2e5c831, run here: every scanner 0, `OK`. The worker's run, which includes `build=0`, agrees.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The dependency check (`--movable`) prints `depcheck: 235 roadmaps, 2262 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Every supplier is on main: BanachAlgebras, BanachSpaceTheory, OperatorTheory (OperatorIdeals, SelfAdjointSpectralTheory), NoncommutativeIntegration, VonNeumannAlgebras, HilbertModules and OperatorAlgebraDynamics. No gaps are declared.
- `lake env lean TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0 with the single warning `declaration uses sorry` at 64:8.
- `#check @TauCeti.cyclicCohomology.matrixExtension` and the elaborated type of `bijective_matrixExtension` match README 682–687:
  - a unital `Algebra R A` over a `CommRing R` with `Algebra ℚ R`;
  - an R-module M;
  - `[Fintype ι] [DecidableEq ι] [Nonempty ι]`;
  - every n.

  The file has no `variable` block, so no binder can be lost.
- One-tactic probe on a scratch copy: `simp` makes no progress; `aesop` fails; `exact?` finds only the sorried copy itself. It is not padding.

**Headlines.** The Summary lists six end theorems.
- Matrix Morita invariance is stated.
- The cycle realization and the torus cocycle are pinned: `UniversalForms.cycleCocycle_trace` (`UniversalDifferential/Cycle.lean` 305) and `traceDerivationPairCocycle` (`CyclicCohomology/Derivation.lean` 209). The docstring says so.
- The N3 index theorem, N5 Hochschild class, N6 HP and Diophantine Hochschild computation, and N7 index and (θ,1) are named in the docstring as not statable, each with its missing carrier. I confirmed the carriers are absent at the pins:
  - no trace on trace-class operators in Mathlib 1b1ccf4 or Tau Ceti 2fd255d (only `TauCeti.traceCLM`, `Topology/Algebra/Module/Trace.lean` 41);
  - no `CStarModule` completion or interior tensor product (Mathlib `Analysis/CStarAlgebra/Module/*` has only Defs, Constructions and Synonym; no Tau Ceti file mentions `CStarModule`);
  - no topology or derivations on `SmoothNoncommutativeTorus`.

**Library declarations opened at the pins** (Tau Ceti 2fd255d unless marked).

*Cyclic cohomology and pairings*

| File | Declarations (line) |
| --- | --- |
| `RingTheory/CyclicCohomology/Matrix.lean` | `matrixCochainExtension` (67; the closed-path formula), `matrixCochainExtension_single` (275), `cyclicCohomology.matrixExtension` (497), `matrixCochainExtension_connesB` (588), `matrixCochainExtension_barContraction` (551) |
| `EvenPairing/Basic.lean` | `evenPairing` (93, factor `(m!)⁻¹`) |
| `OddPairing/Basic.lean` | `oddPairing` (106, factor `(1+I)⁻¹2^(−n)Γ(n/2+1)⁻¹`), matching README 791–796 |
| `OddPairing/Invariance.lean` | `oddPairing_mul`, `oddPairing_conj`, `oddPairing_eq_zero_of_mem_commutator`, `oddPairing_eq_zero_of_mem_elementarySubgroup` |
| `GroundRing.lean` | `selfEquiv`, `selfQuotEquiv` (`M⧸M[2]`), matching README 275–277 |
| `Normalized/Chern/Even.lean` | `b_evenChernChain_add_B_evenChernChain` (122); docstring `ch₂ₖ` formula (20) |
| `PeriodicCohomology.lean` | `shiftIso` |
| `ExactSequence.lean` | exactness theorems |

*Operator ideals and Dixmier traces*

| File | Declarations (line) |
| --- | --- |
| `Analysis/OperatorIdeal/Family/Logarithmic.lean` | gauge (210), compactness (318), trace-class inclusion (356), completeness (379) |
| `…/Family/Schatten.lean` | `gauge_schatten_le_of_le` (93), `finiteSubmodule_schatten_le_of_le` (101), both with `1 ≤ p` |
| `…/Family/DixmierTrace.lean` | `dixmierTrace` (91; junk 0 outside L^(1,∞)), `dixmierTrace_add_le` (187), `dixmierTrace_modulus` (226), `dixmierTrace_eq_zero_of_mem_traceClass` (248), `dixmierTrace_eq_one_of_singularValue_eq` (262) |
| `Analysis/Normed/Order/GeneralizedLimit.lean` | `IsDilationInvariant` (177), `exists_isDilationInvariant` (309) |

*Fredholm theory and compact resolvent*

| File | Declarations (line) |
| --- | --- |
| `Analysis/Fredholm/CompactPerturbation.lean` | `TauCeti.isFredholm_one_add` (72), `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` (87), `ContinuousLinearMap.index_add_of_isCompactOperator` (137) |
| `…/SmallPerturbation.lean` | `ContinuousLinearMap.IsFredholm.eventually_isFredholm_and_index_eq` (57) |
| `…/ContinuousFamily.lean` | `Continuous.index_eq_of_preconnectedSpace` (74), `Path.index_eq` (81) |
| `Analysis/InnerProductSpace/LinearPMap/Eigenbasis.lean` | eigenbasis theorem (docstring) |

*Smooth torus, crossed products, holomorphic calculus*

| File | Declarations (line) |
| --- | --- |
| `NoncommutativeGeometry/SmoothTorus/Basic.lean` | `twist` (180), `U₂_mul_U₁` (561), `trace` (602), `trace_star_mul_self_eq_zero_iff` (649) |
| `Analysis/CStarAlgebra/Action/ContinuousMap.lean` | `rotation_apply_apply` (76) |
| `…/CrossedProduct/Full.lean` | `of_injective` (335; `InnerRegularCompactLTTop`, faithful ρ), nonunital (275) |
| `…/CrossedProduct/Multiplier.lean` | `groupMultiplier_mul_coefficientMultiplier` (258) |
| `Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Cycle.lean` | `integral_smul_resolvent_eq_of_windingNumber_eq` (73) |

*Tensors*

| File | Declarations (line) |
| --- | --- |
| `Analysis/Normed/Module/PiTensorProduct/` | `projectiveSeminormOf_tprod_le` (Seminorm 57); `instFirstCountableTopology` (Topology 180); `lift`, `map_id`, `map_comp` (Completion 100, 156, 167); `reindex_refl`, `reindex_trans`, `map_comp_reindex` (Reindex/Completion 90, 97, 111); both `liftEquiv` (UniversalProperty 66, 122) |
| `Analysis/Normed/Module/TensorProduct/` | `projectiveSeminorm_tmul` (InjectiveSeminorm 245); `norm_mapL_le` (Completion 128); `liftIsometry` (Completion 196); `comm`, `lid`, `assoc` (Associator 62, 87, 207) |

No pin has the cross property `π_(p,q)(x⊗y)=p(x)q(y)` for family seminorms, nor completed associativity or scalar unit, so the N1.Tensor targets are not duplicated.

*Mathlib 1b1ccf4*

| File | Declarations (line) |
| --- | --- |
| `Analysis/CStarAlgebra/Module/Constructions.lean` | `inner x y := y * star x` (80), matching the N7 Check at 1648–1654 |
| `Analysis/Normed/Module/HahnBanach.lean` | `exists_dual_vector''` (85) |

**Cross-roadmap citations resolved on main (3090489).**

| Roadmap | Section (lines) | Content checked |
| --- | --- | --- |
| BanachAlgebras | 2.1 (440) | holomorphic calculus and the contour systems |
| BanachAlgebras | 6.1 (1381–1395) | `Hⁿ=Zⁿ/Bⁿ` and currying compatibility |
| BanachSpaceTheory | B4 (264–268) | norm-preserving `PiTensorProduct` comparison |
| NoncommutativeIntegration | §1.3 (286), §1.4 (321), §1.5 (360), §1.6 (406), §2.1 (453) | every fact in the row at README 432 |
| VonNeumannAlgebras | V4.Core (972–985) | trace, `Tr|x|=‖x‖₁`, cyclicity, B(H)=S₁* |
| OperatorIdeals | OI-A17 (150), OI-A20 (156), OI-A22 (159), OI-A30 (196), OI-B29–B30 (349–351) | the cited singular-value facts |
| HilbertModules | H1 (139–143), H2 (229–233), H3 (286–291) | completion, Parseval frames, state localization |
| OperatorAlgebraDynamics | D1 (205, universal property), D2 (245–252 expectation, 278 G=ℤ), D4 (333–339) | the consumed interfaces |

The revision #1137 keeps D1, D2 and D4 (674, 1401, 2180).

**Deferrals and consumers resolved at open heads.**
- SmoothBanachRepresentations at 18e94ff: §7.2a (466), N1 consumption (478, 497), and the N6 ownership sentence (13).
- PadicLocalLanglandsForGL2Qp §0.1 and LocallyAnalyticDistributions §0.0 (892).
- AutomorphicSpectralTheory (334, 348), AutomorphicSpectralTheoryPartII (141), GanGrossPrasadUnitaryGroups (97–113) and RefinedTraceMethods (59, 184) consume N1.
- SpectralManifolds (21) consumes N1–N2 and N4–N5.
- CompactQuantumMetricSpaces (1523) and HeisenbergImprimitivity (221–223) consume N6–N7.
- LocallyConvexDuality (113) consumes N1.
- `roadmaps resolve` reports nothing missing.

**Ownership and overlaps.**
- `overlaps.md`: no id cited here is dropped, none is defined only by a revision, and none dropped here is cited elsewhere.
- #1187 is the one conflicting head (R04).
- Of the closest roadmaps by vocabulary:
  - #866 is a second owner of `A_θ` (R02);
  - #866's K-homology is over C*-algebras, while N3's Fredholm modules over involutive smooth algebras are a different carrier;
  - #1145, #1158 and #1137 own nothing of N1–N7.
- No other roadmap declares `bijective_matrixExtension`.

**Sources: the seeded sample.** The 15 targets were drawn with `shuf --random-source` seeded by the head hash, from 34 locators. Each was read at its locator:

| # | README claim | Source text read | Result |
| --- | --- | --- | --- |
| 1 | IV intro, Definition 3, p. 296 (p-summability, p≥1) | connes94 11135–11148 | ✓ |
| 2 | IV.2, Theorem 8, p. 315 | connes94 11865–11873 (hypotheses `D⁻¹∈L^(n,∞)`, Sign D=F, δ-regularity) | ✓ |
| 3 | Fack–Kosaki Theorem 4.2(i), p. 286 | fack-kosaki 605–606 | ✓ |
| 4 | IV.2, Definition 2, p. 312 | connes94 11754–11760 | ✓ (normalizes by log N rather than log(1+N); same limit) |
| 5 | III.2, Theorem 7, p. 218 | connes94 7998–8008 | ✓ |
| 6 | Grothendieck Théorème 1, p. 76 | grothendieck52 153–163 | ✓ |
| 7 | III.1, Propositions 3–4, pp. 190–191 | connes94 6905–6914, 6933–6950 | ✓ (the README's cyclic sign is equivalent to Connes' after reindexing; the coboundary formula is identical) |
| 8 | III.2, Proposition 5, p. 217 | connes94 7977–7985 | ✓ |
| 9 | Grothendieck, completed product, p. 77 | grothendieck52 180–183 | ✓ |
| 10 | IV.6, pp. 358–361 (index formula, comparison only) | connes94 13610 (Theorem 2), 13716 (Theorem 3) | ✓ |
| 11 | III.3, Propositions 2–3, pp. 229–230 | connes94 8469–8500 | ✓ |
| 12 | IV.1, Proposition 1, p. 299 | connes94 11240–11252 | ✓ |
| 13 | Grothendieck, normed factors, pp. 76–77 | grothendieck52 164–172 | ✓ |
| 14 | Grothendieck, metrizable gives (F), p. 77 | grothendieck52 182–183 | ✓ |
| 15 | Fack–Kosaki Theorem 4.9(iii), p. 295 | fack-kosaki 863–871 | ✓ (proved there for Haagerup Lp (851–854), which at B(H) is the tracial S_p; the README routes the proof through NoncommutativeIntegration §1.3) |

Also read outside the sample:
- connes94 11082–11100 (IV intro, Proposition 2: `ϕ([u])=Index(EuE)`);
- connes94 11343–11347 (IV.1 Definition 3);
- connes94 11376–11379 (Proposition 4);
- connes94 11761–11767 (additivity, Proposition 3);
- connes94 11789–11793 (Proposition 4, p. 313);
- connes94 13548–13560 (the Heisenberg module and its connection, θ in ]0,1]);
- connes85 2592–2594 (Corollary 24, p. 113). Its OCR writes `H^` for the cyclic `H_λ`, as at 2588; the periodic `H*` is written separately (1962, 2472). So the corollary concerns cyclic cohomology, as the README says.

**Adversarial pass.** Values are recomputed for this review in pure-Python scratch scripts (exact rational linear algebra for HC dimensions) or by hand where marked.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `bijective_matrixExtension` (Lean 64; README 682–710) | A=ℚ vs M₂(ℚ), R=M=ℚ, n=0,1; ι=∅; A=0; n=2 | `HC⁰`: 1 vs 1. `HC¹`: 0 vs 0 (M₂: 6 cyclic cochains, 3 cocycles, 3 coboundaries). ι=∅: `HC⁰(0)=0≠1`, so `[Nonempty ι]` is needed and present. A=0: 0=0. `(σ₁#Tr)(E₁₁,E₁₁,E₁₁)=1≠0`, while coboundaries vanish on (e,e,e) | true | none |
| Dixmier additivity (347–350, 1152–1156; R01) | S=diag(1/(j+1))⊕0, T=0⊕diag(1/(j+1)), N=10, 10³, 10⁶ | at N=10⁶: `K_N(S)+K_N(T)=28.7855`, `K_N(S+T)=27.3992`, `K_(2N)(S+T)=28.7855`; means 2.0836 and 1.9832, tending to 2. At the pin: only `dixmierTrace_add_le` | statement true, not pinned | R01 |
| `A_θ` ownership (50–56, 1722–1725; R02) | #866 at 1377338a | 1783 defines `A_θ=C(𝕋)⋊_αℤ`; 1784 `τ=HaarIntegral∘E` | two owners | R02 |
| N3 character Checks (989–1028; R03) | Hardy F=2P−1, u=z; point cycle; `Te_k=e_(−k−1)` | `Tr(z⁻¹[F,z])=2`, `⟨[z],Ch₁⟩=−1+0i` = `ind(PzP)=−1`; point index 1 vs reversed −1; `FT+TF=0`, T unitary | true, missing as Checks | R03 |
| Sample 1, p-summability (1030–1032) | Hardy, a=z | `μ([F,z])=(2,0,0,…)`, so in every S_p, p≥1 | true | none |
| Sample 2 / N5 cocycle at the Fourier triple (1304, 1579–1581) | random commuting values x,y,x′,y′ | `−Tr(σ₃(σ₁x−σ₂y)(σ₁x′−σ₂y′))=0.94+0.93i` = `2i(xy′−yx′)`; `λ₂·2i/(4π)=−0.159155i=(2πi)⁻¹` | true | none |
| Sample 3, Hölder (966; Check 1003) | I₂, p=q=2; diag(2,1)·diag(1,2) | `2=√2·√2`; `4≤5` | true | none |
| Sample 4, `Tr_ω(diag(1/(j+1)))=1` (1146, 1173) | N=10³, 10⁵, 10⁶ | `H_N/log(1+N)`: 1.08348, 1.05014, 1.04178, tending to 1 | true | none |
| Sample 5, torus HP and conventions (1490–1494, 1426) | pinned `U₂_mul_U₁`, `twist` | `U₂U₁=𝐞(θ)U₁U₂` = Connes `U₂U₁=λU₁U₂`; phase `𝐞(θ·y₂z₁)` = `exp(2πiθnm′)` | true | none |
| Samples 6 and 13, cross property and Banach comparison (528–545) | `e₀⊗e₀` in ℓ¹; u on ℓ¹₂⊗ℓ¹₂ | one-term cost 1, alternative representation 3; projective norm 4; injective 2 (ℝ) and 2.828427 (ℂ) | true | none |
| Sample 7, cyclic sign and coboundary (607–612; Checks 731–760) | φ(a,b,c)=abc on ℂ; M₂ with φ=a₁₁ | `abcd−abcd+abcd−dabc=0`; `(bφ)(e₁₂,e₂₁)=1`, `(bTr)=0` | true | none |
| Sample 8, Diophantine Hochschild (1501–1509) | golden θ, n<2·10⁴ | `max|1−λⁿ|⁻¹/n=0.5365`, bounded (k=1) | true | none |
| Samples 9 and 14, completed product (480–506) | E={0}; Fréchet `ℝ^ℕ` | {0}; `ℝ^ℕ⊗̂ℝ^ℕ=ℝ^(ℕ×ℕ)` by the product rule of p. 77 | true | none |
| Heisenberg module and chiral index (1588–1609; Check 1681–1686), which sample 10 is compared with | θ=0.37, s=0.61 | `((ξU₂)U₁)/((ξU₁)U₂)=−0.684547+0.728969i=e(θ)`; curvature `16.981582i=2πi/θ`; Gaussian residual 4.1·10⁻¹⁰; adjoint kernel `exp(πs²/θ)` is not L², index +1 | true | none |
| Sample 11, circle and Bott calibration (825–836, 877–887) | z^k; Bott density at z=0.3+0.7i | `⟨[z^k],ψ⟩=k/((1+i)√π)`; square times 2πi gives 1.0000; `Tr(p dp∧dp)=0.801154i=2i/(1+|z|²)²`; pairing (2πi)⁻¹·2i·2π·½=1 | true | none |
| Sample 12, `Tr′` and the cycle (1035–1046) | Hardy | `(z⁻¹−1)[F,z]` has rank 1, `Tr′=Tr=2` | true | none |
| Sample 15, p-triangle (961–962; Check 993) | p=½, diag(1,0), diag(0,4) | `‖S+T‖_(1/2)=9>5`; p-th powers 3≤3 | true | none |
| Odd and even column constants (673–675, 868–871) | k=0,1,2,3; m any | odd residuals ≤1·10⁻¹⁷; even `(−1)^m/(2m)!·(−1)^m(2m)!/m!=1/m!` | true | none |
| Odd sign (1050–1057; Source issues) | circle, u=z | Connes' printed λ₁ gives +1; `Index(EuE)=−1` (p. 295) | README correct, source wrong | none |
| ω-dependence of `Tr_ω` (1186–1197) | recursion and block integrals | `r_k` alternates 0.666667 and 0.833333; values 0.743683 and 0.756317 = `2/3+(log 2)/9`, `5/6−(log 2)/9` | true | none |
| Fourier `Tr_ω(|D|⁻²)` (1542, Check 1669–1671) | R=200, 800 | `σ/log N`: 0.14616, 0.14853; slope in log R is 1/π; limit `1/(2π)=0.15915` | true | none |
| Weak-class constants (1131–1134) | p=2, μ_j=(j+1)^(−1/2) | `sup N^(−1/2)σ_N=1.99854≤2=p/(p−1)` | true | none |
| Idempotent path (840–844) | `e_t=exp(tX)e₀exp(−tX)` | `|ee′e|=7·10⁻¹¹`; `|[x,e]−e′|=7·10⁻¹¹` | true | none |
| Hardy product reductions (1555–1570) | W=(σ₁−σ₂)/√2 | `Wσ₁W=−σ₂`, `Wσ₂W=−σ₁`, `Wσ₃W=−σ₃` | true | none |
| Projection replacement (1414–1422; Check 1482–1488) | e=[[1,U₁],[0,0]], by hand | `z=2`; p=diag(1,0); ep=p, pe=e; `s e s⁻¹=p` with `s⁻¹=p+(1−e)(1−p)` | true | none |
| Weighted-shift cyclicity (Check 1016–1024), by hand | S∈S₃∖S₂, T∈S_(3/2)∖S₁ | `ST=diag(0,1,2^(−11/10),…)`, `TS=diag(1,2^(−11/10),…)`; both traces `ζ(1.1)=10.5844` | true | none |
| Odd modules on ℓ²(ℤ) (1629–1640; Check 1672–1680), by hand | V₊S, SV₋ | ratios `e(θ)`; compression of S to k<0 has kernel e₋₁, cokernel 0, index +1 | true | none |
| A_θ unit and direction (1336–1358; Checks 1466–1474), by hand | c=μ({0}); θ=1/4 | `(c⁻¹δ₀⋆g)(s)=g(s)`, `δ₀⋆δ₀=cδ₀`; `rotation(−2πθ)` gives `f(e(θ)z)`, so `uvu*=iv` | true | none |

## Not verifiable

- none. Every sampled locator was read in the cached legal texts (connes94, connes85, fack-kosaki, grothendieck52).

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 with Proposition 4, pp. 302–303: the source says the odd character constant √(2i)(−1)^(n(n−1)/2)Γ(n/2+1) makes the K₁ pairing equal Index(EuE) with E=(1+F)/2 (p. 295); it should be minus that constant, since the circle Hardy module then pairs [z] to +1 while Index(PzP)=−1; affects a stated result.
