# Review of NoncommutativeGeometry (pull request #1143 at 3571729)

**Verdict:** needs changes

Full review of the folder at 3571729, the head r18 also read (no change in the folder since). The gate passes, `Suggested.lean` elaborates with the single intended `sorry`, the dependency check is clean and all 15 sampled locators verify. Two r18 findings are still open (R01, R05). The full pass adds three: a duplication of HilbertModules, which is now on main (R02); two targets that depend on later sections (R03); and a missing supplier for N6's holomorphic calculus (R04).

## R01 (P2) — `A_θ` has two owners: N6 here and OperatorKTheory 7.4 in #866

Carried from r18 R01; not repaired.

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 50–56: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The same file, 1568–1570: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 alone owns `A_θ`, its presentation and τ, and OperatorKTheory consumes them.

**Witness.** OperatorKTheory #866 is still at 1377338a (`TauCetiRoadmap/OperatorKTheory/README.md`):
- 1783–1784 define `A_θ=C(𝕋)⋊_αℤ` and "the canonical trace `τ=HaarIntegral∘E`";
- 1796–1797 state the universal presentation and the "injectivity of the coordinate copy";
- 2324–2326 say this roadmap consumes "K7's rotation algebras".

Each roadmap hands the object to the other.

**Repair.** Only the README's direction is available. A scratch copy with `OperatorKTheory 7.4` added to N6's *Needs:* (1411) gives `UPWARD: NoncommutativeGeometry (on main) -> OperatorKTheory (#9) at README lines [1411]`. So:
- no README edit;
- the description states that #1143 merges before #866;
- #866 then replaces 1783–1784 and the bullet at 1796–1797 with a citation of NoncommutativeGeometry N6, and rewrites 2324–2326.
- Test: afterwards, `roadmaps grep --fixed 'τ=HaarIntegral∘E'` and `roadmaps grep --fixed "K7's rotation algebras"` return nothing.

## R02 (P2) — N7 rebuilds HilbertModules H1–H3, now on main, while Scope says HilbertModules is not an input

**Location.**
- README 72–78: "module tensor products belong to HilbertModules, which is not an input here: … N7's Heisenberg module carries its inner product and completion on Mathlib's carriers."
- N7 1443–1448: "Build its A_θ-valued inner product … complete it for the module norm `‖⟨ξ,ξ⟩‖^(1/2)`. Build finite smooth projective frames".
- N7 1452–1454: "Complete the module after tensoring with L²(A_θ,τ), identify it with the scalar L²(ℝ) model".
- N7's *Needs:* (1546) names no HilbertModules section.

**Claim.** Mathlib's carriers suffice for the completion and the tensoring, so HilbertModules is not needed.

**Witness.**
- Neither pin has a completion or an interior tensor product for `CStarModule`. Mathlib's `Analysis/CStarAlgebra/Module/` holds only `Constructions`, `Defs` and `Synonym`, and none of them mentions `Completion`. No Tau Ceti file that mentions `CStarModule` mentions `Completion` or `TensorProduct`.
- HilbertModules is on main (6ee1f204, 8 Nov) and owns exactly these objects (`TauCetiRoadmap/HilbertModules/README.md`):
  - H1, 138: "Construct the completion of a pre-Hilbert module";
  - H2, 229–233: Parseval frames and `exists_parseval_frame_iff_finite_projective`;
  - H3, 286–291: the induced space `E⊗_B H_π` and the state localization `E⊗_A H_ω`.
- HilbertModules uses N7's own convention, `CStarModule Aᵐᵒᵖ E` (22–23).
- The README on main consumed "HilbertModules H1–H6 | … completions, … projective-module frames, tensoring representations" (main 58). This pull request dropped that row in 533fbe9c (1 Nov, "drop open-roadmap suppliers"), when HilbertModules was still a pull request.

**Repair.**
- Restore a supplier row "HilbertModules H1–H3":
  - H1: the completion of a pre-Hilbert module;
  - H2: Parseval frames and their frame projection;
  - H3: the induced Hilbert space `E⊗_{A_θ}L²(A_θ,τ)` as the state localization at τ.
- Add `HilbertModules H1–H3` to N7's *Needs:*.
- Rewrite 72–78 so that only the regular-operator bounded transform (H6) stays out of scope.
- N7 keeps as its own: the Heisenberg inner product and its positivity, the smooth frames and their trace θ, and the identification with the scalar L²(ℝ) model.
- Tested: a scratch copy with `HilbertModules H1–H3` in N7's *Needs:* gives `depcheck: … 0 problem(s)`. HilbertModules on main names NoncommutativeGeometry only as a supplier of its child HeisenbergImprimitivity (123).

