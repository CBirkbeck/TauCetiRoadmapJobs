# Review of NoncommutativeGeometry (pull request #1143 at 6ef6efc)

**Verdict:** needs changes

Full review of the folder at 6ef6efc2 (247 changed README lines since 3eb6e72, the head the previous review read; `Suggested.lean` unchanged since then). Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 (head's `lake-manifest.json`). Nothing outside the folder differs from `origin/main`. The gate now passes, because this head deletes every CStarAlgebras and OperatorKTheory edge. That fixes the previous R01 but creates a second owner of the rotation C*-algebra (R01 below). It also leaves one step behind N7's K₀ claims that nothing supplies (R02). Three P3 remain.

## R01 (P2) — The rotation C*-algebra A_θ now has two owners, and this README and OperatorKTheory each name the other as consumer

Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 1075–1086 ("For every real θ define the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` … Prove, with no irrationality restriction, that A_θ is universal … Define the trace `τ=∫_𝕋∘E` and prove it is a faithful tracial state"), Scope 48–49, Downstream 1336–1342.

Claim: N6 owns the universal presentation of A_θ for every real θ, the injectivity of its coordinate copy and its faithful trace. OperatorKTheory "compares" with N6–N7, "with N7's Heisenberg module as the second generator".

Witness: OperatorKTheory at its head (`TauCetiRoadmap/OperatorKTheory/README.md`) builds the same objects in §7.4:
- lines 1711–1713 define `A_θ=C(𝕋)⋊_αℤ` with `uv=exp(2πiθ)vu` and `τ=HaarIntegral∘E`;
- lines 1725–1727 prove the universal presentation, the injectivity of the coordinate copy and the faithfulness of τ, with no irrationality hypothesis;
- lines 1733–1736 take its own continuous Powers–Rieffel projection as the second K₀ generator, not N7's module;
- lines 2240–2242 say that NoncommutativeGeometry consumes K1–K7, including "K7's rotation algebras".

On main this README's line 57 gave "all real-parameter rotation C*-presentations" to OperatorKTheory K7, so this head created the second owner. A third roadmap is caught between the two: HeisenbergImprimitivity's head (`TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/README.md`) cites N6 for A_θ and its trace (line 183) and gives the identification `C(𝕋)⋊ℤ≅C*(ℤ²,c)` to OperatorKTheory (line 827).

Repair: choose one owner and make both READMEs say the same.
- **Recommended (this folder keeps ownership).** The dependency check ranks this roadmap, which is on main, before OperatorKTheory, so N6 can stay the owner:
  - In Scope, after line 49, say that N6 alone owns the universal presentation of A_θ for every real θ, the injectivity of its coordinate copy and the faithful tracial state `τ=∫_𝕋∘E`, and that OperatorKTheory K7.4 consumes them.
  - Rewrite Downstream 1336–1342 to say only what OperatorKTheory does: it consumes N6's A_θ and τ, and it owns the comparison of its C*-K-groups, Kasparov cycles and index pairings with N2, N3 and N7. Drop "with N7's Heisenberg module as the second generator" unless OperatorKTheory adopts it.
  - In the pull-request description, name #866. Say that its §7.4 definition of A_θ and τ and its presentation bullet (head lines 1711–1713 and 1725–1727) become a citation of N6, and that its Downstream entry (2240–2242) stops listing K1–K7 as consumed, before either pull request merges.
- **Alternative (the previous review's placement route).** The board lists NoncommutativeGeometry after OperatorKTheory, and N6 cites K7.4 in place of lines 1075–1086.

Either way, afterwards `roadmaps grep 'universal unitary presentation|universal for pairs of unitaries'` should return a single owner. Today it returns both #866 line 1671 and #1143 line 1075 (index numbering).

## R02 (P2) — N7 claims integrality and reality on every class of the pinned K₀, but N3's index theorem is stated only for projections

Location: README line 801 ("Prove the character index theorem: the even pairing with a projection e is the index of `π(e)F⁺π(e)`"), lines 1243–1248 ("on the pinned K₀ of finitely generated projective 𝒜_θ-modules is a homomorphism to ℝ×ℤ, its second coordinate an integer on every class … by N3's index theorem"), and Scope 39–41 ("the replacement of idempotents by projections … belong[s] to OperatorKTheory").

Claim: every class of the pinned algebraic K₀ of 𝒜_θ has real trace and integral Chern pairing, by N3's index theorem.

Witness: in M₂(𝒜_θ), `e=[[1,a],[0,0]]` with a≠0 is an idempotent with e≠e*. It represents a class of the pinned `ExactK0`, but N3's theorem does not apply to it as stated. The Scope sends the idempotent-to-projection replacement to OperatorKTheory, which is not an input. The removed OperatorKTheory K1–K3 edge used to supply this step. N3's own definition (line 688) and Connes IV.1 Prop 4, p. 303 (`connes94` lines 11376–11381) both work with idempotents e∈M_q(Ã). Connes IV.1 Prop 2 a), p. 295 (`connes94` lines 11087–11092) defines the compression on the range of an idempotent.

Repair:
1. At line 801, state the theorem for idempotents: for an idempotent e∈M_q(Ã), the even pairing is the index of `π⁻_q(e)F_qπ⁺_q(e)` from `π⁺_q(e)H⁺_q` to `π⁻_q(e)H⁻_q` (Connes IV.1, Prop 2 a), p. 295; Prop 4, p. 303).
2. In N6, after spectral invariance, add: every idempotent e∈M_n(𝒜_θ) is similar there to the projection `p=ee*(1+(e−e*)*(e−e*))⁻¹`, whose inverse lies in M_n(𝒜_θ) by spectral invariance. Then ep=p and pe=e, so `τ(Tr e)=τ(Tr p)≥0` is real.

