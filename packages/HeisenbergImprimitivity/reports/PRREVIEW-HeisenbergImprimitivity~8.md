# Review of HeisenbergImprimitivity (pull request #1149 at 5333cb0)
Folder: `TauCetiRoadmap/HilbertModules/HeisenbergImprimitivity/`
**Verdict:** needs changes

A full review. The folder changed by 184 lines since ba5f61f: the Schrödinger family handed to OperatorAlgebraDynamics D1.CentralTwists, the lattice Poisson calculus repointed to Tau Ceti, the density lemma moved to Mathlib, and Downstream consumers rewritten, plus three lines of the Lean docstring. I reread every passage, changed or not. Library citations were checked at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9). Cross-roadmap citations were checked on main (01daf25) and at the open heads named below. Two new P3 findings remain; none is blocking.

## Previous findings (round 7, at ba5f61f)

- **Round-7 R01 (P2): repaired.** Round 7 found the Schrödinger family owned both here and by OperatorAlgebraDynamics. Scope lines 23–27 now read: "the Schrödinger family `π_x`, its strong continuity, projective relation and adjoint phase are OperatorAlgebraDynamics D1.CentralTwists', consumed at every locally compact Hausdorff abelian M". The other parts of the requested repair are also in place:
  - "Left to other owners", lines 54–56;
  - Conventions, lines 99–100;
  - the supplier contract, lines 191–195;
  - How to read, line 225;
  - §1.1, lines 241–244, with `*Needs:*` at line 253;
  - Layer 1 Dependencies, line 329.

  At the revision's current head 895d9b85, D1.CentralTwists (lines 1101–1110) constructs the same family with the same phase conventions (see the first table row).
- **Round-7 R02 (P3): repaired.** Round 7 found that the README denied the lattice Poisson formula existed at the pin. The Mathlib contract (lines 126–128) now says "the lattice version is Tau Ceti's (below)". The Tau Ceti contract (lines 147–167) names `SchwartzMap.tsum_eq_tsum_dual_fourier`, `ZLattice.summable_poisson_left`, `ZLattice.summable_poisson_right`, `ContinuousLinearEquiv.fourier_comp`, `ZLattice.dual`, `ZLattice.dual_dual`, `ZLattice.dual_comap_continuousLinearEquiv`, `ZLattice.covolume_dual` and `ZLattice.covolume_comap_continuousLinearEquiv`, with files and hypotheses. The same names replace the ThetaSeries citations in:
  - Scope (lines 65–71) and the Summary (lines 13–15);
  - the ThetaSeries contract (lines 206–216);
  - §1.3 (lines 301–310) and §2.3 (lines 399–432);
  - Layer 2 Dependencies (lines 488–494);
  - the Lean docstring (lines 19–21).

  Every name was opened at the pin (Verified sound).
- **Round-7 R03 (P3): repaired.** `SchwartzMap.dense_hasCompactSupport` now sits in the Mathlib contract with `[FiniteDimensional ℝ E]` and `Mathlib/Analysis/Distribution/SchwartzSpace/CompactSupport.lean` (lines 129–131), and in Layer 2 Dependencies as Mathlib's (line 493). It is gone from the Tau Ceti contract.
- **Round-7 R04 (P3): repaired.** Lines 869–872 now read: "OperatorKTheory §7.5 takes it from there, and CompactQuantumMetricSpaces §6.0 reaches it through §3.1's citation of those sections". Both heads agree:
  - CompactQuantumMetricSpaces at 7db4c193, lines 1445, 1454 and 1469;
  - OperatorKTheory at 1377338a, lines 1830–1843.

## R01 (P3) — The continuity of β and σ is credited to a lemma that only gives continuity at a fixed point

Location: `README.md` lines 253–254: "*Needs:* OperatorAlgebraDynamics D1.CentralTwists; Mathlib Haar measure, `PontryaginDual`, `Lp`; Tau Ceti `TauCeti.PontryaginDual.continuous_coe_eval_const` for the continuity of β and σ." The same lemma is the only continuity input listed in Layer 1's Dependencies (lines 329–332) and the Tau Ceti contract (lines 145–146).

Claim: the Tau Ceti lemma supplies the continuity of β and σ on G×G, which §1.1 must prove ("Prove that β is a continuous bicharacter … σ is a continuous alternating bicharacter").

Witness: `TauCeti/Analysis/Fourier/Pontryagin/DualEval.lean:29` proves only `Continuous (fun χ => (χ g : ℂ))` for a fixed g. But `β((m,χ),(n,ψ))=ψ(m)` needs `(ψ,m)↦ψ(m)` jointly continuous. Mathlib supplies that as `ContinuousMonoidHom.instContinuousEval [LocallyCompactPair A B]` (`Mathlib/Topology/Algebra/Group/CompactOpen.lean:50`).