## R03 (P3) — Two targets depend on later sections, and their *Needs:* lines cannot say so without a cycle

**Location.**
- N3 954–981, the external product of the two Hardy classes. Its witnesses:
  - 968–969: "the product is formed from the unbounded operators and their bounded transform";
  - 969–970: "identify x⊠_u y with N7's Fourier Dirac operator at θ=0";
  - 979–981: "N5 with λ₂=−1 and N7's spin factor 1/(4π) gives the Hochschild class".
  - Its Example clause is at 1002–1003.
- N1.Cyclic 550–558: "Prove its compatibility with S and N2's pairing", and "Prove these maps agree with … N2's closed periodic Chern chains and both pairings".

**Claim.** The N3 target needs only N1.Cyclic, N2 and the listed suppliers (N3's *Needs:*, 1012). The N1.Cyclic target needs only N1.Tensor and the listed suppliers (631).

**Witness.**
- The N3 target:
  - the bounded transform `D(1+D²)^(−1/2)` of `−i(σ₁δ₁−σ₂δ₂)` is built in N5 (1151–1156);
  - the p-summability for p>2 that defines `Ch(x⊠_u y)` is proved in N7 (1427–1428);
  - N5's *Needs:* is "N3, N4" (1231) and N7's is "N2–N6" (1546), so naming them in N3 creates the cycles N3→N5→N3 and N3→N7→N3.
- The N1.Cyclic target:
  - the odd Chern chains `ch_(2k+1)(u)` are constructed in N2 (722–724), and N2's *Needs:* is "N1.Cyclic" (782);
  - N2 730–740 already states the same constants `(−1)^kφ/(2k)!` and `(−1)^kφ/((2k+1)!(1+i)sqrt(π))` and the same agreement with the Chern chains.

**Repair.**
- Move N3 954–981, and the clause of 1002–1003 on the product of the two Hardy classes, into N7 after 1438. N7's *Needs:* (N2–N6) already covers N3 and N5. N3 keeps the single-circle calibration (919–922) and the point cycles.
- In N1.Cyclic, keep the column scalars `c_(2m)` and `c_(2k+1)` (552–554). Delete "and N2's pairing" (551) and "and with N2's closed periodic Chern chains and both pairings" (556–557).
- In N2 730–732, cite N1.Cyclic's constants instead of restating them.
- Test: afterwards, no N1 or N3 target names N2, N5 or N7. Two references remain and are fine: the attribution of a pinned object at 565, and the remark at 810.

## R04 (P3) — N6's holomorphic functional calculus has no supplier in any *Needs:* line

**Location.**
- N6 1298–1300: "so that `M_n(𝒜_θ)` is closed under inversion and holomorphic functional calculus in `M_n(A_θ)` (Mathlib's `CStarMatrix`)".
- N6's *Needs:* (1411) names Mathlib `cfc`, `CStarMatrix`, `CStarAlgebra` and `gnsStarAlgHom`.
- The supplier table row (348): "BanachAlgebras A1–A4,A6 | Banach-valued holomorphic calculus, spectra, …".

**Claim.** The holomorphic calculus comes from the supplier table.

**Witness.**
- The only *Needs:* lines naming BanachAlgebras (631, 646) cite A4 and A6. A1–A3 occur in no *Needs:* line.
- `cfc` is the continuous calculus of the normal elements. `a=[[1,1],[0,1]]∈M₂(𝒜_θ)` is not normal, so `cfc` gives nothing for it, while the holomorphic `f(a)` exists.
- The pin has the resolvent integrals over contour cycles: `TauCeti.Contour.Cycle.integral_smul_resolvent_eq_of_windingNumber_eq` (`TauCeti/Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Cycle.lean` 73) and `integral_pow_smul_resolvent` (153). The Tau Ceti contract does not list them.

**Repair.**
- Add the pinned resolvent integrals to the Tau Ceti contract and to N6's *Needs:*. Holomorphic closure of an inverse-closed Fréchet subalgebra needs only the integral and its independence of the cycle. Alternatively name BanachAlgebras A2.
- Drop A1 and A3 from row 348 unless a *Needs:* line uses them.
- Tested: a scratch copy with `BanachAlgebras A2` in N6's *Needs:* gives 0 problems.

## R05 (P3) — The description describes an earlier head and states no merge order

Carried from r18 R02. The description is unchanged.

**Location.** The pull-request description.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- N1.Tensor includes "Fréchet scalar-extension/balancing maps";
- "N2 retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "three intended prototype admissions";
- "which merge first: #864".

**Witness.**
- `git diff --stat origin/main...HEAD` changes `Suggested.lean` (52 insertions, 93 deletions), which has one `sorry` (62).
- README 956–958 name the two reductions `x⊠_u y` and `x⊠_s y`.
- 19–23 give the balancing and complexification maps to SmoothBanachRepresentations §7.2a.
- No *Needs:* line names AlgebraicKTheory.
- #864 is not among the 459 open pull requests.
- #1187 conflicts with this folder's `Suggested.lean` (overlaps). It pins Tau Ceti ab00ba392, an ancestor (19 Oct) of the current pin 2fd255d. At ab00ba392 the following are absent: `RingTheory/CyclicCohomology/PeriodicCohomology.lean`, `ExactSequence.lean`, `EvenPairing/AlgebraicK0.lean` and `Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean`. Its `Matrix.lean` has no `matrixExtension`.

**Repair.** Rewrite the description for this head:
- N3–N4 consume NoncommutativeIntegration §1.3–§1.6, §2.1 and VonNeumannAlgebras V4.Core;
- N6 builds `A_θ` on Tau Ceti's full crossed product;
- `Suggested.lean` states only `bijective_matrixExtension`;
- the two reductions are `x⊠_u y` and `x⊠_s y`;
- add the HilbertModules row of R02.

State the order:
- #866 merges after this pull request (R01);
- SmoothBanachRepresentations #1145 (18e94ff; its README 82 consumes "NoncommutativeGeometry N1's completed locally convex projective tensor … over 𝕜=ℝ and over 𝕜=ℂ") and LocallyConvexDuality #1782 (113–117) consume N1.Tensor over ℝ and ℂ, which only this revision provides, so both merge after it;
- #1187 rebases onto the current pin after this pull request, since `TauCeti.cyclicCohomology.matrixExtension` does not exist at its pin.

Drop the #864 line and the build report for 84190a1e.

## Previous findings

- r18 R01 — not repaired: README 50–56 and 1568–1570 are unchanged, and #866 is still at 1377338a with 1783–1784, 1796–1797 and 2324–2326 unchanged. Carried as R01.
- r18 R02 — not repaired: the description is byte-identical to the one r18 read. Carried as R05.
- No repair report marked any finding `not actionable in this package`, so nothing is re-raised.

## Verified sound

**Gate, dependency check, elaboration, signatures, padding.**
- `gate … --base origin/main` at 3571729: every scanner 0, `stray-files=0`, `outside-folder=0`, `OK`. PROGRESS.md, STATUS.md and metadata.toml are the generated files the folder has on main.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The dependency check (`--movable`) gives `depcheck: 235 roadmaps, 2257 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. An earlier run the same hour reported 236/2281, also with 0 problems.
- No gaps are declared.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0 with the single diagnostic `declaration uses sorry` at 62:8.
- `#check @TauCetiRoadmap.NoncommutativeGeometry.bijective_matrixExtension` in a scratch copy gives `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] (ι) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ)`. This is the generality of README 562–566, so nothing changed.
- One-tactic probe on a scratch copy: `simp` makes no progress, `rfl` fails, `infer_instance` does not apply, `aesop` fails, `decide` rejects the free variables, and `exact?` finds only the failed probe itself. The theorem is not padding.

**Headlines.** The Summary (8–12) names five end theorems:
- matrix Morita invariance: stated;
- the character index theorem (N3): not statable, since the pins have no trace on trace class and no Schatten classes for 0<p<1;
- the Hochschild-class theorem (N5): not statable, for lack of the Borel calculus, the spectral-triple carrier and a complex-linear Dixmier trace (`dixmierTrace : ℝ`, `DixmierTrace.lean` 91);
- the torus calculus and continuous HP (N6): not statable, since `SmoothNoncommutativeTorus` has no topology or derivations (`SmoothTorus/Basic.lean` has only algebraic instances: Ring 453, Algebra 463, StarRing 514);
- the Heisenberg index and the values (θ,1) (N7): not statable, for lack of a CStarModule completion (R02 witness).

The docstring says all of this.
- Stating only the trace coordinate (a projection of trace θ in `M_n(SmoothNoncommutativeTorus θ)`) would be a weakened substitute, so its absence is correct.
- The torus derivations would need real Leibniz proofs inside a definition, so they are not a simple definition.

**Sources: the seeded sample.** Seed 1143019 drew 15 of the 35 locators in the README; none is flagged unverified. Each was checked at the cached text: theorem number, page, hypotheses and support for the README's statement.

| Locator (README line) | Source text | Result |
|---|---|---|
| Grothendieck Ch. I n° 1, Théorème 1, p. 76; completed product, p. 77 (395–396) | `grothendieck52` lines 153–163, 180–183 (pages headed 76, 77) | ✓ universal property; completion is Banach for normed factors, (F) for metrizable ones |
| Same, p. 77, products and direct sums (410–411) | `grothendieck52` lines 201–209 | ✓ products for any F; finite sums are products |
| Connes III.3 Prop. 2, p. 229; `Sφ(e,…,e)=(m+1)φ(e,…,e)` (602–603) | `connes94` lines 8469–8472, identity in the proof at 8488–8490 (p. 230) | ✓ |
| Connes III.3 Props. 2–3, pp. 229–230, pairings and product law (672) | `connes94` lines 8469–8500, constant `1/√(2i)·2^(−n)Γ(n/2+1)^(−1)` at 8495, product law in the proof 8515–8532 | ✓ |
| Fack–Kosaki Thm. 4.2(ii) (833) | `fack-kosaki` lines 605–607 (p. 286): `Δ_t(TS)≤Δ_t(T)Δ_t(S)` | ✓ |
| Connes IV.1, p. 300, cyclicity on dual Schatten classes (850) | `connes94` lines 11261–11262 | ✓ |
| Connes IV.1, p. 299, `Tr′` (900) | `connes94` lines 11240–11243 | ✓ |
| Connes IV.1 Def. 3, p. 302 (915) | `connes94` lines 11343–11347 | ✓; the README negates the odd constant on purpose (1625–1628; Source issues) |
| Connes IV.1 Prop. 2, p. 300 (924) | `connes94` lines 11282–11284: `τ_(m+2)=−(2/(m+2))Sτ_m` | ✓ |
| Connes 1985 Part I App. 2 Prop. 5, p. 91 (943) | `connes85` lines 1794, 1802–1805 | ✓ index of the compression of F between `eH⁺` and `eH⁻` on idempotents |
| Connes IV.2 Def. 2, p. 312 (1045) | `connes94` lines 11754–11760 | ✓ (the source's `1/log N` and the README's `1/log(1+N)` give the same `Lim_ω`) |
| Connes IV.2 Prop. 3(b), p. 312 (1055) | `connes94` lines 11765–11767 | ✓ |
| Connes IV.2 Prop. 4, p. 313 (1103) | `connes94` lines 11789–11793 | ✓ |
| Connes III.2 Prop. 5(a)–(b), p. 217 (1392) | `connes94` lines 7977–7985 | ✓ dims 1, 2, 1 for irrational θ; (c) non-Hausdorff |
| Connes IV.6, p. 357, ∇ (1451) | `connes94` lines 13548–13560 | ✓ `∇₁ξ=−2πisξ/θ`, `∇₂ξ=dξ/ds`, θ in ]0,1] |