Tested on the witness: `(e−e*)*(e−e*)=diag(aa*,a*a)`, `ee*=diag(1+aa*,0)`, so p=diag(1,0) and τ(Tr p)=1=τ(Tr e).

## R03 (P3) — Two not-statable entries in the `Suggested.lean` docstring disagree with the README and with the pin

Location: `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean` line 38 ("the Heisenberg-module index and the K₀ range computation of N7 lack …") and line 31 ("the logarithmic ideal and the Dixmier traces are at the pin").

Claim: (a) N7 has a K₀ range computation as a headline; (b) the Dixmier trace that φ_ω needs is at the pin.

Witness:
- (a) The README Summary (line 12) now lists N7's "trace/Chern values", and Scope line 42 gives the trace range ℤ+θℤ to OperatorKTheory.
- (b) At Tau Ceti 2fd255d9, `dixmierTrace` (`Analysis/OperatorIdeal/Family/DixmierTrace.lean` line 91) is real-valued and equals `Tr_ω(|T|)` on a general T (its docstring, lines 30–31). For T=−diag(1/(j+1)) the pin gives 1, while the linear Dixmier trace that φ_ω evaluates (README 1044, built in N4, 900–901) gives −1.

Repair:
- Line 38: "the Heisenberg-module index and the trace/Chern values `(θ,1)` of N7 lack the Heisenberg module with its completions and the derivations of `SmoothNoncommutativeTorus` that define φ".
- Line 31: "the logarithmic ideal and the positive Dixmier trace are at the pin; its complex-linear extension to L^(1,∞), which φ_ω evaluates on non-positive operators, is not".

## R04 (P3) — The inputs that replace the removed OperatorKTheory K4 edge, and N7's direct inputs, are missing from the contract and the `*Needs:*` lines

Location: Tau Ceti contract, README lines 157–260; N3 `*Needs:*` line 860; N7 `*Needs:*` line 1322; References lines 1397–1399.

Claim: the contract and the `*Needs:*` lines list everything N3 and N7 consume.