Repair:
- In §1.1's `*Needs:*`, replace the Tau Ceti clause with: "Mathlib `ContinuousMonoidHom.instContinuousEval` (joint continuity of evaluation `M̂×M→𝕋` for locally compact M, through `LocallyCompactPair`) for the continuity of β and σ on G×G".
- Add the same bullet, with its file, to the Mathlib contract and to Layer 1's Dependencies.
- No target uses `TauCeti.PontryaginDual.continuous_coe_eval_const` once this is done, so delete it from the Tau Ceti contract and the Dependencies line.

Tested: on a scratch file at the pinned Mathlib, `continuous_subtype_val.comp (continuous_eval : Continuous fun p : (A →ₜ* Circle) × A => p.1 p.2)` proves `Continuous fun p : PontryaginDual A × A => ((p.1 p.2 : Circle) : ℂ)` under `[LocallyCompactSpace A]` with no diagnostic. That is exactly the joint continuity β needs, through `G=M×M̂`.

## R02 (P3) — The §6.3 ↔ HilbertModules H5 cross-reference is wrong in both directions

Location:
- `README.md` line 864: "HilbertModules H5 compares its commutative torus section modules with the θ≠0 model of §6.3."
- The family index `TauCetiRoadmap/HilbertModules/README.md` (this pull request's own) line 479: "constructed separately from the θ≠0 Schwartz imprimitivity model in HeisenbergImprimitivity H6."

Claim: H5 compares its modules with §6.3, and the parent cites an id "H6" of this roadmap.

Witness: on main, HilbertModules lines 478–479 build `M_k` "separately" from the θ≠0 model; θ occurs nowhere else in it except the `θ_(x,y)` operators. This README has no id H6: its layers are 1–6 and the θ≠0 model is §6.3. HilbertModules' own `## H6` (line 705) is closed module operators.

Repair:
- Line 864: "HilbertModules H5 builds its commutative torus section modules separately from the θ≠0 model of §6.3; it consumes nothing from this roadmap." Alternatively, drop H5 from Downstream consumers.
- `TauCetiRoadmap/HilbertModules/README.md` line 479: change "HeisenbergImprimitivity H6" to "HeisenbergImprimitivity §6.3".

`roadmaps resolve` on the parent README reports nothing, presumably because "H6" matches the parent's own heading. The id was checked by hand.

## Verified sound

**Gate and dependency check.** The worker's gate at 5333cb0 passes every check, including `build=0`.

My own run of the brief's gate command passes every text check:
- `set_option`, `blob`, `latex`, `tex`, `prnum`;
- `sorry-data`, `sorry-examples`, `residue`, `private-paths`;
- `imports`, `mathlib-subimports`, `no-import-mathlib`, `lean-lines`;
- `statement-hygiene`, `forbidden`, `dropped`, `readme-ids-missing`;
- `empty-sections`, `round-labels`, `long-fences`, `layer-ids`, `target-ids`;
- `metadata`, `stray-files`, `dirty`, `outside-folder`, `source-material`.

All of these are 0. The run stops at `depcheck: NOT IN ORDER: HeisenbergImprimitivity (insert it after its last supplier)`. That check reads the board's own order file, as in rounds 5–7, and is not a finding. The worker's run against the candidate order passes.

The dependency check run as the brief gives it prints `depcheck: 238 roadmaps, 2313 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. Candidate positions are CStarAlgebras 7, HilbertModules 8, OperatorKTheory 9, CompactQuantumMetricSpaces 208 and HeisenbergImprimitivity 399. OperatorAlgebraDynamics, AmenableGroups, ThetaSeries and NoncommutativeGeometry are on main.

The brief's outside-folder diff is empty. The pull request adds only `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.OA"`), and the parent index is byte-identical to main.

**Lean.** I made a scratch copy of `Suggested.lean` with `#check @name` for all 10 declarations and five probes, and elaborated it with `lake env lean` from the worktree. The file itself produces exactly three `declaration uses 'sorry'` warnings (lines 84, 105, 114) and no other diagnostic.

The elaborated types equal `signatures.md` and their README statements:
- `fundamental_identity`, `exists_parsevalFrame` and `parsevalFrame_trace` each carry `[DiscreteTopology ↥L] [IsZLattice ℝ L]` in their own signature;
- the file has no `variable` block, so no binder can be lost;
- `l2Inner` is `∫ conj(f t) * g t`, linear in the second variable as the Conventions say;
- `IsParsevalFrame` quantifies over every Schwartz `f`;
- `parsevalFrame_trace` ends in `= ZLattice.covolume L volume`.

Padding probes: `simp` on `fundamental_identity`'s statement leaves the goal unchanged, `simp [IsParsevalFrame]` on `exists_parsevalFrame`'s leaves the existential, and `simp_all [IsParsevalFrame]` on `parsevalFrame_trace`'s makes no progress. None of the three is padding. Two positive probes close:
- `symplecticChar x y = 1` at k=0, by `simp [symplecticChar]`, as §2.4's Check predicts;
- `schrodinger x (schrodingerAdjoint x ξ) t = ξ t` at k=1, by unfolding and `AddChar.map_add_eq_mul`, so the Lean adjoint is the inverse of the unitary.

Form: a single `import Mathlib`, no `set_option`, no `lemma`, no sorried data, and a docstring on every declaration. The module docstring names the not-statable groups accurately at the pins:
- Tau Ceti has no Schwartz–Bruhat space for `ℤ^p×𝕋^q×F` factors;
- it has no twisted group C*-completion (`TauCeti.twistedMonoidAlgebra` is a `Subalgebra` of `Module.End k (G →₀ k)`, `Twisted/Basic.lean:288`, with no norm);
- it has no Hilbert-module completion of a Schwartz space.

No time–frequency shift, Gabor frame or symplectic form on `ℝ^k×ℝ^k` exists at either pin; a grep found only `HeisenbergGroup R` as a topological group. So the five Lean definitions duplicate nothing.

**Headline audit.** The README's headlines are:
- Rieffel's imprimitivity theorem for lattices (`B≅K_A(𝓔)`, Morita equivalence, fullness);
- the fundamental identity;
- finite Parseval frames with Schwartz windows;
- the trace formula `dim_A𝓔=Σ‖ξ_j‖₂²=c_E=1/c_D`;
- Poisson summation for finite-type M.

The Euclidean cases of the fundamental identity, frame existence and the trace formula are statable at the pins, and all three are stated. The rest need S(M), `C*(L,c)` or the module completion, and the docstring names them. Euclidean lattice Poisson is consumed from Tau Ceti, so nothing is stated for it here.

**Library declarations opened at the pins.**

Tau Ceti 2fd255d9:
- `SchwartzMap.tsum_eq_tsum_dual_fourier` (`Analysis/Fourier/PoissonSummation.lean:309`): variables `[InnerProductSpace ℝ E] [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E]`, `[DiscreteTopology L] [IsZLattice ℝ L]`, phase `cexp (2πi⟪v,m⟫)`, as the contract states.
- `ZLattice.summable_poisson_left` (`Analysis/Distribution/SchwartzSpace/ZLattice.lean:76`): a normed space and a discrete subgroup.
- `ZLattice.summable_norm_poisson_left` (`ZLattice.lean:62`): the absolute form.
- `ZLattice.summable_poisson_right` (`ZLattice.lean:167`).
- `ContinuousLinearEquiv.fourier_comp` (`Analysis/Fourier/ChangeOfVariables.lean:44`): `𝓕(f∘A) y = |det A|⁻¹ • 𝓕f (adjoint(A⁻¹) y)`.
- `ZLattice.dual` (`Algebra/Module/ZLattice/Dual.lean:78`, `BilinForm.dualSubmodule (innerₗ E) L`), with its `DiscreteTopology` and `IsZLattice` instances.
- `ZLattice.dual_comap_continuousLinearEquiv` (`Dual.lean:143`) and `ZLattice.dual_dual` (`Dual.lean:173`).
- `ZLattice.covolume_comap_continuousLinearEquiv` (`Algebra/Module/ZLattice/Covolume.lean:99`): any Haar μ, `covol(comap L A)=|det A|⁻¹ covol(L)`.
- `ZLattice.covolume_dual` (`Covolume.lean:273`).
- `TauCeti.PontryaginDual.continuous_coe_eval_const` (`DualEval.lean:29`, R01).
- `TauCeti.IsFactorSet.apply_inv_eq_inv_apply` (`Twisted/Basic.lean:146`).
- `twistedMonoidAlgebra` (288), `TwistedMonoidAlgebra.of` (322), `of_mul_of` (336), `basis` (356), `finrank_eq_natCard` (368) and `equivOfCoboundary` (498).

Mathlib 1b1ccf4b:
- `SchwartzMap.dense_hasCompactSupport` (`Analysis/Distribution/SchwartzSpace/CompactSupport.lean:106`).
- `contDiffAt_ringInverse` (`Analysis/Calculus/ContDiff/Operations.lean:779`).
- `SchwartzMap.fourierTransformCLM` (`Analysis/Distribution/SchwartzSpace/Fourier.lean:53`) and `SchwartzMap.integral_sesq_fourier_eq` (`Fourier.lean:263`).
- `Real.tsum_eq_tsum_fourier` (`Analysis/Fourier/PoissonSummation.lean:98`) and `SchwartzMap.tsum_eq_tsum_fourier` (`PoissonSummation.lean:215`).
- `fourierCoeff` (`Analysis/Fourier/AddCircle.lean:297`) and `hasSum_fourier_series_L2` (`AddCircle.lean:432`).
- `mFourier` (`Analysis/Fourier/AddCircleMulti.lean:53`).
- `ZLattice.covolume_eq_det` (`Algebra/Module/ZLattice/Covolume.lean:126`).
- `ZSpan.fundamentalDomain` (`Algebra/Module/ZLattice/Basic.lean:93`) and `ZSpan.isAddFundamentalDomain` (`Basic.lean:352`).
- `ContinuousMonoidHom.instContinuousEval` (`Topology/Algebra/Group/CompactOpen.lean:50`, R01).
- The instance `LocallyCompactPair X Y` from `LocallyCompactSpace X` (`Topology/Compactness/LocallyCompact.lean:142`).

One wording nit needs no change. The contract's "absolute summability" for `summable_poisson_left`/`right` is the `Summable` form; it is equivalent to the norm form for ℂ-valued functions (finite dimension).

**Cross-roadmap citations resolved.**
- OperatorAlgebraDynamics at 895d9b85, the head of #1137. This head moved since round 7 (4133234f), and every clause the contract takes was re-resolved:
  - Scope lines 80–91 claim the Schrödinger family "with its bicharacter `ω((m,χ),(n,ψ))=ψ(m)` (D1.CentralTwists)".
  - D1.CentralTwists, lines 1101–1110, constructs the family with "its projective relation" and the adjoint factor `overline(ω(x,−x))`.
  - It also gives `C*(G,ω)` as "this roadmap's object" (1074), the scalar star `c(s)overline(ω(s,s⁻¹))overline(f(s⁻¹))` (1078), ω-representations and the universal property (1081), and `twistedMonoidAlgebra ℂ G ω` with `equivOfCoboundary` (1063, 1091).
  - It gives `T_b` "from the ω^b algebra to the ω algebra" with `(T_bf)(s)=f(s)b(s)` (1031–1033).
  - D2.CentralTwists gives `E(Σa_su_s)=a_e` (1575) and "q is an isomorphism for amenable G" (1582). It gives the faithful tracial `τ=E` (1595), `α̂_γ(u_s)=γ(s)u_s` with `V_sξ(r)=ω(s,s⁻¹r)ξ(s⁻¹r)` (1600–1604), `∫_Ĝα̂_γ(x)dγ=E(x)1` (1608), and fixed-point algebra ℂ1 (1612).
  - D1.CentralTwists (1111–1113) and Downstream consumers (3831–3862) leave here the cocycle calculus, annihilators, lattices, S(M), the pairings, imprimitivity, frames, coboundaries and S(L,c). No `*Needs:*` line there cites this roadmap, so there is no cycle.
- OperatorAlgebraDynamics on main has no `CentralTwists` heading. The overlap tool records the citation as an id only the open revision defines (lines 54, 253, 329, 529, 613). The description names #1137 in its depends-on list and merge-order paragraph, so this is not a finding.
- HilbertModules on main:
  - H1 (line 126); H2 with `id_E∈K_A(E)` iff finitely generated projective iff a finite Parseval frame exists (226–235);
  - H3 state localisation as the completion modulo `{x:ω(⟨x,x⟩)=0}` and as `E⊗_A H_ω` (289–291);
  - H3 imprimitivity bimodules, evaluation unitaries and induction (293–304);
  - H5's "HeisenbergImprimitivity H6" (479, R02).
- NoncommutativeGeometry on main: N6 `U₂U₁=exp(2πiθ)U₁U₂` (line 484); N7 `(ξU₁)(s)=ξ(s+θ)`, `(ξU₂)(s)=exp(2πis)ξ(s)` and a Powers–Rieffel projection of trace θ (555–558).
- AmenableGroups on main: Layer 6 (391), with amenability of every abelian discrete group (406).
- ThetaSeries on main:
  - 1A with its `e(+⟪v,m⟫)` sign discussion (432–451);
  - 1C (462), 1D (468), 1E (473), 2A (489) and 2C (507);
  - the instruction that consumers on a sup-norm model pass through a continuous linear equivalence (128–132).
- CompactQuantumMetricSpaces at 7db4c193 (§6.0, 1440–1537) and OperatorKTheory at 1377338a (§7.5, 1828–1890): as the repaired Downstream consumers paragraph says.

**Ownership.** I ran `roadmaps grep` over main and the 461 open heads, searching by object:
- "symplectic annihilator": only this roadmap and OperatorAlgebraDynamics, whose text defers it here.
- "Heisenberg module": this roadmap; NoncommutativeGeometry N7, the 0<θ<1 case compared in §6.3; OperatorAlgebraDynamics, describing this roadmap; and ExceptionalThetaCorrespondencesForG2, a Weil-representation object.
- "Schwartz–Bruhat": AnalyticNumberTheoryPartII §5.3h (adelic), AutomorphicLFunctionsAndLocalFactors AL.0.3.1 (local fields) and MetaplecticAutomorphicForms (local and adelic). These spaces are disjoint from finite-type M except on `ℝ^k`, where every roadmap uses Mathlib's `SchwartzMap`.
- "Gabor", "Parseval frame", "Wexler|Janssen": no other owner.

Relative to the merged state after #1137, this roadmap is the single owner of:
- the Heisenberg cocycle calculus and phase-space lattice theory;
- S(M) and Poisson summation for finite-type M;
- the pairings, the imprimitivity theorem for lattices, and the frames and trace formula;
- S(L,c) and the gauge-invariant-ideal triviality of `C*(L,β)`.

**Overlap facts.** Checking `scratch/overlaps.md`:
- no other open pull request changes this roadmap;
- no cited id is dropped by an open pull request;
- the one id only an open revision defines is named in the description (above).

The closest open roadmaps in vocabulary were compared by scope: OperatorAlgebraDynamics, CompactQuantumMetricSpaces, OperatorKTheory and NoncommutativeGeometry are all consistent with the ownership above. ThetaInvariantsOfEuclideanLattices (#2038) matched "lattice Poisson" only, as a consumer of Euclidean Poisson summation.

**Seeded sample, locators.** Every rieffel88 locator of the sampled targets was reread in the cached text, where printed page = cache page + 256:
- 1.1: line 337 (definition of `D^⊥`, p. 265); 1.2: lines 330–337 (characters of D from G, pp. 264–265) and 916 (`D=D^⊥⊥` used, p. 280).
- 1.3: line 744 (Lemma 3.1, p. 276) and 810 (`|G/D^⊥|=|G/D|⁻¹`, p. 277).
- 2.1: lines 369–374 (p. 265).
- 2.2: lines 381–385 (Lemma 2.3, the conjugate-linear-in-the-second-variable convention, p. 266), 395 (p. 266) and 408 (Lemma 2.6, p. 266).
- 2.3: lines 526 (canonical phase measure, p. 270), 541–546 (Poisson formula, p. 270), 552 (Lemma 2.10, p. 270), 570–589 (Proposition 2.11 and proof, pp. 271–272) and 574 (proof).
- 3.2: lines 401–403 (Notation 2.5: Rieffel's left pairing `(f,g)_B(w)=(f,π_wg)` is `⟨π_wg,f⟩` here), 447 (2.8), 460 (2.9), 488–490 (the opposite algebra on the right) and 506 (`(f,g)_A(z)=(π_zg,f)`, which is `⟨f,π_zg⟩` here).
- 3.3: lines 362 (Proposition 2.2, p. 265), 590 (2.12), 603 (2.13) and 620 (2.14, p. 273).
- 4.1: line 634 (the two norms agree, p. 273).
- 4.2: lines 472–477 (gauge invariance of the ideal, p. 268; the cited line 476 is an OCR blank inside that display) and 639 (Theorem 2.15, p. 273).
- 5.1: lines 921–931 (C^∞ vectors and holomorphic closure, p. 280) and 937–950 (Proposition 3.7, whose hypothesis is inverse-closedness of B₀; §5.1 supplies it for S(D,β), p. 281).
- 5.2: lines 766–782 (Proposition 3.3 and its proof, pp. 276–277), 812–817 (the point masses, p. 278) and 832–838 (Theorem 3.4, p. 278).

Each supports the statement as restated here, with the inner-product convention converted. §3.3's "proves this for closed D by another route" is fair: Rieffel lines 348–361 use Green's transitivity, where this roadmap uses its own §3.1 triviality.

austad-enstad20 (arXiv 1904.10826v2):
- Proposition 3.5 (lines 661–679): the induced trace is `⟨ξ,η⟩` on `S_0`, and for a lattice it is the canonical faithful tracial state.
- Proposition 3.7 (lines 693–710): the localisation is `L²(G)`, with a continuous embedding.
- Both assume second countability, which finite-type M satisfies.

§5.3, §6.2 and §6.3 carry no source locator; they are computed below.

**Adversarial table.** Conventions: `e(t)=exp(2πit)`, `π_(m,χ)ξ(t)=χ(t)ξ(t+m)`, `β((m,χ),(n,ψ))=ψ(m)`, `δ_xδ_y=c(x,y)δ_(x+y)`. All rows were computed in this round.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §1.1 π, β = OperatorAlgebraDynamics Π, ω (895d9b85) | x=(m,χ), y=(n,ψ); adjoint | `π_xπ_yξ(t)=χ(t)ψ(t+m)ξ(t+m+n)=ψ(m)π_(x+y)ξ(t)`; `β(x,−x)=conj χ(m)=β(−x,x)=β(x,x)⁻¹` (their identity); `π_x^*ξ(t)=conj χ(t−m)ξ(t−m)=χ(m)·conj χ(t)ξ(t−m)=conj(β(x,−x))π_(−x)ξ(t)` | equal | none |
| §1.1 continuity of β (R01) | `β(x,y)=y.2(x.1)` | `continuous_coe_eval_const g`: continuity of χ↦χ(g), g fixed; needed: (ψ,m)↦ψ(m); Mathlib `continuous_eval` on `A →ₜ* Circle` with `[LocallyCompactSpace A]`: probe compiles | citation wrong, statement true | R01 |
| §1.1 Check, β on ℝ | x=(1,0), y=(0,1/2), (0,1/4) | `e((t+1)/2)=−e(t/2)`, so β=−1; at 1/4, β=i; convention `χ(t)ξ(t−m)` gives −i | equal; control separates | none |
| Lean `schrodingerAdjoint` | k=1, probe | `e(s⬝t)·e(−s⬝(t+m−m))ξ(t+m−m)=ξ(t)`; closes | inverse of a unitary = adjoint | none |
| §1.2 annihilators | `aℤ×bℤ`; ℤ/2 | `e(uja−lbn)=1 ∀j,l ⟺ ua,bn∈ℤ`, so `D^⊥=(1/b)ℤ×(1/a)ℤ`; `F×{1}` self-annihilating | equal | none |
| §1.3 `L^⊥=J⁻¹L^∨` via Tau Ceti | Lean σ; `L=ℤ×2ℤ`; A=2 on ℝ | Lean `σ(d,e)=e(e.2⬝d.1−d.2⬝e.1)=e(⟨d,Je⟩)`, `Je=(e.2,−e.1)`; `comap L^∨ J=J⁻¹L^∨`, factor `|det J|⁻¹=1`; `L^∨=ℤ×½ℤ`, `J⁻¹L^∨=½ℤ×ℤ`, covol ½; `covolume_comap` at A=2, L=ℤ: covol(½ℤ)=½=|2|⁻¹·1 | equal | none |
| §1.3 Checks | `P=[[2,1],[0,1]]`; F=ℤ/2 | `c_L=2`, `c_(L^⊥)=½`; total mass 2, `c_D c_(D^⊥)=2²/(|D||D^⊥|)=1`; mass 1 on F̂ gives 4 | equal | none |
| §2.1 Checks | 𝕋, ℤ, F | `1_[0,½)` coefficients ~1/n; `|n|³/(1+n²)` unbounded; counting both sides gives `|F|·id` | true | none |
| §2.2 Gaussian coefficient | `g=2^(1/4)e^(−πt²)` | `∫√2e^(−2π(t+m/2)²)e^(−πm²/2)e(st)dt=e(−sm/2)e^(−π(m²+s²)/2)`; value 1 at 0; `1_[0,1)`: `(e(s)−1)/(2πis)` | equal | none |
| §2.3 orthogonality conversion | Rieffel 2.10; ℤ/2, all vectors δ₀ | `(f,π_xg)(h,π_xk)^-=⟨π_xg,f⟩⟨h,π_xk⟩`, RHS `⟨h,f⟩⟨g,k⟩` matches; ℤ/2: two points x=(0,χ) of mass ½, total 1 = 1·1 | equal | none |
| §2.3 four-vector identity | M=ℝ, e=(n,u) | left `∫∫∫e(s(t−r−n))e(um)conj η(r+m)ξ(r)ζ(t+m)`, s-integral gives r=t−n; right `∫conj η(r)e(u(r−t+n))ζ(r+n)ξ(t−n)dr`, r=t−n+m; both `∫e(um)conj η(t−n+m)ξ(t−n)ζ(t+m)dm` | equal | none |
| §2.3 sign `F_sF(e)=𝓕F(−Je)` | `F=e^(−π(m²+s²))e(m)`, e=(0,1) | direct `∫e^(−πm²)e(2m)dm=e^(−4π)`; `𝓕F(−u,n)=e^(−4π)`; `𝓕F(Je)=1` | equal; control separates | none |
| §2.3 = native Poisson at v=0 | `L^⊥=J⁻¹L^∨` | `e↦−Je` bijects `L^⊥` onto `−L^∨=L^∨`; phase `e(⟨0,m⟩)=1`; constant `covol(L)⁻¹` both | equal | none |
| `fundamental_identity` paired with g | `L=ℤ×2ℤ` | left `Σ_(ℤ×2ℤ)e^(−π(m²+s²))=θ(1)θ(4)`; right `½Σ_(½ℤ×ℤ)=½θ(¼)θ(1)=θ(4)θ(1)` (`θ(¼)=2θ(4)`); with `schrodinger` in place of the adjoint, terms with n∈ℤ+½, u odd flip by `e(−un)=−1` | equal; control separates | none |
| `fundamental_identity` at k=0 | L={0} | σ≡1 (probe), `L^⊥={0}`, covol 1; both `conj(η)ξζ`; covol 0 would give `0⁻¹=0` | equal | none |
| §3.1 star = OperatorAlgebraDynamics star (1078) | abelian, c(s)=1; ℤ/2 with c(1,1)=−1 | theirs `conj(ω(x,−x))conj f(−x)`; cocycle at (x,−x,x): `c(x,−x)=c(−x,x)`; `δ₁^*=−δ₁`, `δ₁δ₁^*=−c(1,1)δ₀=1` | equal | none |
| §3.1 cochain direction (1031–1033) | `u(m,n)=exp(πiθmn)`, x=(1,0), y=(0,1) | theirs `T_b`: ω^b-algebra → ω-algebra, `f↦fb`; here `c'=c·δu → c`, `δ_x↦u(x)δ_x`; `δu(x,y)=1·1/exp(πiθ)=σ_Θ(x,y)` with c(x,y)=1 | same direction | none |
| §3.1 Check rotation cocycle | `c=e(θnm')` on ℤ² | `δ_(0,1)δ_(1,0)=e(θ)δ_(1,1)`, `δ_(1,0)δ_(0,1)=δ_(1,1)`, so `U₂U₁=e(θ)U₁U₂` as N6 (line 484) | equal | none |
| §3.1 gauge-ideal triviality | closed invariant I∋a≥0, a≠0; C(𝕋) | average `τ(a)1∈I`, τ(a)>0; the ideal at 1∈𝕋 is not rotation-invariant | holds; hypothesis used | none |
| §3.2 right action by π_e^* | x=(1,0), y=(0,¼) | `conj β(x,y)=−i`; π_e instead gives `β(y,x)=1` | equal; control separates | none |
| §3.2 Check B-pairing | M=ℤ/2, D=G, ξ=δ₀ | `π_(m,χ)δ₀=χ(m)δ_m`; `⟨π_dδ₀,δ₀⟩=1` at m=0; `c_D=2/4=½`; `½(1+M_χ₁)` = projection onto δ₀ | equal | none |
| §3.3 Check A-pairing | M=ℤ/2, D=0 | `⟨δ₀,δ₀⟩_A=δ_(0,χ₀)+δ_(0,χ₁)`, acting as `1+M_χ₁`=2·projection; `τ_A=1=‖δ₀‖²`; `c_D=2/1=2`, `c_E=2/4=½` | equal | none |
| §3.3 faithfulness route | b=δ_d | `π_xπ_dπ_x^*=σ(x,d)π_d`; `σ(x,·)=conj σ(·,x)` ranges over all characters of D (1.2); `π(1)=1≠0` | holds | none |
| §4.1 `‖ξ‖₂≤‖ξ‖_A`, faithful trace | ℤ/2, D=0; M=ℤ, D=ℤ×{1} | `√2>1`; `τ_A` a state gives `‖ξ‖₂²≤‖⟨ξ,ξ⟩_A‖`; `Σ_n a(n)` at δ₀−δ₁ gives 0, `a(0)` gives 2 | consistent | none |
| §4.2 Checks | F, D=0 / D=G; M=ℤ | `B=ℂ`, `A≅M_|F|`; `B≅M_|F|`, `A=ℂ`; rotation-invariant ideals of C(𝕋) are only 0, C(𝕋) | true | none |
| §5.1 smooth vectors; inverse | `L=ℤ^n×F₀`; `a=2δ₀+δ₁` | `∂^j` multiplies a(x) by `(2πi t(x))^j`; `Ring.inverse` C^∞ at units; `a⁻¹=Σ(−1)^n2^(−n−1)δ_n`, coefficient of δ_n for n≥1: `2(−1)^n2^(−n−1)+(−1)^(n−1)2^(−n)=0` | equal | none |
| `exists_parsevalFrame` | k=0; n=0; `L=(½)ℤ×ℤ`; `2ℤ×⅓ℤ` | k=0: n=1, g=1; n=0 forces `∫|f|²=0`, false; one window works at covol ½; covol 3/2 forces n≥2 | true; nonvacuous | none |
| `parsevalFrame_trace` | k=0; `L=(½)ℤ×ℤ`; index-two | `Σ|g_j|²=1=covol({0})`; `‖g‖²=∫_0^½Σ_n|g(t+n/2)|²=½`; reciprocal gives 2; `L'⊂L` index 2 doubles both sides | equal | none |
| §5.3 `F₊π_(m,χ)` | x=(m,s₀) on ℝ | left `∫e(s₀t)ξ(t+m)e(st)dt=e(−(s+s₀)m)F₊ξ(s+s₀)`; right `e(−s₀m)e(−ms)F₊ξ(s+s₀)` | equal | none |
| §5.3 rephasing | `u=e(m⬝s)` | `δu=e(−m⬝u'−n⬝s)`, `β'=e(−n⬝s)=conj β(y,x)`, `σ'=σ` | equal | none |
| §6.1 non-product lattice | D=⟨((1,[1]),(0,χ₀)),((0,[0]),(1,χ₁))⟩ | mass `1·1·2·1=2`; generator equations `e(u)(−1)^j=1`, `e(−n)(−1)^i=1`; `D^⊥` has covol `¼·2=½` | equal | none |
| §6.1 Checks | ℤ/3 isotropic; `2ℤ×⅓ℤ` | `|D|=3`, `E=D`, `c_D=1`, dim 1; `E=3ℤ×½ℤ`, `c_E=3/2` | equal | none |
| §6.2 cocycle, covolume | q=2, a=b=c=d=1; a=0 | `(br,[dr])(an,[cn])=e(abnr)e(cdnr/q)`; domain mass `|ab|·q·1`; values 3/2 and 2; `φ(0,q)=((0,[0]),(0,[0]))` | equal | none |
| §6.3 dictionary | `E_θ={(nθ,χ_m)}` | `(ξδ_(1,0))(r)=e(r)ξ(r)=ξU₂`; `(ξδ_(0,1))(r)=ξ(r−θ)=ξU₁⁻¹`; `conj β(φ(0,1),φ(1,0))=e(θ)` gives `U₁⁻¹U₂=e(θ)U₂U₁⁻¹`, i.e. N6's relation; `D_θ` from `e(−vnθ)e(ml)=1`; `TZT^*ξ(r)=e((r+1)/θ)ξ(r)` | equal | none |
| §6.3 single window, 0<θ<1 | support length l<1 | `Σ_m|∫e(−mr)h|²=∫|h|²` for h supported in an interval of length ≤1, so `Σ_(m,n)|⟨π g,f⟩|²=∫Σ_n|g(r−nθ)|²|f|²=‖f‖²`; `‖g‖²=θ=τ(p)` | consistent | none |
| Downstream: H5 (R02) | parent lines 478–479, 705 | parent: "constructed separately from … HeisenbergImprimitivity H6"; here: "compares … with §6.3"; this roadmap has no H6 | contradicts | R02 |

**Policy and shape.**
- Unicode mathematics throughout, with no LaTeX delimiters.
- No process words, pull-request numbers or round labels in the folder.
- Every section keeps its API bullets, at least three Checks per definition, locators at the claims, and Examples and Dependencies per layer.
- Every backticked name of this roadmap's own is declared in `Suggested.lean`.
- The README and Lean generality agree for the three headlines.

## Not verifiable

- Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 24.10 (§1.2): `uncertified` in the manifest (paywalled), cited by its locator only.
- The JFAA version of Austad–Enstad 2020 is behind a Springer paywall. Propositions 3.5 and 3.7 were checked in arXiv 1904.10826v2, the version the manifest records.

## Source issues

- none
