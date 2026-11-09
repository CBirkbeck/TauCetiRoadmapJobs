# Review of NoncommutativeGeometry (pull request #1143 at f0b4904)

**Verdict:** needs changes

This head is the one r14 read (f0b49044); nothing in the folder or outside it has changed. The gate passes, the dependency check reports no problem, and `Suggested.lean` elaborates with only the `sorry` warning. I re-read the heads of the other pull requests involved: OperatorKTheory #866 (1377338a) and OperatorAlgebraDynamics #1137 (8daff1a8) have not moved. SmoothBanachRepresentations #1145 has moved from 7d95047b to 7cde28a0, but only its open-mapping paragraph and one reference changed. So r14's three findings stand and are carried below as R01–R03. This round's own pass (15 seeded locators, 31 adversarial rows, every Tau Ceti and Mathlib name in the contracts, every supplier section) found nothing new.

## R01 (P2) — `A_θ` still has three claimants: N6, OperatorKTheory 7.4–7.5 and OperatorAlgebraDynamics' twisted group algebras

**Location.** `TauCetiRoadmap/NoncommutativeGeometry/README.md`:
- 50–55: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` … its universal presentation by two unitaries … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes."
- N6, 1195–1208.
- Downstream, 1488–1492.

**Claim.** N6 is the single owner of `A_θ`, of its universal presentation, of its faithful trace and of its 𝕋² gauge action, and OperatorKTheory consumes them from N6.

**Witness.**
- OperatorKTheory #866 at 1377338a builds the same object:
  - 1782–1784 define `A_θ=C(𝕋)⋊_αℤ` and `τ=HaarIntegral∘E`.
  - 1796 reads: "A_θ has the universal unitary presentation with these relations from Dynamics D1, including injectivity of the coordinate copy".
  - 1868–1870 identify `A_θ` with `C*(ℤ²,c)` "through the universal properties of both".
  - 2324–2326 say this roadmap consumes "K7's rotation algebras".
- OperatorAlgebraDynamics #1137 at 8daff1a8, lines 75–81, claims to be the single owner of `C*(G,ω)` with its universal property, canonical trace and gauge action (D1.CentralTwists, D2.CentralTwists).
- On main this roadmap consumed K7's `A_θ` (main README 57 and 477). This pull request reverses that direction, and #866 has not followed.

**Check that these are one object.** Take `c((m,n),(m′,n′))=exp(2πiθnm′)`.
- Then `c((0,1),(1,0))=e^(2πiθ)` and `c((1,0),(0,1))=1`.
- So `W_(0,1)W_(1,0)=e^(2πiθ)W_(1,0)W_(0,1)`. This is N6's relation `U₂U₁=e^(2πiθ)U₁U₂` with `U₁=W_(1,0)` and `U₂=W_(0,1)`, and the same ordered multiplier as the pinned `SmoothNoncommutativeTorus`.
- The universal property of `C*(ℤ²,c)` is therefore N6's presentation.

**Constraints on the direction.**
- This roadmap is on main, so citing OperatorKTheory (merge order 9) from N6 is UPWARD.
- OperatorAlgebraDynamics D1–D2 and D4 are already in N6's *Needs:* (1331), so OperatorAlgebraDynamics cannot cite N6 back.

**Repair.**
- **N6, 1195–1208.**
  - Consume OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists at L=ℤ², with trivial action and the cocycle c above. That instance supplies the universal presentation, the faithful canonical trace and the 𝕋² gauge action.
  - N6 keeps the identification of that instance with D1's crossed product `C(𝕋)⋊_αℤ` (`U₁=v`, `U₂=u`), which carries the injectivity of the coordinate copy of C(𝕋) and `τ=∫_𝕋∘E`.
- **Scope 50–55 and Downstream 1488–1492.** Say this, and say that OperatorKTheory 7.4–7.5 consumes `A_θ` and that identification from N6.
- **Description.**
  - Name #1137 as merging first: D1.CentralTwists exists only at its head, and main's OperatorAlgebraDynamics has no `CentralTwists`.
  - State that #866 replaces its 1782–1784 and 1796–1797 by a citation of N6, replaces its 1868–1870 identification by the same citation, and corrects 2324–2326.
- **Test.** `roadmaps grep -i 'universal unitary presentation'` should return nothing outside OperatorAlgebraDynamics, and `roadmaps grep 'identified with C\*\(ℤ²,c\)'` nothing outside N6. Today the first returns OperatorKTheory 1796 and the second OperatorKTheory 1869.

## R02 (P2) — The real completed locally convex projective tensor has two owners

**Location.** `TauCetiRoadmap/NoncommutativeGeometry/README.md`:
- 345–347: "Fix 𝕜=ℝ or ℂ (`RCLike 𝕜`); every statement of this section is made for both fields."
- 1470–1472: "SmoothBanachRepresentations §7.3 consumes N1.Tensor's completed locally convex projective tensor at both fields …, its §7.2a owns only the two scalar-comparison maps".

**Claim.** N1.Tensor is the only place where the real case is stated, and SmoothBanachRepresentations consumes it.

**Witness.** SmoothBanachRepresentations #1145 at 7cde28a0:
- Line 9: "§7.2a owns the same construction for real spaces … and assumes nothing of N1 beyond its complex construction."
- Line 460: "Build the same object here for real Hausdorff locally convex spaces E and F".
- Line 76 says that N1 is consumed for complex factors only.

LocallyConvexDuality #1782, lines 112–113, consumes N1 "over `ℝ` and `ℂ`". So the real case has to stay here, with #1145 citing it.

**Repair.**
- The README needs no edit.
- In the description, state that #1145 rebases after this pull request and, at its head:
  - lines 9 and 74–76 cite N1.Tensor for both fields;
  - §7.2a (458–468) keeps only the two scalar-comparison maps and the balancing quotient;
  - lines 481–483 and 507 consume N1.Tensor at 𝕜=ℝ.
- **Test.** `roadmaps grep 'Build the same object here for real'` should then return nothing. Today it returns #1145 line 460.

## R03 (P3) — The description describes an earlier head and states no order

**Location.** The pull-request description, carried from r14 R03, r13 R04, r12 R04, r11 R02, r10 R05 and r9 R03.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- that N2 "retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- that "[Smooth Banach #1145] consumes N1.Tensor in SB7";
- "which merge first: #864".

**Witness.**
- `git diff --stat origin/main...HEAD` shows `Suggested.lean | 145 +-`.
- README 918 writes `x⊠_s y` and names no K5.
- N2's *Needs:* (742) cites no AlgebraicKTheory.
- #1145 line 76 consumes N1 for complex factors only.
- #864 is no longer open.
- #1187 (`overlaps.md`) conflicts in this `Suggested.lean`: its copy is the old file with `Mathlib.*` sub-imports.

**Repair.** Rewrite the description to match this head:
- N3–N4 consume NoncommutativeIntegration §1.3–§1.6 and §2.1 on main.
- `Suggested.lean` states only `bijective_matrixExtension`.
- The two Clifford reductions are `x⊠_u y` and `x⊠_s y`.
- Add the ordering paragraphs of R01 (#1137 first; the changes #866 makes) and R02 (#1145 after).
- State that #1187's copy of this `Suggested.lean` is superseded and that #1187 rebases after this pull request.
- Drop the #864 line and the stale build report for 84190a1e.

## Previous findings

| r14 finding | Status | Evidence at this head |
|---|---|---|
| R01 (`A_θ` three claimants) | Not repaired | Scope 50–55, N6 1195–1208 and Downstream 1488–1492 are byte-identical to r14's head. OperatorKTheory is still at 1377338a (1782–1798, 1868–1870, 2324–2326) and OperatorAlgebraDynamics still at 8daff1a8 (75–81). Carried as R01, with the 7.5 identification added to the repair. |
| R02 (real tensor, two owners) | Not repaired | #1145 moved to 7cde28a0. The diff from 7d95047b touches only the open-mapping paragraph and adds the Henkel reference; lines 9, 76, 460, 468, 481–483 and 507 are unchanged in substance. Carried as R02. |
| R03 (description) | Not repaired | The description text is unchanged. Carried as R03. |

There is no repair report for r14, so no finding is re-raised against a "not actionable" reason.

## Verified sound

**Gate and dependency check, rerun at f0b4904.**
- `gate … --base origin/main`: every scanner reports 0, then `OK`.
- `gate --depcheck … --movable`: `depcheck: 238 roadmaps, 2319 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- No gaps are declared and none are needed.