Witness:
- N3 uses compact perturbation and Fredholm compressions (lines 674–684, 805–807). OperatorKTheory K4 used to supply this. At the pin it comes from `TauCeti.isFredholm_one_add`, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator` and `ContinuousLinearMap.index_add_of_isCompactOperator` (`Analysis/Fredholm/CompactPerturbation.lean` lines 64–137). These modules are named only in References 1397–1399, not in the contract or in line 860.
- N7 uses N2's constants (1251–1252) and the pinned K-groups and pairings (1243–1264), but line 1322 lists neither N2 nor the Tau Ceti K-theory declarations.

Repair:
- Add a contract bullet: "Fredholm perturbation (N3, N5): `TauCeti.isFredholm_one_add`, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator`, `ContinuousLinearMap.index_add_of_isCompactOperator` (`Analysis/Fredholm/CompactPerturbation`)". Add the same to N3's `*Needs:*`.
- Add "N2; Tau Ceti `evenPairingK0` and `AlgebraicK1.oddPairing`" to N7's `*Needs:*`.

## R05 (P3) — The previous review's R03 is not repaired: the description states no order with #1187 and describes an earlier head

Location: the pull-request description.

Claim: this pull request's `Suggested.lean` replaces the file on main.

Witness:
- `scratch/overlaps.md` still lists #1187 (the Tau Ceti bump) as conflicting in `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean`. #1187 carries main's old file (`CyclicTwoCocycle`, `torusTwoCochain`, `Mathlib.<submodule>` imports).
- The description does not mention #1187.
- The description still says "Only the NCG README changes; Suggested.lean … unchanged", "K5's fixed swapped reduction x×_K5 y" and "N2 retains Algebraic K-theory #1142 as its A0–A3 supplier". This head replaced `Suggested.lean`, renamed the reduction x⊠_s y and has no OperatorKTheory or AlgebraicKTheory supplier edge.

Repair:
- State that #1187's hunk on this file is superseded and that #1187 is rebased on this pull request. If #1187 merges first, re-elaborate this file at its pin.
- Name #866 as R01 requires.
- Rewrite the description to match this head.

## Previous findings

- **R01 (gate failed on UPWARD CStarAlgebras/OperatorKTheory edges): repaired**, at the cost of R01 and R02 above.
  - The supplier rows `[CStarAlgebras C1–C5]` and `[OperatorKTheory K1–K7]` are gone (table, lines 264–270).
  - Every `*Needs:*` item citing them is gone (lines 658, 860, 1071, 1192, 1322).
  - Matrices and the functional calculus now come from Mathlib `CStarMatrix` and `cfc` (148–149, 658). The index comes from `LinearMap.index` (144–145, 807).
  - N3 defines its Fredholm modules directly (662–666), N6 builds A_θ from OperatorAlgebraDynamics D1–D2 (1075–1086), and N2 defines its own smooth Bott projection (637–645).
  - The dependency check prints `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)` and the gate ends `OK`.
- **R02 (ground-ring contract): repaired.** Lines 207–210 now read "`HC^(2k+1)(R;M)=0`, `HC^0(R;M)≅M`, and `HC^(2k)(R;M)≅M` for `k≥1` when multiplication by 2 is injective on `M` (in general … `M⧸M[2]`)". This matches `RingTheory/CyclicCohomology/GroundRing.lean` at the pin: module docstring; `mkPiRing_zero_injective` line 283; `selfEquiv` line 297 with `IsSMulRegular M 2`; `selfQuotEquiv` line 318 for even n≠0.
- **R03 (order with #1187): not repaired**; carried as R05.

## Verified sound

**Gate and dependency check (run this round at 6ef6efc).**
- `gate … --base origin/main`: every scanner 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material). Result `OK`. The worker's record adds `build=0`.
- `gate --depcheck … --movable`: `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- The policy scan (process words, pull-request numbers, LaTeX delimiters, "optional"/"deferred") over both files finds nothing.
- Declared gaps: none, and none needed.

**Lean at the pins.**
- `lake env lean` on `Suggested.lean` exits 0 with the single warning "declaration uses `sorry`" (line 54).
- On a scratch copy with `#check @bijective_matrixExtension`, the elaborated type is `∀ {R} [CommRing R] [Algebra ℚ R] {A} [Ring A] [Algebra R A] {M} [AddCommGroup M] [Module R M] (ι) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ), Function.Bijective ⇑(TauCeti.cyclicCohomology.matrixExtension M ι n)`. This is identical to `signatures.md` and to README 459–463. No binder is lost; nothing changed.
- One-tactic probe, in a separate file without the theorem: `simp` "made no progress"; `rfl` fails (the source `↑(cyclicCohomology R (Matrix ι ι A) M n)` is not defeq); `exact?` "could not close the goal". So the theorem is not padding.
- Form: `module` header, `import Mathlib` plus `TauCeti.RingTheory.CyclicCohomology.Matrix` only, `theorem`, no `set_option`, no data.

