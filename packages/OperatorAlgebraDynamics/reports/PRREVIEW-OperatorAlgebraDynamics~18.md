# Review of OperatorAlgebraDynamics (pull request #1097 at df4ecb7)

**Verdict:** accepted

This is an incremental re-review of the 57 lines changed since 423006d, all in `TauCetiRoadmap/OperatorAlgebraDynamics/README.md` (48 insertions, 9 deletions, at lines 42–71, 216–219, 270–271, 868–873 and 904–909). `Suggested.lean` is unchanged. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/OperatorAlgebraDynamics'` is empty. Both findings of the previous report are repaired, the repairs introduce no new problem, and the gate passes with the build. No finding.

## Previous findings

- R01 — repaired: lines 42–71 replace the CStarAlgebras supplier bullet by "The pinned Mathlib has the multiplier C*-algebra `𝓜(ℂ, A)` … the rest of the C*-algebra theory used here is not on main. What CStarAlgebras must provide (gap:cstar-ideals-quotients): …", eight gaps; lines 216–219 and 270–271 repoint the two in-text uses (the universal unitary algebra, the CP approximations) to their slugs. The dependency check now reports 0 problems.
- R02 — repaired: lines 868–873 read "Ω lying in `D(Φ(f)²)` because the spectral measure of Ω for `Φ(f)` has characteristic function `t↦exp(−t²‖f‖²/4)` and is therefore the centred Gaussian of variance `‖f‖²/2`, the point mass at 0 when f=0 …, all of whose moments are finite", the second of the two repairs the previous report tested; lines 904–909 add the fourth-moment Check and the heavy-tailed negative control.

## Verified sound

**Scope of the change.** One commit (df4ecb7b), README only. Every changed passage is one of the two repairs above; nothing else moved. No `*Needs:*` line, no `Suggested.lean` declaration and no section numbering changed, and no other README passage cites a CStarAlgebras section id outside the gap bullet (grep for `C1`–`C7` section ids finds only lines 49–71).

**The CStarAlgebras gaps (lines 42–71), resolved at CStarAlgebras #860 head 33ddcef.** Each gap names a section that exists at that head and states what the section states:
- gap:cstar-ideals-quotients → C1.3 (heading line 305): closed two-sided ideals with their C*-structure, the quotient order and quotient C*-norm (lines 322–325).
- gap:cstar-multiplier-extension → C1.7 (line 468): the strict topology by the seminorms `m ↦ ‖ma‖ + ‖am‖` and the unique extension of a nondegenerate star homomorphism `A → M(B)` to a unital strictly continuous `M(A) → M(B)` (lines 470–477).
- gap:cstar-representations → C2.2 (line 568): "cyclic and irreducible representations, intertwiners, unitary equivalence, direct sums, restriction to ideals and nondegenerate extension from ideals" (lines 570–571).
- gap:cstar-tensor-products → C5.1 (line 1112: the maximal norm, the universal property of `A ⊗max B` for commuting pairs, `A ⊗min B` as the completion of the spatial norm consumed from VonNeumannAlgebras V13b) and C5.2 (line 1143: tensor products of completely positive maps and of bounded functionals).
- gap:cstar-inductive-limits and gap:cstar-universal-unitary-algebra → C5.4 (line 1203): C*-inductive limits of directed systems with universal property, and `C*(F_∞)` as the universal unital C*-algebra on countably many unitaries; its line 1214 says that OperatorAlgebraDynamics D1 identifies it with the full free-group algebra, which is what lines 216–219 state.
- gap:cstar-nuclearity → C6.1 (line 1272: nuclear contractions and nuclear algebras, the completely positive approximation property) and C6.2 (line 1297: the equivalence with `A ⊗max B → A ⊗min B` an isomorphism for every C*-algebra B).
- gap:cstar-exactness → C7.1 (line 1455): exactness by tensoring closed-ideal sequences with `A ⊗min −`.