The headline locators outside the sample also verify:
- Connes IV.1 Prop. 4, p. 303 (`connes94` 11376–11379);
- IV.2 Thm. 8, p. 315, with hypotheses `D⁻¹∈L^(n,∞)`, `Sign D=F` and δ-smoothness (11865–11873);
- III.2 Thm. 7, p. 218 (7998–8008);
- Connes 1985 Part II Cor. 24, p. 113, unital algebras with a bimodule finite projective on both sides (`connes85` 2570, 2592–2594), and Part II's complex cochains, p. 94 (1880–1889).

**Adversarial pass.** Every value was recomputed for this review; the numerics used a scratch script.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 62; 562–587) | n=0; ι=∅; A=0; corner restriction | n=0: a trace T on `M_k(A)` has `T(aE_ij)=T(E_1j aE_i1)=δ_ij T(aE_11)`, so `T=τ∘Tr` with `τ(a)=T(aE_11)`: a bijection of traces. ι=∅: `HC⁰(M_∅(ℚ);ℚ)=0≠ℚ=HC⁰(ℚ;ℚ)`, so `[Nonempty ι]` is needed. A=0: both sides 0. `(φ#Tr)(a₀E_rr,…)=φ(a₀,…)` (`Matrix.lean` 275) | true | none |
| Index theorem, even (937–946) | point cycle on ℂ²⊕ℂ², `e=[[1,a],[0,0]]`; Connes's identity | Compression index 1 (line → 0); `Tr′(γπ(e))=½(Tr e+Tr(FγeF))=½(1+1)=1`; `e−eFeFe=−e[F,e]²e` (from F²=1, e²=e), so the index is `(−1)^m Tr(γe[F,e]^(2m))`, the pairing with `λ_(2m)/m!=(−1)^m` | true | none |
| Index theorem, odd, and `λ_n` (915–922) | Hardy F=2P−1, u=z | `[F,u]=2e₀e₋₁*`; `τ₁(u⁻¹−1,u−1)=2` (diagonal sum 2); `λ₁=−(1+i)√π/2`; pairing `(1+i)⁻¹π^(−1/2)·(−(1+i)√π/2)·2=−1=ind(PzP)=0−1`. With Connes's `+√(2i)`: +1 | true; Connes's sign is the source issue | none |
| Hochschild class (1198–1207) | Fourier triple at θ=0 | `Tr₂(σ₃σ₁σ₂)=2i`, `Tr₂(σ₃σ₂σ₁)=−2i`, so `Tr₂(σ₃[D,a][D,b])=2i(δ₁aδ₂b−δ₂aδ₁b)`; with `λ₂=−1` and `1/(4π)`: `−2i/(4π)=1/(2πi)`, so `φ_ω=φ` | true | none |
| HP of 𝒜_θ (1377–1381) | θ=0 | de Rham of 𝕋²: dims 1, 2, 1, so even = 1+1 = 2 and odd = 2, matching `HP^ev≃HP^odd≃ℂ²` | true | none |
| Diophantine condition (1388–1396) | README's `C(1+|n|)^k` against Connes's `O(n^k)` | equivalent for θ∉ℚ, since `|1−λ^n|>0` for each n≠0 and finitely many n go into C; rational θ is excluded | true | none |
| Heisenberg module (1440–1461) | chiral operator; curvature; relation; reversed generator | `−d/ds−2πs/θ` kills `exp(−πs²/θ)`; the adjoint's kernel `exp(πs²/θ)` is not in L², so index +1; `[∇₁,∇₂]ξ=2πiξ/θ`; Chern `(2πi)⁻¹(2πi/θ)θ=1`; `ξ·(U₂U₁)=e(θ)ξ·(U₁U₂)`; the reversed generator gives `−d/ds+2πs/θ`, index −1 | true | none |
| N1.Tensor Checks (423–452; L01, L03) | ℓ¹ pure tensor; ℓ² diagonal; `(x,y)↦xȳ` | one-term sum 1, two-term sum `2·1+1·1=3`; `Σ_(i<n)e_i⊗e_i`: n against √n; `1⊗i=i⊗1` mapped to −i and i | true | none |
| S normalization (600–609; L11) | m=1…5; signs at m=2 | `[4,2]_q=1+q+2q²+q³+q⁴`, at q=−1 the signs are + − + + − + with sum 2; `∏_(k≤m)[2k,2]_(−1)=1,2,6,24,120=m!`; unsigned 6 gives 6/2!=3 | true | none |
| Coboundary and cyclic sign (610–622) | M₂(ℂ); ℂ; circle | `(bTr)(e₁₂,e₂₁)=0`, `(b a₁₁)(e₁₂,e₂₁)=1`; the +1 variant gives 2 on ℂ; `ψ(z⁻¹,z)=1`, `ψ(z,z⁻¹)=−1`; `(bc)(1,…,1)=c(1−1)=0` | true | none |
| Odd constant (659–695; L12) | k=0…4; circle | `2^(−(2k+1))/Γ(k+3/2)=k!/((2k+1)!√π)`: 0.5641896, 0.0940316, 0.00940316, 6.71654e−4, 3.73141e−5 on both sides; `⟨[z^k],[ψ]⟩=k/((1+i)√π)` | true | none |
| Comparison constants, N1/N2 (552–554, 730–740; R03) | even and odd Chern chains | `(−1)^m/(2m)!·(−1)^m(2m)!/m!=1/m!`; `(−1)^k/((2k+1)!(1+i)√π)·(−1)^k k!=(1+i)⁻¹2^(−(2k+1))Γ(k+3/2)⁻¹` | true, stated twice (R03) | R03 |
| Bott class (697–702, 758–769) | z=0.3+0.7i, z=1.2−0.5i; orientation | `Tr(p∂_sp∂_tp−p∂_tp∂_sp)=0.801154i` against `2i/(1+|z|²)²=0.801154i`, and 0.276392i against 0.276392i; `∫r(1+r²)⁻²=0.500004` (cut at 2000), so +1.00001; the flip and 1−p give −1 | true | none |
| Path of idempotents (706–710) | `x=[e′,e]` | `e′=e′e+ee′` gives `ee′e=0`, so `[x,e]=e′e+ee′−2ee′e=e′` | true | none |
| Multiplicative majorization (862–867; L16) | S=diag(2,1), T=[[1,1],[0,1]] | μ(T)=(1.618034, 0.618034); μ(ST)=(2.920810, 0.684742), squares (9±√65)/2=8.531129, 0.468871; 0.684742>0.618034; products 2=2 | true | none |
| p-triangle and Hölder (858–870) | p=1/2; I₂ | `(1+2)²=9>5`, `3≤1+2`; `‖ST‖₁=4≤5`, `2=√2·√2` | true | none |
| Cyclicity on dual classes (881–889; L17) | weighted shifts | `ST=diag(0,1,2^(−11/10),…)`, `TS=diag(1,2^(−11/10),…)`, both of trace ζ(1.1)=10.584448; with exponent sum 2/3, `(j+1)^(−4/5)` is not summable | true | none |
| `Tr′` (900; L19) | Hardy T; unilateral shift | `½Tr(T+FTF)=Tr T=2`; `Tr(S*S−SS*)=1` | true | none |
| Compatibility with S (924; L22) | `λ_(m+2)/λ_m` | sign exponent rises by 2m+1 and Γ by (m+2)/2, so `λ_(m+2)/λ_m=−(m+2)/2`; `λ_(m+2)τ_(m+2)=λ_mSτ_m`, also for the odd factor | true | none |
| External product (954–981; R03) | W=(σ₁−σ₂)/√2; bounded tensor | W²=1, Wσ₁W=−σ₂, Wσ₂W=−σ₁, Wσ₃W=−σ₃; `((1+i)√π)²/(2πi)=1`; `[F₁,z₁]⊗1⊗σ₁` is rank one tensored with an infinite identity, so not compact | true, misplaced | R03 |
| `Tr_ω` (1045–1055; L27, L28, L29) | diag(1/(j+1)); finite rank R | `H_N/log(1+N)→1`; `(s−1)ζ(s)→1`; `Tr_ω(T+R)=1`; `σ_N(1/log N−1/log(1+N))→0` | true | none |
| `L^(1,∞)` against `S_(1,∞)` (1076–1082) | blocks at `N_k=2^(2^k)` | `(j+1)μ_j=2k` at `j=2N_k−1`; `σ_N≤(k+1)²+3≤(k+2)²` and `log(1+N)≥2^k log 2` | true | none |
| Non-measurable operator (1085–1097) | recursion; Cesàro mean | `r_k→2/3` (even k), 5/6 (odd k); `Tr_ω`=0.743683 and 0.756317 | true | none |
| Partial-sum norm (1029–1032) | `μ_j≤C(j+1)^(−1/p)` | `σ_N≤C·p/(p−1)·N^(1−1/p)`; `(j+1)^(1/p)μ_j≤(j+1)^(1/p−1)σ_(j+1)`: constants p/(p−1) and 1 | true | none |
| N5 Checks (1158–1182) | diag(0,1,−1); diag(1−1/(j+1)); ξ=(j+1)^(−3/2) | `F_D=diag(0,0.7071,−0.7071)`, `1−F_D²=diag(1,½,½)`; `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)`; singular values →1/√2; `Σj/(j+1)³<∞` but `Σ(1+j²)/(j+1)³=∞` | true | none |
| `A_θ` direction and unit (1235–1257; R01) | θ=1/4; c=2 | unfolded at the pin, `f((Circle.exp(−2πθ))⁻¹z)=f(exp(2πiθ)z)`; i at θ=1/4, −i for the other pullback; `δ₀⋆δ₀=cδ₀`, not idempotent at c=2 | true | R01 (owner) |
| `A_θ` universal property and injectivity (1258–1274) | B=ℂ; Haar state against evaluation at 1 | `UVU*=V` forces `exp(2πiθ)=1`: characters exist iff θ∈ℤ; the Haar state is faithful, while evaluation at 1 kills z−1 | true | none |
| τ on `A_θ` (1348–1352) | `v^m u^n`; evaluation at 1 | `τ=δ_((m,n),0)`; `exp(2πiθ)` on `uvu*`, 1 on `vu*u` | true | none |
| Seminorm comparison (1286–1297) | θ=0, a=1+U₁ | `P_m≤(2π)^m(Σ_(ℤ²)(1+|r|+|s|)^(−3))Q_(m+3)`, with the sum `≤1+Σ4k/(1+k)³<∞`; `Q_k≤3^k(‖a‖+(2π)^(−k)(‖δ₁^ka‖+‖δ₂^ka‖))`; Q₀=1, P₀=2 | true | none |
| Projection replacement (1301–1309, 1369–1375) | e=[[1,a],[0,0]]; a=1 | z=diag(1+aa*,1+a*a), p=diag(1,0), ep=p, pe=e; `s·(p+(1−e)(1−p))=1` both ways; `((e+e*)/2)²=[[5/4,1/2],[1/2,1/4]]` | true | none |
| Holomorphic closure (1298–1300; R04) | non-normal a=[[1,1],[0,1]] | `cfc` gives nothing; the contour integral exists | supplier missing | R04 |
| Fourier triple (1424–1431, 1511–1519) | r²=0,1,2,5,25; R=600 | lattice counts 1,4,4,8,12, so multiplicities 2,8,8,16,24; `σ/log(1+N)=0.14811` at N=2,261,824, rising like `(log R+O(1))/(π(2log R+log 2π))` to 1/(2π)=0.15915 | true | none |
| Module conventions (1496–1502; R02) | e₁₂, e₁₁ | `x*y=e₂₁`, Mathlib `y x*=0` (`Constructions.lean` 80); `⟪x,op(a)•y⟫=op(a)op(x*y)`; GNS `inner a b := f (star a * b)` (`GelfandNaimarkSegal.lean` 82) | true | R02 (supplier) |
| Odd modules and ν_j (1475–1488, 1520–1528) | ρ₁, ρ₂; compression | `V₊S=e(θ)SV₊`, `SV₋=e(θ)V₋S`; with V₊ in ρ₂, e(−θ); S on k<0: kernel `e₋₁`, cokernel 0, index +1; `⟨[U_k],φ_j⟩=2πiδ_jk/((1+i)√π)` | true | none |
| ∇ (1451; L35) | curvature | `[∇₁,∇₂]=2πi/θ` | true | none |

