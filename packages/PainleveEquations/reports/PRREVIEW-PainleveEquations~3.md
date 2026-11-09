# Review of PainleveEquations (pull request #1955 at 2995b1c)

**Verdict:** needs changes

This is an incremental re-review of 97 changed lines since b31ece8. Of the previous findings, R01, R02, R04, R05 and R06 are repaired. R03 and R07 are partly repaired. The gate passes. One P2 and two P3 findings remain. The P2 traces back to wording that the previous review itself suggested for R03.

## R01 (P2) — No gap owns the Hilbert–Mumford criterion that §1.3 and §4.3 use for the actual frame group

**Location.** README line 89: "For finite generation, affine reductive quotients and the Hilbert–Mumford criterion, reuse the AlgebraicModuliForArithmeticGeometry interface requested by `gap:reductive-character-git` in CountingBundlesAndHallAlgebrasOfCurves where applicable." The gap sentence itself is on line 87.

**Claim.** §4.3 (line 1049) compares connection stability with GIT stability one-parameter subgroup by one-parameter subgroup. It looks at subgroups with "global weights (−a,a)", asks whether "the existence of a limit of the framed data" holds, and uses "a relatively ample flag linearization". That comparison only gives GIT stability through the Hilbert–Mumford criterion. The criterion has to work for the frame group of §4.2 (line 1023), which is the product of SL₂ with the determinant-one tori and the finite ramified centralizers. It also has to work for a G-linearized relatively ample line bundle on X, which is projective over the affine scheme X₀. §1.3 (line 535) also compares "numerical inequalities with connection stability using the reductive GIT supplier". The new gap on line 87 asks only for the relative invariant Proj and its stable geometric quotient. It does not ask for the numerical criterion.

**Witness.** CountingBundlesAndHallAlgebrasOfCurves README line 103 (#1547 at e22a59e) defines `gap:reductive-character-git`. It covers "character-linearized reductive GIT for products of general linear groups". SL₂ × T is not a product of GLₙ, and the flag factor `O(K(β′_high − β′_low))` is not a character. `gap:hilbert-mumford-linear` (QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups README line 89) only covers linear actions on a vector space. The pins have no Hilbert–Mumford criterion, and no roadmap on main does either: TensorProductCombinatorics line 117 lists it as out of scope.

**Repair.**
- Under `### Supplier reductive-git`, add a second one-sentence gap to the same supplier: `What AlgebraicModuliForArithmeticGeometry must provide (gap:relative-hilbert-mumford): for a reductive group G over ℂ acting on a projective G-equivariant morphism X→X₀ of finite-type ℂ-schemes with X₀ affine and a G-linearized relatively ample line bundle ℒ, a point x of X is ℒ-semistable (respectively ℒ-stable) if and only if μ^ℒ(x,λ) ≥ 0 (respectively > 0) for every one-parameter subgroup λ of G, nontrivial modulo the kernel of the action, for which lim_(t→0) λ(t)·x exists in X.` Here μ^ℒ is minus the weight at the limit point.
- Delete the "reuse … where applicable" sentence. Finite generation of Γ(X₀,𝒪)^G and of ⊕ₙΓ(X,ℒⁿ)^G is already part of constructing the Proj over X₀//G in the line-87 gap.
- Add `[Reductive GIT](#supplier-reductive-git)` to the *Needs* of §§1.3, 4.2, 4.3 and 4.4. Those *Needs* already cite the subsection, so nothing else changes there.
- Tested on §4.3's instance: λ(t) = (diag(t^(−a), t^a), torus part) in SL₂ × T acting on X₀ × (flag ℙ¹'s) with the flag-and-character linearization. That instance satisfies every hypothesis of the proposed sentence. It satisfies neither of the two existing gaps.

Re-raised: none. The previous review's suggested repair for its R03 named `gap:reductive-character-git` for the Hilbert–Mumford criterion, and that suggestion was wrong for this group and this space.

