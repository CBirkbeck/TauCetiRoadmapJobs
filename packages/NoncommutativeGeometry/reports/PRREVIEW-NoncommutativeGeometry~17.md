# Review of NoncommutativeGeometry (pull request #1143 at f1b5581)

**Verdict:** needs changes

This is a full review of the head r16 read. Nothing in the folder, in `Suggested.lean` or outside the folder has changed since then. The other heads have moved:
- SmoothBanachRepresentations (#1145) has moved to 073a53da, and that move repairs r16 R02.
- OperatorKTheory (#866) is still at 1377338a, so r16 R01 stands.
- The description is unchanged, so r16 R03 stands.

The full pass found one more defect. The pinned Tau Ceti already has the full crossed product and the rotation action that N6 builds `A_θ` from, but the README takes them from OperatorAlgebraDynamics D1 instead (R02).

## R01 (P2) — `A_θ`, its presentation and its trace have two owners: N6 and OperatorKTheory 7.4

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 50–55: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` … its universal presentation … its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes".
- The same file, 1494–1496: "OperatorKTheory 7.4 consumes N6's rotation C*-algebra A_θ, its universal presentation, the injectivity of its coordinate copy of C(𝕋) and its faithful trace τ".

**Claim.** N6 is the only owner of `A_θ`, its presentation and τ, and OperatorKTheory takes them from N6.

**Witness.** OperatorKTheory #866 at 1377338a:
- 1784: "Define the canonical trace `τ=HaarIntegral∘E`".
- 1796: "A_θ has the universal unitary presentation … from Dynamics D1".
- 2326: this roadmap consumes "K7's rotation algebras".

Main's copy of this roadmap (line 477) also consumes "K7's universal rotation algebra". This pull request reverses that direction, and #866 has not followed.

**Repair.**
- **README: no edit.** N6 must stay the owner. A scratch copy with `OperatorKTheory §7.4` added to N6's *Needs:* (1337) gives `UPWARD: NoncommutativeGeometry (on main) -> OperatorKTheory (#9) at README lines [1337]`.
- **Description:** state that #1143 merges before #866. #866 then:
  - replaces its definitions at 1782–1784 and the bullet at 1796–1798 by a citation of NoncommutativeGeometry N6 (and of the pinned crossed product of R02);
  - rewrites Downstream 2324–2326.
- **Test.** After the repair these return nothing:
  - `roadmaps grep --fixed 'τ=HaarIntegral∘E'` (today #866:1784);
  - `roadmaps grep --fixed "K7's rotation algebras"` (today #866:2326).

## R02 (P3) — The pinned full crossed product and rotation action are not in the Tau Ceti contract; N6 takes them from OperatorAlgebraDynamics D1

**Location.**
- `TauCetiRoadmap/NoncommutativeGeometry/README.md` 1201–1209: "define the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` as OperatorAlgebraDynamics D1's full crossed product of the rotation `α(f)(z)=f(exp(2πiθ)z)` … D1's universal property integrates it".
- Also the Tau Ceti contract (178–308, which names no crossed product), the supplier-table row at 320, How to read the build (339–340) and N6's *Needs:* (1337).

**Claim.** The full crossed product, its canonical unitaries and its integrated representations come from D1.

**Witness.** The pinned Tau Ceti (2fd255d9) already has them:
- `Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean`:
  - `TauCeti.CStarAction.FullCrossedProduct`, a nonunital C*-algebra (276);
  - `FullCrossedProduct.of` (282), `starAlgHom_ext` (345) and `lift` (378);
  - `CovariantRepresentation.integratedFull` (417).
- `…/CrossedProduct/Multiplier.lean`: `coefficientMultiplier` (144), `groupMultiplier` (224) and the covariance `groupMultiplier_mul_coefficientMultiplier` (258).
- `…/Action/ContinuousMap.lean`: `CStarAction.rotation` (72), with `rotation t f z = f(exp(it)⁻¹z)` (76).
- `…/Action/Basic.lean`: the pullback `CStarAction.comp` (156).

**Repair.**
- Add a Tau Ceti contract bullet "Crossed products (N6)" listing these names with their modules.
- In N6, define `A_θ` as the pinned `FullCrossedProduct` of `CStarAction.rotation.comp` along `n ↦ −2πθn` (ℤ written multiplicatively, Haar measure). Take `v` as the coordinate function and `u` as the image of the generator under `groupMultiplier`.
- Cite D1 only for what the pin lacks: the universal property for covariant homomorphisms into an arbitrary C*-algebra. The pinned `lift` needs a bound by the full seminorm, and `integratedFull` works only on Hilbert spaces.
- Keep D2 for full = reduced and the faithful expectation, and D4 for the dual action.
- Add these names to N6's *Needs:*.

**Test.**
- At t=−2πθ, `rotation_apply_apply` gives `f(exp(−2πiθ)⁻¹z)=f(exp(2πiθ)z)`, which is α(f)(z).
- A scratch file defining this action and `FullCrossedProduct (rotZ θ) Measure.haar` elaborates at the pin, and the instance `NonUnitalCStarAlgebra` is found.

## R03 (P3) — The description describes an earlier head and states no merge order

**Location.** The pull-request description, which is unchanged since r16.

**Claim.** The description says:
- "Only the NCG README changes; Suggested.lean, topic and dependency pins are unchanged";
- "K5's fixed swapped reduction x×_K5 y";
- that N1.Tensor includes the "Fréchet scalar-extension/balancing maps";
- "[Smooth Banach #1145] … supplies generic SB8 analytic results to N6";
- that N2 "retains [Algebraic K-theory #1142] as its A0–A3 supplier";
- "three intended prototype admissions";
- "which merge first: #864".

**Witness.**
- `git diff --stat origin/main...HEAD` shows `Suggested.lean | 145 +-`.
- README 922–924 names the two reductions `x⊠_u y` and `x⊠_s y`.
- README 19–23 assigns the balancing maps to SmoothBanachRepresentations §7.2a.
- README 97–99: SmoothBanachRepresentations' inverse closure "is not an input here".
- N2's *Needs:* (748) names no AlgebraicKTheory.
- `Suggested.lean` has one `sorry`.
- #864 is not in the open index.

**Repair.** Rewrite the description to match this head:
- N3–N4 consume NoncommutativeIntegration §1.3–§1.6 and §2.1 and VonNeumannAlgebras V4.Core.
- `Suggested.lean` states only `bijective_matrixExtension`.
- The two Clifford reductions are `x⊠_u y` and `x⊠_s y`.
- N6 owns `A_θ`, and OperatorKTheory 7.5 owns its identification with `C*(ℤ²,c)`.
- Add the order:
  - #866 after this pull request (R01).
  - SmoothBanachRepresentations #1145 (073a53da, line 9) and LocallyConvexDuality #1782 (line 113) consume N1.Tensor over ℝ, which only this revision provides, so both merge after it.
  - #1187 conflicts with this folder's `Suggested.lean` (`overlaps.md`); its copy is main's old file, so #1187 rebases after this pull request.
- Drop the #864 line and the build report for 84190a1e.

## Previous findings (r16)

- **r16 R01 (`A_θ` two owners): not repaired.** README 50–55 and 1494–1500 are byte-identical. #866 is still at 1377338a, and its lines 1784, 1796 and 2326 are unchanged. Carried as R01.
- **r16 R02 (real tensor two owners): repaired by SmoothBanachRepresentations' new head 073a53da.**
  - Line 9 now reads "NoncommutativeGeometry N1 owns the rest of the completed locally convex projective tensor, over ℝ and over ℂ alike".
  - §7.2a (468) "builds no tensor product".
  - `roadmaps grep 'Build the same object here for real'` returns no match.
  - README 351–353 and 1476–1478 agree with that head.
- **r16 R03 (description): not repaired.** Carried as R03, with the new ordering facts.

No repair report exists for r16, so no finding is re-raised against a "not actionable" reason.

## Verified sound

**Gate, dependency check, elaboration and signatures.**
- `gate … --base origin/main` at f1b5581: every scanner reports 0, then `OK` (`set_option=0 … stray-files=0 dirty=0 outside-folder=0`). The worker's gate on the same head reports `build=0`.
- The dependency check prints `depcheck: 238 roadmaps, 2320 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` exits 0. Its only diagnostic is `declaration uses sorry` at 62:8.
- `#check @TauCeti.cyclicCohomology.matrixExtension` shows the binders `[CommRing R] [Module R M] [Ring A] [Algebra R A] [DecidableEq ι]`.
- The elaborated type of `bijective_matrixExtension` (`signatures.md`) keeps all of `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] [Fintype ι] [DecidableEq ι] [Nonempty ι]`. That is README 528–531's generality: a commutative ℚ-algebra, an R-module M, a nonempty finite ι and a unital A. No change.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty. The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- No gaps are declared.

**Headlines and padding.**

The README's end theorems (Summary 8–12) are:
1. Matrix Morita invariance (N1). Stated as `bijective_matrixExtension`.
2. The character index theorem (N3).
3. The Hochschild-class theorem (N5).
4. The torus calculus and periodic cyclic cohomology (N6).
5. The Heisenberg index and the trace/Chern values (N7).

The docstring names what each of 2–5 lacks at the pins:
- No trace on trace-class operators: Mathlib has no trace-class trace, and Tau Ceti has `traceCLM` (`Topology/Algebra/Module/Trace.lean:41`) only in finite dimension.
- No topology and no derivations on `SmoothNoncommutativeTorus` (`SmoothTorus/Basic.lean` 230–649).
- No Heisenberg module.

The two pinned headline forms the docstring names exist:
- `UniversalForms.cycleCocycle_trace` (`UniversalDifferential/Cycle.lean:305`);
- `traceDerivationPairCocycle` (`CyclicCohomology/Derivation.lean:209`).

One-tactic probe on a scratch copy:
- `simp` makes no progress.
- `infer_instance` fails ("type class instance expected").
- `exact?` finds no library lemma.

So `bijective_matrixExtension` is not padding. The pin has only injectivity at the cochain level (`matrixCochainExtension_injective`, `Matrix.lean:292`).

**Library declarations opened at the pins.**
- Tau Ceti `RingTheory/CyclicCohomology/Matrix.lean`: `matrixCochainExtension_single` (275), `…_hochschildCoface` (413), `matrixExtension` (497), `…_cyclicOperator` (522), `…_cyclicNorm` (543), `…_barContraction` (551), `…_connesB` (588).
- Tau Ceti `Bicomplex.lean:781`: `quasiIsoAt_cyclicCochainComplexToTotal`.
- Tau Ceti `SmoothTorus/Basic.lean`: `twist` (180), `twist_apply` (185), `U₂_mul_U₁` (561), `trace` (602).
- Tau Ceti `OperatorIdeal/Family/DixmierTrace.lean` (docstring): `Tr_ω(|T|)` on general T, the value 1 on `1/(j+1)`, and additivity under `IsDilationInvariant`.
- The Schatten inclusion lemmas `gauge_schatten_le_of_le` and `finiteSubmodule_schatten_le_of_le`.
- `LinearPMap.HasCompactResolvent`, `TauCeti.isFredholm_one_add`, the compact- and small-perturbation index theorems, `Path.index_eq`, `evenPairingK0`, `AlgebraicK1.oddPairing` and `derivationLieAlgebra`. Each was found at the pin.
- The crossed-product declarations of R02.
- Mathlib `exists_dual_vector''` (`Analysis/Normed/Module/HahnBanach.lean:85`, seminormed E over `RCLike`), `FredholmPackage`, `CStarMatrix`, `gnsStarAlgHom` and `CStarModule`.

**Cross-roadmap citations resolved.**
- **VonNeumannAlgebras V4.Core** on main (972–1056): the trace on S₁, basis independence, `Tr|x|=‖x‖₁`, cyclicity and B(H)≅S₁*.
- **NoncommutativeIntegration** on main:
  - §1.3 (286), with `‖bxc‖_p≤‖b‖‖c‖‖x‖_p`;
  - §1.4 (321), Hölder and log-submajorization;
  - §1.5 (360), `μ_t=a_⌊t⌋`, with no inclusion for an infinite trace;
  - §1.6 (406), weak Lp = weak Schatten;
  - §2.1 (453), cyclicity.
- **OperatorAlgebraDynamics** on main: D1 (148), D2 (221), D4 (333).
- **BanachAlgebras** on main:
  - A1–A8 are its layers (181).
  - A4's dual actions `(a·φ)(x)=φ(xa)` and `(φ·a)(x)=φ(ax)` give `(aφb)(x)=φ(bxa)`, as README 474–476 says.
  - A6 is at 1379.
- **BanachSpaceTheory B4** (239) on main.
- **OperatorIdeals** on main: OI-A17 (150), OI-A20 (156), OI-A22 (159), OI-A30 (196), OI-B29–B30 (349–351).
- **SelfAdjointSpectralTheory** on main: SA-E01 (1202).
- **Scope deferrals:** PadicLocalLanglandsForGL2Qp §0.1 (#1312, 206) and LocallyAnalyticDistributions §0.0 (#854, 892).
- **Downstream consumers:**
  - SmoothBanachRepresentations 073a53da (9, 82–84, 466–474);
  - LocallyConvexDuality #1782 (113, 139);
  - SpectralManifolds #1158 (7, 21: N1–N2, N4–N5);
  - CompactQuantumMetricSpaces #1155 and HeisenbergImprimitivity #1149 (N5–N7);
  - OperatorKTheory 7.5 (#866 1864–1872), the twisted-group identification with `W_(m,n)=v^m u^n`.
- **Ownership against open work** was checked by object in the sibling checkouts: tensors, `A_θ`, crossed products, Fredholm pairings and the Dixmier trace. The conflicts are R01 and R02.

**Sources: a seeded sample of 15 of the README's 39 locators (seed 1143017).** All 15 are verified at the cache:
- grothendieck52, p. 77 (lines 180–187): the completed product, Banach for normed and of type (F) for metrizable factors, and the universal property into complete G.
- grothendieck52, Théorème 1, p. 76 (153–172): the normed case, with the unique norm `inf Σ‖x_i‖‖y_i‖` making the correspondence isometric.
- connes94 III.1 Theorem 26, p. 208 (7650): the exact S–I–B triangle, with the README's directions.
- connes94 III.1 Theorem 12, p. 197 (7223–7227): the character of a tensor product of cycles.
- connes94 III.1 Lemma 14, p. 198 (7274). It defines S on cochains as an extension of `σ#φ`. The value `S^mτ(1,…,1)=m!` follows from Corollary 13's proof (7258) and from the second locator, III.3 Proposition 2(b), proof (8488–8490), which the README also cites.
- connes94 III.3 Proposition 2, p. 229 (8469–8472).
- connes94 III.3 Proposition 3, p. 230 (8493–8497): the constant `1/√(2i)·2^(−n)Γ(n/2+1)⁻¹`.
- connes94 III.3 Proposition 3, proof, pp. 230–231 (8531–8551): the path `U_t`.
- connes94 IV introduction, Definition 3, p. 296 (11135–11137): p∈[1,∞[.
- connes94 IV.1, p. 299 (11242–11243): `Tr′` and `Tr′=Tr` on L¹.
- connes94 IV.1 Proposition 1, p. 299 (11252).
- connes94 IV.1 Proposition 4, p. 303 (11376–11390): the proof represents the class by an idempotent and uses `P′=eP|eH⁺`.
- connes94 III.2 Proposition 5(a)–(c), p. 217 (7977–7985).
- connes94 IV.6, pp. 356–357 (13549–13555): the right action, with θ∈]0,1].
- connes94 IV.2 Proposition 3, pp. 312–313 (11765–11770).

Also opened: IV introduction, Proposition 2, p. 295 (11082–11100), with `ϕ([u])=Index(EuE)`, `E=(1+F)/2`; and IV.1 Definition 3, p. 302 (11346–11347).

**Adversarial pass.** Every value below was recomputed this round in pure Python (scripts in the scratch directory, seed 1143017). Exact linear algebra was done modulo 2³¹−1.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 62; README 528–553), headline | ι=∅; R=A=M=ℚ with ι=Fin 2, n=0…3 | ι=∅: `M_∅(ℚ)=0`, so HC⁰=0≠ℚ and `[Nonempty ι]` is needed. M₂(ℚ): cyclic cochains 4, 6, 24, 66; cocycles 1, 3, 4, 20; coboundaries 0, 3, 3, 20; HC=1,0,1,0, against HC(ℚ)=1,0,1,0. `σ₁#Tr=Tr(a₀a₁a₂)` raises rank B² from 3 to 4, so its class is nonzero | true, not padding | none |
| Ground ring (239–242) | product cochain c | odd degree: cyclic iff 2c=0, and b c=c; even degree: b c=c(1−1)=0. So HC^(2k)=M⧸M[2] for k≥1, HC^odd=0, HC⁰=M | true | none |
| N1.Tensor cross property and norm (361–375, 383–385; sampled p. 76) | ℓ¹; ℓ²; `Σ_(i<n)e_i⊗e_i` | the representation `(e₀+e₁)⊗e₀−e₁⊗e₀` costs 2+1=3 against the value 1; projective norm n against Hilbert norm √n | true | none |
| N1.Tensor completion (sampled p. 77) and field Check (404–411) | ℂ⊗ℂ with x·ȳ | `1⊗i↦−i`, `i⊗1↦i` on equal complex tensors; over ℝ the dimension is 4 | true | none |
| SBI (496; sampled Thm 26) | degrees n−1, n, n+1 | `S:HC^(n−1)→HC^(n+1)`, `I:HC^n→HH^n` and `B:HH^n→HC^(n−1)` match the source triangle | true | none |
| Exterior product (553–556; sampled Thm 12) | `(1⊗dy)(dx⊗1)` | Koszul sign −1; ψ₁#ψ₂ has coefficient `+(2πi)⁻²` on dx∧dy | true | none |
| S normalization (566–575; sampled Lemma 14 and III.3 Prop 2) | m=1…5; unsigned m=2 | signed shuffles give 1, 2, 6, 24, 120 = m!; signs at m=2 are +,−,+,+,−,+ (sum 2); unsigned 6, which gives pairing 6/2!=3≠1 | true | none |
| Coboundary and cyclic signs (576–588) | M₂(ℂ); smooth circle | `(bTr)(e₁₂,e₂₁)=0`; `a₁₁` gives 1; the +1 sign would give 2. ψ(z⁻¹,z)=1.0000, ψ(z,z⁻¹)=−1.0000 by quadrature | true | none |
| N2 pairings (621–662; sampled III.3 Props 2–3) | `z^k`, k=1, 2, −1 | ψ(z^(−k)−1,z^k−1)=1.0000, 2.0000, −1.0000; pairing at k=1 is 0.282095−0.282095i = 1/((1+i)√π) | true | none |
| Product law and homotopy (670–679; sampled Prop 3 proof) | the source path `U_t` | U₀=diag(uv,1), U_(π/2)=diag(u,v); constancy of `(φ#Tr)(U_t⁻¹,U_t,…)` | true | none |
| Odd Chern-chain constants (684–706) | n=1, 3, 5, 7 | `(1+i)⁻¹2^(−n)Γ(n/2+1)⁻¹` and `k!/((2k+1)!(1+i)√π)` both give 0.282095, 0.047016, 0.004702, 0.000336 (times 1−i) | true | none |
| Bott pairing (663–668, 724–735) | z=0, 1, 0.3−0.7i | `Tr(p dp∧dp)`=2.0000i, 0.5000i, 0.80115i against `2i(1+|z|²)⁻²`=2i, 0.5i, 0.80115i; `∫r(1+r²)⁻²`=0.500004, pairing 1.000008 | true | none |
| Product cocycle on q*β (708–718, 942–944) | constants | `((1+i)√π)⁻²`=−0.159155i=1/(2πi); `((1+i)√π)²/(2πi)`=1.0000 | true | none |
| p-summability (861–864; sampled Def 3) | p≥1 against 0<p<1 | the source has p∈[1,∞[; the README takes p<1 from NoncommutativeIntegration §1.3/§1.5 | true | none |
| `Tr′` and τ_n (865–877; sampled p. 299, Prop 1) | Hardy F=2P_H−1, u=z on ℓ²(ℤ) | `[P,u]=e₀e₋₁*`; τ₁(u⁻¹−1,u−1)=2 (truncated computation); `Tr′=Tr` on this rank-one T | true | none |
| Character sign (881–888) | n=1 | λ₁=−(1+i)Γ(3/2)=−0.886227−0.886227i; `⟨[u],Ch₁⟩=(1/((1+i)√π))·(−(1+i)√π)·1=−1=ind(P_H u P_H)`; Connes' +√(2i) gives +1 (Source issues) | true | none |
| Character index theorem (903–919; sampled Prop 4), headline | point cycle; Hardy | e=[[1,a],[0,0]]: index 1−0=1=Tr e; Hardy −1=−1 | true, not statable (docstring) | none |
| Clifford reductions (920–947) | W=(σ₁−σ₂)/√2; random scalars | Wσ₁W=−σ₂, Wσ₂W=−σ₁, Wσ₃W=−σ₃, W²=1; `Tr₂(σ₃[D,a][D,b])`=0.214743−0.658794i=2i(A₁B₂−A₂B₁); (−1)(2i)/(4π)=−0.159155i=1/(2πi) | true | none |
| N3 quasi-ideal Checks (821–859) | p=½; S=diag(2,1), T=[[1,1],[0,1]]; weighted shifts | ‖S+T‖_(1/2)=9>5; μ(T)=(1.618034, 0.618034), μ(ST)=(2.920810, 0.684742); ζ(11/10)≈10.5844 | true | none |
| Tr_ω properties (1015–1034; sampled Prop 3) | diag(1/(j+1)); 1/((j+2)log(j+2)) | value 1; `σ_(10⁶)`=3.4205 with ratio to log N 0.2476→0 | true | none |
| N4 block operator (1042–1048) | N≤N₄=65536 | non-increasing: true; (j+1)μ_j at 2N_k−1 = 2, 4, 6; max σ_N/log(1+N)=2.4853 | true | none |
| N4 ω-dependence (1051–1063) | fixed points; log-Cesàro means | r_even=2/3, r_odd=5/6; means 0.743683 and 0.756317 = 2/3+(log 2)/9 and 5/6−(log 2)/9 | true | none |
| N4 partial-sum norm (996–1001) | p=2, μ_j=(j+1)^(−1/2) | sup N^(−1/2)σ_N=1.99674 ≤ p/(p−1)=2 | true | none |
| N5 Checks (1124–1148) | D=diag(0,1,−1); bounded D | F_D=(0, 0.70711, −0.70711); 1−F_D²=(1, 0.5, 0.5); (D−i)⁻¹=(i, 0.5+0.5i, −0.5+0.5i); bounded resolvent singular values → 0.70711 | true | none |
| Hochschild class (1164–1173), headline | Fourier triple | λ₂·(1/(4π))·2i=1/(2πi), so φ_ω is N6's φ | true, not statable (docstring) | none |
| `A_θ` (1201–1212) | θ=0.3; pinned rotation at t=−2πθ | c((0,1),(1,0))=−0.309017+0.951057i=e(0.3), reversed set 1. Evaluation at 1 after E gives e(0.3) on uvu* and 1 on vu*u, so it is not a trace. `f(exp(−2πiθ)⁻¹z)=f(e(θ)z)`. Owners: N6 and #866 1784, 1796; the pinned carrier is unused | true | R01, R02 |
| N6 Checks (1273–1302) | θ=½, m=n=1; a=1 and a=U₁ | both products −1; the (0,1) coefficient of ab is e(−0.3) against 1; z=diag(1+aa*,1+a*a), p=diag(1,0); ((e+e*)/2)²=[[1.25,0.5],[0.5,0.25]]; z=2 at a=U₁ | true | none |
| Hochschild dimensions (1315–1323; sampled Prop 5) | Diophantine and not | H⁰=ℂ; dimensions 2 and 1 under `|1−λⁿ|⁻¹=O(n^k)`; otherwise infinite-dimensional and non-Hausdorff | true | none |
| HP of 𝒜_θ (1304–1308), headline | [1] | ⟨[1],Sτ⟩=τ(1)=1; φ(1,1,1)=0 since δ_j(1)=0 | true, not statable (docstring) | none |
| Fourier triple (1341–1364, 1437–1445) | mode (2,−3); R=100→400 | D⁺=2π(m−in)=12.566+18.850i; D² entry 513.219=4π²·13; multiplicities 2, 8, 8, 16, 24; Dixmier increment 0.159153 against 1/(2π)=0.159155 | true | none |
| Heisenberg module (1366–1387; sampled IV.6) | θ=0.37, ξ=e^(−s²)(1+s), s=0.3 | ξ(U₂U₁)/ξ(U₁U₂)=e(0.37); ∇₁-Leibniz −5.430766i on both sides; curvature 16.98158i=2πi/θ; chiral operator on exp(−πs²/θ) ≈ 10⁻⁹ | true | none |
| Trace/Chern values (1389–1414), headline | [1]; Heisenberg; odd modules | (1,0); (θ,(2πi)⁻¹(2πi/θ)θ)=(θ,1); V₊S=e(θ)SV₊ and SV₋=e(θ)V₋S at k=5; ν_j(U_k)=1,0,0,1 | true, not statable (docstring) | none |

## Not verifiable

- Elaboration at #1187's Tau Ceti pin (ab00ba392): that pin is not checked out in this worktree. Only the order is asked for (R03).

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 (odd case), p. 302, with Proposition 4 and Proposition 0.2, pp. 295 and 303: the source says its odd constant `√(2i)Γ(n/2+1)`, paired by III.3 Proposition 3, gives `Index(EuE)`; it should carry an extra factor −1, since the Hardy module with the forward shift pairs to +1 while `Index(EuE)=−1`; affects a stated result.