**Lean at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).**
- `lake env lean` on `Suggested.lean` exits 0, with the single warning `declaration uses sorry` at 62:8.
- The elaborated type of `bijective_matrixExtension` (`signatures.md`) has `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] [Fintype ι] [DecidableEq ι] [Nonempty ι]`. These are the binders of the pinned `cyclicCohomology.matrixExtension` (its `#check` was elaborated in a scratch file) plus `[Algebra ℚ R]` and `[Nonempty ι]`. This matches README 522–527: no binder is lost and nothing changed.
- One-tactic probe, with the theorem out of scope: `first | simp | rfl | infer_instance | exact?` fails ("`exact?` could not close the goal") on both bijectivity and injectivity. The headline is not padding.
- Form: `import Mathlib` plus `TauCeti.RingTheory.CyclicCohomology.Matrix`; one module docstring; `theorem`; no `set_option`, `lemma` or sorry'd data.

**Headlines.** The Summary (lines 8–12) lists five end theorems:
- matrix Morita invariance (N1): stated;
- the character index theorem (N3): not statable, as the docstring says;
- the Hochschild-class theorem (N5): not statable, as the docstring says;
- the torus calculus and periodic cyclic cohomology (N6): the algebraic two-cocycle is the pinned `traceDerivationPairCocycle`, and the periodic computation is not statable, as the docstring says;
- the Heisenberg index and the values `(θ,1)` (N7): not statable, as the docstring says.