**Minimality of the gaps against the pinned Mathlib (1b1ccf4b).** What the bullet says Mathlib has is there: `DoubleCentralizer` (`Mathlib/Analysis/CStarAlgebra/Multiplier.lean:68`), the instance `CStarAlgebra 𝓜(ℂ, A)` (`:639`), `CStarAlgebra.approximateUnit` (`Mathlib/Analysis/CStarAlgebra/ApproximateUnit.lean:215`), `CompletelyPositiveMap` (`Mathlib/Analysis/CStarAlgebra/CompletelyPositiveMap.lean:51`). What the gaps ask for is not: under `Mathlib/Analysis/CStarAlgebra/` there is no quotient C*-algebra of a closed ideal (the only `quotient` hit is in `GelfandDuality.lean`), no strict topology, no tensor product, no inductive limit, no nuclear or exact algebra, and `GelfandNaimarkSegal.lean` gives `PositiveLinearMap.GNS` and `gnsNonUnitalStarAlgHom` with the cyclic vector still a TODO in its header (lines 29–33), so "cyclic and irreducible representations" is not provided either. The gaps are stated in the form the README already uses for HilbertModules and VonNeumannAlgebras (lines 72–100), which earlier rounds accepted; the board package has no `plan.json` (`board/packages/OperatorAlgebraDynamics/` holds `reports/` and `sources.toml` only), so the slug list cannot be compared there, exactly as for the earlier gaps.

**The Gaussian clause (lines 868–873) and the new Check (lines 904–909).**
- `Measure.ext_of_charFun` is at `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257`, for two finite measures on a complete second-countable inner product space with equal `charFun`; the spectral measure of the unit vector Ω for `Φ(f)` is a probability measure on ℝ, and `charFun μ t = ∫ exp(⟪t,x⟫ I) dμ` is `⟨Ω, e^{itΦ(f)}Ω⟩ = ⟨Ω, W_F(tf)Ω⟩`, so the hypotheses hold.
- `charFun_gaussianReal` (`Mathlib/Probability/Distributions/Gaussian/Real.lean:481`) gives `exp(tμI − v t²/2)`, which at mean 0 and `v = ‖f‖²/2` is `exp(−t²‖f‖²/4)`; `gaussianReal_zero_var` (`:227`) gives the point mass at the mean for `v = 0`, the f=0 case the clause names.
- Membership in `D(Φ(f)²)` is finiteness of the fourth moment of that measure; a Gaussian has every moment finite.
- Values: the variance of `N(0,1/2)` is 1/2 (second difference of `exp(−t²/4)` at 0: −0.4998); its fourth moment is `3·(1/2)² = 3/4`, and the fourth difference of `exp(−t²/4)` at 0 is 0.7492. Heavy tail: with `∫₀^∞ x^k/(1+x⁵) dx = (π/5)/sin((k+1)π/5)`, `c = 0.46774` normalises `c/(1+|λ|⁵)`, the second moment is 0.61803, and the fourth moments truncated at 10² and 10⁴ are 4.31 and 8.62 (growing like `2c·log R`), so the fourth moment diverges, `ξ ∈ D(A)` and `ξ ∉ D(A²)` as the Check says.

**Gate**, rerun by me at df4ecb7 with the build: `gate OperatorAlgebraDynamics: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`, exit 0.

**Dependency check** (verbatim): `depcheck: 239 roadmaps, 2424 edges, 0 problem(s)`, exit 0. No UPWARD or CYCLE line.

**Elaboration.** `lake env lean TauCetiRoadmap/OperatorAlgebraDynamics/Suggested.lean` from the pull-request worktree prints exactly four `declaration uses sorry` warnings (lines 55, 72, 107, 116) and nothing else, in 7.2 s. The file is byte-identical to the one the previous report elaborated; the six elaborated types in `scratch/signatures.md` are the ones compared with the README in the previous rounds (`IsCovariant` without the group topology is intended, covariance being algebraic), and nothing changed.

**Headline theorems and padding.** Unchanged file: the four statable headlines are stated, the module docstring names the rest with their missing carriers, and the one-tactic probe of PRREVIEW-OperatorAlgebraDynamics~10 stands.

**Seeded sample.** The worker's sample came with no targets ("none found by heading"), and the README flags no locator as unverified. The changed lines carry no new source locator: the Gaussian clause cites two Mathlib declarations (read above) and the gap bullet cites CStarAlgebras sections (resolved above).

**Overlaps** (`scratch/overlaps.md`): #1137 conflicts textually in this folder, and the previous reports record that its description has #1097 merge first; #1187 touches `Suggested.lean` only through the pin bump. No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id other roadmaps cite. QuantumFoundations (#1771) is named in the pull request's revision-deps block and is cited only in scope deferrals, unchanged this round.

**Cross-roadmap citations resolved: 10**, all at CStarAlgebras 33ddcef: C1.3 (305), C1.7 (468), C2.2 (568), C5.1 (1112), C5.2 (1143), C5.4 (1203, with its line 1214 naming D1), C6.1 (1272), C6.2 (1297), C7.1 (1455); and `scratch/citations.md` lists no unresolved citation or Lean name.

