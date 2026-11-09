# Review of NoncommutativeGeometry (pull request #1143 at f0b4904)

**Verdict:** needs changes

This is a full review of the folder at f0b49044, against the same pins as r13 (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9).

- The gate passes, the dependency check reports 0 problems, and `Suggested.lean` elaborates with only the `sorry` warning.
- Every value in the adversarial table matches the README.
- r13's R02 (N3–N4 consume NoncommutativeIntegration) and R05 (locators) are repaired.
- r13's R01, R03 and R04 are not repaired. The README text they cite is unchanged, and so are the other heads involved. They are carried below as R01–R03.

## R01 (P2) — `A_θ` is still claimed by N6, OperatorKTheory 7.4 and OperatorAlgebraDynamics' twisted group algebras

**Location.** `TauCetiRoadmap/NoncommutativeGeometry/README.md`, unchanged since r13:
- 50–55: "N6 alone owns the rotation C*-algebra `A_θ=C(𝕋)⋊_αℤ` … its universal presentation by two unitaries … and its faithful tracial state `τ=∫_𝕋∘E`, which OperatorKTheory's Pimsner–Voiculescu computation consumes."
- N6, 1195–1208.
- Downstream, 1488–1492.

**Claim.** N6 is the single owner of `A_θ`, its universal presentation, its faithful trace and its 𝕋² gauge action.

**Witness.** OperatorKTheory #866 (1377338a) 1782–1784 and 1796–1797 build `A_θ`, τ and the universal presentation; its 2324–2326 says this roadmap consumes "K7's rotation algebras". OperatorAlgebraDynamics #1137 (8daff1a8) 75–81 claims sole ownership of `C*(G,ω)`'s universal property, trace and gauge action.

**Check that these are one object.** Take `c((m,n),(m′,n′))=exp(2πiθnm′)`.
- Then `c((0,1),(1,0))=e^(2πiθ)` and `c((1,0),(0,1))=1`.
- So `W_(0,1)W_(1,0)=e^(2πiθ)W_(1,0)W_(0,1)`. This is N6's relation `U₂U₁=e^(2πiθ)U₁U₂` with `U₁=W_(1,0)` and `U₂=W_(0,1)`, and it is the same ordered multiplier as the pinned `SmoothNoncommutativeTorus`.
- Hence the universal property of `C*(ℤ²,c)` is N6's presentation.

**Why only one direction works.**
- OperatorAlgebraDynamics supplies N6: D1–D2 and D4 are in N6's *Needs:* at 1331, so it cannot cite N6.
- r13 showed that putting OperatorKTheory §7.4 in N6's *Needs:* is UPWARD.
- Each of the two open heads therefore hands the object to the other, or builds it itself.

**Repair.**
- **N6, 1195–1208.** Consume OperatorAlgebraDynamics D1.CentralTwists and D2.CentralTwists at L=ℤ², with trivial action and the cocycle c above. They supply the universal presentation, the faithful canonical trace and the 𝕋² gauge action.
- **What N6 keeps.** The identification of that instance with D1's crossed product `C(𝕋)⋊_αℤ` (`U₁=v`, `U₂=u`), which carries the injectivity of the coordinate copy of C(𝕋) and `τ=∫_𝕋∘E`.
- **Scope 50–55 and Downstream 1488–1492.** Say this, and name OperatorAlgebraDynamics as the owner OperatorKTheory consumes the algebra from.
- **Description.**
  - Name #1137 as merging first. D1.CentralTwists exists only at its head; main's OperatorAlgebraDynamics has no `CentralTwists`.
  - State that #866 replaces its 1782–1784 and 1796–1797 by a citation and corrects 2324–2326.
- **Test.** `roadmaps grep -i 'universal unitary presentation'` should then return nothing outside OperatorAlgebraDynamics. Today it returns OperatorKTheory 1796.

## R02 (P2) — The real completed locally convex projective tensor has two owners

**Location.** README:
- 345–347: "Fix 𝕜=ℝ or ℂ (`RCLike 𝕜`); every statement of this section is made for both fields."
- 1470–1472: "SmoothBanachRepresentations §7.3 consumes N1.Tensor's completed locally convex projective tensor at both fields …, its §7.2a owns only the two scalar-comparison maps".