**Headline theorems** (README 8–12):
1. Matrix Morita invariance (N1): stated.
2. The character index theorem (N3): not statable. The pin has no trace on trace class; `traceClass` at `Family/TraceClass.lean` 59 is an ideal family, and `schatten` needs `1 ≤ p` (`Family/Schatten.lean` 48).
3. The Hochschild-class theorem (N5): not statable. It needs N3's character and the linear Dixmier trace (R03).
4. N6's calculus and HP: not statable. `SmoothTorus/Basic.lean` has no topology, seminorm or derivation. N6's algebraic cocycle is the pinned `traceDerivationPairCocycle`, which the docstring cites.
5. N7's index and values: not statable. The `Heisenberg` hits at the pin are Lie, group and A∞ files, not a module over A_θ.

The universal-form realization is the pinned `UniversalForms.cycleCocycle_trace`, also cited in the docstring.

**Library declarations opened at the pins.**
- Mathlib: `LinearMap.index` (`Algebra/Module/LinearMap/Index.lean` 39, `finrank ker − finrank (N⧸range)`); `CStarMatrix` (`Analysis/CStarAlgebra/CStarMatrix.lean` 45); `IsFredholm` (`Normed/Operator/Fredholm/Basic.lean` 123); `FredholmPackage` (178); `IsFredholm.index_comp` (613); `PositiveLinearMap.GNS` (`GelfandNaimarkSegal.lean` 147); `gnsStarAlgHom` (246); `CStarModule` (`Module/Defs.lean` 73).
- Tau Ceti: `GroundRing.lean` (as above); `DixmierTrace.lean` 30–31 and 91; `Fredholm/CompactPerturbation.lean` 8–60 and 64–137; `LinearPMap/` (`CompactResolvent`, `Eigenbasis`, `Cayley`); `BorelCalculus/` (bounded only). Tau Ceti's `Algebra/CrossedProduct/*` is the algebraic Galois crossed product, so the pin has no C*-crossed product or rotation algebra.
- The contract declarations listed by the previous review are unchanged at this pin.

**Cross-roadmap citations resolved now.**
- On main:
  - OperatorIdeals: OI-A17 (150), OI-A20 (156), OI-A22 (159), OI-A30 (196), OI-B29–B30 (349–350).
  - SelfAdjointSpectralTheory: SA-E01–E10 (1202–1225). These cover the spectral PVM and projections, not an unbounded Borel calculus, so N5's eigenbasis calculus is not a duplicate.
  - BanachAlgebras: Layer 6, bounded Hochschild (1379).
  - BanachSpaceTheory: B4 (33–38).
  - RandomMatrices: §8.3 (984).
  - OperatorAlgebraDynamics: D1 universal property (128) and the line "Operator K-theory consumes crossed products" (69–70); D2 amenability ⇒ `A⋊G≃A⋊rG` (177–178) and the faithful expectation (168); D4 dual action (254).