**Library declarations opened at the pins** (Tau Ceti 2fd255d; Mathlib as pinned).
- Elaborated by `#check` in a scratch file: the crossed-product contract (310–342); the Fredholm theorems (283–296); `TauCeti.derivationLieAlgebra`; Mathlib's `IsFredholm`, `FredholmPackage`, `IsFredholm.index_comp`, `LinearMap.index`, `CStarMatrix`, `PositiveLinearMap.GNS`, `gnsStarAlgHom`, `CStarModule`, `exists_dual_vector''`, `Matrix.transvection`, `GL` and `CStarAlgebra`.
  - `FullCrossedProduct (rotZ θ) Measure.haar` has its `NonUnitalCStarAlgebra` instance, and Haar measure on `Multiplicative ℤ` is `InnerRegularCompactLTTop`. At the pin `Multiplicative ℤ` has no `MeasurableSpace` instance, so the construction needs the local discrete one (`⊤`, Borel by `borel_eq_top_of_discrete`). That is an implementation step, not a finding.
- Read in source:
  - `RingTheory/CyclicCohomology/Matrix.lean`: 275, 413, 497 (`matrixExtension`), 522, 543, 551, 588;
  - `Bicomplex.lean` 781;
  - `Cohomology.lean` 273;
  - `UniversalDifferential/Cycle.lean` 305;
  - `Derivation.lean` 120, 209;
  - `SmoothTorus/Basic.lean` 180 (`twist` is `e(θ·y₂z₁)`, which is `exp(2πiθnm′)`), 561, 602;
  - `Topology/Algebra/Module/LinearPMap/Resolvent/Compact.lean` 68;
  - `Analysis/InnerProductSpace/LinearPMap/CompactResolvent.lean` 69–115 and `Eigenbasis.lean` 113;
  - `Analysis/OperatorIdeal/Family/Schatten.lean` 93, 101 (1≤p);
  - `TraceClass.lean` 59 (no trace functional anywhere in `Analysis/OperatorIdeal`);
  - `Logarithmic.lean` 163;
  - `Analysis/Normed/Order/GeneralizedLimit.lean` 76, 177;
  - `CategoryTheory/GrothendieckGroup/Exact.lean` 179;
  - `LinearAlgebra/Matrix/GeneralLinearGroup/Stable.lean` 155, 314;
  - `EvenPairing/AlgebraicK0.lean` 141; `OddPairing/AlgebraicK1.lean` 77;
  - `PeriodicCohomology.lean` 119; `Continuous/Cohomology.lean` 239;
  - `UniversalDifferential/ExteriorProduct.lean` 70, `Complex.lean` 45, `DGAlgebra.lean` 121;
  - `Analysis/Normed/Algebra/HolomorphicFunctionalCalculus/Cycle.lean` 73, 153.

