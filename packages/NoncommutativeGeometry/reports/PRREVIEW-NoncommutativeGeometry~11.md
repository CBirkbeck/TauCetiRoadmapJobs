# Review of NoncommutativeGeometry (pull request #1143 at 1847a9a)

**Verdict:** needs changes

Full review of the folder at 1847a9a6 (171 changed lines since 6ef6efc2, the head the previous review read: 159 in the README, 12 in the `Suggested.lean` docstring). Pins: Mathlib 1b1ccf4b, Tau Ceti 2fd255d9 (the head's `lake-manifest.json`). Nothing outside the folder differs from `origin/main`. The gate passes. Of the previous review's five findings, three are repaired (R02–R04), one is partly repaired (R01: the README now says that N6 alone owns `A_θ`, but OperatorKTheory's head still builds it and the description does not name #866) and one is not repaired (R05, the description). No new mathematical defect was found: the idempotent index theorem, the Kaplansky projection replacement and the point-cycle Check all compute as stated.

## R01 (P2) — The rotation C*-algebra `A_θ` still has two owners: OperatorKTheory's head builds it and lists this roadmap as its consumer, and the description does not name #866

Location: `TauCetiRoadmap/NoncommutativeGeometry/README.md` lines 50–55 ("N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ … which OperatorKTheory's Pimsner–Voiculescu computation consumes") and 1392–1398 ("OperatorKTheory consumes N6's rotation C*-algebra A_θ, its universal presentation, …"); the pull-request description.

Claim: N6 is the single owner of `A_θ`, its universal presentation, the injectivity of its coordinate copy and its faithful trace, and OperatorKTheory consumes them.

Witness: OperatorKTheory at its head b328ec07 (`TauCetiRoadmap/OperatorKTheory/README.md`) still builds the same objects: lines 1771–1772 define `A_θ=C(𝕋)⋊_αℤ` with `uv=exp(2πiθ)vu` and `τ=HaarIntegral∘E`; lines 1784–1786 prove the universal unitary presentation, the injectivity of the coordinate copy and the faithfulness of τ with no irrationality hypothesis; lines 2315–2317 say that NoncommutativeGeometry consumes K1–K7, "and K7's rotation algebras with their K-groups". The description names neither #866 nor what must change there. An object two open roadmaps both own, each naming the other as consumer, is a P2 under the overlap rules.

Repair (the README needs no further edit): add to the description one paragraph saying that #866 (OperatorKTheory), before either pull request merges, replaces its §7.4 definition of `A_θ` and τ (head lines 1771–1772) and its presentation/injectivity/faithfulness bullet (1784–1786) by a citation of NoncommutativeGeometry N6, and drops NoncommutativeGeometry from its Downstream list (2315–2317), since this roadmap consumes nothing of K1–K7. After that, `roadmaps grep 'universal unitary presentation|universal for pairs of unitaries'` returns one owner.

## R02 (P3) — The description describes an earlier head and states no order with #1187

Location: the pull-request description (carried: r9 R03, r10 R05).

Claim: this pull request changes only the README and leaves `Suggested.lean` unchanged; the swapped reduction is `x×_K5 y`; N2 keeps AlgebraicKTheory as its A0–A3 supplier.

Witness:
- `Suggested.lean` is rewritten at this head (one headline, `module` header, `import TauCeti.RingTheory.CyclicCohomology.Matrix`; this round changed its docstring, b3fe6243 → 14278b66).
- README line 841 writes the swapped reduction `x⊠_s y`; N2's `*Needs:*` (line 652) and the supplier table (272–278) have no AlgebraicKTheory row; Scope 82–86 only defers its further theory.
- `scratch/overlaps.md` lists #1187 (the Tau Ceti bump) as conflicting in `TauCetiRoadmap/NoncommutativeGeometry/Suggested.lean`; the description does not mention it.

Repair: rewrite the description to match this head, and state that #1187's hunk on this file is superseded and that #1187 is rebased on this pull request (if #1187 merges first, re-elaborate the file at its pin).

## Previous findings

- **R01 (A_θ two owners): partly repaired.** Scope lines 50–58 now read "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` for every real θ, built on the crossed products of OperatorAlgebraDynamics D1–D2: its universal presentation …, the injectivity of its coordinate copy of C(𝕋) and its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes", and Downstream 1392–1402 says only what OperatorKTheory consumes and compares, with the Powers–Rieffel generator "built from continuous circle functions" as its own (this matches OperatorKTheory head line 1792). The third part of the repair, naming #866 in the description, is not done, and OperatorKTheory's head is unchanged: carried as R01.
- **R02 (index theorem only for projections): repaired.** Lines 821–829: "Prove the character index theorem on idempotents, with no replacement of idempotents by projections: for an idempotent e of `M_q(Ã)`, with e²=e and possibly e≠e*, and the amplified module `(H⊗ℂ^q, F⊗1, π⊗id)`, the even pairing with e is the index of `π(e)F⁺π(e):π(e)H⁺→π(e)H⁻` … whose quasi-inverse is the compression of F from π(e)H⁻ back to π(e)H⁺ (Connes 1985, Part I, Appendix 2, Proposition 5, p. 91; …)". N6 lines 1145–1153 add the projection replacement `z=1+(e−e*)*(e−e*)`, `p=ee*z⁻¹`, `s=e+(1−p)(1−e)`, `ses⁻¹=p`, with the Check at 1204–1210 on `e=[[1,a],[0,0]]` and the Example at 1232–1233. N7 lines 1294–1305 now split the two coordinates: reality by N6's replacement, integrality by N3's theorem on idempotents. The new locator, the algebra and the Check are verified below.
- **R03 (docstring entries): repaired.** `Suggested.lean` lines 29–35 now say the pin has "the real-valued `dixmierTrace`, which is Dixmier's trace on positive operators and `Tr_ω(|T|)` on a general operator `T`", and that the complex-linear Dixmier trace on `L^(1,∞)` is missing; lines 39–41 say "the Heisenberg-module index and the trace/Chern values `(θ, 1)` of N7 lack the Heisenberg module … and the derivations of `SmoothNoncommutativeTorus` that define the torus cocycle φ".
- **R04 (contract and `*Needs:*` lines): repaired.** Contract bullet 254–267 ("Fredholm perturbation (N3, N5, N7) …") names `TauCeti.isFredholm_one_add`, `ContinuousLinearMap.IsFredholm.add_of_isCompactOperator`, `ContinuousLinearMap.index_add_of_isCompactOperator`, `ContinuousLinearMap.IsFredholm.eventually_isFredholm_and_index_eq`, `Continuous.index_eq_of_preconnectedSpace` and `Path.index_eq`; N3's `*Needs:*` (895) lists the same six, N5's (1104) and N7's (1377) cite the contract, and N7's adds "N2–N6; Tau Ceti `ExactK0`, `evenPairingK0`, `AlgebraicK1` and `AlgebraicK1.oddPairing`" and `LinearMap.index`. All six declarations exist at the pin (below).
- **R05 (description, order with #1187): not repaired**; carried as R02.

## Verified sound

**Gate and dependency check (run this round at 1847a9a).**
- `gate … --base origin/main`: every scanner 0 (set_option, blob, latex, tex, prnum, sorry-data, sorry-examples, residue, private-paths, imports, mathlib-subimports, no-import-mathlib, lean-lines, statement-hygiene, forbidden, dropped, readme-ids-missing, empty-sections, round-labels, long-fences, layer-ids, target-ids, depcheck, metadata, stray-files, dirty, outside-folder, source-material), result `OK`; the worker's record adds `build=0`.
- `gate --depcheck … --movable`: `depcheck: 244 roadmaps, 2462 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md`, `metadata.toml`.
- Policy scan over both files (process words, pull-request numbers, LaTeX delimiters, "optional"/"deferred", machine paths): nothing. The README flags no locator as unverified. Declared gaps: none, none needed.

**Lean at the pins.**
- `lake env lean` on `Suggested.lean`: exit 0, the single warning "declaration uses `sorry`" (line 58).
- Scratch copy with `#check @bijective_matrixExtension`: the elaborated type is `∀ {R} [CommRing R] [Algebra ℚ R] {A} [Ring A] [Algebra R A] {M} [AddCommGroup M] [Module R M] (ι) [Fintype ι] [DecidableEq ι] [Nonempty ι] (n : ℕ), Function.Bijective ⇑(TauCeti.cyclicCohomology.matrixExtension M ι n)`, identical to `signatures.md` and to README 480–484; no binder lost; nothing changed.
- One-tactic probe on a separate scratch file (`first | simp | rfl | infer_instance | exact?`): fails (`exact?` could not close the goal), so the headline is not padding.
- Form: `module` header, `import Mathlib` plus `TauCeti.RingTheory.CyclicCohomology.Matrix` only, `theorem`, no `set_option`, no data, no `lemma`.
- The two pinned theorems the docstring cites exist: `UniversalForms.cycleCocycle_trace` (`NoncommutativeGeometry/UniversalDifferential/Cycle.lean` 305) and `traceDerivationPairCocycle` (`RingTheory/CyclicCohomology/Derivation.lean` 209); `cyclicCohomology.matrixExtension` is `RingTheory/CyclicCohomology/Matrix.lean` 497.

**Headline theorems** (README 8–12): matrix Morita invariance (N1) stated; the character index theorem (N3), the Hochschild-class theorem (N5), N6's periodic and Hochschild computations and N7's index and values are named in the docstring with what each lacks, and the reasons were checked at the pin last round and are unchanged at this pin (no trace functional on trace class, no Borel calculus of an unbounded operator, no topology or derivations on `SmoothNoncommutativeTorus`, no Heisenberg module, `dixmierTrace` real-valued).

**Library declarations opened at the pins this round.**
- Tau Ceti `Analysis/Fredholm/CompactPerturbation.lean`: `isFredholm_one_add` (72), `IsFredholm.add_of_isCompactOperator` (87), `index_add_of_isCompactOperator` (137), over `[NontriviallyNormedField 𝕜] [IsRCLikeNormedField 𝕜] [CompleteSpace 𝕜]` with complete E, F (59–61). `SmallPerturbation.lean`: `IsFredholm.eventually_isFredholm_and_index_eq` (57), F not required complete. `ContinuousFamily.lean`: `Continuous.index_eq_of_preconnectedSpace` (74), `Path.index_eq` (81). All state `ContinuousLinearMap.index`, which `Topology/Algebra/Module/ContinuousLinearMap/Index.lean` 68–72 defines as `LinearMap.index` of the underlying linear map, as the contract says (266–267).
- Mathlib: `LinearMap.index` (`Algebra/Module/LinearMap/Index.lean` 39); `IsFredholm` (`Normed/Operator/Fredholm/Basic.lean` 123); `IsFredholm.index_comp` (613).
- Duplication by object: the pins have no Fredholm module or spectral triple carrier (the only `Fredholm module`/`spectral triple` hits are docstrings in `LinearPMap/CompactResolvent`, `Eigenbasis`, `Resolvent/Compact`), no rotation algebra, Powers–Rieffel projection or Heisenberg module, and no idempotent-to-projection similarity: Mathlib's `Analysis/CStarAlgebra/Projection.lean` (49–120) characterises star projections among idempotents and does not construct a similar projection. N6's replacement is therefore this roadmap's.

**Cross-roadmap citations resolved now.**
- On main (3b3f7ef6): OperatorAlgebraDynamics D1 (75, universal property 128), D2 (143, faithful expectation 168), D4 (254, dual action 258); OperatorIdeals OI-A17 (150), OI-A20 (156), OI-A22 (159), OI-A30 (196), OI-B29–B30 (349–350); SelfAdjointSpectralTheory SA-E01–E03 (1202–1208); BanachAlgebras A1–A8 as layer labels (181), A4 (1160), Layer 6 Hochschild (1379); BanachSpaceTheory B4 (239, projective tensor 275–279); RandomMatrices §8.3 (984). IndexTheory, AlgebraicKTheory, OperatorKTheory, CStarAlgebras and NoncommutativeIntegration are not on main; they appear only in Scope and Downstream, never in a `*Needs:*` line or the supplier table, so the dependency check sees no edge.
- At their heads: SmoothBanachRepresentations (#1145) lines 9, 11, 64, 434, 442, 455–457, 480 consume N1 for complex factors and record N6 as owner of the torus estimates, matching Scope 73–78 and Downstream 1382–1386; HeisenbergImprimitivity (#1149) lines 15, 52, 183–184, 492–493, 786, 791 consume N6's `A_θ`, 𝒜_θ and trace and N7's module, matching Downstream 1389–1391; SpectralManifolds (#1158) 7, 21; CompactQuantumMetricSpaces (#1155) 80, 180, 288; NoncommutativeIntegration (#864) 1474 still says N3–N4 consume its Layer 1, the reverse of Downstream 1403–1406 (its own pull request's matter, as settled in r8); OperatorKTheory (#866) as in R01.
- `roadmaps resolve` found nothing missing. `overlaps.md`: no dropped ids, no revision-only ids; #1187 as in R02.

**Sources: the seeded sample (15 drawn with seed = head sha from the 32 distinct locator targets of the README), read at the cache.**
1. README 398, Connes III.1 Props 3–4, pp. 190–191: `connes94` lines 6905–6940 (page marker 190): universal one-forms on Ã⊗A and the cycle characterisation of cyclic cocycles.
2. README 498, III.1 Lemma 14, p. 198: lines 7274–7278 (page 198): `Sφ=(1/(n+3))A(σ#φ)`, equal to `σ#φ` on cyclic cocycles.
3. README 498, III.3 Prop 2, p. 229, with `Sφ(e,…,e)=(m+1)φ(e,…,e)`: lines 8469–8472 and 8488–8490 (pages 229–230).
4. README 608, III.3 Prop 3 proof, pp. 230–231: lines 8493–8520: the odd pairing with `1/√(2i)·2^(−n)Γ(n/2+1)^(−1)`, S-invariance, the product formula c), and the reduction of `χ(uv)=χ(u)+χ(v)` to `φ(1,…)=0` on p. 231.
5. README 729, Fack–Kosaki Thm 4.2(i)–(ii), p. 286: `fack-kosaki` lines 605–607 (cache page 19 = printed 286): Hölder with constant one for all positive exponents and `μ_t(TS)≤…` for τ-measurable operators; N3 uses the B(H) case.
6. README 827, IV.1 Prop 4, p. 303, and Prop 2, p. 295: lines 11376–11382 (page 303): `φ(x)=⟨x,Ch*(H,F)⟩`, the proof representing x by an idempotent `e∈M_q(Ã)`; lines 11082–11092 (page 295): the amplification `(H⊗ℂ^q, F⊗1, π⊗id)` and the index of `π⁻_q(e)F_qπ⁺_q(e)` for `e∈Proj(M_q(Ã))`, Connes' name for idempotents.
7. README 912, IV App. C, p. 453: lines 17381–17404 (page 453): `L^(p,q)` norms for p∈]1,∞[, `‖T‖_(1,∞)=sup_(N≥2)σ_N/log N`.
8. README 1411, Lemma 14, p. 198: as 2.
9. README 1413, III.3 Props 2–3, pp. 229–230: as 3–4.
10. README 1415, Prop 2, p. 295: as 6.
11. README 1419, IV.1 Def 3, p. 302: lines 11343–11347 (page 302): `λ_n=(−1)^(n(n−1)/2)Γ(n/2+1)`, times `√(2i)` in the odd case; the README's odd sign is minus this, recorded at 1438–1441.
12. README 1420, IV.2 Def 2, p. 312: lines 11754–11763 (page 312): `Tr_ω(T)=Lim_ω((log N)⁻¹Σ_(n<N)μ_n(T))` for T≥0, extended by linearity.
13. README 1421, IV.2 Thm 8, p. 315: lines 11865–11873 (page 315): `D⁻¹∈L^(n,∞)`, `Sign D=F`, δ-regularity of a and [D,a], and `⟨φ_ω,c⟩=⟨τ_n,c⟩` on Hochschild cycles.
14. README 1423, IV.6 pp. 358–361: lines 13588–13726 (pages 358–361): Theorem 3, the index formula for the elliptic operators `Σ C_αβ∇₁^α∇₂^β`, cited for comparison only.
15. README 1427, Connes 1985 Part I App. 2 Prop 5, p. 91 (new this round): `connes85` lines 1802–1808 (cache page 52 = printed 91, header "NON-COMMUTATIVE DIFFERENTIAL GEOMETRY 91"; the offset agrees with Cor. 24 at cache page 74 = printed 113): a unique additive map `K₀(A)→ℤ` whose value on every idempotent `e∈M_q(A)` is the index of `eF_q` from `eH⁺_q` to `eH⁻_q`, with parametrix the compression of F back; the module is a Fredholm module in Definition 1's sense (F²=1, F odd, [F,a] compact, lines 1737–1741), A trivially graded (1801). This is exactly the statement at README 821–829.

Every theorem number, page and hypothesis matches the README's use.

**Adversarial pass.** Values computed this round (scratch `adv11.py`, pure Python; random complex matrices for the algebraic identities). The rows cover the headline, the sampled targets, every changed passage and every target a finding touches.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 58; README 480–484) | ι=∅; ι=Fin 1; A=ℚ, n=0,1,2 | ι=∅: `M_∅(A)=0`, `HC⁰(0)=0` while `HC⁰(ℚ)=ℚ`, so `[Nonempty ι]` is needed and present; Fin 1: φ#Tr=φ; n=0: traces of M₂(ℚ) are spanned by Tr; probe (simp, rfl, infer_instance, exact?) fails | true, not padding | none |
| N6 projection replacement (1145–1153) | random non-self-adjoint idempotent e∈M₄(ℂ) of rank 2, `e=s·diag(1,1,0,0)·s⁻¹` | e²=e, e≠e*; `ez=ze=ee*e` true; `p=ee*z⁻¹`: p²=p, p*=p, ep=p, pe=e all true; `s s′=1` with `s′=p+(1−e)(1−p)`; `ses⁻¹=p`; Tr e=2.000=Tr p; min eigenvalue of z ≥ 1 | true | none |
| N6 Check (1204–1210) | `e=[[1,a],[0,0]]`, a a random 2×2 block; a=1 | `(e−e*)*(e−e*)=diag(aa*,a*a)`, `ee*=diag(1+aa*,0)`, `p=diag(1,0)` all true; a=1: `((e+e*)/2)²=[[1.25,0.5],[0.5,0.25]]`, `ee*=diag(2,0)`, z=2 | true | none |
| N3 index theorem on idempotents (821–829) vs Connes 1985 App. 2 Prop 5 | the quasi-inverse | `π(e)Fπ(e)·π(e)Fπ(e)=π(e)F²π(e)+π(e)F[π(e),F]π(e)=π(e)+compact` on π(e)H, since F²=1 and [F,π(e)] compact | true | none |
| N3 point cycle (872–877, 884) | ℂ²⊕ℂ², F swap, γ=diag(1,−1), π=id⊕0, `e=[[1,a],[0,0]]`, a=0.7+0.2i | F²=1, F*=F, Fγ=−γF; `π(e)H⁺=eℂ²` dim 1, `π(e)H⁻=0`, index 1−0=1; `Tr′(γπ(e))=½Tr(F(FT+TF))=1.000`; projection diag(1,0) gives the same | true | none |
| N7 joint map (1294–1305) | [1]; Heisenberg module, 0<θ<1 | [1]↦(1,0) since `ind(D⁺)=1−1=0`; Heisenberg: τ(Tr e)=θ, index +1 ⇒ (θ,1); in the basis Sτ, φ the character `aSτ+bφ` has a·1+b·0=0 and aθ+b=1, so Ch=φ; reality on idempotents by the row above | true | none |
| N2 smooth Bott (573–578) | z=0, 0.7−0.3i, 1.5+2i | `Tr(p dp∧dp)`: 2i, 0.80115i, 0.03805i = `2i(1+|z|²)⁻²` at each point; `∫r(1+r²)⁻²dr=0.49999`; pairing 0.99998 | true | none |
| N3 Hardy calibration (784–787) | F=2P−1, forward shift | `λ₁=−(1+i)Γ(3/2)=−0.88623(1+i)`; `τ₁=2`; `⟨[u],Ch₁⟩=(1+i)⁻¹·½·Γ(3/2)⁻¹·λ₁·2=−1.000`; `ind(PuP)=0−1=−1` | true | none |
| N3 Clifford reductions (829–866) | Pauli; `W=(σ₁−σ₂)/√2` | W²=1, Wσ₁W=−σ₂, Wσ₂W=−σ₁, Wσ₃W=−σ₃ all true; `((1+i)√π)²/(2πi)=1.000`; `(−1)(2i)/(4π)=−0.159155i=1/(2πi)` | true | none |
| N7 Fourier modes (1316–1322) | (m,n)=(2,−3); r²=0,1,2,5,25 | `D²=4π²(m²+n²)` true; D⁺ entry `12.566+18.850i=2π(m−in)`; lattice counts 1,4,4,8,12, doubled 2,8,8,16,24 | true | none |
| N7 `Tr_ω(|D|⁻²)=1/(2π)` (1256) | R=50,100,200,300 | `σ_N−(1/π)log R=0.1308, 0.1310, 0.1309, 0.1309` (constant), `N≈2πR²`, so `σ_N/log N=((1/π)log R+c)/(2log R+log 2π)→1/(2π)=0.15915` (0.14696 at R=300, the convergence being logarithmic) | true | none |
| N7 `ν_j(U_k)=δ_jk` (1305–1306) | j,k∈{1,2} | `φ_j(U_k⁻¹−1,U_k−1)=2πiδ_jk`; `(1+i)⁻¹·½·Γ(3/2)⁻¹·((1+i)√π/(2πi))·2πiδ_jk` = 1.000, 0, 0, 1.000 | true | none |
| N7 Heisenberg (1272–1283, 1348–1353) | θ=0.3, s=0.37 | chiral operator on the Gaussian: −0.0 (≈0); `[∇₁,∇₂]=2πi/θ=20.944i` | true | none |
| N7 odd modules (1307–1316, 1340–1347) | k | `(V₊S)e_k=exp(2πi(k+1)θ)e_(k+1)=exp(2πiθ)(SV₊)e_k`; compression of S to span{e_k:k<0} kills e₋₁, cokernel 0: index +1 | true | none |
| N6 trace and ordering Checks (1181–1199) | θ=½, m=n=1 | `exp(2πiθnm′)=−1` on both products; reversed-word inner product `exp(−2πiθnm)=−1` | true | none |
| N3 Checks (748–781) | S=diag(2,1), T=[[1,1],[0,1]]; p=½ | `μ(T)=(1.618,0.618)`, `μ(ST)=(2.921,0.685)`, `0.685>0.618`; `‖S+T‖_(1/2)=9>5`, powers 3≤3; `‖ST‖₁=4≤5`, `‖I₂‖₁=2=√2·√2` | true | none |
| N5 Checks (1038–1049) | D=diag(0,1,−1) | `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)`, `K=diag(1,½,½)`, `F_D=diag(0,0.7071,−0.7071)` | true | none |
| N4 non-measurable example (952–963) | — | `2/3+(log 2)/9=0.74368`, `5/6−(log 2)/9=0.75632` | true | none |
| App. C comparison constant (908–912) | `μ_j=(j+1)^(−1/2)`, N=10⁶ | `N^(−1/2)σ_N=1.99854<2=p/(p−1)` | true, sharp | none |
| Contract: pinned Fredholm theorems (254–267) | the six names | each exists at the file and line listed above; `ContinuousLinearMap.index` is `LinearMap.index` of the underlying map by definition | true | none |
| Ground ring (207–210) | R=ℤ, M=ℤ/2, k=1 | `M⧸M[2]=0`; `selfQuotEquiv` gives 0; degree 0 gives M | true | none |

## Not verifiable

- Elaboration of `Suggested.lean` at the Tau Ceti pin of #1187 (ab00ba392), which is not available in this worktree (R02).

## Source issues

- none