- At their heads:
  - SmoothBanachRepresentations: lines 9, 11, 64, 434 (§7.2a), 455–457 (§7.3), 482 (Layer 8). These consume N1 for complex factors and record N6 as owner.
  - SpectralManifolds: 7, 21.
  - CompactQuantumMetricSpaces: 80, 176, 278.
  - HeisenbergImprimitivity: 15, 52, 183, 492, 786, 794.
  - OperatorKTheory: as in R01. Its K5.1 Clifford model (`e₁↦[[0,1],[1,0]]`, `e₂↦[[0,i],[−i,0]]`, swapped `e⊗1↦e₂`, `1⊗e↦e₁`, 1077–1082) is identical to N3's 809–812. Its K6.6 Hardy value `⟨[z],[2P−1]⟩=−1` (1401–1405) agrees with N3's 786.
  - CStarAlgebras: no mention of this roadmap.
  - NoncommutativeIntegration: line 1474 still says that N3–N4 consume its Layer 1, the reverse of this README's 69–74. That pull request should update it. It is not a defect of this folder: this roadmap is the earlier owner of the B(H) case, as settled in the previous round.
- `roadmaps resolve` found nothing missing. `overlaps.md`: no dropped ids, no revision-only ids; #1187 as in R05.

**Sources: the seeded sample (15 drawn with seed = head sha) plus three added (Connes 1985 Cor. 24, Connes III Thm 12, the new III.3 Prop 3 proof locator), read at the cache.**
1. `connes94` III.1 Props 3–4, pp. 190–191 (lines 6905, 6933–6950): universal one-forms, and a cocycle is a character iff it is cyclic. Connes's `τ(a₁,…,a_n,a₀)=(−1)ⁿτ(a₀,…)` is equivalent to README 392.
2. III.1 Lemma 14, p. 198 (7274–7278) and Cor. 13 (7246–7258, `(φ#ψ)(e,…)=((m+m′)!/(m!m′!))φψ`): gives `S^mτ(1,…,1)=m!`.
3. III.3 Prop 2, p. 229 (8469–8472), with the proof's `Sφ(e,…,e)=(m+1)φ(e,…,e)` on p. 230 (8488–8490): matches README 479, 533.
4. III.3 Props 2–3, pp. 229–230 (8469, 8493–8500): the odd constant `1/√(2i)`; matches 537 with `√(2i)=1+i`.
5. III.3 Prop 3 proof, pp. 230–231 (8515–8553): the smooth path `U_t` and `d/dt(φ#Tr)(U_t⁻¹,U_t,…)=0`; supports README 587–589.
6. Fack–Kosaki Thm 4.9, pp. 294–295 (`fack-kosaki` 863–880): (iii) is the p-triangle inequality for 0<p<1, on p. 295. Thm 4.2(i)–(iii), p. 286 (605–609).
7. `connes94` IV.1 p. 300 (11261–11263): `Tr(T₁T₂)=Tr(T₂T₁)` for `T_j∈L^(p_j)`, `1/p₁+1/p₂=1`.
8. IV App. C, p. 453 (17381–17404): the `L^(p,q)` norms with p∈]1,∞[, and `‖T‖_(1,∞)=sup_(N≥2)σ_N/log N`.
9. III Thm 26, p. 208 (7650): the SBI triangle is exact.
10. III.2 Prop 5, p. 217 (7980–7985), and Thm 7, p. 218 (7998–8008): the Diophantine condition `|1−λⁿ|⁻¹=O(n^k)`, equivalent to README 1173–1174; dimensions 1, 2, 1; bases Sτ, φ, φ_j with `δ_j(U^ν)=2πin_jU^ν`. Vanishing above degree 2 is the README's own two-step target.
11. IV.1 Def 3, p. 296 (11135–11146): p∈[1,∞[, `L^p`, the Hölder corollary.
12. IV.1 Prop 2, p. 300 (11282–11284): `τ_(m+2)=−(2/(m+2))Sτ_m`.
13. IV.1 Prop 4, p. 303 (11376–11381): the index map equals `⟨x,Ch*⟩`, with x represented by an idempotent (used in R02). Prop 2, p. 295 (11082–11100): the matrix amplification on idempotents of `M_q(Ã)`.
14. IV.2 Def 2, p. 312 (11754–11762), and Props 3–4 (11765–11793).
15. IV.2 Thm 8, p. 315 (11865–11877): `D⁻¹∈L^(n,∞)`, `Sign D=F`, δ-regularity, and `⟨φ_ω,c⟩=⟨τ_n,c⟩`.
16. IV.6, pp. 356–357 (13549–13560): `(ξU₁)(s)=ξ(s+θ)`, `(ξU₂)(s)=exp(2πis)ξ(s)`, `∇₁=−2πis/θ`, `∇₂=d/ds`, θ∈]0,1].
17. `connes85` Part II Cor. 24, printed p. 113 (line 2592): Morita invariance for a bimodule finite projective on both sides.
18. `connes94` III Thm 12, p. 197 (7223–7227): the cup product, and the character of a tensor product of cycles.

Every theorem number, page and hypothesis matches the README's use.

**Adversarial pass.** Values computed this round (scratch `adv10.py`, pure Python with numerical derivatives). The rows cover the headline, the sampled targets, the changed passages and every target a finding touches.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 54; README 459–463) | ι=∅; ι=Fin 1; R=A=M=ℚ, ι=Fin 2, n=0,1,2; A=0 | ι=∅: `M_∅(A)=0`, so `HC⁰(0)=0` but `HC⁰(ℚ)=ℚ`: `[Nonempty ι]` is needed. Fin 1: φ#Tr=φ. n=0: id↦Tr, which spans the traces of M₂(ℚ). n=1: 0→0. n=2: `(σ#Tr)(1,1,1)=Σ_i 1=2≠0`, nonzero class. A=0: 0→0. Probe fails (simp, rfl, exact?) | true as stated; not padding | none |
| N2 smooth Bott check (573–578, new) | z=0, 0.7−0.3i, 1.5+2i, −2+0.5i | `Tr(p dp∧dp)`: 2i, 0.801154i, 0.038050i, 0.072562i, equal to `2i(1+|z|²)⁻²` at each point. `∫r(1+r²)⁻²=0.50000`, pairing `1.0000`. For 1−p: −2i, −0.801154i, so −1. `Tr(dp∧dp)=0`. `p²=p`, and `p(z,1)ᵀ=(z,1)ᵀ` | true | none |
| N2 torus Bott (618–628, new) | — | `(2πi)⁻²·2πi=−0.159155i`; `(1/((1+i)√π))²=−0.159155i`; the coordinate flip gives the negative | true | none |
| N2 circle Check (567–572) | k=1 | `(1+i)⁻¹·½·Γ(3/2)⁻¹·1=0.28209(1−i)=1/((1+i)√π)` | true | none |
| N2 smooth idempotent path (582–586, new) | e′e+ee′=e′ | `[[e′,e],e]=e′e+ee′−2ee′e=e′`, since `ee′e=0` | true | none |
| N3 Hardy calibration (784–787) | F=2P−1, u shift | `[P,u]=e₀⊗e₋₁*`, `u⁻¹[F,u]=2P_(e₋₁)`, `Tr′=2`; `⟨[u],Ch₁⟩=−1.000`; `ind(PuP)=0−1=−1` | true | none |
| N3 product reductions (808–835) | Pauli; W=(σ₁−σ₂)/√2 | W²=1, Wσ₁W=−σ₂, Wσ₂W=−σ₁, Wσ₃W=−σ₃ all true; `−σ₂=[[0,i],[−i,0]]` (= OperatorKTheory's e₂); `Tr₂(σ₃[D,a][D,b])−2i(A₁B₂−A₂B₁)=1.6e−16`; `((1+i)√π)²/(2πi)=1.000`; `(−1)(2i)/(4π)−1/(2πi)=0` | true, ±1 as stated | none |
| N3 index theorem on idempotents (801; R02) | e=[[1,a],[0,0]] | e²=e and e≠e*; Kaplansky p=diag(1,0), ep=p, pe=e; τ(Tr p)=1=τ(Tr e); the theorem as stated covers only projections | gap | R02 |
| N6 rotation algebra (1075–1086; R01) | θ=0.3; θ=½, m=n=1 | covariance `Uf(V)U*=f(λV)=α(f)(V)`; `τ(v^mu^n)=δ_((m,n),(0,0))`; trace values −1=−1; `ev₁∘E`: `exp(0.6πi)=−0.309+0.951i` against 1, so not a trace | true; second owner | R01 |
| N6 multiplier witness (1138–1143) | (0,1),(1,0), θ=0.3 | `exp(2πiθ)=−0.309+0.951i`; reversed multiplier gives 1 | true | none |
| N7 joint map (1243–1250; R02) | [1]; Heisenberg, θ∈(0,1) | (1,0); (θ,1) from τ(Tr e)=θ and index +1; lattice ⊆ image; integrality on idempotent classes needs R02 | conditional on R02 | R02 |
| N7 ν_j(U_k) (1251–1252) | j=k | `φ_j(U_j⁻¹−1,U_j−1)=2πi`; `ν_j(U_j)=1.000` | true | none |
| N7 Heisenberg (1221–1237, 1305–1310) | θ=0.3, s=0.37 | chiral operator on the Gaussian: −8.7e−11≈0; `[∇₁,∇₂]=20.94395i=2πi/θ`; `ξU₂U₁/ξU₁U₂=exp(2πiθ)` | true | none |
| N7 Fourier modes (1287–1292) | (m,n)=(2,−3) | `D²=4π²(m²+n²)` true; D⁺ entry `12.566+18.850i=2π(m−in)` | true | none |
| Contract ground ring (207–210) | R=ℤ, M=ℤ/2, k=1 | README `M⧸M[2]=0`; pin `selfQuotEquiv` gives 0; degree 0: `M`, injective | true | none |
| Connes III.3 Prop 2 vs README 476–485 | m=2 | Cor. 13: `S²τ(1,1,1)=2!/(1!1!)=2=σ₂(1,1,1)`; `S²τ/2!` on [1] is 1 | true | none |
| Connes IV.1 Def 3 vs README 780–782 | n=1 | Connes odd `λ₁=+0.8862(1+i)`; README `−0.8862(1+i)` (opposite sign, recorded at 1380–1383) | consistent | none |
| Connes IV.1 Prop 2 (S-compatibility) | m=2 | `λ₄/λ₂=Γ(3)/(−Γ(2))=−2=−(m+2)/2`, so `λ₄τ₄=λ₂Sτ₂` | true | none |
| Connes App. C vs README 877–880 | μ_j=(j+1)^(−1/2), p=2 | `N^(−1/2)σ_N=1.99854` at N=10⁶, below the bound p/(p−1)=2 | true, sharp | none |
| Fack–Kosaki 4.9(iii) vs README 729–732 | p=½, diag(1,0), diag(0,4) | `‖S+T‖_(1/2)=9>5`; powers 3≤3 | true | none |
| Connes p. 300 cyclicity vs README 758–761 | unilateral shift | `Tr(S*S−SS*)=1≠0` | true | none |
| Connes Thm 8 vs N7 (833–835, 1217–1219) | torus | `φ_ω=−1·2i/(4π)·τ(⋯)=(2πi)⁻¹τ(⋯)=φ` | true | none |
| N4 Dixmier trace in the docstring (R03) | T=−diag(1/(j+1)) | pin `dixmierTrace=Tr_ω(|T|)=1`; linear `Tr_ω(T)=−1` | docstring inaccurate | R03 |
| N4 non-measurable example (927–939) | — | `2/3+(log 2)/9=0.74368`, `5/6−(log 2)/9=0.75632`; fixed points of `r↦(r+c)/2` are 2/3 and 5/6 | true | none |

## Not verifiable

- Elaboration of `Suggested.lean` at the Tau Ceti pin of #1187 (ab00ba392), which is not available in this worktree (R05).

## Source issues

- none