## R02 (P3) — The new §3.6 Checks: two state no computed value, and one repeats §3.7

**Location.** README line 859: "write the local deformation and gauge equations on the quadratic cover w²=z. Verify descent and retain the ramified relation term". Line 860: "use the q and p variations to obtain two independent tangent classes and evaluate the trace pairing on them in the convention dq ∧ dp."

**Claim.** Neither bullet says what the computation returns, or what a wrong complex would return instead. Line 860 is the same test as §3.7's first Check (line 874: "compare the trace form with dq ∧ dp in the normalization of §7.2"). The first bullet (line 858, ±I and 1+2εa) is a real Check.

**Witness.** Here are the values the two bullets leave out.
- Ramified PI pole. The trace-free horizontal endomorphisms of the formal type are 0. The summand that w↦−w swaps carries exp(−2q₁) with q₁ ≠ 0. On the cover, before deck descent, the diagonal gives 1.
- Stable fixed-determinant PVI object. h⁰ = h² = 0 and h¹ = 4·2 − 3 − 3 = 2. If the four residue-eigenvalue constraints are dropped, h¹ = 4·3 − 3 − 3 = 6.

**Repair.** Replace line 859 with: "At the ramified PI pole the trace-free horizontal endomorphisms of the formal type vanish after descent along w↦−w. Computed on the cover without descent they form the one-dimensional diagonal." Replace line 860 with: "For a stable fixed-determinant PVI object h⁰ = h² = 0 and h¹ = 2; a complex without the fixed residue eigenvalues at the four poles gives h¹ = 6." Leave the comparison with dq ∧ dp to §3.7.

## R03 (P3) — §4.4 cites ComplexComparisonPartII §C−1.2 for a properness comparison that §C−1.1 states

**Location.** README line 1078: "Use ComplexComparisonPartII §C−1.2 to analytify the projective quotient morphism … The chartwise projective models give properness over the admitted time and exponent base". The *Needs* on line 1094 cite only "(ComplexComparisonPartII §C−1.2)".