**Cross-roadmap citations resolved.**
- On main at 623f5d6:
  - BanachAlgebras: A1–A8 are its Layers (181); A2 at 440, A4 at 1121, A6 at 1379;
  - OperatorIdeals: OI-A17 150, OI-A20 156, OI-A22 159, OI-A30 196, OI-B29–B30 349–351;
  - SelfAdjointSpectralTheory: SA-E 1202–1324;
  - NoncommutativeIntegration: §1.3 at 286 (p-triangle inequality, the metric, `‖bxc‖_p`, adjoint), §1.4 at 321 (Hölder with constant one, Fack–Kosaki 4.2(ii)), §1.5 at 360 (`μ_t=a_⌊t⌋`, S_p for 0<p<1, no inclusion for an infinite trace), §1.6 at 406, §2.1 at 453 (`τ(xy)=τ(yx)`);
  - VonNeumannAlgebras: V4.Core at 972;
  - BanachSpaceTheory: B4 at 239;
  - OperatorAlgebraDynamics: D1 148 (universal property 205), D2 221 (expectation 246, amenability 256, G=ℤ 278), D4 333 (G=ℤ 352).
- At the open heads:
  - SmoothBanachRepresentations #1145 has moved to 18e94ff. Its lines 9, 13, 82, 84, 466–478, 497 and 523–560 still match README 19–23, 96–100 and 1550–1555.
  - OperatorKTheory #866 at 1377338a: 7.5 (1828, 1868) matches README 57–62, and 6.6 (1477) has `index(PuP)=−1` like N3's calibration.
  - SpectralManifolds #1158 (7, 21) and CompactQuantumMetricSpaces #1155 (80, 288, 1523, 1539) consume the sections the README lists.
  - HeisenbergImprimitivity (51, 221–224, 547) consumes N6–N7.
  - LocallyConvexDuality #1782 (113–117) consumes N1 over ℝ and ℂ in Layer 5.
  - AutomorphicSpectralTheory #925 (334, 348, 370), AutomorphicSpectralTheoryPartII #1761 (463, 511), GanGrossPrasadUnitaryGroups #1404 (97, 368) and RefinedTraceMethods #1493 (59, 184) cite N1.