The reasons the docstring gives hold at the pin:
- Mathlib has no trace-class operators: a search of `Mathlib/Analysis` for `TraceClass` and `HilbertSchmidt` finds nothing.
- `TauCeti.traceCLM` (`Topology/Algebra/Module/Trace.lean` 41) is finite-dimensional.
- `dixmierTrace` (`Analysis/OperatorIdeal/Family/DixmierTrace.lean` 91) is `ℝ`-valued.
- `SmoothNoncommutativeTorus` (`NoncommutativeGeometry/SmoothTorus/Basic.lean`) has instances up to `Ring` (453) and `trace` (602), and no topology or derivation.

**Library declarations opened at the pins.**
- Mathlib:
  - `exists_dual_vector''` (`Analysis/Normed/Module/HahnBanach.lean` 85, in the `SeminormedAddCommGroup` section, so usable on (E,p));
  - the self-module `CStarModule A A` with `inner x y := y * star x` (`Analysis/CStarAlgebra/Module/Constructions.lean` 79–80, `inner_def` 92), as the N7 Check says;
  - `LinearMap.index := finrank ker − finrank (N⧸range)` (`Algebra/Module/LinearMap/Index.lean` 39);
  - `IsFredholm.index_comp` (`Analysis/Normed/Operator/Fredholm/Basic.lean` 613), with `FredholmPackage` and `IsFredholm` in the same file;
  - `PositiveLinearMap.GNS` (`Analysis/CStarAlgebra/GelfandNaimarkSegal.lean` 147) and `gnsStarAlgHom` (246).
- Tau Ceti:
  - `cyclicCohomology` (`RingTheory/CyclicCohomology/Cohomology.lean` 273) and `cyclicCocycles` (92);
  - `UniversalForms.cycleCocycle_trace` (`NoncommutativeGeometry/UniversalDifferential/Cycle.lean` 305);
  - in `GroundRing.lean`: `selfEquiv` (297, under `IsSMulRegular M 2`), `ker_mkPiRing = torsionBy R M 2` (277–278) and `isZero_cyclicCohomology_self_of_odd` (193). These match README 233–236;
  - `matrixCochainExtension_single` (elaborated: restriction to the corner is a left inverse);
  - `logarithmic` (`Analysis/OperatorIdeal/Family/Logarithmic.lean` 163) and `HasCompactResolvent` (`Topology/Algebra/Module/LinearPMap/Resolvent/Compact.lean` 68).