**Witness.** ComplexComparisonPartII (#848 at 3cf1bed), README line 1023, which is in §C-1.1: analytification "carries finite and proper morphisms, respectively, to finite and proper analytic morphisms". §C-1.2 (README lines 1058–1081) builds algebraic-space analytification from étale relations and says nothing about properness.

**Repair.** Write "§§C−1.1–C−1.2" in the sentence and in the *Needs*. §C−1.1 gives the properness of the analytified projective morphism. §C−1.2 gives the algebraic-space quotient step.

## Previous findings

- R01 — repaired: `Suggested.lean:65` now reads `{t₀ s₀ : ℂ} {r : ℝ} (hr : 0 < r) (hlift : Complex.exp s₀ = t₀)`, the same as the PIII statement. The elaborated type confirms the binder.
- R02 — repaired: line 35 reads "ComplexComparisonPartII supplies relative Picard representability and the identity-component criterion". There is a new `### Supplier relative-picard` (line 145). §1.5 line 592 now begins "Apply the supplied fppf relative Picard algebraic space". JacobianChallengePartII no longer appears anywhere.
- R03 — partly repaired: line 87 is now one sentence in the intake's shape. It omits the Hilbert–Mumford criterion, and line 89 hands that criterion to `gap:reductive-character-git` "where applicable", which does not cover it. See R01 above.
- R04 — repaired: `E|_(mᵢaᵢ)/Fᵢ,k` (line 634) and `I_(x₀)` (line 1613). The gate shows `tex=0`.
- R05 — repaired: "FormalConnectionsOpers §F1.1–§F1.3, §F2.1 and §F3.3–§F3.4" (line 113), §F2.4 (line 133) and §F8.1. The depcheck now records the edge (see below). The description's depends-on block lists #853, #848, #857 and #1056.
- R06 — repaired: line 1082 reads "IS12 Theorem 5.1 supplies the inverse comparison in its generic unramified scope. For the remaining admitted profiles and strata, prove properness and surjectivity by the incidence, stability, quotient and density arguments above." §4.6 line 1124 mirrors this, and line 1078 names the coarse-space step.
- R07 — partly repaired. Done: the copied bullets are replaced, the inner Summary label is dropped, the exclusions are moved to line 37, Layers 3–7 now end in `### Examples`, the docstring reads "states its scalar headline theorems", and the text says "Theorem 4.10, Corollary 4.11 and Theorem 4.12". Two of the three new §3.6 Checks carry no value: see R02 above.

## Verified sound

**Gate, order and build.**
- The worker's gate passed at 2995b1c. I reran it with `--order` set to the candidate merge order and `--build`: every scanner is 0, `depcheck=0` and `build=0`, giving OK.
- I also reran it against the configured order. That run printed `depcheck: NOT IN ORDER: PainleveEquations (insert it after its last supplier)`. None of the board's ORDER.txt files lists this roadmap yet, and the brief says this is not a finding.
- `gate --depcheck … --order merge-order-candidate.txt --movable` gives `depcheck: 239 roadmaps, 2331 edges, 0 problem(s)`, with no UPWARD, CYCLE or moved line. The candidate order has FormalConnectionsOpers at 40 and PainleveEquations at 41.
- R05 probe: with those two lines swapped in a scratch order, the same command prints `UPWARD: PainleveEquations (#40) -> FormalConnectionsOpers (#41) at README lines [133, 478, 509]`. With `--movable` it prints `moved: … right after its last supplier FormalConnectionsOpers`. So the edge is now seen.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds README.md, Suggested.lean and metadata.toml.

**Lean.**
- `lake env lean Suggested.lean` gives exactly six `sorry` warnings, at lines 26, 33, 40, 54, 64 and 78.
- I ran `#check @…` on all six statements in a scratch copy. The PV type is now `∀ {α β γ δ} {q} {t₀ s₀} {r}, 0 < r → Complex.exp s₀ = t₀ → δ ≠ 0 ∨ γ ≠ 0 → …`. It agrees with README line 1527 and with line 1530 ("fix a point above the initial time"). The other five types are unchanged from b31ece8. No binder was lost.
- One-tactic probe: I replaced each `sorry` with `simp_all` in a scratch copy. All six statements still have unsolved goals, so none is padding.
- I opened these declarations at the Mathlib pin: `MeromorphicOn` (`Analysis/Meromorphic/Basic.lean:494`, which tests every point of the set with `MeromorphicAt` at line 36; the value of `f` at a point does not matter), `AnalyticOnNhd` (`Analysis/Analytic/Basic.lean:120`) and `Complex.isCoveringMap_exp` (`Analysis/Complex/CoveringMap.lean:46`).
- Headline theorems: the six scalar meromorphic-continuation theorems are stated. The docstring names as not statable §2.4, §1.5, §4.4, §4.6, §5.2 and §§6.1–6.5, each with its missing carrier. Nothing changed here except PV.

**Cross-roadmap citations of the changed passages, resolved at the current heads.**
- ComplexComparisonPartII (#848, head 3cf1bed). README lines below are the `roadmaps show` lines minus 1.
  - §C3.2d.2 (line 2446) has `relative_picard_algebraicSpace`: proper, flat, finitely presented, universal functions after every T→B, quasi-separated and locally of finite presentation.
  - §C3.2d.3 (line 2464) has `relative_picard_separated`: separated when every geometric fibre is integral, matching README line 145.
  - §C3.2f.1 (line 2530) has `picardZeroSheaf`.
  - §C3.2f.2 (line 2548) has `picardZeroCriterion`: B locally Noetherian, smooth geometric identity components of locally constant dimension, and formal smoothness over a nonreduced B. This matches line 145.
  - §C-1.1 (line 967) and §C-1.2 (line 1058): see R03.
- AlgebraicModuliForArithmeticGeometry (#853, head 4f0ad34).
  - §7.3 (line 9296) has `picard_infinitesimal_lifting` at line 9398: obstruction in H²⊗I, framed lifts a torsor under H¹⊗I, automorphisms H⁰⊗I.
  - I found no reductive GIT anywhere in its README (searched for reductive, Hilbert–Mumford, linearized, semistable). So the gap is minimal.
- CrystallineCohomology (#857, head 5231bad): §CR.1.3 (line 1120).
- FormalConnectionsOpers (#1056, head 19335ec): F1.1 (line 415), F1.2 (454), F1.3 (486), F2.1 (568), F2.4 (722), F3.3 (980), F3.4 (1001) and F8.1 (2341).
- On main (39d3d60):
  - JacobianChallenge Layer C (line 143) and Layer D (line 218).
  - SchemeAndStackFoundations §1.1 (2071), §2.6 (3437), §3.4 (4789), §4.6 (5291) and §4.14 (5706). The field-case Picard scheme itself is JacobianChallenge Layer D, which line 141 names first.
- CountingBundlesAndHallAlgebrasOfCurves (#1547, head e22a59e): `gap:reductive-character-git` at line 103 (see R01).
- Overlaps file: no open pull request changes this roadmap and no cited id is dropped. JacobianChallengePartII no longer appears, so no ownership claim remains to check against it.

**Declared gaps.** One (`gap:reductive-connection-git`, line 87). Its shape is the intake's. It is one construction plus one identification, and it is precise. Its supplier is AlgebraicModuliForArithmeticGeometry, which is earlier in the order, and nothing earlier provides the statement. What it leaves out is R01.

**Sampled targets in the changed text.**
- §3.2. HEU10 Theorem 1.1 (HEU10 line 140, printed pp. 517–518) is the universal property of the universal isomonodromic deformation over Teichmüller × jet space ✓.
- §3.2 also cites I23 §5 (I23 SIGMA PDF p. 19: the moduli construction over the parameter scheme of curves, marked points and jets ✓) and I23 §11 (p. 64, Definition 11.1: the generalized isomonodromic vector field over T′ ✓).
- §4.6 and References. IS12 Theorem 6.3 (IS12 line 1849): the five unramified classical types have the geometric and analytic Painlevé property for non-resonant irreducible parameters. Remark 6.3 (line 1796) also exists, because the paper numbers theorems and remarks separately. So "§6, Remark 6.3 and Theorem 6.3" is right.
- The other sampled targets (0.1–0.4, 1.3, 2.2, 3.1, 3.4, 4.1, 4.3, 4.8, 5.6, 6.2, 7.5) are untouched. The previous review checked their locators. I did not read them again.

**Remark on untouched text (no change requested).** Line 624 ("uses the same relative Picard construction as §1.5") now reads as "the supplied space that §1.5 applies". That is still correct.

**Adversarial table.** Rows marked (r3) were computed this round for changed statements. Rows marked (r2) are carried forward from the previous review for untouched statements, with the values it recorded.

| Statement | Instances | Computed values (both sides) | Result | Change |
|---|---|---|---|---|
| (r3) Lean PV with `hlift` | r2 counterexample: q = conj outside the closed ball | exp s₀ = t₀ lies in the ball; exp maps a disc around s₀ into the ball, so q∘exp is analytic near s₀ and the conj branch is never reached | excluded | previous R01 repaired |
| (r3) Lean PV constant solution | q ≡ −1, γ = 0, α = −β, δ = 1 | RHS = 4(−α−β)/t² − γ/t + δ·(−1)·0/(−2) = 0 = q″; hdom holds; f ≡ −1 meromorphic and equal to q∘exp | consistent | — |
| (r3) Lean PV lift choice | s₀ and s₀ + 2πi | each gives its own existential f; agreement of f(s) and f(s+2πi) is not required (monodromy allowed) | consistent with "logarithmic time plane" | — |
| (r3) §3.2 Check 2 | x ↦ 1−x on (0,1,t,∞) | ↦ (1,0,1−t,∞), relabelled (0,1,1−t,∞); θ₀↔θ₁ gives (α,β,γ,δ) ↦ (α,−γ,−β,δ) via β = −θ₀²/2, γ = θ₁²/2 | holds (standard PVI symmetry) | — |
| (r3) §3.2 Check 3 | λ dz/z with z = x−t | d(λ(dx−dt)/(x−t)) = 0; the fixed-t restriction has residue λ at x = t; the space-only λ dx/(x−t) has curvature λ dt∧dx/(x−t)² ≠ 0 | holds, discriminates | — |
| (r3) §3.6 Check 1 | stable rank 2, fixed determinant | Aut = {c : c² = 1} = {±I}; det((1+εa)I) = 1+2εa = 1 ⇒ a = 0 | holds | — |
| (r3) §3.6 Check 2 | PI ramified pole | no value stated; computed trace-free horizontal End: 0 after descent, 1 on the cover | value missing | R02 |
| (r3) §3.6 Check 3 | Jimbo–Miwa PII chart | no value stated; same test as line 874; PVI h¹ = 4·2−3−3 = 2, and 6 without fixed eigenvalues | duplicate | R02 |
| (r3) Gap line 87 | relative GIT, G reductive | Proj ⊕Γ(X,ℒⁿ)^G is projective over Spec Γ(X₀,𝒪)^G; X^s = X^ss ⇒ X^ss//G = X^s/G | true, precise | — |
| (r3) Hilbert–Mumford in §4.3 | G = SL₂ × T × finite, λ = diag(t^(−a),t^a), flag factor O(K(β′h−β′l)) | reductive-character-git: characters of ∏GLₙ on affine schemes; hilbert-mumford-linear: vector spaces | unowned | R01 |
| (r3) §4.4 properness | Proj → X₀//G analytified | proper by §C-1.1 (ComplexComparisonPartII README line 1023); §C-1.2 has no properness clause | locator | R03 |
| (r3) §1.5 Pic⁰ dimension | proper flat curves, universal functions | h⁰(𝒪_(C_b)) = 1, χ locally constant ⇒ h¹ = 1−χ locally constant; smooth genus g gives g | holds | — |
| (r3) §1.5 smoothness test | relative dimension ≤ 1, affine T | R^q p_* = 0 for q ≥ 2 ⇒ H² = 0; supplies the nonreduced-base formal smoothness of §C3.2f.2 | holds | — |
| (r3) §5.1 universal functions | Y ∈ \|−K_S\|, S rational | 0→K_S→𝒪_S→𝒪_Y→0: H⁰(K_S) = H¹(K_S) = 0 ⇒ H⁰(𝒪_Y) = ℂ; H¹(𝒪_Y) ≅ H²(K_S) ≅ ℂ ⇒ dim Pic⁰(Y) = 1 (G_a, G_m or elliptic) | holds; matches Checks 1210–1211 | — |
| (r3) relative-picard separatedness | nonreduced Y | §C3.2d.3 needs integral geometric fibres; §5.1 never uses separatedness of Pic(Y) | consistent | — |
| (r3) IS12 Theorem 6.3 | IS12 line 1849 | 5 unramified types, non-resonant irreducible p | holds as cited | — |
| (r2) Lean PIII/PV/PVI domains | ball with t ≠ 0 (and t ≠ 1) | ball simply connected and misses 0 (and 1), so lifts exist and q∘exp, q∘p are germs | consistent | — |
| (r2) Lean PVI cover | p constant | `IsSimplyConnected` needs Nonempty; nonempty, path-connected covering of a connected base = universal cover | sound | — |
| (r2) Lean PIII quadrature | α = γ = 0 | u = s − log q gives u″ = −βeᵘ − δe²ᵘ, entire | hypothesis unused, harmless | note |
| (r2) 7.2 PVI dictionary | K₁ at random θ, 7 points | (α,β,γ,δ) = ((θ∞−1)²/2, −θ₀²/2, θ₁²/2, (1−θ_t²)/2) | holds | — |
| (r2) 7.4 PVI sigma | IMS18 (2.30), ℏ = 1 | 0 at 4 points; E_v = 2u t²(t−1)² v | holds | — |
| (r2) 7.4 PI, PII sigma | 3 points each | E_I = v²+4u³+2tu−2s = 0; Δ = −S₂ | holds | — |
| (r2) 7.4 D₇, D₈ | VDPS09 (18), (23) | E₇ = 0, E₈ = 0; Δ = −tS₂; dictionaries (4(θ−1),−8,4,0), (8,−8,0,0) | holds | — |
| (r2) 7.2/7.4 PIV, PV, PIII(D₆) | IMS18 (2.21), (2.24), (2.18) | fitted parameters as recorded in r2; Δ formulas hold | holds | — |
| (r2) 7.2 PV elimination | (t,q,p,θ₀,θ₁,θ∞) = (1,2,0,0,1,1) | system q″ = 2; printed VDPS09 (3) gives 7/2; README matches the system | README right | source issue (r2) |
| (r2) 7.2 Flaschka–Newell, PI scaling | c³ = 2; c⁵ = 2 | Q solves PII with α = a − ½; Q″ = 6Q² + T | holds | — |
| (r2) 7.4 PII/PI affine branches | c = 0, σ = t+2; σ ≡ 0 | residual 2 + t/2; q = 0 fails 6q²+t = 0 | holds | source issue (r2) |
| (r2) 1.5/3.7 dimensions | (0,2,4), (0,2,5), (1,1,0), (1,2,1) | 2, 4, 2 (fixed 0), 4 (fixed 2) | holds | — |
| (r2) 1.6 unfolding | r = 2, m = 2, q₁ = 2 | (z−2h²)(z−h²): z² at h = 0 | holds | — |
| (r2) 3.3/3.4 counts | compositions of 4 | budgets 4; ordered 17, unordered 10 | holds | — |
| (r2) 3.8 Checks | d + ½I dz/z; [[0,1],[0,1/z]]dz | monodromy −I; transport [[1,−2πi],[0,1]] | holds | — |
| (r2) 4.3/4.4 index; PV split example; PVI cubic | I13 Theorem 2.2; 2a = zb − z + 1 | 8 − 4 − 2 = 2; lines of degree −1 meeting at z = 0; discriminant not a square | holds | — |
| (r2) 4.7, 5.1, 5.3, 5.5, 6.1, 6.3 Checks | as in r2 | multiplier 1; δ² = 0; length 1 ≠ 2; 2κ₀′+Σκⱼ′ = 1; τ = s; χ = −1 | holds | — |
| (r2) 0.3, 0.5, 0.6, 0.7, 0.8 Checks | as in r2 | y_st = 0 ≠ 1; Δp = ab; dΩ ≠ 0; S₃ monodromy; two branches | holds | — |

## Not verifiable

- **GR84**, **MFK94** (Springer, paywalled) and **JK94** (Wiley, paywalled): not read. They are background or second-route citations, and none is in the changed text.
- **IY08**: no extractable text on this worker (as in r2). §0.3 is untouched.
- The I23 SIGMA PDF's cached extraction is flagged image-only. A direct `pdftotext -layout` in scratch gave readable section headings and statements, which is what I checked §§5 and 11 against.
- I did not open the relative Hilbert–Mumford criterion's literature form for R01's proposed sentence. The sentence is the projective-over-affine form of the numerical criterion. The limit condition is equivalent to the limit existing in X₀, because X→X₀ is proper.

## Source issues

- none