**Claim.** N1.Tensor alone states the real case, and SmoothBanachRepresentations consumes it.

**Witness.** #1145 at 7d95047b, unchanged: line 76, "N1 is consumed for complex factors only. The real completed locally convex projective tensor … are targets of §7.2a"; line 460, "Build the same object here for real Hausdorff locally convex spaces".

**Repair.** The README needs no edit. In the description, state that #1145 rebases after this pull request and, at its head:
- line 9 and lines 74–76 cite N1.Tensor for both fields;
- §7.2a (458–468) keeps only the two scalar-comparison maps and the balancing quotient;
- lines 481–483 and 507 consume N1.Tensor at 𝕜=ℝ.

**Test.** `roadmaps grep 'Build the same object here for real'` should then return nothing. Today it returns #1145 line 460.

## R03 (P3) — The description describes an earlier head and states no order

**Location.** The pull-request description, carried from r13 R04, r12 R04, r11 R02, r10 R05 and r9 R03.

**Claim.** The description says:
- only the README changes and `Suggested.lean` is unchanged;
- the swapped reduction is "x×_K5 y";
- N2 retains AlgebraicKTheory as its "A0–A3 supplier";
- #1145 "consumes N1.Tensor in SB7";
- "which merge first: #864".

**Witness.** `git diff --stat origin/main...HEAD` shows `Suggested.lean | 145 +-`; README 918 writes `x⊠_s y`; N2's *Needs:* (742) cites no AlgebraicKTheory; #1145 line 76 is complex-only; #864 has merged; #1187 conflicts in this `Suggested.lean`.