**Adversarial table.** Rows for the changed statements carry values computed this round; the others cite the previous reports.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| CStarAlgebras gap bullet, lines 42–71 | depcheck at this head; each of the eight slugs against #860 head 33ddcef and Mathlib 1b1ccf4b | 0 problems, 2424 edges; headings at 305/468/568/1112/1143/1203/1272/1297/1455 state each need; Mathlib has `DoubleCentralizer`:68, `CStarAlgebra 𝓜`:639, `approximateUnit`:215, `CompletelyPositiveMap`:51 and no quotient, strict topology, tensor, limit, nuclear, exact or cyclic-vector declaration | gate passes; each gap asks for what the pin lacks | none |
| D1: `C*(F_∞)` identified with the universal unitary algebra (lines 216–219) | the generators `u_n`; a unitary rep of `F_∞` | a unitary representation of `F_∞` is a sequence of unitaries and conversely; C5.4 line 1214 names D1 for this identification | consistent at both heads | none |
| D2: nuclear A and amenable G give a nuclear `A⋊G` (lines 268–271) | G amenable, so full = reduced | the route is the CP approximation of C6.1–C6.2 (gap:cstar-nuclearity), Brown–Ozawa Thm 4.2.6 in its cited form | consistent | none |
| Gaussian spectral measure of Ω for `Φ(f)` (lines 868–873) | ‖f‖=1; f=0 | `charFun (gaussianReal 0 (1/2)) t = exp(−t²/4)`; `gaussianReal 0 0 = dirac 0`; variance 0.4998 (expected 1/2); fourth moment 0.7492 (expected 3/4) | correct; `Ω ∈ D(Φ(f)²)` follows | none |
| Check `⟨Ω,Φ(1)⁴Ω⟩=3/4` and heavy-tailed control (lines 904–909) | `N(0,1/2)`; `|ξ|² = c/(1+|λ|⁵)` | c=0.46774, m₂=0.61803, truncated m₄ 4.31 and 8.62 at 10² and 10⁴; Gaussian m₄=0.75 | both halves correct | none |
| Ownership split, line 12 and lines 876–882 | QuantumFoundations 824bab8 lines 15, 55, 742; #1137 2ccd93b | as PRREVIEW-OperatorAlgebraDynamics~16 | unchanged text, carried | none |
| Bratteli–Robinson Theorem 5.2.8 remark (lines 796–800) | V=ℝ, σ=0; V=ℝ² | as PRREVIEW-OperatorAlgebraDynamics~16 (σ=0: uniqueness and simplicity fail together; `sup|w−z|=1.999998`) | unchanged text, carried | none |
| Product law, translation by `if/√2`, vacuum variance, `(1/i)d/dt W_F(tf)e(g)`, strong continuity, Checks h=0 and h=ℂ (lines 850–903) | h=ℂ, f=1, g=i, k=0.3+0.2i | as PRREVIEW-OperatorAlgebraDynamics~16 (sector error 2.3·10⁻¹⁶, phase `exp(−i)`, `−φ''(0)=0.49999994`) | unchanged text, carried | none |
| ℓ²(V) representation (lines 807–834) | as PRREVIEW-OperatorAlgebraDynamics~14 | that report's values (defect `√(2/N)=0.5` at N=8; `sup|w−z|=1.99999`) | unchanged text, carried | none |
| `exists_integratedOperator`, `IsKMS`, `kms_invariant`, `kms_entire_identity`, `continuous_action`, `IsCovariant` | as PRREVIEW-OperatorAlgebraDynamics~8 and ~5 | those reports' values (`δ₁`: `T ξ=π(f 1)ξ`; `U n=2ⁿ` gives `‖T‖=2>1`; Gibbs sign on `M₂(ℂ)`; rotation counterexample at β=0) | unchanged file, carried | none |
| D8 CAR targets and Checks, Bogoliubov relations, D5 Checks | as PRREVIEW-OperatorAlgebraDynamics~5 | that report's values (`E₁₂` family, `‖f_N−f_M‖²≤4^(−M)/3`, `√2` separation) | unchanged text, carried | none |

## Not verifiable

- Bratteli–Robinson 2, Theorem 5.2.8 and §5.2.1 (lines 796–804, 862), and Renault, LNM 793: settled as `uncertified` in the manifest, cited by locator alone, unchanged this round.

## Source issues

- none