- Every other name of the Tau Ceti contract is at the pin, in the module the README names:
  - the `CompletedProjectiveTensorProduct` family and `map_comp_reindex`;
  - `exteriorProductCocycle`, `periodicCyclicCohomology`, `continuousCyclicCohomology`, `traceDerivationCocycle`;
  - `evenPairing`, `evenPairingK0`, `oddPairing`, `AlgebraicK1`, `StableGeneralLinearGroup`, `ExactK0`;
  - the five `matrixCochainExtension_*` laws and `quasiIsoAt_cyclicCochainComplexToTotal`;
  - `schatten`, `traceClass`, `GeneralizedLimit`, `IsDilationInvariant`;
  - the Fredholm perturbation names;
  - `gauge_schatten_le_of_le` and `finiteSubmodule_schatten_le_of_le`.

**Cross-roadmap citations resolved now.**
- On main (a169c04e):
  - BanachAlgebras: line 181 says "A1–A8 denote these same layers". The A4 dual action at 1129, `(a·φ)(x)=φ(xa)` and `(φ·a)(x)=φ(ax)`, gives README 469's `(aφb)(x)=φ(bxa)`.
  - OperatorIdeals OI-A17 (150), OI-A20 (156), OI-A22 (159), OI-A30 (196) and OI-B29–B30 (349–350).
  - SelfAdjointSpectralTheory SA-E01 (1202).
  - NoncommutativeIntegration §1.3 (286), §1.4 (321), §1.5 (360), §1.6 (406) and §2.1 (453–463), with its Downstream 1474–1478.
  - VonNeumannAlgebras V4.Core (972–990).
  - BanachSpaceTheory B4 (239, B4.C 338).
  - OperatorAlgebraDynamics: D1 (148), D2 with its faithful expectation and amenable comparison (221–260), and D4 (333).
- At open heads:
  - VonNeumannAlgebras #1041 at 296b9d1a keeps V4.Core.
  - IndexTheory #1077 at 6d85f5d4 claims no cyclic cohomology, Fredholm module or spectral triple.
  - OperatorKTheory K5.1 (1136–1141) pins `e₁=σ₁` and `e₂=[[0,i],[−i,0]]=−σ₂`, and the swapped reduction `e⊗1↦e₂`, `1⊗e↦e₁`. These are exactly this README's matrices and its `x⊠_s y`.
  - OperatorKTheory 6.6 builds the C*-algebraic KK pairing; N3's pairing is the involutive-algebra index map on idempotents (Connes IV, Proposition 0.2), a different object.
- Consumers named under Downstream:
  - #1145 (9, 13, 74, 460, 481–483, 507), with R02;
  - LocallyConvexDuality #1782 (38, 112–116);
  - AutomorphicSpectralTheory #925 (329, 343, 365);
  - AutomorphicSpectralTheoryPartII #1761 (139–141, 507);
  - GanGrossPrasadUnitaryGroups #1404 (97–113);
  - RefinedTraceMethods #1493 (59, 184);
  - SpectralManifolds #1158 (7, 21);
  - CompactQuantumMetricSpaces #1155 (80, 288, 1523, 1539);
  - HeisenbergImprimitivity #1149 (15, 52, 183, 794, 815).

  All of them consume what the Downstream section says, except #1145 (R02) and OperatorKTheory (R01).
- Ownership against the closest open roadmaps was checked by object (tensors, `A_θ`, Fredholm pairings, Clifford conventions); the only conflicts are R01 and R02.