**Ownership and overlaps.**
- Fresh `roadmaps overlaps`: no id this README cites is dropped by an open pull request, none is defined only by a revision, and none is dropped here. The only conflicting head is #1187 (R05).
- The closest roadmaps by vocabulary (#1158, #866, #1077, #1149, #863) and OperatorAlgebraDynamics #1137 were read for ownership:
  - OperatorKTheory owns C*-algebraic `KK(A,ℂ)`; N3's Fredholm modules over general involutive algebras are distinct, and both roadmaps say so (#866 52; README 47–50).
  - IndexTheory and CStarClassification do not mention this roadmap's objects.
  - #1137 builds orbit representations of A_θ and cites OperatorKTheory for its convention, `α_n(f)(x)=f(x+nθ)`, which is N6's `f(exp(2πiθ)z)`.
  - The only second owners are #866 (R01) and HilbertModules on main (R02).

## Not verifiable

- Fack–Kosaki Thm. 4.9(iii), p. 295 (README 826–827): the heading and the hypothesis 0<p<1 are at `fack-kosaki` lines 863–871, but the displayed inequality is lost at the page break in the extraction. NoncommutativeIntegration §1.3 on main derives the same p-triangle inequality from Thm. 4.7(i).
- Connes IV.6, pp. 358–361 (elliptic index formula, cited for comparison only) was not read.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 with Proposition 4, pp. 302–303: the source says the odd character with constant `√(2i)(−1)^(n(n−1)/2)Γ(n/2+1)` pairs with K₁ to `Index(EuE)`, E=(1+F)/2; it should be minus that index: on the circle Hardy module `⟨[z],Ch⟩=+1` while `Index(PzP)=−1`; affects a stated result.