**Repair.** Rewrite the description to match this head:
- N3–N4 now consume NoncommutativeIntegration §1.3–§1.6 and §2.1 on main.
- Add the ordering paragraphs of R01 (#1137 first; the changes #866 makes) and R02 (#1145 after).
- State that #1187's copy of this `Suggested.lean`, the old file with `Mathlib.*` sub-imports, is superseded and that #1187 rebases after this pull request.
- Drop the #864 line.

## Previous findings

| r13 finding | Status | Evidence at this head |
|---|---|---|
| R01 (`A_θ` three claimants) | Not repaired | Scope 50–55, N6 1195–1208 and Downstream 1488–1492 are unchanged in substance. OperatorKTheory is still at 1377338a. OperatorAlgebraDynamics has moved to 8daff1a8 with the same ownership claim (75–81). Carried as R01. |
| R02 (N3–N4 rebuild NoncommutativeIntegration's B(H) classes) | Repaired | See the details below this table. |
| R03 (real tensor, two owners) | Not repaired | #1145 at 7d95047b, lines 76 and 460, unchanged. Carried as R02. |
| R04 (description) | Not repaired | The description text is unchanged. Carried as R03. |
| R05 (N1.Tensor source; four headline locators) | Repaired | See the details below this table. |

**R02 repair, in detail.**
- Scope 74–86: "N3–N4 consume them at M=B(H) with its usual trace Tr: the Schatten quasi-ideals … (§1.3, §1.5); Hölder's inequality … (§1.4); the weak Schatten classes … (§1.6); and the trace cyclicity … (§2.1)".
- New supplier row (311). The OperatorIdeals row (310) is trimmed to "N3 adds the B(H) inclusions …; N4 the singular traces".
- N3 (783–812) consumes the quasi-ideals, Hölder and the cyclicity. It keeps the inclusions S_p⊆S_q for 0<p≤q and the k-fold product law.
- N4 (984–995) consumes §1.6 and keeps the partial-sum norm.
- *Needs:* lines 972 and 1080 are updated, and Fack–Kosaki is dropped from 972.
- How to read (325–331) is rewritten, and the Downstream bullet is gone.

**R05 repair, in detail.**
- N1.Tensor (355–379) cites Grothendieck 1952, Chapter I, n° 1, Théorème 1, p. 76 and p. 77. The References entry is at 1532–1542, and `grothendieck52` is in the manifest.
- The four inline locators are present:
  - N4 1063: IV.2 Proposition 4, p. 313;
  - N5 1167: Theorem 8, p. 315;
  - N6 1302 and 1312–1315: III.2 Theorem 7, p. 218, and Proposition 5(a)–(c), p. 217;
  - N7 1361 and 1371: IV.6, pp. 356–357.
- All of these were checked at the source (see below).

## Verified sound

**Gate and dependency check, run this round at f0b4904.**
- `gate … --base origin/main`: every scanner reports 0, then `OK`, the same as `scratch/gate.md`.
- `gate --depcheck … --movable`: `depcheck: 238 roadmaps, 2353 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/NoncommutativeGeometry'` is empty.
- The folder holds `README.md`, `Suggested.lean` and the generated `PROGRESS.md`, `STATUS.md` and `metadata.toml`.
- No gaps are declared and none are needed.
- NoncommutativeIntegration (on main, merge order 298) cites nothing from this roadmap, so the new supplier edge creates no cycle.

**Lean at the pins.**
- `lake env lean` on `Suggested.lean`: exit 0, with the single warning `declaration uses sorry` at line 62.
- `#check @bijective_matrixExtension` gives `[CommRing R] [Algebra ℚ R] [Ring A] [Algebra R A] [AddCommGroup M] [Module R M] [Fintype ι] [DecidableEq ι] [Nonempty ι]`. That is the pinned `cyclicCohomology.matrixExtension`'s binders plus `[Algebra ℚ R]` and `[Nonempty ι]`, matching README 522–527 and `signatures.md`. No binder is lost and nothing changed.
- One-tactic probe, run in a scratch file with the theorem not in scope: `first | simp | rfl | infer_instance | exact?` falls through to `sorry` on bijectivity and on injectivity, so the headline is not padding.
- Form: `import Mathlib` plus `TauCeti.RingTheory.CyclicCohomology.Matrix`, `theorem`, and no `set_option`, `lemma` or sorry'd data.
- The docstring's non-statable headlines (N3, N5, N6 periodic and Hochschild, N7) each still lack their carrier at the pin. Neither Mathlib nor Tau Ceti has a trace functional on trace-class operators; the only matches are `traceCLM` (finite-dimensional) and `traceFreePart`.

**Library declarations opened at the pins.**
- Tau Ceti `Analysis/OperatorIdeal/Family/Schatten.lean`:
  - `schatten` (48, `hp : 1 ≤ p`);
  - `gauge_schatten` (61);
  - `gauge_schatten_le_of_le` (93) and `finiteSubmodule_schatten_le_of_le` (101), both under `1 ≤ p`, `1 ≤ q`, `p ≤ q`, exactly as README 799–801 says.
- Tau Ceti, also opened:
  - `traceClass` (`…/TraceClass.lean` 59);
  - `dixmierTrace` (`…/DixmierTrace.lean` 91);
  - `cycleCocycle_trace` (`NoncommutativeGeometry/UniversalDifferential/Cycle.lean` 305);
  - `traceDerivationPairCocycle` (`RingTheory/CyclicCohomology/Derivation.lean` 209);
  - `quasiIsoAt_cyclicCochainComplexToTotal` (`…/Bicomplex.lean` 781, under `IsUnit (q+1)`);
  - `matrixCochainExtension_single` (elaborated: corner restriction is a left inverse).
- The other names of the Tau Ceti contract are unchanged since r13 and were opened there.

**Cross-roadmap citations resolved now.**
- Main 13665dde, NoncommutativeIntegration:
  - §1.3 (286–305): S_p for 0<p<1 with the p-triangle inequality, the complete p-metric, and the adjoint and ideal laws.
  - §1.4 (321–342): Hölder with constant one for p,q,r>0 and the log-submajorization (Fack–Kosaki 4.2(ii)–(iii)).
  - §1.5 (360–382): `μ_t=a_⌊t⌋` on B(H), "do not assert any inclusion for an infinite trace".
  - §1.6 (406–418): weak Lp on B(H) as `sup_j(j+1)^(1/p)a_j<∞`, with `S_(1,∞)` at p=1.
  - §2.1 (453–463): `τ(xy)=τ(yx)` for conjugate 1≤p<∞.
  - Downstream 1474–1478.
  These match supplier row 311 item by item. Its Downstream omits §2.1, which is that roadmap's text and not a defect here.
- Open heads:
  - OperatorKTheory 1377338a (44–56, 1782–1800, 2324–2326).
  - OperatorAlgebraDynamics 8daff1a8 (44–90, 3540–3600).
  - SmoothBanachRepresentations 7d95047b (9, 13, 72–76, 458–468, 481–483, 507). Line 13 matches Scope 88–93 on N6.
  - HeisenbergImprimitivity a9eeb6ec (15, 52, 183, 492, 786–815): consumes N6–N7, as Downstream 1485–1487 says.
  - CompactQuantumMetricSpaces 7db4c193 (80, 180, 288, 938–951, 1523): N5–N7, as 1480–1484 says.
  - SpectralManifolds b1e8fb72 (7, 21): N1–N2 and N4–N5, as 1480 says.
- `roadmaps grep` for locally convex projective tensor ownership finds only:
  - this roadmap;
  - #1145 (R02);
  - LocallyAnalyticDistributions and PadicLocalLanglandsForGL2Qp, which are nonarchimedean, as Scope 23–26 says;
  - consumers (AutomorphicSpectralTheory 329, GanGrossPrasadUnitaryGroups 99, LocallyConvexDuality 37).
- `overlaps.md`: there are no dropped ids and no ids that only a revision defines. #1187 is in R03.

**Sources.** The worker's seeded list of 15 is not in the scratch directory, so I verified every locator this head adds, plus the rest of the README's locators, at the cache. That is 18 targets:
- grothendieck52:
  - Théorème 1 (lines 153–163) and the normed projective norm with its isometric correspondence (164–172): p. 76.
  - The neighbourhood basis Γ(U⊗V) (175–179), the completion, which is Banach for normed factors and type (F) for metrizable ones (180–183), and products and direct sums (202–206): p. 77.
  - The setting of Hausdorff locally convex spaces (96–97). The text is a summary without proofs, as References 1534 says.
- connes94, Chapter III:
  - III.1 Theorem 12 (7223, p. 197) and Theorem 26 (7650, p. 208).
  - III.2 Proposition 5(a)–(c) (7980–7985, p. 217) and Theorem 7 (7998–8004, p. 218).
  - III.3 Proposition 3, with arguments `(u⁻¹−1,u−1,…)` and constant `(2i)^(−1/2)` (8493–8496, p. 230).
- connes94, Chapter IV:
  - Introduction: Definition 3, for p∈[1,∞[ (11135–11137, p. 296).
  - IV.1: `Tr′` (11242) and Proposition 1 (11252), p. 299; cyclicity with `1/p₁+1/p₂=1` (11262, p. 300); Proposition 2, `τ_(m+2)=−(2/(m+2))Sτ_m` (11282–11284, p. 300); Definition 3 (11343–11347, p. 302); Proposition 4 (11376–11379, p. 303).
  - IV.2: Definition 2, with `log N` (11754–11760, p. 312); Proposition 3(b) (11767, p. 312); Proposition 4 (11789–11793, p. 313); Theorem 8, with hypotheses `D⁻¹∈L^(n,∞)`, `Sign D=F` and δ-regularity (11865–11871, p. 315).
  - IV.6: the module (13549, 13552), θ∈]0,1] (13555) and `∇₁ξ=−2πisξ/θ`, `∇₂ξ=dξ/ds` (13560), pp. 356–357.
- connes85:
  - Part I, Appendix 2, Proposition 5 (1802–1805, p. 91).
  - Part II, p. 94 (1884–1886).
  - Corollary 24 (2592–2594, p. 113).
- fack-kosaki: Theorem 4.2(i)–(iii) (605–609, p. 286); Theorem 4.9(i)–(iii) (863–871, pp. 294–295).

**Adversarial pass.** Values were recomputed this round in pure Python (`scratch/py/adv14.py`, `scratch/py/hc.py`), with exact rational linear algebra for the headline.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `bijective_matrixExtension` (Lean 62; README 522–547) | ι=∅; n=0; A=R=M=ℚ, ι=Fin 2, n=0,1,2 | ι=∅: `M_∅(ℚ)=0`, HC⁰=0≠ℚ, so `[Nonempty ι]` is needed and present. n=0: `(φ∘Tr)(aE₁₁)=φ(a)`. M₂(ℚ): 4, 6, 24 cyclic cochains; 1, 3, 4 cocycles; b ranks 3, 3, 20; HC⁰⁻²=1,0,1 = `HC(ℚ;ℚ)`. Probe fails. | true, not padding | none |
| Ground-ring contract (232–236) | the constant c on (1,…,1) | b from even degree has coefficient `1−1=0`; b from odd degree has coefficient 1, with odd cochains in M[2], so `HC^(2k)=M⧸M[2]` (k≥1) and `HC^odd=0` | true | none |
| N1.Tensor cross property (363–369) | normed factors; ℓ¹ | Grothendieck p. 76: isometry `B(E,F;𝕜)≅(E⊗_πF)*` applied to `f(x)g(y)` of norm 1 gives `π(x⊗y)≥‖x‖‖y‖`; the representation `e₀⊗e₀=(e₀+e₁)⊗e₀−e₁⊗e₀` costs 3 against 1 | true | none |
| N1.Tensor over ℝ (345–347) | #1145 line 460 | both build the real construction | two owners | R02 |
| N1.Cyclic S-normalization (560–569) | m=2 | Koszul signs +,−,+,+,−,+ sum to 2=2!; unsigned count 6 gives pairing 3≠1 | true | none |
| N2 circle and Bott (651–662) | z^k, k=1,2,−1; z=0.6−0.8i | pairings `0.28209(1−i)`, twice that, its negative. `(1/((1+i)√π))²=−0.159155i=1/(2πi)`. `Tr(p dp∧dp)` coefficient `0.5i=2i(1+|z|²)⁻²`, so `(2πi)⁻¹·2i·2π·½=1` | true | none |
| N3 Hardy calibration (879–882) | F=2P−1, forward shift u, window k∈[−6,6) | `[F,u]` is nonzero only at e₋₁ (value 2), so `τ₁=2`. README's λ₁ gives −1 = ind(PuP); Connes' λ₁ gives +1 | true | source issue |
| N3 S-compatibility of λ_n (883–884) | m=0…5 | `λ_(m+2)·(−2/(m+2))/λ_m=1` exactly, against Connes Prop. 2 | true | none |
| N3 Clifford reductions (914–941) | Pauli matrices; A=(0.3+0.2i,−1.1+0.5i), B=(0.7−0.4i,0.25+0.9i) | W²=1, `Wσ₁W=−σ₂`, `Wσ₂W=−σ₁`, `Wσ₃W=−σ₃`. `Tr₂(σ₃[D,a][D,b])=0.94+0.93i=2i(A₁B₂−A₂B₁)`. `((1+i)√π)²/(2πi)=1`. `(−1)(2i)/(4π)=−0.159155i=1/(2πi)` | true | none |
| N3 quasi-ideals (consumed; Checks 815–821) | p=½, S=diag(1,0), T=diag(0,4) | norms 1, 4, 9>5; p-th powers 3=1+2 | true | none |
| N3 Hölder and majorization (consumed; Checks 822–830) | diag(2,1) with [[1,1],[0,1]]; 1500 random real 4×4 pairs | μ(T)=(1.618,0.618), μ(ST)=(2.921,0.685), so termwise fails at j=1 (0.685>0.618). Max of `∏μ_j(ST)/∏μ_j(S)μ_j(T)` is 1.0000002 (equality at the determinant). `‖ST‖₁=4≤5` | true | none |
| N3 kept: S_p⊆S_q for 0<p≤q (798–803) | 3000 random 6-term sequences, p<1 | max `‖T‖_q/‖T‖_p` is 0.9953≤1. The pin covers 1≤p≤q only (`Schatten.lean` 93, 101) | true | none |
| N3 kept: k-fold Hölder (796–798) | 1500 random 3×3 triples, p_j∈[0.2,3] | max `‖T₁T₂T₃‖_p/∏‖T_j‖_(p_j)` is 0.946≤1 | true | none |
| N3 dual-Schatten cyclicity (consumed; Check 841–849) | weighted shifts | S∈S₃∖S₂ (6/5>1, 4/5<1); T∈S_(3/2)∖S₁ (21/20>1, 7/10<1). Both traces equal `Σj^(−1.1)`: 8.0726 to 10⁶ plus tail, 10.5844 | true | none |
| N4 weak classes (consumed) and partial-sum constants (987–995) | μ_j=(j+1)^(−1/p), p=1.5, 2, 3 | max `N^(1/p−1)σ_N` is 2.886, 1.985, 1.498 against `p/(p−1)`=3, 2, 1.5 | true | none |
| N4 block operator (1036–1042) | N<65536 | non-increasing; `(j+1)μ_j` at j=2N_k−1 is 2, 4, 6 (unbounded); max `σ_N/log(1+N)` is 2.4853 | true | none |
| N4 ω-dependence (1045–1057) | the fixed points of `r_(k+1)=(r_k+c_k)/2` | `r_even=2/3`, `r_odd=5/6` exactly; `2/3+log2/9=0.74368`, `5/6−log2/9=0.75632` | true | none |
| N4 normalization against Connes Def. 2 (1005–1007) | log N against log(1+N) | the ratio tends to 1 and the means are bounded, so `Lim_ω` agrees; Connes' N=1 term 1/log 1 is a single ignored index | true | none |
| N4 non-normality (1016–1024) | rank-one ξ⊗η*; dim H<∞ | `⟨η,ρξ⟩=0` for all ξ, η gives ρ=0, while `Tr_ω(diag(1/(j+1)))=1`; in finite dimension `Tr_ω=0` | true | none |
| N5 Checks (1118–1142) | D=diag(0,1,−1); D=diag(j) | `(D−i)⁻¹=diag(i,(1+i)/2,(−1+i)/2)`, K=diag(1,½,½). `Σj/(j+1)³<∞` while `Σ(1+j²)/(j+1)³=∞` | true | none |
| N5 Hochschild class (1158–1167) | Theorem 8's hypotheses | `D⁻¹∈L^(n,∞)`, `F=Sign D` and δ-domains are the same on both sides; for n≥2, `μ_j(|D|⁻ⁿ)≤Cⁿ/(j+1)` puts it in `S_(1,∞)⊂L^(1,∞)` | true | none |
| N6 `A_θ` (1195–1208) | `C*(ℤ²,c)` | `c((0,1),(1,0))=e^(2πiθ)` and `c((1,0),(0,1))=1` give N6's relation | true | R01 (owner) |
| N6 Checks (1266–1296) | θ=½; a=U₁, b=U₂U₁⁻¹; e=[[1,a],[0,0]] | both products give −1; `ab=e^(−2πiθ)U₂`, `ba=U₂`. `ez=ze=ee*e` by expansion; z=diag(1+aa*,1+a*a), p=diag(1,0). Q₀=1, P₀=2 | true | none |
| N6 seminorm comparison (1220–1226) | `Σ_(ℤ²)(1+|r|+|s|)^(−3)` | `1+Σ_n 4n/(1+n)³<∞`; the derivation multipliers `2πi n_j` are independent of θ | true | none |
| N6 cohomology (1298–1318) | Connes III.2 | dims 1, 2, 1 for j≤2 under the Diophantine condition (Prop. 5(a)–(b)); non-Hausdorff otherwise (5(c)); HP≅ℂ² in both parities (Thm 7) | true | none |
| N7 Fourier triple (1335–1351, 1431–1439) | r²=0,1,2,5,25; mode (2,−3) | lattice counts 1, 4, 4, 8, 12, so multiplicities 2, 8, 8, 16, 24. D²=513.219=4π²·13; D⁺ entry 12.566+18.850i | true | none |
| N7 odd modules (1397–1408, 1440–1448) | compression on k<0 | kernel e₋₁ (dimension 1), cokernel 0, index +1; `ν_j(U_k)=((1+i)√π/(2πi))·2πiδ_jk/((1+i)√π)=δ_jk` | true | none |
| N7 Heisenberg (1360–1377, 1449–1454) | Gaussian | `−i(∇₁−i∇₂)=−d/ds−2πs/θ` kills `e^(−πs²/θ)`; `[∇₁,∇₂]ξ=(2πi/θ)ξ`, matching Connes 13560 | true | none |

## Not verifiable

- The worker's seeded list of 15 targets is not in the scratch directory, so I covered every locator instead (18 targets, listed above).
- Elaboration at #1187's Tau Ceti pin is not checked out in this worktree; see R03.

## Source issues

- **Error** in connes94 at Chapter IV §1, Definition 3 (odd case), p. 302, with Proposition 4, p. 303: the source says the odd character constant √(2i)Γ(n/2+1), paired through III.3 Proposition 3, gives the index of `EuE`; it should carry an extra factor −1, since the Hardy module with the forward shift pairs to +1 against index −1; affects a stated result.