**Sources: the seeded sample.** The sample is 15 of the README's 39 locators, drawn by a seeded random choice (seed 1143015). All 15 verified at the cache:
- grothendieck52 Théorème 1, p. 76, normed case: the unique norm making `B(E,F;G)≅L(E⊗F;G)` isometric is `inf Σ‖x_i‖‖y_i‖` (lines 164–172).
- grothendieck52 p. 77, metrizable factors give a completion of type (F) (line 183).
- grothendieck52 pp. 76–77, Banach completion for normed factors (lines 164–170, 181–182).
- connes85 Part II, Corollary 24, p. 113, Morita invariance through a bimodule finite projective on both sides (lines 2592–2594).
- connes85 Part II, p. 94, complex algebras and (n+1)-linear functionals (lines 1883–1885).
- connes94 III.1 Theorem 12, p. 197, cup product and the character of a tensor product of cycles (7223–7227).
- connes94 III.3 Propositions 2–3, pp. 229–230 (8469–8472, 8493–8497), with the odd constant `1/√(2i)`.
- connes94 III.3 Proposition 3, proof, pp. 230–231: the path `U_t` and `d/dt(φ#Tr)(U_t⁻¹,U_t,…)=0` (8531–8551).
- fack-kosaki Theorem 4.9(iii), p. 295 (863–881). The displayed inequality is lost in the extraction; the proof derives it from 4.7(i) with `g(s)=s^(p′)`.
- connes94 IV.1, p. 300, `Tr(T₁T₂)=Tr(T₂T₁)` for `1/p₁+1/p₂=1` (11262).
- connes94 IV.1, p. 299, `Tr′(T)=½Tr(F(FT+TF))` (11240–11243).
- connes94 III.2 Proposition 5(a)–(b), p. 217, and the Diophantine condition (7977–7985).
- connes94 IV.6, pp. 356–357: the right action and θ∈]0,1] (13549, 13552, 13555).
- connes94 IV.6, p. 357: `δ_j(U_j)=2πiU_j` and ∇ (13558–13560). The Leibniz rule `∇₁(ξU₁)=(∇₁ξ)U₁+2πiξU₁` holds only for `−2πisξ/θ`, which fixes the extraction's ambiguous `sθ`.
- connes94 IV.6, pp. 358–361: Theorem 2 (13610) and the index formula, Theorem 3 (13716).

Also opened:
- connes94 III.1 Propositions 3–4, p. 190 (6905, 6933), and Lemma 14, p. 198 (7274);
- III.2 Theorem 7, p. 218 (7998–8007), with `δ₁(U^ν)=2πin₁U^ν` (8007);
- IV, introduction, Proposition 0.2 (11082–11100);
- IV.1 Definition 3, p. 302 (11346–11347), and Proposition 4, p. 303 (11376–11379).

**Adversarial pass.** Every value was recomputed this round in pure Python, with exact linear algebra modulo 2³¹−1 for the headline.

