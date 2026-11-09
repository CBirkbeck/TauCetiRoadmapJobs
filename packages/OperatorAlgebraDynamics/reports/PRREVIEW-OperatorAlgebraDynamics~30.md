# Review of OperatorAlgebraDynamics (pull request #1137 at df96497)

**Verdict:** needs changes

This is a full review of head df96497. I read all 4079 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` and all 417 lines of `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` (the Lean file is byte-identical to the one the previous review read; only the README changed, by 406 lines). The folder itself is clean: every finding of the previous review that concerned the folder is repaired, every new locator resolves to the stated theorem with matching hypotheses, and the adversarial pass found nothing to change. The two findings below are the two carried from the previous reviews, both outside the folder: the branch still deletes six files of other roadmaps, so the gate fails, and the description still states no merge order with #1187. Neither can be repaired by an edit inside the folder; both are the author's. No acceptance is possible while the gate fails.

## Previous findings (review of 895d9b8)

- **R01 (six deleted files outside the folder): not repaired.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` still lists the six deletions (159 lines). Carried as R01 below.
- **R02 (Busby–Smith Check was central): repaired.** Lines 1129–1144 now give `G=ℤ/2` acting trivially on `M_2(ℂ)` with `ω(a,a)=diag(1,−1)`, with the computation `diag(1,−1)E_12=E_12` against `E_12diag(1,−1)=−E_12`, and the second bullet explains why `α_a=Ad(diag(1,i))` is not an action of `ℤ/2` and why a Schur multiplier gives a central ω. Both computations are correct (adversarial table, rows 4 and 36).
- **R03 (saddle-flow orbit): repaired.** Lines 2006–2011: "the orbit of (x,y) with `xy≠0` is the branch `{(u,xy/u):ux>0}`", with `(1,1)`, `(−1,−1)` and `(1,−2)` as witnesses. Correct (row 25).
- **R04 (gap slugs labelling sections on main): repaired.** No `gap:` string remains in the README. Lines 594–631 are now a "CStarAlgebras supplies, as a roadmap on main cited by section" contract, lines 577–593 the HilbertModules one, and every former slug on a *Needs:* line or Dependencies list is replaced by the section ids (C1.3, C1.4, C1.6, C1.7, C2.1–C2.4, C2.AnnHull, C5.1–C5.2, C5.4, C6.1–C6.2, C6.5, C7.1, C8.4; H1, H3). All of them exist on main (Verified sound).
- **R05 (D5–D6 theorems without locators at the claim): repaired.** Locators were added at lines 2446, 2467–2468, 2472, 2676–2677, 2765–2766, 2772, 2775–2776, 2807, 2821–2825, 2833–2835, 2850, 2854–2855, 2859–2861, 2863–2865 and 2931. Every one of them that is in the cache resolves to the stated theorem (Verified sound, "Sources").
- **R06 (`O_n` and the concrete Cuntz families needed each other): repaired.** The *Needs:* line of the concrete families (lines 2997–2998) now lists Mathlib only, and the construction of the representation `O_n→B(H)` moved into the `O_n` paragraph (lines 2917–2923). The *Needs:* graph is now `O_n → families → Mathlib`.
- **R07 (no stated order with #1187): not repaired.** The description's last line still reads "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Carried as R02 below.

No repair report for the previous round is in the package's `reports/` directory (it holds review and gate reports only), so neither carried finding was marked `not actionable in this package`; both are carried as ordinary findings.

## R01 (P3) — The branch deletes six files of other roadmaps, so the gate fails

**Location.** Outside the folder: `TauCetiRoadmap/FiniteGroupExtensionSplitting/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/LieGroupoidsPoisson/PROGRESS.md` and `STATUS.md`, `TauCetiRoadmap/PrimitivePrimeDivisors/PROGRESS.md` and `STATUS.md`. Carried from the previous review's R01.

**Claim.** The pull request removes files that main carries and that belong to other roadmaps.

**Witness.** All six exist at origin/main (1bea835) and none exists at df96497 (`git cat-file -e` on each). My gate run at this head: `outside-folder=6 … FAIL`, every other check 0.

**Repair.** Restore the six files in a new commit with `git checkout origin/main -- <the six paths>`. After that the only difference from main is inside `TauCetiRoadmap/OperatorAlgebraDynamics/`. Acceptance is not possible while the gate fails.

## R02 (P3) — The description states no merge order with #1187, which changes this `Suggested.lean`

**Location.** The last line of the pull-request description: "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1097, #1771, #1015, #863". Carried from the previous review's R07.

**Claim.** Another open pull request changes this roadmap's `Suggested.lean`, the two heads conflict, and neither description says which merges first; the line also names #1097, which is not in the open index.

**Witness.** This job's overlap data (index of 2026-11-09T17:01:41Z): "#1137 and #1187 conflict in … `TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean`". `roadmaps grep` at #1187's head still finds its stale copy of this README (the `O_n` and strong-subadditivity hits attributed to #1187 in my ownership search are that copy).

**Repair.** State the order in the description: either #1187 merges first and this branch is rebased and re-elaborated at its Tau Ceti pin, or this pull request merges first and #1187 drops its OperatorAlgebraDynamics hunk. Remove #1097 from that line.

## Verified sound

### Gate, dependency check, elaboration, signatures and probe

- **Gate.** Run at df96497: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=6 source-material=0 FAIL` (R01). The worker's run adds `build=0`.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. I read every *Needs:* line and every Dependencies list: the suppliers named are BanachAlgebras A7, CStarAlgebras (sections above), HilbertModules H1/H3, AmenableGroups Layers 5 and 7, RepresentationTheory/CompactGroups and /SpinRepresentations, LieGroupoidsPoisson G0.0, SelfAdjointSpectralTheory Part A/B ids, OneParameterSemigroups, VonNeumannAlgebras V1, V2, V4.0.Fields, V4.0.Decomposition, V10.ModularTheory, V10.KMS, V11, all on main and all earlier in the order or completed. FreeProbability F3 is named only as "a comparison, not an input" (line 2030). QuantumFoundations, NoncompactQuantumSymmetry, OperatorKTheory, CStarClassification, MetaplecticAutomorphicForms, HeisenbergImprimitivity and CompactQuantumMetricSpaces appear only as deferrals or consumers.
- **Elaboration.** `lake env lean` on a scratch copy of `Suggested.lean`: 15 `declaration uses sorry` warnings (lines 103, 116, 131, 203, 222, 237, 253, 274, 295, 306, 323, 339, 361, 385, 408) and nothing else, in 5.3 s.
- **Signatures.** `#check @name` for all 18 declarations in one scratch file, elaborated without error. Compared with the README: both integrated-operator theorems carry `μ.InnerRegularCompactLTTop` (README 686–693, 981); `exists_covariantRepresentation_integratedFull` carries `H : Type (max u v)` and `IsHaarMeasure` (README 718–724); `fullCrossedProductMap_exact` has `I` closed and invariant, `q` surjective with `ker q = I` (README 737–746); `injective_integratedFull_regular_of_amenable` carries `Amenable G`, `IsHaarMeasure`, `Regular` and an injective, possibly degenerate ρ (README 1427–1436); `lcaWeyl_classification` carries both strong continuities and the phase `conj(χ(s))` (README 2311–2324); `exists_residue_family` carries the ℕ-indexed `HilbertBasis` and `0<n` (README 2965–2985); `vonNeumannEntropy_strong_subadditivity` carries `PosSemidef` and no trace normalization (README 3722–3730). No binder was lost; nothing changed.
- **One-tactic probe.** Each `sorry` replaced by `first | rfl | simp | infer_instance | trivial | decide | aesop`: all 15 theorems fail (errors at lines 110, 124, 141, 212, 227, 244, 264, 281, 298, 315, 332, 349, 376, 397, 414). No declaration restates a definition, mirrors a Check or computes a small value; `generatedCStarAlgebra` has a real body and the two structures contain no `sorry`. The imports are `import Mathlib` plus eight `TauCeti.*` modules that exist at the pin (TauCeti 2fd255d9, Mathlib 1b1ccf4b); no `set_option`, `lemma` or `#eval`.

### Headline theorems

Stated in `Suggested.lean`: the L¹ integrated form and its twisted analogue; recovery of the covariant pair; full ideal exactness; automatic continuity; amenable full = reduced; irreducibility of orbit representations; the Powers partition, simplicity and unique trace of `Cr*(F_ι)`; `C*(G)≅C₀(Ĝ)` and `C*(Ĝ)≅C₀(G)`; the LCA Weyl classification; the residue Cuntz family; strong subadditivity. Named in the module docstring as not statable, each with its missing carrier (lines 49–80): the reduced crossed product, `A⋊_idG≅A⊗_maxC*(G)` and Takai, `C*(G,ω)`, Mackey's topology, Green and symmetric imprimitivity, disintegration, equivalence and universal `O_n`, the KMS simplex, Araki's `Ω^Q`, CAR/Weyl quasi-free states and the thermodynamic limit. I found no statable headline missing and none forced through a stand-in.

### Seeded sample

- **Worked example: the saddle flow (lines 1987–2023).** Recomputed: `xy` is invariant under `(e^t x, e^(−t) y)`; the orbits are the origin, four open half-axes and the branches `{(u,xy/u):ux>0}`. `(−1,−1)` gives `{(u,1/u):u<0}`, `(1,−2)` gives `{(u,−2/u):u>0}`, `(1,1)` the first-quadrant branch. `{x>0,|xy|<ε}` is saturated and open, contains the +x half-axis and the Q1/Q4 branches with `r<ε` and not the origin; every neighbourhood of the origin contains the four half-axis points (T₁ fails); the +x and +y neighbourhoods share the Q1 branches with `r<ε` (not Hausdorff); `(x,y)↦xy` is open on each open quadrant. The repaired Check is correct.
- **D5.Fields (lines 2505–2588).** Recomputed the seven Checks: a point gives `H(x_0)`; `N=ℕ` gives `L²(X;ℓ²)` and `N={0}` gives `L²`, `L∞`; on `[0,1]` with `N` jumping at ½, `E_10e_0=e_1∉H(x)` for `x<½` so `E_10` is not a field of maps, `E_01e_0=0` so it is, and `1_(x≥½)E_01` is; a non-measurable S gives a non-measurable section; `1` and `E_00` agree on `span e_0`; zero fibres off `S=[0,½]` give `≅L²(S)`; empty X gives 0. Locators: Williams Definition E.16 and Theorem E.17 at `williams-cpcsa-draft31` lines 23770 and 23776 (PDF page 417, printed p. 405; hypotheses separable H, second-countable LCH X, finite μ, as used), Definition F.1 at line 23897 (printed p. 409) with the nonzero-fibre assumption at line 23893. VonNeumannAlgebras V4.0.Fields and V4.0.Decomposition are on main (lines 1181 and 1279), unchanged since the previous review (no commit touched the supplier folders between 11b9f2ea and 1bea835).
- **Concrete Cuntz families (lines 2965–2998).** `⟨b_m,S_jb_k⟩=[m=nk+j]`, so `S_j*b_m=b_(m/n)` when `m mod n=j` and 0 otherwise; `S_i*S_jb_k=S_i*b_(nk+j)=δ_ijb_k`; `Σ_jS_jS_j*b_m=S_(m mod n)b_(m div n)=b_m`. For n=2 at `b_3`: `S_0*b_3=0`, `S_1*b_3=b_1`, sum `b_3`. n=1: `S_0=Id`. Shift family: `S_1*S_0=S_1*≠0`. Under `Wb_k=b'_k`, `WS_jW*b'_k=b'_(nk+j)`. Finite dimension: isometries are unitaries, so n≥2 is impossible. Cuntz §1 is uncertified (Not verifiable). The *Needs:* line is Mathlib only (R06 repaired).

### Sources read this round

- `sims-groupoids2017`: Theorem 4.1.5 (line 1128, p. 32: amenable ⇔ `C*(G)` nuclear ⇔ `Cr*(G)` nuclear, étale G, cited to Anantharaman-Delaroche–Renault); Lemma 4.2.3 (line 1253, second-countable étale: effective ⇔ units with trivial isotropy dense); Proposition 4.2.6 (line 1309, p. 37: faithful expectation onto `C₀(G⁰)`); Theorem 4.2.7 (line 1324: effective G, a homomorphism injective on `C₀(G⁰)` is injective); Proposition 4.3.2 (line 1361: the full sequence for an open invariant U); Theorem 4.3.3 (line 1431: amenable G, `U↦I_U` injective, bijective iff strongly effective; "strongly effective" defined at line 1424); Theorem 4.3.6 (line 1527: amenable G, `C*(G)` simple iff effective and minimal); Proposition 4.3.7 (line 1539: effective minimal ⇒ `Cr*(G)` simple; the README adds `G⁰≠∅`, which Sims leaves implicit); Proposition 5.1.14 (line 1790, p. 49: effective étale, the diagonal is regular maximal abelian in `Cr*(G;E)`; the README uses the trivial twist). Each matches the README's claim and hypotheses at lines 2807–2865.
- `muhly-williams2008`: Theorem 7.8 (line 2410, p. 35, "Renault's Proposition 4.2"; proved in Appendix B, lines 25, 85–87, 3918) is the pre-representation form of lines 2672–2677; Theorem 5.5 (line 1174, p. 20) is the equivalence theorem for Fell bundles over second-countable groupoids, whose scalar case lines 2765–2766 cite.
- `sims-williams2012`: Theorem 13 (line 552, p. 10: `‖F‖_(Cr*(L))=‖f‖_(Cr*(G))`, the reduced module) and Theorem 17 (line 733, p. 12: `X-Ind(I_(Cr*(H)))=I_(Cr*(G))` and `X/X·I_(Cr*(H))≅X_r`), as lines 2772–2776 state.
- `takeishi2014`: Theorem 5.4 (line 496, p. 11): for a locally compact Hausdorff étale groupoid, amenable ⇔ `Cr*(E)` nuclear for all Fell line bundles ⇔ for some; no second countability, as line 2823 says.
- `williams-cpcsa-draft31`: Proposition 2.40 (line 3988), Proposition 3.1 (line 5398), Proposition 3.19 (line 6050), Proposition I.1 (line 27398), E.16/E.17/F.1 as above.

### Adversarial table

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| 1 | `exists_integratedOperator` (686–693) | ℤ counting; G trivial | `δ_0⊗a+δ_1⊗b ↦ π(a)+π(b)U`; `f(n)=2^(−|n|)a` has `‖f‖₁=3‖a‖`; G trivial gives `π(f(e))` | holds | none |
| 2 | `exists_covariantRepresentation_integratedFull` (718–724) | G trivial, A=ℂ²; L=0 on H≠0 | `(x,y)↦x` recovered as π=L, U=1; L=0 is excluded by `hL` | holds | none |
| 3 | `fullCrossedProductMap_exact` (737–746) | G trivial; A=ℂ², I=ℂ⊕0; I=A | `0→I→A→A/I→0`; `C*(G)→C*(G)²→C*(G)`; B=0 and the first map onto | holds | none |
| 4 | `CentralCocycle` law (925–931; Lean 162–164) | ℤ/2, `ω(a,a)=−1`; A=0; trivial α on `M_2` with `ω(a,a)=diag(1,−1)` | at `r=s=t=a`: `(−1)(1)=(−1)(1)`; on `M(0)=0` all fields hold; the last satisfies every field but `central`: `diag(1,−1)E_12=E_12`, `E_12diag(1,−1)=−E_12` | holds | none (R02 repaired) |
| 5 | Twisted star (950) | derived from `T_f*` | `U_s*=π̃(ω(s⁻¹,s)*)U_(s⁻¹)` via `ω(s,s⁻¹)=α̃_s(ω(s⁻¹,s))`; substitution `s↦s⁻¹` gives `c(s)ω(s,s⁻¹)*α_s(f(s⁻¹)*)` | holds | none |
| 6 | `V^ω_sV^ω_t=Π̃(ω(s,t))V^ω_(st)` (995–999) | cocycle at `(s,t,t⁻¹s⁻¹r)` | `α̃_s(ω(t,t⁻¹s⁻¹r))ω(s,s⁻¹r)=ω(s,t)ω(st,t⁻¹s⁻¹r)` | holds | none |
| 7 | Cochain direction `T_b` (1027–1035) | ℤ/2, `b(a)=i` | `ω^b(a,a)=i·i·(−1)=1`; `(iδ_a)²=−ω(a,a)δ_e=δ_e` | holds | none |
| 8 | Schrödinger family (1104–1111) | `x=(m,χ)`, `y=(n,ψ)` | `(Π_xΠ_yξ)(t)=χ(t)ψ(t+m)ξ(t+m+n)=ψ(m)(Π_(x+y)ξ)(t)` | holds | none |
| 9 | `exists_centralIntegratedOperator` (978–982) | ω=1, ℤ counting | reduces to row 1 | holds | none |
| 10 | `continuous_of_measurable_monoidHom` (1192–1207) | Williams D.11; Hamel map | source hypotheses (Polish G, separable metrizable K) are the Lean classes; a ℚ-linear non-ℝ-linear map is discontinuous, hence not Borel | holds | none |
| 11 | `E_ω` inverse and `ψ_b` (1226–1252) | ℤ/2, `ω(a,a)=−1`, `b(a)=i` | `(1,a)²=(−1,e)`, order 4; `(i,a)²=(i²ω(a,a),e)=(1,e)` | holds | none |
| 12 | Weight projection `p_1` (1300–1314) | reps `(z,e)↦z^k` | `∫z̄z^kdz=δ_(k1)`; the `z` weight picks `ω⁻¹` | holds | none |
| 13 | `injective_integratedFull_regular_of_amenable` (1427–1436) | ℤ; F₂ with `h=Σδ_(s^±)`; ρ=z⊕0 | `‖λ(f)‖=sup|f̂|`; `‖λ(h)‖=2√3≈3.46<4=χ_triv(h)`; same kernel as the essential part | holds | none |
| 14 | `transitive_commutant_scalar` (1489–1499) | ℤ/2 on {p,q} | `(f(j)−f(i))T_ij=0`; commutant of `diag(f(p),f(q))` and the swap is ℂ | holds | none |
| 15 | Orbit generators (1517–1523) | θ∉ℚ, `n·x=x−nθ` | `(uvξ)(n)=e^(2πi(x−(n−1)θ))ξ(n−1)`, `(vuξ)(n)=e^(2πi(x−nθ))ξ(n−1)`: `uv=e^(2πiθ)vu` | holds | none |
| 16 | `exists_powers_partition` (1690–1703) | F={b}, L=2; F=∅, N=2; ℤ, N=3 | `wbw⁻¹=aba⁻¹` with `w=ab²`; `(aba⁻¹)·(b^±…)` starts with a; `b^jD` disjoint by j leading b's; ℤ: D ≥ ½ density, 3 disjoint translates impossible | holds | none |
| 17 | `reducedFreeGroup_isSimpleRing` (1730–1744) | singleton basis; full `C*(F₂)` | `C(𝕋)` not simple (excluded by a≠b); `u−1∈ker χ_triv`, `λ(u)δ_1−δ_1≠0` | holds | none |
| 18 | `reducedFreeGroup_trace_unique` (1730–1744) | `τ(λ(g))` | `⟨δ_1,δ_g⟩=[g=1]` | holds | none |
| 19 | `exists_fullGroupCStarAlgebra_equiv_zeroAtInfty_dual` (2183–2191) | ℤ/2; ℤ; S₃ | `f̂(χ)=f_0−f_1`, `‖δ_e+δ_a‖=2`; `δ_1↦z`; `C*(S₃)=ℂ²⊕M₂` non-commutative | holds | none |
| 20 | `exists_fullGroupCStarAlgebra_dual_equiv_zeroAtInfty` (2204–2214) | ℤ; ν↦cν | `C*(𝕋)≅c₀(ℤ)`, unitary at z ↦ `n↦zⁿ`; f for `cν` is `cf` for ν | holds | none |
| 21 | `lcaWeyl_classification` (2311–2324) | Schrödinger; ℤ/3; E=0 | `U_sV_χU_s*ξ(t)=χ(s⁻¹t)ξ(t)=conj(χ(s))χ(t)ξ(t)`; `U_1V_χU_1*=ω⁻¹V_χ` vs `V_χU_1V_χ*=ωU_1`; ι=∅ | holds | none |
| 22 | `exists_residue_family` (2965–2985) | n=1, 2; shift family | see Seeded sample | holds | none (R06 repaired) |
| 23 | `vonNeumannEntropy_strong_subadditivity` (3722–3730) | GHZ; 2·GHZ; `|0⟩⟨0|⊗Φ⁺` | `0+log2≤2log2`; `−2log2≤0+0`; `log2=log2`, while `ρ_A` in place of `ρ_AB` gives `log2≤0` (false) | holds | none |
| 24 | Saddle-flow Check (2006–2011) | (1,1), (−1,−1), (1,−2) | `{(u,1/u):u>0}`, `{(u,1/u):u<0}`, `{(u,−2/u):u>0}` | holds | none (R03 repaired) |
| 25 | D1 convolution direction (761–768) | ℤ/3 shift on ℂ³ | `e_0·α_1(e_2)=e_0·e_0=e_0` vs `e_0·α_(−1)(e_2)=e_0·e_1=0` | holds | none |
| 26 | D2 regular unitary (1377–1380) | ℤ/2 swap on ℂ² | `⟨ξ,ξ⟩_A=α_a(e_1)=e_2`, `‖ξ⊗η‖²=|η_2|²`; displayed map gives `η_2e_2`, wrong map `η_1e_1` | holds | none |
| 27 | `E_ij`, even projection (1869–1875) | ℓ²(ℤ) | `E_ijδ_n=[n=j]δ_i`; `UpU*δ_n=[n odd]δ_n=(1−p)δ_n` | holds | none |
| 28 | D3 modular factor (2104–2108) | ax+b, dilations | star law needs `γ²=Δ_G/Δ_H`; `Δ_H=1`, `Δ_G(a,0)≠1` | holds | none |
| 29 | D5 one-unit groupoid (2479–2488) | group G | `(Δ^½f)*(Δ^½g)=Δ^½(f*g)`; groupoid star of `Δ^½f` is `Δ^(−½)conj(f(s⁻¹))=Δ^½·(Δ⁻¹conj(f(s⁻¹)))`; I-norm `max(‖f‖₁,‖Δ⁻¹f‖₁)` | holds | none |
| 30 | Sims locators vs README hypotheses (2807–2865) | Thm 4.3.3; Thm 4.3.6; Prop 4.3.7 | 4.3.3: amenable, bijective iff strongly effective = README "amenable strongly effective"; 4.3.6: amenable, simple iff effective and minimal = README; 4.3.7: effective minimal ⇒ `Cr*` simple, README adds `G⁰≠∅` (for `G⁰=∅` the algebra is 0) | holds | none |
| 31 | D6 strong effectiveness (2866–2874) | ℤ on `ℤ⊔{+∞}` | `(n,+∞)=lim(n,k)`: effective; reduction to {+∞} is ℤ, not effective; 3 invariant opens vs ideals indexed by closed subsets of 𝕋 | holds | none |
| 32 | `O_n` ↔ concrete families (2944–2948, 2997–2998) | *Needs:* graph | `O_n → families → Mathlib`, no cycle | holds | none (R06 repaired) |
| 33 | D7 KMS sign (3173–3180) | K=diag(0,1), `a=E_12`, `b=E_21` | `τ_(iβ)(b)=e^(−β)b`; both sides `e^(−β)/(1+e^(−β))`; opposite sign gives `e^β/(1+e^(−β))` | holds | none |
| 34 | D7 Araki witness (3203–3222) | K=diag(0,1), P=−K | `Ω^Q=e^(−β(K+P)/2)/√Z_K`, `u_t=diag(1,e^(iβt))`, `Ad(u_t)∘τ_(−βt)=id=τ^P_(−βt)` | holds | none |
| 35 | D8 CAR factor and Fermi occupation (3301–3307, 3564–3568) | h=ℂ; `h₀=ε` | `‖P_a(f⊗g)‖²=‖f‖²‖g‖²/2`; `e^(−βε)(1−n)=n` gives `n=(1+e^(βε))⁻¹` | holds | none |
| 36 | Busby–Smith Check (1137–1144) | `α_a=Ad(diag(1,i))`, `ω(a,a)=diag(1,−1)` | `α_a²=Ad(diag(1,−1))`, `E_12↦−E_12`, so α is not an action of ℤ/2; `α_aα_a=Ad(ω(a,a))α_e` holds | holds | none (R02 repaired) |
| 37 | D8 Fock Weyl (3440–3516) | h=ℂ, f=1, g=i | `Im⟨1,i⟩=1`, `W_F(1)W_F(i)=e^(−i/2)W_F(1+i)`; vacuum variance `1/2`, fourth moment `3/4` | holds | none |
| 38 | D9 Ising and on-site (3768–3785) | J, h; λ=1 | `Mλ=|h|+2|J|e^λ`, `Mλ,2=|h|+8|J|e^λ`, bound `1/(2+16e)`; `Tr e^(−βhσ_3)=2cosh(βh)`, `s−βe=log2cosh(βh)=p` | holds | none |
| 39 | Modular convention (214–216) | Mathlib `map_right_mul_eq_modularCharacterFun_smul` | `map(·*g)μ=c(g)•μ` gives `∫f(xg)dμ=c(g)∫f`, so `Δ=c⁻¹` | holds | none |

### Library declarations opened at the pins (TauCeti 2fd255d9, Mathlib 1b1ccf4b)

- Mathlib: `MeasureTheory/Group/ModularCharacter.lean` lines 45 (`modularCharacterFun`) and 130 (`modularCharacter`); `Analysis/CStarAlgebra/Module/Defs.lean` line 81 (`star_inner`); `MeasureTheory/Measure/Haar/NormedSpace.lean` (`AddMonoidHom.continuous_of_measurable`, additive only, as line 1203 says).
- Tau Ceti: `Analysis/CStarAlgebra/Action/CrossedProduct/Full.lean` lines 266 (`FullCrossedProduct`) and 417 (`integratedFull`); `Action/Covariant/Regular.lean` line 127 (`regular`); `Action/CrossedProduct/Functoriality.lean` line 66 (`fullCrossedProductMap`); `Action/Hom.lean` line 293 (`subtypeHom`); `GroupTheory/Amenable/Basic.lean` line 130 (`class Amenable`); `Analysis/Matrix/Entropy.lean` line 88 (`vonNeumannEntropy`); `LinearAlgebra/Matrix/Trace/Partial.lean` lines 51 and 153 (`partialTraceRight`, `partialTraceLeft`); `QuantumSpin/Interaction.lean` line 261 (`gibbsExtension`). No strong subadditivity, reduced or twisted crossed product, Powers or Cuntz object at the pin; `centralCocyclePseudofunctor` (`CategoryTheory/Bicategory/Functor/CentralCocycle.lean`) is bicategorical and unrelated to `CentralCocycle`.

### Cross-roadmap citations resolved on main (1bea835)

No commit between 11b9f2ea (the previous review's main) and 1bea835 touched VonNeumannAlgebras, CStarAlgebras, HilbertModules, OperatorTheory, BanachAlgebras, AmenableGroups, LieGroupoidsPoisson, FreeProbability, RepresentationTheory or `Completed/OneParameterSemigroups`, so the previous review's resolutions stand; I re-opened:

- CStarAlgebras: C1.3 (line 305), C1.4 (380), C1.6 (435), C1.7 (468), C2.1 (544), C2.2 (568), C2.3 (616), C2.4 (643), C2.AnnHull (695), C5.1 (1112), C5.2 (1143), C5.4 (1203, with `C*(F_∞)` on countably many unitaries at 1213), C6.1 (1272), C6.2 (1297), C6.5 (1414), C7.1 (1455), C8.4 (1676).
- HilbertModules: H1 (line 126; modules over a dense *-subalgebra with norm in the specified C*-completion at 141–143, the Gram-matrix positivity at 134–136); H3 (line 262; the unit unitary `B⊗_BF≅F` for a nondegenerate action at 274–275, induced Hilbert spaces at 283–288, the equivalence of the `A≅K_B(E)` form with the two-inner-product form at 290–293).
- VonNeumannAlgebras V4.0.Fields (1181) and V4.0.Decomposition (1279); V1, V2, V10.ModularTheory, V10.KMS, V11.UnitizationCharacters, V11.FourierUniqueness as in the previous review; BanachAlgebras A7.CharactersAndUniqueness (1739); LieGroupoidsPoisson G0.0 (261); AmenableGroups Layers 5 (289) and 7 (415); FreeProbability F3 naming D6 as the owner of finite `O_n` (lines 77–80).

### Ownership and overlaps

`roadmaps grep` over the open heads and main for "twisted group C*-algebra", "Takai", "universal unital C*-algebra O_n", "strong subadditivity", "Powers averaging/property" and "uniform Roe": the only hits outside this roadmap are consumers (#866 OperatorKTheory lines 48, 174, 239, 249, 1831–1839, 1943–1970; #863 CStarClassification line 166; #1041 VonNeumannAlgebras line 3762) and #1187's stale copy of this README. No second owner. The overlap data lists no dropped id, no id defined only by an open revision and no id dropped by this pull request; the one item is the #1187 conflict (R02).

## Not verifiable

- Uncertified in the manifest, cited by locator and not read: Bratteli–Robinson 2 (§§5.2–5.3, Theorems 5.2.8, 5.3.30, 5.4.4, 6.2.4, 6.2.18, 6.2.40, 6.2.42, Definition 6.2.16, Proposition 6.2.45, including the high-temperature constant at line 3760); Bratteli–Robinson 1 (Lemma 4.1.19 through Theorem 4.1.25); Cuntz §1; Renault (Chapter I §§2–3, Chapter II §§1–2, Chapter III Proposition 2.7, the locators added this round at lines 2446, 2467–2468, 2472 and 2931); Brown–Ozawa Proposition 5.1.3.
- Rudin, *Fourier Analysis on Groups*, Theorems 1.5.1, 1.6.1 and 1.7.2: paywalled, not in the manifest, cited only for statements consumed from VonNeumannAlgebras V11.
- Not re-read this round, cited at locators unchanged since earlier rounds that read them: Araki, Attal, Nielsen–Petz, Arici–Mesland, Delfín–Farsi–Packer, de la Harpe.

## Source issues

- **Misprint** in sims-groupoids2017 at Proposition 4.2.6, printed p. 37: the source writes the domain of the faithful conditional expectation as the reduced algebra of the unit space; it should be the reduced algebra of the groupoid itself, `Cr*(G)`, as the proof and the rest of the statement use; affects nothing.