| Statement | Instances | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 62; README 522–547) | ι=∅; A=R=M=ℚ, ι=Fin 2, n=0…3 | ι=∅: `M_∅(ℚ)=0`, so HC⁰=0≠ℚ and `[Nonempty ι]` is needed. M₂(ℚ): cyclic cochains 4, 6, 24, 66; cocycles 1, 3, 4, 20; coboundaries 0, 3, 3, 20; HC=1,0,1,0, against HC(ℚ;ℚ)=1,0,1,0 (n≤5). The class of `Tr(a₀a₁a₂)=(σ#Tr)` raises the rank of B² from 3 to 4, so it is nonzero. Probe fails. | true, not padding | none |
| Ground ring (233–236) | the product cochain c | Odd degree: cyclic iff 2c=0. b of an even cochain is `c(1−1)=0`; b of an odd one is c. So `HC^(2k)=M⧸M[2]` (k≥1), `HC^odd=0`, `HC⁰=M`. Matches `ker_mkPiRing` and `selfEquiv` | true | none |
| N1.Tensor cross property (363–369) | ℓ¹, `e₀⊗e₀=(e₀+e₁)⊗e₀−e₁⊗e₀` | the representation costs 2+1=3 against the value 1; `f(x)g(y)=p(x)q(y)≤Σp(x_i)q(y_i)` with `‖g‖≤1` from `exists_dual_vector''` | true | none |
| N1.Tensor field check (398–405) | 1⊗i, i⊗1 under `x·ȳ` | values −i and i on equal complex tensors; ℂ⊗_ℝℂ has real dimension 4 | true | none |
| N1.Tensor over ℝ (345–347) | #1145 line 460 | both build the real construction | two owners | R02 |
| Exterior product (547–550; III.1 Thm 12) | `f₀df₁df₂` on 𝕋² | `(1⊗dy)(dx⊗1)=−dx⊗dy`, so ψ₁#ψ₂ has coefficient `+(2πi)⁻²` on dx∧dy and `−(2πi)⁻²` after the flip | true | none |
| S normalization (560–569) | m=1…5 | Koszul shuffle sums of a 2k-word with a 2-word: 2,3,4,5,6, so `S^mτ(1,…,1)`=1,2,6,24,120=m!. Unsigned at m=2: 6, giving pairing 3≠1 | true | none |
| Coboundary and cyclic signs (570–582) | M₂(ℂ); ℂ | `(bTr)(e₁₂,e₂₁)=0`; `a↦a₁₁` gives 1. On ℂ, `(bc)(1,…,1)=c(1−1)=0` in even degree; odd cyclic cochains vanish | true | none |
| Dual-bimodule currying (468–470) | BanachAlgebras 1129 | `(a·(φ·b))(x)=φ(bxa)`. δT evaluated at a₀ reproduces every term of bφ, with the end term `φ(a_(n+1)a₀,…)` | true | none |
| N2 circle (651–656) | z^k, k=1,2,−1 | ψ=1,2,−1; pairings `0.28209(1−i)`, twice that, its negative. `(1/((1+i)√π))²=−0.159155i=1/(2πi)` | true | none |
| N2 Bott (657–662, 718–729) | z=0.6−0.8i, 0.3+1.7i, 0 | `Tr(p dp∧dp)`: 0.5i, 0.12626i, 2i, against `2i(1+|z|²)⁻²` (equal). `∫_0^2000 r(1+r²)⁻²=0.500004`, so the pairing is 1.000008→1 | true | none |
| N2 Chern-chain constants (678–700) | n=2k+1 | `c_(2k+1)·(−1)^k k!=k!/((2k+1)!√π)=2^(−(2k+1))Γ(k+3/2)⁻¹`; even: `c_(2m)(−1)^m(2m)!/m!=1/m!`. Both are Connes III.3 Props 2–3 | true | none |
| N2 smooth paths (664–673; III.3 Prop 3 proof) | e²=e | `ee′e=0`, hence `[[e′,e],e]=e′e+ee′=e′` and `d/dt(u⁻¹eu)=u⁻¹(e′−[x,e])u=0` | true | none |
| N3 Hardy (877–882) | F=2P−1, forward shift, window [−12,12) | `[F,u]=2e₀e₋₁*`, `τ₁(u⁻¹−1,u−1)=2`, `λ₁=−0.88623(1+i)`, pairing −1 = ind(PuP); Connes' λ₁ gives +1 | true | source issue |
| N3 Clifford (914–941) | Pauli; A=(0.3+0.2i,−1.1+0.5i), B=(0.7−0.4i,0.25+0.9i) | W²=1, `Wσ₁W=−σ₂`, `Wσ₂W=−σ₁`, `Wσ₃W=−σ₃`. `Tr₂(σ₃[D,a][D,b])=0.94+0.93i=2i(A₁B₂−A₂B₁)`. `((1+i)√π)²/(2πi)=1`; `(−1)(2i)/(4π)=−0.159155i=1/(2πi)` | true | none |
| N3/N7 sign of ⟨q*β,[D]⟩ | Riemann–Roch | `D⁺=−2i∂_z`; [p] has `c₁=(i/2π)·2πi=−1`; index of ∂ on L = index of ∂̄ on L̄ (degree +1) = 1, so +1 as stated | true | none |
| N3 doubling (760–767) | F′, Γ=diag(γ,−γ) | `ΓF′+F′Γ` has diagonal blocks `{γ,F}=0` and off-diagonal blocks `γs−sγ=0`; `F′²=1` | true | none |
| N3 quasi-ideals (783–789; FK 4.9(iii)) | p=½, S=diag(1,0), T=diag(0,4) | norms 1, 4, 9>5; p-th powers 3=1+2 | true | none |
| N3 Checks (822–849) | as stated | μ(T)=(1.6180,0.6180), μ(ST)=(2.9208,0.6847)>0.6180, products 2=2. `‖ST‖₁=4≤5`. `diag(1,1)`: 4, 2, 1.4142. ζ(11/10)=10.5844 | true | none |
| N3 dual cyclicity (809–812; IV.1 p. 300) | weighted shifts | S: Σ(j+1)^(−6/5)<∞, Σ(j+1)^(−4/5)=∞. T: Σ(j+1)^(−21/20)<∞, Σ(j+1)^(−7/10)=∞. ST, TS have diagonal (j+1)^(−11/10), shifted by one index | true | none |
| N3 Tr′ (859–860; IV.1 p. 299) | shift Check 850–853 | `S*S−SS*=e₀e₀*`, trace 1 | true | none |
| N4 partial sums (990–995) | μ_j=(j+1)^(−1/p), N≤2·10⁵ | max `N^(1/p−1)σ_N` is 2.9581, 1.9967, 1.4997 against p/(p−1)=3, 2, 1.5; reverse constant 1 from `μ_(N−1)≤σ_N/N` | true | none |
| N4 block operator (1036–1042) | N<65536 | non-increasing; `(j+1)μ_j`=2, 4, 6 at 2N_k−1; max `σ_N/log(1+N)`=2.4853 | true | none |
| N4 ω-dependence (1045–1057) | the two-cycle of `r_(k+1)=(r_k+c_k)/2` | 2/3 and 5/6. Cesàro means along `L_(2k)`, `L_(2k+1)`: 0.743683 = 2/3+log2/9 and 0.756317 = 5/6−log2/9 | true | none |
| N4 non-normality (1016–1024) | rank one; dim H<∞ | `⟨η,ρξ⟩=0` for all ξ, η gives ρ=0, while `Tr_ω(diag(1/(j+1)))=1` | true | none |
| N5 Checks (1118–1142) | D=diag(0,1,−1); diag(1−1/(j+1)) | `(D−i)⁻¹=(i,0.5+0.5i,−0.5+0.5i)`, moduli squared (1,½,½)=1/(1+d²); `0.707107→1/√2` | true | none |
| N5 Hochschild class (1158–1167) | n≥2 | `μ_j(|T|^n)≤Cⁿ/(j+1)` puts it in `S_(1,∞)⊂L^(1,∞)`; n=1 uses the logarithmic ideal, as Connes' L^(1,∞) | true | none |
| N6 `A_θ` and τ (1195–1208, 1278–1282) | `C*(ℤ²,c)`; ev₁∘E | the cocycle gives N6's relation; `ev₁E(u·vu*)=e^(2πiθ)`, `ev₁E(vu*·u)=1` | true | R01 (owner) |
| N6 multiplier, trace and non-trace (1267–1277) | θ=½ | `U₂U₁` and `λU₁U₂` both −1 at (1,1); τ(xy)=τ(yx)=−1; `ab=−U₂`, `ba=U₂` | true | none |
| N6 projection replacement (1231–1239, 1290–1296) | e=[[1,a],[0,0]] | z=diag(1+aa*,1+a*a), p=diag(1,0), s=[[1,a],[0,1]], `s⁻¹=p+(1−e)(1−p)=[[1,−a],[0,1]]`, `ses⁻¹=p`. In general `ss′=p+(1−p)(1−e)(1−p)=1` from ep=p, pe=e | true | none |
| N6 seminorms and cohomology (1220–1227, 1298–1318) | `Σ(1+|r|+|s|)^(−3)`; Connes III.2 | `1+Σ4n/(1+n)³<∞`; dimensions 1, 2, 1 under the Diophantine condition (Prop. 5(a)–(b)), non-Hausdorff otherwise (5(c)); HP≅ℂ² in both parities with Sτ, φ and φ_j (Thm 7) | true | none |
| N7 (1335–1454) | r²=0,1,2,5,25; mode (2,−3); Heisenberg | counts 1,4,4,8,12, so multiplicities 2,8,8,16,24. `D⁺` on (2,−3) is 12.566+18.850i=2π(m−in). `σ/log N` 0.1475 at R=400, tending to 1/(2π)=0.1592 at rate 1/log R. `V₊S=e^(2πiθ)SV₊` and `SV₋=e^(2πiθ)V₋S`; S compressed to k<0 has index +1; `ν_j(U_k)=δ_jk`. Curvature `[∇₁,∇₂]=2πi/θ`; `−d/ds−2πs/θ` kills `e^(−πs²/θ)` | true | none |

## Not verifiable

- Elaboration at #1187's Tau Ceti pin (ab00ba392): that pin is not checked out in this worktree. Only the order is asked for, in R03.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 (odd case), p. 302, with Proposition 4 and Proposition 0.2, pp. 295 and 303: the source says the positive odd constant `√(2i)Γ(n/2+1)`, paired by III.3 Proposition 3, gives the index of `EuE`; it should carry an extra factor −1, since the Hardy module with the forward shift pairs to +1 while `Index(EuE)=−1`; affects a stated result.
